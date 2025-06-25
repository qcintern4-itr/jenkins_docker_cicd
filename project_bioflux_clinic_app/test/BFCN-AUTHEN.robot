
*** Settings ***
Documentation   Clinic-Authetication Test Suite
Metadata    sid     BFCN-AUTHEN
Metadata    owner   Phuong Tran
Library     corelib/AssertionExtension.py

Force Tags      BFCN-AUTHEN       mapp
Test Timeout    30m




*** Test Cases ***
BFCN-AUTHEN-LOGIN-01: Force update in the Login screen
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: Force update in the Login screen
    ...
    ...     Precondition: The user is on the Login screen

    ...
    ...     Test steps:
    ...     1. Observe
    ...
    ...     Expected Results: Display a screen for users to switch to the Store to download the latest version

    [Tags]  BFCN-AUTHEN-LOGIN-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-AUTHEN-LOGIN-02: Force update in the any screen after login
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: Force update in any screen after login
    ...
    ...     Precondition: The user is any screen after login

    ...
    ...     Test steps:
    ...     1. Observe
    ...
    ...     Expected Results: Display a screen for users to switch to the Store to download the latest version

    [Tags]  BFCN-AUTHEN-LOGIN-02   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-AUTHEN-LOGIN-03: Sign in with new the password has just been reset by Admin
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: Sign in with new the password has just been reset by Admin
    ...
    ...     Precondition: The user is in the Login screen

    ...
    ...     Test steps:
    ...     1. Admin Portal: Reset pw account
    ...     2. Enter valid username/ pw
    ...     3. CLick the Login screen
    ...
    ...     Expected Results: The user shall be navigate to the Set-up screen

    [Tags]  BFCN-AUTHEN-LOGIN-03   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-AUTHEN-LOGIN-04: Sign in with invalid username/ pw
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: Sign in with new the password has just been reset by Admin
    ...
    ...     Precondition: The user is in the Login screen

    ...
    ...     Test steps:
    ...     1. Enter invalid username/ pw
    ...     2. CLick the Login screen
    ...
    ...     Expected Results: The following error message will be displayed: “Invalid username or password".

    [Tags]  BFCN-AUTHEN-LOGIN-04   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-AUTHEN-LOGIN-05: Sign in withthe account was deactivated
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:  Sign in withthe account was deactivated
    ...
    ...     Precondition: The user is in the Login screen

    ...
    ...     Test steps:
    ...     1. Enter the account was deactivated
    ...     2. CLick the Login screen
    ...
    ...     Expected Results: The following error message will be displayed: “Invalid username or password".

    [Tags]  BFCN-AUTHEN-LOGIN-05   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-AUTHEN-LOGIN-06: Sign in with the account once it is reactivated
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:  Sign in with the account once it is reactivated
    ...
    ...     Precondition: The user is in the Login screen

    ...
    ...     Test steps:
    ...     1. Admin Portal: Deactive that account
    ...     2. Enter that account
    ...     3. Click the Login screen
    ...     4. Admin Portal: Re-active that account
    ...     5. Enter that account
    ...     6. Click the Login screen
    ...
    ...     Expected Results: Login the app succesfful, navigate to the Inbox tab

    [Tags]  BFCN-AUTHEN-LOGIN-06   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-AUTHEN-LOGIN-07: Sign in with the account containing the closed facility.
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:  Sign in with the account containing the closed facility.
    ...
    ...     Precondition: The user is in the Login screen

    ...
    ...     Test steps:
    ...     2. Enter username/ pw
    ...     3. Click the Login screen
    ...
    ...     Expected Results: Login the app succesfful, navigate to the Inbox tab
    [Tags]  BFCN-AUTHEN-LOGIN-07   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-AUTHEN-LOGIN-08: Sign in with the account containing the closed facility once that facility is reactivated
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:  Sign in with the account containing the closed facility once that facility is reactivated
    ...
    ...     Precondition: The user is in the Login screen

    ...
    ...     Test steps:
    ...     1. Enter username/ pw
    ...     2. Click the Login screen
    ...     3. Admin Portal: Re-activethe facility belongs the logged account
    ...     4. Click the Okay button
    ...
    ...     Expected Results:
    ...     - Step3: Display the Update List pop-up
    ...     - Step4: The user shall be redirected the Login screen

    [Tags]  BFCN-AUTHEN-LOGIN-08   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-AUTHEN-LOGIN-09: Sign in with an account that has a facility that is closed
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:  Sign in with an account that has a facility that is closed
    ...
    ...     Precondition: The user is in the Login screen

    ...
    ...     Test steps:
    ...     1. Enter the account that has a facility that is closed
    ...     2. CLick the Login screen
    ...
    ...     Expected Results: The following error message will be displayed: “Invalid username or password".

    [Tags]  BFCN-AUTHEN-LOGIN-09   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-AUTHEN-LOGIN-11: Sign in with an account that has 1 facility once that facility is reactivated
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:  Sign in with the account containing the closed facility once that facility is reactivated
    ...
    ...     Precondition: The user is in the Login screen

    ...
    ...     Test steps:
    ...     1. Enter username/ pw
    ...     2. Click the Login screen
    ...     3. Admin Portal: Re-activethe facility belongs the logged account
    ...     4. Click the Okay button
    ...     5. Enter username/ pw
    ...     6. Click the Login screen
    ...
    ...     Expected Results:
    ...     - Step3: Display the Update List pop-up (https://www.figma.com/file/FfNxiJGQBp6Cs5KXTs9fO6/Biocare-Portal-(aka-Gateway-page)?type=design&node-id=1836-8979&mode=design&t=MgLEHKRHvzIlTdUe-4)
    ...     - Step4: The user shall be redirected the Login screen
    ...     - Step6: Login the app succesfful, navigate to the Inbox tab

    [Tags]  BFCN-AUTHEN-LOGIN-11   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-AUTHEN-LOGIN-12: Sign in with the account with the email
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:  Sign in with the account with the email
    ...
    ...     Precondition: The user is in the Login screen

    ...
    ...     Test steps:
    ...     1. Enter username/ pw
    ...     2. Click the Login screen
    ...
    ...     Expected Results:
    ...     - Step2: Login the app succesfful, navigate to the Inbox tab

    [Tags]  BFCN-AUTHEN-LOGIN-12   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-AUTHEN-LOGIN-13: Sign in with the acount without the email
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:  Sign in with the acount without the email
    ...
    ...     Precondition: The user is in the Login screen

    ...
    ...     Test steps:
    ...     1. Enter username/ pw
    ...     2. Click the Login screen
    ...
    ...     Expected Results:
    ...     - Step2: Login the app succesfful, navigate to the Inbox tab

    [Tags]  BFCN-AUTHEN-LOGIN-13   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-AUTHEN-LOGIN-14: Sign in with the account with your picture
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:  Sign in with the account with your picture
    ...
    ...     Precondition: The user is in the Login screen

    ...
    ...     Test steps:
    ...     1. Enter username/ pw
    ...     2. Click the Login screen
    ...
    ...     Expected Results:
    ...     - Step2: Login the app succesfful, navigate to the Inbox tab

    [Tags]  BFCN-AUTHEN-LOGIN-14   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-AUTHEN-LOGIN-15: Sign in with the account without your picture
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: Sign in with the account without your picture
    ...
    ...     Precondition: The user is in the Login screen

    ...
    ...     Test steps:
    ...     1. Enter username/ pw
    ...     2. Click the Login screen
    ...
    ...     Expected Results:
    ...     - Step2: Login the app succesfful, navigate to the Inbox tab

    [Tags]  BFCN-AUTHEN-LOGIN-15   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-AUTHEN-LOGOUT-01: Sign out of the app
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: Sign out of the app
    ...
    ...     Precondition: The user is in the Login screen

    ...
    ...     Test steps:
    ...     1.Click the Sign out button
    ...
    ...     Expected Results:
    ...     - Step1: The user will be signed out of the app and redirected to the Login screen.

    [Tags]  BFCN-AUTHEN-LOGOUT-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-AUTHEN-FORGOT-PW-01: Click the Forgot Password button
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Forgot Password button
    ...
    ...     Precondition: The user is in the Login screen

    ...
    ...     Test steps:
    ...     1.Click the Forgot Password button
    ...
    ...     Expected Results:
    ...     - Refer to design:https: //www.figma.com/file/FfNxiJGQBp6Cs5KXTs9fO6/Biocare-Portal-(aka-Gateway-page)?type=design&node-id=611-9828&mode=design&t=MgLEHKRHvzIlTdUe-4

    [Tags]  BFCN-AUTHEN-FORGOT-PW-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-AUTHEN-PRIVACY-POLICY-01: Click the Privacy policy button
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Forgot Password button
    ...
    ...     Precondition: The user is in the Login screen

    ...
    ...     Test steps:
    ...     1. Click the Privacy policy button
    ...
    ...     Expected Results:
    ...     - Refer to design:

    [Tags]  BFCN-AUTHEN-PRIVACY-POLICY-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-AUTHEN-TERMS-OF-USE-01: Click the Terms of use button
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Terms of use button
    ...
    ...     Precondition: The user is in the Login screen

    ...
    ...     Test steps:
    ...     1. Click the Terms of use button
    ...
    ...     Expected Results:
    ...     - Refer to design: https://www.figma.com/file/FfNxiJGQBp6Cs5KXTs9fO6/Biocare-Portal-(aka-Gateway-page)?type=design&node-id=1246-6727&mode=design&t=MgLEHKRHvzIlTdUe-4

    [Tags]  BFCN-AUTHEN-TERMS-OF-USE-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-AUTHEN-CONTACT-SUPPORT-01: Click the Contact Support button
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Contact Support button
    ...
    ...     Precondition: The user is in the Login screen

    ...
    ...     Test steps:
    ...     1. Click the Contact Support button
    ...
    ...     Expected Results:
    ...     - Refer to design: https://www.figma.com/file/FfNxiJGQBp6Cs5KXTs9fO6/Biocare-Portal-(aka-Gateway-page)?type=design&node-id=1246-6652&mode=design&t=MgLEHKRHvzIlTdUe-4

    [Tags]  BFCN-AUTHEN-CONTACT-SUPPORT-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-AUTHEN-SET-UP-PW-02: Click the Set up New PW after enter the pw has less than 8 characters
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:
    ...
    ...     Precondition:

    ...
    ...     Test steps:
    ...     1.
    ...
    ...     Expected Results:

      [Tags]  BFCN-AUTHEN-SET-UP-PW-02   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-AUTHEN-SET-UP-PW-03: Click the Set up New PW after enter the pw includes a blank space
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:
    ...
    ...     Precondition:

    ...
    ...     Test steps:
    ...     1.
    ...
    ...     Expected Results:

      [Tags]  BFCN-AUTHEN-SET-UP-PW-03   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-AUTHEN-SET-UP-PW-04: Click the Set up New PW after enter a confirmation pw different from the new pw
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:
    ...
    ...     Precondition:

    ...
    ...     Test steps:
    ...     1.
    ...
    ...     Expected Results:

      [Tags]  BFCN-AUTHEN-SET-UP-PW-04   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-AUTHEN-SET-UP-PW-05: Click the Set up New PW after enter the new pw and the confirmation pw contains username
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:
    ...
    ...     Precondition:

    ...
    ...     Test steps:
    ...     1.
    ...
    ...     Expected Results:

      [Tags]  BFCN-AUTHEN-SET-UP-PW-05   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-AUTHEN-SET-UP-PW-06:Set up the PW when the account has seted up the pw on the other device/ browser
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:
    ...
    ...     Precondition:

    ...
    ...     Test steps:
    ...     1.
    ...
    ...     Expected Results:

      [Tags]  BFCN-AUTHEN-SET-UP-PW-06   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-AUTHEN-SET-UP-PW-07: Set up the PW successfully
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:
    ...
    ...     Precondition:

    ...
    ...     Test steps:
    ...     1.
    ...
    ...     Expected Results:

      [Tags]  BFCN-AUTHEN-SET-UP-PW-07   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-AUTHEN-SET-UP-PW-08: Click the Back to Sign In button
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:
    ...
    ...     Precondition:

    ...
    ...     Test steps:
    ...     1.
    ...
    ...     Expected Results:

      [Tags]  BFCN-AUTHEN-SET-UP-PW-08   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-AUTHEN-SET-UP-PW-09: View the pw and confirmation after unhide
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:
    ...
    ...     Precondition:

    ...
    ...     Test steps:
    ...     1.
    ...
    ...     Expected Results:

      [Tags]  BFCN-AUTHEN-SET-UP-PW-09   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}