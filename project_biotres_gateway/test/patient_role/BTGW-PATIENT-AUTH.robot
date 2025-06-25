*** Settings ***
Documentation   Patient-Authentication Test Suite
Metadata    sid     BTGW-PATIENT-AUTH
Metadata    owner   Nhan Nguyen
Library    corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library    corelib/AssertionExtension.py
Library    project_cardiac_portal/lib/web/Common.py

#Suite Setup    ${BROWSER_NODE}      Start Browser
#...  Import Library      project_cardiac_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
#...  Import Library      project_cardiac_portal/lib/web/Calendar.py  ${BROWSER_NODE}  ${ENV}
#...  ${USER}     Get Config Param    USER > nurse_01
#...  ${TOKEN}    Sign In Cardiac     username=${USER}[username]   password=${USER}[password]
#...  Set Suite Variable  ${USER}
#...  Set Suite Variable  ${TOKEN}
Force Tags      BTGW-PATIENT-AUTH       mapp
Test Timeout    30m

*** Test Cases ***
BTGW-PATIENT-AUTH-UPGRACE-01: upgrade new version
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can upgrade new version
    ...
    ...     Precondition:
    ...     - The user is on the old version
    ...
    ...
    ...     Test Steps:
    ...     - 1. Open CHPlay/ Appstore
    ...     - 2. click Update button of that app
    ...     Expected Results:
    ...     - 1. The app still works normally.
    ...
    [Tags]  BTGW-PATIENT-AUTH-UPGRACE-01        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-CHECKENVIROMENT: Check enviroment of the app
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Check enviroment of the app
    ...
    ...     Precondition:
    ...     - The user is on the old version
    ...
    ...
    ...     Test Steps:
    ...     - 1. Sign in the enviroment other account
    ...     Expected Results:
    ...     - 1. Display a error message :“We can’t find any account associated with this username"
    ...
    [Tags]  BTGW-PATIENT-AUTH-CHECKENVIROMENT       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNUP-01: When invalid email format
    [Documentation]    Author: Phuong Tran
    ...
    ...     Description: The user can't sign up the Biostres Gateway app with invalid email format
    ...
    ...     Precondion: The user is on the Sign up screen.
    ...
    ...     Test Steps:
    ...     - 1. Fill in the First name and Last name fields
    ...     - 2. In the Email field - Enter invalid email format (ex: biotres.com)
    ...     - 3. Fill in the Password and Confirm password fields.
    ...     - 4. Click "Sign in" button
    ...
    ...     Expected Result:
    ...     Displaying error message"Invalid email format" below the Email field.
    [Tags]  BTGW-PATIENT-AUTH-SIGNUP-01        manual
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNUP-02: When email entered is valid
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can sign up the Biotres Gateway account with valid email format
    ...
    ...     Precondition: The user is on the Sign up screen
    ...
    ...     Test steps:
    ...     - 1. Fill in the First name and Last name fields
    ...     - 2. In the Email field - Enter valid email format (ex: phuongitr@yopmail.com)
    ...     - 3. Fill in the Password and Confirm password fields.
    ...     - 4. Click "Sign in" button
    ...
    ...     Expected Result:
    ...     - 1. The user shall be navigated to the "Oops!" screen
    ...     - 2. The "Verify your email!" screen
    ...     - Content: A verification link has been sent to emily.smith@gmail.com.
    ...     Please check your inbox and follow the instructions.
    ...     - Buttons: "Back to sign in" button
    ...
    [Tags]     BTGW-PATIENT-AUTH-SIGNUP-02        manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNUP-03: When email entered exists in the system
    [Documentation]    Author: Phuong Tran
    ...
    ...     Description: The user can't sign up the Biostres Gateway account with email exists in the system
    ...
    ...     Test steps:
    ...     - 1. Fill in the First name and Last name fields
    ...     - 2. In the Email field - Enter email that exists in the system.
    ...     (ex: phuongitr1@yopmail.com)
    ...     - 3. Fill in the Password and Confirm password fields.
    ...     - 4. Click "Sign in" button
    ...
    ...     Expected Result:
    ...     - 1. The user shall be navigated to the "Oops!" screen.
    ...     - 2. The "Oops!" screen:
    ...     - Content: The email emily.smith@gmail.com has already been taken.
    ...     - Please sign in to continue!
    ...     - Buttons: "Back to sign in" button

     [Tags]     BTGW-PATIENT-AUTH-SIGNUP-03        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNUP-04: When email entered was used for the registration but has not been verified
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can't sign up the Biotres Gateway account with email entered was used for the registration but has not been verified
    ...
    ...     Pre-condition:
    ...     The user is in the Sign up screen.
    ...     The email entered by a previously registered user.
    ...
    ...     Test Steps:
    ...     - 1. 1. Fill in the First name and Last name fields
    ...     - 2. In the Email field - Enter email that the user registered previously
    ...     - 3. Fill in the Password and Confirm password fields.
    ...     - 4. Click "Sign in" button
    ...
    ...     Expected Result:
    ...     - 1. The user shall be navigated to the "Oops!" screen.
    ...     - 2. The "Oops!" screen:
    ...     - Content: The email emily.smith@gmail.com has already been taken.
    ...     Please sign in to continue!
    ...     - Buttons: "Back to sign in" button

    [Tags]     BTGW-PATIENT-AUTH-SIGNUP-04        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNUP-05: When email entered is a deleted email that has recovery time is within 30 days
        [Documentation]  Author: Phuong Tran

    ...     Description: The user can't sign up the Biotres Gate app with email entered is deleted email that has recovery time is within 30 days
    ...
    ...     Precondition:
    ...     - The user is on the Sign up screen
    ...     - The email entered is deleted email that has recovery time is within 30 days
    ...
    ...     Test steps:
    ...     - 1. Fill in the First name and Last name fields
    ...     - 2. In the Email field - Enter email that the user registered previously
    ...     - 3. Fill in the Password and Confirm password fields.
    ...     - 4. Click "Sign in" button
    ...
    ...     Expected Result:
    ...     - 1. The user shall be navigated to the "Oops!" screen.
    ...     - 2. The "Oops!" screen:
    ...     - Content: The email emily.smith@gmail.com has already been taken.
    ...     Please sign in to continue!
    ...     - Buttons: "Back to sign in" button

    [Tags]  BTGW-PATIENT-AUTH-SIGNUP-05        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNUP-06: The user can navigate back to Sign in screen by tapping Back button
    [Documentation]  Author: Phuong Tran
...
...     Description: The user can navigate back to Sign in screen by tapping Back button
...
...     Precondition: The user is on the Sign up screen.
...
...     Test Steps:
...     - Tap "Back" button and Observe
...
...     Expected Result:
...     - The user shall be navigated back to the Sign in screen.
    [Tags]  BTGW-PATIENT-AUTH-SIGNUP-06        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNUP-07: The user can navigate back to Sign in screen by tapping Sign in button
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can navigate back to Sign in screen by tapping Back button
    ...
    ...     Precondition: The user is on the Sign up screen.
    ...
    ...     Test Steps:
    ...     - Tap "Sign in" button and Observe
    ...
    ...     Expected Result:
    ...     - The user shall be navigated back to the Sign in screen.
    [Tags]  BTGW-PATIENT-AUTH-SIGNUP-07        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNIN-01:Valid email and password of active account
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can sign in the Biotres Gateway with valid email and password of active account
    ...
    ...     Precondition: The user is on the Sign in screen.
    ...
    ...     Test Steps:
    ...     - 1. Enter valid email and password of active account
    ...     - 2. Tap "Sign in" button
    ...
    ...     Expected Result:
    ...     - 1. Login successfully.
    ...     - 2. The user shall be navigated the Input reference code screen.
    ...     - 3. Logs in for the first time - the user shall be navigated the Complete profile screen.
    [Tags]  BTGW-PATIENT-AUTH-SIGNIN-01        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNIN-02:Invalid email and password of active account
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can't sign in the Biotres Gateway with invalid email and password of active account
    ...
    ...     Precondition: The user is on the Sign in screen.
    ...
    ...     Test Steps:
    ...     - 1. Enter invalid email or password of active account
    ...     - 2. Tap "Sign in" button
    ...
    ...     Expected Result:
    ...     - Displaying error message "Incorrect credentials"
    [Tags]  BTGW-PATIENT-AUTH-SIGNIN-02        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNIN-03:Valid email and password of deleted account under 30 days from Biotres gateway app
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can sign in the Biotres Gateway with Valid email and password of deleted account under 30 days from Biotres gateway app
    ...
    ...     Precondition: The user is on the Sign in screen.
    ...
    ...     Test Steps:
    ...     - 1. Enter valid email or password of deleted account under 30days
    ...     - 2. Tap "Sign in" button
    ...
    ...     Expected Result:
    ...     - 1. Login successfully.
    ...     - 2. The user shall be navigated to the Recovery screen.
        [Tags]  BTGW-PATIENT-AUTH-SIGNIN-03        manual
        Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNIN-04: Recovery deleted accounts from the Biotres Gateway app
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can recovery deleted accounts from the Biotres Gateway app
    ...
    ...     Precondition: The user is on the Sign in screen.
    ...
    ...     Test Steps:
    ...     - 1. Enter valid email or password of deleted account under 30days from others app
    ...     - 2. Tap "Sign in" button
    ...     - 3. In the Recovery screen - Tap "Recovery" button
    ...
    ...     Expected Result:
    ...     - The deleted account from Biotres Gate app shall be recovery.
    ...     - The user shall be on the Input reference code screen.
        [Tags]  BTGW-PATIENT-AUTH-SIGNIN-04        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNIN-05: Recover deleted accounts from Biotres Gateway app in case of retrying after Recovery failed
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can recovery deleted accounts from the Biotres Gateway app in case of retrying after Recovery failed
    ...
    ...     Precondition: The user is on the Sign in screen.
    ...
    ...     Test Steps:
    ...     - 1. Enter valid email or password of deleted account under 30days from others app
    ...     - 2. Tap "Sign in" button
    ...     - 3. Turn off wifi
    ...     - 4. In the Recovery screen - Tap "Recovery" button
    ...     - 5. Turn on wifi
    ...     - 6. In the Failed Recovery pop up - Tap "Retry" button
    ...
    ...     Expected Result:
    ...     - The deleted account from Biotres Gate app shall be recovery.
    ...     - The user shall be on the Input reference code screen.
        [Tags]  BTGW-PATIENT-AUTH-SIGNIN-05        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNIN-06: Cancel the deleted account recovery process
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can cancel the deleted account recovery process
    ...
    ...     Precondition: The user is on the Sign in screen.
    ...
    ...     Test Steps:
    ...     - 1. Enter valid email or password of deleted account under 30days from others app
    ...     - 2. Tap "Sign in" button
    ...     - 3. In the Recovery screen - Tap "Cancel" button
    ...
    ...     Expected Result:
    ...     - The deleted account from Biotres Gate app shall not be recovered.
    ...     - The user shall be navigated back to the Sign in screen.
    [Tags]  BTGW-PATIENT-AUTH-SIGNIN-06        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNIN-07:Valid email and password of deleted account under 30 days from other apps (Bioheart, Biocare Telemed, Biocare cardiac…)
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can sign in the Biotres Gateway with Valid email and password of deleted account under 30 days from others apps (Bioheart, Biocare Telemed, Biocare cardiac…)
    ...
    ...     Precondition: The user is on the Sign in screen.
    ...
    ...     Test Steps:
    ...     1. Enter valid email or password of deleted account under 30days from others app
    ...     2. Tap "Sign in" button
    ...
    ...     Expected Result:
    ...     1. Login successfully.
    ...     2. The user shall be navigated to the Recovery screen.
    [Tags]  BTGW-PATIENT-AUTH-SIGNIN-07        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}
