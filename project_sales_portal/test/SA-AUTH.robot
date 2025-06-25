*** Settings ***
Documentation   Test Suite - Sales Portal - Authentication
Metadata    sid    SA-AUTH
Metadata    owner   Linh Phan
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_services_and_distribution_portal/lib/ConfigHandler.py   ${ENV}

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags     SA-AUTH     web
Test Timeout    1h

*** Test Cases ***

SA-AUTH-SIGNIN-01: Sign in with a valid username and valid password of the Sales Admin, SM, SR
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Sign in with a valid username and valid password of the Sales Admin, SM, SR
    ...
    ...     Precondition:
    ...     - The user is on the Login page 
    ...
    ...     Test Steps:
    ...     1. Enter valid username into [Username] textbox
    ...     2. Enter valid password into [Password] textbox
    ...     3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     1. Login successfully
    ...     2. The full name will be displayed

    [Tags]  SA-AUTH-SIGNIN-01      BP-SRS-01-FBS-01    R1    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-AUTH-SIGNIN-03: Sign in with a valid username and an invalid password
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can not sign in to the Sales portal with a valid username and an invalid password
    ...
    ...     Precondition:
    ...     - The user is on the Login page of Sales portal
    ...
    ...     Test Steps:
    ...     1. Enter valid username into [Username] textbox
    ...     2. Enter invalid password into [Password] textbox
    ...     3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     1. The user can not log in to Sales portal
    ...     2. The user stays on Sign in page
    ...     3. The error message “Invalid username/password” shall be displayed

    [Tags]    SA-AUTH-SIGNIN-03      BP-SRS-01-FBS-01    manual    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-AUTH-SIGNIN-04: Sign in with an invalid username and a valid password
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can not sign in to the Sales portal with an invalid username and a valid password
    ...
    ...     Precondition:
    ...     - The user is on the Login page of Sales portal
    ...
    ...     Test Steps:
    ...     1. Enter an invalid username into [Username] textbox
    ...     2. Enter a valid password into [Password] textbox
    ...     3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     1. The user can not log in to Sales portal
    ...     2. The user stays on Sign in page
    ...     3. The erro message “Invalid username/password” shall be displayed

    [Tags]    SA-AUTH-SIGNIN-04     BP-SRS-01-FBS-01    manual    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-AUTH-SIGNIN-05: Sign in with an invalid username and an invalid password
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can not sign in to the Sales portal with a valid username and an invalid password
    ...
    ...     Precondition:
    ...     - The user is on the Login page of Sales portal
    ...
    ...     Test Steps:
    ...     1. Enter invalid username into [Username] textbox
    ...     2. Enter invalid password into [Password] textbox
    ...     3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     1. The user can not log in to Sales portal
    ...     2. The user is on Sign in page
    ...     3. The erro message “Invalid username/password” shall be displayed

    [Tags]    SA-AUTH-SIGNIN-05      BP-SRS-01-FBS-01    manual    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-AUTH-SIGNIN-06: Sign out from the portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can sign out from the portal
    ...
    ...     Precondition:
    ...     - The user has signed into the Sales portal
    ...
    ...     Test Steps:
    ...     1. Click on the User's name
    ...     2. Click [Sign out] button
    ...
    ...     Expected Results:
    ...     1. The user can sign out successfully
    ...     2. The user is on Sign in page

    [Tags]    SA-AUTH-SIGNIN-06    BP-SRS-01-FBS-02    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_services_and_distribution_portal/lib/web/Common.py     ${BROWSER_NODE}       ${ENV}
    ${VERSION}           Navigate To SD Portal Page
    Set Suite Metadata   version    ${VERSION}
    Set Suite Metadata   browser    ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser