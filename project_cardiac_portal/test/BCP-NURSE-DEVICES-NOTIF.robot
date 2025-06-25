*** Settings ***
Documentation   Cardiac Heart Monitor Notification page test suite
Metadata    sid     BCP-NURSE-DEVICES-NOTIF
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/DevicesNotifications.py
#Library     project_cardiac_portal/lib/web/ReportDetails.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-NURSE-DEVICES-NOTIF     web
Test Timeout    1h

*** Test Cases ***
BCP-NURSE-DEVICES-NOTIF-01: Filter Study Notification list
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to Heart monitor notification page
    ...   - Filter Priority by All priorities/ Urgent/ Emergent/ High/ Medium/ Low
    ...   - Search Study notification by Patient name/ Care plan ID/ Study ID
    ...   - Click on a specific Study notification row which user wants to view
    ...   Expected Result:
    ...   - The Study notification report in details shall be displayed.
    [Tags]   BCP-NURSE-DEVICES-NOTIF-01      manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    [Template]    Filter Study Notification
#    Medium          Patient name
#    High            Care plan ID
#    Emergent        Study ID
#    Urgent          Patient name
#    All priorities  Study ID
#
BCP-NURSE-DEVICES-NOTIF-02: Go To the Patient Details Page By Clicking Patient Name Hyperlink
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to Heart monitor - Heart monitor notification tab
    ...   2.Click any patient name hyperlink on the list
    ...   3.On the side tab bar, click Go to patient details button
    ...   Expected Result:
    ...   - At step 2, the Care plan info side tab will be displayed
    ...   - At step 3, user will be navigated to the Patient details page which they selected before.
    [Tags]   BCP-NURSE-DEVICES-NOTIF-02      manual
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

Filter Study Notification
    [Arguments]    ${priority}      ${search_by}
    Navigate To Heart Monitor Notification
    Filter Heart Monitor Notification     by_priority=${priority}       search_by=${search_by}
    ${notif}      Get Heart Monitor Notification
    ${text}     Set Variable    ${notif}[0][${search_by}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${notif}      No notidications found - ${search_by} without text string
    Filter Heart Monitor Notification     by_priority=${priority}       search_by=${search_by}      text_search=${text}
    ${notif}      Get Heart Monitor Notification
    Run Keyword And Continue On Failure    Should Not Be Empty    ${notif}      No notifications found - ${search_by} ${text}
    Run Keyword If    '${priority}' != 'All priorities'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${priority}' in notif['Priority'] for notif in ${notif})
    Run Keyword If    '${search_by}' == 'Patient name'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}'.lower() in notif['Patient name'].lower() for notif in ${notif})
    Run Keyword If    '${search_by}' == 'Care plan ID' or '${search_by}' == 'Study ID'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}' == notif['${search_by}'] for notif in ${notif})
    View Heart Monitor Notification Report Details On    row=1
    # Report details page
    ${page_header}      Get Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      Report details
    ${report_details}   Get Report Details
    Run Keyword And Continue On Failure    Should Be Equal    ${report_details}[0][Patient]     ${notif}[0][Patient name]
    Run Keyword And Continue On Failure    Should Be Equal    ${report_details}[0][Receiving time]     ${notif}[0][Receiving time]
