*** Settings ***
Documentation   Bioheart app Onboarding test suite
Metadata    sid     BHA-ONBOARDING
Metadata    owner   Linh Tran
Library     corelib/AssertionExtension.py

Force Tags      BHA-ONBOARDING     mapp
Test Timeout    1h

*** Test Cases ***
BHA-ONBOARDING-01: View onboarding screen (only display in the 1st time user open the app)
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The app is installed in the phone
    ...
    ...     Test Steps:
    ...    - Open the app
    ...    - Press on Explore button
    ...
    ...     Expected Output:
    ...    - Navigate to Onboarding screen
    ...    - User can navigate to next/previous screen by pressing on Next/Back button
    ...    - Press on Get started button to navigate to Sign in screen
    ...    - User can skip onboarding screens by pressing Skip button
    [Tags]      BHA-ONBOARDING-01       BIOH-SRS-01-FRS-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}