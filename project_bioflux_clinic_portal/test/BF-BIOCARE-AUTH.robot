*** Settings ***
Documentation   Test Suite - Biocare Authentication
Metadata    sid     BF-BIOCARE-AUTH
Metadata    owner   Trinh Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py    ${ENV}
Library     project_biocare_portal/lib/web/Common.py

Suite Setup         SUITE SETUP
Suite Teardown      SUITE TEARDOWN
Force Tags          BF-BIOCARE-AUTH   web
Test Timeout        1h

*** Test Cases ***
BF-BIOCARE-AUTH-SIGNIN-01: Cannot Sign in to Biocare portal if the username or password or both are invalid
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. The following error message will be displayed: “Invalid username or password"
    ...     2. The user will still stay on the Login screen

    [Tags]      BF-BIOCARE-AUTH-SIGNIN-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-SIGNIN-02: Cannot Sign in to Biocare portal if the account was deactivated and the assigned facility is active
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. The following error message will be displayed: “Invalid username or password"
    ...     2. The user will still stay on the Login screen

    [Tags]      BF-BIOCARE-AUTH-SIGNIN-02          manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Sign In Biocare Portal      username=${PHY_USER}[1][username]       password=${PHY_USER}[1][password]
#    ${error_msg}    Get Error Message
#    Run Keyword And Continue On Failure    Should Contain     ${error_msg}     Invalid username or password
#    ${sign_in}     Wait Url Contains    text=sign-in
#    Run Keyword And Continue On Failure    Should Be Equal    ${sign_in}        ${True}

BF-BIOCARE-AUTH-SIGNIN-03: Cannot Sign in to Biocare portal if the account was deactivated and the assigned facility is closed
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. The following error message will be displayed: “Invalid username or password"
    ...     2. The user will still stay on the Login screen

    [Tags]      BF-BIOCARE-AUTH-SIGNIN-03           manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Sign In Biocare Portal      username=${PHY_USER}[1][username]       password=${PHY_USER}[1][password]
#    ${error_msg}    Get Error Message
#    Run Keyword And Continue On Failure    Should Contain     ${error_msg}     Invalid username or password
#    ${sign_in}     Wait Url Contains    text=sign-in
#    Run Keyword And Continue On Failure    Should Be Equal    ${sign_in}        ${True}

BF-BIOCARE-AUTH-SIGNIN-04: Can Sign in to Biocare portal with new the password has just been reset by Admin
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. A page requesting a password change will be displayed
    ...
    [Tags]      BF-BIOCARE-AUTH-SIGNIN-04     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-SIGNIN-05: Can Sign in to Biocare portal with the old account without setting new password
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. A page requesting a password change will be displayed

    [Tags]      BF-BIOCARE-AUTH-SIGNIN-05         manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Sign In Biocare Portal      username=${USER}[3][username]    password=${USER}[3][password]
#    ${new_password_page}     Wait Url Contains    text=new-password
#    Run Keyword And Continue On Failure    Should Be Equal    ${new_password_page}        ${True}