BTGW-PATIENT-AUTH-SIGNIN-08: Recovery deleted accounts from the others app
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can recovery deleted accounts from the others app
    ...
    ...     Precondition: The user is on the Sign in screen.
    ...
    ...     Test Steps:
    ...     1. Enter valid email or password of deleted account under 30days from others app
    ...     2. Tap "Sign in" button
    ...     3. In the Recovery screen - Tap "Recovery" button
    ...
    ...     Expected Result:
    ...     1. The deleted account from Biotres Gateway app shall be recovery.
    ...     2. The user shall be on the Input reference code screen.
    [Tags]  BTGW-PATIENT-AUTH-SIGNIN-08        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNIN-09: Recover deleted accounts from the others app in case of retrying after Recovery failed
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can recovery deleted accounts from the others app in case of retrying after Recovery failed
    ...
    ...     Precondition: The user is on the Sign in screen.
    ...
    ...     Test Steps:
    ...     1. Enter valid email or password of deleted account under 30days from others app
    ...     2. Tap "Sign in" button
    ...     3. Turn off wifi
    ...     4. In the Recovery screen - Tap "Recovery" button
    ...     5. Turn on wifi
    ...     6. In the Failed Recovery pop up - Tap "Retry" button
    ...
    ...     Expected Result:
    ...     1. The deleted account from Biotres Gateway app shall be recovery.
    ...     2. The user shall be on the Input reference code screen.
    [Tags]  BTGW-PATIENT-AUTH-SIGNIN-09        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNIN-10: Cancel the deleted account recovery process
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can cancel the deleted account recovery process
    ...
    ...     Precondition: The user is on the Sign in screen.
    ...
    ...     Test Steps:
    ...     1. Enter valid email or password of deleted account under 30days from others app
    ...     2. Tap "Sign in" button
    ...     3. In the Recovery screen - Tap "Cancel" button
    ...
    ...     Expected Result:
    ...     1. The deleted account from Biotres Gate app shall not be recovered.
    ...     2. The user shall be navigated back to the Sign in screen.
    [Tags]  BTGW-PATIENT-AUTH-SIGNIN-10        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNIN-11: Valid email and password of deleted account more than 30 days
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can't sign in the Biotres Gateway app with valid email and password of deleted account more than 30 days
    ...
    ...     Precondition: The user is on the Sign in screen.
    ...                   The email entered is an email with a deletion time more than 30 days
    ...
    ...     Test Steps:
    ...     1. Enter valid email and password of deleted account more than 30 days
    ...     2. Tap "Sign in" button
    ...
    ...     Expected Result:
    ...     1. Displaying error message "Incorrect credentials"
    [Tags]  BTGW-PATIENT-AUTH-SIGNIN-11        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNIN-12: Invalid email format
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can't sign in the Biotres Gateway app with invlaid email format.
    ...
    ...     Precondition: The user is on the Sign in screen.
    ...
    ...     Test Steps:
    ...     1. Enter invalid username into [Username] textbox
    ...     2. Enter valid password into [Password] textbox
    ...     3. Click [Sign in] button
    ...
    ...     Expected Result:
    ...     1. Displaying error message "Incorrect credentials"
    [Tags]  BTGW-PATIENT-AUTH-SIGNIN-12        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNIN-13: Valid email that has not been created
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can't sign in the Biotres Gateway app with Valid email that has not been created
    ...
    ...     Precondition: The user is on the Sign in screen
    ...
    ...     Test Steps:
    ...     1. Enter valid username into [Username] textbox
    ...     2. Enter valid password into [Password] textbox
    ...     3. Click [Sign in] button
    ...
    ...     Expected Result:
    ...     1. Displaying error message "Incorrect credentials"
    [Tags]  BTGW-PATIENT-AUTH-SIGNIN-13        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNIN-14: Valid email that has not been verified
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can sign in the Biotres Gateway app with Valid email that has not been verified
    ...
    ...     Precondition: The use is on the Sign in screen.
    ...                   The email entered is the email was registered previously.
    ...
    ...     Test Steps:
    ...     1. Enter valid username into [Username] textbox
    ...     2. Enter valid password into [Password] textbox
    ...     3. Click [Sign in] button
    ...
    ...     Expected Result:
    ...     1. Login successfully.
    ...     2. The user shall be navigated the "Oops!" screen.
    ...     3. The "Oops!" screen:
    ...     -   Content: The email emily.smith@gmail.com is not verified. Please check your inbox and follow the instructions to verify your email.
    ...     -   Button: "Resend verification email" button and "Back to sign in" button
    ...
    [Tags]  BTGW-PATIENT-AUTH-SIGNIN-14        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNIN-15: With GG account that is active account
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can sign in the Biotres Gateway app with GG account that is active account
    ...
    ...     Precondition: The user is on the Sign in screen.
    ...
    ...     Test Steps:
    ...     1. Click "Sign in with Google" button
    ...     2. Enter valid username and password
    ...     3. Tap "Sign in" button
    ...     Expected Result:
    ...     1. Login successfully.
    ...     2. The user shall be navigated the Input reference code screen.
    ...     3.Logs in for the first time - the user shall be navigated the Complete profile screen.
    [Tags]  BTGW-PATIENT-AUTH-SIGNIN-15        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNIN-16:With GG account that is deleted account under 30 days from Biotres gateway app
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can sign in With GG account that is deleted account under 30 days from Biotres gateway app
    ...
    ...     Precondition: The user is on the Sign in screen
    ...                   The GG account that is deleted account under 30days from Biotres Gateway app
    ...
    ...     Test Steps:
    ...     1. Click "Sign in with Google" button
    ...     2. Enter valid username and password
    ...     3. Tap "Sign in" button
    ...
    ...     Expected Result:
    ...     1. Login successfully
    ...     2. The user shall be navigated to the Recovery screen.
    ...
    [Tags]  BTGW-PATIENT-AUTH-SIGNIN-16        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-PATIENT-AUTH-SIGNIN-17: Recovery deleted GG accounts from the Biotres Gateway app
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can recovery deleted GG accounts from the Biotres Gateway app
    ...
    ...     Precondition: The user is on the Sign in screen.
    ...
    ...     Test Steps:
    ...     1. Enter valid email or password of deleted account under 30days from others app
    ...     2. Tap "Sign in" button
    ...     3. In the Recovery screen - Tap "Recovery" button
    ...
    ...     Expected Result:
    ...     1. The deleted GG account from Biotres Gate app shall be recovery.
    ...     2. The user shall be on the Input reference code screen.
    [Tags]  BTGW-PATIENT-AUTH-SIGNIN-17        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNIN-18: Recover deleted accounts from the others app in case of retrying after Recovery failed
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can recovery deleted GG accounts from the others app in case of retrying after Recovery failed
    ...
    ...     Precondition: The user is on the Sign in screen.
    ...
    ...     Test Steps:
    ...     1. Enter valid email or password of deleted GG account under 30days from Biotres Gateway
    ...     2. Tap "Sign in" button
    ...     3. Turn off wifi
    ...     4. In the Recovery screen - Tap "Recovery" button
    ...     5. Turn on wifi
    ...     6. In the Failed Recovery pop up - Tap "Retry" button
    ...
    ...     Expected Result:
    ...     1. The deleted GG account from Biotres Gateway app shall be recovery.
    ...     2. The user shall be on the Input reference code screen.
    [Tags]  BTGW-PATIENT-AUTH-SIGNIN-18        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNIN-19: Cancel the deleted account recovery process
    [Documentation]  Author: Phuong Tran
        ...
        ...     Description: The user can cancel the deleted GG account recovery process
        ...
        ...     Precondition: The user is on the Sign in screen.
        ...
        ...     Test Steps:
        ...     1. Enter valid email or password of deleted GG account under 30days from the Biotres Gateway app
        ...     2. Tap "Sign in" button
        ...     3. In the Recovery screen - Tap "Cancel" button
        ...
        ...     Expected Result:
        ...     1. The deleted GG account from Biotres Gateway app shall not be recovered.
        ...     2. The user shall be navigated back to the Sign in screen.
    [Tags]  BTGW-PATIENT-AUTH-SIGNIN-19        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNIN-20:Valid email and password of deleted GG account under 30 days from other apps (Bioheart, Biocare Telemed, Biocare cardiac…)
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can sign in the Biotres Gateway with Valid email and password of deleted GG account under 30 days from others apps (Bioheart, Biocare Telemed, Biocare cardiac…)
    ...
    ...     Precondition: The user is on the Sign in screen.
    ...
    ...     Test Steps:
    ...     1. Enter valid email or password of deleted GG account under 30days from others app
    ...     2. Tap "Sign in" button
    ...
    ...     Expected Result:
    ...     1. Login successfully.
    ...     2. The user shall be navigated to the Recovery screen.
    [Tags]  BTGW-PATIENT-AUTH-SIGNIN-20        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}
