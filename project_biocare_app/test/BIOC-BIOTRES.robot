*** Settings ***
Documentation   Biocare app Biotres study test suite
Metadata    sid     BIOC-BIOTRES
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-BIOTRES  mapp
Test Timeout    1h

*** Test Cases ***
# NO LINKED CAREPLAN-01
BIOC-BIOTRES-CONNECT-01-01: Allow Bluetooth Permission
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Enter ref code and Press on Start monitoring button
    ...     2. Allow Bluetooth Permission
    ...
    ...     Expected Output:
    ...     1. Allow Bluetooth Permission modal displayed:
    ...        - Title: "Biocare Health" would like to access your device's Bluetooth
    ...        - Content: Please enable the bluetooth permission in your phone's settings
    ...        - Open Settings button -> Open the settings of the phone.
    ...        - Cancel button -> Navigate the user back to the Enter Ref code screen
    ...     2. Bluetooth is not available modal displayed:
    ...        - Title: Bluetooth is not available
    ...        - Content: To connect with Biotres, please enable Bluetooth in your phone's settings.
    ...        - Go to Settings button -> Open the settings of the phone
    ...        - Cancel button -> Navigate the user back to the Services screen
    [Tags]      BIOC-BIOTRES-CONNECT-01-01       BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-CONNECT-01-02: The app cannot find the devices
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Enter ref code and Press on Start monitoring button
    ...     2. Press on Back button
    ...
    ...     Expected Output:
    ...     1. After 1 minute, if there is no device found, there shall be a screen displayed:
    ...        - Title: Biotres device not found
    ...        - Content: Please make sure the device is in a discoverable mode. If not, please turn the Biotres device on.
    ...        - Try again Button -> The process shall start scan again
    ...     2. Back to the previous screen
    [Tags]      BIOC-BIOTRES-CONNECT-01-02    BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-CONNECT-01-03: The app cannot connect the devices (Connect fail)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Enter ref code and Press on Start monitoring button
    ...     2. The app found the device
    ...
    ...     Expected Output:
    ...     1. After 1 minute, if the app found device but cannot connect, there shall be a modal displayed:
    ...        - Title: Failed to connect Biotres device
    ...        - Content: Something went wrong. Please make sure your device is turned on and placed in the area then try again!
    ...        - Try again Button -> Start the process again
    ...        - Cancel button -> Back to previous screen
    [Tags]      BIOC-BIOTRES-CONNECT-01-03     BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-CONNECT-01-04: Connect when no internet connection
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...     - Turn off Internet
    ...
    ...     Test Steps:
    ...     1. Enter ref code and Press on Start monitoring button
    ...
    ...     Expected Output:
    ...     1. The snackbar "No Internet connection. Please try again." will displayed
    [Tags]      BIOC-BIOTRES-CONNECT-01-04     BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-CONNECT-01-05: Connect device for Holter/Extended Holter study
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Enter ref code and Press on Start monitoring button
    ...     2. Scan and connect device
    ...     3. Leave monitoring and Reconnect device
    ...     4. Wait for study done
    ...     5. Enter study code
    ...
    ...     Expected Output:
    ...     2. Navigate user to the Study screen
    ...     3. Navigate user to the Study screen
    ...     4. The modal Completed study is displayed
    ...     5. The modal Completed study is displayed
    [Tags]      BIOC-BIOTRES-CONNECT-01-05      BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-CONNECT-01-06: Connect device for MCT/MCT Peek/Cardiac Event study
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Enter ref code and Press on Start monitoring button
    ...     2. Scan and connect device
    ...     3. Leave monitoring and Reconnect device
    ...     4. Wait for study done
    ...     5. Enter study code
    ...
    ...     Expected Output:
    ...     2. Navigate user to the Study screen
    ...     3. Navigate user to the Study screen
    ...     4. The modal Completed study is displayed
    ...     5. The modal Completed study is displayed
    [Tags]      BIOC-BIOTRES-CONNECT-01-06     BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-CONNECT-01-07: Connected device
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Enter ref code and Press on Start monitoring button
    ...     2. Scan and connect device
    ...     3. Kill app
    ...     4. Re-open app
    ...     5. Sign out
    ...     6. Continue with account
    ...
    ...     Expected Output:
    ...     2. Navigated user to the Study screen
    ...     4. The study is still monitoring in the app
    ...     6. The study shall be removed
    [Tags]      BIOC-BIOTRES-CONNECT-01-07       BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-CONNECT-01-08: The first time pair Biotres device
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Enter Ref Code and Press on Start monitoring button
    ...     2. Press on Next/Back button
    ...     3. Press on Got it or X button
    ...     4. Leave monitoring and monitor study again
    ...
    ...     Expected Output:
    ...     1. Connect device successfully
    ...        - The 1st time connect device, displaying the Biotres quick guide
    ...     2. Navigate to the next/previous screen
    ...     3. Close the screen and displaying Biotres study screen
    ...     4. Biotres study screen shall display without quick guide
    [Tags]      BIOC-BIOTRES-CONNECT-01-08      BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-CONNECT-01-09: Turn off/on device and connect/reconnect device when study is started
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Services tab: Study on going (Connected)
    ...
    ...     Test Steps:
    ...     1. Press event button 5 seconds to turn off the device
    ...     2. Press event button 5 seconds to turn on the device
    ...     3. Move far away phone and device
    ...     4. Move the device near to the phone
    ...     5. Turn off bluetooth
    ...     6. Turn on the bluetooth
    ...
    ...     Expected Output:
    ...     1. The Device have to disconnect and show Offline screen
    ...     2. The Device have to reconnect with App
    ...     3. The device have to disconnect with app
    ...     4. The Device have to reconnect with App
    ...     5. The device have to disconnect with app
    ...     6. The Device have to reconnect with App
    [Tags]      BIOC-BIOTRES-CONNECT-01-09     BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-CONNECT-01-10: Turn off/on device and connect/reconnect device when study is uploading
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Services tab: Study on going (Connected)
    ...
    ...     Test Steps:
    ...     1. Press on Stop button on the portal
    ...     2. Press event button 5 seconds to turn off the device
    ...     3. Press event button 5 seconds to turn on the device
    ...     4. Move far away phone and device
    ...     5. Move the device near to the phone
    ...     6. Turn off bluetooth
    ...     7. Turn on the bluetooth
    ...
    ...     Expected Output:
    ...     1. Switch status to Data Uploading
    ...     2. The Device have to disconnect and show Offline screen
    ...     3. The Device have to reconnect with App and continue uploading
    ...     4. The device have to disconnect with app
    ...     5. The Device have to reconnect with App and continue uploading
    ...     6. The device have to disconnect with app
    ...     7. The Device have to reconnect with App and continue uploading
    [Tags]      BIOC-BIOTRES-CONNECT-01-10     BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-CONNECT-01-11: Turn off/on device and connect/reconnect device: Study Follow On
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The Study on progress
    ...
    ...     Test Steps:
    ...     1. Wait for study 1 done
    ...     2. Press event button 5 seconds to turn off the device
    ...     3. Press event button 5 seconds to turn on the device
    ...     4. Move far away phone and device
    ...     5. Move the device near to the phone
    ...     6. Turn off bluetooth
    ...     7. Turn on the bluetooth
    ...
    ...     Expected Output:
    ...     1. Loading switch to study 2
    ...     2. The Device have to disconnect and show Offline screen
    ...     3. The Device have to reconnect with App and continue switch to study 2
    ...     4. The device have to disconnect with app
    ...     5. The Device have to reconnect with App and continue switch to study 2
    ...     6. The device have to disconnect with app
    ...     7. The Device have to reconnect with App and continue switch to study 2
    [Tags]      BIOC-BIOTRES-CONNECT-01-11        BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

