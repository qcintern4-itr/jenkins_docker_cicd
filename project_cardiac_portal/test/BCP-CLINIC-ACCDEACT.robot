*** Settings ***
Documentation   Cardiac Account deactivated test suite
Metadata    sid     BCP-CLINIC-ACCDEACT
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library      project_cardiac_portal/lib/web/Common.py
#Library      project_cardiac_portal/lib/web/Support.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-CLINIC-ACCDEACT       web
Test Timeout    1h

*** Test Cases ***
BCP-CLINIC-ACCDEACT-01: Check if the clinic account is Deactivated
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  There is a banner displayed to notify that their account is deactivated
    ...  The user shall be kicked out and can not log in again until their account is recovered.
    [Tags]    BCP-CLINIC-ACCDEACT-01     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-ACCDEACT-02: Check if the clinic account is Active
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to log in again to the account.
    [Tags]    BCP-CLINIC-ACCDEACT-02     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-ACCDEACT-03: Set facility status to Test for the clinic user who works for one facility only
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to log in normally to the account.
    [Tags]    BCP-CLINIC-ACCDEACT-03     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-ACCDEACT-04: Set facility status to Eval for the clinic user who works for one facility only
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to log in normally to the account.
    [Tags]    BCP-CLINIC-ACCDEACT-04     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-ACCDEACT-05: Set facility status to Closed for the clinic user who works for one facility only
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  There is a banner displayed to notify that their facility is closed
    ...  The user is kicked out and can not log in again untill the facility is Active/Test/Eval.
    [Tags]    BCP-CLINIC-ACCDEACT-05     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-ACCDEACT-06: Set facility status to Test for the clinic user who works for many facilities
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to log in normally to the account.
    [Tags]    BCP-CLINIC-ACCDEACT-06     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-ACCDEACT-07: Set facility status to Eval for the clinic user who works for many facilities
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to log in normally to the account.
    [Tags]    BCP-CLINIC-ACCDEACT-07     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-ACCDEACT-08: Set facility status to Closed for the clinic user who works for many facilities
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The facility list shall be reloaded and updated
    ...  The closed facility shall be removed from the facilities list.
    [Tags]    BCP-CLINIC-ACCDEACT-08     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}


*** Keywords ***
#Suite Setup
#    ${BROWSER_NODE}      Start Browser
#    Import Library       project_cardiac_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
#    ${NURSES}            Get Config Param    USER > nurse
#    ${TOKEN}             Sign In Cardiac     username=${NURSES}[0][username]     password=${NURSES}[0][password]
#    ${VERSION}           Get Release Version
#    Set Suite Metadata   version    ${VERSION}
#    Set Suite Metadata   browser    ${BROWSER.capitalize()}
#
##Suite Teardown
#    Quit Browser




