*** Settings ***
Documentation   Test Suite - Call Center Supervisor Portal - Process Event
Metadata    sid     BFCC-SUPVR-PROCESS-EVENT
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     Collections
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_callcenter_portal/lib/ConfigHandler.py    ${ENV}
Library       project_bioflux_callcenter_portal/lib/web/Common.py
Library       project_bioflux_callcenter_portal/lib/web/Events.py
Library       project_bioflux_callcenter_portal/lib/web/EventDetails.py
Library       project_bioflux_callcenter_portal/lib/web/Reports.py
Library       project_bioflux_callcenter_portal/lib/web/StudyManagement.py
Library       project_bioflux_callcenter_portal/lib/web/Studies.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BFCC-SUPVR-PROCESS-EVENT     web
Test Timeout    1h

*** Test Cases ***
BFCC-SUPVR-PROCESS-EVENT-DETAILS-01: Change the type of an Auto event
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-DETAILS-01        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-DETAILS-02: Mark an event as valid or invalid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-DETAILS-02        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-DETAILS-03: Include a strip of Manual event in a report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-DETAILS-03        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-DETAILS-04: Include/exclude a strip of Auto event in a report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-DETAILS-04        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-DETAILS-05: Mark call status
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-DETAILS-05        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-DETAILS-06: Edit an MCT event using ECG viewer
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-DETAILS-06        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-DETAILS-07: Edit an event using AI assist tool
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-DETAILS-07        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-DETAILS-08: Edit event parameters of an Auto event that has completed ans its params uploaded
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-DETAILS-08        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-DETAILS-09: Edit event parameters of an Auto event that has not been fully uploaded
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit event parameters of an Auto event that has not been fully uploaded
    ...
    ...     Precondition:
    ...     - The user is on the Event Details tab of the Event Edit page
    ...     - The event has not been fully uploaded
    ...
    ...     Test Steps:
    ...     1. Observe the Event Parameters section
    ...
    ...     Expected Results:
    ...     1. In step 1:
    ...     - A message saying “ Full event data for this event is currently not available. You shall not be able to
    ...     make any changes until full data becomes available” shall be displayed in the “Event Parameters” section
    ...     - The user can only view the following parameters in the “Event Parameters” section

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-DETAILS-09       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-DETAILS-10: Edit event tags
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-DETAILS-10        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-DETAILS-11: Edit technician comments
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit technician comments
    ...
    ...     Precondition:
    ...     - The user is on the Event Details tab of the Event Edit page
    ...
    ...     Test Steps:
    ...     1. Enter a text contains max length 520 characters
    ...     2. Click [Save] or [Close] button
    ...
    ...     Expected Results:
    ...     - When input more than 520 characters the portal will display the following message:
    ...     "Exceeded maximum of 520 characters in Technician Comments"
    ...     - Technician comments must appear in the event report at the TECHNICIAN COMMENTS section

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-DETAILS-11       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    [Setup]    Navigate To Event Details
#    Add Technician Comments         When input more than 520 characters the portal will display the following message "Exceeded maximum of 520 characters in Technician Comments" Technician comments must appear in the event report at the TECHNICIAN COMMENTS section. When input more than 520 characters the portal will display the following message "Exceeded maximum of 520 characters in Technician Comments" Technician comments must appear in the event report at the TECHNICIAN COMMENTS section. When input more than 520 characters the portal will display 1
#    ${msg_character}     Get Toast Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${msg_character}      Exceeded maximum of 520 characters in Technician Comments

