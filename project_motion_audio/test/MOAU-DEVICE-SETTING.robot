*** Settings ***
Documentation   Motion Audio Authen test suite
Metadata    sid     MOAU-DEVICE-SETTING
Metadata    owner   Nang Phung
Library     corelib/AssertionExtension.py
#Library     corelib/MobileMOAUpHandler.py                ${DESIRED_CMOAUS}
#Library     project_motion_audio/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      MOAU-DEVICE-SETTING   mapp
Test Timeout    1h

*** Test Cases ***
MOAU-DEVICE-SETTING-01: User can navigate to Settings screen from Device Details screen
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can navigate to the Settings screen from the Device Details screen.
    ...    Precondition:
    ...    - The user is on the Device Details screen.
    ...    Steps:
    ...    1. Tap on the "Settings" button on the Device Details screen.
    ...    Expected Results:
    ...    1. The user is successfully navigated to the Settings screen.
    [Tags]    MOAU-DEVICE-SETTING-01  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-02: User can edit the device name in the Settings screen
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can edit the device name in the Settings screen.
    ...    Precondition:
    ...    - The user is on the Settings screen.
    ...    - The Device Name section is visible on the screen.
    ...    Steps:
    ...    1. Locate the Device Name textbox in the Settings screen.
    ...    2. Delete this device name
    ...    3. Entering a new name in the textbox.
    ...    Expected Results:
    ...    2. The app displays an inline error "Device name cannot be empty"
    ...    3. The device name is successfully edited and the new name is displayed in the textbox.
    [Tags]    MOAU-DEVICE-SETTING-02  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-03: User can save the edited device name
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can save the edited device name.
    ...    Precondition:
    ...    - The user has edited the device name on the Settings screen.
    ...    Steps:
    ...    1. Tap on the "Save change" button after editing the device name.
    ...    Expected Results:
    ...    1. The edited device name is successfully saved and updated in the app.
    [Tags]    MOAU-DEVICE-SETTING-03  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-04: User can view Notification Type options on Settings screen
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can see the Notification Type options on the Settings screen.
    ...    Precondition:
    ...    - The user is on the Settings screen.
    ...    Steps:
    ...    1. Locate the "Notification Type" section on the Settings screen.
    ...    Expected Results:
    ...    1. The "Notification Type" section is visible with the following 3 options:
    ...       - Play Audio on Device
    ...       - Send App Notifications
    ...       - Play Audio on Device & App Notification (selected by default).
    [Tags]    MOAU-DEVICE-SETTING-04  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-05: User can select a notification type
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can select one of the notification types.
    ...    Precondition:
    ...    - The user is on the Settings screen.
    ...    - The Notification Type options are visible.
    ...    Steps:
    ...    1. Select one of the following options for Notification Type:
    ...       - Play Audio on Device
    ...       - Send App Notifications
    ...       - Play Audio on Device & App Notification
    ...    Expected Results:
    ...    1. The selected option is highlighted, indicating the user's choice.
    [Tags]    MOAU-DEVICE-SETTING-05  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-06: User can save selected Notification Type
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can save the selected notification type.
    ...    Precondition:
    ...    - The user has selected a notification type on the Settings screen.
    ...    Steps:
    ...    1. Tap on the "Save changes" button after selecting a notification type.
    ...    Expected Results:
    ...    1. The selected notification type is saved successfully.
    ...    2. The system sends the configuration to the device.
    ...    3. The device adjusts its behavior according to the selected notification type.
    [Tags]    MOAU-DEVICE-SETTING-06  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-07: Select "Play Audio On device" option for motion detection
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that selecting "Play Audio on Device" option for motion detection notification is saved and applied correctly by the device.
    ...    Precondition:
    ...    - The Motion Audio device is connected to Wi-Fi and added to the app.
    ...    - The user is on the Settings screen.
    ...    Steps:
    ...    1. On the Settings screen, select the "Play Audio on Device" option under Notification Type.
    ...    2. Tap the “Save changes” button.
    ...    3. Trigger motion detection on the device.
    ...    Expected Results:
    ...    1. The selection is saved successfully.
    ...    2. The device plays the configured audio file when motion is detected.
    [Tags]    MOAU-DEVICE-SETTING-07  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-08: Select "Send App Notification" option for motion detection
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that selecting "Send App Notifications" option for motion detection notification is saved and applied correctly by the device.
    ...    Precondition:
    ...    - The Motion Audio device is connected to Wi-Fi and added to the app.
    ...    - The user is on the Settings screen.
    ...    Steps:
    ...    1. On the Settings screen, select the "Send App Notifications" option under Notification Type.
    ...    2. Tap the “Save changes” button.
    ...    3. Trigger motion detection on the device.
    ...    Expected Results:
    ...    1. The selection is saved successfully.
    ...    2. A notification is sent to the app when motion is detected.
    [Tags]    MOAU-DEVICE-SETTING-08  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-09: Select "Play Audio on Device & App Notification" option for motion detection
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that selecting "Play Audio on Device & App Notification" option for motion detection notification is saved and applied correctly by the device.
    ...    Precondition:
    ...    - The Motion Audio device is connected to Wi-Fi and added to the app.
    ...    - The user is on the Settings screen.
    ...    Steps:
    ...    1. On the Settings screen, select the "Play Audio on Device & App Notification" option under Notification Type.
    ...    2. Tap the “Save changes” button.
    ...    3. Trigger motion detection on the device.
    ...    Expected Results:
    ...    1. The selection is saved successfully.
    ...    2. The device plays the configured audio file and sends a notification to the app when motion is detected.
    [Tags]    MOAU-DEVICE-SETTING-09  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-10: User can view the Sensor Sensitivity slider
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can view the Sensor Sensitivity slider on the Settings screen.
    ...    Precondition:
    ...    - The user is on the Settings screen.
    ...    Steps:
    ...    1. Locate the “Sensor Sensitivity” section on the Settings screen.
    ...    Expected Results:
    ...    1. The "Sensor Sensitivity" section is visible, and a slider is available for the user to adjust.
    ...    2. The default value of the slider is set to 100%.
    [Tags]    MOAU-DEVICE-SETTING-10  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-11: User can adjust the Sensor Sensitivity slider to different values
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can adjust the sensor sensitivity slider to select values between 0% to 100%.
    ...    Precondition:
    ...    - The user is on the Settings screen.
    ...    - The "Sensor Sensitivity" slider is visible.
    ...    Steps:
    ...    1. Slide the “Sensor Sensitivity” slider to the following values: 0%, 25%, 50%, 75%, and 100%.
    ...    Expected Results:
    ...    1. The slider moves smoothly to each of the five preset values: 0%, 25%, 50%, 75%, and 100%.
    [Tags]    MOAU-DEVICE-SETTING-11  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-12: User can save the selected Sensor Sensitivity value
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can save the selected Sensor Sensitivity value.
    ...    Precondition:
    ...    - The user has selected a sensitivity value from the slider.
    ...    Steps:
    ...    1. After adjusting the slider, tap on the “Save changes” button.
    ...    Expected Results:
    ...    1. The selected sensitivity value is saved successfully.
    ...    2. The system sends the selected configuration to the device.
    ...    3. The device adjusts its motion detection settings according to the saved sensitivity value.
    [Tags]    MOAU-DEVICE-SETTING-12  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-13: User can view the LED Indicator section in Settings screen
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can view the "LED Indicator" section on the Settings screen.
    ...    Precondition:
    ...    - The user is on the Settings screen.
    ...    Steps:
    ...    1. Locate the "LED Indicator" section on the Settings screen.
    ...    Expected Results:
    ...    1. The "LED Indicator" section is visible with a toggle button for controlling the LED light when motion is detected.
    [Tags]    MOAU-DEVICE-SETTING-13  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-14: User can toggle the LED light on/off
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can toggle the LED light on or off in the "LED Indicator" section.
    ...    Precondition:
    ...    - The user is on the Settings screen.
    ...    - The "LED Indicator" section with the toggle button is visible.
    ...    Steps:
    ...    1. Toggle the "Flash LED Light When Detect Motion" switch to ON.
    ...    2. Tap on the “Save changes” button.
    ...    3. Trigger motion detection on the device.
    ...    4. Toggle the "Flash LED Light When Detect Motion" switch to OFF.
    ...    5. Tap on the “Save changes” button.
    ...    6. Trigger motion detection on the device.
    ...    Expected Results:
    ...    2. The LED on the device will turn on
    ...    3. The device will flash a green LED
    ...    5. The LED on the device will turn off
    ...    6. The device will not flash a green LED
    [Tags]    MOAU-DEVICE-SETTING-14  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-15: User can save the LED Indicator setting
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can save the LED Indicator setting after toggling it.
    ...    Precondition:
    ...    - The user has toggled the "LED Indicator" switch.
    ...    Steps:
    ...    1. After toggling the "Flash LED Light When Detect Motion" switch, tap on the “Save changes” button.
    ...    Expected Results:
    ...    1. The system saves the LED indicator setting successfully.
    ...    2. The system sends the configuration to the device.
    ...    3. The device adjusts its LED settings according to the saved configuration.
    [Tags]    MOAU-DEVICE-SETTING-15  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-16: User can navigate to the Update Wi-Fi settings screen
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can navigate to the Update Wi-Fi settings screen from the Settings screen.
    ...    Precondition:
    ...    - The user is on the Settings screen.
    ...    Steps:
    ...    1. Tap on the "Update Device Wi-Fi settings" button on the Settings screen.
    ...    Expected Results:
    ...    1. The user is navigated to the Update Wi-Fi settings screen.
    [Tags]    MOAU-DEVICE-SETTING-16  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-17: User can view the current Wi-Fi SSID before updating
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the current Wi-Fi SSID is displayed before starting the Wi-Fi configuration process.
    ...    Precondition:
    ...    - The device is connected to the Internet.
    ...    - The user is on the Update Wi-Fi settings screen.
    ...    Steps:
    ...    1. Check for the modal displaying the current SSID name.
    ...    Expected Results:
    ...    1. A modal is displayed with the SSID name of the current Wi-Fi network.
    [Tags]    MOAU-DEVICE-SETTING-17  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-18: User can start Wi-Fi configuration when connected to the Internet
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can proceed with Wi-Fi configuration if the device is connected to the Internet.
    ...    Precondition:
    ...    - The device is connected to the Internet and the SSID is displayed.
    ...    - The user is on the Update Wi-Fi settings screen.
    ...    Steps:
    ...    1. Tap on the "Continue" button after the SSID modal is shown.
    ...    Expected Results:
    ...    1. The Wi-Fi configuration process starts, allowing the user to select a new Wi-Fi network.
    [Tags]    MOAU-DEVICE-SETTING-18  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-20: User can successfully save Wi-Fi settings
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can save the updated Wi-Fi settings.
    ...    Precondition:
    ...    - The user has completed the Wi-Fi configuration process.
    ...    Steps:
    ...    1. Tap on the "Save Wi-Fi Settings" button after completing the Wi-Fi configuration.
    ...    Expected Results:
    ...    1. The Wi-Fi settings are saved successfully.
    ...    2. The system sends the updated Wi-Fi settings to the device.
    ...    3. The device reconnects to the new Wi-Fi network.
    [Tags]    MOAU-DEVICE-SETTING-20  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-21: User can navigate to Firmware Update screen
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can navigate to the Firmware Update screen from the Settings screen.
    ...    Precondition:
    ...    - The user is on the Settings screen.
    ...    Steps:
    ...    1. Tap on the "Firmware update" button on the Settings screen.
    ...    Expected Results:
    ...    1. The user is navigated to the Firmware Update screen.
    [Tags]    MOAU-DEVICE-SETTING-21  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-22: System checks for available firmware update
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the system checks if a new firmware update is available and displays the correct status.
    ...    Precondition:
    ...    - The user is on the Firmware Update screen.
    ...    Steps:
    ...    1. Wait for the system to check for firmware updates.
    ...    Expected Results:
    ...    1. If a new firmware is available, display “New update is available” with the firmware version.
    ...    2. If no new firmware is available, display “Device is up to date”.
    [Tags]    MOAU-DEVICE-SETTING-22  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-23: User is notified to ensure device is powered before updating
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user is notified to ensure the device is connected to power or fully charged before starting the firmware update.
    ...    Precondition:
    ...    - The system has found a new firmware version available.
    ...    Steps:
    ...    1. Check for the notification about ensuring the device is connected to power or fully charged.
    ...    Expected Results:
    ...    1. A message is displayed notifying the user to ensure the device is powered to prevent update corruption.
    [Tags]    MOAU-DEVICE-SETTING-23  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-24: User can start firmware update if new firmware is available
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can start the firmware update when a new firmware is available.
    ...    Precondition:
    ...    - The system has found a new firmware version available.
    ...    Steps:
    ...    1. Tap on the "Update Now" button to begin the firmware update.
    ...    Expected Results:
    ...    1. The firmware update process begins until completion.
    [Tags]    MOAU-DEVICE-SETTING-24  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-26: User is notified of firmware update success or failure
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user is notified of the firmware update result, whether success or failure.
    ...    Precondition:
    ...    - The firmware update process has completed.
    ...    Steps:
    ...    1. Observe the notification displayed after the update process completes.
    ...    Expected Results:
    ...    1. If the update is successful, a success message is displayed.
    ...    2. If the update fails, a failure message is displayed.
    [Tags]    MOAU-DEVICE-SETTING-26  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-27: Firmware update does not impact device settings
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the firmware update does not affect any existing device settings unless otherwise specified.
    ...    Precondition:
    ...    - The firmware update has completed successfully.
    ...    Steps:
    ...    1. The user successfully updates the device to the new firmware version.
    ...    Expected Results:
    ...    1. All previous device settings remain intact after the firmware update.
    [Tags]    MOAU-DEVICE-SETTING-27  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-28: User can remove a device from the added device list
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can remove a device from the list by tapping the "Remove device" button.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Settings screen.
    ...    Steps:
    ...    1. Navigate to the Settings screen of the Motion Audio device.
    ...    2. Tap the "Remove device" button.
    ...    Expected Results:
    ...    1. A confirmation modal is displayed.
    ...    2. The user taps "Confirm" to proceed with removing the device.
    ...    3. The device is removed from the current device list in the app.
    [Tags]    MOAU-DEVICE-SETTING-28  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-29: Device removal does not affect audio files or settings
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that removing a device from the app does not delete audio files or settings.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Settings screen.
    ...    Steps:
    ...    1. Tap the "Remove device" button on the Settings screen.
    ...    2. Confirm the removal of the device.
    ...    3. Re-add the same device to the app.
    ...    Expected Results:
    ...    1. The device is re-added with all previous audio files and settings intact and updated.
    [Tags]    MOAU-DEVICE-SETTING-29  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-30: Confirmation modal is displayed before device removal
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that a confirmation modal is displayed when the user taps "Remove device".
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Settings screen.
    ...    Steps:
    ...    1. Tap on the "Remove device" button on the Settings screen.
    ...    Expected Results:
    ...    1. A confirmation modal is displayed with options to confirm or cancel the device removal.
    [Tags]    MOAU-DEVICE-SETTING-30  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-SETTING-31: User can cancel device removal
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can cancel the device removal process by tapping "Cancel" on the confirmation modal.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Settings screen.
    ...    Steps:
    ...    1. Tap on the "Remove device" button on the Settings screen.
    ...    2. When the confirmation modal is displayed, tap "Cancel".
    ...    Expected Results:
    ...    1. The device is not removed, and the user remains on the Settings screen.
    [Tags]    MOAU-DEVICE-SETTING-31  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}
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