BF-BIOCARE-AUTH-SIGNIN-06: Can Sign in to Biocare portal with the old account has been set new password
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. A page requesting a password change will be displayed
    ...
    [Tags]      BF-BIOCARE-AUTH-SIGNIN-06     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-SIGNIN-07: Can Sign in to Biocare portal with the new account has just been created by Admin user
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. A page requesting a password change will be displayed
    ...
    [Tags]      BF-BIOCARE-AUTH-SIGNIN-07     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-SIGNIN-08: Can Sign in to Biocare portal with an account has deactivated status and facility status is closed
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     1. There is an account that having deactivated status and facility is closed
    ...     2. This account haven't set a new password yet
    ...
    ...
    ...     Test Steps:
    ...     1. Enter username and password
    ...     2. Click Sign in button
    ...     3. Fill all required fields then click the Set up new password button
    ...
    ...     Expected Results:
    ...     1. After clicking the Set up new password button, the Account Deactivated modal shall be displayed
    ...
    [Tags]      BF-BIOCARE-AUTH-SIGNIN-08     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-SIGNIN-09: Can Sign in to Biocare portal with an account has activate status and facility status is closed
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     1. There is an account that having activate status and facility is closed
    ...     2. This account haven't set a new password yet
    ...
    ...
    ...     Test Steps:
    ...     1. Enter username and password
    ...     2. Click Sign in button
    ...     3. Fill all required fields then click the Set up new password button
    ...
    ...     Expected Results:
    ...     1. After clicking the Set up new password button, user shall redirect to "Your clinic was closed!" page
    ...
    [Tags]      BF-BIOCARE-AUTH-SIGNIN-09     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-VERIFY-EMAIL-01-CP2.20.0: Verify email for new account created from Admin
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     New account is created
    ...
    ...     Test Steps:
    ...     1. Login to the Biocare portal
    ...     2. Click "Verify Email" button
    ...     3. Enter a valid and unique email (not yet verified on another users) and click "Next" button
    ...     4. Enter the received verfication code and complete proceed
    ...
    ...     Expected Results:
    ...     1. Display modal to verify email, the user can verify email or skip this feature until 30days from the account creation date
    ...     2. Display "Verify your email" screen
    ...     3. A verification code shall be sent to mailbox (will expire after 24 hours)
    ...     4. After successful email verification, the new email will be updated in the user's info
    ...
    [Tags]      BF-BIOCARE-AUTH-VERIFY-EMAIL-01-CP2.20.0     manual     CP-2.20.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-VERIFY-EMAIL-02-CP2.20.0: Verify email for old account after 30 days not yet verified since the release of this feature
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     There is an old account that not yet verified since the release of this feature (Release date: Delta 01/23, Staging 01/26, Prod 02/05)
    ...
    ...     Test Steps:
    ...     1. Login to the Biocare portal
    ...     2. Click "Verify Email" button
    ...     3. Enter a valid and unique email (not yet verified on another users) and click "Next" button
    ...     4. Enter the received verfication code and complete proceed
    ...
    ...     Expected Results:
    ...     1. Display modal to verify email with no option to skip the pop-up
    ...     2. Display "Verify your email" screen
    ...     3. A verification code shall be sent to mailbox (will expire after 24 hours)
    ...     4. After successful email verification, the new email will be updated in the user's info
    ...
    [Tags]      BF-BIOCARE-AUTH-VERIFY-EMAIL-02-CP2.20.0     manual     CP-2.20.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-VERIFY-EMAIL-03-CP2.20.0: Enter invalid verification code
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     The user is on "Verify your email" screen and has a verification code sent to user
    ...
    ...     Test Steps:
    ...     1. Enter invalid verification code, then click "Verify" button
    ...
    ...     Expected Results:
    ...     1. Display an error message "Invalid or expired verification code"
    ...
    [Tags]      BF-BIOCARE-AUTH-VERIFY-EMAIL-03-CP2.20.0     manual     CP-2.20.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-VERIFY-EMAIL-04-CP2.20.0: Enter the expired verification code
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     The user is on "Verify your email" screen and has a verification code sent to user exceed 24 hours
    ...
    ...     Test Steps:
    ...     1. Enter verification code mentioned in Precondition, then click "Verify" button
    ...
    ...     Expected Results:
    ...     1. Display an error message "Invalid or expired verification code"
    ...
    [Tags]      BF-BIOCARE-AUTH-VERIFY-EMAIL-04-CP2.20.0     manual     CP-2.20.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-VERIFY-EMAIL-05-CP2.20.0: Resend verification code
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     The user is on step "Enter verification code" of "Verify your email" screen
    ...
    ...     Test Steps:
    ...     1. Enter a valid email  >> Click "Verify"
    ...     2. Click "Didn’t get an verification code?" button
    ...     3. Wait for more than 2 minutes >> Click "Resend code"
    ...     4. Click "Resend code" continously
    ...
    ...     Expected Results:
    ...     1. Step 3 - The code is resent to user
    ...     2. Step 4 - Display an error message "Please wait for 2 minutes to perform the resend code"
    ...
    [Tags]      BF-BIOCARE-AUTH-VERIFY-EMAIL-05-CP2.20.0     manual     CP-2.20.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-VERIFY-EMAIL-06-CP2.20.0: Change email while Verify email proceed
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     The user is on step "Enter verification code" of "Verify your email" screen
    ...
    ...     Test Steps:
    ...     1. Enter a valid email  >> Click "Verify"
    ...     2. Click "Didn’t get an verification code?" button
    ...     3. Wait for more than 2 minutes >> Click "Change email" >> Enter valid email and go through a similar process BF-BIOCARE-AUTH-VERIFY-EMAIL-01-CP2.20.0
    ...
    ...     Expected Results:
    ...     1. After successful email verification, the new email will be updated in the user's info
    ...
    [Tags]      BF-BIOCARE-AUTH-VERIFY-EMAIL-06-CP2.20.0     manual     CP-2.20.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-VERIFY-EMAIL-07-CP2.20.0: Cannot verify email if the email used on another user
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     There is an email address that has been verified and used on another user
    ...     The user is on step "Enter email" of "Verify your email" screen
    ...
    ...     Test Steps:
    ...     1. Enter the email mentioned in Precondition  >> Click "Next"
    ...
    ...     Expected Results:
    ...     1. Display an error message "Email is already in use"
    ...
    [Tags]      BF-BIOCARE-AUTH-VERIFY-EMAIL-07-CP2.20.0     manual     CP-2.20.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-VERIFY-EMAIL-08-CP2.20.0: Cannot verify email if invalid email
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     The user is on step "Enter email" of "Verify your email" screen
    ...
    ...     Test Steps:
    ...     1. Enter invalid email format  >> Click "Next "
    ...
    ...     Expected Results:
    ...     1. Display an error message "Invalid email"
    ...
    [Tags]      BF-BIOCARE-AUTH-VERIFY-EMAIL-08-CP2.20.0     manual     CP-2.20.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-SIGNOUT-01: Sign out from the Biocare portal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. The user shall be signed out of the Biocare Portal and redirected to the Login screen
    ...     2. Users will be logged out from all portals on the browser after logging out successfully! – Note: pending in CP-2.16.0
    ...
    [Tags]      BF-BIOCARE-AUTH-SIGNOUT-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-SIGNOUT-02: Automatically Sign out from the Biocare portal after Admin reset password
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. If the password has just been reset by Admin, user accounts will be logged out and redirected to the login screen
    ...     2. Users will be logged out from all portals on the browser after logging out successfully!
    ...
    [Tags]      BF-BIOCARE-AUTH-SIGNOUT-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BF-BIOCARE-AUTH-FORGOT-PW-01: Reset password of the Biocare portal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Click Forgot password button
    ...
    ...     Expected Results:
    ...     1. When clicked, a modal notification with the content "Please contact us to reset your password." will be displayed
    ...     2. Click the Got it button shall dismiss modal
    ...
    [Tags]      BF-BIOCARE-AUTH-FORGOT-PW-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-FORGOT-PW-01-CP2.20.0: Reset password if username is valid and has verified email
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Ensure that only users with a verified email can use the Forgot Password feature to receive reset instructions
    ...
    ...     Precondition:
    ...     - There is an account that has verified email
    ...     - The user is on Signin page
    ...
    ...     Test Steps:
    ...     1. Click Forgot Your Password button
    ...     2. Enter valid username mentioned in Precondition and click "Submit"
    ...     3. Click the link in the mailbox
    ...     4. Input a new password (pass all policy rules) and complete process
    ...     5. Login back with new password
    ...
    ...     Expected Results:
    ...     1. Display "Reset your password" screen
    ...     2. An email has been sent to the associated email address (The link will expire after 1 hour)
    ...     3. Navigate the user to "Set up new password" page
    ...     4. Navigate the user to Biocare home portal
    ...     5. Can not signin with old (invalid) password
    ...
    ...     **Others
    ...     Update date: 3/8/2024 - Nhan Nguyen
    ...     Update date: 5/5/2025 - Thanh Tieu
    ...
    [Tags]      BF-BIOCARE-AUTH-FORGOT-PW-01-CP2.20.0    manual     CP-2.30.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-FORGOT-PW-02-CP2.20.0: Reset password if username is valid and has not verified email
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - There is an account that has not verified email
    ...     - The user is on Signin page
    ...
    ...     Test Steps:
    ...     1. Click Forgot Your Password button
    ...     2. Enter valid username mentioned in Precondition and click "Submit"
    ...     3. Click "Back to Sign In" button
    ...
    ...     Expected Results:
    ...     1. Display "Reset your password" screen
    ...     2. There is a message notified that they need to contact the support team to reset their password
    ...     3. Navigate the user to "Signin" page
    ...
    ...     **Others
    ...     Update date: 3/8/2024 - Nhan Nguyen
    ...
    [Tags]      BF-BIOCARE-AUTH-FORGOT-PW-02-CP2.20.0    manual     CP-2.20.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-FORGOT-PW-03-CP2.20.0: Reset password if username is invalid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on Signin page
    ...
    ...     Test Steps:
    ...     1. Click Forgot Your Password button
    ...     2. Enter invalid username and click "Submit" button
    ...
    ...     Expected Results:
    ...     1. Display an error message and cannot perform reset password
    ...
    ...     **Others
    ...     Update date: 3/8/2024 - Nhan Nguyen
    ...
    [Tags]      BF-BIOCARE-AUTH-FORGOT-PW-03-CP2.20.0    manual     CP-2.20.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#NOTE-WORK-FLOW-01: The Forgot password and Reset/Change Password sections are currently being verified differently because one page is not logged in and one page is logged in, so each test case for the Password policy for each page will be run separately.

