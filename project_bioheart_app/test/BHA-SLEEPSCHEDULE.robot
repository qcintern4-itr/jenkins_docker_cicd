*** Settings ***
Documentation   Bioheart app Sleep Schedule test suite
Metadata    sid     BHA-SLEEPSCHEDULE
Metadata    owner   Linh Tran
Library     corelib/AssertionExtension.py

Force Tags      BHA-SLEEPSCHEDULE     mapp
Test Timeout    1h

*** Test Cases ***
BHA-SLEEPSCHEDULE-01: View Sleep schedule bottom sheet
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is signed in app and opened app in the 1st time
    ...
    ...     Test Steps:
    ...    - Open the app
    ...
    ...     Expected Output:
    ...    - The app is opened
    ...    - The sleep schedule shall automatically set
    ...         + Bedtime: 10:00 PM
    ...         + Wake-up time: 6:30 AM
    ...         + Reminder: before 15 minutes
    ...    - There shall be a Change schedule button. If the user taps on this button, the app shall navigate to the Sleep schedule screen for editing the schedule.
    ...    - There shall be an X button to close the bottom sheet.
    ...    - There shall be an Done button to close the bottom sheet
    [Tags]     BHA-SLEEPSCHEDULE-01     BIOH-SRS-11-FRS-01-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#BHA-SLEEPSCHEDULE-02: View Sleep schedule card
#    [Documentation]     Author: Linh Tran
#    ...
#    ...     Pre-condition:
#    ...     - The user is signed in app
#    ...
#    ...     Test Steps:
#    ...    - Open the app
#    ...
#    ...     Expected Output:
#    ...    - The app is opened
#    ...    - There shall be a sleep schedule card in the Summary screen. This card will contain this information.
#    ...         + Bedtime
#    ...         + Wake up time
#    ...         + Reminder
#    ...     - The information will be updated based on the user’s schedule.
#    ...     - There shall be a Change button. If the user taps on this button, the app shall navigate to the Sleep schedule screen for editing the schedule
#    [Tags]     BHA-SLEEPSCHEDULE-02     BIOH-SRS-11-FRS-01-002     manual
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#
#BHA-SLEEPSCHEDULE-03: View sleep schedule
#    [Documentation]     Author: Linh Tran
#    ...
#    ...     Pre-condition:
#    ...     - The user is signed in app
#    ...
#    ...     Test Steps:
#    ...    - Press on Change button in Sleep schedule card
#    ...
#    ...     Expected Output:
#    ...    - Navigate Sleep schedule screen
#    ...    - User can change bedtime and wakeuo time
#    ...    - User can change reminder time and set pushing notification by turning on/off the toggle
#    ...    - User can navigate back to previous screen by pressing on back button
#    [Tags]     BHA-SLEEPSCHEDULE-03     manual
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#
#BHA-SLEEPSCHEDULE-04: Edit sleep schedule
#    [Documentation]     Author: Linh Tran
#    ...
#    ...     Pre-condition:
#    ...     - The user is signed in app
#    ...     - The user is in Sleep Schedule screen
#    ...
#    ...     Test Steps:
#    ...    - Change bedtime, wake-up time and set reminder time
#    ...
#    ...     Expected Output:
#    ...    - The user can change their bedtime and wake-up time by tapping on the corresponding fields
#    ...         + A bottom sheet with a time-picker is displayed for the user to select their bedtime and wake-up time.
#    ...         + The bottom sheet has two buttons, "Cancel" and "Select", allowing the user to either cancel or confirm their selection.
#    ...         + The schedule can not have the same bedtime and wake-up time. If this happens, the Select button shall be disabled.
#    ...         + The sleep duration (the range between bedtime and wakeup time) can not reach out 24h
#    ...    - The user has the option to receive reminders as push notifications or not, using a toggle switch
#    ...         + If the user chooses to receive reminders, they can select the time of the reminder from the following options
#    ...             * at bedtime
#    ...             * 15 minutes before bedtime
#    ...             * 30 minutes before bedtime
#    ...             * 1 hour before bedtime
#    ...    - Any change of the Schedule shall be applied for the next day.
#    ...    - There shall be a Save button at the bottom of the screen
#    ...         + This button shall be disabled until the user makes any change.
#    ...         + This button shall be disabled if the new schedule overlaps the old one
#    ...    - If the user presses the Save button, the app shall navigate to the Summary screen
#    ...         + If there is any error that the sleep schedule can not be saved, there shall be a pop-up with the message: “Something went wrong. Sleep schedule can not be saved. Please try again.”. Close button to close the pop-up
#    ...    - The HR data recorded in the sleep duration will be labeled
#    [Tags]     BHA-SLEEPSCHEDULE-04     BIOH-SRS-11-FRS-01-004     manual
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#
#BHA-SLEEPSCHEDULE-05: Sleep schedule on HR chart
#    [Documentation]     Author: Linh Tran
#    ...
#    ...     Pre-condition:
#    ...     - The user is signed in app
#    ...
#    ...     Test Steps:
#    ...    - Press on HR chart
#    ...    - Slect Day tab
#    ...
#    ...     Expected Output:
#    ...    - On the HR day chart, there shall be a Sleep schedule button to turn on/off the sleep schedule mode on the chart.
#    ...    - When turning on the sleep schedule mode, there shall be a highlight. This highlight will represent the user’s sleep duration based on the sleep schedule that has been set before has been detected
#    ...         + There shall be a start line and an end line representing the bedtime and the wake-up time.
#    ...         + The bedtime and wake-up time shall be displayed below the highlight.
#    ...         + When the user edits the sleep duration in the Good morning bottom sheet, the sleep duration of the following day shall be edited
#    [Tags]     BHA-SLEEPSCHEDULE-05     BIOH-SRS-11-FRS-02-001     manual
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}