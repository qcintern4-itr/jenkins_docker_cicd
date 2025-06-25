*** Settings ***
Documentation   Biocare app Medication test suite
Metadata    sid     BIOC-MEDICATION
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-MEDICATION       mapp
Test Timeout    1h

*** Test Cases ***
BIOC-MEDICATION-01: View Add medication screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is in Home screen
    ...     - The user has not added medication and has not set reminder
    ...     - The user has not started CP or the CP has started but has not added prescribed medication
    ...
    ...     Test Steps:
    ...     1. Press on Medications card
    ...     2. Press on Set up now button
    ...     3. Search and select medication name
    ...     4. Select amount/unit/appearance
    ...     5. Press on Close button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Medications screen
    ...        - Title: Set up medication
    ...        - Content:
    ...          + Step 1: Add a medication
    ...          + Step 2: Set a schedule and turn on the reminder
    ...        - Set up now button
    ...     2. Navigate to the Add a medication screen
    ...        - Question: What medication will you take?
    ...        - Textbox to search medication name
    ...     3. Medication name will be displayed
    ...        - Medication’s name
    ...        - Dosage: there shall be +/- buttons to increase/decrease the number of medication
    ...          + Min: 1
    ...          + Max: 100
    ...          + Default: 1
    ...        - The unit list:
    ...          + Spoon(s)
    ...          + Cap(s)
    ...          + Drop(s)
    ...          + Application(s)
    ...          + Patch(es)
    ...          + Spray(s)
    ...          + Puff(s)
    ...          + Suppository(ies)
    ...          + Pill(s)
    ...          + Packet(s)
    ...          + Injection(s)
    ...          + Gram(s)
    ...          + Miligram(s)
    ...          + Mililiter(s)
    ...          + Unit(s)
    ...          + Piece(s)
    ...        - Note: this shall be a text input field. Maximum 200 characters.
    ...        - Question: Do you want to set reminder?
    ...        - Set button
    ...        - Done button
    ...        - Close button
    ...     5. Close the bottom sheet and back to the Add a madication screen.
    [Tags]      BIOC-MEDICATION-01          BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-02: Add Medication not match
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is in Home screen
    ...     - The user has medication but does not have a reminder
    ...     - The user has not started careplan or the careplan has started but has not added prescribed medication
    ...
    ...     Test Steps:
    ...     1. Press on Medications card
    ...     2. Press on Set up now button
    ...     3. Search invalid medication name
    ...     4. Press on the name
    ...
    ...     Expected Output:
    ...     3. Suggestion shall display: Use “name of medication” anyway
    ...     4. Bottom sheet shall displayed to edit details
    [Tags]      BIOC-MEDICATION-02       BIOC-1.20.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-03: Add a reminder to medication
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is in Add medication screen
    ...     - The user has not set reminder
    ...     - The user has not started CP or the CP has started but has not added prescribed medication
    ...
    ...     Test Steps:
    ...     1. Search and select medication name
    ...     2. Press on Set button
    ...     3. Press on Add a time button
    ...     4. Press on Add more button
    ...     5. Press on Done button
    ...     6. Press on Done button
    ...
    ...     Expected Output:
    ...     2. Navigate to the Set reminder screen
    ...        - Question: How often do you take dose?
    ...        - Frequency: Everyday (Default)
    ...        - Time to take
    ...        - Add a time + button
    ...     3. The default value shall be 9:00 AM
    ...        - Add more button
    ...     4. 2 time cards, the default value shall be 9:00 AM and 12:00 PM
    ...        3 time cards, the default value shall be 9:00 AM, 12:00 PM and 6:00 PM
    ...        4 time cards, the default value shall be 9:00 AM, 12:00 PM, 3:00 PM and 6:00 PM
    ...        5 time cards, the default value shall be 9:00 AM, 12:00 PM, 3:00 PM ,6:00 PM, and 9:00 PM
    ...      - The Add more button will be disabled if there are 5 time to take
    ...     5. Save the reminder and navigate the user to the previous screen
    ...        - 5 cards display on screen
    ...        - Enable Reminder notification button
    ...     6. There shall be a modal and save medication
    ...        - Title: Medication added successfully!
    ...        - Message: Now you can view it inside the Categories tab
    ...        - Okay button: Navigate to the Categories tab
    ...        - Continue to add button: Navigate to the Add a medication screen
    [Tags]      BIOC-MEDICATION-03          BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-SCHEDULE-01: View the Schedule tab (No schedule)
    [Documentation]     Author: Han Ngyen
    ...
    ...     Pre-condition:
    ...     - The user is in Home screen
    ...     - The user has not set schedule
    ...     - The user has not started CP or the CP has started but has not added prescribed medication
    ...
    ...     Test Steps:
    ...     1. Press on Medications card
    ...     2. Viasully Schedule tab
    ...     3. Press on Back button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Medications screen
    ...        - Schedule tab (Default)
    ...        - Categories tab
    ...     2. Calendar will display the current week (Monday-Sunday) and the present day shall highlight
    ...        Format: Today, Month DD
    ...        Message "No medication schedule" when there is no medication schedule
    ...     3. Navigate back previous screen by pressing on back icon button
    [Tags]      BIOC-MEDICATION-SCHEDULE-01       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-SCHEDULE-02: View the Schedule tab
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Home screen
    ...     - The user has set schedule
    ...     - The user has not started CP or the CP has started but has not added prescribed medication
    ...
    ...     Test Steps:
    ...     1. Press on Medications card
    ...     2. Viasully Schedule tab
    ...     3. Press on Medication name button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Medications screen
    ...     2. Navigate to the Schedule tab
    ...        - There shall be a list of reminders sorted by take time, each reminder card shall display:
    ...          + Name of medication
    ...          + Dosage and Unit
    ...          + Appearance
    ...          + Note icon if the medication has a note
    ...          + Program icon if the medication is from the program
    ...          + Alert icon if the medication has an allergic
    ...        - Medications that have the same take time will be grouped into 1 time to take
    ...        - Time will be sorted by the timeline of a day, from 0:00 to 23:59
    ...        - If all reminder on that day is logged, there shall be a message: All medication logged
    ...        - Taken/Skipped medication will be moved to the bottom of the screen
    ...        - Taken list will be sorted by taken time
    ...        - Skipped list will be sorted by the taken time
    ...        - The medication shall only display in the schedule tab since the schedule of that medication has been set
    [Tags]      BIOC-MEDICATION-SCHEDULE-02       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-SCHEDULE-03: Taken schedule medication
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Schedule tab
    ...
    ...     Test Steps:
    ...     1. Press on schedule medication that user wants to take or skip
    ...     2. Press on Taken All button
    ...     3. Press on Done button
    ...
    ...     Expected Output:
    ...     2. Mark all medication as Taken
    ...        - On each card, there shall be these sections:
    ...          + Name of medication
    ...          + Dosage and Unit
    ...          + Appearance of the medication
    ...          + Note if this medication has a note
    ...          + Edit button
    ...          + Program icon if the medication is from the program
    ...          + Allergic tag if the medication has an allergic
    ...          + Taken and Skipped button, the user can press to choose 1, and the user can switch
    ...     3. All medications are marked as taken and close medication popup
    [Tags]      BIOC-MEDICATION-SCHEDULE-03        BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-SCHEDULE-04: Skipped schedule medication
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Schedule tab
    ...
    ...     Test Steps:
    ...     1. Press on schedule medication that user wants to take or skip
    ...     2. Press on Taken All button
    ...     3. Press on Skipped button
    ...     4. Press on Done button
    ...
    ...     Expected Output:
    ...     2. Mark all medication as Taken
    ...     3. Switch to Skipped
    ...     4. The medication is marked as Skipped and close medication popup
    [Tags]      BIOC-MEDICATION-SCHEDULE-04        BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-SCHEDULE-05: Cancel to take or skip schedule medication
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Schedule tab
    ...
    ...     Test Steps:
    ...     1. Press on schedule medication that user wants to take or skip
    ...     2. Press on Taken All/ Skipped or Taken button
    ...     3. Press on Close button
    ...
    ...     Expected Output:
    ...     3. Cancel to mark as taken or skipped medication and close medication popup
    [Tags]      BIOC-MEDICATION-SCHEDULE-05        BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-SCHEDULE-06: Edit dose
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Schedule tab
    ...
    ...     Test Steps:
    ...     1. Press on schedule medication that user wants to take or skip
    ...     2. Press on Edit button
    ...     3. Edit dose and taken time
    ...     4. Press on Save or Back button
    ...
    ...     Expected Output:
    ...     2. Edit dose screen
    ...     3. - If users press on save button, dose is updated and edit dose screen is closed
    ...        - If users press on back button, dose is not saved and edit edit dose screen is closed
    [Tags]      BIOC-MEDICATION-SCHEDULE-06        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-SCHEDULE-07: Copy medication list
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Schedule tab
    ...
    ...     Test Steps:
    ...     1. Press on schedule medication that user wants to take or skip
    ...     2. Press on Copy icon
    ...
    ...     Expected Output:
    ...     3. Medication list is Copied to clipboard, and user can paste them into input field
    [Tags]      BIOC-MEDICATION-SCHEDULE-07       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-SCHEDULE-08: View medications screen when don't have schedule
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Summary tab
    ...     - User added medications on app
    ...
    ...     Test Steps:
    ...     1. Press on Medications tab
    ...
    ...     Expected Output:
    ...     1. Navigate to the Medications screen. Popup will displays
    ...        - Title: Set schedule reminder
    ...        - Content:
    ...          + Step 1: Add a medication or Select a medication in the Categories tab.
    ...          + Step 2: Set a schedule and turn on the reminder.
    ...        - Okay button
    [Tags]      BIOC-MEDICATION-SCHEDULE-08      BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-CATEGORIES-01: View Categories tab
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is in Home screen
    ...
    ...     Test Steps:
    ...     1. Press on Medications card
    ...     2. Press on Categories tab
    ...     3. Add new medication
    ...     4. Press on Back button
    ...
    ...     Expected Output:
    ...     2. Navigate to the Categories tab
    ...        - Message "No medication" when there is no medication
    ...     3. Program medications list
    ...        - Active medications list
    ...        - Inactive medication list
    ...        Scheduled medications list
    ...        Your medications list
    ...     - User can add medication by pressing on + button
    ...     - User can set or edit reminder for medication by pressing on any medication that user wants
    ...     4. Navigate back previous screen
    [Tags]      BIOC-MEDICATION-CATEGORIES-01      BIOC-1.17.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-CATEGORIES-02: Delete medications
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Categories tab
    ...
    ...     Test Steps:
    ...     1. Select any medication that users want to delete and swipe to left
    ...     2. Press on Delete icon
    ...     3. Press on Delete button
    ...
    ...     Expected Output:
    ...     1. Modal:
    ...        - Title: Delete medication
    ...        - Content: Are you sure you want to delete this medication?
    ...        - Delete button
    ...        - Cancel button
    ...     2. Medication is deleted and disappreared from categories medication and schedule medication for future dates
    [Tags]      BIOC-MEDICATION-CATEGORIES-02      BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-CATEGORIES-03: Edit reminder notification (Active program medications)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Categories tab
    ...
    ...     Test Steps:
    ...     1. Press on any medication on program medications list
    ...     2. Turn on/off reminder medication toggle
    ...     3. Press on Save or Cancel button
    ...
    ...     Expected Output:
    ...     3. If users press on Save button, new updates are saved and medication popup is closed
    ...        If users press on Cancel button, new updates are not saved and medication popup is closed
    [Tags]      BIOC-MEDICATION-CATEGORIES-03      BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-CATEGORIES-04: Edit detail for scheduled medication
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Categories tab
    ...
    ...     Test Steps:
    ...     1. Press on any medication on Schedule medication list
    ...     2. Edit amount/ unit/ appearance
    ...     3. Edit notes
    ...     4. Press on Save and Cancel button
    ...
    ...     Expected Output:
    ...     4. If users press on save button, new updates are saved and medication popup is closed
    ...        If users press on cancel button, new updates are not saved and medication popup is closed
    [Tags]      BIOC-MEDICATION-CATEGORIES-04      BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-CATEGORIES-05: Other medication for user stop program
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Categories tab
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - If the user adds Other medication in Cardiac while running the program, the Othes medication shall be stored in the Schedule section
    ...     - If the user stops the program in Cardiac, the Others medication shall still be stored in the schedule section
    ...     - If the clinic stops the program, the prescribed medication shall
    ...         + If the user has logged at least 1 time on the stop program event day, the app shall apply it on the next day
    ...         + If the user has not logged medication on the stop program event day, the app shall apply it immediately
    [Tags]      BIOC-MEDICATION-CATEGORIES-05      BIOC-1.22.0  manual  R1
    manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-ENDUSERCASES-01: Add and take other medication when there is no program
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is sign in app
    ...
    ...     Test Steps:
    ...     1. Go to Medication tab
    ...     2. Add/Taken/Taken all/Skip medication
    ...
    ...     Expected Output:
    ...     2. Add/Taken/Taken all/Skip medication successfully
    [Tags]      BIOC-MEDICATION-ENDUSERCASES-01      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-ENDUSERCASES-02: Add and take other medication when there is program but has not started
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is sign in app
    ...
    ...     Test Steps:
    ...     1. Go to Cardiac portal, create but not start a program
    ...     2. Go to Medication tab in Biocare app
    ...     3. Add/Taken/Taken all/Skip medication
    ...
    ...     Expected Output:
    ...     3. Add/Taken/Taken all/Skip medication successfully
    [Tags]      BIOC-MEDICATION-ENDUSERCASES-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-ENDUSERCASES-03: Edit unit of medication before click taken
    [Documentation]     Author: Tu nguyen
    ...
    ...     Pre-condition:
    ...     1. Press on the medical
    ...     2. Add the medical
    ...     3. Add the Reminder
    ...     4. Click Save button
    ...
    ...     Test step
    ...     1. Choose the medication
    ...     2. Change unit of the medication
    ...     3. Click Taken or skipped
    ...     4. cLick Done button
    ...
    ...     Expected Output:
    ...     The unit of medication is updated now after change and click taken and skipped
    [Tags]      BIOC-MEDICATION-ENDUSERCASES-03    BIOC-1.17.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-ENDUSERCASES-04: Add reminder before logging the medication
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Press on the medical
    ...     2. Add the medical
    ...     3. Don't log the medication
    ...
    ...     Test step
    ...     1. Add the medication
    ...     2. Click save button
    ...     3. Check reminder today
    ...     4. Check reminder the next day
    ...
    ...
    ...     Expected Output:
    ...     The reminder of medication  shall be displayed Today and on the next day
    [Tags]      BIOC-MEDICATION-ENDUSERCASES-04    BIOC-1.20.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-ENDUSERCASES-05: Add reminder after logging the medication
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Press on the medical
    ...     2. Add the medical
    ...     3. Log the medication
    ...
    ...     Test step
    ...     1. Add the medication
    ...     2. Click save button
    ...     3. Check reminder today
    ...     4. Check reminder the next day
    ...
    ...
    ...     Expected Output:
    ...     The reminder of medication  shall be displayed on the next day
    [Tags]      BIOC-MEDICATION-ENDUSERCASES-05    BIOC-1.20.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-ENDUSERCASES-06: Add medication hasn't unit
    [Documentation]     Author: Tu Nguyen
    ...
    ...
    ...     Test step
    ...     1. Add the medication
    ...     2. don't select unit
    ...     3. Click save button
    ...     4. Check reminder today
    ...
    ...
    ...     Expected Output:
    ...     The medication doesn't display on the next day
    [Tags]      BIOC-MEDICATION-ENDUSERCASES-06    BIOC-1.20.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}    