# LINKED CAREPLAN-02
BIOC-BIOTRES-CONNECT-02-01: Allow Bluetooth Permission
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Reference code screen
    ...
    ...     Test Steps:
    ...     1. Enter ref code and Press on Start monitoring button
    ...     2. Allow Bluetooth Permission
    ...
    ...     Expected Output:
    ...     1. Allow Bluetooth Permission modal displayed:
    ...        - Title: "Biocare Health" would like to access your device's Bluetooth
    ...        - Content: Please enable the bluetooth permission in your phone's settings
    ...        - Open Settings button -> Open the settings of the phone.
    ...        - Cancel button -> Navigate the user back to the Enter Ref code screen
    ...     2. Bluetooth is not available modal displayed:
    ...        - Title: Bluetooth is not available
    ...        - Content: To connect with Biotres, please enable Bluetooth in your phone's settings.
    ...        - Go to Settings button -> Open the settings of the phone
    ...        - Cancel button -> Navigate the user back to the Enter Ref code screen
    [Tags]      BIOC-BIOTRES-CONNECT-02-01      BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-CONNECT-02-02: The app cannot find the devices
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Reference code screen
    ...
    ...     Test Steps:
    ...     1. Enter ref code and Press on Start monitoring button
    ...     2. Press on Back button
    ...
    ...     Expected Output:
    ...     1. After 1 minute, if there is no device found, there shall be a screen displayed:
    ...        - Title: Biotres device not found
    ...        - Content: Please make sure the device is in a discoverable mode. If not, please turn the Biotres device on.
    ...        - Try again Button -> The process shall start scan again
    ...     2. Back to the Reference code screen
    [Tags]      BIOC-BIOTRES-CONNECT-02-02     BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-CONNECT-02-03: The app cannot connect the devices (Connect fail)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Reference code screen
    ...
    ...     Test Steps:
    ...     1. Enter ref code and Press on Start monitoring button
    ...     2. The app found the device
    ...
    ...     Expected Output:
    ...     1. After 1 minute, if the app found device but cannot connect, there shall be a modal displayed:
    ...        - Title: Failed to connect Biotres device
    ...        - Content: Something went wrong. Please make sure your device is turned on and placed in the area then try again!
    ...        - Try again Button -> Start the process again
    ...        - Cancel button -> Back to the Reference code screen
    [Tags]      BIOC-BIOTRES-CONNECT-02-03     BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-CONNECT-02-04: Connect when no internet connection
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is Reference code screen
    ...     - Turn off Internet
    ...
    ...     Test Steps:
    ...     1. Enter ref code and Press on Start monitoring button
    ...
    ...     Expected Output:
    ...     1. The snackbar "No Internet connection. Please try again." will displayed
    [Tags]      BIOC-BIOTRES-CONNECT-02-04        BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-CONNECT-02-05: Connect device for Holter/Extended Holter study
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Reference code screen
    ...
    ...     Test Steps:
    ...     1. Enter ref code and Press on Start monitoring button
    ...     2. Scan and connect device
    ...     3. Leave monitoring and Reconnect device
    ...     4. Wait for study done
    ...     5. Enter study code
    ...
    ...     Expected Output:
    ...     2. Navigate user to the Study screen
    ...     3. Navigate user to the Study screen
    ...     4. The modal Completed study is displayed
    ...     5. The modal Completed study is displayed
    [Tags]      BIOC-BIOTRES-CONNECT-02-05       BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-CONNECT-02-06: Connect device for MCT/MCT Peek/Cardiac Event study
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Reference code screen
    ...
    ...     Test Steps:
    ...     1. Enter ref code and Press on Start monitoring button
    ...     2. Scan and connect device
    ...     3. Leave monitoring and Reconnect device
    ...     4. Wait for study done
    ...     5. Enter study code
    ...
    ...     Expected Output:
    ...     2. Navigate user to the Study screen
    ...     3. Navigate user to the Study screen
    ...     4. The modal Completed study is displayed
    ...     5. The modal Completed study is displayed
    [Tags]      BIOC-BIOTRES-CONNECT-02-06       BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-CONNECT-02-07: Connected device
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Reference code screen
    ...
    ...     Test Steps:
    ...     1. Enter ref code and Press on Start monitoring button
    ...     2. Scan and connect device
    ...     3. Kill app
    ...     4. Re-open app
    ...     5. Sign out
    ...     6. Continue with account
    ...
    ...     Expected Output:
    ...     2. Navigated user to the Study screen
    ...     4. The study is still monitoring in the app
    ...     6. The study shall be removed
    [Tags]      BIOC-BIOTRES-CONNECT-02-07      BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-CONNECT-02-08: The first time pair Biotres device
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Reference code screen
    ...
    ...     Test Steps:
    ...     1. Enter Ref Code and Press on Start monitoring button
    ...     2. Press on Next/Back button
    ...     3. Press on Got it or X button
    ...     4. Leave monitoring and monitor study again
    ...
    ...     Expected Output:
    ...     1. Connect device successfully
    ...        - The 1st time connect device, displaying the Biotres quick guide
    ...     2. Navigate to the next/previous screen
    ...     3. Close the screen and displaying Biotres study screen
    ...     4. Biotres study screen shall display without quick guide
    [Tags]      BIOC-BIOTRES-CONNECT-02-08    BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-CONNECT-02-09: Turn off/on device and connect/reconnect device when study is started
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Services tab: Study on going (Connected)
    ...
    ...     Test Steps:
    ...     1. Press event button 5 seconds to turn off the device
    ...     2. Press event button 5 seconds to turn on the device
    ...     3. Move far away phone and device
    ...     4. Move the device near to the phone
    ...     5. Turn off bluetooth
    ...     6. Turn on the bluetooth
    ...
    ...     Expected Output:
    ...     1. The Device have to disconnect and show Offline screen
    ...     2. The Device have to reconnect with App
    ...     3. The device have to disconnect with app
    ...     4. The Device have to reconnect with App
    ...     5. The device have to disconnect with app
    ...     6. The Device have to reconnect with App
    [Tags]      BIOC-BIOTRES-CONNECT-02-09      BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-CONNECT-02-10: Turn off/on device and connect/reconnect device when study is uploading
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Services tab: Study on going (Connected)
    ...
    ...     Test Steps:
    ...     1. Press on Stop button on the portal
    ...     2. Press event button 5 seconds to turn off the device
    ...     3. Press event button 5 seconds to turn on the device
    ...     4. Move far away phone and device
    ...     5. Move the device near to the phone
    ...     6. Turn off bluetooth
    ...     7. Turn on the bluetooth
    ...
    ...     Expected Output:
    ...     1. Switch status to Data Uploading
    ...     2. The Device have to disconnect and show Offline screen
    ...     3. The Device have to reconnect with App and continue uploading
    ...     4. The device have to disconnect with app
    ...     5. The Device have to reconnect with App and continue uploading
    ...     6. The device have to disconnect with app
    ...     7. The Device have to reconnect with App and continue uploading
    [Tags]      BIOC-BIOTRES-CONNECT-02-10     BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-CONNECT-02-11: Turn off/on device and connect/reconnect device: Study Follow On
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The Study on progress
    ...
    ...     Test Steps:
    ...     1. Wait for study 1 done
    ...     2. Press event button 5 seconds to turn off the device
    ...     3. Press event button 5 seconds to turn on the device
    ...     4. Move far away phone and device
    ...     5. Move the device near to the phone
    ...     6. Turn off bluetooth
    ...     7. Turn on the bluetooth
    ...
    ...     Expected Output:
    ...     1. Loading switch to study 2
    ...     2. The Device have to disconnect and show Offline screen
    ...     3. The Device have to reconnect with App and continue switch to study 2
    ...     4. The device have to disconnect with app
    ...     5. The Device have to reconnect with App and continue switch to study 2
    ...     6. The device have to disconnect with app
    ...     7. The Device have to reconnect with App and continue switch to study 2
    [Tags]      BIOC-BIOTRES-CONNECT-02-11       BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#BIOTRES SCREEN: CONNECTED
