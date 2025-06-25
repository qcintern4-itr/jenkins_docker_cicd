*** Settings ***
Documentation   Motion Audio Authen test suite
Metadata    sid     MOAU-AUTHEN
Metadata    owner   Nang Phung
Library     corelib/AssertionExtension.py
#Library     corelib/MobileMOAUpHandler.py                ${DESIRED_CMOAUS}
#Library     project_motion_audio/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      MOAU-AUTHEN   mapp
Test Timeout    1h

*** Test Cases ***
MOAU-AUTHEN-01: Verify presence of "Sign up now" button on Sign In screen
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the "Sign up now" button is displayed on the Sign In screen.
    ...    Precondition:
    ...    - The user has opened the Motion Audio app and is on the Sign In screen.
    ...    Steps:
    ...    1. Locate the "Sign up now" button on the Sign In screen.
    ...    Expected Results:
    ...    1. The "Sign up now" button is visible on the Sign In screen.
    [Tags]    MOAU-AUTHEN-01   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-02: User navigates to Sign Up screen from Sign In screen
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that tapping the "Sign up now" button navigates the user to the Sign Up screen.
    ...    Precondition:
    ...    - The user is on the Sign In screen.
    ...    Steps:
    ...    1. Tap the "Sign up now" button on the Sign In screen.
    ...    Expected Results:
    ...    1. The user is navigated to the Sign Up screen.
    [Tags]    MOAU-AUTHEN-02   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-03: Validate required fields on Sign Up screen
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the required fields on the Sign Up screen are First name, Last name, Email, Country, Password, and Confirm password.
    ...    Precondition:
    ...    - The user is on the Sign Up screen.
    ...    Steps:
    ...    1. Ensure that the following fields are present on the Sign Up screen:
    ...    - First name
    ...    - Last name
    ...    - Email
    ...    - Country
    ...    - Password
    ...    - Confirm password
    ...    Expected Results:
    ...    1. All required fields are visible and appropriately labeled.
    [Tags]    MOAU-AUTHEN-03   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-04: Validate email format and uniqueness
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the email address entered on the Sign Up screen must be in a valid format and unique.
    ...    Precondition:
    ...    - The user is on the Sign Up screen.
    ...    Steps:
    ...    1. Enter a valid email address in the email field.
    ...    2. Enter an invalid email address in the email field.
    ...    3. Enter an email address that has already been used to register.
    ...    Expected Results:
    ...    1. The system accepts valid email formats or shows an error for invalid email formats.
    ...    2. The system alerts if the email address has already been used for registration.
    [Tags]    MOAU-AUTHEN-04   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-05: Country selection and default value
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the country field is a required field and the default value is "United States".
    ...    Precondition:
    ...    - The user is on the Sign Up screen.
    ...    Steps:
    ...    1. Tap the country field.
    ...    2. Select a country from the bottom sheet.
    ...    3. Verify that the default value is "United States".
    ...    Expected Results:
    ...    1. A bottom sheet with a country list is displayed.
    ...    2. "United States" is pre-selected by default.
    [Tags]    MOAU-AUTHEN-05   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-06: Password and confirm password validation
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the password and confirm password fields match and meet the minimum length requirement.
    ...    Precondition:
    ...    - The user is on the Sign Up screen.
    ...    Steps:
    ...    1. Enter a password with less than 8 characters.
    ...    2. Enter a password and confirm password that do not match.
    ...    3. Enter a valid password and confirm password that match.
    ...    Expected Results:
    ...    1. The system shows an error for passwords that do not meet the minimum length requirement.
    ...    2. The system shows an error if the password and confirm password do not match.
    ...    3. The system accepts valid passwords that meet the length requirement and match the confirm password.
    [Tags]    MOAU-AUTHEN-06   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-07: Sign Up form validation errors
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the system highlights fields with errors and displays error messages below them when the form validation fails.
    ...    Precondition:
    ...    - The user is on the Sign Up screen.
    ...    Steps:
    ...    1. Leave some required fields empty.
    ...    2. Enter invalid data in one or more fields.
    ...    3. Tap the "Sign up" button.
    ...    Expected Results:
    ...    1. The system highlights the invalid fields and shows error messages below each of them.
    [Tags]    MOAU-AUTHEN-07   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-08: Successful Sign Up navigates to Email verification screen
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that after successfully completing the Sign Up form, the user is navigated to the Email verification screen.
    ...    Precondition:
    ...    - All required fields on the Sign Up screen are completed correctly.
    ...    Steps:
    ...    1. Complete the Sign Up form with valid data.
    ...    2. Tap the "Sign up" button.
    ...    Expected Results:
    ...    1. The system creates a new user account and navigates the user to the Email verification screen.
    [Tags]    MOAU-AUTHEN-08   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-09: Email verification and resend option
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can resend the verification email or re-enter the email to correct mistakes.
    ...    Precondition:
    ...    - The user is on the Email verification screen.
    ...    Steps:
    ...    1. Tap the "Email not received?" button.
    ...    2. Choose the "Resend mail" option.
    ...    3. Choose the "Re-enter mail" option to return to the Sign Up screen.
    ...    Expected Results:
    ...    1. The system resends the verification email successfully.
    ...    2. The system navigates back to the Sign Up screen with the previously entered data.
    [Tags]    MOAU-AUTHEN-09   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-10: User can only sign in after email verification
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can only sign in after successfully clicking the email verification link.
    ...    Precondition:
    ...    - The user has received the verification email.
    ...    Steps:
    ...    1. Open the verification email.
    ...    2. Click the verification link.
    ...    Expected Results:
    ...    1. The user can successfully log in with the registered account after confirming their email.
    [Tags]    MOAU-AUTHEN-10   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-11: User can login with correct credentials
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can successfully log in with the correct email and password.
    ...    Precondition:
    ...    - The user has created their account successfully.
    ...    Steps:
    ...    1. Enter the registered email in the "Email" field.
    ...    2. Enter the correct password in the "Password" field.
    ...    3. Tap the "Login" button.
    ...    Expected Results:
    ...    1. The system validates the credentials and grants access to the user's account.
    ...    2. The user is navigated to the Home screen of the app.
    [Tags]    MOAU-AUTHEN-11   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-12: Error message for an unregistered account
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that an error message is displayed when the user enters an unregistered account.
    ...    Precondition:
    ...    - The user has an account but enters an incorrect email.
    ...    Steps:
    ...    1. Enter an unregistered account.
    ...    2. Tap the "Login" button.
    ...    Expected Results:
    ...    2. The system displays an error message stating "User does not exist."
    [Tags]    MOAU-AUTHEN-12   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-13: Error message for incorrect password
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that an error message is displayed when the user enters an incorrect password.
    ...    Precondition:
    ...    - The user has an account but enters an incorrect password.
    ...    Steps:
    ...    1. Enter the correct email in the "Email" field.
    ...    2. Enter an incorrect password in the "Password" field.
    ...    3. Tap the "Login" button.
    ...    Expected Results:
    ...    1. The system displays an error message stating "Incorrect username or password."
    [Tags]    MOAU-AUTHEN-13   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-14: The user cannot log in with a registered account that has not been verified
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user The user cannot log in with a registered account that has not been verified
    ...    Precondition:
    ...    - The user is on the login screen.
    ...    Steps:
    ...    1. Register a new account but make sure not to verify the registered email
    ...    2. Log in with a registered account that has not verified the email.
    ...    Expected Results:
    ...    1. You will be redirected to the "Verify your email" screen."
    [Tags]    MOAU-AUTHEN-14   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-15: User can login after email verification
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can log in after their email has been verified.
    ...    Precondition:
    ...    - The user has received and clicked the verification link in the email.
    ...    Steps:
    ...    1. Enter the registered email in the "Email" field.
    ...    2. Enter the correct password in the "Password" field.
    ...    3. Tap the "Login" button.
    ...    Expected Results:
    ...    1. The system validates the credentials and grants access to the user's account.
    ...    2. The user is navigated to the Home screen of the app.
    [Tags]    MOAU-AUTHEN-15   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-16: User can request password reset via email
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can request a password reset by submitting their registered email.
    ...    Precondition:
    ...    - The user has created their account and is on the Sign In screen.
    ...    Steps:
    ...    1. Tap on the "Forgot your Password?" option.
    ...    2. On the Forgot your password screen, enter the registered email address.
    ...    3. Tap on the “Send request” button.
    ...    Expected Results:
    ...    1. The system sends a one-time password (verification code) to the user's email and displays a success message.
    ...    2. The UI changes to display verification code input section, a resend option, and password reset fields.
    [Tags]    MOAU-AUTHEN-16   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-17: User can resend verification code after 60 seconds
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can request a new verification code only after 60 seconds from the previous attempt.
    ...    Precondition:
    ...    - The user has requested an verification code and is on the Forgot Password screen.
    ...    Steps:
    ...    1. After receiving verification code, tap on the "Resend code" button before 60 seconds have passed.
    ...    Expected Results:
    ...    1. The "Resend code" button is disabled until 60 seconds have passed.
    [Tags]    MOAU-AUTHEN-17   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-18: User can enter and validate verification code
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can enter verification code and that it is validated properly.
    ...    Precondition:
    ...    - The user has received an verification code and is on the Forgot Password screen.
    ...    Steps:
    ...    1. Enter the verification code into the verification code input field.
    ...    2. Tap the “Update password” button.
    ...    Expected Results:
    ...    1. If verification code is correct, the user proceeds to reset their password.
    ...    2. If verification code is incorrect, the system displays the error message: “Wrong verification code”.
    ...    3. If verification code is expired, the system displays the error message: “Verification code is expired”.
    [Tags]    MOAU-AUTHEN-18   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-19: User cannot proceed with mismatched passwords
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the system validates the password confirmation fields during password reset.
    ...    Precondition:
    ...    - The user has entered the verification code and is on the password reset section.
    ...    Steps:
    ...    1. Enter a new password that meets the criteria (minimum 8 characters).
    ...    2. Enter a different password in the "Confirm new password" field.
    ...    3. Tap the “Update password” button.
    ...    Expected Results:
    ...    1. The system displays an error message: "Passwords do not match."
    [Tags]    MOAU-AUTHEN-19   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-20: User can reset password successfully
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can successfully reset their password after entering matching new passwords and valid verification code.
    ...    Precondition:
    ...    - The user has entered a correct verification code and is on the password reset screen.
    ...    Steps:
    ...    1. Enter a valid new password that meets the requirements.
    ...    2. Enter the same password in the "Confirm new password" field.
    ...    3. Tap the “Update password” button.
    ...    Expected Results:
    ...    1. The system saves the new password.
    ...    2. A success message is displayed confirming the password has been updated.
    ...    3. The user is navigated back to the Sign In screen.
    [Tags]    MOAU-AUTHEN-20   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-22: User can navigate to the "Profile" tab
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can navigate to the "Profile" tab after logging in.
    ...    Precondition:
    ...    - The user has successfully logged into the app.
    ...    Steps:
    ...    1. On the Home screen, tap on the "Profile" tab.
    ...    Expected Results:
    ...    1. The user is navigated to the "Profile" tab successfully.
    [Tags]    MOAU-AUTHEN-22   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-23: User can log out from the "Profile" tab
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can log out by selecting the "Log Out" option from the "Profile" tab.
    ...    Precondition:
    ...    - The user is on the "Profile" tab.
    ...    Steps:
    ...    1. Tap on the "Log Out" option in the "Profile" tab.
    ...    Expected Results:
    ...    1. The user is logged out successfully.
    ...    2. The system redirects the user to the login screen.
    [Tags]    MOAU-AUTHEN-23   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-25: User is returned to the login screen after log out
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user is returned to the login screen after logging out.
    ...    Precondition:
    ...    - The user has logged out successfully.
    ...    Steps:
    ...    1. After logging out, confirm that the user is returned to the login screen.
    ...    Expected Results:
    ...    1. The login screen is displayed.
    [Tags]    MOAU-AUTHEN-25   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-26: User can navigate to the Account Deletion Confirmation screen
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can navigate to the Account Deletion Confirmation screen by selecting the "Delete account" button.
    ...    Precondition:
    ...    - The user has logged in and is on the "Profile" screen.
    ...    Steps:
    ...    1. Tap on the "Delete account" button.
    ...    Expected Results:
    ...    1. The user is navigated to the Account Deletion Confirmation screen.
    [Tags]    MOAU-AUTHEN-26   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-27: User can choose not to delete the account and return to Profile screen
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can choose not to delete the account by selecting "No" and be redirected to the Profile screen.
    ...    Precondition:
    ...    - The user is on the Account Deletion Confirmation screen.
    ...    Steps:
    ...    1. Tap on the "No" button.
    ...    Expected Results:
    ...    1. The user is redirected back to the Profile screen without any changes to the account.
    [Tags]    MOAU-AUTHEN-27   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-28: User can confirm the deletion of their account
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can confirm account deletion by selecting "Yes" and proceed with account deletion.
    ...    Precondition:
    ...    - The user is on the Account Deletion Confirmation screen.
    ...    Steps:
    ...    1. Tap on the "Yes" button.
    ...    Expected Results:
    ...    1. A modal appears notifying the user of the account deletion request.
    ...    2. The system sends an Account Deletion email to the user.
    [Tags]    MOAU-AUTHEN-28   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-29: Account is permanently deleted after confirmation
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user’s account is permanently deleted after confirming the deletion.
    ...    Precondition:
    ...    - The user has confirmed account deletion.
    ...    Steps:
    ...    1. Confirm the deletion on the Account Deletion Confirmation screen.
    ...    Expected Results:
    ...    1. The user’s account is permanently deleted.
    ...    2. The user is redirected to the Sign-In screen.
    [Tags]    MOAU-AUTHEN-29   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-30: All devices of the user are notified when account is deleted
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that all devices using the same account are notified that the account has been deleted.
    ...    Precondition:
    ...    - The user’s account is deleted.
    ...    Steps:
    ...    1. Log in on another device with the same account.
    ...    Expected Results:
    ...    1. The user is redirected to the Sign-In screen.
    [Tags]    MOAU-AUTHEN-30   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUTHEN-31: User can create a new account with the old email
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can create a new account using the email address that was previously associated with a deleted account.
    ...    Precondition:
    ...    - The user’s account has been deleted.
    ...    Steps:
    ...    1. Attempt to create a new account using the email that was associated with the deleted account.
    ...    Expected Results:
    ...    1. The system allows the user to create a new account with the old email address.
    [Tags]    MOAU-AUTHEN-31   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}
*** Keywords ***
SUITE SETUP
    ${MOAUP_NODE}     Get Device Node
    Import Library    project_motion_audio/lib/mMOAUp/Common.py     ${MOAUP_NODE}     ${ENV}
    Start Motion Audio
    ${USER}     Get Config Param    USER
    Sign In Motion Audio    email=${USER}[username]      password=${USER}[password]
    ${RELEASE_VERSION}     Get Release Version
    Set Suite Metadata     version     ${RELEASE_VERSION}

SUITE TEARDOWN
    Quit All
