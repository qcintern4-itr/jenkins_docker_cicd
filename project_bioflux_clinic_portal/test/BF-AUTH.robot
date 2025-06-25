*** Settings ***
Documentation   Test Suite - Clinic Authentication
Metadata    sid     BF-AUTH
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_clinic_portal/lib/web/Common.py
Library     project_bioflux_clinic_portal/lib/web/Inbox.py
Library     project_bioflux_clinic_portal/lib/web/StudyDetails.py

Variables   project_bioflux_clinic_portal/lib/web/Variable.py

Suite Setup         SUITE SETUP
Suite Teardown      SUITE TEARDOWN
Force Tags          BF-AUTH     web
Test Timeout        1h

*** Test Cases ***
BF-AUTH-SIGNIN-01: Sign in to Clinic Technician portal with valid username and password
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sign in to the Clinic Technician portal with a valid username and password
    ...
    ...     Precondition:
    ...     - The user is on the Signin page of Biocare gateway portal
    ...
    ...     Test Steps:
    ...     1. Enter valid username and password of Clinic Technician role into [Username] and [Password]
    ...     textboxes > Click [Sign in]
    ...     2. Click [Biocare Diagnostics] button
    ...
    ...     Expected Results:
    ...     1. User is landed on Biocare Gateway dashboard after signin successfully by default
    ...     2. System will navigate to the Inbox page and Recent reports tab of Clinic portal

    [Tags]      BF-AUTH-SIGNIN-01       auto
    Sign In Bioflux    username=${TECH_USER}[0][username]       password=${TECH_USER}[0][password]
    ${header}       Get Page Header
    ${report_type}  Get Current Report Type
    ${actual_report_type}       Evaluate    "${report_type}".split('|')[0].strip()
    Run Keyword And Continue On Failure    Should Be Equal    ${AuthSingin.Inbox}             ${header}
    Run Keyword And Continue On Failure    Should Contain     ${AuthSingin.Recent_reports}             ${actual_report_type}
    [Teardown]    Sign Out Bioflux

BF-AUTH-SIGNIN-02: Sign in to Clinic Physician portal with valid username and password
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sign in to the Clinic Physician portal with a valid username and password
    ...
    ...     Precondition:
    ...     - The user is on the Signin page of Biocare gateway portal
    ...
    ...     Test Steps:
    ...     1. Enter valid username and password of Clinic Physician role into [Username] and [Password]
    ...     textboxes > Click [Sign in]
    ...     2. Click [Biocare Diagnostics] button
    ...
    ...     Expected Results:
    ...     1. User is landed on Biocare Gateway Dashboard after signin successfully by default
    ...     2. System will navigate to the Inbox page and Recent reports tab of Clinic portal
    ...
    [Tags]      BF-AUTH-SIGNIN-02       auto
    Sign In Bioflux    username=${PHY_USER}[0][username]       password=${PHY_USER}[0][password]
    ${header}       Get Page Header
    ${report_type}  Get Current Report Type
    ${actual_report_type}       Evaluate    "${report_type}".split('|')[0].strip()
    Run Keyword And Continue On Failure    Should Be Equal    ${AuthSingin.Inbox}             ${header}
    Run Keyword And Continue On Failure    Should Contain     ${AuthSingin.Recent_reports}    ${actual_report_type}
    [Teardown]    Sign Out Bioflux

BF-AUTH-SIGNIN-03: Sign in to Clinic Electrophysiologist portal with valid username and password
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sign in to the Clinic Electrophysiologist portal with a valid username and password
    ...
    ...     Precondition:
    ...     - The user is on the Signin page of Bioflux portal
    ...
    ...     Test Steps:
    ...     1. Enter valid username of Clinic Electrophysiologist role into [Username] textbox
    ...     2. Enter valid password of Clinic Electrophysiologist role into [Password] textbox
    ...     3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     1. Sign in successfully
    ...     2. The user is landed on Inbox page and Recent reports tab is selected
    ...
    [Tags]      BF-AUTH-SIGNIN-03        manual     deactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Sign In Bioflux    username=${ELECT_USER}[0][username]       password=${ELECT_USER}[0][password]
#    ${header}       Get Page Header
#    ${report_type}  Get Current Report Type
#    Run Keyword And Continue On Failure    Should Be Equal    ${AuthSingin.Inbox}             ${header}
#    Run Keyword And Continue On Failure    Should Contain     ${AuthSingin.Recent_reports}    ${report_type}
#    [Teardown]    Sign Out Bioflux

