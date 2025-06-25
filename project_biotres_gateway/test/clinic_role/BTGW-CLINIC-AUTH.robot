*** Settings ***
Documentation   Clinic-Authetication Test Suite
Metadata    sid     BTGW-CLINIC-AUTH
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py

Force Tags      BTGW-CLINIC-AUTH        mapp
Test Timeout    30m

*** Test Cases ***
BTGW-CLINIC-AUTH-SIGNIN-01: Sign in as Clinic Technician with valid username and password
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can sign in with valid username and password that belong to Clinic Technician account
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Tap [Sign in as Clinic user] button
    ...     - 2. Enter a valid username
    ...     - 3. Enter a valid password
    ...     - 4. Tap [Sign in] button
    ...
    ...     Expected Results:
    ...     - Step4: Login successfully, the user is navigated to [Dashboard] screen
    [Tags]  BTGW-CLINIC-AUTH-SIGNIN-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-AUTH-SIGNIN-02: Sign in as Clinic Physician with valid username and password
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can sign in with valid username and password that belong to Clinic Physician account
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Tap [Sign in as Clinic user] button
    ...     - 2. Enter a valid username
    ...     - 3. Enter a valid password
    ...     - 4. Tap [Sign in] button
    ...
    ...     Expected Results:
    ...     - Step4: Login successfully, the user is navigated to [Dashboard] screen
    [Tags]  BTGW-CLINIC-AUTH-SIGNIN-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-AUTH-SIGNIN-03: Sign in as Clinic EP with valid username and password
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can sign in with valid username and password that belong to Clinic EP account
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Tap [Sign in as Clinic user] button
    ...     - 2. Enter a valid username
    ...     - 3. Enter a valid password
    ...     - 4. Tap [Sign in] button
    ...
    ...     Expected Results:
    ...     - Step4: Login successfully, the user is navigated to [Dashboard] screen
    [Tags]  BTGW-CLINIC-AUTH-SIGNIN-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-AUTH-SIGNIN-04: Sign in as Clinic Technician with invalid username and password
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot sign in with invalid username/password that belong to Clinic Technician account
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Tap [Sign in as Clinic user] button
    ...     - 2. Enter a valid username
    ...     - 3. Enter a invalid password
    ...     - 4. Tap [Sign in] button
    ...
    ...     Expected Results:
    ...     - Step4: Displayed the error message "Incorrect password. Please try again." below the password filed.
    [Tags]  BTGW-CLINIC-AUTH-SIGNIN-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-AUTH-SIGNIN-05: Sign in as Clinic Physician with invalid username and password
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot sign in with invalid username/password that belong to Clinic Physician account
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Tap [Sign in as Clinic user] button
    ...     - 2. Enter a valid username
    ...     - 3. Enter a invalid password
    ...     - 4. Tap [Sign in] button
    ...
    ...     Expected Results:
    ...     - Step4: Displayed the error message "Incorrect password. Please try again." below the password filed.
    [Tags]  BTGW-CLINIC-AUTH-SIGNIN-05       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-AUTH-SIGNIN-06: Sign in as Clinic EP with invalid username and password
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot sign in with invalid username/password that belong to Clinic EP account
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Tap [Sign in as Clinic user] button
    ...     - 2. Enter a valid username
    ...     - 3. Enter a invalid password
    ...     - 4. Tap [Sign in] button
    ...
    ...     Expected Results:
    ...     - Step4: Displayed the error message "Incorrect password. Please try again." below the password filed.
    [Tags]  BTGW-CLINIC-AUTH-SIGNIN-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-AUTH-SIGNIN-07: Sign in as Call Center Technician with valid username and password
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot sign in with with valid username and password that belong to Call Center Technician account
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Tap [Sign in as Clinic user] button
    ...     - 2. Enter a valid username
    ...     - 3. Enter a valid password
    ...     - 4. Tap [Sign in] button
    ...
    ...     Expected Results:
    ...     - Step4: Displayed the error message "We can't find any account asoociated with this username." below the password filed.
    [Tags]  BTGW-CLINIC-AUTH-SIGNIN-07       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-AUTH-SIGNIN-08: Sign in as Call Center QA with valid username and password
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot sign in with with valid username and password that belong to Call Center QA account
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Tap [Sign in as Clinic user] button
    ...     - 2. Enter a valid username
    ...     - 3. Enter a valid password
    ...     - 4. Tap [Sign in] button
    ...
    ...     Expected Results:
    ...     - Step4: Displayed the error message "We can't find any account asoociated with this username." below the password filed.
    [Tags]  BTGW-CLINIC-AUTH-SIGNIN-08       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BTGW-CLINIC-AUTH-SIGNIN-09: Sign in as Call Center Supervisor with valid username and password
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot sign in with with valid username and password that belong to  Call Center Supervior account
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Tap [Sign in as Clinic user] button
    ...     - 2. Enter a valid username
    ...     - 3. Enter a valid password
    ...     - 4. Tap [Sign in] button
    ...
    ...     Expected Results:
    ...     - Step4: Displayed the error message "We can't find any account asoociated with this username." below the password filed.
    [Tags]  BTGW-CLINIC-AUTH-SIGNIN-09      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-AUTH-SIGNIN-10: Sign in as Call Center QA Leader with valid username and password
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot sign in with with valid username and password that belong to  CCall Center QA Leader account
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Tap [Sign in as Clinic user] button
    ...     - 2. Enter a valid username
    ...     - 3. Enter a valid password
    ...     - 4. Tap [Sign in] button
    ...
    ...     Expected Results:
    ...     - Step4: Displayed the error message "We can't find any account asoociated with this username." below the password filed.
    [Tags]  BTGW-CLINIC-AUTH-SIGNIN-10      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-AUTH-SIGNIN-11: Sign in as Support Staff with valid username and password
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot sign in with with valid username and password that belong to Support Staff Leader account
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Tap [Sign in as Clinic user] button
    ...     - 2. Enter a valid username
    ...     - 3. Enter a valid password
    ...     - 4. Tap [Sign in] button
    ...
    ...     Expected Results:
    ...     - Step4: Displayed the error message "We can't find any account asoociated with this username." below the password filed.
    [Tags]  BTGW-CLINIC-AUTH-SIGNIN-11      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-AUTH-SIGNIN-12: Sign in as Operation manager with valid username and password
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot sign in with with valid username and password that belong to Operation manager account
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Tap [Sign in as Clinic user] button
    ...     - 2. Enter a valid username
    ...     - 3. Enter a valid password
    ...     - 4. Tap [Sign in] button
    ...
    ...     Expected Results:
    ...     - Step4: Displayed the error message "We can't find any account asoociated with this username." below the password filed.
    [Tags]  BTGW-CLINIC-AUTH-SIGNIN-12      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-AUTH-SIGNIN-13: Sign in as QMS with valid username and password
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot sign in with with valid username and password that belong to QMS account
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Tap [Sign in as Clinic user] button
    ...     - 2. Enter a valid username
    ...     - 3. Enter a valid password
    ...     - 4. Tap [Sign in] button
    ...
    ...     Expected Results:
    ...     - Step4: Displayed the error message "We can't find any account asoociated with this username." below the password filed.
    [Tags]  BTGW-CLINIC-AUTH-SIGNIN-13      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-AUTH-SIGNIN-14: Sign in as Patient with valid username and password
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can sign in with valid username and password that belong to Patient account
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Tap [Sign in as Clinic user] button
    ...     - 2. Enter a valid username
    ...     - 3. Enter a valid password
    ...     - 4. Tap [Sign in] button
    ...
    ...     Expected Results:
    ...     - Step4: Login successfully, the user is navigated to Ref code screen
    [Tags]  BTGW-CLINIC-AUTH-SIGNIN-14       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-AUTH-SIGNIN-15: Sign in with Clinic account is deactivated
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot sign in with Clinic account is deactivated
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...     - The Clinic account is deactivated
    ...
    ...     Test Steps:
    ...     - 1. Tap [Sign in as Clinic user] button
    ...     - 2. Enter a valid username
    ...     - 3. Enter a valid password
    ...     - 4. Tap [Sign in] button
    ...
    ...     Expected Results:
    ...     - Step4: Displayed the error message "We can't find any account asoociated with this username." below the password filed.
    [Tags]  BTGW-CLINIC-AUTH-SIGNIN-15      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-AUTH-FORGOT-01: Forgot password link is clickable
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can click the Forgot password link
    ...
    ...     Precondition:
    ...     - The user is on the Sign in as Clinic screen
    ...
    ...     Test Steps:
    ...     - 1. Tap Forgot password link
    ...
    ...     Expected Results:
    ...     - Step1: Displayed the pop-up " Please contact the Biotricity Support team via following email cs@biotricity.com to reset your password. Thank you!"
    [Tags]  BTGW-CLINIC-AUTH-FORGOT-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-AUTH-SIGNOUT-01: Sign out from the app
    [Documentation]     Author: Phuong Tran
    ...

    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...
    ...     Test Steps:
    ...     - 1. Tap Navigation bar
    ...     - 2. Clicks the Sign out button
    ...
    ...     Expected Results:
    ...     - Step2: Sign out from the app successfully
    ...
    [Tags]  BTGW-CLINIC-AUTH-SIGNOUT-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
