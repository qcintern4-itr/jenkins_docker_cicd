*** Settings ***
Documentation   Biocare app Bioflux study test suite
Metadata    sid     BIOC-BIOFLUX
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-BIOFLUX  mapp
Test Timeout    1h

*** Test Cases ***
BIOC-BIOFLUX-NOCAREPLAN-01: Monitor Bioflux device
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Enter valid study code and press start monitoring button
    ...     2. Press on Next/Back button
    ...     3. Press on Got it or X button
    ...     4. Leave monitoring and monitor study again
    ...
    ...     Expected Output:
    ...     1. Monitor device successfully
    ...        - The 1st time connect device, displaying the Bioflux quick guide
    ...     2. Navigate to the next/previous screen
    ...     3. Close the screen and displaying Bioflux study screen
    ...     4. Bioflux study screen shall display without quick guide
    [Tags]      BIOC-BIOFLUX-NOCAREPLAN-01         BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOFLUX-01: The first time monitor Bioflux device
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Press on Start monitoring button
    ...     2. Enter valid study code and submit
    ...     3. Press on Next/Back button
    ...     4. Press on Got it or X button
    ...     5. Leave monitoring and monitor study again
    ...
    ...     Expected Output:
    ...     2. Connect device successfully
    ...        - The 1st time connect device, displaying the Bioflux quick guide
    ...     3. Navigate to the next/previous screen
    ...     4. Close the screen and displaying Bioflux study screen
    ...     5. Bioflux study screen shall display without quick guide
    [Tags]      BIOC-BIOFLUX-01         BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOFLUX-02: View Bioflux study screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...     - The study is started
    ...
    ...     Test Steps:
    ...     1. Press on View study button
    ...
    ...     Expected Output:
    ...     1. Navigate to Bioflux study screen
    ...        - Bioflux study section
    ...          + Device illustration – the type illustration will be displayed according to the following points
    ...            * If the device is online, electrodes connection is stable, battery level is good and the device is not connected to the charger
    ...              => It shall be the normal screen of an ongoing study.
    ...            * If the device is offline => It shall be the LOW CELL SIGNAL screen displayed.
    ...            * If the device is online, battery level is good but the electrodes connection is disconnected
    ...              => It shall be the ALERT NOTIFICATION screen displayed.
    ...            * If the device is online, electrodes connection is good but the battery is low => It shall be LOW BATTERY screen displayed.
    ...            * If the device is being connected to the charger => It shall be the BATTERY CHARGING screen displayed.
    ...         + Study - XXXXX
    ...         + Device ID
    ...         + Device status - Server connection
    ...           * Online – the device is connected to the Biotricity server
    ...           * Offline – the device is disconnected from the server due to low cell signal or powered off for more than 2 hours
    ...           * Active Xm ago, Xh ago (when the device has been offline for less than 2 hours)
    ...         + Battery level
    ...           * Displays the current percentage + text Battery
    ...               • If the battery level is greater than or equal to 20%, the battery percentage shall be filled with green color.
    ...               • If the battery level is less than 20%, the battery level percentage shall be filled with red color
    ...           * If the battery is connected to the charger, there shall be a charging icon displayed, the battery percentage shall be filled with black color.
    ...           * Note: If the device is turned off before being charged. When it is powered on, the battery level is displayed as 0% until the device is disconnected from the charger
    ...         + Electrodes connection (Good/ Partial contact)
    ...         + Study progress bar
    ...           * If the study is running, it follows the following format
    ...               • If the study remaining time is less than one day: Xh XXm left
    ...               • If the study remaining time is more than one day: XD XXh XXm left
    ...           * If the study is paused, displays: Study Paused
    ...       - The most common issue during the last 6 hours (only displayed if there is no current alert displayed)
    ...         + Issue found. It can be one of the following issue
    ...           * One or more electrodes have been disconnected
    ...           * The device has been offline for more than 12 hours
    ...           * The study has been paused for more than 8 hours
    ...         + Press on View solutions button navigate to Troubleshooting screen
    ...       - Reminder - displayed if one of the 2 following issues happen
    ...         + Unstable network connectivity for a few minutes – “Your device has been offline. Low cell signal may be the cause.” with Okay button. Clicking the button shall dismiss the reminder
    ...         + One or more electrode disconnected for a few minutes - “One or more cable wires seems loose for a good study” with Okay button. Clicking the button shall dismiss the modal
    ...       - Attention needed! banner - displaying when issue occurs more than 2 hours
    ...         + One or more cable wires has been disconnectes for more than 2 hours. Please click the button below for help - press on Preceed with assistance to show Electrode Placement on Body video
    ...       - Support section
    ...         + Previous studies
    ...         + User manual
    ...         + Quick guide
    ...         + Troubleshooting
    ...         + Contact support
    ...       - Leave monitoring button
    [Tags]      BIOC-BIOFLUX-02     BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOFLUX-03: View Bioflux study screen when no internet
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Bioflux study screen
    ...     - The study is started
    ...
    ...     Test Steps:
    ...     1. Turn off the Internet on the phone
    ...     2. Press on Go to settings button
    ...
    ...     Expected Output:
    ...     1. - Title: Oops, No internet connection.
    ...        - Content: Please check your network connection and try again.
    ...        - Go to Settings button: This modal shall continue to be displayed until the mobile device establishes the connection with Internet successfully
    ...     2. Navigate the user to the Settings of the phone.
    [Tags]      BIOC-BIOFLUX-03    BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOFLUX-04: Complete Bioflux study
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...     - The study is started
    ...
    ...     Test Steps:
    ...     1. Wait for study complete or stop study in the portal
    ...     2. Press on Okay button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Start monitoring screen and there shall be a modal displayed notifying the user that the study has been completed.
    ...         + Press on OK button to close popup
    ...     - The user is on the s screen or close app
    ...         + Others screen
    ...             * There shall be a modal displayed notifying the user that the study has been completed
    ...             * Press on OK button to close popup
    ...         + Close app
    ...             * When open the app, There shall be a modal displayed notifying the user that the study has been completed
    ...             * Press on OK button to close popup
    [Tags]      BIOC-BIOFLUX-04     BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOFLUX-05: Refer to Bioflux
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...     - The study is started
    ...
    ...     Test Steps:
    ...     1. Wait for study complete or stop study in the portal
    ...     2. Press on Okay button
    ...     3. Press on Share now button
    ...
    ...     Expected Output:
    ...     2. The Refer friends modal shall display with the following components:
    ...        - Content: Invite a friend to join Biocare - an all-in-one app designed to integrate all Biotricity products, offering a holistic view of your health, in the palm of your hands.
    ...        - Share now button
    ...        - Later button
    ...     3. The Share link via bottom sheet shall appear
    [Tags]      BIOC-BIOFLUX-05     BIOC-1.14.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOFLUX-SUPPORT-01: View Previous studies screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Bioflux study screen
    ...
    ...     Test Steps:
    ...     1. Press on Previous studies tab
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the User manual screen and open the pdf viewer
    ...        - User can scroll to view full content
    ...        - User can close screen by pressing close button
    [Tags]      BIOC-BIOFLUX-SUPPORT-01     BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOFLUX-SUPPORT-02: View User manual screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Bioflux study screen
    ...
    ...     Test Steps:
    ...     1. Press on User manual tab
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the User manual screen and open the pdf viewer
    ...        - User can scroll to view full content
    ...        - User can close screen by pressing close button
    [Tags]      BIOC-BIOFLUX-SUPPORT-02     BIOC-1.14.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOFLUX-SUPPORT-03: View Quick guide & videos screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Bioflux study screen
    ...
    ...     Test Steps:
    ...     1. Press on Quick guide & videos tab
    ...     2. Press on Quick guide section
    ...     3. Press on Close button
    ...     4. Press on How to Videos tab
    ...     5. Press on Play icon
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Quick guide & videos screen
    ...        - Quick guide section
    ...        - How to Videos section
    ...     2.
    ...     4. Displays a list of videos, each video card has the following attributes:
    ...        - Text: PLAY VIDEO
    ...        - Video name
    ...        - Play icon
    ...     5. Navigate to the Video
    ...        - Play/Pause button for the user to play and pause the video
    ...        - Loading icon if the video is loading or the Internet connection is lost
    ...        - Red dot on the video progress bar for the user to head to the design point of the video
    ...        - Current time
    ...        - Duration
    ...        - The user can also long press the screen then swipe left or right to rewind or fast forward the video
    ...        - X button for the user to close the current video
    [Tags]      BIOC-BIOFLUX-SUPPORT-03     BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOFLUX-SUPPORT-04: View Troubleshooting screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Bioflux study screen
    ...
    ...     Test Steps:
    ...     1. Press on Troubleeshooting tab
    ...     2. Press on Lead connection
    ...     3. Press on Server connection
    ...     4. Press on Study paused
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Troubleshooting screen:
    ...        - Text: Select your issue to view its solution
    ...          + Lead connection
    ...          + Server connection
    ...          + Study pause
    ...     2. The user shall be able to view the video
    ...        - Text: PLAY VIDEO
    ...        - Body placement
    ...        - Play icon
    ...     3. Solutions with illustration displayed, the content shall be as follows:
    ...        - Message
    ...          + The device is offline. This occurs when the device is powered off, out of battery, in a low signal area OR when there is no internet connection.
    ...          + Confirm the device is powered on, has sufficient charge, and that your network signal or internet connection are stable.
    ...          + If you have tried the suggested solutions and your device still will not turn on, tap here to contact Customer Support for assistance.
    ...            * Contact support button. Clicking the button shall open the Contact Support screen
    ...     4. Message displayed as follows: Your study pauses automatically when the device is removed for charging. To continue your study, wear the device as instructed.
    [Tags]      BIOC-BIOFLUX-SUPPORT-04     BIOC-1.14.0  manual  R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOFLUX-SUPPORT-05: View Contact support screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Bioflux study screen
    ...
    ...     Test Steps:
    ...     1. Press on Contact support tab
    ...
    ...     Expected Output:
    ...     1. Navigate to Contact information screen
    ...        - Department: Biotricity Customer Support
    ...        - Phone number: 1-800-590-4155.Tapping the number shall displays
    ...           + On iOS – a banner with the following format
    ...                 o Call 1-800-590-4155
    ...                 o Cancel button
    ...           + On Android OS – a phone app with number autofilled
    ...        - Email address: cs@biotricity.com. Tapping the email address shall open the default e-mail app with “To:” autofilled
    [Tags]      BIOC-BIOFLUX-SUPPORT-05     BIOC-1.14.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOFLUX-SUPPORT-06: Verify the follow-on study banner
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the follow-on study with the bioflux device
    ...     - log in the app
    ...     - Connect app with the follow-on study
    ...
    ...     Test Steps:
    ...     1. Check the banner is displayed on the follow- on study
    ...
    ...     Expected Output:
    ...    - This banner will only be displayed in the first study of the follow-on study type.
    ...    - The banner will have:
    ...       + Title: Follow-on Study
    ...       + Content: There will be a follow-on study available for you after this study ends. Please continue to wear the device until the follow-on study is complete.
    ...    - When the first study is completed, this banner will disappear.
    [Tags]      BIOC-BIOFLUX-SUPPORT-06      BIOC-1.19.0   manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOFLUX-NOTIFICATION-01: The app receive notification of issue during the study
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - There is an issue found every 2 hours
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - There has been an electrode disconnection for more than 2 hours (device is online)
    ...         + Title: Biocare
    ...         + Content: There is an issue with your study. One or more cable wires have been disconnected for more than 2 hours
    ...     - Study has been paused for more than 8 hours (device is online)
    ...         + Title: Biocare
    ...         + Content: There is an issue with your study. It has been paused for more than 8 hours
    ...     - Tapping the notification shall navigate the user to the Study screen with the banner displayed if the issue has not been resolved yet
    ...     - One user signs in the same account on different mobile phones
    ...         + After signing in and entering the Study screen successfully (by inputing valid reference code) on one mobile phone, the user shall receive notifications if there is any issue found.
    ...         + To receive notifications on other phones, they are required to enter the reference code on those
    ...     - Different users sign in different accounts on different mobile phones and inputing the same reference code shall all receive the same notification if there is any issue found
    [Tags]      BIOC-BIOFLUX-NOTIFICATION-01        BIOC-1.22.0  manual  R1
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
