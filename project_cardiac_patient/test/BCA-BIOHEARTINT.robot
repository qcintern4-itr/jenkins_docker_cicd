*** Settings ***
Documentation   Biocare cardiac app Bioheart integration test suite
Metadata    sid     BCA-BIOHEARTINT
Metadata    owner   Linh Tran
Library     corelib/AssertionExtension.py

Force Tags      BCA-BIOHEARTINT     mapp
Test Timeout    1h

*** Test Cases ***
BCA-BIOHEARTINT-PAIRDEVICE-01: Pair Bioheart device in Biocare cardiac app
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - There is no Bioheart device paired with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Pair Bioheart now button
    ...    - 4. Select a device in the list of found devices
    ...    - 5. Wait a minute
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Pair Bioheart device screen is displayed
    ...    - 3. Navigate to the SCANNING FOR DEVICE... screen, there shall be an instructive message Please make sure the device is discoverable mode. If not, please turn the Bioheart device on
    ...       - The list of found devices is displayed
    ...    - 4. There shall be a popup Paring displayed
    ...    - 5. Bioheart device is paired successfully and navigate to the Bioheart device information screen
    ...       - Once paired, the app shall remember the device until the device is removed from the app.
    ...       - The app can only have one device added at a time. The user has to remove the current device to pair it with a new one.
    [Tags]      BCA-BIOHEARTINT-PAIRDEVICE-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-PAIRDEVICE-02: Pair device when Bluetooth is turned off
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - There is no Bioheart device paired with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Pair Bioheart now button
    ...    - 4. Press on Got it button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Pair Bioheart device screen is displayed
    ...    - 3. There shall be a popup modal with message The Bluetooth is currently off. To connect with the Bioheart device, please turn it on
    ...    - 4. The modal is closed
    [Tags]      BCA-BIOHEARTINT-PAIRDEVICE-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-PAIRDEVICE-03: Could not find any device within 60 second
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - There is no Bioheart device paired with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Pair Bioheart now button
    ...    - 4. Wait for 60 seconds
    ...    - 5. Press on Try again button
    ...    - 6. Press on back icon button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Pair Bioheart device screen is displayed
    ...    - 3. Navigate to the SCANNING FOR DEVICE... screen, there shall be an instructive message Please make sure the device is discoverable mode. If not, please turn the Bioheart device on
    ...    - 4. The scanning process is stopped and displayed message Please make sure the device is in discoverable mode. If not, please turn the Bioheart device on
    ...    - 5. Start to scan device again
    ...    - 6. Navigate to the Pair Bioheart device screen
    [Tags]      BCA-BIOHEARTINT-PAIRDEVICE-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-PAIRDEVICE-04: Scan device after 60 seconds
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - There is no Bioheart device paired with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Pair Bioheart now button
    ...    - 4. Wait for more than 60 seconds
    ...    - 5. Press on Scan again button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Pair Bioheart device screen is displayed
    ...    - 3. Navigate to the SCANNING FOR DEVICE... screen, there shall be an instructive message Please make sure the device is discoverable mode. If not, please turn the Bioheart device on
    ...       - The list of found devices is displayed
    ...       - There shall be a message You didn’t see your device? Scan again below the list of found devices
    ...    - 4. Start to scan device again
    [Tags]      BCA-BIOHEARTINT-PAIRDEVICE-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-PAIRDEVICE-05: Pair device failed
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - There is no Bioheart device paired with app
    ...
    ...
    ...     Test Steps:
    ...    Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Pair Bioheart now button
    ...    - 4. Select a device in the list of found devices
    ...    - 5. Press on Retry or Cancel button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Pair Bioheart device screen is displayed
    ...    - 3. Navigate to the SCANNING FOR DEVICE... screen, there shall be an instructive message Please make sure the device is discoverable mode. If not, please turn the Bioheart device on
    ...       - The list of found devices is displayed
    ...    - 4. There shall be popup modal with message Failed to connect Bioheart-Device ID
    ...    - 5. Start to find the device to pair again or navigate back to the Pair Bioheart device screen
    [Tags]      BCA-BIOHEARTINT-PAIRDEVICE-05       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-PAIRDEVICE-06: Pair with device being paired with another phone
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing with another phone
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Pair Bioheart now button
    ...    - 4. Select a device in the list of found devices
    ...    - 5. Press on View Guide or Cancel button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Pair Bioheart device screen is displayed
    ...    - 3. Navigate to the SCANNING FOR DEVICE... screen, there shall be an instructive message Please make sure the device is discoverable mode. If not, please turn the Bioheart device on
    ...       - The list of found devices is displayed
    ...    - 4. There shall be a popup modal with message Failed to connect Bioheart Device ID / The device was paired with another phone or another account. You need to factory reset the device before pairing with it
    ...    - 5. The app shall display the instruction to perform factory reset of the device or navigate back to the Pair Bioheart device screen
    [Tags]      BCA-BIOHEARTINT-PAIRDEVICE-06       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-DEVICEINFO-01: View Bioheart device information screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...       - Tap to view heart rhythm button
    ...       - Sync your heart data button
    ...       - Device ID
    ...       - Bluetooth connection status
    ...       - Battery status
    ...       - Body contact
    ...       - Firm version
    [Tags]      BCA-BIOHEARTINT-DEVICEINFO-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-DEVICEINFO-02: Check device status information when Bioheart device is disconnected
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Turn off device or turn off Bluetooth on the phone
    ...    - 2. Open the app
    ...    - 3. Press on Bioheart tab
    ...    - 4. Check device status information
    ...
    ...     Expected Output:
    ...    - 1. Device is disconnected to app
    ...    - 2. The app is opened
    ...    - 3. Bioheart device information screen is displayed; there shall be a message Bluetooth is turned off. Turn it on ti sync with your Bioheart and view live heart rhythm data/ Tap to fix it now and
    ...       - Tap to view heart rhythm and Sync your heart data buttons are disabled
    ...       - Status is disconnected
    ...       - Battery; Body contact and Firmware displayed --
    [Tags]      BCA-BIOHEARTINT-DEVICEINFO-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-DEVICEINFO-03: Navigate to the Your heart rhythm screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Tap to view heart rhythm button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Navigate to the Your heart rhythm screen
    [Tags]      BCA-BIOHEARTINT-DEVICEINFO-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-DEVICEINFO-04: Navigate to the Bioheart data sync screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Tap to view heart rhythm button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Navigate to the Bioheart data sync screen
    [Tags]      BCA-BIOHEARTINT-DEVICEINFO-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-DEVICEINFO-05: Check battery status when device is turned on
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Check battery status when device is discharging
    ...    - 4. Connect device with charger
    ...    - 5. Check battery status when device is charging
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. The app shall display the estimated remaining operation time and battery level of the Bioheart device
    ...    - 4. Connect device with charger successfully
    ...    - 5. The app shall display status: Charging - battery level and remaining time until charging full
    [Tags]      BCA-BIOHEARTINT-DEVICEINFO-05       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-DEVICEINFO-06: Check battery status when device is turned off
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Turn off device or turn off Bluetooth on the phone
    ...    - 2. Connect device with charger
    ...    - 3. Open the app
    ...    - 4. Press on Bioheart tab and check device status
    ...    - 5. Disconnect device with charger and check battery status
    ...
    ...     Expected Output:
    ...    - 1. Device is disconnected to app
    ...    - 2. Connect device with charger successfully
    ...    - 3. The app is opened
    ...    - 4. Bioheart device information screen is displayed; there shall be a message Bluetooth is turned off. Turn it on ti sync with your Bioheart and view live heart rhythm data/ Tap to fix it now and device status is disconnected
    ...    - 5. Disconnect device with charger successfully and the app shall display status: Charging - battery level and remaining time until charging full
    [Tags]      BCA-BIOHEARTINT-DEVICEINFO-06       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-DEVICEINFO-07: View Body contact instruction
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on information icon next to Body contact
    ...    - 4. Press on Next/Previous button or swipe to left/right
    ...    - 5. Press on X icon button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Body contact instruction screen is displayed
    ...    - 4. Navigate to next or previous screen
    ...    - 5. Body contact instruction screen is closed
    [Tags]      BCA-BIOHEARTINT-DEVICEINFO-07       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-DEVICEINFO-08: Remove Bioheart device
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Remove button
    ...    - 4. Press on Remove or Cancel button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. There shall be a popup modal
    ...    - 4. Confirm to remove device from app or close the modal
    [Tags]      BCA-BIOHEARTINT-DEVICEINFO-08       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-LIVEHRSCREEN-01: View live heart rhythm screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Tap to view heart rhythm tab
    ...    - 4. Check components in the Your heart rhythm screen
    ...    - 5. Press on exit button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Navigate to the Your heart rhythm screen
    ...    - 4. There shall be a screen the user can view 3-channel ECG data streamed from Bioheart device in real-time
    ...       - There shall be the heart rate information of the diagnosis channel
    ...       - There shall be a exit button
    ...    - 5. Navigate back to the Bioheart device information screen
    [Tags]      BCA-BIOHEARTINT-LIVEHRSCREEN-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-LIVEHRSCREEN-02: View live heart rhythm screen when the Bluetooth or device is turned off
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...       - There shall be a message Bluetooth is turned off. Turn it on to sync with your Bioheart and view live heart rhythm data. Tap to fix it now
    ...       - The Tap to view heart rhythm card is disabled
    [Tags]      BCA-BIOHEARTINT-LIVEHRSCREEN-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SYNCDATA-01: Sync recorded data manually
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Sync your heart data button
    ...    - 4. Wait a minute
    ...    - 5. Wait for backup process completed
    ...    - 6. Press on Close button
    ...    - 7. Press on back icon button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Navigate to the Bioheart data sync screen with message Looking for recordings to back up...
    ...    - 4. Displayed components:
    ...       - There shall be a message Heart rhythm data are synced to the cloud automatically when you are using the app. Stay on this screen to expedite the syncing.
    ...       - There shall be a list of pending ECG recordings (grouped by day) stored on their Bioheart device that has not yet been backed up to the cloud.
    ...       - The user shall be able to view the backup progress of each recording
    ...       - The app shall keep the phone awake until the backup is completed during the backup process
    ...       - The user can trigger recordings by pressing Center button on the device during the backup process
    ...    - 5. There shall be a popup modal with message Backup completed
    ...    - 6. The popup is closed and there shall be message All recordings were synced
    ...    - 7. Navigate to the Bioheart device information screen
    [Tags]      BCA-BIOHEARTINT-SYNCDATA-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SYNCDATA-02: Sync recorded data manually when there is no backup files
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Sync your heart data button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Navigate to the Bioheart data sync screen with message Looking for recordings to back up...
    ...         There is a message All recordings were synced
    [Tags]      BCA-BIOHEARTINT-SYNCDATA-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SYNCDATA-03: Create snapshot during the backup process
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Sync your heart data button
    ...    - 4. Press on Center button on the Bioheart device
    ...    - 5. Press on Create or Cancel button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Navigate to the Bioheart data sync screen with message Looking for recordings to back up...
    ...    - 4. There shall be a popup displayed on the phone's screen
    ...    - 5. The snapshot is created or the popup is closed
    [Tags]      BCA-BIOHEARTINT-SYNCDATA-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SYNCDATA-04: Sync recorded data manually when the Bluetooth or device is turned off
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Turn off device or Bluetooth on the phone
    ...    - 2. Open the app
    ...    - 3. Press on Bioheart tab
    ...
    ...     Expected Output:

    ...    - 1. Device is disconnected to app
    ...    - 2. The app is opened
    ...    - 3. Bioheart device information screen is displayed
    ...       - There shall be a message Bluetooth is turned off. Turn it on to sync with your Bioheart and view live heart rhythm data. Tap to fix it now
    ...       - Sync your heart data card is disabled
    ...       - In case, the user is on the Bioheart data sync screen, there shall be a message No connection with Bioheart device
    [Tags]      BCA-BIOHEARTINT-SYNCDATA-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SYNCDATA-05: Sync recorded data manually when there is no internet
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Turn off the Internet on the phone
    ...    - 2. Open the app
    ...    - 3. Press on Bioheart tab
    ...    - 3. Press on Sync your heart data button
    ...
    ...     Expected Output:
    ...    - 1. The Internet is off
    ...    - 2. The app is opened
    ...    - 3. Bioheart device information screen is displayed
    ...    - 4. Navigate to the Bioheart data sync with there shall message No Internet connection/ All recordings were synced
    [Tags]      BCA-BIOHEARTINT-SYNCDATA-05       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SYNCDATA-06: Sync recorded data manually when battery level is low
    [Documentation]     Author: Linh Tran
    ...
    ...      Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...     - Battery level is less than or equal to 40%
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Sync your heart data button
    ...    - 4. Press on Got it button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Navigate to the Bioheart data sync screen with message Looking for recordings...
    ...       - There shall be a popup with Bioheart's battery is low. Please charge your device.
    ...    - 4. The popup is closed and backup process is ongoing
    [Tags]      BCA-BIOHEARTINT-SYNCDATA-06       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SYNCDATA-07: Turn off the app during the backup process
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Sync your heart data button
    ...    - 4. Press Home button or kill app on the phone
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Navigate to the Bioheart data sync screen with message Looking for recordings...
    ...    - 4. The app is closed and backup process is stopped
    [Tags]      BCA-BIOHEARTINT-SYNCDATA-07       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SYNCDATA-08: Sync recorded data automatically for Android
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - 1. The app shall run in background (Android only) and automatically sync recorded data of the user to the cloud
    [Tags]      BCA-BIOHEARTINT-SYNCDATA-08       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SYNCDATA-09: Sync recorded data automatically for iOS
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...
    ...     Expected Output:
    ...    - 1. The app is opend
    ...       - Data automatically sync recorded data of the user to the cloud
    [Tags]      BCA-BIOHEARTINT-SYNCDATA-09       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-CREATESNAPSHOT-01: Start a rhythm recording from Bioheart device when the app is closed and disconnected with device
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Press on Center button on the Biheart device
    ...
    ...     Expected Output:
    ...    - 1. The rhythm recording is started to create.
    ...       - The Bioheart device's light show flash green.
    [Tags]      BCA-BIOHEARTINT-CREATESNAPSHOT-01    BCCA-SRS-11-FRS-01-4       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-CREATESNAPSHOT-02: Start a rhythm recording from Bioheart device with note when the app is opened
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Center button on the Biheart device
    ...    - 3. Press on Add notes button
    ...    - 4. Press on v button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. The rhythm recording is started to create.
    ...       - The Bioheart device's light show flash green.
    ...       - Display a note popup in the app
    ...             + Content: Take a note for this snapshot?
    ...             + There shall be 2 buttons: Skip and Add notes
    ...    - 3. Navigate to the Notes screen
    ...       - There is a textbox for the user can enter a note of a snapshot.
    ...       - The user can add tags to the note. There are 3 tabs: “Symptoms”, “Activities”, and “Diet”, each tab contains tags for the user to select. The user can select multiple tags.
    ...             + “Symptoms” tab - there is a list of symptoms:
    ...                 * Can’t sleep
    ...                 * Chest pain
    ...                 * Chest discomfort
    ...                 * Cough
    ...                 * Dizziness
    ...                 * Fatigue
    ...                 * Fever
    ...                 * Headache
    ...                 * Lightheadedness
    ...                 * Nausea
    ...                 * Numbness in arm(s) or leg(s)
    ...                 * Palpitations
    ...                 * Poor appetite
    ...                 * Pressure (Cardiac integration only)
    ...                 * Shortness of breath
    ...                 * Sore throat
    ...                 * Sweating
    ...             + “Activities & Diet” tab - there is a list of activities and diet
    ...                 * Cycling
    ...                 * Exercised
    ...                 * Running
    ...                 * Swimming
    ...                 * Walking
    ...                 * Woke up
    ...                 * Alcohol
    ...                 * Caffeine
    ...                 * Sweating
    ...             + “Mood” tab
    ...                 * Anxiety
    ...                 * Relaxed
    ...                 * Stressed
    ...                 * Slept well
    ...                 * Slept poorly
    ...       - Once the user selects a tag, it shall display in the selected status.
    ...       - Once the user selects a selected tag or press on x button behind selected tag, it shall remove
    ...       - There is a [Search] box for the user can search the tag. If the result does not match any tags in the list, there shall be a message: “No tags match your search”.
    ...    - 4. Snapshot is created with note
    [Tags]      BCA-BIOHEARTINT-CREATESNAPSHOT-02  BCCA-SRS-11-FRS-02-3       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-CREATESNAPSHOT-03: Skip to add note for a snapshot when the app is open
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Center button on the Biheart device
    ...    - 3. Press on Skip button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. The rhythm recording is started to create.
    ...       - The Bioheart device's light show flash green.
    ...       - Display a note popup in the app
    ...             + Content: Take a note for this snapshot?
    ...             + There shall be 2 buttons: Skip and Add notes
    ...    - 3. Snapshot is created without note
    [Tags]      BCA-BIOHEARTINT-CREATESNAPSHOT-03  BCCA-SRS-11-FRS-02-3       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-CREATESNAPSHOT-04: Start a rhythm recording from Bioheart device without note when the app is opened
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Center button on the Biheart device
    ...    - 3. Press on Add notes button
    ...    - 4. Press on x button
    ...    - 5. Press on Yes or No button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. The rhythm recording is started to create.
    ...       - The Bioheart device's light show flash green.
    ...       - Display a note popup in the app
    ...             + Content: Take a note for this snapshot?
    ...             + There shall be 2 buttons: Skip and Add notes
    ...    - 3. Navigate to the Notes screen
    ...       - There is a textbox for the user can enter a note of a snapshot.
    ...       - The user can add tags to the note. There are 3 tabs: “Symptoms”, “Activities”, and “Diet”, each tab contains tags for the user to select. The user can select multiple tags.
    ...             + “Symptoms” tab - there is a list of symptoms:
    ...                 * Can’t sleep
    ...                 * Chest pain
    ...                 * Chest discomfort
    ...                 * Cough
    ...                 * Dizziness
    ...                 * Fatigue
    ...                 * Fever
    ...                 * Headache
    ...                 * Lightheadedness
    ...                 * Nausea
    ...                 * Numbness in arm(s) or leg(s)
    ...                 * Palpitations
    ...                 * Poor appetite
    ...                 * Pressure (Cardiac integration only)
    ...                 * Shortness of breath
    ...                 * Sore throat
    ...                 * Sweating
    ...             + “Activities & Diet” tab - there is a list of activities and diet
    ...                 * Cycling
    ...                 * Exercised
    ...                 * Running
    ...                 * Swimming
    ...                 * Walking
    ...                 * Woke up
    ...                 * Alcohol
    ...                 * Caffeine
    ...                 * Sweating
    ...             + “Mood” tab
    ...                 * Anxiety
    ...                 * Relaxed
    ...                 * Stressed
    ...                 * Slept well
    ...                 * Slept poorly
    ...       - Once the user selects a tag, it shall display in the selected status.
    ...       - Once the user selects a selected tag or press on x button behind selected tag, it shall remove
    ...       - There is a [Search] box for the user can search the tag. If the result does not match any tags in the list, there shall be a message: “No tags match your search”.
    ...    - 4. There shall be a popup
    ...       - Content: Are you sure you want to cancel taking note? All changes will not be saved
    ...       -  There shall be 2 button Yes and No
    ...    - 5. The user shall exit the “Note” screen and no data is saved or the user still stays on the “Note” screen
    [Tags]      BCA-BIOHEARTINT-CREATESNAPSHOT-04  BCCA-SRS-11-FRS-02-3       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-CREATESNAPSHOT-05: Start a rhythm recording from Bioheart device with note when the app is closed but still connected to app
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Close the app
    ...    - 2. Press on Center button on the Biheart device
    ...    - 3. Press on notification
    ...    - 4. Press on Add notes button
    ...    - 5. Press on v button
    ...
    ...     Expected Output:
    ...    - 1. The app is closed
    ...    - 2. There shall be a notification sent by the systerm
    ...       - Title: Recording trigger from Bioheart
    ...       - Content: Tap to confirm or dismiss to recording
    ...    - 3. The rhythm recording is started to create.
    ...       - The Bioheart device's light show flash green.
    ...       - Display a note popup in the app
    ...             + Content: Take a note for this snapshot?
    ...             + There shall be 2 buttons: Skip and Add notes
    ...    - 4 Navigate to the Notes screen
    ...       - There is a textbox for the user can enter a note of a snapshot.
    ...       - The user can add tags to the note. There are 3 tabs: “Symptoms”, “Activities”, and “Diet”, each tab contains tags for the user to select. The user can select multiple tags.
    ...             + “Symptoms” tab - there is a list of symptoms:
    ...                 * Can’t sleep
    ...                 * Chest pain
    ...                 * Chest discomfort
    ...                 * Cough
    ...                 * Dizziness
    ...                 * Fatigue
    ...                 * Fever
    ...                 * Headache
    ...                 * Lightheadedness
    ...                 * Nausea
    ...                 * Numbness in arm(s) or leg(s)
    ...                 * Palpitations
    ...                 * Poor appetite
    ...                 * Pressure (Cardiac integration only)
    ...                 * Shortness of breath
    ...                 * Sore throat
    ...                 * Sweating
    ...             + “Activities & Diet” tab - there is a list of activities and diet
    ...                 * Cycling
    ...                 * Exercised
    ...                 * Running
    ...                 * Swimming
    ...                 * Walking
    ...                 * Woke up
    ...                 * Alcohol
    ...                 * Caffeine
    ...                 * Sweating
    ...             + “Mood” tab
    ...                 * Anxiety
    ...                 * Relaxed
    ...                 * Stressed
    ...                 * Slept well
    ...                 * Slept poorly
    ...       - Once the user selects a tag, it shall display in the selected status.
    ...       - Once the user selects a selected tag or press on x button behind selected tag, it shall remove
    ...       - There is a [Search] box for the user can search the tag. If the result does not match any tags in the list, there shall be a message: “No tags match your search”.
    ...    - 5. Snapshot is created with note
    [Tags]      BCA-BIOHEARTINT-CREATESNAPSHOT-05  BCCA-SRS-11-FRS-02-3       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-CREATESNAPSHOT-06: Skip to add note for snapshot when the app is closed but still connected to app
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Close the app
    ...    - 2. Press on Center button on the Biheart device
    ...    - 3. Press on notification
    ...    - 4.
    ...
    ...     Expected Output:
    ...    - 1. The app is closed
    ...    - 2. There shall be a notification sent by the systerm
    ...       - Title: Recording trigger from Bioheart
    ...       - Content: Tap to confirm or dismiss to recording
    ...    - 3. The rhythm recording is started to create.
    ...       - The Bioheart device's light show flash green.
    ...       - Display a note popup in the app
    ...             + Content: Take a note for this snapshot?
    ...             + There shall be 2 buttons: Skip and Add notes
    ...    - 4. Snapshot is created without note
    [Tags]      BCA-BIOHEARTINT-CREATESNAPSHOT-06  BCCA-SRS-11-FRS-02-3       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-CREATESNAPSHOT-07: Start a rhythm recording from Bioheart device without note when the app is closed but still connected to app
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Close the app
    ...    - 2. Press on Center button on the Biheart device
    ...    - 3. Press on notification
    ...    - 4. Press on Add notes button
    ...    - 5. Press on v button
    ...    - 6. Press on Yes or No button
    ...
    ...     Expected Output:
    ...    - 1. The app is closed
    ...    - 2. There shall be a notification sent by the systerm
    ...       - Title: Recording trigger from Bioheart
    ...       - Content: Tap to confirm or dismiss to recording
    ...    - 3. The rhythm recording is started to create.
    ...       - The Bioheart device's light show flash green.
    ...       - Display a note popup in the app
    ...             + Content: Take a note for this snapshot?
    ...             + There shall be 2 buttons: Skip and Add notes
    ...    - 4. Navigate to the Notes screen
    ...       - There is a textbox for the user can enter a note of a snapshot.
    ...       - The user can add tags to the note. There are 3 tabs: “Symptoms”, “Activities”, and “Diet”, each tab contains tags for the user to select. The user can select multiple tags.
    ...             + “Symptoms” tab - there is a list of symptoms:
    ...                 * Can’t sleep
    ...                 * Chest pain
    ...                 * Chest discomfort
    ...                 * Cough
    ...                 * Dizziness
    ...                 * Fatigue
    ...                 * Fever
    ...                 * Headache
    ...                 * Lightheadedness
    ...                 * Nausea
    ...                 * Numbness in arm(s) or leg(s)
    ...                 * Palpitations
    ...                 * Poor appetite
    ...                 * Pressure (Cardiac integration only)
    ...                 * Shortness of breath
    ...                 * Sore throat
    ...                 * Sweating
    ...             + “Activities & Diet” tab - there is a list of activities and diet
    ...                 * Cycling
    ...                 * Exercised
    ...                 * Running
    ...                 * Swimming
    ...                 * Walking
    ...                 * Woke up
    ...                 * Alcohol
    ...                 * Caffeine
    ...                 * Sweating
    ...             + “Mood” tab
    ...                 * Anxiety
    ...                 * Relaxed
    ...                 * Stressed
    ...                 * Slept well
    ...                 * Slept poorly
    ...       - Once the user selects a tag, it shall display in the selected status.
    ...       - Once the user selects a selected tag or press on x button behind selected tag, it shall remove
    ...       - There is a [Search] box for the user can search the tag. If the result does not match any tags in the list, there shall be a message: “No tags match your search”.
    ...    - 5. There shall be a popup
    ...       - Content: Are you sure you want to cancel taking note? All changes will not be saved
    ...       -  There shall be 2 button Yes and No
    ...    - 6. The user shall exit the “Note” screen and no data is saved or the user still stays on the “Note” screen
    [Tags]      BCA-BIOHEARTINT-CREATESNAPSHOT-07  BCCA-SRS-11-FRS-02-3       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-CP-01: Start or reactivate the care plan
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is stopped or deactivated
    ...     - The Bioheart device is pairing with Biocare cardiac app
    ...     - There is a registered account on cardiac portal
    ...
    ...     Test Steps:
    ...    - 1. Go to https://delta.cardiac.bioflux.io/ and sign in to this portal
    ...    - 2. Go to patient details screen
    ...    - 3. Start or reactivated the careplan that linking with this account
    ...    - 4. Press on Heart monitor tab
    ...    - 5. Press on Bioheart monitor tab
    ...    - 6. Press on Enable button
    ...    - 7. Select Report frequency and press on Enable button
    ...
    ...     Expected Output:
    ...    - 1. The portal is opened and sign in successfull
    ...    - 2. The patient details screen is displayed
    ...    - 3. The careplan is started or reactivated
    ...       - Bioheart tab is displayed on Biocare Cardiac app
    ...       - The app shall automatically connect with the device and the data on the device will be automatically synced to the app
    ...    - 4. Heart monitor screen is displayed
    ...    - 5. Bioheart monitor screen is displayed
    ...    - 6. Enable Bioheart monitor popup is displayed
    ...    - 6. Bioheart integration is enabled
    ...       - The authorization shall be approved automatically by the app
    ...       - The user doesn’t have to manually authorize the integration as in Bioheart app
    [Tags]      BCA-BIOHEARTINT-CP-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-CP-02: Stop or deactivate the care plan
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is started
    ...     - The Bioheart device is pairing with Biocare cardiac app
    ...     - There is a registered account on cardiac portal
    ...
    ...     Test Steps:
    ...    - 1. Go to https://delta.cardiac.bioflux.io/ and sign in to this portal
    ...    - 2. Go to patient details screen
    ...    - 3. Stop the careplan that linking with this account
    ...
    ...     Expected Output:
    ...    - 1. The portal is opened and sign in successfull
    ...    - 2. The patient details screen is displayed
    ...    - 3. The careplan is stopped
    ...       - Bioheart tab is hidden on Biocare Cardiac app
    ...       - The app shall automatically disconnect with the device without deleting the data on the device
    [Tags]      BCA-BIOHEARTINT-CP-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-UPDATEFW-01: Inform the user on new firmware update when the app is closed
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Close the app
    ...    - 2. Press on notification
    ...
    ...     Expected Output:
    ...    - 1. The app is closed
    ...       - The app shall push notification informed for user when there is a new firmware available for download and installation
    ...             + Title: New Bioheart firmware update
    ...             + Contents: A new firmware update is available. Tap here to download and install the update for your Bioheart device
    ...    - 2. Navigate ot the Firmware update screen
    ...       - The app shall perform checking for new updates automatically to display the information of the update to the user
    [Tags]      BCA-BIOHEARTINT-UPDATEFW-01  BCCA-SRS-11-FRS-02-1-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-UPDATEFW-02: Inform the user on new firmware update when the app is opened
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on notification
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...       - The app shall push notification informed for user when there is a new firmware available for download and installation
    ...             + Title: New Bioheart firmware update
    ...             + Contents: A new firmware update is available. Tap here to download and install the update for your Bioheart device
    ...    - 2. Navigate ot the Firmware update screen
    ...       - The app shall perform checking for new updates automatically to display the information of the update to the user
    [Tags]      BCA-BIOHEARTINT-UPDATEFW-02  BCCA-SRS-11-FRS-02-1-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-UPDATEFW-03: Update firmware when the device is off
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is off
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on notification
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. No event happens
    [Tags]      BCA-BIOHEARTINT-UPDATEFW-03  BCCA-SRS-11-FRS-02-1-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-UPDATEFW-04: Update firmware when the device is on
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on notification
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Navigate to the Firmware update screen
    [Tags]      BCA-BIOHEARTINT-UPDATEFW-04  BCCA-SRS-11-FRS-02-1-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-UPDATEFW-05: Update firmware when the users go to Firmware Update screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Firmware update button
    ...    - 4. Press on Check for update button
    ...    - 5. Press on Update now or Later
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Navigate to the Firmware update screen
    ...    - 4. Status changes to Checking...
    ...       - New update available screen is displayed
    ...       - Version FW
    ...       - Content: belong FW improvement
    ...       - There shall be Update now and Later buttons
    ...    - 5. Installing popup is displayed and wait for a minute to update firmware or update firmware process is canceled
    [Tags]      BCA-BIOHEARTINT-UPDATEFW-05  BCCA-SRS-11-FRS-02-1-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-UPDATEFW-06: No firmware is updated
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Firmware update button
    ...    - 4. Press on Check for update button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Navigate to the Firmware update screen
    ...    - 4. Status changes to Checking...
    ...       - Status changes to Check for update with message No update available
    [Tags]      BCA-BIOHEARTINT-UPDATEFW-06  BCCA-SRS-11-FRS-02-1-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-UPDATEFW-07: Update firmware when battery level is low
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Firmware update button
    ...    - 4. Press on Check for update button
    ...    - 5. Press on Update now
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Navigate to the Firmware update screen
    ...    - 4. Status changes to Checking...
    ...       - New update available screen is displayed
    ...    - 5. The app shall display message Your device's battery level is under 40%. Please charge your device before updating firmware if battery level is 40% or our device's battery level is under 20%. Please wait for the device to be charged before updating firmware when battery level is 20%
    [Tags]      BCA-BIOHEARTINT-UPDATEFW-07  BCCA-SRS-11-FRS-02-1-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-UPDATEFW-08: The Internet connection is lost when downloading the new firmware from the server
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Firmware update button
    ...    - 4. Press on Check for update button
    ...    - 5. Disconnect the Internet
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Navigate to the Firmware update screen
    ...    - 4. Status changes to Checking...
    ...       - New update available screen is displayed
    ...    - 5. Internet connection is lost
    ...       - The app shall display an error message “Could not download the firmware from server. Internet connection is interrupted.” and cancel the firmware update process
    [Tags]      BCA-BIOHEARTINT-UPDATEFW-08  BCCA-SRS-11-FRS-02-1-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-UPDATEFW-09: The connection with the device is lost when the app is sending the new firmware to the device
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Firmware update button
    ...    - 4. Press on Check for update button
    ...    - 5. Turn off Bluetooth for device with app
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Navigate to the Firmware update screen
    ...    - 4. Status changes to Checking...
    ...       - New update available screen is displayed
    ...    - 5. Bluetooth is off
    ...       - The app shall display an error message “Could not connect with your Bioheart. Please ensure your device is powered on and nearby the phone.” and cancel the firmware update process.
    [Tags]      BCA-BIOHEARTINT-UPDATEFW-09  BCCA-SRS-11-FRS-02-1-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-UPDATEFW-10: Update firmware failed during the device is performing the firmware update process
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Firmware update button
    ...    - 4. Press on Check for update button
    ...    - 5. Wait for within 2 minutes
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Navigate to the Firmware update screen
    ...    - 4. Status changes to Checking...
    ...       - New update available screen is displayed
    ...    - 5. The app shall display a message “Failed to update firmware. Please try again.”
    [Tags]      BCA-BIOHEARTINT-UPDATEFW-10  BCCA-SRS-11-FRS-02-1-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-UPDATEFW-11: Update firmware failed after the device is performing the firmware update process
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Firmware update button
    ...    - 4. Press on Check for update button
    ...    - 5. Wait for more 2 minutes
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Navigate to the Firmware update screen
    ...    - 4. Status changes to Checking...
    ...       - New update available screen is displayed
    ...    - 5. The app shall display a message “Could not connect to your Bioheart. Please ensure your device is powered on and nearby the phone.”
    [Tags]      BCA-BIOHEARTINT-UPDATEFW-11  BCCA-SRS-11-FRS-02-1-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SENDFB-01: Send feedback with default email
        [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Send feedback button
    ...    - 4. Enter description
    ...    - 5. Add attachment files
    ...    - 6. Press on Send button
    ...    - 7. Press on Close button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Send feedback screen is displayed
    ...    - 4. Enter description is successfully and send button is enabled
    ...    - 5. Attachment files are added successfully
    ...    - 6. Send feedback successfully and display popup
    ...       - Title: Success!
    ...       - Content: Your request has been submitted successfully.Thank you for your support.
    ...       - There shall be Close button
    ...       - The feedback message shall be sent over email to support@bioheart.com with the content format as below:
    ...       - Email Subject:
    ...             + Customer Feedback
    ...             + Attachments: attachments from the message.
    ...             + Reply to: the email address value of Contact email field.
    ...             + Email contents:
    ...             + Dear Bioheart support team,
    ...             + Username: first name and last name of the account
    ...             + Email: registered account (editable)
    ...             + [Username] has sent a feedback/ has requested a feature below:
    ...                 * <message>
    ...       - Additional information:
    ...             + Phone OS: <platform> <platform version>
    ...             + Phone model: <phone model>
    ...             + Bioheart App version: <app version>
    ...             + Bioheart Firmware version: <FW version>
    ...             + platform: iOS or Android
    ...             + platform version: OS version
    ...             + phone model: device model
    ...             + App version: Bioheart app build version
    ...             + FW version: firmware version of Bioheart device
    ...    - 7. Close the popup
    [Tags]      BCA-BIOHEARTINT-SENDFB-01  BCCA-SRS-11-FRS-02-2       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SENDFB-02: Request a feature with default email
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Send feedback button
    ...    - 4. Select Request a feature option
    ...    - 5. Enter description
    ...    - 6. Add attachment files
    ...    - 7. Press on Send button
    ...    - 8. Press on Close button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Send feedback screen is displayed
    ...    - 4. Request a feature is displayed
    ...    - 5. Enter description is successfully and send button is enabled
    ...    - 6. Attachment files are added successfully
    ...    - 7. Send feedback successfully and display popup
    ...       - Title: Success!
    ...       - Content: Your request has been submitted successfully.Thank you for your support.
    ...       - There shall be Close button
    ...       - The request feature message shall be sent over email to support@bioheart.com with the content format as below:
    ...       - Email Subject:
    ...             + Request feature
    ...             + Attachments: attachments from the message.
    ...             + Reply to: the email address value of Contact email field.
    ...             + Email contents:
    ...             + Dear Bioheart support team,
    ...             + Username: first name and last name of the account
    ...             + Email: registered account (editable)
    ...             + [Username] has sent a feedback/ has requested a feature below:
    ...                 * <message>
    ...       - Additional information:
    ...             + Phone OS: <platform> <platform version>
    ...             + Phone model: <phone model>
    ...             + Bioheart App version: <app version>
    ...             + Bioheart Firmware version: <FW version>
    ...             + platform: iOS or Android
    ...             + platform version: OS version
    ...             + phone model: device model
    ...             + App version: Bioheart app build version
    ...             + FW version: firmware version of Bioheart device
    ...    - 8. Close the popup
    [Tags]      BCA-BIOHEARTINT-SENDFB-02  BCCA-SRS-11-FRS-02-2       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SENDFB-03: Send feedback without attachment files (default email)
        [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Send feedback button
    ...    - 4. Enter description
    ...    - 5. Press on Send button
    ...    - 6. Press on Close button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Send feedback screen is displayed
    ...    - 4. Enter description is successfully and send button is enabled
    ...    - 5. Send feedback successfully and display popup
    ...       - Title: Success!
    ...       - Content: Your request has been submitted successfully.Thank you for your support.
    ...       - There shall be Close button
    ...       - The feedback message shall be sent over email to support@bioheart.com with the content format as below:
    ...       - Email Subject:
    ...             + Customer Feedback
    ...             + Reply to: the email address value of Contact email field.
    ...             + Email contents:
    ...             + Dear Bioheart support team,
    ...             + Username: first name and last name of the account
    ...             + Email: registered account (editable)
    ...             + [Username] has sent a feedback/ has requested a feature below:
    ...                 * <message>
    ...       - Additional information:
    ...             + Phone OS: <platform> <platform version>
    ...             + Phone model: <phone model>
    ...             + Bioheart App version: <app version>
    ...             + Bioheart Firmware version: <FW version>
    ...             + platform: iOS or Android
    ...             + platform version: OS version
    ...             + phone model: device model
    ...             + App version: Bioheart app build version
    ...             + FW version: firmware version of Bioheart device
    ...    - 6. Close the popup
    [Tags]      BCA-BIOHEARTINT-SENDFB-03  BCCA-SRS-11-FRS-02-2       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SENDFB-04: Request a feature without attachemnt files (default email)
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Send feedback button
    ...    - 4. Select Request a feature option
    ...    - 5. Enter description
    ...    - 6. Press on Send button
    ...    - 7. Press on Close button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Send feedback screen is displayed
    ...    - 4. Request a feature is displayed
    ...    - 5. Enter description is successfully and send button is enabled
    ...    - 6. Send feedback successfully and display popup
    ...       - Title: Success!
    ...       - Content: Your request has been submitted successfully.Thank you for your support.
    ...       - There shall be Close button
    ...       - The request feature message shall be sent over email to support@bioheart.com with the content format as below:
    ...       - Email Subject:
    ...             + Request feature
    ...             + Reply to: the email address value of Contact email field.
    ...             + Email contents:
    ...             + Dear Bioheart support team,
    ...             + Username: first name and last name of the account
    ...             + Email: registered account (editable)
    ...             + [Username] has sent a feedback/ has requested a feature below:
    ...                 * <message>
    ...       - Additional information:
    ...             + Phone OS: <platform> <platform version>
    ...             + Phone model: <phone model>
    ...             + Bioheart App version: <app version>
    ...             + Bioheart Firmware version: <FW version>
    ...             + platform: iOS or Android
    ...             + platform version: OS version
    ...             + phone model: device model
    ...             + App version: Bioheart app build version
    ...             + FW version: firmware version of Bioheart device
    ...    - 7. Close the popup
    [Tags]      BCA-BIOHEARTINT-SENDFB-04  BCCA-SRS-11-FRS-02-2       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SENDFB-05: Send feedback failed (default email)
        [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Send feedback button
    ...    - 4. Enter description
    ...    - 5. Add attachment files
    ...    - 6. Press on Send button
    ...    - 7. Press on Try again button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Send feedback screen is displayed
    ...    - 4. Enter description is successfully and send button is enabled
    ...    - 5. Attachment files are added successfully
    ...    - 6. Send feedback failed and display popup
    ...       - Title: Failed!
    ...       - Content: Sorry, it seems your request failed
    ...       - There shall be Try again button
    ...    - 7. The popup is closed
    [Tags]      BCA-BIOHEARTINT-SENDFB-05  BCCA-SRS-11-FRS-02-2       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SENDFB-06: Request a feature failed (default email)
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Send feedback button
    ...    - 4. Select Request a feature option
    ...    - 5. Enter description
    ...    - 6. Add attachment files
    ...    - 7. Press on Send button
    ...    - 8. Press on Try again button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Send feedback screen is displayed
    ...    - 4. Request a feature is displayed
    ...    - 5. Enter description is successfully and send button is enabled
    ...    - 6. Attachment files are added successfully
    ...    - 7. Send feedback failed and display popup
    ...       - Title: Failed!
    ...       - Content: Sorry, it seems your request failed
    ...       - There shall be Try again button
    ...    - 8. The popup is closed
    [Tags]      BCA-BIOHEARTINT-SENDFB-06  BCCA-SRS-11-FRS-02-2       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SENDFB-07: Send feedback with optional email
        [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Send feedback button
    ...    - 4. Change email
    ...    - 5. Enter description
    ...    - 6. Add attachment files
    ...    - 7. Press on Send button
    ...    - 8. Press on Close button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Send feedback screen is displayed
    ...    - 4. Email is changed
    ...    - 5. Enter description is successfully and send button is enabled
    ...    - 6. Attachment files are added successfully
    ...    - 7. Send feedback successfully and display popup
    ...       - Title: Success!
    ...       - Content: Your request has been submitted successfully.Thank you for your support.
    ...       - There shall be Close button
    ...       - The feedback message shall be sent over email to support@bioheart.com with the content format as below:
    ...       - Email Subject:
    ...             + Customer Feedback
    ...             + Attachments: attachments from the message.
    ...             + Reply to: the email address value of Contact email field.
    ...             + Email contents:
    ...             + Dear Bioheart support team,
    ...             + Username: first name and last name of the account
    ...             + Email: registered account (editable)
    ...             + [Username] has sent a feedback/ has requested a feature below:
    ...                 * <message>
    ...       - Additional information:
    ...             + Phone OS: <platform> <platform version>
    ...             + Phone model: <phone model>
    ...             + Bioheart App version: <app version>
    ...             + Bioheart Firmware version: <FW version>
    ...             + platform: iOS or Android
    ...             + platform version: OS version
    ...             + phone model: device model
    ...             + App version: Bioheart app build version
    ...             + FW version: firmware version of Bioheart device
    ...    - 8. Close the popup
    [Tags]      BCA-BIOHEARTINT-SENDFB-07  BCCA-SRS-11-FRS-02-2       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SENDFB-08: Request a feature with optional email
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Send feedback button
    ...    - 4. Change email
    ...    - 5. Select Request a feature option
    ...    - 6. Enter description
    ...    - 7. Add attachment files
    ...    - 8. Press on Send button
    ...    - 9. Press on Close button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Send feedback screen is displayed
    ...    - 4. Email is changed
    ...    - 5. Request a feature is displayed
    ...    - 6. Enter description is successfully and send button is enabled
    ...    - 7. Attachment files are added successfully
    ...    - 8. Send feedback successfully and display popup
    ...       - Title: Success!
    ...       - Content: Your request has been submitted successfully.Thank you for your support.
    ...       - There shall be Close button
    ...       - The request feature message shall be sent over email to support@bioheart.com with the content format as below:
    ...       - Email Subject:
    ...             + Request feature
    ...             + Attachments: attachments from the message.
    ...             + Reply to: the email address value of Contact email field.
    ...             + Email contents:
    ...             + Dear Bioheart support team,
    ...             + Username: first name and last name of the account
    ...             + Email: registered account (editable)
    ...             + [Username] has sent a feedback/ has requested a feature below:
    ...                 * <message>
    ...       - Additional information:
    ...             + Phone OS: <platform> <platform version>
    ...             + Phone model: <phone model>
    ...             + Bioheart App version: <app version>
    ...             + Bioheart Firmware version: <FW version>
    ...             + platform: iOS or Android
    ...             + platform version: OS version
    ...             + phone model: device model
    ...             + App version: Bioheart app build version
    ...             + FW version: firmware version of Bioheart device
    ...    - 9. Close the popup
    [Tags]      BCA-BIOHEARTINT-SENDFB-08  BCCA-SRS-11-FRS-02-2       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SENDFB-09: Send feedback without attachment files (optional email)
        [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Send feedback button
    ...    - 4. Change email
    ...    - 5. Enter description
    ...    - 7. Press on Send button
    ...    - 8. Press on Close button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Send feedback screen is displayed
    ...    - 4. Email is changed
    ...    - 5. Enter description is successfully and send button is enabled
    ...    - 6. Send feedback successfully and display popup
    ...       - Title: Success!
    ...       - Content: Your request has been submitted successfully.Thank you for your support.
    ...       - There shall be Close button
    ...       - The feedback message shall be sent over email to support@bioheart.com with the content format as below:
    ...       - Email Subject:
    ...             + Customer Feedback
    ...             + Reply to: the email address value of Contact email field.
    ...             + Email contents:
    ...             + Dear Bioheart support team,
    ...             + Username: first name and last name of the account
    ...             + Email: registered account (editable)
    ...             + [Username] has sent a feedback/ has requested a feature below:
    ...                 * <message>
    ...       - Additional information:
    ...             + Phone OS: <platform> <platform version>
    ...             + Phone model: <phone model>
    ...             + Bioheart App version: <app version>
    ...             + Bioheart Firmware version: <FW version>
    ...             + platform: iOS or Android
    ...             + platform version: OS version
    ...             + phone model: device model
    ...             + App version: Bioheart app build version
    ...             + FW version: firmware version of Bioheart device
    ...    - 7. Close the popup
    [Tags]      BCA-BIOHEARTINT-SENDFB-09  BCCA-SRS-11-FRS-02-2       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SENDFB-10: Request a feature without attachemnt files (optional email)
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Send feedback button
    ...    - 4. Change email
    ...    - 5. Select Request a feature option
    ...    - 6. Enter description
    ...    - 7. Press on Send button
    ...    - 8. Press on Close button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Send feedback screen is displayed
    ...    - 4. Email is changed
    ...    - 5. Request a feature is displayed
    ...    - 6. Enter description is successfully and send button is enabled
    ...    - 7. Send feedback successfully and display popup
    ...       - Title: Success!
    ...       - Content: Your request has been submitted successfully.Thank you for your support.
    ...       - There shall be Close button
    ...       - The request feature message shall be sent over email to support@bioheart.com with the content format as below:
    ...       - Email Subject:
    ...             + Request feature
    ...             + Reply to: the email address value of Contact email field.
    ...             + Email contents:
    ...             + Dear Bioheart support team,
    ...             + Username: first name and last name of the account
    ...             + Email: registered account (editable)
    ...             + [Username] has sent a feedback/ has requested a feature below:
    ...                 * <message>
    ...       - Additional information:
    ...             + Phone OS: <platform> <platform version>
    ...             + Phone model: <phone model>
    ...             + Bioheart App version: <app version>
    ...             + Bioheart Firmware version: <FW version>
    ...             + platform: iOS or Android
    ...             + platform version: OS version
    ...             + phone model: device model
    ...             + App version: Bioheart app build version
    ...             + FW version: firmware version of Bioheart device
    ...    - 8. Close the popup
    [Tags]      BCA-BIOHEARTINT-SENDFB-10  BCCA-SRS-11-FRS-02-2       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SENDFB-11: Send feedback failed (optional email)
        [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Send feedback button
    ...    - 4. Change email
    ...    - 5. Enter description
    ...    - 6. Add attachment files
    ...    - 7. Press on Send button
    ...    - 8. Press on Try again button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Send feedback screen is displayed
    ...    - 4. Email is changed
    ...    - 5. Enter description is successfully and send button is enabled
    ...    - 6. Attachment files are added successfully
    ...    - 7. Send feedback failed and display popup
    ...       - Title: Failed!
    ...       - Content: Sorry, it seems your request failed
    ...       - There shall be Try again button
    ...    - 8. The popup is closed
    [Tags]      BCA-BIOHEARTINT-SENDFB-11  BCCA-SRS-11-FRS-02-2       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SENDFB-12: Request a feature failed (optional email)
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Send feedback button
    ...    - 4. Change email
    ...    - 5. Select Request a feature option
    ...    - 6. Enter description
    ...    - 7. Add attachment files
    ...    - 8. Press on Send button
    ...    - 9. Press on Try again button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Send feedback screen is displayed
    ...    - 4. Email is changed
    ...    - 5. Request a feature is displayed
    ...    - 6. Enter description is successfully and send button is enabled
    ...    - 7. Attachment files are added successfully
    ...    - 8. Send feedback failed and display popup
    ...       - Title: Failed!
    ...       - Content: Sorry, it seems your request failed
    ...       - There shall be Try again button
    ...    - 9. The popup is closed
    [Tags]      BCA-BIOHEARTINT-SENDFB-12  BCCA-SRS-11-FRS-02-2       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SENDFB-13: Request a feature failed (optional email)
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Send feedback button
    ...    - 4. Change email
    ...    - 5. Select Request a feature option
    ...    - 6. Enter description
    ...    - 7. Add attachment files
    ...    - 8. Press on Send button
    ...    - 9. Press on Try again button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Send feedback screen is displayed
    ...    - 4. Email is changed
    ...    - 5. Request a feature is displayed
    ...    - 6. Enter description is successfully and send button is enabled
    ...    - 7. Attachment files are added successfully
    ...    - 8. Send feedback failed and display popup
    ...       - Title: Failed!
    ...       - Content: Sorry, it seems your request failed
    ...       - There shall be Try again button
    ...    - 9. The popup is closed
    [Tags]      BCA-BIOHEARTINT-SENDFB-13  BCCA-SRS-11-FRS-02-2       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SENDFB-14: Send feedback with attachment files is 20MB
        [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...     - The Bioheart device is pairing and connecting with app
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Send feedback button
    ...    - 4. Enter description
    ...    - 5. Add attachment files
    ...    - 6. Press on Send button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Send feedback screen is displayed
    ...    - 4. Enter description is successfully and send button is enabled
    ...    - 5. Attachment files are added successfully
    ...    - 6. There shall be a message: Maximum attachment size is 20mb under attachment file list
    [Tags]      BCA-BIOHEARTINT-SENDFB-14   BCCA-SRS-11-FRS-02-2       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCA-BIOHEARTINT-SENDFB-15: Request a feature with attachment files is 20MB
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The cardiac careplan is starting
    ...
    ...     Test Steps:
    ...    - 1. Open the app
    ...    - 2. Press on Bioheart tab
    ...    - 3. Press on Send feedback button
    ...    - 4. Select Request a feature option
    ...    - 5. Enter description
    ...    - 6. Add attachment files
    ...    - 7. Press on Send button
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2. Bioheart device information screen is displayed
    ...    - 3. Send feedback screen is displayed
    ...    - 4. Request a feature is displayed
    ...    - 5. Enter description is successfully and send button is enabled
    ...    - 6. Attachment files are added successfully
    ...    - 7. There shall be a message: Maximum attachment size is 20mb under attachment file list
    [Tags]      BCA-BIOHEARTINT-SENDFB-15  BCCA-SRS-11-FRS-02-2       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
