*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT
Metadata    owner   Thang Tran
Library     corelib/AssertionExtension.py
Library     Collections
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_ai_report_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_ai_report_portal/lib/web/Reports.py
Library     project_bioflux_ai_report_portal/lib/web/Common.py
Library     project_bioflux_ai_report_portal/lib/web/Studies.py
Library     project_bioflux_ai_report_portal/lib/web/EcgEvent.py
Library     project_bioflux_ai_report_portal/lib/web/StudyManagement.py
Library     project_bioflux_ai_report_portal/lib/web/EventDetails.py
Library     project_bioflux_ai_report_portal/lib/web/StripsManagement.py

#Suite Setup     Suite Setup
#Suite Teardown      Suite Teardown
Force Tags      BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT  web
Test Timeout    30m

*** Test Cases ***
BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-ADD-01: Create the event from Study to "Patient triggered" page with event type manual
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: The event has been "Patient triggered" displayed on page
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...     - Including closed invalid and valid manual events with the below symptoms and they are not marked ‘Include in report’
    ...
    ...     Test Steps:
    ...     1. Navigate to study "Events" page
    ...     2. Select the Event type "Manual" -> click on "Edit" button
    ...     3. Select the value "Valid" -> select not mark "Include in report"
    ...     4. Observe the result -> click on "Save" button
    ...     5. Navigate to airp page
    ...     6. Click on the "Strips Management" button
    ...     7. Click on the "Patient triggered" link
    ...     8. Observe the result
    ...
    ...     Expected Results:
    ...     2. Just follow the event has Symptoms is: Palpitations, Shortness of breath, Dizziness, Chest Pain, Other, Not Specified
    ...     3. Verify the check box "Include in report" not marked and the event has been closed
    ...     8. Verify the new event displayed on page
    ...
    ...     **Others**
    ...     Create date: 05/15/2024 - Thang Tran
    ...     Auto Create: 05/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-ADD-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-01-1.12.0: Verify if the 'Strips Configuration' is displayed correctly when the user checks all Valid events include in the report and strip
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. On Patient triggered tab, check Include event in report and Include strip for all Valid events
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. Check for all Valid events, including:
    ...     - Patient triggered: Palpitations , Shortness of breath , Dizziness , Chest Pain, Other, Not Specified
    ...     2. The strips configuration in the 'Included in Report' tab matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-01-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-02-1.12.0: Verify if the 'Strips Configuration' is displayed correctly when the user checks all Invalid events include in the report and strip
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. On Patient triggered tab, check Include event in report and Include strip for all Invalid events
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. Check for all Invalid events, including:
    ...     - Patient triggered: Palpitations , Shortness of breath , Dizziness , Chest Pain, Other, Not Specified
    ...     2. The strips configuration in the 'Included in Report' tab matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-02-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


#    [Setup]     SUITE SETUP
#    Create The Patient Triggered
#    Navigate To Aireport
#    Navigate Airp Tab     tab=Strips Management
#    Navigate To Tab Menu Strips Management      menu=Patient triggered
#    Filter Strips Management    text_search=${event_id}
#    ${strips_info}     Get Strips Management
#    ${strips_box_info}  Get Strips Management Box
#    Run Keyword And Continue On Failure    Should Be Equal    ${strips_info}[0][Event ID]      ${strips_box_info}[Event ID]
##    Run Keyword And Continue On Failure    Should Be Equal    ${strips_info}[0][DateTime] EDT       ${strips_box_info}[Trigger time]
#    Run Keyword And Continue On Failure    Should Be Equal    ${strips_info}[0][Comment]       ${strips_box_info}[Technician comment]
#    Run Keyword And Continue On Failure    Should Be Equal    ${strips_info}[0][Validity Status]       Valid
#    Run Keyword And Continue On Failure    Should Be Equal    ${strips_info}[0][Symptoms]      ${strips_box_info}[Symptoms]
#    ${status_include}       Check Mark Include Toolbar Available
#    Run Keyword And Continue On Failure    Should Not Be True       ${status_include}[Include event in report]
#    Run Keyword And Continue On Failure    Should Not Be True       ${status_include}[Include strip]
#    ${status_toolbar}       Check Toolbar Strips Management Available
#    Run Keyword And Continue On Failure    Should Not Be True    ${status_toolbar}[Include strip]
#    Run Keyword And Continue On Failure    Should Be True    ${status_toolbar}[Include event in report]
#    [Teardown]    SUITE TEARDOWN
#
#BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-01: Check the toolbar header in the "Patient triggered" page working properly
#    [Documentation]     Author: Thang Tran
#    ...
#    ...     Description: The filters in the "included in report" page is: Valid/Invalid, Include event in report,
#    ...     Inlude strip, Size, Search, Sort,  Filter option, Refresh page, Pagination
#    ...
#    ...     Precondition:
#    ...     - The user is on the AI report processing screen
#    ...
#    ...     Test Steps:
#    ...     1. Navigate to airp page
#    ...     2. Click on the "Strips Management" button
#    ...     3. Click on the "Patient triggered" link
#    ...     4. Observe the result
#    ...
#    ...     Expected Results:
#    ...     4. - The check box "Include event in report" has been marked
#    ...        - All the event strips displayed the value on event "Incl. in report"
#    ...        - The Valid is default
#    ...        - The Size default is Small
#    ...
#    ...     **Others**
#    ...     Create date: 05/15/2024 - Thang Tran
#    ...     Auto Create: 05/30/2024 - Thang Tran
#    ...
#    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-01      auto
#    [Setup]     SUITE SETUP
#    Navigate To Aireport
#    Navigate Airp Tab     tab=Strips Management
#    Navigate To Tab Menu Strips Management      menu=Patient triggered
#    ${patient_triggered}     Get Strips Management
#    ${status_toolbar}       Check Toolbar Strips Management Available
#    Run Keyword And Continue On Failure    Should Be True    ${status_toolbar}[Validity Status]
#    Run Keyword And Continue On Failure    Should Not Be True    ${status_toolbar}[Include strip]
#    Run Keyword And Continue On Failure    Should Be True    ${status_toolbar}[Include event in report]
#    Run Keyword And Continue On Failure    Should Be True    ${status_toolbar}[Refresh]
#    Run Keyword And Continue On Failure    Should Be True    ${status_toolbar}[Size]
#    Run Keyword And Continue On Failure    Should Be True    ${status_toolbar}[Search]
#    Run Keyword And Continue On Failure    Should Be True    ${status_toolbar}[Sort]
#    ${status_filter}        Get Current Values Toolbar Strips Management
#    Run Keyword And Continue On Failure    Should Be Equal    ${status_filter}[Validity Status]     Valid
#    Run Keyword And Continue On Failure    Should Be Equal    ${status_filter}[Size]        Small
#    ${status_include}       Check Mark Include Toolbar Available
#    Run Keyword And Continue On Failure    Should Not Be True    ${status_include}[Include event in report]
#    Run Keyword And Continue On Failure    Should Not Be True        ${status_include}[Include strip]
#    [Teardown]    SUITE TEARDOWN
#
#BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-02: Verify the sort event by Event ID
#    [Documentation]     Author: Thang Tran
#    ...
#    ...     Description: Verify the sort event by Event ID
#    ...
#    ...     Precondition:
#    ...     - The user is on the AI report processing screen
#    ...
#    ...     Test Steps:
#    ...     1. Navigate to airp page
#    ...     2. Click on the "Strips Management" button
#    ...     3. Click on the "Patient triggered" link
#    ...     4. Click on the "Sort" button
#    ...     5. Observe the result
#    ...
#    ...     Expected Results:
#    ...     5. Verify the event sort by time successfull
#    ...
#    ...     **Others**
#    ...     Create date: 05/15/2024 - Thang Tran
#    ...     Auto Create: 05/30/2024 - Thang Tran
#    ...
#    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-02      auto
#    [Setup]     SUITE SETUP
#    Navigate To Aireport
#    Navigate Airp Tab     tab=Strips Management
#    Navigate To Tab Menu Strips Management      menu=Patient triggered
#    ${included_report}     Get Strips Management
#    ${event_id}         Evaluate    [item['Event ID'] for item in ${included_report}]
#    ${date_time}         Evaluate    [item['DateTime'] for item in ${included_report}]
#    #sort ascending default
#    ${ascending_device_id}      Evaluate    sorted(${event_id}, key=int, reverse=False)
#    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_id}        ${ascending_device_id}
#    #sort descending
#    Filter Strips Management        asc_or_desc=desc
#    ${included_report}     Get Strips Management
#    ${event_id}         Evaluate    [item['Event ID'] for item in ${included_report}]
#    ${descending_device_id}      Evaluate    sorted(${event_id}, key=int, reverse=True)
#    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_id}        ${descending_device_id}
#    #sort ascending
#    Filter Strips Management        asc_or_desc=asc
#    ${included_report}     Get Strips Management
#    ${event_id}         Evaluate    [item['Event ID'] for item in ${included_report}]
#    ${ascending_device_id}      Evaluate    sorted(${event_id}, key=int, reverse=False)
#    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_id}        ${ascending_device_id}
#    [Teardown]    SUITE TEARDOWN
#
#BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-03: Verify the sort event by time
#    [Documentation]     Author: Thang Tran
#    ...
#    ...     Description:
#    ...
#    ...     Precondition:
#    ...     - The user is on the AI report processing screen
#    ...
#    ...     Test Steps:
#    ...     1. Navigate to airp page
#    ...     2. Click on the "Strips Management" button
#    ...     3. Click on the "Patient triggered" link
#    ...     4. Click on the "Sort" button
#    ...     5. Observe the result
#    ...
#    ...     Expected Results:
#    ...     5. Verify the event sort by time successfull
#    ...
#    ...     **Others**
#    ...     Create date: 05/15/2024 - Thang Tran
#    ...     Auto Create: 05/30/2024 - Thang Tran
#    ...
#    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-03      auto
#    [Setup]     SUITE SETUP
#    Navigate To Aireport
#    Navigate Airp Tab     tab=Strips Management
#    Navigate To Tab Menu Strips Management      menu=Patient triggered
#    ${included_report}     Get Strips Management
#    ${date_time}         Evaluate    [item['DateTime'] for item in ${included_report}]
#    #sort ascending default
#    ${acending_datetime}     Sort Asc By Datetime        date_time=${date_time}
#    Run Keyword And Continue On Failure    Lists Should Be Equal    ${date_time}        ${acending_datetime}
#    #sort descending
#    Filter Strips Management        asc_or_desc=desc
#    ${included_report}     Get Strips Management
#    ${date_time}         Evaluate    [item['DateTime'] for item in ${included_report}]
#    ${descending_datetime}     Sort Desc By Datetime        date_time=${date_time}
#    Run Keyword And Continue On Failure    Lists Should Be Equal    ${date_time}        ${descending_datetime}
#    #sort ascending
#    Filter Strips Management        asc_or_desc=asc
#    ${included_report}     Get Strips Management
#    ${date_time}         Evaluate    [item['DateTime'] for item in ${included_report}]
#    ${ascending_datetime}     Sort Asc By Datetime        date_time=${date_time}
#    Run Keyword And Continue On Failure    Lists Should Be Equal    ${date_time}        ${ascending_datetime}
#    [Teardown]    SUITE TEARDOWN
#
#BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-04: View the validity status option and size option
#    [Documentation]     Author: Thang Tran
#    ...
#    ...     Description: iew the validity status option and size option
#    ...
#    ...     Precondition:
#    ...     - The user is on the AI report processing screen
#    ...
#    ...     Test Steps:
#    ...     1. Navigate to airp page
#    ...     2. Click on the "Strips Management" button
#    ...     3. Click on the "Patient triggered" link
#    ...     4. Select a event
#    ...     5. Select the validity status option -> Observe the result
#    ...     6. Select the size option -> Observe the result
#    ...
#    ...     Expected Results:
#    ...     5. Verify the validity status option: Valid/Invalid
#    ...     6. Verify the size option: Small, Medium, Large
#    ...
#    ...     **Others**
#    ...     Create date: 05/15/2024 - Thang Tran
#    ...     Auto Create: 05/30/2024 - Thang Tran
#    ...
#    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-04      auto
#    [Setup]     SUITE SETUP
#    Navigate To Aireport
#    Navigate Airp Tab     tab=Strips Management
#    Navigate To Tab Menu Strips Management      menu=Patient triggered
#    ${included_report}     Get Strips Management
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${included_report}
#    ${expected_validity}    Create List    Valid    Invalid
#    ${expected_size}        Create List    Small    Medium    Large
#    ${validity_option}      Get Validity Options
#    Run Keyword And Continue On Failure    Should Be Equal    ${expected_validity}      ${validity_option}
#    ${size_option}      Get Size Options
#    Run Keyword And Continue On Failure    Should Be Equal    ${expected_size}      ${size_option}
#    [Teardown]    SUITE TEARDOWN
#
#BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-EDIT-01: Check the validity status when edit validity the event to "Invalid"
#    [Documentation]     Author: Thang Tran
#    ...
#    ...     Description: Check the validity status when edit validity the event to "Invalid"
#    ...
#    ...     Precondition:
#    ...     - The user is on the AI report processing screen
#    ...
#    ...     Test Steps:
#    ...     1. Navigate to airp page
#    ...     2. Click on the "Strips Management" button
#    ...     3. Click on the "Patient triggered" link
#    ...     4. Select a event
#    ...     5. Select the validity status option
#    ...     6. Select the "Invalid" value -> click on "Save" button -> Observe the result
#    ...     7. Navigate to study "Events" report -> Observe the result
#    ...
#    ...     Expected Results:
#    ...     6. The validity status of event changed to Invalid
#    ...     7. The validity status of event changed to Invalid
#    ...
#    ...     **Others**
#    ...     Create date: 05/15/2024 - Thang Tran
#    ...     Auto Create: 05/30/2024 - Thang Tran
#    ...
#    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-EDIT-01      auto
#    [Setup]     SUITE SETUP
#    Navigate To Aireport
#    Navigate Airp Tab     tab=Strips Management
#    Navigate To Tab Menu Strips Management      menu=Patient triggered
#    ${patient_triggered}     Get Strips Management
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${patient_triggered}
#    ${events_id}         Evaluate    [item['Event ID'] for item in ${patient_triggered} if item.get('Validity Status') != 'Invalid']
#    Filter Strips Management    text_search=${events_id}[0]       validity=Invalid
#    ${patient_triggered}     Get Strips Management
#    ${status}               Evaluate    [item['Status'] for item in ${patient_triggered}]
#    Run Keyword And Continue On Failure    List Should Contain Value       ${status}      Edited
#    Run Keyword And Continue On Failure    Should Be Equal    ${patient_triggered}[0][Validity Status]        Invalid
#    Filter Header       is_save=${True}
#    ${patient_triggered}     Get Strips Management
#    Run Keyword And Continue On Failure    Should Be Equal    ${patient_triggered}[0][Validity Status]        Invalid
#    Open To Event Details
#    Switch Tab  tab_id=2
#    Navigate To Event Tab    Event Details
#    ${event_details}        Get Event Details
#    Run Keyword And Continue On Failure    Should Be Equal    ${event_details}[Validity]        Invalid
#    Edit Event Details     event_validity=Valid       is_close=${True}      include_report=${False}
#    [Teardown]    SUITE TEARDOWN
#
#BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-EDIT-02: Check the validity status when edit validity the multiple event to "Invalid"
#    [Documentation]     Author: Thang Tran
#    ...
#    ...     Description: Check the validity status when edit validity the multiple event to "Invalid
#    ...
#    ...     Precondition:
#    ...     - The user is on the AI report processing screen
#    ...
#    ...     Test Steps:
#    ...     1. Navigate to airp page
#    ...     2. Click on the "Strips Management" button
#    ...     3. Click on the "Patient triggered" link
#    ...     4. Select the multiple events
#    ...     5. Select the validity status option
#    ...     6. Select the "Invalid" value -> click on "Save" button -> Observe the result
#    ...     7. Navigate to study "Events" report -> Observe the result
#    ...
#    ...     Expected Results:
#    ...     6. The validity status of event changed to Invalid
#    ...     7. The validity status of event changed to Invalid
#    ...
#    ...     **Others**
#    ...     Create date: 05/15/2024 - Thang Tran
#    ...     Auto Create: 05/30/2024 - Thang Tran
#    ...
#    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-EDIT-02      auto
#    [Setup]     SUITE SETUP
#    Navigate To Aireport
#    Navigate Airp Tab     tab=Strips Management
#    Navigate To Tab Menu Strips Management      menu=Patient triggered
#    ${patient_triggered}     Get Strips Management
#    View Strips Management On    1,2
#    Filter Strips Management       validity=Invalid
#    ${patient_triggered}     Get Strips Management Selected
#    ${status}     Evaluate    [item['Status'] for item in ${patient_triggered}]
#    ${validity_status}     Evaluate    [item['Validity Status'] for item in ${patient_triggered}]
#    Run Keyword And Continue On Failure    List Should Contain Value    ${validity_status}        Invalid
#    Run Keyword And Continue On Failure    List Should Contain Value    ${status}        Edited
#    Filter Header       is_save=${True}
#    Filter Strips Management        search_by=${True}      search_by_validity=Invalid       filter_submit=${True}
#    ${patient_triggered}     Get Strips Management
#    ${validity_status}     Evaluate    [item['Validity Status'] for item in ${patient_triggered}]
#    Run Keyword And Continue On Failure    List Should Contain Value    ${validity_status}        Invalid
#    Check Event "${patient_triggered}[0][Event ID]" Change To The Validity "Invalid"
#    Check Event "${patient_triggered}[1][Event ID]" Change To The Validity "Invalid"
#    [Teardown]    SUITE TEARDOWN
#
#BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-ADD-03: Verify the event when change the event to marked "Include event in report"
#    [Documentation]     Author: Thang Tran
#    ...
#    ...     Description: Verify the event when change the event to marked "Include event in report"
#    ...
#    ...     Precondition:
#    ...     - The user is on the AI report processing screen
#    ...
#    ...     Test Steps:
#    ...     1. Navigate to airp page
#    ...     2. Click on the "Strips Management" button
#    ...     3. Click on the "Patient triggered" link
#    ...     4. Select a event
#    ...     5. Marked the "Include event in report" -> Observe the result
#    ...     6. Click on "Save" button -> Observe the result
#    ...     7. Click on "Include in repot" -> Observe the result
#    ...     8. Navigate to study "Events" report -> Observe the result
#    ...
#    ...     Expected Results:
#    ...     5. The checkbox Include strip shall be enable -> The text "Incl. in report" displayed
#    ...     6. The event not displayed on page
#    ...     7. The event change from "Patient triggered" page to "Included in report" page
#    ...     8. The checkbox marked Include event report
#    ...
#    ...     **Others**
#    ...     Create date: 05/15/2024 - Thang Tran
#    ...     Auto Create: 05/30/2024 - Thang Tran
#    ...
#    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-ADD-03     auto
#    [Setup]     SUITE SETUP
#    Navigate To Aireport
#    Navigate Airp Tab     tab=Strips Management
#    Navigate To Tab Menu Strips Management      menu=Patient triggered
#    ${included_report}     Get Strips Management
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${included_report}
#    ${event_id}         Set Variable    ${included_report}[0][Event ID]
#    Filter Strips Management      text_search=${event_id}
#    Wait Strips Items Available
#    Filter Strips Management      include_report=${True}
#    ${strip_management}     Get Strips Management Selected
#    ${included_report}      Evaluate    [k for k, v in ${strip_management}[0].items()]
#    Run Keyword And Continue On Failure    Should Be Equal    ${strip_management}[0][Status]        Edited
#    Run Keyword And Continue On Failure    Should Contain     ${included_report}     Include report
#    Run Keyword And Continue On Failure    Should Be Equal    ${strip_management}[0][Include report]        Incl. in report
#    ${status}   Check Toolbar Strips Management Available
#    Run Keyword And Continue On Failure    Should Be True    ${status}[Include strip]
#    Filter Header    is_save=${True}
#    ${msg_data}     Get Message Strip Management
#    Run Keyword And Continue On Failure    Should Be Equal        ${msg_data}       There is no data to display
#    Navigate To Tab Menu Strips Management      menu=Included in report
#    ${strip_management}     Get Strips Management Selected
#    Filter Strips Management      include_report=${False}
#    Filter Header    is_save=${True}
#    [Teardown]    SUITE TEARDOWN
#
#BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-ADD-04: Verify the events when change the multiple event to marked "Include event in report"
#    [Documentation]     Author: Thang Tran
#    ...
#    ...     Description: Verify the events when change the multiple event to marked "Include event in report"
#    ...
#    ...     Precondition:
#    ...     - The user is on the AI report processing screen
#    ...
#    ...     Test Steps:
#    ...     1. Navigate to airp page
#    ...     2. Click on the "Strips Management" button
#    ...     3. Click on the "Patient triggered" link
#    ...     4. Select the multiple events
#    ...     5. Marked the "Include event in report" -> Observe the result
#    ...     6. Click on "Save" button -> Observe the result
#    ...     7. Click on "Included in report" -> Observe the result
#    ...     8. Navigate to study "Events" report -> Observe the result
#    ...
#    ...     Expected Results:
#    ...     5. The checkbox Include strip shall be enable -> The text "Incl. in report" displayed
#    ...     6. The event not displayed on page
#    ...     7. The event change from "Patient triggered" page to "Included in report" page
#    ...     8. The checkbox marked Include event report
#    ...
#    ...     **Others**
#    ...     Create date: 05/15/2024 - Thang Tran
#    ...     Auto Create: 05/31/2024 - Thang Tran
#    ...
#    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-ADD-04     auto
#    [Setup]     SUITE SETUP
#    Navigate To Aireport
#    Navigate Airp Tab     tab=Strips Management
#    Navigate To Tab Menu Strips Management      menu=Patient triggered
#    ${included_report}     Get Strips Management
#    ${events_id}               Evaluate    [item['Event ID'] for item in ${included_report}]
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${included_report}
#    View Strips Management On    1,2
#    Marked Strips Events To "Include Event In Report"
#    Check Strips Event With "${events_id}[0]" Did Not Display
#    Check Strips Event With "${events_id}[1]" Did Not Display
#    Navigate To Tab Menu Strips Management      menu=Included in report
#    Check Strips Event With "${events_id}[0]" Has Been Dispayed
#    Filter Strips Management      include_report=${False}
#    Filter Header    is_save=${True}
#    Check Strips Event With "${events_id}[1]" Has Been Dispayed
#    Filter Strips Management      include_report=${False}
#    Filter Header    is_save=${True}
#    [Teardown]    SUITE TEARDOWN
#
#BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-ADD-05: Verify the event when change the event to marked "Include strip"
#    [Documentation]     Author: Thang Tran
#    ...
#    ...     Description: Verify the event when change the event to marked "Include strip"
#    ...
#    ...     Precondition:
#    ...     - The user is on the AI report processing screen
#    ...
#    ...     Test Steps:
#    ...     1. Navigate to airp page
#    ...     2. Click on the "Strips Management" button
#    ...     3. Click on the "Patient triggered" link
#    ...     4. Select a event
#    ...     5. Marked the "Include event in report" and "Include strip" -> Observe the result
#    ...     6. Click on "Save" button -> Observe the result
#    ...     7. Click on "Included in report" -> Observe the result
#    ...     8. Navigate to study "Events" report -> Observe the result
#    ...
#    ...     Expected Results:
#    ...     5. The checkbox Include strip shall be enable -> The text "Incl. in report" and "Incl. strip" displayed
#    ...     6. The event not displayed on page
#    ...     7. The event change from "Patient triggered" page to "Included in report" page
#    ...     8. The checkbox marked Include event report
#    ...
#    ...     **Others**
#    ...     Create date: 05/15/2024 - Thang Tran
#    ...     Auto Create: 05/31/2024 - Thang Tran
#    ...
#    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-ADD-05      auto
#    [Setup]     SUITE SETUP
#    Navigate To Aireport
#    Navigate Airp Tab     tab=Strips Management
#    Navigate To Tab Menu Strips Management      menu=Patient triggered
#    ${events_id}     Get Strips Management
#    Filter Strips Management      text_search=${events_id}[0][Event ID]
#    Wait Strips Items Available
#    Filter Strips Management      include_strip=${True}     include_report=${True}
#    ${strip_management}     Get Strips Management Selected
#    ${included_report}      Evaluate    [k for k, v in ${strip_management}[0].items()]
#    Run Keyword And Continue On Failure    Should Be Equal    ${strip_management}[0][Status]        Edited
#    Run Keyword And Continue On Failure    Should Contain    ${included_report}     Include strip
#    Run Keyword And Continue On Failure    Should Contain    ${included_report}     Include report
#    ${status}   Check Toolbar Strips Management Available
#    Run Keyword And Continue On Failure    Should Be True    ${status}[Include strip]
#    Filter Header    is_save=${True}
#    Navigate To Tab Menu Strips Management      menu=Included in report
#    Check That The Include Strip Has Been Marked With The Event "${strip_management}[0][Event ID]"
#    [Teardown]    SUITE TEARDOWN
#
#BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-ADD-06: Verify the events when change the multiple event to marked "Include strip"
#    [Documentation]     Author: Thang Tran
#    ...
#    ...     Description: Verify the events when change the multiple event to marked "Include strip"
#    ...
#    ...     Precondition:
#    ...     - The user is on the AI report processing screen
#    ...
#    ...     Test Steps:
#    ...     1. Navigate to airp page
#    ...     2. Click on the "Strips Management" button
#    ...     3. Click on the "Patient triggered" link
#    ...     4. Select the multiple events
#    ...     5. Marked the "Include event in report" and "Include strip" -> Observe the result
#    ...     6. Click on "Save" button -> Observe the result
#    ...     7. Click on "Included in report" -> Observe the result
#    ...     8. Navigate to study "Events" report -> Observe the result
#    ...
#    ...     Expected Results:
#    ...     5. The checkbox Include strip shall be enable -> The text "Incl. in report" and "Incl. strip" displayed
#    ...     6. The event not displayed on page
#    ...     7. The event change from "Patient triggered" page to "Included in report" page
#    ...     8. The checkbox marked Include event report
#    ...
#    ...     **Others**
#    ...     Create date: 05/15/2024 - Thang Tran
#    ...     Auto Create: 05/31/2024 - Thang Tran
#    ...
#    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-ADD-06      auto
#    [Setup]     SUITE SETUP
#    Navigate To Aireport
#    Navigate Airp Tab     tab=Strips Management
#    Navigate To Tab Menu Strips Management      menu=Patient triggered
#    ${included_report}     Get Strips Management
#    ${events_id}               Evaluate    [item['Event ID'] for item in ${included_report}]
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${included_report}
#    View Strips Management On    1,2
#    Filter Strips Management       include_strip=${True}     include_report=${True}
#    ${strip_management}     Get Strips Management Selected
#    ${status}               Evaluate    [item['Status'] for item in ${strip_management}]
#    ${included_strip}      Evaluate     [k for d in ${strip_management} for k in d.keys()]
#    ${actual_included_report}      Evaluate     [item['Include report'] for item in ${strip_management}]
#    ${actual_included_strip}      Evaluate     [item['Include strip'] for item in ${strip_management}]
#    Run Keyword And Continue On Failure    List Should Contain Value       ${status}      Edited
#    Run Keyword And Continue On Failure    List Should Contain Value       ${included_strip}     Include strip
#    Run Keyword And Continue On Failure    List Should Contain Value       ${included_strip}     Include report
#    Run Keyword And Continue On Failure    List Should Contain Value       ${actual_included_report}     Incl. in report
#    Run Keyword And Continue On Failure    List Should Contain Value       ${actual_included_strip}     Incl. strip
#    ${status}   Check Toolbar Strips Management Available
#    Run Keyword And Continue On Failure    Should Be True    ${status}[Include strip]
#    Filter Header    is_save=${True}
#    Check strips event with "${events_id}[0]" did not display
#    Check strips event with "${events_id}[1]" did not display
#    Navigate To Tab Menu Strips Management      menu=Included in report
#    Check That The Include Strip Has Been Marked With The Event "${events_id}[0]"
#    Check That The Include Strip Has Been Marked With The Event "${events_id}[1]"
#    [Teardown]    SUITE TEARDOWN
#
#BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-05: Verify the number event displayed on "Patient triggered" page with different sizes
#    [Documentation]     Author: Thang Tran
#    ...
#    ...     Description: The number event displayed correct follow the size is small, medium lager
#    ...
#    ...     Precondition:
#    ...     - The user is on the AI report processing screen
#    ...
#    ...     Test Steps:
#    ...     1. Navigate to airp page
#    ...     2. Click on the "Strips Management" button
#    ...     3. Click on the "Patient triggered" link
#    ...     4. Select "Small/Medium/Large" on the "Size" dropdown list -> Observe the result
#    ...
#    ...     Expected Results:
#    ...     4. - Verify the number event thumbnail displayed: small > medium > large
#    ...
#    ...     **Others**
#    ...     Create date: 05/15/2024 - Thang Tran
#    ...     Auto Create: 05/31/2024 - Thang Tran
#    ...
#    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-05     auto
#    [Setup]     SUITE SETUP
#    Navigate To Aireport
#    Navigate Airp Tab     tab=Strips Management
#    Navigate To Tab Menu Strips Management      menu=Patient triggered
#    Filter Strips Management    size=Small
#    ${number_small_size}          Get Strips Management
#    ${number_small_size}        Evaluate    len(${number_small_size})
#    Filter Strips Management    size=Medium
#    ${number_medium_size}         Get Strips Management
#    ${number_medium_size}        Evaluate    len(${number_medium_size})
#    Filter Strips Management    size=Large
#    ${number_large_size}          Get Strips Management
#    ${number_large_size}        Evaluate    len(${number_large_size})
#    ${number_status}              Verify Number Size Heatmap    number_small=${number_small_size}   number_medium=${number_medium_size}     number_large=${number_large_size}
#    Then Run Keyword And Continue On Failure    Should Be True    ${number_status}
#    [Teardown]    SUITE TEARDOWN
#
#BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-06: can view event with search by event ID
#    [Documentation]     Author: Thang Tran
#    ...
#    ...     Description: Verify search by event ID
#    ...
#    ...     Precondition:
#    ...     - The user is on the AI report processing screen
#    ...
#    ...     Test Steps:
#    ...     1. Navigate to airp page
#    ...     2. Click on the "Strips Management" button
#    ...     3. Click on the "Patient triggered" link
#    ...     4. Input event ID to event search
#    ...     5. Observe the result
#    ...
#    ...     Expected Results:
#    ...     5. Verify the information event displayed to correctly
#    ...
#    ...     **Others**
#    ...     Create date: 05/15/2024 - Thang Tran
#    ...
#    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-06     manual
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#
#BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-07: Verify filter event by Type and Validity
#    [Documentation]     Author: Thang Tran
#    ...
#    ...     Description: Verify filter event by Type
#    ...
#    ...     Precondition:
#    ...     - The user is on the AI report processing screen
#    ...
#    ...     Test Steps:
#    ...     1. Navigate to airp page
#    ...     2. Click on the "Strips Management" button
#    ...     3. Click on the "Patient triggered" link
#    ...     4. Click on Filter icon
#    ...     5. Select the event type "All type/Brady/Tachy/AFib/Pause/Auto/Sinus/Manual" on the Type of event
#    ...     6. Select validity status "Valid" -> Click on "Filter" button -> Observe the result
#    ...     7. Click on Filter icon -> Select validity status "Invalid" -> Click on "Filter" button -> Observe the result
#    ...
#    ...     Expected Results:
#    ...     6,7. Verify the information event displayed to correctly
#    ...
#    ...     **Others**
#    ...     Create date: 05/15/2024 - Thang Tran
#    ...
#    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-07     manual
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#
#BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-08: Check the toolbar on "Edit Strip" event page
#    [Documentation]     Author: Thang Tran
#    ...
#    ...     Description: Check the toolbar on "Edit Strip" event page
#    ...
#    ...     Precondition:
#    ...     - The user is on the AI report processing screen
#    ...
#    ...     Test Steps:
#    ...     1. Navigate to airp page
#    ...     2. Click on the "Strips Management" button
#    ...     3. Click on the "Patient triggered" link
#    ...     4. Click on "Edit" button -> Observe the result
#    ...
#    ...     Expected Results:
#    ...     5. Verify The toolbar displayed: SPEED, GAIN, HP, LP, CH1, CH2, CH3, Capture, Zoom Tool, View All Strip
#    ...
#    ...     **Others**
#    ...     Create date: 05/15/2024 - Thang Tran
#    ...     Auto Create: 05/31/2024 - Thang Tran
#    ...
#    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-08     auto
#    [Setup]     SUITE SETUP
#    Navigate To Aireport
#    Navigate Airp Tab     tab=Strips Management
#    Navigate To Tab Menu Strips Management      menu=Patient triggered
#    ${include_reports}       Get Strips Management
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${include_reports}
#    Filter Strips Management        edit_strip=${True}
#    ${expected_status}     Check Toolbar Ecg Viewer Strips Management Available
#    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Speed]
#    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Gain]
#    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[High Pass]
#    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Low Pass]
#    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH1]
#    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH2]
#    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH3]
#    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Capture]
#    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Zoom Tool]
#    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[View All Strip]
#    [Teardown]    SUITE TEARDOWN
#
#BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-09: Can view the zoom in and zoom out on "Edit Strip" page
#    [Documentation]     Author: Thang Tran
#    ...
#    ...     Description: Can view the zoom in and zoom out on "Edit Strip" page
#    ...
#    ...     Precondition:
#    ...     - The user is on the AI report processing screen
#    ...
#    ...     Test Steps:
#    ...     1. Navigate to airp page
#    ...     2. Click on the "Strips Management" button
#    ...     3. Click on the "Patient triggered" link
#    ...     4. Click on "Edit" button -> Observe the result
#    ...
#    ...     Expected Results:
#    ...     4. Verify the zoom in, zoom out
#    ...
#    ...     **Others**
#    ...     Create date: 05/15/2024 - Thang Tran
#    ...     Auto Create: 05/31/2024 - Thang Tran
#    ...
#    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-09      auto
#    [Setup]     SUITE SETUP
#    Navigate To Aireport
#    Navigate Airp Tab     tab=Strips Management
#    Navigate To Tab Menu Strips Management      menu=Patient triggered
#    ${include_reports}       Get Strips Management
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${include_reports}
#    Filter Strips Management        edit_strip=${True}
#    Filter Strips Management        zoom_tool=${True}
#    ${status}     Check Toolbar Ecg Viewer Strips Management Available
#    Run Keyword And Continue On Failure    Should Be True    ${status}[Zoom Tool]
#    Run Keyword And Continue On Failure    Should Be True    ${status}[Capture]
#    Run Keyword And Continue On Failure    Should Not Be True    ${status}[View All Strip]
#    [Teardown]    SUITE TEARDOWN
#
#BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-10: View the toolbar options on "Edit Strip" page
#    [Documentation]     Author: Thang Tran
#    ...
#    ...     Description: View the toolbar options on "Edit Strip" page
#    ...
#    ...     Precondition:
#    ...     - The user is on the AI report processing screen
#    ...
#    ...     Test Steps:
#    ...     1. Navigate to airp page
#    ...     2. Click on the "Strips Management" button
#    ...     3. Click on the "Patient triggered" link
#    ...     4. Click on "Edit" button
#    ...     5. Click on the "Speed/Gain/HP/LP" dropdown list -> Observe the result
#    ...
#    ...     Expected Results:
#    ...     5. - on Speed: 2.5 mm/s, 10 mm/s, 25 mm/s, 50 mm/s, 75 mm/s, 100 mm/s, 200 mm/s, 500 mm/s
#    ...        - on Gain: 1 mm/mV, 2 mm/mV, 5 mm/mV, 7.5 mm/mV, 10 mm/mV, 20 mm/mV, 50 mm/mV, 100 mm/mV, 200 mm/mV
#    ...        - on HP: No, 0.05 Hz, 0.5 Hz, 1 Hz, 2 Hz
#    ...        - on LP: No, 15 Hz, 30 Hz, 40 Hz, 50 Hz (Notch), 60 Hz (Notch), 100 Hz
#    ...
#    ...     **Others**
#    ...     Create date: 05/15/2024 - Thang Tran
#    ...     Auto Create: 05/31/2024 - Thang Tran
#    ...
#    [Tags]     BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-10     auto
#    [Setup]     SUITE SETUP
#    Navigate To Aireport
#    Navigate Airp Tab     tab=Strips Management
#    Navigate To Tab Menu Strips Management      menu=Patient triggered
#    ${include_reports}       Get Strips Management
#    ${infor_box}       Get Strips Management Box
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${include_reports}
#    Filter Strips Management        edit_strip=${True}
#    ${current_value_strips}         Get Current Value Strips Config
#    ${start_time_edit}              Get Start Time Edit Strip
#    ${expected_speed_config}         Create List    2.5 mm/s   10 mm/s    25 mm/s   50 mm/s   75 mm/s   100 mm/s   200 mm/s   500 mm/s
#    ${expected_gain_config}         Create List    1 mm/mV   2 mm/mV   5 mm/mV   7.5 mm/mV   10 mm/mV   20 mm/mV    50 mm/mV   100 mm/mV    200 mm/mV
#    ${expected_highpass_config}     Create List    No   0.05 Hz    0.5 Hz    1 Hz    2 Hz
#    ${expected_lowpass_config}     Create List    No   15 Hz    30 Hz    40 Hz    50 Hz (Notch)    60 Hz (Notch)   100 Hz
#    ${actual_speed_config}           Get Speed Edit Strip Config
#    ${actual_gain_config}           Get Gain Edit Strip Config
#    ${actual_highpass_config}       Get Highpass Edit Strip Config
#    ${actual_lowpass_config}       Get Lowpass Edit Strip Config
#    Run Keyword And Continue On Failure    Lists Should Be Equal   ${expected_speed_config}          ${actual_speed_config}
#    Run Keyword And Continue On Failure    Lists Should Be Equal   ${expected_gain_config}          ${actual_gain_config}
#    Run Keyword And Continue On Failure    Lists Should Be Equal   ${expected_highpass_config}          ${actual_highpass_config}
#    Run Keyword And Continue On Failure    Lists Should Be Equal   ${expected_lowpass_config}          ${actual_lowpass_config}
#    Run Keyword And Continue On Failure     Should Be Equal    ${current_value_strips}[Speed]       25
#    Run Keyword And Continue On Failure     Should Be Equal    ${current_value_strips}[Gain]       10
#    Run Keyword And Continue On Failure     Should Be Equal    ${current_value_strips}[High Pass]     0.5
#    Run Keyword And Continue On Failure     Should Be Equal    ${current_value_strips}[Low Pass]      40
#    Run Keyword And Continue On Failure     Should Be Equal    ${infor_box}[Captured time]      ${start_time_edit} PDT
#    [Teardown]    SUITE TEARDOWN
#
#BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-11: The filter back to default status after reset the filter
#    [Documentation]     Author: Thang Tran
#    ...
#    ...     Description: The filter back to default status after reset the filter
#    ...
#    ...     Precondition:
#    ...     - The user is on the AI report processing screen
#    ...
#    ...     Test Steps:
#    ...     1. Navigate to airp page
#    ...     2. Click on the "Strips Management" button
#    ...     3. Click on the "Patient triggered" link
#    ...     4. Click on filter icon
#    ...     5. Change information on page
#    ...     6. Click on "Reset filter" link
#    ...
#    ...     Expected Results:
#    ...     5. Verify the information that back to default status after select the reset filter
#    ...
#    ...     **Others**
#    ...     Create date: 04/16/2024 - Thang Tran
#    ...     Auto Create: 05/31/2024 - Thang Tran
#    ...
#    [Tags]     BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-VIEW-11     auto
#    [Setup]     SUITE SETUP
#    Navigate To Aireport
#    Navigate Airp Tab     tab=Strips Management
#    Navigate To Tab Menu Strips Management      menu=Patient triggered
#    ${strip_management}     Get Strips Management
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${strip_management}
#    Filter Strips Management        search_by=${True}
#    ${current_filter}       Get Current Filters Strip
#    Filter Strips Management        search_by_event_type=Pause      search_by_validity=Valid
#    ${actual_filter}       Get Current Filters Strip
#    Run Keyword And Continue On Failure    Should Be Equal    ${actual_filter}[Type of event]       Pause
#    Run Keyword And Continue On Failure    Should Be Equal    ${actual_filter}[Validity]       Valid
#    Filter Strips Management        filter_submit=${True}
#    Get Strips Management
#    Filter Strips Management        search_by=${True}
#    ${expected_filter}       Get Current Filters Strip
#    Run Keyword And Continue On Failure    Should Be Equal    ${actual_filter}[Type of event]       ${expected_filter}[Type of event]
#    Run Keyword And Continue On Failure    Should Be Equal    ${actual_filter}[Validity]       ${expected_filter}[Validity]
#    Filter Strips Management        filter_reset=${True}
#    ${filter_reset}       Get Current Filters Strip
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Type of event]       ${filter_reset}[Type of event]
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Validity]            ${filter_reset}[Validity]
#    [Teardown]    SUITE TEARDOWN
#
#BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-PAGINATION-01: Can next page by using Next/Previous button
#    [Documentation]     Author: Thang Tran
#    ...
#    ...     Description: check the pagination tool is working properly
#    ...
#    ...     Precondition:
#    ...     - The user is on the AI report processing screen
#    ...
#    ...     Test Steps:
#    ...     1. 1. Navigate to airp page
#    ...     2. Click on the "Strips Management" button
#    ...     3. Click on the "Patient triggered" link
#    ...     4. Click on the "Next" button
#    ...     5. Click on the "Previous"
#    ...     6. Observe the result
#    ...
#    ...     Expected Results:
#    ...     3. Verify the page displayed default is 1
#    ...     4. Verify the page displayed is 2
#    ...     5. Verify the page displayed is 1
#    ...
#    ...     **Others**
#    ...     Create date: 05/16/2024 - Thang Tran
#    ...     Auto Create: 05/31/2024 - Thang Tran
#    ...
#    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-PAGINATION-01    auto
#    [Setup]     SUITE SETUP
#    Navigate To Aireport
#    Navigate Airp Tab     tab=Strips Management
#    Navigate To Tab Menu Strips Management      menu=Patient triggered
#    ${strips_management}       Get Strips Management
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${strips_management}
#    ${current_pagination_default}     Get Current Airp Pagination
#    Pagination Aireports    next_or_previous=next
#    Wait Strips Items Available
#    ${current_pagination_next}     Get Current Airp Pagination
#    Pagination Aireports    next_or_previous=previous
#    Wait Strips Items Available
#    ${current_pagination_previous}     Get Current Airp Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_default}[Page]     1
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_next}[Page]     2
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_previous}[Page]     1
#    [Teardown]      SUITE TEARDOWN
#
#BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-PAGINATION-02: Can next page by using Next/Previous by hotkey
#    [Documentation]     Author: Thang Tran
#    ...
#    ...     Description: check the pagination tool by hotkey is working properly
#    ...
#    ...     Precondition:
#    ...     - The user is on the AI report processing screen
#    ...
#    ...     Test Steps:
#    ...     1. Navigate to airp page
#    ...     2. Click on the "Strips Management" button
#    ...     3. Click on the "Patient triggered" link
#    ...     4. Using hotkey "Z" (is Next button)
#    ...     5. Using hotkey "X" (is Previous button)
#    ...     6. Observe the result
#    ...
#    ...     Expected Results:
#    ...     3. Verify the page displayed default is 1
#    ...     4. Verify the page displayed is 2
#    ...     6. Verify the page displayed is 1
#    ...
#    ...     **Others**
#    ...     Create date: 05/16/2024 - Thang Tran
#    ...     Auto Create: 05/31/2024 - Thang Tran
#    ...
#    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-PAGINATION-02      auto
#    [Setup]     SUITE SETUP
#    Navigate To Aireport
#    Navigate Airp Tab     tab=Strips Management
#    Navigate To Tab Menu Strips Management      menu=Patient triggered
#    ${strips_management}       Get Strips Management
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${strips_management}
#    View Strips Management On    1
#    ${current_pagination_default}     Get Current Airp Pagination
#    Pagination Aireports Hotkey    next_or_previous=next
#    Wait Strips Items Available
#    ${current_pagination_next}     Get Current Airp Pagination
#    Pagination Aireports Hotkey    next_or_previous=previous
#    Wait Strips Items Available
#    ${current_pagination_previous}     Get Current Airp Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_default}[Page]     1
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_next}[Page]     2
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_previous}[Page]     1
#    [Teardown]      SUITE TEARDOWN
#
#BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-PAGINATION-03: Verify the pagination tool can manually input a number within the limit displayed on the page number
#    [Documentation]     Author: Thang Tran
#    ...
#    ...     Description: check the pagination tool can manually input a number within the limit displayed on the page number
#    ...
#    ...     Precondition:
#    ...     - The user is on the AI report processing screen
#    ...
#    ...     Test Steps:
#    ...     1. Navigate to airp page
#    ...     2. Click on the "Strips Management" button
#    ...     3. Click on the "Patient triggered" link
#    ...     4. Input number in page input
#    ...
#    ...     Expected Results:
#    ...     4. - Input the page number is 0 -> verify message displayed
#    ...        - Input the number is larger than the ‘all page’ number -> verify message displayed
#    ...        - Check the user fill in only integers
#    ...
#    ...     **Others**
#    ...     Create date: 05/15/2024 - Thang Tran
#    ...     Auto Create: 05/31/2024 - Thang Tran
#    ...
#    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-PATIENT-PAGINATION-03     auto
#    [Setup]     SUITE SETUP
#    Navigate To Aireport
#    Navigate Airp Tab     tab=Strips Management
#    Navigate To Tab Menu Strips Management      menu=Patient triggered
#    ${strips_management}       Get Strips Management
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${strips_management}
#    ${current_pagination_default}     Get Current Airp Pagination
#    ${status_page_less_than}     Edit Page Number      page_number=0
#    ${current_total_page}     Get Current Total Page Airp Pagination
#    ${current_total_page}     Evaluate    ${current_total_page} + 1
#    ${status_page_lager_than}     Edit Page Number      page_number=${current_total_page}
#    ${status_page}     Edit Page Number      page_number=1
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_default}[Page]     1
#    Run Keyword And Continue On Failure    Should Not Be True    ${status_page_less_than}
#    Run Keyword And Continue On Failure    Should Not Be True    ${status_page_lager_than}
#    Run Keyword And Continue On Failure    Should Be True    ${status_page}
#    [Teardown]      SUITE TEARDOWN

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_ai_report_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Reports.py      ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Studies.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/EcgEvent.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/StudyManagement.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/EventDetails.py          ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/StripsManagement.py          ${BROWSER_NODE}     ${ENV}
    ${USERS}                Get Config Param    NEW_USERS
    ${STUDY_ID}             Get Config Param    STUDY_ID
    ${CURRENT_USER}         Set Variable        ${USERS}[callcenter_airp]
    ${STUDY_ID_COMPLETED}      Set Variable        ${STUDY_ID}[study_id_completed]
    Navigate To Callcenter Sign In Page
    ${TOKEN}                Sign In Callcenter  ${CURRENT_USER}[username]      ${CURRENT_USER}[password]
    Set Suite Variable      ${TOKEN}
    Set Global Variable     ${STUDY_ID_COMPLETED}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

