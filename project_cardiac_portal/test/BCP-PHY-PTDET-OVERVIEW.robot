*** Settings ***
Documentation   Cardiac Patient Details page > Medical Test Results test suite
Metadata    sid     BCP-PHY-PTDET-OVERVIEW
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-PHY-PTDET-OVERVIEW     web
Test Timeout    1h

*** Test Cases ***
BCP-PHY-PTDET-OVERVIEW-01: View multiple records of Heart rate/Blood pressure/Oxygen saturation/Body temperature/Weight-BMI chart for view day mode
   [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1. Go to patient details page of a specific patient care plan
    ...   2. In Overview tab, observe Heart rate/Blood pressure/Oxygen saturation/Body temperature/Weight-BMI chart for view day mode
    ...   3. Observe the value next to the chart title
    ...   4. Hover over random one point on the chart
    ...   5. Click on < button in date scale to go forward to view the data for each day
    ...   Expected results:
    ...   - In step 1, the date scale will display today
    ...   - In step 2,5 Data will be displayed correclty as user inputs
    ...   - In step 3, it will display The avg, min and max values of that day
    ...   - In step 4, it will display the time and the value.
    [Tags]    BCP-PHY-PTDET-OVERVIEW-01     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-OVERVIEW-02: View multiple records of Activity chart for view day mode
   [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1. Go to patient details page of a specific patient care plan
    ...   2. In Overview tab, observe Activity chart for view day mode
    ...   3. Hover over the chart
    ...   4. Click on < button in date scale to go forward to view the data for each day
    ...   Expected results:
    ...   - In step 1, the date scale will display today
    ...   - In step 2,4 Data will be displayed correclty as user inputs
    ...   - In step 3, it will display the duration time and the level.
    [Tags]    BCP-PHY-PTDET-OVERVIEW-02     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-OVERVIEW-03: View multiple records of Prescribed medication adherence chart for view day mode
   [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1. Go to patient details page of a specific patient care plan
    ...   2. In Overview tab, observe Prescribed medication adherence chart for view day mode
    ...   3. Hover over random one point on the chart
    ...   4. Click on < button in date scale to go forward to view the data for each day
    ...   Expected results:
    ...   - In step 1, the date scale will display today
    ...   - In step 2,4 Data will be displayed correclty as user inputs
    ...   - In step 3, it will display the time and the percent of that taken time.
    [Tags]    BCP-PHY-PTDET-OVERVIEW-03     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-OVERVIEW-04: View multiple records of Sleep chart for view day mode
   [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1. Go to patient details page of a specific patient care plan
    ...   2. In Overview tab, observe Sleep chart for view day mode
    ...   3. Observe the value next to the chart title
    ...   4. Hover over the chart
    ...   5. Click on < button in date scale to go forward to view the data for each day
    ...   Expected results:
    ...   - In step 1, the date scale will display today
    ...   - In step 2,5 Data will be displayed correclty as user inputs
    ...   - In step 3, it will display the total duration of that day
    ...   - In step 4, it will display the duration time
    [Tags]    BCP-PHY-PTDET-OVERVIEW-04     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-OVERVIEW-05: View multiple records of Heart rate/Blood pressure/Oxygen saturation/Body temperature/Weight-BMI chart for view week/month mode
   [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1. Go to Patient details page
    ...   2. In Overview tab, select Week/Month mode
    ...   3. Observe Heart rate/Blood pressure/Oxygen saturation/Body temperature/Weight-BMI chart
    ...   4. Observe the value next to the chart title
    ...   5. Hover over random one point on the chart
    ...   6. Click on < button in date scale to go forward to view the data
    ...   Expected results:
    ...   - In step 2,6, the date scale will display
    ...     + Week: 7 days which count from the current day
    ...     + Month: each month (from 1 to the end date of that month).
    ...   - In step 3, Data will be displayed multiple records as user inputs
    ...   - In step 4, it will display The avg (of all records), min and max values of the week/month
    ...   - In step 5, it will display the date, and point’s value.
    [Tags]    BCP-PHY-PTDET-OVERVIEW-05     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-OVERVIEW-06: View multiple records of Activity chart for view week/month mode
   [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1. Go to Patient details page
    ...   2. In Overview tab, select Week/Month mode
    ...   3. Observe Activity chart
    ...   4. Observe the value next to the chart title
    ...   5. Hover over the chart
    ...   6. Click on < button in date scale to go forward to view the data
    ...   Expected results:
    ...   - In step 2,6, the date scale will display
    ...     + Week: 7 days which count from the current day
    ...     + Month: each month (from 1 to the end date of that month).
    ...   - In step 3, Data will be displayed duration of each day as user inputs
    ...   - In step 4, it will display The avg/day, min and max values of the week/month
    ...   - In step 5, it will display the date, and point’s value.
    [Tags]    BCP-PHY-PTDET-OVERVIEW-06     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-OVERVIEW-07: View multiple records of Prescribed medication adherence chart for view week mode
   [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1. Go to Patient details page
    ...   2. In Overview tab, select Week/Month mode
    ...   3. Observe Prescribed medication adherence chart
    ...   4. Observe the value next to the chart title
    ...   5. Hover over random one point on the chart
    ...   6. Click on < button in date scale to go forward to view the data
    ...   Expected results:
    ...   - In step 2,6, the date scale will display
    ...     + Week: 7 days which count from the current day
    ...     + Month: each month (from 1 to the end date of that month).
    ...   - In step 3, Data will be displayed the percent of each day as user inputs
    ...   - In step 4, it will display The avg/day, min and max values of the week/month
    ...   - In step 5, it will display the date, and point’s value.
    [Tags]    BCP-PHY-PTDET-OVERVIEW-07     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-OVERVIEW-08: View multiple records of Sleep chart for view week/month mode
   [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1. Go to Patient details page
    ...   2. In Overview tab, select Week/Month mode
    ...   3. Observe Sleep chart
    ...   4. Observe the value next to the chart title
    ...   5. Hover over the chart
    ...   6. Click on < button in date scale to go forward to view the data
    ...   Expected results:
    ...   - In step 2,6, the date scale will display
    ...     + Week: 7 days which count from the current day
    ...     + Month: each month (from 1 to the end date of that month).
    ...   - In step 3, Data will be displayed duration of each day as user inputs
    ...   - In step 4, it will display The avg/day, min and max values of the week/month
    ...   - In step 5, it will display the date, and point’s value.
    [Tags]    BCP-PHY-PTDET-OVERVIEW-08     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-OVERVIEW-09: View multiple records of Heart rate/Blood pressure/Oxygen saturation/Body temperature/Weight-BMI chart for view 3 months/6 months mode
   [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1. Go to Patient details page
    ...   2. In Overview tab, select 3 months/6 months mode
    ...   3. Observe Heart rate/Blood pressure/Oxygen saturation/Body temperature/Weight-BMI chart
    ...   4. Observe the value next to the chart title
    ...   5. Hover over random one point on the chart
    ...   6. Click on < button in date scale to go forward to view the data
    ...   Expected results:
    ...   - In step 2,6, the date scale will display
    ...     + 3 months (from the first date of 2 previous months to the end date of the current month).
    ...     + 6 months (from the first date of 5 previous months to the end date of the current month).
    ...   - In step 3, Data will be displayed min, max of each 7 days as user inputs
    ...   - In step 4, it will display The avg (of all records), min, and max values of that 3 months/6 months
    ...   - In step 5, it will display the date range, and point’s value.
    [Tags]    BCP-PHY-PTDET-OVERVIEW-09     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-OVERVIEW-10: View multiple records of Activity chart for view 3 months/6 months mode
   [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1. Go to Patient details page
    ...   2. In Overview tab, select 3 months/6 months mode
    ...   3. Observe Activity chart
    ...   4. Observe the value next to the chart title
    ...   5. Hover over the chart
    ...   6. Click on < button in date scale to go forward to view the data
    ...   Expected results:
    ...   - In step 2,6, the date scale will display
    ...     + 3 months (from the first date of 2 previous months to the end date of the current month).
    ...     + 6 months (from the first date of 5 previous months to the end date of the current month).
    ...   - In step 3, Data will be displayed total duration of each 7 days as user inputs
    ...   - In step 4, it will display The avg/week, min, and max values of that 3 months/6 months
    ...   - In step 5, it will display the date range, and point’s value.
    [Tags]    BCP-PHY-PTDET-OVERVIEW-10     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-OVERVIEW-11: View multiple records of Prescribed medication adherence chart for view 3 months/6 months mode
   [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1. Go to Patient details page
    ...   2. In Overview tab, select 3 months/6 months mode
    ...   3. Observe Prescribed medication adherence chart
    ...   4. Observe the value next to the chart title
    ...   5. Hover over random one point on the chart
    ...   6. Click on < button in date scale to go forward to view the data
    ...   Expected results:
    ...   - In step 2,6, the date scale will display
    ...     + 3 months (from the first date of 2 previous months to the end date of the current month).
    ...     + 6 months (from the first date of 5 previous months to the end date of the current month).
    ...   - In step 3, Data will be displayed the AVG percent of each 7 days as user inputs
    ...   - In step 4, it will display The avg/day, min, and max values of that 3 months/6 months
    ...   - In step 5, it will display the date range, and point’s value.
    [Tags]    BCP-PHY-PTDET-OVERVIEW-11     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-OVERVIEW-12: View multiple records of Sleep chart for view 3 months/6 months mode
   [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1. Go to Patient details page
    ...   2. In Overview tab, select 3 months/6 months mode
    ...   3. Observe Sleep chart
    ...   4. Observe the value next to the chart title
    ...   5. Hover over the chart
    ...   6. Click on < button in date scale to go forward to view the data
    ...   Expected results:
    ...   - In step 2,6, the date scale will display
    ...     + 3 months (from the first date of 2 previous months to the end date of the current month).
    ...     + 6 months (from the first date of 5 previous months to the end date of the current month).
    ...   - In step 3, Data will be displayed AVG duration of each 7 days as user inputs
    ...   - In step 4, it will display The avg/day, min, and max values of that 3 months/6 months
    ...   - In step 5, it will display the date range, and point’s value.
    [Tags]    BCP-PHY-PTDET-OVERVIEW-12     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-OVERVIEW-13: View multiple records of Heart rate/Blood pressure/Oxygen saturation/Body temperature/Weight-BMI chart for view 9 months/1 year mode
   [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1. Go to Patient details page
    ...   2. In Overview tab, select 9 months/1 year mode
    ...   3. Observe Heart rate/Blood pressure/Oxygen saturation/Body temperature/Weight-BMI chart
    ...   4. Observe the value next to the chart title
    ...   5. Hover over random one point on the chart
    ...   6. Click on < button in date scale to go forward to view the data
    ...   Expected results:
    ...   - In step 2,6, the date scale will display
    ...     + 9 months (from the 8 previous months to the current month).
    ...     + Year (from JAN to DEC month of each year)
    ...   - In step 3, Data will be displayed min, max of each month as user inputs
    ...   - In step 4, it will display The avg (of all records), min, and max values of that 3 months/6 months
    ...   - In step 5, it will display the month, and point’s value.
    [Tags]    BCP-PHY-PTDET-OVERVIEW-13     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-OVERVIEW-14: View multiple records of Activity chart for view 9 months/1 year mode
   [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1. Go to Patient details page
    ...   2. In Overview tab, select 9 months/1 year mode
    ...   3. Observe Activity chart
    ...   4. Observe the value next to the chart title
    ...   5. Hover over the chart
    ...   6. Click on < button in date scale to go forward to view the data
    ...   Expected results:
    ...   - In step 2,6, the date scale will display
    ...     + 9 months (from the 8 previous months to the current month).
    ...     + Year (from JAN to DEC month of each year)
    ...   - In step 3, Data will be displayed total duration of each month as user inputs
    ...   - In step 4, it will display The avg/month, min, and max values of that 9 months/the year
    ...   - In step 5, it will display the month, and point’s value.
    [Tags]    BCP-PHY-PTDET-OVERVIEW-14     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-OVERVIEW-15: View multiple records of Prescribed medication adherence chart for view 9 months/1 year mode
   [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1. Go to Patient details page
    ...   2. In Overview tab, select 9 months/1 year mode
    ...   3. Observe Prescribed medication adherence chart
    ...   4. Observe the value next to the chart title
    ...   5. Hover over random one point on the chart
    ...   6. Click on < button in date scale to go forward to view the data
    ...   Expected results:
    ...   - In step 2,6, the date scale will display
    ...     + 9 months (from the 8 previous months to the current month).
    ...     + Year (from JAN to DEC month of each year)
    ...   - In step 3, Data will be displayed the AVG percent of each month as user inputs
    ...   - In step 4, it will display The avg/day, min, and max values of that 9 months/the year
    ...   - In step 5, it will display the month, and point’s value.
    [Tags]    BCP-PHY-PTDET-OVERVIEW-15     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-OVERVIEW-16: View multiple records of Sleep chart for view 9 months/1 year mode
   [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1. Go to Patient details page
    ...   2. In Overview tab, select 9 months/1 year mode
    ...   3. Observe Sleep chart
    ...   4. Observe the value next to the chart title
    ...   5. Hover over the chart
    ...   6. Click on < button in date scale to go forward to view the data
    ...   Expected results:
    ...   - In step 2,6, the date scale will display
    ...     + 9 months (from the 8 previous months to the current month).
    ...     + Year (from JAN to DEC month of each year)
    ...   - In step 3, Data will be displayed AVG duration of each month as user inputs
    ...   - In step 4, it will display The avg /day, min, and max values of 9 months/the year
    ...   - In step 5, it will display the month, and point’s value.
    [Tags]    BCP-PHY-PTDET-OVERVIEW-16     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-OVERVIEW-17: View multiple records of Custom view with selected range is one day
   [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1. Go to Patient details page
    ...   2. In Overview tab, select Custom mode
    ...   3. Select range is one day
    ...   4. Click on Apply button
    ...   5. Observe the screen
    ...   6. Hover over random point on each chart
    ...   7. Click on > and < button in date scale
    ...   Expected results:
    ...   - In step 5,6 charts will be displayed as Day mode
    ...   - In step 7, user can not go backward or forward
    [Tags]    BCP-PHY-PTDET-OVERVIEW-17     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-OVERVIEW-18: View multiple records of Custom view with selected range is from 2 days to 7 days
   [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1. Go to Patient details page
    ...   2. In Overview tab, select Custom mode
    ...   3. Select range is from 2 days to 7 days
    ...   4. Click on Apply button
    ...   5. Observe the screen
    ...   6. Hover over random point on each chart
    ...   7. Click on > and < button in date scale
    ...   Expected results:
    ...   - In step 5,6 charts will be displayed as Week mode
    ...   - In step 7, user can not go backward or forward
    [Tags]    BCP-PHY-PTDET-OVERVIEW-18     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-OVERVIEW-19: View multiple records of Custom view with selected range is from 8 days to 30 days
   [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1. Go to Patient details page
    ...   2. In Overview tab, select Custom mode
    ...   3. Select range is from 8 days to 30 days
    ...   4. Click on Apply button
    ...   5. Observe the screen
    ...   6. Hover over random point on each chart
    ...   7. Click on > and < button in date scale
    ...   Expected results:
    ...   - In step 5,6 charts will be displayed as 1 month mode
    ...   - In step 7, user can not go backward or forward
    [Tags]    BCP-PHY-PTDET-OVERVIEW-19     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-OVERVIEW-20: View multiple records of Custom view with selected range is from 31 days to 180 days
   [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1. Go to Patient details page
    ...   2. In Overview tab, select Custom mode
    ...   3. Select range is from 31 days to 180 days
    ...   4. Click on Apply button
    ...   5. Observe the screen
    ...   6. Hover over random point on each chart
    ...   7. Click on > and < button in date scale
    ...   Expected results:
    ...   - In step 5,6 charts will be displayed as 6 months mode
    ...   - In step 7, user can not go backward or forward
    [Tags]    BCP-PHY-PTDET-OVERVIEW-20     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-OVERVIEW-21: View multiple records of Custom view with selected range is more than 180 days but less than 360 days
   [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1. Go to Patient details page
    ...   2. In Overview tab, select Custom mode
    ...   3. Select range is more than 180 days but less than 360 days
    ...   4. Click on Apply button
    ...   5. Observe the screen
    ...   6. Hover over random point on each chart
    ...   7. Click on > and < button in date scale
    ...   Expected results:
    ...   - In step 5,6 charts will be displayed as 1 year mode
    ...   - In step 7, user can not go backward or forward
    [Tags]    BCP-PHY-PTDET-OVERVIEW-21     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
#Suite Setup
    ${BROWSER_NODE}      Start Browser
    Import Library       project_cardiac_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${NURSES}            Get Config Param    USER > nurse
    ${TOKEN}             Sign In Cardiac     username=${NURSES}[0][username]     password=${NURSES}[0][password]
    ${VERSION}           Get Release Version
    Set Suite Metadata   version    ${VERSION}
    Set Suite Metadata   browser    ${BROWSER.capitalize()}

#Suite Teardown
    Quit Browser