BFCC-SUPVR-PROCESS-EVENT-DETAILS-12: View full data of an Auto event
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit technician comments
    ...
    ...     Precondition:
    ...     - The user is on the Event Details tab of the Event Edit page
    ...     - The auto event has completed and has its parameters uploaded to the server
    ...     - The hourly data containing full event data have been uploaded to the server
    ...     - The duration of the event is greater than the post-event time value
    ...     - The event is closed and its validity is valid
    ...
    ...     Test Steps:
    ...     1. Observe Event Parameters section
    ...     2. Click [View Full Event] button
    ...
    ...     Expected Results:
    ...     1. In step 1: There shall be a button “View full event” displayed
    ...     2. In step 2: The page will go into Full event view mode:
    ...     - Full event data will be loaded to the ECG Viewer
    ...     - There shall be a minutely HR graph corresponding with the data displayed. This graph is to help the
    ...     user to navigate between 60 seconds frames of the full data
    ...     - When in Full event view mode, the user can use all the available tools in the ECG Viewer but cannot save
    ...     the changes because the Save button should be in a disabled state

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-DETAILS-12       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-DETAILS-13: View Event Information
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Event Information
    ...
    ...     Precondition:
    ...     - The user is on the Event Details tab of the Event Edit page
    ...
    ...     Test Steps:
    ...     1. Observe Event Information section
    ...
    ...     Expected Results:
    ...     1. The following information displayed:
    ...     - Symptoms: The patient’s symptoms, only exist when the type of event is Manual
    ...     - Device ID: ID of the Bioflux device running the study
    ...     - Trigger time: The time when the event is triggered
    ...     - Upload Time: the time when the event is uploaded to the server
    ...     - First Opened: the time when the event was first opened in the Event Editing page by a user.
    ...     For invalid events closed on the EVENTS page (without going to the Event Editing page), First Opened time
    ...     should be the same as Closed time
    ...     - Closed Time: the time when the event is closed

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-DETAILS-13       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-DETAILS-14: View Study Settings
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-DETAILS-14        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-DETAILS-15: Mark and Unmark an event as Process Later
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-DETAILS-15        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-CRITERIA-01: View Notification Criteria
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-CRITERIA-01        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-LOCK-01: Locking an event when the user is Editing an Event
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can lock an event so that it won’t be able to be processed by more than one user at a time.
    ...
    ...     Precondition:
    ...     - Login as CC users on 2 different browsers
    ...
    ...     Test Steps:
    ...     1. The first user goes to Event Edit page
    ...     2. The later user goes to Event Edit page of the same event in step 1
    ...
    ...     Expected Results:
    ...     1. In step 1: The user shall have permission for editing
    ...     2. In step 2:
    ...     - If the later user is a Call Center Technician:
    ...         - The user would have to wait until the first user leaves
    ...     the Event Edit page in order to edit the event.
    ...         - All of the input fields are disabled and all the buttons are disabled.
    ...         - The system should display the following message to the users having permission for editing:
    ...     “Someone is editing this event. You will not able to make any changes to this event at this time”
    ...     - If the later user is a Call Center QA:
    ...         - The user can have permission for editing
    ...         - The system should display the following message to the user: “Be careful. Someone is editing this event”
    ...     - The portal shall display all of the users who are opening the event on the Event Edit page

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-LOCK-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-LOCK-02: Locking events on the event list on the EVENTS page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can lock an event so that it won’t be able to be processed by more than one user at a time.
    ...
    ...     Test Steps:
    ...     1. The first user is viewing the event in the Event Details tab of the Event Editing page
    ...     2. The second user is on the event list of EVENTS page and observe
    ...
    ...     Expected Results:
    ...     - There shall be Avatars of the technicians editing the event shall be displayed on the event card
    ...     - The event should be locked, which means the Close button will be disabled when the user hovers over
    ...     the event card
    ...     - The system should display the following message “Someone is editing this event. You cannot make changes
    ...     to this event at this time.”
    ...     - The event will be locked until the other user exits the Event Edit page of the event

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-LOCK-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-REPORT-01: Generate event report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-REPORT-01        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-REPORT-02: Regenerate event report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-REPORT-02        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-REPORT-04: Set event report status to Ready
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-REPORT-04        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BFCC-SUPVR-PROCESS-EVENT-REPORT-04-CP2.22.0: Display notification of Afib Detected for Afib events in status Ready
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-REPORT-04-CP2.22.0       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-REPORT-05: Send event report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-REPORT-05        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-REPORT-12: Recall an event report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-REPORT-12        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-REPORT-13: Dismiss and reenable event report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-REPORT-13        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-REPORT-17: Download event report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can download an event report
    ...
    ...     Precondition:
    ...     - The user is on Event Report tab of the Event Edit page
    ...     - The report status is Generated/Ready/Sent
    ...
    ...     Test Steps:
    ...     1. Click [Download] button
    ...
    ...     Expected Results:
    ...     1. The event report will be downloaded to the user device

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-REPORT-17        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-EVENT-REPORT-18: Details of Event Report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can see the right details and format for the “bioflux Cardiac Event Report”
    ...
    ...     Precondition:
    ...     - The user is on Event Report tab of the Event Edit page
    ...     - Report status has been generated
    ...
    ...     Test Steps:
    ...     1. View PDF report has been generated
    ...
    ...     Expected Results:
    ...     1. The header of the report should contain the following components and information:
    ...     - The Bioflux logo should be displayed in the top left corner/in the header of the report
    ...     - The “bioflux NOTIFICATION ECG REPORT” title
    ...     - The “bioflux NOTIFICATION ECG REPORT” title
    ...     - Study Type (MCT, Cardiac Event, MCT Peek)
    ...     - Client Name - is the Facility Name
    ...     - Address - the address of the Facility
    ...     2. Patient Information should follow the header below with information like:
    ...     - Patient Name (String)
    ...     - Patient ID (String/Numeric)
    ...     - Patient DOB (Date time)
    ...     - Patient Phone (Numeric)
    ...     - Primary Diagnosis Code (This information was selected on the Diagnosis Code)
    ...     - Secondary Diagnosis Code (This information was selected on the Diagnosis Code)
    ...     - Date of Service: (Date time)
    ...     - Medications (Text/String)
    ...     3. Physicians Contact Information should be next to the Patient Information, containing the following information:
    ...     - Referring Physician
    ...     - Referring Physician: Physician’s Name, Clinic/Facility Name, Clinic’s/Facility’s Address, Day Phone
    ...     - Interpreting Physician: Physician’s Name, Clinic/Facility Name, Personal address or Clinic’s/Facility’s
    ...     address, Personal day phone or Clinic’s/Facility’s day phone
    ...     4. Event Information section should be located right above the ECG Strip image(s) and it should contain
    ...     the following information:
    ...     - Record Date (Trigger Time of an event)
    ...     - Type of Event (Auto, Manual, Tachy, Brady, Pause, AFib)
    ...     - Symptoms (will only appear if it is a manual type of Event and can contain the following values as
    ...     Baseline, Resume Study, Evaluation Strip, Chest Pain or Pressure, Shortness of Breath, Palpitations,
    ...     Dizziness, Other and Not Specified)
    ...     - Interpretation (inputs by technicians about the event)
    ...     - Strip #: (the number of 10 sec. strips of the total strip time)
    ...     5. Strip images: the user can view the strip images of the event, each image presents 10-second data,
    ...     the first ECG 10 sec. Strip image should be on the first page of the report
    ...     - In the case, the user has marked 10 sec in the ECG strip image on the Event Details tab of the
    ...     EVENT Edit page, then there will be only 1 -10 sec ECG strip image in the report. Respectively, if the user
    ...     marks 20 sec in the ECG strip image on the Event Details tab of the EVENT Edit page, then there will be
    ...     only 2 -10 sec ECG strip images in the report
    ...     6. Text area locating right below the ECG strip image named “Technician Comments“, which should contain
    ...     all inputs/comments/interpretation by technicians about the event
    ...     7. The text area locating right below the ECG strip image and next to the “Technician Comments“ is named
    ...     “Physician Interpretation“, which should allow the physician to input notes/comment/interpret the event
    ...     - There should also be a line where the Physician can leave his or her signature on the report

    [Tags]      BFCC-SUPVR-PROCESS-EVENT-REPORT-18        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}         Start Browser
    Import Library          project_bioflux_callcenter_portal/lib/web/Common.py             ${BROWSER_NODE}     ${ENV}
    Import Library          project_bioflux_callcenter_portal/lib/web/Events.py             ${BROWSER_NODE}     ${ENV}
    Import Library          project_bioflux_callcenter_portal/lib/web/EventDetails.py       ${BROWSER_NODE}     ${ENV}
    Import Library          project_bioflux_callcenter_portal/lib/web/Reports.py            ${BROWSER_NODE}     ${ENV}
    Import Library          project_bioflux_callcenter_portal/lib/web/StudyManagement.py    ${BROWSER_NODE}     ${ENV}
    Import Library          project_bioflux_callcenter_portal/lib/web/Studies.py            ${BROWSER_NODE}     ${ENV}
    ${USERS}                Get Config Param    NEW_USERS
    ${STUDY_ID}             Get Config Param    STUDY_ID
    ${STUDY_ID_COMPELTED}   Set Variable        ${STUDY_ID}[study_id_completed][study_id]
    ${CURRENT_USER}         Set Variable        ${USERS}[callcenter_technician]
    ${STUDY_ID_ASSIGN}      Set Variable        ${STUDY_ID}[study_id_completed]
    ${RELEASE_VERSION}      Navigate To Callcenter Sign In Page
    ${TOKEN}                Sign In Callcenter    username=${CURRENT_USER}[username]     password=${CURRENT_USER}[password]
    Set Global Variable     ${STUDY_ID_COMPELTED}
    Set Suite Variable      ${TOKEN}
    Set Global Variable     ${STUDY_ID_ASSIGN}
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

