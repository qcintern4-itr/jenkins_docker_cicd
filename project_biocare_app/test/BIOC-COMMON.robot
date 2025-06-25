*** Settings ***
Documentation   Biocare app Common test suite
Metadata    sid     BIOC-COMMON
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-COMMON     mapp
Test Timeout    1h

*** Test Cases ***
BIOC-COMMON-INSTALLAPP-01: Upgrade app to the newest version
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The app is installed on the phone
    ...     - The user is signed in app
    ...
    ...     Test Steps:
    ...     - Go to CH play (for Android) or App store (for iOS) and upgrade app to the newest version [for testing env; tester should also test this case]
    ...     - Open the app
    ...     - Re-test main features
    ...
    ...     Expected Output:
    ...     - Upgrade app to the newest version successfully and main features work normally
    [Tags]      BIOC-COMMON-INSTALLAPP-01      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-COMMON-INSTALLAPP-02: Install app
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The app is not installed on the phone
    ...
    ...     Test Steps:
    ...     - Go to CH play (for Android) or App store (for iOS) and install app
    ...     - Open the app
    ...     - Sign in app or register new account then sign in app
    ...     - Re-test main features
    ...
    ...     Expected Output:
    ...     - Install and sign in app successfully
    [Tags]      BIOC-COMMON-INSTALLAPP-02      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-COMMON-WHATSNEW-01: What's news popup when users install app in the 1st time
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - User has not installed app on the phone
    ...
    ...     Test Steps:
    ...     - Go to app store or CH play
    ...     - Install the app
    ...     - Register account
    ...     - Sign in app
    ...     - Open app
    ...
    ...     Expected Output:
    ...     - The Services update popup is displayed
    ...         + User can navigate to next screen by pressing on Next button or swiping left
    ...         + User can navigate back to previous screen by swiping right
    ...         + User can close popup by pressing close button or Got it button
    ...             * In case, this is program user, when closed the popup, daily input check-in question will display
    ...             * In case, this is normal user, when closed the popup, display Home screen
    [Tags]      BIOC-COMMON-WHATSNEW-01      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-COMMON-WHATSNEW-02: What's news popup when users upgrade app
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - User has not installed app on the phone
    ...     - The new version has what's news popup
    ...
    ...     Test Steps:
    ...     - Go to app store or CH play
    ...     - Upgrade app
    ...     - Sign in app (If signed in, skip this step)
    ...     - Open app
    ...
    ...     Expected Output:
    ...     - The Services update popup is displayed
    ...         + User can navigate to next screen by pressing on Next button or swiping left
    ...         + User can navigate back to previous screen by swiping right
    ...         + User can close popup by pressing close button or Got it button
    ...             * In case, this is program user
    ...                 o This is the 1s.t time, users open app in the day, when closed the popup, daily input check-in question will display
    ...                 o If user opened app before, when closed the popup, display Home screen
    ...             * In case, this is normal user, when closed the popup, display Home screen
    [Tags]      BIOC-COMMON-WHATSNEW-02      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-COMMON-WHATSNEW-03: What's news popup when pressing on any Biocare notification (push notification)
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is installed app on the phone
    ...     - The new version has what's news popup
    ...
    ...     Test Steps:
    ...     - Go to app store or CH play
    ...     - Upgrade app
    ...     - Sign in app (If signed in, skip this step)
    ...     - Press on any notification
    ...
    ...     Expected Output:
    ...     - Navigate to notification screen corresponding
    [Tags]      BIOC-COMMON-WHATSNEW-03      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${APP_NODE}     Get Device Node
    Import Library    project_biocare_app/lib/mapp/Common.py     ${APP_NODE}     ${ENV}
    Start Biocare App
    ${USER}     Get Config Param    USER
    Sign In Biocare App    email=${USER}[username]      password=${USER}[password]
    ${RELEASE_VERSION}     Get Release Version
    Set Suite Metadata     version     ${RELEASE_VERSION}

SUITE TEARDOWN
    Quit All
