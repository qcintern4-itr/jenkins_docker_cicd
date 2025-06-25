*** Settings ***
Documentation  Bioheart portal Summary test suite
Metadata    sid   BHP-SUMMARY
Metadata  owner   Linh Tran
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioheart_portal/lib/ConfigHandler.py   ${ENV}
Library     corelib/AssertionExtension.py
Library     Collections

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags  BHP-SUMMARY     web
Test Timeout  1h

*** Test Cases ***
BHP-SUMMARY-BIOSPHERE-01: Upgrade Biosphere
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...
    [Tags]  BHP-SUMMARY-BIOSPHERE-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-BIOSPHERE-02: Cancel to upgrade Biosphere
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...
    [Tags]  BHP-SUMMARY-BIOSPHERE-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-HR-01: View Heart rate charts
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Heart rate card
    ...    - 2. Check heart rate chart
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Summary screen with Heart rate tab
    ...    - 2.
    ...     - There shall be 5 different timeframes, each timeframe displayed in a tab (Hour, Day, Week, Month, Year)
    ...     - There shall be min, max. avg HR value of the displayed chart
    ...     - There shall be About heart rate text with message  (follow the design)
    [Tags]  BHP-SUMMARY-HR-01       auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Navigate To         Summary
    Navigate To Menu    Heart Rate
    ${timeframe}        Get Timeframe Items
    ${summary_hr}       Get Summary Heart Rate
    ${summary_hr}       Get Dictionary Keys     ${summary_hr}       sort_keys=False
    ${about_hr}         Get About Summary
    ${timeframe_expected}       Create List      Hour   Day   Week     Month    Year
    ${summary_hr_expected}      Create List      Min     Avg     Max
    Run Keyword And Continue On Failure     Should Be Equal     ${timeframe}     ${timeframe_expected}
    Run Keyword And Continue On Failure     Should Be Equal     ${summary_hr}    ${summary_hr_expected}
    Run Keyword And Continue On Failure     Should Be Equal     ${about_hr}[about title]     About Heart rate
    Run Keyword And Continue On Failure     Should Be Equal     ${about_hr}[about content]     Your heart rate, or pulse, is the number of times your heart beats per minute. Normal heart rate varies from person to person. As you age, changes in the rate and regularity of your pulse can change and may signify a heart condition or other condition that needs to be addressed
    Sign Out Bioheart Portal


BHP-SUMMARY-HR-02: View Heart rate data within an hour
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Heart rate card
    ...    - 2. Check heart rate in Hour timeframe
    ...
    ...     Expected Output:
    ...   - 1. Navigate to the Summary screen with Heart rate tab
    ...   - 2.
    ...     - When the “Hour” tab is selected, the chart will display a dot chart of heart rate values for a specific hour. By default, the tab will display the most recent hour of the current day.
    ...       + Each data point in the graph is the average HR value of a minute.
    ...       + When the user navigates to the Day tab and selects another day, when going back to the Hour tab, the Hour tab will automatically switch to the hour from 12:00 to 13:00 of the selected day in the Day tab.
    ...     - There shall be navigational arrows that the user can use to navigate between hours
    ...     - The Hour chart shall display the HR value at the selected time.
    ...     - There shall be High and Low heart rate notifications tab
    ...     - There shall be View heart rate data button
    [Tags]  BHP-SUMMARY-HR-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-HR-03: View Heart rate data within a day
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Heart rate card
    ...    - 2. Click Day tab
    ...    - 3. Check heart rate in Day timeframe
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Summary screen with Heart rate tab
    ...    - 2. Navigate to the Day tab
    ...    - 3.
    ...     - When the “Day” tab is selected the chart will display a line chart connecting data points together within a day. By default, the tab will display the current day.
    ...       + Each data point in the graph includes max, min, and average HR values of a 30-minute timeframe.
    ...       + In the case there are some data points that have been lost, the app will connect the two points around the missing segment by a dashed line if the distance between the two points is not more than 2 hours.
    ...     - There shall be navigational arrows that the user can use to navigate between days
    ...     - The Day it shall display the avg HR, max HR, and min HR at the selected timeframe
    ...     - There shall be High and Low heart rate notifications tab
    ...     - There shall be View heart rate data button
    [Tags]  BHP-SUMMARY-HR-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-HR-04: View Heart rate data within a week
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Heart rate card
    ...    - 2. Click Day tab
    ...    - 3. Check heart rate in Week timeframe
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Summary screen with Heart rate tab
    ...    - 2. Navigate to the Week tab
    ...    - 3.
    ...     - When the “Week” tab is selected, the chart will display a line chart connecting data points within a week. By default, the tab will display the current week.
    ...       + Each data point in the graph includes max, min, and average HR values of a 6-hour timeframe.
    ...       + In the case there are some data points that have been lost, the app will connect the two points around the missing segment by a dashed line if the distance between the two points is not more than 1 day.
    ...     - There shall be navigational arrows that the user can use to navigate between weeks
    ...     - The Week it shall display the avg HR, max HR, and min HR at the selected timeframe
    ...     - There shall be High and Low heart rate notifications tab
    ...     - There shall be Week Summary tab
    ...     - There shall be View heart rate data button
    [Tags]  BHP-SUMMARY-HR-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-HR-05: View Heart rate data within a month
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Heart rate card
    ...    - 2. Click Day tab
    ...    - 3. Check heart rate in Month timeframe
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Summary screen with Heart rate tab
    ...    - 2. Navigate to the Month tab
    ...    - 3.
    ...     - When the “Month” tab is selected, the chart will display a line chart connecting data points within a month. By default, the tab will display the current month.
    ...       + Each data point in the graph includes max, min, and average HR values of a day.
    ...       + In the case there are some data points that have been lost, the app will connect the two points around the missing segment by a dashed line if the distance between the two points is not more than 1 day.
    ...     - There shall be navigational arrows that the user can use to navigate between months
    ...     - The Month it shall display the avg HR, max HR, and min HR at the selected timeframe
    ...     - There shall be High and Low heart rate notifications tab
    ...     - There shall be Month Summary tab
    ...     - There shall be View heart rate data button
    [Tags]  BHP-SUMMARY-HR-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-HR-06: View Heart rate data within a year
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Heart rate card
    ...    - 2. Click Day tab
    ...    - 3. Check heart rate in Year timeframe
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Summary screen with Heart rate tab
    ...    - 2. Navigate to the Year tab
    ...    - 3.
    ...     - When the “Year” tab is selected, the chart will display a line chart connecting data points within a year. By default, the tab will display the current year.
    ...       + Each data point in the graph includes max, min, and average HR values of a month.
    ...    - There shall be navigational arrows that the user can use to navigate between years
    ...    - The Year it shall display the avg HR, max HR, and min HR at the selected timeframe
    ...    - There shall be High and Low heart rate notifications tab
    ...    - There shall be Year Summary tab
    ...    - There shall be View heart rate data button
    [Tags]  BHP-SUMMARY-HR-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-HRV-01: View Heart rate variability charts
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Heart rate variability card
    ...    - 2. Check heart rate variability chart
    ...    - 3. Click on Learn more button
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Summary screen with Heart rate variability tab
    ...    - 2.
    ...     + There shall be 4 different timeframes, each timeframe displayed in a tab (Day, Week, Month, Year)
    ...     + There shall be avg value of the displayed chart
    ...     + There shall be About heart rate variability text with message  (follow the design)
    ...     + There shall be Evaluation of HRV (follow the design)
    ...    - 3. Navigate to the link
    [Tags]  BHP-SUMMARY-HRV-01      auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Navigate To         Summary
    Navigate To Menu    Heart rate variability
    ${timeframe}        Get Timeframe Items
    ${summary_hr}       Get Summary Heart Rate
    ${summary_hr}       Get Dictionary Keys     ${summary_hr}       sort_keys=False
    ${about_hr}         Get About Summary
    ${timeframe_expected}       Create List      Hour   Day   Week     Month    Year
    ${summary_hr_expected}      Create List      Min     Avg     Max
    Run Keyword And Continue On Failure     Should Be Equal     ${timeframe}     ${timeframe_expected}
    Run Keyword And Continue On Failure     Should Be Equal     ${summary_hr}    ${summary_hr_expected}
    Run Keyword And Continue On Failure     Should Be Equal     ${about_hr}[about title]     About Heart rate
    Run Keyword And Continue On Failure     Should Be Equal     ${about_hr}[about content]     Your heart rate, or pulse, is the number of times your heart beats per minute. Normal heart rate varies from person to person. As you age, changes in the rate and regularity of your pulse can change and may signify a heart condition or other condition that needs to be addressed
    Sign Out Bioheart Portal

