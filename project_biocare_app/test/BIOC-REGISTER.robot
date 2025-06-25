*** Settings ***
Documentation   Biocare app Register test suite
Metadata    sid     BIOC-REGISTER
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-REGISTER   mapp
Test Timeout    1h

*** Test Cases ***
BIOC-REGISTER-01: View Register screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Welcome screen
    ...
    ...     Test Steps:
    ...     - Press on Register now button
    ...
    ...     Expected Output:
    ...     - User can register new account by filling all fields and press on Create account button
    ...     - User can navigate to the previous screen by press on back icon button
    ...     - User can view Privacy policy by pressing on Privacy policy text
    ...         + Naviagte to Privacy policy screen
    ...             * Content: follow design
    ...         + When users press on links in the content, the app will navigate to the corresponding screen
    ...         + If users press on Understood or close icon button, the privacy policy is closed
    ...     - User can view Terms and conditions by pressing on Terms and conditions text
    ...         + Naviagte to Terms and conditions screen
    ...             * Content: follow design
    ...         + When users press on links in the content, the app will navigate to the corresponding screen
    ...         + If users press on Understood or close icon button, the terms and conditions is closed
    [Tags]      BIOC-REGISTER-01     BIOH-SRS-01-FRS-05      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-REGISTER-02: Register new account
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Register screen
    ...
    ...     Test Steps:
    ...     - Enter all fields
    ...     - Press on Create account button
    ...
    ...     Expected Output:
    ...     - When users press on password field, there is message "Passwords must be at least 8 characters"
    ...     - When users enter password and confirm password, the passwords are hidden and press on eye icon to show password
    ...     - When users press on Create account button, navigate to Email Verification screen
    ...     - A verification email shall be sent to the user’s email that was provided in the signup process
    ...     - A message shall be displayed to the user stating: “An email with a confirmation link has been sent to “user_email”. Please check your email and follow the instruction to activate your account.”
    ...     - A Back to sign in” button shall be available for the user to click on and navigate to the “Sign In” screen
    ...         * If the user has not completed verify email, there shall be a message “Your account is not verified. Please check your email and click the verification link to activate your account." And the “Resend Verification Email” button to resend the email
    [Tags]      BIOC-REGISTER-02     BIOH-SRS-01-FRS-05      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-REGISTER-03: Leave blank all fields or any field when registering account
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Register screen
    ...
    ...     Test Steps:
    ...    - Leave blank all fields or any field
    ...    - Press on Create account button
    ...
    ...     Expected Output:
    ...    - There is a message "All fields are required" and empty fields text bar's outline will change to red
    [Tags]      BIOC-REGISTER-03     BIOH-SRS-01-FRS-05      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-REGISTER-04: Register account with invalid eamil
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Register screen
    ...
    ...     Test Steps:
    ...     - Enter all fields with invalid email
    ...     - Press on Create account button
    ...
    ...     Expected Output:
    ...     - There is a message "Invalid email" and email text bar's outline will change to red
    [Tags]      BIOC-REGISTER-04     BIOA-SRS-01-FRS-05      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-REGISTER-05: Register account with password less than 8 characters
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Register screen
    ...
    ...     Test Steps:
    ...     - Enter all fields and enter password less than 8 characters
    ...     - Press on Create account button
    ...
    ...     Expected Output:
    ...     - There is a message "Passwords must be at least 8 characters" and password text bar's outline will change to red
    [Tags]      BIOC-REGISTER-05     BIOH-SRS-01-FRS-05      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-REGISTER-06: Register account with passwords don't match
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Register screen
    ...
    ...     Test Steps:
    ...     - Enter all fields and enter passwords don't match
    ...     - Press on Create account button
    ...
    ...     Expected Output:
    ...     - There is a message "Your passwords don't match" and confirm password text bar's outline will change to red
    [Tags]      BIOC-REGISTER-06     BIOH-SRS-01-FRS-05      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-REGISTER-07: Register account without Internet connection
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Register screen
    ...     - The Internet is disconnected
    ...
    ...     Test Steps:
    ...     - Enter all fields
    ...     - Press on Create account button
    ...
    ...     Expected Output:
    ...     - There is a message "No internet connection. Try again"
    [Tags]      BIOC-REGISTER-07     BIOH-SRS-01-FRS-05      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-REGISTER-08: Register with the deleted account is pending mode
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Register screen
    ...     - The deleted account is pending mode
    ...
    ...     Test Steps:
    ...     1. Register account with the deleted account is pending mode
    ...
    ...     Expected Output:
    ...     1. There is message "Account already exist"
    [Tags]      BIOC-REGISTER-08       BIOC-SRS-06-FRS-05-004      BIOC-1.22.0  manual  R1
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
