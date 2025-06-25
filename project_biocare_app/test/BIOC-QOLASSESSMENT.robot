*** Settings ***
Documentation   Biocare app QoL Assessment test suite
Metadata    sid     BIOC-QOLASSESSMENT
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}
#
#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-QOLASSESSMENT   mapp
Test Timeout    1h

*** Test Cases ***
BIOC-QOLASSESSMENT-01: List of the questions
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     1. The first question is about your health now. Please try to answer as accurately as you can.
    ...        - In general, would you say your health is...
    ...          + Excellent
    ...          + Very good
    ...          + Good
    ...          + Fair
    ...          + Poor
    ...     2. Now, please think about the activities that you might do during a typical day. As you read each item, please select whether your health now limits you a lot, limits you a little, or does not limit you at all when doing these activities.
    ...        a) …moderate activities, such as moving a table, pushing a vacuum cleaner, bowling, or playing golf. Does your health now limit you a lot, limit you a little, or not limit you at all?
    ...          + Yes, Limited a lot
    ...          + Yes, Limited a little
    ...          + No, Not at all limited
    ...        b) …climbing several flights of stairs. Does your health now limit you a lot, limit you a little, or not limit you at all?
    ...          + Yes, Limited a lot
    ...          + Yes, Limited a little
    ...          + No, Not at all limited
    ...     3. The following two questions ask you about your physical health and your daily activities.
    ...        a) During the past four weeks, how much of the time have you accomplished less than you would like as a result of your physical health?
    ...          + All of the time
    ...          + Most of the time
    ...          + Some of the time
    ...          + A little of the time
    ...          + None of the time
    ...        b) During the past four weeks, how much of the time were you limited in the kind of work or other regular daily activities you do as a result of your physical health?
    ...          + All of the time
    ...          + Most of the time
    ...          + Some of the time
    ...          + A little of the time
    ...          + None of the time
    ...     4. The following two questions ask you about your emotions and your daily activities.
    ...        a) During the past four weeks, how much of the time have you accomplished less than you would like as a result of any emotional problems, such as feeling depressed or anxious?
    ...          + All of the time
    ...          + Most of the time
    ...          + Some of the time
    ...          + A little of the time
    ...          + None of the time
    ...        b) During the past four weeks, how much of the time were you limited in the kind of work or other regular daily activities you do as a result of any emotional problems, such as feeling depressed or anxious?
    ...          + All of the time
    ...          + Most of the time
    ...          + Some of the time
    ...          + A little of the time
    ...          + None of the time
    ...     5. The following two questions ask you about your emotions and your daily activities.
    ...        - During the past 4 weeks, how much did pain interfere with your normal work (including both work outside the home and housework)?
    ...          + Not at all
    ...          + A little bit
    ...          + Moderately
    ...          + Quite a bit
    ...          + Extremely
    ...     6. The next four questions are about how you feel and how things have been with you during the past 4 weeks. As you read each statement, please select the one answer that comes closest to the way you have been feeling; is it all of the time, most of the time, some of the time, a little of the time, or none of the time?
    ...        - How much of the time during the past 4 weeks…have you felt calm and peaceful?
    ...          + All of the time
    ...          + Most of the time
    ...          + Some of the time
    ...          + A little of the time
    ...          + None of the time
    ...     7. The next four questions are about how you feel and how things have been with you during the past 4 weeks. As you read each statement, please select the one answer that comes closest to the way you have been feeling; is it all of the time, most of the time, some of the time, a little of the time, or none of the time?
    ...        - How much of the time during the past 4 weeks…did you have a lot of energy?
    ...          + All of the time
    ...          + Most of the time
    ...          + Some of the time
    ...          + A little of the time
    ...          + None of the time
    ...     8. The next four questions are about how you feel and how things have been with you during the past 4 weeks. As you read each statement, please select the one answer that comes closest to the way you have been feeling; is it all of the time, most of the time, some of the time, a little of the time, or none of the time?
    ...        a) How much of the time during the past 4 weeks…have you felt downhearted and depressed?
    ...          + All of the time
    ...          + Most of the time
    ...          + Some of the time
    ...          + A little of the time
    ...          + None of the time
    ...        b) How much of the time during the past 4 weeks…has your physical health or emotional problems interfered with your social activities (like visiting with friends, relatives, etc.)?
    ...          + All of the time
    ...          + Most of the time
    ...          + Some of the time
    ...          + A little of the time
    ...          + None of the time
    ...     9. How much were your daily activities limited by Atrial Fibrillation-related symptoms?
    ...        + Disabling
    ...        + Severe
    ...        + Moderate
    ...        + Mild
    ...        + None
    [Tags]      BIOC-QOLASSESSMENT-01      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QOLASSESSMENT-02: Scoring SF-12
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     1. 2 types: 6 questions for PFS and 6 questions for MFS
    ...        - Physical Functional Score
    ...          + General Health: 1
    ...          + Physical functioning: 2a, 2b (Total/2)
    ...          + Role physical: 3a, 3b (Total/2)
    ...          + Bodily pain: 5
    ...        - Mental Functional Score
    ...          + Mental Health: 6
    ...          + Social Functioning: 8a, 8b (Total/2)
    ...          + Role Emotional: 4a, 4b (Total/2)
    ...          + Vitality: 7
    [Tags]      BIOC-QOLASSESSMENT-02      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QOLASSESSMENT-03: Answer the questions
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...     1. Click on the Take Quality of life assessment
    ...     2. Click on Close button
    ...     3. Click on Keep doing Button
    ...     4. Click on Close button and Save & Quit Button
    ...     5. Click on the Continue Take Quality of life assessment
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the first question of the Quality of life test and Close button
    ...     2. Popup will be displayed:
    ...        + Title: You haven’t finished the test
    ...        + Content: Do you want to save the answers?
    ...        + Save & Quit Button
    ...        + Keep doing button
    ...     3. The user stays on the same screen
    ...     4. Navigate the user back to the Home screen
    ...        - The completed questions will be saved. The QoL status is “Continue Take Quality of life assessment”
    ...     5. Navigated to the saved current question to continue the test
    [Tags]      BIOC-QOLASSESSMENT-03     BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QOLASSESSMENT-04: Complete the Quality of life test
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...     1. Click on the Take Quality of life assessment
    ...     2. Click on Close button
    ...     3. Click on Keep doing Button
    ...     4. Click on Close button and Save & Quit Button
    ...     5. Click on the Continue Take Quality of life assessment
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the first question of the Quality of life test and Close button
    ...     2. Popup will be displayed:
    ...        - Title: You haven’t finished the test
    ...        - Content: Do you want to save the answers?
    ...        - Save & Quit Button
    ...        - Keep doing button
    ...     3. The user stays on the same screen
    ...     4. Navigate the user back to the Home screen
    ...        - The completed questions will be saved. The QoL status is “Continue Take Quality of life assessment”
    ...        - Navigated to the saved current question to continue the test
    [Tags]      BIOC-QOLASSESSMENT-04     BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QOLASSESSMENT-RESULT-01: View QoL results in Service tab (Old)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...     1. Press on QoL assessment card
    ...     2. Click on the caret button
    ...     3. Click on the caret button
    ...     4. Press on back icon button
    ...
    ...     Expected Output:
    ...     1. The Quality of life section includes the initial and monthly Quality of life results.
    ...        - Each result will have the following information
    ...          + Title:
    ...             * For initial test: Initial test
    ...             * For monthly test: Monthly test
    ...          + Date: The date the Quality of life test is completed
    ...             * Format: long month DD, YYYY (Ex: Oct 10, 2023)
    ...          + Categories:
    ...             * General health
    ...             * Limitations of activities
    ...             * Physical health problems
    ...             * Emotional health problems
    ...             * Social activities
    ...             * Energy and emotions
    ...          + Additional information (only for the first test)
    ...             * Questions from 9 to 11
    ...       - The results are sorted by date in descending order.
    ...       - By default, the results of the latest will be displayed.
    ...     2. The results will be showed
    ...     3. The results will be hided
    ...     4. User can navigate to the previous screen.
    [Tags]      BIOC-QOLASSESSMENT-RESULT-01      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QOLASSESSMENT-RESULT-02: View QoL results in Service tab (New)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...     1. Press on QoL assessment card
    ...     2. Click on the caret button
    ...     3. Click on the caret button
    ...     4. Press on back icon button
    ...
    ...     Expected Output:
    ...     1. The Quality of life section includes the initial and monthly Quality of life results.
    ...        - Each result will have the following information
    ...          + Title:
    ...             * For monthly test: Monthly test
    ...          + Date: The date the Quality of life test is completed
    ...             * Format: long month DD, YYYY (Ex: Oct 10, 2023)
    ...          + Physical Functional Score:
    ...             * General health
    ...             * Physical functioning
    ...             * Role physical
    ...             * Bodily pain
    ...          + Mental Functional Score
    ...             * Mental health
    ...             * Social functioning
    ...             * Role emotional
    ...             * Vitality
    ...          + Atrial Fibrillation (only for the program users and they have “Atrial fibrillation and flutter” listed under Monitored Diagnosis)
    ...        - The results are sorted by date in descending order.
    ...        - By default, the results of the latest will be displayed.
    ...     2. The results will be showed
    ...     3. The results will be hided
    ...     4. User can navigate to the previous screen
    [Tags]      BIOC-QOLASSESSMENT-RESULT-02      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QOLASSESSMENT-RESULT-03: View QoL results in Service tab (No data)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...     1. Press on QoL assessment card
    ...
    ...     Expected Output:
    ...     1. Message will be displayed: "No data to display"
    [Tags]      BIOC-QOLASSESSMENT-RESULT-03      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${APP_NODE}       Get Device Node
    Import Library    project_biocare_app/lib/mapp/Common.py     ${APP_NODE}     ${ENV}
    Start Biocare App
    ${USER}     Get Config Param    USER
    Sign In Biocare App    email=${USER}[username]      password=${USER}[password]
    ${RELEASE_VERSION}     Get Release Version
    Set Suite Metadata     version     ${RELEASE_VERSION}

SUITE TEARDOWN
    Quit All
