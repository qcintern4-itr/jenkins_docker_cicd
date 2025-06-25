*** Settings ***
Documentation   Biocare app Health report test suite
Metadata    sid     BIOC-HEALTHREPORT
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-HEALTHREPORT   mapp
Test Timeout    1h

*** Test Cases ***
BIOC-HEALTHREPORT-01: View health reports on the home screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Home screen.
    ...     - The user does not have any reports and meets one of the following conditions:
    ...       + The user has come to the Health report for the first time.
    ...       + The user re-installs the app.
    ...       + The user signs out and signs in again with a different account.
    ...
    ...     Test Steps:
    ...     1. View Health report card
    ...     2. Click on Go to health reports button
    ...
    ...     Expected Output:
    ...     1. Title: Export and share
    ...        Text: Visualize all your biometric data with ease.
    ...        Go to health reports button
    ...     2. The screen shall display:
    ...        - How to create your report
    ...          + Step 1: Tap to create
    ...          + Step 2: Select time range to export data
    ...          + Step 3: View and share
    ...        - "Create report +" button
    [Tags]      BIOC-HEALTHREPORT-01       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEALTHREPORT-02: View list of health reports
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Home screen
    ...     - The user has some reports
    ...
    ...     Test Steps:
    ...     1. Click on Go to health reports button
    ...     2. View list of health reports
    ...     3. Tap on health report card in the list
    ...
    ...     Expected Output:
    ...     1. Health report list shall be sorted by created time.
    ...        - The user shall be able to delete the generating health report if it is not completed after 30 minutes.
    ...     2. Each card in the list displays the following information:
    ...        - Date frame of health report
    ...           + If the start date and the stop date is the same, this section shall display: [Mmm][dd], [yyyy]
    ...           + If the start date and the stop date is in the same year, this section shall display: [Mmm] [dd] – [Mmm] [dd], [yyyy]
    ...           + If the start date and the stop date is in the different year, this section shall display: [Mmm] [dd] – [Mmm] [dd], [yyyy]
    ...        - Duration of health report: depending on the duration of the start date and the stop date, this section shall display one of the following information:
    ...           + 1 day report
    ...           + 2 days report
    ...           + 3 days report
    ...           + 4 days report
    ...           + 5 days report
    ...           + 6 days report
    ...           + 7 days report (for Custom date range option)
    ...           + Weekly report
    ...           + Monthly report
    ...        - Creation time
    ...           + If the day is the current day, this section shall display Today [hh]: [mm] [AM/PM]
    ...           + If the day is not the current day, this section shall display [Mmm] [dd].
    ...        - Status
    ...           + If the report is being generated, the status tag shall display Generating.
    ...           + If the report is generated successfully, Generating tag shall be removed.
    ...     3. The user shall be able to view the details of health report.
    ...         - If the loading data server failed, the app shall display an error message with Try again button.
    [Tags]      BIOC-HEALTHREPORT-02       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEALTHREPORT-03: Delete health reports
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Home screen
    ...     - The user has some reports
    ...
    ...     Test Steps:
    ...     1. View list of health reports
    ...     2. Click on delete icon button
    ...
    ...     Expected Output:
    ...     1. The user shall be able to delete the generating health report if it is not completed after 30 minutes.
    ...     2. The selected health report card shall be deleted.
    [Tags]      BIOC-HEALTHREPORT-03       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEALTHREPORT-04: View Create a health report screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Home screen.
    ...     - The user is in Health report screen.
    ...
    ...     Test Steps:
    ...     1. Tap on Plus icon on Health report screen
    ...     2. Tap on X button
    ...
    ...     Expected Output:
    ...     1. The user shall be navigated to the Create a health report screen.
    ...        - Title: “What data do you want to include?”
    ...        - There are three options for the user to select a time frame for a health report:
    ...           + Last week (recommended) *defaul*
    ...             Format time: [MMM] [dd] - [MMM] [dd],[yyyy]
    ...           + Last month
    ...             Format time: [MMM] [yyyy]
    ...                 Scenario 1: User’s account is Free Plan
    ...                    * This option shall be disabled and there is a message saying “This option is only for Biosphere+ account” with a question mark, under the “Last month” option card.
    ...                    * When the user clicks on the question mark button, a small window shall pop up that claim: “Upgrade to Biosphere+ to create report from any day in your historical data”. From here there are 2 options:
    ...                       If the user wants to leave the window, click “Close” to go back to the Create a health report screen.
    ...                       If the user wants to learn more about Biosphere+, tap “Learn more”. Then the user will be navigated to page: https://biosphere.bioheart.com
    ...                 Scenario 2: User’s account is Biosphere+ account
    ...                    * This option shall be enabled without any message below.
    ...           + Custom date range: Select a time frame
    ...                 Scenario 1: User’s account is Free Plan
    ...                    * The user can only select the start date within the last 30 days. Any dates before that shall be disabled.
    ...                    * A small notification at the bottom of the page claims that “You can only create the report with data within the last 30 days”; along with a question mark.
    ...                    * When the user clicks on the question mark button, a small window shall pop up that claim: “Upgrade to Biosphere+ to create report from any day in your historical data”. From here there are 2 options:
    ...                       If the user wants to leave the window, click “Close” to go back to the calendar.
    ...                       If the user wants to learn more about Biosphere+, tap “Learn more”. Then the user will be navigated to page: https://biosphere.bioheart.com
    ...                 Scenario 2: User’s account is Biosphere+ account
    ...                    * The user can select any date as start date in the past, as long as after the date the user registered the account. Any dates before that shall be disabled.
    ...                    * The user cannot select a date that is either before the date the user registers for an account or is in the future.
    ...                    * On the calendar of the stop date, the user cannot select a date that is more than 7 days from the start date.
    ...                    * The stop date shall be disabled until the user selected the start date.
    ...     2. Navigate the user to the Health reports screen.
    [Tags]      BIOC-HEALTHREPORT-04       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEALTHREPORT-05: Create a health report
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Health report screen
    ...
    ...     Test Steps:
    ...     1. Tap on Plus icon on Health report screen
    ...     2. Tap on Create button
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Generating report screen.
    ...        - If the app exports a new report, there shall be a “Generating report” message, and the user can leave the process and check back later.
    ...           + Once the report is created, the app shall notify the user. The user shall be navigated to details of the health report by tapping the notification.
    ...        - If the report was created, the app shall display the health report.
    [Tags]      BIOC-HEALTHREPORT-05       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEALTHREPORT-06: Interaction with report
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Health report screen
    ...
    ...     Test Steps:
    ...     1. Tap on a card in the health report list to open it in the Health report Details screen.
    ...     2. Tap on Share report button
    ...     3. Tap on Re-generate report button
    ...
    ...     Expected Output:
    ...     1. There shall be the following components:
    ...        - A report as a PDF file
    ...        - Back button. Tapping this button shall navigate the user to the previous screen
    ...        - Kebab button. Tapping this button, the bottom sheet shall appear with 2 options: Share report and Re-generate report
    ...     2. The app shall display sharing options (depending on the OS of the phone). The user can select a sharing option to share the PDF file.
    ...        - If the share report process or loading data server failed, the app shall display an error message with Try again button.
    ...     3. The user to re-generate the health report:
    ...          - The app shall regenerate the report and navigate the user to the “Generating report…” screen and then display the updated report.
    ...          - If the report is not regenerated, the app shall display the current report.
    ...        The report shall be regenerated if:
    ...          - The user’s information is updated.
    ...          - One of the data in the detail of health report is updated.
    ...          - The end date of the report is the current date.
    ...          - There are additional snapshots generated during the period of the report.
    [Tags]      BIOC-HEALTHREPORT-06       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEALTHREPORT-07: Details of health report
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Created a health report
    ...
    ...     Test Steps:
    ...     1. Click on a card in the health report list
    ...
    ...     Expected Output:
    ...     1. The Bioheart health report shall include the following sections:
    ...        - Patient information: Full name, Age, Gender
    ...        - Timezone: The displayed timezone is set based on the user’s phone timezone.
    ...           + There are two timezone types shown:
    ...             * The zone has the abbreviation for a given timestamp: EST, CST, MST, PST, AKST, etc…
    ...             * Others: GMT (+x), GMT (-x)
    ...        - Body temperature
    ...        - Blood pressure
    ...        - Weight
    ...        - Active minutes
    ...        - Steps
    ...        - Blood oxygen
    ...        - Sleep
    ...        - Heart rate
    ...        - Resting Heart rate
    ...        - Heart rate variability
    ...        - Heart rate during activity
    ...        - Snapshot Diary- the list of Snapshots was generated in the time frame
    ...        - Noteworthy Snapshots
    ...        - Disclaimer: A disclaimer section for the Biocare Health app.
    [Tags]      BIOC-HEALTHREPORT-07       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEALTHREPORT-DETAILS-01: Body temperature
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Created a health report
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - The user selects “Custom range date” timeframe, the list of records shall display.
    ...           + Each record shall include:
    ...              * The body temperature value
    ...              * Time: [Mmm] [dd], [hh]: [mm] [AM/PM]
    ...              * There shall be an alarm icon when the value exceeds the normal range. The normal temperature range falls between 35oC-37.5oC (95oF-99.5oF)
    ...           + “No data to display” screen shall display if the chosen time does not have data.
    ...     - The user selects “Last week” timeframe, the column chart showing data within a week will display.
    ...           + The x-axis displays time in week (day of week)
    ...           + The y-axis: displays the patient’s body temperature index. The degree unit will be displayed as the temperature setting on the patient’s app.
    ...           + Each data column in the graph includes average Temperature values of one-day timeframe.
    ...           + Days without data will not have chart series.
    ...           + The column shall change color in case:
    ...              * <35oC (<95oF), display blue.
    ...              * 35oC-37.5oC (95oF-99.5oF), display green.
    ...              * 37.6oC-41.5oC (99.6oF-106.7oF), display yellow.
    ...              * >41.5oC (>106.7oF), display red.
    ...           + Display the chart legend.
    ...           + Display the min, max values of that week.
    ...     - The user selects “Last month” timeframe, the column chart showing data within a month will display.
    ...           + The x-axis displays time (day of month)
    ...           + The y-axis: displays the patient’s body temperature index. The degree unit will be displayed as the temperature setting on the patient’s app.
    ...           + Each data column in the graph includes average Temperature values of one-day timeframe.
    ...           + Days without data will not have chart series
    ...           + The column shall change color in case:
    ...              * <35oC (<95oF), display blue
    ...              * 35oC-37.5oC (95oF-99.5oF), display green
    ...              * 37.6oC-41.5oC (99.6oF-106.7oF), display yellow
    ...              * >41.5oC (>106.7oF), display red
    ...           + Display the chart legend
    ...           + Display the min, max values of that month
    [Tags]      BIOC-HEALTHREPORT-DETAILS-01       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEALTHREPORT-DETAILS-02: Blood pressure
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Created a health report
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - The user selects “Custom range date” timeframe, the list of records shall display.
    ...          + Each record shall include:
    ...              * The blood pressure value
    ...              * Time: [Mmm] [dd], [hh]: [mm] [AM/PM]
    ...              * There shall be an alarm icon when the value exceeds the normal range. The normal blood pressure range falls between Systolic < 120 mmHg and Diastolic <80 mmHg
    ...          + “No data to display” screen shall display if the chosen time does not have data
    ...     - The user selects “Last week” timeframe, the line chart showing systolic and diastolic (blood pressure) data within a week shall display.
    ...          + The x-axis displays time in week (day of week)
    ...          + The y-axis: displays the patient’s blood pressure index.
    ...          + Each data column in the graph includes average blood pressure values of one-day timeframe.
    ...          + Days without data will not have chart series.
    ...          + Display the chart legend.
    ...          + Display the min, max values of that week.
    ...     - The user selects “Last month” timeframe, the line chart showing systolic and diastolic (blood pressure) data within a month shall display.
    ...          + The x-axis displays time (day of month)
    ...          + The y-axis: displays the patient’s blood pressure index.
    ...          + Each data point in the graph includes average blood pressure values of one-day timeframe.
    ...          + Days without data will not have chart series.
    ...          + Display the chart legend.
    ...          + Display the min, max values of that month.
    [Tags]      BIOC-HEALTHREPORT-DETAILS-02       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEALTHREPORT-DETAILS-03: Weight
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Created a health report
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - The user selects “Custom range date” timeframe, the list of records on that day shall display.
    ...          + Each record shall include:
    ...              * The Weight value.
    ...              * Time: [Mmm] [dd], [hh]: [mm] [AM/PM]
    ...              * There shall be an alarm icon when the value exceeds the normal range. The normal BMI range falls between 18,5-24,9
    ...          + “No data to display” screen shall be displayed if the chosen time does not have data.
    ...     - The user selects “Last week” timeframe, the list of records in that week shall display.
    ...          + Each record shall include:
    ...              * The Weight value.
    ...              * Time: [Mmm] [dd], [hh]: [mm] [AM/PM]
    ...              * There shall be an alarm icon when the value exceeds the normal range. The normal BMI range falls between 18,5-24,9
    ...          + “No data to display” screen shall be displayed if the chosen time does not have data.
    ...     - The user selects “Last month” timeframe, the line chart showing weight data within a month shall display.
    ...          + The x-axis displays time (day of month)
    ...          + The y-axis: displays the patient’s weight index.
    ...          + Each data point in the graph includes average weight values of one-day timeframe.
    ...          + Days without data will not have chart series.
    ...          + Display the chart legend.
    ...          + Display the average weight values and the average BMI values of that month.
    [Tags]      BIOC-HEALTHREPORT-DETAILS-03       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEALTHREPORT-DETAILS-04: Active minutes
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Created a health report
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - A graph displays a column chart with duration values of the time frame.
    ...          + If the duration of the report is 1 day, the time frame shall be 4 hours. Each bar in the graph shall display 30 minutes of the average value.
    ...          + If the duration of the report is 2 days, the graph shall display the data in 2 days with a time frame is 8 hours. Each data point in the graph shall display 1 hour of the average value.
    ...          + If the duration of the report is 3 days, the graph shall display the data in 3 days with a time frame is 12 hours. Each bar in the graph shall display 1 hour of the average value.
    ...          + If the duration of the report is 4,5,6,7 days, last week or last month, the graph shall display the data on each day. Each bar in the graph shall display 1 day of the average value.
    ...     - If the user chooses “Custom range date” timeframe, the summary section displays a list of average values of active minutes that depends on the duration of the report.
    ...     - If the user chooses “Last week” or “Last month” timeframe, the total active minutes values of that time shall be displayed.
    [Tags]      BIOC-HEALTHREPORT-DETAILS-04       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEALTHREPORT-DETAILS-05: Steps
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Created a health report
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - The user selects “Custom range date” timeframe, the list of records shall display.
    ...          + Each record shall include:
    ...              * The Steps value
    ...              * Time: [Mmm] [dd], [hh]: [mm] [AM/PM]
    ...          + “No data to display” screen shall display if the chosen time does not have data.
    ...     - The user selects “Last week” timeframe, the column chart showing data within a week will display.
    ...          + The x-axis displays time in week (day of week)
    ...          + The y-axis: displays the user’s step index.
    ...          + Each data column in the graph includes the step value of one-day timeframe.
    ...          + Days without data will not have chart series.
    ...          + Display the chart legend.
    ...          + Display the average step values of that week and step goal per day.
    ...     - The user selects “Last month” timeframe, the column chart showing data point within a month will display.
    ...          + The x-axis displays time in month (day of month)
    ...          + The y-axis: displays the user’s step index.
    ...          + Each data column in the graph includes the step value of one-day timeframe.
    ...          + Days without data will not have chart series.
    ...          + Display the chart legend.
    ...          + Display the average step values of that month and step goal per day.
    [Tags]      BIOC-HEALTHREPORT-DETAILS-05       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEALTHREPORT-DETAILS-06: Blood Oxygen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Created a health report
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - The user selects “Custom range date” timeframe, the list of records shall display.
    ...          + Each record shall include:
    ...              * The Blood Oxygen value
    ...              * Time: [Mmm] [dd], [hh]: [mm] [AM/PM]
    ...              * There shall be an alarm icon when the value exceeds the normal range. The normal Blood Oxygen range falls between 90 to 100
    ...          + “No data to display” screen shall display if the chosen time does not have data.
    ...     - The user selects “Last week” timeframe, the column chart showing data within a week will display.
    ...          + The x-axis displays time in week (day of week)
    ...          + The y-axis: displays the patient’s Blood Oxygen index.
    ...          + Each data column in the graph includes average Blood Oxygen values of one-day timeframe.
    ...          + Days without data will not have chart series.
    ...          + The column shall change color in case:
    ...              * Green:  Blood oxygen value >= 95
    ...              * Yellow: 95 > Blood oxygen value >= 91
    ...              * Dark Yellow:  91 > Blood oxygen value >= 85
    ...              * Orange:  85 > Blood oxygen value >= 80
    ...              * Red: 80 > Blood oxygen value
    ...          + Display the chart legend.
    ...          + Display the min, max values of that week.
    ...     - The user selects “Last month” timeframe, the column chart showing data within a month will display.
    ...          + The x-axis displays time in month (day of month)
    ...          + The y-axis: displays the patient’s Blood oxygen index.
    ...          + Each data column in the graph includes average Blood oxygen values of one-day timeframe.
    ...          + Days without data will not have chart series.
    ...          + The column shall change color in case:
    ...              * Green:  Blood oxygen value >= 95
    ...              * Yellow: 95 > Blood oxygen value >= 91
    ...              * Dark Yellow:  91 > Blood oxygen value >= 85
    ...              * Orange:  85 > Blood oxygen value >= 80
    ...              * Red: 80 > Blood oxygen value
    ...          + Display the chart legend.
    ...          + Display the min, max values of that month.
    [Tags]      BIOC-HEALTHREPORT-DETAILS-06       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEALTHREPORT-DETAILS-07: Sleep
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Created a health report
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - The user selects “Custom range date” timeframe, the list of records shall display.
    ...          + Each record shall include:
    ...              * The Sleep duration.
    ...              * Time: [Mmm] [dd], [hh]: [mm] [AM/PM]
    ...          + “No data to display” screen shall display if the chosen time does not have data.
    ...     - The user selects “Last week” timeframe, the column chart showing data within a week will display.
    ...          + The x-axis displays time in week (day of week)
    ...          + The y-axis: displays the patient’s sleep duration index.
    ...          + Each data column in the graph includes the sleep duration value of one-day timeframe.
    ...          + Days without data will not have chart series.
    ...          + Display the chart legend.
    ...          + Display the average sleep duration values of that week and sleep goal per day.
    ...     - The user selects “Last month” timeframe, the column chart showing data point within a month will display.
    ...          + The x-axis displays time in month (day of month)
    ...          + The y-axis: displays the patient’s sleep duration index.
    ...          + Each data column in the graph includes the sleep duration value of one-day timeframe.
    ...          + Days without data will not have chart series.
    ...          + Display the chart legend.
    ...          + Display the average sleep duration values of that month and sleep goal per day.
    [Tags]      BIOC-HEALTHREPORT-DETAILS-07       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEALTHREPORT-DETAILS-08: Heart rate
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Created a health report
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - A graph displays a line chart with average HR values of the time frame. Each data point in the graph displays the average value.
    ...          + If the duration of the report is 1 day, the time frame shall be 4 hours.
    ...          + If the duration of the report is 2 days, the time frame shall be 8 hours.
    ...          + If the duration of the report is 3 days, the time frame shall be 12 hours.
    ...          + If the duration of the report is 4,5,6,7 days, last week or last month, the graph shall display the data on each day.
    ...     - If the user chooses “Custom range date” timeframe, the summary section displays a list of average values of HR that depends on the duration of the report.
    ...     - If the user chooses “Last week” or “Last month” timeframe, the average, min and max values of that time shall be displayed.
    ...     - There are the number of HR transmissions in the report.
    [Tags]      BIOC-HEALTHREPORT-DETAILS-08       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEALTHREPORT-DETAILS-09: Resting Heart rate
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Created a health report
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - A graph displays a line chart with Resting HR values of the time frame. Two successive data points in a chart shall be connected, regardless of the distance between them.
    ...          + If the duration of the report is 1 day, the time frame shall be 4 hours. Each data point in the graph shall display 30 minutes of the average value.
    ...          + If the duration of the report is 2 days, the graph shall display the data in 2 days with a time frame is 8 hours. Each data point in the graph shall display 1 hour of the average value.
    ...          + If the duration of the report is 3 days, the graph shall display the data in 3 days with a time frame is 12 hours. Each data point in the graph shall display 2 hours of the average value.
    ...          + If the duration of the report is 4,5,6,7 days, last week or last month, the graph shall display the data on each day. Each data point in the graph shall display 4 hours of the average value.
    ...     - If the user chooses “Custom range date” timeframe, the summary section displays a list of average values of Resting HR that depends on the duration of the report.
    ...     - If the user chooses “Last week” or “Last month” timeframe, the average, min, and max values of that time shall be displayed.
    ...     - There are the number points of Resting HR in a graph.
    [Tags]      BIOC-HEALTHREPORT-DETAILS-09       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEALTHREPORT-DETAILS-10: Heart rate variability
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Created a health report
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - A graph displays a line chart with average HRV values of the time frame. Two successive data points in a chart shall be connected, regardless of the distance between them.
    ...          + If the duration of the report is 1 day, the time frame shall be 4 hours. Each data point in the graph shall display 30 minutes of the average value.
    ...          + If the duration of the report is 2 days, the graph shall display the data in 2 days with a time frame is 8 hours. Each data point in the graph shall display 1 hour of the average value.
    ...          + If the duration of the report is 3 days, the graph shall display the data in 3 days with a time frame is 12 hours. Each data point in the graph shall display 2 hours of the average value.
    ...          + If the duration of the report is 4,5,6,7 days, last week or last month, the graph shall display the data on each day. Each data point in the graph shall display 4 hours of the average value.
    ...     - If the user chooses “Custom range date” timeframe, the summary section displays a list of average values of HRV that depends on the duration of the report.
    ...     - If the user chooses “Last week” or “Last month” timeframe, the average, min, and max values of that time shall be displayed.
    ...     - There are the number points of HRV in a graph.
    [Tags]      BIOC-HEALTHREPORT-DETAILS-10       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEALTHREPORT-DETAILS-11: Heart rate during activity
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Created a health report
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - A graph displays a line chart with average HR during activity values of the time frame. Two successive data points in a chart shall be connected, regardless of the distance between them.
    ...          + If the duration of the report is 1 day, the time frame shall be 4 hours. Each data point in the graph shall display 30 minutes of the average value.
    ...          + If the duration of the report is 2 days, the graph shall display the data in 2 days with a time frame is 8 hours. Each data point in the graph shall display 1 hour of the average value.
    ...          + If the duration of the report is 3 days, the graph shall display the data in 3 days with a time frame is 12 hours. Each data point in the graph shall display 2 hours of the average value.
    ...          + If the duration of the report is 4,5,6,7 days, last week or last month, the graph shall display the data on each day. Each data point in the graph shall display 4 hours of the average value.
    ...     - If the user chooses “Custom range date” timeframe, the summary section displays a list of average values of HR that depends on the duration of the report.
    ...     - If the user chooses “Last week” or “Last month” timeframe, the average, min, and max values of that time shall be displayed.
    ...     - There are the number points of HR in a graph.
    [Tags]      BIOC-HEALTHREPORT-DETAILS-11       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEALTHREPORT-DETAILS-12: Snapshot Diary- the list of Snapshots was generated in the time frame
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Created a health report
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - This section shall display if the user has used a Bioheart device.
    ...     - Each record includes:
    ...          + Time: [Mmm] [dd], [yyyy] – [hh]: [mm]: [ss] [AM/PM]
    ...          + Duration
    ...          + Heart rate range
    ...          + Notes: Tags of a snapshot
    ...     - “No data to display” screen shall display if the chosen time does not have data.
    ...     - The Snapshot Diary section of the health report shall include the 2 snapshots of the day, Max HR and Min HR, alongside the snapshots of the user.
    ...          + The Note of the Max and Min HR should include 2 snapshot tags, Max HR and Min HR, respectively.
    [Tags]      BIOC-HEALTHREPORT-DETAILS-12       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEALTHREPORT-DETAILS-13: Noteworthy Snapshots
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Created a health report
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - This section shall display if the user has used a Bioheart device.
    ...     - “No data to display” screen shall display if the chosen time does not have data.
    [Tags]      BIOC-HEALTHREPORT-DETAILS-13       BIOC-1.22.0  manual  R1
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
