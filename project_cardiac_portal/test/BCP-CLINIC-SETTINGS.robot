*** Settings ***
Documentation   Cardiac Settings page test suite
Metadata    sid     BCP-CLINIC-SETTINGS
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library      project_cardiac_portal/lib/web/Common.py
#Library      project_cardiac_portal/lib/web/Support.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-CLINIC-SETTINGS       web
Test Timeout    1h

*** Test Cases ***
BCP-CLINIC-SETTINGS-01: Facility settings - Patient reminder method through SMS
    [Documentation]    Author: Hoang Le
    ...  Pre-conditions:
    ...  User is on the facility Settings page
    ...  The selected Reminder method is SMS
    ...  At least one Trigger conditions is turned on (app inactivity/missed daily inputs/medication nonadherence)

    ...  Test steps:
    ...  Expected result:
    ...  There shall be a reminder sent to patient through SMS to notify them that the trigger condition is reached on the set duration
    ...  The SMS content shall be displayed the same as the clinic user inputs on the Settings page.
    [Tags]    BCP-CLINIC-SETTINGS-01     manual      BCP-2.17
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-CLINIC-SETTINGS-02: Facility settings - Patient reminder method through Phone call
    [Documentation]    Author: Hoang Le
    ...  Pre-conditions:
    ...  User is on the facility Settings page
    ...  The selected Reminder method is Phone call
    ...  At least one Trigger conditions is turned on (app inactivity/missed daily inputs/medication nonadherence)

    ...  Test steps:
    ...  Expected result:
    ...  There shall be a reminder called to patient through Phone call to notify them that the trigger condition is reached on the set duration
    ...  The Phone call content shall be the same as the clinic user inputs on the Settings page
    ...  If the Phone call is missed anyway, there shall be a SMS sent to patient instead.
    [Tags]    BCP-CLINIC-SETTINGS-02     manual      BCP-2.17
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-CLINIC-SETTINGS-03: Facility settings - Patient reminder method through SMS & Phone call
    [Documentation]    Author: Hoang Le
    ...  Pre-conditions:
    ...  User is on the facility Settings page
    ...  The selected Reminder method is SMS & Phone call
    ...  At least one Trigger conditions is turned on (app inactivity/missed daily inputs/medication nonadherence)

    ...  Test steps:
    ...  Expected result:
    ...  There shall be a reminder sent to patient through SMS to notify them that the trigger condition is reached on the set duration
    ...  There shall be a reminder called to patient through Phone call also to notify them that the trigger condition is reached on the set duration
    ...  The SMS & Phone call content shall be the same as the clinic user inputs on the Settings page.
    [Tags]    BCP-CLINIC-SETTINGS-03     manual      BCP-2.17
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-CLINIC-SETTINGS-04: Patient customized settings - Patient reminder method through SMS
    [Documentation]    Author: Hoang Le
    ...  Pre-conditions:
    ...  User is on the patient details page
    ...  The selected Reminder method is SMS
    ...  At least one Trigger conditions is turned on (app inactivity/missed daily inputs/medication nonadherence)

    ...  Test steps:
    ...  Expected result:
    ...  There shall be a reminder sent to patient through SMS to notify them that the trigger condition is reached on the set duration
    ...  The SMS content shall be the same as the clinic user inputs on the patient details page.
    [Tags]    BCP-CLINIC-SETTINGS-04     manual      BCP-2.17
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-CLINIC-SETTINGS-05: Patient customized settings - Patient reminder method through Phone call
    [Documentation]    Author: Hoang Le
    ...  Pre-conditions:
    ...  User is on the patient details page
    ...  The selected Reminder method is Phone call
    ...  At least one Trigger conditions is turned on (app inactivity/missed daily inputs/medication nonadherence)

    ...  Test steps:
    ...  Expected result:
    ...  There shall be a reminder called to patient through Phone call to notify them that the trigger condition is reached on the set duration
    ...  The Phone call content shall be the same as the clinic user inputs on the patient details page.
    [Tags]    BCP-CLINIC-SETTINGS-05     manual      BCP-2.17
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-CLINIC-SETTINGS-06: Patient customized settings - Patient reminder method through SMS & Phone call
    [Documentation]    Author: Hoang Le
    ...  Pre-conditions:
    ...  User is on the patient details page
    ...  The selected Reminder method is SMS & Phone call
    ...  At least one Trigger conditions is turned on (app inactivity/missed daily inputs/medication nonadherence)

    ...  Test steps:
    ...  Expected result:
    ...  There shall be a reminder sent to patient through SMS to notify them that the trigger condition is reached on the set duration
    ...  There shall be a reminder called to patient through Phone call also to notify them that the trigger condition is reached on the set duration
    ...  The SMS & Phone call content shall be the same as the clinic user inputs on the patient details page.
    [Tags]    BCP-CLINIC-SETTINGS-06     manual      BCP-2.17
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-CLINIC-SETTINGS-07: Patient reminder set as Facility settings
    [Documentation]    Author: Hoang Le
    ...  Pre-conditions:
    ...  User is on the patient details page
    ...  'Use default settings' option is selected

    ...  Test steps:
    ...  Expected result:
    ...  The reminder method shall be worked the same as the Facility settings.
    [Tags]    BCP-CLINIC-SETTINGS-07     manual      BCP-2.17
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-CLINIC-SETTINGS-08: Facility settings - Apply settings for 'All facilities'
    [Documentation]    Author: Hoang Le
    ...  Pre-conditions: User is on the Settings page
    ...  Test steps:
    ...  Expected result:
    ...  The reminder method shall be applied for all facilities of the clinic user.
    [Tags]    BCP-CLINIC-SETTINGS-08     manual      BCP-2.17
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-CLINIC-SETTINGS-09: Facility settings - Apply settings for a specific facility
    [Documentation]    Author: Hoang Le
    ...  Pre-conditions: User is on the Settings page
    ...  Test steps:
    ...  Expected result:
    ...  The reminder method shall be applied for selected facility only.
    [Tags]    BCP-CLINIC-SETTINGS-09     manual      BCP-2.17
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-CLINIC-SETTINGS-10: Update Reminder method
    [Documentation]    Author: Hoang Le
    ...  Pre-conditions: User is on the Settings page or Patient details page
    ...  Test steps:
    ...  Expected result:
    ...  The Reminder method shall be updated according to the patient inputs
    ...  There is a notification sent to the Notification center to notify about the Reminder updates
    ...  There is a record logged on the Change log of the patient details page about the Reminder updates.
    [Tags]    BCP-CLINIC-SETTINGS-10     manual      BCP-2.17         R1
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-CLINIC-SETTINGS-11: Check the Setting screen UI "New messages"
    [Documentation]    Author: Bao Van
    ...  Pre-conditions:
    ...  Test steps:
    ...  1. Login Portal > Select Settings menu
    ...  2. Display settings screen > Select "New messages" tab
    ...  3. Check screen UI

    ...  Expected result:
    ...  2. Display the "New messages" screen
    ...  3. Displayed according to desgin. In the Notification methods field, 2 toggle buttons are displayed. "Portal notification" and "Email"
    [Tags]    BCP-CLINIC-SETTINGS-11     manual      BCCA-2.28.0    R1
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-CLINIC-SETTINGS-12: Check notification messages when only enabling Portal notifications
    [Documentation]    Author: Bao Van
    ...  Pre-conditions:
    ...  Test steps:
    ...  1. At the Settings menu > Tab new messages
    ...  2. In the Notification method field > Enable toggle Portal notification button, disable Email button
    ...  3. Login App > Go to the patients assigned to the clinic user above > Enter the message
    ...  4. Login Portal into clinic user above

    ...  Expected result:
    ...  4. A new message from their conversation, a notification banner and a push notification shall be triggered for the selected recipients.
    [Tags]    BCP-CLINIC-SETTINGS-12     manual      BCCA-2.28.0    R1
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-CLINIC-SETTINGS-13: Enable toggle Email - Daily
	[Documentation]    Author: Bao Van
    ...  Pre-conditions:
    ...  Test steps:
    ...  1. At the Settings menu > Tab new messages
    ...  2. In the Notification method field > Enable toggle button Email, disable Portal notification > Select Daily filter

    ...  Expected result:
    ...  2. A snack-bar shall be displayed: “Settings is updated successfully!”.  An email shall be sent to the clinic user once per day, at 00:00 (UTC-7 time zone) if there is at least one new message from the patient in their
    [Tags]    BCP-CLINIC-SETTINGS-13     manual      BCCA-2.28.0    R1
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-CLINIC-SETTINGS-14: Enable toggle Email - Every hour
    [Documentation]    Author: Bao Van
    ...  Pre-conditions:
    ...  Test steps:
    ...  1. At the Settings menu > Tab new messages
    ...  2. In the Notification method field > Enable toggle button Email, disable Portal notification > Select the Every hour filter

    ...  Expected result:
    ...  2. A snack-bar shall be displayed: “Settings is updated successfully!”  The portal will check and send an email to the clinic user if there is at least one new message from the patient in their conversation in the past hour.
    [Tags]    BCP-CLINIC-SETTINGS-14     manual      BCCA-2.28.0    R1
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-CLINIC-SETTINGS-15: Enable toggle Email - Every hour
	[Documentation]    Author: Bao Van
    ...  Pre-conditions:
    ...  Test steps:
    ...  1. At the Settings menu > Tab new messages
    ...  2. In the Notification method field > Enable toggle button Email, disable Portal notification > Select Instantly filter

    ...  Expected result:
    ...  2. A snack-bar shall be displayed: “Settings is updated successfully!”. Check for new messages every 5 minutes. If new messages from the patient are found, send an email immediately with the content of the latest
    [Tags]    BCP-CLINIC-SETTINGS-15     manual      BCCA-2.28.0    R1
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-CLINIC-SETTINGS-16: Check UI default Monitored data setting program type = CCM
	[Documentation]    Author: Bao Van
    ...  Pre-conditions:
    ...  Test steps:
    ...  1. Login Portal > Select Settings menu
    ...  2. Select the Monitored Data tab > Monitored thresholds = CCM > Check UI

    ...  Expected result:
    ...  2. System default settings like desgin figma
    [Tags]    BCP-CLINIC-SETTINGS-16     manual      BCCA-2.31.0    R1
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-CLINIC-SETTINGS-17.: Check UI default Monitored data setting program type = RPM
	[Documentation]    Author: Bao Van
    ...  Pre-conditions:
    ...  Test steps:
    ...  1. Login Portal > Select Settings menu
    ...  2. Select the Monitored Data tab > Monitored thresholds = RPM > Check UI

    ...  Expected result:
    ...  2. System default settings like desgin figma
    [Tags]    BCP-CLINIC-SETTINGS-17.     manual      BCCA-2.31.0    R1
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-CLINIC-SETTINGS-17: Check UI default Monitored data setting program type = CCM & RPM
	[Documentation]    Author: Bao Van
    ...  Pre-conditions:
    ...  Test steps:
    ...  1. Login Portal > Select Settings menu
    ...  2. Select the Monitored Data tab > Monitored thresholds = CCM & RPM > Check UI

    ...  Expected result:
    ...  2. System default settings like desgin figma
    [Tags]    BCP-CLINIC-SETTINGS-17     manual      BCCA-2.31.0    R1
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-CLINIC-SETTINGS-18: Update information different from the default in the Monitored data tab
	[Documentation]    Author: Bao Van
    ...  Pre-conditions:
    ...  Test steps:
    ...  1. Login Portal > Select Settings menu
    ...  2. At Monitored thresholds, there is program type = CCM, update/edit any index (Blood pressure, Heart rate, Oxygen saturation, Body temperature...)
    ...  3. Click update
    ...  4. Click on the "Change log" button

    ...  Expected result:
    ...  3. Successfully updated data
    ...  4. Displays the full time and data changed in program type CCM
    [Tags]    BCP-CLINIC-SETTINGS-18     manual      BCCA-2.31.0    R1
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

*** Keywords ***
#Suite Setup
    ${BROWSER_NODE}      Start Browser
    Import Library       project_cardiac_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${NURSES}            Get Config Param    USER > nurse
    ${TOKEN}             Sign In Cardiac     username=${NURSES}[0][username]     password=${NURSES}[0][password]
    ${VERSION}           Get Release Version
    Set Suite Metadata   version    ${VERSION}
    Set Suite Metadata   browser    ${BROWSER.capitalize()}

#Suite Teardown
    Quit Browser
