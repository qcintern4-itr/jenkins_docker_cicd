*** Settings ***
Documentation  Bioheart portal Biosphere test suite
Metadata    sid   BHP-BIOSPHERE
Metadata  owner   Linh Tran
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioheart_portal/lib/ConfigHandler.py   ${ENV}
Library     corelib/AssertionExtension.py

Suite Setup     Log    SUITE SETUP
Suite Teardown  Log    SUITE TEARDOWN
Force Tags  BHP-BIOSPHERE       web
Test Timeout  1h

*** Test Cases ***
BHP-BIOSPHERE-01: View current plan
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1.
    ...
    ...     Expected Output:
    ...    - 1.
    ...    - 2.
    [Tags]  BHP-BIOSPHERE-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-BIOSPHERE-02: Purchase Biosphere+ membership
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1.
    ...
    ...     Expected Output:
    ...    - 1.
    ...    - 2.
    [Tags]  BHP-BIOSPHERE-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-BIOSPHERE-03: Change membership plan
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1.
    ...
    ...     Expected Output:
    ...    - 1.
    ...    - 2.
    [Tags]  BHP-BIOSPHERE-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-BIOSPHERE-04: Cancel membership
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1.
    ...
    ...     Expected Output:
    ...    - 1.
    ...    - 2.
    [Tags]  BHP-BIOSPHERE-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-BIOSPHERE-05: Continue membership after canceled
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1.
    ...
    ...     Expected Output:
    ...    - 1.
    ...    - 2.
    [Tags]  BHP-BIOSPHERE-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-BIOSPHERE-06: Billing information
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1.
    ...
    ...     Expected Output:
    ...    - 1.
    ...    - 2.
    [Tags]  BHP-BIOSPHERE-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-BIOSPHERE-07: Update payment method
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1.
    ...
    ...     Expected Output:
    ...    - 1.
    ...    - 2.
    [Tags]  BHP-BIOSPHERE-07        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library      project_bioheart_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${URL}  Get Config Param    WEB_BASE_URL
    Open Page  ${URL}
    ${VERSION}      Navigate To Bioheart Sign In Page
    Set Suite Metadata    version   ${VERSION}
    Set Suite Metadata    browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser
