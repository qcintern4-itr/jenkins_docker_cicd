*** Settings ***
Documentation   Biocare app Message test suite
Metadata    sid     BIOC-MESSAGE
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-MESSAGE   mapp
Test Timeout    1h

*** Test Cases ***
BIOC-MESSAGE-01: Chat feature has never been enabled in the current program.
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The patient needs to have an active program
    ...
    ...     Test Steps:
    ...     1. Press on Services tab
    ...     2. Click on Chat icon
    ...     3. Click on Okey button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Services screen:
    ...        - Chat icon on the top right corner of Services screen
    ...     2. The modal shall appear with:
    ...        - No reminder yet
    ...        - Okey button
    ...     3. Navigate the user to the Services screen
    [Tags]      BIOC-MESSAGE-01        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-02: Chat feature has never been enabled in the current program while there is at least one Reminder from the portal.
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The patient needs to have an active program
    ...
    ...     Test Steps:
    ...     1. Press on Services tab
    ...     2. Click on Chat icon
    ...     3. Click on close button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Services screen:
    ...        - Chat icon on the top right corner of Services screen
    ...     2. The reminder notification screen shall appear with received reminder messages and close button
    ...     3. Navigate the user to the Services screen
    [Tags]      BIOC-MESSAGE-02        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-03: View chat screen Chat with caregivers when enable chat
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The patient needs to have an active program
    ...
    ...     Test Steps:
    ...     1. Press on Services tab
    ...     2. Click on Chat icon
    ...     3. Type some words
    ...     4. Delete all characters
    ...     5. Tap on members button
    ...     6. Tap on back button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Services screen:
    ...        - Chat icon on the top right corner of Services screen
    ...     2. Navigate to the Chat screen:
    ...        - Message title
    ...        - Time of conversation
    ...        - Typing area
    ...        - Attach file button
    ...     3. Send button is displayed
    ...     4. Send button shall be disappeared
    ...     5. The bottom sheet with all members in conversation shall appear when the user taps this button
    ...        - If the member doesn’t belong to any above facility portal role, the role of that member shall not display in app
    ...     6. Navigate the user to the previous screen
    [Tags]      BIOC-MESSAGE-03        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-04: View chat screen Chat with caregivers when disable chat
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The patient needs to have an active program
    ...
    ...     Test Steps:
    ...     1. Press on Services tab
    ...     2. Click on Chat icon
    ...     3. Tap on members button
    ...     4. Tap on back button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Services screen:
    ...        - Chat icon on the top right corner of Services screen.
    ...     2. Navigate to the Chat screen:
    ...        - Message title
    ...        - Time of conversation
    ...        - Message error: The healthcare provider has disabled messaging for your program
    ...     3. The bottom sheet with all members in conversation shall appear when the user taps this button
    ...        - If the member doesn’t belong to any above facility portal role, the role of that member shall not display in app
    ...     4. Navigate the user to the previous screen
    [Tags]      BIOC-MESSAGE-04        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-05: Typing area
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The patient needs to have an active program
    ...
    ...     Test Steps:
    ...     1. Click on Chat icon.
    ...     2. Input 500 characters.
    ...     3. Input more than it.
    ...     4. Pastes the content over 500 words.
    ...     5. Input any characters.
    ...     6. Tap on send button.
    ...
    ...     Expected Output:
    ...     1. Navigate to the Chat screen.
    ...     2. Displayed warning "Max 500 characters".
    ...     3. Can't type more character.
    ...     4. Snackbar shall be display “Maximum number of characters is 500”.
    ...     5. Send button shall appear.
    ...     6. The message has been sent. Message sent will show:
    ...        - The name of the sender. Format: Full name. Example: Bob Smoak.
    ...        - The time of conversation shall display.
    ...          + Format: Today [HH]:[MM] [AM/PM] if the time of conversation is the current date.
    ...          + Format: Yesterday [HH]:[MM] [AM/PM] if the time of conversation is yesterday.
    ...          + Format: [MMM][DD] [HH]:[MM] [AM/PM] if the time of conversation is before yesterday and in the current year.
    ...          + Format: [MMM][DD], [YYYY] [HH]:[MM] [AM/PM] if the time of conversation is before yesterday and in the previous year.
    [Tags]      BIOC-MESSAGE-05        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-06: Auto-messages
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Duration between the last message and the latest message exceeds one hour.
    ...
    ...     Test Steps:
    ...     1. Send any message.
    ...     2. Many auto-messages are sent at the same time.
    ...     3. Any changes in member.
    ...
    ...     Expected Output:
    ...     1. The conversation shall be broken and its time shall display.
    ...     2. The app will break the conversation with each auto-message and display the time.
    ...     3. The user shall receive notifications.
    [Tags]      BIOC-MESSAGE-06        BIOC-SRS-25-FRS-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-07: Copy Text
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...     1. Taps and holds a sent message.
    ...     2. Select copy icon.
    ...
    ...     Expected Output:
    ...     1. The bottom sheet shall appear with two options Copy or Delete that message.
    ...     2. The message content will be saved to the device’s clipboard. There shall be a snackbar displaying: “Copied to clipboard”.
    [Tags]      BIOC-MESSAGE-07        BIOC-SRS-25-FRS-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-08: Delete Text
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...     1. Taps and holds a sent message.
    ...     2. Select delete icon.
    ...
    ...     Expected Output:
    ...     1. The bottom sheet shall appear with two options Copy or Delete that message.
    ...     2. The message content will be replaced with the text “This message was deleted” which shall be displayed for all users.
    [Tags]      BIOC-MESSAGE-08        BIOC-SRS-25-FRS-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-09: Copy text of the other person
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...     1. Tap and hold the message from the other person that has been sent.
    ...     2. Select copy icon.
    ...
    ...     Expected Output:
    ...     1. The bottom sheet shall appear with option Copy that message.
    ...     2. The message content will be saved to the device’s clipboard. There shall be a snackbar displaying: “Copied to clipboard”.
    [Tags]      BIOC-MESSAGE-09        BIOC-SRS-25-FRS-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-10: Program completed
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The Program is stopped when the user is in the Chat feature.
    ...
    ...     Test Steps:
    ...     1. Verify chat screen.
    ...     2. Tap on View details button.
    ...
    ...     Expected Output:
    ...     1. There shall be a modal with content:
    ...        - Tittle: Health care program completed.
    ...        - Message: Your health care program has been completed. Thank you for choosing our services!
    ...        - View details button.
    ...        - Dismiss button. Tapping this button, the user is still in the Chat feature screen but The Chat feature is disabled.
    ...     2. Navigate the user to the Services tab screen.
    [Tags]      BIOC-MESSAGE-10        BIOC-SRS-25-FRS-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-11: Dismiss modal program completed
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The Program is stopped when the user is in the Chat feature.
    ...
    ...     Test Steps:
    ...     1. Verify chat screen.
    ...     2. Tap on Dimiss button.
    ...
    ...     Expected Output:
    ...     1. There shall be a modal with content:
    ...       - Tittle: Health care program completed.
    ...       - Message: Your health care program has been completed. Thank you for choosing our services!
    ...       - View details button.
    ...       - Dismiss button.
    ...     2. The user is still in the Chat feature screen but The Chat feature is disabled.
    [Tags]      BIOC-MESSAGE-11        BIOC-SRS-25-FRS-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-12: Send attachment
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The patient needs to have the conversation open.
    ...     - The files that the user intends to share, need to be stored in the device.
    ...     - Access to gallery and storage of the user’s device is enabled.
    ...
    ...     Test Steps:
    ...     1. Tap on Attach file button.
    ...     2. Send a file.
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the device’s storage.
    ...     2. Attachment sent successfully.
    [Tags]      BIOC-MESSAGE-12        BIOC-SRS-25-FRS-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-13: Send attachment when there is no permission
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The patient needs to have the conversation open.
    ...     - The files that the user intends to share, need to be stored in the device.
    ...
    ...     Test Steps:
    ...     1. Tap on Attach file button
    ...     2. Tap on Open settings button
    ...
    ...     Expected Output:
    ...     1. The modal asking for permission shall appear:
    ...       - Title: "Bioheart Health" would like to access your photos
    ...       - Message: Please enable Photos access in App Settings
    ...       - Open settings button.
    ...       - Later button.
    ...     2. Navigate the user to the Settings screen on the phone.
    [Tags]      BIOC-MESSAGE-13        BIOC-SRS-25-FRS-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-14: Send attachment when file is bigger than the defined maximum size
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The patient needs to have the conversation open.
    ...     - The files that the user intends to share, need to be stored in the device.
    ...     - Access to gallery and storage of the user’s device is enabled.
    ...
    ...     Test Steps:
    ...     1. Tap on Attach file button.
    ...     2. Send a file.
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the device’s storage.
    ...     2. Snackbar shall appear saying “The maximum upload size is 25 MB”
    [Tags]      BIOC-MESSAGE-14        BIOC-SRS-25-FRS-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-15: Send attachment when no internet connection
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The patient needs to have the conversation open.
    ...     - The files that the user intends to share, need to be stored in the device.
    ...     - Access to gallery and storage of the user’s device is enabled.
    ...     - No internet connection
    ...
    ...     Test Steps:
    ...     1. Tap on Attach file button.
    ...     2. Send a file.
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the device’s storage.
    ...     2. Snackbar shall appear saying “Please check your network connection and try again”
    [Tags]      BIOC-MESSAGE-15        BIOC-SRS-25-FRS-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-16: Internet connection gets disrupted halfway through the sending process
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The patient needs to have the conversation open.
    ...     - The files that the user intends to share, need to be stored in the device.
    ...     - Access to gallery and storage of the user’s device is enabled.
    ...
    ...     Test Steps:
    ...     1. Tap on Attach file button.
    ...     2. Send a file (disrupted halfway through the sending process).
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the device’s storage.
    ...     2. Snackbar shall appear saying “Fail to upload file. Please try again”. The unsuccessful sent message shall have “Failed” status below.
    [Tags]      BIOC-MESSAGE-16        BIOC-SRS-25-FRS-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-17: The system is not able to open it for some reasons (server error…)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The patient needs to have the conversation open.
    ...     - The files that the user intends to share, need to be stored in the device.
    ...     - Access to gallery and storage of the user’s device is enabled.
    ...     - No internet connection.
    ...
    ...     Test Steps:
    ...     1. Tap on the file to open.
    ...
    ...     Expected Output:
    ...     1. The snackbar saying “Something went wrong. Please try again” shall appear.
    [Tags]      BIOC-MESSAGE-17        BIOC-SRS-25-FRS-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-18: Message out of work
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The chat is enabled.
    ...     - The patient sends a message outside of the caregiver’s working hours, but only when both the nurse and physician are also out of working hours.
    ...
    ...     Test Steps:
    ...     1. Send a message outside of the caregiver’s working hours.
    ...
    ...     Expected Output:
    ...     1. This message shall be:
    ...        - Name: Patient Support
    ...        - Content: “Caregivers are currently unavailable as it is outside of working hours. We'll get back to you soon. Thank you for your patience."
    [Tags]      BIOC-MESSAGE-18        BIOC-SRS-25-FRS-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-19: Reminder message when chat feature has never been enabled
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The program is active
    ...
    ...     Test Steps:
    ...     1. Click on Chat icon on the Services tab
    ...
    ...     Expected Output:
    ...     1. The user shall view reminder messages on the Reminder notification screen.
    ...        - This message shall be sent under the name “Patient support”
    [Tags]      BIOC-MESSAGE-19        BIOC-SRS-25-FRS-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-20: Reminder message when chat feature has been enabled
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The program is active.
    ...
    ...     Test Steps:
    ...     1. Click on Chat icon on the Services tab.
    ...
    ...     Expected Output:
    ...     1. The user shall view reminder messages on the conversation regardless of the status of the conversation
    ...        - This message shall be sent under the name “Patient support”
    [Tags]      BIOC-MESSAGE-20        BIOC-SRS-25-FRS-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-21: View notification
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Services tab has Chat icon.
    ...     - There are unread messages in the inbox.
    ...
    ...     Test Steps:
    ...     1. Check UI.
    ...     2. Tap on Chat icon.
    ...     3. Tap on back button.
    ...     4. Receive new message from nurse.
    ...
    ...     Expected Output:
    ...     1. There shall be a red dot on the chat icon.
    ...     2. Navigate to the Chat screen.
    ...     3. The red dot shall disappear.
    ...     4. The user will receive a push notification.
    [Tags]      BIOC-MESSAGE-21        BIOC-SRS-25-FRS-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-22: View notification when the user on other tab apart from Services tab has new messages
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app.
    ...     - There are unread messages in the inbox.
    ...
    ...     Test Steps:
    ...     1. View on screen in the app.
    ...     2. Press on Services tab.
    ...
    ...     Expected Output:
    ...     1. There shall be a red dot on the Services tab.
    ...     2. The app shall navigate the user to the Services tab and the red dot on the Services tab shall disappear.
    [Tags]      BIOC-MESSAGE-22        BIOC-SRS-25-FRS-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-23: Notification dialog when the user turns off message notification
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The message notification is off modal.
    ...
    ...     Test Steps:
    ...     1. Click on the Chat icon on the Services tab.
    ...     2. Click on the Close button.
    ...     3. Click on the Chat icon on the Services tab again.
    ...
    ...     Expected Output:
    ...     1. There shall be a modal containing:
    ...       - Title: Notifications are off
    ...       - Message: “It means you won't be notified when your care team sends you messages. Do you want to change your settings?”
    ...       - App Settings button.
    ...       - Close button.
    ...     2. The modal shall be closed.
    ...     3. This modal don't shall show again.
    [Tags]      BIOC-MESSAGE-23        BIOC-SRS-25-FRS-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-24: Notification dialog
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The message notification is off modal.
    ...
    ...     Test Steps:
    ...     1. Click on the Chat icon on the Services tab.
    ...     2. Click on the App Settings button.
    ...
    ...     Expected Output:
    ...     1. There shall be a modal containing:
    ...       - Title: Notifications are off
    ...       - Message: “It means you won't be notified when your care team sends you messages. Do you want to change your settings?”
    ...       - App Settings button.
    ...       - Close button.
    ...     2. Navigate to the Settings screen.
    [Tags]      BIOC-MESSAGE-24        BIOC-SRS-25-FRS-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-25: Notification after the user's first click
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The message notification is off modal.
    ...     - Have previously clicked on the chat icon.
    ...
    ...     Test Steps:
    ...     1. Click on the Chat icon on the Services tab.
    ...
    ...     Expected Output:
    ...     1. Navigate to the Chat screen.
    [Tags]      BIOC-MESSAGE-25        BIOC-SRS-25-FRS-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-26: Notification permission dialog
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The permission notification for the Biocare app on the phone is off.
    ...
    ...     Test Steps:
    ...     1. Sign in the app.
    ...     2. Click on the later button.
    ...     3. Click on OKey button.
    ...
    ...     Expected Output:
    ...     1. navigates to the Home screen there shall be a modal with the following components:
    ...       - Title: "Biocare Health" would like to send you notifications
    ...       - Message: This will enable reminder notifications of medication intakes or app updates.
    ...       - The Open settings button.
    ...       - The Later button.
    ...     2. The modal shall close and open another modal containing:
    ...       - Title: You can change the permission later in you phone’s settings
    ...       - Message: Settings -> Notifications -> Biocare health -> Allow Notifications
    ...       - The Okay button.
    ...     3. The modal shall close.
    [Tags]      BIOC-MESSAGE-26        BIOC-SRS-25-FRS-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-27: Setting permission notification for the Biocare app
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The permission notification for the Biocare app on the phone is off.
    ...
    ...     Test Steps:
    ...     1. Sign in the app.
    ...     2. Click on Open settings button.
    ...
    ...     Expected Output:
    ...     1. navigates to the Home screen there shall be a modal with the following components:
    ...       - Title: "Biocare Health" would like to send you notifications.
    ...       - Message: This will enable reminder notifications of medication intakes or app updates.
    ...       - The Open settings button.
    ...       - The Later button.
    ...     2. The app shall open the phone permission settings for the Biocare app screen.
    [Tags]      BIOC-MESSAGE-27        BIOC-SRS-25-FRS-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-28: The notification permission banner
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The permission notification for the Biocare app on the phone is off.
    ...
    ...     Test Steps:
    ...     1. Click on the Chat icon on the Services tab.
    ...     2. Click on the Go to settings button.
    ...     3. Taps the Back button on the settings screen.
    ...
    ...     Expected Output:
    ...     1. There shall be a banner containing:
    ...       - Message: “Turn on notifications to receive alerts from messages”
    ...       - Go to settings button.
    ...       - X icon button.
    ...     2. Navigate to the phone permission settings for the Biocare app screen.
    ...     3. The user shall navigate to the Reminder notification screen/Conversation screen.
    [Tags]      BIOC-MESSAGE-28        BIOC-SRS-25-FRS-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-MESSAGE-29: The notification permission banner
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The permission notification for the Biocare app on the phone is off
    ...
    ...     Test Steps:
    ...     1. Click on the Chat icon on the Services tab
    ...     2. Click on X button
    ...
    ...     Expected Output:
    ...     1. There shall be a banner containing:
    ...      - Message: “Turn on notifications to receive alerts from messages”
    ...      - Go to settings button
    ...      - X icon button
    ...     2. The banner shall be closed
    [Tags]      BIOC-MESSAGE-29        BIOC-SRS-25-FRS-06      manual
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
