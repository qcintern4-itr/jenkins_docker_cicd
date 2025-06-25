*** Settings ***
Documentation   Bioheart Test Suite
Metadata    sid     BHDV
Metadata    owner   Linh Tran
Library     corelib/AssertionExtension.py

Force Tags      BHDV        device
Test Timeout    168h

*** Test Cases ***
BHDV-RESET-01: User can manual factory reset device
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  - Bioheart device is not pair with any Bioheart Application
    ...  - Bioheart device is off
    ...
    ...  Test Steps:
    ...  - 1. Press and hold power button 10 seconds
    ...
    ...  Expected Output:
    ...  - 1. User manual factory reset device successfully
    ...       On device: LED status is GREEN flash super fast > PINK flash > PINK flash super fast
    [Tags]      BHDV-RESET-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-RESET-02: User can reset device by remove from Bioheart application
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  - Bioheart device is paired with Bioheart Application
    ...
    ...  Test Steps:
    ...  - 1. On application: go to Device tab
    ...  - 2. On application: press `Remove Bioheart`
    ...  - 3. On application: press `Remove`
    ...
    ...  Expected Output:
    ...  - 1. On application: device screen is displayed with status: Connected
    ...  - 2. On application: A confirm popup with a message `Are you sure you wish to remove the device?` is displayed
    ...  - 3. Device is removed from application
    ...       Device is factory reset
    ...       On device: LED status is PINK flash super fast > GREEN flash super fast > PINK flash
    [Tags]      BHDV-RESET-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-PAIR-01: User can pair device through Bluetooth
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  - 	Bioheart device is not paired with any Bioheart application
    ...  -	The Bluetooth on the phone is enabled
    ...
    ...  Test Steps:
    ...  - 1. Check device ID on device box or use Device monitor application with command: “SM+ID?”
    ...  - 2. On application: on Summary tab, press Pair button
    ...  - 3. On application: Press Pair Bioheart Now button
    ...  - 4. On application: Choose corresponding device ID in step 1 then wait few seconds
    ...
    ...  Expected Output:
    ...  - 1. Device ID is displayed. (Ex: 1521100005)
    ...       On device: LED status is PINK flash
    ...  - 2. On application: Pair Device screen is displayed
    ...  - 3. On application: SCANNING FOR DEVICE screen with available device list is displayed
    ...  - 4. On application: Device is paired with Bioheart application
    ...       On device: LED status is GREEN pulse > BLUE flash (if LeadOff), is GREEN pulse (if LeadOn)
    [Tags]      BHDV-PAIR-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-PAIR-02: User cannot pair device when device has been paired with another Bioheart application
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  - 	Bioheart device is paired with any Bioheart application
    ...  -	The Bluetooth on the phone is enabled
    ...
    ...  Test Steps:
    ...  - 1. Check device ID on device box or use Device monitor application with command: “SM+ID?”
    ...  - 2. On application: On Summary tab, press Pair button
    ...  - 3. On application: Press Pair Bioheart Now button
    ...
    ...  Expected Output:
    ...  - 1. Device ID is displayed. (Ex: 1521100005)
    ...       On device: LED status is BLUE flash (if LeadOff), GREEN flash (if LeadOn)
    ...  - 2. On application: Pair Device screen is displayed
    ...  - 3. On application: SCANNING FOR DEVICE screen is displayed, corresponding device ID in step 1 is not displayed in available device list
    [Tags]      BHDV-PAIR-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-LED-01: Check LED color
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  Test Steps:
    ...  - 1. Device has been powered off
    ...       Press and hold power button 3 seconds
    ...  - 2. Device has been powered on
    ...       Press and hold power button 3 seconds
    ...  - 3. Power off device then remove SD card
    ...       Power on device
    ...  - 4. Device has been powered off
    ...       Press and hold power button 10 seconds
    ...  - 5. Device has been paired with Bioheart application
    ...       Remove device from mobile app
    ...       Wait about 3 seconds
    ...  - 6. Connect device to Bioheart application and ECG Simulator
    ...  - 7. Pause study by charge device
    ...  - 8. Connect device to Bioheart application and ECG Simulator
    ...       Disconnect device to ECG Simulator
    ...  - 9. Connect device to Bioheart application and ECG Simulator
    ...       Press Center key on device
    ...  - 10. Connect device to Monitor device application
    ...        Go to MSC mode
    ...  - 11. Power off device then connect to PC through USB and go to DFU mode
    ...
    ...  Expected Output:
    ...  - 1. Device is powered on
    ...       LED status: GREEN flash super-fast (2 seconds)
    ...  - 2. Device is powered off
    ...       LED status: GREEN flash super fast
    ...  - 3. Device is powered on
    ...       LED status: ORANGE solid
    ...  - 4. User manual factory reset device successfully
    ...       LED status: GREEN flash super fast > PINK flash > PINK flash super fast
    ...  - 5. Device is factory reset
    ...       LED status is PINK flash super fast> GREEN flash super fast> PINK flash
    ...  - 6. Connect successfully
    ...       Study is started/resumed
    ...       LED status: GREEN pulse
    ...  - 7. Device is charging > Study is paused
    ...       LED status: ORANGE pulse
    ...  - 8. Connect successfully
    ...       Study is started/resumed
    ...       LED status: BLUE Flash (high brightness 50%)
    ...  - 9. Connect successfully
    ...       Study is started/resumed
    ...       Snapshot is creating
    ...       LED status: GREEN flash
    ...  - 10. Device is in MSC mode
    ...        LED status: CYAN pulse
    ...  - 11. Device is in DFU mode
    ...        LED status: CYAN solid
    [Tags]      BHDV-LED-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-OTA-01: User can update OTA device on Bioheart application
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  - 	Bioheart device is not paired with any Bioheart application
    ...  -	The Bluetooth on the phone is enabled
    ...  -	The Internet on the phone is enabled
    ...
    ...  Test Steps:
    ...  - 1. Connect device to Bioheart application
    ...  - 2. On application: On the Device tab > Firmware update
    ...  - 3. On application: Press Check for update button
    ...  - 4. On application: Press Update now then wait until update OTA process is finished
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...  - 2. On application: Firmware update screen is displayed
    ...  - 3. On application: NEW UPDATE AVAILABLE screen is displayed
    ...  - 4. On application: A message inform update successfully is displayed
    ...       On device: Device is reboot
    [Tags]      BHDV-OTA-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-POWER-01: User can power on device
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	The device is powered off
    ...
    ...  Test Steps:
    ...  - 1. Device has been powered off
    ...       On device: Press and hold power button 3 seconds
    ...
    ...  Expected Output:
    ...  - 1. Device is powered on
    ...       On device: LED status is GREEN flash super fast
    [Tags]      BHDV-POWER-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-POWER-02: User can power off device
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	The device is powered on
    ...
    ...  Test Steps:
    ...  - 1. Device has been powered on
    ...       On device: Press and hold power button 3 seconds
    ...
    ...  Expected Output:
    ...  - 1. Device is powered off
    ...       On device: LED status is GREEN flash super fast
    [Tags]      BHDV-POWER-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-STREAMECG-01: User can view ECG on the Bioheart application
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  - 	Bioheart device is not paired with any Bioheart application
    ...  -	The Bluetooth on the phone is enabled
    ...  -	The user is on Heart Rhythm tab
    ...
    ...  Test Steps:
    ...  - 1. Connect device to Bioheart application and ECG simulator
    ...  - 2. On application: On the Heart Rhythm tab, choose TAP TO VIEW HEART RHYTHM
    ...  - 3. Adjust ECG signals on Simulator
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       On device: LED status is GREEN pulse
    ...  - 2. On application: ECG signals are displayed corresponding to ECG signals on Simulator
    ...  - 3. On application: ECG signals on application are changed corresponding to Simulator
    [Tags]      BHDV-STREAMECG-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-CHARGE-01: User can charge device
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Bioheart device and Bioheart charger
    ...
    ...  Test Steps:
    ...  - 1. Connect device with charger
    ...  - 2. Wait until charging full (~2 hours)
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       Device is charging
    ...       On device: LED status is ORANGE pulse
    ...  - 2. Device is full charging
    ...       On device: LED status is GREEN solid
    [Tags]      BHDV-CHARGE-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-CHARGE-02: The Bioheart application will display battery level and battery status when connecting device with application before fully charged
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	The device is on
    ...
    ...  Test Steps:
    ...  - 1. Connect device with charger
    ...  - 2. Connect device with Bioheart application then check on Device tab of application
    ...  - 3. Wait until charging full (~2 hours)
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       On device: Device is charging and LED status is ORANGE Pulse
    ...  - 2. Connect successfully
    ...       On device: Device is charging and LED status is ORANGE Pulse
    ...       On application:
    ...       Status: Charging – current % battery (ex: Charging – 20%)
    ...       Remaining charging time: Displays base on % battery
    ...  - 3. On device: Device is fully charging and LED status is GREEN Solid
    ...       On application:
    ...       Status: Full charged – 100%
    ...       Remaining charging time: 0
    [Tags]      BHDV-CHARGE-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-CHARGE-03: The Bioheart application will display battery level and battery status when connecting device with application after fully charged
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	The device is on
    ...
    ...  Test Steps:
    ...  - 1. Connect device with charger
    ...  - 2. Wait until charging full (~2 hours)
    ...  - 3. Connect device with Bioheart application
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       On device: Device is charging and LED status is ORANGE Pulse
    ...  - 2. On device: Device is fully charging and LED status is GREEN Solid
    ...  - 3. Connect successfully
    ...       On device: Device is fully charging and LED status is GREEN Solid
    ...       On application:
    ...       Status: Full charged – 100%
    ...       Remaining charging time: 0
    [Tags]      BHDV-CHARGE-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-CHARGE-04: Battery level and Battery status when device is OFF and user plugs the charge in
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	The device is off
    ...
    ...  Test Steps:
    ...  - 1. Connect device with charger
    ...  - 2. Power on device then connect device with Bioheart application
    ...  - 3. Wait until charging full (~2 hours)
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       Device still is OFF
    ...  - 2. Connect successfully
    ...       On device: Device is charing and LED status is ORANGE Pulse
    ...       On application:
    ...       Status: Charging – current % battery (ex: Charging – 20%)
    ...       Remaining charging time: Displays base on % battery
    ...  - 3. On device: Device is fully charging and LED status is GREEN Solid
    ...       On application:
    ...       Status: Full charged – 100%
    ...       Remaining charging time: 0
    [Tags]      BHDV-CHARGE-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-CHARGE-05: Battery level and Charging time remaining when device is ON then reboot and user plug the charge in
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	The device is powered on
    ...  -	Device is connected to Bioheart application
    ...
    ...  Test Steps:
    ...  - 1. Reboot device then plug the charger in
    ...
    ...  Expected Output:
    ...  - 1. On device: Device is charging and LED status is ORANGE Pulse
    ...       On application:
    ...       Status: Charging – current % battery (ex: Charging – 20%)
    ...       Remaining charging time: Displays base on % battery
    [Tags]      BHDV-CHARGE-05       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-SNAPSHOT-01: User can create snapshot by pressing Center key on Bioheart device (optional duration) when Bioheart device is connected to Bioheart application
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device in discovery mode, connect to Bioheart application and ECG simulator
    ...  -	Study is started
    ...
    ...  Test Steps:
    ...  - 1. On device: Press Center key
    ...  - 2. On application: Adjust snapshot time from 1 to 5 then press Create
    ...  - 3. Wait a time corresponding to the operation
    ...  - 4. On application: Check snapshot list
    ...
    ...  Expected Output:
    ...  - 1. On application: Create snapshot screen is displayed
    ...       On device: LED status is GREEN flash
    ...  - 2. On application: Snapshot is creating with corresponding duration and displayed in Pending Snapshots list
    ...  - 3. Snapshot duration expires
    ...       On device: LED status is GREEN pulse
    ...  - 4. On application: Snapshot is created with corresponding duration and moved to Recent Snapshots list
    [Tags]      BHDV-SNAPSHOT-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-SNAPSHOT-02: User can create snapshot by pressing Center key on Bioheart device (default duration) when Bioheart device is connected to Bioheart application
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device in discovery mode, connect to Bioheart application and ECG simulator
    ...  -	Study is started
    ...
    ...  Test Steps:
    ...  - 1. On device: Press Center key
    ...  - 2. Wait 20 seconds
    ...  - 3. Wait a minute
    ...  - 4. On application: Check snapshot list
    ...
    ...  Expected Output:
    ...  - 1. On application: Create snapshot screen is displayed
    ...       On device: LED status is GREEN flash
    ...  - 2. On application: Snapshot is creating with default duration (1 minute) and displayed in Pending Snapshots list
    ...  - 3. Snapshot duration expires
    ...       On device: LED status is GREEN pulse
    ...  - 4. On application: Snapshot is created with corresponding duration and moved to Recent Snapshots list
    [Tags]      BHDV-SNAPSHOT-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-SNAPSHOT-03: User can create snapshot by pressing Center key on Bioheart device (default duration) when Bioheart device is disconnected with Bioheart application
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device in discovery mode, connect to Bioheart application and ECG simulator
    ...  -	Study is started
    ...
    ...  Test Steps:
    ...  - 1. Disconnect device and application
    ...  - 2. On device: Press Center key
    ...  - 3. Wait 20 seconds
    ...  - 4. Wait a minute
    ...  - 5. Reconnect device and application
    ...  - 6. On application: Check snapshot list
    ...
    ...  Expected Output:
    ...  - 1. Disconnect successfully
    ...  - 2. On device: LED status is GREEN flash
    ...  - 3. Snapshot is creating
    ...  - 4. Snapshot duration expires
    ...       On device: LED status is GREEN pulse
    ...  - 5. Reconnect successfully
    ...  - 6. On application: Snapshot is created with default duration and displayed Recent Snapshots list
    [Tags]      BHDV-SNAPSHOT-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-SNAPSHOT-04: User can create snapshot by pressing Center key on Bioheart device (optional duration) when Bioheart device is connected with Bioheart application but the application is not opened
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device in discovery mode, connect to Bioheart application and ECG simulator
    ...  -	Study is started
    ...
    ...  Test Steps:
    ...  - 1. Close the application (the app still displays in multiple tabs)
    ...  - 2. On device: Press Center key
    ...  - 3. On phone: Press on the notification
    ...  - 4. On application: Adjust snapshot time from 1 to 5 then press Create
    ...  - 5. Wait a time corresponding to the operation
    ...  - 6. On application: Check snapshot list
    ...
    ...  Expected Output:
    ...  - 1. The user is navigated to home screen of the phone
    ...  - 2. On phone: There is a notification created by application
    ...       On device: LED status is GREEN flash
    ...  - 3. On application: Create snapshot screen is displayed
    ...  - 4. On application: Snapshot is creating with corresponding duration and displayed in Pending Snapshots list
    ...  - 5. Snapshot duration expires
    ...       On device: LED status is GREEN pulse
    ...  - 6. On application: Snapshot is created with default duration and moved to Recent Snapshots list
    [Tags]      BHDV-SNAPSHOT-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-SNAPSHOT-05: User can create snapshot by pressing Center key on Bioheart device (default duration) when Bioheart device is connected with Bioheart application but the application is not opened
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device in discovery mode, connect to Bioheart application and ECG simulator
    ...  -	Study is started
    ...
    ...  Test Steps:
    ...  - 1. Close the application (the app still displays in multiple tabs)
    ...  - 2. On device: Press Center key
    ...  - 3. On phone: Press on the notification
    ...  - 4. Wait 20 seconds
    ...  - 5. Wait a minute
    ...  - 6. On application: Check snapshot list
    ...
    ...  Expected Output:
    ...  - 1. The user is navigated to home screen of the phone
    ...  - 2. On phone: There is a notification created by application
    ...       On device: LED status is GREEN flash
    ...  - 3. On application: Create snapshot screen is displayed
    ...  - 4. On application: Snapshot is creating with default duration (1 minute) and displayed in Pending Snapshots list
    ...  - 5. Snapshot duration expires
    ...       On device: LED status is GREEN pulse
    ...  - 6. On application: Snapshot is created with default duration and moved to Recent Snapshots list
    [Tags]      BHDV-SNAPSHOT-05       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-SNAPSHOT-06: User can cancel creating snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device in discovery mode, connect to Bioheart application and ECG simulator
    ...  -	Study is started
    ...
    ...  Test Steps:
    ...  - 1. On device: Press Center key
    ...  - 2. On application: Press Cancel button
    ...
    ...  Expected Output
    ...  - 1. On application: Create snapshot screen is displayed
    ...       On device: LED status is GREEN flash
    ...  - 2. On application: Creating snapshot is canceled
    ...       On device: LED status is GREEN pulse
    [Tags]      BHDV-SNAPSHOT-06       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-SNAPSHOT-07: Create first snapshot on Bioheart device, second snapshot on Bioheart application
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Device connected with Bioheart application and ECG simulator
    ...  -	Study is started
    ...
    ...  Test Steps:
    ...  - 1. On device: Press Center key
    ...  - 2. On application: Adjust snapshot time from 1 to 5 then press Create
    ...  - 3. On application: Go to “Heart Rhythm” tab, press on “TAP TO VIEW HEART RHYTHM” then press on “Start Recording” button
    ...
    ...  Expected Output:
    ...  - 1. On application: Create snapshot screen is displayed
    ...       On device: LED status is GREEN flash
    ...  - 2. On application: Snapshot is creating with corresponding duration and displayed in Pending Snapshots list
    ...  - 3. On application: A warning pop-up with message “Could not start recording
    ...       Another recording is ongoing” is displayed
    [Tags]      BHDV-SNAPSHOT-07       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-SNAPSHOT-08: Create two snapshots on Bioheart device
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Device connected with Bioheart application and ECG simulator
    ...  -	Study is started
    ...
    ...  Test Steps:
    ...  - 1. On device: Press Center key
    ...  - 2. On application: Adjust snapshot time from 1 to 5 then press Create
    ...  - 3. On device: Press Center key again
    ...  - 4. Connect device with Device monitor then check the log
    ...
    ...  Expected Output:
    ...  - 1. On application: Create snapshot screen is displayed
    ...       On device: LED status is GREEN flash
    ...  - 2. On application: Snapshot is creating with corresponding duration and displayed in Pending Snapshots list
    ...  - 3. Nothing happens
    ...  - 4. A text inform that Event is rejected with corresponding time: "BG Reject EV: MAN"
    [Tags]      BHDV-SNAPSHOT-08       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-SNAPSHOT-09: Create first snapshot on Bioheart application, second snapshot on Bioheart device
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Device connected with Bioheart application and ECG simulator
    ...  -	Study is started
    ...
    ...  Test Steps:
    ...  - 1. On application: Go to “Heart Rhythm” tab, press on “TAP TO VIEW HEART RHYTHM” then press on “Start Recording” button
    ...  - 2. On application: Adjust snapshot time from 1 to 5 then press Create
    ...  - 3. On device: Press Center key again
    ...  - 4. Connect device with Device monitor then check the log
    ...
    ...  Expected Output:
    ...  - 1. On application: Create snapshot screen is displayed
    ...       On device: LED status is GREEN flash
    ...  - 2. On application: Snapshot is creating with corresponding duration and displayed in Pending Snapshots list
    ...  - 3. Nothing happens
    ...  - 4. A text inform that Event is rejected with corresponding time: "BG Reject EV: MAN"
    [Tags]      BHDV-SNAPSHOT-09       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-PAUSE-CHARGE-01: The study is paused when the Bioheart device is charged continuously for at least 5 seconds
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is on, no charging
    ...
    ...  Test Steps:
    ...  - 1. Connect device to application
    ...  - 2. Connect device to charger
    ...  - 3. Wait at least 5 seconds
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       On device: LED status is GREEN pulse
    ...       Study is started
    ...  - 2. Connect successfully
    ...       On device: LED status is ORANGE flash
    ...       Log is displayed with format:
     ...                                  UI Display LED: CHARGING
    ...  - 3. The study is paused
    ...       Log is displayed with format:
     ...                                  UI Display LED: STUDY_PAUSED
    [Tags]      BHDV-PAUSE-CHARGE-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-PAUSE-CHARGE-02: The study is still ongoing when the Bioheart device is charged continuously for less than 5 seconds
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is on, no charging
    ...
    ...  Test Steps:
    ...  - 1. Connect device to application
    ...  - 2. Connect device to charger
    ...  - 3. Wait for less than 5 seconds and disconnect to charger
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       On device: LED status is GREEN pulse
    ...  - 2. Connect successfully
    ...       On device: LED status is ORANGE flash
    ...       Log is displayed with format:
     ...                                  UI Display LED: CHARGING
    ...  - 3. Disconnect successfully
    ...       The study is ongoing
    ...       On device: LED status is GREEN pulse
    ...       Log is displayed with format:
    ...                                  UI	Display LED: STUDY_ONGOING
    [Tags]      BHDV-PAUSE-CHARGE-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-PAUSE-CHARGE-03: The study is not resumed when the Bioheart device is connected to charger less than 15 seconds
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is on, no charging
    ...  -	Connected to charger at least 5 seconds before
    ...
    ...  Test Steps:
    ...  - 1. Connect device to application
    ...  - 2. Connect device to charger
    ...  - 3. Wait at least 5 seconds
    ...  - 4. Disconnect device to charger and wait at least 5 seconds but less than 10 seconds
    ...  - 5. Connect to charger again
    ...       All channels are ON
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       On device: LED status is GREEN pulse
    ...       Study is started
    ...  - 2. Connect successfully
    ...       On device: LED status is ORANGE flash
    ...       Log is displayed with format:
     ...                                  UI Display LED: CHARGING
    ...  - 3. The study is paused
    ...       Log is displayed with format:
     ...                                  UI Display LED: STUDY_PAUSED
    ...  - 4. Disconnect successfully
    ...  - 5. Connect successfully
    ...       Study is not resumed
    ...       Log is displayed with format:
    ...                                   UI Display LED: CHARGING
    ...                                   UI Display LED: STUDY_PAUSED
    [Tags]      BHDV-PAUSE-CHARGE-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-PAUSE-CHARGE-04: The study is not resumed when the Bioheart device is disconnected to charger for at least 15 seconds but LEADOFF (any channels)
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is on, no charging
    ...  -	Connected to charger at least 5 seconds before
    ...
    ...  Test Steps:
    ...  - 1. Connect device to application
    ...  - 2. Connect device to charger
    ...  - 3. Wait at least 5 seconds
    ...  - 4. Disconnect device to charger and wait at least 15 seconds
    ...  - 5. Any channel is OFF
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       On device: LED status is GREEN pulse
    ...       Study is started
    ...  - 2. Connect successfully
    ...       On device: LED status is ORANGE flash
    ...       Log is displayed with format:
    ...                                   UI Display LED: CHARGING
    ...  - 3. The study is paused
    ...       Log is displayed with format:
    ...                                   UI Display LED: STUDY_PAUSED
    ...  - 4. Disconnect successfully
    ...  - 5. Study is not resumed
    [Tags]      BHDV-PAUSE-CHARGE-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-PAUSE-LEADOFF-05: The study is paused when LEADOFF - The HES channel is LEADOFF continuously for at least 5 minutes
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is on
    ...
    ...  Test Steps:
    ...  - 1. Connect device to application and ECG Simulator
    ...  - 2. Disconnect the HES channel
    ...  - 3. Wait at least 5 minutes
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       On device: LED status is GREEN pulse
    ...       Study is started
    ...  - 2. Disconnect successfully
    ...       On device: LED status is BLUE flash
    ...  - 3. The study is paused
    ...       Log is displayed with format:
    ...                                   BG Pause study (LOFF) UI Display LED: STUDY_PAUSED
    [Tags]      BHDV-PAUSE-LEADOFF-05       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-PAUSE-LEADOFF-06: The HES channel is LEADOFF for 5 minutes but there are less than 5 seconds of LEADON
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is on
    ...
    ...  Test Steps:
    ...  - 1. Connect device to application and ECG Simulator
    ...  - 2. Disconnect the HES channel around 2 minutes
    ...  - 3. Connect the HES channel less than 5 seconds
    ...  - 4. Disconnect and wait enough 5 minutes (from step 2)
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       On device: LED status is GREEN pulse
    ...       Study is started
    ...  - 2. Disconnect successfully
    ...       On device: LED status is BLUE flash
    ...       Remove time (Ex: 2022/03/10 10:01:17)
    ...  - 3. Connect successfuly
    ...       On device: LED status is BLUE flash
    ...  - 4. Disconnect successfully
    ...       The study is paused at the 5th minute (from step 2)
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss REC	Schedule stop: at yyyy/mm/dd hh:mm:ss
    ...                                   yymmdd:hhmmss BG	Pause study (LOFF)
    ...                                   yymmdd:hhmmss UI	Display LED: STUDY_PAUSED
    ...                                   yymmdd:hhmmss ECGA	Meet scheduled stop
    ...                                   yymmdd:hhmmss PR	Stopped
    [Tags]      BHDV-PAUSE-LEADOFF-06       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-PAUSE-LEADOFF-07: The HES channel is LEADOFF for 5 minutes but there are at least 5 seconds LEADON
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is on
    ...
    ...  Test Steps:
    ...  - 1. Connect device to application and ECG Simulator
    ...  - 2. Disconnect the HES channel around 2 minutes
    ...  - 3. Connect the HES channel at least 5 seconds
    ...  - 4. Disconnect and wait enough 5 minutes
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       On device: LED status is GREEN pulse
    ...       Study is started
    ...  - 2. Disconnect successfully
    ...       On device: LED status is BLUE flash
    ...       Remove time (Ex: 2022/03/10 10:01:17)
    ...  - 3. Connect successfully
    ...       On device: LED status is GREEN pulse
    ...       Connection duration (Ex: 10s)
    ...  - 4. Disonnect successfully
    ...       The study is paused at the 5th minute (from step 4)
    ...       The time from step 2 is rejected
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss REC	Schedule stop: at yyyy/mm/dd hh:mm:ss
    ...                                   yymmdd:hhmmss BG	Pause study (LOFF)
    ...                                   yymmdd:hhmmss UI	Display LED: STUDY_PAUSED
    ...                                   yymmdd:hhmmss ECGA	Meet scheduled stop
    ...                                   yymmdd:hhmmss PR	Stopped
    [Tags]      BHDV-PAUSE-LEADOFF-07       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-PAUSE-LEADOFF-08: The HES channel is LEADOFF for 5 minutes but there are less than 5 seconds LEADON at the end of 5 mins LEADOFF
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is on
    ...
    ...  Test Steps:
    ...  - 1. Connect device to application and ECG Simulator
    ...  - 2. Disconnect the HES channel less than 5 minutes (Ex: remove 4 minutes 58 seconds)
    ...  - 3. At the 4th minute and 59 seconds, connect the HES channel for 4 seconds (less than 5 seconds)
    ...  - 4. Disconnect and wait
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       On device: LED status is GREEN pulse
    ...       Study is started
    ...  - 2. Disconnect successfully
    ...       On device: LED status is BLUE flash
    ...       Remove time (Ex: 2022/03/11 02:21:02)
    ...  - 3. Connect successfully
    ...       On device: LED status is BLUE flash
    ...  - 4. Disconnect successfully
    ...       The study is paused from LEADOFF enough 5 minutes, don’t reject 4 seconds LEADON from step 3
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	BG	Pause study (LOFF)
    ...                                   yymmdd:hhmmss	UI	Display LED: STUDY_PAUSED
    ...                                   yymmdd:hhmmss	ECGA	Meet scheduled stop
    ...                                   yymmdd:hhmmss	PR	Stopped
    ...                                   yymmdd:hhmmss	SR	REC=0 (beat) at yyyy/mm/dd hh:mm:ss
    ...                                   yymmdd:hhmmss	HES_CTRL	Request Stop
    ...                                   yymmdd:hhmmss	REC	REC=0 (ecg) at yyyy/mm/dd hh:mm:ss
    ...                                   yymmdd:hhmmss	HES_CTRL	Stopping
    ...                                   yymmdd:hhmmss	HES_CTRL	Stopped
    [Tags]      BHDV-PAUSE-LEADOFF-08       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-PAUSE-LEADOFF-09: The HES channel is LEADOFF for 5 minutes but there are at least 5 seconds LEADON at the end of 5 mins LEADOFF
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is on
    ...
    ...  Test Steps:
    ...  - 1. Connect device to application and ECG Simulator
    ...  - 2. Disconnect the HES channel less than 5 minutes (Ex: remove 4 minutes 58 seconds)
    ...  - 3. At the 4th minute and 59 seconds, connect the HES channel for 5 seconds (at least 5 seconds)
    ...  - 4. Disconnect and wait
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       On device: LED status is GREEN pulse
    ...       Study is started
    ...  - 2. Disconnect successfully
    ...       On device: LED status is BLUE flash
    ...       Remove time (Ex: 2022/03/11 03:10:02)
    ...  - 3. Connect successfully
    ...       On device: LED status is GREEN pulse
    ...       Connection duration (Ex: 10s)
    ...  - 4. Disconnect successfully
    ...       The study is paused since removing the HES channel (from step 4)
    ...       The time from step 2 is rejected
    ...       Remove time (Ex: 2022/03/11 03:15:10)
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	REC	Schedule stop: at yyyy/mm/dd hh:mm:ss
    ...                                   yymmdd:hhmmss	BG	Pause study (LOFF)
    ...                                   yymmdd:hhmmss	UI	Display LED: STUDY_PAUSED
    ...                                   yymmdd:hhmmss	PR	Stopped
    [Tags]      BHDV-PAUSE-LEADOFF-09       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-PAUSE-LEADOFF-10: The study is not paused when the HES channel is LEADOFF less than 5 minutes
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is on
    ...
    ...  Test Steps:
    ...  - 1. Connect device to application and ECG Simulator
    ...  - 2. Disconnect the HES channel
    ...  - 3. Wait less than 5 minutes and connect HES channel
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       On device: LED status is GREEN pulse
    ...       Study is started
    ...  - 2. Disconnet successfully
    ...       On device: LED status is BLUE flash
    ...  - 3. Connect successfully
    ...       Study is ongoing
    ...       On device: LED status is GREEN pulse
    ...       Log is displayed with format:
    ...                                   UI Display LED: STUDY_ONGOING
    [Tags]      BHDV-PAUSE-LEADOFF-10       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-PAUSE-LEADOFF-11: The study is not resumed when the Bioheart device has a channel LEADOFF
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is on
    ...
    ...  Test Steps:
    ...  - 1. Connect device to application and ECG Simulator
    ...  - 2. Disconnect the HES channel
    ...  - 3. Wait at least 5 minutes
    ...  - 4. Connect the HES channel but remove 1 or 2 remaining channels
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       On device: LED status is GREEN pulse
    ...       Study is started
    ...  - 2. Disconnect successfully
    ...       On device: LED status is BLUE flash
    ...       Remove time (Ex: 2022/03/11 04:17:01)
    ...  - 3. Study is paused
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	REC	Schedule stop: at yyyy/mm/dd hh:mm:ss
    ...                                   yymmdd:hhmmss	BG	Pause study (LOFF)
    ...                                   yymmdd:hhmmss	UI	Display LED: STUDY_PAUSED
    ...                                   yymmdd:hhmmss	ECGA	Meet scheduled stop
    ...                                   yymmdd:hhmmss	PR	Stopped
    ...  4. Connect HES channel successfully
    ...       Disconnect other channel successfully
    ...       Study is still paused
    ...       On device: LED status is BLUE flash
    [Tags]      BHDV-PAUSE-LEADOFF-11       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-PAUSE-LEADOFF-12: The study is not resumed when the Bioheart is connected to charger
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is on
    ...
    ...  Test Steps:
    ...  - 1. Connect device to application and ECG Simulator
    ...  - 2. Disconnect the HES channel
    ...  - 3. Wait at least 5 minutes
    ...  - 4. Connect 3 channels continuously for 10 seconds, but connect device to charger
    ...
    ...  Expected Output:
    ...  - 1. Connect succcessfully
    ...       On device: LED status is GREEN pulse
    ...       Study is started
    ...  - 2. Disconnect successfully
    ...       On device: LED status is BLUE flash
    ...       Remove time (Ex: 2022/03/11 04:17:01)
    ...  - 3. Study is paused
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	REC	Schedule stop: at yyyy/mm/dd hh:mm:ss
    ...                                   yymmdd:hhmmss	BG	Pause study (LOFF)
    ...                                   yymmdd:hhmmss	PR	Stopped
    ...  4. Study is still paused
    ...       LED status is ORANGE pulse
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	UI	Display LED: STUDY_PAUSED
    [Tags]      BHDV-PAUSE-LEADOFF-12       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-BATTERY-01: The Bioheart device will display Orange Flash LED when the battery level decreases to 4%
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware with latest version
    ...  -	The device is on and not pair with Bioheart application
    ...
    ...  Test Steps:
    ...  - 1. Check device and application
    ...  - 2. Wait for the battery level decrease to 4%
    ...  - 3. Check device log
    ...
    ...  Expected Output:
    ...  - 1. On application: Device is not paired
    ...       On device: LED status is PINK flash
    ...  - 2. On device: LED status is ORANGE flash
    ...       Bluetooth is off, user cannot scan device
    ...  - 3. Log is displayed with format:
    ...                                   SBATT HW: Battery: level=4%, charge=no, volt=3992, stat1=0, stat2=0
    ...                                   UI Display LED: BATT_CRITICAL
    ...                                   MBT Turn off
    [Tags]      BHDV-BATTERY-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-BATTERY-02: The Bioheart device will turn off when battery level decreases to 3% and down
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware with latest version
    ...  -	The device is on and not pair with Bioheart application
    ...
    ...  Test Steps:
    ...  - 1. Check device and application
    ...  - 2. Wait for the battery level decrease to 3%
    ...  - 3. Check device log
    ...
    ...  Expected Output:
    ...  - 1. On application: Device is not paired
    ...       On device: LED status is PINK flash
    ...  - 2. Device is auto turned off
    ...  - 3. Log is displayed with format:
    ...                                   SBATT HW: Battery: level=3%, charge=no, volt=3995, stat1=0, stat2=0
    ...                                   UI Display LED: POWER_OFF
    [Tags]      BHDV-BATTERY-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-AUTO-RESUME-01: The study is auto resumed when disconnecting to charger
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is on
    ...
    ...  Test Steps:
    ...  - 1. Check device and application
    ...  - 2. Connect device to charger at least 5 seconds
    ...  - 3. Disconnected to charger
    ...       Check:
    ...            + Battery level: normal (10-100%)
    ...            + LEADON: 3 channels
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       On device: LED status is GREEN pulse
    ...       Study is started
    ...  - 2. Connect successfully
    ...       On device: LED status is ORANGE pulse
    ...       Study is paused
    ...  - 3. Disconnect successfully
    ...       Study is auto resumed
    ...       On device: LED status is BLUE flash > GREEN pulse
    [Tags]      BHDV-AUTO-RESUME-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-AUTO-RESUME-02: The study is auto resumed when the Bioheart device is LEADON with 3 channels continuously for 10 seconds
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is on
    ...
    ...  Test Steps:
    ...  - 1. Check device and application
    ...  - 2. Disconnect the HES channel (LA or LL)
    ...  - 3. Wait at least 5 minutes
    ...  - 4. Connect 3 channels continuously for 10 seconds
    ...       Check:
    ...            + Disconnect device to charger
    ...            + Battery level: normal (10-100%)
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       On device: LED status is GREEN pulse
    ...       Study is started
    ...  - 2. Disconnect successfully
    ...       On device: LED status is BLUE flash
    ...  - 3. Study is paused
    ...  - 4. Connect successfully
    ...       Study is auto resumed
    ...       On device: LED status is GREEN pulse
    [Tags]      BHDV-AUTO-RESUME-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-AUTO-RESUME-03: The study is auto resumed when recording with asystole signal immediately
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is off
    ...  -  LEADON with 3 channels
    ...
    ...  Test Steps:
    ...  - 1. Turn on device and connect with ECG simulator
    ...  - 2. Wait for study to start and adjust ECG signal to asystole immediately
    ...  - 3. Change ECG signal to normal
    ...       Check:
    ...            + Disconnect device to charge
    ...            + Battery level: normal (10-100%)
    ...            + LEADON: 3 channels
    ...
    ...  Expected Output:
    ...  - 1. LED status is GREEN flash super fast > BLUE flash
    ...       Connect successfully
    ...  - 2. On device: LED status is GREEN pulse
    ...       Study is paused
    ...  - 3. Study is auto resumed
    ...       On device: LED status is GREEN pulse
    [Tags]      BHDV-AUTO-RESUME-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-AUTO-RESUME-04: The study is not auto resumed when connecting to charger
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is on
    ...
    ...  Test Steps:
    ...  - 1. Connect device to application
    ...  - 2. Device is connected to charger for at least 5 seconds
    ...  - 3. Check:
    ...            + Battery level: normal (10-100%)
    ...            + LEADON: 3 channels
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       On device: LED status is GREEN pulse
    ...       Study is started
    ...  - 2. Connect successfully
    ...       On device: LED status is ORANGE pulse
    ...       Study is paused
    ...  - 3. Study is not auto resumed
    ...       On device: LED status is ORANGE pulse
    [Tags]      BHDV-AUTO-RESUME-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-AUTO-RESUME-05: The study is not auto resumed when the Bioheart device is LEADOFF with 3 channels continuously
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is on
    ...
    ...  Test Steps:
    ...  - 1. Connect device to application
    ...  - 2. Disconnect 3 channels
    ...  - 3. Wait at least 5 minutes
    ...  - 4. Check:
    ...            + Device is disconnected to charger
    ...            + Battery level: normal (10-100%)
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       On device: LED status is GREEN pulse
    ...       Study is started
    ...  - 2. Disconnect successfully
    ...       On device: LED status is BLUE flash
    ...  - 3. Study is paused
    ...  - 4. Study is not auto resumed
    ...       On device: LED status is BLUE flash
    [Tags]      BHDV-AUTO-RESUME-05       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-AUTO-RESUME-06: The study is not auto resumed when the Bioheart device is LEADOFF at least 1 channel continuously
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is on
    ...
    ...  Test Steps:
    ...  - 1. Connect device to application
    ...  - 2. Disconnect the HES channel (LA or LL)
    ...  - 3. Wait at least 5 minutes
    ...  - 4. Check:
    ...            + Device is disconnected to charger
    ...            + Battery level: normal (10-100%)
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       On device: LED status is GREEN pulse
    ...       Study is started
    ...  - 2. Disconnect successfully
    ...       On device: LED status is BLUE flash
    ...  - 3. Study is paused
    ...  - 4. Study is not auto resumed
    ...       On device: LED status is BLUE flash
    [Tags]      BHDV-AUTO-RESUME-06       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-AUTO-RESUME-07: The study is not auto resumed when the battery level is less than 10%
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is on
    ...
    ...  Test Steps:
    ...  - 1. Connect device to application and ECG simulator
    ...  - 2. Wait for the battery level decreases less than 10%
    ...       Check:
    ...            + Disconnected to charger
    ...            + LEADON all 3 channels
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       On device: LED status is GREEN pulse
    ...       Study is started
    ...  - 2. Study is not auto resumed
    ...       On device: LED status is ORANGE flash
    [Tags]      BHDV-AUTO-RESUME-07       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-OTA1900-01: User has to use FIRMWARE 1.9.0.0_CLEAR when downgrading device from FIRMWARE 1.9.0.0 and updating to FIRMWARE 1.9.0.0 again
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is on and connected with Bioheart application
    ...
    ...  Test Steps:
    ...  - 1. Load FIRMWARE 1.9.0.0_CLEAR for device
    ...  - 2. Load FIRMWARE 1.8.1.0 or older for device
    ...  - 3. Connect device with Device monitor then set ID for device with command:
    ...                                                                             SM+ID="5m1000Pr1vat3Key_M3Ga17em0",1521100004(“1521100004” is ID of device)
    ...  - 4. Connect to Bioheart application Update to 1.9.0.0 use Bioheart application
    ...  - 5. Repeat step 1 from step 4 with all older FIRMWARE version (1.0.0, 1.0.1.0, 1.1.0.0, 1.1.0.1,  1.2.0.0, 1.3.0.0, 1.3.0.1, 1.4.0.0, 1.5.0.0, 1.6.0.0, 1.7.0.0, 1.7.1.0, 1.8.0.0, 1.8.1.0)
    ...
    ...  Expected Output:
    ...  - 1. Loading successfully
    ...       Device is reset
    ...  - 2. Loading successfully
    ...  - 3. Set successfully
    ...  - 4. Connect and update successfully
    ...  - 5. Successfully
    [Tags]      BHDV-OTA1900-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-OTA1900-02: Device will reset and disconnect from Bioheart application if downgrade to older FIRMWARE and upgrade to FIRMWARE 1.9.0.0 again
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is on and connected with Bioheart application
    ...
    ...  Test Steps:
    ...  - 1. Load FIRMWARE 1.8.0.1 or older for device
    ...  - 2. Check on Bioheart application
    ...
    ...  Expected Output:
    ...  - 1. Loading successfully
    ...  - 2. On device: LED status is PINK flash
    ...       Device is disconnected from Bioheart application
    [Tags]      BHDV-OTA1900-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-OTA1900-03: User has to upgrade to FIRMWARE 1.9.0.0 first when upgrade from FIRMWARE older 1.9.0.0 to FIRMWARE newer than 1.9.0.0 (ex: upgrade from 1.7.0.0 to
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is on and connected with Bioheart application
    ...
    ...  Test Steps:
    ...  - 1. From FIRMWARE 1.7.0.0, upgrade device use Bioheart application
    ...  - 2. Upgrade device again use Bioheart application
    ...
    ...  Expected Output:
    ...  - 1. Upgrade successfully to FIRMWARE 1.9.0.0
    ...  - 2. Upgrade successfully to FIRMWARE 1.10.0.0
    [Tags]      BHDV-OTA1900-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-ECGANALYSIS-01: ECG analysis calibration is failed by no detecting beat in the 1st minute
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is off
    ...
    ...  Test Steps:
    ...  - 1. Turn on device
    ...  - 2. Connect device with Simulator and adjust ECG signal to asystole
    ...  - 3. Wait for starting study and ECG analysis
    ...  - 4. From step 3, wait more 1 minute
    ...
    ...  Expected Output:
    ...  - 1. Device is on
    ...  - 2. Connect successfully
    ...  - 3. On device: LED status is GREEN pulse
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Start record
    ...                                   yymmdd:hhmmss	HES_CTRL	Request Start
    ...                                   yymmdd:hhmmss	HES_CTRL	Started
    ...  4. Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Calibration timeout (0 beats)
    ...                                   yymmdd:hhmmss	HES_CTRL	Request Stop
    ...                                   yymmdd:hhmmss	HES_CTRL	Stopping
    ...                                   yymmdd:hhmmss	HES_CTRL	Stopped
    ...                                   yymmdd:hhmmss	HES_CTRL	Request Start
    ...                                   yymmdd:hhmmss	HES_CTRL	Started
    [Tags]      BHDV-ECGANALYSIS-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-ECGANALYSIS-02: ECG analysis calibration is failed by no detecting enough 19 beats from the 1st beat
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is off
    ...
    ...  Test Steps:
    ...  - 1. Turn on device
    ...  - 2. Connect device with Simulator and adjust ECG signal to 80 bpm
    ...  - 3. Wait for starting study and ECG analysis
    ...  - 4. From step 3 about 30s, adjust ECG signal to asystole and wait 1m30s
    ...
    ...  Expected Output:
    ...  - 1. Device is on
    ...  - 2. Connect successfully
    ...  - 3. On device: LED status is GREEN pulse
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Start record
    ...                                   yymmdd:hhmmss	HES_CTRL	Request Start
    ...                                   yymmdd:hhmmss	HES_CTRL	Started
    ...  4. Log is displayed with format:
    ...                                   Calibration timeout (n beats) (with 1<= n <20)
    ...                                   yymmdd:hhmmss	ECGA	Calibration timeout (8 beats)
    ...                                   yymmdd:hhmmss	HES_CTRL	Request Stop
    ...                                   yymmdd:hhmmss	HES_CTRL	Stopping
    ...                                   yymmdd:hhmmss	HES_CTRL	Stopped
    ...                                   yymmdd:hhmmss	HES_CTRL	Request Start
    ...                                   yymmdd:hhmmss	HES_CTRL	Started
    [Tags]      BHDV-ECGANALYSIS-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-ECGANALYSIS-03: ECG analysis calibration is OK by detecting the 1st beat and enough 19 beats from the 1st beat in specified time
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is off
    ...
    ...  Test Steps:
    ...  - 1. Turn on device
    ...  - 2. Connect device with Simulator and adjust ECG signal to 80 bpm
    ...  - 3. Wait for starting study and ECG analysis
    ...  - 4. Wait a minute
    ...  - 5. Wait more 5 minutes
    ...
    ...  Expected Output:
    ...  - 1. Device is on
    ...  - 2. Connect successfully
    ...  - 3. LED status is GREEN pulse
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Start record
    ...                                   yymmdd:hhmmss	HES_CTRL	Request Start
    ...                                   yymmdd:hhmmss	HES_CTRL	Started
    ...  4. Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Calibration OK
    ...  5. On application, HR is displayed in Hourly tab
    [Tags]      BHDV-ECGANALYSIS-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-ECGANALYSIS-04: ECG analysis calibration is OK after failed
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is off
    ...
    ...  Test Steps:
    ...  - 1. Turn on device
    ...  - 2. Connect device with Simulator and adjust ECG signal to asystole
    ...  - 3. Wait for starting study and ECG analysis
    ...  - 4. From step 3, wait 1 minute and adjust ECG signal to 80bpm
    ...  - 5. Wait a minute
    ...  - 6. Wait more 5 minutes
    ...
    ...  Expected Output:
    ...  - 1. Device is on
    ...  - 2. Connect successfully
    ...  - 3. LED status is GREEN pulse
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Start record
    ...                                   yymmdd:hhmmss	HES_CTRL	Request Start
    ...                                   yymmdd:hhmmss	HES_CTRL	Started
    ...  4. Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Calibration timeout (0 beats)
    ...                                   yymmdd:hhmmss	HES_CTRL	Request Stop
    ...                                   yymmdd:hhmmss	HES_CTRL	Stopping
    ...                                   yymmdd:hhmmss	HES_CTRL	Stopped
    ...                                   yymmdd:hhmmss	HES_CTRL	Request Start
    ...                                   yymmdd:hhmmss	HES_CTRL	Started
    ...  5. Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Calibration OK
    ...  6. On application, HR is displayed in Hourly tab
    [Tags]      BHDV-ECGANALYSIS-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-ECGANALYSIS-05: ECG analysis calibration is OK after failed about 1 hour
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is off
    ...
    ...  Test Steps:
    ...  - 1. Turn on device
    ...  - 2. Connect device with Simulator and adjust ECG signal to asystole
    ...  - 3. Wait for starting study and ECG analysis
    ...  - 4. From step 3, wait 1 hour and adjust ECG signal to 80bpm
    ...  - 5. Wait a minute
    ...  - 6. Wait more 5 minutes
    ...
    ...  Expected Output:
    ...  - 1. Device is on
    ...  - 2. Connect successfully
    ...  - 3. LED status is GREEN pulse
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Start record
    ...                                   yymmdd:hhmmss	HES_CTRL	Request Start
    ...                                   yymmdd:hhmmss	HES_CTRL	Started
    ...  4. Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Calibration timeout (0 beats)
    ...                                   yymmdd:hhmmss	HES_CTRL	Request Stop
    ...                                   yymmdd:hhmmss	HES_CTRL	Stopping
    ...                                   yymmdd:hhmmss	HES_CTRL	Stopped
    ...                                   yymmdd:hhmmss	HES_CTRL	Request Start
    ...                                   yymmdd:hhmmss	HES_CTRL	Started
    ...  5. Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Calibration OK
    ...  6. On application, HR is displayed in Hourly tab
    [Tags]      BHDV-ECGANALYSIS-05       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-STOP-REC-01: The record is stopped by signal of ECG analysis channel is LEADOFF
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is off
    ...
    ...  Test Steps:
    ...  - 1. Turn on device
    ...  - 2. Connect device with Simulator and adjust ECG signal to asystole
    ...  - 3. Wait for starting study and ECG analysis
    ...  - 4. From step 3, wait 1 minute and remove HES channel
    ...
    ...  Expected Output:
    ...  - 1. Device is on
    ...  - 2. Connect successfully
    ...  - 3. On device: LED status is GREEN pulse
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Start record
    ...                                   yymmdd:hhmmss	HES_CTRL	Request Start
    ...                                   yymmdd:hhmmss	HES_CTRL	Started
    ...  - 4. Disconnect successfully
    ...       On device: LED status is BLUE flash
    ...       The record is stopped
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Meet scheduled stop
    ...                                   yymmdd:hhmmss HES_CTRL Request Stop
    ...                                   yymmdd:hhmmss HES_CTRL Stopping
    ...                                   yymmdd:hhmmss HES_CTRL Stopped
    [Tags]      BHDV-STOP-REC-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-STOP-REC-02: The record is stopped by charging device
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is off
    ...
    ...  Test Steps:
    ...  - 1. Turn on device
    ...  - 2. Connect device with Simulator and adjust ECG signal to asystole
    ...  - 3. Wait for starting study and ECG analysis
    ...  - 4. From step 3, wait 1 minute and connect device to charger
    ...
    ...  Expected Output:
    ...  - 1. Device is on
    ...  - 2. Connect successfully
    ...  - 3. On device: LED status is GREEN pulse
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Start record
    ...                                   yymmdd:hhmmss	HES_CTRL	Request Start
    ...                                   yymmdd:hhmmss	HES_CTRL	Started
    ...  - 4. Connect successfully
    ...       On device: LED status is ORANGE pulse
    ...       The record is stopped
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Meet scheduled stop
    ...                                   yymmdd:hhmmss HES_CTRL Request Stop
    ...                                   yymmdd:hhmmss HES_CTRL Stopping
    ...                                   yymmdd:hhmmss HES_CTRL Stopped
    [Tags]      BHDV-STOP-REC-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-STOP-REC-03: The record is stopped by entering device to MSC mode
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is off
    ...
    ...  Test Steps:
    ...  - 1. Turn on device
    ...  - 2. Connect device with Simulator and adjust ECG signal to asystole
    ...  - 3. Wait for starting study and ECG analysis
    ...  - 4. From step 3, wait 1 minute and connect device to Monitor device application > Go to MSC mode
    ...
    ...  Expected Output:
    ...  - 1. Device is on
    ...  - 2. Connect successfully
    ...  - 3. On device: LED status is GREEN pulse
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Start record
    ...                                   yymmdd:hhmmss	HES_CTRL	Request Start
    ...                                   yymmdd:hhmmss	HES_CTRL	Started
    ...  - 4. Device is in MSC mode
    ...       On deviceL: LED status is CYAN flash
    ...       The record is stopped
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Meet scheduled stop
    ...                                   yymmdd:hhmmss HES_CTRL Request Stop
    ...                                   yymmdd:hhmmss HES_CTRL Stopping
    ...                                   yymmdd:hhmmss HES_CTRL Stopped
    [Tags]      BHDV-STOP-REC-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-STOP-REC-04: The record is stopped by turning off device
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is off
    ...
    ...  Test Steps:
    ...  - 1. Turn on device
    ...  - 2. Connect device with Simulator and adjust ECG signal to asystole
    ...  - 3. Wait for starting study and ECG analysis
    ...  - 4. From step 3, wait 1 minute and turn off device
    ...
    ...  Expected Output:
    ...  - 1. Device is on
    ...  - 2. Connect successfully
    ...  - 3. On device: LED status is GREEN pulse
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Start record
    ...                                   yymmdd:hhmmss	HES_CTRL	Request Start
    ...                                   yymmdd:hhmmss	HES_CTRL	Started
    ...  - 4. On device: LED status GREEN flash super fast > Device is powered off
    ...       The record is stopped
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Meet scheduled stop
    ...                                   yymmdd:hhmmss HES_CTRL Request Stop
    ...                                   yymmdd:hhmmss HES_CTRL Stopping
    ...                                   yymmdd:hhmmss HES_CTRL Stopped
    [Tags]      BHDV-STOP-REC-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-STOP-REC-05: The record is stopped by signal of ECG analysis channel is LEADOFF
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is off
    ...
    ...  Test Steps:
    ...  - 1. Turn on device
    ...  - 2. Connect device with Simulator and adjust ECG signal to 80 bpm
    ...  - 3. Wait for starting study and ECG analysis
    ...  - 4. Wait 1 miute
    ...  - 5. From step 4, wait more 1 minute and remove HES channel
    ...
    ...  Expected Output:
    ...  - 1. Device is on
    ...  - 2. Connect successfully
    ...  - 3. On device: LED status is GREEN pulse
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Start record
    ...                                   yymmdd:hhmmss	HES_CTRL	Request Start
    ...                                   yymmdd:hhmmss	HES_CTRL	Started
    ...  - 4. Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Calibration OK
    ...  - 5. Disconnect successfully
    ...       On device: LED status is BLUE flash
    ...       The record is stopped
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Meet scheduled stop
    ...                                   yymmdd:hhmmss HES_CTRL Request Stop
    ...                                   yymmdd:hhmmss HES_CTRL Stopping
    ...                                   yymmdd:hhmmss HES_CTRL Stopped
    [Tags]      BHDV-STOP-REC-05       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-STOP-REC-06: The record is stopped by charging device
    [Documentation]     Author: Linh Tran
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is off
    ...
    ...  Test Steps:
    ...  - 1. Turn on device
    ...  - 2. Connect device with Simulator and adjust ECG signal to 80 bpm
    ...  - 3. Wait for starting study and ECG analysis
    ...  - 4. Wait 1 miute
    ...  - 5. From step 4, wait 1 minute and connect device to charger
    ...
    ...  Expected Output:
    ...  - 1. Device is on
    ...  - 2. Connect successfully
    ...  - 3. On device: LED status is GREEN pulse
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Start record
    ...                                   yymmdd:hhmmss	HES_CTRL	Request Start
    ...                                   yymmdd:hhmmss	HES_CTRL	Started
    ...  - 4. Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Calibration OK
    ...  - 5. Connect successfully
    ...       On device: LED status is ORANGE pulse
    ...       The record is stopped
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Meet scheduled stop
    ...                                   yymmdd:hhmmss HES_CTRL Request Stop
    ...                                   yymmdd:hhmmss HES_CTRL Stopping
    ...                                   yymmdd:hhmmss HES_CTRL Stopped
    [Tags]      BHDV-STOP-REC-06       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-STOP-REC-07: The record is stopped by entering device to MSC mode
    [Documentation]     Author: Linh Tran
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is off
    ...
    ...  Test Steps:
    ...  - 1. Turn on device
    ...  - 2. Connect device with Simulator and adjust ECG signal to 80 bpm
    ...  - 3. Wait for starting study and ECG analysis
    ...  - 4. Wait 1 miute
    ...  - 5. From step 4, wait 1 minute and enter device to MSc mode
    ...
    ...  Expected Output:
    ...  - 1. Device is on
    ...  - 2. Connect successfully
    ...  - 3. On device: LED status is GREEN pulse
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Start record
    ...                                   yymmdd:hhmmss	HES_CTRL	Request Start
    ...                                   yymmdd:hhmmss	HES_CTRL	Started
    ...  - 4. Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Calibration OK
    ...  - 5. Device is in MSC mode
    ...       On device: LED status is CYAN pulse
    ...       The record is stopped
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Meet scheduled stop
    ...                                   yymmdd:hhmmss HES_CTRL Request Stop
    ...                                   yymmdd:hhmmss HES_CTRL Stopping
    ...                                   yymmdd:hhmmss HES_CTRL Stopped
    [Tags]      BHDV-STOP-REC-07       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-STOP-REC-08: The record is stopped by turning off device
    [Documentation]     Author: Linh Tran
    ...  Initial Conditions:
    ...  -	Use firmware and Bioheart application with latest version
    ...  -	Bioheart device is off
    ...
    ...  Test Steps:
    ...  - 1. Turn on device
    ...  - 2. Connect device with Simulator and adjust ECG signal to 80 bpm
    ...  - 3. Wait for starting study and ECG analysis
    ...  - 4. Wait 1 miute
    ...  - 5. From step 4, wait 1 minute and turn off device
    ...
    ...  Expected Output:
    ...  - 1. Device is on
    ...  - 2. Connect successfully
    ...  - 3. On device: LED status is GREEN pulse
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Start record
    ...                                   yymmdd:hhmmss	HES_CTRL	Request Start
    ...                                   yymmdd:hhmmss	HES_CTRL	Started
    ...  - 4. Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Calibration OK
    ...  - 5. On device: LED status GREEN flash super fast > Device is powered off
    ...       The record is stopped
    ...       Log is displayed with format:
    ...                                   yymmdd:hhmmss	ECGA	Meet scheduled stop
    ...                                   yymmdd:hhmmss HES_CTRL Request Stop
    ...                                   yymmdd:hhmmss HES_CTRL Stopping
    ...                                   yymmdd:hhmmss HES_CTRL Stopped
    [Tags]      BHDV-STOP-REC-08       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-CLEANUP-01: Records will be cleaned up if device is synchronized time by connecting to Bioheart application
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Study has already started
    ...
    ...  Test Steps:
    ...  - 1. Connect device to application
    ...  - 2. Power off then power on Bioheart device
    ...  - 3. Connect device with Device monitor then enter to MSC mode
    ...  - 4. Delete ann, acc, beat, rec, dxh/log folders in SD card
    ...  - 5. Create records older than current 30 days by Long Study Generator tool with input file:
    ...       {
    ...          "Pattern"     : "./pattern",
    ...          "Output"      : "./output",
    ...          "StartTime"   : "2021/12/08 00:01:00",
    ...          "TimeZone"    : -8,
    ...          "HourDuration": 720
    ...       }
    ...  - 6. Copy ann, acc, beat, rec, dxh/log folders are created from Long Study Generator tool to SD card
    ...  - 7. Exit MSC mode
    ...  - 8. Connect device to application
    ...  - 9. Connect device with Device monitor then enter to MSC mode again
    ...  - 10. Verify ann, acc, beat, rec, dxh/log folders
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       On device: LED status is GREEN pulse
    ...       Study is started
    ...  - 2. Device is on
    ...  - 3. Connect successfully
    ...  - 4. These folders are deleted
    ...  - 5. Records created successfully
    ...  - 6. Copy successfully
    ...  - 7. Exit successfully
    ...  - 8. Connect successfully
    ...  - 9. Connect successfully
    ...  - 10. Records for the last 30 days will be kept, before that will be cleaned up
    [Tags]      BHDV-CLEANUP-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-CLEANUP-02: Records will be cleaned up if study is paused (device connected to charger)
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Study has already started
    ...
    ...  Test Steps:
    ...  - 1. Connect device to application
    ...  - 2. Power off then power on Bioheart device
    ...  - 3. Connect device with Device monitor then enter to MSC mode
    ...  - 4. Delete ann, acc, beat, rec, dxh/log folders in SD card
    ...  - 5. Create records older than current 30 days by Long Study Generator tool with input file:
    ...       {
    ...          "Pattern"     : "./pattern",
    ...          "Output"      : "./output",
    ...          "StartTime"   : "2021/12/08 00:01:00",
    ...          "TimeZone"    : -8,
    ...          "HourDuration": 720
    ...       }
    ...  - 6. Copy ann, acc, beat, rec, dxh/log folders are created from Long Study Generator tool to SD card
    ...  - 7. Exit MSC mode
    ...  - 8. Connect device to application
    ...  - 9. Wait until the next day (UTC±00:00)
    ...  - 10. Connect to the charger
    ...  - 11. Connect device with Device monitor then enter to MSC mode again
    ...  - 12. Verify ann, acc, beat, rec, dxh/log folders
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully
    ...       On device: LED status is GREEN pulse
    ...       Study is started
    ...  - 2. Device is on
    ...  - 3. Connect successfully
    ...  - 4. These folders are deleted
    ...  - 5. Records created successfully
    ...  - 6. Copy successfully
    ...  - 7. Exit successfully
    ...  - 8. Connect successfully
    ...  - 9. Connect successfully
    ...  - 10. Device is charging
    ...        LED status is ORANGE Pulse
    ...        Study is paused
    ...  - 11.Connect successfully
    ...  - 12. Records for the last 30 days will be kept, before that will be cleaned up
    [Tags]      BHDV-CLEANUP-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-ERRORMESS-01: Another recording is ongoing
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Add Bioheart device to application
    ...  -	Make sure Bioheart device connect to simulator with body status GOOD
    ...
    ...  Test Steps:
    ...  - 1. On device: press on Center button
    ...  - 2. On app: press on Create button
    ...  - 3. On app: press on TAP TO VIEW tab
    ...  - 4. On app: press on Start Recording button
    ...  - 5. Press on Okay
    ...
    ...  Expected Output:
    ...  - 1. On app: display Create snapshot modal.
    ...  - 2. The snapshot is creating.
    ...  - 3. LIVE HEART RHYTHM screen is displayed.
    ...  - 4. There shall be a modal with message display “Could not start recording. Another recording is ongoing”.
    ...  - 5. The modal is closed.
    [Tags]      BHDV-ERRORMESS-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-ERRORMESS-02: Bad contact
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Add Bioheart device to application
    ...  -	Make sure Bioheart device connect to simulator with body status GOOD
    ...
    ...  Test Steps:
    ...  - 1. Disconnect Bioheart device with Simulator
    ...  - 2. Wait for at least 5 minutes
    ...  - 3. On app: press on TAP TO VIEW tab
    ...  - 4. On app: press on Start Recording button
    ...  - 5. Press on Okay
    ...
    ...  Expected Output:
    ...  - 1. Disconnect successfully.
    ...     - On device: LED status is BLUE flash.
    ...  - 2. The study is paused.
    ...  - 3. LIVE HEART RHYTHM screen is displayed.
    ...  - 4. There shall be a modal with message display “Could not start recording. Your Bioheart is in bad contact. Please wear it properly”.
    ...  - 5. The modal is closed.
    [Tags]      BHDV-ERRORMESS-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-ERRORMESS-03: Charging
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Add Bioheart device to application
    ...  -	Make sure Bioheart device connect to simulator with body status GOOD
    ...
    ...  Test Steps:
    ...  - 1. Connect Bioheart device with charger
    ...  - 2. Wait at least 5 seconds
    ...  - 3. On app: press on TAP TO VIEW tab
    ...  - 4. On app: press on Start Recording button
    ...  - 5. Press on Okay
    ...
    ...  Expected Output:
    ...  - 1. Connect successfully.
    ...    - On device: LED status is ORANGE flash,
    ...  - 2. The study is paused.
    ...  - 3. LIVE HEART RHYTHM screen is displayed
    ...  - 4. There shall be a modal with message display “Could not start recording. Your Bioheart is charging. Please unplug before recording.”.
    ...  - 5. The modal is closed.
    [Tags]      BHDV-ERRORMESS-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-ERRORMESS-04: Failed to create snapshot, if could not start recording due to other error
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -	Add Bioheart device to application
    ...  -	Make sure Bioheart device connect to simulator
    ...  -  Device is off
    ...
    ...  Test Steps:
    ...  - 1. Turn on device
    ...  - 2. Wait for device connect with app
    ...  - 3. On app: press on TAP TO VIEW tab
    ...  - 4. On app: press on Start Recording button
    ...  - 5. Press on Okay
    ...
    ...  Expected Output:
    ...  - 1. Device is on.
    ...  - 2. Device status is connected.
    ...  - 3. LIVE HEART RHYTHM screen is displayed.
    ...  - 4. There shall be a modal with message display “Could not start recording. Please try again”.
    ...  - 5. The modal is closed.
    [Tags]      BHDV-ERRORMESS-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-BTBG-01: Check Bluetooth running background with application
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -  Add Bioheart device to application
    ...  -	Turn on permission running Bluetooth background on the phone
    ...
    ...  Test Steps:
    ...  - 1. On app: check Body contact status
    ...  - 2. Close app (not kill app)
    ...  - 3. Wait for a long time (about 1h) and open app
    ...  - 4. Go to Sync your heart data tab
    ...
    ...  Expected Output:
    ...  - 1. Contact status is Good
    ...  - 2. App is closed
    ...  - 3. App is opened
    ...  - 4. There is no backup data recording file
    [Tags]      BHDV-BTBG-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-WARNINGMESS-01: Display warning message when device is charging
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -  Add Bioheart device to application
    ...
    ...  Test Steps:
    ...  - 1. Connect device with charger
    ...  - 2. On app: Go to YOUR HEART RHYTHM screen
    ...  - 3. Disconnect device with charger
    ...
    ...  Expected Output:
    ...  - 1. Device is charging
    ...  - 2. There shall be warning message “Bioheart is charging, unplug to record”
    ...  - 3. Device is disconnected with charger and the warning message is disappeared
    [Tags]      BHDV-WARNINGMESS-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-WARNINGMESS-02: Display warning message when lead off
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -  Add Bioheart device to application
    ...
    ...  Test Steps:
    ...  - 1. Disconnect the HES channel (LA or LL)
    ...  - 2. Wait at least 5 minutes
    ...  - 3. On app: Go to YOUR HEART RHYTHM screen
    ...  - 4. Press on Guide button
    ...
    ...  Expected Output:
    ...  - 1. Disconnect successfully
    ...     - On device: LED status is BLUE flash
    ...  - 2. Study is paused
    ...  - 3. There shall be warning message “Bad contact, wear it properly”
    ...      - There shall be Guide button
    ...  - 4. Navigate to the guide screen
    [Tags]      BHDV-WARNINGMESS-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHDV-WARNINGMESS-03: Display waring message when ECG is noised
    [Documentation]     Author: Linh Tran
    ...
    ...  Initial Conditions:
    ...  -  Add Bioheart device to application
    ...
    ...  Test Steps:
    ...  - 1. Turn off device
    ...  - 2. On app: Go to YOUR HEART RHYTHM screen and turn on device
    ...  - 3. Press on Guide button
    ...
    ...  Expected Output:
    ...  - 1. Device is off
    ...  - 2. Device is on and there shall be warning message “Electrical noise or bad contact”
    ...     - There shall be Guide button
    ...  - 3. Navigate to the guide screen
    [Tags]      BHDV-WARNINGMESS-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
