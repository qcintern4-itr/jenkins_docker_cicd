*** Settings ***
Documentation   Cardiac main navigation bars test suite
Metadata    sid     BCP-PHY-MAIN-NAV
Metadata    owner   Hoang Le
Library     DateTime
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-PHY-MAIN-NAV        web
Test Timeout    1h

*** Test Cases ***
BCP-PHY-MAIN-NAV-01: Go To Appointment Details Page By Accessing Care Plan Info Side Tab
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  1.Access any tab from the Main navigation bar excepting Support tab
    ...  2.Click on any Patient name hyperlink from the list which user wants to view
    ...  3.On the side tab bar, select Appointments subtab
    ...  4.Click the icon on the right of a specific appointment
    ...  Expected Output:
    ...  - User shall be navigated to the Appointment details page which one they choose to view.
    [Tags]    BCP-PHY-MAIN-NAV-01      manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

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
