*** Settings ***
Documentation   Biocare app Add Manually no internet test suite
Metadata    sid     BIOC-ADDMANUALLYNOINTENRET
Metadata    owner   tU Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-ADDMANUALLYNOINTENRET  mapp
Test Timeout    1h

*** Test Cases ***
BIOC-ADDMANUALLYNOINTENRET-01: View Add manually screen (no internet)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - The device has no internet
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
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-01        BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-02: Add manually Heart rate (no internet, no heath program)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...    - The device has no internet
    ...    - The user has no heath program
    ...
    ...     Test Steps:
    ...     1. Press on Heart rate card
    ...     2. Press on Add manually button, Select time, Select heart rate value.
    ...     3. Press on save
    ...
    ...     Expected Output:
    ...     1. Modal will be displayed
    ...     2. Screen will be displayed data on the screen
    ...     3. If the user doesn’t have the program and the device doesn’t have an internet connection, the user can still add data.
    ...        This data will be uploaded to the server when the device reconnects to the internet.
    ...
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-02       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-03: Add manually Heart rate (no internet, heath program)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...    - The device has no internet
    ...    - The user has heath program
    ...
    ...     Test Steps:
    ...     1. Press on Heart rate card
    ...     2. Press on Add manually button, Select time, Select heart rate value.
    ...     3. Press on save
    ...
    ...     Expected Output:
    ...     1. Modal will be displayed
    ...     2. Screen will be displayed data on the screen
    ...     3. If the user has the program and the device doesn’t have an internet connection,
    ...        the app shall navigate the user to the Add manually screen and show the snack bar with the content: “No internet connection” and Settings button.
    ...
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-03       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-04: Add Heart manually rate variability (no internet, no heath program)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...    - The device has no internet
    ...    - The user has heath program
    ...
    ...     Test Steps:
    ...     1. Press on Heart rate variability card
    ...     2. Select time, Select heart rate variability value
    ...     3. Press on save or cancel button
    ...
    ...     Expected Output:
    ...     1. Default time are current date and time:
    ...         + Min: 20 ms
    ...         + Default: 40 ms
    ...         + Max: 200 ms
    ...         + Division: 1
    ...     3. If the user doesn’t have the program and the device doesn’t have an internet connection, the user can still add data.
    ...        This data will be uploaded to the server when the device reconnects to the internet.
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-04       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-05: Add Heart manually rate variability (no internet, no heath program)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...    - The device has no internet
    ...    - The user has no heath program
    ...
    ...     Test Steps:
    ...     1. Press on Heart rate variability card
    ...     2. Select time, Select heart rate variability value
    ...     3. Press on save or cancel button
    ...
    ...     Expected Output:
    ...     1. Default time are current date and time:
    ...         + Min: 20 ms
    ...         + Default: 40 ms
    ...         + Max: 200 ms
    ...         + Division: 1
    ...     3. If the user doesn’t have the program and the device doesn’t have an internet connection, the user can still add data.
    ...        This data will be uploaded to the server when the device reconnects to the internet.
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-05       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-06: Add manually Resting heart rate (no internet, heath program)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...    - The device has no internet
    ...    - The user has heath program
    ...
    ...     Test Steps:
    ...     1. Press on Resting heart rate card
    ...     2. Select time, Select resting heart rate value
    ...     3. Press on save button
    ...
    ...     Expected Output:
    ...     1. Default time are current date and time:
    ...         + Min: 20 bpm
    ...         + Default: 60 bpm
    ...         + Max: 300 bpm
    ...         + Division: 1
    ...     3. If the user has the program and the device doesn’t have an internet connection,
    ...        the app shall navigate the user to the Add manually screen and show the snack bar with the content: “No internet connection” and Settings button
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-06      BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-07: Add manually Resting heart rate (no internet, no heath program)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...    - The device has no internet
    ...    - The user has no heath program
    ...
    ...     Test Steps:
    ...     1. Press on Resting heart rate card
    ...     2. Select time, Select resting heart rate value
    ...     3. Press on save button
    ...
    ...     Expected Output:
    ...     1. Default time are current date and time:
    ...         + Min: 20 bpm
    ...         + Default: 60 bpm
    ...         + Max: 300 bpm
    ...         + Division: 1
    ...     3. If the user doesn’t have the program and the device doesn’t have an internet connection, the user can still add data.
    ...        This data will be uploaded to the server when the device reconnects to the internet.
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-07       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-08: Add manually blood pressure (no internet,no heath program)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...    - The device has no internet
    ...    - The user has heath program
    ...
    ...     Test Steps:
    ...     1. Press on Blood pressure card
    ...     2. Select value Systolic/Diastolic
    ...     3. Press on Save button
    ...
    ...     Expected Output:
    ...     3. If the user doesn’t have the program and the device doesn’t have an internet connection, the user can still add data.
    ...        This data will be uploaded to the server when the device reconnects to the internet
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-08       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-09: Add manually blood pressure (no internet, heath program)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...    - The device has no internet
    ...    - The user has no heath program
    ...
    ...     Test Steps:
    ...     1. Press on Blood pressure card
    ...     2. Select value Systolic/Diastolic
    ...     3. Press on Save button
    ...
    ...     Expected Output:
    ...     3. If the user has the program and the device doesn’t have an internet connection,
    ...        the app shall navigate the user to the Add manually screen and show the snack bar with the content: “No internet connection” and Settings button"
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-09       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-10: Add manually Blood oxygen (no internet, no heath program)
     [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...    - The device has no internet
    ...    - The user has no heath program
    ...
    ...     Test Steps:
    ...     1. Press on Blood Oxygen card
    ...     2. Select value
    ...     3. Press Save button
    ...
    ...     Expected Output:
    ...     3.If the user doesn’t have the program and the device doesn’t have an internet connection, the user can still add data.
    ...        This data will be uploaded to the server when the device reconnects to the internet
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-10       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-11: Add manually Blood oxygen (no internet, heath program)
    [Documentation]     Author: Han Nguyen
    ...
     ...     Pre-condition:
    ...    - The device has no internet
    ...    - The user has heath program
    ...
    ...     Test Steps:
    ...     1. Press on Blood Oxygen card
    ...     2. Select value
    ...     3. Press Save button
    ...
    ...     Expected Output:
    ...      3. If the user has the program and the device doesn’t have an internet connection,
    ...        the app shall navigate the user to the Add manually screen and show the snack bar with the content: “No internet connection” and Settings button"
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-11       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-12: Add manually body temperature screen (no internet, heath program)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...    - The device has no internet
    ...    - The user has heath program
    ...
    ...     Test Steps:
    ...     1. Press on Body temperature card
    ...     2. select Body temperature value
    ...     3. Press on Save button
    ...
    ...     Expected Output:een
    ...     3. If the user has the program and the device doesn’t have an internet connection,
    ...        the app shall navigate the user to the Add manually screen and show the snack bar with the content: “No internet connection” and Settings button"
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-12       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-13: Add manually body temperature screen (no internet, no heath program)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...    - The device has no internet
    ...    - The user has no heath program
    ...
    ...     Test Steps:
    ...     1. Press on Body temperature card
    ...     2. select Body temperature value
    ...     3. Press on Save button
    ...
    ...     Expected Output:een
    ...     3.If the user doesn’t have the program and the device doesn’t have an internet connection, the user can still add data.
    ...        This data will be uploaded to the server when the device reconnects to the internet
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-13       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-14: Add weight ( no internet, heath program)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...    - The device has no internet
    ...    - The user has no heath program
    ...
    ...     Test Steps:
    ...     1. Press on weight card
    ...     2. select weight value
    ...     3. Press on Save button
    ...
    ...     Expected Output:een
    ...       3. If the user has the program and the device doesn’t have an internet connection,
    ...        the app shall navigate the user to the Add manually screen and show the snack bar with the content: “No internet connection” and Settings button"
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-14       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-15: Add weight ( no internet, no heath program)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...    - The device has no internet
    ...    - The user has no heath program
    ...
    ...     Test Steps:
    ...     1. Press on weight card
    ...     2. select weight value
    ...     3. Press on Save button
    ...
    ...     Expected Output:een
    ...     3.If the user doesn’t have the program and the device doesn’t have an internet connection, the user can still add data.
    ...        This data will be uploaded to the server when the device reconnects to the internet
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-15       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-16: Add manually sleep ( no internet, heath program)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...    - The device has no internet
    ...    - The user has no heath program
    ...
    ...     Test Steps:
    ...     1. Press on Sleep card
    ...     2. Select time, Select sleep value
    ...     3. Press on save button
    ...
    ...     Expected Output:
    ...     3. If the user has the program and the device doesn’t have an internet connection,
    ...        the app shall navigate the user to the Add manually screen and show the snack bar with the content: “No internet connection” and Settings button"
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-16      BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-17: Add manually sleep ( no internet, heath program)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...    - The device has no internet
    ...    - The user has heath program
    ...
    ...     Test Steps:
    ...     1. Press on Sleep card
    ...     2. Select time, Select sleep value
    ...     3. Press on save button
    ...
    ...     Expected Output:
    ...        3. If the user has the program and the device doesn’t have an internet connection,
    ...        the app shall navigate the user to the Add manually screen and show the snack bar with the content: “No internet connection” and Settings button"
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-17       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-18: Add manually steps ( no internet,no heath program)
  [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...    - The device has no internet
    ...    - The user has heath program
    ...
    ...     Test Steps:
    ...     1. Press on Steps card
    ...     2. Select start time, duration, select steps value
    ...     3. Press on save button
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
    ...     3.If the user doesn’t have the program and the device doesn’t have an internet connection, the user can still add data.
    ...        This data will be uploaded to the server when the device reconnects to the internet
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-18       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-19: Add manually steps ( no internet, no heath program)
  [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...    - The device has no internet
    ...    - The user has no heath program
    ...
    ...     Test Steps:
    ...     1. Press on Steps card
    ...     2. Select start time, duration, select steps value
    ...     3. Press on save button
    ...
    ...     Expected Output:
    ...     3.If the user doesn’t have the program and the device doesn’t have an internet connection, the user can still add data.
    ...        This data will be uploaded to the server when the device reconnects to the internet
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-19       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-20: Add manually steps ( no internet, heath program)
  [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...    - The device has no internet
    ...    - The user has heath program
    ...
    ...     Test Steps:
    ...     1. Press on Steps card
    ...     2. Select start time, duration, select steps value
    ...     3. Press on save button
    ...
    ...     Expected Output:
    ...     3. If the user has the program and the device doesn’t have an internet connection,
    ...        the app shall navigate the user to the Add manually screen and show the snack bar with the content: “No internet connection” and Settings button"
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-20       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-21: Add manually walking ( no internet, heath program)
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...    - The device has no internet
    ...    - The user has heath program
    ...
    ...
    ...     Test Steps:
    ...     1. Press on Walking card
    ...     2. Select time, select walking value
    ...     3. Press on save button
    ...
    ...     Expected Output:
     ...     3. If the user has the program and the device doesn’t have an internet connection,
    ...        the app shall navigate the user to the Add manually screen and show the snack bar with the content: “No internet connection” and Settings button"
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-21       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-22: Add manually walking ( no internet, no heath program)
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...    - The device has no internet
    ...    - The user has no heath program
    ...
    ...
    ...     Test Steps:
    ...     1. Press on Walking card
    ...     2. Select time, select walking value
    ...     3. Press on save button
    ...
    ...     Expected Output:
    ...     3.If the user doesn’t have the program and the device doesn’t have an internet connection, the user can still add data.
    ...        This data will be uploaded to the server when the device reconnects to the internet
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-22       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-23: Add manually running ( no internet, heath program)
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...    - The device has no internet
    ...    - The user has no heath program
    ...
    ...     Test Steps:
    ...     1. Press on Running card
    ...     2. Select time, Select running value
    ...     3. Press on Save button
    ...
    ...     Expected Output:
    ...     3. If the user has the program and the device doesn’t have an internet connection,
    ...        the app shall navigate the user to the Add manually screen and show the snack bar with the content: “No internet connection” and Settings button"
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-23       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-24: Add manually running ( no internet, no heath program)
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...    - The device has no internet
    ...    - The user has no heath program
    ...
    ...     Test Steps:
    ...     1. Press on Running card
    ...     2. Select time, Select running value
    ...     3. Press on Save button
    ...
    ...     Expected Output:
    ...     3.If the user doesn’t have the program and the device doesn’t have an internet connection, the user can still add data.
    ...        This data will be uploaded to the server when the device reconnects to the internet
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MEASUREMENTS-24      BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-GOAL-01: Add goal for sleep, step (no internet)
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...    - The device has no internet
    ...
    ...     Test Steps:
    ...     1. Press on Sleep/ step card
    ...     2. Press on Add Sleep/ Step goal
    ...     3. Select time
    ...     4. Press on Save button
    ...
    ...     Expected Output:
    ...     4.f there is any unidentified error, the app shall show the snack bar with the content: “Failed to set Sleep/ Step goal” on the Activities goal screen.
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-GOAL-01       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-MYJOURNAL-01:View my journal (no internet)
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...    - The device has no internet
    ...    - The device has heath program
    ...
    ...     Test Steps:
    ...     1. Press on View My Journal
    ...
    ...     Expected Output:
    ...     1.If the device doesn’t have an internet connection when the user taps Add/Edit/Delete icon button on this screen, the app shall show the snack bar with the content: “No internet connection” and Settings button. 
    ...    Tap Settings button, the app shall navigate the user to the phone’s settings. (For Today’s plan section) .
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-MYJOURNAL-01       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-TODAYPLAN-01:View my Today's plan (no internet)
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...    - The device has no internet
    ...    - The device has heath program
    ...
    ...     Test Steps:
    ...     1. View on Today's plan
    ...
    ...     Expected Output:
    ...     1.The user will be able to view today's plan without an internet connection if they open the app and view today's plan before losing the internet connection.
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-TODAYPLAN-01       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-TODAYPLAN-02: Add data measurement (no internet)
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...    - The device has no internet
    ...    - The device has heath program
    ...
    ...     Test Steps:
    ...     1. Press on Add Measurement
    ...     2. Add any data for measurement
    ...
    ...     Expected Output:
    ...     2.If the device doesn’t have an internet connection when the user taps Add/Edit button on this screen,
    ...     the app shall show the snack bar with the content: “No internet connection” and Settings
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-TODAYPLAN-02       BIOC-1.17.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDMANUALLYNOINTENRET-TODAYPLAN-03: Add data Activies Level (no internet)
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...    - The device has no internet
    ...    - The device has heath program
    ...
    ...     Test Steps:
    ...     1. Press on Activity Level
    ...     2. Add any data for Walking/running
    ...
    ...     Expected Output:
    ...     2.If the device doesn’t have an internet connection when the user taps Add/Edit button on this screen,
    ...     the app shall show the snack bar with the content: “No internet connection” and Settings
    [Tags]      BIOC-ADDMANUALLYNOINTENRET-TODAYPLAN-03       BIOC-1.17.0    manual  R1
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
