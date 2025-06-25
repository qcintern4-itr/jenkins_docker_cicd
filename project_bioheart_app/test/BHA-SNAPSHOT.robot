*** Settings ***
Documentation   Bioheart app Snapshot test suite
Metadata    sid     BHA-SNAPSHOT
Metadata    owner   Linh Tran
Library     corelib/AssertionExtension.py

Force Tags      BHA-SNAPSHOT        mapp
Test Timeout    1h

*** Test Cases ***
BHA-SNAPSHOT-INAPP-01: Create snapshot with notes
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Live heart rhythm screen
    ...
    ...     Test Steps:
    ...    - Press on Start recording button
    ...    - Select duration
    ...    - Press on Create button
    ...    - Press on Add notes button
    ...    - Add notes and tags
    ...    - Wait for snapshot complete
    ...
    ...     Expected Output:
    ...    - The snapshot is created with notes and display in All and Recent snapshot lists
    [Tags]     BHA-SNAPSHOT-INAPP-01      BIOC-SRS-03-FRS-02-002          manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-INAPP-02: Create snapshot without notes
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Live heart hhythm screen
    ...
    ...     Test Steps:
    ...    - Press on Start recording button
    ...    - Select duration
    ...    - Press on Create button
    ...    - Press on Skip button
    ...    - Wait for snapshot complete
    ...
    ...     Expected Output:
    ...    - The snapshot is created without notes and display in All and Recent snapshot lists
    [Tags]     BHA-SNAPSHOT-INAPP-02      BIOC-SRS-03-FRS-02-002          manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-INAPP-03: Create snapshot after 20-seconds timeout
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Live heart rhythm screen
    ...
    ...     Test Steps:
    ...    - Press on Start recording button
    ...    - Wait for 20-seconds
    ...    - Wait for snapshot complete
    ...
    ...     Expected Output:
    ...    - The snapshot is created without notes and display in All and Recent snapshot lists
    [Tags]     BHA-SNAPSHOT-INAPP-03      BIOC-SRS-03-FRS-02-002          manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-INAPP-04: Cancel to create snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Live heart rhythm screen
    ...
    ...     Test Steps:
    ...    - Press on Start recording button
    ...    - Press on Cancel button
    ...
    ...     Expected Output:
    ...    - The snapshot is canceled
    [Tags]     BHA-SNAPSHOT-INAPP-04      BIOC-SRS-03-FRS-02-002          manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-INAPP-05: Create snapshot when another recording is ongoing
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Live heart rhythm screen
    ...     - There is an ongoing recording
    ...
    ...     Test Steps:
    ...    - Press on Start recording button
    ...
    ...     Expected Output:
    ...    - There will be a pop-out modal with the message "Anothet recording is ongoing". Press on Okay button to close popup
    [Tags]     BHA-SNAPSHOT-INAPP-05      BIOC-SRS-03-FRS-02-002      BIOC-SRS-03-FRS-02-005      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-INAPP-06: Create snapshot when bad contact
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Live heart rhythm screen
    ...
    ...     Test Steps:
    ...    - Press on Start recording button
    ...
    ...     Expected Output:
    ...    - There will be a pop-out modal with the message “Could not start recording. Your Bioheart is in bad contact, please wear it properly". Press on Okay button to close popup
    [Tags]     BHA-SNAPSHOT-INAPP-06      BIOC-SRS-03-FRS-02-002      BIOC-SRS-03-FRS-02-005          manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-INAPP-07: Create snapshot when charging
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Live heart rhythm screen
    ...
    ...     Test Steps:
    ...    - Press on Start recording button
    ...
    ...     Expected Output:
    ...    - There will be a pop-out modal with the message “Could not start recording. Your Bioheart is charging, please unplug before recording". Press on Okay button to close popup
    [Tags]     BHA-SNAPSHOT-INAPP-07      BIOC-SRS-03-FRS-02-002      BIOC-SRS-03-FRS-02-005         manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-INAPP-08: Create snapshot when there shall other error
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Live heart rhythm screen
    ...
    ...     Test Steps:
    ...    - Press on Start recording button
    ...
    ...     Expected Output:
    ...    - There will be a pop-out modal with the message: “Could not start recording. Please try again". Press on Okay button to close popup
    [Tags]     BHA-SNAPSHOT-INAPP-08      BIOC-SRS-03-FRS-02-002      BIOC-SRS-03-FRS-02-005         manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-INAPP-09: Create snapshot when battery level is less than 10%
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Live heart rhythm screen
    ...     - Device's battery level is less than 10%
    ...
    ...     Test Steps:
    ...    - Press on Start recording button
    ...
    ...     Expected Output:
    ...    - There will be a pop-out modal with the message: “Could not start recording because your Bioheart battery level is less than 10%. Please charge your device.”. Press on Okay button to close popup
    [Tags]     BHA-SNAPSHOT-INAPP-09      BIOC-SRS-03-FRS-02-002      BIOC-SRS-03-FRS-02-005         manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-DEVICE-01: Create snapshot with notes
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Device is connected with app
    ...
    ...     Test Steps:
    ...    - Press on Center button on device
    ...    - Select duration in app
    ...    - Press on Create button
    ...    - Press on Add notes button
    ...    - Add notes and tags
    ...    - Wait for snapshot complete
    ...
    ...     Expected Output:
    ...    - The snapshot is created with notes and display in All and Recent snapshot lists
    [Tags]     BHA-SNAPSHOT-DEVICE-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-DEVICE-02: Create snapshot without notes
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Device is connected with app
    ...
    ...     Test Steps:
    ...    - Press on Center button on device
    ...    - Select duration in app
    ...    - Press on Create button
    ...    - Press on Skip button
    ...    - Wait for snapshot complete
    ...
    ...     Expected Output:
    ...    - The snapshot is created without notes and display in All and Recent snapshot lists
    [Tags]     BHA-SNAPSHOT-DEVICE-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-DEVICE-03: Create snapshot after 20-seconds timeout
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Device is connected with app
    ...
    ...     Test Steps:
    ...    - Press on Center button on device
    ...    - Wait for 20-seconds
    ...    - Wait for snapshot complete
    ...
    ...     Expected Output:
    ...    - The snapshot is created without notes and display in All and Recent snapshot lists
    [Tags]     BHA-SNAPSHOT-DEVICE-03          manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-DEVICE-04: Cancel to create snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Device is connected with app
    ...
    ...     Test Steps:
    ...    - Press on Center button on device
    ...    - Press on Cancel button
    ...
    ...     Expected Output:
    ...    - The snapshot is canceled
    [Tags]     BHA-SNAPSHOT-DEVICE-04          manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-DEVICE-05: Create snapshot when another recording is ongoing
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Device is connected with app
    ...     - There is an ongoing recording
    ...
    ...     Test Steps:
    ...    - Press on Center button on device
    ...
    ...     Expected Output:
    ...    - There will not be anything happened
    [Tags]     BHA-SNAPSHOT-DEVICE-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-DEVICE-06: Create snapshot when bad contact
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Device is connected with app
    ...
    ...     Test Steps:
    ...    - Press on Center button on device
    ...
    ...     Expected Output:
    ...    - There will not be anything happened
    [Tags]     BHA-SNAPSHOT-DEVICE-06          manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-DEVICE-07: Create snapshot when charging
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Device is connected with app
    ...
    ...     Test Steps:
    ...    - Press on Center button on device
    ...
    ...     Expected Output:
    ...    - There will not be anything happened
    [Tags]     BHA-SNAPSHOT-DEVICE-07         manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-DEVICE-08: Create snapshot when there shall other error
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Device is connected with app
    ...
    ...     Test Steps:
    ...    - Press on Center button on device
    ...
    ...     Expected Output:
    ...    - There will not be anything happened
    [Tags]     BHA-SNAPSHOT-DEVICE-08         manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-DEVICE-09: Create snapshot when battery level is less than 10%
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Device is connected with app
    ...     - Device's battery level is less than 10%
    ...
    ...     Test Steps:
    ...    - Press on Center button on device
    ...
    ...     Expected Output:
    ...    - There will not be anything happened
    [Tags]     BHA-SNAPSHOT-DEVICE-09         manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-DEVICE-10: Create snapshot with notes when close app
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Device is connected with app
    ...
    ...     Test Steps:
    ...    - Close app
    ...    - Press on Center button on device
    ...    - Press on notification
    ...    - Select duration in app
    ...    - Press on Create button
    ...    - Press on Add notes button
    ...    - Add notes and tags
    ...    - Wait for snapshot complete
    ...
    ...     Expected Output:
    ...    - The snapshot is created with notes and display in All and Recent snapshot lists
    [Tags]     BHA-SNAPSHOT-DEVICE-10       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-DEVICE-11: Create snapshot without notes when close app
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Device is connected with app
    ...
    ...     Test Steps:
    ...    - Close app
    ...    - Press on Center button on device
    ...    - Press on notification
    ...    - Select duration in app
    ...    - Press on Create button
    ...    - Press on SKip button
    ...    - Wait for snapshot complete
    ...
    ...     Expected Output:
    ...    - The snapshot is created without notes and display in All and Recent snapshot lists
    [Tags]     BHA-SNAPSHOT-DEVICE-11       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-DEVICE-12: Create snapshot after 20-seconds timeout
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Device is connected with app
    ...
    ...     Test Steps:
    ...    - Close app
    ...    - Press on Center button on device
    ...    - Wait for 20-seconds
    ...    - Wait for snapshot complete
    ...
    ...     Expected Output:
    ...    - The snapshot is created without notes and display in All and Recent snapshot lists
    [Tags]     BHA-SNAPSHOT-DEVICE-12       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-DEVICE-13: Cancel to create snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Device is connected with app
    ...
    ...     Test Steps:
    ...    - Close app
    ...    - Press on Center button on device
    ...    - Press on notification
    ...    - Press on Cancel button
    ...
    ...     Expected Output:
    ...    - The snapshot is canceled
    [Tags]     BHA-SNAPSHOT-DEVICE-13       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-DEVICE-14: Create snapshot when device is disconnected with app
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Device is disconnected with app
    ...
    ...     Test Steps:
    ...    - Press on Center button on device
    ...    - Wait for more than 20-seconds timeout to snapshot complete
    ...
    ...     Expected Output:
    ...    - The snapshot is created without notes and display in All and Recent snapshot lists
    [Tags]     BHA-SNAPSHOT-DEVICE-14       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-HISTORICAL-RHYTHMDIARY-01: Create snapshot with notes
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Heart Rhythm screen
    ...
    ...     Test Steps:
    ...    - Select date/time
    ...    - Press on Create Snapshot + button
    ...    - Select duration
    ...    - Press on Create button
    ...    - Press on Add notes button
    ...    - Add notes and tags
    ...    - Wait for snapshot complete
    ...
    ...     Expected Output:
    ...    - The snapshot is created with notes and display in All and Recent snapshot lists
    [Tags]      BHA-SNAPSHOT-HISTORICAL-RHYTHMDIARY-01      BIOH-SRS-04-FRS-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-HISTORICAL-RHYTHMDIARY-02: Create snapshot without notes
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Heart Rhythm screen
    ...
    ...     Test Steps:
    ...    - Select date/time
    ...    - Press on Create Snapshot + button
    ...    - Select duration
    ...    - Press on Create button
    ...    - Press on Skip button
    ...    - Wait for snapshot complete
    ...
    ...     Expected Output:
    ...    - The snapshot is created without notes and display in All and Recent snapshot lists
    [Tags]      BHA-SNAPSHOT-HISTORICAL-RHYTHMDIARY-02      BIOH-SRS-04-FRS-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-HISTORICAL-RHYTHMDIARY-03: Cancel to create snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Heart Rhythm screen
    ...
    ...     Test Steps:
    ...    - Select date/time
    ...    - Press on Create Snapshot + button
    ...    - Select duration
    ...    - Press on Cancel button
    ...
    ...     Expected Output:
    ...    - The snapshot is canceled
    [Tags]     BHA-SNAPSHOT-HISTORICAL-RHYTHMDIARY-03      BIOH-SRS-04-FRS-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-HISTORICAL-HEARTRATE-01: Create snapshot with notes
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rate screen
    ...
    ...     Test Steps:
    ...    - Press on Create snapshot button
    ...    - Select duration
    ...    - Press on Create button
    ...    - Add notes for snapshot
    ...
    ...     Expected Output:
    ...    - The snapshot is created with notes and display in All and Recent snapshot lists
    [Tags]     BHA-SNAPSHOT-HISTORICAL-HEARTRATE-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-HISTORICAL-HEARTRATE-02: Create snapshot without notes
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rate screen
    ...
    ...     Test Steps:
    ...    - Press on Create snapshot button
    ...    - Select duration
    ...    - Press on Create button
    ...    - Skip the step add notes
    ...
    ...     Expected Output:
    ...    - The snapshot is created without notes and display in All and Recent snapshot lists
    [Tags]     BHA-SNAPSHOT-HISTORICAL-HEARTRATE-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-HISTORICAL-HEARTRATE-03: Cancel to create snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rate screen
    ...
    ...     Test Steps:
    ...    - Press on Create snapshot button
    ...    - Press on Cancel button
    ...
    ...     Expected Output:
    ...    - The snapshot is canceled
    [Tags]     BHA-SNAPSHOT-HISTORICAL-HEARTRATE-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-HISTORICAL-SUMMARY-01: Create snapshot with notes
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rhythm screen
    ...
    ...     Test Steps:
    ...    - Press on Create Snapshot button
    ...    - Select duration
    ...    - Press on Create button
    ...    - Press on Add notes button
    ...    - Wait for snapshot complete
    ...
    ...     Expected Output:
    ...    - The snapshot is created with notes and display in All and Recent snapshot lists
    [Tags]     BHA-SNAPSHOT-HISTORICAL-SUMMARY-01     BIOC-SRS-03-FRS-09      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-HISTORICAL-SUMMARY-02: Create snapshot without notes
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rhythm screen
    ...
    ...     Test Steps:
    ...    - Press on Create Snapshot button
    ...    - Select duration
    ...    - Press on Create button
    ...    - Press on Skip button
    ...    - Wait for snapshot complete
    ...
    ...     Expected Output:
    ...    - The snapshot is created with notes and display in All and Recent snapshot lists
    [Tags]     BHA-SNAPSHOT-HISTORICAL-SUMMARY-02     BIOC-SRS-03-FRS-09      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SNAPSHOT-HISTORICAL-SUMMARY-03: Cancel to create snaphshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rhythm screen
    ...
    ...     Test Steps:
    ...    - Press on Create Snapshot button
    ...    - Press on Cancel button
    ...
    ...     Expected Output:
    ...    - The snapshot is canceled
    [Tags]     BHA-SNAPSHOT-HISTORICAL-SUMMARY-03     BIOC-SRS-03-FRS-09      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
