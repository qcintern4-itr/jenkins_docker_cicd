*** Settings ***
Documentation   Test Suite - Call Center Authentication
Metadata    sid     BFCC-AUTH
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_callcenter_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_callcenter_portal/lib/web/Common.py
Library     project_bioflux_callcenter_portal/lib/web/Reports.py
Library     project_bioflux_callcenter_portal/lib/web/Task.py

Suite Setup         SUITE SETUP
Suite Teardown      SUITE TEARDOWN
Force Tags          BFCC-AUTH   web
Test Timeout        1h

*** Test Cases ***
BFCC-AUTH-SIGNIN-01: Sign in to Call Center Technician portal with valid username and password
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sign in to the Call Center Technician portal with a valid username and password
    ...
    ...     Precondition:
    ...     - The user is on the Signin page of Bioflux portal
    ...
    ...     Test Steps:
    ...     1. Enter valid username of Call Center Technician role into [Username] textbox
    ...     2. Enter valid password of Call Center Technician role into [Password] textbox
    ...     3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     1. Sign in successfully
    ...     2. The user is landed on Reports page and Pending-Interim reports tab is selected
    ...
    [Tags]      BFCC-AUTH-SIGNIN-01     auto
    Sign In Callcenter      username=${CCT_USER}[username]      password=${CCT_USER}[password]
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     REPORTS
    ${list}     Get Reports Current Filter Values
    Run Keyword And Continue On Failure  Should Be Equal  ${list}[Report State]     Pending
    Run Keyword And Continue On Failure  Should Contain   ${list}[Report Type]      Interim reports
    [Teardown]    Sign Out Callcenter

BFCC-AUTH-SIGNIN-02: Sign in to Call Center QA portal with valid username and password
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sign in to the Call Center QA portal with a valid username and password
    ...
    ...     Precondition:
    ...     - The user is on the Signin page of Bioflux portal
    ...
    ...     Test Steps:
    ...     1. Enter valid username of Call Center QA role into [Username] textbox
    ...     2. Enter valid password of Call Center QA role into [Password] textbox
    ...     3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     1. Sign in successfully
    ...     2. The user is landed on Reports page and Ready-Notification reports tab is selected
    ...
    [Tags]      BFCC-AUTH-SIGNIN-02     auto
    Sign In Callcenter      username=${CCQA_USER}[username]      password=${CCQA_USER}[password]
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     REPORTS
    ${list}     Get Reports Current Filter Values
    Run Keyword And Continue On Failure     Should Be Equal     ${list}[Report State]       Ready
    Run Keyword And Continue On Failure     Should Contain     ${list}[Report Type]       Notification reports
    [Teardown]    Sign Out Callcenter

BFCC-AUTH-SIGNIN-03: Sign in to Call Center QA Leader portal with valid username and password
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sign in to the Call Center QA Leader portal with a valid username and password
    ...
    ...     Precondition:
    ...     - The user is on the Signin page of Bioflux portal
    ...
    ...     Test Steps:
    ...     1. Enter valid username of Call Center QA Leader role into [Username] textbox
    ...     2. Enter valid password of Call Center QA Leader role into [Password] textbox
    ...     3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     1. Sign in successfully
    ...     2. The user is landed on Task page and Unassigned-Notification reports tab is selected
    ...
    [Tags]      BFCC-AUTH-SIGNIN-03     auto
    Sign In Callcenter      username=${CCQAL_USER}[username]      password=${CCQAL_USER}[password]
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     TASK
    ${list}     Get Task Current Filter Values
    Run Keyword And Continue On Failure     Should Be Equal     ${list}[Task Type]       Unassigned
    Run Keyword And Continue On Failure     Should Contain     ${list}[Report Type]       Notification reports
    [Teardown]    Sign Out Callcenter

BFCC-AUTH-SIGNIN-04: Sign in to Call Center Supervisor portal with valid username and password
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sign in to the Call Center Supervisor portal with a valid username and password
    ...
    ...     Precondition:
    ...     - The user is on the Signin page of Bioflux portal
    ...
    ...     Test Steps:
    ...     1. Enter valid username of Call Center Supervisor role into [Username] textbox
    ...     2. Enter valid password of Call Center Supervisor role into [Password] textbox
    ...     3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     1. Sign in successfully
    ...     2. The user is landed on Task page and Overview tab is selected
    ...
    [Tags]      BFCC-AUTH-SIGNIN-04     auto
    Sign In Callcenter      username=${CCS_USER}[username]      password=${CCS_USER}[password]
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     TASK
    ${list}     Get Task Current Filter Values
    Run Keyword And Continue On Failure     Should Contain     ${list}[Task Type]       Overview
    [Teardown]    Sign Out Callcenter

