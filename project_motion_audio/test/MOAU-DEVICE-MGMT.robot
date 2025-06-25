*** Settings ***
Documentation   Motion Audio Authen test suite
Metadata    sid     MOAU-DEVICE-MGMT
Metadata    owner   Nang Phung
Library     corelib/AssertionExtension.py
#Library     corelib/MobileMOAUpHandler.py                ${DESIRED_CMOAUS}
#Library     project_motion_audio/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      MOAU-DEVICE-MGMT   mapp
Test Timeout    1h

*** Test Cases ***
MOAU-DEVICE-MGMT-01: Add a device by searching for it
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The user can ddd device by searching for it
    ...
    ...     Precondition:
    ...     - The user is on the [Home] screen
    ...
    ...     Test Steps:
    ...     - 1. Press the [Add Device] button
    ...     - 2. Press the [Got it] button
    ...     - 3. Press and hold the [Snooze] button on the device for 5 seconds
    ...     - 4. Press the [Search for Device] button
    ...     - 5. Select the device on the [Scanning...] screen
    ...     - 6. Select a wifi name from the wifi list
    ...     - 7. Enter the correct password into the [Password] textbox
    ...     - 8. Press the [OK] button
    ...     - 9. Wait for the device to successfully connect to the server
    ...     - 10. Press the [Next] button
    ...     - 11. Enter a name for the device. Then delete this name
    ...     - 12. Enter a name for the device again
    ...     - 13. Press the [Finish] button
    ...
    ...     Expected Results:
    ...     - 1. The help modal is displayed to guide the user in pairing the device-(Refer to the UI design for detailed information)
    ...     - 2. The [Scan QR code] screen is displayed-(Refer to the UI design for detailed information)
    ...     - 3. The LED on the device will blink slowly
    ...     - 4. The [Scanning...] screen is displayed-(Refer to the UI design for detailed information)
    ...     - 5. The [Pairing...] modal is displayed. Then, the Wi-Fi list is displayed-(Refer to the UI design for detailed information)
    ...     - 6. The modal is displayed for the user to enter the password-(Refer to the UI design for detailed information)
    ...     - 7. The password is displayed as dots in the textbox
    ...     - 8. The [Enter password] modal is closed and the text "Connecting..." is displayed below the wifi selected in step 8
    ...     - 9. The text "Connected" is displayed below the wifi selected in step 8
    ...     - 10. The [Enter device name] screen is displayed-(Refer to the UI design for detailed information)
    ...     - 11. The app displays an inline error "Device name cannot be empty"
    ...     - 12. The device name is displayed on the textbox
    ...     - 13.1 The [Home] screen is played-(Refer to the UI design for detailed information)
    ...     - 13.2 The device just added will be displayed here
    [Tags]      MOAU-DEVICE-MGMT-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-02: Add a device by scanning a QR code
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The user can add a device by scanning a QR code
    ...
    ...     Precondition:
    ...     - The user is on the [Home] screen
    ...
    ...     Test Steps:
    ...     - 1. Press the [Add Device] button
    ...     - 2. Press the [Got it] button
    ...     - 3. Press and hold the [Snooze] button on the device for 5 seconds
    ...     - 4. Scan the correct QR code of the device that has Bluetooth enabled in the previous step
    ...     - 5. Select a wifi name from the wifi list
    ...     - 6. Enter the correct password into the [Password] textbox
    ...     - 7. Press the [OK] button
    ...     - 8. Wait for the device to successfully connect to the server
    ...     - 9. Press the [Next] button
    ...     - 10. Enter a name for the device
    ...     - 11. Press the [Finish] button
    ...
    ...     Expected Results:
    ...     - 1. The help modal is displayed to guide the user in pairing the device
    ...     - 2. The [Scan QR code] screen is displayed
    ...     - 3. The LED on the device will blink slowly
    ...     - 4. The [Pairing...] modal is displayed. Then, the Wi-Fi list is displayed
    ...     - 5. The modal is displayed for the user to enter the password
    ...     - 6. The password is displayed as dots in the textbox
    ...     - 7. The [Enter password] modal is closed and the text "Connecting..." is displayed below the wifi selected in step 6
    ...     - 8. Text "Connected" is displayed below the wifi selected in step 5
    ...     - 9. The [Enter device name] screen is displayed
    ...     - 10. The device name is displayed on the textbox
    ...     - 11.1 The [Home] screen is played
    ...     - 11.2 TThe device just added will be displayed here
    [Tags]      MOAU-DEVICE-MGMT-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-03: Add a device that has been added previously
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The user can ddd a device that has been added previously
    ...
    ...     Precondition:
    ...     - The user is on the [Home] screen
    ...     - The device has been added to an account
    ...
    ...     Test Steps:
    ...     - 1. Press the [Add Device] button
    ...     - 2. Press the [Got it] button
    ...     - 3. Press and hold the [Snooze] button on the device for 5 seconds
    ...     - 4. Press the [Search for Device] button
    ...     - 5. Select the device on the [Scanning...] screen
    ...     - 6. Press the [Update] button
    ...     - 7. Select a wifi name from the wifi list
    ...     - 8. Enter the correct password into the [Password] textbox
    ...     - 9. Press the [OK] button
    ...     - 10. Wait for the device to successfully connect to the server
    ...     - 11. Press the [Update Device Wi-Fi Settings] button
    ...
    ...     Expected Results:
    ...     - 1. The help modal is displayed to guide the user in pairing the device
    ...     - 2. The [Scan QR code] screen is displayed
    ...     - 3. The LED on the device will blink slowly
    ...     - 4. The [Scanning...] screen is displayed
    ...     - 5. The modal is displayed with two button:[Update] and [Cancel]-(Refer to the UI design for detailed information)
    ...     - 6. The [Pairing...] modal is displayed. Then, the Wi-Fi list is displayed
    ...     - 7. The modal is displayed for the user to enter the password
    ...     - 8. The password is displayed as dots in the textbox
    ...     - 9. The [Enter password] modal is closed and the text "Connecting..." is displayed below the wifi selected in step 8
    ...     - 10.1 The text "Connected" is displayed below the wifi selected in step 7
    ...     - 10.1 The [Update Device Wi-Fi Settings] button is enabled
    ...     - 11. The [Home] screen is displayed
    [Tags]      MOAU-DEVICE-MGMT-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-04: Enter an incorrect password for the SSID
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The app will display an error modal when the user enters the wrong password for the SSID
    ...
    ...     Precondition:
    ...     - The user is on the [Home] screen
    ...
    ...     Test Steps:
    ...     - 1. Press the [Add Device] button
    ...     - 2. Press the [Got it] button
    ...     - 3. Press and hold the [Snooze] button on the device for 5 seconds
    ...     - 4. Press the [Search for Device] button
    ...     - 5. Select the device on the [Scanning...] screen
    ...     - 6. Select a wifi name from the wifi list
    ...     - 7. Enter the incorrect password into the [Password] textbox
    ...     - 8. Press the [OK] button
    ...     - 9. Press the [Try again] button
    ...     - 10. Enter the incorrect password into the [Password] textbox
    ...     - 11. Press the [OK] button
    ...     - 12. Press the [Close] button
    ...
    ...     Expected Results:
    ...     - 1. The help modal is displayed to guide the user in pairing the device
    ...     - 2. The [Scan QR code] screen is displayed
    ...     - 3. The LED on the device will blink slowly
    ...     - 4. The [Scanning...] screen is displayed
    ...     - 5. The [Pairing...] modal is displayed. Then, the Wi-Fi list is displayed
    ...     - 6. The modal is displayed for the user to enter the password
    ...     - 7. The password is displayed as dots in the textbox
    ...     - 8. The [Incorrect password] modal is displayed-(Refer to the UI design for detailed information)
    ...     - 9. The modal is displayed for the user to enter the password
    ...     - 11. The [Incorrect password] modal is displayed
    ...     - 12. The [Scan QR code] screen is displayed
    [Tags]      MOAU-DEVICE-MGMT-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-05: User can view the list of added devices on the Home screen
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can view the list of their added devices on the Home screen after logging in.
    ...    Precondition:
    ...    - The user has logged into the mobile app.
    ...    Steps:
    ...    1. Navigate to the Home screen.
    ...    Expected Results:
    ...    1. The list of added devices is displayed on the Home screen.
    [Tags]    MOAU-DEVICE-MGMT-05  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-06: Devices are ordered by the time they were added
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the devices are listed in the order of their addition time.
    ...    Precondition:
    ...    - The user has multiple devices added to the app.
    ...    Steps:
    ...    1. Navigate to the Home screen where devices are listed.
    ...    Expected Results:
    ...    1. Devices are ordered by the time they were added, with the most recently added device appearing first.
    [Tags]    MOAU-DEVICE-MGMT-06  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-08: User can navigate to the Device Details screen by tapping on a device
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that tapping on a device in the list navigates the user to the Device Details screen.
    ...    Precondition:
    ...    - The user has logged into the mobile app and has at least one device added.
    ...    Steps:
    ...    1. Tap on a device in the list of devices on the Home screen.
    ...    Expected Results:
    ...    1. The user is navigated to the Device Details screen for the selected device.
    [Tags]    MOAU-DEVICE-MGMT-08   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-09: Each device has separate settings
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that each device in the list has separate settings.
    ...    Precondition:
    ...    - The user has logged into the mobile app and has multiple devices added.
    ...    Steps:
    ...    1. Navigate to the Home screen and locate a device in the list.
    ...    2. Tap on the device to view its settings.
    ...    Expected Results:
    ...    1. The settings screen for each device is unique to that device.
    [Tags]    MOAU-DEVICE-MGMT-09   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-10: User can view the device information modal
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can view the device information by tapping on the information icon.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen.
    ...    Steps:
    ...    1. Tap on the "Information" icon on the Device Details screen.
    ...    Expected Results:
    ...    1. The “Device Information” modal is displayed with device details.
    [Tags]    MOAU-DEVICE-MGMT-10   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-11: Device Information modal displays the correct device model
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the device model is displayed correctly in the “Device Information” modal.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen.
    ...    Steps:
    ...    1. Tap on the "Information" button on the Device Details screen.
    ...    2. Verify the "Device model" field in the modal.
    ...    Expected Results:
    ...    1. The "Device model" field displays the format "ST_A101.1".
    [Tags]    MOAU-DEVICE-MGMT-11   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-12: Device Information modal displays the correct firmware version
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the firmware version is displayed correctly in the “Device Information” modal.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen.
    ...    Steps:
    ...    1. Tap on the "Information" button on the Device Details screen.
    ...    2. Verify the "Firmware version" field in the modal.
    ...    Expected Results:
    ...    1. The "Firmware version" field displays the format "1.0.0.0".
    [Tags]    MOAU-DEVICE-MGMT-12   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-13: Device Information modal displays the correct device ID
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the device ID is displayed correctly in the “Device Information” modal.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen.
    ...    Steps:
    ...    1. Tap on the "Information" button on the Device Details screen.
    ...    2. Verify the "Device ID" field in the modal.
    ...    Expected Results:
    ...    1. The "Device ID" field displays the format "SierraTeck<id>" where <id> is the unique identifier for the device.
    [Tags]    MOAU-DEVICE-MGMT-13   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-14: User can navigate to the Settings screen from Device Details
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can navigate to the Settings screen from the Device Details screen.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen.
    ...    Steps:
    ...    1. Tap on the "Settings" button on the Device Details screen.
    ...    Expected Results:
    ...    1. The user is navigated to the Settings screen.
    [Tags]    MOAU-DEVICE-MGMT-14   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-15: User can see the current device name on the Settings screen
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the current device name is displayed in the "Device name" textbox on the Settings screen.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Settings screen.
    ...    Steps:
    ...    1. Verify that the "Device name" section is displayed on the Settings screen.
    ...    2. Check that the textbox shows the current saved device name.
    ...    Expected Results:
    ...    1. The "Device name" textbox displays the current saved name of the device.
    [Tags]    MOAU-DEVICE-MGMT-15   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-16: User can edit the device name
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can edit the device name in the textbox on the Settings screen.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Settings screen.
    ...    Steps:
    ...    1. Tap on the "Device name" textbox on the Settings screen.
    ...    2. Edit the device name by typing a new name.
    ...    Expected Results:
    ...    1. The user is able to edit the device name in the textbox.
    [Tags]    MOAU-DEVICE-MGMT-16   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-17: User can save the edited device name
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can save the edited device name by tapping the "Save change" button.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Settings screen with an editable device name.
    ...    Steps:
    ...    1. After editing the device name, tap on the "Save change" button.
    ...    Expected Results:
    ...    1. The system saves the edited device name.
    ...    2. The updated device name is reflected in the app.
    [Tags]    MOAU-DEVICE-MGMT-17   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-18: User can view the "Power switch" section on the Device Details screen
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can see the "Power switch" section on the Device Details screen.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen.
    ...    Steps:
    ...    1. Navigate to the Device Details screen.
    ...    2. Check that the "Power switch" section is visible on the screen.
    ...    Expected Results:
    ...    1. The "Power switch" section is displayed on the Device Details screen.
    [Tags]    MOAU-DEVICE-MGMT-18   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-19: User can turn on the device by switching the toggle to the "on" position
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can turn on the device by switching the power toggle to the "on" position.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen with the "Power switch" section.
    ...    Steps:
    ...    1. Toggle the "Power switch" button to the "on" position.
    ...    Expected Results:
    ...    1. The device will exit sleep mode.
    [Tags]    MOAU-DEVICE-MGMT-19   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-20: User can turn off the device by switching the toggle to the "off" position
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can turn off the device by switching the power toggle to the "off" position.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen with the "Power switch" section.
    ...    Steps:
    ...    1. Toggle the "Power switch" button to the "off" position.
    ...    Expected Results:
    ...    1. The device enters sleep mode.
    ...    2. The device still remains connected to the Internet.
    ...    3. The device can be woken up by the Mobile App.
    [Tags]    MOAU-DEVICE-MGMT-20   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-21: User can see the "Volume control" section on the Device Details screen
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can see the "Volume control" section on the Device Details screen.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen.
    ...    Steps:
    ...    1. Navigate to the Device Details screen.
    ...    2. Check that the "Volume control" section is visible.
    ...    Expected Results:
    ...    1. The "Volume control" section is displayed on the Device Details screen.
    [Tags]    MOAU-DEVICE-MGMT-21   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-22: User can adjust the volume using the slider
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can adjust the volume level using the slider.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen with the "Volume control" section.
    ...    Steps:
    ...    1. Move the slider to adjust the volume level.
    ...    Expected Results:
    ...    1. The volume is adjusted accordingly on the device.
    [Tags]    MOAU-DEVICE-MGMT-22   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-24: User can select the "25%" volume option
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can select the "25%" volume option.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen with the "Volume control" section.
    ...    Steps:
    ...    1. Tap on the "25%" volume option.
    ...    Expected Results:
    ...    1. The volume is set to 25% on the device.
    [Tags]    MOAU-DEVICE-MGMT-24  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-25: User can select the "50%" volume option (default)
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can select the "50%" volume option (default).
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen with the "Volume control" section.
    ...    Steps:
    ...    1. Tap on the "50%" volume option.
    ...    Expected Results:
    ...    1. The volume is set to 50% on the device.
    [Tags]    MOAU-DEVICE-MGMT-25   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-26: User can select the "75%" volume option
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can select the "75%" volume option.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen with the "Volume control" section.
    ...    Steps:
    ...    1. Tap on the "75%" volume option.
    ...    Expected Results:
    ...    1. The volume is set to 75% on the device.
    [Tags]    MOAU-DEVICE-MGMT-26   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-27: User can select the "100%" volume option
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can select the "100%" volume option.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen with the "Volume control" section.
    ...    Steps:
    ...    1. Tap on the "100%" volume option.
    ...    Expected Results:
    ...    1. The volume is set to 100% on the device.
    [Tags]    MOAU-DEVICE-MGMT-27   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-28: The user can umute the device's volume and enable the slider
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can unmute the device and enable the slider.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen with the "Volume control" section and the device is muted.
    ...    Steps:
    ...    1. Tap on the speaker icon to unmute the device's volume.
    ...    Expected Results:
    ...    1. The slider is enabled.
    ...    2. The device is unmuted.
    [Tags]    MOAU-DEVICE-MGMT-28   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-07: The user can mute the device's volume and disable the slider
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can unmute the device and enable the slider.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen with the "Volume control" section and the device is unmuted.
    ...    Steps:
    ...    1. Tap on the speaker icon to mute the device's volume.
    ...    Expected Results:
    ...    1. The slider is disable.
    ...    2. The device is muted.
    [Tags]    MOAU-DEVICE-MGMT-07   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-29: User can see the "Battery Information" section on the Device Details screen
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can see the "Battery Information" section on the Device Details screen.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen.
    ...    Steps:
    ...    1. Navigate to the Device Details screen.
    ...    2. Check that the "Battery Information" section is visible.
    ...    Expected Results:
    ...    1. The "Battery Information" section is displayed on the Device Details screen.
    [Tags]    MOAU-DEVICE-MGMT-29   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-30: User can see the battery level information
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can see the battery level information in the "Battery Information" section.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen with the "Battery Information" section.
    ...    Steps:
    ...    1. Navigate to the Device Details screen and find the "Battery Information" section.
    ...    2. Check that the battery level information is displayed.
    ...    Expected Results:
    ...    1. The battery level information is visible, showing one of the four battery levels.
    [Tags]    MOAU-DEVICE-MGMT-30   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-31: Battery level updates automatically
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the battery level updates automatically in the app whenever the battery value changes.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen with the "Battery Information" section.
    ...    Steps:
    ...    1. Monitor the battery level in the app as it changes.
    ...    Expected Results:
    ...    1. The battery level in the app updates automatically when the value changes on the device.
    [Tags]    MOAU-DEVICE-MGMT-31   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-32: Battery level displays in red and shows alert when less than 25%
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the battery level is displayed in red with an alert message when the battery level is less than 25%.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen with the "Battery Information" section.
    ...    Steps:
    ...    1. Let the battery level drop below 25%.
    ...    2. Check the "Battery Information" section.
    ...    Expected Results:
    ...    1. The battery color changes to red.
    ...    2. An alert message is displayed: "Low battery! Please replace battery or connect power adapter."
    [Tags]    MOAU-DEVICE-MGMT-32   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-33: User can see the 4 battery levels
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can see all 4 levels of battery information (full, 75%, 50%, 25%).
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen with the "Battery Information" section.
    ...    Steps:
    ...    1. Navigate to the Device Details screen.
    ...    2. Check the "Battery Information" section to see the displayed battery levels.
    ...    Expected Results:
    ...    1. The "Battery Information" section shows one of the four levels: full, 75%, 50%, or 25%.
    [Tags]    MOAU-DEVICE-MGMT-33   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-34: User can see the "Battery Information" section showing power supply type
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can see the "Battery Information" section and the power supply type on the Device Details screen.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen.
    ...    Steps:
    ...    1. Navigate to the Device Details screen.
    ...    2. Check that the "Battery Information" section is visible.
    ...    3. Check that the power supply type (AC or battery) is displayed in the section.
    ...    Expected Results:
    ...    1. The "Battery Information" section is displayed on the Device Details screen.
    ...    2. The power supply type (AC or battery) is displayed appropriately.
    [Tags]    MOAU-DEVICE-MGMT-34   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-35: Power supply type updates when it changes
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the power supply type updates whenever it changes on the device.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen.
    ...    Steps:
    ...    1. Start with the device connected to the AC power.
    ...    2. Disconnect the AC power and switch to battery power.
    ...    3. Observe the "Battery Information" section for the change.
    ...    Expected Results:
    ...    1. The power supply type displayed on the screen should update to show battery power when the AC power is disconnected.
    ...    2. If AC power is reconnected, the screen should update to show AC power.
    [Tags]    MOAU-DEVICE-MGMT-35   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-36: Display AC power icon when AC adaptor is plugged in
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the screen displays the AC adaptor icon when the AC power is plugged in, and the battery level icon is removed.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen.
    ...    Steps:
    ...    1. Plug the AC adaptor into the device.
    ...    2. Navigate to the Device Details screen.
    ...    3. Check the "Battery Information" section.
    ...    Expected Results:
    ...    1. The AC adaptor icon is displayed in the "Battery Information" section.
    ...    2. The battery level icon is no longer displayed.
    [Tags]    MOAU-DEVICE-MGMT-36   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-37: Display battery level when AC power is not plugged in
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the screen displays the battery level icon when the AC power is not plugged in, and the AC adaptor icon is removed.
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Device Details screen.
    ...    Steps:
    ...    1. Disconnect the AC adaptor from the device.
    ...    2. Navigate to the Device Details screen.
    ...    3. Check the "Battery Information" section.
    ...    Expected Results:
    ...    1. The battery level icon is displayed in the "Battery Information" section.
    ...    2. The AC adaptor icon is no longer displayed.
    [Tags]    MOAU-DEVICE-MGMT-37   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-38: First "Low Battery" notification is pushed when battery is at or below 25%
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the first "Low Battery" push notification is sent when the device's battery is at or below 25%.
    ...    Precondition:
    ...    - The device's battery level is at or below 25%.
    ...    Steps:
    ...    1. Ensure that the device battery level is at or below 25%.
    ...    2. Wait for the system to push the first "Low Battery" notification.
    ...    Expected Results:
    ...    1. The first "Low Battery" notification is successfully received on the user's mobile app when the battery level is at or below 25%.
    [Tags]    MOAU-DEVICE-MGMT-38   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-39: Second "Low Battery" notification is pushed 2 hours after first notification if battery is still below 25%
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the second "Low Battery" push notification is sent 2 hours after the first if the battery remains below 25%.
    ...    Precondition:
    ...    - The first "Low Battery" notification has already been pushed.
    ...    - The device's battery level is still at or below 25%.
    ...    Steps:
    ...    1. Wait for 2 hours after receiving the first "Low Battery" notification.
    ...    2. Ensure that the battery level remains at or below 25%.
    ...    3. Check the mobile app for the second "Low Battery" notification.
    ...    Expected Results:
    ...    1. The second "Low Battery" notification is pushed to the user's mobile app exactly 2 hours after the first notification if the battery level is still below 25%.
    [Tags]    MOAU-DEVICE-MGMT-39   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-40: Device is removed from first user's profile after transfer
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that when a second user adds the device to their profile, it is automatically removed from the first user's profile.
    ...    Precondition:
    ...    - The first user has the device added to their profile.
    ...    - The second user begins the process of adding the device to their profile.
    ...    Steps:
    ...    1. Second user enters Wi-Fi credentials to add the device to their profile.
    ...    Expected Results:
    ...    1. The device is automatically removed from the first user's device list.
    [Tags]    MOAU-DEVICE-MGMT-40   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-41: Device list updates in real-time without notification
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the device list updates in real-time without any notification.
    ...    Precondition:
    ...    - The first user has the device in their device list.
    ...    - The second user successfully adds the device to their profile.
    ...    Steps:
    ...    1. Observe the first user's device list after the second user adds the device to their profile.
    ...    Expected Results:
    ...    1. The device list of the first user is updated automatically without any notification.
    [Tags]    MOAU-DEVICE-MGMT-41   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-42: First user is redirected to Home screen if viewing device details
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that if the first user is viewing the device details when the second user adds the device, the first user is redirected to the Home screen.
    ...    Precondition:
    ...    - The first user is viewing the details screen of the device.
    ...    - The second user successfully adds the device to their profile.
    ...    Steps:
    ...    1. Observe the first user's screen after the second user adds the device to their profile.
    ...    Expected Results:
    ...    1. The first user is automatically redirected to the Home screen, and the device list is reloaded.
    [Tags]    MOAU-DEVICE-MGMT-42   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-43: Device list auto-updates if first user is not viewing device details
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the device list auto-updates if the first user is not viewing the device details screen when the second user adds the device.
    ...    Precondition:
    ...    - The first user is either not using the app or is using it without accessing the device details screen.
    ...    - The second user successfully adds the device to their profile.
    ...    Steps:
    ...    1. Observe the first user's device list after the second user adds the device to their profile.
    ...    Expected Results:
    ...    1. The device list of the first user is auto-updated to reflect the removal of the device.
    [Tags]    MOAU-DEVICE-MGMT-43   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-DEVICE-MGMT-44: Factory Reset Procedure
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the factory reset process successfully restores all device settings to their default values.
    ...    Precondition:
    ...    - The device is turned on.
    ...    Steps:
    ...    1. Set values different from default:
    ...        - Turn off the power switch (Power switch: OFF).
    ...        - Set the volume to 30%.
    ...        - Select a playback mode other than single mode
    ...        - Set playback delay to 5 seconds.
    ...        - Set delay between successive playback to 3 seconds.
    ...        - Choose a different notification type (e.g.."App-only notifications").
    ...        - Decrease sensor sensitivity to 50%.
    ...        - Turn off the LED indicator.
    ...    2. Turn off the device.
    ...    3. Press and hold the control button.
    ...    4. While holding the control button, turn on the device.
    ...    5. Continue holding the control button until the LED blinks red for about 10 seconds.
    ...    6. When the LED turns solid red, release the control button.
    ...    Expected Results:
    ...    1. The device is reset to default values.
    ...    2. The SD card is cleared.
    ...    3. All audio files are deleted.
    ...    4. Settings are reset to the following default values:
    ...        - Power switch: ON
    ...        - Volume: 50%
    ...        - Playback mode: Single
    ...        - Playback delay: 0 seconds
    ...        - Delay between successive playback: 0 seconds
    ...        - Notification Type: Play audio on Device and App notifications
    ...        - Sensor sensitivity: 100%
    ...        - LED Indicator: ON
    [Tags]    MOAU-DEVICE-MGMT-44   manual
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
