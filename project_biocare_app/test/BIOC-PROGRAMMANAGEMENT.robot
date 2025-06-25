*** Settings ***
Documentation   Biocare app Program management suite
Metadata    sid     BIOC-PROGRAMMANAGEMENT
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-PROGRAMMANAGEMENT   mapp
Test Timeout    1h

*** Test Cases ***
BIOC-PROGRAMMANAGEMENT-01: Enter reference code
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Enter valid ref code (Program or study)
    ...        - Program code will have the format: 8XXXXX
    ...        - Study code will have the format: 1XXXXX
    ...     2. Press on Start monitoring button
    ...
    ...     Expected Output:
    ...     2. Navigate to the program screen
    ...     2. Navigate to the study screen
    [Tags]      BIOC-PROGRAMMANAGEMENT-01        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-02: Enter invalid reference code
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Leave blank field
    ...     2. Press on Start monitoring button
    ...     3. Enter less than 6 characters
    ...     4. Press on Start monitoring button
    ...     5. Enter invalid ref code
    ...     6. Press on Start monitoring button
    ...
    ...     Expected Output:
    ...     2. The outline color of code input bar shall change to red and there shall be a text with content: “This field is required.”
    ...     4. The outline color of code input bar shall change to red and there shall be a text with content: “6-character code is required.”
    ...     6. The app shall open the modal:
    ...        - Title: No service found
    ...        - Content: There is no service that matches the entered reference code.
    ...        - Contact support button
    ...        - Try another way button
    [Tags]      BIOC-PROGRAMMANAGEMENT-02        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-03: Contact support
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Enter invalid ref code
    ...     2. Press on Start monitoring button
    ...     3. Press on Contact support button
    ...
    ...     Expected Output:
    ...     2. The app shall open the modal:
    ...        - Title: No service found
    ...        - Content: There is no service that matches the entered reference code.
    ...        - Contact support button
    ...        - Try another way button
    ...     3. Navigate user to the Send user your feedback screen
    ...       * Note: form Email
    ...         Description: Details
    [Tags]      BIOC-PROGRAMMANAGEMENT-03        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-04: Try another way
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Enter invalid ref code
    ...     2. Press on Start monitoring button
    ...     3. Press on Try another way button
    ...     4. Press on Send button
    ...     5. Press on Contact support button
    ...
    ...     Expected Output:
    ...     2. The app shall open the modal:
    ...        - Title: No service found
    ...        - Content: There is no service that matches the entered reference code.
    ...        - Contact support button
    ...        - Try another way button
    ...     3. Navigate user to the Enter phone number screen
    ...     4. The app shall open the modal:
    ...        - Title: No service found
    ...        - Content: There is no service that matches the entered reference code.
    ...        - Contact support button
    ...        - Close button
    ...     5. Navigate user to the Send user your feedback screen
    [Tags]      BIOC-PROGRAMMANAGEMENT-04        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-05: Enter completed study’s verification study code
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Enter completed study’s verification code
    ...     2. Press on Start monitoring button
    ...     3. Press on Okay button
    ...
    ...     Expected Output:
    ...     2. The app shall open the modal:
    ...        - Title: Completed study
    ...        - Content: Your study has been completed successfully
    ...        - Okay button
    ...     3. Close the modal
    [Tags]      BIOC-PROGRAMMANAGEMENT-05        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-06: Enters an incorrect Biotres code > 5 times
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Enters an incorrect Biotres code > 5 times
    ...     2. Press on Start monitoring button
    ...     3. Press on Okay button
    ...
    ...     Expected Output:
    ...     2. The app shall open the modal:
    ...        - Title: Too many attempts
    ...        - Content: Please try again in a few minutes!
    ...        - Okay button
    ...     3. Close the modal
    [Tags]      BIOC-PROGRAMMANAGEMENT-06        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-07: Enter the code of the study that has been set up but not started
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Enter the code of the study that has been set up but not started
    ...     2. Press on Start monitoring button
    ...     3. Press on Okay button
    ...
    ...     Expected Output:
    ...     2. The app shall open the modal:
    ...        - Title: This study has not been started
    ...        - Content: Please ask your clinician to help you start the study then try again!
    ...        - Okay button
    ...     3. Close the modal
    [Tags]      BIOC-PROGRAMMANAGEMENT-07        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-08: Enter study code when Biotres is in the status “Ready for new study”
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...     - Conneted Biotres device (Status: Ready for new study)
    ...
    ...     Test Steps:
    ...     1. Enter the code of the study
    ...     2. Press on Start monitoring button
    ...     3. Press on Remove button
    ...
    ...     Expected Output:
    ...     2. The app shall open the modal:
    ...        - Title: Could not start monitoring
    ...        - Content: The clinic is setting up a new study with Biotres. To start monitoring another study, you need to remove the connecting Biotres. Would you like to proceed with this action now?
    ...        - Cancel button
    ...        - Remove button
    ...     3. The snackbar shall appear with the content: “Remove device successfully.”
    [Tags]      BIOC-PROGRAMMANAGEMENT-08        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-REFCODE-01: Enter ref code
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...     - Monitoring study
    ...
    ...     Test Steps:
    ...     1. Press on Enter Reference Code button
    ...     2. Enter ref code
    ...     3. Press on Start Monitoring button
    ...     4. Kill app and open app again (No press on Agree button)
    ...
    ...     Expected Output:
    ...     1. Navigate to the Reference code screen
    ...     3. In case, the program has already been started
    ...        - Navigate to the EC consent screen to sign
    ...        In case, the program has not yet started
    ...        - Navigate to the Services screen
    ...     4. The usser have to enter the reference code when opening the app again (not linked program yet)
    [Tags]      BIOC-PROGRAMMANAGEMENT-REFCODE-01        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-01: Switch from CCM to RPM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Old CCM or new CCM
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Stop the current program and create a new active program
    [Tags]      BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-01        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-02: Switch from CCM to RPM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Switch while the user is signing consent
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - User continue signing sign CCM & display sign RPM screen
    [Tags]      BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-02        BIOC-1.22.0  manual  R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-03: Switch from CCM to RPM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Clinic user upload consent when set up
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Saved consent will be the one uploaded by the clinic
    [Tags]      BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-03        BIOC-1.22.0  manual  R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-04: Switch from RPM to CCM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Old CCM or new CCM
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Stop the current program and create a new active program. ->sign CCM consent
    [Tags]      BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-04        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-05: Switch from RPM to CCM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Switch while the user is signing consent
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - User continue signing sign RPM & display sign CCM screen
    [Tags]      BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-05        BIOC-1.22.0  manual  R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-06: Switch from RPM to CCM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Clinic user upload consent when set up
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Saved consent will be the one uploaded by the clinic.
    [Tags]      BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-06        BIOC-1.22.0  manual  R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-07: Switch CCM to CCM&RPM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - old CCM (signed CCM)
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Service screen shall change to the sign RPM consent screen
    [Tags]      BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-07        BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-08: Switch CCM to CCM&RPM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - New CCM (signed CCM)
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Service screen shall change to the sign RPM consent screen
    [Tags]      BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-08        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-09: Switch CCM to CCM&RPM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Switch while the user is signing consent
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - User continue signing sign CCM & display sign RPM screen
    [Tags]      BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-09        BIOC-1.22.0  manual  R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-10: Switch CCM to CCM&RPM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Clinic user upload consent when set up
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Saved consent will be the one uploaded by the clinic
    [Tags]      BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-10        BIOC-1.22.0  manual  R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-11: Switch CCM to CCM&RPM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The current program type is CCM and the user hasn’t signed the CCM consent
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Display sign CCM & RPM consent screen
    [Tags]      BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-11        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-12: Switch from CCM&RPM to RPM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Old CCM&RPM
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - The current program will be stopped & sign RPM
    [Tags]      BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-12        BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-13: Switch from CCM&RPM to RPM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - New CCM&RPM
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - The current program will be stopped & sign RPM
    [Tags]      BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-13        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-14: Switch from CCM&RPM to RPM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - While the user is signing consent
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - User continue signing sign CCM & RPM, display sign RPM screen
    [Tags]      BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-14        BIOC-1.22.0  manual  R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-15:Switch from CCM&RPM to RPM
    [Documentation]     Author:Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Clinic user upload consent when set up
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Saved consent will be the one uploaded by the clinic
    [Tags]      BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-15        BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-16:Switch from CCM&RPM to RPM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The current program type is CCM&RPM and the user hasn’t signed the consent
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Display sign RPM consent screen
    [Tags]      BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-16        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-17:Switch CCM&RPM to CCM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Old or new CCM&RPM
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Not require sign CCM consent again
    [Tags]      BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-17        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-18: Switch CCM&RPM to CCM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Switch while the user is signing consent
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - User continue signing sign CCM
    [Tags]      BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-18        BIOC-1.22.0  manual  R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-19: Switch RPM to CCM&RPM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Old RPM
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Change to the Sign CCM&RPM consent screen
    [Tags]      BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-19        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-20: Switch RPM to CCM&RPM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - While the user is signing consent
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - User continue signing sign RPM, display sign CCM&RPM screen
    [Tags]      BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-20        BIOC-1.22.0  manual  R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-21: Switch RPM to CCM&RPM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The current program type is RPM and the user hasn’t signed the RPM consent
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Display sign CCM&RPM consent screen
    [Tags]      BIOC-PROGRAMMANAGEMENT-SWITCHPROGRAM-21        BIOC-1.22.0  manual  R1
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
