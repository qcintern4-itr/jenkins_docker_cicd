*** Settings ***
Documentation   Test Suite - Call Center QA Leader Portal - Support page
Metadata    sid     BFCC-SSO-CUSTOMER
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     Collections
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_callcenter_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_callcenter_portal/lib/web/Common.py
Library     project_bioflux_callcenter_portal/lib/web/Task.py
Library     project_bioflux_callcenter_portal/lib/web/Reports.py
Library     project_bioflux_callcenter_portal/lib/web/Studies.py
Library     project_bioflux_callcenter_portal/lib/web/StudyManagement.py
Library     project_bioflux_callcenter_portal/lib/web/EventDetails.py
Library     project_bioflux_callcenter_portal/lib/web/Devices.py
Library     project_bioflux_callcenter_portal/lib/web/Customer.py

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BFCC-SSO-CUSTOMER     web
Test Timeout    1h

*** Test Cases ***
BFCC-SSO-CUSTOMER-VIEW-01: Verify callcenter on Task page
    [Documentation]   Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    [Tags]  BFCC-SSO-CUSTOMER-VIEW-01    auto
    [Setup]    SUITE SETUP
    Navigate To Erp Repo    Bioflux Call Center Portal
    Switch Tab
    Navigate To Callcenter Menu     Task
    Wait Overview Available
    Filter Task         task_type=Unassigned        by_report=Notification reports
    Wait Unassigned Task Available
    Filter Task         by_report=Interim reports
    Wait Unassigned Task Available
    Filter Task         by_report=End of Use reports
    Wait Unassigned Task Available
    Filter Task         task_type=Assigned        by_report=Notification reports
    Wait Unassigned Task Available
    Filter Task         by_report=Interim reports
    Wait Unassigned Task Available
    Filter Task         by_report=End of Use reports
    Wait Unassigned Task Available
    [Teardown]    SUITE TEARDOWN

BFCC-SSO-CUSTOMER-VIEW-02: Verify callcenter on Reports page
    [Documentation]   Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    [Tags]  BFCC-SSO-CUSTOMER-VIEW-02           auto
    [Setup]    SUITE SETUP
    Navigate To Erp Repo    Bioflux Call Center Portal
    Switch Tab
#    Verify The Interim Report Page On The Pending Report Page
    Verify The End Of Use Report Page On The Pending Report Page
    Verify The Holter End Of Use Report Page On The Pending Report Page
    Verify The Notification Reports Page On The Ready Report Page
    Verify The Call required Page On The Ready Report Page
    Verify The Interim Reports Page On The Ready Report Page
    Verify The End Of Use Report Page On The Ready Report Page
    Verify The "Event reports" Page On The Sent Report Page
    Verify The "Notification reports" Page On The Sent Report Page
    Verify The "Interim reports" Page On The Sent Report Page
    Verify The "End of Use reports" Page On The Sent Report Page
    [Teardown]    SUITE TEARDOWN

BFCC-SSO-CUSTOMER-VIEW-03: Verify callcenter on Studies page
    [Documentation]   Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    [Tags]  BFCC-SSO-CUSTOMER-VIEW-03           auto
    [Setup]    SUITE SETUP
    Navigate To Erp Repo    Bioflux Call Center Portal
    Switch Tab
    Navigate To Callcenter Menu     Studies
    Wait Active Studies Available
#    Verify The Study Management On Studies Active Page
#    Navigate To Studies Type        End of Duration
#    Verify The Study Management On Studies End Of Duration Page
    Navigate To Studies Type        Completed
    Verify The Study Management On Studies Completed Page
    [Teardown]    SUITE TEARDOWN