Navigate to aireport
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies      search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_strips_management]
    ${reports}      Get Completed Studies On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Manage Complete Study On              row=1
    Navigate To Studies Type        Reports
    View Completed New Report Status On          row=1
    Switch Tab
    ${RELEASE_VERSION}      Get Release Version Aireport
    Set Suite Metadata   version   ${RELEASE_VERSION}

Navigate to events page
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies      search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_strips_management]
    ${reports}      Get Completed Studies On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Manage Complete Study On              row=1
    Navigate To Studies Type        Events

Create the patient triggered
    Navigate To Events Page
    Filter Study Events     by_type=Manual
    ${events}   Get All Study Events
    ${events_id}     Evaluate    [item['Event ID'] for item in ${events} if item.get('Symptoms:') in ('Palpitations', 'Shortness of breath', 'Dizziness', 'Chest Pain', 'Other', 'Not specified')]
    ${event_id}     Set Variable    ${events_id}[0]
    Filter Study Events     text_search=${event_id}
    Edit Study Event On        row=1
    # cheat code
    Switch Tab
    Navigate To Event Tab    Event Details
    ${event_type}   Get Event Details
    Edit Event Details     event_validity=Valid       is_close=${True}      include_report=${False}
#    Back From Study Management
    Set Global Variable    ${event_id}
    Set Global Variable    ${event_type}