BHP-SUMMARY-HRV-02: View Heart rate variability data within a day
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Heart rate variability card
    ...    - 2. Check heart rate variability in Day timeframe
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Summary screen with Heart rate variability tab
    ...    - 2.
    ...     - When the “Day” tab is selected the chart will display a line chart connecting data points together within a day. By default, the tab will display the current day.
    ...       + Each data point in the graph is average HRV values of a 30-minute timeframe.
    ...       + In the case there are some data points that have been lost, the app will connect the two points around the missing segment by a dashed line if the distance between the two points is not more than 2 hours.
    ...     - There shall be navigational arrows that the user can use to navigate between days
    ...     - The Day it shall display the avg HRV at the selected timeframe
    [Tags]  BHP-SUMMARY-HRV-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-HRV-03: View Heart rate variability data within a week
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Heart rate variability card
    ...    - 2. Click Week tab
    ...    - 3. Check heart rate variability in Week timeframe
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Summary screen with Heart rate variability tab
    ...    - 2. Navigate to the Week tab
    ...    - 3.
    ...     - When the “Week” tab is selected, the chart will display a line chart connecting data points within a week. By default, the tab will display the current week.
    ...       + Each data point in the graph is average HRV values of a day
    ...       + In the case there are some data points that have been lost, the app will connect the two points around the missing segment by a dashed line if the distance between the two points is not more than 1 day.
    ...     - There shall be navigational arrows that the user can use to navigate between weeks
    ...     - The Week it shall display the avg HRV at the selected timeframe
    [Tags]  BHP-SUMMARY-HRV-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-HRV-04: View Heart rate variability data within a month
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Heart rate variability card
    ...    - 2. Click Month tab
    ...    - 3. Check heart rate variability in Month timeframe
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Summary screen with Heart rate variability tab
    ...    - 2. Navigate to the Month tab
    ...    - 3.
    ...     - When the “Month” tab is selected, the chart will display a line chart connecting data points within a month. By default, the tab will display the current month.
    ...       + Each data point in the graph is average HRV values of a day.
    ...       + In the case there are some data points that have been lost, the app will connect the two points around the missing segment by a dashed line if the distance between the two points is not more than 1 day.
    ...     - There shall be navigational arrows that the user can use to navigate between months
    ...     - The Month it shall display the avg HRV at the selected timeframe
    [Tags]  BHP-SUMMARY-HRV-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-HRV-05: View Heart rate variability data within a year
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Heart rate variability card
    ...    - 2. Click Year tab
    ...    - 3. Check heart rate variability in Year timeframe
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Summary screen with Heart rate variability tab
    ...    - 2. Navigate to the Year tab
    ...    - 3.
    ...     - When the “Year” tab is selected, the chart will display a line chart connecting data points within a year. By default, the tab will display the current year.
    ...       + Each data point in the graph is average HRV values of a month.
    ...     - There shall be navigational arrows that the user can use to navigate between years
    ...     - The Year it shall display the avg HRV at the selected timeframe
    [Tags]  BHP-SUMMARY-HRV-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-HRV-06: Check HRV is above the normal range
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Heart rate variability card
    ...    - 2. Check HRV thershold
    ...
    ...     Expected Output:
    ...    - 1.Navigate to the Summary screen with Heart rate variability tab
    ...    - 2.
    ...     - Your heart rate variability of <HRV ms> is above the normal range of <depending on the user’s age>, which means this is a sign of wealthy health.
    ...     - This range is according to research conducted to identify the normal heart rate variability by age.
    ...     - Green >= <depending on the user’s age>.
    ...     - Orange < <depending on the user’s age>.”
    [Tags]  BHP-SUMMARY-HRV-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-HRV-07: Check HRV is within the normal range
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Heart rate variability card
    ...    - 2. Check HRV thershold
    ...
    ...     Expected Output:
    ...    - 1.Navigate to the Summary screen with Heart rate variability tab
    ...    - 2.
    ...     - Your heart rate variability of <HRV ms> is within the normal range of <depending on the user’s age>.
    ...     - This range is according to research conducted to identify the normal heart rate variability by age.
    ...     - Green >= <depending on the user’s age>.
    ...     - Orange < <depending on the user’s age>.”
    [Tags]  BHP-SUMMARY-HRV-07      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-HRV-08: Check HRV is below the normal range
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Heart rate variability card
    ...    - 2. Check HRV thershold
    ...
    ...     Expected Output:
    ...    - 1.Navigate to the Summary screen with Heart rate variability tab
    ...    - 2.
    ...     - Your heart rate variability of <HRV ms> is below the normal range of <depending on the user’s age >, which means you might have some mental issues.
    ...     - This range is according to research conducted to identify the normal heart rate variability by age.
    ...     - Green >= <depending on the user’s age>.
    ...     - Orange < <depending on the user’s age>.”
    [Tags]  BHP-SUMMARY-HRV-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-RHR-01: View Resting heart rate charts
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Resting heart rate card
    ...    - 2. Check Resting heart rate chart
    ...    - 3. Click on Learn more button
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Summary screen with Resting heart rate tab
    ...    - 2.
    ...     + There shall be 4 different timeframes, each timeframe displayed in a tab (Day, Week, Month, Year)
    ...     + There shall be avg value of the displayed chart
    ...     + There shall be About heart rate variability text with message  (follow the design)
    ...     + There shall be Evaluation of Resting HR (follow the design)
    ...    - 3. Navigate to the link
    [Tags]  BHP-SUMMARY-RHR-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-RHR-02: View Resting heart rate data within a day
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Resting Heart rate card
    ...    - 2. Check Resting heart rate in Day timeframe
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Summary screen with Resting heart rate  tab
    ...    - 2.
    ...     - When the “Day” tab is selected the chart will display a line chart connecting data points together within a day. By default, the tab will display the current day.
    ...       + Each data point in the graph is average Resting HR values of a 30-minute timeframe.
    ...       + In the case there are some data points that have been lost, the app will connect the two points around the missing segment by a dashed line if the distance between the two points is not more than 2 hours.
    ...     - There shall be navigational arrows that the user can use to navigate between days
    ...     - The Day it shall display the avg Resting HR at the selected timeframe
    [Tags]  BHP-SUMMARY-RHR-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-RHR-03: View Resting heart rate data within a week
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Resting heart rate card
    ...    - 2. Click Week tab
    ...    - 3. Check Resting heart rate in Week timeframe
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Summary screen with Resting heart rate tab
    ...    - 2. Navigate to the Week tab
    ...    - 3.
    ...     - When the “Week” tab is selected, the chart will display a line chart connecting data points within a week. By default, the tab will display the current week.
    ...       + Each data point in the graph is average Resting HR values of a day
    ...       + In the case there are some data points that have been lost, the app will connect the two points around the missing segment by a dashed line if the distance between the two points is not more than 1 day.
    ...     - There shall be navigational arrows that the user can use to navigate between weeks
    ...     - The Week it shall display the avg Resting HR at the selected timeframe
    [Tags]  BHP-SUMMARY-RHR-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-RHR-04: View Resting heart rate data within a month
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Resting heart rate card
    ...    - 2. Click Month tab
    ...    - 3. Check Resting heart rate in Month timeframe
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Summary screen with Resting heart rate tab
    ...    - 2. Navigate to the Month tab
    ...    - 3.
    ...     - When the “Month” tab is selected, the chart will display a line chart connecting data points within a month. By default, the tab will display the current month.
    ...       + Each data point in the graph is average Resting HR values of a day.
    ...       + In the case there are some data points that have been lost, the app will connect the two points around the missing segment by a dashed line if the distance between the two points is not more than 1 day.
    ...     - There shall be navigational arrows that the user can use to navigate between months
    ...     - The Month it shall display the avg Resting HR at the selected timeframe
    [Tags]  BHP-SUMMARY-RHR-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-RHR-05: View Resting heart rate data within a year
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Resting heart rate card
    ...    - 2. Click Year tab
    ...    - 3. Check Resting heart rate in Year timeframe
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Summary screen with Resting heart rate tab
    ...    - 2. Navigate to the Year tab
    ...    - 3.
    ...     - When the “Year” tab is selected, the chart will display a line chart connecting data points within a year. By default, the tab will display the current year.
    ...       + Each data point in the graph is Resting average HR values of a month.
    ...     - There shall be navigational arrows that the user can use to navigate between years
    ...     - The Year it shall display the avg Resting HR at the selected timeframe
    [Tags]  BHP-SUMMARY-RHR-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-RHR-06: Check Resting HR is above the normal range
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Resting heart rate card
    ...    - 2. Check RHR thershold
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Summary screen with Resting heart ratetab
    ...    - 2.
    ...     - Your heart rate variability of <RHR bpm> is above the normal range of 60-100 bpm, which means you might have some health issues.
    ...     - This range is according to research conducted to identify the normal resting heart rate.
    ...     - Green <= 60 to 100 bpm.
    ...     - Orange > 100 bpm.
    [Tags]  BHP-SUMMARY-RHR-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-RHR-07: Check Resting HR is within the normal range
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Resting heart rate card
    ...    - 2. Check RHR thershold
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Summary screen with Resting heart ratetab
    ...    - 2.
    ...     - Your heart rate variability of <RHR bpm> is within the normal range of 60-100 bpm.
    ...     - This range is according to research conducted to identify the normal resting heart rate.
    ...     - Green <= 60 to 100 bpm.
    ...     - Orange > 100 bpm.
    [Tags]  BHP-SUMMARY-RHR-07      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-RHR-08: Check Resting HR is below the normal range
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Resting heart rate card
    ...    - 2. Check RHR thershold
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Summary screen with Resting heart rate tab
    ...    - 2.
    ...     - Your heart rate variability of <RHR bpm> is below the normal range of 60-100 bpm, which means this is a sign of wealthy health.
    ...     - This range is according to research conducted to identify the normal resting heart rate.
    ...     - Green <= 60 to 100 bpm.
    ...     - Orange > 100 bpm.
    [Tags]  BHP-SUMMARY-RHR-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-AM-01: View Active minutes and HR during activity charts
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Active minutes card
    ...    - 2. Check Active minutes and HR during activity chart
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Summary screen with Active minutes tab
    ...    - 2.
    ...     + There shall be 4 different timeframes, each timeframe displayed in a tab (Day, Week, Month, Year)
    ...     + There shall be total active minutes and HR during activity of the displayed chart
    [Tags]  BHP-SUMMARY-AM-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-AM-02: View Active minutes and HR during activity data within a day
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Active minutes card
    ...    - 2. Check Active minutes and HR during activity in Day timeframe
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Summary screen with Active minutes tab
    ...    - 2.
    ...     * Active minutes chart
    ...     - When the “Day” tab is selected the chart will display a column chart within a day. By default, the tab will display the current day.
    ...     + Each data column in the graph is total active minutes of a 30-minute timeframe.
    ...     + In the case, there is no displayed column
    ...     - There shall be navigational arrows that the user can use to navigate between days
    ...     - The Day it shall display the total active minutes in a day
    ...     * HR during activity chart
    ...     When the “Day” tab is selected the chart will display a line chart connecting data points together within a day. By default, the tab will display the current day.
    ...     + Each data point in the graph is min, max, avg HR values during activity of a 30-minute timeframe.
    ...     + In the case there are some data points that have been lost, the app will connect the two points around the missing segment by a dashed line if the distance between the two points is not more than 2 hours.
    ...     - There shall be navigational arrows that the user can use to navigate between days
    ...     - The Day it shall display the min, max HR during activity in a day
    [Tags]  BHP-SUMMARY-AM-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-AM-03: View Active minutes and HR during activity within a week
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Active minutes card
    ...    - 2. Click Week tab
    ...    - 3. Check Active minutes and HR during activity in Week timeframe
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Summary screen with Active minutes tab
    ...    - 2. Navigate to the Week tab
    ...    - 3.
    ...     * Active minutes chart
    ...     - When the “Week” tab is selected, the chart will display a column chart connecting data points within a week. By default, the tab will display the current week.
    ...     + Each data column in the graph is total active minutes of a 6-hour timeframe
    ...     + In the case, there is no displayed column
    ...     - There shall be navigational arrows that the user can use to navigate between weeks
    ...     - The Week it shall display the total active minutes in a week
    ...     * HR during activity chart
    ...     - When the “Week” tab is selected, the chart will display a line chart connecting data points within a week. By default, the tab will display the current week.
    ...     + Each data point in the graph is min, max, avg HR during activity values of a 6-hour timeframe
    ...     + In the case there are some data points that have been lost, the app will connect the two points around the missing segment by a dashed line if the distance between the two points is not more than 1 day.
    ...     - There shall be navigational arrows that the user can use to navigate between weeks
    ...     - The Week it shall display the min, max at the selected timeframe
    [Tags]  BHP-SUMMARY-AM-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-AM-04: View Active minutes and HR during activity within a month
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Active minutes card
    ...    - 2. Click Month tab
    ...    - 3. Check Active minutes and HR during activity in Month timeframe
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Summary screen with Active minutes tab
    ...    - 2. Navigate to the Month tab
    ...    - 3.
    ...     * Active minutes chart
    ...     - When the “Month” tab is selected, the chart will display a column chart connecting data points within a month. By default, the tab will display the current year.
    ...     + Each data column in the graph is total active minutes of a day
    ...     + In the case, there is no displayed column
    ...     - There shall be navigational arrows that the user can use to navigate between weeks
    ...     - The Month it shall display the total active minutes in a month
    ...     * HR during activity chart
    ...     - When the “Month” tab is selected, the chart will display a line chart connecting data points within a month. By default, the tab will display the current month.
    ...     + Each data point in the graph is min, max, avg HR during activity values of a day
    ...     + In the case there are some data points that have been lost, the app will connect the two points around the missing segment by a dashed line if the distance between the two points is not more than 1 day.
    ...     - There shall be navigational arrows that the user can use to navigate between weeks
    ...     - The Month it shall display the min, max at the selected timeframe
    [Tags]  BHP-SUMMARY-AM-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SUMMARY-AM-05: View Active minutes and HR during activity within a year
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Active minutes card
    ...    - 2. Click Year tab
    ...    - 3. Check Active minutes and HR during activity in Year timeframe
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Summary screen with Active minutes tab
    ...    - 2. Navigate to the Year tab
    ...    - 3.
    ...     * Active minutes chart
    ...     - When the “Year” tab is selected, the chart will display a column chart connecting data points within a year. By default, the tab will display the current year.
    ...     + Each data column in the graph is total active minutes of a month
    ...     + In the case, there is no displayed column
    ...     - There shall be navigational arrows that the user can use to navigate between weeks
    ...     - The Week it shall display the total active minutes in a year
    ...     * HR during activity chart
    ...     - When the “Year” tab is selected, the chart will display a line chart connecting data points within a year. By default, the tab will display the current year.
    ...     + Each data point in the graph is min, max, avg HR during activity values of a month
    ...     - There shall be navigational arrows that the user can use to navigate between weeks
    ...     - The Year it shall display the min, max at the selected timeframe
    [Tags]  BHP-SUMMARY-AM-05       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library    project_bioheart_portal/lib/web/Common.py    ${BROWSER_NODE}  ${ENV}
    Import Library    project_bioheart_portal/lib/web/Profile.py    ${BROWSER_NODE}  ${ENV}
    Import Library    project_bioheart_portal/lib/web/Summary.py    ${BROWSER_NODE}  ${ENV}
    Set Suite Variable  ${BROWSER_NODE}
    ${USER}    Get Config Param    USER
    Set Suite Variable      ${USER}
    ${VERSION}      Navigate To Bioheart Sign In Page
    Set Suite Metadata    version   ${VERSION}
    Set Suite Metadata    browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
#    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
#    Open Profile       open_edit_prof=${True}
#    Edit Profile       date=08/11/2001
    Quit Browser
