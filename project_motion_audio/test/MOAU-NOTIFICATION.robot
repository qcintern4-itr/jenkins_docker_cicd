*** Settings ***
Documentation   Motion Audio Authen test suite
Metadata    sid     MOAU-NOTIFICATION
Metadata    owner   Nang Phung
Library     corelib/AssertionExtension.py
#Library     corelib/MobileMOAUpHandler.py                ${DESIRED_CMOAUS}
#Library     project_motion_audio/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      MOAU-NOTIFICATION   mapp
Test Timeout    1h

*** Test Cases ***
MOAU-NOTIFICATION-01: In-app Notification
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The user can access the motion-detected in-app notification on their phone
    ...
    ...     Precondition:
    ...     - The user has enabled the “Send App Notification” option on the “Notification type settings”
    ...     - The user has enabled notification permissions for the application
    ...
    ...     Test Steps:
    ...     - 1. Move so that the device can detect motion
    ...     - 2. Press the [Stop Audio] button
    ...     - 3. Move so that the device can detect motion
    ...     - 4. Press the [Dismiss] button
    ...
    ...     Expected Results:
    ...     - 1. The motion detection notification is displayed in the app
    ...     - 2. The device stops playing audio, and the notification modal is hidden
    ...     - 3. The motion detection notification is displayed in the app
    ...     - 4. The notification model is hidden
    [Tags]      MOAU-NOTIFICATION-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-NOTIFICATION-02: Access motion detected notification
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The user can access the motion detected notification on their phone
    ...
    ...     Precondition:
    ...     - The user has enabled the “Send App Notification” option on the “Notification type settings”
    ...     - The user has enabled notification permissions for the application
    ...
    ...     Test Steps:
    ...     - 1. Move so that the device can detect motion
    ...     - 2. Press the notification on the phone
    ...
    ...     Expected Results:
    ...     - 1. The motion detection notification is displayed on the phone
    ...     - 2. The app is opened
    [Tags]      MOAU-NOTIFICATION-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-NOTIFICATION-03: Access audio processing completed notification
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The user can access the audio processing completed notification on their phone when add audio from phone
    ...
    ...     Precondition:
    ...     - The user has enabled notification permissions for the application
    ...
    ...     Test Steps:
    ...     - 1. Press the [Add audio From Phone] button
    ...     - 2. Select an audio file from the media library
    ...     - 3. Press the [Upload to Device] button
    ...     - 4. Waiting for the audio file upload to complete
    ...     - 5. Press the [OK] button
    ...     - 6. Wait for the device to finish downloading the audio file
    ...     - 7. Press the notification on the phone
    ...
    ...     Expected Results:
    ...     - 1. Directed to the phone’s media library
    ...     - 3. The [Uploading audio...] modal is displayed
    ...     - 4. The [Audio is proccessing] modal is displayed
    ...     - 5. The [Audio Manager] screen is displayed
    ...     - 6. The audio processing completed notification is displayed on the phone
    ...     - 7. The app is opened
    [Tags]      MOAU-NOTIFICATION-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-NOTIFICATION-04: Access audio processing completed notification
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The user can access the audio processing completed notification on their phone when record new audio
    ...
    ...     Precondition:
    ...     - The user has enabled notification permissions for the application
    ...
    ...     Test Steps:
    ...     - 1. Press the [Record New Audio] button
    ...     - 2. Press the [Starting recording] button
    ...     - 3. Press the [Stop] button
    ...     - 4. Press the [Upload to Device] button
    ...     - 5. Waiting for the audio file upload to complete
    ...     - 6. Press the [OK] button
    ...     - 7. Wait for the device to finish downloading the audio file
    ...     - 8. Press the notification on the phone
    ...
    ...     Expected Results:
    ...     - 1. The [Record New Audio] modal is displayed
    ...     - 2. The app started recording audio
    ...     - 3. The app stopped recording audio
    ...     - 4. The [Uploading audio...] modal is displayed
    ...     - 5. The [Audio is proccessing] modal is displayed
    ...     - 6. The [Audio Manager] screen is displayed
    ...     - 7. The audio processing completed notification is displayed on the phone
    ...     - 8. The app is opened
    [Tags]      MOAU-NOTIFICATION-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-NOTIFICATION-05: Access audio processing failed notification
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The user can access the audio processing failed notification on their phone when add audio from phone
    ...
    ...     Precondition:
    ...     - The user has enabled notification permissions for the application
    ...
    ...     Test Steps:
    ...     - 1. Press the [Add audio From Phone] button
    ...     - 2. Select an audio file from the media library
    ...     - 3. Press the [Upload to Device] button
    ...     - 4. Waiting for the audio file upload to complete
    ...     - 5. Press the [OK] button
    ...     - 6. Disconnect the Wi-Fi that the device is connected to
    ...     - 7. Wait for a period of time
    ...     - 8. Press the notification on the phone
    ...
    ...     Expected Results:
    ...     - 1. Directed to the phone’s media library
    ...     - 3. The [Uploading audio...] modal is displayed
    ...     - 4. The [Audio is proccessing] modal is displayed
    ...     - 5. The [Audio Manager] screen is displayed
    ...     - 7.1 The [Upload Fail] modal is displayed
    ...     - 7.2 The audio processing failed notification is displayed on the phone
    ...     - 8. The app is opened
    [Tags]      MOAU-NOTIFICATION-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-NOTIFICATION-06: Access audio processing failed notification
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The user can access the audio processing failed notification on their phone when record new audio
    ...
    ...     Precondition:
    ...     - The user has enabled notification permissions for the application
    ...
    ...     Test Steps:
    ...     - 1. Press the [Record New Audio] button
    ...     - 2. Press the [Starting recording] button
    ...     - 3. Press the [Stop] button
    ...     - 4. Press the [Upload to Device] button
    ...     - 5. Waiting for the audio file upload to complete
    ...     - 6. Press the [OK] button
    ...     - 7. Disconnect the Wi-Fi that the device is connected to
    ...     - 8. Wait for a period of time
    ...     - 9. Press the notification on the phone
    ...
    ...     Expected Results:
    ...     - 1. The [Record New Audio] modal is displayed
    ...     - 2. The app started recording audio
    ...     - 3. The app stopped recording audio
    ...     - 4. The [Uploading audio...] modal is displayed
    ...     - 5. The [Audio is proccessing] modal is displayed
    ...     - 6. The [Audio Manager] screen is displayed
    ...     - 8.1 The [Upload Fail] modal is displayed
    ...     - 8.2 The audio processing failed notification is displayed on the phone
    ...     - 9. The app is opened
    [Tags]      MOAU-NOTIFICATION-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-NOTIFICATION-07: Access firmware update installed notification
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The user can access the firmware update installed notification on their phone
    ...
    ...     Precondition:
    ...     - The user is on the [Setting] screen
    ...     - There is new firmware is available
    ...
    ...     Test Steps:
    ...     - 1. Press the [Check For Firmware Updates] button
    ...     - 2. Press the [Update Now] button
    ...     - 3. Wait for the firmware update process to complete
    ...     - 4. Press the [OK] button
    ...     - 5. Press the notification on the phone
    ...
    ...     Expected Results:
    ...     - 1.1 The [Checking for new update...] screen is displayed
    ...     - 1.2 Then the [New update available] screen is displayed
    ...     - 2. The [Update in-progress] screen is displayed
    ...     - 3.1 The [Update Intalled] modal is displayed
    ...     - 3.2 The firmware update installed notification is displayed on the phone
    ...     - 5. The app is opened
    [Tags]      MOAU-NOTIFICATION-07      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-NOTIFICATION-08: Access firmware update failed notification
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The user can access the firmware update failed notification on their phone
    ...
    ...     Precondition:
    ...     - The user is on the [Setting] screen
    ...     - There is new firmware is available
    ...
    ...     Test Steps:
    ...     - 1. Press the [Check For Firmware Updates] button
    ...     - 2. Press the [Update Now] button
    ...     - 3. Disconnect the Wi-Fi that the device is connected to
    ...     - 4. Wait for a period of time
    ...     - 5. Press the notification on the phone
    ...
    ...     Expected Results:
    ...     - 1.1 The [Checking for new update...] screen is displayed
    ...     - 1.2 Then the [New update available] screen is displayed
    ...     - 2. The [Update in-progress] screen is displayed
    ...     - 4.1 The [Update Fail] modal is displayed
    ...     - 4.2 The firmware update failed notification is displayed on the phone
    ...     - 5. The app is opened
    [Tags]      MOAU-NOTIFICATION-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
*** Keywords ***
SUITE SETUP
    ${MOAUP_NODE}     Get Device Node
    Import Library    project_motion_audio/lib/mMOAUp/Common.py     ${MOAUP_NODE}     ${ENV}
    Start Motion Audio
    ${USER}     Get Config Param    USER
    Sign In Motion Audio    email=${USER}[username]      password=${USER}[password]
    ${RELEASE_VERSION}     Get Release Version
    Set Suite Metadata     version     ${RELEASE_VERSION}

SUITE TEARDOWN
    Quit All
