*** Settings ***
Documentation  Bioheart portal Health report test suite
Metadata    sid   BHP-HEALTHREPORT
Metadata  owner   Linh Tran
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioheart_portal/lib/ConfigHandler.py   ${ENV}
Library     corelib/AssertionExtension.py

Suite Setup     Log    SUITE SETUP
Suite Teardown  Log    SUITE TEARDOWN
Force Tags  BHP-HEALTHREPORT        web
Test Timeout  1h

*** Test Cases ***
BHP-HEALTHREPORT-01: View list of health report
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     -
    ...
    ...     Test Steps:
    ...    - 1.
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2.
    [Tags]      BHP-HEALTHREPORT-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-HEALTHREPORT-02: Create health report with last 7 days
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     -
    ...
    ...     Test Steps:
    ...    - 1.
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2.
    [Tags]      BHP-HEALTHREPORT-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-HEALTHREPORT-03: Create health report with custom data range for free plan
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     -
    ...
    ...     Test Steps:
    ...    - 1.
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2.
    [Tags]      BHP-HEALTHREPORT-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-HEALTHREPORT-04: Create health report with custom data range for premium plan
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     -
    ...
    ...     Test Steps:
    ...    - 1.
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2.
    [Tags]      BHP-HEALTHREPORT-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-HEALTHREPORT-05: Share report
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     -
    ...
    ...     Test Steps:
    ...    - 1.
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2.
    [Tags]      BHP-HEALTHREPORT-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-HEALTHREPORT-06: Re-generate report
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     -
    ...
    ...     Test Steps:
    ...    - 1.
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2.
    [Tags]      BHP-HEALTHREPORT-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-HEALTHREPORT-07: Details of a Bioheart - Cardiac health report
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     -
    ...
    ...     Test Steps:
    ...    - 1.
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2.
    [Tags]      BHP-HEALTHREPORT-07      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-HEALTHREPORT-08: Details of a Bioheart
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     -
    ...
    ...     Test Steps:
    ...    - 1.
    ...
    ...     Expected Output:
    ...    - 1. The app is opened
    ...    - 2.
    [Tags]      BHP-HEALTHREPORT-08      manual
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
