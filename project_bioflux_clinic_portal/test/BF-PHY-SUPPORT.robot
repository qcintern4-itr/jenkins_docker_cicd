*** Settings ***
Documentation   Test Suite - Clinic Portal - Support page
Metadata    sid     BF-PHY-SUPPORT
Metadata    owner   Nhan Nguyen
Library     Collections
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py                                     ${BROWSER}  ${HEADLESS}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py        ${ENV}    WITH NAME   CpConfig
Library     project_bioflux_callcenter_portal/lib/ConfigHandler.py    ${ENV}    WITH NAME   CcConfig
Library     project_bioflux_clinic_portal/lib/api/Clinic.py           ${ENV}
Library     project_bioflux_clinic_portal/lib/api/Auth.py             ${ENV}
Library     project_bioflux_clinic_portal/lib/web/Common.py
Library     project_bioflux_callcenter_portal/lib/web/Common.py
Library     project_bioflux_clinic_portal/lib/web/Support.py
Library     project_bioflux_clinic_portal/lib/web/Inbox.py
Library     project_bioflux_clinic_portal/lib/web/Studies.py
Library     project_bioflux_clinic_portal/lib/web/Devices.py
Library     project_bioflux_clinic_portal/lib/web/Fleet.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BF-PHY-SUPPORT      web
Test Timeout    1h

*** Test Cases ***
BF-PHY-SUPPORT-VIEW-01: View a Customer Support page
    [Documentation]   Author: Trinh Nguyen
    ...     Description: The user can view a Customer Support page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click on the Support page hyperlink in the left bar navigational menu
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. The Customer Support page displays the following information:
    ...     - Information about Biotricity’s Customer Support Center
    ...     + The email address of the Customer Support Center: it is a mail to link so that when clicked on it will
    ...     pull up an email in the default program
    ...     + Phone number of Customer Support Center
    ...     - Information about Bioflux solution, divided into the following sections:
    ...     + FAQ
    ...     + How-to Videos
    ...     + Billing Reference
    ...     + Send Support Message
    ...     + Send Feedback/Feature Request

    [Tags]  BF-PHY-SUPPORT-VIEW-01      auto
    Navigate To Support
    ${support_menu}     Get Support Menu
    ${contact_info}     Get Support Contact
     # Verify support menu items
    Run Keyword And Continue On Failure     Should Be Equal    ${support_menu}[0]       Support request
    Run Keyword And Continue On Failure     Should Be Equal    ${support_menu}[1]       FAQ
    Run Keyword And Continue On Failure     Should Be Equal    ${support_menu}[2]       How to videos
    Run Keyword And Continue On Failure     Should Be Equal    ${support_menu}[3]       Billing reference
    Run Keyword And Continue On Failure     Should Be Equal    ${support_menu}[4]       Support modules
    # Contact info
    Run Keyword And Continue On Failure     Should Be Equal    ${contact_info}[Email]   cs@biotricity.com
    Run Keyword And Continue On Failure     Should Be Equal    ${contact_info}[Phone]   1-800-590-4155
    Run Keyword And Continue On Failure     Should Be Equal    ${contact_info}[Send feedback]       Send feedback

BF-PHY-SUPPORT-VIEW-02: View list of support requests
    [Documentation]   Author: Trinh Nguyen
    ...     Description: The user can view a list of support requests
    ...
    ...     Precondition:
    ...     - The user is on the Support page
    ...
    ...     Test Steps:
    ...     1. Click on the Support Request button in the left bar navigational menu
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. The user shall be able to view a list of support request. The list contains the following attributes:
    ...     - Request ID
    ...     - Status:
    ...     + Open
    ...     + Resolved
    ...     - Category
    ...     - Requestor
    ...     - Requestor Role
    ...     2. There shall be a search box for the user to search for the desired request by request ID
    ...     3. There shall be filters for the user to filter the list by the desired value:
    ...     - Status filter - the user can select 1 among:
    ...     + All statuses
    ...     + Open
    ...     + Resolved
    ...     - Category filter:
    ...     + All categories
    ...     + Change study type
    ...     + Abort study
    ...     + Report request
    ...     + Web portal issues
    ...     + Billing questions
    ...     + Others

    [Tags]  BF-PHY-SUPPORT-VIEW-02     auto
    Navigate To Support
    Navigate To Support Menu    Support Request
    ${requests}     Get List Support Request
    ${status}       Get Status Support Requests
    # Request headers
    ${request_headers}      Evaluate    [k for k, v in ${requests}[0].items()]
    ${expected_headers}     Create List    Request ID       Status      Facility     Category       Requestor       Requestor role
    Run Keyword And Continue On Failure    Lists Should Be Equal     ${request_headers}     ${expected_headers}
    ${expected_status}     Create List    Open      Resolved
    Run Keyword And Continue On Failure    List Should Contain Sub List     ${status}     ${expected_status}
    # Default search_by
    ${current_filter}       Get Support Request Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Search By]      Request ID
    # Filter options
    ${filter_options}       Get Support Request Filter Options
    ${expected_statuses}          Create List    All statuses     Open      Resolved
    ${expected_categories}        Create List    All categories     Report request      Change study type     Abort study     Web portal issues      Billing questions    Others
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${filter_options}[Statuses]     ${expected_statuses}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${filter_options}[Categories]   ${expected_categories}

BF-PHY-SUPPORT-SEARCH-01: Search in Support Request list by Request ID
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The clinic user can search in support request list by Request ID
    ...
    ...     Precondition:
    ...     - The user is on the Support page
    ...
    ...     Test Steps:
    ...     1. Click on the Support Request button on the Support page
    ...     2. Click and enter the Request ID criteria on the search bar
    ...
    ...     Expected Results:
    ...     1. At step 1, the search result shall be displayed

    [Tags]  BF-PHY-SUPPORT-SEARCH-01      auto
    Navigate To Support
    Navigate To Support Menu    Support Request
    Filter Support Request      by_status=All statuses      by_category=All requests
    ${requests}     Get List Support Request
    Run Keyword And Continue On Failure    Should Not Be Empty    ${requests}       No support requests found
    ${text}         Set Variable    ${requests}[0][Request ID]
    Filter Support Request      text_search=${text}
    ${requests}     Get List Support Request
    Run Keyword And Continue On Failure    Should Not Be Empty    ${requests}       No support requests found - Request ID ${text}
    Run Keyword And Continue On Failure    Length Should Be       ${requests}     1
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${text}      ${requests}[0][Request ID]

BF-PHY-SUPPORT-FILTER-01: Filter the request list by the Status filter
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The clinic user can filter the request list by the Status filter
    ...
    ...     Precondition:
    ...     - The user is on the Support page
    ...
    ...     Test Steps:
    ...     1. Click on the Support Request button on the Support page
    ...     2. Click the Status filter status, then select the All statuses
    ...     3. Click the Status filter status, then select the Open statuses
    ...     4. Click the Status filter status, then select the Resolved statuses
    ...
    ...     Expected Results:
    ...     1. After the user has selected the desired status, all the data associated with that status shall be
    ...     reflected accordingly

    [Tags]  BF-PHY-SUPPORT-FILTER-01     auto
    [Template]    Filter Support - Request
    Resolved
    Open
    All statuses

BF-PHY-SUPPORT-FILTER-02: Filter the request list by the Category filter
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The clinic user can filter the request list by the Category filter
    ...
    ...     Precondition:
    ...     - The user is on the Support page
    ...
    ...     Test Steps:
    ...     1. Click on the Support Request button on the Support page
    ...     2. Click the Category filter status, then select the All categories
    ...     3. Click the Category filter status, then select the Change study type
    ...     4. Click the Category filter status, then select the Abort study
    ...     5. Click the Category filter status, then select the Report request
    ...     6. Click the Category filter status, then select the Web portal issues
    ...     7. Click the Category filter status, then select the Billing questions
    ...     8. Click the Category filter status, then select the Others
    ...
    ...     Expected Results:
    ...     1. After the user has selected the desired category, all the data associated with that category shall be
    ...     reflected accordingly

    [Tags]  BF-PHY-SUPPORT-FILTER-02     auto
    [Template]    Filter Support - Request
    ${EMPTY}      Change study type     ${EMPTY}
    ${EMPTY}      Report request        ${EMPTY}
    ${EMPTY}      Web portal issues     ${EMPTY}
    ${EMPTY}      Billing questions     ${EMPTY}
    ${EMPTY}      Others                ${EMPTY}
    ${EMPTY}      All requests          ${EMPTY}
    ${EMPTY}      Abort study           ${EMPTY}