BFCC-AUTH-SIGNIN-05: Sign in with valid username and invalid password
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot sign in to the portal with a valid username and invalid password
    ...
    ...     Precondition:
    ...     - The user is on the Signin page of Call Center portal
    ...
    ...     Test Steps:
    ...     1. Enter valid username of a Call center user into [Username] textbox
    ...     2. Enter invalid password into [Password] textbox
    ...     3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     1. Display an error message "Invalid username/password"
    ...     2. The user still stay on the Signin page
    [Tags]      BFCC-AUTH-SIGNIN-05     auto
    ${error_msg}    Sign In Callcenter       username=${CCT_USER}[username]    password=fake_password
    Run Keyword And Continue On Failure     Should Be Equal     ${error_msg}    Invalid username/password

BFCC-AUTH-SIGNIN-06: Sign in with invalid username/password
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot sign in to the portal with invalid username/password
    ...
    ...     Precondition:
    ...     - The user is on the Signin page of Bioflux portal
    ...
    ...     Test Steps:
    ...     1. Enter invalid username into [Username] textbox
    ...     2. Enter invalid password into [Password] textbox
    ...     3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     1. Display an error message "Invalid username/password"
    ...     2. The user still stay on the Signin page
    [Tags]      BFCC-AUTH-SIGNIN-06     auto
    ${error_msg}    Sign In Callcenter       username=fake_username    password=fake_password
    Run Keyword And Continue On Failure     Should Be Equal     ${error_msg}    Invalid username/password

BFCC-AUTH-SIGNIN-07: Sign in to Call Center Technician portal with SSO
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     **Others**
    ...     Update date: 8/18/2023 - Nhan Nguyen
    ...
    [Tags]      BFCC-AUTH-SIGNIN-07     manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AUTH-SIGNIN-08: Sign in to Call Center QA portal with SSO
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     **Others**
    ...     Update date: 8/18/2023 - Nhan Nguyen
    ...
    [Tags]      BFCC-AUTH-SIGNIN-08     manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AUTH-SIGNIN-09: Sign in to Call Center QA Leader portal with SSO
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     **Others**
    ...     Update date: 8/18/2023 - Nhan Nguyen
    ...
    [Tags]      BFCC-AUTH-SIGNIN-09     manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AUTH-SIGNIN-10: Sign in to Call Center Supervisor portal with SSO
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     **Others**
    ...     Update date: 8/18/2023 - Nhan Nguyen
    ...
    [Tags]      BFCC-AUTH-SIGNIN-10     manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AUTH-SIGNOUT-01: Sign out from the Call Center Technician portal (logged by username before)
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sign out from the Call Center Technician portal
    ...
    ...     Precondition: The user has signed in to the Call Center Technician portal
    ...
    ...     Test Steps:
    ...     1. Click [Avatar] button
    ...     2. Click [Sign out] button
    ...
    ...     Expected Results:
    ...     1. Sign out successfully
    ...     2. The user is navigated to the Signin page

    [Tags]      BFCC-AUTH-SIGNOUT-01        auto
    Sign In Callcenter      username=${CCT_USER}[username]      password=${CCT_USER}[password]
    Sign Out Callcenter
    ${state_url}      Wait Url Contains    text=/login
    Run Keyword And Continue On Failure    Should Be Equal    ${state_url}       ${True}

BFCC-AUTH-SIGNOUT-02: Sign out from the Call Center QA portal (logged by username before)
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sign out from the Call Center QA portal
    ...
    ...     Precondition: The user has signed in to the Call Center QA portal
    ...
    ...     Test Steps:
    ...     1. Click [Avatar] button
    ...     2. Click [Sign out] button
    ...
    ...     Expected Results:
    ...     1. Sign out successfully
    ...     2. The user is navigated to the Signin page

    [Tags]      BFCC-AUTH-SIGNOUT-02        auto
    Sign In Callcenter      username=${CCQA_USER}[username]      password=${CCQA_USER}[password]
    Sign Out Callcenter
    ${state_url}      Wait Url Contains    text=/login
    Run Keyword And Continue On Failure    Should Be Equal    ${state_url}       ${True}