BFCC-SSO-CUSTOMER-VIEW-04: Verify callcenter on Study management page
    [Documentation]   Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    [Tags]  BFCC-SSO-CUSTOMER-VIEW-04           auto
    [Setup]    SUITE SETUP
    Navigate To Erp Repo    Bioflux Call Center Portal
    Switch Tab
    Verify Interim Report Details By Report Page
    Verify End Of Use Report Details By Report Page
    Navigate To Report Screen With Study Id Is "370134"
    View Completed New Report Status On          row=1
    Switch Tab
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    Navigate Airp Tab     tab=ECG Events
    Wait Menu Items Ecg Events Available
    Navigate Airp Tab     tab=Strips Management
    Wait Menu Items Strips Management Available
    Navigate Airp Tab     tab=PDF Report
    Wait Pdf Report Available
    Stop Ai Processing
    ${msg}      Get Message Stop Successful
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}    Stop AI processing success
    Navigate To Report Screen With Study Id Is "370134"
    Filter Study Reports    by_report=Notification reports
    Edit Report On      row=2
    ${header}           Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     EVENT
    Verify Event Details On Tab Events
    [Teardown]    SUITE TEARDOWN

BFCC-SSO-CUSTOMER-VIEW-05: Verify callcenter on Devices and on Support page
    [Documentation]   Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    [Tags]  BFCC-SSO-CUSTOMER-VIEW-05         auto
    [Setup]    SUITE SETUP
    Navigate To Erp Repo    Bioflux Call Center Portal
    Switch Tab
    Navigate To Tab Menu      Devices
#    Navigate To Studies Type        In Study
#    Verify Search On Devices Page
#    Navigate To Studies Type        End of life
#    Verify Search On Devices Page
    Navigate To Studies Type        All devices
    Verify Search On Devices Page
    Navigate To Tab Menu      Support
#    Navigate To Studies Type    Open
#    Verify Search On Support Page
    Navigate To Studies Type    Resolved
    Verify Search On Support Page
    [Teardown]    SUITE TEARDOWN

BFCC-SSO-CUSTOMER-VIEW-06: Verify devices page on admin portal
    [Documentation]   Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    [Tags]  BFCC-SSO-CUSTOMER-VIEW-06         auto
    [Setup]    SUITE SETUP
    Navigate To Erp Repo    Admin Portal
    Switch Tab
    Navigate To Tab Menu      Devices
    Navigate To Admin Subtab    Bioflux/Biotres
    Verify Device Admin Details
    Navigate To Tab Menu      Devices
    Navigate To Admin Subtab    Bioheart
    ${devices}      Get Devices On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}
    Navigate To Admin Subtab    Biokit
    Verify Devices On Biokit Page With Subtab Is "Blood pressure cuff"
    Verify Devices On Biokit Page With Subtab Is "Digital thermometer"
    Verify Devices On Biokit Page With Subtab Is "Pulse oximeter"
    Verify Devices On Biokit Page With Subtab Is "Biokit"
    [Teardown]    SUITE TEARDOWN

BFCC-SSO-CUSTOMER-VIEW-07: Verify the access to Clinic portal by facilities page on admin portal
    [Documentation]   Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    [Tags]  BFCC-SSO-CUSTOMER-VIEW-07         auto
    [Setup]    SUITE SETUP
    Navigate To Erp Repo    Admin Portal
    Switch Tab
    Navigate To Tab Menu      Facilities
    Edit Facilities On    row=1
    Wait Admin Facilities Details Available
    ${header}           Get Current Page Header Admin
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     Edit Facility
    Navigate To Tab Menu      Facilities
    Edit Access To Portal On    row=1
    Navigate To Facilities Portal    Clinic Portal
    Switch Tab
    ${content_header}           Get Content Header Page
    ${content_header}           Set Variable    ${content_header}
    Run Keyword And Continue On Failure    Should Be Equal    ${content_header}[0]      You’re logged in through Admin portal
    ${header}           Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     Inbox
    [Teardown]    SUITE TEARDOWN

BFCC-SSO-CUSTOMER-VIEW-08: Verify the access to Billing portal by facilities page on admin portal
    [Documentation]   Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    [Tags]  BFCC-SSO-CUSTOMER-VIEW-08         auto
    [Setup]    SUITE SETUP
    Navigate To Erp Repo    Admin Portal
    Switch Tab
    Navigate To Tab Menu      Facilities
    Edit Access To Portal On    row=1
    Navigate To Facilities Portal    Billing Portal
    Switch Tab
    ${content_header}           Get Content Header Page
    ${content_header}           Set Variable    ${content_header}
    Run Keyword And Continue On Failure    Should Be Equal    ${content_header}[0]      You’re logged in through Admin portal
    ${header}           Get Current Page Header Billing
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     INSURANCE
    [Teardown]    SUITE TEARDOWN