BF-PHY-SUPPORT-PAGINATION-01: Check pagination tool works properly in Support request
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user is on Support page >> Support request
    ...
    ...     Test Steps:
    ...     1. Observe the pagination tool displays at the bottom of the table
    ...     2. Select value "30" from the dropdown box
    ...     3. Select value "50" from the dropdown box
    ...     4. Click [>]/[<] button
    ...
    ...     Expected Results:
    ...     1. In step 1:
    ...     -   There shall be a dropdown box with values (10 - 30 - 50) to be selected
    ...     -   The default value of the dropdown box is 10
    ...     -   If the device list is less than 10 then the pagination tool shall be hidden
    ...     2. In step 2:
    ...     -   The list shall displays a maximum of 30 items per page
    ...     3. In step 3:
    ...     -   The list shall displays a maximum of 50 items per page
    ...     4. In step 4:
    ...     -   The user shall be able to navigate between loaded pages
    ...
    ...     **Others**
    ...     - Update date: 12/06/2023 - Nhan Nguyen

    [Tags]     BF-PHY-SUPPORT-PAGINATION-01     manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-SUPPORT-MATERIALS-VIEW-01: View list of sub-tabs on the Support Materials page
    [Documentation]   Author: Trinh Nguyen
    ...     Description: The user can view a list of sub-tabs on the support modules tab
    ...
    ...     Precondition:
    ...     - The user is on the Support page
    ...
    ...     Test Steps:
    ...     1. Click on the Support Materials tab in the left bar navigational menu
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. There shall be the following subs-tab displayed on the Support Materials tabs:
    ...     - Onboarding Guide
    ...     - Features Manual
    ...     - Instructions For Use
    ...     - Patient Manual
    ...     - Patient Quick Guide

    [Tags]  BF-PHY-SUPPORT-MATERIALS-VIEW-01     manual      R1    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Support
#    Navigate To Support Menu    Support modules
#    ${supports}          Get Support Materials Filter Options
#    ${supports_tabs}     Set Variable    ${supports}[Subtabs]
#    Run Keyword And Continue On Failure    Should Be Equal    ${supports_tabs}[0]    Onboarding guide
#    Run Keyword And Continue On Failure    Should Be Equal    ${supports_tabs}[1]    Features manual
#    Run Keyword And Continue On Failure    Should Be Equal    ${supports_tabs}[2]    Instructions for use
#    Run Keyword And Continue On Failure    Should Be Equal    ${supports_tabs}[3]    Patient manual
#    Run Keyword And Continue On Failure    Should Be Equal    ${supports_tabs}[4]    Patient quick guide

BF-PHY-SUPPORT-MATERIALS-VIEW-DETAILS-01: View details of the Onboarding guide sub-tab
    [Documentation]   Author: Trinh Nguyen
    ...     Description: The user can view details of the Onboarding guide sub-tab of the Support page
    ...
    ...     Precondition:
    ...     - The user is on the Support Materials tab of the customer page
    ...
    ...     Test Steps:
    ...     1. Click on the Onboarding Guide sub-tab
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. The Onboarding guide sub-tab of the Support tab of the Support page is highlighted when it's selected
    ...     by the user
    ...     2. There shall be Bioflux button and Biocore/Biotres button for the user to view the document of the desired device
    ...     3. On the PDF viewer, there is a download button
    ...     4. These documents are uploaded by the administrator of the Admin portal

    [Tags]  BF-PHY-SUPPORT-MATERIALS-VIEW-DETAILS-01      CP-2.11.0     manual      R1    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Support
#    Navigate To Support Menu    Support modules
#    ${subtabs}      Get Support Materials Filter Options
#    ${expect_subtabs}        Create List    Onboarding guide     Features manual     Instructions for use     Patient manual     Patient quick guide
#    ${expect_categories}     Create List    Bioflux      Biocore/Biotres
#    Run Keyword And Continue On Failure    Lists Should Be Equal        ${subtabs}[Subtabs]        ${expect_subtabs}
#    Run Keyword And Continue On Failure    Lists Should Be Equal        ${subtabs}[Categories]     ${expect_categories}
#    Filter Support Materials    sub_tab=Onboarding guide     by_category=Biocore/Biotres
#    ${current_values}       Get Support Materials Current Filter
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Subtab]     Onboarding guide
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Category]   Biocore/Biotres
    # PDF file: TBD

BF-PHY-SUPPORT-MATERIALS-DOWNLOAD-01: Download PDF file-Onboarding guide of Bioflux
    [Documentation]   Author: Trinh Nguyen
    ...     Description: The user can download the Bioflux PDF file on the Onboarding guide sub-tab
    ...
    ...     Precondition:
    ...     - The user is on the Onboarding guide sub-tab of the customer page
    ...
    ...     Test Steps:
    ...     1. Click on Biolfux button
    ...     2. Click the Download pdf button
    ...
    ...     Expected Results:
    ...     1. At step 1, the Bioflux PDF file is displayed
    ...     2. At step 2, atfetr the user clicking the download button, the file downloaded shall have its name following
    ...     the format "BiofluxOnboardingGuide"
    ...
    ...     **Others**
    ...     - Update date: 12/06/2023 - Nhan Nguyen

    [Tags]  BF-PHY-SUPPORT-MATERIALS-DOWNLOAD-01     manual    deactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-SUPPORT-MATERIALS-DOWNLOAD-02: Download PDF file-Onboarding guide of Bioflux
    [Documentation]   Author: Trinh Nguyen
    ...     Description: The user can download the Biocore/Biotres PDF file on the Onboarding guide sub-tab
    ...
    ...     Precondition:
    ...     - The user is on the Onboarding guide sub-tab of the customer page
    ...
    ...     Test Steps:
    ...     1. Click on Biocore/Biotres button
    ...     2. Click the Download pdf button
    ...
    ...     Expected Results:
    ...     1. At step 1, the Biocore/Biotres PDF file is displayed
    ...     2. At step 2, atfetr the user clicking the download button, the file downloaded shall have its name following
    ...     the format "Biocore/BiotresOnboardingGuide"
    ...
    ...     **Others**
    ...     - Update date: 12/06/2023 - Nhan Nguyen

    [Tags]  BF-PHY-SUPPORT-MATERIALS-DOWNLOAD-02  CP-2.11.0     manual    deactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-SUPPORT-MATERIALS-VIEW-DETAILS-02: View details of the Features Manual sub-tab
    [Documentation]   Author: Trinh Nguyen
    ...     Description: The user can view details of the Features Manual sub-tab of the Support page
    ...
    ...     Precondition:
    ...     - The user is on the Support Materials tab of the customer page
    ...
    ...     Test Steps:
    ...     1. Click on the Feature Manual sub-tab
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. The Feature Manual sub-tab of the Support tab of the Support page is highlighted when it's selected
    ...     by the user
    ...     2. The user shall be able to view all the features manual displaying as a PDF
    ...     3. On the PDF viewer, there is a download button
    ...     4. These documents are uploaded by the administrator of the Admin portal

    [Tags]  BF-PHY-SUPPORT-MATERIALS-VIEW-DETAILS-02  C    P-2.11.0     manual      R1    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Support
#    Navigate To Support Menu    Support modules
#    ${subtabs}      Get Support Materials Filter Options
#    ${expect_subtabs}        Create List    Onboarding guide     Features manual     Instructions for use     Patient manual     Patient quick guide
#    Run Keyword And Continue On Failure    Lists Should Be Equal        ${subtabs}[Subtabs]        ${expect_subtabs}
#    Filter Support Materials    sub_tab=Features manual
#    ${current_values}       Get Support Materials Current Filter
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Subtab]     Features manual
    # Verification PDF file: TBD

BF-PHY-SUPPORT-MATERIALS-DOWNLOAD-03: Download PDF file-Features manual
    [Documentation]   Author: Trinh Nguyen
    ...     Description: The user can download the PDF file on the Feature Manual sub-tab
    ...
    ...     Precondition:
    ...     - The user is on the Feature Manual sub-tab of the customer page
    ...
    ...     Test Steps:
    ...     1. Click the Download pdf button
    ...
    ...     Expected Results:
    ...     2. At step 1, atfetr the user clicking the download button, the file downloaded shall have its name following
    ...     the format "FeaturesManual"
    ...     **Others**
    ...     - Update date: 12/06/2023 - Nhan Nguyen

    [Tags]  BF-PHY-SUPPORT-MATERIALS-DOWNLOAD-03  CP-2.11.0     manual    deactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-SUPPORT-MATERIALS-VIEW-DETAILS-03: View details of the Instructions For Use sub-tab
    [Documentation]   Author: Trinh Nguyen
    ...     Description: The user can view details of the Instructions For Use sub-tab of the Support page
    ...
    ...     Precondition:
    ...     - The user is on the Support Materials tab of the customer page
    ...
    ...     Test Steps:
    ...     1. Click on the Instructions For Use sub-tab
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. The Instruction For Use sub-tab of the Support tab of the Support page is highlighted when it's selected
    ...     by the user
    ...     2. There shall be Bioflux button and Biocore/Biotres button for the user to view the document of the desired device
    ...     3. On the PDF viewer, there is a download button
    ...     4. These documents are uploaded by the administrator of the Admin portal

    [Tags]  BF-PHY-SUPPORT-MATERIALS-VIEW-DETAILS-03     manual      R1    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Support
