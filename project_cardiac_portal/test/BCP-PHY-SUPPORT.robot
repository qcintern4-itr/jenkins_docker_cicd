*** Settings ***
Documentation   Cardiac Heart Monitor Notification page test suite
Metadata    sid     BCP-PHY-SUPPORT
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/Support.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-PHY-SUPPORT     web
Test Timeout    1h

*** Test Cases ***
BCP-PHY-SUPPORT-01: Send support message due to Web portal issues
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to the Support page
    ...   - Click on Send support message button
    ...   - Select Support field as "Web portal issues"
    ...   - Fill out all the required fields displayed on the side tab bar
    ...   - Click Send button
    ...   Expected Result:
    ...   - A toast will be displayed: "We have received your request and will reach out to you to let you know when the issue has been resolved".
    [Tags]    BCP-PHY-SUPPORT-01    manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    Navigate To Support
#    Send Support Message    facility=${FACILITIES}[1]     support=Web portal issues     email=bob@biotricity.com      message=Send support message test
#    ${message}    Get Success Message
#    Run Keyword And Continue On Failure     Should Be Equal    ${message}     We have received your request and will reach out to you to let you know when the issue has been resolved

BCP-PHY-SUPPORT-02: Send support message due to Others issues
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to the Support page
    ...   - Click on Send support message button
    ...   - Select Support field as "Others"
    ...   - Fill out all the required fields displayed on the side tab bar
    ...   - Click Send button
    ...   Expected Result:
    ...   - A toast will be displayed: "We have received your request and will get back to you as soon as possible".
    [Tags]    BCP-PHY-SUPPORT-02    manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    Navigate To Support
#    Send Support Message    facility=${FACILITIES}[0]     support=Others     email=bob@biotricity.com      message=Send support message test
#    ${message}    Get Success Message
#    Run Keyword And Continue On Failure     Should Be Equal    ${message}     We have received your request and will get back to you as soon as possible

*** Keywords ***
#Suite Setup
    ${BROWSER_NODE}      Start Browser
    Import Library       project_cardiac_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${NURSES}            Get Config Param    USER > nurse
    ${TOKEN}             Sign In Cardiac     username=${NURSES}[0][username]     password=${NURSES}[0][password]
    ${VERSION}           Get Release Version
    Set Suite Metadata   version    ${VERSION}
    Set Suite Metadata   browser    ${BROWSER.capitalize()}

#Suite Teardown
    Quit Browser