BFCC-SSO-CUSTOMER-VIEW-09: Verify the access to Biocare Disease Management portal by facilities page on admin portal
    [Documentation]   Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    [Tags]  BFCC-SSO-CUSTOMER-VIEW-09        auto
    [Setup]    SUITE SETUP
    Navigate To Erp Repo    Admin Portal
    Switch Tab
    Navigate To Tab Menu      Facilities
    Edit Access To Portal On    row=1
    Navigate To Facilities Portal    Biocare Disease Management
    Switch Tab
    ${content_header}           Get Content Header Page Biocare
    ${content_header}           Set Variable    ${content_header}
    Run Keyword And Continue On Failure    Should Be Equal    ${content_header}[0]          You're logged in through Admin portal
    ${header}           Get Current Page Header Biocare
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     DASHBOARD
    [Teardown]    SUITE TEARDOWN

BFCC-SSO-CUSTOMER-VIEW-10: Verify users, contents and groups page on admin portal
    [Documentation]   Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    [Tags]  BFCC-SSO-CUSTOMER-VIEW-10        auto
    [Setup]    SUITE SETUP
    Navigate To Erp Repo    Admin Portal
    Switch Tab
    Verify User Page And User Details On Tab "Call Center"
    Verify User Page And User Details On Tab "Clinic"
    Verify User Page And User Details On Tab "ERP"
    Verify User Page And User Details On Tab "Billing"
    Verify User Page And User Details On Tab "Unassigned"
    Verify Group Page And Group Details On Tab "Call Center" With Page Header Details "Edit Call Center Group"
    Verify Group Page And Group Details On Tab "Facility" With Page Header Details "Edit Facility Group"
    Navigate To Tab Menu      Contents
    Wait Admin Facilities Contents Available
    [Teardown]    SUITE TEARDOWN

BFCC-SSO-CUSTOMER-VIEW-11: Verify dashboard page on sales portal portal
    [Documentation]   Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    [Tags]  BFCC-SSO-CUSTOMER-VIEW-11        auto
    [Setup]    SUITE SETUP
    Navigate To Erp Repo    Sales Portal
    Switch Tab
    Navigate To Tab Menu      Dashboard
    Wait Dashboard Sales Portal Available
    Verify Sales Team On Tab "Sales Representative"
    Verify Sales Team On Tab "Sales Manager"
    Verify Sales Team On Tab "Sales Administrator"
    Navigate To Tab Menu      Facilities
    Navigate To Admin Subtab    All facilities
    Navigate To Admin Subtab    New facilities
    [Teardown]    SUITE TEARDOWN

BFCC-SSO-CUSTOMER-VIEW-12: Verify Biodirect Portal
    [Documentation]   Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    [Tags]  BFCC-SSO-CUSTOMER-VIEW-12        auto
    [Setup]    SUITE SETUP
    Navigate To Erp Repo    Biodirect Portal
    Switch Tab
    Navigate To Tab Menu      Orders
    Edit Biodirect On    row=1
    ${header}           Get Current Page Header Oder
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     New Order
    Verify The In Process Details On Subtab "Pending" And Page Header Details Is "Pending"
    Verify The In Process Details On Subtab "Running" And Page Header Details Is "Running"
    Verify The In Process Details On Subtab "Completed" And Page Header Details Is "Completed"
    Navigate To Tab Menu      Done
    Edit Biodirect On    row=1
    ${header}           Get Current Page Header Oder
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     Done
    [Teardown]    SUITE TEARDOWN

BFCC-SSO-CUSTOMER-VIEW-13: Verify Support Portal
    [Documentation]   Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    [Tags]  BFCC-SSO-CUSTOMER-VIEW-13        auto
    [Setup]    SUITE SETUP
    Navigate To Erp Repo    Support Portal
    Switch Tab
    Navigate To Callcenter Menu      Patient Support
    Navigate To Admin Subtab    Open
    Navigate To Admin Subtab    Closed
    Edit Support On    row=1
    Switch Tab
    ${header}           Get Current Page Header Support
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     RESOLVED TICKET
    Verify Clinic Support Open With Subtab "Open" And Open Header Details "OPEN TICKET"
    Verify Clinic Support Open With Subtab "Resolved" And Open Header Details "RESOLVED TICKET"
    Navigate To Callcenter Menu      RMA Requests
    Edit Support Rma On    row=1
    Switch Tab
    ${header}           Get Current Page Header Support
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     TICKET DETAILS
    [Teardown]    SUITE TEARDOWN

BFCC-SSO-CUSTOMER-VIEW-14: Verify Services & Distribution Portal (S&D) Portal
    [Documentation]   Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    [Tags]  BFCC-SSO-CUSTOMER-VIEW-14        auto
    [Setup]    SUITE SETUP
    Navigate To Erp Repo    Services & Distribution Portal (S&D)
    Switch Tab
    Verify The Rma Request On Subtab "New"
    Verify The Rma Request On Subtab "Done"
    Verify The Rma Request On Subtab "In Process"
    Verify The Operation Forms On Subtab "New"
    Verify The Operation Forms On Subtab "Approved"
    Verify The Operation Forms On Subtab "Rejected"
    Verify The Rma Reaveler On Subtab "New"
    Verify The Rma Reaveler On Subtab "Approved"
    Verify The Rma Reaveler On Subtab "Rejected"
    Verify The Device Transfer On Subtab "Pending"
    Verify The Device Transfer On Subtab "Completed"
    [Teardown]    SUITE TEARDOWN

BFCC-SSO-CUSTOMER-VIEW-15: Verify Quality Management System Portal (QMS) Portal
    [Documentation]   Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    [Tags]  BFCC-SSO-CUSTOMER-VIEW-15        auto
    [Setup]    SUITE SETUP
    Navigate To Erp Repo    Quality Management System Portal (QMS)
    Switch Tab
    Verify The Complaint On Subtab "New"
    Navigate To Callcenter Menu      Complaint
    Navigate To Admin Subtab    Accepted
    Navigate To Callcenter Menu      Complaint
    Navigate To Admin Subtab    Rejected
    Verify The Operation Forms Qms On Subtab "New"
    Verify The Operation Forms Qms On Subtab "Approved"
    Verify The Operation Forms Qms On Subtab "Rejected"
    [Teardown]    SUITE TEARDOWN

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_callcenter_portal/lib/web/Common.py        ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/Task.py        ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/Reports.py        ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/Studies.py        ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/StudyManagement.py        ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/EventDetails.py        ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/Devices.py        ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/Customer.py        ${BROWSER_NODE}     ${ENV}
    ${USERS}             Get Config Param    NEW_USERS
    ${CURRENT_USER}      Set Variable        ${USERS}[sso_customer]
    ${TOKEN}             Sign In Erp Page  ${CURRENT_USER}[username]      ${CURRENT_USER}[password]
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

Verify the interim report page on the pending report page
    Navigate To Callcenter Menu     Reports
    Filter Reports      report_state=Pending        report_type=Interim reports
    Wait For Pending Interim Reports Available
    Edit Pending Interim Reports On     row=1
    ${header}           Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     INTERIM REPORT
    Back From Page
    Manage Pending Interim Reports On    row=1
    ${header}           Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     STUDY
    Back From Page

Verify the end of use report page on the pending report page
    Navigate To Callcenter Menu     Reports
    Filter Reports      report_state=Pending        report_type=End of Use reports
    Wait For Pending Reports Available
    Edit Pending Eou Reports On     row=1
    ${header}           Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     END OF USE REPORT
    Back From Page
    Manage Pending Eou Reports On      row=1
    ${header}           Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     STUDY
    Back From Page

Verify the holter end of use report page on the pending report page
    Navigate To Callcenter Menu     Reports
    Filter Reports      report_state=Pending        report_type=Holter End of Use reports
    Wait For Pending Reports Available
    Edit Pending Holter Eou Reports On     row=1
    ${header}           Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     END OF USE REPORT
    Back From Page
    Manage Pending Holter Eou Reports On       row=1
    ${header}           Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     STUDY
    Back From Page