#    Navigate To Support Menu    Support modules
#    ${subtabs}      Get Support Materials Filter Options
#    ${expect_subtabs}        Create List    Onboarding guide     Features manual     Instructions for use     Patient manual     Patient quick guide
#    ${expect_categories}     Create List    Bioflux      Biocore/Biotres
#    Run Keyword And Continue On Failure    Lists Should Be Equal        ${subtabs}[Subtabs]        ${expect_subtabs}
#    Run Keyword And Continue On Failure    Lists Should Be Equal        ${subtabs}[Categories]     ${expect_categories}
#    Filter Support Materials    sub_tab=Instructions for use     by_category=Biocore/Biotres
#    ${current_values}       Get Support Materials Current Filter
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Subtab]     Instructions for use
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Category]   Biocore/Biotres
#    Filter Support Materials    by_category=Bioflux
#    ${current_values}       Get Support Materials Current Filter
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Subtab]     Instructions for use
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Category]   Bioflux
    # Verification PDF file: TBD

BF-PHY-SUPPORT-MATERIALS-DOWNLOAD-04: Download PDF file-Instruction for use of Bioflux
    [Documentation]   Author: Trinh Nguyen
    ...     Description: The user can download the Bioflux PDF file on the Instruction For Use sub-tab
    ...
    ...     Precondition:
    ...     - The user is on the Instruction For Use sub-tab of the customer page
    ...
    ...     Test Steps:
    ...     1. Click on Biolfux button
    ...     2. Click the Download pdf button
    ...
    ...     Expected Results:
    ...     1. At step 1, the Bioflux PDF file is displayed
    ...     2. At step 2, atfetr the user clicking the download button, the file downloaded shall have its name following
    ...     the format "BiofluxIFU"
    ...     **Others**
    ...     - Update date: 12/06/2023 - Nhan Nguyen

    [Tags]  BF-PHY-SUPPORT-MATERIALS-DOWNLOAD-04  CP-2.11.0     manual    deactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-SUPPORT-MATERIALS-DOWNLOAD-05: Download PDF file-Instruction for use of Biocore/Biotres
    [Documentation]   Author: Trinh Nguyen
    ...     Description: The user can download the Biocore/Biotres PDF file on the Instruction For Use sub-tab
    ...
    ...     Precondition:
    ...     - The user is on the Instruction For Use sub-tab of the customer page
    ...
    ...     Test Steps:
    ...     1. Click on Biocore/Biotres button
    ...     2. Click the Download pdf button
    ...
    ...     Expected Results:
    ...     1. At step 1, the Biocore/Biotres PDF file is displayed
    ...     2. At step 2, atfetr the user clicking the download button, the file downloaded shall have its name following
    ...     the format "Biocore/BiotresIFU"
    ...     **Others**
    ...     - Update date: 12/06/2023 - Nhan Nguyen

    [Tags]  BF-PHY-SUPPORT-MATERIALS-DOWNLOAD-05  CP-2.11.0     manual    deactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-SUPPORT-MATERIALS-VIEW-DETAILS-04: View details of the Patient Manual sub-tab
    [Documentation]   Author: Trinh Nguyen
    ...     Description: The user can view details of the Patient Manual sub-tab of the Support page
    ...
    ...     Precondition:
    ...     - The user is on the Support Materials tab of the customer page
    ...
    ...     Test Steps:
    ...     1. Click on the Patient Manual sub-tab
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. The Patient Manual sub-tab of the Support tab of the Support page is highlighted when it's selected
    ...     by the user
    ...     2. There shall be Bioflux button and Biocore/Biotres button for the user to view the document of the desired device
    ...     3. On the PDF viewer, there is a download button
    ...     4. These documents are uploaded by the administrator of the Admin portal

    [Tags]  BF-PHY-SUPPORT-MATERIALS-VIEW-DETAILS-04     manual      R1    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Support
#    Navigate To Support Menu    Support modules
#    ${subtabs}      Get Support Materials Filter Options
#    ${expect_subtabs}        Create List    Onboarding guide     Features manual     Instructions for use     Patient manual     Patient quick guide
#    ${expect_categories}     Create List    Bioflux      Biocore/Biotres
#    Run Keyword And Continue On Failure    Lists Should Be Equal        ${subtabs}[Subtabs]        ${expect_subtabs}
#    Run Keyword And Continue On Failure    Lists Should Be Equal        ${subtabs}[Categories]     ${expect_categories}
#    Filter Support Materials    sub_tab=Patient manual     by_category=Biocore/Biotres
#    ${current_values}       Get Support Materials Current Filter
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Subtab]     Patient manual
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Category]   Biocore/Biotres
#    Filter Support Materials    by_category=Bioflux
#    ${current_values}       Get Support Materials Current Filter
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Subtab]     Patient manual
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Category]   Bioflux
    # Verification PDF file: TBD

BF-PHY-SUPPORT-MATERIALS-DOWNLOAD-06: Download PDF file-Patien manual of Bioflux
    [Documentation]   Author: Trinh Nguyen
    ...     Description: The user can download the Bioflux PDF file on the Patient manual sub-tab
    ...
    ...     Precondition:
    ...     - The user is on the Patient manual sub-tab of the customer page
    ...
    ...     Test Steps:
    ...     1. Click on Biolfux button
    ...     2. Click the Download pdf button
    ...
    ...     Expected Results:
    ...     1. At step 1, the Bioflux PDF file is displayed
    ...     2. At step 2, atfetr the user clicking the download button, the file downloaded shall have its name following
    ...     the format "BiofluxManual"
    ...
    ...     **Others**
    ...     - Update date: 12/06/2023 - Nhan Nguyen

    [Tags]  BF-PHY-SUPPORT-MATERIALS-DOWNLOAD-06  CP-2.11.0     manual    deactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-SUPPORT-MATERIALS-DOWNLOAD-07: Download PDF file-Patien manual of Biocore/Biotres
    [Documentation]   Author: Trinh Nguyen
    ...     Description: The user can download the Biocore/Biotres PDF file on the Patient Manual sub-tab
    ...
    ...     Precondition:
    ...     - The user is on the Patient Manual sub-tab of the customer page
    ...
    ...     Test Steps:
    ...     1. Click on Biocore/Biotres button
    ...     2. Click the Download pdf button
    ...
    ...     Expected Results:
    ...     1. At step 1, the Biocore/Biotres PDF file is displayed
    ...     2. At step 2, atfetr the user clicking the download button, the file downloaded shall have its name following
    ...     the format "Biocore/BiotresManual"
    ...
    ...     **Others**
    ...     - Update date: 12/06/2023 - Nhan Nguyen

    [Tags]  BF-PHY-SUPPORT-MATERIALS-DOWNLOAD-07  CP-2.11.0     manual    deactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-SUPPORT-MATERIALS-VIEW-DETAILS-05: View details of the Patient Quick Guide sub-tab
    [Documentation]   Author: Trinh Nguyen
    ...     Description: The user can view details of the Patient Quick Guide sub-tab of the Support page
    ...
    ...     Precondition:
    ...     - The user is on the Support Materials tab of the customer page
    ...
    ...     Test Steps:
    ...     1. Click on the Patient Quick Guide sub-tab
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. The Patient Quick Guide sub-tab of the Support tab of the Support page is highlighted when it's selected
    ...     by the user
    ...     2. There shall be Bioflux button and Biocore/Biotres button for the user to view the document of the desired device
    ...     3. On the PDF viewer, there is a download button
    ...     4. These documents are uploaded by the administrator of the Admin portal

    [Tags]  BF-PHY-SUPPORT-MATERIALS-VIEW-DETAILS-05     manual      R1    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Support
#    Navigate To Support Menu    Support modules
#    ${subtabs}      Get Support Materials Filter Options
#    ${expect_subtabs}        Create List    Onboarding guide     Features manual     Instructions for use     Patient manual     Patient quick guide
#    ${expect_categories}     Create List    Bioflux      Biocore/Biotres
#    Run Keyword And Continue On Failure    Lists Should Be Equal        ${subtabs}[Subtabs]        ${expect_subtabs}
#    Run Keyword And Continue On Failure    Lists Should Be Equal        ${subtabs}[Categories]     ${expect_categories}
#    Filter Support Materials    sub_tab=Patient quick guide     by_category=Biocore/Biotres
#    ${current_values}       Get Support Materials Current Filter
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Subtab]     Patient quick guide
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Category]   Biocore/Biotres
#    Filter Support Materials    by_category=Bioflux
#    ${current_values}       Get Support Materials Current Filter
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Subtab]     Patient quick guide
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Category]   Bioflux
    # Verification PDF file: TBD

BF-PHY-SUPPORT-MATERIALS-DOWNLOAD-08: Download PDF file-Patient Quick Guide of Bioflux
    [Documentation]   Author: Trinh Nguyen
    ...     Description: The user can download the Bioflux PDF file on the Patient Quick Guide sub-tab
    ...
    ...     Precondition:
    ...     - The user is on the Patient Quick Guide sub-tab of the customer page
    ...
    ...     Test Steps:
    ...     1. Click on Biolfux button
    ...     2. Click the Download pdf button
    ...
    ...     Expected Results:
    ...     1. At step 1, the Bioflux PDF file is displayed
    ...     2. At step 2, atfetr the user clicking the download button, the file downloaded shall have its name following
    ...     the format "BiofluxQuickGuide"
    ...
    ...     **Others**
    ...     - Update date: 12/06/2023 - Nhan Nguyen

    [Tags]  BF-PHY-SUPPORT-MATERIALS-DOWNLOAD-08  CP-2.11.0     manual    deactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-SUPPORT-MATERIALS-DOWNLOAD-09: Download PDF file-Patient Quick Guide of Biocore/Biotres
    [Documentation]   Author: Trinh Nguyen
    ...     Description: The user can download the Biocore/Biotres PDF file on the Patient Quick Guide sub-tab
    ...
    ...     Precondition:
    ...     - The user is on the Patient Quick Guide sub-tab of the customer page
    ...
    ...     Test Steps:
    ...     1. Click on Biocore/Biotres button
    ...     2. Click the Download pdf button
    ...
    ...     Expected Results:
    ...     1. At step 1, the Biocore/Biotres PDF file is displayed
    ...     2. At step 2, atfetr the user clicking the download button, the file downloaded shall have its name following
    ...     the format "Biocore/BiotresQuickGuide"
    ...
    ...     **Others**
    ...     - Update date: 12/06/2023 - Nhan Nguyen

    [Tags]  BF-PHY-SUPPORT-MATERIALS-DOWNLOAD-09  CP-2.11.0     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-PHY-SUPPORT-MODULES-01-CP-2.25.0: Menu Item Display Updated to "Support Modules"
    [Documentation]   Author: Tam Ho
    ...     Description: 
    ...     The menu item displays "Support Modules" instead of "Support Materials"
    ...
    ...     Precondition:
    ...     The user is on the Support page
    ...
    ...     Test Steps:
    ...     1. Observe the the left bar navigational menu
    ...
    ...     Expected Results:
    ...     1. The menu item displays the text "Support Modules."

    [Tags]  BF-PHY-SUPPORT-MODULES-01-CP-2.25.0    CP-2.25.0     manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-PHY-SUPPORT-MODULES-02-CP-2.25.0: The List of Support Modules is Sorted by Index in Ascending Order
    [Documentation]   Author: Tam Ho
    ...     Description:
    ...     The list of support modules is displayed in ascending order based on their index values
    ...
    ...     Precondition:
    ...     The Admin portal contains support modules with varying index values
    ...
    ...     Test Steps:
    ...     1. Navigate to the Support Modules section.
    ...     2. Observe the order of the support modules displayed.
    ...
    ...     Expected Results:
    ...     Support modules are displayed in ascending order based on their index values from smallest to largest

    [Tags]  BF-PHY-SUPPORT-MODULES-02-CP-2.25.0    CP-2.25.0     manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-PHY-SUPPORT-MODULES-03-CP-2.25.0: Each Module Displays an Image, Title, and Description
    [Documentation]   Author: Tam Ho
    ...     Description:
    ...     Each support module displays an image (first page of the PDF), title, and description in the list view
    ...
    ...     Precondition:
    ...     Support modules with associated PDFs, titles, and descriptions exist in the system
    ...
    ...     Test Steps:
    ...     1. Navigate to the Support Modules section.
    ...     2. Verify that each support module displays:
    ...         - An image (the first page of the PDF).
    ...         - A title.
    ...         - A description.
    ...
    ...     Expected Results:
    ...     1. Each module displays:
    ...         - An image derived from the first page of the PDF.
    ...         - clear and correctly formatted title.
    ...         - A descriptive text that matches the Admin portal entry.

    [Tags]  BF-PHY-SUPPORT-MODULES-03-CP-2.25.0  CP-2.25.0     manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-PHY-SUPPORT-MODULES-04-CP-2.25.0: Clicking "View" Opens the PDF in a Viewer
    [Documentation]   Author: Tam Ho
    ...     Description:
    ...     Clicking the "View" button for a support module opens the associated PDF in a viewer
    ...
    ...     Precondition:
    ...     Support modules with associated PDFs, titles, and descriptions exist in the system
    ...
    ...     Test Steps:
    ...     1. Navigate to the Support Modules section
    ...     2. Locate a module and click on the "View" button
    ...
    ...     Expected Results:
    ...     1. The PDF file opens

    [Tags]  BF-PHY-SUPPORT-MODULES-04-CP-2.25.0  CP-2.25.0     manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-PHY-SUPPORT-MODULES-05-CP-2.25.0: Users Can Download the PDF
    [Documentation]   Author: Tam Ho
    ...     Description:
    ...     Users can download the PDF document from the viewer after clicking "View"
    ...
    ...     Precondition:
    ...     Support modules with associated PDFs, titles, and descriptions exist in the system
    ...
    ...     Test Steps:
    ...     1. Navigate to the Support Modules section
    ...     2. Locate a module and click on the "View" button
    ...     3. In the PDF viewer, click on the "Download" option
    ...
    ...     Expected Results:
    ...     1. The PDF document downloads successfully

    [Tags]  BF-PHY-SUPPORT-MODULES-05-CP-2.25.0  CP-2.25.0     manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-PHY-SUPPORT-MODULES-06-CP-2.25.0: The First Page of the PDF Is Displayed as an Image
    [Documentation]   Author: Tam Ho
    ...     Description:
    ...     Ensure that the first page of each PDF document is displayed as the module's image in the list view
    ...
    ...     Precondition:
    ...     Support modules with associated PDFs, titles, and descriptions exist in the system
    ...
    ...     Test Steps:
    ...     1. Navigate to the Support Modules section
    ...     2. Observe the image displayed for each support module
    ...
    ...     Expected Results:
    ...     1. The image displayed for each support module corresponds to the first page of its PDF document

    [Tags]  BF-PHY-SUPPORT-MODULES-06-CP-2.25.0  CP-2.25.0     manual    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-PHY-SUPPORT-DEVICE-MANUALS-01-CP-2.25.0: The First Page of the PDF Is Displayed as an Image
    [Documentation]   Author: Tam Ho
    ...     Description: The user can view a list of sub-tabs on the device manuals tab
    ...
    ...     Precondition:
    ...     The user is on the Support page
    ...
    ...     Test Steps:
    ...     1. Click on the Device manuals tab in the left bar navigational menu
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. There shall be the following subs-tab displayed on the Device manuals tabs:
    ...     - Instructions for use
    ...     - Patient manual
    ...     - Patient quick guide

    [Tags]  BF-PHY-SUPPORT-DEVICE-MANUALS-01-CP-2.25.0  CP-2.25.0     manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-PHY-SUPPORT-DEVICE-MANUALS-02-CP-2.25.0: View details of the Instructions For Use sub-tab
    [Documentation]   Author: Tam Ho
    ...     Description: The user can view details of the Instructions For Use sub-tab of the Device manuals
    ...
    ...     Precondition:
    ...     The user is on the Device manuals tab
    ...
    ...     Test Steps:
    ...     1. Click on the Instructions For Use sub-tab
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. The Instruction For Use sub-tab of the Device manuals tab of the Support page is highlighted when it's selected
    ...     by the user
    ...     2. There shall be Bioflux button and Biocore/Biotres button for the user to view the document of the desired device
    ...     3. On the PDF viewer, there is a download button
    ...     4. These documents are uploaded by the administrator of the Admin portal

    [Tags]  BF-PHY-SUPPORT-DEVICE-MANUALS-02-CP-2.25.0  CP-2.25.0     manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-PHY-SUPPORT-DEVICE-MANUALS-03-CP-2.25.0: Download PDF file-Instruction for use of Bioflux
    [Documentation]   Author: Tam Ho
    ...     Description: The user can download the Bioflux PDF file on the Instruction For Use sub-tab
    ...
    ...     Precondition:
    ...     - The user is on the Instruction For Use sub-tab of the customer page
    ...
    ...     Test Steps:
    ...     1. Click on Biolfux button
    ...     2. Click the Download pdf button
    ...
    ...     Expected Results:
    ...     1. At step 1, the Bioflux PDF file is displayed
    ...     2. At step 2, atfetr the user clicking the download button, the file downloaded shall have its name following
    ...     the format "BiofluxIFU"

    [Tags]  BF-PHY-SUPPORT-DEVICE-MANUALS-03-CP-2.25.0  CP-2.25.0     manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-PHY-SUPPORT-DEVICE-MANUALS-04-CP-2.25.0: Download PDF file-Instruction for use of Biocore/Biotres
    [Documentation]   Author: Tam Ho
    ...     Description: The user can download the Biocore/Biotres PDF file on the Instruction For Use sub-tab
    ...
    ...     Precondition:
    ...     - The user is on the Instruction For Use sub-tab of the customer page
    ...
    ...     Test Steps:
    ...     1. Click on Biocore/Biotres button
    ...     2. Click the Download pdf button
    ...
    ...     Expected Results:
    ...     1. At step 1, the Biocore/Biotres PDF file is displayed
    ...     2. At step 2, atfetr the user clicking the download button, the file downloaded shall have its name following
    ...     the format "Biocore/BiotresIFU"

    [Tags]  BF-PHY-SUPPORT-DEVICE-MANUALS-04-CP-2.25.0  CP-2.25.0     manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-PHY-SUPPORT-DEVICE-MANUALS-05-CP-2.25.0: View details of the Patient Manual sub-tab
    [Documentation]   Author: Tam Ho
    ...     Description: The user can view details of the Patient Manual sub-tab of the Device manuals
    ...
    ...     Precondition:
    ...     - The user is on the Device manuals
    ...
    ...     Test Steps:
    ...     1. Click on the Patient Manual sub-tab
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. The Patient Manual sub-tab of the Device manuals tab of the Support page is highlighted when it's selected
    ...     by the user
    ...     2. There shall be Bioflux button and Biocore/Biotres button for the user to view the document of the desired device
    ...     3. On the PDF viewer, there is a download button
    ...     4. These documents are uploaded by the administrator of the Admin portal

    [Tags]  BF-PHY-SUPPORT-DEVICE-MANUALS-05-CP-2.25.0  CP-2.25.0     manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-PHY-SUPPORT-DEVICE-MANUALS-06-CP-2.25.0: Download PDF file-Patient Manual of Bioflux
    [Documentation]   Author: Tam Ho
    ...     Description: The user can download the Bioflux PDF file on the Patient Manual sub-tab
    ...
    ...     Precondition:
    ...     - The user is on the Patient Manual sub-tab of the customer page
    ...
    ...     Test Steps:
    ...     1. Click on Biolfux button
    ...     2. Click the Download pdf button
    ...
    ...     Expected Results:
    ...     1. At step 1, the Bioflux PDF file is displayed
    ...     2. At step 2, atfetr the user clicking the download button, the file downloaded shall have its name following
    ...     the format "BiofluxIFU"

    [Tags]  BF-PHY-SUPPORT-DEVICE-MANUALS-06-CP-2.25.0  CP-2.25.0     manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-PHY-SUPPORT-DEVICE-MANUALS-07-CP-2.25.0: Download PDF file-Patien manual of Biocore/Biotres
    [Documentation]   Author: Tam Ho
    ...     Description: The user can download the Biocore/Biotres PDF file on the Patient Manual sub-tab
    ...
    ...     Precondition:
    ...     - The user is on the Patient Manual sub-tab of the customer page
    ...
    ...     Test Steps:
    ...     1. Click on Biocore/Biotres button
    ...     2. Click the Download pdf button
    ...
    ...     Expected Results:
    ...     1. At step 1, the Biocore/Biotres PDF file is displayed
    ...     2. At step 2, atfetr the user clicking the download button, the file downloaded shall have its name following
    ...     the format "Biocore/BiotresManual"

    [Tags]  BF-PHY-SUPPORT-DEVICE-MANUALS-07-CP-2.25.0  CP-2.25.0     manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-PHY-SUPPORT-DEVICE-MANUALS-08-CP-2.25.0: View details of the Patient Quick Guide sub-tab
    [Documentation]   Author: Tam Ho
    ...     Description: The user can view details of the Patient Quick Guide sub-tab of the Support page
    ...
    ...     Precondition:
    ...     - The user is on the Device manuals tab of the customer page
    ...
    ...     Test Steps:
    ...     1. Click on the Patient Quick Guide sub-tab
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. The Patient Quick Guide sub-tab of the Device manuals tab of the Support page is highlighted when it's selected
    ...     by the user
    ...     2. There shall be Bioflux button and Biocore/Biotres button for the user to view the document of the desired device
    ...     3. On the PDF viewer, there is a download button
    ...     4. These documents are uploaded by the administrator of the Admin portal

    [Tags]  BF-PHY-SUPPORT-DEVICE-MANUALS-08-CP-2.25.0  CP-2.25.0     manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-PHY-SUPPORT-DEVICE-MANUALS-09-CP-2.25.0: Download PDF file-Patient Quick Guide of Bioflux
    [Documentation]   Author: Tam Ho
    ...     Description: The user can download the Bioflux PDF file on the Patient Quick Guide sub-tab
    ...
    ...     Precondition:
    ...     - The user is on the Patient Quick Guide sub-tab of the customer page
    ...
    ...     Test Steps:
    ...     1. Click on Biolfux button
    ...     2. Click the Download pdf button
    ...
    ...     Expected Results:
    ...     1. At step 1, the Bioflux PDF file is displayed
    ...     2. At step 2, atfetr the user clicking the download button, the file downloaded shall have its name following
    ...     the format "BiofluxQuickGuide"

    [Tags]  BF-PHY-SUPPORT-DEVICE-MANUALS-09-CP-2.25.0  CP-2.25.0     manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-PHY-SUPPORT-DEVICE-MANUALS-10-CP-2.25.0: Download PDF file-Patient Quick Guide of Biocore/Biotres
    [Documentation]   Author: Tam Ho
    ...     Description: The user can download the Biocore/Biotres PDF file on the Patient Quick Guide sub-tab
    ...
    ...     Precondition:
    ...     - The user is on the Patient Quick Guide sub-tab of the customer page
    ...
    ...     Test Steps:
    ...     1. Click on Biocore/Biotres button
    ...     2. Click the Download pdf button
    ...
    ...     Expected Results:
    ...     1. At step 1, the Biocore/Biotres PDF file is displayed
    ...     2. At step 2, atfetr the user clicking the download button, the file downloaded shall have its name following
    ...     the format "Biocore/BiotresQuickGuide"

    [Tags]  BF-PHY-SUPPORT-DEVICE-MANUALS-10-CP-2.25.0  CP-2.25.0     manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

# Notes: Facing issue relative to Search by Patient Name -> Failed
BF-PHY-SUPPORT-SUBMIT-REQUEST-01: Submit a request with Change study type category
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The user can submit a request with Change study type category to the support email address
    ...     of Biotricity
    ...
    ...     Precondition:
    ...     - The user is on the support page
    ...     - The New Request button has been clicked
    ...
    ...     Test Steps:
    ...     1. Click and Select a specific facility on the Your facility dropdown list
    ...     2. Select the Change study type category
    ...     3. Enter the patient name or study ID on the Search field
    ...     4. Select a study card from the search result and select a new study type
    ...     5. Enter an message on the Message textbox
    ...     6. Enter an email on the Notification email field
    ...     7. Click the Send request button
    ...
    ...     Expected Results:
    ...     1. At step 1, there shall be a drop-down list of facilities if the user associates with more than one
    ...     facility. The facility name attribute shall be hidden if the user only associates with one facility
    ...     - The selected facility shall be displayed
    ...     2. At step 2, a selected category shall be highlighted
    ...     3. At step 3, the dropdown list shall be displayed all studies matching with the user's search and belonging
    ...     to the user's facility:
    ...     - The search result shall consist of the following information:
    ...     + Patient Name (Gender - Age)
    ...     + Date of Birth
    ...     + Study ID
    ...     + Start Date
    ...     + End Date
    ...     + Current Study Type
    ...     - In case there are no results matching the user's search. There shall be a message displayed as follows:
    ...     "No results match your search"
    ...     4. At step 4, the result shal be displayed as a card with the following information:
    ...     + Patient Name
    ...     + Study ID
    ...     + Start Date
    ...     + End Date
    ...     + Current study type
    ...     + New study type - a dropdown list allowing the user to select new desired study type
