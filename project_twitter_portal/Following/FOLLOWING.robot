*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     FOLLOWING
Metadata    owner   Hoang Nguyen
Library     corelib/AssertionExtension.py
Library     Collections
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_twitter_portal/lib/ConfigHandler.py    ${ENV}
Library     project_twitter_portal/lib/web/Common.py
#Library     project_twitter_portal/lib/web/CrawlData.py

Suite Setup     Suite Setup
#Suite Teardown      Suite Teardown
Force Tags      FOLLOWING   web
Test Timeout    10h
*** Test Cases ***
FOLLOWING-01: Get Patient Information
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Auto update: 04/03/2025 - Hoang Nguyen
    ...
    [Tags]      FOLLOWING-01       auto
    Navigate To Twitter Sign In Page
    Open Brower By Cookies File
    Load Csv Data    test1.csv
    Search And Follow    test1.csv
    Send Message To Following    Hello
    Quit Browser
*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_twitter_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}