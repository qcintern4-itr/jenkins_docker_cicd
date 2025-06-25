*** Settings ***
Documentation   Bioheart app Authen test suite
Metadata    sid     BHA-AUTHEN
Metadata    owner   Linh Tran
Library     corelib/AssertionExtension.py

Force Tags      BHA-AUTHEN     mapp
Test Timeout    1h

*** Test Cases ***
BHA-AUTHEN-WELCOME-01: View the 1st welcome screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - Display an image (images follow the design).
    ...    - Explore button to navigate to the next screen
    ...    - There shall be message: “Improving lives by making the most accurate heart data available to everyone.”.
    [Tags]      BHA-AUTHEN-WELCOME-01       BIOH-SRS-01-FRS-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-WELCOME-02: View the 2nd welcome screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - Display images, the user can slide on the screen to view the next/previous image
    ...         + Message 1: Bioheart is the first of its kind – continuous heart rhythm monitor for everyday use.
    ...         + Message 2: Bioheart records your electrical heart activity continuously while you wear it, delivering the most accurate health insights on your heart.
    ...         + Message 3: Your data is viewable live and saved in the app for you to review later.
    ...         + Message 4: Easily export and share your data with a physician for a deeper understanding of your heart trends
    ...    - Next/Back button to navigate to the next/previous image
    ...         + The Next button of the last image will be replaced by the Get started button.
    ...         + Pressing Get started button will navigate the user to the Sign in screen.
    ...    - Skip button to navigate to the Sign in screen
    [Tags]      BHA-AUTHEN-WELCOME-02       BIOH-SRS-01-FRS-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-SIGNIN-01: View Sign in screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Sign in screen
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - User can sign in app with valid credentials
    ...    - User can sign in app with social accounts (Google, Facebook and Apple ID)
    ...    - User can get new password by pressing on Forgot password button
    ...    - There shall be a “Create” button, by tapping this button the user shall be navigated to the register screen
    ...    - User can navigate back by pressing back button
    [Tags]      BHA-AUTHEN-SIGNIN-01       BIOH-SRS-01-FRS-02-001        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-SIGNIN-02: Sign in with valid credentials
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Sign in screen
    ...
    ...     Test Steps:
    ...    - Enter valid credentials
    ...    - Press on Sign in button
    ...
    ...     Expected Output:
    ...    - Sign in successfully and navigate to Force pair devie screen
    [Tags]      BHA-AUTHEN-SIGNIN-02       BIOH-SRS-01-FRS-02-001        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-SIGNIN-03: Leave blank all fields or any field to sign in app
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Sign in screen
    ...
    ...     Test Steps:
    ...    - Leave blank all fields or email field or password field
    ...    - Press on Sign in button
    ...
    ...     Expected Output:
    ...    - In case, leaving blank all fields or email field
    ...         + There is a message "This field cannot be empty" and email text bar's outline will change to red
    ...    - In case, leaving blank password field
    ...         + There is a message "This field cannot be empty" and password text bar's outline will change to red
    [Tags]      BHA-AUTHEN-SIGNIN-03       BIOH-SRS-01-FRS-02-001        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-SIGNIN-04: Sign in with invalid format email
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Sign in screen
    ...
    ...     Test Steps:
    ...    - Enter invalid format email
    ...    - Enter password
    ...    - Press on Sign in button
    ...
    ...     Expected Output:
    ...    - There is a message "Invalid email" and email text bar's outline will change to red
    [Tags]      BHA-AUTHEN-SIGNIN-04       BIOH-SRS-01-FRS-02-001        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-SIGNIN-05: Sign in with email has not registered or account has deleted after 30 days
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Sign in screen
    ...
    ...     Test Steps:
    ...    - Enter email has not registered or account has deleted after 30 days
    ...    - Enter password
    ...    - Press on Sign in button
    ...
    ...     Expected Output:
    ...    - There is a message "Could not find your account" and email text bar's outline will change to red
    [Tags]      BHA-AUTHEN-SIGNIN-05       BIOH-SRS-01-FRS-02-001        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-SIGNIN-06: Sign in with incorrect password
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Sign in screen
    ...
    ...     Test Steps:
    ...    - Enter email
    ...    - Enter incorrect password
    ...    - Press on Sign in button
    ...
    ...     Expected Output:
    ...    - There is a message "Incorrect password" and password text bar's outline will change to red
    [Tags]      BHA-AUTHEN-SIGNIN-06       BIOH-SRS-01-FRS-02-001        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-SIGNIN-07: Sign in with incomplete profile email
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Sign in screen
    ...
    ...     Test Steps:
    ...    - Enter valid credentials but incomplete profile
    ...    - Press on Sign in button
    ...
    ...     Expected Output:
    ...    - Sign in successfully and navigate to Complete profile screen
    [Tags]      BHA-AUTHEN-SIGNIN-07       BIOH-SRS-01-FRS-02-001        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-SIGNIN-08: Sign in with unverified email
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Sign in screen
    ...
    ...     Test Steps:
    ...    - Enter unverified email
    ...    - Enter password
    ...    - Press on Sign in button
    ...
    ...     Expected Output:
    ...    - Navigate to Resend Verification Email screen
    ...    - There is Resend Verification Email button to resend email and Back to sign in button to navigate back to Sign in screen
    [Tags]      BHA-AUTHEN-SIGNIN-08       BIOH-SRS-01-FRS-02-001        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-SIGNIN-09: Sign in with deleted account is pending mode (Recovery account)
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Sign in screen
    ...     - The deleted account is pending mode
    ...
    ...     Test Steps:
    ...    - Enter email and password
    ...    - Press on Sign in button
    ...
    ...     Expected Output:
    ...    - Display Account recovery screen
    ...         + Press on Recovery button, the account is recovered and press on Continue to Home, navigate to Home screen
    ...         + Press on Cancel button, cancel to recover account
    [Tags]      BHA-AUTHEN-SIGNIN-09       BIOH-SRS-01-FRS-02-001       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-SIGNIN-10: Sign in Google account
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Sign in screen
    ...
    ...     Test Steps:
    ...    - Press on Google account
    ...
    ...     Expected Output:
    ...    - In case, the 1st time sign in with Google account
    ...         + Navigate to  Complete profile screen
    ...    - In case, from the 2nd time sign in with Google account
    ...         + Navigate to Force pair devie screen
    [Tags]      BHA-AUTHEN-SIGNIN-10       BIOH-SRS-01-FRS-02-002    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-SIGNIN-11: Sign in Apple ID
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Sign in screen
    ...
    ...     Test Steps:
    ...    - Press on Google account
    ...
    ...     Expected Output:
    ...    - In case, the 1st time sign in with Apple ID
    ...         + Navigate to  Complete profile screen
    ...    - In case, from the 2nd time sign in with Apple ID
    ...         + Navigate to Force pair devie screen
    [Tags]      BHA-AUTHEN-SIGNIN-11       BIO-SRS-01-FRS-02-002    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-SIGNIN-12: Sign in Facebook
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Sign in screen
    ...
    ...     Test Steps:
    ...    - Press on Facebook account
    ...
    ...     Expected Output:
    ...    - In case, the 1st time sign in with Facebook
    ...         + Navigate to  Complete profile screen
    ...    - In case, from the 2nd time sign in with Facebook
    ...         + Navigate to Force pair devie screen
    [Tags]      BHA-AUTHEN-SIGNIN-12       BIO-SRS-01-FRS-02-002    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-RESETPASSWORD-01: Create new password
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Sign in screen
    ...
    ...     Test Steps:
    ...    - Press on Forgot password button
    ...    - Enter valid email or the deleted account is pending mode
    ...    - Press on Send button
    ...    - Enter valid verification code
    ...    - Enter password and confirm password
    ...    - Press on Update button
    ...
    ...     Expected Output:
    ...    - When pressing on Forgot password button, navigate to Reset password screen
    ...    - When pressing on Send button, navigate to Update password screen
    ...         + When users press on password field, there is message "Passwords must be at least 8 characters"
    ...         + When users enter password and confirm password, the passwords are hidden and press on eye icon to show password
    ...    - User can close bottom sheet by press on close button
    ...    - When pressing on Update button, update password successfully and navigate to Password updated! screen
    ...    - There is Sign in now button, press on it to navigate to Sign in screen
    [Tags]      BHA-AUTHEN-RESETPASSWORD-01        BIOH-SRS-01-FRS-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-RESETPASSWORD-02: Create new password with invalid format email
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Reset password screen
    ...
    ...     Test Steps:
    ...    - Enter invalid format email
    ...    - Press on Send button
    ...
    ...     Expected Output:
    ...    - There is a message "Invalid email" and email text bar's outline will change to red
    [Tags]      BHA-AUTHEN-RESETPASSWORD-02        BIOH-SRS-01-FRS-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-RESETPASSWORD-03: Create new password email has not registered or account has deleted after 30 days
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Reset password screen
    ...
    ...     Test Steps:
    ...    - Enter email has not registered or account has deleted after 30 days
    ...    - Press on Send button
    ...
    ...     Expected Output:
    ...    - There is a message "Could not find account associated with this email. Please try again" and email text bar's outline will change to red
    [Tags]      BHA-AUTHEN-RESETPASSWORD-03        BIOH-SRS-01-FRS-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-RESETPASSWORD-04: Leave blank email field
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Reset password screen
    ...
    ...     Test Steps:
    ...    - Leave blank field
    ...    - Press on Send button
    ...
    ...     Expected Output:
    ...    - There is a message "This field cannot be empty" and email text bar's outline will change to red
    [Tags]      BHA-AUTHEN-RESETPASSWORD-04        BIOH-SRS-01-FRS-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-RESETPASSWORD-05: Leave blank all fields or any field in Update password screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Update password screen
    ...
    ...     Test Steps:
    ...    - Leave blank all fields or any field
    ...    - Press on Update button
    ...
    ...     Expected Output:
    ...    - There is message "All fields are required" empty fields text bar's outline will change to red
    [Tags]      BHA-AUTHEN-RESETPASSWORD-05        BIOH-SRS-01-FRS-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-RESETPASSWORD-06: Enter password less than 8 characters
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Update password screen
    ...
    ...     Test Steps:
    ...    - Enter valid verification code
    ...    - Enter password less than 8 characters
    ...    - Press on Update button
    ...
    ...     Expected Output:
    ...    - There is a message "Passwords must be at least 8 characters" and password text bar's outline will change to red
    [Tags]      BHA-AUTHEN-RESETPASSWORD-06        BIOH-SRS-01-FRS-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-RESETPASSWORD-07: Enter passwords no matching
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Update password screen
    ...
    ...     Test Steps:
    ...    - Enter valid verification code
    ...    - Enter passwords no matching
    ...    - Press on Update button
    ...
    ...     Expected Output:
    ...    - There is a message "Your passwords don't match" and confirm password text bar's outline will change to red
    [Tags]      BHA-AUTHEN-RESETPASSWORD-07        BIOH-SRS-01-FRS-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-RESETPASSWORD-08: Enter wrong verification code
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Update password screen
    ...
    ...     Test Steps:
    ...    - Enter invalid verification code
    ...    - Enter passwords
    ...    - Press on Update button
    ...
    ...     Expected Output:
    ...    - There is a message "Wrong verification code. Please type again" and verification code text bar's outline will change to red
    [Tags]      BHA-AUTHEN-RESETPASSWORD-08        BIOH-SRS-01-FRS-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-SIGNOUT-01: Sign out from app
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...    - Press on Sign out button
    ...    - Press on Sign out or Cancel button
    ...
    ...     Expected Output:
    ...    - If users press on Sign out button, user shall sign out from app
    ...    - If users press on Cancel button, the popup is closed
    [Tags]      BHA-AUTHEN-SIGNOUT-01      BIOH-SRS-01-FRS-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-REGISTER-01: View Register screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Welcome screen
    ...
    ...     Test Steps:
    ...    - Press on Register now button
    ...
    ...     Expected Output:
    ...    - User can register new account by filling all fields and press on Create account button
    ...    - User can navigate to the previous screen by press on back icon button
    ...    - User can view Privacy policy by pressing on Privacy policy text
    ...         + Naviagte to Privacy policy screen
    ...             *Content: follow design
    ...         + When users press on links in the content, the app will navigate to the corresponding screen
    ...         + If users press on Understood or close icon button, the privacy policy is closed
    ...    - User can view Terms and conditions by pressing on Terms and conditions text
    ...         + Naviagte to Terms and conditions screen
    ...             * Content: follow design
    ...         + When users press on links in the content, the app will navigate to the corresponding screen
    ...         + If users press on Understood or close icon button, the terms and conditions is closed
    [Tags]      BHA-AUTHEN-REGISTER-01     BIOH-SRS-01-FRS-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-REGISTER-02: Register new account
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Register screen
    ...
    ...     Test Steps:
    ...    - Enter all fields
    ...    - Press on Create account button
    ...
    ...     Expected Output:
    ...    - When users press on password field, there is message "Passwords must be at least 8 characters"
    ...    - When users enter password and confirm password, the passwords are hidden and press on eye icon to show password
    ...    - When users press on Create account button, navigate to Email Verification screen
    ...    - A verification email shall be sent to the user’s email that was provided in the signup process
    ...    - A message shall be displayed to the user stating: “An email with a confirmation link has been sent to “user_email”. Please check your email and follow the instruction to activate your account.”
    ...    - A Back to sign in” button shall be available for the user to click on and navigate to the “Sign In” screen
    ...         * If the user has not completed verify email, there shall be a message “Your account is not verified. Please check your email and click the verification link to activate your account." And the “Resend Verification Email” button to resend the email
    [Tags]      BHA-AUTHEN-REGISTER-02     BIOH-SRS-01-FRS-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-REGISTER-03: Leave blank all fields or any field when registering account
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
    [Tags]      BHA-AUTHEN-REGISTER-03     BIOH-SRS-01-FRS-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-REGISTER-04: Register account with invalid eamil
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Register screen
    ...
    ...     Test Steps:
    ...    - Enter all fields with invalid email
    ...    - Press on Create account button
    ...
    ...     Expected Output:
    ...    - There is a message "Invalid email" and email text bar's outline will change to red
    [Tags]      BHA-AUTHEN-REGISTER-04     BIOA-SRS-01-FRS-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-REGISTER-05: Register account with password less than 8 characters
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Register screen
    ...
    ...     Test Steps:
    ...    - Enter all fields and enter password less than 8 characters
    ...    - Press on Create account button
    ...
    ...     Expected Output:
    ...    - There is a message "Passwords must be at least 8 characters" and password text bar's outline will change to red
    [Tags]      BHA-AUTHEN-REGISTER-05     BIOH-SRS-01-FRS-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-REGISTER-06: Register account with passwords don't match
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Register screen
    ...
    ...     Test Steps:
    ...    - Enter all fields and enter passwords don't match
    ...    - Press on Create account button
    ...
    ...     Expected Output:
    ...    - There is a message "Your passwords don't match" and confirm password text bar's outline will change to red
    [Tags]      BHA-AUTHEN-REGISTER-06     BIOH-SRS-01-FRS-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-REGISTER-07: Register account without Internet connection
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Register screen
    ...     - The Internet is disconnected
    ...
    ...     Test Steps:
    ...    - Enter all fields
    ...    - Press on Create account button
    ...
    ...     Expected Output:
    ...    - There is a message "No internet connection. Try again"
    [Tags]      BHA-AUTHEN-REGISTER-07     BIOH-SRS-01-FRS-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-REGISTER-08: Register with the deleted account is pending mode
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Register screen
    ...     - The deleted account is pending mode
    ...
    ...     Test Steps:
    ...    - Register account with the deleted account is pending mode
    ...
    ...     Expected Output:
    ...    - There is message "Account already exist"
    [Tags]      BHA-AUTHEN-REGISTER-08     BIOH-SRS-01-FRS-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-COMPLETEPROFILE-01: Complete profile with Bioheart profile
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Sign in screen
    ...
    ...     Test Steps:
    ...    - Sign in with incomplete profile accont
    ...
    ...     Expected Output:
    ...    - Navigate to complete profile screen
    ...    - User name:
    ...         + The username will be auto-filled with the name from the created account.
    ...         + The user can change the username
    ...    - Email
    ...         + The email will be the email from the created account
    ...    - Avatar: There is an edit button, clicking on this there shall be a modal for the user to choose an avatar
    ...         + Upload image button, clicking on this will let the user choose an image. The max size of the image that can be chosen is 1Mb.
    ...         + Remove image button will appear if there is an image being chosen. Clicking on this will remove the image.
    ...         + Save button to save avatar and close the modal.
    ...         + Close button to close the modal without saving
    ...    - Date of birth
    ...         + Click on the Date of birth field will open a calendar for the user to choose.
    ...         + By default, the calendar will choose the current day
    ...    - Gender
    ...         + The user can switch between Male/Female.
    ...         + The user can only choose 1 gender
    ...    - System of measurement
    ...         + Imperial (ft, lb) (default)
    ...         + Metric (cm, kg)
    ...         + Depending on which system is chosen the Height and Weight input field will change according to that system.
    ...         + If the user has input any field and then changes the system, the value will be converted automatically.
    ...    - Height
    ...         + ft input field
    ...             * Max value: 8
    ...             * Min value: 0
    ...         + in input field
    ...             * Max value: 11
    ...             * Min value: 0
    ...         + cm input field
    ...             * Max value: 271.9
    ...             * Min value: 0
    ...    - Weight
    ...         + ibs input field
    ...             * Max value: 881.9
    ...             * Min value: 0
    ...         + kg input field
    ...             * Max value: 399.9
    ...             * Min value: 0
    ...    - Save button will be disabled until the user input all the fields
    ...         + If there is any error that makes the complete profile can not be done, there shall be a message: Something went wrong! Could not update your profile. Please try again.
    ...         + Pressing on this will navigate the user to the Summary screen.
    ...         + For the first time the user navigates to the Overview screen, there shall be a welcome onboard modal with content as the design.
    ...             * Next button to navigate to the next screen.
    ...             * Close button to close the modal.
    ...    - There shall be a “Continue” button at the bottom of the screen
    ...         + The button shall be available to be pressed when the user has completed and filled in all the input fields.
    ...         + When pressed, the user shall be navigated to the next screen. The screen shall contain the following components
    ...             * Country: By default, this field’s value shall be the United States
    ...             * Phone number: required field
    ...                 • User shall be able to enter 10 numbers in the input box
    ...             * Address: pressing it will navigate the user to the search address screen
    ...                 • User shall be able to enter a text in the input box.
    ...                 • There shall be address suggestions from the system which the user can select and the address shall populate to address city, state, and zip code fields.
    ...                 • There shall be a back button, pressing this will navigate the user back to the previous screen without saving change.
    ...                 • If there is no internet connection during this duration, there shall be a modal to inform the user
    ...             * City: City’s name is automatically input when the user enters their address or city. Pressing it will navigate the user to the search city screen
    ...                 • City’s name is automatically input when the user enters their address.
    ...                 • User shall be able to enter a text in the input box.
    ...                 • There shall be city suggestions from the system which the user can select, and the city shall populate with city, state, and zip code fields
    ...             * State: State’s name is automatically input when the user enters their address or city.
    ...             * Zip code: Zip code is automatically input when the user enters their address
    ...                 • User shall be able to enter a valid digit number in the input box
    ...             * There shall be a “Done” button, user shall be navigated to the “completed” onboarding screen. The screen shall contain an instruction to pair device and Get Started/ Next buttons
    ...    - User can access the PROFILE tab to edit the information later
    [Tags]      BHA-AUTHEN-COMPLETEPROFILE-01     BIOH-SRS-01-FRS-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-AUTHEN-COMPLETEPROFILE-02: Complete profile with 3rd party account
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Sign in screen
    ...
    ...     Test Steps:
    ...    - Sign in with incomplete profile accont
    ...
    ...     Expected Output:
    ...    - Navigate to complete profile screen
    ...    - User name:
    ...         + The username will be auto-filled with the name from the 3rd party account.
    ...         + If the app can not get a username, the fields will be emptied.
    ...         + The user can input the username
    ...    - Email
    ...         + The username will be the email from the 3rd party account
    ...         + If the app can not get an email, display “abc123@example.com”.
    ...    - Avatar: There is an edit button, clicking on this there shall be a modal for the user to choose an avatar
    ...         + Upload image button, clicking on this will let the user choose an image. The max size of the image that can be chosen is 1Mb.
    ...         + Remove image button will appear if there is an image being chosen. Clicking on this will remove the image.
    ...         + Save button to save avatar and close the modal.
    ...         + Close button to close the modal without saving
    ...    - Date of birth
    ...         + Click on the Date of birth field will open a calendar for the user to choose.
    ...         + By default, the calendar will choose the current day
    ...    - Gender
    ...         + The user can switch between Male/Female.
    ...         + The user can only choose 1 gender
    ...    - System of measurement
    ...         + Imperial (ft, lb) (default)
    ...         + Metric (cm, kg)
    ...         + Depending on which system is chosen the Height and Weight input field will change according to that system.
    ...         + If the user has input any field and then changes the system, the value will be converted automatically.
    ...    - Height
    ...         + ft input field
    ...             * Max value: 8
    ...             * Min value: 0
    ...         + in input field
    ...             * Max value: 11
    ...             * Min value: 0
    ...         + cm input field
    ...             * Max value: 271.9
    ...             * Min value: 0
    ...    - Weight
    ...         + ibs input field
    ...             * Max value: 881.9
    ...             * Min value: 0
    ...         + kg input field
    ...             * Max value: 399.9
    ...             * Min value: 0
    ...    - Save button will be disabled until the user input all the fields
    ...         + If there is any error that makes the complete profile can not be done, there shall be a message: Something went wrong! Could not update your profile. Please try again.
    ...         + Pressing on this will navigate the user to the Summary screen.
    ...         + For the first time the user navigates to the Overview screen, there shall be a welcome onboard modal with content as the design.
    ...             * Next button to navigate to the next screen.
    ...             * Close button to close the modal.
    ...    - There shall be a “Continue” button at the bottom of the screen
    ...         + The button shall be available to be pressed when the user has completed and filled in all the input fields.
    ...         + When pressed, the user shall be navigated to the next screen. The screen shall contain the following components
    ...             * Country: By default, this field’s value shall be the United States
    ...             * Phone number: required field
    ...                 • User shall be able to enter 10 numbers in the input box
    ...             * Address: pressing it will navigate the user to the search address screen
    ...                 • User shall be able to enter a text in the input box.
    ...                 • There shall be address suggestions from the system which the user can select and the address shall populate to address city, state, and zip code fields.
    ...                 • There shall be a back button, pressing this will navigate the user back to the previous screen without saving change.
    ...                 • If there is no internet connection during this duration, there shall be a modal to inform the user
    ...             * City: City’s name is automatically input when the user enters their address or city. Pressing it will navigate the user to the search city screen
    ...                 • City’s name is automatically input when the user enters their address.
    ...                 • User shall be able to enter a text in the input box.
    ...                 • There shall be city suggestions from the system which the user can select, and the city shall populate with city, state, and zip code fields
    ...             * State: State’s name is automatically input when the user enters their address or city.
    ...             * Zip code: Zip code is automatically input when the user enters their address
    ...                 • User shall be able to enter a valid digit number in the input box
    ...             * There shall be a “Done” button, user shall be navigated to the “completed” onboarding screen. The screen shall contain an instruction to pair device and Get Started/ Next buttons
    ...    - User can access the PROFILE tab to edit the information later
    [Tags]      BHA-AUTHEN-COMPLETEPROFILE-02     BIOH-SRS-01-FRS-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
