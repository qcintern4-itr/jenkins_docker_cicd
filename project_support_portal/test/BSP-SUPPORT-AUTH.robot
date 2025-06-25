*** Settings ***
Documentation   Test Suite - Support Portal - Authentication
Metadata    sid    BSP-SUPPORT-AUTH
Metadata    owner   Linh Phan
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_support_portal/lib/ConfigHandler.py    ${ENV}

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags     BSP-SUPPORT-AUTH     web
Test Timeout    1h

*** Test Cases ***
BSP-SUPPORT-AUTH-SIGNIN-01: Sign in with a valid username and valid password of the Support Staff
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can sign in to the Support portal with a valid username and password
    ...
    ...     Precondition:
    ...     - The user is on the Login page of Support portal
    ...
    ...     Test Steps:
    ...     1. Enter valid username into [Username] textbox
    ...     2. Enter valid password into [Password] textbox
    ...     3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     1. Login successfully
    ...     2. The user is landed on RMA request page,
    ...     3. The full name will be displayed

    [Tags]  BSP-SUPPORT-AUTH-SIGNIN-01      BP-SRS-01-FBS-01    manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-AUTH-SIGNIN-02: Sign in with a valid username and an invalid password of a Support Staff
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can not sign in to the Support portal with a valid username and an invalid password
    ...
    ...     Precondition:
    ...     - The user is on the Login page of Support portal
    ...
    ...     Test Steps:
    ...     1. Enter valid username into [Username] textbox
    ...     2. Enter invalid password into [Password] textbox
    ...     3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     1. The user can not log in to Support portal
    ...     2. The user stays on Sign in page
    ...     3. The error message “Invalid username/password” shall be displayed

    [Tags]    BSP-SUPPORT-AUTH-SIGNIN-02      BP-SRS-01-FBS-01    manual    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-AUTH-SIGNIN-03: Sign in with an invalid username and a valid password of Support user
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can not sign in to the Support portal with an invalid username and a valid password
    ...
    ...     Precondition:
    ...     - The user is on the Login page of Support portal
    ...
    ...     Test Steps:
    ...     1. Enter an invalid username into [Username] textbox
    ...     2. Enter a valid password into [Password] textbox
    ...     3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     1. The user can not log in to Support portal
    ...     2. The user stays on Sign in page
    ...     3. The erro message “Invalid username/password” shall be displayed

    [Tags]    BSP-SUPPORT-AUTH-SIGNIN-03     BP-SRS-01-FBS-01    manual    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-AUTH-SIGNIN-04: Sign in with an invalid username and an invalid password of Support user
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can not sign in to the Support portal with a valid username and an invalid password
    ...
    ...     Precondition:
    ...     - The user is on the Login page of Support portal
    ...
    ...     Test Steps:
    ...     1. Enter invalid username into [Username] textbox
    ...     2. Enter invalid password into [Password] textbox
    ...     3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     1. The user can not log in to Support portal
    ...     2. The user is on Sign in page
    ...     3. The erro message “Invalid username/password” shall be displayed

    [Tags]    BSP-SUPPORT-AUTH-SIGNIN-04      BP-SRS-01-FBS-01    manual    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-AUTH-SIGNIN-05: Sign out from the portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can sign out from the portal
    ...
    ...     Precondition:
    ...     - The user has signed into the Support Portal
    ...
    ...     Test Steps:
    ...     1. Click on the User's name
    ...     2. Click [Sign out] button
    ...
    ...     Expected Results:
    ...     1. The user can sign out successfully
    ...     2. The user is on Sign in page

    [Tags]    BSP-SUPPORT-AUTH-SIGNIN-05    BP-SRS-01-FBS-02    manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_support_portal/lib/web/Common.py     ${BROWSER_NODE}       ${ENV}
    ${VERSION}           Navigate To Support Portal Page
    Set Suite Metadata   version    ${VERSION}
    Set Suite Metadata   browser    ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser
