*** Settings ***
Documentation   Bioheart e-commerce authentication test suite
Metadata        sid     ECOM-AUTH
Metadata        owner   Tan Pham
Library         corelib/AssertionExtension.py
Library         corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library         project_bioflux_clinic_portal/lib/ConfigHandler.py      ${ENV}
Library         project_bioheart_ecommerce/lib/web/Common.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      ECOM-AUTH       web
Test Timeout    1h

*** Test Cases ***
ECOM-AUTH-SIGNIN-01: Sign in with the Biotricity account
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user is on the sign in screen.
    ...
    ...     Test Steps:
    ...    1. Enter the correct username
    ...    2. Enter the correct password
    ...    3. Click on Sign In button
    ...
    ...     Expected Output:
    ...    - The web shall redirect to the previous page or redirect to the Checkout page if the user click Checkout before.
    ...    - There shall be a button to go back to the main view of the sign in modal
    [Tags]  ECOM-AUTH-SIGNIN-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-SIGNIN-02: Sign in with the email has not been registered
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user is on the sign in screen.
    ...
    ...     Test Steps:
    ...    1. Enter the email has not been registered
    ...    2. Enter the valid password
    ...    3. Click on Sign In button
    ...
    ...     Expected Output:
    ...    - The message "Could not find any account associated with this email. Please register." is displayed
    [Tags]  ECOM-AUTH-SIGNIN-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-SIGNIN-03: Sign in with the email of deleted account after 30 days
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user is on the sign in screen.
    ...
    ...     Test Steps:
    ...    1. Enter the email of deleted account after 30 days
    ...    2. Enter the valid password
    ...    3. Click on Sign In button
    ...
    ...     Expected Output:
    ...    - The message "Could not find any account associated with this email. Please register." is displayed
    [Tags]  ECOM-AUTH-SIGNIN-03     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-SIGNIN-04: Sign in with the incorrect email
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user is on the sign in screen.
    ...
    ...     Test Steps:
    ...    1. Enter the incorrect email
    ...    2. Enter the valid password
    ...    3. Click on Sign In button
    ...
    ...     Expected Output:
    ...    - The message "Incorrect email or password" is displayed
    [Tags]  ECOM-AUTH-SIGNIN-04     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-SIGNIN-05: Sign in with the incorrect password
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user is on the sign in screen.
    ...
    ...     Test Steps:
    ...    1. Enter the correct email
    ...    2. Enter the incorrect password
    ...    3. Click on Sign In button
    ...
    ...     Expected Output:
    ...    - The message "Incorrect email or password" is displayed
    [Tags]  ECOM-AUTH-SIGNIN-05     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-SIGNIN-06: Sign in with the email has been registered but has not been verified
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user is on the sign in screen.
    ...
    ...     Test Steps:
    ...    1. Enter the email has been registered but has not been verified
    ...    2. Enter the incorrect password
    ...    3. Click on Sign In button
    ...    4. Verify the email
    ...    5. Click on the Okay button
    ...
    ...     Expected Output:
    ...    - Navigate to the verify you email screen
    ...    - Navigate to the Awesome screen and the message "Your account has been verified. Please sign in again." is displayed
    ...    -  Navigate to the Sign in screen
    [Tags]  ECOM-AUTH-SIGNIN-06     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-SIGNIN-07: Sign in with the email has been registered but has not been verified
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user is on the sign in screen.
    ...
    ...     Test Steps:
    ...    1. Enter the email has been registered but has not been verified
    ...    2. Enter the incorrect password
    ...    3. Click on Sign In button
    ...    4. Click on the Resend Verification Email button
    ...
    ...     Expected Output:
    ...    - If the email cannot be sent there shall be snackbar with the message: “Failed to resend verification email. Please try again!”
    ...    - If the email is sent successfully, the“Resend Verification Email” button shall change to “Resend <second>” (start a countdown from 59 to 0) and be disabled.
    ...    - When its countdown to 0 the button changes back to the “Resend Verification Email” button.
    [Tags]  ECOM-AUTH-SIGNIN-07     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-SIGNIN-08: Sign in with Google account
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user is on the sign in screen.
    ...
    ...     Test Steps:
    ...     1. Click on Sign In with Google button
    ...
    ...     Expected Output:
    ...     - During this duration the web shall display the redirecting screen. Message: Redirecting...
    ...     - The web shall redirect to the previous page or redirect to the Checkout page if the user click Checkout before.The authentication process shall be performed out of the system
    ...     - After completing sign-in successfully, the web shall redirect to:
    ...         + The previous page before going to the Signing screen.
    ...         + The Checkout page if the user clicks Checkout before.
    ...         + During this duration the web shall display the redirecting screen. Message: Redirecting...
    [Tags]  ECOM-AUTH-SIGNIN-08     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-SIGNIN-09: Sign in with Facebook account
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user is on the sign in screen.
    ...
    ...     Test Steps:
    ...     1. Click on Sign In with Facebook button
    ...
    ...     Expected Output:
    ...     - During this duration the web shall display the redirecting screen. Message: Redirecting...
    ...     - The web shall redirect to the previous page or redirect to the Checkout page if the user click Checkout before.The authentication process shall be performed out of the system
    ...     - After completing sign-in successfully, the web shall redirect to:
    ...         + The previous page before going to the Signing screen.
    ...         + The Checkout page if the user clicks Checkout before.
    ...         + During this duration the web shall display the redirecting screen. Message: Redirecting...
    [Tags]  ECOM-AUTH-SIGNIN-09     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-SIGNIN-10: Sign in with Apple account
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user is on the sign in screen.
    ...
    ...     Test Steps:
    ...     1. Click on Sign In with Apple button
    ...
    ...     Expected Output:
    ...     - During this duration the web shall display the redirecting screen. Message: Redirecting...
    ...     - The web shall redirect to the previous page or redirect to the Checkout page if the user click Checkout before.The authentication process shall be performed out of the system
    ...     - After completing sign-in successfully, the web shall redirect to:
    ...         + The previous page before going to the Signing screen.
    ...         + The Checkout page if the user clicks Checkout before.
    ...         + During this duration the web shall display the redirecting screen. Message: Redirecting...
    [Tags]  ECOM-AUTH-SIGNIN-10     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-RECOVERY-01: Recovery account
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...    - The user signs in within 30 days from the account deletion event
    ...
    ...    - Test Steps:
    ...    1. Enter the email
    ...    2. Enter the password
    ...    3. Click on the Sign in button
    ...    4. Click on the Recover button
    ...    5. Click on the  Back to your account button
    ...
    ...     Expected Output:
    ...     - The Recovery screen
    ...     - Navigate to the Overview screen
    [Tags]  ECOM-AUTH-RECOVERY-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-RECOVERY-02: Cancel Recovery account
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...    - The user signs in within 30 days from the account deletion event
    ...
    ...    - Test Steps:
    ...    1. Enter the email
    ...    2. Enter the password
    ...    3. Click on the Sign in button
    ...    4. Click on the Cancel button
    ...    5. Click on the  Back to your account button
    ...
    ...     Expected Output:
    ...     - The Recovery screen
    ...     - Navigate to the Welcome  screen
    [Tags]  ECOM-AUTH-RECOVERY-02         manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-FORGOTPASSWORD-01: Create new password with invalid email
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user is in the Welcome screen
    ...
    ...     Test Steps:
    ...    1. Click on Forgot password? button
    ...    2. Enter invalid Email or deleted account after 30 days
    ...
    ...     Expected Output:
    ...    - Navigate to the Reset password screen
    ...    - The shall be a message Could not find any account associated with this email. Please try again. and email's outline is changed to red
    [Tags]  ECOM-AUTH-FORGOTPASSWORD-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-FORGOTPASSWORD-02: Enter wrong verification code
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user is in the Welcome screen
    ...
    ...     Test Steps:
    ...    1. Click on Forgot password? button
    ...    2. Enter valid Email
    ...    3. Click on Send request button
    ...    4. Enter wrong verification code
    ...    5. Enter Password
    ...    6. Enter Confirm password
    ...    7. Click on Update button
    ...
    ...     Expected Output:
    ...    - There shall be a message Wrong verification code. Please type again. and the verification code's outline is changed to red
    [Tags]  ECOM-AUTH-FORGOTPASSWORD-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-FORGOTPASSWORD-03: Enter password less than 8 characters
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...    1. Click on Forgot password? button
    ...    2. Enter valid Email
    ...    3. Click on Send request button
    ...    4. Enter Password less than 8 characters
    ...    5. Enter Confirm password less than 8 characters
    ...
    ...     Expected Output:
    ...    - The message "Password must be at least 8 characters" is displayed
    [Tags]  ECOM-AUTH-FORGOTPASSWORD-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-FORGOTPASSWORD-04: Check passwords don't match
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user is in the Welcome screen
    ...
    ...     Test Steps:
    ...    1. Click on Forgot password? button
    ...    2. Enter valid Email
    ...    3. Click on Send request button
    ...    4. Enter Password
    ...    5. Enter Confirm password doesn't match with password
    ...
    ...     Expected Output:
    ...    - The message "Your passwords don’t match. Please check again" is displayed
    [Tags]  ECOM-AUTH-FORGOTPASSWORD-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-FORGOTPASSWORD-05: Resend verification code
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user is in the Welcome screen
    ...
    ...     Test Steps:
    ...    1. Click on Forgot password? button
    ...    2. Enter valid Email
    ...    3. Click on Send request button
    ...    4. Click on Resend now button
    ...    5. Wait for completed 60 seconds
    ...
    ...     Expected Output:
    ...    - The Resend now button is changed to Resend 60s countdown and disabled
    ...    - The Resend 60s countdown is changed to Resend now and enabled
    [Tags]  ECOM-AUTH-FORGOTPASSWORD-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-FORGOTPASSWORD-06: Resend verification code
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...    1. Click on Forgot password? button
    ...    2. Enter valid Email
    ...    3. Click on Send request button
    ...    4. Enter verification code
    ...    5. Enter Password
    ...    6. Enter Confirm password
    ...    7. Click on Update button
    ...
    ...     Expected Output:
    ...    - Enter Confirm password successfully, the password is hidden and the Update button is enabled
    ...    - There shall be a message No internet connection Please check your connection and try again
    [Tags]  ECOM-AUTH-FORGOTPASSWORD-06         manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-SIGNOUT-01: Confirm to sign out when only sign in shop page
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user has signed in to the Bioheart ecommerce.
    ...
    ...     Test Steps:
    ...     1. Click on Sign out button on the right-sidebar
    ...     2. Click on Sign out button
    ...
    ...     Expected Output:
    ...     - Navigate to the Welcome screen
    [Tags]  ECOM-AUTH-SIGNOUT-01             manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-SIGNOUT-02: Cancel to sign out
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user has signed in to the Bioheart ecommerce.
    ...
    ...     Test Steps:
    ...     1. Click on Sign out button on the right-sidebar
    ...     2. Click on Cancel button
    ...
    ...     Expected Output:
    ...     - The modal is closed and keep on Overview screen
    [Tags]  ECOM-AUTH-SIGNOUT-02         manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-SIGNOUT-03: Confirm to sign out when sign in shop page and biosphere with one account
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user has signed in to the Bioheart ecommerce.
    ...
    ...     Test Steps:
    ...     1. Click on Sign out button on the right-sidebar
    ...     2. Click on Sign out button
    ...
    ...     Expected Output:
    ...     - When signing out from the shop page, this account shall sign out from the biosphere web as well
    ...     - Navigate to the Welcome screen
    [Tags]  ECOM-AUTH-SIGNOUT-03         manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-REGISTER-01: Create account
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user is in the Welcome screen.
    ...
    ...     Test Steps:
    ...     1. Click on Create button
    ...     2. Enter First name
    ...     3. Enter Last name
    ...     4. Enter Email
    ...     5. Click on Next button
    ...     6. Enter Password
    ...     7. Enter Confirm password
    ...     8. Click on Finish button
    ...     9. Click on Back to Sign in button
    ...
    ...     Expected Output:
    ...     - Navigate to the Create Account screen
    ...     - Navigate to the next screen
    ...     - Navigate to the Verify Your Email screen and there shall be a confirmation link sent to this email
    ...     - Navigato to the Welcome screen
    [Tags]  ECOM-AUTH-REGISTER-01        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-REGISTER-02: Create account with exist email
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user is in the Welcome screen.
    ...
    ...     Test Steps:
    ...     1. Click on Create button
    ...     2. Enter First name
    ...     3. Enter Last name
    ...     4. Enter exist Email
    ...     5. Click on Next button
    ...
    ...     Expected Output:
    ...     - The message "Account already exist" is displayed
    [Tags]  ECOM-AUTH-REGISTER-02        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-REGISTER-03: Create account fail
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user is in the Welcome screen.
    ...
    ...     Test Steps:
    ...     1. Click on Create button
    ...     2. Enter First name
    ...     3. Enter Last name
    ...     4. Enter Email
    ...     5. Click on Next button
    ...     6. Enter Password
    ...     7. Enter Confirm password
    ...     8. Click on Finish button
    ...
    ...     Expected Output:
    ...     - The message "Something went wrong! Could not create your account. Please try again." is displayed
    [Tags]  ECOM-AUTH-REGISTER-03        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-REGISTER-04: Check passwords don’t match
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user is in the Welcome screen.
    ...
    ...     Test Steps:
    ...     1. Click on Create button
    ...     2. Enter First name
    ...     3. Enter Last name
    ...     4. Enter Email
    ...     5. Click on Next button
    ...     6. Enter Password
    ...     7. Enter Confirm password doesn't match with password
    ...
    ...     Expected Output:
    ...     - The message "Your passwords don't match. Please check again" is displayed
    [Tags]  ECOM-AUTH-REGISTER-04        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-REGISTER-05: Check Privacy policy link
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...     1. Click on Create button
    ...     2. Click on Privacy policy hyperlink
    ...     3. Click on email and sites links
    ...
    ...     Expected Output:
    ...     - Navigate to the Create Account screen
    ...     - Privacy policy link is open in the new tab
    ...     - Navigate to the email and sites tab
    [Tags]  ECOM-AUTH-REGISTER-05        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-AUTH-REGISTER-06: Check Terms of use link
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user is in the Welcome screen.
    ...
    ...     Test Steps:
    ...     1. Click on Create button
    ...     2. Click on Terms of use hyperlink
    ...     3. Click on email and sites links
    ...
    ...     Expected Output:
    ...     - Navigate to the Create Account screen
    ...     - Terms of use link is open in the new tab
    ...     - Navigate to the email and sites tab
    [Tags]  ECOM-AUTH-REGISTER-06        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}








*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library    project_bioheart_ecommerce/lib/web/Common.py    ${BROWSER_NODE}  ${ENV}
    Set Suite Variable  ${BROWSER_NODE}
    ${VERSION}      Navigate To Bioheart Ecommerce Page
    ${TECH_USER}    Get Config Param       USER
    Set Suite Metadata    version   ${VERSION}
    Set Suite Metadata    browser   ${BROWSER.capitalize()}
    Set Suite Variable    ${TECH_USER}

SUITE TEARDOWN
    Quit Browser
