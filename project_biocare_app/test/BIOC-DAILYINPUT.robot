*** Settings ***
Documentation   Biocare app Daily input test suite
Metadata    sid     BIOC-DAILYINPUT
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-DAILYINPUT   mapp
Test Timeout    1h

*** Test Cases ***
BIOC-DAILYINPUT-DAILYHEALTLOG-01: Status of daily health log
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - User is signed in app
    ...     - User has program
    ...     - Clinic user is set up program in the portal
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Go to Daily health log section
    ...
    ...     Expected Output:
    ...     2. There are 3 statuses of the daily health log button:
    ...        - Let’s do button
    ...          + Shows this button if the users have not inputted any information.
    ...        - Let’s continue button
    ...          + Shows this button if the users have inputted but have not finished the daily health log.
    ...          + Displays the number of completed questions on the number of total questions.
    ...          + Taps on this button will open the first in-queue unanswered question.
    ...        - Completed status: Shows this status when the users finish the daily health log.
    [Tags]     BIOC-DAILYINPUT-DAILYHEALTLOG-01         BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-DAILYHEALTLOG-02: Daily health log list
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - User is signed in app
    ...     - User has program
    ...     - Clinic user is set up monitor information in the portal
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Go to Daily health log section
    ...     3. Press on View my journal button
    ...
    ...     Expected Output:
    ...     3. List of daily health log shall display base on set up in the portal
    ...        - When the clinic user changes monitored information on the portal, this change shall be applied in daily health log immediately
    ...        - In the past days, daily healt log list shall all items in the monitor information
    [Tags]     BIOC-DAILYINPUT-DAILYHEALTLOG-02         BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-DAILYHEALTLOG-03: Take daily health log when the users have not inputted any information
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is in Home screen
    ...     - The user is linked care plan
    ...
    ...     Test Steps:
    ...     1. Press on Let's do button
    ...     2. Add information for Daily health log
    ...     3. Press on Next or back icon button button
    ...     4. Press on Finish or close icon button
    ...
    ...     Expected Output:
    ...     4. If the users press on Finish button, the answers are saved and navigate back to the Home screen
    ...        - If the users press on close icon button
    ...          + Press on Keep doing button, continue to take daily health log
    ...          + Press on Save & Quit button, the answers are saved and navigate back to the Home screen
    [Tags]      BIOC-DAILYINPUT-DAILYHEALTLOG-03      BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-DAILYHEALTLOG-04: Take daily health log when the users have inputted but have not finished
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is in Home screen
    ...     - The user is linked care plan
    ...
    ...     Test Steps:
    ...     1. Press on Let's continue button
    ...     2. Add or edit information for Daily health log
    ...     3. Press on Next or back icon button button
    ...     4. Press on Finish or close icon button
    ...
    ...     Expected Output:
    ...     1. Navigate to the incomplete question
    ...     4. If the users press on Finish icon button, the answers are saved and navigate back to the Home screen
    ...        - If the users press on close icon button
    ...          + Press on Keep doing button, continue to take daily health log
    ...          + Press on Save & Quit button, the answers are saved and navigate back to the Home screen
    [Tags]      BIOC-DAILYINPUT-DAILYHEALTLOG-04      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-YOURJOURNAL-01: View Your journal screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is in Home screen
    ...     - The user is linked care plan
    ...     - The user is completed daily health log at least a day
    ...
    ...     Test Steps:
    ...     1. Press on View my journal
    ...     2. Press on Calendar button
    ...
    ...     Expected Output:
    ...     1. - Title: Your journal
    ...        - Calendar: Today, MMM DD
    ...        - ? button: daily health log status (No data log and Logged data)
    ...        - Add or Edit notes
    ...        - User can view daily health log of previous day
    ...          + On the calendar, the users can only scroll back and forth in the range of the week the care plan started to the current week.
    ...        - Add or Edit daily health log information
    ...          + On the current date, if the users want to add or edit blood pressure, blood oxygen, heart rate, and body temperature, there will be 3 measurement methods: sync available data, connect to Biokit device, and add data manually
    ...          + On the previous dates, if the users want to add or edit data on blood pressure, blood oxygen, heart rate, and body temperature, there will be 1 measurement method only which is to add data manually
    ...        - Fields without information will show "- unit"
    ...        - The period between the stopped care plan date, and the reactivated date on the calendar will be disabled
    ...        - Data from the date care plan started on Cardiac to the date start using Biocare: Can view
    ...        - Data from the date care plan started on Cardiac to the previous date of the date start using Biocare: Can view
    ...        - User can navigate back previous screen by pressing on back icon button
    ...     2. Calendar will be displayed
    ...        - All the dates before the date the care plan started and after the current date that is presented on the calendar will be disabled
    [Tags]      BIOC-DAILYINPUT-YOURJOURNAL-01      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-YOURJOURNAL-02: Sleep in the View my journal
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - User is signed in app
    ...     - User has program
    ...     - Clinic user is set up monitor information in the portal
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Press on View my journal button
    ...     3. Click on Add/Edit button
    ...
    ...     Expected Output:
    ...     3. Greeting phrase with the syntax “Hello, <user’s first name>”
    ...        - The question “How did you sleep last night?”
    ...        - Sleep duration: the default value is 8h30m
    ...        - Change button
    ...        - Done button
    ...        - Exit button
    [Tags]     BIOC-DAILYINPUT-YOURJOURNAL-02        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-YOURJOURNAL-03: Mood in the View my journal
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - User is signed in app
    ...     - User has program
    ...     - Clinic user is set up monitor information in the portal
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Press on View my journal button
    ...     3. Click on Add/Edit button
    ...
    ...     Expected Output:
    ...     3. Greeting phrase with the syntax “Hello, <user’s first name>”
    ...        - The question “How do you feel today?”
    ...        - Mood level:
    ...          + Fantastic
    ...          + Good
    ...          + Okay (Default)
    ...          + Bad
    ...          + Terrible
    ...        - Done button
    ...        - Exit button
    [Tags]     BIOC-DAILYINPUT-YOURJOURNAL-03         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-YOURJOURNAL-04: Symptoms in the View my journal
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - User is signed in app
    ...     - User has program
    ...     - Clinic user is set up monitor information in the portal
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Press on View my journal button
    ...     3. Click on Add/Edit button
    ...
    ...     Expected Output:
    ...     3. Greeting phrase with the syntax “Hello, <user’s first name>”
    ...        - The question “Have you experienced any of the following symptoms today?”
    ...        - Symptoms selection
    ...           + Abnormal bleeding (gums or bruising on joints)
    ...           + Angina or chest discomfort
    ...           + Chest pain
    ...           + Fainting episodes
    ...           + Lightheadedness
    ...           + Numbness in arm(s) or leg(s)
    ...           + Painful urination
    ...           + Palpitations
    ...           + Poor circulation
    ...           + Shortness of breath
    ...           + Stroke
    ...        - Done button
    ...        - Exit button
    [Tags]     BIOC-DAILYINPUT-YOURJOURNAL-04         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-YOURJOURNAL-05: EHRA in the View my journal
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - User is signed in app
    ...     - User has program
    ...     - Clinic user is set up monitor information in the portal
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Press on View my journal button
    ...     3. Click on Add/Edit button
    ...
    ...     Expected Output:
    ...     3. Greeting phrase with the syntax “Hello, <user’s first name>”
    ...        - The question “How much were your daily activities limited by Atrial Fibrillation-related symptoms?”
    ...        - Symptoms selection
    ...           + None
    ...           + Disabling
    ...           + Severe
    ...           + Moderate
    ...           + Mild
    ...        - Done button
    ...        - Exit button
    [Tags]     BIOC-DAILYINPUT-YOURJOURNAL-05         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-YOURJOURNAL-06: Blood pressure in the View my journal
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - User is signed in app
    ...     - User has program
    ...     - Clinic user is set up monitor information in the portal
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Press on View my journal button
    ...     3. Click on Add/Edit button
    ...     4. Click on Add data manually
    ...
    ...     Expected Output:
    ...     3. Two button will display: Connect to Biokit device and Add data manually
    ...     4. Date and time: Format <hh:mm AM or PM>. The default value is the current date and time, the users can modify this value by opening the date picker
    ...        - Systolic: Value selection range is 40-300. The default value is 110
    ...        - Diastolic: Value selection range is 30-200. The default value is 70
    ...        - Save button
    ...        - Exit button
    [Tags]     BIOC-DAILYINPUT-YOURJOURNAL-06         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-YOURJOURNAL-07: Heart rate in the View my journal
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - User is signed in app
    ...     - User has program
    ...     - Clinic user is set up monitor information in the portal
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Press on View my journal button
    ...     3. Click on Add/Edit button
    ...     4. Click on Add data manually
    ...
    ...     Expected Output:
    ...     3. Two button will display: Connect to Biokit device and Add data manually
    ...     4. Date and time: Format <hh:mm AM or PM>. The default value is the current date and time; the users can modify this value by opening the date picker
    ...        - Heart rate(bpm): The value selection range is 20-300. The default value is 70 bpm
    ...        - Save button
    ...        - Exit button
    [Tags]     BIOC-DAILYINPUT-YOURJOURNAL-07         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-YOURJOURNAL-08: Blood oxygen in the View my journal
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - User is signed in app
    ...     - User has program
    ...     - Clinic user is set up monitor information in the portal
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Press on View my journal button
    ...     3. Click on Add/Edit button
    ...     4. Click on Add data manually
    ...
    ...     Expected Output:
    ...     3. Two button will display: Connect to Biokit device and Add data manually
    ...     4. Date and time: Format <hh:mm AM or PM>. The default value is the current date and time; the users can modify this value by opening the date picker
    ...        - Blood oxygen(%): Value selection range is 60-100%. The default value is 99%
    ...        - Save button
    ...        - Exit button
    [Tags]     BIOC-DAILYINPUT-YOURJOURNAL-08         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-YOURJOURNAL-09: Body temperature in the View my journal
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - User is signed in app
    ...     - User has program
    ...     - Clinic user is set up monitor information in the portal
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Press on View my journal button
    ...     3. Click on Add/Edit button
    ...     4. Click on Add data manually
    ...
    ...     Expected Output:
    ...     3. Two button will display: Connect to Biokit device and Add data manually
    ...     4. Date and time: Format <hh:mm AM or PM>. The default value is the current date and time; the users can modify this value by opening the date picker
    ...        - Body temperature (°C or °F): Depending on the measurement unit selected in the app settings.
    ...           + For degrees Celsius, the value selection range is 34-42°C. The default value is 37°C
    ...           + For degrees Fahrenheit, the value selection range is 93-108°F. The default value is 98.6°F
    ...        - Save button
    ...        - Exit button
    [Tags]     BIOC-DAILYINPUT-YOURJOURNAL-09         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-YOURJOURNAL-10: Weight in the View my journal
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - User is signed in app
    ...     - User has program
    ...     - Clinic user is set up monitor information in the portal
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Press on View my journal button
    ...     3. Click on Add/Edit button
    ...     4. Click on Add data manually
    ...
    ...     Expected Output:
    ...     3. Add data manually button will display
    ...     4. Date and time: Format <hh:mm AM or PM>. The default value is the current date and time; the users can modify this value by opening the date time picker
    ...        - Weight (kg or lb): The weight can be measured in kg or lb, depending on the measurement unit selected in the app settings.
    ...           + For metric, the value selection range is 5-250kg. The default value is the latest value
    ...           + For imperial, the value selection range is 11-550lb. The default value is the latest value
    ...        - Save button
    ...        - Exit button
    [Tags]     BIOC-DAILYINPUT-YOURJOURNAL-10         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-YOURJOURNAL-11: Activities in the View my journal when no data
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - User is signed in app
    ...     - User has program
    ...     - Clinic user is set up monitor information in the portal
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Press on View my journal button
    ...     3. Click on Add button
    ...
    ...     Expected Output:
    ...     3. Greeting phrase with the syntax “Hello, <user’s first name>”
    ...        - The question “How active have you been today?”
    ...           + Walking
    ...           + Running
    ...        - Done button
    ...        - Exit button
    [Tags]     BIOC-DAILYINPUT-YOURJOURNAL-11         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-YOURJOURNAL-12: Activities in the View my journal when have data
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - User is signed in app
    ...     - User has program
    ...     - Clinic user is set up monitor information in the portal
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Press on View my journal button
    ...     3. Click on Edit button
    ...
    ...     Expected Output:
    ...     3. Greeting phrase with the syntax “Hello, <user’s first name>”
    ...        - The question “How active have you been today?”
    ...           + Walking
    ...             Duration: hour (Can edit)
    ...           + Running
    ...             Duration: hour (Can edit)
    ...        - The app shall display many duration cards if there are many of them
    ...        - Each card shall cover the separated data and cannot be overlapped
    ...        - Level of activity: Default level 3 (5 Level)
    ...        - Done button
    ...        - Exit button
    [Tags]     BIOC-DAILYINPUT-YOURJOURNAL-12        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-YOURJOURNAL-13: Walking/Running in the View my journal
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - User is signed in app
    ...     - User has program
    ...     - Clinic user is set up monitor information in the portal
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Press on View my journal button
    ...     3. Click on Add/Edit button
    ...     4. Click on Plus Walking/Running button
    ...
    ...     Expected Output:
    ...     4. - Title: Activity
    ...        - Walking/Running
    ...        - The default duration value is 1h from 7:00 AM to 8:00 AM if no available data in the app
    ...        - The default time shall be the stop time of the latest card +1 min if there is at least 1 other duration card
    [Tags]     BIOC-DAILYINPUT-YOURJOURNAL-13         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-YOURJOURNAL-14: Symptoms in the View my journal
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - User is signed in app
    ...     - User has program
    ...     - Clinic user is set up monitor information in the portal
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Press on View my journal button
    ...     3. Click on Add/Edit button
    ...     4. Press on Edit button
    ...     5. Swiping left on the card
    ...     6. Press on Delete button
    ...     7. Click on Add your symptoms button
    ...
    ...     Expected Output:
    ...     3. Symptoms question card
    ...        - Greeting phrase with the syntax “Hello, <user’s first name>”
    ...        - The question “Have you experienced any of the following symptoms today?”
    ...        - Add your symptom button
    ...        - The list of added symptom cards. Symptoms cards shall be sorted based on the latest stop time
    ...          - Each kind of symptom shall be displayed on one card. Each card shall have the following components:
    ...            + Name of symptom
    ...            + Severity level
    ...            + Event time. Format: [Mmm][dd], [hh]:[mm] [AM/PM] – [hh][mm] [AM/PM]
    ...            + Notes (If any)
    ...            + Edit button on the card
    ...     4. Navigate the user to the Edit symptoms screen.
    ...     5. The app shall show the delete icon button
    ...     6. Delete this symptom card
    ...     7. Navigate the user to Add Symptoms screen
    [Tags]     BIOC-DAILYINPUT-YOURJOURNAL-14         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-YOURJOURNAL-15: Add or Edit notes
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Your journal screen
    ...
    ...     Test Steps:
    ...     1. Press on Add notes or Edit notes button
    ...     2. Enter notes
    ...     3. Press on Save or close icon button
    ...
    ...     Expected Output:
    ...     1. Notes screen shall be displayed:
    ...        - Title: Notes
    ...        - Add your notes here
    ...        - Save button
    ...        - Close button
    ...     3. If users press on save button, the updated notes is saved and close notes screen
    ...        - If users press on close button, the updated notes is not saved and close notes screen
    [Tags]      BIOC-DAILYINPUT-YOURJOURNAL-15        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-DAILYHEALTLOG-05: Sleep in the Daily health log
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - User is signed in app
    ...     - User has program
    ...     - Clinic user is set up monitor information in the portal
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Press on Let's Do button
    ...
    ...     Expected Output:
    ...     2. Title: Daily health log
    ...        - Card: Sleep
    ...        - The question “How did you sleep last night?”
    ...        - Sleep duration: the default value is 8h30m
    ...        - Change button
    ...        - Next button
    ...        - Exit button
    [Tags]     BIOC-DAILYINPUT-DAILYHEALTLOG-05         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-DAILYHEALTLOG-06: Symptoms in the Daily health log
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - User is signed in app
    ...     - User has program
    ...     - Clinic user is set up monitor information in the portal
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Press on Let's Do button
    ...
    ...     Expected Output:
    ...     2. Title: Daily health log
    ...        - Card: Symptoms
    ...        - The question “Have you experienced any of the following symptoms today?”
    ...        - Sleep duration: the default value is 8h30m
    ...        - Add your symptom button
    ...        - The list of added symptom cards. Symptoms cards shall be sorted based on the latest stop time
    ...        - Each kind of symptom shall be displayed on one card. Each card shall have the following components:
    ...          + Name of symptom
    ...          + Severity level
    ...          + Event time. Format: [Mmm][dd], [hh]:[mm] [AM/PM] – [hh][mm] [AM/PM]
    ...          + Notes (If any)
    ...          + Edit button on the card
    ...        - Next button
    ...        - Exit button
    [Tags]     BIOC-DAILYINPUT-DAILYHEALTLOG-06         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-DAILYHEALTLOG-07: Mood in the Daily health log
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Continute your daily health log question
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Press on Let's Do button
    ...
    ...     Expected Output:
    ...     2. Title: Daily health log
    ...        - Card: Mood
    ...        - The question “How do you feel today?”
    ...        - Mood level:
    ...          + Fantastic
    ...          + Good
    ...          + Okay (Default)
    ...          + Bad
    ...          + Terrible
    ...        - Next button
    ...        - Exit button
    [Tags]     BIOC-DAILYINPUT-DAILYHEALTLOG-07         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-DAILYHEALTLOG-08: Symptom in the Daily health log
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Continute your daily health log question
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Press on Let's Do button
    ...
    ...     Expected Output:
    ...     2. Title: Daily health log
    ...        - Card: Symptoms
    ...        - The question “Have you experienced any of the following symptoms today?”
    ...        - Symptoms selection
    ...           + Abnormal bleeding (gums or bruising on joints)
    ...           + Angina or chest discomfort
    ...           + Chest pain
    ...           + Fainting episodes
    ...           + Lightheadedness
    ...           + Numbness in arm(s) or leg(s)
    ...           + Painful urination
    ...           + Palpitations
    ...           + Poor circulation
    ...           + Shortness of breath
    ...           + Stroke
    ...        - Back button
    ...        - Next button
    ...        - Exit button
    [Tags]     BIOC-DAILYINPUT-DAILYHEALTLOG-08         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-DAILYHEALTLOG-09: EHRA in the Daily health log
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Continute your daily health log question
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Press on Let's Do button
    ...
    ...     Expected Output:
    ...     2. Title: Daily health log
    ...        - Card: Atrial Fibrillation
    ...        - The question “How much were your daily activities limited by Atrial Fibrillation-related symptoms?”
    ...        - Symptoms selection
    ...           + None
    ...           + Disabling
    ...           + Severe
    ...           + Moderate
    ...           + Mild
    ...        - Back button
    ...        - Next button
    ...        - Exit button
    [Tags]     BIOC-DAILYINPUT-DAILYHEALTLOG-09         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-DAILYHEALTLOG-10: Measurements question in the Daily health log
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Continute your daily health log question
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Press on Let's Do button
    ...
    ...     Expected Output:
    ...     2. Title: Daily health log
    ...        - Card: Measurements
    ...        - The question “What are your measurements?”
    ...        - Blood pressure card
    ...        - Heart rate card
    ...        - Blood oxygen card
    ...        - Body temperate card
    ...        - Weight card
    ...        - Back button
    ...        - Next button
    ...        - Exit button
    [Tags]     BIOC-DAILYINPUT-DAILYHEALTLOG-10         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DAILYINPUT-DAILYHEALTLOG-11: Activities in the Daily health log
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Continute your daily health log question
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Press on Let's Do button
    ...
    ...     Expected Output:
    ...     2. Title: Daily health log
    ...        - Card: Activities
    ...        - The question “How active have you been today?”
    ...        - Finish button
    ...        - Back button
    ...        - Exit button
    [Tags]     BIOC-DAILYINPUT-DAILYHEALTLOG-11         BIOC-1.22.0  manual  R1
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