#    Break to new case
#    ...     - In case the current study type is HOLTER AND FOLLOW ON, there shall be a message stating: "Please note that
#    ...     the follow-on study will be removed" displayed under the Current study type field
#    ...     - In case the new study type is HOLTER AND FOLLOW ON, there shall be a message stating "Please make sure to
#    ...     specify the follow-on study in your message if you select Holter and Follow-on study as your new study type"
#    ...     displayed under the New study type field
    ...     - The user must choose a new study type different to the current one
    ...     5. At step 5, the entered messaged shall be displayed
    ...     6. At step 6, the entered email shall be displayed
    ...     7. At step 7, a success message stating: “We have received your request and will email you back when it has
    ...     been completed”shall be appeared on the screen after the user has submitted/sent the request to cs@biotricity.com

    [Tags]  BF-PHY-SUPPORT-SUBMIT-REQUEST-01     auto
    ${completed_studies}     Get Studies - Completed On     ${FACILITIES}[0][name]
    ${study_id}              Set Variable    ${completed_studies}[0][Study ID]
    Navigate To Support
    Navigate To Support Menu    Support request
    Create New Support Request  facility=${FACILITIES}[0][name]     category=Change study type    send_request=${False}
    ${options}       Get New Support Request Options
    Run Keyword And Continue On Failure    Length Should Be    ${options}[Facilities]       2       # Only correct with current user
    ${search_studies}      Get Change Study Type Search By Study Options    search_by=Study ID    text_search=000000000  # Get `No result match your search` message
    Run Keyword And Continue On Failure    Should Be Equal    ${search_studies}        No results match your search
    # Get and verify Search by study options
    ${search_studies}      Get Change Study Type Search By Study Options     search_by=Study ID    text_search=${study_id}
    Run Keyword And Continue On Failure    Should Not Be Equal      ${search_studies}    No results match your search
    Run Keyword And Continue On Failure    Should Be True           all('${study_id}'.lower() in st['Study ID'].lower() for st in ${search_studies})      Invalid results not contain Study ID `${study_id}` are showing
    # Get and verify Search option attributes
    ${search_option_attributes}      Evaluate    [k for k, v in ${search_studies}[0].items()]
    ${expect_option_attributes}      Create List    Patient Name      Study Type      DOB      Study ID     Start Date      End Date
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${search_option_attributes}     ${expect_option_attributes}
    # Selected study test
    ${selected_study}     Create Dictionary    search_by=Study ID       text_search=${study_id}      new_study_type=HOLTER
    Create New Support Request    facility=${FACILITIES}[0][name]       category=Change study type      change_study_type_filter=${selected_study}
    ...  message=Submit a request with Change study type category     email=qc123@yopmail.com     send_request=${False}
    ${current_values}       Get Current New Support Request Values
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${current_values}[Studies][0][Study ID]       ${study_id}
    Run Keyword And Continue On Failure    Should Contain     ${search_studies}[0][Patient Name]             ${current_values}[Studies][0][Patient name]
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Request category]            Change study type
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Facility]                    ${FACILITIES}[0][name]
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Notification email][0]       qc123@yopmail.com
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Message]                     Submit a request with Change study type category
    Create New Support Request    send_request=${True}
    ${success_msg}      Get Toast Success Message
    Run Keyword And Continue On Failure    Should Be Equal    ${success_msg}      We have received your request and will email you back when it has been completed
    [Teardown]      Resolve Request        Change study type

BF-PHY-SUPPORT-SUBMIT-REQUEST-02: Submit a request with Abort study category
    [Documentation]   Author: Nhan Nguyen
    ...
    ...     Description: The user can submit a request with Abort study category to the support email address
    ...     of Biotricity
    ...
    ...     Precondition:
    ...     - The user is on the support page
    ...     - The New Request button has been clicked
    ...
    ...     Test Steps:
    ...     1. Click and Select a specific facility on the Your facility dropdown list
    ...     2. Select the Abort study category
    ...     3. Enter one or multiple study IDs seperated by commas or spaces on the Search field
    ...     4. Enter an message on the Message textbox
    ...     5. Enter an email on the Notification email field
    ...     6. Click the Send request button
    ...
    ...     Expected Results:
    ...     1. At step 1, there shall be a drop-down list of facilities if the user associates with more than one
    ...     facility. The facility name attribute shall be hidden if the user only associates with one facility
    ...     - The selected facility shall be displayed
    ...     2. At step 2, a selected category shall be highlighted
#    Break to new case
#    ...     3. At step 3, in case the clinic user enters an invalid Study ID or a study ID having an open ticket, the number shall be labeled in red
#    ...     When the user mouses over the study ID, there shall be an error message displayed, it can be:
#    ...     - Invalid study ID
#    ...     - This study currently has an open request
    ...     3. At step 4, the entered messaged shall be displayed
    ...     4. At step 5, the entered email shall be displayed
    ...     5. At step 6, a success message stating: “We have received your request and will email you back when it has
    ...     been completed”shall be appeared on the screen after the user has submitted/sent the request to cs@biotricity.com

    [Tags]  BF-PHY-SUPPORT-SUBMIT-REQUEST-02    auto
    ${studies}        Get Studies - Completed On       ${FACILITIES}[0][name]
    ${study_id}       Set Variable      ${studies}[0][Study ID]
    Navigate To Support
    Navigate To Support Menu     Support Request
    Create New Support Request   facility=${FACILITIES}[0][name]    category=Abort study    study_ids=${study_id}    message=Test Message    email=testemail@yopmail.com   send_request=${False}
    ${values}       Get Current New Support Request Values
    Run Keyword And Continue On Failure    Should Be Equal              ${values}[Facility]             ${FACILITIES}[0][name]
    Run Keyword And Continue On Failure    Should Be Equal              ${values}[Request category]     Abort study
    Run Keyword And Continue On Failure    List Should Contain Value    ${values}[Study IDs]            ${study_id}
    Run Keyword And Continue On Failure    Should Be Equal              ${values}[Message]              Test Message
    Run Keyword And Continue On Failure    List Should Contain Value    ${values}[Notification email]   testemail@yopmail.com
    Create New Support Request    send_request=${True}
    ${message}      Get Toast Success Message
    Run Keyword And Continue On Failure    Should Be Equal    ${message}    We have received your request and will email you back when it has been completed
    Filter Support Request    by_status=Open    by_category=Abort study
    ${requests}     Get List Support Request
    Run Keyword And Continue On Failure    Should Be Equal      ${requests}[0][Status]      Open
    Run Keyword And Continue On Failure    Should Be Equal      ${requests}[0][Facility]    ${FACILITIES}[0][name]
    Run Keyword And Continue On Failure    Should Be Equal      ${requests}[0][Category]    Abort study
    Run Keyword And Continue On Failure    Should Be Equal      ${requests}[0][Requestor]   ${PHY_USER}[0][name]
    [Teardown]      Resolve Request        Abort study

BF-PHY-SUPPORT-SUBMIT-REQUEST-03: Submit a request with Report request category
    [Documentation]   Author: Nhan Nguyen
    ...
    ...     Description: The user can submit a request with Report request category to the support email address
    ...     of Biotricity
    ...
    ...     Precondition:
    ...     - The user is on the support page
    ...     - The New Request button has been clicked
    ...
    ...     Test Steps:
    ...     1. Click and Select a specific facility on the Your facility dropdown list
    ...     2. Select the Report request category
    ...     3. Enter one or multiple study IDs seperated by commas or spaces on the Search field
    ...     4. Enter an message on the Message textbox
    ...     5. Enter an email on the Notification email field
    ...     6. Click the Send request button
    ...
    ...     Expected Results:
    ...     1. At step 1, there shall be a drop-down list of facilities if the user associates with more than one
    ...     facility. The facility name attribute shall be hidden if the user only associates with one facility
    ...     - The selected facility shall be displayed
    ...     2. At step 2, a selected category shall be highlighted
#    Break to new case
#    ...     3. At step 3, in case the clinic user enters an invalid Study ID or a study ID having an open ticket, the number shall be labeled in red
#    ...     When the user mouses over the study ID, there shall be an error message displayed, it can be:
#    ...     - Invalid study ID
#    ...     - This study currently has an open request
    ...     3. At step 4, the entered messaged shall be displayed
    ...     4. At step 5, the entered email shall be displayed
    ...     5. At step 6, a success message stating: “We have received your request and will email you back when it has
    ...     been completed”shall be appeared on the screen after the user has submitted/sent the request to cs@biotricity.com

    [Tags]  BF-PHY-SUPPORT-SUBMIT-REQUEST-03    auto
    ${studies}        Get Studies - Completed On       ${FACILITIES}[0][name]
    ${study_id}       Set Variable      ${studies}[0][Study ID]
    Navigate To Support
    Navigate To Support Menu   Support Request
    Create New Support Request   facility=${FACILITIES}[0][name]    category=Report request   study_ids=${study_id}    message=Test Message    email=testemail@yopmail.com    send_request=${False}
    ${values}       Get Current New Support Request Values
    Run Keyword And Continue On Failure    Should Be Equal              ${values}[Facility]             ${FACILITIES}[0][name]
    Run Keyword And Continue On Failure    Should Be Equal              ${values}[Request category]     Report request
    Run Keyword And Continue On Failure    List Should Contain Value    ${values}[Study IDs]            ${study_id}
    Run Keyword And Continue On Failure    Should Be Equal              ${values}[Message]              Test Message
    Run Keyword And Continue On Failure    List Should Contain Value    ${values}[Notification email]   testemail@yopmail.com
    Create New Support Request    send_request=${True}
    ${message}      Get Toast Success Message
    Run Keyword And Continue On Failure    Should Be Equal    ${message}    We have received your request and will email you back when it has been completed
    Filter Support Request    by_status=Open    by_category=Report request
    ${requests}     Get List Support Request
    Run Keyword And Continue On Failure    Should Be Equal      ${requests}[0][Status]      Open
    Run Keyword And Continue On Failure    Should Be Equal      ${requests}[0][Facility]    ${FACILITIES}[0][name]
    Run Keyword And Continue On Failure    Should Be Equal      ${requests}[0][Category]    Report request
    Run Keyword And Continue On Failure    Should Be Equal      ${requests}[0][Requestor]   ${PHY_USER}[0][name]
    [Teardown]      Resolve Request        Report request

