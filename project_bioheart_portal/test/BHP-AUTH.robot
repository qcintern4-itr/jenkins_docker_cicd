*** Settings ***
Documentation  Bioheart portal Authenication test suite
Metadata    sid   BHP-AUTH
Metadata  owner   Linh Tran
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioheart_portal/lib/ConfigHandler.py   ${ENV}
Library     corelib/AssertionExtension.py

Suite Setup     Log    SUITE SETUP
Suite Teardown  Log    SUITE TEARDOWN
Force Tags  BHP-AUTH        web
Test Timeout  1h

*** Test Cases ***
BHP-AUTH-ONBOARDING-01: Check display images with auto slide animation every 5 seconds
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Check
    ...     Expected Output:
    ...
    ...     - 1. There are 5 animations and auto sile every 5 seconds
    [Tags]  BHP-AUTH-ONBOARDING-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-ONBOARDING-02: Check 2 arrow buttons to navigate next and previous screen
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on the next arrow button
    ...     - 2. Click on the previous arrow button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the next animation screen
    ...     - 2. Navigate back to the previous animation screen
    ...     When user is on the 1st animation screen, the previous arrow button is disabled
    ...     When user is on the last animation screen, the nexr arrow button is disabled
    [Tags]  BHP-AUTH-ONBOARDING-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-ONBOARDING-03: Sign in with Bioheart account
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Enter correct Email
    ...     - 2. Enter correct Password
    ...     - 3. Click on the 'Sign in' button
    ...
    ...     Expected Output:
    ...     - 1. Enter Email successfully
    ...     - 2. Enter Password successfully, the Sign in button is enabled
    ...     - 3. Navigate to the Overview screen from the 2nd time sign in or navigate to the Complete profile screen in
    ...       the 1st time sign in
    [Tags]  BHP-AUTH-ONBOARDING-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-ONBOARDING-04: Sign in with Google account
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Sign In with Google button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Overview screen from the 2nd time sign in or navigate to the Complete profile screen
    ...       in the 1st time sign in
    [Tags]  BHP-AUTH-ONBOARDING-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-ONBOARDING-05: Sign in with Facebook account
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Sign In with Facebook button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Overview screen from the 2nd time sign in or navigate to the Complete profile screen
    ...       in the 1st time sign in
    [Tags]  BHP-AUTH-ONBOARDING-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-ONBOARDING-06: Sign in with Apple ID
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Sign In with Apple button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Overview screen from the 2nd time sign in or navigate to the Complete profile screen
    ...       in the 1st time sign in
    [Tags]  BHP-AUTH-ONBOARDING-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-ONBOARDING-07: Navigate to the Create account screen
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Create button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Create Account screen
    [Tags]  BHP-AUTH-ONBOARDING-07      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-ONBOARDING-08: Navigate to the Forgot password screen
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Forgot Password? button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Forgot Password screen
    [Tags]  BHP-AUTH-ONBOARDING-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-ONBOARDING-09: Check Privacy policy link
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Privacy policy hyperlink
    ...     - 2. Click on email and sites links
    ...
    ...     Expected Output:
    ...     - 1. Privacy policy link is open in the new tab
    ...     - 2. Navigate to the email and sites tab
    [Tags]  BHP-AUTH-ONBOARDING-09      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-ONBOARDING-10: Check Terms of use link
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Terms of use hyperlink
    ...     - 2. Click on email and sites links
    ...
    ...     Expected Output:
    ...     - 1. Terms of use link is open in the new tab
    ...     - 2. Navigate to the email and sites tab
    [Tags]  BHP-AUTH-ONBOARDING-10      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-REGISTER-01: Create Bioheart account
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Create button
    ...     - 2. Enter First name
    ...     - 3. Enter Last name
    ...     - 4. Enter Email
    ...     - 5. Click on Next button
    ...     - 6. Enter Password
    ...     - 7. Enter Confirm password
    ...     - 8. Click on Finish button
    ...     - 9. Click on Back to Sign in button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Create Account screen
    ...     - 2. Enter First name successfully
    ...     - 3. Enter Last name successfully
    ...     - 4. Enter Email successfully, the Next button is enabled
    ...     - 5. Navigate to the next screen
    ...     - 6. Enter Password successfully, the password is hiddeen
    ...     - 7. Enter Confirm password successfully, the password is hidden
    ...     - 8. Navigate to the Verify Your Email screen and there shall be a confirmation link sent to this email
    ...     - 9. Navigato to the Welcome screen
    [Tags]  BHP-AUTH-REGISTER-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-REGISTER-02: Create Bioheart account with exist email
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Create button
    ...     - 2. Enter First name
    ...     - 3. Enter Last name
    ...     - 4. Enter exist Email
    ...     - 5. Click on Next button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Create Account screen
    ...     - 2. Enter First name successfully
    ...     - 3. Enter Last name successfully
    ...     - 4. Enter Email successfully, the Next button is enabled
    ...     - 5. There shall be a message Account already exist and email's outline is changed to red
    [Tags]  BHP-AUTH-REGISTER-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-REGISTER-03: Check X icon button
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Create button
    ...     - 2. Leave bank all fields
    ...     - 3. Click on X icon button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Create Account screen
    ...     - 2. All fields are empty
    ...     - 3. Navigato to the Welcome screen
    [Tags]  BHP-AUTH-REGISTER-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-REGISTER-04: Check X icon button
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Create button
    ...     - 2. Enter First name
    ...     - 3. Enter Last name
    ...     - 4. Enter Email
    ...     - 5. Click on X icon button
    ...     - 6. Click on Create button again
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Create Account screen
    ...     - 2. Enter First name successfully
    ...     - 3. Enter Last name successfully
    ...     - 4. Enter Email name successfully
    ...     - 5. Navigato to the Welcome screen
    ...     - 6. Navigate to the Create Account screen, all entered data are cleared
    [Tags]  BHP-AUTH-REGISTER-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-REGISTER-05: Check X icon button
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Create button
    ...     - 2. Enter First name
    ...     - 3. Enter Last name
    ...     - 4. Enter Email
    ...     - 5. Click on Next button
    ...     - 6. Leave blank all fields
    ...     - 7. Click on X icon button
    ...     - 8. Click on Create button again
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Create Account screen
    ...     - 2. Enter First name successfully
    ...     - 3. Enter Last name successfully
    ...     - 4. Enter Email successfully, the Next button is enabled
    ...     - 5. Navigate to the next screen
    ...     - 6. All fields are empty
    ...     - 7. Navigato to the Welcome screen
    ...     - 8. Navigate to the Create Account screen, all entered data are cleared
    [Tags]  BHP-AUTH-REGISTER-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-REGISTER-06: Check X icon button
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Create button
    ...     - 2. Enter First name
    ...     - 3. Enter Last name
    ...     - 4. Enter Email
    ...     - 5. Click on Next button
    ...     - 6. Enter Password
    ...     - 7. Enter Confirm password
    ...     - 8. Click on X icon button
    ...     - 9. Click on Create button again
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Create Account screen
    ...     - 2. Enter First name successfully
    ...     - 3. Enter Last name successfully
    ...     - 4. Enter Email successfully, the Next button is enabled
    ...     - 5. Navigate to the next screen
    ...     - 6. Enter Password successfully, the password is hidden
    ...     - 7. Enter Confirm password successfully, the password is hidden
    ...     - 8. Navigato to the Welcome screen
    ...     - 9. Navigate to the Create Account screen, all entered data are cleared
    [Tags]  BHP-AUTH-REGISTER-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-REGISTER-07: Check Back button
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Create button
    ...     - 2. Enter First name
    ...     - 3. Enter Last name
    ...     - 4. Enter Email
    ...     - 5. Click on Next button
    ...     - 6. Leave blank all fields
    ...     - 7. Click on Back button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Create Account screen
    ...     - 2. Enter First name successfully
    ...     - 3. Enter Last name successfully
    ...     - 4. Enter Email successfully, the Next button is enabled
    ...     - 5. Navigate to the next screen
    ...     - 6. All fields are empty
    ...     - 7. Navigate back to the previous screen
    [Tags]  BHP-AUTH-REGISTER-07      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-REGISTER-08: Check Back button
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Create button
    ...     - 2. Enter First name
    ...     - 3. Enter Last name
    ...     - 4. Enter Email
    ...     - 5. Click on Next button
    ...     - 6. Enter Password
    ...     - 7. Enter Confirm password
    ...     - 8. Click on Back button
    ...     - 9. Click on Next button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Create Account screen
    ...     - 2. Enter First name successfully
    ...     - 3. Enter Last name successfully
    ...     - 4. Enter Email successfully, the Next button is enabled
    ...     - 5. Navigate to the next screen
    ...     - 6. Enter Password successfully
    ...     - 7. Enter Confirm password successfully
    ...     - 8. Navigate back to the previous screen
    ...     - 9. Navigate to the next screen, all entered data are cleared
    [Tags]  BHP-AUTH-REGISTER-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-REGISTER-09: Create Bioheart account fail
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Create button
    ...     - 2. Enter First name
    ...     - 3. Enter Last name
    ...     - 4. Enter Email
    ...     - 5. Click on Next button
    ...     - 6. Enter Password
    ...     - 7. Enter Confirm password
    ...     - 8. Click on Finish button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Create Account screen
    ...     - 2. Enter First name successfully
    ...     - 3. Enter Last name successfully
    ...     - 4. Enter Email successfully, the Next button is enabled
    ...     - 5. Navigate to the next screen
    ...     - 6. Enter Password successfully, the password is hidden
    ...     - 7. Enter Confirm password successfully, the password is hidden
    ...     - 8. There shall be a message Something went wrong! Could not create your account. Please try again.
    [Tags]  BHP-AUTH-REGISTER-09      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-REGISTER-10: Check eye icon
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Create button
    ...     - 2. Enter First name
    ...     - 3. Enter Last name
    ...     - 4. Enter Email
    ...     - 5. Click on Next button
    ...     - 6. Enter Password
    ...     - 7. Enter Confirm password
    ...     - 8. Click on eye icon on password fields
    ...     - 9. Click on eye icon on password fields again
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Create Account screen
    ...     - 2. Enter First name successfully
    ...     - 3. Enter Last name successfully
    ...     - 4. Enter Email successfully, the Next button is enabled
    ...     - 5. Navigate to the next screen
    ...     - 6. Enter Password successfully, the password is hidden
    ...     - 7. Enter Confirm password successfully, the password is hidden
    ...     - 8. The passwords are displayed
    ...     - 9. The passwords are hidden
    [Tags]  BHP-AUTH-REGISTER-10      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-REGISTER-11: Check passwords don’t match
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Create button
    ...     - 2. Enter First name
    ...     - 3. Enter Last name
    ...     - 4. Enter Email
    ...     - 5. Click on Next button
    ...     - 6. Enter Password
    ...     - 7. Enter Confirm password doesn't match with password
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Create Account screen
    ...     - 2. Enter First name successfully
    ...     - 3. Enter Last name successfully
    ...     - 4. Enter Email successfully, the Next button is enabled
    ...     - 5. Navigate to the next screen
    ...     - 6. Enter Password successfully, the password is hidden
    ...     - 7. Enter Confirm password successfully, the password is hidden and there shall be a message
    ...       Your passwords don't match. Please check again and confirm password's out line is changed to red
    [Tags]  BHP-AUTH-REGISTER-11      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-REGISTER-12: Check Privacy policy link
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Create button
    ...     - 2. Click on Privacy policy hyperlink
    ...     - 3. Click on email and sites links
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Create Account screen
    ...     - 2. Privacy policy link is open in the new tab
    ...     - 3. Navigate to the email and sites tab
    [Tags]  BHP-AUTH-REGISTER-12      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-REGISTER-13: Check Terms of use link
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Create button
    ...     - 2. Click on Terms of use hyperlink
    ...     - 3. Click on email and sites links
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Create Account screen
    ...     - 2. Terms of use link is open in the new tab
    ...     - 3. Navigate to the email and sites tab
    [Tags]  BHP-AUTH-REGISTER-13      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-01: Sign in with Bioheart account in the 1st time
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Enter correct Email
    ...     - 2. Enter correct Password
    ...     - 3. Click on Sign in button
    ...
    ...     Expected Output:
    ...     - 1. Enter Email successfully
    ...     - 2. Enter Password successfully, the password is hidden and the Sign in button is enable
    ...     - 3. Navigate to the Complete profile screen
    [Tags]  BHP-AUTH-SIGNIN-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-02: Sign in with Bioheart account from the 2nd time
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Enter correct Email
    ...     - 2. Enter correct Password
    ...     - 3. Click on Sign in button
    ...
    ...     Expected Output:
    ...     - 1. Enter Email successfully
    ...     - 2. Enter Password successfully, the password is hidden and the Sign in button is enable
    ...     - 3. Navigate to the Overview screen
    [Tags]  BHP-AUTH-SIGNIN-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-03: Sign in with unverified account
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Enter unverified Email
    ...     - 2. Enter Password
    ...     - 3. Click on Sign in button
    ...     - 4. Click on Back to Sign in button
    ...
    ...     Expected Output:
    ...     - 1. Enter Email successfully
    ...     - 2. Enter Password successfully, the password is hidden and the Sign in button is enabled
    ...     - 3. Navigate to the Verified Your Email screen
    ...     - 4. Navigate to the Welcome screen
    [Tags]  BHP-AUTH-SIGNIN-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-04: Sign in with unverified account
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Enter unverified Email created from Bioheart app
    ...     - 2. Enter Password
    ...     - 3. Click on Sign in button
    ...     - 4. Click on Back to Sign in button
    ...
    ...     Expected Output:
    ...     - 1. Enter Email successfully
    ...     - 2. Enter Password successfully, the password is hidden and the Sign in button is enabled
    ...     - 3. Navigate to the Verified Your Email screen
    ...     - 4. Navigate to the Welcome screen
    [Tags]  BHP-AUTH-SIGNIN-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-05: Resend verified email
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Enter unverified Email
    ...     - 2. Enter Password
    ...     - 3. Click on Sign in button
    ...     - 4. Click on Resend Verification Email button
    ...     - 5. Wait for 60 seconds completed
    ...
    ...     Expected Output:
    ...     - 1. Enter Email successfully
    ...     - 2. Enter Password successfully, the password is hidden and the Sign in button is enabled
    ...     - 3. Navigate to the Verified Your Email screen
    ...     - 4. This button is changed to Resend 60 seconds countdown and disabled
    ...     - 5. This button is changed to Resend Verification Email and enabled
    [Tags]  BHP-AUTH-SIGNIN-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-06: Resend verified email
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Enter unverified Email created from Bioheart app
    ...     - 2. Enter Password
    ...     - 3. Click on Sign in button
    ...     - 4. Click on Resend Verification Email button
    ...     - 5. Wait for 60 seconds completed
    ...
    ...     Expected Output:
    ...     - 1. Enter Email successfully
    ...     - 2. Enter Password successfully, the password is hidden and the Sign in button is enabled
    ...     - 3. Navigate to the Verified Your Email screen
    ...     - 4. This button is changed to Resend 60 seconds countdown and disabled
    ...     - 5. This button is changed to Resend Verification Email and enabled
    [Tags]  BHP-AUTH-SIGNIN-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-07: Resend verified email fail
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Enter unverified Email
    ...     - 2. Enter Password
    ...     - 3. Click on Sign in button
    ...     - 4. Click on Resend Verification Email button
    ...
    ...     Expected Output:
    ...     - 1. Enter Email successfully
    ...     - 2. Enter Password successfully, the password is hidden and the Sign in button is enabled
    ...     - 3. Navigate to the Verified Your Email screen
    ...     - 4. There shall be a message Fail to resend verification email. Please try again!
    [Tags]  BHP-AUTH-SIGNIN-07      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-08: Resend verified email fail
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Enter unverified Email created from Bioheart app
    ...     - 2. Enter Password
    ...     - 3. Click on Sign in button
    ...     - 4. Click on Resend Verification Email button
    ...
    ...     Expected Output:
    ...     - 1. Enter Email successfully
    ...     - 2. Enter Password successfully, the password is hidden and the Sign in button is enabled
    ...     - 3. Navigate to the Verified Your Email screen
    ...     - 4. There shall be a message Fail to resend verification email. Please try again!
    [Tags]  BHP-AUTH-SIGNIN-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-09: Verify email
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Enter unverified Email
    ...     - 2. Enter Password
    ...     - 3. Click on Sign in button
    ...     - 4. Click on Resend Verification Email button
    ...     - 5. Verify email
    ...     - 6. Click on Okay button
    ...
    ...     Expected Output:
    ...     - 1. Enter Email successfully
    ...     - 2. Enter Password successfully, the password is hidden and the Sign in button is enabled
    ...     - 3. Navigate to the Verified Your Email screen
    ...     - 4. This button is changed to Resend 60 seconds countdown and disabled
    ...     - 5. Navigate to the Awesome screen
    ...     - 6. Navigate to the Welcome screen
    [Tags]  BHP-AUTH-SIGNIN-09      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-10: Verify email
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Enter unverified Email created from Bioheart app
    ...     - 2. Enter Password
    ...     - 3. Click on Sign in button
    ...     - 4. Click on Resend Verification Email button
    ...     - 5. Verify email
    ...     - 6. Click on Okay button
    ...
    ...     Expected Output:
    ...     - 1. Enter Email successfully
    ...     - 2. Enter Password successfully, the password is hidden and the Sign in button is enabled
    ...     - 3. Navigate to the Verified Your Email screen
    ...     - 4. This button is changed to Resend 60 seconds countdown and disabled
    ...     - 5. Navigate to the Awesome screen
    ...     - 6. Navigate to the Welcome screen
    [Tags]  BHP-AUTH-SIGNIN-10      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-11: Sign with completed account created from Bioheart app
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Enter Email
    ...     - 2. Enter Password
    ...     - 3. Click on Sign in button
    ...
    ...     Expected Output:
    ...     - 1. Enter Email successfully
    ...     - 2. Enter Password successfully, the password is hidden and the Sign in button is enabled
    ...     - 3. Navigate to the Overview screen
    [Tags]  BHP-AUTH-SIGNIN-11      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-12: Sign with incompleted account created from Bioheart app
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Enter Email
    ...     - 2. Enter Password
    ...     - 3. Click on Sign in button
    ...
    ...     Expected Output:
    ...     - 1. Enter Email successfully
    ...     - 2. Enter Password successfully, the password is hidden and the Sign in button is enabled
    ...     - 3. Navigate to the Complete profile screen
    [Tags]  BHP-AUTH-SIGNIN-12      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-13: Sign in with incorrect credentials
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Enter incorrect Email and Password
    ...     - 2. Click on Sign in button
    ...
    ...     Expected Output:
    ...     - 1. Enter Email and Password successfully, the password is hidden and the Sign in button is enabled
    ...     - 2. The shall be a message Incorrect email or password. and Email and Password's outline are changed to red
    [Tags]  BHP-AUTH-SIGNIN-13      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-14: Sign in with incorrect credentials
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Enter incorrect Email
    ...     - 2. Enter correct Password
    ...     - 3. Click on Sign in button
    ...
    ...     Expected Output:
    ...     - 1. Enter Email successfully
    ...     - 2. Enter Password successfully, the password is hidden and the Sign in button is enabled
    ...     - 3. The shall be a message Incorrect email or password. and Email and Password's outline are changed to red
    [Tags]  BHP-AUTH-SIGNIN-14      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-15: Sign in with incorrect credentials
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Enter correct Email
    ...     - 2. Enter incorrect Password
    ...     - 3. Click on Sign in button
    ...
    ...     Expected Output:
    ...     - 1. Enter Email successfully
    ...     - 2. Enter Password successfully, the password is hidden and the Sign in button is enabled
    ...     - 3. The shall be a message Incorrect email or password. and Email and Password's outline are changed to red
    [Tags]  BHP-AUTH-SIGNIN-15      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-16: Sign in with email not register
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Enter Email
    ...     - 2. Enter Password
    ...     - 3. Click on Sign in button
    ...
    ...     Expected Output:
    ...     - 1. Enter Email successfully
    ...     - 2. Enter Password successfully, the password is hidden and the Sign in button is enabled
    ...     - 3. The shall be a message Could not find any account associated with this email.
    ...       Please register. and Email and Password's outline are changed to red
    [Tags]  BHP-AUTH-SIGNIN-16      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-17: Sign in with deleted account after 30 days
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Enter Email
    ...     - 2. Enter Password
    ...     - 3. Click on Sign in button
    ...
    ...     Expected Output:
    ...     - 1. Enter Email successfully
    ...     - 2. Enter Password successfully, the password is hidden and the Sign in button is enabled
    ...     - 3. The shall be a message Could not find any account associated with this email.
    ...       Please register. and Email and Password's outline are changed to red
    [Tags]  BHP-AUTH-SIGNIN-17      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-18: Sign in with deleted account within 30 days
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Enter Email
    ...     - 2. Enter Password
    ...     - 3. Click on Sign in button
    ...
    ...     Expected Output:
    ...     - 1. Enter Email successfully
    ...     - 2. Enter Password successfully, the password is hidden and the Sign in button is enabled
    ...     - 3. Navigate to the Recovery screen
    [Tags]  BHP-AUTH-SIGNIN-18      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-19: Check eye icon
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Enter Password
    ...     - 2. Click on eye icon
    ...     - 3. Click on eye icon again
    ...
    ...     Expected Output:
    ...     - 1. Enter Password successfully, the password is hidden
    ...     - 2. The password is displayed
    ...     - 3. The password is hidden again
    [Tags]  BHP-AUTH-SIGNIN-19      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-20: Sign in with Google account in the 1st time
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Sign In with Google button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Complete profile screenn
    [Tags]  BHP-AUTH-SIGNIN-20      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-21: Sign in with Google account from the 2nd time
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Sign In with Google button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Overview screen
    [Tags]  BHP-AUTH-SIGNIN-21      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-22: Sign in with Facebook account in the 1st time
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Sign In with Facebook button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Complete profile screen
    [Tags]  BHP-AUTH-SIGNIN-22      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-23: Sign in with Facebook account from 2nd time
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Sign In with Facebook button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Overview screen
    [Tags]  BHP-AUTH-SIGNIN-23      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-24: Sign in with Apple ID in the 1st time
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Sign In with Apple button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Complete profile screen
    [Tags]  BHP-AUTH-SIGNIN-24      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNIN-25: Sign in with Apple ID from the 2nd time
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Sign In with Apple button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Overview screen
    [Tags]  BHP-AUTH-SIGNIN-25      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-SIGNOUT-01: Confirm to sign out
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Sign out button on the right-sidebar
    ...     - 2. Click on Sign out button
    ...
    ...     Expected Output:
    ...     - 1. There shall be a modal displayed
    ...     - 2. Navigate to the Welcome screen
    [Tags]  BHP-AUTH-SIGNOUT-01     auto
    Sign Out Bioheart Portal
    ${SIGNIN_SCREEN}  Page Is On Screen
    Run Keyword And Continue On Failure     Should Be Equal     ${SIGNIN_SCREEN}     sign in

