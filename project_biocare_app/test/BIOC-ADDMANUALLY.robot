*** Settings ***
Documentation   Biocare app Add Manually test suite
Metadata    sid     BIOC-ADDMANUALLY
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-ADDMANUALLY  mapp
Test Timeout    1h

*** Test Cases ***
BIOC-ADDMANUALLY-01: View Add manually screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is on Home + Summary screen
    ...
    ...     Test Steps:
    ...     1. Press on Plus button
    ...
    ...     Expected Output:
    ...     1. Add manually screen is displayed with 2 sections: Measurements and Goal
    ...          + Measurements with 12 items: HR, HRV, RHR, Blood pressure, Blood Oxygen, Body temperature, Weight, Sleep, Symptoms, Steps, Walking and Running
    ...          + Goal with 3 items: Sleep, Steps, Activities
    ...        - User can close this screen by pressing on close button
    [Tags]      BIOC-ADDMANUALLY-01        BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-MEASUREMENTS-01: Check popup display when connect biokit in add heart rate screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Heart rate card
    ...     2. Press on the Connect now button
    ...     3. Press on cancel button
    ...
    ...     Expected Output:
    ...     1. The modal shall appear with the following components:
    ...        - Content: Do you want to connect Biokit?
    ...        - Connect now button
    ...        - Add manually button
    ...     2. Navigate the user to Connect to biokit screen (Blood pressure monitor and pulse Oximeter)
    ...     3. If users press on cancel button, heart rate screen will be closed and navigate to the Add manually screen.
    [Tags]      BIOC-ADDMANUALLY-MEASUREMENTS-01       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-MEASUREMENTS-02: Add heart rate screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Heart rate card
    ...     2. Press on the Add manually button
    ...     3. Click on anywhere on the screen
    ...
    ...     Expected Output:
    ...     1. The modal shall appear with the following components:
    ...        - Content: Do you want to connect Biokit?
    ...        - Connect now button
    ...        - Add manually button
    ...     2. Guide: Swipe left/right to adjust (The first time)
    ...     3. Default time are current date and time
    ...        - Default heart rate values:
    ...          + Min: 20 bpm
    ...          + Default: 70 bpm
    ...          + Max: 300 bpm
    ...          + Division: 1
    [Tags]      BIOC-ADDMANUALLY-MEASUREMENTS-02       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-MEASUREMENTS-03: Add manually Heart rate
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Heart rate card
    ...     2. Press on Add manually button, Select time, Select heart rate value.
    ...     3. Press on save or cancel button
    ...
    ...     Expected Output:
    ...     1. Modal will be displayed
    ...     2. Screen will be displayed data on the screen
    ...     3. If users press on save button, heart rate value is saved and navigate to the Home screen.
    ...        If users press on cancel button, heart rate screen will be canceled and closed.
    [Tags]      BIOC-ADDMANUALLY-MEASUREMENTS-03       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-MEASUREMENTS-04: Add Heart rate variability
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Heart rate variability card
    ...     2. Select time, Select heart rate variability value
    ...        - Press on save or cancel button
    ...
    ...     Expected Output:
    ...     1. Default time are current date and time:
    ...         + Min: 20 ms
    ...         + Default: 40 ms
    ...         + Max: 200 ms
    ...         + Division: 1
    ...     2. If users press on save button, heart rate variability value is saved and displayed in heart rate screen
    ...        If users press on cancel button, heart rate variability screen is closed
    [Tags]      BIOC-ADDMANUALLY-MEASUREMENTS-04       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-MEASUREMENTS-05: Add Resting heart rate
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Resting heart rate card
    ...     2. Select time, Select resting heart rate value
    ...        - Press on save or cancel button
    ...
    ...     Expected Output:
    ...     1. Default time are current date and time:
    ...         + Min: 20 bpm
    ...         + Default: 60 bpm
    ...         + Max: 300 bpm
    ...         + Division: 1
    ...     2. If users press on save button, resting heart rate value is saved and displayed in heart rate screen
    ...        If users press on cancel button, resting heart rate screen is closed
    [Tags]      BIOC-ADDMANUALLY-MEASUREMENTS-05       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-MEASUREMENTS-06: Add blood pressure screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Blood pressure card
    ...     2. Press on the Connect now button
    ...     3. Press on cancel button
    ...
    ...     Expected Output:
    ...     1. The modal shall appear with the following components:
    ...        - Content: Do you want to connect Biokit?
    ...        - Connect now button
    ...        - Add manually button
    ...     2. Navigate the user to the Connect to Blood pressure device screen
    ...     3. Blood pressure screen will be closed and navigate to the Add manually screen
    [Tags]      BIOC-ADDMANUALLY-MEASUREMENTS-06       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-MEASUREMENTS-07: Add Blood pressure
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Blood pressure card
    ...     2. Click on Add manually: Select time, Select blood pressure value
    ...     3. Press on save or cancel button
    ...
    ...     Expected Output:
    ...     1. The modal shall be appeared
    ...     2. Default time are current date and time
    ...        - There shall be 2 card: Systolic/Diastolic
    ...        - There shall be 2 scroll pickers to choose the value of the following card.
    ...          - Systolic:
    ...            + Min: 40
    ...            + Max: 300
    ...            + Division: 1
    ...            + Default: 110
    ...          - Diastolic
    ...            + Min: 30
    ...            + Max: 200
    ...            + Division: 1
    ...            + Default: 70
    ...     3. - If users press on Save button, blood pressuer value is saved and displayed in Summary screen
    ...        - If users press on Cancel button, blood pressure screen is closed
    [Tags]      BIOC-ADDMANUALLY-MEASUREMENTS-07       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-MEASUREMENTS-08: Level message display when select Systolic/Diastolic
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Blood pressure card
    ...     2. Click on Add manually
    ...     3. Select [Systolic value]=90 [Diastolic value]=60
    ...     4. Select [Systolic value]=119 [Diastolic value]=79
    ...     5. Select [Systolic value]=89 or [Diastolic value]=59
    ...     6. Select [Systolic value]=120 [Diastolic value]=60
    ...     7. Select [Systolic value]=129 [Diastolic value]=79
    ...     8. Select [Systolic value]=130 [Diastolic value]=80
    ...     9. Select [Systolic value]=139 [Diastolic value]=89
    ...     10. Select [Systolic value]=140 or [Diastolic value]=90
    ...
    ...     Expected Output:
    ...     3. Status: no message
    ...     4. Status: no message
    ...     5. Status: low
    ...     6. Status: Slightly high
    ...     7. Status: Slightly high
    ...     8. Status: High
    ...     9. Status: High
    ...     10. Status: Very high
    [Tags]      BIOC-ADDMANUALLY-MEASUREMENTS-08       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-MEASUREMENTS-09: Add Blood oxygen screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Blood Oxygen card
    ...     2. Press on the Connect now button
    ...     3. Press on cancel button
    ...
    ...     Expected Output:
    ...     1. The modal shall appear with the following components:
    ...        - Content: Do you want to connect Biokit?
    ...        - Connect now button
    ...        - Add manually button
    ...     2. Navigate the user to Connect to Blood Oxygen device screen
    ...     3. Blood Oxygen screen will be closed and navigate to the Add manually screen
    [Tags]      BIOC-ADDMANUALLY-MEASUREMENTS-09       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-MEASUREMENTS-10: Add manually Blood oxygen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Blood oxygen card
    ...     2. Press on the Add manually button: Select time, Select Blood oxygen value
    ...        - Press on save or cancel button
    ...
    ...     Expected Output:
    ...     1. The modal shall be appeared
    ...     2. Default time are current date and time:
    ...         + Max 100
    ...         + Min 60
    ...         + Division 1
    ...         + Default 99
    ...       - If users press on save button, Blood oxygen value is saved and displayed in Summary screen
    ...       - If users press on cancel button, Blood oxygen screen is closed
    [Tags]      BIOC-ADDMANUALLY-MEASUREMENTS-10       BIOC-1.17.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-MEASUREMENTS-11: Level message display when select Blood Oxygen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Blood Oxygen card
    ...     2. Click on Add manually
    ...     3. Select [SpO2 value] >= 95
    ...     4. Select 95 > [SpO2 value] >= 91
    ...     5. Select 91 > [SpO2 value] >= 85
    ...     6. Select 85 < [SpO2 value] >= 80
    ...     7. Select [SpO2 value] < 80
    ...
    ...     Expected Output:
    ...     3. Status: no message
    ...     4. Status: Slightly low
    ...     5. Status: low
    ...     6. Status: Very low
    ...     7. Status: Extremely low
    [Tags]      BIOC-ADDMANUALLY-MEASUREMENTS-11       BIOC-SRS-20-FRS-01-005      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-MEASUREMENTS-12: Add body temperature screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Body temperature card
    ...     2. Press on the Connect now button
    ...     3. Press on cancel button
    ...
    ...     Expected Output:
    ...     1. The modal shall appear with the following components:
    ...        - Content: Do you want to connect Biokit?
    ...        - Connect now button
    ...        - Add manually button
    ...     2. Navigate the user to Connect to Blood Oxygen device screen
    ...     3. Blood Oxygen screen will be closed and navigate to the Add manually screen
    [Tags]      BIOC-ADDMANUALLY-MEASUREMENTS-12       BIOC-SRS-20-FRS-01-006      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-MEASUREMENTS-13: Add body temperature
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Body temperature card
    ...     2. Press on the Add manually button: Select time, Select body temperature value
    ...        - Press on save or cancel button
    ...
    ...     Expected Output:
    ...     1. The modal shall be appeared
    ...     2. Default time are current date and time:
    ...         + Measurement: oF or oC
    ...         + Min: 93 oF (34 oC)
    ...         + Default: 98.6 oF (37 oC)
    ...         + Max: 108 oF (42 oC)
    ...         + Division: 0.1
    ...       - If users press on save button, body temperature value is saved and displayed in Summary screen
    ...       - If users press on cancel button, temperature screen is closed
    [Tags]      BIOC-ADDMANUALLY-MEASUREMENTS-13       BIOC-1.17.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-MEASUREMENTS-14: Level message display when select Body temperature
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Body temperature card
    ...     2. Click on Add manually
    ...     3. Select [Temp value] < 35oC (< 95oF)
    ...     4. Select 35oC <= [Temp value] <= 37.5oC (95oF <= [Temp value] <= 99.5oF)
    ...     5. Select 37.6oC <= [Temp value] <= 41.5oC (99.6oF <= [Temp value] < =106.7oF)
    ...     6. Select [Temp value] > 41.5oC (>106.7oF)
    ...
    ...     Expected Output:
    ...     3. Status: low
    ...     4. Status: no message
    ...     5. Status: High
    ...     6. Status: Very High
    [Tags]      BIOC-ADDMANUALLY-MEASUREMENTS-14       BIOC-SRS-20-FRS-01-006      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-MEASUREMENTS-15: Check default values in add weight screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Weight card
    ...
    ...     Expected Output:
    ...     1. Default time are current date and time
    ...        - Default height and weight value are the value that user selects when completing profile
    ...          + Min: 11 pound - 5 kg
    ...          + Max: 550 pound - 250 kg
    ...          + Division: 0.1
    ...          + Default: Last inputting, in case there is no data: the weight value in the app’s profile.
    ...          + When BMI value is < 18.50, there is message "Underweight"
    ...          + When BMI value is from 18.51 to 24.99, the value is normal and there is no message
    ...          + When BMI value is from 25.0 to 29.99, there is message "Overweight"
    ...          + When BMI value is from 30.0 to 34.99, there is message "Obese I"
    ...          + When BMI value is from 35.0 to 39.99, there is message "Obese II"
    ...          + When BMI value is over 40, there is message "Obese III"
    [Tags]      BIOC-ADDMANUALLY-MEASUREMENTS-15       BIOC-SRS-20-FRS-01-007      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-MEASUREMENTS-16: Add weight
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Weight card: Select time, Select weight value
    ...        - Press on save or cancel button
    ...
    ...     Expected Output:
    ...     1. If users press on save button, weight value is saved and displayed in Summary screen
    ...        - If users press on cancel button, weight screen is closed
    [Tags]      BIOC-ADDMANUALLY-MEASUREMENTS-16       BIOC-1.17.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-MEASUREMENTS-17: Check default values in add sleep screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Sleep card
    ...     2. Select time, Select sleep value
    ...        - Press on save or cancel button
    ...
    ...     Expected Output:
    ...     1. - Bedtime for the first-time:
    ...          + Date: 1 day before the current day
    ...          + Hour: 10:00 PM
    ...        - Wake-up for the first-time:
    ...          + Date: Date: the current day
    ...          + Hour: Hour: 6:30 AM
    ...          + If the user opens the app before 6:30 AM, the default hour shall be the current hour.
    ...        - For later time user add sleep manually, the default time shall be followed these steps:
    ...          + Get the latest sleep data (latest bedtime and latest wake-up time).
    ...          + That latest bedtime and latest wake-up time shall be set to default for today
    ...             * If the latest wake-up time passes the default one, set it to the new default wake-up time and keep the latest bedtime for default.
    ...             * If the latest bedtime passes the default wake-up time, set the new default bedtime is 10:00 yesterday, and keep the default wake-up time
    ...     2. - If users press on save button, sleep value is saved and displayed in Summary screen
    ...        - If users press on cancel button, sleep screen is closed
    [Tags]      BIOC-ADDMANUALLY-MEASUREMENTS-17       BIOC-1.17.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-MEASUREMENTS-18: Add Symptoms screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Symptoms card
    ...
    ...     Expected Output:
    ...     1. Navigates to the add manually Symptoms screen
    ...        - Title: Symptoms
    ...        - Type of symptoms card
    ...          + Default: “-“
    ...          + The scroll list shall be displayed:
    ...            Abnormal bleeding
    ...            Angina or chest discomfort
    ...            Can’t sleep
    ...            Chest pain
    ...            Cough
    ...            Dizziness
    ...            Fainting episodes
    ...            Fatigue
    ...            Fever
    ...            Headache
    ...            Lightheadedness
    ...            Nausea
    ...            Numbness in arm(s) or leg(s)
    ...            Painful uniration
    ...            Palpitations
    ...            Poor appetite
    ...            Poor circulation
    ...            Pressure
    ...            Shortness of breath
    ...            Sore throat
    ...            Sweating
    ...            Stroke
    ...            Other
    ...        - Severity level card
    ...          + Present (Default)
    ...          + Mild
    ...          + Moderate
    ...          + Severe
    ...        - Start time card
    ...          + Default displays the time that is 15 mins before the current time
    ...          + Scroll time-picker. Format: [Mmm] [dd] [yyyy], [hh]:[mm] [AM/PM]
    ...          + The value on the card will depend on the selected time on the time-picker
    ...          + The user can only add data within 365 days from the current date
    ...          + The user can choose anytime on the current date
    ...        - Stop time card, tapping this card
    ...          + Scroll time-picker. Format: [hh]:[mm] [AM/PM]
    ...          + The user shall be able to scroll to choose the time.
    ...          + The card automatically displays the current time.
    ...          + The value on the card will depend on the selected time on the time-picker.
    ...          + Tapping again on the card will close the time-picker.
    ...          + The user can choose anytime on the current date.
    ...        - Add notes section (Optional)
    ...          + Tapping this section shall open the bottomsheet with the following components:
    ...            * Title: Notes
    ...            * Text field. The user can input a maximum of 200 characters.
    ...            * Save button. Tapping this button to save anything in the Notes.
    ...            * X icon button. Tapping this button to close the bottomsheet without saving anything.
    [Tags]      BIOC-ADDMANUALLY-MEASUREMENTS-18     BIOC-1.17.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-MEASUREMENTS-19: Add data manually
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Symptoms card
    ...     2. Select Type, Severity, Start time, Stop time, Add notes
    ...     3. Turn off internet
    ...     4. Turn on internet
    ...     5. Press on Symptoms card
    ...     6. Select Type, Severity, Start time, Stop time, Add notes
    ...     7. Press on Save button
    ...
    ...     Expected Output:
    ...     1. Navigates to the add manually Symptoms screen
    ...     2. This button will be enabled
    ...        - All required fields on this screen have values
    ...        - The Stop time is greater than the Start time
    ...     3. Navigate the user to the Add manually screen and show the snackbar with the content: “No internet connection. Please try again”
    ...     7. All the settings of the user shall be saved and close all bottomsheets
    [Tags]      BIOC-ADDMANUALLY-MEASUREMENTS-19       BIOC-1.17.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-MEASUREMENTS-20: Add steps
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Steps card
    ...     2. Select start time, duration, select steps value
    ...       - Press on save or cancel button
    ...
    ...     Expected Output:
    ...     1. Default time are current date and time
    ...        - Default steps values:
    ...          + Start/Stop time displays the time that is 1 hours before the current time. Format: [Mmm] [dd] [yyyy], [hh]:[mm] [AM/PM]
    ...          + Stop time: Format [hh]:[mm] [AM/PM]
    ...          + Number of steps card
    ...            * Min: 1
    ...            * Max: 20 000
    ...            * Default: 6 000
    ...     2. If users press on save button, steps value is saved and displayed in Summary screen
    ...        - If users press on Cancel button, steps screen is closed
    [Tags]      BIOC-ADDMANUALLY-MEASUREMENTS-20       BIOC-1.17.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-MEASUREMENTS-21: Add walking
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Walking card
    ...     2. Select time, select walking value
    ...        - Press on save or cancel button
    ...
    ...     Expected Output:
    ...     1. Default walking values:
    ...        - Start/stop time displays the time that is 1 hours before the current time: Format: [Mmm] [dd] [yyyy], [hh]:[mm] [AM/PM]
    ...        - Stop time: Format [hh]:[mm] [AM/PM]
    ...        - Distance: 3,1 miles/ 5km (Default)
    ...          + Min: 1
    ...          + Max: 47km 900m/29.9 miles
    ...        - Calories (cals): 360 (Min:1, Max:3000)
    ...     2. If users press on save button, walking value is saved and displayed in Summary screen
    ...        - If users press on cancel button, walking screen is closed
    [Tags]      BIOC-ADDMANUALLY-MEASUREMENTS-21       BIOC-1.17.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-MEASUREMENTS-22: Add running
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Running card
    ...     2. Select time, Select running value
    ...        - Press on save or cancel button
    ...
    ...     Expected Output:
    ...     1. Default running values:
    ...        - Start/Stop time displays the time that is 1 hours before the current time: Format [Mmm] [dd] [yyyy], [hh]:[mm] [AM/PM]
    ...        - Stop time: Format [hh]:[mm] [AM/PM]
    ...        - Distance: 6,2 miles/ 10km (Default)
    ...          + Min: 1
    ...          + Max: 47km 900m/29.9 miles
    ...        - Calories (cals): 650 (Min:1, Max:3000)
    ...     2. If users press on Save button, running value is saved and displayed in Summary screen
    ...        - If users press on cancel button, running screen is closed
    [Tags]      BIOC-ADDMANUALLY-MEASUREMENTS-22       BIOC-1.17.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-GOAL-01: Check default values in sleep goal screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Sleep card
    ...
    ...     Expected Output:
    ...     1. Sleep goal is the value that users set when completing profile
    ...        - If the user does not set the sleep goal value when completing profile, the sleep goal value will be 8 hours 00 minute
    ...        - When Sleep goal less than 7 hours or more than 9 hour, there is a message "Adults need between 7-9 hours of sleep"
    [Tags]      BIOC-ADDMANUALLY-GOAL-01       BIOC-SRS-20-FRS-02-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-GOAL-02: Add goal for sleep
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Sleep card: Select time
    ...     2. Press on save or cancel button
    ...
    ...     Expected Output:
    ...     1. New set goal is save and close sleep goal screen or cancel to set new goal and close sleep goal screen
    ...        - Min: 30m
    ...        - Max: 12h
    ...        - Division: 30m
    ...        - Default: 8, if the user has set a goal earlier, the default value will be the value of the latest set goal.
    ...     2. The goal has been set successfully
    ...        - Content: Set a goal successfully!
    ...        The goal has been set fail
    ...        - Content: Failed to set sleep goal
    [Tags]      BIOC-ADDMANUALLY-GOAL-02       BIOC-SRS-20-FRS-02-003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-GOAL-03: Check default values in steps goal screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Steps card
    ...
    ...     Expected Output:
    ...     1. Steps goal is the value that users set when completing profile
    ...       - If the user doesn't set the steps goal value when completing profile, the steps goal value will be 5000 steps
    ...         + Min: 500 steps
    ...         + Max: 20000 steps
    ...         + Division: 500
    ...         + Default: 5000 if the user has set a goal earlier, the default value will be the value of the latest set goal
    [Tags]      BIOC-ADDMANUALLY-GOAL-03       BIOC-SRS-20-FRS-02-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-GOAL-04: Add goal for steps
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Steps card
    ...        - Select steps value
    ...     2. Press on save or cancel button
    ...
    ...     Expected Output:
    ...     1. New set goal is save and close steps goal screen or cancel to set new goal and close steps goal screen
    ...     2. The goal has been set successfully
    ...        - Content: Set a goal successfully!
    ...        The goal has been set fail
    ...        - Content: Failed to set steps goal
    [Tags]      BIOC-ADDMANUALLY-GOAL-04       BIOC-SRS-20-FRS-02-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-GOAL-05: Check default values in activities goal screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Activities card
    ...
    ...     Expected Output:
    ...     1. Activity goal is the value that users set when completing profile
    ...        - If the user does not set the activities goal value when completing profile, the activities goal value will be 200 cals
    ...          + Min: 100 cals
    ...          + Max: 3000 cals
    ...          + Division: 100
    ...          + Default: 200, if the user has set a goal earlier, the default value will be the value of the latest set goal.
    [Tags]      BIOC-ADDMANUALLY-GOAL-05       BIOC-SRS-20-FRS-02-001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLY-GOAL-06: Add goal for activities
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on Add manually screen
    ...
    ...     Test Steps:
    ...     1. Press on Activities card
    ...        - Select activity value
    ...     2. Press on save or cancel button
    ...
    ...     Expected Output:
    ...     1. New set goal is saved and close activities goal screen or cancel to set new goal and close activities goal screen
    ...     2. The goal has been set successfully
    ...        - Content: Set a goal successfully!
    ...        The goal has been set fail
    ...        - Content: Failed to set activity goal
    [Tags]      BIOC-ADDMANUALLY-GOAL-06       BIOC-SRS-20-FRS-02-001      manual
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
