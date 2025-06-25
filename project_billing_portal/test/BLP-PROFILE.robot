*** Settings ***
Documentation   Test Suite - Billing Portal - Profile page
Metadata    sid     BLP-PROFILE
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_billing_portal/lib/ConfigHandler.py     ${ENV}

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BLP-PROFILE     web
Test Timeout    1h

*** Test Cases ***
BLP-PROFILE-VIEW-01: View your profile page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View Your profile page
    ...
    ...     Precondition:
    ...     - The user has logged in to Billing portal
    ...
    ...     Test Steps:
    ...     - 1. Click on the User’s name on the header of the page
    ...     - 2. Click on the Profile button
    ...     - 3. Observe the Your profile page
    ...
    ...     Expected Results:
    ...     - 1. There is a drop-down displayed containing the Profile button
    ...     - 2. The user is navigated to the Your profile page
    ...     - 3. There are 4 titles displayed:
    ...     - GENERAL INFORMATION
    ...     - FACILITY
    ...     - CONTACT INFORMATION
    ...     - SECURITY
    [Tags]      BLP-PROFILE-VIEW-01    BP-SRS-01-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-PROFILE-VIEW-02: View General information in Your profile page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View General information in Your profile page
    ...
    ...     Precondition:
    ...     - The user is on Your profile page
    ...
    ...     Test Steps:
    ...     - 1. Observe the General information
    ...
    ...     Expected Results:
    ...     - 1. There shall be displayed the following information:
    ...     - First name
    ...     - Last name
    ...     - Username
    ...     - Title
    ...     - Email
    [Tags]      BLP-PROFILE-VIEW-02    BP-SRS-01-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-PROFILE-VIEW-03: View Facility information in Your profile page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View Facility information in Your profile page
    ...
    ...     Precondition:
    ...     - The user is on Your profile page
    ...
    ...     Test Steps:
    ...     - 1. Observe the Facility information
    ...
    ...     Expected Results:
    ...     - 1. There shall be displayed the following information:
    ...     - Country
    ...     - Address
    ...     - City
    ...     - State
    ...     - Zip code
    ...     - Email
    ...     - Day phone number
    ...     - After hour phone number
    ...     - Fax number
    [Tags]      BLP-PROFILE-VIEW-03    BP-SRS-01-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-PROFILE-VIEW-04: View Facility information in Your profile page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View Facility information in Your profile page
    ...
    ...     Precondition:
    ...     - The user is on Your profile page
    ...
    ...     Test Steps:
    ...     - 1. Observe the Facility information
    ...
    ...     Expected Results:
    ...     - 1. There shall be displayed facility’s name of the user
    ...     - 2. The maximum height of this section is 100 pixels. If it is over 100 pixels, there shall be a scroll bar displayed for the user to scroll up and down to view all facilities.
    [Tags]      BLP-PROFILE-VIEW-04    BP-SRS-01-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_billing_portal/lib/web/Common.py      ${BROWSER_NODE}      ${ENV}
    ${VERSION}           Navigate To Sign In Page
    Set Suite Metadata    browser       ${BROWSER.capitalize()}
    Set Suite Metadata    version       ${VERSION}

SUITE TEARDOWN
    Quit Browser
