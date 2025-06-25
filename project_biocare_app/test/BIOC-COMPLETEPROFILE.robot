*** Settings ***
Documentation   Biocare app Complete profile test suite
Metadata    sid     BIOC-COMPLETEPROFILE
Metadata    owner   Linh Tran
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-COMPLETEPROFILE   mapp
Test Timeout    1h

*** Test Cases ***
BIOC-COMPLETEPROFILE-01: Complete profile
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Sign in screen
    ...
    ...     Test Steps:
    ...     1. Sign in with new account
    ...     2. Select DOB
    ...     3. Select gender
    ...     4. Press on Continue button
    ...     5. Press on Continue button
    ...     6. Press on Save button
    ...     7. Press on Okay button
    ...
    ...     Expected Output:
    ...     1. Sign in successfully and navigate to Complete profile screen, step 1 of 3:
    ...        - The question: What is your name?
    ...        - User can enter or edit First name and Last name
    ...        - The question: What is your birthday?
    ...        - DOB field is empty
    ...        - The question: What is your sex?
    ...        - Female or Male
    ...        - Continue button
    ...     2. DOB field is empty with place-holder MM/DD/YYYY
    ...        - Default value is the January 1st of 50 years before the current year
    ...     3. Female button shall be chosen by default
    ...     4. Navigate to next step 2 of 3
    ...        - The question: What is your phone number?
    ...        - Text: We will send a code (via SMS) to your phone number.
    ...        - The default country is United States
    ...          + User must enter phone number
    ...     5. Navigate to next step (Step 3 of 3)
    ...        - The question: What is your body measurement?
    ...        - There shall be horizontal scroll selection (The default tab is Imperial (ft, lb))
    ...          + Height bar
    ...             * Unit: feet, inch
    ...             * Max: 8’0’’
    ...             * Min: 2’0’’
    ...             * Smallest division: 0’1’’
    ...             * Default: 5’0’’
    ...         + Weight bar
    ...             * Unit: lb
    ...             * Max: 550
    ...             * Min: 0
    ...             * Smallest division: 0.1
    ...             * Default: 120
    ...        - There shall be horizontal scroll selection (The default tab is Metric (cm, kg))
    ...         + Height bar:
    ...             * Unit: cm
    ...             * Max: 250
    ...             * Min: 70
    ...             * Smallest division: 1
    ...             * Default: 152
    ...         + Weight bar:
    ...             * Unit: kg
    ...             * Max: 250
    ...             * Min: 0
    ...             * Smallest division: 0.1
    ...             * Default: 54.4
    ...        - Later button: Navigate the user to the All done screen with saving default value
    ...     6. Navigate the user to the All done screen with saving default value
    ...        - Title: All done!
    ...        - Content: You can always access these settings later via the Profile tab in Biocare Health.
    ...        - Okay button
    ...     7. Navigate the user to the Home screen
    [Tags]      BIOC-COMPLETEPROFILE-01      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-COMPLETEPROFILE-02: Complete profile when incomplete
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Sign in screen
    ...
    ...     Test Steps:
    ...     1. Sign in with account incomplete profile
    ...
    ...     Expected Output:
    ...     1. Sign in successfully and navigate to Complete profile screen without any saved data
    [Tags]      BIOC-COMPLETEPROFILE-02       BIOC-1.22.0  manual  R1
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