BFCC-AUTH-SIGNOUT-03: Sign out from the Call Center QA Leader portal (logged by username before)
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sign out from the Call Center QA Leader portal
    ...
    ...     Precondition: The user has signed in to the Call Center QA Leader portal
    ...
    ...     Test Steps:
    ...     1. Click [Avatar] button
    ...     2. Click [Sign out] button
    ...
    ...     Expected Results:
    ...     1. Sign out successfully
    ...     2. The user is navigated to the Signin page

    [Tags]      BFCC-AUTH-SIGNOUT-03        auto
    Sign In Callcenter      username=${CCQAL_USER}[username]      password=${CCQAL_USER}[password]
    Sign Out Callcenter
    ${state_url}      Wait Url Contains    text=/login
    Run Keyword And Continue On Failure    Should Be Equal    ${state_url}       ${True}

BFCC-AUTH-SIGNOUT-04: Sign out from the Call Center Supervisor portal (logged by username before)
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sign out from the Call Center Supervisor portal
    ...
    ...     Precondition: The user has signed in to the Call Center Supervisor portal
    ...
    ...     Test Steps:
    ...     1. Click [Avatar] button
    ...     2. Click [Sign out] button
    ...
    ...     Expected Results:
    ...     1. Sign out successfully
    ...     2. The user is navigated to the Signin page

    [Tags]      BFCC-AUTH-SIGNOUT-04        auto
    Sign In Callcenter      username=${CCS_USER}[username]      password=${CCS_USER}[password]
    Sign Out Callcenter
    ${state_url}      Wait Url Contains    text=/login
    Run Keyword And Continue On Failure    Should Be Equal    ${state_url}       ${True}

BFCC-AUTH-SIGNOUT-05: Sign out from the Call Center Technician portal (logged by SSO before)
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     **Others**
    ...     Update date: 8/18/2023 - Nhan Nguyen
    ...

    [Tags]      BFCC-AUTH-SIGNOUT-05    manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AUTH-SIGNOUT-06: Sign out from the Call Center QA portal (logged by SSO before)
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     **Others**
    ...     Update date: 8/18/2023 - Nhan Nguyen
    ...

    [Tags]      BFCC-AUTH-SIGNOUT-06    manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AUTH-SIGNOUT-07: Sign out from the Call Center QA Leader portal (logged by SSO before)
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     **Others**
    ...     Update date: 8/18/2023 - Nhan Nguyen
    ...

    [Tags]      BFCC-AUTH-SIGNOUT-07    manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AUTH-SIGNOUT-08: Sign out from the Call Center Supervisor portal (logged by SSO before)
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     **Others**
    ...     Update date: 8/18/2023 - Nhan Nguyen
    ...

    [Tags]      BFCC-AUTH-SIGNOUT-08    manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AUTH-SIGNOUT-09: CCT-Call Center Technician is not permitted to login in to 2 browsers at the same time (logged by username before)
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Call Center Technician is not permitted to login in to 2 browsers at the same time.
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user log in to CCT portal on browser 1 (by user A)
    ...     2. The user log in to CCT portal on browser 2 (by user A)
    ...     3. Observe behavior on browser 1
    ...
    ...     Expected Results:
    ...     The user on browser 1 shall be auto-logged out from portal
    ...
    ...     **Others**
    ...     Update date: 8/18/2023 - Nhan Nguyen
    ...

    [Tags]      BFCC-AUTH-SIGNOUT-09    manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AUTH-SIGNOUT-10: Auto-sign out from the Call Center portal when the user is removed from Call Center group
    [Documentation]     Author: Nhan Nguyen
    ...     Test Steps:
    ...     1. The user log in to CC portal
    ...     2. Admin remove this user from Call Center group
    ...     3. Observe the behavior in step 1
    ...
    ...     Expected Results:
    ...     1. The user shall be auto-logged out from portal
    ...     2. When he or she logs in again, all the data are clear and a message stating: “ There is no data to display” shall be displayed
    ...
    ...     **Others**
    ...     Update date: 8/18/2023 - Nhan Nguyen
    ...

    [Tags]      BFCC-AUTH-SIGNOUT-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AUTH-CHANGEPASSWORD-01: User can Access to 'Change Password' Feature on Portals
    [Documentation]     Author: Tam Ho
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user log in to CC portal
    ...     2. Click [Avatar] button
    ...     2. Click [Change your password] button
    ...
    ...     Expected Results:
    ...     1. The "Change Password" option is available on portals
    ...     2. Clicking on the option navigates the user to the "Change Password" modal
    ...

    [Tags]      BFCC-AUTH-CHANGEPASSWORD-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCC-AUTH-CHANGEPASSWORD-02: User Can Change Password with Valid Information
    [Documentation]     Author: Tam Ho
    ...     Description:
    ...
    ...     Precondition:
    ...     1. The user is logged into the Call Center portal
    ...     2. The user is on the "Change Password" modal
    ...
    ...     Test Steps:
    ...     1. Enter a valid "Current Password" that matches the user's existing password
    ...     2. Enter a "New Password": has at least 8 characters, is different from the "Current Password"
    ...     3. Re-enter the same "New Password" in the "Confirm Password" field
    ...     4. Click the "Change password" button
    ...
    ...     Expected Results:
    ...     1. The password is successfully updated
    ...     2. The user is logged out of the portal
    ...     3. The user can log in again using the new password
    ...

    [Tags]      BFCC-AUTH-CHANGEPASSWORD-02        auto
    [Template]    Change Password - All Role    
    &{CCT_USER}
    &{CCQA_USER}
    &{CCQAL_USER}
    &{CCS_USER}

