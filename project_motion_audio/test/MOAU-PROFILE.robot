*** Settings ***
Documentation   Motion Audio Authen test suite
Metadata    sid     MOAU-PROFILE
Metadata    owner   Nang Phung
Library     corelib/AssertionExtension.py
#Library     corelib/MobileMOAUpHandler.py                ${DESIRED_CMOAUS}
#Library     project_motion_audio/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      MOAU-PROFILE   mapp
Test Timeout    1h

*** Test Cases ***
MOAU-PROFILE-01: User can view their profile details
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can view their profile details after logging in.
    ...    Precondition:
    ...    - The user has logged in successfully.
    ...    Steps:
    ...    1. Tap on the "Profile" tab.
    ...    Expected Results:
    ...    1. The Profile screen displays the user's full name, email, and country.
    [Tags]    MOAU-PROFILE-01  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-PROFILE-02: User can navigate to the Edit Profile screen
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can navigate to the Edit Profile screen.
    ...    Precondition:
    ...    - The user is on the Profile screen.
    ...    Steps:
    ...    1. Tap on the "Edit profile" button.
    ...    Expected Results:
    ...    1. The user is navigated to the Edit Profile screen.
    [Tags]    MOAU-PROFILE-02  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-PROFILE-03: User can edit profile details successfully
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can edit their profile details and save the changes.
    ...    Precondition:
    ...    - The user is on the Edit Profile screen.
    ...    Steps:
    ...    1. Edit the user's First Name, Last Name, or Country fields.
    ...    2. Tap on the "Save changes" button.
    ...    Expected Results:
    ...    1. The system validates the entered fields and displays error messages if any.
    ...    2. If all fields meet the criteria, the changes are saved, and the user is navigated back to the Profile screen.
    [Tags]    MOAU-PROFILE-03  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-PROFILE-04: User can navigate to the Change Password screen
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can navigate to the Change Password screen.
    ...    Precondition:
    ...    - The user is on the Profile screen.
    ...    Steps:
    ...    1. Tap on the "Change password" button.
    ...    Expected Results:
    ...    1. The user is navigated to the Change Password screen.
    [Tags]    MOAU-PROFILE-04  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-PROFILE-05: User can change their password successfully
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can change their password and save the changes.
    ...    Precondition:
    ...    - The user is on the Change Password screen.
    ...    Steps:
    ...    1. Enter the new password and confirm it.
    ...    2. Tap on the "Save changes" button.
    ...    Expected Results:
    ...    1. The system validates the entered fields and displays error messages if any.
    ...    2. If all fields meet the criteria, the new password is saved, and the user is navigated back to the Profile screen.
    [Tags]    MOAU-PROFILE-05  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-PROFILE-06: User can navigate to the Sign Out option
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can navigate to the Sign Out option from the Profile screen.
    ...    Precondition:
    ...    - The user is on the Profile screen.
    ...    Steps:
    ...    1. Tap on the "Sign out" button.
    ...    Expected Results:
    ...    1. The user is signed out and redirected to the login screen.
    [Tags]    MOAU-PROFILE-06  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-PROFILE-07: App retries connection automatically upon server disconnection
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the app automatically retries to connect to the server after losing connection.
    ...    Precondition:
    ...    - The user is using the SierraTeck app.
    ...    Steps:
    ...    1. Disconnect the server connection while the user is in the app.
    ...    Expected Results:
    ...    1. The app attempts to reconnect to the server until the connection is restored.
    [Tags]    MOAU-PROFILE-07  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-PROFILE-08: Settings and buttons are disabled on Device details screen when connection is lost
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that all settings and buttons on the Device details and settings screen are disabled when the server connection is lost.
    ...    Precondition:
    ...    - The user is using the SierraTeck app.
    ...    - The app loses connection to the server.
    ...    Steps:
    ...    1. Observe the Device details and settings screen when server connection is lost.
    ...    Expected Results:
    ...    1. All settings and buttons are disabled.
    [Tags]    MOAU-PROFILE-08  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-PROFILE-09: Alert message displayed on Device details screen during connection loss
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that an alert message “Server connection lost. We’re trying to reconnect…” is displayed at the top of the Device details and settings screen when the connection is lost.
    ...    Precondition:
    ...    - The user is using the SierraTeck app.
    ...    - The app loses connection to the server.
    ...    Steps:
    ...    1. Observe the top of the Device details and settings screen after losing connection.
    ...    Expected Results:
    ...    1. The alert message “Server connection lost. We’re trying to reconnect…” is displayed.
    [Tags]    MOAU-PROFILE-09  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-PROFILE-10: Profile editing features disabled on Profile screen during connection loss
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that Edit profile, Change password, and Delete account options are disabled on the Profile screen when the connection is lost.
    ...    Precondition:
    ...    - The user is using the SierraTeck app.
    ...    - The app loses connection to the server.
    ...    Steps:
    ...    1. Observe the Profile screen when the server connection is lost.
    ...    Expected Results:
    ...    1. Edit profile, Change password, and Delete account options are disabled.
    [Tags]    MOAU-PROFILE-10  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-PROFILE-11: User can sign out when connection to server is lost
    [Documentation]    Author: Nang Phung
    ...    Description: Verify that the user can still sign out of the app when the connection to the server is lost.
    ...    Precondition:
    ...    - The user is using the SierraTeck app.
    ...    - The app loses connection to the server.
    ...    Steps:
    ...    1. Attempt to sign out from the app after the server connection is lost.
    ...    Expected Results:
    ...    1. The user is able to sign out of the app successfully.
    [Tags]    MOAU-PROFILE-11  manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}
*** Keywords ***
SUITE SETUP
    ${MOAUP_NODE}     Get Device Node
    Import Library    project_motion_audio/lib/mMOAUp/Common.py     ${MOAUP_NODE}     ${ENV}
    Start Motion Audio
    ${USER}     Get Config Param    USER
    Sign In Motion Audio    email=${USER}[username]      password=${USER}[password]
    ${RELEASE_VERSION}     Get Release Version
    Set Suite Metadata     version     ${RELEASE_VERSION}

SUITE TEARDOWN
    Quit All
