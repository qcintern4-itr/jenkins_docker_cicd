*** Settings ***
Documentation   Test Suite - Admin Portal - Authentication
Metadata    sid     AP-AUTH
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_admin_portal/lib/ConfigHandler.py     ${ENV}
#Library     project_admin_portal/lib/web/Common.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      AP-AUTH     web
Test Timeout    1h

*** Test Cases ***
AP-AUTH-SIGNIN-01: Sign in with valid username and password
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sign in to the portal with a valid username and password
    ...
    ...     Precondition:
    ...     - The user is on the Signin page of Admin portal
    ...
    ...     Test Steps:
    ...     - 1. Enter valid username into [Username] textbox
    ...     - 2. Enter valid password into [Password] textbox
    ...     - 3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     - 1. Sign in successfully
    ...     - 2. The user is landed on Devices page and In the Field tab is selected
    ...     - 3. The user's role and full name will be displayed on the top right of the website header
    [Tags]      AP-AUTH-SIGNIN-01       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
AP-AUTH-SIGNIN-02: Sign in with SSO
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can sign in to the portal with SSO
    ...
    ...     Precondition:
    ...     - The user is on the Signin page of Admin portal
    ...
    ...     Test Steps:
    ...     - 1. Click the Sign in with SSO button
    ...     - 2. Click the Sign in with Microsoft button
    ...     - 3. Enter valid account
    ...     - 4. Select the Admin Portal
    ...
    ...     Expected Results:
    ...     - 1. The user shall be navigated to Welcome screen
    ...     - 2. The user shall be navigated to Sign in screen
    ...     - 2. Login the SSO successfully and redirect to the Home ERP Portal
    ...     - 3. The user shall be naviagted the Admin Portal
    [Tags]      AP-AUTH-SIGNIN-02       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-AUTH-SIGNIN-03: Sign in with invalid username
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot sign in to the portal with an invalid username
    ...
    ...     Precondition:
    ...     - The user is on the Signin page of Admin portal
    ...
    ...     Test Steps:
    ...     - 1. Enter invalid username into [Username] textbox
    ...     - 2. Enter valid password into [Password] textbox
    ...     - 3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     - 1. Display an error message "Invalid username/password"
    ...     - 2. The user still stay on the Signin page
    [Tags]      AP-AUTH-SIGNIN-03       manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-AUTH-SIGNIN-04: Sign in with invalid password
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot sign in to the portal with an invalid password
    ...
    ...     Precondition:
    ...     - The user is on the Signin page of Admin portal
    ...
    ...     Test Steps:
    ...     - 1. Enter valid username into [Username] textbox
    ...     - 2. Enter invalid password into [Password] textbox
    ...     - 3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     - 1. Display an error message "Invalid username/password"
    ...     - 2. The user still stay on the Signin page
    [Tags]      AP-AUTH-SIGNIN-04       manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-AUTH-SIGNIN-05: Sign in with invalid password and password
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot sign in to the portal with an invalid username and password
    ...
    ...     Precondition:
    ...     - The user is on the Signin page of Admin portal
    ...
    ...     Test Steps:
    ...     - 1. Enter invalid username into [Username] textbox
    ...     - 2. Enter invalid password into [Password] textbox
    ...     - 3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     - 1. Display an error message "Invalid username/password"
    ...     - 2. The user still stay on the Signin page
    [Tags]      AP-AUTH-SIGNIN-05         manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-AUTH-SIGNIN-06: Sign in with valid username and password of a clinic user
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot sign in to the portal with a valid username and password of a clinic user
    ...
    ...     Precondition:
    ...     - The user is on the Signin page of Admin portal
    ...
    ...     Test Steps:
    ...     - 1. Enter valid username of a clinic user into [Username] textbox
    ...     - 2. Enter valid password of a clinic user into [Password] textbox
    ...     - 3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     - 1. Display an error message "Invalid username/password"
    ...     - 2. The user still stay on the Signin page
    [Tags]      AP-AUTH-SIGNIN-06       manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-AUTH-SIGNIN-07: Sign in with valid username and password of a call center user
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot sign in to the portal with a valid username and password of a call center user
    ...
    ...     Precondition:
    ...     - The user is on the Signin page of Admin portal
    ...
    ...     Test Steps:
    ...     - 1. Enter valid username of a call center user into [Username] textbox
    ...     - 2. Enter valid password of a call center user into [Password] textbox
    ...     - 3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     - 1. Display an error message "Invalid username/password"
    ...     - 2. The user still stay on the Signin page
    [Tags]      AP-AUTH-SIGNIN-07       manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-AUTH-SIGNIN-08: Sign in with valid username and password of a support user
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot sign in to the portal with a valid username and password of a support user
    ...
    ...     Precondition:
    ...     - The user is on the Signin page of Admin portal
    ...
    ...     Test Steps:
    ...     - 1. Enter valid username of a support staff into [Username] textbox
    ...     - 2. Enter valid password of a support staff into [Password] textbox
    ...     - 3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     - 1. Display an error message "Invalid username/password"
    ...     - 2. The user still stay on the Signin page
    [Tags]      AP-AUTH-SIGNIN-08       manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-AUTH-SIGNIN-09: Sign in with valid username and password of a sale user
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot sign in to the portal with a valid username and password of a sale user
    ...
    ...     Precondition:
    ...     - The user is on the Signin page of Admin portal
    ...
    ...     Test Steps:
    ...     - 1. Enter valid username of a sale user into [Username] textbox
    ...     - 2. Enter valid password of a sale user into [Password] textbox
    ...     - 3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     - 1. Display an error message "Invalid username/password"
    ...     - 2. The user still stay on the Signin page
    [Tags]      AP-AUTH-SIGNIN-09       manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-AUTH-SIGNIN-10: Sign in with valid username and password of a billing user
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot sign in to the portal with a valid username and password of a billing user
    ...
    ...     Precondition:
    ...     - The user is on the Signin page of Admin portal
    ...
    ...     Test Steps:
    ...     - 1. Enter valid username of a billing user into [Username] textbox
    ...     - 2. Enter valid password of a billing user into [Password] textbox
    ...     - 3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     - 1. Display an error message "Invalid username/password"
    ...     - 2. The user still stay on the Signin page
    [Tags]      AP-AUTH-SIGNIN-10       manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-AUTH-SIGNOUT-01: Sign out from the Admin portal (username/password)
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sign out from the Admin portal
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Avatar] button
    ...     - 2. Click [Sign out] button
    ...
    ...     Expected Results:
    ...     - 1. Sign out successfully
    ...     - 2. The user is navigated to the Signin page

    [Tags]      AP-AUTH-SIGNOUT-01       manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-AUTH-SIGNOUT-02: Sign out from the Admin portal (ERP)
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sign out from the Admin portal
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Avatar] button
    ...     - 2. Click [Sign out] button
    ...
    ...     Expected Results:
    ...     - 1. Sign out successfully
    ...     - 2. The user is navigated to the ERP Welcome screen

    [Tags]      AP-AUTH-SIGNOUT-02              manual       R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library      project_admin_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${VERSION}      Navigate To Admin Sign In Page
    Set Suite Metadata  version   ${VERSION}
    Set Suite Metadata  browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser
