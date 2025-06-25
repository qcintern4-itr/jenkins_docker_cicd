*** Settings ***
Documentation   Bioheart app Common test suite
Metadata    sid     BHA-COMMON
Metadata    owner   Linh Tran
Library     corelib/AssertionExtension.py

Force Tags      BHA-COMMON     mapp
Test Timeout    1h

*** Test Cases ***
BHA-COMMON-INSTALLAPP-01: Upgrade app to the newest version
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The app is installed on the phone
    ...     - The user is signed in app
    ...
    ...     Test Steps:
    ...    - Go to CH play (for Android) or App store (for iOS) and upgrade app to the newest version [for testing env; tester should also test this case]
    ...    - Open the app
    ...    - Re-test main features
    ...
    ...     Expected Output:
    ...    - Upgrade app to the newest version successfully and main features work normally
    [Tags]      BHA-COMMON-INSTALLAPP-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-COMMON-INSTALLAPP-02: Install app
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The app is not installed on the phone
    ...
    ...     Test Steps:
    ...    - Go to CH play (for Android) or App store (for iOS) and install app
    ...    - Open the app
    ...    - Sign in app or register new account then sign in app
    ...    - Re-test main features
    ...
    ...     Expected Output:
    ...    - Install and sign in app successfully
    [Tags]      BHA-COMMON-INSTALLAPP-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