BHP-AUTH-SIGNOUT-02: Cancel to sign out
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on Sign out button on the right-sidebar
    ...     - 2. Click on Cancel button
    ...
    ...     Expected Output:
    ...     - 1. There shall be a modal displayed
    ...     - 2. The modal is closed and keep on Overview screen
    [Tags]  BHP-AUTH-SIGNOUT-02     auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Sign Out Bioheart Portal     confirm_signout=${False}        is_cancel=${True}
    ${OVERVIEW_SCREEN}  Page Is On Screen
    Run Keyword And Continue On Failure     Should Be Equal     ${OVERVIEW_SCREEN}     overview

BHP-AUTH-FORGOTPASSWORD-01: Create new password
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...    - 1. Click on Forgot password? button
    ...    - 2. Enter valid Email
    ...    - 3. Click Send request button
    ...    - 4. Enter Verification code
    ...    - 5. Enter Password
    ...    - 6. Enter Confirm password
    ...    - 7. Click on Update button
    ...    - 8. Click on Okay button or reload page
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Reset password screen
    ...    - 2. Enter Email successfully, the Send request button is enabled
    ...    - 3. Navigate to the Updated password screen
    ...    - 4. Enter Verification code successfully
    ...    - 5. Enter Password successfully, the password is hidden
    ...    - 6. Enter Confirm password successfully, the password is hidden and the Update button is enabled
    ...    - 7. Navigate to the Password Updated screen
    ...    - 8. Navigate to the Welcome screen
    [Tags]  BHP-AUTH-FORGOTPASSWORD-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-COMPLETEPROFILE-01: Complete profile when can get username from Bioheart account
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Enter Email
    ...     - 2. Enter Password
    ...     - 3. Click on Sign in button
    ...     - 4. Add Profile picture
    ...     - 5. Select DOB
    ...     - 6. Select Gender
    ...     - 7. Select measurement
    ...     - 8. Click on Save button
    ...     - 9. Click on Next button or X icon button
    ...
    ...     Expected Output:
    ...     - 1. Enter Email successfully
    ...     - 2. Enter Password successfully, the password is hidden and the Sign in button is enabled
    ...     - 3. Navigate to the Complete profile screen, the username fields are auto-filled and user can edit it
    ...     - 4. Add Profile picture successfully
    ...     - 5. DOB displayed
    ...     - 6. Selected Gender displayed
    ...     - 7. Selected measurement displayed, the Save button is enabled
    ...     - 8. Naviagte to the Overview screen and there shall be a welcome onboard modal displayed
    ...     - 9. Navigate to the next screen or close modal
    [Tags]  BHP-AUTH-COMPLETEPROFILE-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-COMPLETEPROFILE-02: Complete profile when can get username from the 3rd party
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on the 3rd party buttons to sign in
    ...     - 2. Add Profile picture
    ...     - 3. Select DOB
    ...     - 4. Select Gender
    ...     - 5. Select measurement
    ...     - 6. Click on Save button
    ...     - 7. Click on Next button or X icon button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Complete profile screen, the username fields are auto-filled and user can edit it
    ...     - 2. Add Profile picture successfully
    ...     - 3. Selected DOB displayed
    ...     - 4. Selected Gender displayed
    ...     - 5. Selected measurement displayed, the Save button is enabled
    ...     - 6. Naviagte to the Overview screen and there shall be a welcome onboard modal displayed
    ...     - 7. Navigate to the next screen or close modal
    [Tags]  BHP-AUTH-COMPLETEPROFILE-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-COMPLETEPROFILE-03: Complete profile when cannot get username from 3rd party
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on the 3rd party buttons to sign in
    ...     - 2. Enter First name
    ...     - 3. Enter Last name
    ...     - 4. Add Profile picture
    ...     - 5. Select DOB
    ...     - 6. Select Gender
    ...     - 7. Select measurement
    ...     - 8. Click on Save button
    ...     - 9. Click on Next button or X icon button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Complete profile screen, the username fields are emptied
    ...     - 2. Enter First name successfully
    ...     - 3. Enter Last name successfully
    ...     - 4. Add Profile picture successfully
    ...     - 5. Selected DOB displayed
    ...     - 6. Selected Gender displayed
    ...     - 7. Selected measurement displayed, the Save button is enabled
    ...     - 8. Naviagte to the Overview screen and there shall be a welcome onboard modal displayed
    ...     - 9. Navigate to the next screen or close modal
    [Tags]  BHP-AUTH-COMPLETEPROFILE-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-COMPLETEPROFILE-04: Complete profile when cannot get email from 3rd party
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on the 3rd party buttons to sign in
    ...     - 2. Add Profile picture
    ...     - 3. Select DOB
    ...     - 4. Select Gender
    ...     - 5. Select measurement
    ...     - 6. Click on Save button
    ...     - 7. Click on Next button or X icon button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Complete profile screen, the username fields are auto-filled and user can edit it but the web cannot get email and display abc123@example.com
    ...     - 2. Add Profile picture successfully
    ...     - 3. Selected DOB displayed
    ...     - 4. Selected Gender displayed
    ...     - 5. Selected measurement displayed, the Save button is enabled
    ...     - 6. Naviagte to the Overview screen and there shall be a welcome onboard modal displayed
    ...     - 7. Navigate to the next screen or close modal
    [Tags]  BHP-AUTH-COMPLETEPROFILE-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-COMPLETEPROFILE-05: Complete profile when cannot get username and email from 3rd party
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Click on the 3rd party buttons to sign in
    ...     - 2. Enter First name
    ...     - 3. Enter Last name
    ...     - 4. Add Profile picture
    ...     - 5. Select DOB
    ...     - 6. Select Gender
    ...     - 7. Select measurement
    ...     - 8. Click on Save button
    ...     - 9. Click on Next button or X icon button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Complete profile screen, the username fields are emptied and the web cannot also get email and display abc123@example.com
    ...     - 2. Enter First name successfully
    ...     - 3. Enter Last name successfully
    ...     - 4. Add Profile picture successfully
    ...     - 5. Selected DOB displayed
    ...     - 6. Selected Gender displayed
    ...     - 7. Selected measurement displayed, the Save button is enabled
    ...     - 8. Naviagte to the Overview screen and there shall be a welcome onboard modal displayed
    ...     - 9. Navigate to the next screen or close modal
    [Tags]  BHP-AUTH-COMPLETEPROFILE-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-COMPLETEPROFILE-06: Complete profile without profile picture
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Sign in with Bioheart account or account from the 3rd party
    ...     - 2. Don't add profile picture
    ...     - 3. Select DOB
    ...     - 4. Select Gender
    ...     - 5. Select measurement
    ...     - 6. Click on Save button
    ...     - 7. Click on Next button or X icon button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Complete profile screen
    ...     - 2. Profile picture is default
    ...     - 3. Selected DOB displayed
    ...     - 4. Selected Gender displayed
    ...     - 5. Selected measurement displayed, the Save button is enabled
    ...     - 6. Naviagte to the Overview screen and there shall be a welcome onboard modal displayed
    ...     - 7. Navigate to the next screen or close modal
    [Tags]  BHP-AUTH-COMPLETEPROFILE-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-COMPLETEPROFILE-07: Complete profile when there is any error
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Sign in with Bioheart account or account from the 3rd party
    ...     - 2. Don't add profile picture
    ...     - 3. Select DOB
    ...     - 4. Select Gender
    ...     - 5. Select measurement
    ...     - 6. Click on Save button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Complete profile screen
    ...     - 2. Profile picture is default
    ...     - 3. Selected DOB displayed
    ...     - 4. Selected Gender displayed
    ...     - 5. Selected measurement displayed, the Save button is enabled
    ...     - 6. There shall be a message Something went wrong! Could not update your profile. Please try again.
    [Tags]  BHP-AUTH-COMPLETEPROFILE-07      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-COMPLETEPROFILE-08: Profile picture settings
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Sign in with Bioheart account or account from the 3rd party
    ...     - 2. Click on edit profile picture icon button
    ...     - 3. Click on Upload image button
    ...     - 4. Select image
    ...     - 5. Click on Save button
    ...     - 6. Click on edit profile picture icon button again
    ...     - 7. Click on Upload image button or Remove image button
    ...     - 8. Click on Save button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Complete profile screen
    ...     - 2. Profile picture modal is displayed
    ...     - 3. Navigate to the image library
    ...     - 4. Selected image displayed
    ...     - 5. Navigate to the Complete profile screen is displayed
    ...     - 6. Profile picture modal is displayed
    ...     - 7. Upload new image or remove image
    ...     - 8. New uploaded is saved
    [Tags]  BHP-AUTH-COMPLETEPROFILE-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-COMPLETEPROFILE-09: Profile picture settings
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Sign in with Bioheart account or account from the 3rd party
    ...     - 2. Click on edit profile picture icon button
    ...     - 3. Click on Save button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Complete profile screen
    ...     - 2. Profile picture modal is displayed
    ...     - 3. Default image is displayed
    [Tags]  BHP-AUTH-COMPLETEPROFILE-09      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-COMPLETEPROFILE-10: Cancel to upload profile picture
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Sign in with Bioheart account or account from the 3rd party
    ...     - 2. Click on edit profile picture icon button
    ...     - 3. Click on X icon button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Complete profile screen
    ...     - 2. Profile picture modal is displayed
    ...     - 3. The modal is closed and displayed default image
    [Tags]  BHP-AUTH-COMPLETEPROFILE-10      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-COMPLETEPROFILE-11: Upload profile picture with file bigger 1MB
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Sign in with Bioheart account or account from the 3rd party
    ...     - 2. Click on edit profile picture icon button
    ...     - 3. Click on Upload image button
    ...     - 4. Select image
    ...     - 5. Click on Save button
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Complete profile screen
    ...     - 2. Profile picture modal is displayed
    ...     - 3. Navigate to the image library
    ...     - 4. Selected image displayed
    ...     - 5. There shall be message Failed to upload as your image size is too big
    [Tags]  BHP-AUTH-COMPLETEPROFILE-11      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-COMPLETEPROFILE-12: Check Height max-min value with Imperial
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Sign in with Bioheart account or account from the 3rd party
    ...     - 2. Enter min value (0ft-0inch)
    ...     - 3. Enter max value (8ft-11inch)
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Complete profile screen
    ...     - 2. Enter min value successfully
    ...     - 3. Enter max value successfully
    [Tags]  BHP-AUTH-COMPLETEPROFILE-12      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-COMPLETEPROFILE-13: Check Weight max-min value with Imperial
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Sign in with Bioheart account or account from the 3rd party
    ...     - 2. Enter min value (0.0Ib)
    ...     - 3. Enter max value (881.7Ibs)
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Complete profile screen
    ...     - 2. Enter min value successfully
    ...     - 3. Enter max value successfully
    [Tags]  BHP-AUTH-COMPLETEPROFILE-13      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-COMPLETEPROFILE-14: Check Weight max-min value with Metric
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Sign in with Bioheart account or account from the 3rd party
    ...     - 2. Enter min value (0.0kg)
    ...     - 3. Enter max value (399.0kg)
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Complete profile screen
    ...     - 2. Enter min value successfully
    ...     - 3. Enter max value successfully
    [Tags]  BHP-AUTH-COMPLETEPROFILE-14      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-COMPLETEPROFILE-15: Check DOB default
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...     - 1. Sign in with Bioheart account or account from the 3rd party
    ...     - 2. Check DOB default
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the Complete profile screen
    ...     - 2. DOB default is current day
    [Tags]  BHP-AUTH-COMPLETEPROFILE-15      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-FORGOTPASSWORD-02: Create new password with invalid email
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...    - 1. Click on Forgot password? button
    ...    - 2. Enter invalid Email or deleted account after 30 days
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Reset password screen
    ...    - 2. The shall be a message Could not find any account associated with this email. Please try again. and email's outline is changed to red
    [Tags]  BHP-AUTH-FORGOTPASSWORD-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-FORGOTPASSWORD-03: Enter wrong verification code
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...    - 1. Click on Forgot password? button
    ...    - 2. Enter valid Email
    ...    - 3. Click on Send request button
    ...    - 4. Enter wrong verification code
    ...    - 5. Enter Password
    ...    - 6. Enter Confirm password
    ...    - 7. Click on Update button
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Reset password screen
    ...    - 2. Enter Email successfully, the Send request button is enabled
    ...    - 3. Enter Email successfully, the Send request button is enabled
    ...    - 4. Enter Verification code successfully
    ...    - 5. Enter Password successfully, the password is hidden
    ...    - 6. Enter Confirm password successfully, the password is hidden and the Update button is enabled
    ...    - 7. There shall be a message Wrong verification code. Please type again. and the verification code's outline is changed to red
    [Tags]  BHP-AUTH-FORGOTPASSWORD-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-FORGOTPASSWORD-04: Enter password less than 8 characters
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...    - 1. Click on Forgot password? button
    ...    - 2. Enter valid Email
    ...    - 3. Click on Send request button
    ...    - 4. Enter Password less than 8 characters
    ...    - 5. Enter Confirm password less than 8 characters
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Reset password screen
    ...    - 2. Enter Email successfully, the Send request button is enabled
    ...    - 3. Navigate to the Updated password screen
    ...    - 4. Enter Password successfully, the password is hidden
    ...    - 5. Enter Confirm password successfully, the password is hidden, there shall be a message Passwords must be at least 8 characters
    [Tags]  BHP-AUTH-FORGOTPASSWORD-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-FORGOTPASSWORD-05: Enter password less than 8 characters
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...    - 1. Click on Forgot password? button
    ...    - 2. Enter valid Email
    ...    - 3. Click on Send request button
    ...    - 4. Enter Password less than 8 characters
    ...    - 5. Enter Confirm password
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Reset password screen
    ...    - 2. Enter Email successfully, the Send request button is enabled
    ...    - 3. Navigate to the Updated password screen
    ...    - 4. Enter Password successfully, the password is hidden
    ...    - 5. Enter Confirm password successfully, the password is hidden, there shall be a message Passwords must be at least 8 characters
    [Tags]  BHP-AUTH-FORGOTPASSWORD-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-FORGOTPASSWORD-06: Enter password less than 8 characters
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps
    ...    - 1. Click on Forgot password? button
    ...    - 2. Enter valid Email
    ...    - 3. Click on Send request button
    ...    - 4. Enter Password
    ...    - 5. Enter Confirm password less than 8 characters
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Reset password screen
    ...    - 2. Enter Email successfully, the Send request button is enabled
    ...    - 3. Navigate to the Updated password screen
    ...    - 4. Enter Password successfully, the password is hidden
    ...    - 5. Enter Confirm password successfully, the password is hidden, there shall be a message Passwords must be at least 8 characters
    [Tags]  BHP-AUTH-FORGOTPASSWORD-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BHP-AUTH-FORGOTPASSWORD-07: Check passwords don't match
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...    - 1. Click on Forgot password? button
    ...    - 2. Enter valid Email
    ...    - 3. Click on Send request button
    ...    - 4. Enter Password
    ...    - 5. Enter Confirm password doesn't match with password
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Reset password screen
    ...    - 2. Enter Email successfully, the Send request button is enabled
    ...    - 3. Navigate to the Updated password screen
    ...    - 4. Enter Password successfully, the password is hidden
    ...    - 5. Enter Confirm password successfully, the password is hidden, there shall be a message Your passwords don't match. Please check again.
    [Tags]  BHP-AUTH-FORGOTPASSWORD-07      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-FORGOTPASSWORD-08: Check eye icon
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...    - 1. Click on Forgot password? button
    ...    - 2. Enter valid Email
    ...    - 3. Click on Send request button
    ...    - 4. Enter Password
    ...    - 5. Enter Confirm password
    ...    - 6. Click on eye icon
    ...    - 7. Click on eye icon again
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Reset password screen
    ...    - 2. Enter Email successfully, the Send request button is enabled
    ...    - 3. Navigate to the Updated password screen
    ...    - 4. Enter Password successfully, the password is hidden
    ...    - 5. Enter Confirm password successfully, the password is hidden, there shall be a message Your passwords don't match. Please check again.
    [Tags]  BHP-AUTH-FORGOTPASSWORD-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-FORGOTPASSWORD-09: Resend verification code
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...    - 1. Click on Forgot password? button
    ...    - 2. Enter valid Email
    ...    - 3. Click on Send request button
    ...    - 4. Click on Resend now button
    ...    - 5. Wait for completed 60 seconds
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Reset password screen
    ...    - 2. Enter Email successfully, the Send request button is enabled
    ...    - 3. Navigate to the Updated password screen
    ...    - 4. The Resend now button is changed to Resend 60s countdown and disabled
    ...    - 5. The Resend 60s countdown is changed to Resend now and enabled
    [Tags]  BHP-AUTH-FORGOTPASSWORD-09      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-FORGOTPASSWORD-10: Resend verification code
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...    - 1. Click on Forgot password? button
    ...    - 2. Enter valid Email
    ...    - 3. Click on Send request button
    ...    - 4. Enter verification code
    ...    - 5. Enter Password
    ...    - 6. Enter Confirm password
    ...    - 7. Click on Update button
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Reset password screen
    ...    - 2. Enter Email successfully, the Send request button is enabled
    ...    - 3. Navigate to the Updated password screen
    ...    - 4. Enter Verification code successfully
    ...    - 5. Enter Password successfully, the password is hidden
    ...    - 6. Enter Confirm password successfully, the password is hidden and the Update button is enabled
    ...    - 7. There shall be a message No internet connection Please check your connection and try again
    [Tags]  BHP-AUTH-FORGOTPASSWORD-10      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-FORGOTPASSWORD-11: Check X icon button
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...    - 1. Click on Forgot password? button
    ...    - 2. Leave blank Email field
    ...    - 3. Click X icon button
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Reset password screen
    ...    - 2. Email field is empty
    ...    - 3. Navigate to the Welcome screen
    [Tags]  BHP-AUTH-FORGOTPASSWORD-11      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-FORGOTPASSWORD-12: Check X icon button
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...    - 1. Click on Forgot password? button
    ...    - 2. Enter valid Email
    ...    - 3. Click X icon button
    ...    - 4. Click on Forgot password? button
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Reset password screen
    ...    - 2. Enter Email successfully, the Send request button is enabled
    ...    - 3. Navigate to the Welcome screen
    ...    - 4. Navigate to the Reset password screen and entered email is cleared
    [Tags]  BHP-AUTH-FORGOTPASSWORD-12      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-FORGOTPASSWORD-13: Check X icon button
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...    - 1. Click on Forgot password? button
    ...    - 2. Enter valid Email
    ...    - 3. Click on Send request button
    ...    - 4. Leave blank all fields
    ...    - 5. Click on X icon button
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Reset password screen
    ...    - 2. Enter Email successfully, the Send request button is enabled
    ...    - 3. Navigate to the Updated password screen
    ...    - 4. All fields are empty
    ...    - 5. Navigate to the Welcome screen
    [Tags]  BHP-AUTH-FORGOTPASSWORD-13      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-AUTH-FORGOTPASSWORD-14: Check X icon button
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...
    ...     Test Steps:
    ...    - 1. Click on Forgot password? button
    ...    - 2. Enter valid Email
    ...    - 3. Click on Send request button
    ...    - 4. Enter verification code
    ...    - 5. Enter Password
    ...    - 6. Enter Confirm password
    ...    - 7. Click on X icon button
    ...    - 8. Click on Forgot password? button
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Reset password screen
    ...    - 2. Enter Email successfully, the Send request button is enabled
    ...    - 3. Navigate to the Updated password screen
    ...    - 4. Enter Verification code successfully
    ...    - 5. Enter Password successfully, the password is hidden
    ...    - 6. Enter Confirm password successfully, the password is hidden and the Update button is enabled
    ...    - 7. Navigate to the Welcome screen
    ...    - 8. Navigate to the Reset password screen and entered email is cleared
    [Tags]  BHP-AUTH-FORGOTPASSWORD-14      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library    project_bioheart_portal/lib/web/Common.py    ${BROWSER_NODE}  ${ENV}
    Import Library    project_bioheart_portal/lib/web/Profile.py    ${BROWSER_NODE}  ${ENV}
    Set Suite Variable  ${BROWSER_NODE}
    ${USER}    Get Config Param    USER
    ${VERSION}      Navigate To Bioheart Sign In Page
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Set Suite Variable      ${USER}
    Set Suite Metadata    version   ${VERSION}
    Set Suite Metadata    browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser
