*** Settings ***
Documentation   Biocare app Goals study test suite
Metadata    sid     BIOC-GOALS
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-GOALS  mapp
Test Timeout    1h

*** Test Cases ***
BIOC-GOALS-NOTI-01: Create new goal on portal
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...     1. Create new goal
    ...     2. Edit goal
    ...     3. Delete goal
    ...
    ...     Expected Output:
    ...     1. Message: The clinic has set up a new goal. Tap to view details.
    ...        - Push notification
    ...        - In-app notification
    ...     2. Message: The program's goal has been updated. Tap to view details.
    ...        - Push notification
    ...        - In-app notification
    ...     3. Message: The program's goal has been deleted. Tap to view details.
    ...        - Push notification
    ...        - In-app notification
    ...     * Make sure all question display correct
    [Tags]      BIOC-GOALS-NOTI-01         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-GOALS-01: View goals card on Healthcare program screen (No data)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Healthcare program screen
    ...
    ...     Test Steps:
    ...     1. Press on Goals card
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Program goals screen:
    ...        - All goals tab: No data to display (Default)
    ...        - Progress tab: No data to display
    ...        - Back button
    [Tags]      BIOC-GOALS-01         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-GOALS-02: View All goals tab on Program goals screen (Added data from portal)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Program goals screen
    ...
    ...     Test Steps:
    ...     1. Viasully the All goals tab
    ...
    ...     Expected Output:
    ...     1. This tab contains all in-progress and achieved goal cards.
    ...        - Goal cards shall be sorted by time (from the latest to the oldest) and In progress goals shall be always at the top.
    ...        - Each goal card shall have the following components:
    ...          + Status:
    ...            In progress: when the clinic user sets In-progress status on the portal
    ...            Achieved: when the clinic user sets Achieved status on the portal
    ...          + Percentage selected (Only for In-progress goal)
    ...          + Goal name
    ...          + Description
    ...          + Tracking interval
    ...            Daily tracking
    ...            Weekly tracking
    ...            Monthly tracking
    ...            Every 3 months tracking
    ...            Every 6 months tracking
    ...            Yearly tracking
    [Tags]      BIOC-GOALS-02          BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-GOALS-03: View Progress tab on Program goals screen (Added data from portal)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Program goals screen
    ...
    ...     Test Steps:
    ...     1. Press on Progress tab
    ...     2. Press on Add/Edit button
    ...
    ...     Expected Output:
    ...     1. Switch to Progress tab:
    ...        - Select date section
    ...        - Ask icon
    ...        - Each card shall have the following components:
    ...          + Group by date (from the latest to the oldest). Time Format: [MMM] [dd], [yyyy]
    ...          + Button
    ...            Edit: if the user has answered at least one of all questions in this card
    ...            Add: If the user has not answered any questions in this card
    ...          + List of goals on that day. Each goal shall have:
    ...            Goal Name
    ...            [number]% - answer. In case no answer, display “No answer”
    ...     2. Navigate the user to the Goal question screen
    [Tags]      BIOC-GOALS-03          BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-GOALS-04: Inprogress - Achieved
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Program Goals screen
    ...
    ...     Test Steps:
    ...     1. Create new the question with status Inprogress
    ...     2. Change status is Achieved
    ...     3. Wait for the next day
    ...
    ...     Expected Output:
    ...     1. The questions will appear in the All goals tab and the Progress tab with the Inprogress status
    ...     2. The questions will appear in the All goals tab with the Achieved status and disappear in the Progress tab
    ...     3. The questions will appear in the All goals tab with the Achieved status and disappear in the Progress tab
    [Tags]      BIOC-GOALS-04          BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-GOALS-05: Inprogress - Achieved - Inprogress
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Program Goals screen
    ...
    ...     Test Steps:
    ...     1. Create new the question with status Inprogress
    ...     2. Change status is Achieved
    ...     3. Change status is Inprogress
    ...     4. Wait for the next day
    ...
    ...     Expected Output:
    ...     1. The questions will appear in the All goals tab and the Progress tab with the Inprogress status
    ...     2. The questions will appear in the All goals tab with the Achieved status and disappear in the Progress tab
    ...     3. The questions will appear in the All goals tab with the Inprogress status and absent in the Progress tab
    ...     4. The questions will appear in the All goals tab and the Progress tab with the Inprogress status
    [Tags]      BIOC-GOALS-05          BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-GOALS-06: Achieved - Inprogress - Achieved
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Program Goals screen
    ...
    ...     Test Steps:
    ...     1. Create new the question with status Achieved
    ...     2. Change status is Inprogress
    ...     3. Wait for the next day
    ...     4. Change status is Achieved
    ...
    ...     Expected Output:
    ...     1. The questions will appear in the All goals tab with the Achieved status and disappear in the Progress tab
    ...     2. The questions will appear in the All goals tab with the Inprogress status and absent in the Progress tab
    ...     3. The questions will appear in the All goals tab and the Progress tab with the Inprogress status
    ...     4. The questions will appear in the All goals tab with the Achieved status and disappear in the Progress tab
    [Tags]      BIOC-GOALS-06         BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-GOALS-07: View Goal question screen (Daily)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Home screen
    ...     - Added data from portal
    ...     - Today haven't done any goals yet
    ...
    ...     Test Steps:
    ...     1. Press on Let's track goal progress button
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Goal question screen:
    ...        - Greeting phrase: “Hello, <user’s first name>"
    ...        - Content: “It’s time to track your goal progress”
    ...        - Progress bar
    ...        - Goal name
    ...        - Goal question shall display corresponding to the tracking interval
    ...          + Daily tracking: “Have you achieved this goal within the last day?”
    ...        - 4 options to choose:
    ...          + Not at all, I didn’t make any progress. (0%)
    ...          + I’ve made a start, but it’s only partially complete. (30%)
    ...          + I’m getting there. I’ve completed most of it. (60%)
    ...          + Yes, I fully completed it. (100%)
    ...        - Next button
    ...        - Close button
    [Tags]      BIOC-GOALS-07         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-GOALS-08: View Goal question screen (Weekly)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Home screen
    ...     - Added data from portal
    ...     - Today haven't done any goals yet
    ...
    ...     Test Steps:
    ...     1. Press on Let's track goal progress button
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Goal question screen:
    ...        - Greeting phrase: “Hello, <user’s first name>"
    ...        - Content: “It’s time to track your goal progress”
    ...        - Progress bar
    ...        - Goal name
    ...        - Goal question shall display corresponding to the tracking interval
    ...          + Weekly tracking: “Have you achieved this goal within the last week?”
    ...        - 4 options to choose:
    ...          + Not at all, I didn’t make any progress. (0%)
    ...          + I’ve made a start, but it’s only partially complete. (30%)
    ...          + I’m getting there. I’ve completed most of it. (60%)
    ...          + Yes, I fully completed it. (100%)
    ...        - Next button
    ...        - Close button
    [Tags]      BIOC-GOALS-08         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-GOALS-09: View Goal question screen (Monthly)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Home screen
    ...     - Added data from portal
    ...     - Today haven't done any goals yet
    ...
    ...     Test Steps:
    ...     1. Press on Let's track goal progress button
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Goal question screen:
    ...        - Greeting phrase: “Hello, <user’s first name>"
    ...        - Content: “It’s time to track your goal progress”
    ...        - Progress bar
    ...        - Goal name
    ...        - Goal question shall display corresponding to the tracking interval
    ...          + Monthly tracking: “Have you achieved this goal within the last month?”
    ...        - 4 options to choose:
    ...          + Not at all, I didn’t make any progress. (0%)
    ...          + I’ve made a start, but it’s only partially complete. (30%)
    ...          + I’m getting there. I’ve completed most of it. (60%)
    ...          + Yes, I fully completed it. (100%)
    ...        - Next button
    ...        - Close button
    [Tags]      BIOC-GOALS-09         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-GOALS-10: View Goal question screen (Every 3 months)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Home screen
    ...     - Added data from portal
    ...     - Today haven't done any goals yet
    ...
    ...     Test Steps:
    ...     1. Press on Let's track goal progress button
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Goal question screen:
    ...        - Greeting phrase: “Hello, <user’s first name>"
    ...        - Content: “It’s time to track your goal progress”
    ...        - Progress bar
    ...        - Goal name
    ...        - Goal question shall display corresponding to the tracking interval
    ...          + Every 3 months tracking: “Have you achieved this goal within the last 3 months?”
    ...        - 4 options to choose:
    ...          + Not at all, I didn’t make any progress. (0%)
    ...          + I’ve made a start, but it’s only partially complete. (30%)
    ...          + I’m getting there. I’ve completed most of it. (60%)
    ...          + Yes, I fully completed it. (100%)
    ...        - Next button
    ...        - Close button
    [Tags]      BIOC-GOALS-10         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-GOALS-11: View Goal question screen (Every 6 months)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Home screen
    ...     - Added data from portal
    ...     - Today haven't done any goals yet
    ...
    ...     Test Steps:
    ...     1. Press on Let's track goal progress button
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Goal question screen:
    ...        - Greeting phrase: “Hello, <user’s first name>"
    ...        - Content: “It’s time to track your goal progress”
    ...        - Progress bar
    ...        - Goal name
    ...        - Goal question shall display corresponding to the tracking interval
    ...          + Every 6 months tracking: “Have you achieved this goal within the last 6 months?”
    ...        - 4 options to choose:
    ...          + Not at all, I didn’t make any progress. (0%)
    ...          + I’ve made a start, but it’s only partially complete. (30%)
    ...          + I’m getting there. I’ve completed most of it. (60%)
    ...          + Yes, I fully completed it. (100%)
    ...        - Next button
    ...        - Close button
    [Tags]      BIOC-GOALS-11         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-GOALS-12: View Goal question screen (Yearly)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Home screen
    ...     - Added data from portal
    ...     - Today haven't done any goals yet
    ...
    ...     Test Steps:
    ...     1. Press on Let's track goal progress button
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Goal question screen:
    ...        - Greeting phrase: “Hello, <user’s first name>"
    ...        - Content: “It’s time to track your goal progress”
    ...        - Progress bar
    ...        - Goal name
    ...        - Goal question shall display corresponding to the tracking interval
    ...          + Yearly tracking: “Have you achieved this goal within the last year?”
    ...        - 4 options to choose:
    ...          + Not at all, I didn’t make any progress. (0%)
    ...          + I’ve made a start, but it’s only partially complete. (30%)
    ...          + I’m getting there. I’ve completed most of it. (60%)
    ...          + Yes, I fully completed it. (100%)
    ...        - Next button
    ...        - Close button
    [Tags]      BIOC-GOALS-12         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-GOALS-13: Answering Questions
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Home screen
    ...     - Added data from portal
    ...     - Today haven't done any goals yet
    ...
    ...     Test Steps:
    ...     1. Press on Let's track goal progress button
    ...     2. Press on Next button
    ...     3. Press on Back button
    ...     4. Press on Next button
    ...     5. Press on Done button
    ...     6. Press on View all goals button
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Goal question screen:
    ...        - Greeting phrase: “Hello, <user’s first name>"
    ...        - Content: “It’s time to track your goal progress”
    ...        - Progress bar
    ...        - Goal name
    ...        - Goal question shall display corresponding to the tracking interval
    ...          + Daily tracking: “Have you achieved this goal within the last day?”
    ...          + Weekly tracking: “Have you achieved this goal within the last week?”
    ...          + Monthly tracking: “Have you achieved this goal within the last month?”
    ...          + Every 3 months tracking: “Have you achieved this goal within the last 3 months?”
    ...          + Every 6 months tracking: “Have you achieved this goal within the last 6 months?”
    ...          + Yearly tracking: “Have you achieved this goal within the last year?”
    ...        - 4 options to choose:
    ...          + Not at all, I didn’t make any progress. (0%)
    ...          + I’ve made a start, but it’s only partially complete. (30%)
    ...          + I’m getting there. I’ve completed most of it. (60%)
    ...          + Yes, I fully completed it. (100%)
    ...        - Next button
    ...        - Close button
    ...     2. The system shall save the answer and navigate the user to the next question:
    ...        - Back button (Isn't the first question)
    ...        - Done button (The last question)
    ...     3. Back to the previous question
    ...     5. The Completed screen have the following components:
    ...        - Tittle: Completed!
    ...        - Content: You’re making great strikes. Keep up the good work and get ready for the next intervals.
    ...        - View all goals button
    ...     6. Navigate the user to the Program goals screen
    [Tags]      BIOC-GOALS-13         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-GOALS-14: Answering Questions (does not update any answers in Home Screen)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Home screen
    ...     - Added data from portal
    ...     - Today haven't done any goals yet
    ...
    ...     Test Steps:
    ...     1. Press on Let's track goal progress button
    ...     2. Press on Next button
    ...     3. Press on Done button
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Goal question screen
    ...     3. Navigate the user to the Home screen and save the “No answer” value for all questions
    [Tags]      BIOC-GOALS-14         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-GOALS-15: Answering Questions (does not update any answers in Healthcare program Screen)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Healthcare program screen
    ...     - Added data from portal
    ...     - Today haven't done any goals yet
    ...
    ...     Test Steps:
    ...     1. Press on Goals tab
    ...     2. Press on Progress tab
    ...     3. Press on Add button
    ...     4. Press on Next button
    ...     5. Press on Done button
    ...
    ...     Expected Output:
    ...     3. Navigate the user to the Goal question screen
    ...     5. Navigate the user to the Progress tab screen and remain all answers
    [Tags]      BIOC-GOALS-15         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-GOALS-16: Close the Questions screen (does not update any answers in Home Screen)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Home screen
    ...     - Added data from portal
    ...     - Today haven't done any goals yet
    ...
    ...     Test Steps:
    ...     1. Press on Let's track goal progress button
    ...     2. Press on Next button
    ...     3. Press on Done button
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Goal question screen
    ...     3. Navigate the user to the Home screen and save the “No answer” value for all questions
    [Tags]      BIOC-GOALS-16         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-GOALS-17: Close the Questions screen (does not update any answers in Healthcare program Screen)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Healthcare program screen
    ...     - Added data from portal
    ...     - Today haven't done any goals yet
    ...
    ...     Test Steps:
    ...     1. Press on Add button
    ...     2. Press on Next button
    ...     3. Press on Done button
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Goal question screen
    ...     3. Navigate the user to the Progress tab screen and remain all answers
    [Tags]      BIOC-GOALS-17         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-GOALS-18: Press Close button while answering the question
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition
    ...     - Added data from portal
    ...
    ...     Test Steps:
    ...     1. Press on Let's track goal progress button
    ...     2. Choose any answer and press on Next button
    ...     3. Press on Close button
    ...     4. Press on Keep doing button
    ...     5. Press on Close button
    ...     6. Press on Save & Quit button
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Goal question screen
    ...     3. The modal shall be displayed:
    ...        - Title: You haven’t finished the progress
    ...        - Content: Do you want to save your answer?
    ...        - Keep doing button
    ...        - Save & Quit button
    ...     4. Close the modal
    ...     6. Save the answer(s), close the modal and navigate the user to the Home screen
    [Tags]      BIOC-GOALS-18         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-GOALS-19: Goal Notification
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The patient has already signed in and linked their program
    ...
    ...     Test Steps:
    ...     1. Add data goal from portal
    ...     2. update data goal from portal
    ...     3. Delete data goal from portal
    ...
    ...     Expected Output:
    ...     1. Push notification and In-app notification:
    ...        Title: Hi <Firstname> <Lastname>, your new program goal has been set up. Please notice before using services.
    ...     2. Push notification and In-app notification:
    ...        Title: Your program goal has been updated. Please view the update from your caregivers.
    ...     3. Push notification and In-app notification:
    ...        Title: Your program goal has been deleted. Please view the update from your caregivers.
    [Tags]      BIOC-GOALS-19         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-GOALS-PROGRESS-01: Add an answer
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Progress tab
    ...     - The user has not answered any questions in this card
    ...
    ...     Test Steps:
    ...     1. Press on Add button
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Goal question screen
    [Tags]      BIOC-GOALS-PROGRESS-01          BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-GOALS-PROGRESS-02: Edit the answer
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Progress tab
    ...     - The user has answered at least one of all questions in this card
    ...
    ...     Test Steps:
    ...     1. Press on Edit button
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Goal question screen with the answered question
    [Tags]      BIOC-GOALS-PROGRESS-02          BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-GOALS-PROGRESS-03: Select date section
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Progress tab
    ...
    ...     Test Steps:
    ...     1. Press on Select date section
    ...     2. Press on Disable date
    ...     3. Press on No answer date
    ...     4. Press on In complete date
    ...     5. Press on Completed date
    ...     6. Press on Close button
    ...
    ...     Expected Output:
    ...     1. Calendar shall display the current month, 4 statuses for each date on the calendar:
    ...        - Disable: If that date is before the oldest starting date of the In-progress goals or in the future. (No dot)
    ...        - No answer: If there are not any answers to the goal questions on that date. (grey dot)
    ...        - In complete: If the user has answered at least one goal question but not all the goal questions on that date. (yellow dot)
    ...        - Completed: If the user has answered all the goal questions on that date. (green dot)
    ...     3. The app shall only show the card for that date
    ...     4. The app shall only show the card for that date
    ...     5. The app shall only show the card for that date
    ...     6. Clear the selected date and show the list of cards
    [Tags]      BIOC-GOALS-PROGRESS-03          BIOC-1.22.0  manual  R1
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
