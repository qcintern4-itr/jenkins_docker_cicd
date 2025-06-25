*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     CRAWL_DATA
Metadata    owner   Thang Tran
Library     corelib/AssertionExtension.py
Library     Collections
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_ai_report_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_ai_report_portal/lib/web/Common.py
Library     project_bioflux_ai_report_portal/lib/web/CrawlData.py

#Suite Setup     Suite Setup
#Suite Teardown      Suite Teardown
Force Tags      CRAWL_DATA   web
Test Timeout    10h

*** Test Cases ***
CRAWL_DATA-VIEW-01: Get Patient Information
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Can view Beat&HR tab details
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1.Click Beat&HR tab
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. The Beat&HR include the information following:
    ...     - Artifact areas
    ...     - AFib
    ...     - R-R histogram (heatmap chart)
    ...     - HR summary
    ...     - Add new event button
    ...     - Add a bookmark button
    ...
    ...     **Others**
    ...     Update date: 03/8/2024 - Trinh Nguyen
    ...     Auto update: 03/13/2024 - Thang Tran
    ...
    [Tags]      CRAWL_DATA-VIEW-01       auto
    Suite Setup
    Navigate To Crawl Data Home Page
    Get Patient Information    use_id=${True}

CRAWL_DATA-VIEW-02: Get Medication Information
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Can view Beat&HR tab details
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1.Click Beat&HR tab
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. The Beat&HR include the information following:
    ...     - Artifact areas
    ...     - AFib
    ...     - R-R histogram (heatmap chart)
    ...     - HR summary
    ...     - Add new event button
    ...     - Add a bookmark button
    ...
    ...     **Others**
    ...     Update date: 03/8/2024 - Trinh Nguyen
    ...     Auto update: 03/13/2024 - Thang Tran
    ...
    [Tags]      CRAWL_DATA-VIEW-02       auto
    Suite Setup
    Navigate To Crawl Data Home Page
    Get Medication Information    use_id=${True}

CRAWL_DATA-VIEW-03: Get Allergy Information
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Can view Beat&HR tab details
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1.Click Beat&HR tab
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. The Beat&HR include the information following:
    ...     - Artifact areas
    ...     - AFib
    ...     - R-R histogram (heatmap chart)
    ...     - HR summary
    ...     - Add new event button
    ...     - Add a bookmark button
    ...
    ...     **Others**
    ...     Update date: 03/8/2024 - Trinh Nguyen
    ...     Auto update: 03/13/2024 - Thang Tran
    ...
    [Tags]      CRAWL_DATA-VIEW-03       auto
    Suite Setup
    Navigate To Crawl Data Home Page
    Get Allergy Information    use_id=${True}

CRAWL_DATA-VIEW-04: Get Diagnoses Information
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Can view Beat&HR tab details
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1.Click Beat&HR tab
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. The Beat&HR include the information following:
    ...     - Artifact areas
    ...     - AFib
    ...     - R-R histogram (heatmap chart)
    ...     - HR summary
    ...     - Add new event button
    ...     - Add a bookmark button
    ...
    ...     **Others**
    ...     Update date: 03/8/2024 - Trinh Nguyen
    ...     Auto update: 03/13/2024 - Thang Tran
    ...
    [Tags]      CRAWL_DATA-VIEW-04       auto
    Suite Setup
    Navigate To Crawl Data Home Page
    Get Diagnoses Information    use_id=${True}

CRAWL_DATA-VIEW-05: Get Patient Address Information
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Can view Beat&HR tab details
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1.Click Beat&HR tab
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. The Beat&HR include the information following:
    ...     - Artifact areas
    ...     - AFib
    ...     - R-R histogram (heatmap chart)
    ...     - HR summary
    ...     - Add new event button
    ...     - Add a bookmark button
    ...
    ...     **Others**
    ...     Update date: 03/8/2024 - Trinh Nguyen
    ...     Auto update: 03/13/2024 - Thang Tran
    ...
    [Tags]      CRAWL_DATA-VIEW-05       auto
    Suite Setup
    Navigate To Crawl Data Home Page
    Get Patient Address Information    use_id=${True}

#CRAWL_DATA_DEBUG: Debug Everything
#    [Documentation]     Author: Tuyen Vo
#    ...
#    ...     Description: Test keyword here
#    ...
#    [Tags]      CRAWL_DATA_DEBUG       auto
#    Suite Setup

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_ai_report_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/CrawlData.py       ${BROWSER_NODE}     ${ENV}
    ${USERS}                Get Config Param    NEW_USERS
    ${STUDY_ID}             Get Config Param    STUDY_ID
    ${CURRENT_USER}         Set Variable        ${USERS}[crawl_data]
    ${STUDY_ID_COMPLETED}      Set Variable        ${STUDY_ID}[patient_id]
    Navigate To Crawl Data Sign In Page
    ${TOKEN}                Sign In Crawl Data  ${CURRENT_USER}[username]      ${CURRENT_USER}[password]
    Set Suite Variable      ${TOKEN}
    Set Global Variable     ${STUDY_ID_COMPLETED}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}
