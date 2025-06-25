*** Settings ***
Documentation   Biocare app Home tab test suite
Metadata    sid     BIOC-HOME
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-HOME       mapp
Test Timeout    1h

*** Test Cases ***
BIOC-HOME-USERNAVIGATE-01: View the User navigation modal
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user has currently not had any studies or programs and has not connected to the Bioheart device
    ...     - The provided information does not match any active study in the database
    ...
    ...     Test Data:
    ...     - Acc: s29@yopmail.com/00000000
    ...
    ...     Test Steps:
    ...     1. Sign in and view the Home screen
    ...
    ...     Expected Output:
    ...     1. The User navigation modal shall display:
    ...        - Title: Get started!
    ...        - Content: Welcome to Biocare Health app! Please get the service you want to use.
    ...          + Service card:
    ...            * Start now button
    ...            * Content: A clinic-provided service for monitoring your health.
    ...            * Discover more button
    ...          + Bioheart card:
    ...            * Connect now button
    ...            * Content: A continuous heart rhythm monitor.
    ...            * Discover more button
    ...        - Close button
    [Tags]      BIOC-HOME-USERNAVIGATE-01        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-USERNAVIGATE-02: When click on Discover more button
    [Documentation]     Author: Han Nguyen
    ...
    ...     Test Data:
    ...     - Acc: s29@yopmail.com/00000000
    ...
    ...     Test Steps:
    ...     1. Press on Discover more button
    ...
    ...     Expected Output:
    ...     - Services card navigate the user to the website: Home - Biotricity
    ...     - Bioheart card navigate the user to the website: Individuals - Biotricity
    [Tags]      BIOC-HOME-USERNAVIGATE-02        BIOC-1.14.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-USERNAVIGATE-03: User navigation modal shall display again
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on User navigation modal
    ...
    ...     Test Steps:
    ...     1. Press on close button
    ...     2. The user signs out and signs in again
    ...     3. Re-installs the app
    ...     4. The user signs out and signs in again with a different account
    ...
    ...     Expected Output:
    ...     1. Close the modal
    ...     2. User navigation modal shall no display
    ...     3. User navigation modal shall display again
    ...     4. User navigation modal shall display again
    [Tags]      BIOC-HOME-USERNAVIGATE-03        BIOC-1.14.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-USERNAVIGATE-04: Start Services
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on User navigation modal
    ...
    ...     Test Steps:
    ...     1. Press on Start now button
    ...     2. Enter ref code and press on Start monitoring button
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Servcies tab
    ...     2. EC consent shall display
    [Tags]      BIOC-HOME-USERNAVIGATE-04        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-USERNAVIGATE-05: Connect Bioheart device
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is on User navigation modal
    ...
    ...     Test Steps:
    ...     1. Press on Connect now button
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the pair device screen and connect device successfull
    [Tags]      BIOC-HOME-USERNAVIGATE-05        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-01: View the Home screen - Self-tracking for Health
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user has not started CP
    ...     - The user has no previous CP
    ...
    ...     Test Steps:
    ...     1. Visually the Home screen
    ...     2. Swipe left to switch banner
    ...
    ...     Expected Output:
    ...     1. Self-tracking for Health card:
    ...        - Learn more button
    ...        - Content: Dive into self-tracking – It’s your journey to a healthier life!
    ...        - Get started button
    ...        Favorites card
    ...        Health report
    ...        Bell notification button
    ...        Add manually button
    ...     2. Request Insurance banner:
    ...        - Title: Insurance provided personal biometric devices
    ...        - View more button
    ...        - Content: Tap to send a request to your clinic
    ...        - Request button
    [Tags]      BIOC-HOME-01        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-02: View the Home screen - Request insurance banner
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user has not previously registered for the CCM, RPM, or CCM&RPM services
    ...     - The user has not completed the process before
    ...
    ...     Test Steps:
    ...     1. Viasully the Home screen
    ...     2. Press on View more button
    ...     3. Press anywhere outside popup or press on Got it button and turn off internet
    ...     4. Turn on internet and press Request button
    ...     5. Press on Okay button
    ...
    ...     Expected Output:
    ...     1. Request insurance banner shall be displayed:
    ...        - Title: Did you know you can get FREE insurance provided devices to monitor your health at home?
    ...        - View more button
    ...        - Content: Tap to send a request to your clinic.
    ...        - Request button
    ...     2. Message: Many insurance companies provide personal biometric devices through physicians to support you in managing your health and lifestyle.
    ...                 Please send a request to your clinic for review.
    ...        - Got it button
    ...     3. The app shall display the snackbar with content: “Fail to send. Please try again”
    ...     4. The modal displayed:
    ...        - Content: Your request has been entered.
    ...        - Okay button
    ...     5. Close the modal and back to the Home screen
    [Tags]      BIOC-HOME-02        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-03: View navigation bar
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...
    ...     Test Steps:
    ...     1. Visually the navigation bar
    ...
    ...     Expected Output:
    ...     1. The navigation bar will contain these buttons:
    ...        - Home
    ...        - Summary
    ...        - Devices
    ...        - Services
    ...        - Profile
    [Tags]      BIOC-HOME-03        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-04: View Home screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is on Home screen
    ...     - The user has started CP
    ...
    ...     Test Steps:
    ...     1. Visually the Home screen
    ...
    ...     Expected Output:
    ...     1. - Today's plan (If linked care plan)
    ...        - Daily health log (If linked care plan)
    ...        - Bioheart card (If monitore device)
    ...        - Favorites card
    ...        - Health report
    ...        - Trends
    ...        - Bell notification button
    ...        - Add manually button
    ...        - Message icon
    [Tags]      BIOC-HOME-04        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-TODAYPLAN-01: View today's plan timeline (enable)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is in Home screen
    ...     - The user is linked program
    ...
    ...     Test Steps:
    ...     1. Visually the Today's plan timeline
    ...
    ...     Expected Output:
    ...     1. The today’s plan timeline is divided into 4 sections:
    ...        - Morning 00h am to 12 pm
    ...        - Afternoon 12h01 pm to 5 pm
    ...        - Evening 5h01m pm to 9 pm
    ...        - Night 9h01m pm to 11h59 pm
    ...        If the users have already done the daily log at Cardiac on the day they join Biocare, the home page of Biocare will not display the today’s plan timeline
    ...        If the users have not done the daily log at Cardiac on the day, they join Biocare, the home page will show the today’s plan timeline
    [Tags]      BIOC-HOME-TODAYPLAN-01       BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-TODAYPLAN-02: Types of cards
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is in Home screen
    ...     - The user is linked program
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - There are 4 types of cards that are presented on the today’s plan timeline:
    ...       + Add measurements: The Add measurement card should be set at 00am to ensure it always appears as the first card of the morning section
    ...       + Take medication: The medication can have multiple cards that appear corresponding to their time to take set on the today’s plan timeline
    ...            * If the medication has been logged, the corresponding medication card in the Today’s plan section shall be removed
    ...       + Appointment: The appointment can have multiple cards that appear corresponding to their appointment time on the today’s plan timeline
    ...            * If an Appointment is done/canceled the corresponding card in the Today’s plan section shall be removed.
    ...            * If an Appointment is overdue (after 30 minutes since the appointment started or the duration of the appointment is over), the corresponding card in the Today’s plan section shall be removed.
    ...       + Add activity level: The activity card should be set at 9pm to ensure it always appears as the last card of the evening section
    [Tags]      BIOC-HOME-TODAYPLAN-02        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-TODAYPLAN-DETAIL-01: Add measurement
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is in Home screen
    ...     - The user is linked program
    ...
    ...     Test Steps:
    ...     1. Press on Add measurement card
    ...     2. Press on Done or Close button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Measurement question screen:
    ...        - Title: Hello, <patient's name>
    ...        - The question: What are your measurements?
    ...        - Blood pressure card
    ...        - Heart rate card
    ...        - Blood oxygen card
    ...        - Body temperate card
    ...        - Weight card
    ...        - Done button
    ...        - Close button
    ...     2. The updated information is saved and close screen
    [Tags]      BIOC-HOME-TODAYPLAN-DETAIL-01       BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-TODAYPLAN-DETAIL-02: Take medication
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is in Home screen
    ...     - The user is linked program
    ...
    ...     Test Steps:
    ...     1. Press on Take medication card
    ...     2. Press on Close icon button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Schedule tab of the medication screen and the corresponding medication dialog shall pop
    ...     2. The popup is closed and display schedule medication screen
    [Tags]      BIOC-HOME-TODAYPLAN-DETAIL-02      BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-TODAYPLAN-DETAIL-03: Add activity level
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is in Home screen
    ...     - The user is linked program
    ...
    ...     Test Steps:
    ...     1. Press on Add activity level card
    ...     2. Click on Plus button to set activity level
    ...     3. Press on Done or close icon button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Activity question screen
    ...        - Title: Hello, <patient's name>
    ...        - The question: How active have you been today?
    ...        - Walking
    ...        - Running
    ...        - Close button
    ...        - Done button
    ...     2. The updated activity level is saved and close activity level screen
    [Tags]      BIOC-HOME-TODAYPLAN-DETAIL-03       BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-TODAYPLAN-DETAIL-04: Join appointment
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is in Home screen
    ...     - The user is linked program
    ...
    ...     Test Steps:
    ...     1. Press on Join appointment card
    ...
    ...     Expected Output:
    ...     1. Navigate to the upcoming appointment list
    [Tags]      BIOC-HOME-TODAYPLAN-DETAIL-04      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-BIOHEART-01: View Bioheart section on Home screen - Connected
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Paired Bioheart device
    ...     - The user is in Home screen
    ...
    ...     Test Steps:
    ...     1. View Bioheart section
    ...     2. Press on View live rhythm button
    ...     3. Press on Historical rhythm button
    ...     4. Press on Snapshot diary button
    ...     5. Press on Heart rate card
    ...     6. Press on HRV card
    ...     7. Press on Resting HR card
    ...
    ...     Expected Output:
    ...     1. View live rhythm button
    ...        Historical rhythm button
    ...        Snapshot diary button
    ...        Heart rate card
    ...        HRV card
    ...        Resting HR card
    ...     2. Navigate the user to the View heart rhythm screen (Live ECG)
    ...     3. Navigate the user to the View heart rhythm screen
    ...     4. Navigate the user to the Snapshot diary screen
    ...     5. Navigate the user to the Heart rate screen
    ...     6. Navigate the user to the HRV screen
    ...     7. Navigate the user to the Resting HR screen
    [Tags]     BIOC-HOME-BIOHEART-01        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-BIOHEART-02: View Bioheart section on Home screen - Disconnected
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Paired Bioheart device but disconnected
    ...     - The user is in Home screen
    ...
    ...     Test Steps:
    ...     1. View Bioheart section
    ...
    ...     Expected Output:
    ...     1. "Device is disconnected" display
    ...         Disable View live rhythm button
    [Tags]     BIOC-HOME-BIOHEART-02        BIOC-1.14.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-FAVORITES-01: View Favorites section
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...     1. View Favorites section
    ...     2. View card
    ...     3. Press on Quality of life card
    ...     4. Pair or not pair Bioheart device
    ...
    ...     Expected Output:
    ...     1. The set up favorite screen shall include the list of all measurement:
    ...        - Medications (default)  1
    ...        - Heart rate (default)   2
    ...        - Heart rate variability
    ...        - Resting heart rate
    ...        - Blood pressure
    ...        - Blood oxygen
    ...        - Body temperature
    ...        - Sleep (default)    3
    ...        - Steps (default)    4
    ...        - Walking
    ...        - Running
    ...        - Active minutes
    ...        - Weight
    ...        - Symptoms
    ...        - Quality of life (default)  5
    ...        Edit button
    ...     2. Every card shall display this information:
    ...        - Latest updated time (except for medication, and QOL and Symptoms).
    ...          + Format: 0s < latest time < 1min, display: “Just now”
    ...          + The latest time is in the current date: “[Hour]:[minute] [AM/PM]” (example: 09:56 AM)
    ...          + The latest time is not on the current date: “[Month] [Date]”. (example: Jun 22)
    ...        - Title of measurement
    ...        All cards will be sorted by the latest time (from latest to oldest). Every time a card is updated data it will reorder
    ...        - The medication shall be pin on the top of the list
    ...        - The QOL shall be pin at the bottom of the list
    ...     3. Navigate the user to the Quality-of-life assessment screen and open the latest QOL test result
    ...     4. The heart rate, heart rate variability, resting heart rate section in favorites shall not display
    [Tags]     BIOC-HOME-FAVORITES-01        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-FAVORITES-02: Set up Favorites section
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user in Home screen
    ...
    ...     Test Steps:
    ...     1. Press on Edit button
    ...     2. Tapping on the whole section
    ...
    ...     Expected Output:
    ...     1. Add favorites screen:
    ...        Heart:
    ...        - Heart rate
    ...        - Heart rate variability
    ...        - Resting heart rate
    ...        Vitals:
    ...        - Blood pressure
    ...        - Blood oxygen
    ...        - Body temperature
    ...        Activities:
    ...        - Sleep
    ...        - Steps
    ...        - Walking
    ...        - Running
    ...        - Active minutes
    ...        Body:
    ...        - Weight
    ...        Medications:
    ...        - Medications
    ...        Personal health sur vey (Qol):
    ...        - Monthly quality of life
    ...        Symptoms:
    ...        - Symptoms
    ...     2. The user can check or uncheck. There is a heart display the status check or uncheck.
    ...        - The checked section shall be displayed in the favorites section.
    ...        - The monitored measurements on the portal shall be automatically displayed in the favorites section.
    ...        - If the app is pairing to a Bioheart device these sections shall be disabled and checked.
    ...          + Heart rate
    ...          + Heart rate variability
    ...          + Resting heart rate
    ...        - The setup shall be saved locally according to the device. When the user logins with different accounts, the device shall check this account’s user id:
    ...          + If this account’s userId exists in the local storage, the app shall display the account’s setup stored on that device.
    ...          + If this account’s userId exists in the local storage, the app shall display the default setup on that device.
    [Tags]     BIOC-HOME-FAVORITES-02        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-STUDYMODAL-01: Installing and opening the app
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Study ON GOING (Biotres or Bioflux)
    ...     - The patient info in the portal match with patient info in the app (First Name/Last Name/DOB)
    ...
    ...     Test Steps:
    ...     1. Installing and opening the app
    ...     2. Press on Monitor your study button
    ...
    ...     Expected Output:
    ...     1. The auto-populated modal shall display in Home screen
    ...     2. Navigate to the study details with ongoing study without inputting study code
    ...        - The auto-populate modal in Home screen not display
    [Tags]     BIOC-HOME-STUDYMODAL-01        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-STUDYMODAL-02: Opening the app - user is staying Home screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Study ON GOING (Biotres or Bioflux)
    ...     - The patient info in the portal match with patient info in the app (First name/Last name/DOB)
    ...
    ...     Test Steps:
    ...     1. Reload Home screen
    ...
    ...     Expected Output:
    ...     1. The auto-populate modal shall display in Home screen
    [Tags]     BIOC-HOME-STUDYMODAL-02        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-STUDYMODAL-03: Press on X button in the auto-populate modal
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Study ON GOING (Biotres or Bioflux)
    ...     - The patient info in the portal match with patient info in the app (First name/Last name/DOB)
    ...
    ...     Test Steps:
    ...     1. Press on X button in the auto-populate modal
    ...     2. Press on Monitor your study button
    ...
    ...     Expected Output:
    ...     1. The auto-populate banner in Home screen shall be displayed
    ...     2. Navigate to Study details screen with ongoing study without inputting study code
    ...       - The auto-populate banner in Home screen is disappeared
    [Tags]     BIOC-HOME-STUDYMODAL-03        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-STUDYMODAL-04: Press on X button in the auto-populate banner
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Study ON GOING (Biotres or Bioflux)
    ...     - The patient info in the portal match with patient info in the app (First name/Last name/DOB)
    ...
    ...     Test Steps:
    ...     1. Press on X button in the auto-populate modal
    ...     2. Press on X button in the auto-populate banner
    ...
    ...     Expected Output:
    ...     1. The auto-populate banner is disappeared
    ...        - If user wants to monitor the ongoing study > user must input study code
    [Tags]     BIOC-HOME-STUDYMODAL-04        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-STUDYMODAL-05: Sign in another account
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Study ON GOING (Biotres or Bioflux)
    ...     - The patient info in the portal match with patient info in the app (First name/Last name/DOB)
    ...
    ...     Test Steps:
    ...     1. Press on X button in the auto-populate modal
    ...     2. Press on X button in the auto-populate banner
    ...     3. Sign out and sign in snother account
    ...     4. Sing out and sign in old account
    ...
    ...     Expected Output:
    ...     1. The auto-populate banner is disappeared
    ...        - If user wants to monitor the ongoing study > user must input study code
    ...     4. The auto-populate modal in Home screen shall be displayed
    [Tags]     BIOC-HOME-STUDYMODAL-05        BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-STUDYMODAL-06: Sign in + Sign out 1 account
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Study ON GOING (Biotres or Bioflux)
    ...     - The patient info in the portal match with patient info in the app (First name/Last name/DOB)
    ...
    ...     Test Steps:
    ...     1. Press on X button in the auto-populate modal
    ...     2. Press on X button in the auto-populate banner
    ...     3. Sign out and sign in
    ...
    ...     Expected Output:
    ...     2. The auto-populate banner is disappeared
    ...     3. The auto-populate modal is disappeared
    [Tags]     BIOC-HOME-STUDYMODAL-06        BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-STUDYMODALPRIORITY-01: The 1st time install app
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Study ON GOING (Biotres or Bioflux)
    ...     - The patient info in the portal match with patient info in the app (First name/Last name/DOB)
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - What’s new > In-app tutorial > Auto populate modal
    [Tags]     BIOC-HOME-STUDYMODALPRIORITY-01        BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-STUDYMODALPRIORITY-02: App installed - use viewed in-app tutorial
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Study ON GOING (Biotres or Bioflux)
    ...     - The patient info in the portal match with patient info in the app (First name/Last name/DOB)
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Auto-populate modal
    [Tags]     BIOC-HOME-STUDYMODALPRIORITY-02        BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-STUDYMODALPRIORITY-03: App installed - user has not viewed in-app tutorial
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Study ON GOING (Biotres or Bioflux)
    ...     - The patient info in the portal match with patient info in the app (First name/Last name/DOB)
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - In-app tutorial > Auto populate modal
    [Tags]     BIOC-HOME-STUDYMODALPRIORITY-03        BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-STUDYMODALPRIORITY-04: Upgrade app - the new version has new in-app tutorial
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Study ON GOING (Biotres or Bioflux)
    ...     - The patient info in the portal match with patient info in the app (First name/Last name/DOB)
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - In-app tutorial > Auto populate modal
    [Tags]     BIOC-HOME-STUDYMODALPRIORITY-04        BIOC-1.14.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-STUDYMODALPRIORITY-05: Upgrade app - the new version has no new in-app tutorial
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Study ON GOING (Biotres or Bioflux)
    ...     - The patient info in the portal match with patient info in the app (First name/Last name/DOB)
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Auto-populate modal
    [Tags]     BIOC-HOME-STUDYMODALPRIORITY-05        BIOC-1.14.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-TRENDS-01: View Trends when no have data
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is in Home screen
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Last week’s timeframe display. This will be updated at 23:55 every Sunday.
    ...     - Type: [MMM] [Day] – [MMM] [Day]
    ...     - Message: Consistency is key to seeing progress. Stick to your steps, sleep, and calorie goals and view your progress after a week.
    [Tags]      BIOC-HOME-TRENDS-01       BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-TRENDS-02: View Sleep card
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is in Home screen
    ...     - The user is set goal for steps, sleep and activity
    ...
    ...     Test Steps:
    ...     1. Visually sleep card
    ...     2. Click on the Card
    ...     3. Click on back button
    ...
    ...     Expected Output:
    ...     1. Sleep card shall display:
    ...        - Avg sleep time value of the last week. Type: [Hour] [Minute] (AVG)
    ...        - Chart of the latest week:
    ...          + The day which completes the goal will turn green
    ...          + There shall be a line with a star to show the goal level
    ...        - Level of goal complement of that week (the number of dates which complete the goal)
    ...     2. Navigate to the Last week of the Week tab
    ...        - The card only displays if these conditions are achieved:
    ...          + The user has set a sleep goal.
    ...          + There is data in the last week.
    ...          + There is at least 1 day in the last week that achieved the goal.
    ...     3. Navigated to the Home screen
    [Tags]      BIOC-HOME-TRENDS-02       BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-TRENDS-03: View Steps card
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is in Home screen
    ...     - The user is set goal for steps, sleep and activity
    ...
    ...     Test Steps:
    ...     1. Visually Steps card
    ...     2. Click on the Card
    ...     3. Click on back button
    ...
    ...     Expected Output:
    ...     1. Total steps value of the latest week
    ...        - Chart of the latest week:
    ...          + The day which completes the goal will turn green
    ...          + There shall be a line with a star to show the goal level
    ...        - Level of goal complement of that week (the number of dates which complete the goal)
    ...     2. Navigate to the Last week of the Week tab
    ...        - The card only displays if both conditions are achieved:
    ...          + The user has set a steps goal
    ...          + There is data in the last week.
    ...          + There is at least 1 day in the last week that achieved the goal.
    ...     3. Navigated to the Home screen
    [Tags]      BIOC-HOME-TRENDS-03       BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-TRENDS-04: View Clories card
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is in Home screen
    ...     - The user is set goal for steps, sleep and activity
    ...
    ...     Test Steps:
    ...     1. Visually Calories card
    ...     2. Click on the Card
    ...     3. Click on back button
    ...
    ...     Expected Output:
    ...     1. Avg calories burned value of the last week
    ...        - Chart of the latest week:
    ...          + The day which completes the goal will turn green
    ...          + There shall be a line with a star to show the goal level
    ...        - Level of goal complement of that week (the number of dates which complete the goal)
    ...     2. Navigate to the Last week of the Week tab
    ...        - The card only displays if both conditions are achieved:
    ...          + The user has set a steps goal
    ...          + There is data in the last week.
    ...          + There is at least 1 day in the last week that achieved the goal.
    ...     3. Navigated to the Home screen
    [Tags]      BIOC-HOME-TRENDS-04       BIOC-1.14.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HOME-HELPCENTER-01: View floating Help canter
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is in Home screen
    ...
    ...     Test Steps:
    ...     1. Click the floating Help center
    ...
    ...     Expected Output:
    ...     1. Navigate the User Guide screen:
    ...        - Bioheart Guide
    ...        - Bioflux guide
    ...        - Biocore Guide
    [Tags]      BIOC-HOME-HELPCENTER-01      BIOC-1.16.0  manual  R1
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