BF-BIOCARE-AUTH-FORGOT-PW-04-CP2.30.0: Information on the Set up new password screen
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Ensure that all UI elements, password rules, and messages on the "Set Up New Password" screen (triggered from Forgot Password flow) are displayed correctly without requiring sign-in
    ...
    ...     Precondition:
    ...     - There is an account that has verified email
    ...     - The user is on Signin page
    ...
    ...     Test Steps:
    ...     1. Click on "Forgot Your Password" button on the Sign In page
    ...     2. Enter a valid username (with verified email) and click "Submit"
    ...     3. Access the registered email and click on the password reset link
    ...
    ...     Expected Results:
    ...     1. From Step 3, user is navigated directly to the "Set Up New Password" screen without being asked to sign in
    ...     2. There are two input-form for "New Password" and "Confirm new password"
    ...     3. A section is visible that outlines Password policy rules, including:
    ...        - At least one uppercase letter
    ...        - At least one lowercase letter
    ...        - At least one number
    ...        - At least one special character
    ...        - Minimum password length requirement
    ...     4. All password rule checkmarks are shown in gray by default (before user types anything)
    ...     5. There is a "eye" icon on each password field
    ...     6. A warning message: “You will be logged out from all sessions after changing password successfully!”
    ...     7. There are 2 buttons: Set Up New Password, Back to Sign In
    ...
    ...     **Others
    ...     Update date: 5/5/2025 - Thanh Tieu
    ...
    [Tags]      BF-BIOCARE-AUTH-FORGOT-PW-04-CP2.30.0    manual     CP-2.30.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-FORGOT-PW-05-CP2.30.0: Password Policy - The password has at least one uppercase letter
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that the password requires at least one uppercase letter
    ...
    ...     Precondition:
    ...    - The user is on "Reset your password" screen (Navigate from Forgot password link via mail)
    ...    - Password input-form is null
    ...
    ...     Test Steps:
    ...     1. Enter a uppercase letter
    ...     2. Delete all uppercase letters (if any)
    ...
    ...     Expected Results:
    ...     - Default status of uppercase check mark is gray
    ...     - Step 1: The uppercase check mark changes the status from gray to green
    ...     - Step 2: The uppercase check mark changes the status from green to gray
    ...
    ...     **Others
    ...     Update date: 5/5/2025 - Thanh Tieu
    ...
    [Tags]      BF-BIOCARE-AUTH-FORGOT-PW-05-CP2.30.0    manual     CP-2.30.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-FORGOT-PW-06-CP2.30.0: Password Policy - The password has at least one lowercase letter
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that the password requires at least one lowercase letter
    ...
    ...     Precondition:
    ...    - The user is on "Reset your password" screen (Navigate from Forgot password link via mail)
    ...    - Password input-form is null
    ...
    ...     Test Steps:
    ...     1. Enter a lowercase letter
    ...     2. Delete all lowercase letters (if any)
    ...
    ...     Expected Results:
    ...     - Default status of lowercase check mark is gray
    ...     - Step 1: The lowercase check mark shall change the status from gray to green
    ...     - Step 2: The lowercase check mark shall change the status from green to gray
    ...
    ...     **Others
    ...     Update date: 5/5/2025 - Thanh Tieu
    ...
    [Tags]      BF-BIOCARE-AUTH-FORGOT-PW-06-CP2.30.0    manual     CP-2.30.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-FORGOT-PW-07-CP2.30.0: Password Policy - The password has at least one number
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that the password requires at least one number
    ...
    ...     Precondition:
    ...    - The user is on "Reset your password" screen (Navigate from Forgot password link via mail)
    ...    - Password input-form is null
    ...
    ...     Test Steps:
    ...     1. Enter a number
    ...     2. Delete all numbers (if any)
    ...
    ...     Expected Results:
    ...     - Default status of number check mark is gray
    ...     - Step 1: The number check mark shall change the status from gray to green
    ...     - Step 2: The number check mark shall change the status from green to gray
    ...
    ...     **Others
    ...     Update date: 5/5/2025 - Thanh Tieu
    ...
    [Tags]      BF-BIOCARE-AUTH-FORGOT-PW-07-CP2.30.0    manual     CP-2.30.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-FORGOT-PW-08-CP2.30.0: Password Policy - The password must have at least one special character
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that the password requires at least one special character
    ...         - Characters that the system support: !@#$%^&*()_+-={}|:;"'<>,.?/~ 
    ...         - Characters that the system does not support: \`[ ] and SPACE
    ...
    ...     Precondition:
    ...    - The user is on "Reset your password" screen (Navigate from Forgot password link via mail)
    ...    - Password input-form is null
    ...
    ...     Test Steps:
    ...     1. Enter characters that is supported by system: !@#$%^&*()_+-={}|:;"'<>,.?/~ 
    ...     2. Enter characters that is NOT supported by system: \`[ ] and SPACE
    ...     3. Delete all characters that is NOT supported by system
    ...     4. Delete all special characters
    ...
    ...     Expected Results:
    ...     - Default status of special character check mark is gray
    ...     - STEP 1: The special character check mark shall change the status from gray to green
    ...     - STEP 2: The special character check mark shall change the status from green to gray
    ...     - STEP 3: The special character check mark shall change the status from gray to green
    ...     - STEP 4: The special character check mark shall change the status from green to gray
    ...
    ...     **Others
    ...     Update date: 5/5/2025 - Thanh Tieu
    ...
    [Tags]      BF-BIOCARE-AUTH-FORGOT-PW-08-CP2.30.0    manual     CP-2.30.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-FORGOT-PW-09-CP2.30.0: Password Policy - The Password must have at least 8 characters if this is normal user account
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that the normal user account password must have at least 8 characters and no more than 50 characters.
    ...
    ...     Precondition:
    ...    - The user is on "Reset your password" screen (Navigate from Forgot password link via mail)
    ...    - Password input-form is null
    ...    - User account is normal user (Not have Facility Admin role)
    ...
    ...     Test Steps:
    ...     1. Enter less than 8 letters/characters into password input-form
    ...     2. Enter 8 letters/characters into password input-form
    ...     3. Total enter 50 letters/characters into password input-form
    ...     4. Total enter more than 50 letters/characters into password input-form
    ...
    ...     Expected Results:
    ...     - Default status of Password length check mark is gray
    ...     - Step 1: Default status of Password length check mark is still gray
    ...     - Step 2: The Password length check mark shall change the status from gray to green
    ...     - Step 3: Default status of Password length check mark is still green
    ...     - Step 4: The Password length check mark shall change the status from green to gray
    ...
    ...     **Others
    ...     Update date: 5/5/2025 - Thanh Tieu
    ...
    [Tags]      BF-BIOCARE-AUTH-FORGOT-PW-09-CP2.30.0    manual     CP-2.30.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-FORGOT-PW-10-CP2.30.0: Password Policy - The password must be unique from the last 6 passwords of the user
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    - The user is on "Reset your password" screen (Navigate from Forgot password link via mail)
    ...    - User has changed password 6 times in a row (Example: P1, P2, ..., P6)
    ...    - Note: Password resets from the Admin Portal also count as old passwords
    ...
    ...     Test Steps:
    ...     1. Enter old passwords from P1 to P6
    ...     2. Click on Submit button
    ...     3. Enter a new password that qualified all policy
    ...     4. Click on Submit button
    ...
    ...     Expected Results:
    ...     - Step 2: Display this error message: “You’ve used this password before. Please choose a new password that hasn’t been used in your last 6 passwords.”
    ...     - Step 3: All check mark statuses are green
    ...     - Step 4: Change password successfully and can login by this one, previous password will be invalid.
    ...     - Once the password is updated, the user shall be navigated to the Biocare portal without logging in again, and the expiration countdown shall reset to 90 days from the new update time.
    ...
    ...     **Others
    ...     Update date: 5/5/2025 - Thanh Tieu
    ...
    [Tags]      BF-BIOCARE-AUTH-FORGOT-PW-10-CP2.30.0    manual     CP-2.30.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-FORGOT-PW-11: Complete Forgot Password flow and verify login with new password
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description:
    ...    - Validate that the user can successfully reset their password via the Forgot Password flow and log in using the new password
    ...
    ...     Precondition:
    ...    - There is an account with a verified email
    ...    - The user is on the Sign In page
    ...    - Or, password was last updated more than 90 days ago
    ...
    ...     Test Steps:
    ...    1. Click on "Forgot Your Password" on the Sign In page
    ...    2. Enter a valid username/email and click "Submit"
    ...    3. Open mailbox and click the password reset link
    ...    4. On the "Set Up New Password" screen, input a new password that meets all policy rules and confirm it
    ...    5. Click "Submit" button on "Set Up New Password" screen
    ...    6. Back to Biocare Sign-in page and try logging in using:
    ...        a. The new password
    ...        b. The old password
    ...
    ...     Expected Results:
    ...     - Display a toast message: “Your password has been updated successfully.”.
    ...     - Except for the user who takes action to change their password, there shall be a alert displayed:
    ...     Content: You have changed your password before.
    ...     - The clinic user will be redirected to the Biocare Portal home page if the new password setup is successful
    ...     - User can successfully log in using the new password/ User cannot log in using the old password
    ...     - Once the password is updated, the user shall be navigated to the Biocare portal without logging in again, and the expiration countdown shall reset to 90 days from the new update time.
    ...
    ...     **Others
    ...     Update date: 5/5/2025 - Thanh Tieu
    ...

    [Tags]      BF-BIOCARE-AUTH-FORGOT-PW-11    manual        CP-2.30.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#NOTE-WORK-FLOW-01: The Forgot password and Reset/Change Password sections are currently being verified differently because one page is not logged in and one page is logged in, so each test case for the Password policy for each page will be run separately.

BF-BIOCARE-AUTH-RESET-PW-01: Information on the Set up new password screen (after login with expired/reset password)
    [Documentation]     Author: Trinh Nguyen/ Thanh Tieu
    ...
    ...     Description:  
    ...    - Verify UI and required information on the "Set Up New Password" screen after logging in with an expired password or a temporary password set by Admin.
    ...
    ...     Precondition:
    ...    - Password is expired (90 days after last change or since system feature release)
    ...    - Password has been reset by Admin from the Admin Portal
    ...
    ...     Test Steps:
    ...     1. Go to the Sign In page
    ...     2. Enter the valid username and current password (either expired or reset by Admin)
    ...     3. Submit login
    ...     4. Observe the screen displayed after login
    ...
    ...     Expected Results:
    ...     1. User is forced to navigate to the "Set Up New Password" screen
    ...     2. There are two input-form for "New Password" and "Confirm new password"
    ...     3. A section is visible that outlines Password policy rules, including:
    ...        - At least one uppercase letter
    ...        - At least one lowercase letter
    ...        - At least one number
    ...        - At least one special character
    ...        - Minimum password length requirement
    ...     4. All password rule checkmarks are shown in gray by default (before user types anything)
    ...     5. There is a "eye" icon on each password field
    ...     6. A warning message: “You will be logged out from all sessions after changing password successfully!”
    ...     7. There are 2 buttons: Set Up New Password, Back to Sign In
    ...
    ...     **Others
    ...     Update date: 5/5/2025 - Thanh Tieu

    [Tags]      BF-BIOCARE-AUTH-RESET-PW-01   manual        CP-2.30.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-RESET-PW-02: Change password unsuccessfully if the new password entered has less than 8 characters
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Display an error message: “Password must have at least 8 characters.”
    ...
    [Tags]      BF-BIOCARE-AUTH-RESET-PW-02   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-RESET-PW-03: Change password unsuccessfully if the password entered includes a blank space
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Display an error message: “Password cannot include blank spaces.”
    ...
    [Tags]      BF-BIOCARE-AUTH-RESET-PW-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-RESET-PW-04: Change password unsuccessfully if the confirmation of the new password does not match with the new password entered
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Display an error message: “The confirm password does not match.”
    ...
    [Tags]      BF-BIOCARE-AUTH-RESET-PW-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-RESET-PW-05: Change password unsuccessfully if the user enters incomplete information
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Display an error message: “Please complete all information”
    ...
    [Tags]      BF-BIOCARE-AUTH-RESET-PW-05    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-RESET-PW-06: Change password unsuccessfully if the user does not reset their password on this page within 15 minutes
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Display a toast message: “Password reset time has expired. Please log in again.” if the user does not
    ...     reset their password on this page within 15 minutes. After 3 seconds , user accounts will be logged out
    ...     and redirected to the login screen
    ...
    [Tags]      BF-BIOCARE-AUTH-RESET-PW-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-RESET-PW-07: Change password unsuccessfully if the password contain the username
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Display an error message: “The password must not contain the username.”
    ...
    [Tags]      BF-BIOCARE-AUTH-RESET-PW-07    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-RESET-PW-08: Change password successfully if the confirmation of the new password match with the new password entered
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Display a toast message: “Your password has been updated successfully.”.
    ...     2. Except for the user who takes action to change their password, there shall be a alert displayed:
    ...     Content: You have changed your password before.
    ...     3. The clinic user will be redirected to the Biocare Portal home page if the new password setup is successful
    ...
    [Tags]      BF-BIOCARE-AUTH-RESET-PW-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-RESET-PW-09: Successfully complete password change if the new password match the password rules and re-login
    [Documentation]     Author: Trinh Nguyen/Thanh Tieu
    ...
    ...     Description: 
    ...    - Verify full flow when user is required to change password (due to expiration or admin reset), including password change and login validation.
    ...
    ...     Precondition:
    ...    1. One of the following conditions is true:
    ...        - Password expired (90 days since last update)
    ...        - Password reset by Admin
    ...    2. User is navigated to Set Up New Password screen after login
    ...
    ...     Test Steps:
    ...    1. Verify that the "Set Up New Password" screen is displayed
    ...    2. Enter a valid new password into New Password field
    ...    3. Enter the same valid password into Confirm New Password field
    ...    4. Click the Set Up New Password button
    ...    5. Wait for redirect or confirmation message
    ...    6. Go to Sign-In page
    ...    7. Enter username and old password → Click Sign In
    ...    8. Observe the result
    ...    9. Enter username and new password → Click Sign In
    ...
    ...     Expected Results:
    ...    - STEP 1: User sees "Set Up New Password" screen with required fields and policy indicators
    ...    - STEP 4: Password is successfully updated
    ...    - STEP 5: User is redirected to Biocare Home portal (or relevant landing page)
    ...    - STEP 7: Login using old password fails with appropriate error
    ...    - STEP 9: Login using new password succeeds, and user can access the portal
    ...    - Once the password is updated, the user shall be navigated to the Biocare portal without logging in again, and the expiration countdown shall reset to 90 days from the new update time.
    ...
    ...     **Others
    ...     Update date: 5/5/2025 - Thanh Tieu
    ...

    [Tags]      BF-BIOCARE-AUTH-RESET-PW-09    manual        CP-2.30.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-RESET-PW-10: Cancel setting new password
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Click the Back To Sign In button
    ...
    ...     Expected Results:
    ...     1. When users click Back To Sign In button, password will not change and the screen will return to the Biocare portal login page
    ...
    [Tags]      BF-BIOCARE-AUTH-RESET-PW-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-RESET-PW-11-CP2.30.0: Password Policy - The password has at least one uppercase letter
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that the password requires at least one uppercase letter
    ...
    ...     Precondition:
    ...    - The user is on "Reset your password" screen (Navigate from Sign-in page first time after resetting password by Admin)
    ...    - Password input-form is null
    ...
    ...     Test Steps:
    ...     1. Enter a uppercase letter
    ...     2. Delete all uppercase letters (if any)
    ...
    ...     Expected Results:
    ...     - Default status of uppercase check mark is gray
    ...     - Step 1: The uppercase check mark changes the status from gray to green
    ...     - Step 2: The uppercase check mark changes the status from green to gray
    ...
    ...     **Others
    ...     Update date: 5/5/2025 - Thanh Tieu
    ...
    [Tags]      BF-BIOCARE-AUTH-RESET-PW-11-CP2.30.0    manual     CP-2.30.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-RESET-PW-12-CP2.30.0: Password Policy - The password has at least one lowercase letter
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that the password requires at least one lowercase letter
    ...
    ...     Precondition:
    ...    - The user is on "Reset your password" screen (Navigate from Sign-in page first time after resetting password by Admin)
    ...    - Password input-form is null
    ...
    ...     Test Steps:
    ...     1. Enter a lowercase letter
    ...     2. Delete all lowercase letters (if any)
    ...
    ...     Expected Results:
    ...     - Default status of lowercase check mark is gray
    ...     - Step 1: The lowercase check mark shall change the status from gray to green
    ...     - Step 2: The lowercase check mark shall change the status from green to gray
    ...
    ...     **Others
    ...     Update date: 5/5/2025 - Thanh Tieu
    ...
    [Tags]      BF-BIOCARE-AUTH-RESET-PW-12-CP2.30.0    manual     CP-2.30.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-RESET-PW-13-CP2.30.0: Password Policy - The password has at least one number
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that the password requires at least one number
    ...
    ...     Precondition:
    ...    - The user is on "Reset your password" screen (Navigate from Sign-in page first time after resetting password by Admin)
    ...    - Password input-form is null
    ...
    ...     Test Steps:
    ...     1. Enter a number
    ...     2. Delete all numbers (if any)
    ...
    ...     Expected Results:
    ...     - Default status of number check mark is gray
    ...     - Step 1: The number check mark shall change the status from gray to green
    ...     - Step 2: The number check mark shall change the status from green to gray
    ...
    ...     **Others
    ...     Update date: 5/5/2025 - Thanh Tieu
    ...
    [Tags]      BF-BIOCARE-AUTH-RESET-PW-13-CP2.30.0    manual     CP-2.30.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-RESET-PW-14-CP2.30.0: Password Policy - The password must have at least one special character
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that the password requires at least one special character
    ...         - Characters that the system support: !@#$%^&*()_+-={}|:;"'<>,.?/~
    ...         - Characters that the system does not support: \`[ ] and SPACE
    ...
    ...     Precondition:
    ...    - The user is on "Reset your password" screen (Navigate from Sign-in page first time after resetting password by Admin)
    ...    - Password input-form is null
    ...
    ...     Test Steps:
    ...     1. Enter characters that is supported by system: !@#$%^&*()_+-={}|:;"'<>,.?/~
    ...     2. Enter characters that is NOT supported by system: \`[ ] and SPACE
    ...     3. Delete all characters that is NOT supported by system
    ...     4. Delete all special characters
    ...
    ...     Expected Results:
    ...     - Default status of special character check mark is gray
    ...     - STEP 1: The special character check mark shall change the status from gray to green
    ...     - STEP 2: The special character check mark shall change the status from green to gray
    ...     - STEP 3: The special character check mark shall change the status from gray to green
    ...     - STEP 4: The special character check mark shall change the status from green to gray
    ...
    ...     **Others
    ...     Update date: 5/5/2025 - Thanh Tieu
    ...
    [Tags]      BF-BIOCARE-AUTH-RESET-PW-14-CP2.30.0    manual     CP-2.30.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-RESET-PW-15-CP2.30.0: Password Policy - The Password must have at least 8 characters if this is normal user account
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that the normal user account password must have at least 8 characters and no more than 50 characters.
    ...
    ...     Precondition:
    ...    - The user is on "Reset your password" screen (Navigate from Sign-in page first time after resetting password by Admin)
    ...    - Password input-form is null
    ...    - User account is normal user (Not have Facility Admin role)
    ...
    ...     Test Steps:
    ...     1. Enter less than 8 letters/characters into password input-form
    ...     2. Enter 8 letters/characters into password input-form
    ...     3. Total enter 50 letters/characters into password input-form
    ...     4. Total enter more than 50 letters/characters into password input-form
    ...
    ...     Expected Results:
    ...     - Default status of Password length check mark is gray
    ...     - Step 1: Default status of Password length check mark is still gray
    ...     - Step 2: The Password length check mark shall change the status from gray to green
    ...     - Step 3: Default status of Password length check mark is still green
    ...     - Step 4: The Password length check mark shall change the status from green to gray
    ...
    ...     **Others
    ...     Update date: 5/5/2025 - Thanh Tieu
    ...
    [Tags]      BF-BIOCARE-AUTH-RESET-PW-15-CP2.30.0    manual     CP-2.30.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-RESET-PW-16-CP2.30.0: Password Policy - The password must be unique from the last 6 passwords of the user
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    - The user is on "Reset your password" screen (Navigate from Sign-in page first time after resetting password by Admin)
    ...    - User has changed password 6 times in a row (Example: P1, P2, ..., P6)
    ...    - Note: Password resets from the Admin Portal also count as old passwords
    ...
    ...     Test Steps:
    ...     1. Enter old passwords from P1 to P6
    ...     2. Click on Submit button
    ...     3. Enter a new password that qualified all policy and Enter correct value into "Confirm new password" input-form
    ...     4. Click on Submit button
    ...
    ...     Expected Results:
    ...     - Step 2: Display this error message: “You’ve used this password before. Please choose a new password that hasn’t been used in your last 6 passwords.”
    ...     - Step 3: All check mark statuses are green
    ...     - Step 4: Change password successfully and can login by this one, previous password will be invalid.
    ...
    ...     **Others
    ...     Update date: 5/5/2025 - Thanh Tieu
    ...
    [Tags]      BF-BIOCARE-AUTH-RESET-PW-16-CP2.30.0    manual     CP-2.30.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BF-BIOCARE-AUTH-LINKS-01: Privacy Policy content is displayed when clicking "Privacy Policy" button at the bottom page
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Privacy Policy content is displayed when clicking "Privacy Policy" button at the bottom page
    ...
    ...     Precondition: The user is on the Biocare portal login page
    ...
    ...     Test Steps:
    ...     1. Click "Privacy Policy" button located at the bottom page
    ...
    ...     Expected Results:
    ...     1. Modal will be displayed with the content of the Privacy Policy
    ...     2. The content must match the content in https://itrvn.sharepoint.com/:w:/s/BiofluxPortal/EcOnc_fzevJClFWo2m_Iem0BRX_Z-Ef8oyinftqPTqJSTw?e=GL5XOB&clickparams=eyJBcHBOYW1lIjoiVGVhbXMtRGVza3RvcCIsIkFwcFZlcnNpb24iOiIyNy8yMzA2MDQwMTE2MSIsIkhhc0ZlZGVyYXRlZFVzZXIiOmZhbHNlfQ%3D%3D
    ...     3. The modal has [Close] button

    [Tags]      BF-BIOCARE-AUTH-LINKS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-LINKS-02: Terms of Use content is displayed when clicking "Terms of Use" button at the bottom page
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Terms of Use content is displayed when clicking "Terms of Use" button at the bottom page
    ...
    ...     Precondition: The user is on the Biocare portal login page
    ...
    ...     Test Steps:
    ...     1. Click "Terms of Use" button located at the bottom page
    ...
    ...     Expected Results:
    ...     1. Modal will be displayed with the content of the Terms of Use
    ...     2. The content must match the content in https://itrvn.sharepoint.com/:w:/s/BiofluxPortal/EWhgPBjsH1BPlOW5_fNZFrEBvih0jh_xhNji_8ZsyOT2cw?e=6ZSChM&clickparams=eyJBcHBOYW1lIjoiVGVhbXMtRGVza3RvcCIsIkFwcFZlcnNpb24iOiIyNy8yMzA2MDQwMTE2MSIsIkhhc0ZlZGVyYXRlZFVzZXIiOmZhbHNlfQ%3D%3D
    ...     3. The modal has [Close] button

    [Tags]      BF-BIOCARE-AUTH-LINKS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-LINKS-03: Contact Support content is displayed when clicking "Contact Support" button at the bottom page
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Contact Support content is displayed when clicking "Contact Support" button at the bottom page
    ...
    ...     Precondition: The user is on the Biocare portal login page
    ...
    ...     Test Steps:
    ...     1. Click "Contact Support" button located at the bottom page
    ...
    ...     Expected Results:
    ...     1. Modal will be displayed with the contact support information
    ...     2. The content must match the content in
    ...     3. The modal has [Got It] button, when clicking this button the modal will be exited

    [Tags]      BF-BIOCARE-AUTH-LINKS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#NOTE-WORK-FLOW-02: With the Expiration flow, the "Set up new password" page will be identical to the Reset flow.

BF-BIOCARE-AUTH-EXPIRE-PW-01-CP2.30.0: Display and behavior of password expiration reminder banner
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: 
    ...    - Verify that starting 7 days before password expiration, a persistent banner appears across all portals with an “Update now” button that opens the Update Password side tab, and disappears immediately after password is changed.
    ...
    ...     Precondition:
    ...    - User account has password set to expire within 7 days
    ...    - User has not yet updated their password
    ...
    ...     Test Steps:
    ...     1. Log in to any portal (e.g., Biocare, Diagnostic, Insurance, Disease Management, or CIED)
    ...     2. Observe the top section of the interface after login
    ...     3. Click the “Update now” button on the displayed banner
    ...     4. Update the password successfully
    ...     5. Refresh or navigate to other portals
    ...
    ...     Expected Results:
    ...     - Step 2: A persistent banner appears reminding the user to update their password
    ...     - Step 3: Clicking “Update now” opens the Update Password side tab
    ...     - Step 4: After successful password change, the banner disappears immediately
    ...     - Step 5: Banner no longer appears on any portal
    ...
    ...     **Others
    ...     Update date: 5/5/2025 - Thanh Tieu
    ...

    [Tags]      BF-BIOCARE-AUTH-EXPIRE-PW-01-CP2.30.0   manual        CP-2.30.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-EXPIRE-PW-02-CP2.30.0: Password expiration enforcement - Expired password at login
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description:
    ...    - Verify system behavior when password is expired — enforce password change at login or after session expires, and redirect user to Update Password page before granting access.
    ...
    ...     Precondition: 
    ...    - User has not changed their password for over 90 days (Include new account is created over 90 days)
    ...    - OR It has been more than 90 days since the system update that introduced the password expiration policy
    ...
    ...     Test Steps:
    ...     1. Attempt to log in using a user account whose password expired (based on the conditions above)
    ...     2. Enter correct login credentials
    ...     3. Observe the post-login flow
    ...
    ...     Expected Results:
    ...     - User is authenticated
    ...     - System redirects user to the "Set up new Password" page immediately
    ...     - User cannot access other parts of the portal until password is updated
    ...
    ...     **Others
    ...     Update date: 5/5/2025 - Thanh Tieu
    ...

    [Tags]      BF-BIOCARE-AUTH-EXPIRE-PW-02-CP2.30.0    manual        CP-2.30.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-EXPIRE-PW-03-CP2.30.0: Password expiration enforcement - Password expires during active session
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description:
    ...    - Verify system behavior when password is expired — enforce password change at login or after session expires, and redirect user to Update Password page before granting access.
    ...
    ...     Precondition:
    ...    - User has not changed their password for over 90 days (Include new account is created over 90 days)
    ...    - OR It has been more than 90 days since the system update that introduced the password expiration policy
    ...
    ...     Test Steps:
    ...     1. Log in to the portal using a user account whose password is close to expiration (e.g., 89 days ago)
    ...     2. Wait until password expiration condition is met (i.e., reaches day 90 from last password change or system update)
    ...     3. Continue using the portal normally while keeping the tab or app open
    ...     4. Close the tab or kill the app (simulate session ending)
    ...     5. Open the portal again and attempt to access
    ...
    ...     Expected Results:
    ...     - System does not force logout or interrupt the session while the tab/app remains active
    ...     - After the tab is closed or app is killed, the next time user opens the portal, login requires password change
    ...     - User is redirected to the "Set up new Password" page and cannot access any functionality without updating the password
    ...
    ...     **Others
    ...     Update date: 5/5/2025 - Thanh Tieu
    ...

    [Tags]      BF-BIOCARE-AUTH-EXPIRE-PW-03-CP2.30.0    manual        CP-2.30.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library  project_biocare_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${PHY_USERS}        Get Config Param       NEW_USER
    ${PHY_USER}         Set Variable        ${PHY_USERS}[clinic_physician]
    ${VERSION}  Navigate To Biocare Sign In Page
    Set Suite Metadata    version     ${VERSION}
    Set Suite Metadata    browser     ${BROWSER.capitalize()}
    Set Suite Variable    ${PHY_USER}

SUITE TEARDOWN
    Quit Browser