BF-AUTH-SIGNIN-04: Sign in with invalid username
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot sign in to the portal with an invalid username
    ...
    ...     Precondition:
    ...     - The user is on the Signin page of Biocare Gateway portal
    ...
    ...     Test Steps:
    ...     1. Enter invalid username and valid password into [Username] and [Password]
    ...     textboxes
    ...     2. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     1. Display an error message "Invalid username or password"
    ...     2. The user still stay on the Biocare Gateway Signin page
    [Tags]      BF-AUTH-SIGNIN-04       auto
    ${msg}      Sign In Bioflux    username=invalidUsername       password=${PHY_USER}[0][password]
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}     Invalid username or password
    ${state_url}      Wait Url Contains    text=sign-in
    Run Keyword And Continue On Failure    Should Be Equal    ${state_url}       ${True}

BF-AUTH-SIGNIN-05: Sign in with invalid password
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot sign in to the portal with an invalid password
    ...
    ...     Precondition:
    ...     - The user is on the Signin page of Biocare Gateway portal
    ...
    ...     Test Steps:
    ...     1. Enter valid username and invalid password into [Username] and [Password]
    ...     textboxes
    ...     2. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     1. Display an error message "Invalid username or password"
    ...     2. The user still stay on the Biocare Gateway Signin page
    [Tags]      BF-AUTH-SIGNIN-05       auto
    ${msg}      Sign In Bioflux    username=${PHY_USER}[0][username]      password=invalidPassword
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}      Invalid username or password
    ${state_url}      Wait Url Contains    text=sign-in
    Run Keyword And Continue On Failure    Should Be Equal    ${state_url}       ${True}

BF-AUTH-SIGNIN-06: Sign in with invalid user and password
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot sign in to the portal with an invalid username and password
    ...
    ...     Precondition:
    ...     - The user is on the Signin page of Biocare Gateway portal
    ...
    ...     Test Steps:
    ...     1. Enter invalid username and invalid password into [Username] and [Password]
    ...     textboxes
    ...     2. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     1. Display an error message "Invalid username or password"
    ...     2. The user still stay on the Biocare Gateway Signin page
    [Tags]      BF-AUTH-SIGNIN-06       auto
    ${msg}      Sign In Bioflux    username=invalidUsername      password=invalidPassword
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}     Invalid username or password
    ${state_url}      Wait Url Contains    text=/sign-in
    Run Keyword And Continue On Failure    Should Be Equal    ${state_url}       ${True}

BF-AUTH-SIGNOUT-01: Sign out from the Clinic Technician portal
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sign out from the Clinic Technician portal
    ...
    ...     Precondition: The user has signed in to the Clinic Technician portal
    ...
    ...     Test Steps:
    ...     1. Click [Avatar] button
    ...     2. Click [Sign out] button
    ...
    ...     Expected Results:
    ...     1. Sign out successfully
    ...     2. The user is navigated to the Signin page

    [Tags]      BF-AUTH-SIGNOUT-01      auto
    Sign In Bioflux    username=${TECH_USER}[0][username]       password=${TECH_USER}[0][password]
    ${header}       Get Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${AuthSingin.Inbox}     ${header}
    Sign Out Bioflux
    ${state_url}      Wait Url Contains    text=/sign-in
    Run Keyword And Continue On Failure    Should Be Equal    ${state_url}       ${True}

BF-AUTH-SIGNOUT-02: Sign out from the Clinic Physician portal
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sign out from the Clinic Physician portal
    ...
    ...     Precondition: The user has signed in to the Clinic Physician portal
    ...
    ...     Test Steps:
    ...     1. Click [Avatar] button
    ...     2. Click [Sign out] button
    ...
    ...     Expected Results:
    ...     1. Sign out successfully
    ...     2. The user is navigated to the Signin page

    [Tags]      BF-AUTH-SIGNOUT-02      auto
    Sign In Bioflux    username=${PHY_USER}[0][username]       password=${PHY_USER}[0][password]
    ${header}       Get Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${AuthSingin.Inbox}     ${header}
    Sign Out Bioflux
    ${state_url}      Wait Url Contains    text=/sign-in
    Run Keyword And Continue On Failure    Should Be Equal    ${state_url}       ${True}

BF-AUTH-SIGNOUT-03: Sign out from the Clinic Electrophysiologist portal
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sign out from the Clinic Electrophysiologist portal
    ...
    ...     Precondition: The user has signed in to the Clinic Electrophysiologist portal
    ...
    ...     Test Steps:
    ...     1. Click [Avatar] button
    ...     2. Click [Sign out] button
    ...
    ...     Expected Results:
    ...     1. Sign out successfully
    ...     2. The user is navigated to the Signin page

    [Tags]         BF-AUTH-SIGNOUT-03     manual        deactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Sign In Bioflux    username=${ELECT_USER}[0][username]       password=${ELECT_USER}[0][password]
#    ${header}       Get Page Header
#    Run Keyword And Continue On Failure    Should Be Equal    ${AuthSingin.Inbox}     ${header}
#    Sign Out Bioflux
#    ${state_url}      Wait Url Contains    text=/login
#    Run Keyword And Continue On Failure    Should Be Equal    ${state_url}     ${True}

BF-AUTH-RESET-PW-01: Reset password of a clinic account whose email has not been verified yet
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot reset password of a clinic account whose email has not been verified yet
    ...
    ...     Precondition: The user is on Signin page
    ...
    ...     Test Steps:
    ...     1. Click [Forgot Password?] button
    ...     2. Enter a username of a clinic account whose email has not been verified yet
    ...     3. Click [Forgot Password] button
    ...
    ...     Expected Results:
    ...     1. The user shall be navigated to the screen:
    ...     “Please contact the Support team through 1-800-590-4155 or support@biotricity.com for further action to be taken!”
    ...     with Go Back button for the user to navigate back to the Sign in screen

    [Tags]      BF-AUTH-RESET-PW-01      manual     deactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    ${msg}     Forgot Password    username=${PHY_USER}[1][username]
#    ${expect_msg}   Set Variable    Please contact the Support team through 1-800-590-4155 or cs@biotricity.com for further action to be taken!
#    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        ${expect_msg}
#    Forgot Password    is_forgot_password=${False}      go_back=${True}
#    ${state_url}      Wait Url Contains    text=/login
#    Run Keyword And Continue On Failure    Should Be Equal    ${state_url}     ${True}

BF-AUTH-RESET-PW-02: Reset password of a clinic account whose email is not available
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot reset password of a clinic account whose email is not available
    ...
    ...     Precondition: The user is on Signin page
    ...
    ...     Test Steps:
    ...     1. Click [Forgot Password?] button
    ...     2. Enter a username of a clinic account whose email is not available
    ...     3. Click [Forgot Password] button
    ...
    ...     Expected Results:
    ...     1. The user shall be navigated to the screen:
    ...     “Please contact the Support team through 1-800-590-4155 or support@biotricity.com for further action to be taken!”
    ...     with Go Back button for the user to navigate back to the Sign in screen

    [Tags]      BF-AUTH-RESET-PW-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-AUTH-RESET-PW-03: Reset password successfully of a clinic account whose email has already verified
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can reset password successfully of a clinic account whose email has already verified
    ...
    ...     Precondition: The user is on Signin page
    ...
    ...     Test Steps:
    ...     1. Click [Forgot Password?] button
    ...     2. Enter a username of a clinic account whose email has already verified
    ...     3. Click [Forgot Password] button
    ...     4. Click the Reset Password button or the link in the clinic’s inbox
    ...     5. Enter a valid value in the New password and Confirm new password text inputs
    ...     6. Click the Set Up New Password button
    ...
    ...     Expected Results:
    ...     1. In step 3, the user shall be navigated to the Email Verified! screen: “An email has been sent to associated
    ...     email address. Follow instructions in the email to reset your password.” with Go Back button
    ...     2. In step 4:
    ...     - A URL is opened and allows the user to reset their password
    ...     - There shall be text inputs for New password and Confirm new password text inputs
    ...     - There shall also be Password rules letting the user know what is required to create a valid password
    ...         +	Must have at least 8 characters
    ...         +	Can contain: Lowercase/Uppercase characters, Special characters, Number (0 - 9)
    ...     3. In step 6:
    ...     - Display a Success screen with a message: “Your new password has been set up successfully!”
    ...     with Go To Login Page button if user’s password is changed successfully.
    ...     - Except the user who takes action of changing their password, a modal shall be displayed:
    ...         +   Title: Password changed
    ...         +   Content: Your password has just been changed. Please sign in with your new one to continue!
    ...         +   Button: Okay. Clicking the button shall log the user out of all sessions

    [Tags]      BF-AUTH-RESET-PW-03     manual      deactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    ${msg}     Forgot Password    username=${NURSE_USER}[0][username]
#    ${expect_msg}   Set Variable    An email has been sent to the associated email address. Follow instructions in the email to reset your password.
#    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        ${expect_msg}
#    Forgot Password    is_forgot_password=${False}      go_back=${True}
#    ${state_url}      Wait Url Contains    text=/login
#    Run Keyword And Continue On Failure    Should Be Equal    ${state_url}     ${True}
#    Manual Should Be Passed    ${TEST_NAME}     Open mail box `btcy.qa.team.03@gmail.com/12345678x@Q` and verify that email'contents are correct and Set Up New Password

