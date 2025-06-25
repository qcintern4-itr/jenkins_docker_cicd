*** Settings ***
Documentation   Biocare app Health Data Chart suite
Metadata    sid     BIOC-SUMMARY
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-SUMMARY    mapp
Test Timeout    1h

*** Test Cases ***
BIOC-SUMMARY-01: View Summary screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is on Summary screen
    ...
    ...     Test Steps:
    ...     1. Press on Summary tab
    ...
    ...     Expected Output:
    ...     1. Navigate to Summary screen, it includes 3 sections:
    ...        - Vitals:
    ...          + Heart rate
    ...          + Heart rate variability
    ...          + Resting heart rate
    ...          + Blood pressure
    ...          + Blood oxygen
    ...          + Temperature
    ...          + Weight
    ...        - Activities:
    ...          + Active minutes
    ...          + Walking
    ...          + Running
    ...          + Steps
    ...          + Sleep
    ...        - Medication section
    ...        - Quality of life section
    ...        - Symptoms section
    [Tags]      BIOC-SUMMARY-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-HEARTRATE-01: View Heart rate card in Summary tab
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Summary tab
    ...
    ...     Test Steps:
    ...     1. Press on Heart rate card
    ...     2. Press on Day tab and selects another day
    ...     3. Press on Hour tab
    ...
    ...     Expected Output:
    ...     1. Navigate to Heart rate screen
    ...        - Heart rate data per 5 different timeframes: hour, day, week, month and year
    ...        - The tab will display the most recent Hour of the latest day having data
    ...          + Each data point in the graph includes max, min, and average HR values of a 1 minute
    ...          + Pressing on the data point will show time/avg HR
    ...            Format: h:mm AM/PM | bpm
    ...          + The user can slide on the chart to navigate to the next/previous hour
    ...            * The user can not slide to the future
    ...            * The user can not slide to the day before the oldest hour having data.
    ...          + There shall be a card displaying the timeframe of the chart below:
    ...            * Format: [mmm] [dd], [h:mm] AM/PM - [h:mm] AM/PM
    ...                      Example: Jun 5, 4:00 PM - 5:00 PM
    ...            * If the day is today: Today, [h:mm] AM/PM - [h:mm] AM/PM
    ...                      Example: Today, 4:00 PM - 5:00 PM
    ...      3. The Hour tab will automatically switch to the hour from 12:00 to 13:00 of the selected day in the Day tab.
    [Tags]      BIOC-SUMMARY-HEARTRATE-01       BIOC-SRS-21-FRS-01-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-HEARTRATE-02: View heart rate data in Day tab
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Summary tab
    ...
    ...     Test Steps:
    ...     1. Press on Heart rate card
     ...    2. Press on Day tab
    ...
    ...     Expected Output:
    ...     2. Day: the heart rate data within the 24 hours
    ...        - The tab will display the current day
    ...        - The chart will display a line chart connecting data points together within a day
    ...        - Each data point in the graph includes max, min, and average HR values of a 30-minute timeframe
    ...        - Pressing on the data point will show Time | avgHR | HR/max | HR/min
    ...        - In case some data points have been lost and the distance between the two points is not more than 2 hours, the app will connect the two points around the missing segment by a line
    ...        - The user can zoom out on this chart to navigate to the corresponding week in the Week tab
    ...        - The user can zoom in on this chart to navigate to a specific hour of that day on the Hour tab (the chosen data point)
    ...            * If there is no point being chosen, the chart will automatically move to the hour from 12:00 to 13:00 of the selected day in the Day tab
    ...          + The user can slide on the chart to navigate to the next/previous day
    ...            * The user can not slide to the future
    ...            * The user can not slide to the day before the oldest day having data
    ...          + There shall be a card displaying the timeframe of the chart below:
    ...            * Display [3 characters of date], [3 characters of the month] [day]. Example: Mon, Jun 5
    ...            * If the day is the current day, display: Today, [3 charactersr of the month] [day]. Example: Today, Jun 5
    [Tags]      BIOC-SUMMARY-HEARTRATE-02       BIOC-SRS-21-FRS-01-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-HEARTRATE-03: View heart rate data in Week tab
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Heart rate screen
    ...
    ...     Test Steps:
    ...     1. Press on Week tab
    ...
    ...     Expected Output:
    ...     1. Week: the heart rate data within the week, Mon-Sun
    ...        - The chart will display a line chart connecting data points within a week. By default, the tab will display the current week
    ...          + Each data point in the graph includes max, min, and average HR values of a 6-hour timeframe
    ...          + Pressing on the data point will show time/avg HR/max HR/min HR
    ...          + In case some data points have been lost, and the distance between the two points is not more than 1 day the app will connect the two points around the missing segment by a line.
    ...          + The user can zoom in on this chart to navigate to a specific day in the Day tab
    ...          + The user can zoom out on this chart to navigate to the corresponding Month in Month tab
    ...          + The user can slide on the chart to navigate to the next/previous week.
    ...             * The user can not slide to the future
    ...             * The user can not slide to the week before the oldest week having data.
    ...          + There shall be a card displaying the timeframe of the chart below:
    ...             * Display the start date and the end date of that week: [month (3 characters)] [day] – [month (3 characters)] [day]. Example: May 30 - Jun 5
    [Tags]      BIOC-SUMMARY-HEARTRATE-03       BIOC-SRS-05-FRS-02-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-HEARTRATE-04: View heart rate data in Month tab
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Heart rate screen
    ...
    ...     Test Steps:
    ...     1. Press on Month tab
    ...
    ...     Expected Output:
    ...     1. Month: the heart rate data within the month
    ...        - When the “Month” tab is selected, the chart will display a line chart connecting data points within a month
    ...        - The tab will display the current month
    ...          + Pressing on the data point will show Time/avg HR/max HR/min HR
    ...          + In case some data points have been lost, if the distance between the two points is not more than 1 day the app will connect the two points around the missing segment by a dashed line.
    ...          + The user can zoom in on this chart to navigate to a specific Week in the Week tab
    ...          + The user can zoom out on this chart to navigate to the corresponding Year in Year tab
    ...          + The user can slide on the chart to navigate to the next/previous month
    ...             * The user can not slide to the future
    ...             * The user can not slide to the month before the oldest month having data
    ...          + There shall be a card displaying the timeframe of the chart below:
    ...             * Display [month (3 characters)] [year]. Example: Feb 2024
    [Tags]      BIOC-SUMMARY-HEARTRATE-04       BIOC-SRS-05-FRS-02-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-HEARTRATE-05: View heart rate data in Year tab
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Heart rate screen
    ...
    ...     Test Steps:
    ...     1. Press on Year tab
    ...     2. Press on Back button
    ...
    ...     Expected Output:
    ...     1. Year: the heart rate data within the year
    ...        - When the “Year” tab is selected, the chart will display a line chart connecting data points within a year. The tab will display the current year.
    ...          + Pressing on the data point will display a card containing: time/avg HR/max HR/min HR
    ...          + The user can zoom in on this chart to navigate to a specific Month in the Month tab
    ...          + The user can slide on the chart to navigate to the next/previous year
    ...             * The user can not slide to the future
    ...             * The user can not slide to the year before the oldest year having data
    ...          + There shall be a card displaying the timeframe of the chart below:
    ...             * Display [year], for example: 2024
    ...     2. Navigate back to the previous screen
    [Tags]      BIOC-SUMMARY-HEARTRATE-05       BIOC-SRS-05-FRS-02-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-HEARTRATE-06: View heart rate while paired device
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Heart rate screen
    ...     - Paired Bioheart Device
    ...
    ...     Test Steps:
    ...     1. View the Heart rate screen
    ...     2. Press on View heart rhythm button
    ...
    ...     Expected Output:
    ...     1. View heart rhythm button shall be displayed
    ...     2. Navigate user to the View heart rhythm screen
    [Tags]      BIOC-SUMMARY-HEARTRATE-06       BIOC-SRS-05-FRS-02-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-HEARTRATE-07: View About heart rate in Hour/ Day/ Week/ Month/ Year tab
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Summary screen
    ...
    ...     Test Steps:
    ...     1. Press on Heart rate card and swipe down on the phone screen
    ...     2. Press on any Article
    ...
    ...     Expected Output:
    ...     1. About heart rate section:
    ...        - What is a healthy resting heart rate for my age?
    ...        - What is a good heart rate for my age?
    ...        - What is the ideal heart rate during normal daily activity?
    ...     2. The article screen is opened
    ...        - Title: Article
    ...        - Content: follow design
    ...        - There shall be Close button to close this screen
    [Tags]      BIOC-SUMMARY-HEARTRATE-07       BIOC-SRS-05-FRS-02-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-HEARTRATE-08: Add data manually in Hour/ Day/ Week/ Month/ Year tab
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Heart rate screen
    ...
    ...     Test Steps:
    ...     1. Press on ... button
    ...     2. Press on Add data manually
    ...     3. Select time
    ...     4. Select heart rate value
    ...     5. Press on save or cancel button
    ...
    ...     Expected Output:
    ...     - If users press on save button, heart rate value is saved and heart rate screen is closed
    ...     - If users press on cancel button, heart rate screen is closed
    [Tags]      BIOC-SUMMARY-HEARTRATE-08       BIOC-SRS-05-FRS-02-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-HEARTRATE-09: Connect to Biokit device to add Blood oxygen data
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Heart rate screen
    ...
    ...     Test Steps:
    ...     1. Press on ... button
    ...     2. Press on Connect to Biokit device
    ...     3. Wait for getting data
    ...     4. Press on Save button
    ...
    ...     Expected Output:
    ...     - After press on Save button, data is displayed in chart
    [Tags]      BIOC-SUMMARY-HEARTRATE-09       manual      1.14.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-HEARTRATE-VIEWHR-01: View heart rhythm screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Heart rate screen (Home and Summary tab)
    ...     - Paired Bioheart device
    ...
    ...     Test Steps:
    ...     1. Press on View heart rhythm button
    ...     2. Press on Back button
    ...
    ...     Expected Output:
    ...     1. Navigate to View heart rhythm screen
    ...        - Time picker includes 2 sections
    ...          + Date section, format: [Mmm] [dd]
    ...          + Hour section, format: [hh] [AM/PM] – [hh] [AM/PM]
    ...        - Heart rate point graph
    ...          + Time frame: 1 hour - Format: hh:mm (12 hours from 1 to 12)
    ...          + Each data point will cover heart rate data in 1 minute
    ...          + User can tap on any point to select it
    ...          + The tooltip will display the time of the selected point
    ...          + If there is NO heart rate data the point will not display
    ...          + The chart shall prioritize the bioheart data if there are many source data
    ...        - Time note: it represents the time of the selected data point
    ...          + Format: [Mmm][dd],[yyyy] – [hh]:[mm][AM/PM]
    ...        - Average heart rate: this will display the average heart rate data of the selected data point
    ...        - Create snapshot button, tapping this button will start the create snapshot flow with the selected data point
    ...        - ECG graph
    ...          + ECG data of the selected data point were already backed up on the cloud, ECG data shall be displayed on the ECG chart
    ...          + ECG data of the selected data point is not backed up on the cloud (within 30 days):
    ...            * Message: The heart rhythm is not ready for viewing. Please wait for data synchronization.
    ...            * Go to data sync button. The user shall be navigated to the “Bioheart data backup” screen when pressing the hyperlink.
    ...          + If the selected data point does not contain any ECG data:
    ...            * Message: The heart rhythm is not available
    ...          + If the user is on the free plan and the selected date is over 30 days from the present the screen:
    ...            * Message: You can only view heart rhythm of the last 30 days
    ...            * Biosphere+ button
    ...     2. Navigate back previous screen
    [Tags]      BIOC-SUMMARY-HEARTRATE-VIEWHR-01       BIOC-SRS-17-FRS-11-001      manual       1.14.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-HEARTRATE-VIEWHR-02: Select the time-frame
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in View heart rhythm screen
    ...
    ...     Test Steps:
    ...     1. Pressing the calender button
    ...     2. Selected one day
    ...     3. Press on hour section
    ...     4. Press on Seclect button
    ...
    ...     Expected Output:
    ...     - On the timeline tab, there shall be 2 separate parts: date and hour
    ...       + By default the screen will display the latest date having data
    ...       + By default the screen will display the first minute of the latest date that has heart data
    ...     1. Calendar bottom sheet: select a specific date that the user wants to view
    ...        - The calendar will auto-select the currently selected date
    ...        - The date which has heart rhythm data shall have a yellow dot below
    ...        - The user cannot select a date that is either before the date the user registers for an account or in the future
    ...        - Select button: the bottom sheet shall close and apply the selected date
    ...        - Cancel button: the app shall close the bottom sheet calendar
    ...          * When the user selects the other date, the hour to be displayed on the chart shall be the first data point
    ...     2. After tapping the Select button
    ...        - The hour section will display the first hour that has data on the selected date
    ...        - The app shall auto-select the first data point of the selected hour
    ...        - The ECG graph shall reload and display the selected data point
    ...     3. Pop-out modal to select time
    ...        - The user can scroll on the modal to select the timeframe
    ...        - Select button: the bottom sheet shall be closed and apply the selected hour
   ...         - Cancel button: the bottom sheet shall be closed
    ...     4. The screen shall display the heart rate data within the chosen timeframe
    ...        - By default, the app shall display the first hour on the latest date which has Heart Rate data and select the first data point
    ...        - The first heart rate data point of the selected hour will be selected
    ...     - There shall be 2 arrow buttons for the user to move to the next or the previous hour (the time cannot be in the future)
    ...       + The user can only move in the 1-day range
    ...       + Every time the user taps the arrow button the screen will reload and the first data point shall be selected
    [Tags]      BIOC-SUMMARY-HEARTRATE-VIEWHR-02       BIOC-SRS-17-FRS-11-002      manual       1.14.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-HEARTRATE-VIEWHR-03: Create snapshot with notes
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on View heart rhythm screen
    ...
    ...     Test Steps:
    ...     1. Press on Create snapshot button
    ...     2. Select duration
    ...     3. Press on Create button
    ...     4. Add notes for snapshot
    ...
    ...     Expected Output:
    ...     - The snapshot is created with notes and display in All and Recent snapshot lists
    [Tags]     BIOC-SUMMARY-HEARTRATE-VIEWHR-03        BIOC-SRS-17-12-003       manual      1.14.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-HEARTRATE-VIEWHR-04: Create snapshot without notes
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on View heart rhythm screen
    ...
    ...     Test Steps:
    ...     1. Press on Create snapshot button
    ...     2. Select duration
    ...     3. Press on Create button
    ...     4. Skip the step add notes
    ...
    ...     Expected Output:
    ...     - The snapshot is created without notes and display in All and Recent snapshot lists
    [Tags]     BIOC-SUMMARY-HEARTRATE-VIEWHR-04        BIOC-SRS-17-FRS-12-003       manual      1.14.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-HEARTRATE-VIEWHR-05: Cancel to create snapshot
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on View heart rhythm screen
    ...
    ...     Test Steps:
    ...     1. Press on Create snapshot button
    ...     2. Press on Cancel button
    ...
    ...     Expected Output:
    ...     - The snapshot is canceled
    [Tags]     BIOC-SUMMARY-HEARTRATE-VIEWHR-05        BIOC-SRS-17-FRS-12-003       manual      1.14.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-HRV-01: View heart rate variability data in Day tab
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Summary screen
    ...
    ...     Test Steps:
    ...     1. Press on HRV card
    ...
    ...     Expected Output:
    ...     2. Navigate to Heart rate variability screen
    ...        - The user shall be able to view different charts by Day/ Week/ Month/ Year
    ...        - Day (Default): the heart rate variability data within the 24 hours
    ...        - When the “Day” tab is selected the chart will display a line chart connecting data points together within a day
    ...          + Each data point in the graph includes average HRV values of a 30-minute timeframe.
    ...          + Pressing on the data point will show time/HRV data at that point
    ...          + The user can slide on the chart to navigate to the next/previous day
    ...             * The user can not slide to the future
    ...             * The user can not slide to the day before the oldest day having data
    ...          + The user can not slide to the day before the oldest day having data.
    ...        - There shall be navigational arrows that the user can use to navigate between days/weeks/months/years on the charts.
    ...        - There shall be card display avg/max/min HRV
    ...          + The value will be calculated based on the chart display
    ...          + Any time the user change move to another timeframe, the value will change also
    [Tags]      BIOC-SUMMARY-HRV-01       BIOC-SRS-21-FRS-02-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-HRV-02: View heart rate variability data in Week tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in HRV screen
    ...
    ...     Test Steps:
    ...     1. Press on Week tab
    ...
    ...     Expected Output:
    ...     1. Week: the heart rate variability data within the week, Mon-Sun
    ...        - When the “Week” tab is selected, the chart will display a line chart connecting data points within a week
    ...          + Each data point in the graph includes average HRV values of a 6-hour timeframe
    ...          + Pressing on the data point will show time/avgHRV data at that point
    ...          + The user can slide on the chart to navigate to the next/previous day
    ...            * The user can not slide to the future
    ...            * The user can not slide to the week before the oldest day having data
    ...          + The user can zoom in on this chart to navigate to a specific day in the Day tab
    ...          + The user can zoom out on this chart to navigate to the corresponding Month in Month tab
    [Tags]      BIOC-SUMMARY-HRV-02       BIOC-SRS-21-FRS-02-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-HRV-03: View heart rate variability data in Month tab
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in HRV screen
    ...
    ...     Test Steps:
    ...     1. Press on Month tab
    ...
    ...     Expected Output:
    ...     1. Month: the heart rate variability data within the month
    ...        - When the “Month” tab is selected, the chart will display a line chart connecting data points within a month. By default, the tab will display the current month.
    ...          + Each data point in the graph includes average HRV values of a day
    ...          + Pressing on the data point will show time/HRV data at that point.
    ...          + The user can slide on the chart to navigate to the next/previous day
    ...             * The user can not slide to the future
    ...             * The user can not slide to the month before the oldest day having data.
    ...          + The user can zoom in on this chart to navigate to a specific Week in the Week tab
    ...          + The user can zoom out on this chart to navigate to the corresponding Year in Year tab
    [Tags]      BIOC-SUMMARY-HRV-03       BIOC-SRS-21-FRS-02-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-HRV-04: View heart rate variability data in Year tab
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in HRV screen
    ...
    ...     Test Steps:
    ...     1. Press on Year tab
    ...     2. Press on Back button
    ...
    ...     Expected Output:
    ...     1. Year: the heart rate variability data within the year
    ...        - Default, the tab will display the current year
    ...          + Each data point in the graph includes average HRV values of a month
    ...          + Pressing on the data point will show time/HRV data at that point
    ...          + The user can slide on the chart to navigate to the next/previous day
    ...             * The user can not slide to the future
    ...             * The user can not slide to the year before the oldest day having data.
    ...          + The user can zoom in on this chart to navigate to a specific Month in the Month tab
    ...        - There shall be navigational arrows that the user can use to navigate between days/weeks/months/years on the charts.
    ...     2. User can navigate back previous screen
    [Tags]      BIOC-SUMMARY-HRV-04       BIOC-SRS-21-FRS-02-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-HRV-05: View About heart rate in Day/ Week/ Month/ Year tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Heart rate variability card
    ...     - Press on About Heart rate cards
    ...
    ...     Expected Output:
    ...     - The article screen is opened
    ...         + Title: Article
    ...         + Content: follow design
    ...         + There shall be Close button to close this screen
    [Tags]      BIOC-SUMMARY-HRV-05       BIOC-SRS-05-FRS-02-003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-HRV-06: Add data manually in Day/ Week/ Month/ Year tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Heart rate variability card
    ...     - Press on ... button
    ...     - Press on Add data manually
    ...     - Select time
    ...     - Select heart rate variability value
    ...     - Press on save or cancel button
    ...
    ...     Expected Output:
    ...     - If users press on save button, heart rate variability value is saved and heart rate variability screen is closed
    ...     - If users press on cancel button, heart rate variability screen is closed
    [Tags]      BIOC-SUMMARY-HRV-06       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-RHR-01: View resting heart rate data in Day tab
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Summary screen
    ...
    ...     Test Steps:
    ...     1. Press on Resting HR card
    ...
    ...     Expected Output:
    ...     - Navigate to Resting HR screen
    ...     - The user shall be able to view different charts by day, by Week, by Month and by Year
    ...     - Day: the resting heart rate data within the 24 hours
    ...     - When the “Day” tab is selected the chart will display a line chart connecting data points together within a day
    ...       (Default: the tab will display the current day)
    ...        + Each data point in the graph includes average RHR values of a 30-minute timeframe.
    ...        + In case some data points have been lost and the distance between the two points is not more than 2 hours, the app will connect the two points around the missing segment by a dashed line
    ...        + Pressing on the data point will show time/RHR data at that point
    ...        + The user can slide on the chart to navigate to the next/previous day
    ...           * The user can not slide to the future
    ...           * The user can not slide to the day before the oldest day having data
    ...        + The user can zoom out on this chart to navigate to the corresponding week in the Week tab
    ...     - There shall be navigational arrows that the user can use to navigate between day/week/month/year on the charts.
    ...     - There shall be card display avg/max/min HRV
    ...        + The value will be calculated based on the chart display
    ...        + Any time the user change move to another timeframe, the value will change also
    [Tags]      BIOC-SUMMARY-RHR-01       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-RHR-02: View resting heart rate data in Week tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Resting heart rate card
    ...     - Press on Week tab
    ...
    ...     Expected Output:
    ...     - Week - the resting heart rate data within the week, Mon-Sun
    ...     - When the “Week” tab is selected, the chart will display a line chart connecting data points within a week. By default, the tab will display the current week
    ...         + Each data point in the graph includes average RHR values of a 6-hour timeframe
    ...         + In case some data points have been lost and the distance between the two points is not more than 1 day, the app will connect the two points around the missing segment by a dashed line.
    ...         + Pressing on the data point will show time/RHR data at that point
    ...         + The user can slide on the chart to navigate to the next/previous day
    ...             * The user can not slide to the future
    ...             * The user can not slide to the week before the oldest day having data.
    ...     - The user can zoom in on this chart to navigate to a specific day in the Day tab
    ...     - The user can zoom out on this chart to navigate to the corresponding Month in Month tab
    ...     - There shall be navigational arrows that the user can use to navigate between days/weeks/months/years on the charts.
    ...     - There shall be card display avg/max/min HRV
    ...         + The value will be calculated based on the chart display
    ...         + Any time the user change move to another timeframe, the value will change also
    [Tags]      BIOC-SUMMARY-RHR-02       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-RHR-03: View resting heart rate data in Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Resting heart rate card
    ...     - Press on Month tab
    ...
    ...     Expected Output:
    ...     - Month - the resting heart rate data within the month
    ...     - When the “Month” tab is selected, the chart will display a line chart connecting data points within a month. By default, the tab will display the current month
    ...         + Each data point in the graph includes average RHR values of a day
    ...         + Pressing on the data point will show time/RHR data at that point.
    ...         + In case some data points have been lost and the distance between the two points is not more than 1 day, the app will connect the two points around the missing segment by a dashed line.
    ...         + The user can slide on the chart to navigate to the next/previous day
    ...             * The user can not slide to the future
    ...             * The user can not slide to the month before the oldest day having data.
    ...     - The user can zoom in on this chart to navigate to a specific Week in the Week tab
    ...     - The user can zoom out on this chart to navigate to the corresponding Year in Year tab
    ...     - There shall be navigational arrows that the user can use to navigate between days/weeks/months/years on the charts.
    ...     - There shall be card display avg/max/min HRV
    ...         + The value will be calculated based on the chart display
    ...         + Any time the user change move to another timeframe, the value will change also
    [Tags]      BIOC-SUMMARY-RHR-03       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-RHR-04: View resting heart rate data in Year tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Resting heart rate card
    ...     - Press on Year tab
    ...
    ...     Expected Output:
    ...     - Year - the resting heart rate data within the year
    ...     - When the “Year” tab is selected, the chart will display a line chart connecting data points within a year. By default, the tab will display the current year
    ...         + Each data point in the graph includes average RHR values of a month
    ...         + Pressing on the data point will show time/RHR data at that point
    ...         + In case some data points have been lost and the distance between the two points is not more than 1 month, the app will connect the two points around the missing segment by a dashed line
    ...         + The user can slide on the chart to navigate to the next/previous day
    ...             * The user can not slide to the future
    ...             * The user can not slide to the year before the oldest day having data.
    ...     - The user can zoom in on this chart to navigate to a specific Month in the Month tab
    ...     - There shall be navigational arrows that the user can use to navigate between days/weeks/months/years on the charts.
    ...     - There shall be card display avg/max/min HRV
    ...         + The value will be calculated based on the chart display
    ...         + Any time the user change move to another timeframe, the value will change also
    ...     - User can navigate back previous screen by pressing on back icon button
    [Tags]      BIOC-SUMMARY-RHR-04       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-RHR-05: View About heart rate in Day/ Week/ Month/ Year tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Resting heart rate card
    ...     - Press on About Heart rate cards
    ...
    ...     Expected Output:
    ...     - The article screen is opened
    ...         + Title: Article
    ...         + Content: follow design
    ...         + There shall be Close button to close this screen
    [Tags]      BIOC-SUMMARY-RHR-05       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-RHR-06: Add data manually in Day/ Week/ Month/ Year tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Resting heart rate card
    ...     - Press on ... button
    ...     - Press on Add data manually
    ...     - Select time
    ...     - Select resting heart rate value
    ...     - Press on save or cancel button
    ...
    ...     Expected Output:
    ...     - If users press on save button, resting heart rate value is saved and resting heart rate screen is closed
    ...     - If users press on cancel button, resting heart rate screen is closed
    [Tags]      BIOC-SUMMARY-RHR-06       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-BLOODOXYGEN-01: View Blood oxygen data in Day tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Blood oxygen card
    ...
    ...     Expected Output:
    ...     - Navigate to Blood Oxygen screen
    ...     - The user will be able to view their Blood oxygen data per 3 different timeframes.
    ...     - Within the selected timeframe tab, the user shall be able to view different charts by day, by weeks, and by months
    ...     - Day - the Blood oxygen data within the 24 hours
    ...     - When the “Day” tab is selected, the chart will be replaced by a circle displaying the latest Blood oxygen
    ...     - The circle shall change color in case:
    ...         + Blood oxygen from 60 to 80 change to red
    ...         + Blood oxygen from 80 to 85 change to orange
    ...         + Blood oxygen from 85 to 91 change to light orange
    ...         + Blood oxygen from 91 to 94 change to yellow
    ...         + Blood oxygen from 94 to 100 change to green
    ...     - There shall be a card displaying the status of the latest Blood oxygen value:
    ...         + 60% to 79%, display “Your blood oxygen level is Extremely low”
    ...         + 80% to 84%, display “Your blood oxygen level is Very low”
    ...         + 85% to 90%, display “Your blood oxygen level is Low”
    ...         + 91% to 94%, display “Your blood oxygen level is Slightly low”
    ...         + 95% to 100%, no message to display
    ...     - There shall be a Measurements part
    ...         + This section will display the value and recorded time of measurements.
    ...         + Sort by latest to oldest.
    ...         + Max display 4 latest cards
    ...     - There shall be navigational arrows that the user can use to navigate between days/weeks/months on the charts
    ...     - When the user taps on a data point in the chart, the chart shall display information about the data point.
    ...         + For Day, Week, Month, and Year, it shall display the avg Blood oxygen at the selected timeframe
    [Tags]      BIOC-SUMMARY-BLOODOXYGEN-01       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-BLOODOXYGEN-02: View Blood oxygen data in Week tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...    - Press on Blood oxygen card
    ...    - Press on Week tab
    ...
    ...     Expected Output:
    ...     - Week - the Blood oxygen data within the week, Mon-Sun
    ...     - When the “Week” tab is selected, the chart will display a column chart displaying data points within a week. By default, the tab will display the current week
    ...         + Each data point in the graph includes average Blood oxygen values of a 1-day timeframe
    ...         + If the value of the column is below 90, the column will change to yellow
    ...         + Pressing on a data column will show the time/Blood oxygen
    ...         + The user can slide on the chart to navigate to the next/previous week
    ...             * The user can not slide to the future
    ...             * The user can not slide to the week before the oldest week having data
    ...         + There shall be a temperature scale illustration have 5 colors range
    ...             + Red: 60 to 80
    ...             + Orange: 80 to 85
    ...             + Light orange: 85 to 91
    ...             + Yellow: 91 to 94
    ...             + Green: 95 to 100
    ...     - There shall be navigational arrows that the user can use to navigate between days/weeks/months on the charts
    ...     - When the user taps on a data point in the chart, the chart shall display information about the data point.
    ...         + For Day, Week, Month, and Year, it shall display the avg Blood oxygen at the selected timeframe
    [Tags]      BIOC-SUMMARY-BLOODOXYGEN-02       BIBIOC-1.21.0    manual  R1l
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-BLOODOXYGEN-03: View Blood oxygen data in Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Blood oxygen card
    ...     - Press on Month tab
    ...
    ...     Expected Output:
    ...     - Month - the Blood oxygen data within the month
    ...     - When the “Month” tab is selected, the chart will display a column chart displaying data points within a month. By default, the tab will display the current month.
    ...         + Each data point in the graph includes average Blood oxygen values of a 1-day timeframe
    ...         + If the value of the column is below 90, the column will change to yellow
    ...         + Pressing on a data column will show the time/Blood oxygen
    ...         + The user can slide on the chart to navigate to the next/previous month
    ...             * The user can not slide to the future
    ...             * The user can not slide to the month before the oldest month having data
    ...         + The user can zoom in on this chart to navigate to a specific Week in the Week tab.
    ...         + There shall be a temperature scale illustration have 2 color range
    ...             * Blue: 90 to 100
    ...             * Yellow: 80 to 89
    ...     - There shall be navigational arrows that the user can use to navigate between days/weeks/months on the charts
    ...     - When the user taps on a data point in the chart, the chart shall display information about the data point.
    ...         + For Day, Week, Month, and Year it shall display the avg Blood oxygen at the selected timeframe
    ...     - User can navigate back previous screen by pressing on back icon button
    [Tags]      BIOC-SUMMARY-BLOODOXYGEN-03       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-BLOODOXYGEN-04: View About Blood oxygen levels in Day/ Week/ Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Blood oxygen card
    ...     - Press on About Blood oxygen levels cards
    ...
    ...     Expected Output:
    ...     - The article screen is opened
    ...         + Title: Article
    ...         + Content: follow design
    ...         + There shall be Close button to close this screen
    [Tags]      BIOC-SUMMARY-BLOODOXYGEN-04       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-BLOODOXYGEN-05: Add data manually in Day/ Week/ Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Blood oxygen card
    ...     - Press on ... button
    ...     - Press on Add data manually
    ...     - Select time
    ...     - Select Blood oxygen value
    ...     - Press on save or cancel button
    ...
    ...     Expected Output:
    ...     - If users press on save button, Blood oxygen value is saved and Blood oxygen screen is closed
    ...     - If users press on cancel button, Blood oxygen screen is closed
    [Tags]      BIOC-SUMMARY-BLOODOXYGEN-05       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-BLOODOXYGEN-06: Connect to Biokit device to add Blood oxygen data
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Blood oxygen card
    ...     - Press on ... button
    ...     - Press on Connect to Biokit device
    ...     - Wait for getting data
    ...     - Press on Save button
    ...
    ...     Expected Output:
    ...     - After press on Save button, data is displayed in chart
    [Tags]      BIOC-SUMMARY-BLOODOXYGEN-06       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-BLOODPRESSURE-01: View Blood pressure data in Day tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Blood pressure card
    ...
    ...     Expected Output:
    ...     - Navigate to Blood pressure screen
    ...     - The user will be able to view their Blood pressure data per 3 different timeframes.
    ...     - Within the selected timeframe tab, the user shall be able to view different charts by day, by weeks, and by months
    ...     - Day - the blood pressure data within the 24 hours
    ...     - There are 2 cards displaying the value of systolic/diastolic of the last record.
    ...     - There shall be a Measurements part
    ...         + This section will display the value and recorded time of measurements.
    ...         + Sort by latest to oldest.
    ...         + Max display 4 latest cards.
    ...     - There is a message:
    ...         + Systolic < 90 mmHg or Diastolic < 60 mmHg, display: “Your blood pressure is low”
    ...         + 90 <= Systolic < 120 mmHg and 60 <= Diastolic < 80 , display: “Your blood pressure is normal”
    ...         + 120 <= Systolic <130 mmHg and 60 <= Diastolic < 80, display: “Your blood pressure is Slighly high”
    ...         + 130 <= Systolic <140 mmHg and 80 <= Diastolic < 90, display: “Your blood pressure is High”
    ...         + Systolic < 140 mmHg or Diastolic >= 90, display: “Your blood pressure is Very high”
    ...     - There shall be navigational arrows that the user can use to navigate between days/weeks/months on the charts
    ...     - There shall be 2 cards “Systolic” and “Diastolic” to display the average value of the timeframe selected
    [Tags]      BIOC-SUMMARY-BLOODPRESSURE-01       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-BLOODPRESSURE-02: View Blood pressure data in Week tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Blood pressure card
    ...     - Press on Week tab
    ...
    ...     Expected Output:
    ...     - Week - the blood pressure data within the week, Mon-Sun
    ...     - When the “Week” tab is selected, the chart will display a line chart showing systolic and diastolic (blood pressure) data within a week. By default, the tab will display the current week
    ...         + Each data point in the graph includes average blood pressure values of a day timeframe
    ...         + Pressing on a data point will show the time/systolic/diastolic.
    ...         + The user can slide on the chart to navigate to the next/previous week.
    ...             * The user can not slide to the future
    ...             * The user can not slide to the week before the oldest week having data
    ...         + The user can zoom in on this chart to navigate to a specific day in the Day tab
    ...         + The user can zoom out on this chart to navigate to the corresponding Month in Month tab.
    ...    - There shall be navigational arrows that the user can use to navigate between days/weeks/months on the charts
    ...    - There shall be 2 cards “Systolic” and “Diastolic” to display the average value of the timeframe selected
    [Tags]      BIOC-SUMMARY-BLOODPRESSURE-02       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-BLOODPRESSURE-03: View Blood pressure data in Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Blood pressure card
    ...     - Press on Month tab
    ...
    ...     Expected Output:
    ...     - Month - the blood pressure data within the month
    ...     - When the “Month” tab is selected, the chart will display a chart showing systolic and diastolic (blood pressure) data within a month. By default, the tab will display the current month
    ...         + Each data point in the graph includes average blood pressure values of a day.
    ...         + Pressing on a data point will show the time/systolic/diastolic.
    ...         + The user can slide on the chart to navigate to the next/previous month.
    ...             * The user can not slide to the future
    ...             * The user can not slide to the month before the oldest month having data
    ...         + The user can zoom in on this chart to navigate to a specific Week in the Week tab.
    ...    - There shall be navigational arrows that the user can use to navigate between days/weeks/months on the charts
    ...    - There shall be 2 cards “Systolic” and “Diastolic” to display the average value of the timeframe selected
    ...    - User can navigate back previous screen by pressing on back icon button
    [Tags]      BIOC-SUMMARY-BLOODPRESSURE-03       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-BLOODPRESSURE-04: View About Blood pressure in Day/ Week/ Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Blood pressure card
    ...     - Press on About Blood pressure cards
    ...
    ...     Expected Output:
    ...     - The article screen is opened
    ...         + Title: Article
    ...         + Content: follow design
    ...         + There shall be Close button to close this screen
    [Tags]      BIOC-SUMMARY-BLOODPRESSURE-04       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-BLOODPRESSURE-05: Add data manually in Day/ Week/ Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Blood pressure card
    ...     - Press on ... button
    ...     - Press on Add data manually
    ...     - Select time
    ...     - Select Blood pressure value
    ...     - Press on save or cancel button
    ...
    ...     Expected Output:
    ...     - If users press on save button, Blood pressure value is saved and Blood pressure screen is closed
    ...     - If users press on cancel button, Blood pressure screen is closed
    [Tags]      BIOC-SUMMARY-BLOODPRESSURE-05       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-BLOODPRESSURE-06: Connect to Biokit device to add Blood oxygen data
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Blood oxygen card
    ...     - Press on ... button
    ...     - Press on Connect to Biokit device
    ...     - Wait for getting data
    ...     - Press on Save button
    ...
    ...     Expected Output:
    ...     - After press on Save button, data is displayed in chart
    [Tags]      BIOC-SUMMARY-BLOODPRESSURE-06       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-STEPS-01: View Steps data in Day tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Steps card
    ...
    ...     Expected Output:
    ...     - Navigate to Steps screen
    ...     - The user will be able to view their Steps data per 3 different timeframes.
    ...     - Within the selected timeframe tab, the user shall be able to view different charts by day, by weeks, and by months
    ...     - Day - the Steps data within the 24 hours
    ...     - When the “Day” tab is selected the chart will display a column chart showing data within a day. By default, the tab will display the current day
    ...         + Each data column in the graph includes total Steps values of 30 minutes timeframe.
    ...         + Pressing on a data column will show the time/total steps.
    ...         + The user can slide on the chart to navigate to the next/previous day
    ...             * The user can not slide to the future
    ...             * The user can not slide to the day before the oldest day having data
    ...         + The user can zoom out on this chart to navigate to the corresponding week in the Week tab.
    ...         + There shall be a line displaying the user goal, the line only appears at the column where the user completes the goal.
    ...         + The column’s default color is blue. If the user achieves the goal, the column that surpasses the line shall change color to green
    ...     - There shall be navigational arrows that the user can use to navigate between days/weeks/months on the charts.
    ...     - There shall be a card display:
    ...         + Total steps of the chart displaying.
    ...         + The steps goal
    ...         + Level of goal achievement of the chart displaying.
    [Tags]      BIOC-SUMMARY-STEPS-01       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-STEPS-02: View Steps data in Week tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Steps card
    ...     - Press on Week tab
    ...
    ...     Expected Output:
    ...     - Week - the Steps data within the week, Mon-Sun
    ...     - When the “Week” tab is selected, the chart will display a column chart showing data within a week. By default, the tab will display the current week
    ...         + Each data column in the graph includes average Steps values for a one-day timeframe.
    ...         + Pressing on a data column will show the time/total steps.
    ...         + The user can slide on the chart to navigate to the next/previous week
    ...             * The user can not slide to the future
    ...             * The user can not slide to the week before the oldest week having data.
    ...         + The user can zoom in on this chart to navigate to a specific day in the Day tab.
    ...         + The user can zoom out on this chart to navigate to the corresponding Month in Month tab.
    ...         + There shall be a line displaying the user goal.
    ...             * This line will change if the user change goal in the set goal screen.
    ...         + The column’s default color is blue. Columns that achieve the goal (the value of the column surpasses the line), shall change color to green.
    ...             * If the date of the column is not the current day then the user sets a new goal, the column will not change color regardless of the goal.
    ...             * If the user adds manual, this value will follow the current goal, regardless of the time
    ...     - There shall be navigational arrows that the user can use to navigate between days/weeks/months on the charts.
    ...     - There shall be a card display:
    ...         + Total steps of the chart displaying.
    ...         + The steps goal
    ...         + Level of goal achievement of the chart displaying.
    [Tags]      BIOC-SUMMARY-STEPS-02       BIOC-1.21.0    manual  R1l
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-STEPS-03: View Steps data in Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Steps card
    ...     - Press on Month tab
    ...
    ...     Expected Output:
    ...     - Month - the Steps data within the month
    ...     - When the “Month” tab is selected, the chart will display a column chart showing data within a week. By default, the tab will display the current week
    ...         + Each data column in the graph includes average Steps values for a one-day timeframe.
    ...         + Pressing on a data column will show the time/total steps
    ...         + The user can slide on the chart to navigate to the next/previous month
    ...             * The user can not slide to the future
    ...             * The user can not slide to the month before the oldest month having data
    ...         + The user can zoom in on this chart to navigate to a specific day in the Day tab.
    ...         + The user can zoom out on this chart to navigate to the corresponding Month in Month tab
    ...         + There shall be a line displaying the user goal
    ...             * This line will change if the user change goal in the set goal screen
    ...         + The column’s default color is blue. Columns that achieve the goal (the value of the column surpasses the line), shall change color to green
    ...             * If the date of the column is not the current day then the user sets a new goal, the column will not change color regardless of the goal.
    ...             * If the user adds manual, this value will follow the current goal, regardless of the time.
    ...     - There shall be navigational arrows that the user can use to navigate between days/weeks/months on the charts.
    ...     - There shall be a card display:
    ...         + Total steps of the chart displaying.
    ...         + The steps goal
    ...         + Level of goal achievement of the chart displaying
    ...     - User can navigate back previous screen by pressing on back icon button
    [Tags]      BIOC-SUMMARY-STEPS-03       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-STEPS-04: View About Steps in Day/ Week/ Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Steps card
    ...     - Press on About Steps cards
    ...
    ...     Expected Output:
    ...     - The article screen is opened
    ...         + Title: Article
    ...         + Content: follow design
    ...         + There shall be Close button to close this screen
    [Tags]      BIOC-SUMMARY-STEPS-04       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-STEPS-05: Add data manually in Day/ Week/ Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Steps card
    ...     - Press on ... button
    ...     - Press on Add data manually
    ...     - Select time
    ...     - Select Steps value
    ...     - Press on save or cancel button
    ...
    ...     Expected Output:
    ...     - If users press on save button, Steps value is saved and Steps screen is closed
    ...     - If users press on cancel button, Steps screen is closed
    [Tags]      BIOC-SUMMARY-STEPS-05       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-STEPS-06: Set steps goal in Day/ Week/ Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Steps card
    ...     - Press on ... button
    ...     - Press on Set your goal
    ...     - Select time
    ...     - Select steps value
    ...     - Press on save or cancel button
    ...
    ...     Expected Output:
    ...     - New set goal is save and close steps goal screen or cancel to set new goal and close steps goal screen
    [Tags]      BIOC-SUMMARY-STEPS-06       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-SLEEP-01: View Sleep data in Week tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Sleep card
    ...
    ...     Expected Output:
    ...     - Navigate to Sleep screen
    ...     - The user will be able to view their Sleep data per 2 different timeframes.
    ...     - Within the selected timeframe tab, the user shall be able to view different charts by weeks, and by months
    ...     - Week - the Sleep data within the week, Mon-Sun
    ...     - When the “Week” tab is selected, the chart will display a column chart showing data within a week. By default, the tab will display the current week
    ...         + The user can slide the chart to move to the next or the previous week
    ...             * The user can not slide to the future
    ...             * The user can not slide to the week before the oldest week having data
    ...         + There shall be a card with 2 arrow buttons for the user to move to the next or the previous week.
    ...         + Each data column in the graph includes the value of the Sleep duration of a day.
    ...         + The user can zoom out on this chart to navigate to the corresponding Month in Month tab
    ...     - There shall be a card displaying the average sleep duration of that week.
    ...     - There shall be a circle displaying the number of days that the user achieves the goal.
    ...     - When the user taps on a data point in the chart, the chart shall display information about the data point
    ...         + For Week, Month, and 6 Months, it shall display the total Sleep at the selected timeframe
    [Tags]      BIOC-SUMMARY-SLEEP-01       BIOC-1.21.0    manual  R1l
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-SLEEP-02: View Sleep data in Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Sleep card
    ...     - Press on Month tab
    ...
    ...     Expected Output:
    ...     - Month - the Sleep data within the month
    ...     - When the “Month” tab is selected, the chart will display a column chart showing data within a month. By default, the tab will display the current month.
    ...         + The user can slide the chart to move to the next or the previous month
    ...         + There shall be a card with 2 arrow buttons for the user to move to the next or the previous month.
    ...         + Each data column in the graph includes the value of the Sleep duration of a day.
    ...         + The user can zoom in on this chart to navigate to the corresponding Week in the Week tab.
    ...     - There shall be a card displaying the average sleep duration of that month.
    ...     - There shall be a circle displaying the number of days that the user achieves the goal
    ...     - When the user taps on a data point in the chart, the chart shall display information about the data point
    ...         + For Week, Month, and 6 Months, it shall display the total Sleep at the selected timeframe
    ...     - User can navigate back previous screen by pressing on back icon button
    [Tags]      BIOC-SUMMARY-SLEEP-02       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-SLEEP-03: View About Sleep in Week/ Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Sleep card
    ...     - Press on About Sleep cards
    ...
    ...     Expected Output:
    ...     - The article screen is opened
    ...         + Title: Article
    ...         + Content: follow design
    ...         + There shall be Close button to close this screen
    [Tags]      BIOC-SUMMARY-SLEEP-03      BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-SLEEP-04: Add data manually in Week/ Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Sleep card
    ...     - Press on ... button
    ...     - Press on Add data manually
    ...     - Select time
    ...     - Select Sleep value
    ...     - Press on save or cancel button
    ...
    ...     Expected Output:
    ...     - If users press on save button, Sleep value is saved and Sleep screen is closed
    ...     - If users press on cancel button, Sleep screen is closed
    [Tags]      BIOC-SUMMARY-SLEEP-04       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-SLEEP-05: Set sleep goal in Week/ Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Sleep card
    ...     - Press on ... button
    ...     - Press on Set your goal
    ...     - Select time
    ...     - Select sleep value
    ...     - Press on save or cancel button
    ...
    ...     Expected Output:
    ...     - New set goal is save and close sleep goal screen or cancel to set new goal and close sleep goal screen
    [Tags]      BIOC-SUMMARY-SLEEP-05       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-SLEEP-06: Verify the time of Sleep when add the Sleep
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Sleep card
    ...     - Press on ... button
    ...     - Press on Set your goal
    ...     - Select time
    ...
    ...     Expected Output:
    ...     - The card automatically displays the time that is rounded down to the nearest 15-minute interval from the current time.
    [Tags]      BIOC-SUMMARY-SLEEP-06       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-WALKING-01: View Walking data in Day tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Walking card
    ...
    ...     Expected Output:
    ...     - Navigate to Walking screen
    ...     - The user will be able to view their Walking data per 3 different timeframes.
    ...     - Within the selected timeframe tab, the user shall be able to view different charts by days, by weeks, and by months
    ...     - Day - the Walking data within the 24 hours
    ...     - There shall be 3 cards displaying total data of that day:
    ...         + Duration (mins)
    ...         + Distance (km)
    ...         + Calories (cals)
    ...         *If any value is missing, display “_”*
    ...     - There shall be navigational arrows that the user can use to navigate between days/weeks/months on the charts.
    ...         + The total value shall be displayed according to the time frame of the chart
    [Tags]      BIOC-SUMMARY-WALKING-01       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-WALKING-02: View Walking data in Week tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Walking card
    ...     - Press on Week tab
    ...
    ...     Expected Output:
    ...     - Week - the Walking data within the week, Mon-Sun
    ...     - When the “Week” tab is selected, the chart will display a column chart showing data within a week. By default, the tab will display the current week.
    ...         + Each data column in the graph includes average Walking data of a day timeframe.
    ...         + Pressing on a data column will show the time/ total duration/total distance.
    ...         + The user can slide on the chart to navigate to the next/previous week
    ...             * The user can not slide to the future
    ...             * The user can not slide to the week before the oldest week having data
    ...         + The user can zoom out on this chart to navigate to the corresponding week in the Week tab
    ...    - There shall be 3 cards below the chart displaying data of that week:
    ...         + Total Duration (mins)
    ...         + Total Distance (km)
    ...         + Average Calories (cals)
    ...    - There shall be a “Daily Walking” section, which will display all the values of every day in the chosen week.
    ...         + If there is any data missing, display “_”.
    ...    - There shall be navigational arrows that the user can use to navigate between days/weeks/months on the charts.
    ...         + The total value shall be displayed according to the time frame of the chart
    [Tags]      BIOC-SUMMARY-WALKING-02       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-WALKING-03: View Walking data in Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Walking card
    ...     - Press on Month tab
    ...
    ...     Expected Output:
    ...     - Month - the Walking data within the month
    ...     - When the “Month” tab is selected, the chart will display a column chart showing data within a month. By default, the tab will display the current month.
    ...         + Each data column in the graph includes the average Walking data a day timeframe.
    ...         + Pressing on a data column will show the time/total duration/total distance.
    ...         + The user can slide on the chart to navigate to the next/previous week
    ...             * The user can not slide to the future
    ...             * The user can not slide to the month before the oldest month having data
    ...         + The user can zoom out on this chart to navigate to the corresponding week in the Week tab
    ...     - There shall be 4 cards below the chart displaying data of that week:
    ...         + Total Duration (mins)
    ...         + Total Distance (km)
    ...         + Average Calories (cals)
    ...     - There shall be navigational arrows that the user can use to navigate between days/weeks/months on the charts.
    ...         + The total value shall be displayed according to the time frame of the chart
    ...     - User can navigate back previous screen by pressing on back icon button
    [Tags]      BIOC-SUMMARY-WALKING-03       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-WALKING-04: View About Walking in Day/ Week/ Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Walking card
    ...     - Press on About Walking cards
    ...
    ...     Expected Output:
    ...     - The article screen is opened
    ...         + Title: Article
    ...         + Content: follow design
    ...         + There shall be Close button to close this screen
    [Tags]      BIOC-SUMMARY-WALKING-04       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-WALKING-05: Add data manually in Day/ Week/ Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Walking card
    ...     - Press on ... button
    ...     - Press on Add data manually
    ...     - Select time
    ...     - Select Walking value
    ...     - Press on save or cancel button
    ...
    ...     Expected Output:
    ...     - If users press on save button, Walking value is saved and Walking screen is closed
    ...     - If users press on cancel button, Walking screen is closed
    [Tags]      BIOC-SUMMARY-WALKING-05       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BIOC-SUMMARY-WALKING-06: Verify the time of walking when add the walking
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Walking card
    ...     - Press on ... button
    ...     - Press on Add data manually
    ...     - Select time
    ...
    ...     Expected Output:
    ...     - The card automatically displays the time that is rounded down to the nearest 15-minute interval from the current time.
    [Tags]      BIOC-SUMMARY-WALKING-06       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-RUNNING-01: View Running data in Day tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Running card
    ...
    ...     Expected Output:
    ...     - Navigate to Running screen
    ...     - The user will be able to view their Running data per 3 different timeframes.
    ...     - Within the selected timeframe tab, the user shall be able to view different charts by days, by weeks, and by months
    ...     - Day - the Running data within the 24 hours
    ...     - There shall be 3 cards displaying total data of that day:
    ...         + Duration (mins)
    ...         + Distance (km)
    ...         + Calories (cals)
    ...          *If any value is missing, display “_”*
    ...     - There shall be navigational arrows that the user can use to navigate between days/weeks/months on the charts.
    ...         + The total value shall be displayed according to the time frame of the chart
    [Tags]      BIOC-SUMMARY-RUNNING-01       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-RUNNING-02: View Running data in Week tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Running card
    ...     - Press on Week tab
    ...
    ...     Expected Output:
    ...     - Week - the Running data within the week, Mon-Sun
    ...     - When the “Week” tab is selected, the chart will display a column chart showing data within a week. By default, the tab will display the current week.
    ...         + Each data column in the graph includes average Running data of a day timeframe.
    ...         + Pressing on a data column will show the time/ total duration/total distance.
    ...         + The user can slide on the chart to navigate to the next/previous week
    ...             * The user can not slide to the future
    ...             * The user can not slide to the week before the oldest week having data
    ...         + The user can zoom out on this chart to navigate to the corresponding week in the Week tab
    ...     - There shall be 3 cards below the chart displaying data of that week:
    ...         + Total Duration (mins)
    ...         + Total Distance (km)
    ...         + Average Calories (cals)
    ...     - There shall be a “Daily Running” section, which will display all the values of every day in the chosen week.
    ...         + If there is any data missing, display “_”.
    ...     - There shall be navigational arrows that the user can use to navigate between days/weeks/months on the charts.
    ...         + The total value shall be displayed according to the time frame of the chart
    [Tags]      BIOC-SUMMARY-RUNNING-02       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-RUNNING-03: View Running data in Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Running card
    ...     - Press on Month tab
    ...
    ...     Expected Output:
    ...     - Month - the Running data within the month
    ...     - When the “Month” tab is selected, the chart will display a column chart showing data within a month. By default, the tab will display the current month.
    ...         + Each data column in the graph includes the average Running data a day timeframe.
    ...         + Pressing on a data column will show the time/total duration/total distance.
    ...         + The user can slide on the chart to navigate to the next/previous week
    ...             * The user can not slide to the future
    ...             * The user can not slide to the month before the oldest month having data
    ...         + The user can zoom out on this chart to navigate to the corresponding week in the Week tab
    ...     - There shall be 4 cards below the chart displaying data of that week:
    ...         + Total Duration (mins)
    ...         + Total Distance (km)
    ...         + Average Calories (cals)
    ...     - There shall be navigational arrows that the user can use to navigate between days/weeks/months on the charts.
    ...         + The total value shall be displayed according to the time frame of the chart
    ...     - User can navigate back previous screen by pressing on back icon button
    [Tags]      BIOC-SUMMARY-RUNNING-03       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-RUNNING-04: View About Running in Day/ Week/ Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Running card
    ...     - Press on About Running cards
    ...
    ...     Expected Output:
    ...     - The article screen is opened
    ...         + Title: Article
    ...         + Content: follow design
    ...         + There shall be Close button to close this screen
    [Tags]      BIOC-SUMMARY-RUNNING-04       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-RUNNING-05: Add data manually in Day/ Week/ Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Running card
    ...     - Press on ... button
    ...     - Press on Add data manually
    ...     - Select time
    ...     - Select Running value
    ...     - Press on save or cancel button
    ...
    ...     Expected Output:
    ...     - If users press on save button, Running value is saved and Running screen is closed
    ...     - If users press on cancel button, Running screen is closed
    [Tags]      BIOC-SUMMARY-RUNNING-05       BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-RUNNING-06: Add data manually in Day/ Week/ Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Running card
    ...     - Press on ... button
    ...     - Press on Add data manually
    ...     - Select time
    ...
    ...     Expected Output:
    ...     - The card automatically displays the current time that is rounded down to the nearest 15-minute interval from the current time.
    [Tags]      BIOC-SUMMARY-RUNNING-06       BIOC-SRS-05-FRS-03-004      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-BODYTEMPERATURE-01: View Body temperature data in Day tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Body temperature card
    ...
    ...     Expected Output:
    ...     - Navigate to Body temperature screen
    ...     - The user will be able to view their Body temperature data per 3 different timeframes.
    ...     - Within the selected timeframe tab, the user shall be able to view different charts by days, by weeks, and by months
    ...     - Day - the Body temperature data within the 24 hours
    ...     - When the “Day” tab is selected, the chart will be replaced by a circle displaying the latest temperature
    ...     - The circle shall change color in case:
    ...         + <35oC (<95oF), display blue.
    ...         + 35oC-37.5oC (95oF-99.5oF), display green.
    ...         + 37.6oC-41.5oC (99.6oF-106.7oF), display orange.
    ...         + >41.5oC (>106.7oF), display red
    ...     - There shall be a temperature scale illustration have 3 color range below the circle
    ...         + <35oC (<95oF), display blue.
    ...         + 35oC-37.5oC (95oF-99.5oF), display green.
    ...         + 37.6oC-41.5oC (99.6oF-106.7oF), display orange.
    ...         + >41.5oC (>106.7oF), display red
    ...     - There shall be an arrow on the temperature scale illustration point at the following temperature on the circle
    ...     - There shall be navigational arrows that the user can use to navigate between days/weeks/months/years on the charts.
    ...         + The avg value shall be displayed according to the time frame of the chart.
    ...     - The user shall be able to swipe left/right to scroll on the charts
    [Tags]      BIOC-SUMMARY-BODYTEMPERATURE-01       BIOC-SRS-05-FRS-04-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-BODYTEMPERATURE-02: View Body temperature data in Week tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...    - Press on Body temperature card
    ...    - Press on Week tab
    ...
    ...     Expected Output:
    ...    - Week - the Body temperature data within the week, Mon-Sun
    ...    - When the “Week” tab is selected, the chart will display a column chart showing data within a week. By default, the tab will display the current week
    ...         + Each data column in the graph includes average Temperature values of a-day timeframe.
    ...         + Pressing on a data point will show the time/temperature.
    ...         + The user can slide on the chart to navigate to the next/previous week
    ...             * The user can not slide to the future.
    ...             * The user can not slide to the week before the oldest week having data
    ...         + The column shall change color in case:
    ...             * <35oC (<95oF), display blue.
    ...             * 35oC-37.5oC (95oF-99.5oF), display green.
    ...             * 37.6oC-41.5oC (99.6oF-106.7oF), display orange.
    ...             * >41.5oC (>106.7oF), display red
    ...    - There shall be navigational arrows that the user can use to navigate between days/weeks/months/years on the charts.
    ...         + The avg value shall be displayed according to the time frame of the chart.
    ...    - The user shall be able to swipe left/right to scroll on the charts
    [Tags]      BIOC-SUMMARY-BODYTEMPERATURE-02       BIOC-SRS-05-FRS-04-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-BODYTEMPERATURE-03: View Body temperature data in Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Body temperature card
    ...     - Press on Month tab
    ...
    ...     Expected Output:
    ...     - Month - the Body temperature data within the month
    ...     - When the “Month” tab is selected, the chart will display a column chart showing data points within a month. By default, the tab will display the current month
    ...         + Each data column in the graph includes average Temperature values of a-day timeframe.
    ...         + Pressing on a data point will show the time/temperature.
    ...         + The user can slide on the chart to navigate to the next/previous week
    ...             * The user can not slide to the future
    ...             * The user can not slide to the month before the oldest month having data
    ...         + The column shall change color in case:
    ...             * <35oC (<95oF), display blue.
    ...             * 35oC-37.5oC (95oF-99.5oF), display green.
    ...             * 37.6oC-41.5oC (99.6oF-106.7oF), display yellow.
    ...             * >41.5oC (>106.7oF), display red
    ...     - There shall be navigational arrows that the user can use to navigate between days/weeks/months/years on the charts.
    ...         + The avg value shall be displayed according to the time frame of the chart.
    ...     - The user shall be able to swipe left/right to scroll on the charts
    ...     - User can navigate back previous screen by pressing on back icon button
    [Tags]      BIOC-SUMMARY-BODYTEMPERATURE-03       BIOC-SRS-05-FRS-04-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-BODYTEMPERATURE-04: View About Body temperature in Day/ Week/ Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Running card
    ...     - Press on About Body temperature cards
    ...
    ...     Expected Output:
    ...     - The article screen is opened
    ...         + Title: Article
    ...         + Content: follow design
    ...         + There shall be Close button to close this screen
    [Tags]      BIOC-SUMMARY-BODYTEMPERATURE-04       BIOC-SRS-05-FRS-04-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-BODYTEMPERATURE-05: Add data manually in Day/ Week/ Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Body temperature card
    ...     - Press on ... button
    ...     - Press on Add data manually
    ...     - Select time
    ...     - Select Body temperature value
    ...     - Press on save or cancel button
    ...
    ...     Expected Output:
    ...     - If users press on save button, Body temperature value is saved and Body temperature screen is closed
    ...     - If users press on cancel button, Body temperature screen is closed
    [Tags]      BIOC-SUMMARY-BODYTEMPERATURE-05       BIOC-SRS-05-FRS-04-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-BODYTEMPERATURE-06: Connect to Biokit device to add Blood oxygen data
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Blood oxygen card
    ...     - Press on ... button
    ...     - Press on Connect to Biokit device
    ...     - Wait for getting data
    ...     - Press on Save button
    ...
    ...     Expected Output:
    ...     - After press on Save button, data is displayed in chart
    [Tags]      BIOC-SUMMARY-BODYTEMPERATURE-06       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-WEIGHT-01: View Weight data in Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Weight card
    ...
    ...     Expected Output:
    ...     - Navigate to Weight screen
    ...     - The user will be able to view their Weight data per 3 different timeframes.
    ...     - Within the selected timeframe tab, the user shall be able to view different charts by months, by 6-months, and by years
    ...     - Month - the Weight data within the month
    ...     - There shall be a card displaying the fluctuation of weight:
    ...         + If the latest weight on the chart is higher than the data first day of the month, display “You gain [absolute value between the first and the last data recorded] kg – This month”.
    ...         + If the latest weight on the chart is lower than the data first day of the month, display “You lose [absolute value between the first and the last data recorded] kg – This month”.
    ...         + If there is no data or less than 2 data recorded or the absolute value between the first and the last data recorded is smaller than 0.1, do not display any message
    ...     - When the “Month” tab is selected, the chart will display 2 line charts connecting data points within a month. By default, the tab will display the current month
    ...         + Each data point in the graph includes the last Weight value recorded in a day.
    ...         + The chart auto-scales base on the value of weight
    ...         + Pressing on a data point will show the time/weight/BMI.
    ...         + The user can slide on the chart to navigate to the next/previous month
    ...             * The user can not slide to the future
    ...             * The user can not slide to the month before the oldest month having data
    ...         + The user can zoom out on this chart to navigate to the corresponding 6 months in the 6 Months tab
    ...     - There shall be navigational arrows that the user can use to navigate between months/6 months/years on the charts
    [Tags]      BIOC-SUMMARY-WEIGHT-01       BIOC-SRS-05-FRS-04-003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-WEIGHT-02: View Weight data in 6-month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Weight card
    ...    - Press on 6-month tab
    ...
    ...     Expected Output:
    ...     - 6 months - the Weight data within the 6 months
    ...     - There shall be a card displaying the fluctuation of weight:
    ...         + If the latest weight on the chart is higher than the data first month of the 6 months, display “You gain [absolute value between the first and the last data recorded] kg – This 6 months”.
    ...         + If the latest weight on the chart is lower than the data first month of the 6 months, display “You lose [absolute value between the first and the last data recorded] kg – This 6 months”.
    ...         + If there is no data or less than 2 data recorded or the absolute value between the first and the last data recorded is smaller than 0.1, do not display any message
    ...     - When the “6 months” tab is selected, the chart will display 2 line charts connecting data points within a haft year. By default, the tab will display the current 6 months
    ...         + Each data point in the graph includes average Weight values of a month.
    ...         + The user can slide on the chart to navigate to the next/previous 6 months
    ...             * The user can not slide to the future
    ...             * The user can not slide to the 6 months before the oldest 6 months having data
    ...         + The user can zoom in on this chart to navigate to a specific month.
    ...         + The user can zoom out on this chart to navigate to the corresponding Year in Year tab
    ...     - There shall be navigational arrows that the user can use to navigate between months/6 months/years on the charts
    [Tags]      BIOC-SUMMARY-WEIGHT-02       BIOC-SRS-05-FRS-04-003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-WEIGHT-03: View Weight data in Year tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Weight card
    ...     - Press on Year tab
    ...
    ...     Expected Output:
    ...     - Year - the Weight data within the year
    ...     - There shall be a card displaying the fluctuation of weight
    ...         + If the latest weight on the chart is higher than the data first month of the year, display “You gain [absolute value between the first and the last data recorded] kg – This year”.
    ...         + If the latest weight on the chart is lower than the data first month of the year, display “You lose [absolute value between the first and the last data recorded] kg – This year”.
    ...         + If there is no data or less than 2 data recorded or the absolute value between the first and the last data recorded is smaller than 0.1, do not display any message
    ...     - When the “Year” tab is selected, the chart will display 2 line charts connecting data points within a year. By default, the tab will display the current year
    ...         + Each data point in the graph includes average Weight values of a quarter.
    ...         + The user can slide on the chart to navigate to the next/previous year.
    ...             * The user can not slide to the future
    ...             * The user can not slide to the year before the oldest year having data.
    ...         + The user can zoom in on this chart to navigate to a specific Month in the Month tab.
    ...     - There shall be navigational arrows that the user can use to navigate between months/6 months/years on the charts
    ...     - User can navigate back previous screen by pressing on back icon button
    [Tags]      BIOC-SUMMARY-WEIGHT-03       BIOC-SRS-05-FRS-04-003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-WEIGHT-04: View About Body weight in Month/ 6-month/ Year tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Weight card
    ...     - Press on About Body weight cards
    ...
    ...     Expected Output:
    ...     - The article screen is opened
    ...         + Title: Article
    ...         + Content: follow design
    ...         + There shall be Close button to close this screen
    [Tags]      BIOC-SUMMARY-WEIGHT-04       BIOC-SRS-05-FRS-04-003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SUMMARY-WEIGHT-05: Add data manually in Month/ 6-month/ Year tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Health data screen
    ...
    ...     Test Steps:
    ...     - Press on Weight card
    ...     - Press on ... button
    ...     - Press on Add data manually
    ...     - Select time
    ...     - Select Weight value
    ...     - Press on save or cancel button
    ...
    ...     Expected Output:
    ...     - If users press on save button, Weight value is saved and Weight screen is closed
    ...     - If users press on cancel button, Weight screen is closed
    [Tags]      BIOC-SUMMARY-WEIGHT-05       BIOC-SRS-05-FRS-04-003      manual
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