BIOC-BIOTRES-01: Started Biotres study
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Devices tab: Connect device with status "Ready for new study"
    ...
    ...     Test Steps:
    ...     1. Start study
    ...     2. Press on View study button
    ...
    ...     Expected Output:
    ...     2. On the Study screen, there shall be the following attributes displayed:
    ...        - Biotres study section
    ...          + Device illustration:
    ...            It shall display the Biotres device with its status indicator light emitting green color
    ...          + Study ID - XXXXXX
    ...          + Device ID
    ...          + Battery level: Displays the current percentage + text Battery
    ...          + Electrodes connection – it can be Good contact or Partial contact
    ...          + Server connection
    ...          + Study status
    ...        - Support section
    ...          + User manual
    ...          + Quick guide & Videos
    ...          + Troubleshooting
    ...          + Contact support
    ...        - Leave monitoring button
    [Tags]      BIOC-BIOTRES-01       BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-02: Server connection
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Biotres study
    ...
    ...     Test Steps:
    ...     1. Turrn on the Device
    ...     2. Turn off the Device
    ...     3. Check illustration
    ...     4. Device is disconnected from the app for a few minutes
    ...     5. Unstable network connectivity for a few minutes
    ...
    ...     Expected Output:
    ...     1. Device online
    ...     2. Offline – the device is disconnected from the server
    ...        - Active Xm ago, Xh ago
    ...        - The most common issue during the last 8 hours (only displayed if the study type is MCT/MCT PEEK/CARDIAC EVENT and there is no current alert displayed)
    ...          + “The device has been offline for more than 12 hours”
    ...          + “The study has been paused for more than 8 hours”
    ...     3. It shall display the Biotres device with its status indicator light OFF
    ...     4. Message “Device disconnected. Please make sure it is turned on and in range.”
    ...        - Okay button -> Dismiss the reminder
    ...     5. Message “Your device has been offline for a while”
    ...        - Okay button -> Dismiss the reminder
    [Tags]      BIOC-BIOTRES-02      BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-03: Study status
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Biotres study
    ...
    ...     Test Steps:
    ...     1. Study is running
    ...     2. The study is paused
    ...     3. The study has reached its end of duration
    ...     4. The study data is being uploaded
    ...     5. The study data is uploaded successfully
    ...     6. The user does not have the app opened and the study has reaches its end of duration/ is completed -> opens the app
    ...
    ...     Expected Output:
    ...     1. If the study remaining time is less than one day: Xh XXm left
    ...        If the study remaining time is more than one day: XD XXh XXm left
    ...     2. Display: Study Paused
    ...     3. Display the study status as Completed
    ...     4. Display the study status as Data Uploading
    ...     5. Display the study status as Data Uploaded then display a pop-up
    ...        - Title: Completed study
    ...        - Content: Your Study Report is in Progress. We’ll notify you as soon as it’s ready for your review, which usually takes a few days.
    ...        - Okay button. Tapping the button shall navigate the user to the Services screen.
    ...     6. The user shall be navigated to the Services screen and there shall be this modal displayed notifying the user that the study has been completed
    ...       NOTE: If the study type is Holter and Follow on study, after the first study finishes its study data upload, there shall be a screen displayed with the loading icon and a message: Waiting for the study to be completed..
    [Tags]      BIOC-BIOTRES-03      BIOC-1.16.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-04: View alert banner when Bluetooth is disabled
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Biotres device study
    ...
    ...     Test Steps:
    ...     1. Turn off Bluetooth on the phone
    ...     2. Check illustration
    ...
    ...     Expected Output:
    ...     1. Message: Bluetooth is disabled. Please enable it.
    ...        - Go to settings button -> Navigate the user to the Settings of the phone
    ...        *This banner shall keep being displayed until the Bluetooth of the phone is enabled*
    ...     2. It shall display the Biotres device with its status indicator light OFF
    [Tags]      BIOC-BIOTRES-04      BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-05: Electrodes connection
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Biotres study
    ...
    ...     Test Steps:
    ...     1. Lead (LL,LA,RA) connected
    ...     2. One or more electrode disconnected for a few minutes
    ...     3. Check illustration
    ...     4. Press on Okay button
    ...     5. Issues found
    ...
    ...     Expected Output:
    ...     1. Displays 'Good contact'
    ...     2. Displays 'Partial contact'. Message: “One or more cable wires seems loose for a good study”
    ...     3. It shall display the Biotres device with its status indicator light emitting white color
    ...     4. Dismiss the modal
    ...     5. It can be one of the following issues
    ...        - Artifacts in all channels
    ...        - Lead off on diagnosis channel
    ...        - More than one lead disconnected
    ...        - All leads or ECG cable disconnected
    ...        - Lead LL disconnected
    ...        - Lead LA disconnected
    ...        - Lead RA disconnected
    ...       => All issues shall be displayed as follows: “One or more electrodes have been disconnected”
    [Tags]      BIOC-BIOTRES-05      BIOC-1.16.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-06: View alert banner when Electrodes disconnection for more than 2 hours
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Biotres device study
    ...
    ...     Test Steps:
    ...     1. Disconnect lead more than 2 hours
    ...
    ...     Expected Output:
    ...     1. Message: One or more electrodes have been disconnected for more than 2 hours. Please click the button below for help.
    ...        - Proceed with assistance button -> Open the video of Body Placement
    ...          *This banner shall be displayed until all electrodes are connected properly*
    [Tags]      BIOC-BIOTRES-06      BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-07: View alert banner when Battery running low
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Biotres device study
    ...
    ...     Test Steps:
    ...     1. Wait for device low battery
    ...
    ...     Expected Output:
    ...     1. Message: Your device battery seems low to continue a good study. Please connect it to the charger.
    ...        - Learn more button -> Open the video of Power ON and Charging
    ...        *This banner shall be displayed until the battery is charged sufficiently*
    [Tags]      BIOC-BIOTRES-07       BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-BATTERY-01: Battery level (Biotres normal)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Biotres study
    ...
    ...     Test Steps:
    ...     1. The battery level is greater than or equal to 10%
    ...     2. Check illustration
    ...     3. The battery level is less than 9%
    ...     4. The device is connected to the charger
    ...
    ...     Expected Output:
    ...     1. Displays the current percentage + text Battery
    ...        - The battery percentage shall be filled with green color
    ...     2. It shall display the Biotres device with its status indicator light emitting blue color
    ...     3. The battery level percentage shall be filled with red color
    ...     4. Charging icon displayed, the battery percentage shall be filled with black color
    [Tags]      BIOC-BIOTRES-BATTERY-01       BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-BATTERY-02: Battery level (Biotres Pro)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Biotres Pro study
    ...
    ...     Test Steps:
    ...     1. The battery level is greater than or equal to 20%
    ...     2. The battery level is less than 19%
    ...     3. The device is connected to the charger
    ...
    ...     Expected Output:
    ...     1. Displays the current percentage + text Battery
    ...        - The battery percentage shall be filled with green color
    ...     2. The battery level percentage shall be filled with red color
    ...     3. Charging icon displayed, the battery percentage shall be filled with black color
    [Tags]      BIOC-BIOTRES-BATTERY-02      BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-BATTERY-03: Reconnect after low Battery level + disconnect with server
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Biotres study
    ...
    ...     Test Steps:
    ...     1. Low battery and disconnect with app
    ...     2. Charging and open device
    ...
    ...     Expected Output:
    ...     1. Disconnect device
    ...     2. Have to reconnect with app
    [Tags]      BIOC-BIOTRES-BATTERY-03         BIOC-1.17.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-08: Refer friend to Biotres
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
    [Tags]      BIOC-BIOTRES-08        BIOC-1.16.0  manual  R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-REMOVE-01: Remove device
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The device is in Biotres study screen
    ...
    ...     Test Steps:
    ...     1. Press on Leave monitoring button
    ...     2. Press on Cancel button
    ...     3. Turn off the internet
    ...     4. Press on Leave monitoring button
    ...     5. Press on Remove button
    ...     6. Turn on the internet
    ...     7. Press on Leave monitoring button
    ...     8. Press on Cancel button
    ...     9. Press on Leave monitoring button
    ...     10. Press on Remove button
    ...
    ...     Expected Output:
    ...     1. There shall be the confirmation modal displayed
    ...        - Title: Remove Biotres
    ...        - Content: Are you sure you wish to remove the device?
    ...        - Remove button
    ...        - Cancel button
    ...     2. Close the modal
    ...     5. The modal displayed:
    ...        - Title: Could not leave
    ...        - Content: To leave monitoring this study, you need to have a network connection. Please check your network connection and then try again.
    ...        - Go to settings Button -> Navigate the user to the phone’s settings
    ...        - Cancel button
    ...     8. Close the modal
    ...     10. Navigated to the Services screen
    [Tags]      BIOC-BIOTRES-REMOVE-01       BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-SUPPORT-01: View Previous studies screen
    [Documentation]     Author: Han Ngyen
    ...
    ...     Pre-condition:
    ...     - The device is in Biotres study screen
    ...
    ...     Test Steps:
    ...     1. Press on Previous studies tab
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Previous studies screen
    [Tags]      BIOC-BIOTRES-SUPPORT-01         BIOC-1.17.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-SUPPORT-02: View User manual screen
    [Documentation]     Author: Han Ngyen
    ...
    ...     Pre-condition:
    ...     - The device is in Biotres study screen
    ...
    ...     Test Steps:
    ...     1. Press on User manual tab
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the User manual screen and open the pdf viewer
    [Tags]      BIOC-BIOTRES-SUPPORT-02         BIOC-1.17.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-SUPPORT-03: View Quick guide & videos screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The device is in Biotres study screen
    ...
    ...     Test Steps:
    ...     1. Press on Quick guide & videos tab
    ...     2. Press on Quick guide tab
    ...     3. Press on Quick guide document
    ...     4. Press on How to Videos tab
    ...     5. Press on Play icon
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Quick guide & videos screen
    ...        - Quick guide section
    ...        - Quick guide document section
    ...        - How to Videos section
    ...     2. Navigate the user to the Quick guide screen and open the pdf viewer
    ...     3. Navigate the user to the Quick guide document screen and open the pdf viewer
    ...     4. Displays a list of videos, each video card has the following attributes:
    ...        - Text: PLAY VIDEO
    ...        - Video name
    ...        - Play icon
    ...     5. Navigate to the Video. There shall be the following attributes displayed supporting the user’s actions to the video opened:
    ...        - Play/Pause button for the user to play and pause the video
    ...        - Loading icon if the video is loading or the Internet connection is lost
    ...        - Red dot on the video progress bar for the user to head to the design point of the video
    ...        - Current time
    ...        - Duration
    ...        - The user can also long press the screen then swipe left or right to rewind or fast forward the video
    ...        - X button for the user to close the current video
    [Tags]      BIOC-BIOTRES-SUPPORT-03         BIOC-1.15.0  manual  R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-SUPPORT-04: View Troubleshooting screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The device is in Biotres study screen
    ...
    ...     Test Steps:
    ...     1. Press on Troubleeshooting tab
    ...     2. Press on Device connection
    ...     3. Press on Lead connection
    ...     4. Press on Server connection
    ...     5. Press on Study paused
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Troubleshooting screen:
    ...        - Text: Select your issue to view its solution
    ...          + Device connection
    ...          + Lead connection
    ...          + Server connection
    ...          + Study paused
    ...     2. The user shall view the following content:
    ...        “The device might not be within the phone’s Bluetooth range. Bring the device near by the phone and check whether the device connection to the app is re-established or not.”
    ...     3. The user shall be able to view the video
    ...        - Text: PLAY VIDEO
    ...        - Body placement
    ...        - Play icon
    ...     4. Solutions with illustration displayed:
    ...        - Message:
    ...          + The device is offline. This occurs when the device is powered off, out of battery, in a low signal area OR when there is no internet connection.
    ...          + Confirm the device is powered on, has sufficient charge, and that your network signal or internet connection are stable.
    ...          + If you have tried the suggested solutions and your device still will not turn on, tap here to contact Customer Support for assistance.
    ...            * Contact support button -> Open the Contact Support screen
    ...     5. Message: Your study pauses automatically when the device is removed for charging. To continue your study, wear the device as instructed.
    [Tags]      BIOC-BIOTRES-SUPPORT-04       BIOC-1.16.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-SUPPORT-05: View Contact support screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The device is in Biotres study screen
    ...
    ...     Test Steps:
    ...     1. Press on Contact support tab
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Contact information screen
    ...        - Department: Biotricity Customer Support
    ...        - Phone number: 1-800-590-4155. Tapping the number shall displays
    ...           * On iOS – a banner with the following format
    ...                 o Call 1-800-590-4155
    ...                 o Cancel button
    ...           * On Android OS – a phone app with number autofilled
    ...        - Email address: cs@biotricity.com
    ...        - Done button
    [Tags]      BIOC-BIOTRES-SUPPORT-05     BIOC-1.16.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-SUPPORT-06: Turn off internet
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The device is in Biotres study screen
    ...
    ...     Test Steps:
    ...     1. Turn of internet on the phone
    ...     2. Press on previous study tab
    ...     3. Press on User manual tab
    ...     4. Press on Quick guide & video tab
    ...     5. Press on Troubleshooting tab
    ...     6. View Contact support tab
    ...
    ...     Expected Output:
    ...     2.
    ...     3.
    ...     4.
    ...     5.
    ...     6.
    [Tags]      BIOC-BIOTRES-SUPPORT-06       BIOC-1.16.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-SUPPORT-07: View Quick guide and the status of Biocore is “Setting up…”
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The device is in Biotres study screen
    ...
    ...     Test Steps:
    ...     1. Press on Quick guide
    ...     2. Press on Quick guide tab
    ...     3. Press on Quick guide document
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Quick guide, there shall be 4 screens
    ...        - Screen 1: Unified male and female application with illustration and instructions.
    ...        - Screen 2: Alternative placement option – optimized placement with illustration and instructions. 
    ...        - Screen 3: Press and hold Event button for 5 seconds until the green light starts flashing - optimized placement with illustration and instructions. 
    ...        - Screen 4: Things not to do during study with illustration and instructions.
    [Tags]      BIOC-BIOTRES-SUPPORT-07       BIOC-1.16.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-SUPPORT-08: Verify the follow-on study banner
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the follow-on study with the biotres device
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
    [Tags]      BIOC-BIOTRES-SUPPORT-08      BIOC-1.19.0   manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-SUPPORT-09: Verify the lead off banner
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Log in the app
    ...     - Create the study with the biotres device
    ...     - log in the app
    ...     - Connect app with the study
    ...
    ...     Test Steps:
    ...     1. Don't connect device more than 2 hours
    ...     1. Check the banner is displayed on the study
    ...
    ...     Expected Output:
    ...    - This lead off banner will only be displayed in the study.
    ...    - Don't display partial contact, good contact
    [Tags]     BIOC-BIOTRES-SUPPORT-09       BIOC-1.20.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-SUPPORT-10: Verify the lead off banner when device low battery
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Prepare device low battery
    ...     - Log in the portal
    ...     - Create the study with the biotres device
    ...     - log in the app
    ...     - Connect app with the study
    ...
    ...     Test Steps:
    ...     1. Don't connect device more than 2 hours
    ...     1. Check the banner is displayed on the study
    ...
    ...     Expected Output:
    ...    - This lead off low battery banner will only be displayed in the study.
    ...    - Don't display partial contact, good contact
    [Tags]       BIOC-BIOTRES-SUPPORT-10       BIOC-1.20.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-EVENT-01: Press Event button on Biotres device
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The device is in Biotres study screen
    ...
    ...     Test Steps:
    ...     1. Press on Event button on Biotres device
    ...     2. Press on Close button
    ...
    ...     Expected Output:
    ...     1. Recevie notification and show Select symptoms creen
    ...        - Text: The event will be sent automatically after <20s>
    ...        - Palpitations
    ...        - Shortness of breath
    ...        - Dizziness
    ...        - Chest pain or pressure
    ...        - Other
    ...        - Close button
    ...        - Submit button (disable)
    ...     3. Close the bottom sheet
    [Tags]      BIOC-BIOTRES-EVENT-01       BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-EVENT-02: Press Event button when turn off your phone but don't kill app
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The device is in Biotres study screen
    ...     - Turn off your home phone screen but don't kill app
    ...
    ...     Test Steps:
    ...     1. Press on Event button on Biotres device
    ...     2. Press on the notification
    ...     3. Press on Close button
    ...
    ...     Expected Output:
    ...     1. Recevie notification
    ...     2. Navigate user to the Select symptoms creen (within the time out duration)
    ...        - Text: The event will be sent automatically after <time out duration>
    ...        - Palpitations
    ...        - Shortness of breath
    ...        - Dizziness
    ...        - Chest pain or pressure
    ...        - Other
    ...        - Close button
    ...        - Submit button (disable)
    ...     3. Close the bottom sheet
    [Tags]      BIOC-BIOTRES-EVENT-02       BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-EVENT-03: Select all symptoms
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The device is in Biotres study screen
    ...
    ...     Test Steps:
    ...     1. Press on Event button on Biotres device
    ...     2. Select alls symptoms
    ...     3. Press on Submit button
    ...
    ...     Expected Output:
    ...     1. Select symptoms creen displayed:
    ...        - Text: The event will be sent automatically after <20s>
    ...          Palpitations
    ...          Shortness of breath
    ...          Dizziness
    ...          Chest pain or pressure
    ...          Other
    ...     2. Submit button will enable
    ...     3. Close the bottom sheet and send all symptoms to the portal
    [Tags]      BIOC-BIOTRES-EVENT-03    BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-EVENT-04: Select any symptoms but don't submit
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The device is in Biotres study screen
    ...
    ...     Test Steps:
    ...     1. Press on Event button on Biotres device
    ...     2. Wait for section expired
    ...
    ...     Expected Output:
    ...     1. Select symptoms creen displayed
    ...     2. The bottom sheet auto close
    [Tags]      BIOC-BIOTRES-EVENT-04       BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-EVENT-05: Section is expired when turn off home phone
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The device is in Biotres study screen
    ...     - Turn off your home phone screen but don't kill app
    ...
    ...     Test Steps:
    ...     1. Press on Event button on Biotres device
    ...     2. Wait for 15 seconds
    ...     3. Open the Phone and click on noti
    ...
    ...     Expected Output:
    ...     1. Recevie notification
    ...     3. Symptom selecting timeout has been expired: “Session is expired. The event was sent automatically."
    [Tags]      BIOC-BIOTRES-EVENT-05      BIOC-1.16.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-EVENT-06: Section is expired when kill app
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The device is in Biotres study screen
    ...     - Kill app
    ...
    ...     Test Steps:
    ...     1. Press on Event button on Biotres device
    ...     2. Wait for 15 seconds
    ...     3. Press on Notification
    ...
    ...     Expected Output:
    ...     1. Android: Recevie notification
    ...        IOS: Can't recevie notification
    ...     3. Symptom selecting timeout has been expired: “Session is expired. The event was sent automatically."
    [Tags]      BIOC-BIOTRES-EVENT-06         BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-NOTI-01: Receive a notification of a manual event triggered
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The device is in Biotres study screen
    ...     - Turn off your home phone screen
    ...
    ...     Test Steps:
    ...     1. Press on Event button on Biotres device
    ...     2. Press on the notification
    ...     3. Press on Close button
    ...
    ...     Expected Output:
    ...     1. Push notification in-app, and popup will be displayed
    ...        - Title: Biocare Health
    ...        - Content: Manual event triggered! Tap to select symptoms you are experiencing.
    ...     2. Navigate user to the Select symptoms creen (within the time out duration)
    ...     3. Close the bottom sheet
    [Tags]      BIOC-BIOTRES-NOTI-01         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-NOTI-02: Send symptoms
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The device is connected
    ...
    ...     Test Steps:
    ...     1. Press on Center button on Biotres device
    ...     2. Press on the notification
    ...     3. Select some symptoms
    ...     4. Press on Submit button
    ...
    ...     Expected Output:
    ...     1. Push notification in-app, and popup will be displayed
    ...        - Title: Biocare Health
    ...        - Content: Manual event triggered! Tap to select symptoms you are experiencing.
    ...     2. Navigate the user to the Select symptoms creen (within the time out duration)
    ...        - Text: The event will be sent automatically after <time out duration>
    ...        - Palpitations
    ...        - Shortness of breath
    ...        - Dizziness
    ...        - Chest pain or pressure
    ...        - Other
    ...        - Close button
    ...        - Submit button (disable)
    ...     3. Submit button will be enable
    ...     4. Close the bottom sheet and send symptoms to the server
    [Tags]      BIOC-BIOTRES-NOTI-02         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-NOTI-03: Check notification
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...     1. If the user taps on the notification after 15s since the notification pushed
    ...
    ...     Expected Output:
    ...     1. There shall be a snack bar to let the user knows that the symptom selecting timeout has been expired: “Session is expired. The event was sent automatically."
    [Tags]      BIOC-BIOTRES-NOTI-03         BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-NOTI-04: Check notification (IOS)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...     1. If the user taps on the notification after 15s since the notification pushed
    ...
    ...     Expected Output:
    ...     1. There shall be a snack bar to let the user knows that the symptom selecting timeout has been expired: “Session is expired. The event was sent automatically."
    ...     - For iOS, if the user swipes the app in the Multitasking screen, there shall be no notification of manual event triggered sent to the patient app
    [Tags]      BIOC-BIOTRES-NOTI-04         BIOC-1.20.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-NOTI-05: Receive notification of issue found during the study
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The study is started
    ...
    ...     Test Steps:
    ...     1. Press on Center button on Biotres device
    ...
    ...     Expected Output:
    ...     1. During a study, if there is an issue found, there shall be a notification sent to the Notification center to notify the user that there is an issue with their study.
    ...        The content of the notification shall be as follows:
    ...          + Title: Biocare Health
    ...          + Content: There is an issue with your study. <issue found>
    ...        - It shall be the following issues that the user will be notified of
    ...          + Manual event triggered
    ...             * Title: Biocare Health
    ...             * Content: Manual event triggered! Tap to select symptoms you are experiencing
    ...          + One or more electrodes are disconnected
    ...             * Title: Biocare Health
    ...             * Content: There is an issue with your study. One or more electrodes have been disconnected for more than 2 hours
    ...          + Study has been paused for more than 8 hours.
    ...             * Title: Biocare Health
    ...             * Content: There is an issue with your study. It has been paused for more than 8 hours
    ...        - Tapping the notification shall navigate the user to the Study screen with the banner displayed if the issue has not been resolved yet
    [Tags]      BIOC-BIOTRES-NOTI-05         BIOC-1.20.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-ECG-01: View live ECG on Portal
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The study is started
    ...
    ...     Test Steps:
    ...     1. Press on View live ECG on portal
    ...     2. Press on Event button and select symptoms
    ...     3. Switch another tab on portal
    ...     4. Viewing and Turn off device
    ...     5. Turn on the device
    ...
    ...     Expected Output:
    ...     1. Make sure the app still connect with device
    ...        - Can stream ECG
    ...        - Don't disconnect with server
    ...     2. Popup display and send symptom to clinic
    ...     3. Make sure the app still connect with device
    ...        - Can stream ECG
    ...        - Don't disconnect with server
    ...     4. Device is disconnected
    ...     5. Reconnect the app
    [Tags]      BIOC-BIOTRES-ECG-01     BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-REPORT-01: Create report
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The study is Completed
    ...
    ...     Test Steps:
    ...     1. Go to Call center create report and send to clinic
    ...     2. Go to Clinic portal add signature from Physician/Technician
    ...     3. Click Save button on the portal
    ...     4. Press on Notification
    ...     5. Back to Home screen and press on View Report generated successfully banner
    ...
    ...     Expected Output:
    ...     3. Noti ín-papp. Report generated successfully banner will display
    ...     4. Navigate user to the study report
    ...     5. Navigate user to the study report
    [Tags]      BIOC-BIOTRES-REPORT-01     BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-REPORT-02: Recall and update report
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The study is Completed
    ...
    ...     Test Steps:
    ...     1. Go to Call center recall report
    ...     2. Check studies tab on Biocare Health history screen
    ...     3. Press on the study ID
    ...     4. Go to Call center update report
    ...     5. Check studies tab on Biocare Health history screen
    ...
    ...     Expected Output:
    ...     1. Don't have noti
    ...     3. Study report screen will change to the one:
    ...        - Title: Study [Study ID]
    ...        - Content: Your study report has been recalled for some reasons. Please contact the clinic for more detailed information.
    ...        - Back icon button. Tapping this button shall navigate the user to the previous screen.
    ...     4. Push noti in-app
    ...     5. Display laste study report
    [Tags]      BIOC-BIOTRES-REPORT-02     BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-REPORT-03: The report is marked as artifact
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The study is Completed
    ...
    ...     Test Steps:
    ...     1. Go to Call center mark as artifact report
    ...     2. Log in the app
    ...     3. On the Home tab, check the study report
    ...
    ...     Expected Output:
    ...     The study report display " Report unsucessfully..."
    [Tags]      BIOC-BIOTRES-REPORT-03     BIOC-2.1.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-REPORT-04: View the report after generating successfully and click View Report button
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Home screen
    ...     - The study report is generated successfully with comments and signature from Physician/Technician.
    ...
    ...     Test Steps:
    ...     1. Press on View Report button
    ...
    ...     Expected Output:
    ...     - The report study display after generating successfully and click View Report button
    [Tags]     BIOC-BIOTRES-REPORT-04        BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-REPORT-05: Sign in another account
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Home screen
    ...     - The study report is generated successfully with comments and signature from Physician/Technician.
    ...
    ...     Test Steps:
    ...     1. Press on Report generated successfully banner
    ...     2. Press on Back button
    ...     3. Sign out and sign in another account
    ...     4. Sing out and sign in old account
    ...
    ...     Expected Output:
    ...     1. Navigate user to the Study ID-XXXXXX
    ...     2. Navigate user to the Home screen
    ...     4. Report generated successfully banner display on Home screen
    [Tags]     BIOC-BIOTRES-REPORT-05        BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-REPORT-06: Sign in + Sign out 1 account
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The study report is generated successfully with comments and signature from Physician/Technician.
    ...     - The user is in Home screen
    ...
    ...     Test Steps:
    ...     1. Press on Report generated successfully banner
    ...     2. Press on Back button
    ...     3. Sign out and sign in
    ...
    ...     Expected Output:
    ...     2. Report generated successfully banner is disappeared
    ...     3. Report generated successfully banner no display again
    [Tags]     BIOC-BIOTRES-REPORT-06        BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOTRES-REPORT-07: Verify the report notification after click Back button when the device paired with app 
    [Documentation]     Author: Han Nguyen
    ...
    ...
    ...     Test Steps:
    ...     1. Click the Device tab
    ...     2. Click the Biotres
    ...     3. Input the Device id
    ...     4. Click Back button when the device paired with app
    ...     5. On the portal, stop study report
    ...     6. Generate the study report 
    ...     7. Sign in the study report
    ...     8. Check the notif on the app
    ...
    ...     Expected Output:
    ...     1. The app can't receive the notif study report
    [Tags]     BIOC-BIOTRES-REPORT-07        BIOC-1.22.0  manual  R2
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