BF-PHY-SUPPORT-SUBMIT-REQUEST-04: Submit a request with Web portal issues category
    [Documentation]   Author: Nhan Nguyen
    ...
    ...     Description: The user can submit a request with Web portal issues category to the support email address
    ...     of Biotricity
    ...
    ...     Precondition:
    ...     - The user is on the support page
    ...     - The New Request button has been clicked
    ...
    ...     Test Steps:
    ...     1. Click and Select a specific facility on the Your facility dropdown list
    ...     2. Select the Web portal issues category
    ...     3. Enter an message on the Message textbox
    ...     4. Enter an email on the Notification email field
    ...     5. Click the Send request button
    ...
    ...     Expected Results:
    ...     1. At step 1, there shall be a drop-down list of facilities if the user associates with more than one
    ...     facility.  # The facility name attribute shall be hidden if the user only associates with one facility
    ...     - The selected facility shall be displayed
    ...     2. At step 2, a selected category shall be highlighted
    ...     3. At step 3, the entered messaged shall be displayed
    ...     4. At step 4, the entered email shall be displayed
    ...     5. At step 5, a success message stating: “We have received your request and will email you back when it has
    ...     been completed”shall be appeared on the screen after the user has submitted/sent the request to cs@biotricity.com

    [Tags]  BF-PHY-SUPPORT-SUBMIT-REQUEST-04      auto
    Navigate To Support
    Navigate To Support Menu    Support request
    Navigate To New Support Request
    ${request_options}      Get New Support Request Options
    Run Keyword And Continue On Failure    Length Should Be    ${request_options}[Facilities]       2
    Create New Support Request      facility=${FACILITIES}[1][name]     category=Web portal issues      message=Submit Web portal issues request     email=abc@yopmail.com, abc_1st@yopmail.com    send_request=${False}
    ${current_values}       Get Current New Support Request Values
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Facility]                    ${FACILITIES}[1][name]
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Request category]            Web portal issues
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Message]                     Submit Web portal issues request
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Notification email][0]       abc@yopmail.com
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Notification email][1]       abc_1st@yopmail.com
    Create New Support Request    send_request=${True}
    ${success_msg}      Get Toast Success Message
    Run Keyword And Continue On Failure    Should Be Equal    ${success_msg}      We have received your request and will reach out to you to let you know when the issue has been resolved

BF-PHY-SUPPORT-SUBMIT-REQUEST-05: Submit a request with Others category
    [Documentation]   Author: Nhan Nguyen
    ...
    ...     Description: The user can submit a request with Others category to the support email address
    ...     of Biotricity
    ...
    ...     Precondition:
    ...     - The user is on the support page
    ...     - The New Request button has been clicked
    ...
    ...     Test Steps:
    ...     1. Click and Select a specific facility on the Your facility dropdown list
    ...     2. Select the Others category
    ...     3. Enter an message on the Message textbox
    ...     4. Enter an email on the Notification email field
    ...     5. Click the Send request button
    ...
    ...     Expected Results:
    ...     1. At step 1, there shall be a drop-down list of facilities if the user associates with more than one
    ...     facility.  #  The facility name attribute shall be hidden if the user only associates with one facility
    ...     - The selected facility shall be displayed
    ...     2. At step 2, a selected category shall be highlighted
    ...     3. At step 3, the entered messaged shall be displayed
    ...     4. At step 4, the entered email shall be displayed
    ...     5. At step 5, a success message stating: “We have received your request and will email you back when it has
    ...     been completed”shall be appeared on the screen after the user has submitted/sent the request to cs@biotricity.com

    [Tags]  BF-PHY-SUPPORT-SUBMIT-REQUEST-05      auto
    Navigate To Support
    Navigate To Support Menu    Support request
    Navigate To New Support Request
    ${request_options}      Get New Support Request Options
    Run Keyword And Continue On Failure    Length Should Be    ${request_options}[Facilities]       2
    Create New Support Request      facility=${FACILITIES}[0][name]     category=Others      message=Others support request     email=abc@yopmail.com, abc_1st@yopmail.com    send_request=${False}
    ${current_values}       Get Current New Support Request Values
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Facility]                    ${FACILITIES}[0][name]
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Request category]            Others
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Message]                     Others support request
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Notification email][0]       abc@yopmail.com
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Notification email][1]       abc_1st@yopmail.com
    Create New Support Request    send_request=${True}
    ${success_msg}      Get Toast Success Message
    Run Keyword And Continue On Failure    Should Be Equal    ${success_msg}      We have received your request and will get back to you as soon as possible

BF-PHY-SUPPORT-SUBMIT-REQUEST-06: Submit a request with Billing questions category
    [Documentation]   Author: Nhan Nguyen
    ...
    ...     Description: The user can submit a request with Billing questions category to the support email address
    ...     of Biotricity
    ...
    ...     Precondition:
    ...     - The user is on the support page
    ...     - The New Request button has been clicked
    ...
    ...     Test Steps:
    ...     1. Click and Select a specific facility on the Your facility dropdown list
    ...     2. Select the Billing questions category
    ...     3. Select one of the following Billing issues:
    ...     - I want to pay my bill.
    ...     - I have inquiries about my invoice.
    ...     - My account is on hold.
    ...     - Other
    ...     4. Enter an message on the Message textbox
    ...     5. Enter an email on the Notification email field
    ...     6. Click the Send request button
    ...
    ...     Expected Results:
    ...     1. At step 1, there shall be a drop-down list of facilities if the user associates with more than one
    ...     facility.   # The facility name attribute shall be hidden if the user only associates with one facility
    ...     - The selected facility shall be displayed
    ...     2. At step 2, a selected category shall be highlighted
    ...     3. At step 3, the selected option shall be displayed
    ...     4. At step 4, the entered messaged shall be displayed
    ...     5. At step 5, the entered email shall be displayed
    ...     6. At step 6, a success message stating: “We have received your request and will email you back when it has
    ...     been completed”shall be appeared on the screen after the user has submitted/sent the request to cs@biotricity.com

    [Tags]  BF-PHY-SUPPORT-SUBMIT-REQUEST-06     auto
    Navigate To Support
    Navigate To Support Menu    Support request
    Navigate To New Support Request
    ${request_options}      Get New Support Request Options
    Run Keyword And Continue On Failure    Length Should Be    ${request_options}[Facilities]       2
    Create New Support Request      facility=${FACILITIES}[0][name]     category=Billing questions     billing_issue=I have inquiries about my invoice.      message=Billing questions support request     email=abc@yopmail.com, abc_1st@yopmail.com    send_request=${False}
    ${current_values}       Get Current New Support Request Values
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Facility]                    ${FACILITIES}[0][name]
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Request category]            Billing questions
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Billing issue]               I have inquiries about my invoice.
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Message]                     Billing questions support request
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Notification email][0]       abc@yopmail.com
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Notification email][1]       abc_1st@yopmail.com
    Create New Support Request    send_request=${True}
    ${success_msg}      Get Toast Success Message
    Run Keyword And Continue On Failure    Should Be Equal    ${success_msg}      We have received your request and someone from our billing department will be reaching out to you shortly

BF-PHY-SUPPORT-SEND-FEEDBACK-01: Send feedback to Biotricity
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can send feedback to Biotricity
    ...
    ...     Precondition:
    ...     - The user is on Support page
    ...
    ...     Test Steps:
    ...     1. Click the Send Feedback button and select "Feedback" category
    ...     2. Click on the Facility dropdown list, then select a specific facility
    ...     3. Input an email address on Your email field
    ...     4. Input a message on the Your message textbox
    ...     5. Click the Submit button
    ...
    ...     Expected Results:
    ...     1. At step 2, the facility name attribute shall be hidden if the user only associates with one facility
    ...     2. At step 5, if all the inputs are valid, pressing the button will send the message to support@biotricity.com,
    ...     the mailbox of the return email will receive a confirmation email
    ...
    ...    **Others**
    ...    Nhan Nguyen - 03/18/2025 (auto)

    [Tags]  BF-PHY-SUPPORT-SEND-FEEDBACK-01    CP-2.12.0       auto    R1
    Navigate To Top Menu    Support
    Send Feedback Or Feature Request    category=Feedback    facility=Facility_QA_01    email=nhantestitr@gmail.com    message=Nhan Test Feedback

BF-PHY-SUPPORT-SEND-FEEDBACK-02: Send feature request to Biotricity

    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can send feature request to Biotricity
    ...
    ...     Precondition:
    ...     - The user is on Support page
    ...
    ...     Test Steps:
    ...     1. Click the Send Feedback button and select "Feature request" category
    ...     2. Click on the Facility dropdown list, then select a specific facility
    ...     3. Input an email address on Your email field
    ...     4. Input a message on the Your message textbox
    ...     5. Click the Submit button
    ...
    ...     Expected Results:
    ...     1. At step 2, the facility name attribute shall be hidden if the user only associates with one facility
    ...     2. At step 5, if all the inputs are valid, pressing the button will send the message to support@biotricity.com,
    ...     the mailbox of the return email will receive a confirmation email
    ...
    ...    **Others**
    ...    Nhan Nguyen - 03/19/2025 (auto)

    [Tags]  BF-PHY-SUPPORT-SEND-FEEDBACK-02       auto    R1
    Navigate To Top Menu    Support
    Send Feedback Or Feature Request    category=Feature request    facility=Facility_QA_01    email=nhantestitr@gmail.com    message=Nhan Test Feature Request