Verify the notification reports page on the ready report page
    Navigate To Callcenter Menu     Reports
    Filter Reports    report_state=Ready        report_type=Notification reports        by_assignee=All
    Wait Ready Notification Reports Available
    ${event_report}     Get Ready Notification Event Reports Detail
    Edit Ready Notification Event Report On    row=1
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     EVENT
    Back From Page
    Filter Reports    report_state=Ready        report_type=Notification reports        by_assignee=All
    Wait Ready Notification Reports Available
    ${event_report}     Get Ready Notification Event Reports Detail
    Manage Ready Notification Event Report On       row=1
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     STUDY

Verify the call required page on the ready report page
    Navigate To Callcenter Menu     Reports
    Filter Reports    report_state=Ready        report_type=Call required        by_assignee=All
    Wait Ready Notification Reports Available
    ${event_report}     Get Ready Notification Event Reports Detail
    Edit Ready Notification Event Report On    row=1
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     EVENT
    Back From Page
    Filter Reports    report_state=Ready        report_type=Call required
    Wait Ready Notification Reports Available
    ${event_report}     Get Ready Notification Event Reports Detail
    Manage Ready Notification Event Report On       row=1
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     STUDY

Verify the interim reports page on the ready report page
    Navigate To Callcenter Menu     Reports
    Filter Reports      report_state=Ready        report_type=Interim reports       by_assignee=All
    Wait For Pending Reports Available
    Edit Ready Interim Reports On     row=1
    ${header}           Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     INTERIM REPORT
    Back From Page
    Filter Reports      report_state=Ready        report_type=Interim reports       by_assignee=All
    Wait For Pending Reports Available
    Manage Ready Interim Reports On       row=1
    ${header}           Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     STUDY
    Back From Page

Verify the end of use report page on the ready report page
    Navigate To Callcenter Menu     Reports
    Filter Reports      report_state=Ready        report_type=End of Use reports        by_assignee=All
    Wait For Pending Reports Available
    Edit Ready Eou Reports On     row=1
    ${header}           Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     END OF USE REPORT
    Back From Page
    Filter Reports      report_state=Ready        report_type=End of Use reports        by_assignee=All
    Wait For Pending Reports Available
    Manage Ready Eou Reports On      row=1
    ${header}           Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     STUDY
    Back From Page

Verify the "${subtab}" page on the sent report page
    Navigate To Callcenter Menu     Reports
    Filter Reports      report_state=Sent        report_type=${subtab}
    Wait For Event Reports Available

Verify the study management on studies active page
    Manage Active Studies On    row=1
    ${header}           Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     STUDY
    Back From Page
    View Active Studies Event Details On    row=1
    ${header}           Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     STUDY
    Back From Page

Verify the study management on studies end of duration page
    Manage End Of Duration Studies On     row=1
    ${header}           Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     STUDY
    Back From Page
    View End Of Duration Studies Event Details On    row=1
    ${header}           Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     STUDY
    Back From Page

Verify the study management on studies completed page
    Manage Completed Studies On     row=1
    ${header}           Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     STUDY
    Back From Page
    View Completed Studies Event Details On    row=1
    ${header}           Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     STUDY
    Back From Page

Navigate to report screen with study id is "${study_id_completed}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id_completed}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    reports

Verify interim report details by report page
    Navigate To Report Screen With Study Id Is "370134"
    Edit Report On      row=1
    ${header}           Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     INTERIM REPORT
    Navigate To Event Tab      Report Summary
    Navigate To Event Tab      Strips Selection
    Navigate To Event Tab      PDF Report

Verify end of use report details by report page
    Navigate To Report Screen With Study Id Is "370134"
    Edit End Of Use Report
    ${header}           Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     END OF USE REPORT
    Navigate To Event Tab      Report Summary
    Navigate To Event Tab      Strips Selection
    Navigate To Event Tab      PDF Report

Verify event details on tab Events
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=370134
    Manage Complete Study On        row=1
    Navigate To Study Management Type    Events
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab      Event Details
    ${header}           Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     EVENT

