*** Settings ***
Documentation   Bioheart app Support test suite
Metadata    sid     BHA-HELPCENTER
Metadata    owner   Linh Tran
Library     corelib/AssertionExtension.py

Force Tags      BHA-HELPCENTER        mapp
Test Timeout    1h

*** Test Cases ***
BHA-HELPCENTER-01: Floating Help center
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Summary screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...
    ...     Expected Output:
    ...    - User shall have 4 options to view guide
    ...         + Center button: navigate to the Center guide screen. Press back shall navigate user to the previous screen.
    ...         + Historical data: navigate to the Heart rate data screen. Press back shall navigate user to the previous screen.
    ...         + Status lights: navigate to the status light guide guide screen. Press back shall navigate user to the previous screen.
    ...         + FAQs: navigate to the FAQs screen. Press back shall navigate user to the previous screen.
    ...         + Tapping on the same button shall collapse the 4 options
    [Tags]     BHA-HELPCENTER-01        BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-HELPCENTER-SUMMARY-01: View Center button support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Summary screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on Center button item
    ...
    ...     Expected Output:
    ...    - Navigate to Center button guide
    ...    - User can navigate back to previous screen by pressed on back button
    ...    - User can move to next/previous step by swiping left/right on the screen
    [Tags]     BHA-HELPCENTER-SUMMARY-01        BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-HELPCENTER-SUMMARY-02: View View heart rhythm support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Summary screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on Historical data item
    ...
    ...     Expected Output:
    ...    - Navigate to View heart rhythm guide
    [Tags]     BHA-HELPCENTER-SUMMARY-02        BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-HELPCENTER-SUMMARY-03: View Status guideline support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Summary screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on Status lights item
    ...
    ...     Expected Output:
    ...    - Navigate to Status guideline guide
    [Tags]     BHA-HELPCENTER-SUMMARY-03        BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-HELPCENTER-SUMMARY-04: View FAQs support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Summary screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on FAQs item
    ...
    ...     Expected Output:
    ...    - Navigate to FAQs guide
    [Tags]     BHA-HELPCENTER-SUMMARY-04        BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-HELPCENTER-RHYTHMDIARY-01: View Center button support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Rhythm diary screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on Center button item
    ...
    ...     Expected Output:
    ...    - Navigate to Center button guide
    ...    - User can navigate back to previous screen by pressed on back button
    ...    - User can move to next/previous step by swiping left/right on the screen
    [Tags]     BHA-HELPCENTER-RHYTHMDIARY-01        BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-HELPCENTER-RHYTHMDIARY-02: View View heart rhythm support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Rhythm diary screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on Historical data item
    ...
    ...     Expected Output:
    ...    - Navigate to View heart rhythm guide
    [Tags]     BHA-HELPCENTER-RHYTHMDIARY-02        BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-HELPCENTER-RHYTHMDIARY-03: View Status guideline support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Rhythm diary screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on Status lights item
    ...
    ...     Expected Output:
    ...    - Navigate to Status guideline guide
    [Tags]     BHA-HELPCENTER-RHYTHMDIARY-03        BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-HELPCENTER-RHYTHMDIARY-04: View FAQs support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Rhythm diary screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on FAQs item
    ...
    ...     Expected Output:
    ...    - Navigate to FAQs guide
    [Tags]     BHA-HELPCENTER-RHYTHMDIARY-04        BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-HELPCENTER-DEVICE-01: View Center button support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Device screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on Center button item
    ...
    ...     Expected Output:
    ...    - Navigate to Center button guide
    ...    - User can navigate back to previous screen by pressed on back button
    ...    - User can move to next/previous step by swiping left/right on the screen
    [Tags]     BHA-HELPCENTER-DEVICE-01     BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-HELPCENTER-DEVICE-02: View View heart rhythm support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Device screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on Historical data item
    ...
    ...     Expected Output:
    ...    - Navigate to View heart rhythm guide
    [Tags]     BHA-HELPCENTER-DEVICE-02     BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-HELPCENTER-DEVICE-03: View Status guideline support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Device screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on Status lights item
    ...
    ...     Expected Output:
    ...    - Navigate to Status guideline guide
    [Tags]     BHA-HELPCENTER-DEVICE-03     BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-HELPCENTER-DEVICE-04: View FAQs support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Device screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on FAQs item
    ...
    ...     Expected Output:
    ...    - Navigate to FAQs guide
    [Tags]     BHA-HELPCENTER-DEVICE-04     BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-HELPCENTER-PROFILE-01: View Center button support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on Center button item
    ...
    ...     Expected Output:
    ...    - Navigate to Center button guide
    ...    - User can navigate back to previous screen by pressed on back button
    ...    - User can move to next/previous step by swiping left/right on the screen
    [Tags]     BHA-HELPCENTER-PROFILE-01        BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-HELPCENTER-PROFILE-02: View View heart rhythm support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on Historical data item
    ...
    ...     Expected Output:
    ...    - Navigate to View heart rhythm guide
    [Tags]     BHA-HELPCENTER-PROFILE-02        BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-HELPCENTER-PROFILE-03: View Status guideline support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on Status lights item
    ...
    ...     Expected Output:
    ...    - Navigate to Status guideline guide
    [Tags]     BHA-HELPCENTER-PROFILE-03        BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-HELPCENTER-PROFILE-04: View FAQs support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on FAQs item
    ...
    ...     Expected Output:
    ...    - Navigate to FAQs guide
    [Tags]      BHA-HELPCENTER-PROFILE-04       BIOH-SRS-03-FRS-12-001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
