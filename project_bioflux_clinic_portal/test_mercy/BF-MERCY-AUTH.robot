*** Settings ***
Documentation   Test Suite - Clinic Portal - Mercy
Metadata    sid     BF-MERCY-AUTH
Metadata    owner   Nhan Nguyen
Library     Collections
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py                                     ${BROWSER}  ${HEADLESS}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py        ${ENV}    WITH NAME   CpConfig
Library     project_bioflux_callcenter_portal/lib/ConfigHandler.py    ${ENV}    WITH NAME   CcConfig
Library     project_bioflux_clinic_portal/lib/api/Clinic.py           ${ENV}
Library     project_bioflux_clinic_portal/lib/api/Auth.py             ${ENV}
Library     project_bioflux_clinic_portal/lib/web/Common.py
Library     project_bioflux_clinic_portal/lib/web/Support.py
Library     project_bioflux_clinic_portal/lib/web/Inbox.py
Library     project_bioflux_clinic_portal/lib/web/Studies.py
Library     project_bioflux_clinic_portal/lib/web/Devices.py
Library     project_bioflux_clinic_portal/lib/web/Fleet.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BF-MERCY-AUTH     web
Test Timeout    1h

*** Test Cases ***

#BF-020-Mercy Facility Custom - REV-1.0/ RS-153 Set up account after first login for Mercy users