Check strips event with "${event_id}" has been dispayed
    Filter Strips Management      text_search=${event_id}
    ${included_report}     Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${included_report}

Check strips event with "${event_id}" did not display
    Filter Strips Management      text_search=${event_id}
    ${msg_data}     Get Message Strip Management
    Run Keyword And Continue On Failure    Should Be Equal     ${msg_data}      There is no data to display

Marked strips events to "Include event in report"
    Filter Strips Management      include_report=${True}
    ${strip_management}     Get Strips Management Selected
    ${status}               Evaluate    [item['Status'] for item in ${strip_management}]
    ${include_reports}               Evaluate    [item['Include report'] for item in ${strip_management}]
    ${contain_included_reports}      Evaluate    [k for d in ${strip_management} for k in d.keys()]
    Run Keyword And Continue On Failure    List Should Contain Value       ${status}      Edited
    Run Keyword And Continue On Failure    List Should Contain Value       ${include_reports}      Incl. in report
    Run Keyword And Continue On Failure    List Should Contain Value       ${contain_included_reports}     Include report
    ${status}   Check Toolbar Strips Management Available
    Run Keyword And Continue On Failure    Should Be True    ${status}[Include strip]
    Filter Header    is_save=${True}

Check that the include strip has been marked with the event "${event_id}"
    Filter Strips Management      text_search=${event_id}
    ${strip_management}     Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${strip_management}
    Run Keyword And Continue On Failure    Should Be Equal    ${strip_management}[0][Include strip]      Incl. strip
    Run Keyword And Continue On Failure    Should Be Equal    ${strip_management}[0][Include report]      Incl. in report
    ${status_include}       Check Mark Include Toolbar Available
    Run Keyword And Continue On Failure    Should Be True    ${status_include}[Include strip]
    Filter Strips Management      include_strip=${False}        include_report=${False}
    Filter Header    is_save=${True}

Check event "${event_id}" change to the validity "${validity_status}"
    Filter Strips Management        text_search=${event_id}
    ${patient_triggered}     Get Strips Management Selected
    Run Keyword And Continue On Failure     Should Be Equal    ${patient_triggered}[0][Validity Status]        ${validity_status}
    ${validity_header}       Get Current Values Toolbar Strips Management
    Run Keyword And Continue On Failure     Should Be Equal    ${validity_header}[Validity Status]        ${validity_status}
    Filter Strips Management       validity=Valid
    Filter Header       is_save=${True}
