*** Settings ***
Documentation   Cardiac Patients - Patient details > medical records page test suite
Metadata    sid     BCP-NURSE-PTDET-MEDICAL-RECORDS
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-NURSE-PTDET-MEDICAL-RECORDS     web
Test Timeout    1h

*** Test Cases ***
BCP-NURSE-PTDET-MEDICAL-RECORDS-01: Add general cardiac history
    [Documentation]    Author: Hoang Le
    ...
    ...  Test Steps:
    ...  1. Select yes/no for cardioversion questions
    ...  2. Select yes/no for electrical shock treatments questions
    ...  3. Add current symptoms
    ...  4. Add past medical history
    ...  5. Add medication(s)
    ...  6. Select yes/no for hospitalization questions
    ...  7. Click Add button
    ...  Expected results:
    ...  - The info shall be saved and displayed on Initial intake info section
    ...  - Past medical history shall be synced to Diagnosed conditions section from Baseline info for the first time only
    ...  - Added medication(s) shall be synced to Active medications from Care plan for the first time only
    [Tags]    BCP-NURSE-PTDET-MEDICAL-RECORDS-01    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-MEDICAL-RECORDS-02: Add conditions being monitored
    [Documentation]    Author: Hoang Le
    ...
    ...  Test Steps:
    ...  1. Search and select condition(s) for diagnosed conditions
    ...  2. Search and select condition(s) for at-risk conditions
    ...  3. Click Add
    ...  Expected results:
    ...  - The data shall be saved and displayed on Conditions info
    ...  - The data shall be synced to Diagnosed conditions list from Baseline
    [Tags]    BCP-NURSE-PTDET-MEDICAL-RECORDS-02    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-MEDICAL-RECORDS-03: Add conditions being monitored synced from Baseline
    [Documentation]    Author: Hoang Le
    ...
    ...  Test Steps:
    ...  1. Search and select condition(s) sycned from Baseline for diagnosed conditions
    ...  2. Search and select condition(s) sycned from Baseline for at-risk conditions
    ...  3. Click Add
    ...  Expected results:
    ...  - The data shall be saved and displayed on Conditions info
    ...  - Any updates in this section shall be sycned back to Baseline info
    [Tags]    BCP-NURSE-PTDET-MEDICAL-RECORDS-03    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-MEDICAL-RECORDS-04: Navigate to Add Medication
    [Documentation]    Author: Bao Van
    ...
    ...  Test Steps:
    ...  1. Navigate to the patient’s medication profile.

    ...  Expected results:
    ...  User should be able to see an "Add Medication" button.
    [Tags]    BCP-NURSE-PTDET-MEDICAL-RECORDS-04    manual      BCCA-2.32.0
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-MEDICAL-RECORDS-05: Enter Medication Details
    [Documentation]    Author: Bao Van
    ...
    ...  Test Steps:
    ...  1. In the "Medication Name" field, enter a valid medication (e.g., "Aspirin").
    ...  2. In the "Dosage" field, enter a valid dosage (e.g., "500 mg").

    ...  Expected results:
    ...  2. The system should accept the medication name and dosage without errors.
    [Tags]    BCP-NURSE-PTDET-MEDICAL-RECORDS-05    manual      BCCA-2.32.0     R1
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-MEDICAL-RECORDS-06: Select Frequency
    [Documentation]    Author: Bao Van
    ...
    ...  Test Steps:
    ...  1. Choose the desired frequency option from the following: Daily (Default Option)
    ...  2. Verify that the user can modify or add new time slots within the 5-slot limit.
    ...  3. On Specific Days of the Week: Select the “On Specific Days of the Week” frequency option.
    ...  4. Deselect the default "Monday" and select "Wednesday" and "Friday".
    ...  5. Verify that the user can deselect and select multiple days (Monday, Wednesday, Friday).
    ...  6.  If no days are selected, click "Add". Verify that an error message is displayed stating that "At least one day must be selected".
    ...  7. Select the "At Regular Intervals" option.
    ...  8. Select "Every 2 weeks" and verify that a recurring reminder is created every 14 days starting from the selected start date.
    ...  9. Select the "As Needed" frequency option.

    ...  Expected results:
    ...  1. The system should pre-fill the default time slots (9:00 AM, 12:00 PM, 6:00 PM) for the "Daily" frequency.
    ...  3. The “Specific days” field is displayed, with "Monday" selected by default.
    ...  7. The user should be prompted to select an interval, with the following options: Every 2 weeks (14 days), Every 3 weeks (21 days), Every month (30 days). Every 2 months (60 days), Every 3 months (91 days)
    ...  9. No specific date or time selection is required.
    [Tags]    BCP-NURSE-PTDET-MEDICAL-RECORDS-06    manual      BCCA-2.32.0         R1
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-MEDICAL-RECORDS-07: Add Time Slots
    [Documentation]    Author: Bao Van
    ...
    ...  Test Steps:
    ...  1. For the selected frequency, verify that the default time slots are displayed. Example:
    ...         For "Daily": 9:00 AM, 12:00 PM, 6:00 PM.
    ...         For "Specific Days of the Week" or "Specific Days of the Month": 9:00 AM.
    ...  2. Click the "Add" button to add a new time slot.
    ...  3. Add up to 5 time slots. Once 5 slots are reached, the "Add" button should be disabled.
    ...  4. Edit a time slot to a new 15-minute interval (e.g., change 9:00 AM to 9:15 AM)..

    ...  Expected results:
    ...  2. The next available time slot should be added automatically from the predefined list (e.g., 9:00 AM, 12:00 PM, 3:00 PM, 6:00 PM, 9:00 PM).
    ...  4. The system should sort time slots chronologically, and the system should not allow duplicate time slots. An error message should appear if duplicates are added.
    [Tags]    BCP-NURSE-PTDET-MEDICAL-RECORDS-07    manual      BCCA-2.32.0         R1
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-MEDICAL-RECORDS-08: Select Start Date
    [Documentation]    Author: Bao Van
    ...
    ...  Test Steps:
    ...  1. In the “Start Date” field, select a valid date using the date picker.
    ...  2. Verify that the user cannot select a past date, and an error message is displayed if an invalid date is selected.
    ...  Expected results:
    ...  The current date should be pre-filled by default, and only future dates should be selectable.
    [Tags]    BCP-NURSE-PTDET-MEDICAL-RECORDS-08    manual      BCCA-2.32.0     R2
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-MEDICAL-RECORDS-09: Set Duration (Optional)
    [Documentation]    Author: Bao Van
    ...
    ...  Test Steps:
    ...  1. In the “Duration” field, enter an optional duration for the medication (e.g., 2 weeks).
    ...  2. The user can specify the duration unit as day(s), week(s), or month(s).
    ...  Expected results:
    ...  The duration field should accept only integer values. The system should calculate the end date based on the start date and duration entered. If the duration is filled, the system should automatically archive the medication after the end date.
    [Tags]    BCP-NURSE-PTDET-MEDICAL-RECORDS-09    manual      BCCA-2.32.0     R2
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-MEDICAL-RECORDS-10: Save the Medication
    [Documentation]    Author: Bao Van
    ...
    ...  Test Steps:
    ...  1. Click on the “Save” or “Add” button to save the medication.
    ...  2. Verify that the medication appears in the patient's medication history with all correct details (medication name, dosage, frequency, time slots, start date, and duration).
    ...  Expected results:
    ...  The system should display a success message (e.g., "Medication added successfully").
    [Tags]    BCP-NURSE-PTDET-MEDICAL-RECORDS-10    manual      BCCA-2.32.0     R2
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

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
