*** Settings ***
Documentation   Biocare app Authen test suite
Metadata    sid     BIOC-AUTHEN
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-AUTHEN   mapp
Test Timeout    1h

*** Test Cases ***
BIOC-AUTHEN-ONBOARDING-01: View onboarding screen (only display in the 1st time user open the app)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The app is installed in the phone (IOS)
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Click on Accept button
    ...     3. Click on Contine button or swipe left
    ...     4. Click on Contine button or swipe left
    ...     5. Swipe right
    ...     6. Click on Skip button
    ...
    ...     Expected Output:
    ...     1. There are 2 permission popups, Bluetooth and Notification
    ...     2. Navigate to Onboarding screen
    ...        - Title: Health tracker
    ...        - Text: Monitor your health metrics, including heart rate, blood pressure, weight, and daily activities.
    ...        - Skip button
    ...        - Continue button
    ...     3. Navigate to next screen
    ...        - Title: Wellness and lifestyle trends
    ...        - Text: Effortlessly monitor your health trends, set goals, and work towards a healthier lifestyle.
    ...        - Skip button
    ...        - Continue button
    ...     4. Navigate to next screen
    ...        - Title: Medication reminder
    ...        - Text: Set reminders for your daily medication.
    ...        - Skip button
    ...        - Continue button
    ...     5. Navigate to previous screen
    ...     6. Navigate to Welcome screen
    [Tags]      BIOC-AUTHEN-ONBOARDING-01       BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-ONBOARDING-02: View onboarding screen (only display in the 1st time user open the app)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The app is installed in the phone (ANDROID)
    ...
    ...     Test Steps:
    ...     1. Open the app
    ...     2. Click on Allow/Don't allow button
    ...     3. Click on Contine button or swipe left
    ...     4. Click on Contine button or swipe left
    ...     5. Swipe right
    ...     6. Click on Skip button
    ...
    ...     Expected Output:
    ...     1. There is permission popup Notification
    ...     2. Navigate to Onboarding screen
    ...        - Title: Health tracker
    ...        - Text: Monitor your health metrics, including heart rate, blood pressure, weight, and daily activities.
    ...        - Skip button
    ...        - Continue button
    ...     3. Navigate to next screen
    ...        - Title: Wellness and lifestyle trends
    ...        - Text: Effortlessly monitor your health trends, set goals, and work towards a healthier lifestyle.
    ...        - Skip button
    ...        - Continue button
    ...     4. Navigate to next screen
    ...        - Title: Medication reminder
    ...        - Text: Set reminders for your daily medication.
    ...        - Skip button
    ...        - Continue button
    ...     5. Navigate to previous screen
    ...     6. Navigate to Welcome screen
    [Tags]      BIOC-AUTHEN-ONBOARDING-02       BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-WELCOME-01: View Welcome screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Welcome screen
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Welcome screen shall contain:
    ...       + Logo
    ...       + Text box: “Biocare Health”
    ...       + Illustration: Track your health, wellness, and lifestyle activities in a single platform
    ...       + Continue with Google button
    ...       + Continue with Apple button
    ...       + Create account button
    ...       + Text "Have an account already?" and Sign in button
    [Tags]      BIOC-AUTHEN-WELCOME-01      BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-SIGNIN-01: Sign in with Google account
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Wellcome screen
    ...
    ...     Test Steps:
    ...     - Press on Continue with Google button
    ...
    ...     Expected Output:
    ...     - In case, the 1st time sign in with Google account
    ...        + Navigate to Complete profile screen
    ...     - In case, from the 2nd time sign in with Google account
    ...        + Navigate to Home screen
    [Tags]      BIOC-AUTHEN-SIGNIN-01       BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-SIGNIN-02: Sign in with Apple ID
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Wellcome screen
    ...
    ...     Test Steps:
    ...     - Press on Continue with Apple button
    ...
    ...     Expected Output:
    ...     - In case, the 1st time sign in with Apple ID
    ...        + Navigate to Complete profile screen
    ...     - In case, from the 2nd time sign in with Apple ID
    ...        + Navigate to Home screen
    [Tags]      BIOC-AUTHEN-SIGNIN-02       BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-SIGNIN-03: View Sign in screen with account Biocare
    [Documentation]     Author: Han Nguyen
    ...
    ...     Test Data:
    ...     - Email: hanp32439@gmail.com
    ...     - Password: 12345679
    ...
    ...     Test Steps:
    ...     1. Press on Sign in button
    ...     2. Enter Email & Password
    ...
    ...     Expected Output:
    ...     1. Navigate to Sign in screen
    ...        - Email textbox "Enter your email"
    ...        - Password textbox "Enter your password"
    ...        - Forgot password button
    ...        - Sign in button
    ...        - Text "Don't have an account?" and Create button
    ...     2. Navigate user to the Home screen
    [Tags]      BIOC-AUTHEN-SIGNIN-03       BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-SIGNIN-04: Sign in with existing account Biocare
    [Documentation]     Author: Han Nguyen
    ...
    ...     Test Data:
    ...     - Email: a@yopmail.com
    ...     - Password: 00000000
    ...
    ...     Test Steps:
    ...     1. Input test data
    ...     2. Press on Sign in button
    ...
    ...     Expected Output:
    ...     2. Sign in successfully and navigate the user to Home screen
    [Tags]      BIOC-AUTHEN-SIGNIN-04       BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-SIGNIN-05: Sign in with existing account Biocare but don't complete profile
    [Documentation]     Author: Han Nguyen
    ...
    ...     Test Data:
    ...     - Email: p@yopmail.com
    ...     - Password: 00000000
    ...
    ...     Test Steps:
    ...     1. Input test data
    ...     2. Press on Sign in button
    ...
    ...     Expected Output:
    ...     2. Sign in successfully and navigate the user to Complete profile screen
    [Tags]      BIOC-AUTHEN-SIGNIN-05       BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-SIGNIN-06: Sign in with an account that does not exist
    [Documentation]     Author: Han Nguyen
    ...
    ...     Test Data:
    ...     - Email: xxx@yopmail.com
    ...     - Password: 00000000
    ...
    ...     Test Steps:
    ...     1. Input test data
    ...     2. Press on Sign in button
    ...
    ...     Expected Output:
    ...     2. The Email text bar’s outline color shall be changed to red.
    ...        Text below the bar with the content: “Could not find your account”
    [Tags]      BIOC-AUTHEN-SIGNIN-06       BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-SIGNIN-07: Sign in with invalid format email
    [Documentation]     Author: Han Nguyen
    ...
    ...     Test Data:
    ...     - Email: xxxxx
    ...     - Password: 00000000
    ...
    ...     Test Steps:
    ...     1. Input test data
    ...     2. Press on Sign in button
    ...
    ...     Expected Output:
    ...     2. The Email text bar’s outline color shall be changed to red.
    ...        Text below the bar with the content: “Invalid email”
    [Tags]      BIOC-AUTHEN-SIGNIN-07       BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-SIGNIN-08: Sign in with all fields is empty
    [Documentation]     Author: Han Nguyen
    ...
    ...     Test Steps:
    ...     1. Press on Sign in button
    ...
    ...     Expected Output:
    ...     1. The Email text bar’s outline color shall be changed to red.
    ...        Text below the bar with the content: “This field cannot be empty”
    [Tags]      BIOC-AUTHEN-SIGNIN-08       BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-SIGNIN-09: Sign in with any fields is empty
    [Documentation]     Author: Han Nguyen
    ...
    ...     Test Data:
    ...     - Email: xxxxx
    ...     - Password: 00000000
    ...
    ...     Test Steps:
    ...     1. Enter your email and password is empty
    ...     2. Press on Sign in button
    ...     3. Enter your password and email is empty
    ...     4. Press on Sign in button
    ...
    ...     Expected Output:
    ...     2. The Email text bar’s outline color shall be changed to red.
    ...        Text below the bar with the content: “This field cannot be empty”
    ...     4. The Password text bar’s outline color shall be changed to red.
    ...        Text below the bar with the content: “This field cannot be empty”
    [Tags]      BIOC-AUTHEN-SIGNIN-09       BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-SIGNIN-10: Sign in with an account has deleted after 30 days
    [Documentation]     Author: Han Nguyen
    ...
    ...     Test Data:
    ...     - Email: c@yopmail.com
    ...     - Password: 00000000
    ...
    ...     Test Steps:
    ...     1. Input test data
    ...     2. Press on Sign in button
    ...
    ...     Expected Output:
    ...     2. The Email text bar’s outline color shall be changed to red.
    ...        Text below the bar with the content: “Could not find your account”
    [Tags]      BIOC-AUTHEN-SIGNIN-10        BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-SIGNIN-11: Sign in with deleted account is pending mode (Recovery account)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Test Data:
    ...     - Email: d@yopmail.com
    ...     - Password: 00000000
    ...
    ...     Test Steps:
    ...     1. Input test data
    ...     2. Press on Sign in button
    ...     3. Press on Cancel button
    ...
    ...     Expected Output:
    ...     2. Navigate the user to Account recovery screen:
    ...        - Text: "Your account is scheduled for deletion.
    ...               If you want to cancel the deletion of your account, click Recover."
    ...        - Recovery button
    ...        - Cancel button
    ...     3. Navigate back to Wellcome screen.
    [Tags]      BIOC-AUTHEN-SIGNIN-11        BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-SIGNIN-12: Sign in with deleted account is pending mode (Recovery account)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Test Data:
    ...     - Email: d@yopmail.com
    ...     - Password: 00000000
    ...
    ...     Test Steps:
    ...     1. Input test data
    ...     2. Press on Sign in button
    ...     3. Press on Recovery button
    ...
    ...     Expected Output:
    ...     2. Navigate the user to Account recovery screen:
    ...        - Text: "Your account is scheduled for deletion.
    ...               If you want to cancel the deletion of your account, click Recover."
    ...        - Recovery button
    ...        - Cancel button
    ...     3. Navigate the user to Home screen.
    [Tags]      BIOC-AUTHEN-SIGNIN-12       BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-SIGNIN-13: Sign in with incorrect password
    [Documentation]     Author: Han Nguyen
    ...
    ...     Test Data:
    ...     - Email: k@yopmail.com
    ...     - Password: 00000000
    ...
    ...     Test Steps:
    ...     1. Enter your email and incorrect password
    ...     2. Press on Sign in button
    ...
    ...     Expected Output:
    ...     2. The Email text bar’s outline color shall be changed to red.
    ...        Text below the bar with the content: “Incorrect password”
    [Tags]      BIOC-AUTHEN-SIGNIN-13       BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-SIGNIN-14: Sign in with unverified email
    [Documentation]     Author: Han Nguyen
    ...
    ...     Test Data:
    ...     - Email: v@yopmail.com
    ...     - Password: 00000000
    ...
    ...     Test Steps:
    ...     1. Input test data
    ...     2. Press on Sign in button
    ...     3. Press on Resend Verification Email button
    ...     4. Press on Back to sign in button
    ...
    ...     Expected Output:
    ...     2. Navigate to Email verification screen:
    ...        - Text: Your account is not verified. Please check your email and click the verification link to activate your account."
    ...        - Resend Verification Email button
    ...        - Back to sign in button
    ...     3. Navigate to Email verification screen
    ...     4. Navigate back to Sign in screen
    [Tags]      BIOC-AUTHEN-SIGNIN-14       BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-SIGNIN-15: Sign in with unverified email
    [Documentation]     Author: Han Nguyen
    ...
    ...     Test Data:
    ...     - Email: v@yopmail.com
    ...     - Password: 00000000
    ...
    ...     Test Steps:
    ...     1. Input test data
    ...     2. Press on Sign in button
    ...     3. Press on Back to sign in button
    ...
    ...     Expected Output:
    ...     2. Navigate to Email verification screen:
    ...        - Text: Your account is not verified. Please check your email and click the verification link to activate your account."
    ...        - Resend Verification Email button
    ...        - Back to sign in button
    ...     3. Navigate back to Sign in screen
    [Tags]      BIOC-AUTHEN-SIGNIN-15       BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-SIGNIN-16: Sign in with no internet connection
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Make sure turn off internet
    ...
    ...     Test Data:
    ...     - Email: hantest1@yopmail.com
    ...     - Password: 00000000
    ...
    ...     Test Steps:
    ...     1. Input test data
    ...     2. Press on Sign in button
    ...
    ...     Expected Output:
    ...     2. The modal shall be displayed: “No internet connection. Try again”
    [Tags]      BIOC-AUTHEN-SIGNIN-16        BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-SIGNIN-17: Continue logging in with the recently logged out account
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in Biocare health app
    ...
    ...     Test Steps:
    ...     1. Press on Sign out button
    ...     2. Press on Sign out button
    ...     3. Press on Continue as [username] button
    ...     4. Press on Sign out button
    ...     5. Press on Sign out button
    ...     6. Press on Sign in with another account button
    ...
    ...     Expected Output:
    ...     2. Back to Sign in screen:
    ...        - Continue as [username] button
    ...        - Sign in with another account button
    ...     3. Navigate to the Home screen
    ...     5. Back to Sign in screen:
    ...        - Continue as [username] button
    ...        - Sign in with another account button
    ...     3. Back to Wellcome screen
    [Tags]      BIOC-AUTHEN-SIGNIN-17       BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-SIGNIN-18: Sign in with another account
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is signed out Biocare health app
    ...     - The user is signing in other app of Biotricity (Bioheart App)
    ...     - The app is opened
    ...
    ...     Test Steps:
    ...     1. Press on Continue as [username] button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Home screen
    [Tags]      BIOC-AUTHEN-SIGNIN-18        BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-SIGNOUT-01: Sign out from app
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...     1. Press on Sign out button
    ...     2. Press on Cancel button
    ...     3. Press on Sign out button
    ...     4. Press on Sign out button
    ...
    ...     Expected Output:
    ...     1. Popup Sign out shall be displayed:
    ...        - Text: Are you sure you wish to sign out?
    ...        - Sign out button
    ...        - Cancel button
    ...     2. The popup is closed
    ...     3. Popup Sign out shall be displayed
    ...     4. Navigate to Continue as [username] screen
    [Tags]      BIOC-AUTHEN-SIGNOUT-01       BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-SIGNOUT-02: verify sign out from app after log in and turn off the internet
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...     1. Turn off the internet
    ...     2. Press on Sign out button
    ...     3. Press on Sign out button
    ...
    ...     Expected Output:
    ...     Sign out from app successfully after log in and turn off the internet
    [Tags]      BIOC-AUTHEN-SIGNOUT-02       BIOC-2.1.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-SIGNOUT-03: verify account don't sign out from app after log in, turn off the internet and wait to more 2 hours
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...     1. Turn off the internet
    ...     2. wait to more 2 hours, open app again
    ...
    ...     Expected Output:
    ...     Account don't sign out from app after log in, turn off the internet and wait to more 2 hours
    [Tags]      BIOC-AUTHEN-SIGNOUT-03       BIOC-2.1.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-FORGOTPASSWORD-01: Reset password with valid email
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Sign in screen
    ...
    ...     Test Steps:
    ...     1. Press on Forgot password button
    ...     2. Input email
    ...     3. Press on Send button
    ...     4. Input code and new password
    ...     5. Press on Update button
    ...     6. Press on Sign in now button
    ...
    ...     Expected Output:
    ...     1. Navigate to Reset pasword screen:
    ...        - Text: Please enter your email in the field below to send the reset password request.
    ...        - Textbox "Enter your email"
    ...        - Send button
    ...     3. Navigate to Update password screen:
    ...        - Text: Please enter verification code.
    ...                You didn't receive the code? Resend now button
    ...        - Password field "Enter your password"
    ...        - Confirm password field "Re-enter your password"
    ...        - Update button
    ...     5. Navigate to Password updated screen:
    ...        - Text: You can now sign in with the new password
    ...        - Sign in now button
    ...     6. Back to Sign in screen
    [Tags]      BIOC-AUTHEN-FORGOTPASSWORD-01        BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-FORGOTPASSWORD-02: Reset password with invalid email
    [Documentation]     Author: Han Nguyen
    ...
    ...     Test Data:
    ...     - Email 1: xxxxx
    ...     - Email 2: hh@hh.com
    ...     - Email 3: c@yopmail.com (account pending mode)
    ...
    ...     Pre-condition:
    ...     - The user is in Reset password screen
    ...
    ...     Test Steps:
    ...     1. Press on Send button
    ...     2. Input email 1
    ...     3. Press on Send button
    ...     4. Input email 2
    ...     5. Press on Send button
    ...     6. Input email 3
    ...     7. Press on Send button
    ...
    ...     Expected Output:
    ...     1. The Email text bar’s outline color shall be changed to red.
    ...        Text below the bar with the content: “This field cannot be empty”
    ...     2. Navigate to Reset pasword screen
    ...     3. The Email text bar’s outline color shall be changed to red.
    ...        Text below the bar with the content: “Invalid email”
    ...     5. The Email text bar’s outline color shall be changed to red.
    ...        Text below the bar with the content: “Could not find an account associated with this email. Please try again.”
    ...     7. Navigate to Reset pasword screen
    [Tags]      BIOC-AUTHEN-FORGOTPASSWORD-02        BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-FORGOTPASSWORD-03: Update password
    [Documentation]     Author: Han Nguyen
    ...
    ...     Test Data:
    ...     - Password 1: 000
    ...     - Confirm password: 000
    ...
    ...     Pre-condition:
    ...     - The user is in Update password screen
    ...
    ...     Test Steps:
    ...     1. Press on textbox of password
    ...     2. Leave blank all fields or any field
    ...     3. Press on Update button
    ...     4. Input Code, Password and Confirm password
    ...     5. Press on Update button
    ...
    ...     Expected Output:
    ...     1. Message "Password must be at least 8 characters." shall be displayed
    ...     3. There is message "All fields are required" empty fields text bar's outline will change to red
    ...     5. The Password text bar’s outline color shall be changed to red.
    ...        Text below the bar with the content: “Password must be at least 8 characters.”
    [Tags]      BIOC-AUTHEN-FORGOTPASSWORD-03         BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-FORGOTPASSWORD-04: Enter passwords no matching
    [Documentation]     Author: Han Nguyen
    ...
    ...     Test Data:
    ...     - Password 1: 00000000
    ...     - Confirm password: 00000009
    ...
    ...     Pre-condition:
    ...     - The user is in Update password screen
    ...
    ...     Test Steps:
    ...     1. Input Code, Password and Confirm password
    ...     2. Press on Update button
    ...
    ...     Expected Output:
    ...     2. The Confirm password text bar’s outline color shall be changed to red.
    ...        Text below the bar with the content: “Password must be at least 8 characters.”
    [Tags]      BIOC-AUTHEN-FORGOTPASSWORD-04         BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-FORGOTPASSWORD-05: Enter wrong verification code
    [Documentation]     Author: Han Nguyen
    ...
    ...     Test Data:
    ...     - Code: 000000
    ...     - Password 1: 00000000
    ...     - Confirm password: 00000000
    ...
    ...     Pre-condition:
    ...     - The user is in Update password screen
    ...
    ...     Test Steps:
    ...     1. Input Code, Password and Confirm password
    ...     2. Press on Update button
    ...
    ...     Expected Output:
    ...     2. The Code text bar’s outline color shall be changed to red.
    ...        Text below the bar with the content: “Invalid verification code. Please try again.”
    [Tags]      BIOC-AUTHEN-FORGOTPASSWORD-05         BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-FORGOTPASSWORD-06: Resend now
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Update password screen
    ...
    ...     Test Steps:
    ...     1. Press on Resend now button
    ...
    ...     Expected Output:
    ...     1. Button shall be changed to “Resend <second>” (start a countdown from 59 to 0) and disable
    [Tags]      BIOC-AUTHEN-FORGOTPASSWORD-06         BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-FORGOTPASSWORD-07: Update password when no internet conection
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Update password screen
    ...     - Turn off Internet
    ...
    ...     Test Steps:
    ...     1. Press on Resend now button
    ...
    ...     Expected Output:
    ...     1. The modal shall be displayed: “No internet connection. Try again”
    [Tags]      BIOC-AUTHEN-FORGOTPASSWORD-07         BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BIOC-AUTHEN-CREATE-01: Verify the Google account and the Apple account when user create the email account
  [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user have the Google account and the Apple account
    ...     -
    ...
    ...     Test Steps:
    ...     - Press on Create account
    ...     - Input the first Name, Last Name
    ...     - Input the email with the same Google account and the Apple account
    ...     - Input the password
    ...     - Click the Create Account
    ...
    ...     Expected Output:
    ...     - This email address is already associated with an existing account. Please log in using Google and Apple account
    [Tags]      BIOC-AUTHEN-CREATE-01         BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-CREATE-02: Verify the Google account when user create the email account
  [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user have the Google account
    ...     -
    ...
    ...     Test Steps:
    ...     - Press on Create account
    ...     - Input the first Name, Last Name
    ...     - Input the email with the same Google account and the Apple account
    ...     - Input the password
    ...     - Click the Create Account
    ...
    ...     Expected Output:
    ...     - This email address is already associated with an existing account. Please log in using Google
    [Tags]      BIOC-AUTHEN-CREATE-02         BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-CREATE-03: Verify the Apple account when user create the email account
  [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user have the Apple account
    ...     -
    ...
    ...     Test Steps:
    ...     - Press on Create account
    ...     - Input the first Name, Last Name
    ...     - Input the email with the same Google account and the Apple account
    ...     - Input the password
    ...     - Click the Create Account
    ...
    ...     Expected Output:
    ...     - This email address is already associated with an existing account. Please log in using Apple
    [Tags]      BIOC-AUTHEN-CREATE-03         BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-CREATE-04: Verify the Email account when user create the same email account
  [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user have the Apple account
    ...     -
    ...
    ...     Test Steps:
    ...     - Input the first Name, Last Name
    ...     - Input the email with the same Google account and the Apple account
    ...     - Input the password
    ...     - Click the Create Account
    ...
    ...     Expected Output:
    ...     - This email address is already associated with an existing account
    [Tags]      BIOC-AUTHEN-CREATE-04         BIOC-1.22.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-CREATE-05: Verify new account sign in after sign up account
  [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Click Create account button
    ...     -
    ...
    ...     Test Steps:
    ...     - Input the first Name, Last Name
    ...     - Input the email 
    ...     - Input the password
    ...     - Input the Confirm password
    ...     - Click the Create Account
    ...     - Sign in the new account
    ...
    ...     Expected Output:
    ...     - the new account sign in successfully after sign up account
    [Tags]      BIOC-AUTHEN-CREATE-05         BIOC-2.1.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-CREATE-06: Verify new account sign in after after Leaving blank all fields or any field and create account
  [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Click Create account button
    ...     -
    ...
    ...     Test Steps:
    ...     - Press on Create account
    ...     - Leave blank all fields or any field
    ...     - Click the Create Account
    ...
    ...     Expected Output:
    ...     - the new account sign in successfully after sign up account
    [Tags]      BIOC-AUTHEN-CREATE-06         BIOC-2.1.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}    

BIOC-AUTHEN-CHANGEPASSWORD-01: Update password
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Data:
    ...     - Password 1: 12345678
    ...     - Confirm password: 12345678
    ...
    ...     Pre-condition:
    ...     - The user is in Profile tab
    ...     - Click Setting
    ...     - Click Change Password
    ...
    ...     Test Steps:
    ...     1. Input Current password
    ...     2. Input Password
    ...     3. Input Confirm password with the same password
    ...     4. Press on Update button
    ...
    ...     Expected Output:
    ...        The screen display : “Password updated!. You can now sign in with the new password” and Sign in button
    [Tags]      BIOC-AUTHEN-CHANGEPASSWORD-01         BIOC-2.1.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-CHANGEPASSWORD-02: Enter passwords no matching
    [Documentation]     Author: Tu Nguyen
    ...
     ...     Test Data:
    ...     - Password 1: 12345678
    ...     - Confirm password: 12345678
    ...
    ...     Pre-condition:
    ...     - The user is in Profile tab
    ...     - Click Setting
    ...     - Click Change Password
    ...
    ...     Test Steps:
    ...     1. Input Code, Password and Confirm password
    ...     2. Press on Update button
    ...
    ...     Expected Output:
    ...     2. The Confirm password text bar’s outline color shall be changed to red.
    ...        Text below the bar with the content: “Password must be at least 8 characters.”
    [Tags]      BIOC-AUTHEN-CHANGEPASSWORD-02         BIOC-2.1.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-CHANGEPASSWORD-03: Verify password can't change after Leaving blank all fields or any field and update password
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Data:
    ...     - Password 1: 12345678
    ...     - Confirm password: 12345678
    ...
    ...     Pre-condition:
    ...     - The user is in Profile tab
    ...     - Click Setting
    ...     - Click Change Password
    ...
    ...     Test Steps:
    ...     1. Press on textbox of password
    ...     2. Leave blank all fields or any field
    ...     3. Press on Update button
    ...
    ...     Expected Output:
    ...     1. Message "Password must be at least 8 characters." shall be displayed
    ...     3. There is message "All fields are required" empty fields text bar's outline will change to red
    [Tags]      BIOC-AUTHEN-CHANGEPASSWORD-03         BIOC-2.1.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BIOC-AUTHEN-CHANGEPASSWORD-04: Verify password can't change after turn off the internet and update password
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Data:
    ...     - Password 1: 12345678
    ...     - Confirm password: 12345678
    ...
    ...     Pre-condition:
    ...     - The user is in Profile tab
    ...     - Click Setting
    ...     - Click Change Password
    ...
    ...     Test Steps:
    ...     1. Turn off the internet
    ...     2. Input Current password
    ...     3. Input Password
    ...     4. Input Confirm password with the same password
    ...     5. Press on Update button
    ...
    ...     Expected Output:
    ...     The snackbar display " No internet connection" 
    [Tags]      BIOC-AUTHEN-CHANGEPASSWORD-04         BIOC-2.1.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-AUTHEN-CHANGEPASSWORD-05: Verify account sign in with the new password after updating password
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Data:
    ...     - Password 1: 12345678
    ...     - Confirm password: 12345678
    ...
    ...     Pre-condition:
    ...     - The user is in Profile tab
    ...     - Click Setting
    ...     - Click Change Password
    ...
    ...     Test Steps:
    ...     1. Input Current password
    ...     2. Input Password
    ...     3. Input Confirm password with the same password
    ...     4. Press on Update button
    ...     5. Click Sign in button
    ...     6. Input the new account with new password
    ...
    ...     Expected Output:
    ...     account sign in with the new password successfully after updating password
    [Tags]      BIOC-AUTHEN-CHANGEPASSWORD-05         BIOC-2.1.0    manual  R1
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