BF-AUTH-RESET-PW-04: Reset password unsuccessfully if the password is less than 8 characters
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot reset password successfully if the password is less than 8 characters
    ...
    ...     Precondition: The user is on SET UP NEW PASSWORD screen
    ...
    ...     Test Steps:
    ...     1. Enter a password that is less than 8 characters into [New password] textbox
    ...     2. Enter a password into [Confirm new password] textbox that matches with new password
    ...     3. Click [Set Up New Password] button
    ...
    ...     Expected Results:
    ...     1. Display an error message “Password must have at least 8 characters.”
    [Tags]      BF-AUTH-RESET-PW-04     manual      deactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-AUTH-RESET-PW-05: Reset password unsuccessfully if the password includes a blank space
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot reset password successfully if the password includes a blank space
    ...
    ...     Precondition: The user is on SET UP NEW PASSWORD screen
    ...
    ...     Test Steps:
    ...     1. Enter a password that includes a blank space into [New password] textbox
    ...     2. Enter a password into [Confirm new password] textbox that matches with new password
    ...     3. Click [Set Up New Password] button
    ...
    ...     Expected Results:
    ...     1. Display an error message “Password cannot include blank spaces.”
    [Tags]      BF-AUTH-RESET-PW-05     manual      deactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-AUTH-RESET-PW-06: Reset password unsuccessfully if the confirmation of new password does not match with the entered new password
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot reset password successfully if the confirmation of new password does not match with the entered new password
    ...
    ...     Precondition: The user is on SET UP NEW PASSWORD screen
    ...
    ...     Test Steps:
    ...     1. Enter a valid password into [New password] textbox
    ...     2. Enter a password into [Confirm new password] textbox that does not match with new password
    ...     3. Click [Set Up New Password] button
    ...
    ...     Expected Results:
    ...     1. Display an error message “The confirm password does not match.”
    [Tags]      BF-AUTH-RESET-PW-06     manual      deactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-AUTH-RESET-PW-07: Cancel resetting password
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can cancel resetting password
    ...
    ...     Precondition: The user is on Signin screen
    ...
    ...     Test Steps:
    ...     1. Click [Forgot Password?] button
    ...     2. Click [Cancel] button
    ...
    ...     Expected Results:
    ...     1. The user shall be navigated back to Signin screen
    [Tags]      BF-AUTH-RESET-PW-07      deactive       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Forgot Password     is_forgot_password=${False}     is_cancel=${True}
#    ${state_url}      Wait Url Contains    text=/login
#    Run Keyword And Continue On Failure    Should Be Equal    ${state_url}     ${True}

BF-AUTH-RESET-PW-08: Reset password of an account that does not belong to clinic user pool
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot reset password of an account that does not belong to clinic user pool
    ...
    ...     Precondition: The user is on Signin page
    ...
    ...     Test Steps:
    ...     1. Click [Forgot Password?] button
    ...     2. Enter a username of an account that does not belong to clinic user pool (Ex. Call Center, Admin, Support, Billing, Sales)
    ...     3. Click [Forgot Password] button
    ...
    ...     Expected Results:
    ...     1. The user shall be navigated to the screen:
    ...     “Please contact the Support team through 1-800-590-4155 or support@biotricity.com for further action to be taken!”
    ...     with Go Back button for the user to navigate back to the Sign in screen

    [Tags]      BF-AUTH-RESET-PW-08      deactive   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    ${msg}     Forgot Password    username=username_1
#    ${expect_msg}   Set Variable    Please contact the Support team through 1-800-590-4155 or cs@biotricity.com for further action to be taken!
#    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        ${expect_msg}
#    Forgot Password    is_forgot_password=${False}      go_back=${True}
#    ${state_url}      Wait Url Contains    text=/login
#    Run Keyword And Continue On Failure    Should Be Equal    ${state_url}     ${True}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library  project_bioflux_clinic_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    Import Library  project_bioflux_clinic_portal/lib/web/Inbox.py    ${BROWSER_NODE}  ${ENV}
    ${TECH_USERS}    Get Config Param       NEW_USER
    ${TECH_USER}         Set Variable        ${TECH_USERS}[clinic_technician]
    ${PHY_USERS}     Get Config Param       NEW_USER
    ${PHY_USER}         Set Variable        ${PHY_USERS}[clinic_physician]
    Sign In Bioflux     username=${TECH_USER}[0][username]       password=${TECH_USER}[0][password]
    ${VERSION}          Get Release Version
    Set Suite Metadata    version     ${VERSION}
    Set Suite Metadata    browser     ${BROWSER.capitalize()}
    Set Suite Variable    ${TECH_USER}
    Set Suite Variable    ${PHY_USER}
    [Teardown]    Sign Out Bioflux

SUITE TEARDOWN
    Quit Browser
