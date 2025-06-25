*** Settings ***
Documentation   Biocare app Services tab test suite
Metadata    sid     BIOC-SMS
Metadata    owner   Tu Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-SMS   mapp
Test Timeout    5h

*** Test Cases ***
BIOC-SMS-01: Verify the SMS is sent when the study duration end and turn off the device ( before the study is done and enable share report)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share report
    ...     - Create the study on the diagnostic portal with phone number
    ...     
    ...    Test Steps:
    ...     1. Log in the app
    ...     2. Connect device with app
    ...     3. Go through the onboarding
    ...     4. Stop the study
    ...     5. Turn off the device  before the study is done
    ...
    ...     Expected Output:
    ...     1. The SMS is sent with content: "Your cardiac study is complete, please CHARGE the device with the power ON and view results: https://onelink.to/biocareapp. "
    [Tags]      BIOC-SMS-01        BIOC-2.3.1  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SMS-02: Verify the SMS isn't sent when the study duration end and turn off the device ( before the study is done and disable share report)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - disable share report
    ...     - Create the study on the diagnostic portal with phone number
    ...
    ...    Test Steps:
    ...     1. Log in the app
    ...     2. Connect device with app
    ...     3. Go through the onboarding
    ...     4. Stop the study
    ...     5. Turn off the device  before the study is done
    ...
    ...     Expected Output:
    ...     1. The SMS can't sent with content: "Your cardiac study is complete, please CHARGE the device with the power ON and view results: https://onelink.to/biocareapp. "
    [Tags]      BIOC-SMS-02        BIOC-2.3.1  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BIOC-SMS-03: Verify the SMS is sent when the second study's duration end and turn off the device ( before the second study's duration is done and enable share report)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share report
    ...     - Create the follow-on study on the diagnostic portal with phone number
    ...
    ...    Test Steps:
    ...     1. Log in the app
    ...     2. Connect device with app
    ...     3. Go through the onboarding
    ...     4. Stop the second study
    ...     5. Turn off the device  before the second study's duration is done
    ...
    ...     Expected Output:
    ...     1. The SMS can sent with content: "Your cardiac study is complete, please CHARGE the device with the power ON and view results: https://onelink.to/biocareapp. "
    [Tags]      BIOC-SMS-03        BIOC-2.3.1  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SMS-05: Verify the SMS isn't sent when the second study's duration end and turn off the device ( before the second study's duration is done and disable share report)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Disable share report
    ...     - Create the follow-on study on the diagnostic portal with phone number
    ...
    ...    Test Steps:
    ...     1. Log in the app
    ...     2. Connect device with app
    ...     3. Go through the onboarding
    ...     4. Stop the second study
    ...     5. Turn off the device  before the second study's duration is done
    ...
    ...     Expected Output:
    ...     1. The SMS can't sent with content: "Your cardiac study is complete, please CHARGE the device with the power ON and view results: https://onelink.to/biocareapp. "
    [Tags]      BIOC-SMS-05        BIOC-2.3.1  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SMS-06: Verify the SMS isn't sent when the first study's duration end and turn off the device ( before the first study's duration is done)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Disable share report
    ...     - Create the follow-on study on the diagnostic portal with phone number
    ...
    ...    Test Steps:
    ...     1. Log in the app
    ...     2. Connect device with app
    ...     3. Go through the onboarding
    ...     4. Stop the first study
    ...     5. Turn off the device  before the second study's duration is done
    ...
    ...     Expected Output:
    ...     1. The SMS can't sent with content: "Your cardiac study is complete, please CHARGE the device with the power ON and view results: https://onelink.to/biocareapp. "
    [Tags]      BIOC-SMS-06        BIOC-2.3.1  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SMS-07: Verify the SMS is sent to remind the patient to download the app one day after the study has started.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the diagnostic portal with phone number
    ...     - Don't pair device with app
    ...
    ...    Test Steps:
    ...     1. wait the one day, check SMS
    ...
    ...     Expected Output:
    ...     1. The SMS sent with content: "Easily track your study and view your results! Download the Biocare Health app here: https://onelink.to/biocareapp and enter code [XXXXXX] in Services tab"
    [Tags]      BIOC-SMS-07        BIOC-2.3.1  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SMS-08: Verify the SMS is sent when the study report access. ( The study report hasn't email)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the diagnostic portal with phone number 
    ...     - Don't input the email
    ...     - Don't pair device with app
    ...
    ...    Test Steps:
    ...     1. Stop the study
    ...
    ...     Expected Output:
    ...     1. The SMS sent with content: "Easily access your previous Biotricity heart study through the Biocare app. Please follow the instructions here: https://onelink.to/heartstudy"
    [Tags]      BIOC-SMS-08        BIOC-2.3.1  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SMS-09: Verify the SMS isn't sent when the study report access. ( The study report has email)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the diagnostic portal with phone number
    ...     - Input the email
    ...     - Don't pair device with app
    ...
    ...    Test Steps:
    ...     1. Stop the study
    ...
    ...     Expected Output:
    ...     1. The SMS isn't sent with content: "Easily access your previous Biotricity heart study through the Biocare app. Please follow the instructions here: https://onelink.to/heartstudy"
    [Tags]      BIOC-SMS-09        BIOC-2.3.1  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SMS-10: Verify the SMS is sent 1 day before the study end.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the diagnostic portal with phone number
    ...     - Input the email
    ...     - Pair device with app
    ...
    ...    Test Steps:
    ...     1. 1 day before the study ends, check SMS
    ...
    ...     Expected Output:
    ...     1. The SMS isn't sent with content: "Easily access your previous Biotricity heart study through the Biocare app. Please follow the instructions here: https://onelink.to/heartstudy"
    [Tags]      BIOC-SMS-10        BIOC-2.3.1  manual  R1
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
