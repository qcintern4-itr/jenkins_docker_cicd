*** Settings ***
Documentation   Biocare app Devices test suite
Metadata    sid     BIOC-DEVICES
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-DEVICES    mapp
Test Timeout    1h

*** Test Cases ***
BIOC-DEVICES-01: View the Devices screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - There is no installed device
    ...
    ...     Test Steps:
    ...     1. Press on Devices tab
    ...     2. Press on Learn more button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Devices screen:
    ...        - Biotres device
    ...          + Connect device button
    ...        - Bioheart device
    ...          + Pair device button
    ...        - Blood Pressure Monitor
    ...          + Start measurement button
    ...        - Pulse Oximeter
    ...          + Start measurement button
    ...        - Thermometer
    ...          + Start measurement button
    ...        Learn more button for each device tab
    ...     2. Navigate the user to the website:
    ...        - Biotres: Clinics - Biotricity
    ...        - Bioheart: Individuals - Biotricity
    ...        - Blood Pressure: Patients - Biotricity
    ...        - Pulse Oximeter: Patients - Biotricity
    ...        - Thermometer: Patients - Biotricity
    [Tags]      BIOC-DEVICES-01     BIOC-1.22.0  manual  R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-02: Add other devices and reset the devices tab
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...
    ...     Test Steps:
    ...     1. Paired the Bioheart and Biokit Device
    ...     2. Signs out the app
    ...     3. Re-log in the app
    ...     4. Paired the Bioheart Device
    ...     5. Signs out the app
    ...     6. Log in with different account
    ...     7. Re-installs the app
    ...
    ...     Expected Output:
    ...     1. Devices tab screen shall be devided into 2 sections
    ...         - Installed devices: for all connected devices.
    ...         - Other devices: for all devices that have not been connected.
    ...        Regardless of the device's status, the order of devices in list never changes
    ...     3. The Devices tab screen shall be not reset
    ...     4. Bioheart Device on the Installed devices
    ...     6. The Devices tab screen shall be reset
    ...     7. The Devices tab screen shall be reset
    [Tags]      BIOC-DEVICES-02      BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-03: Remain devices
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...
    ...     Test Steps:
    ...     1. Press on Pair device button
    ...     2. Remove Bioheart Device
    ...     3. Press on Start measurement button
    ...
    ...     Expected Output:
    ...     1. Bioheart Device on the Installed devices
    ...     2. Bioheart Device back to the Other devices
    ...     3. Biokit devices shall always remain in Installed devices section
    [Tags]      BIOC-DEVICES-03      BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOTRES-01: View Biotres device card on Device screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...
    ...     Test Steps:
    ...     1. Press on Connect device button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Scan QR code screen
    ...        - Content: Please choose one of the methods below to connect to Biotres devices
    ...        - Scan QR code button
    ...        - Enter device ID button
    ...        - Enter Reference Code button
    [Tags]      BIOC-DEVICES-BIOTRES-01      BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOTRES-02: Scan QR code
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...
    ...     Test Steps:
    ...     1. Press on Scan QR code button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Scan QR code screen
    ...        - Content: Please choose one of the methods below to connect to Biotres devices
    ...        - Scan QR code button
    ...        - Enter device ID button
    [Tags]      BIOC-DEVICES-BIOTRES-02     BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOTRES-03: Allow Camera permission (IOS)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...
    ...     Test Steps:
    ...     1. Press on Connect device button
    ...     2. Press on Scan QR code button
    ...     3. Press on Cancel button
    ...     4. Press on Scan QR code button
    ...     5. Press on Open settings button
    ...
    ...     Expected Output:
    ...     2. Allow Camera permission modal displayed:
    ...        - Title: “Biocare Health” would like to access your Camera
    ...        - Content: Please enable Camera permissions in App Settings
    ...        - Open settings button
    ...        - Cancel button
    ...     3. Back to the Scan QR code screen
    ...     5. Navigate the user to the phone’s settings
    [Tags]      BIOC-DEVICES-BIOTRES-03     BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOTRES-04: Allow Camera, Bluetooth and Location Permission (Android)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...     - Turn off all permission
    ...     - Turn off Bluetooth
    ...
    ...     Test Steps:
    ...     1. Press on Connect device button
    ...     2. Press on Scan QR code button
    ...     3. Press on Cancel button
    ...     4. Press on Scan QR code button
    ...     5. Press on Open settings button
    ...     6. Allow Camera permission
    ...     7. Scan QR code
    ...     8. Allow Bluetooth permission
    ...     9. Scan QR code
    ...     10. Allow Location permission
    ...     11. Scan QR code
    ...     12. Turn on the Bluetooth
    ...     13. Scan QR code
    ...
    ...     Expected Output:
    ...     2. Allow Camera permission modal displayed:
    ...        - Title: “Biocare Health” would like to access your Camera
    ...        - Content: Please enable Camera permissions in App Settings
    ...        - Open settings button
    ...        - Cancel button
    ...     4. Allow Camera permission modal displayed
    ...     7. Allow Bluetooth Permission modal displayed:
    ...        - Title: "Biocare Health" would like to access your device's Bluetooth
    ...        - Content: Please enable the bluetooth permission in your phone's settings
    ...        - Open settings button
    ...        - Cancel button
    ...     9. Allow Location Permission modal displayed:
    ...        - Title: "Biocare Health" would like to access your device's location
    ...        - Content: Please enable the location permission in your phone's settings
    ...        - Open settings button
    ...        - Cancel button
    ...     11. Bluetooth is not available modal displayed:
    ...        - Title: Bluetooth is not available
    ...        - Content: To connect with Biotres, please anable Bluetooth in your phone's settings
    ...        - Go to settings button
    ...        - Cancel button
    ...     13. The user can connect device
    [Tags]      BIOC-DEVICES-BIOTRES-04     BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOTRES-05: No device found
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Scan QR code screen
    ...     - Make sure device turned off
    ...
    ...     Test Steps:
    ...     1. Scan QR code
    ...     2. Wait for 1 minute
    ...     3. Press on Try again button
    ...     4. Press on Back button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Connect device screen and connecting Biotres device
    ...     2. No device found, there shall be a screen displayed:
    ...        - Title: Biotres device not found
    ...        - Content: Please make sure the device is in a discoverable mode. If not, please turn the Biotres device on.
    ...        - Try again button
    ...        - Back button
    ...     3. The process shall start again
    ...     4. Back to the Scan QR code screen
    [Tags]      BIOC-DEVICES-BIOTRES-05     BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOTRES-06: Scan device successful (Ready for new study)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Scan QR code screen
    ...
    ...     Test Steps:
    ...     1. Scan QR code
    ...     2. Wait for connect device successful
    ...     3. After 3 seconds
    ...     4. Press on remove button
    ...     5. Press on Cancel button
    ...     6. Press on remove button
    ...     7. Press on Remove button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Connect device screen and connecting Biotres device
    ...     2. Popup Connect successfully modal shall appear:
    ...        - Title: Connect successfully
    ...        - Biotres – [Device ID]
    ...     3. The card consists of the following components:
    ...        - Title: Biotres
    ...        - [Device ID] – Connected/Disconnected
    ...        - Text: Ready for a new study
    ...        - Remove button
    ...     4. The modal Remove Biotres will be displayed:
    ...        - Title: Remove Biotres
    ...        - Content: Are you sure you wish to remove the device?
    ...        - Remove button.
    ...        - Cancel button.
    ...     5. Close the modal
    ...     7. Remove the device and close the modal
    ...        - Message: Remove device successfully
    [Tags]      BIOC-DEVICES-BIOTRES-06     BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOTRES-07: Scan device successful (Studing)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Scan QR code screen
    ...
    ...     Test Steps:
    ...     1. Scan QR code
    ...     2. Wait for connect device successful
    ...     3. Press on View study now button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Connect device screen and connecting Biotres device
    ...     2. Connect successfully modal shall appear:
    ...        - Title: Connect successfully
    ...        - Biotres – [Device ID]
    ...        - View study now button
    ...        - Close button
    ...     3. Navigate the user to the Biotres study detail screen
    [Tags]      BIOC-DEVICES-BIOTRES-07     BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOTRES-08: Enter device ID
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...
    ...     Test Steps:
    ...     1. Press on Enter device ID button
    ...     2. Input invalid serial number
    ...     3. Enter valid device ID
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Enter device ID screen:
    ...        - Content: Please enter serial number printed on the back of your device.
    ...        - Text input field for user to enter their serial device number
    ...        - Serial device number consists of 10 digits and commence with '12' for Biotres or '13' for Biotres Pro
    ...        - Check button
    ...     2. The outline of Input device ID section shall change to red
    ...        - Message: “Invalid serial number”
    ...     3. Navigate the user to Connect device screen
    [Tags]      BIOC-DEVICES-BIOTRES-08     BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOTRES-09: Enter device ID when turn off bluetooth
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Enter device ID screen
    ...
    ...     Test Steps:
    ...     1. Enter valid device ID
    ...     2. Press on check button
    ...
    ...     Expected Output:
    ...     2. Bluetooth is not available modal displayed:
    ...        - Title: Bluetooth is not available
    ...        - Content: To connect with Biotres, please anable Bluetooth in your phone's settings
    ...        - Go to settings button
    ...        - Cancel button
    [Tags]      BIOC-DEVICES-BIOTRES-09     BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOTRES-10: Enter device ID when turn off Internet
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Enter device ID screen
    ...
    ...     Test Steps:
    ...     1. Enter valid device ID
    ...     2. Press on check button
    ...
    ...     Expected Output:
    ...     2. Failed to connect device modal displayed:
    ...        - Title: Failed to connect device
    ...        - Content: Please check your network connection and try again
    ...        - Try again button
    ...        - Cancel button
    [Tags]      BIOC-DEVICES-BIOTRES-10     BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOTRES-11: Enter Reference Code
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...     - The study is started
    ...
    ...     Test Steps:
    ...     1. Press on Connect device button
    ...     2. Press on Enter Reference Code button
    ...     3. Enter correct study code or the correct study information
    ...     4. Press on Submit button
    ...
    ...     Expected Output:
    ...     3. Monitor study screen will be displayed
    ...     4. Navigate the user to Study details screen
    [Tags]      BIOC-DEVICES-BIOTRES-11         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOTRES-12: Enter wrong values
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Monitor study screen
    ...     - The study is started
    ...
    ...     Test Steps:
    ...     1. Leave blank all fields or any field
    ...     2. Press on Submit button
    ...     3. Enter both the Study code and Study info incorrectly
    ...     4. Press on Contact support button
    ...
    ...     Expected Output:
    ...     2. There is message "Please enter study code or you can enter registered information to start monitoring study" and empty fields text bar's outline will change to red
    ...     3. The modal is displayed
    ...        - Title: No study found
    ...        - Content: There is no study that matches your inputted data. Please check and try again!
    ...        - Contact support button
    ...        - Close button. Tapping this button to close the modal
    ...     4. Open the Send feedback bottom sheet
    [Tags]      BIOC-DEVICES-BIOTRES-12         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOTRES-13: Enter invalid study code
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Monitor study screen
    ...
    ...     Test Steps:
    ...     1. Enter less than 6 characters and submit
    ...     2. Enter wrong study code and submit
    ...     3. Enter completed study’s verification code and submit
    ...     4. Press Okay button
    ...     5. Enters an incorrect study code > 5 times
    ...     6. Press Okay button
    ...
    ...     Expected Output:
    ...     1. There is message "6-character code is required." and all fields text bar's outline will change to red
    ...     2. There is message "There is no study matching this code. Please check the code received then try again!" and all fields text bar's outline will change to red
    ...     3. The modal is displayed
    ...        - Title: Completed study
    ...        - Content: Your study has been completed successfully
    ...        - Okay button
    ...     4. Close the modal
    ...     5. The modal is displayed
    ...        - Title: Too many attempts
    ...        - Content: Please try again in a few minutes!
    ...        - Okay button
    ...     6. Close the modal
    [Tags]      BIOC-DEVICES-BIOTRES-13         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOTRES-14: Enter code of the study that has not been started
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Monitor study screen
    ...
    ...     Test Steps:
    ...     1. Enter code of the study that has not been started
    ...     2. Press on Submit button
    ...
    ...     Expected Output:
    ...     2. There is message "This study has not been started. Please ask your clinician to help you start the study then try again!" and all fields text bar's outline will change to red
    [Tags]      BIOC-DEVICES-BIOTRES-14         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOTRES-15: Enter registered information that has not been started
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Monitor study screen
    ...
    ...     Test Steps:
    ...     1. Enter registered information that has not been started
    ...     2. Press on Submit button
    ...
    ...     Expected Output:
    ...     2. The modal is displayed
    ...        - Title: This study has not been started
    ...        - Content: Please ask your clinician to help you start the study then try again!
    ...        - Okay button
    [Tags]      BIOC-DEVICES-BIOTRES-15         BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOTRES-16: Enter invaled registered information
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Monitor study screen
    ...
    ...     Test Steps:
    ...     1. Enter registered information and doesn’t input one or two fields
    ...     2. Press on Submit button
    ...     3. Enter incorrect study information
    ...
    ...     Expected Output:
    ...     2. There is message "This field is required" and all fields text bar's outline will change to red
    ...     3. The modal is displayed
    ...        - Title: No study found
    ...        - Content: There is no study that matches your inputted data. Please check and try again!
    ...        - Contact support button
    ...        - Close button. Tapping this button to close the modal
    [Tags]      BIOC-DEVICES-BIOTRES-16         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOTRES-17: Submit info when the internet is disconnected
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Monitor study screen
    ...     - The Internet is disconnected
    ...
    ...     Test Steps:
    ...     1. Press on Submit button
    ...     2. Press on Resend code button
    ...     3. Press on Send button
    ...
    ...     Expected Output:
    ...     1. There is message "No Internet connection. Please try again"
    ...     3. There is message "No Internet connection. Please try again"
    [Tags]      BIOC-DEVICES-BIOTRES-17         BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOTRES-18: Resend code
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Monitor study screen
    ...
    ...     Test Steps:
    ...     1. Press on Resend code button
    ...     2. Delete phone number
    ...     3. Press send button
    ...     4. Enter invalid phone number
    ...     5. Press send button
    ...     6. Enter valid phone number
    ...     7. Press send button
    ...
    ...     Expected Output:
    ...     1. Navigate user to the Enter phone number screen
    ...     3. There is message "This field cannot be empty" and all fields text bar's outline will change to red
    ...     5. There is message "Invalid phone number" and all fields text bar's outline will change to red
    ...     7. The system shall send a new code by SMS to the inputted phone number
    ...        - Navigate to the previous screen
    [Tags]      BIOC-DEVICES-BIOTRES-18         BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOTRES-19: Connect Biotres device while monitoring Bioflux study
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...
    ...     Test Steps:
    ...     1. Press on Connect device button
    ...     2. Press on Cancel button
    ...     3. Press on Connect device button
    ...     4. Press on Go to Bioflux study button
    ...     5. Press on Back button
    ...     6. Press on Devices tab
    ...     7. Press on Connect device button
    ...     8. Press on Go to Bioflux study button
    ...     9. Press on Leave monitoring button
    ...     10. Press on Leave button
    ...
    ...     Expected Output:
    ...     1. Modal shall be displayed
    ...        - Title: Could not connect
    ...        - Content: You are currently following the Bioflux study. To connect to Biotres, you need to leave monitoring this study.
    ...        - Go to Bioflux study button
    ...        - Cancel button
    ...     2. Modal shall be closed
    ...     4. Navigate the user to Bioflux study details screen
    ...     5. Navigate the user to the Services screen
    ...     10. Navigate the user to the Services screen
    [Tags]      BIOC-DEVICES-BIOTRES-19      BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOTRES-20: Connecting Biotres device (Only for don't have program)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...     - Connecting Biotres device
    ...
    ...     Test Steps:
    ...     1. Press on Enter Reference Code button
    ...     2. Press on Cancel button
    ...     3. Press on Enter Reference Code button
    ...     4. Press on Remove button
    ...
    ...     Expected Output:
    ...     1. Modal shall be displayed
    ...        - Title: Could not start monitoring
    ...        - Content: The clinic is setting up a new study with Biotres. To start monitoring another study, you need to remove the connecting Biotres.
    ...                   Would you like to proceed with this action now?
    ...        - Remove button
    ...        - Cancel button
    ...     2. Modal shall be closed
    ...     4. Remove the device and close the modal
    ...        - Message: Remove device successfully
    [Tags]      BIOC-DEVICES-BIOTRES-20     BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOHEART-01: Bioheart device has not been connected to your Biocare Health app
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...
    ...     Test Steps:
    ...     1. Press on Pair device button
    ...
    ...     Expected Output:
    ...     1. Navigate to the pair device screen: refer To BIOC-SRS-17-FRS-01
    [Tags]      BIOC-DEVICES-BIOHEART-01      BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOHEART-02: Bioheart device has been connected to your Biocare Health app
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...     - Bioheart is connected
    ...
    ...     Test Steps:
    ...     1. Viasully Bioheart card
    ...     2. Press on View detail button
    ...
    ...     Expected Output:
    ...     1. - Tittle: Bioheart
    ...        - Online icon + Connected
    ...        - Battery level
    ...          + Format: [number]%
    ...          + Charging: [number]%
    ...        - Contact status
    ...          + Good contact
    ...          + Bad contact
    ...        - View detail button
    ...     2. Navigate the user to View Bioheart information screen: refer to BIOC-SRS-17-FRS-03
    [Tags]      BIOC-DEVICES-BIOHEART-02      BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOHEART-03: Bioheart device is disconnected
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...     - Bioheart is disconnected
    ...
    ...     Test Steps:
    ...     1. Viasully Bioheart card
    ...     2. Press on View detail button
    ...
    ...     Expected Output:
    ...     1. - Tittle: Bioheart
    ...        - Offline icon
    ...        - Disconnected <last connected time>
    ...          + The last connected time shall be displayed:
    ...            0s < last connected time < 1min, display: “Just now”.
    ...            1min <= last connected time < 1h, display: “[number] m ago”.
    ...            1h <= last connected time < 24h, display: “[number] h ago”.
    ...            24h <= last connected time < 7 days, display: “[number] day(s) ago”.
    ...            >=7 days, display: “mm/dd/yyyy”
    ...        - View detail button
    ...     2. Navigate the user to View Bioheart information screen: refer to BIOC-SRS-17-FRS-03
    [Tags]      BIOC-DEVICES-BIOHEART-03      BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOHEART-04: Attention alert above the Bioheart card
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user has selected the Bioheart device.
    ...     - The study is started.
    ...
    ...     Test Steps:
    ...     1. Viasully Bioheart card
    ...     2. Turn off Bluetooth
    ...     3. Press on the Settings button
    ...     4. Remove any lead
    ...     5. Press on the Guide button
    ...
    ...     Expected Output:
    ...     2. Bluetooth is offline
    ...        - Message: Bluetooth is turned off
    ...        - Settings button
    ...     3. Navigate the user to the settings of the phone
    ...     4. Bad contact
    ...        - Message: Attention! Bad contact
    ...        - Guide button
    ...     5. Navigate the user to the How-to guides.
    [Tags]      BIOC-DEVICES-BIOHEART-04      BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOKIT-01: View the first time click on Blood pressure monitor card
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...     - Turn off Bluetooth
    ...
    ...     Test Steps:
    ...     1. Press on Start measurement button
    ...     2. Press on Cancel button
    ...     3. Press on Start measurement button
    ...     4. Press on Go to settings button
    ...
    ...     Expected Output:
    ...     1. A popup saying “Bluetooth is not available” will appear:
    ...        - Go to settings button
    ...        - Cancel button
    ...     2. Back the users to the Devices screen
    ...     4. Open the settings on the user’s phone
    [Tags]      BIOC-DEVICES-BIOKIT-01      BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOKIT-02: No Bluetooth permission
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...
    ...     Test Steps:
    ...     1. Press on Start measurement button
    ...     2. Press on Close button
    ...     3. Press on Start measurement button
    ...     4. Press on Go to settings button
    ...
    ...     Expected Output:
    ...     1. Popup asking permission to access the phone’s Bluetooth shall be displayed
    ...        - Title: "Biocare health" would like to access your device's Bluetooth
    ...        - Message: Please enable the Bluetooth permission on your phone's settings
    ...        - Go to settings button
    ...        - Cancel button
    ...     2. Back the users to the Devices screen
    ...     4. Open the permission page of Biocare app in the phone’s settings
    [Tags]      BIOC-DEVICES-BIOKIT-02     BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOKIT-03: Pair Blood pressure device (Step 1)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...     - The Bluetooth is on
    ...
    ...     Test Steps:
    ...     1. Press on Start measurement button
    ...     2. Press on Exit button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Blood pressure measurement screen:
    ...        - Title: Blood pressure
    ...        - Message: How to take a measurement
    ...          + Step 1 Make sure Bluetooth is on: status “checked”
    ...          + Step 2 Turn on your device: status “unchecked”
    ...          + Step 3 Take measurement: status “unchecked”
    ...        - Illustration that corresponds to the instruction step
    ...        - View guide: Taps on this will show the corresponding guide to the step that users are at.
    ...        - Exit button
    ...     2. Return users to the Devices screen
    [Tags]      BIOC-DEVICES-BIOKIT-03      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOKIT-04: No device found when pair Blood pressure device (Step 1)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...     - The Bluetooth is on
    ...
    ...     Test Steps:
    ...     1. Press on Start measurement button
    ...     2. Waiting more 30 seconds
    ...     3. Press on Close button
    ...     4. Press on Start measurement button
    ...     5. Waiting more 30 seconds
    ...     6. Press on Troubleshoot button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Blood pressure measurement screen
    ...     2. Popup "No device found" shall be display:
    ...        - Message: Please make sure the device is turned on and nearby.
    ...        - Troubleshoot button
    ...        - Close button
    ...     3. Popup will be closed
    ...     6. Troubleshooting tips screen will be displayed
    [Tags]      BIOC-DEVICES-BIOKIT-04      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOKIT-05: Pair Blood pressure device (Step 2)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...     - The Bluetooth is on
    ...
    ...     Test Steps:
    ...     1. Press on Start measurement button
    ...     2. Press power button on deivce to turned on the Blood pressure device
    ...
    ...     Expected Output:
    ...     2. - Popup connect successful shall be displayed (The time out for this popup is 3s)
    ...          + Device name: Blood Pressure Monitor
    ...          + Device ID (ex: Biokit1022070001)
    ...        - The status of step 2 will change to “checked”
    ...        - 2 options shall be displayed:
    ...          + Title: Select your measurement method
    ...            * Single measurement with Start button: Measure one time
    ...            * Triplicate measurement with Start button: Measure three times consecutively to obtain an average
    [Tags]      BIOC-DEVICES-BIOKIT-05      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOKIT-06: No device found when pair Blood pressure device (Step 2)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen.
    ...     - The Bluetooth is on.
    ...
    ...     Test Steps:
    ...     1. Press on Start measurement button
    ...     2. Press power button on deivce to turned on the Blood pressure device
    ...     3. Waiting more 1 minute
    ...     4. Press on Close button
    ...     5. Press on Start measurement button
    ...     6. Press power button on deivce to turned on the Blood pressure device
    ...     7. Waiting more 1 minute
    ...     8. Press on Troubleshoot button
    ...
    ...     Expected Output:
    ...     3. Popup "No device found" shall be displayed:
    ...        - Message: Please make sure the device is turned on and nearby.
    ...        - Troubleshoot button
    ...        - Close button
    ...     4. Return the users to the instruction – step 1 screen
    ...     7. Popup "No device found" shall be displayed
    ...     8. Troubleshooting tips screen shall be displayed
    [Tags]      BIOC-DEVICES-BIOKIT-06      BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOKIT-07: Start the Single Measurement process
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Blood pressure screen (Done step 1,2)
    ...     - The Bluetooth is on
    ...
    ...     Test Steps:
    ...     1. Select Start button on the Single Measurement card
    ...     2. Successfully receives reading data from the device
    ...     3. Press on Repeat button
    ...     4. Successfully receives reading data from the device
    ...     5. Press on Exit button
    ...     6. Press on Stay button
    ...     7. Press on Exit button
    ...     8. Press on Leave button
    ...     9. Select Start button on the Single Measurement card
    ...     10. Successfully receives reading data from the device
    ...     11. Press on Save button
    ...
    ...     Expected Output:
    ...     1. The Biokit device will start to measure:
    ...        - Measuring loading
    ...        - Connected Biokit device ID
    ...        - A warning: The device is taking a measurement. Please DO NOT press the power button.
    ...     2. The result screen will appear:
    ...        - Blood pressure reading result (mmHg)
    ...        - Heart rate reading result (bpm)
    ...        - Measured time
    ...        - Connected Biokit device ID
    ...        - Text: If the results are questionable, repeat the process.
    ...        - Repeat button
    ...        - Exit button
    ...        - Save button
    ...     3. The measuring process wil start again
    ...     5. Pop up Exit will appear:
    ...        - Title: Are you sure you want to leave? Your data will not be saved.
    ...        - Leave button
    ...        - Stay button
    ...     6. Pop up Exit will dissappear
    ...     8. Return the users to the Devices screen without saving the inputted information
    ...     11. Back to the Devices screen and the modal shall appear:
    ...         - Tittle: Measurement result has been saved
    ...         - Message: “Now you can view it inside the Summary”
    ...         - Go to Summary button. Tapping this button shall navigate the user to the Summary screen on the current date.
    ...         - Not now button. Tapping this button shall navigate the user to the View the device screen.
    [Tags]      BIOC-DEVICES-BIOKIT-07      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOKIT-08: Start the Single Measurement process when internet no connection
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Blood pressure screen (Done step 1,2)
    ...     - The Bluetooth is on
    ...     - The Internet is off
    ...
    ...     Test Steps:
    ...     1. Select Start button on the Single Measurement card
    ...     2. Successfully receives reading data from the device
    ...     3. Press on Save button
    ...     4. Press on Exit button
    ...     5. Press on Leave button
    ...
    ...     Expected Output:
    ...     1. The Biokit device will start to measure
    ...     2. The result screen will appear
    ...     3. Popup "No Internet connection. Please try again" will display
    ...     4. Pop up Exit will appear
    ...     5. Return the users to the Devices screen without saving the inputted information
    [Tags]      BIOC-DEVICES-BIOKIT-08      BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOKIT-09: Single measurement failed (Blood pressure)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Blood pressure screen (Done step 1,2)
    ...     - The Bluetooth is on
    ...
    ...     Test Steps:
    ...     1. Select Start button on the Single Measurement card
    ...     2. Make fail to measure
    ...     3. Press on Try again button
    ...     4. Make fail to measure
    ...     5. Press on Cancel button
    ...
    ...     Expected Output:
    ...     1. The Biokit device will start to measure
    ...     2. A measuring failed popup will appear:
    ...        - Title: Measuring failed
    ...        - Message: Something went wrong with your measurement.
    ...        - Try again button
    ...        - Cancel button
    ...     3. The measurement process will start again
    ...     5. The users will be returned to the instruction – step 3 screen
    [Tags]      BIOC-DEVICES-BIOKIT-09      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOKIT-10: Start the Triplicate Measurement process on Blood pressure device
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...     - The Bluetooth is on
    ...     - Done step 1,2
    ...
    ...     Test Steps:
    ...     1. Select Start button on the Triplicate Measurement card
    ...     2. Successfully receives reading data from the device (l1)
    ...     3. Successfully receives reading data from the device (l2)
    ...     4. Successfully receives reading data from the device (l3)
    ...     5. Successfully receives reading data from the device
    ...     6. Press on Save button
    ...
    ...     Expected Output:
    ...     1. The Biokit device will start to measure 3 times:
    ...        - Measuring loading
    ...        - Number of the current measurement step
    ...        - Connected Biokit device ID
    ...        - Measurement results section: Show the status and result of each measurement
    ...        - A warning: The device is taking a measurement. Please DO NOT press the power button.
    ...     2. Measurement results section 1
    ...     3. Measurement results section 2
    ...     4. Measurement results section 3
    ...     5. The result screen will appear:
    ...        - Average blood pressure reading result (mmHg)
    ...        - Average heart rate reading result (bpm)
    ...        - Measured time
    ...        - Connected Biokit device ID
    ...        - Measurement results: Shows reading data of each measured time
    ...        - Text: If the results are questionable, repeat the process.
    ...        - Repeat button
    ...        - Exit button
    ...        - Save button
    ...     3. The measuring process wil start again
    ...     5. Pop up Exit will appear:
    ...        - Title: Are you sure you want to leave? Your data will not be saved.
    ...        - Leave button
    ...        - Stay button
    ...     6. Back to the Devices screen and the modal shall appear:
    ...        - Tittle: Measurement result has been saved
    ...        - Message: “Now you can view it inside the Summary”
    ...        - Go to Summary button. Tapping this button shall navigate the user to the Summary screen on the current date.
    ...        - Not now button. Tapping this button shall navigate the user to the View the device screen.
    [Tags]      BIOC-DEVICES-BIOKIT-10      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOKIT-11: Start Triplicate Measurement failed
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...     - The Bluetooth is on
    ...     - Done step 1,2
    ...
    ...     Test Steps:
    ...     1. Select Start button on the Triplicate Measurement card
    ...     2. Make measuring failed
    ...     3. Press on Retry
    ...
    ...     Expected Output:
    ...     2. The Biokit device will start to measure 3 times:
    ...        - Measuring loading
    ...        - Number of the current measurement step
    ...        - Connected Biokit device ID
    ...        - Measurement results section:
    ...          + Retry    No Data
    ...          + 2        - mmHg
    ...          + 3        - mmHg
    ...        - A warning: The device is taking a measurement. Please DO NOT press the power button.
    [Tags]      BIOC-DEVICES-BIOKIT-11      BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOKIT-12: Pulse Oximeter card
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...     - Turn off Bluetooth
    ...
    ...     Test Steps:
    ...     1. Press on Start measurement button
    ...     2. Press on Cancel button
    ...     3. Press on Start measurement button
    ...     4. Press on Go to settings button
    ...
    ...     Expected Output:
    ...     1. Popup saying “Bluetooth is not available” will appear:
    ...        - Message: To connect with Biokit device, please enable Bluetooth in your phone's settings.
    ...        - Go to settings button
    ...        - Cancel button
    ...     2. Back the users to the Devices screen
    ...     4. Open the settings on the user’s phone
    [Tags]      BIOC-DEVICES-BIOKIT-12      BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOKIT-13: Pair Pulse Oximeter device
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...     - The Bluetooth is on
    ...
    ...     Test Steps:
    ...     1. Press on Start measurement button
    ...     2. Press on Close button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Blood oxygen measurement screen:
    ...        - Step 1 Make sure Bluetooth is on: status “checked”
    ...        - Step 2 Turn on your device: status “unchecked”
    ...        - Step 3 Take measurement: status “unchecked”
    ...        - Illustration that corresponds to the instruction step
    ...        - View guide: Taps on this will show the corresponding guide to the step that users are at
    ...        - Exit button
    ...     2. Return users to the Devices screen
    [Tags]      BIOC-DEVICES-BIOKIT-13      BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOKIT-14: Press power button on the Pulse Oximeter device
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen.
    ...     - The Bluetooth is on.
    ...
    ...     Test Steps:
    ...     1. Press on Start measurement button
    ...     2. Press power button on deivce to turned on the Biokit device
    ...     3. Waiting for measuring done
    ...     4. Press on Close button
    ...     5. Press on Stay button
    ...     6. Press on Close button
    ...     7. Press on Leave button
    ...     8. Press on Start measurement button
    ...     9. Press power button on deivce to turned on the Biokit device
    ...     10. Waiting for measuring done
    ...     11. Press on Save button
    ...
    ...     Expected Output:
    ...     2. The status of step 2 will change to “checked”
    ...        - Shows the successful popup with the information below. The time out for this popup is 3s.
    ...          + Device name: Pulse Oximeter
    ...          + Device ID (ex: Biokit1022070001)
    ...     3. The result screen will appear:
    ...        - Blood oxygen reading result (%)
    ...        - Heart rate reading result (bpm)
    ...        - Measured time
    ...        - Connected Biokit device ID
    ...        - Repeat button: If the results are questionable, repeat the process.
    ...        - Save button
    ...     4. Pop up Exit will appear:
    ...        - Title: Are you sure you want to leave? Your data will not be saved.
    ...        - Leave button
    ...        - Stay button
    ...     5. Popup will disappear
    ...     7. Return the users to the Devices screen without saving the inputted information
    ...     11. Back to the Devices screen and the modal shall appear:
    ...         - Tittle: Measurement result has been saved
    ...         - Message: “Now you can view it inside the Summary”
    ...         - Go to Summary button. Tapping this button shall navigate the user to the Summary screen on the current date.
    ...         - Not now button. Tapping this button shall navigate the user to the View the device screen.
    [Tags]      BIOC-DEVICES-BIOKIT-14      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOKIT-15: Check step 2 when users haven’t turned on the Pulse Oximeter device
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen.
    ...     - The Bluetooth is on.
    ...
    ...     Test Steps:
    ...     1. Press on Start measurement button
    ...     2. The time out for this popup is 30s
    ...
    ...     Expected Output:
    ...     1. Popup saying “No device found” will appear:
    ...        - Troubleshoot: Taps this button will display the troubleshooting tips screen
    ...        - Close button: The exit button on that screen will return the users to the instruction – step 1 screen
    [Tags]      BIOC-DEVICES-BIOKIT-15      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOKIT-16: Start measurement failed (Blood Oxygen)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Blood Oxygen screen (Done step 1,2)
    ...     - The Bluetooth is on
    ...
    ...     Test Steps:
    ...     1. Make fail to measure
    ...     2. Press on Try again button
    ...     3. Make fail to measure
    ...     4. Press on Cancel button
    ...
    ...     Expected Output:
    ...     1. A measuring failed popup will appear:
    ...        - Title: Measuring failed
    ...        - Message: Something went wrong with your measurement.
    ...        - Try again button
    ...        - Cancel button
    ...     2. The measurement process will start again
    ...     4. The users will be returned to the instruction – step 3 screen
    [Tags]      BIOC-DEVICES-BIOKIT-16      BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOKIT-17: Thermometer card
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...     - Turn off Bluetooth
    ...
    ...     Test Steps:
    ...     1. Press on the Start measurement button
    ...     2. Press on Cancel button
    ...     3. Press on Start measurement button
    ...     4. Press on Go to settings button
    ...
    ...     Expected Output:
    ...     1. Popup saying “Bluetooth is not available” will appear:
    ...        - Message: To connect with Biokit device, please enable Bluetooth in your phone's settings.
    ...        - Go to settings button
    ...        - Cancel button
    ...     2. Back the users to the Devices screen
    ...     4. Open the settings on the user’s phone
    [Tags]      BIOC-DEVICES-BIOKIT-17      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOKIT-18: Pair Thermometer device
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...     - The Bluetooth is on
    ...
    ...     Test Steps:
    ...     1. Press on the Start measurement button
    ...     2. Press on Close button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Body temperature measurement screen:
    ...        - Step 1 Make sure Bluetooth is on: status “checked”
    ...        - Step 2 Turn on your device: status “unchecked”
    ...        - Step 3 Take measurement: status “unchecked”
    ...        - Illustration that corresponds to the instruction step
    ...        - View guide: Taps on this will show the corresponding guide to the step that users are at
    ...        - Close button
    ...     2. Return users to the Devices screen
    [Tags]      BIOC-DEVICES-BIOKIT-18      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOKIT-19: Press power button on the Thermometer device
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...     - The Bluetooth is on
    ...
    ...     Test Steps:
    ...     1. Press on Start measurement button
    ...     2. Press power button on deivce to turned on the Biokit device
    ...     3. Press power button on deivce to start measurement
    ...     4. Waiting for measuring done
    ...     5. Press on Close button
    ...     6. Press on Stay button
    ...     7. Press on Close button
    ...     8. Press on Leave button
    ...     9. Press on Start measurement button
    ...     10. Press power button on deivce to turned on the Biokit device
    ...     11. Waiting for measuring done
    ...     12. Press on Save button
    ...
    ...     Expected Output:
    ...     2. The status of step 2 will change to “checked”
    ...        - Shows the successful popup with the information below. The time out for this popup is 3s.
    ...          + Device name: Pulse Oximeter
    ...          + Device ID (ex: Biokit1022070001)
    ...     4. The result screen will appear:
    ...        - Body temperature (°C or °F)
    ...        - Measured time
    ...        - Connected Biokit device ID
    ...        - Repeat button: If the results are questionable, repeat the process.
    ...        - Save button
    ...     5. Pop up Exit will appear:
    ...        - Title: Are you sure you want to leave? Your data will not be saved.
    ...        - Leave button
    ...        - Stay button
    ...     6. Popup will disappear
    ...     8. Return the users to the Devices screen without saving the inputted information
    ...     12. Back to the Devices screen and the modal shall appear:
    ...         - Tittle: Measurement result has been saved
    ...         - Message: “Now you can view it inside the Summary”
    ...         - Go to Summary button. Tapping this button shall navigate the user to the Summary screen on the current date.
    ...         - Not now button. Tapping this button shall navigate the user to the View the device screen.
    [Tags]      BIOC-DEVICES-BIOKIT-19      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOKIT-20: Check step 2 when users haven’t turned on the Thermometer device
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Devices screen
    ...     - The Bluetooth is on
    ...
    ...     Test Steps:
    ...     1. Press on Start measurement button
    ...     2. The time out for this popup is 30s
    ...
    ...     Expected Output:
    ...     1. Popup saying “No device found” will appear:
    ...        - Troubleshoot: Taps this button will display the troubleshooting tips screen
    ...        - Close button: The exit button on that screen will return the users to the instruction – step 1 screen
    [Tags]      BIOC-DEVICES-BIOKIT-20      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DEVICES-BIOKIT-21: Start measurement failed (Body temperature)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Body temperature screen (Done step 1,2)
    ...     - The Bluetooth is on
    ...
    ...     Test Steps:
    ...     1. Make fail to measure
    ...     2. Press on Try again button
    ...     3. Make fail to measure
    ...     4. Press on Cancel button
    ...
    ...     Expected Output:
    ...     1. A measuring failed popup will appear:
    ...        - Title: Measuring failed
    ...        - Message: Something went wrong with your measurement.
    ...        - Try again button
    ...        - Cancel button
    ...     2. The measurement process will start again
    ...     4. The users will be returned to the instruction – step 3 screen
    [Tags]      BIOC-DEVICES-BIOKIT-21      BIOC-1.22.0  manual  R1
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