BFCC-AUTH-CHANGEPASSWORD-03: Verify Required Fields Validation
    [Documentation]     Author: Tam Ho
    ...     Description:
    ...
    ...     Precondition:
    ...     1. User is on the "Change Password" screen
    ...
    ...     Test Steps:
    ...     1. Leave "Current Password," "New Password," or "Confirm Password" fields empty
    ...     2. Click the "Change password" button
    ...
    ...     Expected Results:
    ...     1. Error messages are displayed for each empty field:
    ...        "Please enter your Current Password."
    ...        "Please enter your New Password."
    ...        "Please enter your Confirm Password."
    ...

    [Tags]      BFCC-AUTH-CHANGEPASSWORD-03        auto
    Sign In Callcenter      username=${CCT_USER}[username]      password=${CCT_USER}[password]
    Change Password Callcenter    oldpassword=${EMPTY}    newpassword=${EMPTY}    confirmpassword=${EMPTY}

    ${old_msg}    Get Text Error Message Old Password
    ${new_msg}    Get Text Error Message New Password
    ${confirm_msg}   Get Text Error Message Confirm Password
    Run Keyword And Continue On Failure    Should Be Equal       ${old_msg}    Please enter your current password
    Run Keyword And Continue On Failure    Should Be Equal     ${new_msg}    Please enter your new password
    Run Keyword And Continue On Failure    Should Be Equal     ${confirm_msg}    Please enter your new password again
    Close Change Password Modal

BFCC-AUTH-CHANGEPASSWORD-04: Verify Minimum Length Validation for New Password
    [Documentation]     Author: Tam Ho
    ...     Description:
    ...
    ...     Precondition:
    ...     1. User is on the "Change Password" screen
    ...
    ...     Test Steps:
    ...     1. Enter a "New Password" with fewer than 8 characters
    ...     2. Click the "Change password" button
    ...
    ...     Expected Results:
    ...     1. Error message: "Your password must be at least 8 characters"
    ...

    [Tags]      BFCC-AUTH-CHANGEPASSWORD-04        auto
    Change Password Callcenter    oldpassword=${CCT_USER}[password]    newpassword=1234    confirmpassword=1234
    ${new_msg}    Get Text Error Message New Password
    Run Keyword And Continue On Failure    Should Be Equal     ${new_msg}    Your password must be at least 8 characters
    Close Change Password Modal

BFCC-AUTH-CHANGEPASSWORD-05: Verify New Password Matches Confirm Password
    [Documentation]     Author: Tam Ho
    ...     Description:
    ...
    ...     Precondition:
    ...     1. User is on the "Change Password" screen
    ...
    ...     Test Steps:
    ...     1. Enter mismatched values in "New Password" and "Confirm Password" fields
    ...     2. Click the "Change password" button
    ...
    ...     Expected Results:
    ...     1. Error message: "New password and confirm password do not match."
    ...
     [Tags]      BFCC-AUTH-CHANGEPASSWORD-05        auto
    Change Password Callcenter    oldpassword=${CCT_USER}[password]    newpassword=12345678    confirmpassword=123456789
    ${confirm_msg}   Get Text Error Message Confirm Password
    Run Keyword And Continue On Failure    Should Be Equal     ${confirm_msg}    New password and confirm password do not match
    Close Change Password Modal


