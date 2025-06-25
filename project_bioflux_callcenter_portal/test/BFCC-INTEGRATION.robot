*** Settings ***
Documentation   Test Suite - Integration cases
Metadata    sid     BFCC-INTEGRATION
Metadata    owner   Nhan Nguyen
Library     Collections
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library       project_bioflux_callcenter_portal/lib/ConfigHandler.py    ${ENV}
Library       project_bioflux_callcenter_portal/lib/web/Common.py
Library       project_bioflux_callcenter_portal/lib/web/Events.py
Library       project_bioflux_callcenter_portal/lib/web/EventDetails.py
Library       project_bioflux_callcenter_portal/lib/web/Reports.py
Library       project_bioflux_callcenter_portal/lib/web/StudyManagement.py
Library       project_bioflux_callcenter_portal/lib/web/Studies.py
Library       project_bioflux_clinic_portal/lib/ConfigHandler.py    ${ENV}
Library       project_bioflux_clinic_portal/lib/web/Inbox.py
Library       project_bioflux_clinic_portal/lib/web/Common.py

#Suite Setup        SUITE SETUP
Suite Teardown     SUITE TEARDOWN
Force Tags         BFCC-INTEGRATION     web
Test Timeout       30m

*** Test Cases ***
BFCC-INTEGRATION-01: Call Center Technician - Process an event report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Call Center Technician - Process an event report
    ...
    ...     Precondition:
    ...     - The Call Center Technician has logged into the Call Center portal
    ...     - Land on an Event details page
    ...
    ...     Test Steps:
    ...     1. Call Center Technician:
    ...     - Close an event report as valid
    ...     - Generate report
    ...     - Select a priority and click "Ready" button
    ...     - Reload Event details page and check Call Status
    ...     2. View Event report in:
    ...         - Call Center Supervisor >> Reports page >> Ready Notification reports-All assignee
    ...         - Call Center QA Leader >> Reports page >> Ready Notification reports-All assignee
    ...         - Call Center QA >> Reports page >> Ready Notification reports-All assignee
    ...         - Call Center Technician >> Reports page >> Ready Notification reports
    ...     3. View Event report in:
    ...         - Call Center Supervisor >> Study Management page >> Reports tab-Notification report
    ...         - Call Center QA Leader >> Study Management page >> Reports tab-Notification report
    ...         - Call Center QA >> Study Management page >> Reports tab-Notification report
    ...         - Call Center Technician >> Study Management page >> Reports tab-Notification report
    ...
    ...     Expected Results:
    ...     1. Step 1: Call Status is Call Required
    ...     2. Step 2: Event report info is displayed properly, including: Event ID, Priority, Event Time, Event Type, Symptom
    ...     3. Step 3: Event report info is displayed properly
    ...     - Report ID matches Event ID
    ...     - Date of Service matches Event Trigger Time
    ...     - Status must be Ready
    ...     - Last modified matches Time of marking report as Ready
    ...     - Assignee must be Empty
    ...
    [Tags]      BFCC-INTEGRATION-01       auto
    [Setup]    SUITE SETUP   callcenter_technician
    Create Ready Notification Reports With Study Id Is "${STUDY_ID_ASSIGN}[study_id]"
    Refresh Page
    Navigate To Event Tab      Event Details
    ${actual_call_option}       Get Event Details
    ${event_infor}     Evaluate    {k: v for k, v in ${actual_call_option}[EVENT INFORMATION].items()}
    ${trigger_time}             Set Variable    ${event_infor}[Trigger Time]
    ${trigger_time}             Convert Datetime Utc Or Est      original_datetime_str=${trigger_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_call_option}[Call Option]      Call Required
    Navigate To Reports
    Filter Reports       report_state=Ready        report_type=Notification reports     search_by=Study ID      text_search=${study_id}
    ${event_report}         Get Ready Notification Event Reports Detail
    ${expected_header_event}        Create List    Event ID    Priority   Event time   Event type   Symptom
    ${actual_header_event}      Evaluate    [k for k, v in ${event_report}[0].items()]
    ${event_time}               Evaluate    [item['Event time'] for item in ${event_report} if item.get('Event ID') == '${event_search}']
    ${event_time}             Format Datetime     original_datetime_str=${event_time}[0]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_header_event}    ${actual_header_event}
    Check Event Report With Event "${event_search}" In Ready On Subtab "Notification reports" By Account "callcenter_supervisor"
    Check Event Report On The Notification Reports Screen With Event "${event_search}" With Report Status "Ready"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
    Check Event Report With Event "${event_search}" In Ready On Subtab "Notification reports" By Account "callcenter_qaleader"
    Check Event Report On The Notification Reports Screen With Event "${event_search}" With Report Status "Ready"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
    Check Event Report With Event "${event_search}" In Ready On Subtab "Notification reports" By Account "callcenter_qa"
    Check Event Report On The Notification Reports Screen With Event "${event_search}" With Report Status "Ready"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
#    Check Event Report On The Notification Reports Screen With Event "${event_search}" With Report Status "Ready"
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
#    Check Event Report On The Notification Reports Screen With Event "${event_search}" With Report Status "Ready"
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
#    Check Event Report On The Notification Reports Screen With Event "${event_search}" With Report Status "Ready"
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}

BFCC-INTEGRATION-02: Call Center QA - Process an event report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Call Center QA - Process an event report
    ...
    ...     Precondition:
    ...     - The Call Center QA has logged into the Call Center portal
    ...     - An Event report has been marked as Ready and user is on Event details page
    ...
    ...     Test Steps:
    ...     1. Call Center QA:
    ...     - Click "Send" button
    ...     - Reload Event details page and check Call Status
    ...     2. View Event report in:
    ...         - Call Center Supervisor >> Reports page >> Ready Call Required
    ...         - Call Center QA Leader >> Reports page >> Ready Call Required
    ...         - Call Center QA >> Reports page >> Ready Call Required
    ...         - Call Center Technician >> Reports page >> Ready Call Required
    ...     3. View Event report in:
    ...         - Call Center Supervisor >> Study Management page >> Reports tab-Notification report
    ...         - Call Center QA Leader >> Study Management page >> Reports tab-Notification report
    ...         - Call Center QA >> Study Management page >> Reports tab-Notification report
    ...         - Call Center Technician >> Study Management page >> Reports tab-Notification report
    ...     4. View Event report in:
    ...         - Clinic Technician >> Inbox page >> Recent reports, All reports, Notification reports
    ...         - Clinic Physician >> Inbox page >> Recent reports, All reports, Notification reports
    ...
    ...     Expected Results:
    ...     1. Step 1: Call Status is Call Required
    ...     2. Step 2: Event report info is displayed properly, including: Event ID, Priority, Event Time, Event Type, Symptom
    ...     3. Step 3: Event report info is displayed properly
    ...     - Report ID matches Event ID
    ...     - Date of Service matches Event Trigger Time
    ...     - Status must be Sent
    ...     - Last modified matches Time of Report sent
    ...     - Assignee must be Empty
    ...     4. Step 4: Event report is displayed properly
    ...
    [Tags]      BFCC-INTEGRATION-02       auto
    [Setup]    SUITE SETUP   callcenter_qa
    Create Ready Call Required
    Refresh Page
    Navigate To Event Tab      Event Details
    ${actual_call_option}       Get Event Details
    ${event_infor}     Evaluate    {k: v for k, v in ${actual_call_option}[EVENT INFORMATION].items()}
    ${trigger_time}             Set Variable    ${event_infor}[Trigger Time]
    ${trigger_time}             Convert Datetime Utc Or Est     original_datetime_str=${trigger_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_call_option}[Call Option]      Call Required
    Navigate To Reports
    Filter Reports       report_state=Ready        report_type=Call required
    ${call_required_reports}     Get Ready Call Required Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${call_required_reports}
    Filter Reports      search_by=Study ID      text_search=${study_id}
    ${event_report}         Get Ready Notification Event Reports Detail
    ${expected_header_event}        Create List    Event ID    Priority   Event time   Event type   Symptom
    ${actual_header_event}      Evaluate    [k for k, v in ${event_report}[0].items()]
    ${event_time}               Evaluate    [item['Event time'] for item in ${event_report} if item.get('Event ID') == '${event_search}']
    ${event_time}             Format Datetime     original_datetime_str=${event_time}[0]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_header_event}    ${actual_header_event}
    Check Event Report With Event "${event_search}" In Ready On Subtab "Call required" By Account "callcenter_supervisor"
    Check Event Report On The Notification Reports Screen With Event "${event_search}" With Report Status "Sent"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_trigger_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
    Check Event Report With Event "${event_search}" In Ready On Subtab "Call required" By Account "callcenter_qaleader"
    Check Event Report On The Notification Reports Screen With Event "${event_search}" With Report Status "Sent"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_trigger_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
    Check Event Report With Event "${event_search}" In Ready On Subtab "Call required" By Account "callcenter_technician"
    Check Event Report On The Notification Reports Screen With Event "${event_search}" With Report Status "Sent"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_trigger_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "Event" By Account "clinic_physician"       Notification reports
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "Event" By Account "clinic_technician"      Notification reports

BFCC-INTEGRATION-03: Call Center QA Leader - Process an event report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Call Center QA Leader - Process an event report
    ...
    ...     Precondition:
    ...     - The Call Center QA Leader has logged into the Call Center portal
    ...     - An Event report has been marked as Ready and user is on Event details page
    ...
    ...     Test Steps:
    ...     1. Call Center QA Leader:
    ...     - Click "Send" button
    ...     - Reload Event details page and check Call Status
    ...     2. View Event report in:
    ...         - Call Center Supervisor >> Reports page >> Ready Call Required
    ...         - Call Center QA Leader >> Reports page >> Ready Call Required
    ...         - Call Center QA >> Reports page >> Ready Call Required
    ...         - Call Center Technician >> Reports page >> Ready Call Required
    ...     3. View Event report in:
    ...         - Call Center Supervisor >> Study Management page >> Reports tab-Notification report
    ...         - Call Center QA Leader >> Study Management page >> Reports tab-Notification report
    ...         - Call Center QA >> Study Management page >> Reports tab-Notification report
    ...         - Call Center Technician >> Study Management page >> Reports tab-Notification report
    ...     4. View Event report in:
    ...         - Clinic Technician >> Inbox page >> Recent reports, All reports, Notification reports
    ...         - Clinic Physician >> Inbox page >> Recent reports, All reports, Notification reports
    ...
    ...     Expected Results:
    ...     1. Step 1: Call Status is Call Required
    ...     2. Step 2: Event report info is displayed properly, including: Event ID, Priority, Event Time, Event Type, Symptom
    ...     3. Step 3: Event report info is displayed properly
    ...     - Report ID matches Event ID
    ...     - Date of Service matches Event Trigger Time
    ...     - Status must be Sent
    ...     - Last modified matches Time of Report sent
    ...     - Assignee must be Empty
    ...     4. Step 4: Event report is displayed properly
    ...
    [Tags]      BFCC-INTEGRATION-03      auto
    [Setup]    SUITE SETUP   callcenter_qaleader
    Create Ready Call Required
    Refresh Page
    Navigate To Event Tab      Event Details
    ${actual_call_option}       Get Event Details
    ${event_infor}     Evaluate    {k: v for k, v in ${actual_call_option}[EVENT INFORMATION].items()}
    ${trigger_time}             Set Variable    ${event_infor}[Trigger Time]
    ${trigger_time}             Convert Datetime Utc Or Est     original_datetime_str=${trigger_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_call_option}[Call Option]      Call Required
    Navigate To Reports
    Filter Reports       report_state=Ready        report_type=Call required
    ${call_required_reports}     Get Ready Call Required Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${call_required_reports}
    Filter Reports      search_by=Study ID      text_search=${study_id}
    ${event_report}         Get Ready Notification Event Reports Detail
    ${expected_header_event}        Create List    Event ID    Priority   Event time   Event type   Symptom
    ${actual_header_event}      Evaluate    [k for k, v in ${event_report}[0].items()]
    ${event_time}               Evaluate    [item['Event time'] for item in ${event_report} if item.get('Event ID') == '${event_search}']
    ${event_time}             Format Datetime     original_datetime_str=${event_time}[0]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_header_event}    ${actual_header_event}
    Check Event Report With Event "${event_search}" In Ready On Subtab "Call required" By Account "callcenter_supervisor"
    Check Event Report On The Notification Reports Screen With Event "${event_search}" With Report Status "Sent"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_trigger_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
    Check Event Report With Event "${event_search}" In Ready On Subtab "Call required" By Account "callcenter_qa"
    Check Event Report On The Notification Reports Screen With Event "${event_search}" With Report Status "Sent"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_trigger_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
    Check Event Report With Event "${event_search}" In Ready On Subtab "Call required" By Account "callcenter_technician"
    Check Event Report On The Notification Reports Screen With Event "${event_search}" With Report Status "Sent"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_trigger_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
#    Check Event Report On The Notification Reports Screen With Event "${event_search}" With Report Status "Sent"
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_trigger_time}
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
#    Check Event Report On The Notification Reports Screen With Event "${event_search}" With Report Status "Sent"
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_trigger_time}
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
#    Check Event Report On The Notification Reports Screen With Event "${event_search}" With Report Status "Sent"
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_trigger_time}
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "Event" By Account "clinic_physician"       Notification reports
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "Event" By Account "clinic_technician"      Notification reports

BFCC-INTEGRATION-04: Call Center Supervisor - Process an event report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Call Center Supervisor - Process an event report
    ...
    ...     Precondition:
    ...     - The Call Center Supervisor has logged into the Call Center portal
    ...     - An Event report has been marked as Ready and user is on Event details page
    ...
    ...     Test Steps:
    ...     1. Call Center Supervisor:
    ...     - Click "Send" button
    ...     - Reload Event details page and check Call Status
    ...     2. View Event report in:
    ...         - Call Center Supervisor >> Reports page >> Ready Call Required
    ...         - Call Center QA Leader >> Reports page >> Ready Call Required
    ...         - Call Center QA >> Reports page >> Ready Call Required
    ...         - Call Center Technician >> Reports page >> Ready Call Required
    ...     3. View Event report in:
    ...         - Call Center Supervisor >> Study Management page >> Reports tab-Notification report
    ...         - Call Center QA Leader >> Study Management page >> Reports tab-Notification report
    ...         - Call Center QA >> Study Management page >> Reports tab-Notification report
    ...         - Call Center Technician >> Study Management page >> Reports tab-Notification report
    ...     4. View Event report in:
    ...         - Clinic Technician >> Inbox page >> Recent reports, All reports, Notification reports
    ...         - Clinic Physician >> Inbox page >> Recent reports, All reports, Notification reports
    ...
    ...     Expected Results:
    ...     1. Step 1: Call Status is Call Required
    ...     2. Step 2: Event report info is displayed properly, including: Event ID, Priority, Event Time, Event Type, Symptom
    ...     3. Step 3: Event report info is displayed properly
    ...     - Report ID matches Event ID
    ...     - Date of Service matches Event Trigger Time
    ...     - Status must be Sent
    ...     - Last modified matches Time of Report sent
    ...     - Assignee must be Empty
    ...     4. Step 4: Event report is displayed properly
    ...
    [Tags]      BFCC-INTEGRATION-04       auto
    [Setup]    SUITE SETUP   callcenter_supervisor
    Create Ready Call Required
    Refresh Page
    Navigate To Event Tab      Event Details
    ${actual_call_option}       Get Event Details
    ${event_infor}     Evaluate    {k: v for k, v in ${actual_call_option}[EVENT INFORMATION].items()}
    ${trigger_time}             Set Variable    ${event_infor}[Trigger Time]
    ${trigger_time}             Convert Datetime Utc Or Est     original_datetime_str=${trigger_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_call_option}[Call Option]      Call Required
    Navigate To Reports
    Filter Reports       report_state=Ready        report_type=Call required
    ${call_required_reports}     Get Ready Call Required Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${call_required_reports}
    Filter Reports      search_by=Study ID      text_search=${study_id}
    ${event_report}         Get Ready Notification Event Reports Detail
    ${expected_header_event}        Create List    Event ID    Priority   Event time   Event type   Symptom
    ${actual_header_event}      Evaluate    [k for k, v in ${event_report}[0].items()]
    ${event_time}               Evaluate    [item['Event time'] for item in ${event_report} if item.get('Event ID') == '${event_search}']
    ${event_time}             Format Datetime     original_datetime_str=${event_time}[0]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_header_event}    ${actual_header_event}
    Check Event Report With Event "${event_search}" In Ready On Subtab "Call required" By Account "callcenter_qaleader"
    Check Event Report On The Notification Reports Screen With Event "${event_search}" With Report Status "Sent"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_trigger_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
    Check Event Report With Event "${event_search}" In Ready On Subtab "Call required" By Account "callcenter_qa"
    Check Event Report On The Notification Reports Screen With Event "${event_search}" With Report Status "Sent"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_trigger_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
    Check Event Report With Event "${event_search}" In Ready On Subtab "Call required" By Account "callcenter_technician"
    Check Event Report On The Notification Reports Screen With Event "${event_search}" With Report Status "Sent"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_trigger_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
#    Check Event Report On The Notification Reports Screen With Event "${event_search}" With Report Status "Sent"
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_trigger_time}
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
#    Check Event Report On The Notification Reports Screen With Event "${event_search}" With Report Status "Sent"
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_trigger_time}
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
#    Check Event Report On The Notification Reports Screen With Event "${event_search}" With Report Status "Sent"
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_trigger_time}
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "Event" By Account "clinic_physician"       Notification reports
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "Event" By Account "clinic_technician"      Notification reports


BFCC-INTEGRATION-05: Call Center Technician - Process a manual Interim report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Call Center Technician - Process a manual Interim report
    ...
    ...     Precondition:
    ...     - The Call Center Technician has logged into the Call Center portal
    ...     - Land on Study management page >> Reports tab-Summary report
    ...
    ...     Test Steps:
    ...     1. Call Center Technician:
    ...     - Create an Interim report
    ...     - Generate report
    ...     - Select a priority and click "Ready" button
    ...     2. View Interim report in:
    ...         - Call Center Supervisor >> Reports page >> Ready Interim reports-All assignee
    ...         - Call Center QA Leader >> Reports page >> Ready Interim reports-All assignee
    ...         - Call Center QA >> Reports page >> Ready Interim reports-All assignee
    ...         - Call Center Technician >> Reports page >> Ready Interim reports-All assignee
    ...     3. View Interim report in:
    ...         - Call Center Supervisor >> Study Management page >> Reports tab-Summary report
    ...         - Call Center QA Leader >> Study Management page >> Reports tab-Summary report
    ...         - Call Center QA >> Study Management page >> Reports tab-Summary report
    ...         - Call Center Technician >> Study Management page >> Reports tab-Summary report
    ...
    ...     Expected Results:
    ...     1. Step 2: Interim report info is displayed properly
    ...     2. Step 3: Interim report info is displayed properly
    ...     - Report ID
    ...     - Date of Service matches the selected time while creating Interim report
    ...     - Status must be Ready
    ...     - Last modified matches Time of marking report as Ready
    ...     - Assignee must be Empty
    ...
    [Tags]      BFCC-INTEGRATION-05       auto
    [Setup]    SUITE SETUP   callcenter_technician
    Create Ready Interim Reports With Study Id Is "${STUDY_ID_ASSIGN}[study_id_10]"
    Navigate To Reports
    Filter Reports       report_state=Ready        report_type=Interim report
    ${reports}     Get Ready Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Filter Reports      search_by=Study ID      text_search=${study_id}
    ${event_report}         Get Ready Interim Reports
    ${expected_header_event}        Create List    Study ID    Report ID   Creation Time   Date Of Service     Duration    Patient Name    Patient ID    Study Type
    ${actual_header_event}      Evaluate    [k for k, v in ${event_report}[0].items()]
    ${expected_event_report}      Evaluate    [item for item in ${event_report} if item.get('Report ID') == '${report_id}' and item.get('Study ID') == '${study_id}']
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_header_event}    ${actual_header_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_event_report}[0][Study ID]      ${study_id}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_event_report}[0][Report ID]         ${report_id}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_event_report}[0][Date Of Service]      ${datetime}
    Check Event Report On The Summary Reports Screen By Report Status "Ready" And Report Type "Interim"
    Check Interim Report In Ready On Subtab "Interim reports" By Account "callcenter_supervisor"
    Check Event Report On The Summary Reports Screen By Report Status "Ready" And Report Type "Interim"
    Check Interim Report In Ready On Subtab "Interim reports" By Account "callcenter_qaleader"
    Check Event Report On The Summary Reports Screen By Report Status "Ready" And Report Type "Interim"
    Check Interim Report In Ready On Subtab "Interim reports" By Account "callcenter_qa"
    Check Event Report On The Summary Reports Screen By Report Status "Ready" And Report Type "Interim"
#    Check Event Report On The Summary Reports Screen By Account "callcenter_supervisor"    Ready        Interim
#    Check Event Report On The Summary Reports Screen By Account "callcenter_qaleader"      Ready        Interim
#    Check Event Report On The Summary Reports Screen By Account "callcenter_qa"          Ready          Interim

BFCC-INTEGRATION-06: Call Center QA - Process a manual Interim report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Call Center QA - Process a manual Interim report
    ...
    ...     Precondition:
    ...     - The Call Center QA has logged into the Call Center portal
    ...     - An Interim report has been marked as Ready and user is on Report details page
    ...
    ...     Test Steps:
    ...     1. Call Center QA:
    ...     - Click "Send" button
    ...     2. View Interim report in:
    ...         - Call Center Supervisor >> Reports page >> Sent Interim reports
    ...         - Call Center QA Leader >> Reports page >> Sent Interim reports
    ...         - Call Center QA >> Reports page >> Sent Interim reports
    ...         - Call Center Technician >> Reports page >> Sent Interim reports
    ...     3. View Interim report in:
    ...         - Call Center Supervisor >> Study Management page >> Reports tab-Summary report
    ...         - Call Center QA Leader >> Study Management page >> Reports tab-Summary report
    ...         - Call Center QA >> Study Management page >> Reports tab-Summary report
    ...         - Call Center Technician >> Study Management page >> Reports tab-Summary report
    ...     4. View Interim report in:
    ...         - Clinic Technician >> Inbox page >> Recent reports, All reports, Interim reports
    ...         - Clinic Physician >> Inbox page >> Recent reports, All reports, Interim reports
    ...
    ...     Expected Results:
    ...     1. Step 2: Interim report info is displayed properly
    ...     2. Step 3: Interim report info is displayed properly
    ...     - Report ID
    ...     - Date of Service
    ...     - Status must be Sent
    ...     - Last modified matches Time of Report sent
    ...     - Assignee must be Empty
    ...     3. Step 4: Interim report is displayed properly
    ...
    [Tags]      BFCC-INTEGRATION-06       auto
    [Setup]    SUITE SETUP   callcenter_qa
    Create Sent Interim Reports
    Navigate To Reports
    Filter Reports       report_state=Sent        report_type=Interim report
    ${reports}     Get Sent Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Filter Reports      search_by=Study ID      text_search=${study_id}
    ${event_report}         Get Sent Interim Reports
    ${expected_header_event}        Create List    Study ID    Report ID   Date Of Service     Duration    Patient Name    Patient ID    Study Type     Assignee     Report Date
    ${actual_header_event}      Evaluate    [k for k, v in ${event_report}[0].items()]
    ${expected_event_report}      Evaluate    [item for item in ${event_report} if item.get('Report ID') == '${report_id}' and item.get('Study ID') == '${study_id}']
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_header_event}    ${actual_header_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_event_report}[0][Study ID]      ${study_id}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_event_report}[0][Report ID]         ${report_id}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_event_report}[0][Date Of Service]      ${datetime}
    Check Event Report On The Summary Reports Screen By Report Status "Sent" And Report Type "Interim"
    Check Interim Report In Tab Sent On Subtab "Interim reports" By Account "callcenter_supervisor"
    Check Event Report On The Summary Reports Screen By Report Status "Sent" And Report Type "Interim"
    Check Interim Report In Tab Sent On Subtab "Interim reports" By Account "callcenter_qaleader"
    Check Event Report On The Summary Reports Screen By Report Status "Sent" And Report Type "Interim"
    Check Interim Report In Tab Sent On Subtab "Interim reports" By Account "callcenter_technician"
    Check Event Report On The Summary Reports Screen By Report Status "Sent" And Report Type "Interim"
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "Interim" By Account "clinic_physician"       Interim reports
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "Interim" By Account "clinic_technician"      Interim reports

BFCC-INTEGRATION-07: Call Center QA Leader - Process a manual Interim report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Call Center QA Leader - Process a manual Interim report
    ...
    ...     Precondition:
    ...     - The Call Center QA Leader has logged into the Call Center portal
    ...     - An Interim report has been marked as Ready and user is on Report details page
    ...
    ...     Test Steps:
    ...     1. Call Center QA Leader:
    ...     - Click "Send" button
    ...     2. View Interim report in:
    ...         - Call Center Supervisor >> Reports page >> Sent Interim reports
    ...         - Call Center QA Leader >> Reports page >> Sent Interim reports
    ...         - Call Center QA >> Reports page >> Sent Interim reports
    ...         - Call Center Technician >> Reports page >> Sent Interim reports
    ...     3. View Interim report in:
    ...         - Call Center Supervisor >> Study Management page >> Reports tab-Summary report
    ...         - Call Center QA Leader >> Study Management page >> Reports tab-Summary report
    ...         - Call Center QA >> Study Management page >> Reports tab-Summary report
    ...         - Call Center Technician >> Study Management page >> Reports tab-Summary report
    ...     4. View Event report in:
    ...         - Clinic Technician >> Inbox page >> Recent reports, All reports, Interim reports
    ...         - Clinic Physician >> Inbox page >> Recent reports, All reports, Interim reports
    ...
    ...     Expected Results:
    ...     1. Step 2: Interim report info is displayed properly
    ...     2. Step 3: Interim report info is displayed properly
    ...     - Report ID
    ...     - Date of Service
    ...     - Status must be Sent
    ...     - Last modified matches Time of Report sent
    ...     - Assignee must be Empty
    ...     3. Step 4: Interim report is displayed properly
    ...
    [Tags]      BFCC-INTEGRATION-07       auto
    [Setup]    SUITE SETUP      callcenter_qaleader
    Create Sent Interim Reports
    Navigate To Reports
    Filter Reports       report_state=Sent        report_type=Interim report
    ${reports}     Get Sent Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Filter Reports      search_by=Study ID      text_search=${study_id}
    ${event_report}         Get Sent Interim Reports
    ${expected_header_event}        Create List    Study ID    Report ID   Date Of Service     Duration    Patient Name    Patient ID    Study Type    Assignee      Report Date
    ${actual_header_event}      Evaluate    [k for k, v in ${event_report}[0].items()]
    ${expected_event_report}      Evaluate    [item for item in ${event_report} if item.get('Report ID') == '${report_id}' and item.get('Study ID') == '${study_id}']
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_header_event}    ${actual_header_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_event_report}[0][Study ID]      ${study_id}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_event_report}[0][Report ID]         ${report_id}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_event_report}[0][Date Of Service]      ${datetime}
    Check Event Report On The Summary Reports Screen By Report Status "Sent" And Report Type "Interim"
    Check Interim Report In Tab Sent On Subtab "Interim reports" By Account "callcenter_supervisor"
    Check Event Report On The Summary Reports Screen By Report Status "Sent" And Report Type "Interim"
    Check Interim Report In Tab Sent On Subtab "Interim reports" By Account "callcenter_qa"
    Check Event Report On The Summary Reports Screen By Report Status "Sent" And Report Type "Interim"
    Check Interim Report In Tab Sent On Subtab "Interim reports" By Account "callcenter_technician"
    Check Event Report On The Summary Reports Screen By Report Status "Sent" And Report Type "Interim"
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "Interim" By Account "clinic_physician"       Interim reports
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "Interim" By Account "clinic_technician"      Interim reports

BFCC-INTEGRATION-08: Call Center Supervisor - Process a manual Interim report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Call Center Supervisor - Process a manual Interim report
    ...
    ...     Precondition:
    ...     - The Call Center Supervisor has logged into the Call Center portal
    ...     - An Interim report has been marked as Ready and user is on Report details page
    ...
    ...     Test Steps:
    ...     1. Call Center Supervisor:
    ...     - Click "Send" button
    ...     2. View Interim report in:
    ...         - Call Center Supervisor >> Reports page >> Sent Interim reports
    ...         - Call Center QA Leader >> Reports page >> Sent Interim reports
    ...         - Call Center QA >> Reports page >> Sent Interim reports
    ...         - Call Center Technician >> Reports page >> Sent Interim reports
    ...     3. View Interim report in:
    ...         - Call Center Supervisor >> Study Management page >> Reports tab-Summary report
    ...         - Call Center QA Leader >> Study Management page >> Reports tab-Summary report
    ...         - Call Center QA >> Study Management page >> Reports tab-Summary report
    ...         - Call Center Technician >> Study Management page >> Reports tab-Summary report
    ...     4. View Event report in:
    ...         - Clinic Technician >> Inbox page >> Recent reports, All reports, Interim reports
    ...         - Clinic Physician >> Inbox page >> Recent reports, All reports, Interim reports
    ...
    ...     Expected Results:
    ...     1. Step 2: Interim report info is displayed properly
    ...     2. Step 3: Interim report info is displayed properly
    ...     - Report ID
    ...     - Date of Service
    ...     - Status must be Sent
    ...     - Last modified matches Time of Report sent
    ...     - Assignee must be Empty
    ...     3. Step 4: Interim report is displayed properly
    ...
    [Tags]      BFCC-INTEGRATION-08       auto
    [Setup]    SUITE SETUP      callcenter_supervisor
    Create Sent Interim Reports
    Navigate To Reports
    Filter Reports       report_state=Sent        report_type=Interim report
    ${reports}     Get Sent Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Filter Reports      search_by=Study ID      text_search=${study_id}
    ${event_report}         Get Sent Interim Reports
    ${expected_header_event}        Create List    Study ID    Report ID   Date Of Service     Duration    Patient Name    Patient ID    Study Type     Assignee     Report Date
    ${actual_header_event}      Evaluate    [k for k, v in ${event_report}[0].items()]
    ${expected_event_report}      Evaluate    [item for item in ${event_report} if item.get('Report ID') == '${report_id}' and item.get('Study ID') == '${study_id}']
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_header_event}    ${actual_header_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_event_report}[0][Study ID]      ${study_id}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_event_report}[0][Report ID]         ${report_id}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_event_report}[0][Date Of Service]      ${datetime}
    Check Event Report On The Summary Reports Screen By Report Status "Sent" And Report Type "Interim"
    Check Interim Report In Tab Sent On Subtab "Interim reports" By Account "callcenter_qaleader"
    Check Event Report On The Summary Reports Screen By Report Status "Sent" And Report Type "Interim"
    Check Interim Report In Tab Sent On Subtab "Interim reports" By Account "callcenter_qa"
    Check Event Report On The Summary Reports Screen By Report Status "Sent" And Report Type "Interim"
    Check Interim Report In Tab Sent On Subtab "Interim reports" By Account "callcenter_technician"
    Check Event Report On The Summary Reports Screen By Report Status "Sent" And Report Type "Interim"
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "Interim" By Account "clinic_physician"       Interim reports
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "Interim" By Account "clinic_technician"      Interim reports

BFCC-INTEGRATION-09: Call Center Technician - Process an EOU report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Call Center Technician - Process an EOU report
    ...
    ...     Precondition:
    ...     - The Call Center Technician has logged into the Call Center portal
    ...
    ...     Test Steps:
    ...     1. Call Center Technician:
    ...     - Upload a PDF file for Holter/Ext.Holter EOU
    ...     - Generate report for MCT/MCT Peek/Cardiac Event EOU
    ...     - Select a priority and click "Ready" button
    ...     2. View EOU report in:
    ...         - Call Center Supervisor >> Reports page >> Ready EOU reports-All assignee
    ...         - Call Center QA Leader >> Reports page >> Ready Interim reports-All assignee
    ...         - Call Center QA >> Reports page >> Ready Interim reports-All assignee
    ...         - Call Center Technician >> Reports page >> Ready Interim reports-All assignee
    ...     3. View EOU report in:
    ...         - Call Center Supervisor >> Study Management page >> Reports tab-Summary report
    ...         - Call Center QA Leader >> Study Management page >> Reports tab-Summary report
    ...         - Call Center QA >> Study Management page >> Reports tab-Summary report
    ...         - Call Center Technician >> Study Management page >> Reports tab-Summary report
    ...
    ...     Expected Results:
    ...     1. Step 2: EOU report info is displayed properly
    ...     2. Step 3: EOU report info is displayed properly
    ...     - Study ID
    ...     - Date of Service matches the selected time while creating Interim report
    ...     - Status must be Ready
    ...     - Last modified matches Time of marking report as Ready
    ...     - Assignee must be Empty
    ...
    [Tags]     BFCC-INTEGRATION-09      auto
    [Setup]    SUITE SETUP   callcenter_technician
    Create Ready End Of Use Reports With Study Id Is "${STUDY_ID_ASSIGN}[study_id_8]"
    Navigate To Reports
    Filter Reports       report_state=Ready        report_type=End of Use report
    ${reports}     Get Ready Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Filter Reports      search_by=Study ID      text_search=${study_id}
    ${event_report}         Get Ready Eou Reports
    ${expected_header_event}        Create List    Study ID    Study Type   Upload Date   Duration   Time Monitored   Patient Name    Return Visit   New Report Status
    ${actual_header_event}      Evaluate    [k for k, v in ${event_report}[0].items()]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_header_event}    ${actual_header_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${event_report}[0][Study ID]      ${study_id}
    Check Event End Of Use Report On The Summary Reports Screen By Report Status "Ready" And Report Type "End Of Use"
    Check Eou Report In Ready On Subtab "End of Use reports" By Account "callcenter_supervisor"
    Check Event End Of Use Report On The Summary Reports Screen By Report Status "Ready" And Report Type "End Of Use"
    Check Eou Report In Ready On Subtab "End of Use reports" By Account "callcenter_qaleader"
    Check Event End Of Use Report On The Summary Reports Screen By Report Status "Ready" And Report Type "End Of Use"
    Check Eou Report In Ready On Subtab "End of Use reports" By Account "callcenter_qa"
    Check Event End Of Use Report On The Summary Reports Screen By Report Status "Ready" And Report Type "End Of Use"

BFCC-INTEGRATION-10: Call Center QA - Process an EOU report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Call Center QA - Process an EOU report
    ...
    ...     Precondition:
    ...     - The Call Center QA has logged into the Call Center portal
    ...     - An EOU report has been marked as Ready and user is on Report details page
    ...
    ...     Test Steps:
    ...     1. Call Center QA:
    ...     - Click "Send" button
    ...     2. View EOU report in:
    ...         - Call Center Supervisor >> Reports page >> Sent EOU reports
    ...         - Call Center QA Leader >> Reports page >> Sent EOU reports
    ...         - Call Center QA >> Reports page >> Sent EOU reports
    ...         - Call Center Technician >> Reports page >> Sent EOU reports
    ...     3. View EOU report in:
    ...         - Call Center Supervisor >> Study Management page >> Reports tab-Summary report
    ...         - Call Center QA Leader >> Study Management page >> Reports tab-Summary report
    ...         - Call Center QA >> Study Management page >> Reports tab-Summary report
    ...         - Call Center Technician >> Study Management page >> Reports tab-Summary report
    ...     4. View EOU report in:
    ...         - Clinic Technician >> Inbox page >> Recent reports, All reports, EOU reports
    ...         - Clinic Physician >> Inbox page >> Recent reports, All reports, EOU reports
    ...
    ...     Expected Results:
    ...     1. Step 2: EOU report info is displayed properly
    ...     2. Step 3: EOU report info is displayed properly
    ...     - Report ID
    ...     - Date of Service
    ...     - Status must be Sent
    ...     - Last modified matches Time of Report sent
    ...     - Assignee must be Empty
    ...     3. Step 4: EOU report is displayed properly
    ...
    [Tags]      BFCC-INTEGRATION-10        auto
    [Setup]    SUITE SETUP      callcenter_qa
    Create Sent End Of Use Reports With Study Id Is "${STUDY_ID_ASSIGN}[study_id_8]"
    Navigate To Reports
    Filter Reports       report_state=Sent        report_type=End of Use report
    ${reports}     Get Ready Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Filter Reports      search_by=Study ID      text_search=${study_id}
    ${event_report}         Get Ready Eou Reports
    ${expected_header_event}        Create List    Study ID    Study Type   Upload Date   Duration   Time Monitored   Patient Name    Return Visit   Report Date    Assignee     New Report Status
    ${actual_header_event}      Evaluate    [k for k, v in ${event_report}[0].items()]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_header_event}    ${actual_header_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${event_report}[0][Study ID]      ${study_id}
    Check Event End Of Use Report On The Summary Reports Screen By Report Status "Sent" And Report Type "End Of Use"
    Check End Of Use Report In Tab Sent By Account "callcenter_qaleader"
    Check Event End Of Use Report On The Summary Reports Screen By Report Status "Sent" And Report Type "End Of Use"
    Check End Of Use Report In Tab Sent By Account "callcenter_supervisor"
    Check Event End Of Use Report On The Summary Reports Screen By Report Status "Sent" And Report Type "End Of Use"
    Check End Of Use Report In Tab Sent By Account "callcenter_technician"
    Check Event End Of Use Report On The Summary Reports Screen By Report Status "Sent" And Report Type "End Of Use"
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "End of Use" By Account "clinic_physician"       End of Use reports
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "End of Use" By Account "clinic_technician"      End of Use reports

BFCC-INTEGRATION-11: Call Center QA Leader - Process an EOU report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Call Center QA Leader - Process an EOU report
    ...
    ...     Precondition:
    ...     - The Call Center QA Leader has logged into the Call Center portal
    ...     - An EOU report has been marked as Ready and user is on Report details page
    ...
    ...     Test Steps:
    ...     1. Call Center QA Leader:
    ...     - Click "Send" button
    ...     2. View EOU report in:
    ...         - Call Center Supervisor >> Reports page >> Sent EOU reports
    ...         - Call Center QA Leader >> Reports page >> Sent EOU reports
    ...         - Call Center QA >> Reports page >> Sent EOU reports
    ...         - Call Center Technician >> Reports page >> Sent EOU reports
    ...     3. View EOU report in:
    ...         - Call Center Supervisor >> Study Management page >> Reports tab-Summary report
    ...         - Call Center QA Leader >> Study Management page >> Reports tab-Summary report
    ...         - Call Center QA >> Study Management page >> Reports tab-Summary report
    ...         - Call Center Technician >> Study Management page >> Reports tab-Summary report
    ...     4. View EOU report in:
    ...         - Clinic Technician >> Inbox page >> Recent reports, All reports, EOU reports
    ...         - Clinic Physician >> Inbox page >> Recent reports, All reports, EOU reports
    ...
    ...     Expected Results:
    ...     1. Step 2: EOU report info is displayed properly
    ...     2. Step 3: EOU report info is displayed properly
    ...     - Report ID
    ...     - Date of Service
    ...     - Status must be Sent
    ...     - Last modified matches Time of Report sent
    ...     - Assignee must be Empty
    ...     3. Step 4: EOU report is displayed properly
    ...
    [Tags]      BFCC-INTEGRATION-11       auto
    [Setup]    SUITE SETUP      callcenter_qaleader
    Create Sent End Of Use Reports With Study Id Is "${STUDY_ID_ASSIGN}[study_id_8]"
    Navigate To Reports
    Filter Reports       report_state=Sent        report_type=End of Use report
    ${reports}     Get Ready Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Filter Reports      search_by=Study ID      text_search=${study_id}
    ${event_report}         Get Ready Eou Reports
    ${expected_header_event}        Create List    Study ID    Study Type   Upload Date   Duration   Time Monitored   Patient Name    Return Visit   Report Date   Assignee     New Report Status
    ${actual_header_event}      Evaluate    [k for k, v in ${event_report}[0].items()]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_header_event}    ${actual_header_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${event_report}[0][Study ID]      ${study_id}
    Check Event End Of Use Report On The Summary Reports Screen By Report Status "Sent" And Report Type "End Of Use"
    Check End Of Use Report In Tab Sent By Account "callcenter_qa"
    Check Event End Of Use Report On The Summary Reports Screen By Report Status "Sent" And Report Type "End Of Use"
    Check End Of Use Report In Tab Sent By Account "callcenter_supervisor"
    Check Event End Of Use Report On The Summary Reports Screen By Report Status "Sent" And Report Type "End Of Use"
    Check End Of Use Report In Tab Sent By Account "callcenter_technician"
    Check Event End Of Use Report On The Summary Reports Screen By Report Status "Sent" And Report Type "End Of Use"
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "End of Use" By Account "clinic_physician"       End of Use reports
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "End of Use" By Account "clinic_technician"      End of Use reports

BFCC-INTEGRATION-12: Call Center Supervisor - Process an EOU report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Call Center Supervisor - Process an EOU report
    ...
    ...     Precondition:
    ...     - The Call Center Supervisor has logged into the Call Center portal
    ...     - An EOU report has been marked as Ready and user is on Report details page
    ...
    ...     Test Steps:
    ...     1. Call Center Supervisor:
    ...     - Click "Send" button
    ...     2. View EOU report in:
    ...         - Call Center Supervisor >> Reports page >> Sent EOU reports
    ...         - Call Center QA Leader >> Reports page >> Sent EOU reports
    ...         - Call Center QA >> Reports page >> Sent EOU reports
    ...         - Call Center Technician >> Reports page >> Sent EOU reports
    ...     3. View EOU report in:
    ...         - Call Center Supervisor >> Study Management page >> Reports tab-Summary report
    ...         - Call Center QA Leader >> Study Management page >> Reports tab-Summary report
    ...         - Call Center QA >> Study Management page >> Reports tab-Summary report
    ...         - Call Center Technician >> Study Management page >> Reports tab-Summary report
    ...     4. View EOU report in:
    ...         - Clinic Technician >> Inbox page >> Recent reports, All reports, EOU reports
    ...         - Clinic Physician >> Inbox page >> Recent reports, All reports, EOU reports
    ...
    ...     Expected Results:
    ...     1. Step 2: EOU report info is displayed properly
    ...     2. Step 3: EOU report info is displayed properly
    ...     - Report ID
    ...     - Date of Service
    ...     - Status must be Sent
    ...     - Last modified matches Time of Report sent
    ...     - Assignee must be Empty
    ...     3. Step 4: EOU report is displayed properly
    ...
    [Tags]      BFCC-INTEGRATION-12      auto
    [Setup]    SUITE SETUP      callcenter_supervisor
    Create Sent End Of Use Reports With Study Id Is "${STUDY_ID_ASSIGN}[study_id_8]"
    Navigate To Reports
    Filter Reports       report_state=Sent        report_type=End of Use report
    ${reports}     Get Ready Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Filter Reports      search_by=Study ID      text_search=${study_id}
    ${event_report}         Get Ready Eou Reports
    ${expected_header_event}        Create List    Study ID    Study Type   Upload Date   Duration   Time Monitored   Patient Name    Return Visit   Report Date   Assignee     New Report Status
    ${actual_header_event}      Evaluate    [k for k, v in ${event_report}[0].items()]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_header_event}    ${actual_header_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${event_report}[0][Study ID]      ${study_id}
    Check Event End Of Use Report On The Summary Reports Screen By Report Status "Sent" And Report Type "End Of Use"
    Check End Of Use Report In Tab Sent By Account "callcenter_technician"
    Check Event End Of Use Report On The Summary Reports Screen By Report Status "Sent" And Report Type "End Of Use"
    Check End Of Use Report In Tab Sent By Account "callcenter_qa"
    Check Event End Of Use Report On The Summary Reports Screen By Report Status "Sent" And Report Type "End Of Use"
    Check End Of Use Report In Tab Sent By Account "callcenter_qaleader"
    Check Event End Of Use Report On The Summary Reports Screen By Report Status "Sent" And Report Type "End Of Use"
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "End of Use" By Account "clinic_physician"       End of Use reports
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "End of Use" By Account "clinic_technician"      End of Use reports
    SUITE SETUP      callcenter_supervisor
    Create Ready End Of Use Reports By Study Id Is "${STUDY_ID_ASSIGN}[study_id_8]"

BFCC-INTEGRATION-13: Call Center Technician - Process a Notification report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Call Center Technician - Process a Notification report
    ...
    ...     Precondition:
    ...     - The Call Center Technician has logged into the Call Center portal
    ...     - Land on a Notification report details page
    ...     - Existing the Report status has been set to Generate
    ...
    ...     Test Steps:
    ...     1. Call Center Technician:
    ...     - Generate report
    ...     - Select a priority and click "Ready" button
    ...     - Reload Report details page and check Call Status
    ...     2. View Notification report in:
    ...         - Call Center Supervisor >> Reports page >> Ready Notification reports-All assignee
    ...         - Call Center QA Leader >> Reports page >> Ready Notification reports-All assignee
    ...         - Call Center QA >> Reports page >> Ready Notification reports-All assignee
    ...         - Call Center Technician >> Reports page >> Ready Notification reports-All assignee
    ...     3. View Notification report in:
    ...         - Call Center Supervisor >> Study Management page >> Reports tab-Notification report
    ...         - Call Center QA Leader >> Study Management page >> Reports tab-Notification report
    ...         - Call Center QA >> Study Management page >> Reports tab-Notification report
    ...         - Call Center Technician >> Study Management page >> Reports tab-Notification report
    ...
    ...     Expected Results:
    ...     1. Step 1: Call Status is Call Required
    ...     2. Step 2: Notification report info is displayed properly
    ...     3. Step 3: Notification report info is displayed properly
    ...     - Report ID
    ...     - Date of Service
    ...     - Status must be Ready
    ...     - Last modified matches Time of marking report as Ready
    ...     - Assignee must be Empty
    ...
    [Tags]      BFCC-INTEGRATION-13       auto
    [Setup]    SUITE SETUP   callcenter_technician
    Create Ready Notification Reports From Report Tab With Study Id Is "${STUDY_ID_ASSIGN}[study_id]"
    Refresh Page
    Navigate To Event Tab      Event Details
    ${actual_call_option}       Get Event Details
    ${event_infor}     Evaluate    {k: v for k, v in ${actual_call_option}[EVENT INFORMATION].items()}
    ${trigger_time}             Set Variable    ${event_infor}[Trigger Time]
    ${trigger_time}             Convert Datetime Utc Or Est      original_datetime_str=${trigger_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_call_option}[Call Option]      Call Required
    Navigate To Reports
    Filter Reports       report_state=Ready        report_type=Notification reports
    ${notification_reports}     Get Ready Notification Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${notification_reports}
    Filter Reports      search_by=Study ID      text_search=${study_id}
    ${event_report}         Get Ready Notification Event Reports Detail
    ${expected_header_event}        Create List    Event ID    Priority   Event time   Event type   Symptom
    ${actual_header_event}      Evaluate    [k for k, v in ${event_report}[0].items()]
    ${event_time}               Evaluate    [item['Event time'] for item in ${event_report} if item.get('Event ID') == '${random_report_id}']
    ${event_time}             Format Datetime     original_datetime_str=${event_time}[0]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_header_event}    ${actual_header_event}
    Check Event Report With Event "${random_report_id}" In Ready On Subtab "Notification reports" By Account "callcenter_supervisor"
    Check Event Report On The Notification Reports Screen With Event "${random_report_id}" With Report Status "Ready"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
    Check Event Report With Event "${random_report_id}" In Ready On Subtab "Notification reports" By Account "callcenter_qaleader"
    Check Event Report On The Notification Reports Screen With Event "${random_report_id}" With Report Status "Ready"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
    Check Event Report With Event "${random_report_id}" In Ready On Subtab "Notification reports" By Account "callcenter_qa"
    Check Event Report On The Notification Reports Screen With Event "${random_report_id}" With Report Status "Ready"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}

BFCC-INTEGRATION-14: Call Center QA - Process a Notification report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Call Center QA - Process a Notification report
    ...
    ...     Precondition:
    ...     - The Call Center QA has logged into the Call Center portal
    ...     - A Notification report has been marked as Ready and user is on Report details page
    ...     - Existing the Report status has been set to Ready
    ...
    ...     Test Steps:
    ...     1. Call Center QA:
    ...     - Click "Send" button
    ...     - Reload Report details page and check Call Status
    ...     2. View Notification report in:
    ...         - Call Center Supervisor >> Reports page >> Ready Call Required
    ...         - Call Center QA Leader >> Reports page >> Ready Call Required
    ...         - Call Center QA >> Reports page >> Ready Call Required
    ...         - Call Center Technician >> Reports page >> Ready Call Required
    ...     3. View Notification report in:
    ...         - Call Center Supervisor >> Study Management page >> Reports tab-Notification report
    ...         - Call Center QA Leader >> Study Management page >> Reports tab-Notification report
    ...         - Call Center QA >> Study Management page >> Reports tab-Notification report
    ...         - Call Center Technician >> Study Management page >> Reports tab-Notification report
    ...     4. View Notification report in:
    ...         - Clinic Technician >> Inbox page >> Recent reports, All reports, Notification reports
    ...         - Clinic Physician >> Inbox page >> Recent reports, All reports, Notification reports
    ...
    ...     Expected Results:
    ...     1. Step 1: Call Status is Call Required
    ...     2. Step 2: Notification report info is displayed properly
    ...     3. Step 3: Notification report info is displayed properly
    ...     - Report ID
    ...     - Date of Service
    ...     - Status must be Sent
    ...     - Last modified matches Time of Report sent
    ...     - Assignee must be Empty
    ...     4. Step 4: Notification report is displayed properly
    ...
    [Tags]      BFCC-INTEGRATION-14         auto
    [Setup]    SUITE SETUP   callcenter_qa
    Create Sent Notification Reports From Report Tab With Study Id Is "${STUDY_ID_ASSIGN}[study_id]"
    Refresh Page
    Navigate To Event Tab      Event Details
    ${actual_call_option}       Get Event Details
    ${event_infor}     Evaluate    {k: v for k, v in ${actual_call_option}[EVENT INFORMATION].items()}
    ${trigger_time}             Set Variable    ${event_infor}[Trigger Time]
    ${trigger_time}             Convert Datetime Utc Or Est     original_datetime_str=${trigger_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_call_option}[Call Option]      Call Required
    Refresh Page
    Navigate To Reports
    Filter Reports       report_state=Ready        report_type=Call required
    ${call_required_reports}     Get Ready Call Required Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${call_required_reports}
    Filter Reports      search_by=Study ID      text_search=${study_id}
    ${event_report}         Get Ready Notification Event Reports Detail
    ${expected_header_event}        Create List    Event ID    Priority   Event time   Event type   Symptom
    ${actual_header_event}      Evaluate    [k for k, v in ${event_report}[0].items()]
    ${event_time}               Evaluate    [item['Event time'] for item in ${event_report} if item.get('Event ID') == '${random_report_id}']
    ${event_time}             Format Datetime     original_datetime_str=${event_time}[0]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_header_event}    ${actual_header_event}
    Check Event Report With Event "${random_report_id}" In Ready On Subtab "Call required" By Account "callcenter_supervisor"
    Check Event Report On The Notification Reports Screen With Event "${random_report_id}" With Report Status "Sent"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
    Check Event Report With Event "${random_report_id}" In Ready On Subtab "Call required" By Account "callcenter_qaleader"
    Check Event Report On The Notification Reports Screen With Event "${random_report_id}" With Report Status "Sent"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
    Check Event Report With Event "${random_report_id}" In Ready On Subtab "Call required" By Account "callcenter_technician"
    Check Event Report On The Notification Reports Screen With Event "${random_report_id}" With Report Status "Sent"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "Event" By Account "clinic_physician"       Notification reports
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "Event" By Account "clinic_technician"      Notification reports

BFCC-INTEGRATION-15: Call Center QA Leader- Process a Notification report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Call Center QA Leader- Process a Notification report
    ...
    ...     Precondition:
    ...     - The Call Center QA Leader has logged into the Call Center portal
    ...     - A Notification report has been marked as Ready and user is on Report details page
    ...
    ...     Test Steps:
    ...     1. Call Center QA Leader:
    ...     - Click "Send" button
    ...     - Reload Report details page and check Call Status
    ...     2. View Notification report in:
    ...         - Call Center Supervisor >> Reports page >> Ready Call Required
    ...         - Call Center QA Leader >> Reports page >> Ready Call Required
    ...         - Call Center QA >> Reports page >> Ready Call Required
    ...         - Call Center Technician >> Reports page >> Ready Call Required
    ...     3. View Notification report in:
    ...         - Call Center Supervisor >> Study Management page >> Reports tab-Notification report
    ...         - Call Center QA Leader >> Study Management page >> Reports tab-Notification report
    ...         - Call Center QA >> Study Management page >> Reports tab-Notification report
    ...         - Call Center Technician >> Study Management page >> Reports tab-Notification report
    ...     4. View Notification report in:
    ...         - Clinic Technician >> Inbox page >> Recent reports, All reports, Notification reports
    ...         - Clinic Physician >> Inbox page >> Recent reports, All reports, Notification reports
    ...
    ...     Expected Results:
    ...     1. Step 1: Call Status is Call Required
    ...     2. Step 2: Notification report info is displayed properly
    ...     3. Step 3: Notification report info is displayed properly
    ...     - Report ID
    ...     - Date of Service
    ...     - Status must be Sent
    ...     - Last modified matches Time of Report sent
    ...     - Assignee must be Empty
    ...     4. Step 4: Notification report is displayed properly
    ...
    [Tags]      BFCC-INTEGRATION-15       auto
    [Setup]    SUITE SETUP      callcenter_qaleader
    Create Sent Notification Reports From Report Tab With Study Id Is "${STUDY_ID_ASSIGN}[study_id]"
    Refresh Page
    Navigate To Event Tab      Event Details
    ${actual_call_option}       Get Event Details
    ${event_infor}     Evaluate    {k: v for k, v in ${actual_call_option}[EVENT INFORMATION].items()}
    ${trigger_time}             Set Variable    ${event_infor}[Trigger Time]
    ${trigger_time}             Convert Datetime Utc Or Est     original_datetime_str=${trigger_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_call_option}[Call Option]      Call Required
    Navigate To Reports
    Filter Reports       report_state=Ready        report_type=Call required
    ${call_required_reports}     Get Ready Call Required Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${call_required_reports}
    Filter Reports      search_by=Study ID      text_search=${study_id}
    ${event_report}         Get Ready Notification Event Reports Detail
    ${expected_header_event}        Create List    Event ID    Priority   Event time   Event type   Symptom
    ${actual_header_event}      Evaluate    [k for k, v in ${event_report}[0].items()]
    ${event_time}               Evaluate    [item['Event time'] for item in ${event_report} if item.get('Event ID') == '${random_report_id}']
    ${event_time}             Format Datetime     original_datetime_str=${event_time}[0]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_header_event}    ${actual_header_event}
    Check Event Report With Event "${random_report_id}" In Ready On Subtab "Call required" By Account "callcenter_supervisor"
    Check Event Report On The Notification Reports Screen With Event "${random_report_id}" With Report Status "Sent"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
    Check Event Report With Event "${random_report_id}" In Ready On Subtab "Call required" By Account "callcenter_qa"
    Check Event Report On The Notification Reports Screen With Event "${random_report_id}" With Report Status "Sent"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
    Check Event Report With Event "${random_report_id}" In Ready On Subtab "Call required" By Account "callcenter_technician"
    Check Event Report On The Notification Reports Screen With Event "${random_report_id}" With Report Status "Sent"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "Event" By Account "clinic_physician"       Notification reports
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "Event" By Account "clinic_technician"      Notification reports

BFCC-INTEGRATION-16: Call Center Supervisor- Process a Notification report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Call Center Supervisor- Process a Notification report
    ...
    ...     Precondition:
    ...     - The Call Center Supervisor has logged into the Call Center portal
    ...     - A Notification report has been marked as Ready and user is on Report details page
    ...
    ...     Test Steps:
    ...     1. Call Center Supervisor:
    ...     - Click "Send" button
    ...     - Reload Report details page and check Call Status
    ...     2. View Notification report in:
    ...         - Call Center Supervisor >> Reports page >> Ready Call Required
    ...         - Call Center QA Leader >> Reports page >> Ready Call Required
    ...         - Call Center QA >> Reports page >> Ready Call Required
    ...         - Call Center Technician >> Reports page >> Ready Call Required
    ...     3. View Notification report in:
    ...         - Call Center Supervisor >> Study Management page >> Reports tab-Notification report
    ...         - Call Center QA Leader >> Study Management page >> Reports tab-Notification report
    ...         - Call Center QA >> Study Management page >> Reports tab-Notification report
    ...         - Call Center Technician >> Study Management page >> Reports tab-Notification report
    ...     4. View Notification report in:
    ...         - Clinic Technician >> Inbox page >> Recent reports, All reports, Notification reports
    ...         - Clinic Physician >> Inbox page >> Recent reports, All reports, Notification reports
    ...
    ...     Expected Results:
    ...     1. Step 1: Call Status is Call Required
    ...     2. Step 2: Notification report info is displayed properly
    ...     3. Step 3: Notification report info is displayed properly
    ...     - Report ID
    ...     - Date of Service
    ...     - Status must be Sent
    ...     - Last modified matches Time of Report sent
    ...     - Assignee must be Empty
    ...     4. Step 4: Notification report is displayed properly
    ...
    [Tags]      BFCC-INTEGRATION-16       auto
    [Setup]    SUITE SETUP      callcenter_supervisor
    Create Sent Notification Reports From Report Tab With Study Id Is "${STUDY_ID_ASSIGN}[study_id]"
    Refresh Page
    Navigate To Event Tab      Event Details
    ${actual_call_option}       Get Event Details
    ${event_infor}     Evaluate    {k: v for k, v in ${actual_call_option}[EVENT INFORMATION].items()}
    ${trigger_time}             Set Variable    ${event_infor}[Trigger Time]
    ${trigger_time}             Convert Datetime Utc Or Est     original_datetime_str=${trigger_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_call_option}[Call Option]      Call Required
    Navigate To Reports
    Filter Reports       report_state=Ready        report_type=Call required
    ${call_required_reports}     Get Ready Call Required Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${call_required_reports}
    Filter Reports      search_by=Study ID      text_search=${study_id}
    ${event_report}         Get Ready Notification Event Reports Detail
    ${expected_header_event}        Create List    Event ID    Priority   Event time   Event type   Symptom
    ${actual_header_event}      Evaluate    [k for k, v in ${event_report}[0].items()]
    ${event_time}               Evaluate    [item['Event time'] for item in ${event_report} if item.get('Event ID') == '${random_report_id}']
    ${event_time}             Format Datetime     original_datetime_str=${event_time}[0]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_header_event}    ${actual_header_event}
    Check Event Report With Event "${random_report_id}" In Ready On Subtab "Call required" By Account "callcenter_qaleader"
    Check Event Report On The Notification Reports Screen With Event "${random_report_id}" With Report Status "Sent"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
    Check Event Report With Event "${random_report_id}" In Ready On Subtab "Call required" By Account "callcenter_qa"
    Check Event Report On The Notification Reports Screen With Event "${random_report_id}" With Report Status "Sent"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
    Check Event Report With Event "${random_report_id}" In Ready On Subtab "Call required" By Account "callcenter_technician"
    Check Event Report On The Notification Reports Screen With Event "${random_report_id}" With Report Status "Sent"
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${event_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${date_of_service}        ${trigger_time}
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "Event" By Account "clinic_physician"       Notification reports
    Check Event Displayed On Clinic Portal With Study "${study_id}" And Report Type "Event" By Account "clinic_technician"      Notification reports

*** Keywords ***
SUITE SETUP
    [Arguments]    ${user_callcenter}
    ${BROWSER_NODE}         Start Browser
    Import Library          project_bioflux_callcenter_portal/lib/web/Common.py             ${BROWSER_NODE}     ${ENV}
    Import Library          project_bioflux_callcenter_portal/lib/web/Events.py             ${BROWSER_NODE}     ${ENV}
    Import Library          project_bioflux_callcenter_portal/lib/web/EventDetails.py       ${BROWSER_NODE}     ${ENV}
    Import Library          project_bioflux_callcenter_portal/lib/web/Reports.py            ${BROWSER_NODE}     ${ENV}
    Import Library          project_bioflux_callcenter_portal/lib/web/StudyManagement.py    ${BROWSER_NODE}     ${ENV}
    Import Library          project_bioflux_callcenter_portal/lib/web/Studies.py            ${BROWSER_NODE}     ${ENV}
    ${USERS}                Get Config Param    NEW_USERS
    ${STUDY_ID}             Get Config Param    STUDY_ID
    ${STUDY_ID_ASSIGN}      Set Variable        ${STUDY_ID}[study_id_completed]
    ${CURRENT_USER}         Set Variable        ${USERS}[${user_callcenter}]
    ${RELEASE_VERSION}      Navigate To Callcenter Sign In Page
    ${TOKEN}                Sign In Callcenter    ${CURRENT_USER}[username]      ${CURRENT_USER}[password]
    Set Suite Variable      ${TOKEN}
    Set Global Variable     ${STUDY_ID_ASSIGN}
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

Create ready notification reports with study id is "${study_id}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search==${study_id}
    Manage Complete Study On    row=1
    Navigate To Study Management Type    events
    Filter Study Events    by_validity=Invalid
    ${study_event}    Get Study Events
    ${event_search}     Set Variable    ${study_event}[0][Event ID]
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab      Event Details
    ${event_header}     Get Event Summary
    ${study_id}         Set Variable    ${event_header}[STUDY ID]
    Edit Event Details    event_validity=Valid      is_close=${True}
    Navigate To Event Tab      Event Report
    Generate Event Report Data
    ${msg}      Get Toast Message
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}    Generate Report Success
    ${status_report}    Check Generate Successful
    Run Keyword And Continue On Failure    Should Be True    ${status_report}
    Filter Event Report    priority=Low     is_click=${True}
    Set Global Variable     ${event_search}
    Set Global Variable     ${study_id}

Navigate to report screen has the notification reports with study id is "${study_id_completed}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id_completed}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    reports
    Filter Study Reports    by_report=Notification reports

Check event report with event "${actual_event_id}" in ready on subtab "${subtab}" by account "${user_account}"
    SUITE SETUP    ${user_account}
    Navigate To Reports
    Filter Reports       report_state=Ready        report_type=${subtab}         by_assignee=All
    ${notification_reports}     Get Ready Notification Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${notification_reports}
    Filter Reports      search_by=Study ID      text_search=${study_id}
    ${event_report}         Get Ready Notification Event Reports Detail
    ${expected_header_event}        Create List    Event ID    Priority   Event time   Event type   Symptom
    ${actual_header_event}      Evaluate    [k for k, v in ${event_report}[0].items()]
    ${expected_event_id}               Evaluate    [item['Event ID'] for item in ${event_report}]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_header_event}    ${actual_header_event}
    Run Keyword And Continue On Failure    List Should Contain Value   ${expected_event_id}    ${actual_event_id}

Check event report on the notification reports screen with event "${event_search}" with report status "${report_status}"
#    [Arguments]    ${report_status}
#    SUITE SETUP    ${user_account}
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    reports
    Filter Study Reports    by_report=Notification reports      text_search=${event_search}
    ${report_id}        Get Study Reports
    ${header_report}    Evaluate    [k for k, v in ${report_id}[0].items()]
    ${date_of_service}      Set Variable    ${report_id}[0][Date Of Service]
    Run Keyword And Continue On Failure    Should Be Equal    ${report_id}[0][Report ID]        ${event_search}
    Run Keyword And Continue On Failure    Should Be Equal    ${report_id}[0][Report Status]        ${report_status}
    Run Keyword If    'Assignee' in ${header_report}
    ...  Run Keyword And Continue On Failure    Should Be Empty    ${report_id}[0][Assignee]
    Set Global Variable     ${date_of_service}
#    Navigate To Study Management Type    Events

Create ready call required
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    ${completed}        Get Completed Studies On Page
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${completed} if item['Total Events'].split()[0] != '0']
    ${study_id}    Evaluate  random.choice(${studies_id})    random
    Filter Studies    search_by=Study ID         text_search=${study_id}
    Manage Complete Study On    row=1
    Navigate To Study Management Type    events
    ${study_event}    Get Study Events
    ${event_search}     Set Variable    ${study_event}[0][Event ID]
    ${event_trigger_time}       Set Variable    ${study_event}[0][Trigger Time]
    ${event_trigger_time}       Convert Datetime Utc Or Est    original_datetime_str=${event_trigger_time}
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab      Event Details
    ${event_header}     Get Event Summary
    ${study_id}         Set Variable    ${event_header}[STUDY ID]
    Edit Event Details    event_validity=Valid    is_close=${True}
    Navigate To Event Tab      Event Report
    Create Event Reports With Status Is Sent
    Set Global Variable     ${event_search}
    Set Global Variable     ${study_id}
    Set Global Variable     ${event_trigger_time}

Open browser clinic
    [Arguments]    ${user_clinic}
    ${BROWSER_NODE}     Start Browser
    Import Library      project_bioflux_clinic_portal/lib/web/Studies.py        ${BROWSER_NODE}   ${ENV}
    Import Library      project_bioflux_clinic_portal/lib/web/StudyDetails.py   ${BROWSER_NODE}   ${ENV}
    Import Library      project_bioflux_clinic_portal/lib/web/Inbox.py          ${BROWSER_NODE}   ${ENV}
    Import Library      project_bioflux_clinic_portal/lib/web/Common.py         ${BROWSER_NODE}   ${ENV}
    ${PHY_USER}         Get Config Param       NEW_USER_CLINIC > ${user_clinic}
    ${FACILITIES}       Get Config Param       FACILITY
    ${DEVICES}          Get Config Param       DEVICE
    ${AWS_AUTH}         Get Config Param       AWS_AUTH
    ${URL_CLINIC}       Get Config Param       WEB_BASE_URL_CLINIC
    Set Suite Variable  ${PHY_USER}
    Set Suite Variable  ${DEVICES}
    Set Suite Variable  ${FACILITIES}
    Set Suite Variable  ${URL_CLINIC}
    ${TOKEN}             Sign In Clinic     ${PHY_USER}[0][username]     ${PHY_USER}[0][password]        url_clinic=${URL_CLINIC}
#    ${AWS_RPS}          Initiate Auth         username=${AWS_AUTH}[users][0][username]        password=${AWS_AUTH}[users][0][password]        client_id=${AWS_AUTH}[client_id]
#    Set Suite Variable  ${AWS_TOKEN}          ${AWS_RPS}[AuthenticationResult][AccessToken]
    ${VERSION}          Get Release Version Clinic
    Set Suite Variable  ${TOKEN}
    Set Suite Metadata  version     ${VERSION}
    Set Suite Metadata  browser     ${BROWSER.capitalize()}

Check event displayed on clinic portal with study "${study_id}" and report type "${report_type}" by account "${account_user}"
    [Arguments]     ${inbox_report_type}
    Open Browser Clinic    ${account_user}
    Navigate To Inbox
    Navigate To Report Type    Recent reports
    Filter Inbox    status_report=All
    Filter Inbox    search_by=Study ID      text_search=${study_id}
    ${reports}      Get Reports On Page
    ${event_report}     Get Data On Reports Page        report_type=${True}
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Run Keyword And Continue On Failure    Should Be Equal        ${reports}[0][Study ID]       ${study_id}
    Run Keyword And Continue On Failure    List Should Contain Value        ${event_report}       ${report_type}
    Navigate To Report Type    All reports
    ${reports}      Get Reports On Page
    ${event_report}     Get Data On Reports Page        report_type=${True}
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Run Keyword And Continue On Failure    Should Be Equal        ${reports}[0][Study ID]       ${study_id}
    Run Keyword And Continue On Failure    List Should Contain Value    ${event_report}       ${report_type}
    Navigate To Report Type    ${inbox_report_type}
    ${reports}      Get Reports On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Run Keyword And Continue On Failure    Should Be Equal        ${reports}[0][Study ID]       ${study_id}

Create ready interim reports with study id is "${study_id}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id}
    Manage Complete Study On    row=1
    Navigate To Study Management Type    reports
    Create Interim Report
    Refresh Page
    ${interim_report}       Get Event Summary
    ${study_id}         Set Variable    ${interim_report}[STUDY ID]
    ${report_id}         Evaluate        "${interim_report['REPORT ID'].split('\n')[0]}"
    ${datetime}         Get Datetime Interim Or Eou Report
    Navigate To Event Tab    PDF Report
    Create Ready Interim Reports For Technician
    Set Global Variable     ${report_id}
    Set Global Variable     ${study_id}
    Set Global Variable     ${datetime}

Create sent interim reports
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Manage Complete Study On    row=2
    Navigate To Study Management Type    reports
    Create Interim Report
    Refresh Page
    ${interim_report}       Get Event Summary
    ${study_id}         Set Variable    ${interim_report}[STUDY ID]
    ${report_id}         Evaluate        "${interim_report['REPORT ID'].split('\n')[0]}"
    ${datetime}         Get Datetime Interim Or Eou Report
    Navigate To Event Tab    PDF Report
    Create Interim Reports With Status Is Sent
    Set Global Variable     ${report_id}
    Set Global Variable     ${study_id}
    Set Global Variable     ${datetime}

Check interim report in ready on subtab "${subtab}" by account "${user_account}"
    SUITE SETUP    ${user_account}
    Navigate To Reports
    Filter Reports       report_state=Ready        report_type=${subtab}         by_assignee=All
    ${reports}     Get Ready Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Filter Reports      search_by=Study ID      text_search=${study_id}
    ${event_report}         Get Ready Interim Reports
    ${expected_header_event}        Create List    Study ID    Report ID   Creation Time   Date Of Service     Duration    Patient Name    Patient ID    Study Type    Assignee
    ${actual_header_event}      Evaluate    [k for k, v in ${event_report}[0].items()]
    ${expected_event_report}      Evaluate    [item for item in ${event_report} if item.get('Report ID') == '${report_id}' and item.get('Study ID') == '${study_id}']
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_header_event}    ${actual_header_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_event_report}[0][Study ID]      ${study_id}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_event_report}[0][Report ID]         ${report_id}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_event_report}[0][Date Of Service]      ${datetime}

Check eou report in ready on subtab "${subtab}" by account "${user_account}"
    SUITE SETUP    ${user_account}
    Navigate To Reports
    Filter Reports       report_state=Ready        report_type=${subtab}         by_assignee=All
    ${reports}     Get Ready Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Filter Reports      search_by=Study ID      text_search=${study_id}
    ${event_report}         Get Ready Eou Reports
    ${expected_header_event}        Create List    Study ID    Study Type   Upload Date   Duration   Time Monitored   Patient Name    Return Visit    Assignee   New Report Status
    ${actual_header_event}      Evaluate    [k for k, v in ${event_report}[0].items()]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_header_event}    ${actual_header_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${event_report}[0][Study ID]      ${study_id}

Check event report on the summary reports screen by report status "${report_status}" and report type "${type}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    reports
    Filter Study Reports    text_search=${report_id}
    ${summary_report}        Get Study Reports
    ${header_report}    Evaluate    [k for k, v in ${summary_report}[0].items()]
    ${expected_report}  Evaluate    [item for item in ${summary_report} if item.get('Report ID') == '${report_id}' and item.get('Type') == '${type}']
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_report}[0][Report ID]        ${report_id}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_report}[0][Report Status]        ${report_status}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_report}[0][Date Of Service]        ${datetime}
    Run Keyword If    'Assignee' in ${header_report}
    ...  Run Keyword And Continue On Failure    Should Be Empty    ${expected_report}[0][Assignee]

Check interim report in tab sent on subtab "${subtab}" by account "${user_account}"
    SUITE SETUP    ${user_account}
    Navigate To Reports
    Filter Reports       report_state=Sent        report_type=${subtab}         by_assignee=All
    ${reports}     Get Sent Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Filter Reports      search_by=Study ID      text_search=${study_id}
    ${event_report}         Get Sent Interim Reports
    ${expected_header_event}        Create List    Study ID    Report ID   Date Of Service   Duration   Patient Name   Patient ID   Study Type   Assignee    Report Date
    ${actual_header_event}      Evaluate    [k for k, v in ${event_report}[0].items()]
    ${expected_event_report}      Evaluate    [item for item in ${event_report} if item.get('Report ID') == '${report_id}' and item.get('Study ID') == '${study_id}']
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_header_event}    ${actual_header_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_event_report}[0][Study ID]      ${study_id}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_event_report}[0][Report ID]         ${report_id}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_event_report}[0][Date Of Service]      ${datetime}

Create ready end of use reports with study id is "${study_id}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id}
    Manage Complete Study On    row=1
    Navigate To Study Management Type    reports
    ${study_report}     Get Study Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${study_report}
    Edit End Of Use Report
    Create End Of Use Report
    ${datetime}         Get Datetime Interim Or Eou Report
    Create Ready Interim Reports For Technician
    Set Global Variable     ${study_id}
    Set Global Variable     ${datetime}

Check event end of use report on the summary reports screen by report status "${report_status}" And report type "${type}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    reports
    ${summary_report}        Get Study Reports
    ${header_report}    Evaluate    [k for k, v in ${summary_report}[0].items()]
    ${expected_report}  Evaluate    [item for item in ${summary_report} if item.get('Type') == '${type}']
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_report}[0][Report Status]        ${report_status}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_report}[0][Date Of Service]        ${datetime}
    Run Keyword If    'Assignee' in ${header_report}
    ...  Run Keyword And Continue On Failure    Should Be Empty    ${expected_report}[0][Assignee]

Create sent end of use reports with study id is "${study_id}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id}
    Manage Complete Study On        study_id=${study_id}
    Navigate To Study Management Type    reports
    ${study_report}     Get Study Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${study_report}
    Edit End Of Use Report
    Create End Of Use Report
    ${datetime}         Get Datetime Interim Or Eou Report
    Navigate To Event Tab    PDF Report
    Create Interim Reports With Status Is Sent
    Set Global Variable     ${study_id}
    Set Global Variable     ${datetime}

Check end of use report in tab sent by account "${user_account}"
    SUITE SETUP    ${user_account}
    Navigate To Reports
    Filter Reports       report_state=Sent        report_type=End of Use reports         by_assignee=All
    Filter Reports      search_by=Study ID      text_search=${study_id}
    ${event_report}         Get Sent Eou Reports
    ${expected_header_event}        Create List    Study ID    Study Type   Upload Date   Duration   Time Monitored   Patient Name    Return Visit   Report Date    Assignee   New Report Status
    ${actual_header_event}      Evaluate    [k for k, v in ${event_report}[0].items()]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_header_event}    ${actual_header_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${event_report}[0][Study ID]      ${study_id}

Create ready notification reports from report tab with study id is "${study_id}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    reports
    Filter Study Reports    by_report=Notification reports
    ${study_reports}        Get Study Reports
    ${report_status}        Evaluate    [item for item in ${study_reports} if item.get('Report Status') == 'Generated']
    ${report_id}            Evaluate    [item['Report ID'] for item in ${report_status}]
    ${random_report_id}     Evaluate    random.choice(${report_id})    random
    Filter Study Reports    text_search=${random_report_id}
    Edit Report On      row=1
    Navigate To Event Tab      Event Report
    Create Ready Event Reports For Technician
    Set Global Variable    ${random_report_id}
    Set Global Variable    ${study_id}

Create sent notification reports from report tab with study id is "${study_id}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    reports
    Filter Study Reports    by_report=Notification reports
    ${study_reports}        Get Study Reports
    ${report_status}        Evaluate    [item for item in ${study_reports} if item.get('Report Status') == 'Ready']
    ${report_id}            Evaluate    [item['Report ID'] for item in ${report_status}]
    ${random_report_id}     Evaluate    random.choice(${report_id})    random
    Filter Study Reports    text_search=${random_report_id}
    Edit Report On      row=1
    Navigate To Event Tab      Event Report
    Create Event Reports With Status Is Sent
    Set Global Variable    ${random_report_id}
    Set Global Variable    ${study_id}

Create ready interim reports
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Manage Complete Study On    row=1
    Navigate To Study Management Type    reports
    Create Interim Report
    Refresh Page
    ${interim_report}       Get Event Summary
    ${study_id}         Set Variable    ${interim_report}[STUDY ID]
    ${report_id}         Evaluate        "${interim_report['REPORT ID'].split('\n')[0]}"
    ${datetime}         Get Datetime Interim Or Eou Report
    Navigate To Event Tab    PDF Report
    Create Ready Interim Reports For Technician
    Set Global Variable     ${report_id}
    Set Global Variable     ${study_id}
    Set Global Variable     ${datetime}

Create ready end of use reports by study id is "${study_id}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id}
    Manage Complete Study On    row=1
    Navigate To Study Management Type    reports
    ${study_report}     Get Study Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${study_report}
    Edit End Of Use Report
    Create End Of Use Report
    ${datetime}         Get Datetime Interim Or Eou Report
    Navigate To Event Tab    PDF Report
    Create Interim Reports With Status Is Ready
