*** Settings ***
Documentation   Cardiac Heart Monitor Notification page test suite
Metadata    sid     BCP-PHY-DEVICES-BIOHEART
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/DevicesBioheartReport.py
#Library     project_cardiac_portal/lib/web/ReportDetails.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-PHY-DEVICES-BIOHEART        web
Test Timeout    1h

*** Test Cases ***
BCP-PHY-DEVICES-BIOHEART-01: Filter Bioheart reports list
    [Documentation]    Author: Hoang Le

    ...   Test Steps:
    ...   - Go to the Bioheart report page
    ...   - Filter report status by All statuses/ Unreviewed/ Reviewed/ Failed to generate
    ...   - Filter patient by My patients/ All patients
    ...   - Search report by Patient name or care plan ID
    ...   - Click on a specific patient's report which user wants to view the details
    ...   Expected Result:
    ...   - The Bioheart report shall be displayed in details.
    [Tags]    BCP-PHY-DEVICES-BIOHEART-01     manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    [Template]    Filter Bioheart Reports         # Bug: No Bioheart reports found when filtering by 'Failed to generate' | 'Patient Name'
#    All patients    All statuses            Care plan ID
#    All patients    Unreviewed              Care plan ID
#    All patients    Reviewed                Patient name
#    All patients    Failed to generate      Patient name
#    My patients     All status              Patient name
#    My patients     Unreviewed              Care plan ID

BCP-PHY-DEVICES-BIOHEART-02: Go To The Patient Details Page By Clicking Patient Name Hyperlink
    [Documentation]    Author: Hoang Le

    ...   Test Steps:
    ...   1.Go to Heart monitor - Bioheart tab
    ...   2.Click any patient name hyperlink on the list
    ...   3.On the side tab bar, click Go to patient details button
    ...   Expected Result:
    ...   - At step 2, the Care plan info side tab will be displayed
    ...   - At step 3, user will be navigated to the Patient details page which they selected before.
    [Tags]    BCP-PHY-DEVICES-BIOHEART-02      manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-DEVICES-BIOHEART-03: Column visibility - Hide/show column(s) on page
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: user is on the Bioheart report page
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to hide/show any column(s) on page by setting on Column visibility button.
    [Tags]    BCP-PHY-DEVICES-BIOHEART-03        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-DEVICES-BIOHEART-04: Check data ECG strip improvement
    [Documentation]    Author: Bao Van
    ...  1. Login App > Perform connection to Bioheart Deviced
    ...  2. Login Portal > Check data ECG strip

    ...  Test steps:
    ...  Expected result:
    ...  Expect: Show AI data for the day instead of the next day
    [Tags]    BCP-PHY-DEVICES-BIOHEART-04        manual      BCCA-2.26
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
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

Filter Bioheart reports
    [Arguments]     ${by_patient}     ${by_status}      ${search_by}
    Navigate To Devices Bioheart Report
    Filter Devices Bioheart Report    by_status=${by_status}      by_patient=${by_patient}        search_by=${search_by}
    ${reports}      Get Devices Bioheart Report
    ${text}     Set Variable    ${reports}[0][${search_by}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}      No report found - ${search_by} without text string
    Filter Devices Bioheart Report    by_status=${by_status}      by_patient=${by_patient}        search_by=${search_by}      text_search=${text}
    ${reports}      Get Devices Bioheart Report
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}      No report found - ${search_by} ${text}
    # Status
    Run Keyword If    '${by_status}' == 'Reviewed'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${by_status}'.lower() in r['Status'].lower() for r in ${reports})
    Run Keyword If    '${by_status}' == 'Unreviewed'
    ...  Run Keyword And Continue On Failure    Should Be True    all('--' in r['Status'] for r in ${reports})
    Run Keyword If    '${by_status}' == 'Failed to generate'
    ...  Run Keyword And Continue On Failure    Should Be True    all('No heart data to generate report' in r['Status'] for r in ${reports})
    # Text search
    Run Keyword If    '${search_by}' == 'Care Plan ID'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}' == r['Care Plan ID'] for r in ${reports})
    Run Keyword If    '${search_by}' == 'Patient Name'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}'.lower() in r['Patient Name'].lower() for r in ${reports})
    # Access report details from first report HMBR
    View Bioheart Report Details On    row=1
    ${page_header}      Get Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      Report details
    ${report_details}   Get Report Details
    Run Keyword And Continue On Failure    Should Be Equal     ${report_details}[0][Patient]        ${reports}[0][Patient Name]
    Run Keyword And Continue On Failure    Should Be Equal     ${report_details}[0][Report date]        ${reports}[0][Date Of Service]