BTGW-PATIENT-AUTH-SIGNIN-21: Recovery deleted GG accounts from the others app
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can recovery deleted GG accounts from the others app
    ...
    ...     Precondition: The user is on the Sign in screen.
    ...
    ...     Test Steps:
    ...     1. Enter valid email or password of deleted GG account under 30days from others app
    ...     2. Tap "Sign in" button
    ...     3. In the Recovery screen - Tap "Recovery" button
    ...
    ...     Expected Result:
    ...     1. The deleted GG account from Biotres Gateway app shall be recovery.
    ...     2. The user shall be on the Input reference code screen.
    [Tags]  BTGW-PATIENT-AUTH-SIGNIN-21        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNIN-22: Recover deleted accounts from the others app in case of retrying after Recovery failed
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can recovery deleted GG accounts from the others app in case of retrying after Recovery failed
    ...
    ...     Precondition: The user is on the Sign in screen.
    ...
    ...     Test Steps:
    ...     1. Enter valid email or password of deleted GG account under 30days from others app
    ...     2. Tap "Sign in" button
    ...     3. Turn off wifi
    ...     4. In the Recovery screen - Tap "Recovery" button
    ...     5. Turn on wifi
    ...     6. In the Failed Recovery pop up - Tap "Retry" button
    ...
    ...     Expected Result:
    ...     1. The deleted GG account from Biotres Gateway app shall be recovery.
    ...     2. The user shall be on the Input reference code screen.
    [Tags]  BTGW-PATIENT-AUTH-SIGNIN-22        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNIN-23: Cancel the deleted account recovery process
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can cancel the deleted GG account recovery process
    ...
    ...     Precondition: The user is on the Sign in screen.
    ...
    ...     Test Steps:
    ...     1. Enter valid email or password of deleted GG account under 30days from others app
    ...     2. Tap "Sign in" button
    ...     3. In the Recovery screen - Tap "Cancel" button
    ...
    ...     Expected Result:
    ...     1. The deleted account from Biotres Gateway app shall not be recovered.
    ...     2. The user shall be navigated back to the Sign in screen.
    [Tags]  BTGW-PATIENT-AUTH-SIGNIN-23        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-SIGNIN-24: Valid email and password of deleted GG account more than 30 days
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can't sign in the Biotres Gateway app with valid email and password of deleted GG account more than 30 days
    ...
    ...     Precondition: The user is on the Sign in screen.
    ...                   The email entered is an email with a deletion time more than 30 days
    ...
    ...     Test Steps:
    ...     1. Enter valid email and password of deleted GG account more than 30 days
    ...     2. Tap "Sign in" button
    ...
    ...     Expected Result:
    ...     1. Displaying error message "Incorrect credentials"
    [Tags]  BTGW-PATIENT-AUTH-SIGNIN-24        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-FORGOT-01: Email unverified account
  [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can resert Password of the Biotres Gateway account which has not been verified.
    ...     Precondition: The user is on the Forgot password screen
    ...                   The entered email has registered but not verified email
    ...
    ...     Test Steps:
    ...     1. Enter email into [Email] textbox
    ...     3. Click [Send] button
    ...
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Oops!" screen
    ...     2. The "Oops!" screen:
    ...     - Content: The email emily.smith@gmail.com is not verified. Please check your inbox and follow the instructions to verify your email.
    ...     - Button: "Resend verification email" button and "Back to sign in" button
    ...
        [Tags]  BTGW-PATIENT-AUTH-FORGOT-01        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-FORGOT-02: Inputs emails that do not exist or are not yet registered
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can't reset password of the Biotres Gateway account when Inputting emails that do not exist or are not yet registered
    ...
    ...     Precondition: The user is on the Forgot password screen
    ...                   The entered email do no exist or are not yet registered
    ...
    ...     Test Steps:
    ...     1. Enter email into [Email] textbox
    ...     3. Click [Send] button
    ...
    ...     Expected Result:
    ...     1. Displaying error message “Account does not exist” below the Email field
    [Tags]  BTGW-PATIENT-AUTH-FORGOT-02        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-FORGOT-03: Inputs invalid email format
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can't reset password of the Biotres Gateway account when Inputting invalid email format
    ...
    ...     Precondition: The user is on the Forgot password screen.
    ...
    ...     Test Steps:
    ...     1. Enter email into [Email] textbox (ex: phuongitr13)
    ...     2. Click [Send] button
    ...
    ...     Expected Result:
    ...     1. Displaying error message “Invalid email format” below the Email field
    [Tags]  BTGW-PATIENT-AUTH-FORGOT-03        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-FORGOT-04: Inputs a valid email which was registered and verified
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can reset password of the Biotres Gateway account when Inputting a valid email which was registered and verified
    ...
    ...     Precondition: The user is on Forgot password screen.
    ...
    ...     Test Steps:
    ...     1. Enter email into [Email] textbox (ex: phuongitr5@yopmail.com)
    ...     2. Click [Send] button
    ...
    ...     Expected Result:
    ...     1. The user shall be navigated to the Update password screen.
    [Tags]  BTGW-PATIENT-AUTH-FORGOT-04        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-FORGOT-05: Resend code
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user shall get a code again when tapping Resend code button
    ...
    ...     Precondition: The user is on the Update password screen
    ...
    ...     Test Steps:
    ...     1. Tap "Resend now" button
    ...
    ...     Expected Result:
    ...     A new code shall be send to email for the user.
    [Tags]  BTGW-PATIENT-AUTH-FORGOT-05        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-FORGOT-06: Enter the code sent earlier althought a new code has been sent to the user
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The app shall be error message when the user enter the code sent earlier
    ...
    ...     Precondition: The use is on the Update Password screen.
    ...
    ...     Test Steps:
    ...     1. Tap "Resend now" button
    ...     2. Enter the invalid code (can be a valid code previously)
    ...     3. Fill in the New password and Confirm new password field
    ...     4. Tap "Update password" button
    ...
    ...     Expected Result:
    ...     Displaying error message "Incorrect code" under Enter code bar.
    ...
    [Tags]  BTGW-PATIENT-AUTH-FORGOT-06        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-FORGOT-07: Update password successfully
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can update password successfully
    ...
    ...     Precondition: The user is on the "Update password" screen.
    ...
    ...     Test Steps:
    ...     1. Enter the valid code
    ...     3. Fill in the New password and Confirm new password field
    ...     4. Tap "Update password" button
    ...     Expected Result:
    ...     1. The user shall update password successfully.
    ...     2. The user shall be navigated to the screen with a message displayed: “Password updated successfully!” and "Back to sign" button
    [Tags]  BTGW-PATIENT-AUTH-FORGOT-07        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-FORGOT-08: Update password in case the confirmation password does not match with the new password
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can't update password in case the confirmation password does not match with the new password
    ...
    ...     Precondition: The use is on the "Update password" screen.
    ...
    ...     Test Steps:
    ...     1. Enter the valid code
    ...     2. Enter the password
    ...     3. Enter confirmation password does not match with the new password
    ...     4. Tap "Update password" button
    ...     Expected Result:
    ...     1. Displaying error message "The confirmed password does not match" under "Confirm new password" field
    [Tags]  BTGW-PATIENT-AUTH-FORGOT-08        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-PATIENT-AUTH-DELETE-ACC-01: Refcode-Delete account that signed up manually in case tap "Delete" button in the confirm dialog
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can delete account that signed up manually
    ...
    ...     Precondition: The user sign in the Biotres Gateway app with account that signed up manually and is on the Input reference code screen
    ...
    ...     Test Steps:
    ...     1. In the Input reference code screen - Tap "Delete account" button
    ...     2. In the "Sure to delete your account?" screen - Tap "Delete my account" button
    ...     3. In the confirmation dialog - Tap "Delete" button
    ...     4. In the notify the user of their account deletion has been made successfully - Tap "Got it" button
    ...     5. Observe the screen
    ...
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Welcome" screen.
    ...     2. The "Sure to delete your account?" screen:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16961
    ...     3. The In the confirmation dialog:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2577%3A16885
    ...     4. The notify the user of their account deletion has been made successfully
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16924

    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-01        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-02: Refcode-Delete account that signed up manually in case tap "Retry" button in the fail dialog
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can delete account that signed up manually
    ...
    ...     Precondition: The user sign in the Biotres Gateway app with account that signed up manually and is on the Input reference code screen
    ...
    ...     Test Steps:
    ...     1. In the Input reference code screen - Tap "Delete account"
    ...     2. Turn off wifi of my phone
    ...     3. In the "Sure to delete your account?" screen - Tap "Delete my account" button
    ...     4. Turn on wifi of my phone
    ...     4. In the Fail dialog - Tap "Retry" button
    ...     4. In the notify the user of their account deletion has been made successfully - Tap "Got it" button
    ...     5. Observe the screen
    ...
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Welcome" screen.
    ...     2. The "Sure to delete your account?" screen:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16961
    ...     3. The fail dialog:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=3373%3A17404
    ...     4. The confirmation dialog:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2577%3A16885
    ...     5. The notify the user of their account deletion has been made successfully
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16924
    ...

    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-02        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-03: Refcode-Delete account that signed in with Apple - In the confirmation dialog
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can delete account that signed in with Apple
    ...
    ...     Precondition: The user sign in the Biotres Gateway app with account that signed up Apple and is on the Input reference code screen
    ...
    ...     Test Steps:
    ...     1. In the Input reference code screen - Tap "Delete account" button
    ...     2. In the "Sure to delete your account?" screen - Tap "Delete my account" button
    ...     3. In the confirmation dialog - Tap "Delete" button
    ...     4. In the notify the user of their account deletion has been made successfully - Tap "Got it" button
    ...     5. Observe the screen
    ...
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Welcome" screen.
    ...     2. The "Sure to delete your account?" screen:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16961
    ...     3. The In the confirmation dialog:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2577%3A16885
    ...     4. The notify the user of their account deletion has been made successfully
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16924


    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-03        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-04: Refcode-Delete account that signed up Apple in case tap "Retry" button in the fail dialog
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can delete account that signed up manually
    ...
    ...     Precondition: The user sign in the Biotres Gateway app with account that signed up manually and is on the Input reference code screen
    ...
    ...     Test Steps:
    ...     1. In the Input reference code screen - Tap "Delete account"
    ...     2. Turn off wifi of my phone
    ...     3. In the "Sure to delete your account?" screen - Tap "Delete my account" button
    ...     4. Turn on wifi of my phone
    ...     4. In the Fail dialog - Tap "Retry" button
    ...     4. In the notify the user of their account deletion has been made successfully - Tap "Got it" button
    ...     5. Observe the screen
    ...
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Welcome" screen.
    ...     2. The "Sure to delete your account?" screen:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16961
    ...     3. The fail dialog:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=3373%3A17404
    ...     4. The confirmation dialog:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2577%3A16885
    ...     5. The notify the user of their account deletion has been made successfully
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16924
    ...

    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-04        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-05: Refcode-Delete account that signed in with GG - In the confirmation dialog
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can delete account that signed in with GG
    ...
    ...     Precondition: The user sign in the Biotres Gateway app with GG and is on the Input reference code screen
    ...
    ...     Test Steps:
    ...     1. In the Input reference code screen - Tap "Delete account" button
    ...     2. In the "Sure to delete your account?" screen - Tap "Delete my account" button
    ...     3. In the confirmation dialog - Tap "Delete" button
    ...     4. In the notify the user of their account deletion has been made successfully - Tap "Got it" button
    ...     5. Observe the screen
    ...
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Welcome" screen.
    ...     2. The "Sure to delete your account?" screen:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16961
    ...     3. The In the confirmation dialog:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2577%3A16885
    ...     4. The notify the user of their account deletion has been made successfully
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16924

    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-05        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-06: Refcode-Delete account that signed up GG in case tap "Retry" button in the fail dialog
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can delete account that signed up manually
    ...
    ...     Precondition: The user sign in the Biotres Gateway app with account that signed up manually and is on the Input reference code screen
    ...
    ...     Test Steps:
    ...     1. In the Input reference code screen - Tap "Delete account"
    ...     2. Turn off wifi of my phone
    ...     3. In the "Sure to delete your account?" screen - Tap "Delete my account" button
    ...     4. Turn on wifi of my phone
    ...     4. In the Fail dialog - Tap "Retry" button
    ...     4. In the notify the user of their account deletion has been made successfully - Tap "Got it" button
    ...     5. Observe the screen
    ...
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Welcome" screen.
    ...     2. The "Sure to delete your account?" screen:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16961
    ...     3. The fail dialog:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=3373%3A17404
    ...     4. The confirmation dialog:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2577%3A16885
    ...     5. The notify the user of their account deletion has been made successfully
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16924
    ...
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-06        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-PATIENT-AUTH-DELETE-ACC-07: Refcode-Cancel deleting account that signed up manually - In the "Sure to delete your account?" screen
   [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can cancel deleting account that signed up manually
    ...
    ...     Precondition: The user sign in the Biotres Gateway app with account that signed up manually and is on the Input reference code screen
    ...
    ...     Test Steps:
    ...     1. Tap "Delete account" button
    ...     2. In the "Sure to delete your account?" screen - Tap "Back" button
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Input reference code" screen.
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-07        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-08: Refcode-Cancel deleting account that signed up manually - In the confirm dialog
   [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can cancel deleting account that signed up manually
    ...
    ...     Test Steps:
    ...     1.Tap "Delete account" button
    ...     2. In the "Sure to delete your account?" screen - Tap "Delete my accoun" button
    ...     3. In the confirm dialog - Tap "Cancel" button
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Input reference code" screen.
    ...
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-08        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}
BTGW-PATIENT-AUTH-DELETE-ACC-09: Refcode-Cancel deleting account that signed up manually - In the Fail dialog
   [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can cancel deleting account that signed up manually
    ...
    ...     Test Steps:
    ...     1.Tap "Delete account" button
    ...     2. Turn off the wifi of my phone
    ...     2. In the "Sure to delete your account?" screen - Tap "Delete my accoun" button
    ...
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Input reference code" screen.
    ...
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-09        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-PATIENT-AUTH-DELETE-ACC-10: Refcode-Cancel deleting account that signed in with Apple - In the "Sure to delete your account?" screen
   [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can cancel deleting account that signed in with Apple
    ...
    ...     Precondition: The user sign in the Biotres Gateway app with account that signed in with Apple and is on the Input reference code screen
    ...
    ...     Test Steps:
    ...     1. Tap "Delete account" button
    ...     2. In the "Sure to delete your account?" screen - Tap "Back" button
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Input reference code" screen.
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-10        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}
BTGW-PATIENT-AUTH-DELETE-ACC-11: Refcode-Cancel deleting account that signed in with Apple - In the confirm dialog
   [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can cancel deleting account that signed in with Apple
    ...
    ...     Test Steps:
    ...     1.Tap "Delete account" button
    ...     2. In the "Sure to delete your account?" screen - Tap "Delete my accoun" button
    ...     3. In the confirm dialog - Tap "Cancel" button
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Input reference code" screen.\
    ...
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-11        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-12: Refcode-Cancel deleting account that signed in with Apple - In the Fail dialog
   [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can cancel deleting account that signed in with Apple
    ...
    ...     Test Steps:
    ...     1.Tap "Delete account" button
    ...     2. Turn off the wifi of my phone
    ...     2. In the "Sure to delete your account?" screen - Tap "Delete my accoun" button
    ...
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Input reference code" screen.
    ...
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-12        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-13: Refcode-Cancel deleting account that signed in with GG - In the "Sure to delete your account?" screen
   [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can cancel deleting account that signed in with GG
    ...
    ...     Precondition: The user sign in the Biotres Gateway app with account that signed in with GG and is on the Input reference code screen
    ...
    ...     Test Steps:
    ...     1. Tap "Delete account" button
    ...     2. In the "Sure to delete your account?" screen - Tap "Back" button
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Input reference code" screen.

   [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-13        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-PATIENT-AUTH-DELETE-ACC-14: Refcode-Cancel deleting account that signed in with GG - In the confirm dialog
   [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can cancel deleting account that signed in with GG
    ...
    ...     Test Steps:
    ...     1.Tap "Delete account" button
    ...     2. In the "Sure to delete your account?" screen - Tap "Delete my accoun" button
    ...     3. In the confirm dialog - Tap "Cancel" button
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Input reference code" screen.
   [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-14        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-15: Refcode-Cancel deleting account that signed in with GG - In the Fail dialog
   [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can cancel deleting account that signed in with GG
    ...
    ...     Test Steps:
    ...     1.Tap "Delete account" button
    ...     2. Turn off the wifi of my phone
    ...     2. In the "Sure to delete your account?" screen - Tap "Delete my accoun" button
    ...
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Input reference code" screen.

    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-15        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-16: Dashboard-Delete account that signed up manually in case tap "Delete" button in the confirm dialog
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can delete account that signed up manually
    ...
    ...     Precondition: The user sign in the Biotres Gateway app with account that signed up manually and is on the Input reference code screen
    ...
    ...     Test Steps:
    ...     1. In the Input reference code screen - Tap "Delete account" button
    ...     2. In the "Sure to delete your account?" screen - Tap "Delete my account" button
    ...     3. In the confirmation dialog - Tap "Delete" button
    ...     4. In the notify the user of their account deletion has been made successfully - Tap "Got it" button
    ...     5. Observe the screen
    ...
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Welcome" screen.
    ...     2. The "Sure to delete your account?" screen:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16961
    ...     3. The In the confirmation dialog:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2577%3A16885
    ...     4. The notify the user of their account deletion has been made successfully
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16924

    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-16        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-17: Dashboard-Delete account that signed up manually in case tap "Retry" button in the fail dialog
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can delete account that signed up manually
    ...
    ...     Precondition: The user sign in the Biotres Gateway app with account that signed up manually and is on the Input reference code screen
    ...
    ...     Test Steps:
    ...     1. In the Input reference code screen - Tap "Delete account"
    ...     2. Turn off wifi of my phone
    ...     3. In the "Sure to delete your account?" screen - Tap "Delete my account" button
    ...     4. Turn on wifi of my phone
    ...     4. In the Fail dialog - Tap "Retry" button
    ...     4. In the notify the user of their account deletion has been made successfully - Tap "Got it" button
    ...     5. Observe the screen
    ...
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Welcome" screen.
    ...     2. The "Sure to delete your account?" screen:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16961
    ...     3. The fail dialog:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=3373%3A17404
    ...     4. The confirmation dialog:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2577%3A16885
    ...     5. The notify the user of their account deletion has been made successfully
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16924
    ...

    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-17        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-18: Dashboard-Delete account that signed in with Apple - In the confirmation dialog
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can delete account that signed in with Apple
    ...
    ...     Precondition: The user sign in the Biotres Gateway app with account that signed up Apple and is on the Input reference code screen
    ...
    ...     Test Steps:
    ...     1. In the Input reference code screen - Tap "Delete account" button
    ...     2. In the "Sure to delete your account?" screen - Tap "Delete my account" button
    ...     3. In the confirmation dialog - Tap "Delete" button
    ...     4. In the notify the user of their account deletion has been made successfully - Tap "Got it" button
    ...     5. Observe the screen
    ...
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Welcome" screen.
    ...     2. The "Sure to delete your account?" screen:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16961
    ...     3. The In the confirmation dialog:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2577%3A16885
    ...     4. The notify the user of their account deletion has been made successfully
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16924


    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-18        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-19: Dashboard-Delete account that signed up Apple in case tap "Retry" button in the fail dialog
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can delete account that signed up manually
    ...
    ...     Precondition: The user sign in the Biotres Gateway app with account that signed up manually and is on the Input reference code screen
    ...
    ...     Test Steps:
    ...     1. In the Input reference code screen - Tap "Delete account"
    ...     2. Turn off wifi of my phone
    ...     3. In the "Sure to delete your account?" screen - Tap "Delete my account" button
    ...     4. Turn on wifi of my phone
    ...     4. In the Fail dialog - Tap "Retry" button
    ...     4. In the notify the user of their account deletion has been made successfully - Tap "Got it" button
    ...     5. Observe the screen
    ...
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Welcome" screen.
    ...     2. The "Sure to delete your account?" screen:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16961
    ...     3. The fail dialog:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=3373%3A17404
    ...     4. The confirmation dialog:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2577%3A16885
    ...     5. The notify the user of their account deletion has been made successfully
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16924
    ...

    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-19        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-20: Refcode-Delete account that signed in with GG - In the confirmation dialog
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can delete account that signed in with GG
    ...
    ...     Precondition: The user sign in the Biotres Gateway app with GG and is on the Input reference code screen
    ...
    ...     Test Steps:
    ...     1. In the Input reference code screen - Tap "Delete account" button
    ...     2. In the "Sure to delete your account?" screen - Tap "Delete my account" button
    ...     3. In the confirmation dialog - Tap "Delete" button
    ...     4. In the notify the user of their account deletion has been made successfully - Tap "Got it" button
    ...     5. Observe the screen
    ...
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Welcome" screen.
    ...     2. The "Sure to delete your account?" screen:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16961
    ...     3. The In the confirmation dialog:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2577%3A16885
    ...     4. The notify the user of their account deletion has been made successfully
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16924

    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-20        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-21: Refcode-Delete account that signed up GG in case tap "Retry" button in the fail dialog
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can delete account that signed up manually
    ...
    ...     Precondition: The user sign in the Biotres Gateway app with account that signed up manually and is on the Input reference code screen
    ...
    ...     Test Steps:
    ...     1. In the Input reference code screen - Tap "Delete account"
    ...     2. Turn off wifi of my phone
    ...     3. In the "Sure to delete your account?" screen - Tap "Delete my account" button
    ...     4. Turn on wifi of my phone
    ...     4. In the Fail dialog - Tap "Retry" button
    ...     4. In the notify the user of their account deletion has been made successfully - Tap "Got it" button
    ...     5. Observe the screen
    ...
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Welcome" screen.
    ...     2. The "Sure to delete your account?" screen:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16961
    ...     3. The fail dialog:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=3373%3A17404
    ...     4. The confirmation dialog:
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2577%3A16885
    ...     5. The notify the user of their account deletion has been made successfully
    ...     - https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2381%3A16924
    ...
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-21        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-PATIENT-AUTH-DELETE-ACC-22: Dashboard-Cancel deleting account that signed up manually - In the "Sure to delete your account?" screen
   [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can cancel deleting account that signed up manually
    ...
    ...     Precondition: The user sign in the Biotres Gateway app with account that signed up manually and is on the Input reference code screen
    ...
    ...     Test Steps:
    ...     1. Tap "Delete account" button
    ...     2. In the "Sure to delete your account?" screen - Tap "Back" button
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Dashboard" screen.
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-22        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-23: Dashboard-Cancel deleting account that signed up manually - In the confirm dialog
   [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can cancel deleting account that signed up manually
    ...
    ...     Test Steps:
    ...     1.Tap "Delete account" button
    ...     2. In the "Sure to delete your account?" screen - Tap "Delete my accoun" button
    ...     3. In the confirm dialog - Tap "Cancel" button
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Dashboard" screen.
    ...
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-23        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}
BTGW-PATIENT-AUTH-DELETE-ACC-24: Dashboard-Cancel deleting account that signed up manually - In the Fail dialog
   [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can cancel deleting account that signed up manually
    ...
    ...     Test Steps:
    ...     1.Tap "Delete account" button
    ...     2. Turn off the wifi of my phone
    ...     2. In the "Sure to delete your account?" screen - Tap "Delete my accoun" button
    ...
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Dashboard" screen.
    ...
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-24        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-PATIENT-AUTH-DELETE-ACC-25: Refcode-Cancel deleting account that signed in with Apple - In the "Sure to delete your account?" screen
   [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can cancel deleting account that signed in with Apple
    ...
    ...     Precondition: The user sign in the Biotres Gateway app with account that signed in with Apple and is on the Input reference code screen
    ...
    ...     Test Steps:
    ...     1. Tap "Delete account" button
    ...     2. In the "Sure to delete your account?" screen - Tap "Back" button
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Input reference code" screen.
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-25        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}
BTGW-PATIENT-AUTH-DELETE-ACC-26: Dashboard-Cancel deleting account that signed in with Apple - In the confirm dialog
   [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can cancel deleting account that signed in with Apple
    ...
    ...     Test Steps:
    ...     1.Tap "Delete account" button
    ...     2. In the "Sure to delete your account?" screen - Tap "Delete my accoun" button
    ...     3. In the confirm dialog - Tap "Cancel" button
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Input reference code" screen.\
    ...
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-26        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-27: Dashboard - Cancel deleting account that signed in with Apple - In the Fail dialog
   [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can cancel deleting account that signed in with Apple
    ...
    ...     Test Steps:
    ...     1.Tap "Delete account" button
    ...     2. Turn off the wifi of my phone
    ...     2. In the "Sure to delete your account?" screen - Tap "Delete my accoun" button
    ...
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Dashboard" screen.
    ...
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-27        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-28: Dashboard - Cancel deleting account that signed in with GG - In the "Sure to delete your account?" screen
   [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can cancel deleting account that signed in with GG
    ...
    ...     Precondition: The user sign in the Biotres Gateway app with account that signed in with GG and is on the Input reference code screen
    ...
    ...     Test Steps:
    ...     1. Tap "Delete account" button
    ...     2. In the "Sure to delete your account?" screen - Tap "Back" button
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Dashboard" screen.

   [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-28        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-PATIENT-AUTH-DELETE-ACC-29: Dashboard - Cancel deleting account that signed in with GG - In the confirm dialog
   [Documentation]  Author: Phuong Tran
...
...     Description: The user can cancel deleting account that signed in with GG
...
...     Test Steps:
...     1.Tap "Delete account" button
...     2. In the "Sure to delete your account?" screen - Tap "Delete my accoun" button
...     3. In the confirm dialog - Tap "Cancel" button
...     Expected Result:
...     1. The user shall be navigated to the "Dashboard" screen.
   [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-29        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-30: Dashboard-Cancel deleting account that signed in with GG - In the Fail dialog
   [Documentation]  Author: Phuong Tran
...
...     Description: The user can cancel deleting account that signed in with GG
...
...     Test Steps:
...     1.Tap "Delete account" button
...     2. Turn off the wifi of my phone
...     3. In the "Sure to delete your account?" screen - Tap "Delete my accoun" button
...
...     Expected Result:
...     1. The user shall be navigated to the "Dashboard" screen.

    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-30        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}
BTGW-PATIENT-AUTH-DELETE-ACC-31: BTGW - Complete profile of a account in a mobile device while that account has delete in other mobile device
    [Documentation]     Author: Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     Sign up for an account (not been completed profile)
    ...
    ...     Test Steps:
    ...     1. Device 1: Sign up that account
    ...     2. Device 2 (Android, iOS): Sign up that account
    ...     3. Device 1: Completed profile successfully >> Account deleted successfully
    ...     4. Device 2: Complete profile >> click "Finish" in the Step 4 of Complete profile process
    ...     5. Click "Ok" button in that pop-up
    ...     Expected Results:
    ...     4. The "Your account has been deleted!" pop up shall be displayed.
    ...     5. Log the user out from the app
    ...
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-31        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-32: BTGW - Connect device in a mobile device when that account has delete in other mobile device
    [Documentation]     Author: Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - signs in to the app in 2 mobile devices using the one account and 2 mobile device in Ref code screen
    ...
    ...     Test Steps:
    ...     1. Mobile device1: Account deleted successfully
    ...     2. In the Ref code screen: Input valid code >> Click " Connect " button
    ...     3. In the pop-up: Click "OK" button
    ...
    ...     Expected Results:
    ...     2. The "Your account has been deleted!" pop up shall be displayed.
    ...     3. Log the user out from the app
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-32        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-33: BTGW - Delete device in a mobile device when that account has delete in other mobile device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Precondition:
    ...     - signs in to the app in 2 mobile devices using the one account and 2 mobile device in Ref code screen
    ...
    ...     Test Steps:l
    ...     1. Mobile device1: Account deleted successfully
    ...     2. In the Ref code screen: Click "Menu" button >> Click "Delete account" button
    ...     3. In the pop-up: Click "OK" button
    ...
    ...     Expected Results:
    ...     2. The "Your account has been deleted!" pop up shall be displayed.
    ...     3. Log the user out from the app
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-33        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BTGW-PATIENT-AUTH-DELETE-ACC-34: BTGW - Delete device in a mobile device when that account has delete in other mobile device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Precondition:
    ...     - Signs in to the app in 2 mobile devices using the one account
    ...     - Device2 (Androdi, iOS) in Dashboard screen.
    ...
    ...     Test Steps:
    ...     1. Mobile device1: Account deleted successfully
    ...     2. In the Ref code screen: Click "Menu" button >> Click "Delete account" button
    ...     3. In the pop-up: Click "OK" button
    ...
    ...     Expected Results:
    ...     2. The "Your account has been deleted!" pop up shall be displayed.
    ...     3. Log the user out from the app
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-34        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-35: Bioheart - Complete profile of a account in the BTGW app while that account has delete in the Bioheart app
    [Documentation]     Author: Phuong Tran
    ...
    ...     Precondition:
    ...     Sign up for an account (not been completed profile)
    ...
    ...     Test Steps:
    ...     1. Bioheart app: Sign up that account
    ...     2. Biotres gateway app (Android, iOS): Sign up that account
    ...     3. Bioheart app: Completed profile successfully >> Account deleted successfully
    ...     4. Biotres gateway app: Complete profile >> click "Finish" in the Step 4 of Complete profile process
    ...     5. Click "OK" button in that pop-up
    ...     Expected Results:
    ...     4. The "Your account has been deleted!" pop up shall be displayed.
    ...     5. Log the user out from the app
    ...
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-35        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-36: Bioheart - Delete account in the BTGW app while that account has delete in the Bioheart app
    [Documentation]     Author: Phuong Tran
    ...
    ...     Precondition:
    ...     Sign in account for 2 app (Biotres, Bioheart)
    ...
    ...     Test Steps:
    ...     1. Bioheart app: Account deleted successfully
    ...     2. Biotres gateway app (Android, iOS): In ref code - Delete account
    ...     3. Click "OK" button in that pop-up
    ...     Expected Results:
    ...     2. The "Your account has been deleted!" pop up shall be displayed.
    ...     3. Log the user out from the app
    ...
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-36        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-37: Bioheart - Connect device in the BTGW app while that account has delete in the Bioheart app
    [Documentation]     Author: Phuong Tran
    ...
    ...     Precondition:
    ...     Sign in account for 2 app (Biotres, Bioheart)
    ...
    ...     Test Steps:
    ...     1. Bioheart app: Account deleted successfully
    ...     2. Biotres gateway app (Android, iOS): In ref code - Input valid code
    ...     3. Click "OK" button in that pop-up
    ...     Expected Results:
    ...     2. The "Your account has been deleted!" pop up shall be displayed.
    ...     3. Log the user out from the app
    ...
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-37        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-PATIENT-AUTH-DELETE-ACC-38: Bioheart - Delete account in the BTGW app while that account has delete in the Bioheart app
    [Documentation]     Author: Phuong Tran
    ...
    ...     Precondition:
    ...     Sign in account for 2 app (Biotres, Bioheart)
    ...
    ...     Test Steps:
    ...
    ...     1. Biotres gateway app (Android, iOS): In ref code -Input valid ref code
    ...     2. Bioheart app: Account deleted successfully
    ...     3. Biotres gateway app (Android, iOS): Dashboard -  Delete account
    ...     4. Click "OK" button in that pop-up
    ...     Expected Results:
    ...     3. The "Your account has been deleted!" pop up shall be displayed.
    ...     4. Log the user out from the app
    ...
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-38        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-PATIENT-AUTH-DELETE-ACC-39: Telemed - Complete profile of a account in the BTGW app while that account has delete in the Bioheart app
    [Documentation]     Author: Phuong Tran
    ...
    ...     Precondition:
    ...     Sign up for an account (not been completed profile)
    ...
    ...     Test Steps:
    ...     1. Telemed app: Sign up that account
    ...     2. Biotres gateway app (Android, iOS): Sign up that account
    ...     3. Telemed app: Completed profile successfully >> Account deleted successfully
    ...     4. Biotres gateway app: Complete profile >> click "Finish" in the Step 4 of Complete profile process
    ...     5. Click "OK" button in that pop-up
    ...     Expected Results:
    ...     4. The "Your account has been deleted!" pop up shall be displayed.
    ...     5. Log the user out from the app
    ...
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-39        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-40: Telemed - Delete account in the BTGW app while that account has delete in the Bioheart app
    [Documentation]     Author: Phuong Tran
    ...
    ...     Precondition:
    ...     Sign in account for 2 app (Biotres, Bioheart)
    ...
    ...     Test Steps:
    ...     1. Telemed app: Account deleted successfully
    ...     2. Biotres gateway app (Android, iOS): In ref code - Delete account
    ...     3. Click "OK" button in that pop-up
    ...     Expected Results:
    ...     2. The "Your account has been deleted!" pop up shall be displayed.
    ...     3. Log the user out from the app
    ...
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-40        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-41: Telemed - Connect device in the BTGW app while that account has delete in the Bioheart app
    [Documentation]     Author: Phuong Tran
    ...
    ...     Precondition:
    ...     Sign in account for 2 app (Biotres, Bioheart)
    ...
    ...     Test Steps:
    ...     1. Telemed app: Account deleted successfully
    ...     2. Biotres gateway app (Android, iOS): In ref code - Input valid code
    ...     3. Click "OK" button in that pop-up
    ...     Expected Results:
    ...     2. The "Your account has been deleted!" pop up shall be displayed.
    ...     3. Log the user out from the app
    ...
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-41        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-PATIENT-AUTH-DELETE-ACC-42: Telemed - Delete account in the BTGW app while that account has delete in the Bioheart app
    [Documentation]     Author: Phuong Tran
    ...
    ...     Precondition:
    ...     Sign in account for 2 app (Biotres, Bioheart)
    ...
    ...     Test Steps:
    ...
    ...     1. Biotres gateway app (Android, iOS): In ref code -Input valid ref code
    ...     2. Telemed app: Account deleted successfully
    ...     3. Biotres gateway app (Android, iOS): Dashboard -  Delete account
    ...     4. Click "OK" button in that pop-up
    ...     Expected Results:
    ...     3. The "Your account has been deleted!" pop up shall be displayed.
    ...     4. Log the user out from the app
    ...
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-42        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-43: Cardiac - Complete profile of a account in the BTGW app while that account has delete in the Bioheart app
    [Documentation]     Author: Phuong Tran
    ...
    ...     Precondition:
    ...     Sign up for an account (not been completed profile)
    ...
    ...     Test Steps:
    ...     1. Cardiac app: Sign up that account
    ...     2. Biotres gateway app (Android, iOS): Sign up that account
    ...     3. Cardiac app: Completed profile successfully >> Account deleted successfully
    ...     4. Biotres gateway app: Complete profile >> click "Finish" in the Step 4 of Complete profile process
    ...     5. Click "OK" button in that pop-up
    ...     Expected Results:
    ...     4. The "Your account has been deleted!" pop up shall be displayed.
    ...     5. Log the user out from the app
    ...
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-43        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-44: Cardiac - Delete account in the BTGW app while that account has delete in the Bioheart app
    [Documentation]     Author: Phuong Tran
    ...
    ...     Precondition:
    ...     Sign in account for 2 app (Biotres, Bioheart)
    ...
    ...     Test Steps:
    ...     1. Cardiac app: Account deleted successfully
    ...     2. Biotres gateway app (Android, iOS): In ref code - Delete account
    ...     3. Click "OK" button in that pop-up
    ...     Expected Results:
    ...     2. The "Your account has been deleted!" pop up shall be displayed.
    ...     3. Log the user out from the app
    ...
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-44        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-DELETE-ACC-45: Cardiac - Connect device in the BTGW app while that account has delete in the Bioheart app
    [Documentation]     Author: Phuong Tran
    ...
    ...     Precondition:
    ...     Sign in account for 2 app (Biotres, Bioheart)
    ...
    ...     Test Steps:
    ...     1. Cardiac app: Account deleted successfully
    ...     2. Biotres gateway app (Android, iOS): In ref code - Input valid code
    ...     3. Click "OK" button in that pop-up
    ...     Expected Results:
    ...     2. The "Your account has been deleted!" pop up shall be displayed.
    ...     3. Log the user out from the app
    ...
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-45        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-PATIENT-AUTH-DELETE-ACC-46: Cardiac - Delete account in the BTGW app while that account has delete in the Bioheart app
    [Documentation]     Author: Phuong Tran
    ...
    ...     Precondition:
    ...     Sign in account for 2 app (Biotres, Bioheart)
    ...
    ...     Test Steps:
    ...
    ...     1. Biotres gateway app (Android, iOS): In ref code -Input valid ref code
    ...     2. Cardiac app: Account deleted successfully
    ...     3. Biotres gateway app (Android, iOS): Dashboard -  Delete account
    ...     4. Click "OK" button in that pop-up
    ...     Expected Results:
    ...     3. The "Your account has been deleted!" pop up shall be displayed.
    ...     4. Log the user out from the app
    ...
    [Tags]  BTGW-PATIENT-AUTH-DELETE-ACC-46        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BTGW-PATIENT-AUTH-LOGOUT-01: Sign out successfully
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user is on the Dashboard screen
    ...
    ...     Test Steps:
    ...     1. In the Dasboard - Tap "Menu" button
    ...     2. In the Navigation bar - Tap "Sign out" button
    ...     3. In the modal - Tap "Yes" button
    ...
    ...     Expected Result:
    ...     1. The user shall be navigated to the "Sign in" screen.

    [Tags]  BTGW-PATIENT-AUTH-LOGOUT-01        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-LOGOUT-02: Cancel Sign out process
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user is on the Dashboard screen
    ...
    ...     Test Steps:
    ...     1. In the Dasboard - Tap "Menu" button
    ...     2. In the Navigation bar - Tap "Sign out" button
    ...     3. In the modal - Tap "No" button
    ...
    ...     Expected Result:
    ...     1. The modal shall be dismiss.

    [Tags]  BTGW-PATIENT-AUTH-LOGOUT-02        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-LOGOUT-03: Patient - Sign out in the "Input reference code" screen
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can sign out the Biotres Gateway account
    ...
    ...     Test Steps:
    ...     1. In th - Tap "Menu" button
    ...     2. In the Navigation bar - Tap "Sign out" button
    ...     3. In the modal - Tap "No" button
    ...
    ...     Expected Result:
    ...     1. The modal shall be dismiss.

    [Tags]  BTGW-PATIENT-AUTH-LOGOUT-03        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-PROFILE-01: Step1 - View the available information that pre-filled from sign up new account
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can view the available information that pre-filled from sign up new account
    ...
    ...     Precondition: The user is on the Sign in as Patient screen with account that not completed profile.
    ...
    ...     Test Steps:
    ...     1. In the Sign in as Patient screen - Fill in Email field and Password field
    ...     2. Tap "Complete profile" button
    ...     3. Observe the available information that pre-filled in the Step1/Complete profile
    ...
    ...     Expected Result:
    ...     1. Login successfully.
    ...     2. Last name and First name field shall be pre-filled from sign up new account
...
    [Tags]  BTGW-PATIENT-AUTH-PROFILE-01        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-PROFILE-02:Step1 - The user cannot select DOB <1900 and current year
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user cannot select DOB <1900 and current year
    ...
    ...     Precondition: The user is on the Step 1/ Complete profile.
    ...
    ...     Test Steps:
    ...     - Selected DOB <1900
    ...     - Slected DOB > current year
    ...
    ...     Expected Result: The date picker shall reselect the default date(1/January/1900)
    ...
    [Tags]  BTGW-PATIENT-AUTH-PROFILE-02        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-PROFILE-03: Step1 - View the default value of Gender field
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can view the default value of Gender field
    ...
    ...     Precondition: The user is on the Step 1/ Complete profile.
    ...
    ...     Test Steps:
    ...     - 1. Observe the screen
    ...
    ...     Expected Result:
    ...     - Have no option in the Gender field
    ...
    [Tags]  BTGW-PATIENT-AUTH-PROFILE-03        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-PROFILE-04:The user can input decimal number into Height, Weight textbox
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:
    ...
    ...     Precondition: The user is on the Step 1/ Complete profile.
    ...
    ...     Test Steps:
    ...     1. Input decimal number into Height, Weight textbox (ex: 0.12345)
    ...
    ...     Expected Result: Entered decimal number shall be displayed in the Height/Weight field.
    ...
    [Tags]  BTGW-PATIENT-AUTH-PROFILE-04        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-PROFILE-05: Step1 - Convert value between Metric and Imperial unit
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can convert value between Metric and Imperial unit.
    ...
    ...     Precondition: The user is on the Step 1/ Complete profile.
    ...
    ...     Test Steps:
    ...     1. Select Metric/ Imperial option
    ...     2. Fill the fields in the selected option.
    ...     3. Convert value between Metric and Imperial unit
    ...     4. Observe
    ...
    ...     Expected Result: Convert value between Metric and Imperial unit successfully.

    [Tags]  BTGW-PATIENT-AUTH-PROFILE-05        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-PROFILE-06: Step1 - Next button shall be disabled when there is at least one required field is empty
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: Next button shall be disabled when there is at least one required field is empty
    ...
    ...     Precondition: The user is on the Step 1/ Complete profile.
    ...
    ...     Test Steps:
    ...     1. Observe the screen
    ...
    ...     Expected Result:Next button shall be disabled when there is at least one required field is empty
    ...
    [Tags]  BTGW-PATIENT-AUTH-PROFILE-06        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-PROFILE-07: Step2 - View the country list
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: View the country list
    ...
    ...     Precondition: The user is on the Step 2/ Complete profile.
    ...
    ...     Test Steps:
    ...     1. Tap dropdown-list of the Country field.
    ...
    ...     Expected Result:
    ...     - The user shall be navigated to the Search screen.
    ...     - The coutry list shall be displayed with 7 country:
    ...     + Argentina
    ...     + Canada
    ...     + Spain
    ...     + Taiwan
    ...     + United Arab Emirates
    ...     + United Kingdom
    ...     + United States (default)
    ...
    [Tags]  BTGW-PATIENT-AUTH-PROFILE-07        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-PROFILE-08: Step2 - Enter and select an address from the suggestion address list
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: The user can enter and select an address from the suggestion address list
    ...
    ...     Precondition: The user is on the Step 2/ Complete profile.
    ...
    ...     Test Steps:
    ...     1. Tap Address textbox
    ...     2. In the Search screen - Enter any the address/ Enter address full
    ...     3. Tap User "..." anyway button
    ...     4. Observe
    ...
    ...     Expected Result:
    ...     1. The user shall be navigated the Search screen.
    ...     2. Entered Address shall be displayed in the Address textbox
    ...
    [Tags]     BTGW-PATIENT-AUTH-PROFILE-08        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-PROFILE-09: Step2 - When country is US/Canada, Zipcode should be matched with state
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: When country is US/Canada, Zipcode should be matched with state
    ...
    ...     Precondition: The user is on the Step 2/ Complete profile.
    ...
    ...     Test Steps:
    ...     - Scenario1:  Select Country: US/Canada >> Enter and Select Address >> Change Zipcode >> Observe
    ...     - Scenario2.: Select Country: Other country >> Enter and Select Address >> Change Zipcode >> Observe
    ...
    ...
    ...
    ...     Expected Result:
    ...     - Scenario1: The textbox of the zipcode shall be outlined in red.
    ...     - Scenario2: The user still can next the step.
    [Tags]  BTGW-PATIENT-AUTH-PROFILE-09        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-PROFILE-10: Step2 - Next button shall be disabled when there is at least one required field is empty
    [Documentation]  Author: Phuong Tran
...
...     Description: Next button shall be disabled when there is at least one required field is empty
...
...     Precondition: The user is on the Step 1/ Complete profile.
...
...     Test Steps:
...     - 1. Observe the screen
...
...
...     Expected Result: Next button shall be disabled when there is at least one required field is empty
...
    [Tags]  BTGW-PATIENT-AUTH-PROFILE-10        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}
BTGW-PATIENT-AUTH-PROFILE-11: Step2 - The user can back to step 2
    [Documentation]  Author: Phuong Tran
...
...     Description: The user can back to step 2
...
...     Precondition: The user is on the Step 2/ Complete profile.
...
...     Test Steps:
...     1. Tap "Back" button
...
...     Expected Result:
...     1. The user shall be navigated back to Step1.
...     2. The information of the previous step is still kept.
    [Tags]  BTGW-PATIENT-AUTH-PROFILE-11        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-PROFILE-12: Step3 - View the default value of Type field is Cash/Credit card paying
    [Documentation]  Author: Phuong Tran
...
...     Description:  View the default value of Type field is Cash/Credit card paying
...
...     Precondition: The user is on the Step 3/ Complete profile.
...
...     Test Steps:
...     - 1. Observe the screen
...
...
...     Expected Result:
...     -
    [Tags]  BTGW-PATIENT-AUTH-PROFILE-12        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-PROFILE-13: Step3 - Move to step 4 with Cash/Credit card paying
    [Documentation]  Author: Phuong Tran
...
...     Description:  The user can move to step 4 with Cash/Credit card paying
...
...     Precondition: The user is on the Step 3/ Complete profile.
...
...     Test Steps:
...     1. Select ash/Credit card paying option.
...     2. Tap "Next" button
...
...     Expected Result:
...     1. The user shall be navigated Step4.
...
    [Tags]  BTGW-PATIENT-AUTH-PROFILE-13        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-PATIENT-AUTH-PROFILE-14: Step3 - Move to step 4 with Insurance when the Patient's country is US

    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: Move to step 4 with Insurance when the Patient's country is US
    ...
    ...     Precondition: The user is on the Step 3/ Complete profile.
    ...
    ...     Test Steps:
    ...     1. View Insurance name dropdown list
    ...     2. Select one of Insurance name from the dropdown list
    ...     3. Select an expiration date (option)
    ...
    ...
    ...     Expected Result:
    ...     1. Can be one of the following options:
    ...     + Private
    ...     + Medicare
    ...     + Medicaid
    ...     + United health
    ...     + Kaiser
    ...     + Anthem
    ...     + Humana
    ...     +  Blue Cross
    ...     + Aetna
    ...     + Cigna
    ...     + CVS
    ...     + Molina
    ...     + Other insurance
    ...     3. Format of expiration date (mm/dd/yyyy)
    ...
    [Tags]  BTGW-PATIENT-AUTH-PROFILE-14        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-PROFILE-15: Switch to Cash/Credit Card payment option after filling all fields of Insurance option,then select Insurance option again.
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Switch to Cash/Credit Card payment option after filling all fields of Insurance option,then select Insurance option again.
    ...
    ...     Precondition:
    ...     - The user is on the Step3/ Complete profile
    ...     - The Patient's country is US
    ...
    ...
    ...     Test Steps:
    ...     1. Select Insurance option
    ...     2. Select Insurance name in the Insurance name dropdown list.
    ...     3. Sellect Expiration date (option)
    ...     4. Select Cash/Credit card paying
    ...     5. Select Insurance option again.
    ...     6. Observe the Insurance name and Expiration field
    ...     Expected Results:
    ...     1. The Insurance Name and Expiration Date fields shall retain the previous data.
    ...
    [Tags]  BTGW-PATIENT-AUTH-PROFILE-15        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-PROFILE-16: Step3 - Move to step 4 with Insurance when the Patient's country is outside US

    [Documentation]  Author: Phuong Tran
...
...     Description: Move to step 4 with Insurance when the Patient's country is outside US
...
...     Precondition: The user is on the Step 3/ Complete profile.
...
...     Test Steps:
...     1. Enter Insurance name into the Insurance name textbox
...     2. Enter Provincial billing (option)
...     3. Select an expiration date (option)
...
...
...     Expected Result:
...     1. Entered Insurance name shall be displayed.
...     2. Entered Provincial billingn shall be displayed.
...     3. Format of expiration date (mm/dd/yyyy)
...
    [Tags]  BTGW-PATIENT-AUTH-PROFILE-16        manual
    Manual should be passed  ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-PROFILE-17: Step3 - Switch to Cash/Credit Card payment option after filling all fields of Insurance option,then select Insurance option again.
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description:  Step3 - Switch to Cash/Credit Card payment option after filling all fields of Insurance option,then select Insurance option again.
    ...
    ...     Precondition:
    ...     - The user is on the Step3/ Complete profile
    ...     - The Patient's country is outside US
    ...
    ...
    ...     Test Steps:
    ...     1. Select Insurance option
    ...     2. Select Insurance name in the Insurance name dropdown list.
    ...     3. Sellect Expiration date (option)
    ...     4. Select Cash/Credit card paying
    ...     5. Select Insurance option again.
    ...     6. Observe the Insurance name and Expiration field
    ...     Expected Results:
    ...     1. The all fields shall retain the previous data.
    ...
    [Tags]  BTGW-PATIENT-AUTH-PROFILE-17        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-PROFILE-18: Step3 - Next button shall be disabled when there is at least one required field is empty
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Step3 - Next button shall be disabled when there is at least one required field is empty
    ...
    ...     Precondition:
    ...     - The user is on the Complete profile
    ...
    ...
    ...     Test Steps:
    ...     1. Observe Step1
    ...     2. Observe Step2
    ...     3. Observe Step3
    ...     Expected Results:
    ...     1.Next button shall be disabled when there is at least one required field is empty
    [Tags]  BTGW-PATIENT-AUTH-PROFILE-18        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-PROFILE-19: Step3 - Change the Patient's country is US/other country to other country/US (with/ without Provincial and Expiration date )
     [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Step3 - Change the Patient's country is US/other country to other country/US (with/ without Provincial and Expiration date )
    ...
    ...     Precondition:
    ...     - The use is on Step3.
    ...
    ...
    ...     Test Steps:
    ...     1. Select "Insurance" option
    ...     2. Enter the value in the all field
    ...     3. Click "Back" button
    ...     4. Change the Patient's country is US/other country to other country/US)
    ...     5. Observe
    ...
    ...     Expected Results:
    ...     1. The values in all fields shall be cleared.
    [Tags]  BTGW-PATIENT-AUTH-PROFILE-19        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-PROFILE-20: Step4 - Finish completing profile without Medical condition information
     [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Step4 - Finish completing profile without Medical condition information
    ...
    ...     Precondition:
    ...     - The use is on Step4.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Click "Finish" button
    ...
    ...
    ...     Ex Eected Results:
    ...     - 1. Successfully completed profile and shall be navigated to the Input reference code screen
    [Tags]  BTGW-PATIENT-AUTH-PROFILE-20        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-PROFILE-21: Step4 - Finish completing profile with Medical condition information - any option is in the search results list
     [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Step4 - Finish completing profile with Medical condition information - any option is in the search results list
    ...
    ...     Precondition:
    ...     - The use is on Step4.
    ...
    ...
    ...     Test Steps:
    ...     - 1.Click "Add medical conditions" button
    ...     - 2. Enter and select any option is in the search results list
    ...     - 3. Click "Finish" button
    ...
    ...
    ...     Expected Results:
    ...     - 1. Successfully completed profile and shall be navigated to the Input reference code screen
    [Tags]  BTGW-PATIENT-AUTH-PROFILE-21        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-AUTH-PROFILE-22: Step4 - Finish completing profile when enter Allergies without maximum characters limit
     [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Step4 - Finish completing profile when enter Allergies without maximum characters limit
    ...
    ...     Precondition:
    ...     - The use is on Step4.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Enter Allergies without maximum characters limit
    ...     - 2. Click "Finish" button
    ...
    ...
    ...     Expected Results:
    ...     - 1. Successfully completed profile and shall be navigated to the Input reference code screen
    [Tags]  BTGW-PATIENT-AUTH-PROFILE-22        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BTGW-PATIENT-AUTH-PROFILE-23: Step4 - Finish button when turn off wifi
     [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Step4 - Finish button when turn off wifi
    ...
    ...     Precondition:
    ...     - The use is on Step4.
    ...
    ...
    ...     Test Steps:
    ...     1. Enter with any information (if any)
    ...     2. Click "Finish" button
	... 	3. In Complete process - turn of wifi
    ...
    ...
    ...     Ex Eected Results:
    ...     1. An error message displayed: “Failed to save the information. Please try again”
    [Tags]  BTGW-PATIENT-AUTH-PROFILE-23        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BTGW-PATIENT-AUTH-PROFILE-24: Re-open then kill app
     [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Re-open then kill app
    ...
    ...     Precondition:
    ...     - The use is on Step4.
    ...
    ...
    ...     Test Steps:
    ...     1. kill app
	... 	2. Re-open app
    ...
    ...
    ...     Expected Results:
    ...     1. The login screen shall be displayed.
    [Tags]  BTGW-PATIENT-AUTH-PROFILE-24        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