Navigate to event detail with event type is "${item_event}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${STUDY_ID_COMPELTED}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    events
    Filter Study Events    by_type=${item_event}
    Edit Study Event On        row=3
    Switch Tab

Back to event type original with type is "${event_type}"
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab      Event Details
    Edit Event Details    event_type=${event_type}

Navigate to event details
    Navigate To Tab Menu      Studies
    Refresh Page
    Navigate To Studies Type        Completed
    ${completed}        Get Completed Studies On Page
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${completed} if item['Total Events'].split()[0] != '0']
    ${study_id}    Evaluate  random.choice(${studies_id})    random
    Filter Studies    search_by=Study ID         text_search=${study_id}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    events
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab      Event Details
    Set Global Variable    ${study_id}

Create event report has the status is Generated
    Navigate To Tab Menu      Studies
    Refresh Page
    Navigate To Studies Type        Completed
    ${completed}        Get Completed Studies On Page
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${completed} if item['Total Events'].split()[0] != '0']
    ${study_id}    Evaluate  random.choice(${studies_id})    random
    Filter Studies    search_by=Study ID         text_search=${study_id}
    Manage Complete Study On    row=1
    Navigate To Study Management Type    events
    ${study_event}    Get Study Events
    ${event_search}     Set Variable    ${study_event}[0][Event ID]
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab      Event Details
    ${event_header}     Get Event Summary
    ${study_id}         Set Variable    ${event_header}[STUDY ID]
    Edit Event Details    event_validity=Valid      is_close=${True}
    Navigate To Event Tab      Event Report
    Create Event Reports With Status Is Generate
    Set Global Variable     ${event_search}
    Set Global Variable     ${study_id}

Navigate to report screen has the notification reports with study id is "${study_id_completed}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id_completed}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    reports
    Filter Study Reports    by_report=Notification reports

Create ready notification reports with study id is "${study_id}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search==${study_id}
    Manage Complete Study On    row=1
    Navigate To Study Management Type    events
    ${study_event}    Get Study Events
    ${event_search}     Set Variable    ${study_event}[0][Event ID]
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab      Event Details
    ${event_header}     Get Event Summary
    ${study_id}         Set Variable    ${event_header}[STUDY ID]
    Edit Event Details    event_validity=Valid      is_close=${True}
    Navigate To Event Tab      Event Report
    Create Event Reports With Status Is Ready
    Set Global Variable     ${event_search}
    Set Global Variable     ${study_id}
