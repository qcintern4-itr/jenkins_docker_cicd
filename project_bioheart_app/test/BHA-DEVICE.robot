*** Settings ***
Documentation   Bioheart app Device test suite
Metadata    sid     BHA-DEVICE
Metadata    owner   Linh Tran
Library     corelib/AssertionExtension.py

Force Tags      BHA-DEVICE        mapp
Test Timeout    1h

*** Test Cases ***
BHA-DEVICE-01: View device information
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - There is at least one Bioheart device added to the app.
    ...     - The Bioheart device is connected to the app via Bluetooth
    ...
    ...     Test Steps:
    ...    - Press on Device tab
    ...
    ...     Expected Output:
    ...    - Navigate to Device screen
    ...    - The following components shall be displayed on the screen
    ...         + Bioheart ID
    ...         + Bluetooth connection status
    ...         + Battery status: including battery level and charging status.
    ...             * Whether the battery is being charged or the battery is discharging
    ...                  If the battery is discharging, the app shall display the estimated remaining operation time of the Bioheart device.
    ...                  If the battery is being charged, the app shall not display the estimated remaining time until the Bioheart device is fully charged
    ...             * If the Bioheart device has a charger connected when it is powered off, when the device is turned on (still has a charger connected), battery level and the remaining time until fully charged shall not be displayed. The user has to unplug the charger for the battery level information to be displayed
    ...         + Body contact: electrode contact status, can be Good or Bad
    ...         + Firmware update
    ...         + Remove Bioheart device
    ...         + When the Bioheart device is Disconnected, the status information of the device, including Body Contact and Battery shall be cleared to “--”.
    [Tags]      BHA-DEVICE-01       BIOH-SRS-05-FRS-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-DEVICE-02: Remove Bioheart device
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - There is at least one Bioheart device added to the app.
    ...     - The Bioheart device is connected to the app via Bluetooth
    ...     - The user is in Device screen
    ...
    ...     Test Steps:
    ...    - Press on Remove Bioheart button
    ...
    ...     Expected Output:
    ...    - The app shall display a dialog with a question on it stating, “Are you sure you want to remove the device?”, and Remove/Cancel buttons
    ...         + When pressed “Remove”, the user shall be navigated back to the Summary screen and Bioheart device will be disassociated from the app.
    ...         + When pressed “Cancel”, the user shall remain on the “Device information” screen
    [Tags]      BHA-DEVICE-02       BIOH-SRS-05-FRS-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-DEVICE-03: Update firmware manually when the user has signed in to the app
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user has signed in to the app
    ...     - Once Bioheart has a new Firmware version, the mobile phone shall receive the notification from the app
    ...
    ...     Test Steps:
    ...    - Press on notification
    ...
    ...     Expected Output:
    ...    - If the device is off then no event happens
    ...    - If the device is on, the user shall be navigated to the “New Update” screen
    [Tags]      BHA-DEVICE-03       BIOH-SRS-05-FRS-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-DEVICE-04: Update firmware manually when the user is in te Firmware Update screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Device screen
    ...
    ...     Test Steps:
    ...    - Press on Firmware update button
    ...    - Press on Check for update button
    ...
    ...     Expected Output:
    ...    - In case, the firmware is latest
    ...         + There is message "You're up to date"
    ...    - In case, the firmware is not latest
    ...         + User can update firmware by pressing on Update Now button or update later by pressing on Later button
    ...    - User can navigate back previous screen by press on back button
    [Tags]      BHA-DEVICE-04       BIOH-SRS-05-FRS-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-DEVICE-05: Update firmware when battery level is low
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Device screen
    ...
    ...     Test Steps:
    ...    - Press on Firmware update button
    ...    - Press on Check for update button
    ...
    ...     Expected Output:
    ...    - There is a low battery popup
    ...         + In case, battery level is under 20%
    ...             * User cannot update firmware and must charge battery to at least 20% to start updating FW
    ...         + In case, battery level is under 40% and upper 20%
    ...             * User can update firmware but must charge battery
    ...    - Press on Got it button to close the popup
    [Tags]      BHA-DEVICE-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-DEVICE-06: Inform user on new firmware update
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...    - Press on notification
    ...
    ...     Expected Output:
    ...    - The app shall perform checking for new update automatically to display the information of the update to the user.
    [Tags]      BHA-DEVICE-06       BIOH-SRS-05-FRS-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-DEVICE-07: Scan and connect device successfully
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - There is no Bioheart device currently added to the app
    ...     - The user is in Force pair device screen
    ...
    ...     Test Steps:
    ...    - Press on Pair now button
    ...    - Press on Tap to connect button
    ...
    ...     Expected Output:
    ...    - Pair device successfully
    ...    - Once paired, the app shall remember the device until the device is removed from the app
    ...    - The app can only have one device added at a time. The user has to remove the current device in order to pair it with a new one
    [Tags]      BHA-DEVICE-07       BIOH-SRS-05-FRS-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-DEVICE-08: Scan and connect device failed
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - There is no Bioheart device currently added to the app
    ...     - The user is in Force pair device screen
    ...
    ...     Test Steps:
    ...    - Press on Pair now button
    ...    - Press on Tap to connect button
    ...
    ...     Expected Output:
    ...    - The app shall display a message “Connect Failed” and the “*Retry/Cancel*” buttons.
    ...         + If the user taps on the “Retry” button the app shall start finding the device to pair again
    ...         + If the user taps on the “Cancel” button the app shall navigate the user back to the Dashboard screen
    [Tags]      BHA-DEVICE-08       BIOH-SRS-05-FRS-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-DEVICE-09: Scan and connect device when the device is already paired with another phone
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - There is no Bioheart device currently added to the app
    ...     - The user is in Force pair device screen
    ...     - The device is already paired with another phone
    ...
    ...     Test Steps:
    ...    - Press on Pair now button
    ...    - Press on Tap to connect button
    ...
    ...     Expected Output:
    ...    - The app shall display a message “The device is already paired with another phone. It needs to be factory reset before pairing” and a “Okay” button.
    ...         + Pressing on the “Okay” button will dismiss the message and the app shall start finding devices to pair again
    [Tags]      BHA-DEVICE-09       BIOH-SRS-05-FRS-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-DEVICE-11: Scan device after 60 seconds
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - There is no Bioheart device currently added to the app
    ...     - The user is in Force pair device screen
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - When a user logs into the same account on another phone, the device can be ably paired with that phone without requiring a factory reset.
    [Tags]      BHA-DEVICE-11       BIOH-SRS-05-FRS-05-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-DEVICE-12: Support device pairing [new flow – token T2 only]
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user signs same account on many mobile
    ...     - The device is connected with app
    ...
    ...     Test Steps:
    ...    - Press on Pair now button
    ...    - Press on Tap to connect button
    ...
    ...     Expected Output:
    ...    - The app could not find any device within 60 seconds, it will stop the scanning process and display the message to let the user know that
    ...         + There shall be a Try again button for the user to try scanning for the device again
    [Tags]      BHA-DEVICE-12       BIOH-SRS-05-FRS-05-001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-DEVICE-HELPCENTER-01: View Center button support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Device screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on Center button item
    ...
    ...     Expected Output:
    ...    - Navigate to Center button guide
    ...    - User can navigate back to previous screen by pressed on back button
    ...    - User can move to next/previous step by swiping left/right on the screen
    [Tags]     BHA-DEVICE-HELPCENTER-01        BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-DEVICE-HELPCENTER-02: View View heart rhythm support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Device screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on Historical data item
    ...
    ...     Expected Output:
    ...    - Navigate to View heart rhythm guide
    [Tags]     BHA-DEVICE-HELPCENTER-02        BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-DEVICE-HELPCENTER-03: View Status guideline support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Device screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on Status lights item
    ...
    ...     Expected Output:
    ...    - Navigate to Status guideline guide
    [Tags]     BHA-DEVICE-HELPCENTER-03        BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-DEVICE-HELPCENTER-04: View FAQs support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Device screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on FAQs item
    ...
    ...     Expected Output:
    ...    - Navigate to FAQs guide
    [Tags]     BHA-DEVICE-HELPCENTER-04        BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
