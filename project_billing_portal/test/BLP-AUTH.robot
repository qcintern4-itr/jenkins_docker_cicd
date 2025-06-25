*** Settings ***
Documentation   Test Suite - Billing Portal - Authentication
Metadata    sid     BLP-AUTH
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}   ${HEADLESS}
Library     project_billing_portal/lib/ConfigHandler.py     ${ENV}
#Library     project_billing_portal/lib/web/Common.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BLP-AUTH    web
Test Timeout    1h

*** Test Cases ***
BLP-AUTH-SIGNIN-01: Sign in with a valid username and valid password of Billing user
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can sign in to the Billing portal with a valid username and password
    ...
    ...     Precondition:
    ...     - The user is on the Login page of Billing portal
    ...
    ...     Test Steps:
    ...     - 1. Enter valid username into [Username] textbox
    ...     - 2. Enter valid password into [Password] textbox
    ...     - 3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     - 1. Login successfully
    ...     - 2. The user is landed on Insurance page and Unbilled tab is selected
    ...     - 3. The user's role and full name will be displayed on the top right of the website header

    [Tags]  BLP-AUTH-SIGNIN-01      BP-SRS-01-FBS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-AUTH-SIGNIN-02: Sign in with a valid username and an invalid password of Billing user
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can not sign in to the Billing portal with a valid username and an invalid password
    ...
    ...     Precondition:
    ...     - The user is on the Login page of Billing portal
    ...
    ...     Test Steps:
    ...     - 1. Enter valid username into [Username] textbox
    ...     - 2. Enter invalid password into [Password] textbox
    ...     - 3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     - 1. The user can not log in to Billing portal
    ...     - 2. The user stays on Sign in page
    ...     - 3. The error message “Invalid username/password” shall be displayed

    [Tags]  BLP-AUTH-SIGNIN-02      BP-SRS-01-FBS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-AUTH-SIGNIN-03: Sign in with an invalid username and a valid password of Billing user
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can not sign in to the Billing portal with an invalid username and a valid password
    ...
    ...     Precondition:
    ...     - The user is on the Login page of Billing portal
    ...
    ...     Test Steps:
    ...     - 1. Enter an invalid username into [Username] textbox
    ...     - 2. Enter a valid password into [Password] textbox
    ...     - 3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     - 1. The user can not log in to Billing portal
    ...     - 2. The user stays on Sign in page
    ...     - 3. The error message “Invalid username/password” shall be displayed

    [Tags]  BLP-AUTH-SIGNIN-03      BP-SRS-01-FBS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-AUTH-SIGNIN-04: Sign in with an invalid username and an invalid password of Billing user
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can not sign in to the Billing portal with a valid username and an invalid password
    ...
    ...     Precondition:
    ...     - The user is on the Login page of Billing portal
    ...
    ...     Test Steps:
    ...     - 1. Enter invalid username into [Username] textbox
    ...     - 2. Enter invalid password into [Password] textbox
    ...     - 3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     - 1. The user can not log in to Billing portal
    ...     - 2. The user is on Sign in page
    ...     - 3. The error message “Invalid username/password” shall be displayed

    [Tags]  BLP-AUTH-SIGNIN-04      BP-SRS-01-FBS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-AUTH-SIGNIN-05: Sign in through Admin portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: Sign in through Admin portal
    ...
    ...     Precondition:
    ...     - The user has logged in to Admin portal by SSO
    ...
    ...     Test Steps:
    ...     - 1. Admin portal >> Facilities page >> Perform accessing to Billing portal
    ...     - 2. Billing portal >> Observe the message on the top of the page
    ...
    ...     Expected Results:
    ...     - 1. Sign in to Billing portal successfully
    ...     - 2. Display a message “You’re logged in through Admin portal”

    [Tags]  BLP-AUTH-SIGNIN-05      BP-SRS-01-FBS-05    BP-1.2.2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-AUTH-SIGNOUT-01: Sign out from the portal in the case login by username/password
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can sign out from the portal
    ...
    ...     Precondition:
    ...     - The user has signed into the Billing Portal by username/password
    ...
    ...     Test Steps:
    ...     - 1. Click on the User's name on the header
    ...     - 2. Click [Sign out] button
    ...
    ...     Expected Results:
    ...     - 1. The user can sign out successfully
    ...     - 2. The user is on Sign in page

    [Tags]  BLP-AUTH-SIGNOUT-01     BP-SRS-01-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-AUTH-SIGNOUT-02: Sign out from the portal in the case login through Admin Portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can sign out from the portal
    ...
    ...     Precondition:
    ...     - The user has signed into the Billing Portal through Admin portal
    ...
    ...     Test Steps:
    ...     - 1. Click on the User's name on the header
    ...     - 2. Click [Sign out] button
    ...
    ...     Expected Results:
    ...     - 1. The user can sign out successfully
    ...     - 2. The user is navigated to ERP homepage

    [Tags]  BLP-AUTH-SIGNOUT-02     BP-SRS-01-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-AUTH-SIGNOUT-03: Sign out from the portal in the case login through Sale Portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can sign out from the portal
    ...
    ...     Precondition:
    ...     - The user has signed into the Billing Portal through Sale portal
    ...
    ...     Test Steps:
    ...     - 1. Click on the User's name on the header
    ...     - 2. Click [Sign out] button
    ...
    ...     Expected Results:
    ...     - 1. The user can sign out successfully
    ...     - 2. The user is navigated to ERP homepage

    [Tags]  BLP-AUTH-SIGNOUT-03     BP-SRS-01-FBS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-AUTH-CHANGEPASSWORD-01: Enters the new password same as current password into the text input
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can not change password when inputting the new password same as the current password
    ...
    ...     Precondition:
    ...     - The user has signed into the Billing Portal by username/password
    ...     - The user is on the Profile screen and select Change your password button
    ...
    ...     Test Steps:
    ...     - 1. Enter a valid current password into [Your Current Password] textbox
    ...     - 2. Enter the current password into [Your New Password] textbox
    ...     - 3. Enter any text into [Confirm Your New Password] textbox
    ...     - 4. Click on [Change password] button
    ...
    ...     Expected Results:
    ...     - 1. The user can not change password
    ...     - 2. An error message: “New password and current password cannot be the same." shall be displayed

    [Tags]  BLP-AUTH-CHANGEPASSWORD-01      BP-SRS-01-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-AUTH-CHANGEPASSWORD-02: Enters an invalid current password
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can not change password when inputting an invalid current password
    ...
    ...     Precondition:
    ...     - The user has signed into the Billing Portal
    ...     - The user is on the Profile screen and select Change your password button
    ...
    ...     Test Steps:
    ...     - 1. Enter an invalid current password into [Your Current Password] textbox
    ...     - 2. Enter any text into [Your New Password] textbox
    ...     - 3. Enter any text into [Confirm Your New Password] textbox
    ...     - 4. Click on [Change password] button
    ...
    ...     Expected Results:
    ...     - 1. The user can not change password
    ...     - 2. An error message “Incorrect password. Please try again.” shall be displayed

    [Tags]  BLP-AUTH-CHANGEPASSWORD-02      BP-SRS-01-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-AUTH-CHANGEPASSWORD-03: Enters the new password that has less than 8 characters
   [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can not change password when inputting the new password that has less than 8 characters
    ...
    ...     Precondition:
    ...     - The user has signed into the Billing Portal
    ...     - The user is on the Profile screen and select Change your password button
    ...
    ...     Test Steps:
    ...     - 1. Enter an valid current password into [Your Current Password] textbox
    ...     - 2. Enter text that has less than 8 characters into [Your New Password] textbox
    ...     - 3. Enter any text into [Confirm Your New Password] textbox
    ...     - 4. Click on [Change password] button
    ...
    ...     Expected Results:
    ...     - 1. The user can not change password
    ...     - 2. An error message “Password must have at least 8 characters.” Shall be displayed

    [Tags]  BLP-AUTH-CHANGEPASSWORD-03      BP-SRS-01-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-AUTH-CHANGEPASSWORD-04: Enters the new password that contains blank space
    [Documentation]  Author: Linh Phan
    ...
    ...  Description: Enters text that includes a blank space into New password and Confirmation password text input
    ...
    ...     Precondition:
    ...     - The user has signed into the Billing Portal
    ...     - The user is on the Profile screen and select Change your password button
    ...
    ...     Test Steps:
    ...     - 1. Enter an valid current password into [Your Current Password] textbox
    ...     - 2. Enter text that has at least 8 characters and contains blank space into [Your New Password] textbox
    ...     - 3. Enter any text into [Confirm Your New Password] textbox
    ...     - 4. Click on [Change password] button
    ...
    ...     Expected Results:
    ...     - 1. The user can not change password
    ...     - 2. An error message “Password cannot include blank spaces.” shall be displayed

    [Tags]  BLP-AUTH-CHANGEPASSWORD-04      BP-SRS-01-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-AUTH-CHANGEPASSWORD-05: The confirmation of new password does not match with the new password entered
   [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user enters enters the confirmation of new password does not match with the new password entered
    ...
    ...     Precondition:
    ...     - The user has signed into the Billing Portal
    ...     - The user is on the Profile screen and select Change your password button
    ...
    ...     Test Steps:
    ...     - 1. Enter an valid current password into [Your Current Password] textbox
    ...     - 2. Enter text a valid text into [Your New Password] textbox
    ...     - 3. Enter the confirmation of new password does not match with the new password entered into [Confirm Your New Password] textbox
    ...     - 4. Click on [Change password] button
    ...
    ...     Expected Results:
    ...     - 1. The user can not change password
    ...     - 2. An error message “The confirm password does not match.” shall be displayed

    [Tags]  BLP-AUTH-CHANGEPASSWORD-05      BP-SRS-01-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-AUTH-CHANGEPASSWORD-06: The user can change password successfully
    [Documentation]  Author: Linh Phan
    ...
    ...  Description: The user can change password successfully
    ...
    ...     Precondition:
    ...     - The user has signed into the Billing Portal
    ...     - The user is on the Profile screen and select Change your password button
    ...
    ...     Test Steps:
    ...     - 1. Enter an valid current password into [Your Current Password] textbox
    ...     - 2. Enter text a valid text into [Your New Password] textbox
    ...     - 3. Enter the confirmation of new password that matchs with the new password entered into [Confirm Your New Password] textbox
    ...     - 4. Click on [Change password] button
    ...
    ...     Expected Results:
    ...     - A toast message “Password changed successfully!” shall be displayed and the user is navigated to Login page

    [Tags]  BLP-AUTH-CHANGEPASSWORD-06      BP-SRS-01-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-AUTH-CHANGEPASSWORD-07: Sign in with the new password
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can sign in to the Billing portal with the new password that they have changed
    ...
    ...     Precondition:
    ...     - The user is on the Login page of Billing portal
    ...
    ...     Test Steps:
    ...     - 1. Enter valid username into [Username] textbox
    ...     - 2. Enter the new password into [Password] textbox
    ...     - 3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     - 1. Login successfully
    ...     - 2. The user is landed on Insurance page and Unbilled tab is selected
    ...     - 3. The user's role and full name will be displayed on the top right of the website header

    [Tags]  BLP-AUTH-CHANGEPASSWORD-07      BP-SRS-01-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-AUTH-CHANGEPASSWORD-08: Sign in with the old password
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can not sign in to the Billing portal with the old password that they have changed
    ...
    ...     Precondition:
    ...     - The user is on the Login page of Billing portal
    ...
    ...     Test Steps:
    ...     - 1. Enter valid username into [Username] textbox
    ...     - 2. Enter the old password into [Password] textbox
    ...     - 3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     - 1. The user can not log in to Billing portal
    ...     - 2. The user stays on Sign in page
    ...     - 3. The error message “Invalid username/password” shall be displayed

    [Tags]  BLP-AUTH-CHANGEPASSWORD-08      BP-SRS-01-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-AUTH-CHANGEPASSWORD-09: Leave the [Your current Password] textbox blank
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The [Change Password] button is disabled when leaving a textbox blank
    ...
    ...     Precondition:
    ...     - The user has signed into the Billing Portal
    ...     - The user is on the Profile screen and select Change your password button
    ...
    ...     Test Steps:
    ...     - 1. Leave [Your Current Password]  blank
    ...     - 2. Enter any text into [Your New Password] textbox
    ...     - 3. Enter any text into [Confirm Your New Password] textbox
    ...     - 2. Click on [Change password] button
    ...
    ...     Expected Results:
    ...     - 1. The [Change password] button is disabled

    [Tags]  BLP-AUTH-CHANGEPASSWORD-09      BP-SRS-01-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-AUTH-CHANGEPASSWORD-10: Leave the [Your New Password] textbox blank
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The [Change Password] button is disabled when leaving a textbox blank
    ...
    ...     Precondition:
    ...     - The user has signed into the Billing Portal
    ...     - The user is on the Profile screen and select Change your password button
    ...
    ...     Test Steps:
    ...     - 1. Enter any text into [Your Current Password] textbox
    ...     - 2. Leave the [Your New Password] textbox blank
    ...     - 3. Enter any text into [Confirm Your New Password] textbox
    ...     - 4. Click on [Change password] button
    ...
    ...     Expected Results:
    ...     - 1. The [Change password] button is disabled

    [Tags]  BLP-AUTH-CHANGEPASSWORD-10      BP-SRS-01-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-AUTH-CHANGEPASSWORD-11: Leave the [Confirm Your New Password] textbox blank
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The [Change Password] button is disabled when leaving a textbox blank
    ...
    ...     Precondition:
    ...     - The user has signed into the Billing Portal
    ...     - The user is on the Profile screen and select Change your password button
    ...
    ...     Test Steps:
    ...     - 1. Enter any text into [Your New Passworrd] textbox
    ...     - 2. Leave the [Your New Password] textbox blank
    ...     - 3. Leave the [Confirm Your New Password] textbox blank
    ...     - 4. Click on [Change password] button
    ...
    ...     Expected Results:
    ...     - 1. The [Change password] button is disabled

    [Tags]  BLP-AUTH-CHANGEPASSWORD-11      BP-SRS-01-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-AUTH-CHANGEPASSWORD-12: Cannot change password of user that logged in through Admin portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: Cannot change password of user that logged in through Admin portal
    ...
    ...     Precondition:
    ...     - The user has signed into the Billing Portal through Admin portal
    ...
    ...     Test Steps:
    ...     - 1. Go to Profile screen and observe Your Profile screen
    ...
    ...     Expected Results:
    ...     - There is no Change your password button on the screen

    [Tags]  BLP-AUTH-CHANGEPASSWORD-12      BP-SRS-01-FBS-04    manual      BP-1.2.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-AUTH-CHANGEPASSWORD-13: Cannot change password of user that logged in through Sale portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: Cannot change password of user that logged in through Sale portal
    ...
    ...     Precondition:
    ...     - The user has signed into the Billing Portal through Sale portal
    ...
    ...     Test Steps:
    ...     - 1. Go to Profile screen and observe Your Profile screen
    ...
    ...     Expected Results:
    ...     - There is no Change your password button on the screen

    [Tags]  BLP-AUTH-CHANGEPASSWORD-13      BP-SRS-01-FBS-04    manual      BP-1.2.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_billing_portal/lib/web/Common.py      ${BROWSER_NODE}      ${ENV}
    ${VERSION}           Navigate To Sign In Page
    Set Suite Metadata    browser       ${BROWSER.capitalize()}
    Set Suite Metadata    version       ${VERSION}

SUITE TEARDOWN
    Quit Browser