Verify search on devices page
    ${devices}      Get Devices On Page
    ${devices_id}   Evaluate    [item['Device ID'] for item in ${devices}]
    ${device_id}    Evaluate    random.choice(${devices_id})        random
    Filter Devices    text_search=${device_id}
    ${devices}      Get Devices On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}
    Clear Event Text Search

Verify search on support page
    ${devices}      Get Devices On Page
    ${devices_id}   Evaluate    [item['Request ID'] for item in ${devices}]
    ${device_id}    Evaluate    random.choice(${devices_id})        random
    Filter Devices    text_search=${device_id}
    ${devices}      Get Devices On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}
    Clear Event Text Search

Verify device admin details
    ${devices}      Get Devices On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}
    Edit Devices On    row=1
    ${header}           Get Current Page Header Admin
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     Edit Device

Verify devices on biokit page with subtab is "${subtab_menu}"
    Navigate To Admin Subtab Menu       ${subtab_menu}
    ${devices}      Get Devices On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}

Verify user page and user details on tab "${subtab}"
    Navigate To Tab Menu      Users
    Navigate To Admin Subtab    ${subtab}
    Edit Users On    row=1
    Wait Admin Facilities User Details Available
    ${header}           Get Current Page Header Admin
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     Edit User

Verify group page and group details on tab "${subtab}" with page header details "${name_header}"
    Navigate To Tab Menu      Groups
    Navigate To Admin Subtab    ${subtab}
    Edit Groups On    row=1
    Wait Admin Facilities User Details Available
    ${header}           Get Current Page Header Admin
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     ${name_header}

Verify sales team on tab "${subtab}"
    Navigate To Tab Menu      Sales Team
    Navigate To Sales Team Subtab    ${subtab}
    View Account Details On    row=0
    Wait Account Details Sales Team Available

Verify the in process details on subtab "${subtab}" and page header details is "${header_name}"
    Navigate To Tab Menu      In Process
    Navigate To Admin Subtab    ${subtab}
    Edit Biodirect On    row=1
    ${header}           Get Current Page Header Oder
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     ${header_name}

Verify clinic support open with subtab "${sub_tab}" and open header details "${header_name}"
    Navigate To Callcenter Menu      Clinic Support
    Navigate To Admin Subtab    ${sub_tab}
    Open Support On    row=1
    Switch Tab
    ${header}           Get Current Page Header Support
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     ${header_name}

Verify the rma request on subtab "${sub_tab}"
    Navigate To Callcenter Menu      RMA Requests
    Navigate To Admin Subtab    ${sub_tab}
    Edit Support Rma On    row=1
    Switch Tab
    ${header}           Get Current Page Header Support
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     TICKET DETAILS

Verify the operation forms on subtab "${sub_tab}"
    Navigate To Callcenter Menu      Operation Forms
    Navigate To Admin Subtab    ${sub_tab}
    Edit Operation Forms Rma On    row=1
    Switch Tab
    ${header}           Get Current Page Header Support
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     FORM DETAILS

Verify the rma reaveler on subtab "${sub_tab}"
    Navigate To Callcenter Menu      RMA Traveler
    Navigate To Admin Subtab    ${sub_tab}
    Edit Support Rma On    row=1
    Switch Tab
    ${header}           Get Current Page Header Support
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     FORM DETAILS

Verify the device transfer on subtab "${sub_tab}"
    Navigate To Callcenter Menu      Device Transfer
    Navigate To Admin Subtab    ${sub_tab}
    Edit Support Rma On    row=1
    Switch Tab
    ${header}           Get Current Page Header Support
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     TICKET DETAILS

Verify the complaint on subtab "${sub_tab}"
    Navigate To Callcenter Menu      Complaint
    Navigate To Admin Subtab    ${sub_tab}
    Edit Operation Forms Rma On    row=1
    Switch Tab
    ${header}           Get Current Page Header Support
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     TICKET DETAILS

Verify the operation forms qms on subtab "${sub_tab}"
    Navigate To Callcenter Menu      Operation Forms
    Navigate To Admin Subtab    ${sub_tab}
    Edit Operation Forms Rma On    row=1
    Switch Tab
    ${header}           Get Current Page Header Support
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     FORM DETAILS
