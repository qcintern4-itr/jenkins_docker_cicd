*** Settings ***
Documentation   Test Suite - Biocare Authentication
Metadata    sid     BF-BIOCARE-AUTH-BILLING
Metadata    owner   Trinh Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py    ${ENV}
Library     project_biocare_portal/lib/web/Common.py

Suite Setup         SUITE SETUP
Suite Teardown      SUITE TEARDOWN
Force Tags          BF-BIOCARE-AUTH-BILLING   web
Test Timeout        1h

*** Test Cases ***
BF-BIOCARE-AUTH-BILLING-SIGNIN-01: Cannot Sign in to Biocare portal if the username or password or both are invalid
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

    [Tags]      BF-BIOCARE-AUTH-BILLING-SIGNIN-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-SIGNIN-02: Cannot Sign in to Biocare portal if the account was deactivated and the assigned facility is active
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

    [Tags]      BF-BIOCARE-AUTH-BILLING-SIGNIN-02          manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Sign In Biocare Portal      username=${PHY_USER}[1][username]       password=${PHY_USER}[1][password]
#    ${error_msg}    Get Error Message
#    Run Keyword And Continue On Failure    Should Contain     ${error_msg}     Invalid username or password
#    ${sign_in}     Wait Url Contains    text=sign-in
#    Run Keyword And Continue On Failure    Should Be Equal    ${sign_in}        ${True}

BF-BIOCARE-AUTH-BILLING-SIGNIN-03: Cannot Sign in to Biocare portal if the account was deactivated and the assigned facility is closed
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

    [Tags]      BF-BIOCARE-AUTH-BILLING-SIGNIN-03           manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Sign In Biocare Portal      username=${PHY_USER}[1][username]       password=${PHY_USER}[1][password]
#    ${error_msg}    Get Error Message
#    Run Keyword And Continue On Failure    Should Contain     ${error_msg}     Invalid username or password
#    ${sign_in}     Wait Url Contains    text=sign-in
#    Run Keyword And Continue On Failure    Should Be Equal    ${sign_in}        ${True}

BF-BIOCARE-AUTH-BILLING-SIGNIN-04: Can Sign in to Biocare portal with new the password has just been reset by Admin
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-SIGNIN-04     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-SIGNIN-05: Can Sign in to Biocare portal with the old account without setting new password
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

    [Tags]      BF-BIOCARE-AUTH-BILLING-SIGNIN-05         manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Sign In Biocare Portal      username=${USER}[3][username]    password=${USER}[3][password]
#    ${new_password_page}     Wait Url Contains    text=new-password
#    Run Keyword And Continue On Failure    Should Be Equal    ${new_password_page}        ${True}

