*** Settings ***
Documentation   Biocare cardiac app installation test suite
Metadata    sid     BCA-INSTALLAPP
Metadata    owner   Linh Tran
Library     corelib/AssertionExtension.py

Force Tags      BCA-INSTALLAPP      mapp
Test Timeout    1h

*** Test Cases ***
BCA-INSTALLAPP-01: Upgrade app to the newest version
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The app is installed on the phone
    ...     - The user is signed in app
    ...
    ...     Test Steps:
    ...    - 1. Go to CH play (for Android) or App store (for iOS) and upgrade app to the newest version [for testing env; tester should also test this case]
    ...    - 2. Open the app
    ...    - 3. Re-test main features
    ...
    ...     Expected Output:
    ...    - 1. Upgrade app to the newest version successfully
    ...    - 2. The app is opened
    ...    - 3. Main features work normally
    [Tags]      BCA-INSTALLAPP-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