BIOC-MEDICATION-ENDUSERCASES-07: Add medication hasn't frequency
    [Documentation]     Author: Tu Nguyen
    ...
    ...
    ...     Test step
    ...     1. Add the medication
    ...     2. don't select unit
    ...     3. Click save button
    ...     4. Check reminder today
    ...
    ...
    ...     Expected Output:
    ...     The medication doesn't display
    [Tags]      BIOC-MEDICATION-ENDUSERCASES-07    BIOC-1.20.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-ENDUSERCASES-08: Add medication on the portal hasn't frequency when account on the app linked program
    [Documentation]     Author: Tu Nguyen
    ...   Pre-condition:
    ...     1. Press on the medical
    ...     2. Add the medical
    ...     3. Log the medication
    ...
    ...     Test step
    ...     1. Log in the app
    ...     2. Linked the program 
    ...     3. Click medication
    ...     4. Check the added medication on the categories tab
    ...     5. Check the added medication on the schedule tab
    ...
    ...     Expected Output:
    ...     The medication doesn't display
    [Tags]      BIOC-MEDICATION-ENDUSERCASES-08    BIOC-1.20.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-ENDUSERCASES-09: Add medication on the portal hasn't dosage when account on the app linked program
    [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. log in the portal
    ...     2. Click the medical record tab
    ...     3. Select the medical
    ...     4. Add the medical
    ...     5. Don't input the dosage
    ...     6. Select frequency
    ...     7. Click save button
    ...     8. Click save Change
    ...
    ...     Test step
    ...     1. Log in the app
    ...     2. Linked the program
    ...     3. Click medication
    ...     4. Check the added medication on the categories tab
    ...     5. Check the added medication on the schedule tab
    ...
    ...     Expected Output:
    ...     The medication doesn't display
    [Tags]      BIOC-MEDICATION-ENDUSERCASES-09    BIOC-1.20.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-DELETE-01: Delete the medication on the app before log the medication
    [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Press on the medical
    ...     2. Add the medical
    ...     3. Select the dosage
    ...     4. Select the frequency
    ...     5. Click Save button
    ...     3. Don't Log the medication
    ...
    ...     Test step
    ...     1. Delete the medication
    ...     3. Check the added medication on the schedule tab
    ...
    ...     Expected Output:
    ...     The medication doesn't display Today and on the past if user doesn't log the medication
    [Tags]      BIOC-MEDICATION-DELETE-01    BIOC-1.20.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-DELETE-02: Delete the medication on the app after log the medication
    [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Press on the medical
    ...     2. Add the medical
    ...     3. Select the dosage
    ...     4. Select the frequency
    ...     5. Click Save button
    ...     6. Log the medication
    ...
    ...     Test step
    ...     1. Delete the medication
    ...     2. Check the added medication on the schedule tab
    ...
    ...     Expected Output:
    ...     The medication shall be displayed Today and on the past if user log the medication
    [Tags]      BIOC-MEDICATION-DELETE-02    BIOC-1.20.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BIOC-MEDICATION-DELETE-03: Delete the medication on the portal after log the medication
    [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the portal
    ...     2. Press on the medical
    ...     3. Add the medical
    ...     4. Select the dosage
    ...     5. Select the frequency
    ...     6. Click Save button
    ...     7. Click Edit the medication
    ...     8. select the medication
    ...     8. Click the Archive
    ...     9. Click Save button
    ...
    ...     Test step 
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Log the any medication
    ...     4. Log in the portal 
    ...     5. CLick the medication on the Inactive medication
    ...     6. Click the Delete
    ...     7. Log in the app
    ...     8. Click the medication
    ...     9. Check the added medication on the schedule tab
    ...
    ...     Expected Output:
    ...     The medication shall be displayed Today and on the past if user log the medication
    [Tags]      BIOC-MEDICATION-DELETE-03    BIOC-1.20.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BIOC-MEDICATION-DELETE-04: Delete the medication on the portal after don't log the medication
    [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the portal
    ...     2. Press on the medical
    ...     3. Add the medical
    ...     4. Select the dosage
    ...     5. Select the frequency
    ...     6. Click Save button
    ...     7. Click Edit the medication
    ...     8. select the medication
    ...     8. Click the Archive
    ...     9. Click Save button
    ...
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Don't Log the any medication
    ...     4. Log in the portal
    ...     5. CLick the medication on the Inactive medication
    ...     6. Click the Delete
    ...     7. Log in the app
    ...     8. Click the medication
    ...     9. Check the added medication on the schedule tab
    ...
    ...     Expected Output:
    ...     The medication doesn't display Today and on the past if user doesn't log the medication
    [Tags]      BIOC-MEDICATION-DELETE-04    BIOC-1.20.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-FREQUENCY-01: Verify the log medication when change the frequency from As needed -> daily
        [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is As needed 
    ...     8. Click Save button
    ...     9. Click the Schedule
    ...     10. Taken the as needed medication
    ...    
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from needed -> daily
    ...     7. Click Save button
    ...
    ...     Expected Output:
    ...     The medication will be changed from As needed to daily starting the current day  day and in the future if the start date is not changed.
    ...     The logged as needed medication will be kept intact.
    [Tags]      BIOC-MEDICATION-FREQUENCY-01    BIOC-2.1.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-FREQUENCY-02: Verify the log medication when change the frequency from as needed -> at interval regular
        [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is As needed 
    ...     8. Click Save button
    ...     9. Taken the medication
    ...    
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from needed -> at interval regular
    ...     7. Click Save button
    ...
    ...     Expected Output:
    ...     The medication will be changed from As needed to at interval regular starting the current day and in the future if the start date is not changed.
    ...     The logged as needed medication will be kept intact.
    [Tags]      BIOC-MEDICATION-FREQUENCY-02   BIOC-2.1.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-FREQUENCY-03: Verify the log medication when change the frequency from daily -> as needed  
        [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is daily 
    ...     8. Choose the time reminder
    ...     9. Choose start date
    ...     10. Click Save button
    ...     11. Taken the medication
    ...
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from daily -> As needed
    ...     7. Click Save button
    ...
    ...     Expected Output:
    ...     The medication will be changed from daily to As needed  starting the current day and in the future if the start date is not changed.
    ...     The logged as daily medication will be kept intact.
    [Tags]      BIOC-MEDICATION-FREQUENCY-03    BIOC-2.1.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-FREQUENCY-04: Verify the log medication when change the frequency from as needed -> specific day
        [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is As needed
    ...     8. Click Save button
    ...
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from needed -> specific day
    ...     7. Chose any day on the weekend (ex: Monday, Sunday,..)
    ...     7. Click Save button
    ...     12. Taken the medication
    ...
    ...     Expected Output:
    ...     The medication will be changed from As needed to at specific day starting the current day and in the future if the start date is not changed.
    ...     The logged as needed medication will be kept intact.
    [Tags]      BIOC-MEDICATION-FREQUENCY-04    BIOC-2.1.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-FREQUENCY-05: Verify the log medication when change the frequency from daily -> interval regular
        [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is daily
    ...     8. Choose the time reminder
    ...     9. Choose start date
    ...     10. Click Save button
    ...     12. Taken the medication
    ...
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from daily -> interval regular
    ...     7. Choose time for medication ( ex: 2 weeks, 3 weeks,..)
    ...     7. Click Save button
    ...
    ...     Expected Output:
    ...     The medication will be changed from daily to interval regular  starting the current day and in the future if the start date is not changed.
    ...     The logged as daily medication will be kept intact.
    [Tags]      BIOC-MEDICATION-FREQUENCY-05    BIOC-2.1.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-FREQUENCY-06: Verify the log medication when change the frequency from daily -> specific day
        [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is daily
    ...     8. Choose the time reminder
    ...     9. Choose start date
    ...     10. Click Save button
    ...     12. Taken the medication
    ...
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from daily -> specific day
    ...     7. Choose time for medication ( ex: monday, sunday,..)
    ...     7. Click Save button
    ...
    ...     Expected Output:
    ...     The medication will be changed from daily to specific day starting the current day and in the future if the start date is not changed.
    ...     The logged as daily medication will be kept intact.
    [Tags]      BIOC-MEDICATION-FREQUENCY-06    BIOC-2.1.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-FREQUENCY-07: Verify the log medication when change the frequency from interval regular -> Daily
        [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is interval regular
    ...     8. Choose the time ( ex: 2 weeks, 3 weeks)
    ...     9. Set the time
    ...     10. Choose start date
    ...     11. Click Save button
    ...
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from interval regular -> Daily
    ...     7. Click Save button
    ...     12. Taken the medication
    ...
    ...     Expected Output:
    ...     The medication will be changed from interval regular to daily  starting the current day and in the future if the start date is not changed.
    ...     The logged as daily medication will be kept intact.
    [Tags]      BIOC-MEDICATION-FREQUENCY-07    BIOC-2.1.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-FREQUENCY-08: Verify the log medication when change the frequency from interval regular -> As needed
        [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is interval regular
    ...     8. Choose the time ( ex: 2 weeks, 3 weeks)
    ...     9. Set the time
    ...     10. Choose start date
    ...     11. Click Save button
    ...     12. Taken the medication
    ...
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from interval regular -> As needed
    ...     7. Click Save button
    ...
    ...     Expected Output:
    ...     The medication will be changed from interval regular to as needed starting the current day and in the future if the start date is not changed.
    ...     The logged as daily medication will be kept intact.
    [Tags]      BIOC-MEDICATION-FREQUENCY-08    BIOC-2.1.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-FREQUENCY-09: Verify the log medication when change the frequency from interval regular -> specific day
        [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is interval regular
    ...     8. Choose the time ( ex: 2 weeks, 3 weeks)
    ...     9. Set the time
    ...     10. Choose start date
    ...     11. Click Save button
    ...     12. Taken the medication
    ...
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from interval regular -> specific day
    ...     7. Choose the time( Ex: Monday. Sunday,..)
    ...     7. Click Save button
    ...
    ...     Expected Output:
    ...     The medication will be changed from interval regular to as specific day starting the current day and in the future if the start date is not changed.
    ...     The logged as daily medication will be kept intact.
    [Tags]      BIOC-MEDICATION-FREQUENCY-09    BIOC-2.1.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-FREQUENCY-10: Verify the log medication when change the frequency from specific day -> daily
     [Documentation]     Author: Tu Nguyen

    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is specific day
    ...     8. Choose the time ( ex: Monday, Sunday)
    ...     9. Set the time
    ...     10. Choose start date
    ...     11. Click Save button
    ...     12. Taken the medication
    ...
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from specific day -> daily
    ...     7. Click Save button
    ...
    ...     Expected Output:
    ...     The medication will be changed from specific day to daily  starting the current day and in the future if the start date is not changed.
    ...     The logged as daily medication will be kept intact.
    [Tags]      BIOC-MEDICATION-FREQUENCY-10    BIOC-2.1.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-FREQUENCY-11: Verify log the medication when change the frequency from specific day -> As needed
        [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is specific day 
    ...     8. Choose the time ( ex: Sunday, Monday)
    ...     9. Set the time
    ...     10. Choose start date
    ...     11. Click Save button
    ...     12. Taken the medication
    ...
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from specific day -> As needed
    ...     7. Click Save button
    ...
    ...     Expected Output:
    ...     The medication will be changed from specific day to As needed starting the current day and in the future if the start date is not changed.
    ...     The logged as daily medication will be kept intact.
    [Tags]      BIOC-MEDICATION-FREQUENCY-11    BIOC-2.1.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-FREQUENCY-12: Verify log the medication when change the frequency from specific day -> interval regular
        [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is specific day 
    ...     8. Choose the time ( ex: Sunday, Monday)
    ...     9. Set the time
    ...     10. Choose start date
    ...     11. Click Save button
    ...     12. Taken the medication
    ...
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from specific day > interval regular
    ...     7. Choose the time( Ex: 2 Weeks, 3 Weeks,..)
    ...     7. Click Save button
    ...
    ...     Expected Output:
    ...     The medication will be changed from specific day > interval regular starting the current day and in the future if the start date is not changed.
    ...     The logged as daily medication will be kept intact.
    [Tags]      BIOC-MEDICATION-FREQUENCY-12    BIOC-2.1.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-FREQUENCY-13: Verify the medication when change the frequency from As needed -> daily
        [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is As needed 
    ...     8. Click Save button
    ...     9. Click the Schedule
    ...    
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from needed -> daily
    ...     7. Click Save button
    ...
    ...     Expected Output:
    ...     The medication will be changed from As needed to daily starting the current day  day and in the future if the start date is not changed.
    [Tags]      BIOC-MEDICATION-FREQUENCY-13    BIOC-2.1.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-FREQUENCY-14: Verify the medication when change the frequency from as needed -> at interval regular
        [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is As needed 
    ...     8. Click Save button.
    ...    
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from needed -> at interval regular
    ...     7. Click Save button
    ...
    ...     Expected Output:
    ...     The medication will be changed from As needed to at interval regular starting the current day and in the future if the start date is not changed.
    [Tags]      BIOC-MEDICATION-FREQUENCY-14   BIOC-2.1.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-FREQUENCY-15: Verify the medication when change the frequency from daily -> as needed  
        [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is daily 
    ...     8. Choose the time reminder
    ...     9. Choose start date
    ...     10. Click Save button
    ...
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from daily -> As needed
    ...     7. Click Save button
    ...
    ...     Expected Output:
    ...     The medication will be changed from daily to As needed  starting the current day and in the future if the start date is not changed.
    [Tags]      BIOC-MEDICATION-FREQUENCY-15    BIOC-2.1.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-FREQUENCY-16: Verify the medication when change the frequency from as needed -> specific day
        [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is As needed
    ...     8. Click Save button
    ...
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from needed -> specific day
    ...     7. Chose any day on the weekend (ex: Monday, Sunday,..)
    ...     7. Click Save button
    ...
    ...     Expected Output:
    ...     The medication will be changed from As needed to at specific day starting the current day and in the future if the start date is not changed.
    [Tags]      BIOC-MEDICATION-FREQUENCY-16    BIOC-2.1.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-FREQUENCY-17: Verify the medication when change the frequency from daily -> interval regular
        [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is daily
    ...     8. Choose the time reminder
    ...     9. Choose start date
    ...     10. Click Save button
    ...
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from daily -> interval regular
    ...     7. Choose time for medication ( ex: 2 weeks, 3 weeks,..)
    ...     7. Click Save button
    ...
    ...     Expected Output:
    ...     The medication will be changed from daily to interval regular  starting the current day and in the future if the start date is not changed.
    [Tags]      BIOC-MEDICATION-FREQUENCY-17    BIOC-2.1.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-FREQUENCY-18: Verify the medication when change the frequency from daily -> specific day
        [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is daily
    ...     8. Choose the time reminder
    ...     9. Choose start date
    ...     10. Click Save button
    ...
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from daily -> specific day
    ...     7. Choose time for medication ( ex: monday, sunday,..)
    ...     7. Click Save button
    ...
    ...     Expected Output:
    ...     The medication will be changed from daily to specific day starting the current day and in the future if the start date is not changed.
    ...     The logged as daily medication will be kept intact.
    [Tags]      BIOC-MEDICATION-FREQUENCY-18    BIOC-2.1.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-FREQUENCY-19: Verify the medication when change the frequency from interval regular -> Daily
        [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is interval regular
    ...     8. Choose the time ( ex: 2 weeks, 3 weeks)
    ...     9. Set the time
    ...     10. Choose start date
    ...     11. Click Save button
    ...
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from interval regular -> Daily
    ...     7. Click Save button
    ...
    ...     Expected Output:
    ...     The medication will be changed from interval regular to daily  starting the current day and in the future if the start date is not changed.
    [Tags]      BIOC-MEDICATION-FREQUENCY-19    BIOC-2.1.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-FREQUENCY-20: Verify the medication when change the frequency from interval regular -> As needed
        [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is interval regular
    ...     8. Choose the time ( ex: 2 weeks, 3 weeks)
    ...     9. Set the time
    ...     10. Choose start date
    ...     11. Click Save button
    ...
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from interval regular -> As needed
    ...     7. Click Save button
    ...
    ...     Expected Output:
    ...     The medication will be changed from interval regular to as needed starting the current day and in the future if the start date is not changed.

    [Tags]      BIOC-MEDICATION-FREQUENCY-20    BIOC-2.1.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-FREQUENCY-21: Verify the medication when change the frequency from interval regular -> specific day
        [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is interval regular
    ...     8. Choose the time ( ex: 2 weeks, 3 weeks)
    ...     9. Set the time
    ...     10. Choose start date
    ...     11. Click Save button
    ...
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from interval regular -> specific day
    ...     7. Choose the time( Ex: Monday. Sunday,..)
    ...     7. Click Save button
    ...
    ...     Expected Output:
    ...     The medication will be changed from interval regular to as specific day starting the current day and in the future if the start date is not changed.
    [Tags]      BIOC-MEDICATION-FREQUENCY-21    BIOC-2.1.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BIOC-MEDICATION-FREQUENCY-22: Verify the medication when change the frequency from specific day -> daily
    [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is specific day
    ...     8. Choose the time ( ex: Monday, Sunday)
    ...     9. Set the time
    ...     10. Choose start date
    ...     11. Click Save button
    ...
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from specific day -> daily
    ...     7. Click Save button
    ...
    ...     Expected Output:
    ...     The medication will be changed from specific day to daily  starting the current day and in the future if the start date is not changed.
    [Tags]      BIOC-MEDICATION-FREQUENCY-22    BIOC-2.1.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-FREQUENCY-23: Verify the medication when change the frequency from specific day -> As needed
        [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is specific day 
    ...     8. Choose the time ( ex: Sunday, Monday)
    ...     9. Set the time
    ...     10. Choose start date
    ...     11. Click Save button
    ...
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from specific day -> As needed
    ...     7. Click Save button
    ...
    ...     Expected Output:
    ...     The medication will be changed from specific day to As needed starting the current day and in the future if the start date is not changed.
    [Tags]      BIOC-MEDICATION-FREQUENCY-23    BIOC-2.1.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MEDICATION-FREQUENCY-24: Verify the medication when change the frequency from specific day -> interval regular
        [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click add medication
    ...     5. Choose the medication
    ...     6. Click Set reminder button
    ...     7. Choose the frequency is specific day 
    ...     8. Choose the time ( ex: Sunday, Monday)
    ...     9. Set the time
    ...     10. Choose start date
    ...     11. Click Save button
    ...
    ...     Test step
    ...     1. Log in the app
    ...     2. Click the medication
    ...     3. Click the categories
    ...     4. Click the added medication
    ...     5. Click Edit button
    ...     6. Change the frequency from specific day > interval regular
    ...     7. Choose the time( Ex: 2 Weeks, 3 Weeks,..)
    ...     7. Click Save button
    ...
    ...     Expected Output:
    ...     The medication will be changed from specific day > interval regular starting the current day and in the future if the start date is not changed.

    [Tags]      BIOC-MEDICATION-FREQUENCY-24    BIOC-2.1.0  manual  R2
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