BF-BIOCARE-AUTH-BILLING-SIGNIN-06: Can Sign in to Biocare portal with the old account has been set new password
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-SIGNIN-06     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-SIGNIN-07: Can Sign in to Biocare portal with the new account has just been created by Admin user
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-SIGNIN-07     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-SIGNIN-08: Can Sign in to Biocare portal with an account has deactivated status and facility status is closed
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-SIGNIN-08     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-SIGNIN-09: Can Sign in to Biocare portal with an account has activate status and facility status is closed
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-SIGNIN-09     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-VERIFY-EMAIL-01-CP2.20.0: Verify email for new account created from Admin
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-VERIFY-EMAIL-01-CP2.20.0     manual     CP-2.20.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-VERIFY-EMAIL-02-CP2.20.0: Verify email for old account after 30 days not yet verified since the release of this feature
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-VERIFY-EMAIL-02-CP2.20.0     manual     CP-2.20.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-VERIFY-EMAIL-03-CP2.20.0: Enter invalid verification code
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-VERIFY-EMAIL-03-CP2.20.0     manual     CP-2.20.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-VERIFY-EMAIL-04-CP2.20.0: Enter the expired verification code
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-VERIFY-EMAIL-04-CP2.20.0     manual     CP-2.20.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-VERIFY-EMAIL-05-CP2.20.0: Resend verification code
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-VERIFY-EMAIL-05-CP2.20.0     manual     CP-2.20.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-VERIFY-EMAIL-06-CP2.20.0: Change email while Verify email proceed
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
    ...     3. Wait for more than 2 minutes >> Click "Change email" >> Enter valid email and go through a similar process BF-BIOCARE-AUTH-BILLING-VERIFY-EMAIL-01-CP2.20.0
    ...
    ...     Expected Results:
    ...     1. After successful email verification, the new email will be updated in the user's info
    ...
    [Tags]      BF-BIOCARE-AUTH-BILLING-VERIFY-EMAIL-06-CP2.20.0     manual     CP-2.20.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-VERIFY-EMAIL-07-CP2.20.0: Cannot verify email if the email used on another user
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     There is an email adrress that has been verified and used on another user
    ...     The user is on step "Enter email" of "Verify your email" screen
    ...
    ...     Test Steps:
    ...     1. Enter the email mentioned in Precondition  >> Click "Next"
    ...
    ...     Expected Results:
    ...     1. Display an error message "Email is already in use"
    ...
    [Tags]      BF-BIOCARE-AUTH-BILLING-VERIFY-EMAIL-07-CP2.20.0     manual     CP-2.20.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-VERIFY-EMAIL-08-CP2.20.0: Cannot verify email if invalid email
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-VERIFY-EMAIL-08-CP2.20.0     manual     CP-2.20.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-SIGNOUT-01: Sign out from the Biocare portal
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-SIGNOUT-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-SIGNOUT-02: Automatically Sign out from the Biocare portal after Admin reset password
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-SIGNOUT-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BF-BIOCARE-AUTH-BILLING-FORGOT-PW-01: Reset password of the Biocare portal
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-FORGOT-PW-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-FORGOT-PW-01-CP2.20.0: Reset password if username is valid and has verified email
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - There is an account that has verified email
    ...     - The user is on Signin page
    ...
    ...     Test Steps:
    ...     1. Click Forgot Your Password button
    ...     2. Enter valid username mentioned in Precondition and click "Submit"
    ...     3. Click the link in the mailbox
    ...     4. Input a new password and complete process
    ...     5. Login back with new password
    ...
    ...     Expected Results:
    ...     1. Display "Reset your password" screen
    ...     2. An email has been sent to the associated email address (The link will expire after 1 hour)
    ...     3. Navigate the user to "Set up new password" page
    ...     4. Navigate the user to Biocare home portal
    ...
    ...     **Others
    ...     Update date: 3/8/2024 - Nhan Nguyen
    ...
    [Tags]      BF-BIOCARE-AUTH-BILLING-FORGOT-PW-01-CP2.20.0    manual     CP-2.20.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-FORGOT-PW-02-CP2.20.0: Reset password if username is valid and has not verified email
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-FORGOT-PW-02-CP2.20.0    manual     CP-2.20.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-FORGOT-PW-03-CP2.20.0: Reset password if username is invalid
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-FORGOT-PW-03-CP2.20.0    manual     CP-2.20.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-RESET-PW-01: Information on the Set up new password screen
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
    ...     1. New password
    ...     2. Confirm new password
    ...     3. There shall also be Password rules letting the user know what is required to create a valid password:
    ...     "A password must be at least 8 characters, must not contain the username and should be a mixture of uppercase and lowercase letters, numbers, and symbols."
    ...     5. There is a "eye" icon on each password field
    ...     6. A warning message: “You will be logged out from all sessions after changing password successfully!”
    ...     7. There are 2 butons: Set Up New Password, Back to Sign In
    ...

    [Tags]      BF-BIOCARE-AUTH-BILLING-RESET-PW-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-RESET-PW-02: Change password unsuccessfully if the new password entered has less than 8 characters
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-RESET-PW-02   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-RESET-PW-03: Change password unsuccessfully if the password entered includes a blank space
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-RESET-PW-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-RESET-PW-04: Change password unsuccessfully if the confirmation of the new password does not match with the new password entered
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-RESET-PW-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-RESET-PW-05: Change password unsuccessfully if the user enters incomplete information
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-RESET-PW-05    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-RESET-PW-06: Change password unsuccessfully if the user does not reset their password on this page within 15 minutes
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-RESET-PW-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-RESET-PW-07: Change password unsuccessfully if the password contain the username
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-RESET-PW-07    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-RESET-PW-08: Change password successfully if the confirmation of the new password match with the new password entered
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-RESET-PW-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-RESET-PW-09: Change password successfully if the new password match the password rules
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-RESET-PW-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-RESET-PW-10: Cancel setting new password
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
    [Tags]      BF-BIOCARE-AUTH-BILLING-RESET-PW-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-LINKS-01: Privacy Policy content is displayed when clicking "Privacy Policy" button at the bottom page
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

    [Tags]      BF-BIOCARE-AUTH-BILLING-LINKS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-LINKS-02: Terms of Use content is displayed when clicking "Terms of Use" button at the bottom page
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

    [Tags]      BF-BIOCARE-AUTH-BILLING-LINKS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-AUTH-BILLING-LINKS-03: Contact Support content is displayed when clicking "Contact Support" button at the bottom page
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

    [Tags]      BF-BIOCARE-AUTH-BILLING-LINKS-03    manual
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
