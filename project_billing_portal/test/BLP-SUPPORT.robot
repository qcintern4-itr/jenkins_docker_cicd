*** Settings ***
Documentation   Test Suite - Billing Portal - Support page
Metadata    sid     BLP-SUPPORT
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_billing_portal/lib/ConfigHandler.py     ${ENV}

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BLP-SUPPORT     web
Test Timeout    1h

*** Test Cases ***
BLP-SUPPORT-VIEW-01: View Support page
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: View Support page
    ...
    ...     Precondition:
    ...     - The user has signed into the Billing portal
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on Support button on the header of the portal
    ...     - 2. Observe the Support page
    ...
    ...     Expected Results:
    ...     - 1. The user shall be navigated to the Support page
    ...     - 2. There are two sections displayed:
    ...     - Send questions
    ...     - Billing reference
    [Tags]  BLP-SUPPORT-VIEW-01      BP-SRS-05-FBS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-SUPPORT-SENDQUESTION-01: View Send questions section in the case the user has been assigned to one facility
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: The user can view Send questions section in the case the user has been assigned to one facility
    ...
    ...     Precondition:
    ...     - The user is on Support page
    ...
    ...     Test Steps:
    ...     - 1. Observe the Send questions section
    ...
    ...     Expected Results:
    ...     - 1. The section shall be displayed the following information:
    ...     -Your email
    ...     -Your message
    ...     -Send request button
    [Tags]  BLP-SUPPORT-SENDQUESTION-01      BP-SRS-05-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-SUPPORT-SENDQUESTION-02: View Send questions section in the case the user has been assigned to multiple facilities
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: The user can view Send questions section in the case the user has been assigned to multiple facilities
    ...
    ...     Precondition:
    ...     - The user is on Support page
    ...
    ...     Test Steps:
    ...     - 1. Observe the Send questions section
    ...
    ...     Expected Results:
    ...     - 1. The section shall be displayed the following information:
    ...     -Your Facility
    ...     -Your email
    ...     -Your message
    ...     -Send request button
    [Tags]  BLP-SUPPORT-SENDQUESTION-02      BP-SRS-05-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-SUPPORT-SENDQUESTION-03: Send invoicing question
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: The user can send invoicing questions
    ...
    ...     Precondition:
    ...     - The user is on Support page
    ...
    ...     Test Steps:
    ...     - 1. Select a facility (in the case the user works for more than one facility)
    ...     - 2. Enter valid email in Your email field
    ...     - 3. Enter a text in Your message field
    ...     - 4. Click [Send Request] button
    ...
    ...     Expected Results:
    ...     - A message “We have received your request and someone from our billing department will be reaching out to you shortly” shall be appeared on the screen after the user has submitted/sent the request to cs@biotricity.com
    [Tags]  BLP-SUPPORT-SENDQUESTION-03      BP-SRS-05-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-SUPPORT-VIEW-REFERENCES-01: View billing references
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: The user can view billing references
    ...
    ...     Precondition:
    ...     - The user is on Support page
    ...
    ...     Test Steps:
    ...     - 1. View Billing references section
    ...
    ...     Expected Results:
    ...     - Display a PDF file that matches the file uploaded on Admin portal
    ...
    [Tags]  BLP-SUPPORT-VIEW-REFERENCES-01     BP-SRS-05-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

**** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_billing_portal/lib/web/Common.py      ${BROWSER_NODE}      ${ENV}
    ${VERSION}           Navigate To Sign In Page
    Set Suite Metadata    browser       ${BROWSER.capitalize()}
    Set Suite Metadata    version       ${VERSION}

SUITE TEARDOWN
    Quit Browser