BFCC-AUTH-CHANGEPASSWORD-06: Validate Incorrect Current Password
    [Documentation]     Author: Tam Ho
    ...     Description:
    ...
    ...     Precondition:
    ...     1. User is on the "Change Password" screen
    ...
    ...     Test Steps:
    ...     1. Enter an incorrect "Current Password."
    ...     2. Click the "Change password" button
    ...
    ...     Expected Results:
    ...     1. Error message: "Incorrect password."
    ...

    [Tags]      BFCC-AUTH-CHANGEPASSWORD-06        auto
    Change Password Callcenter    oldpassword=12345678    newpassword=123456789    confirmpassword=123456789
    ${old_msg}   Get Text Error Message Old Password
    Run Keyword And Continue On Failure    Should Be Equal     ${old_msg}    Incorrect password
    Close Change Password Modal

BFCC-AUTH-CHANGEPASSWORD-07: Verify Current and New Passwords Are Different
    [Documentation]     Author: Tam Ho
    ...     Description:
    ...
    ...     Precondition:
    ...     1. User is on the "Change Password" screen
    ...
    ...     Test Steps:
    ...     1. Enter the same value in the "Current Password" and "New Password" fields
    ...     2. Click the "Change password" button
    ...
    ...     Expected Results:
    ...     1. Error message: "New password must be different from the current password."
    ...
     [Tags]      BFCC-AUTH-CHANGEPASSWORD-07        auto
    Change Password Callcenter    oldpassword=${CCT_USER}[password]    newpassword=${CCT_USER}[password]    confirmpassword=${CCT_USER}[password]
    ${new_msg}    Get Text Error Message New Password
    Run Keyword And Continue On Failure    Should Be Equal     ${new_msg}    The new password must be different from the current password
    Close Change Password Modal

BFCC-AUTH-CHANGEPASSWORD-08: User Is Logged Out and Forced to Change Password After Admin Resets Password
    [Documentation]     Author: Tam Ho
    ...     Description:
    ...
    ...     Precondition:
    ...     1. Admin Reset Password
    ...
    ...     Test Steps:
    ...     1. Log in CC Portal with new password (2@2@[username]100)
    ...
    ...     Expected Results:
    ...     1. Error message: "New passworThe login is successful
    ...     2. The system redirects the user to a "Change Password" modal
    ...

    [Tags]      BFCC-AUTH-CHANGEPASSWORD-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_callcenter_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/Reports.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/Task.py       ${BROWSER_NODE}     ${ENV}
    ${RELEASE_VERSION}   Navigate To Callcenter Sign In Page
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}
    ${CCT_USER}    Get Config Param       USERS > callcenter_technician
    ${CCQA_USER}     Get Config Param       USERS > callcenter_qa
    ${CCQAL_USER}   Get Config Param       USERS > callcenter_qalead
    ${CCS_USER}   Get Config Param       USERS > callcenter_supervisor
    Set Suite Variable    ${CCT_USER}
    Set Suite Variable    ${CCQA_USER}
    Set Suite Variable    ${CCQAL_USER}
    Set Suite Variable    ${CCS_USER}

SUITE TEARDOWN
    Quit Browser

Change Password - All role
    [Arguments]    &{account}
    Sign In Callcenter      username=${account}[username]      password=${account}[password]
    ${TEMP_PASSWORD}    Set Variable    4#Monitoring4#
    Change Password Callcenter    oldpassword=${account}[password]    newpassword=${TEMP_PASSWORD}    confirmpassword=${TEMP_PASSWORD}
    ${state_url}      Wait Url Contains    text=/login
    Run Keyword And Continue On Failure    Should Be Equal    ${state_url}       ${True}
    Sign In Callcenter      username=${account}[username]      password=${TEMP_PASSWORD}
    Change Password Callcenter    oldpassword=${TEMP_PASSWORD}    newpassword=${account}[password]    confirmpassword=${account}[password]
    Run Keyword And Continue On Failure    Should Be Equal    ${state_url}       ${True}