BF-MERCY-AUTH-SETUP-01: First Login - Login successfully using password and username sent via Welcome mail
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description:  With each created successful account, a welcome email will be sent to user verified mail that attach a password, user can log in by it. After login successfully first time, it will direct to Set up new password page
    ...
    ...     Precondition:
    ...    - A user account has been created and marked as verified
    ...    - User received a Welcome email containing temporary username and password
    ...    - User is on the Sign-in page
    ...
    ...     Test Steps:
    ...    1. Open the Welcome email
    ..     2. Copy the username and password from the email
    ...    3. Go to the Sign-in page
    ...    4. Enter the credentials and click "Sign in"
    ...
    ...     Expected Results:
    ...    - Step 1–2: Email is successfully received with valid credentials
    ...    - Step 4: Login is successful
    ...    - User is immediately redirected to the “Set up new password” screen
    ...

    [Tags]  BF-MERCY-AUTH-SETUP-01      CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SETUP-02: First Login - Verify UI elements on "Set up New Password" screen
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description: After signing in successfully, user is directed to "Set up new Password" screen
    ...
    ...     Precondition:
    ...    - User has logged in for the first time
    ...
    ...     Test Steps:
    ...    - Go to the Sign-in page
    ...    - Enter the credentials and click "Sign in"
    ...
    ...     Expected Results:
    ...     - User is navigated to "Set up New Password" page
    ...     - There are two input fields: "New Password" and "Confirm New Password"
    ...     - A password policy section is displayed, listing the following rules with gray checkmarks:
    ...         + At least 1 uppercase letter
    ...         + At least 1 lowercase letter
    ...         + At least 1 number
    ...         + At least 1 special character
    ...         + Minimum length requirement 15 characters
    ...     - Each password field includes an "eye" icon to toggle visibility
    ...     - A warning message is displayed: “You will be logged out from all sessions after changing password successfully!”
    ...     - Buttons available: "Set Up New Password" and "Back to Sign In"
    ...

    [Tags]  BF-MERCY-AUTH-SETUP-02      CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SETUP-03: First Login - Set up New Password - All rules are unmet initially
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    - User is on "Set up New Password" page
    ...
    ...     Test Steps:
    ...    1. Enter a password that does not meet any policy rule (e.g., aaaaaa)
    ...    2. Observe the password rule section
    ...
    ...     Expected Results:
    ...    - All check marks remain gray (no rule is satisfied)
    ...

    [Tags]  BF-MERCY-AUTH-SETUP-03      CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SETUP-04: First Login - Set up New Password - Rules update dynamically as user types
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    - User is on "Set up New Password" page
    ...
    ...     Test Steps:
    ...    1. Enter password "Itr@1234"
    ...    2. Observe password rule section
    ...
    ...     Expected Results:
    ...    - Each rule that is met turns its check mark to green
    ...    - Rules unmet remain gray
    ...

    [Tags]  BF-MERCY-AUTH-SETUP-04      CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SETUP-05: First Login - Set up New Password - Password mismatch handling
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    - User is on "Set up New Password" page
    ...
    ...     Test Steps:
    ...    1. Enter Test@123 in "New Password"
    ...    2. Enter Test@321 in "Confirm New Password"
    ...    3. Click "Set Up New Password"
    ...
    ...     Expected Results:
    ...    - A validation message appears indicating the passwords do not match
    ...    - Password is not updated

    [Tags]  BF-MERCY-AUTH-SETUP-05      CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SETUP-06: First Login - Set up New Password - Set up password successfully and proceed to MFA
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    - User is on "Set up New Password" page
    ...    - Password inputs pass all validation rules and match
    ...
    ...     Test Steps:
    ...    1. Enter Itr@1234 in both fields
    ...    2. Click "Set Up New Password"
    ...
    ...     Expected Results:
    ...    - Password is successfully updated
    ...    - User is navigated to MFA setup page
    ...

    [Tags]  BF-MERCY-AUTH-SETUP-06      CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SETUP-07: First Login - Set up New Password - Interrupted during password setup requires re-login
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    - User is in the middle of the Set up New Password process
    ...
    ...     Test Steps:
    ...    1. Reload the browser / Close tab / Let session expire
    ...    2. Attempt to continue the setup
    ...
    ...     Expected Results:
    ...    - System redirects user to login page
    ...    - After login, user resumes from Set up New Password step
    ...

    [Tags]  BF-MERCY-AUTH-SETUP-07      CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SETUP-08: First Login - Set up MFA - Display and interact with phone number input during MFA setup
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description: Verify that user can input phone number and the default country code is +1 (US).
    ...
    ...     Precondition:
    ...    - User has just finished setting new password after first login.
    ...
    ...     Test Steps:
    ...    1. Navigate to MFA setup page.
    ...    2. Observe the phone number input field.
    ...    3. Check the default selected country code.
    ...    4. Enter a valid phone number.
    ...
    ...     Expected Results:
    ...    - The default country code is set to +1 (US).
    ...    - User is able to input a valid phone number.
    ...

    [Tags]  BF-MERCY-AUTH-SETUP-08      CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SETUP-09: First Login - Set up MFA - Request verification code and validate resend constraints
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description: Validate the behavior of requesting and resending the 6-digit verification code.
    ...
    ...     Precondition:
    ...    - User is on MFA setup screen after entering valid phone number.
    ...
    ...     Test Steps:
    ...    1. Click on "Send code" button.
    ...    2. Wait 30 seconds, attempt to click "Resend".
    ...    3. Wait until 60 seconds have passed, click "Resend" again.
    ...    4. Repeat step 3 until total resend count reaches 5 times within 1 hour.
    ...
    ...     Expected Results:
    ...    - First code is sent and user is notified.
    ...    - Resend button is disabled until 60 seconds have passed.
    ...    - After 5 requests within 1 hour, further requests are blocked with message: “You’ve reached the resend limit. Please try again later.”
    ...

    [Tags]  BF-MERCY-AUTH-SETUP-09      CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SETUP-10: First Login - Set up MFA - Validate verification code within 5-minute window
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description: User successfully verifies MFA using the 6-digit code within valid timeframe.
    ...
    ...     Precondition:
    ...    -  User has requested verification code.
    ...
    ...     Test Steps:
    ...    1. Enter the correct 6-digit code within 5 minutes.
    ...    2. Click the “Verify” button.
    ...
    ...     Expected Results:
    ...    - Code is accepted.
    ...    - Success message is displayed along with a “Finish” button.
    ...    - User is not prompted for MFA again until logout.
    ...

    [Tags]  BF-MERCY-AUTH-SETUP-10      CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SETUP-11: First Login - Set up MFA - Handle expired verification code
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description: System handles verification attempt after the 5-minute expiry period.
    ...
    ...     Precondition:
    ...    -  Code was sent more than 5 minutes ago.
    ...
    ...     Test Steps:
    ...    1. Enter the old (expired) code.
    ...    2. Click “Verify”.
    ...
    ...     Expected Results:
    ...    - System displays: “Verification code has expired.”
    ...    - User must request a new code.
    ...

    [Tags]  BF-MERCY-AUTH-SETUP-11      CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SETUP-12: First Login - Set up MFA - Lockout after 5 incorrect attempts
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description: System locks verification after multiple failed attempts within 5 minutes.
    ...
    ...     Precondition:
    ...    - User is on MFA page with active code.
    ...
    ...     Test Steps:
    ...    1. Enter incorrect code 5 times within 5 minutes.
    ...
    ...     Expected Results:
    ...    - Display error: “Too many failed attempts. Please try again after 5 minutes.”
    ...    - Disable the “Verify” button for 5 minutes.
    ...

    [Tags]  BF-MERCY-AUTH-SETUP-12      CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SETUP-13: First Login - Set up MFA - “Verify” button is always enabled
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description: Confirm “Verify” button remains enabled regardless of input state.
    ...
    ...     Precondition: User is on MFA screen.
    ...
    ...     Test Steps:
    ...    1. Observe the state of “Verify” button before and after entering code.
    ...
    ...     Expected Results:
    ...    - “Verify” button is always enabled.
    ...

    [Tags]  BF-MERCY-AUTH-SETUP-13      CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SETUP-14: First Login - Set up MFA - Change phone number during MFA setup
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description: Allow user to change phone number mid-process before verification.
    ...
    ...     Precondition: User is on MFA screen.
    ...
    ...     Test Steps:
    ...    1. Enter a phone number and send code.
    ...    2. Enter a phone number and send code.
    ...    3. Enter a new phone number and request new code.
    ...
    ...     Expected Results:
    ...    - New number input is accepted.
    ...    - New code is sent.
    ...    - All previous codes are invalidated.
    ...

    [Tags]  BF-MERCY-AUTH-SETUP-14      CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SETUP-15: First Login - Set up MFA - Navigating away without clicking “Finish” requires login
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description: If user quits without clicking "Finish", the session is incomplete.
    ...
    ...     Precondition: MFA verified but user hasn't clicked “Finish”.
    ...
    ...     Test Steps:
    ...    1. Complete code verification successfully.
    ...    2. Close tab or kill app before clicking "Finish".
    ...    3. Open app again and attempt to access Biocare portal.
    ...
    ...     Expected Results:
    ...    - User must log in again using new credentials.
    ...    - After login, redirected to Biocare portal.
    ...

    [Tags]  BF-MERCY-AUTH-SETUP-15      CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SETUP-16: First Login - Set up MFA - After completing password setup, if MFA setup is interrupted, only MFA is required after re-login
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description: 
    ...    - Ensure that if the user has completed the password setup but is interrupted before completing MFA, the system will require MFA setup only (not password setup again) after re-login.
    ...
    ...     Precondition:
    ...    - The user has completed the Set up new password step.
    ...    - The user was navigating through MFA setup but session expired or they exited the flow.
    ...
    ...     Test Steps:
    ...    1. Complete Set up new password successfully.
    ...    2. At MFA setup step, close tab / kill app / wait for session to expire.
    ...    3. Login again using the newly set password.
    ...
    ...     Expected Results:
    ...    - Login is successful using the new password.
    ...    - User is directed only to MFA setup step (not to password setup).
    ...    - All previous password rules are considered already passed and not shown again.
    ...
    [Tags]  BF-MERCY-AUTH-SETUP-16      CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#BF-020-Mercy Facility Custom - REV-1.0/ RS-154 Login with MFA for Mercy users

BF-MERCY-AUTH-SIGNIN-01: Future login - Subsequent login only requires username, password, and verification code
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description:
    ...    - Verify that after initial MFA setup, the user only needs to enter username, password, and verification code for future logins.
    ...
    ...     Precondition:
    ...    - MFA has been successfully set up previously.
    ...
    ...     Test Steps:
    ...    1. Go to the Sign In page.
    ...    2. Enter valid username and password.
    ...    3. Enter the 6-digit verification code received on the registered phone number.
    ...
    ...     Expected Results:
    ...    - User is not required to input phone number again.
    ...    - System sends verification code automatically to the stored phone number.
    ...    - If the code is valid and within expiry, login is successful and user is redirected to the Biocare Home portal.
    ...
    [Tags]  BF-MERCY-AUTH-SIGNIN-01      CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SIGNIN-02: Future login - Sign in with incorrect password
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description:
    ...    - Verify error message when entering incorrect password.
    ...
    ...     Precondition:
    ...    - Valid username exists.
    ...
    ...     Test Steps:
    ...    1. Go to Sign In page.
    ...    2. Enter valid username and incorrect password.
    ...
    ...     Expected Results:
    ...    - Display error message: "Invalid username or password."
    ...    - Sign in is not successful.
    ...
    [Tags]  BF-MERCY-AUTH-SIGNIN-02       CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SIGNIN-03: Future login - Interrupt sign in during MFA step
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description: System should not skip steps if interrupted.
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...    1. Sign in with valid credentials.
    ...    2. On MFA step, close tab or back browser.
    ...    3. Open again and sign in.
    ...
    ...     Expected Results:
    ...    - User is returned to MFA step, not bypassed.
    ...
    [Tags]  BF-MERCY-AUTH-SIGNIN-03      CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SIGNIN-04: Future login - MFA - Login failed with incorrect MFA code
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description: Verify error message when incorrect MFA code is entered.
    ...
    ...     Precondition:
    ...    - MFA has been successfully set up previously.
    ...
    ...     Test Steps:
    ...    1. Navigate to Sign-in page.
    ...    2. Enter valid username and password.
    ...    3. Click "Sign In".
    ...    4. Enter an incorrect 6-digit code.
    ...    5. Click "Verify".
    ...
    ...     Expected Results:
    ...    - STEP 3: User is navigated to MFA code entry page.
    ...    - STEP 5: System shows error message: “Invalid code. Please try again.”
    ...    - Code input remains enabled.
    ...
    [Tags]  BF-MERCY-AUTH-SIGNIN-04        CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SIGNIN-05: Future login - MFA - Code reused after success
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description:
    ...    - Ensure that a successfully used verification code cannot be reused.
    ...
    ...     Precondition:
    ...    - User account has completed MFA setup previously.
    ...    - A valid 6-digit code has already been sent to the user’s phone number.
    ...
    ...     Test Steps:
    ...    1. Enter correct code and click “Verify”.
    ...    2. Navigate back (simulate replay attack).
    ...    3. Try to reuse the same code.
    ...
    ...     Expected Results:
    ...    - System shows: "Code is no longer valid. Please request a new one."
    ...    - Code is consumed immediately after use.
    ...
    [Tags]  BF-MERCY-AUTH-SIGNIN-05          CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SIGNIN-06: Future login - MFA - Verification code entered just before expiration
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description:
    ...    - Validate that codes are still accepted at the final second before expiration.
    ...
    ...     Precondition:
    ...    - User account has completed MFA setup previously.
    ...    - A valid 6-digit code has already been sent to the user’s phone number.
    ...
    ...     Test Steps:
    ...    1. Wait ~4 minutes 59 seconds after code is sent.
    ...    2. Submit code just before expiration.
    ...
    ...     Expected Results:
    ...    - Code is accepted as long as it’s within the 5-minute window.
    ...    - Success flow is triggered correctly.
    ...
    [Tags]  BF-MERCY-AUTH-SIGNIN-06          CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SIGNIN-07: Future login - MFA - MFA code expired after 5 minutes
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description: Verify expired code cannot be used for login.
    ...
    ...     Precondition:
    ...    - User account has completed MFA setup previously.
    ...    - A valid 6-digit code has already been sent to the user’s phone number.
    ...
    ...     Test Steps:
    ...    1. Navigate to Sign-in page.
    ...    2. Enter valid username and password.
    ...    3. Click "Sign In".
    ...    4. Wait more than 5 minutes before entering the code.
    ...    5. Enter the previously received code.
    ...    6. Click "Verify".
    ...
    ...     Expected Results:
    ...    - Error displayed: “Code has expired. Please request a new one.”
    ...
    [Tags]  BF-MERCY-AUTH-SIGNIN-07          CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SIGNIN-08: Future login - MFA - Old verification code becomes invalid after requesting new code
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description:
    ...    - Verify that the previous verification code is invalidated immediately after a new code is sent.
    ...
    ...     Precondition:
    ...    - User account has completed MFA setup previously.
    ...    - A valid 6-digit code has already been sent to the user’s phone number.
    ...
    ...     Test Steps:
    ...    1. Wait 10–20 seconds after receiving the first code (e.g., Code A).
    ...    2. Click “Resend” to request a new code (Code B).
    ...    3. Try entering the first code (Code A) into the verification field.
    ...
    ...     Expected Results:
    ...    - System displays error: "Invalid or expired code."
    ...    - Code A is not accepted, even if it’s within its original 5-minute validity.
    ...    - Only Code B is valid going forward.
    ...
    [Tags]  BF-MERCY-AUTH-SIGNIN-08         CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SIGNIN-09: Future login - MFA - Resend code more than 5 times in 1 hour
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description: Verify resend code limit is enforced.
    ...
    ...     Precondition:
    ...    - User account has completed MFA setup previously.
    ...    - A valid 6-digit code has already been sent to the user’s phone number.
    ...
    ...     Test Steps:
    ...    1. Attempt to click "Resend code" 6 times within 1 hour.
    ...
    ...     Expected Results:
    ...    - After 5th attempt, button is disabled or blocked.
    ...    - Message displayed: “You have reached the maximum resend limit. Please try again in one hour.”
    ...
    [Tags]  BF-MERCY-AUTH-SIGNIN-09      CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SIGNIN-10: Future login - MFA - Verify MFA code lockout after 5 failed attempts
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description: System should lock MFA entry after 5 invalid attempts within 5 minutes.
    ...
    ...     Precondition:
    ...    - User account has completed MFA setup previously.
    ...    - A valid 6-digit code has already been sent to the user’s phone number.
    ...
    ...     Test Steps:
    ...    1. Enter incorrect MFA code 5 times within 5 minutes.
    ...
    ...     Expected Results:
    ...    - Error: “Too many failed attempts. Please try again after 5 minutes.”
    ...    - Verify” button disabled for 5 minutes.
    ...
    [Tags]  BF-MERCY-AUTH-SIGNIN-10          CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-MFA-01: Reset MFA - Reset MFA requires re-setup during next login
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description:
    ...    - Ensure that if Facility Admin resets the user's MFA, the user is required to set up MFA again on next login.
    ...
    ...     Precondition:
    ...    - MFA was previously set up.
    ...    - Facility Admin has reset MFA for the user.
    ...
    ...     Test Steps:
    ...    1. Go to Sign In page.
    ...    2. Enter valid username and password.
    ...    3. Click Sign-in button
    ...
    ...     Expected Results:
    ...    - System detects MFA reset and prompts user to re-setup MFA.
    ...    - User is required to input phone number and go through MFA verification setup again.
    ...    - MFA rules and restrictions apply as in initial setup.
    ...
    [Tags]  BF-MERCY-AUTH-MFA-01          CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-MFA-02: Reset MFA - If phone number is updated, all sessions are logged out and MFA setup is required on next login
    [Documentation]   Author: Thanh Tieu
    ...
    ...     Description:
    ...    - Verify that updating user’s phone number invalidates current sessions and requires new MFA setup.
    ...
    ...     Precondition:
    ...    - User has completed MFA setup.
    ...    - Facility Admin or Support updates the phone number.
    ...
    ...     Test Steps:
    ...    1. Facility Admin updates the phone number linked to the account.
    ...    2. User attempts to access the portal/app from an active session or logs in again.
    ...
    ...     Expected Results:
    ...    - System logs out all current sessions immediately after phone update.
    ...    - User is prompted to log in and re-setup MFA using the new phone number.
    ...    - New verification code rules apply: expires in 5 minutes, max 5 times/hour, 60 seconds between resend.
    ...    - “Back to Sign In” button is available and redirects to Sign In page.
    ...
    [Tags]  BF-MERCY-AUTH-MFA-02          CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#BF-020-Mercy Facility Custom - REV-1.0/ RS-155 Password Expiration

BF-MERCY-AUTH-PASSWORD-EXPIRE-01: Display and behavior of password expiration reminder banner
    [Documentation]   Author: Thanh Tieu
    ...
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
    ...
    [Tags]  BF-MERCY-AUTH-PASSWORD-EXPIRE-01          CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-PASSWORD-EXPIRE-02: Password expiration enforcement - Expired password at login
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

    [Tags]      BF-MERCY-AUTH-PASSWORD-EXPIRE-02    CP-2.30.0           manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-PASSWORD-EXPIRE-03: Password expiration enforcement - Password expires during active session
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
    ...

    [Tags]      BF-MERCY-AUTH-PASSWORD-EXPIRE-03      CP-2.30.0         manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#BF-020-Mercy Facility Custom - REV-1.0/ RS-156 IP Whitelist Checking

BF-MERCY-AUTH-IP-WHITELIST-01: Mercy users accessing from whitelisted IPs are redirected to Mercy domain
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Ensure that when accessing the BTCY page from an IP in the whitelist, the user will be redirected to the Mercy domain page.
    ...
    ...     Precondition:
    ...    - The user is using a computer with an IP in the whitelist according to the Mercy policy.
    ...    - User’s IP is in whitelist configured by DevOps.
    ...
    ...     Test Steps:
    ...     1. Open the browser and access the Biocare portal domain (BTCY domain).
    ...
    ...     Expected Results:
    ...     - The system checks the IP.
    ...     - If the IP is in the whitelist, the user is immediately redirected to the Mercy portal.
    ...     - Do not display the BTCY login screen.
    ...

    [Tags]      BF-MERCY-AUTH-IP-WHITELIST-01         CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-IP-WHITELIST-02: Mercy user accessing from non-whitelisted IP is blocked
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Check the behavior when Mercy user accesses BTCY from non-whitelisted IP.
    ...
    ...     Precondition:
    ...    - Current IP is not in whitelist.
    ...
    ...     Test Steps:
    ...     1. Access BTCY domain.
    ...
    ...     Expected Results:
    ...     - System identifies non-whitelisted IP.
    ...     - Displays UI error message (blocked), does not allow access to Biocare or Mercy portal.
    ...

    [Tags]      BF-MERCY-AUTH-IP-WHITELIST-02         CP-2.30.0          manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-IP-WHITELIST-03: Non-Mercy users always have access to Biocare portal
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Ensures that non-Mercy users always have access to Biocare portal regardless of IP.
    ...
    ...     Precondition:
    ...    - Any IP (whitelisted or not).
    ...
    ...     Test Steps:
    ...     1. Access the Biocare portal domain (BTCY).
    ...
    ...     Expected Results:
    ...     - No redirect.
    ...     - Display the Biocare portal login page normally.
    ...

    [Tags]      BF-MERCY-AUTH-IP-WHITELIST-03       CP-2.30.0        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-IP-WHITELIST-04: Redirect occurs before login (pre-authentication redirect)
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Check the IP redirect system that occurs before reaching the login page.
    ...
    ...     Precondition:
    ...    - User is not logged in.
    ...
    ...     Test Steps:
    ...     1. Access BTCY page when IP is in whitelist.
    ...
    ...     Expected Results:
    ...     - User is redirected to Mercy domain immediately.
    ...     - Do not display BTCY login screen.
    ...

    [Tags]      BF-MERCY-AUTH-IP-WHITELIST-04     CP-2.30.0      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-AUTH-SETTING-01: Biocare portal hides profile-related features for Mercy facility users
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description:
    ...    -  Verify that the Biocare portal hides specific profile features from users belonging to a Mercy facility
    ...
    ...     Precondition:
    ...    - User is logged into the Biocare portal.
    ...    - The user belongs to a Mercy facility.
    ...
    ...     Test Steps:
    ...     1. Navigate to the profile menu or account settings.
    ...     2. Observe the list of options or links presented.
    ...
    ...     Expected Results:
    ...     - The following features shall not be visible to the Mercy user:
    ...        + Edit your profile
    ...        + Update your email
    ...        + Change password
    ...     - No trace of the above features in DOM or navigation options.
    ...     - Non-Mercy users shall still see all standard profile features.
    ...

    [Tags]      BF-MERCY-AUTH-SETTING-01       CP-2.30.0        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}       Start Browser
    Import Library        project_bioflux_clinic_portal/lib/web/Common.py           ${BROWSER_NODE}  ${ENV}       WITH NAME   CpCommon
    Import Library        project_bioflux_callcenter_portal/lib/web/Common.py       ${BROWSER_NODE}  ${ENV}       WITH NAME   CcCommon
    Import Library        project_bioflux_clinic_portal/lib/web/Support.py          ${BROWSER_NODE}  ${ENV}
    Import Library        project_bioflux_clinic_portal/lib/web/Inbox.py            ${BROWSER_NODE}  ${ENV}
    Import Library        project_bioflux_clinic_portal/lib/web/Studies.py          ${BROWSER_NODE}  ${ENV}
    Import Library        project_bioflux_clinic_portal/lib/web/Devices.py          ${BROWSER_NODE}  ${ENV}
    Import Library        project_bioflux_clinic_portal/lib/web/Fleet.py            ${BROWSER_NODE}  ${ENV}
    ${TECH_USER}          CpConfig.Get Config Param       NEW_USER > clinic_technician
    ${FACILITIES}         CpConfig.Get Config Param       FACILITY
    Set Suite Variable    ${TECH_USER}
    Set Suite Variable    ${FACILITIES}
    ${TOKEN}              Sign In Bioflux       username=${TECH_USER}[0][username]       password=${TECH_USER}[0][password]
    ${VERSION}            Get Release Version
    Set Suite Metadata    version     ${VERSION}
    Set Suite Metadata    browser     ${BROWSER.capitalize()}
    Set Suite Variable    ${TOKEN}

SUITE TEARDOWN
    Quit Browser

Filter Support - Request
    [Arguments]     ${status}=${EMPTY}        ${category}=${EMPTY}      ${text_search}=${EMPTY}
    Navigate To Support
    Navigate To Support Menu   Support Request
    Filter Support Request     by_status=${status}      by_category=${category}     text_search=${text_search}
    ${requests}      Get List Support Request
    Run Keyword And Continue On Failure    Should Not Be Empty    ${requests}     No support requests found
    # Status
    Run Keyword If    '${status}' != '${EMPTY}' and '${status.lower()}' != 'all statuses'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${status}'.lower() == s['Status'].lower() for s in ${requests})      Invalid results are showing - with category `${status}`
    Run Keyword If    '${status}' != '${EMPTY}' and '${status.lower()}' == 'all statuses'
    ...  Run Keyword And Continue On Failure    Should Not Be Empty    ${requests}    No support requests found - with status `all statuses`
    # Category
    Run Keyword If    '${category}' != '${EMPTY}' and '${category.lower()}' != 'all categories'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${category}'.lower() == s['Category'].lower() for s in ${requests})      Invalid results are showing - with category `${category}`
    Run Keyword If    '${category}' != '${EMPTY}' and '${category.lower()}' == 'all categories'
    ...  Run Keyword And Continue On Failure    Should Not Be Empty    ${requests}    No support requests found - with category `all categories`
    # Request ID
    Run Keyword If    '${text_search}' != '${EMPTY}'  Run Keywords
    ...  Run Keyword And Continue On Failure    Length Should Be    ${requests}     1
    ...  AND    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${text_search}      ${requests}[0][Request ID]

Get Studies - Completed On
    [Arguments]    ${facility}
    Navigate To Studies Page
    Select Facility     facility=${facility}
    Filter Studies      study_state=Completed
    ${studies}          Get Completed Studies
    Select Facility     facility=All facilities
    RETURN    ${studies}

Resolve Request
    [Arguments]             ${category}
    Navigate To Support
    Navigate To Support Menu    Support request
    Filter Support Request  by_status=Open    by_category=${category}
    ${requests}             Get List Support Request
    ${request_id}           Set Variable    ${requests}[0][Request ID]
    ${filter_keys}          Create Dictionary    sortOrder=desc       appName=Bioflux     ticketId=${request_id}
    ${request_id}           Convert To Integer     ${request_id}
    ${req_filter_inputs}    Create Dictionary    sortOrder=desc     appName=Bioflux     ticketId=${request_id}
    ${filter}               Api All Support Request    selected_portal=Clinic     token=${TOKEN}       filter=${req_filter_inputs}
    ${request_id}           Set Variable    ${filter}[body][data][clinicTickets][0][id]
    ${CCT_USER}             CcConfig.Get Config Param       NEW_USERS > callcenter_supervisor
    ${login_response}       Api Login    username=${CCT_USER}[username]      password=${CCT_USER}[password]
    ${CALLCENTER_TOKEN}     Set Variable    ${login_response}[body][data][login][token]
    ${req_inputs}           Create Dictionary    id=${request_id}      isResolved=${True}
    Api Resolve Support Request         token=${CALLCENTER_TOKEN}       input=${req_inputs}