BF-PHY-SUPPORT-SEND-FEEDBACK-03: Cannot send feedback with empty all required fields
    [Documentation]  Author: Nhan Nguyen
    ...     Description: Cannot send feedback with empty all required fields
    ...
    ...     Precondition:
    ...     - The user is on Support page
    ...
    ...     Test Steps:
    ...     1. Click the Send Feedback button
    ...     2. Leave empty value on Your email field
    ...     4. Leave empty value on the Your message textbox
    ...     5. Click the Submit button
    ...
    ...     Expected Results:
    ...     Display error message "Invalid value" under Your email field and Your message field
    ...
    ...    **Others**
    ...    Nhan Nguyen - 03/19/2025 (auto)

    [Tags]  BF-PHY-SUPPORT-SEND-FEEDBACK-03       auto
    Navigate To Top Menu    Support
    Send Feedback Or Feature Request    category=Feedback
    ${email_err}    Get Email Err Feedback
    ${message_err}    Get Message Err Feedback
    Run Keyword And Continue On Failure    Should Be Equal    ${email_err}   Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${message_err}   Invalid value
    Close Send Feedback Modal

BF-PHY-SUPPORT-SEND-FEEDBACK-04: Cannot send feature request with empty all required fields

    [Documentation]  Author: Nhan Nguyen
    ...     Description: Cannot send feature request with empty all required fields
    ...
    ...     Precondition:
    ...     - The user is on Support page
    ...
    ...     Test Steps:
    ...     1. Click the Send Feedback button and select "Feature request" category
    ...     2. Leave empty value on Your email field
    ...     4. Leave empty value on the Your message textbox
    ...     5. Click the Submit button
    ...
    ...     Expected Results:
    ...     Display error message "Invalid value" under Your email field and Your message field
    ...
    ...    **Others**
    ...    Nhan Nguyen - 03/18/2025 (auto)

    [Tags]  BF-PHY-SUPPORT-SEND-FEEDBACK-04       auto
    Send Feedback Or Feature Request    category=Feature request
    ${email_err}    Get Email Err Feedback
    ${message_err}    Get Message Err Feedback
    Run Keyword And Continue On Failure    Should Be Equal    ${email_err}   Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${message_err}   Invalid value
    Close Send Feedback Modal

BF-PHY-SUPPORT-FILTER-FACILITY-01: Filter the facility
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can filter the facility
    ...
    ...     Precondition:
    ...     - The user is on the Inbox/Studies/Devices/Fleet page
    ...
    ...     Test Steps:
    ...     1. Click on the Facility dropdown list, then select a specific facility
    ...     2. Click on the Support page
    ...     3. Observe the Your facility dropdown list
    ...
    ...     Expected Results:
    ...     1. The facility on the Your facility dropdown list is shown as the facility name selected at step 1

    [Tags]  BF-PHY-SUPPORT-FILTER-FACILITY-01       auto
    # From inbox
    Navigate To Inbox
    Select Facility    ${FACILITIES}[0][name]
    # Verify
    Navigate To Support
    Navigate To Send Feedback
    ${values}       Get Send Feedback Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    ${values}[Current Facility]      ${values}[Your Facility]
    # From studies
    Navigate To Studies Page
    Select Facility    ${FACILITIES}[1][name]
    # Verify
    Navigate To Support
    Navigate To Send Feedback
    ${values}       Get Send Feedback Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    ${values}[Current Facility]      ${values}[Your Facility]
    # From devices
    Navigate To Devices
    Select Facility    ${FACILITIES}[0][name]
    # Verify
    Navigate To Support
    Navigate To Send Feedback
    ${values}       Get Send Feedback Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    ${values}[Current Facility]      ${values}[Your Facility]
    # From fleet
    Navigate To Fleet
    Select Facility    ${FACILITIES}[1][name]
    # Verify
    Navigate To Support
    Navigate To Send Feedback
    ${values}       Get Send Feedback Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    ${values}[Current Facility]      ${values}[Your Facility]
    Navigate To Support
    [Teardown]    Select Facility    All facilities

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}       Start Browser
    Import Library        project_bioflux_clinic_portal/lib/web/Common.py         ${BROWSER_NODE}  ${ENV}       WITH NAME   CpCommon
    Import Library        project_bioflux_callcenter_portal/lib/web/Common.py     ${BROWSER_NODE}  ${ENV}       WITH NAME   CcCommon
    Import Library        project_bioflux_clinic_portal/lib/web/Support.py        ${BROWSER_NODE}  ${ENV}
    Import Library        project_bioflux_clinic_portal/lib/web/Inbox.py          ${BROWSER_NODE}  ${ENV}
    Import Library        project_bioflux_clinic_portal/lib/web/Studies.py        ${BROWSER_NODE}  ${ENV}
    Import Library        project_bioflux_clinic_portal/lib/web/Devices.py        ${BROWSER_NODE}  ${ENV}
    Import Library        project_bioflux_clinic_portal/lib/web/Fleet.py          ${BROWSER_NODE}  ${ENV}
    ${PHY_USER}           CpConfig.Get Config Param       NEW_USER > clinic_physician
    ${FACILITIES}         CpConfig.Get Config Param       FACILITY
    ${TOKEN}              Sign In Bioflux       username=${PHY_USER}[0][username]       password=${PHY_USER}[0][password]
    ${VERSION}            Get Release Version
    Set Suite Variable    ${PHY_USER}
    Set Suite Variable    ${FACILITIES}
    Set Suite Metadata    version     ${VERSION}
    Set Suite Metadata    browser     ${BROWSER.capitalize()}
    Set Suite Variable    ${TOKEN}

SUITE TEARDOWN
    Quit Browser

Filter Support - Request
    [Arguments]     ${status}=${EMPTY}        ${category}=${EMPTY}      ${text_search}=${EMPTY}
    Navigate To Support
    Navigate To Support Menu   Support Request
    Filter Support Request     by_status=${status}      by_category=${category}     text_search=${text_search}
    ${requests}      Get List Support Request
    Run Keyword And Continue On Failure    Should Not Be Empty    ${requests}     No support requests found
    # Status
    Run Keyword If    '${status}' != '${EMPTY}' and '${status.lower()}' != 'all statuses'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${status}'.lower() == s['Status'].lower() for s in ${requests})      Invalid results are showing - with status `${status}`
    Run Keyword If    '${status}' != '${EMPTY}' and '${status.lower()}' == 'all statuses'
    ...  Run Keyword And Continue On Failure    Should Not Be Empty    ${requests}    No support requests found - with status `all statuses`
    # Category
    Run Keyword If    '${category}' != '${EMPTY}' and '${category.lower()}' != 'all requests'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${category}'.lower() == s['Category'].lower() for s in ${requests})      Invalid results are showing - with category `${category}`
    Run Keyword If    '${category}' != '${EMPTY}' and '${category.lower()}' == 'all requests'
    ...  Run Keyword And Continue On Failure    Should Not Be Empty    ${requests}    No support requests found - with category `all requests`
    # Request ID
    Run Keyword If    '${text_search}' != '${EMPTY}'  Run Keywords
    ...  Run Keyword And Continue On Failure    Length Should Be    ${requests}     1
    ...  AND    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${text_search}      ${requests}[0][Request ID]

Get Studies - Completed On
    [Arguments]    ${facility}
    Navigate To Studies Page
    Select Facility     facility=${facility}
    Filter Studies      study_state=Completed
    ${studies}          Get Completed Studies
    Select Facility     facility=All facilities
    RETURN    ${studies}

Resolve Request
    [Arguments]             ${category}
    Navigate To Support
    Navigate To Support Menu    Support Request
    Filter Support Request  by_status=Open    by_category=${category}
    ${requests}             Get List Support Request
    ${request_id}           Set Variable    ${requests}[0][Request ID]
    ${filter_keys}          Create Dictionary    sortOrder=desc       appName=Bioflux     ticketId=${request_id}
    ${request_id}           Convert To Integer     ${request_id}
    ${req_filter_inputs}    Create Dictionary    sortOrder=desc     appName=Bioflux     ticketId=${request_id}
    ${filter}               Api All Support Request    selected_portal=Clinic     token=${TOKEN}     filter=${req_filter_inputs}
    ${request_id}           Set Variable    ${filter}[body][data][clinicTickets][0][id]
    ${CCT_USER}             CcConfig.Get Config Param       NEW_USERS > callcenter_supervisor
    ${login_response}       Api Login    username=${CCT_USER}[username]      password=${CCT_USER}[password]
    ${CALLCENTER_TOKEN}     Set Variable    ${login_response}[body][data][login][token]
    ${req_inputs}           Create Dictionary    id=${request_id}      isResolved=${True}
    Api Resolve Support Request         token=${CALLCENTER_TOKEN}       input=${req_inputs}
