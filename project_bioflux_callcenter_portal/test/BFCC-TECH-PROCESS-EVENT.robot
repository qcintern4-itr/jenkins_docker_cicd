*** Settings ***
Documentation   Test Suite - Call Center Technician Portal - Process Event
Metadata    sid     BFCC-TECH-PROCESS-EVENT
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
Force Tags      BFCC-TECH-PROCESS-EVENT     web
Test Timeout    1h

*** Test Cases ***
BFCC-TECH-PROCESS-EVENT-DETAILS-01: Change the type of an Auto event
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can change the type of an Auto event
    ...
    ...     Precondition: The user is on the Event Details tab of the Event Edit page
    ...
    ...     Test Steps:
    ...     1. Observe the event type field on the page
    ...     2. Click [Event type] field of an Auto event
    ...     3. Select an option from the list
    ...     4. Click [Save] or [Close] button
    ...
    ...     Expected Results:
    ...     1. In step 1:
    ...     - The default value of the event type should be the original type that the device has detected
    ...     - If the type is Manual, the field shall be disabled
    ...     2. In step 2:
    ...     - The list of event type displayed, including:  Auto, Brady, Tachy, AFib, Pause, and Sinus
    ...     - There is a word "Device" next to the original type that the device has detected
    ...     3. In step 4: The new event type is saved

    [Tags]      BFCC-TECH-PROCESS-EVENT-DETAILS-01       auto
    Navigate To Event Detail With Event Type Is "Manual"
    Navigate To Event Tab      Event Details
    ${items}       Check Events Items Available    items=event type
    Run Keyword And Continue On Failure    Should Be Equal    ${items}[event type]     disabled
    ${item_event_type}      Set Variable    Pause
    Navigate To Event Detail With Event Type Is "${item_event_type}"
    Navigate To Event Tab      Event Details
    ${ls_event_types}       Create List    Brady    Tachy   AFib    Pause   Auto    Sinus
    ${event_type}   Get Top Event Detail Options
    ${actual_event_type}        Evaluate    [item.replace('(Device)','').strip() for item in ${event_type}[Event Types]]
    Run Keyword And Continue On Failure    Should Be Equal                   ${actual_event_type}           ${ls_event_types}
    Run Keyword And Continue On Failure    List Should Contain Value         ${event_type}[Event Types]     ${item_event_type} (Device)
    ${random_etype}     Evaluate    random.choice(${ls_event_types})    random
    Edit Event Details    event_type=${random_etype}
    ${event_id}     Get Event Summary
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${STUDY_ID_COMPELTED}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    events
    Filter Study Events    text_search=${event_id}[EVENT ID]
    ${etype_change}     Get Study Events
    Run Keyword And Continue On Failure    Should Be Equal    ${etype_change}[0][Event Type]      ${random_etype}
    [Teardown]    Run Keyword    Back to event type original with type is "${item_event_type}"

BFCC-TECH-PROCESS-EVENT-DETAILS-02: Mark an event as valid or invalid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can mark an event as valid or invalid
    ...
    ...     Precondition: The user is on the Event Details tab of the Event Edit page
    ...
    ...     Test Steps:
    ...     1. Observe Validity field on the page
    ...     2. Click [Validity] field
    ...     3. Select an option from the list
    ...     4. Click [Save] or [Close] button
    ...
    ...     Expected Results:
    ...     1. In step 1: The default value is Valid
    ...     2. In step 2: The list of validity status displayed, including: Valid, Invalid
    ...     3. In step 4: The new validity is saved

    [Tags]      BFCC-TECH-PROCESS-EVENT-DETAILS-02       auto
#    # TBD
    Navigate To Events
    Navigate To Event Menu    Non-viable
    ${events}        Get Open Events
    # Start processing and navigate to details
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing
    ${events}        Get Open Events
    View Open Events Details On    row=1
    ${event_summary}    Get Event Summary
    ${event_id}             Evaluate        "${event_summary['EVENT ID'].split('\n')[0]}"
    Run Keyword And Continue On Failure    Should Be Equal    ${event_id}       ${events}[0][Event ID]
    Run Keyword And Continue On Failure    Should Be Equal    ${event_summary}[STUDY ID]       ${events}[0][Study ID]
    ${event_options}     Get Top Event Detail Options
    Run Keyword And Continue On Failure     Should Be Equal    ${event_options}[Validity][0]       Valid
    Run Keyword And Continue On Failure     Should Be Equal    ${event_options}[Validity][1]       Invalid
    # Make sure event is valid
    Edit Event Details    event_validity=Valid
    ${event_details}        Get Event Details
    Run Keyword And Continue On Failure    Should Be Equal     ${event_details}[Validity]        Valid
    ${event_summary}    Get Event Summary
    Run Keyword And Continue On Failure    Should Contain      ${event_summary}[EVENT ID]        Valid
    Edit Event Details    event_validity=Invalid
    ${event_details}        Get Event Details
    Run Keyword And Continue On Failure    Should Be Equal  ${event_details}[Validity]           Invalid

BFCC-TECH-PROCESS-EVENT-DETAILS-03: Include a strip of Manual event in a report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can include a strip of Manual event in a report
    ...
    ...     Precondition:
    ...     - The user is on the Event Details tab of the Event Edit page
    ...     - The user has chosen the validity of an event as Valid
    ...
    ...     Test Steps:
    ...     1. Observe [Include in report] checkbox on the page
    ...     2. Click [Save] or [Close] button
    ...
    ...     Expected Results:
    ...     1. In step 1:
    ...     - The “Include in report” checkbox is pre-selected and undisabled
    ...     - The user shall not be able to uncheck the “Include in report” checkbox
    ...     2. In step 2: The new change is saved

    [Tags]      BFCC-TECH-PROCESS-EVENT-DETAILS-03       auto
    Navigate To Event Detail With Event Type Is "Manual"
    Navigate To Event Tab      Event Details
    Edit Event Details    event_validity=Valid
    ${items}       Check Events Items Available    items=include report
    Run Keyword And Continue On Failure    Should Be True    ${items}[include report]

BFCC-TECH-PROCESS-EVENT-DETAILS-04: Include/exclude a strip of Auto event in a report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can include/exclude a strip of Manual event in a report
    ...
    ...     Precondition:
    ...     - The user is on the Event Details tab of the Event Edit page
    ...     - The user has chosen the validity of an event as Valid
    ...
    ...     Test Steps:
    ...     1. Observe [Include in report] checkbox on the page
    ...     2. Check/uncheck the [Include in report] checkbox
    ...     3. Click [Save] or [Close] button
    ...
    ...     Expected Results:
    ...     1. In step 1:
    ...     - The “Include in report” checkbox is checked by default
    ...     - The checkbox shall be enabled
    ...     2. In step 3:
    ...     - If the checkbox is checked, the event strip shall be included in report
    ...     - If the checkbox is unchecked, the event strip shall be excluded from report

    [Tags]      BFCC-TECH-PROCESS-EVENT-DETAILS-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    # TBD
#    Navigate To Events
#    Navigate To Event Menu    Non-viable
#    ${events}        Get Open Events
#    # Start processing and navigate to details
#    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
#    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing
#    ${events}        Get Open Events
#    ${study_id}      Set Variable    ${events}[0][Study ID]
#    View Open Events Details On    row=Manual
#    # Make sure event is valid
#    ${event_summary}    Get Event Summary
#    Run Keyword And Continue On Failure    Should Be Equal    ${event_summary}[EVENT ID]       ${events}[0][Event ID]
#    Run Keyword And Continue On Failure    Should Be Equal    ${event_summary}[STUDY ID]       ${events}[0][Study ID]
#    Edit Event Details    event_validity=valid
#    ${event_details}        Get Event Details
#    Run Keyword And Continue On Failure    Should Be Equal    ${event_details}[Include in report]      ${True}
#    # TBD CHECK Study -> Event reports
#    Edit Event Details    includ_report=${False}
#    ${event_details}        Get Event Details
#    Run Keyword And Continue On Failure    Should Be Equal    ${event_details}[Include in report]      ${False}

BFCC-TECH-PROCESS-EVENT-DETAILS-05: Mark call status
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can mark a call status for an event
    ...
    ...     Precondition:
    ...     - The user is on the Event Details tab of the Event Edit page
    ...
    ...     Test Steps:
    ...     1. Observe [Call Status] field on the page
    ...     2. Click [Call Status] field
    ...     3. Select an option from the list
    ...     4. Click [Save] or [Close] button
    ...
    ...     Expected Results:
    ...     1. In step 1: The default status is No Call
    ...     2. In step 2: The list of Call status displayed, including: No Call, Call Required, Call Completed
    ...     3. In step 3: The new change is saved

    [Tags]      BFCC-TECH-PROCESS-EVENT-DETAILS-05       auto
    [Setup]    Navigate To Event Details
    ${ls_call_status}     Create List    No Call    Call Required    Call Completed
    ${call_status}   Get Top Event Detail Options
    ${random_call_status}     Evaluate    random.choice(${ls_call_status})    random
    Run Keyword And Continue On Failure    Should Be Equal    ${ls_call_status}    ${call_status}[Call Options]
    Edit Event Details    call_option=${random_call_status}
    ${event_id}     Get Event Summary
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies    search_by=Study ID         text_search=${study_id}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    events
    Filter Study Events    text_search=${event_id}[EVENT ID]
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab      Event Details
    ${actual_call_status}       Get Event Details
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_call_status}[Call Option]      ${random_call_status}

BFCC-TECH-PROCESS-EVENT-DETAILS-06: Edit an MCT event using ECG viewer
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit an MCT event using ECG viewer
    ...
    ...     Precondition:
    ...     - The user is on the Event Details tab of the Event Edit page
    ...     - The ECG strip viewer is in the Basic View mode
    ...
    ...     Test Steps:
    ...     1. Right click on ECG Viewer
    ...     2. Edit ECG Viewer using tools from the context menu and save the changes
    ...     3. Observe the filters on the toolbar
    ...     4. Edit ECG Viewer using filters and save the changes
    ...
    ...     Expected Results:
    ...     1. In step 1: The context menu displays with the following tools:
    ...     - Horizontal Caliper
    ...     - Vertical Caliper
    ...     - Beat Calipers
    ...     - Text Annotation
    ...     - Mark 10 Sec
    ...     - Mark 20 Sec
    ...     - Mark a Pattern
    ...     - Show/Hide Beat Markers
    ...     2. In step 2: The saved changes are shown on the pdf report if the event is included in the report
    ...     3. In step 3: The following filters displayed, including:
    ...     - Speed
    ...     - Gain
    ...     - High Pass Filter
    ...     - Low Pass Filter
    ...     - Show/Hide Channels
    ...     - Preview channel
    ...     - Turn on/off grid
    ...     - Zoom in/out
    ...     - View all
    ...     4. In step 4:
    ...     - The changes of Show/Hide Beat Markers, Add/Remove Beat Marker, Show/Hide Channels, High Pass Filter,
    ...     Low Pass Filter, Speed, Gain shall be saved
    ...     - The saved changes of are shown on the pdf report if the event is included in the report

    [Tags]      BFCC-TECH-PROCESS-EVENT-DETAILS-06       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EVENT-DETAILS-07: Edit an event using AI assist tool
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit an event using AI assist tool
    ...
    ...     Precondition:
    ...     - The user is on the Event Details tab of the Event Edit page
    ...
    ...     Test Steps:
    ...     1. Observe the information on AI assist tool section
    ...     2. Turn on the AI Assist toggle
    ...     3. Turn off the AI Assist toggle
    ...     4. Make any beat marker changes based on AI Assist and presses the Save button
    ...
    ...     Expected Results:
    ...     1. In step 1:
    ...     - The AI Assist Tool shall have the following components:
    ...         - Toggle (On/Off)
    ...         - Heart rate details: Max HR, Min HR, Avg HR
    ...         - Diagnosis channel: Channel 1, Channel 2, Channel 3
    ...         - List of VES beats (# of VES beats occurrence in the ECG viewer strip):
    ...             + An “eye” button - to show and hide the VES beats on the ECG viewer strip
    ...             + Exact time occurrence on the ECG strip.When the user selects the time of the beat occurrence,
    ...         the system shall navigate the user to the exact spot on the strip in the ECG viewer window
    ...         - List of SVES beats (# of SVES beats occurrence in the ECG viewer strip):
    ...             + An “eye” button - to show and hide the VES beats on the ECG viewer strip
    ...             + Exact time occurrence on the ECG strip.When the user selects the time of the beat occurrence,
    ...         the system shall navigate the user to the exact spot on the strip in the ECG viewer window
    ...         - List of AFib events (# of AFib events occurrence in the ECG viewer strip):
    ...             + An “eye” button - to show and hide the VES beats on the ECG viewer strip
    ...             + Exact time occurrence on the ECG strip.When the user selects the time of the beat occurrence,
    ...         the system shall navigate the user to the exact spot on the strip in the ECG viewer window
    ...     - By default, the AI Assist Tool toggle is turned on and the user shall be able to view the AI beat
    ...     markers on the ECG viewer
    ...     2. In step 2:
    ...     - The AI beat markers shall appear on the ECG viewer
    ...     - The AI Assist Tool shall appear below the ECG viewer
    ...     - The AI suggest line for the Technician Comments shall be displayed under the Technician Comments box
    ...     3. In step 3:
    ...     -  A dialog shall appear with:
    ...         - a message "“All beat marker changes will be dismissed. Are you sure you want to continue?”
    ...         - Turn Off/Cancel buttons. If the user selects Turn Off:
    ...             + All beat markers that the user has made based on the AI Assist Tools shall be dismissed
    ...             + The AI Assist Tool shall be hidden from the screen
    ...             + The AI suggest line for the Technician Comments shall be hidden
    ...         - If the user selects Cancel: The dialog and the message box shall disappear
    ...      4. In step 4: The saved changes shall be shown on the pdf report if the event is included in the report

    [Tags]      BFCC-TECH-PROCESS-EVENT-DETAILS-07       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EVENT-DETAILS-08: Edit event parameters of an Auto event that has completed ans its params uploaded
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit event parameters of an Auto event that has completed ans its params uploaded
    ...
    ...     Precondition:
    ...     - The user is on the Event Details tab of the Event Edit page
    ...     - The event has completed and has its parameters uploaded
    ...
    ...     Test Steps:
    ...     1. Observe the Event Parameters section
    ...     2. Edit Event Duration in seconds (max. 172800 sec) and can be real numbers and round to first decimal place
    ...     then save the changes
    ...     3. Edit Max HR, Min HR, then save the changes
    ...     4. Make any beat marker changes based on AI Assist and presses the Save button
    ...
    ...     Expected Results:
    ...     1. In step 1:
    ...     - In the case the event duration of an event is less than 30 seconds, the system shall
    ...     auto-fill the event duration in event parameters using the data from AI, and also fill the Max HR and
    ...     Min HR using the data from the device
    ...     - In the case the event duration of an event is greater than 30 seconds, the system shall auto-fill all
    ...     the event parameters using the data from the device
    ...     2. In step 2: The new changes shall be saved
    ...     3. In step 3:
    ...     - In the case the user wants to close an event and the Min HR and Max HR values are missing in the
    ...     Event parameters, a message stating: “Min HR and Max HR values are missing. Please enter the values before
    ...     saving the event." shall be displayed
    ...     - In the case the user inputs invalid values in the Event parameters and wants to close an event, a message
    ...     stating:” Entered Min HR and Max HR values are invalid. Please check the values again before saving the event." shall be displayed

    [Tags]      BFCC-TECH-PROCESS-EVENT-DETAILS-08       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EVENT-DETAILS-09: Edit event parameters of an Auto event that has not been fully uploaded
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

    [Tags]      BFCC-TECH-PROCESS-EVENT-DETAILS-09       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EVENT-DETAILS-10: Edit event tags
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit tags of an event
    ...
    ...     Precondition:
    ...     - The user is on the Event Details tab of the Event Edit page
    ...
    ...     Test Steps:
    ...     1. Click [Event tag] dropdown
    ...     2. Select tags and save the changes
    ...
    ...     Expected Results:
    ...     1. In step 1:
    ...     - The following tags displayed: 1st Deg HB, 2nd Deg HB, 3rd Deg HB, VTach, AFIB, AFlutter, Tachy, Brady, PAC,
    ...     Paced, PVC, Pause, Sinus Rhythm, Single VEs, VEs Run, VEs Couplet, VEs Bigeminy, Single SVEs, SVEs Couplet,
    ...     SVEs Run, SVEs Bigeminy, SVEs Trigeminal, Min HR, Max HR, Long RR, IVCD
    ...     2. Event tags shall be saved

    [Tags]      BFCC-TECH-PROCESS-EVENT-DETAILS-10       auto
    [Setup]    Navigate To Event Details
    ${actual_list_event_tags}        Get Event Tag
    ${expected_list_event_tags}       Create List    1st Deg HB    2nd Deg HB    3rd Deg HB    VTach   SVT   AFIB    AFlutter    Tachy   Brady   PAC
    ...     Paced    PVC     Pause   Sinus Rhythm    Single VEs  VEs Run     VEs Couplet     VEs Bigeminy    Single SVEs     SVEs Couplet
    ...     SVEs Run     SVEs Bigeminy   SVEs Trigeminal     Min HR   Max HR   Long RR    IVCD
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${actual_list_event_tags}     ${expected_list_event_tags}
    Edit Event Tag    event_name=VTach
    ${expected_event_tag}   Get Current Event Tag
    Edit Event Tag    is_save=${True}
    Refresh Page
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies    search_by=Study ID         text_search=${study_id}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    Events
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab      Event Details
    ${actual_event_tag}   Get Current Event Tag
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_event_tag}     ${actual_event_tag}
    Clear Event Tag
    Edit Event Tag    is_save=${True}
    ${event_tag_clear}   Get Current Event Tag
    Run Keyword And Continue On Failure    Should Be Empty    ${event_tag_clear}

BFCC-TECH-PROCESS-EVENT-DETAILS-11: Edit technician comments
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

    [Tags]      BFCC-TECH-PROCESS-EVENT-DETAILS-11       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    [Setup]    Navigate To Event Details
#    Add Technician Comments         When input more than 520 characters the portal will display the following message "Exceeded maximum of 520 characters in Technician Comments" Technician comments must appear in the event report at the TECHNICIAN COMMENTS section. When input more than 520 characters the portal will display the following message "Exceeded maximum of 520 characters in Technician Comments" Technician comments must appear in the event report at the TECHNICIAN COMMENTS section. When input more than 520 characters the portal will display 1
#    ${msg_character}     Get Toast Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${msg_character}      Exceeded maximum of 520 characters in Technician Comments

BFCC-TECH-PROCESS-EVENT-DETAILS-12: View full data of an Auto event
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

    [Tags]      BFCC-TECH-PROCESS-EVENT-DETAILS-12       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EVENT-DETAILS-13: View Event Information
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

    [Tags]      BFCC-TECH-PROCESS-EVENT-DETAILS-13       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EVENT-DETAILS-14: View Study Settings
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Event Information
    ...
    ...     Precondition:
    ...     - The user is on the Event Details tab of the Event Edit page
    ...
    ...     Test Steps:
    ...     1. Observe Study Settings section
    ...
    ...     Expected Results:
    ...     1. The following information displayed:
    ...     - Pre-event Time: The amount of time (second) before the happening of the event
    ...     - Tachycardia Threshold: The upper threshold of a normal resting heart. Tachy events will be detected when
    ...     the heartbeat greater than this threshold
    ...     - Pause Level: Pause events will be detected when the amount of time the heart pause greater than this level
    ...     - Pause Detection: On, Off
    ...     - Duration: the total time/day of the study
    ...     - Post-event Time: The amount of time (second) after the happening of the event
    ...     - Bradycardia Threshold: The lower threshold of a normal resting heart. Brady events will be detected when
    ...     the heartbeat lesser than this threshold
    ...     - Diagnosis Lead: Which lead/channel to take into account (1, 2, 3)
    ...     - AFib Detection: Enable detecting Afib event (On, Off)
    ...     - Amplify ECG Signal Rate
    ...
    [Tags]      BFCC-TECH-PROCESS-EVENT-DETAILS-14       auto
    Navigate To Event Details
    ${event_details}    Get Event Details
    ${actual_study_setting}     Evaluate    [k for k, v in ${event_details}[STUDY SETTINGS].items()]
    ${expected_study_setting}     Create List    Pre-event Time     Post-event Time   Tachycardia Threshold    Bradycardia Threshold    Pause Level      Diagnosis Lead    Pause Detection     AFib Detection      Study Duration    Amplify ECG Signal Rate
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${actual_study_setting}       ${expected_study_setting}
    ${event_infor}     Evaluate    {k: v for k, v in ${event_details}[STUDY SETTINGS].items()}
    ${expected_status}          Create List    On   Off
    Run Keyword And Continue On Failure    List Should Contain Value        ${expected_status}      ${event_infor}[Pause Detection]
    Run Keyword And Continue On Failure    List Should Contain Value        ${expected_status}      ${event_infor}[AFib Detection]

BFCC-TECH-PROCESS-EVENT-DETAILS-15: Mark and Unmark an event as Process Later
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Event Information
    ...
    ...     Precondition:
    ...     - The user is on the Event Details tab of the Event Edit page
    ...
    ...     Test Steps:
    ...     1. Observe Study Settings section
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 8/18/2023 - Nhan Nguyen

    [Tags]      BFCC-TECH-PROCESS-EVENT-DETAILS-15      auto
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies    search_by=Study ID         text_search=${STUDY_ID_ASSIGN}[study_id]
    Manage Complete Study On        row=1
    Navigate To Study Management Type    events
    ${study_event}    Get Study Events
    ${event_search}     Set Variable    ${study_event}[0][Event ID]
    Filter Study Events    text_search=${event_search}
    Bookmark Event On  row=1
    Clear Event Text Search
    Filter Study Events    by_status=Process Later
    ${study_event}    Get Study Events Process Later
    ${event_id}         Evaluate    [item['Event ID'] for item in ${study_event}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${event_id}     ${event_search}
    UnBookmark Event On  row=1
    Filter Study Events    by_status=Open
    Filter Study Events    by_status=Process Later
    ${study_event}    Get Study Events Process Later
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${study_event}     ${event_search}

BFCC-TECH-PROCESS-EVENT-CRITERIA-01: View Notification Criteria
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Notification Criteria
    ...
    ...     Precondition:
    ...     - The user is on the Notification Criteria tab of the Event Edit page
    ...
    ...     Test Steps:
    ...     1. Observe the page
    ...
    ...     Expected Results:
    ...     1. The Notification Criteria should consist of:
    ...     - Notification Protocol Amendments:
    ...         - Patient-Specific Notification Criteria Amendments: This information was created when the clinic
    ...         technician created a new study
    ...         - Facility: This is the notification criteria in PDF format of the facility
    ...     - Study Log:
    ...         - A card containing the log records of the study
    ...         - A text field to input logs in the format of a text
    ...     - Study notes:
    ...         - A card containing the notes of the study
    ...         - A text box to input notes in the format of a text

    [Tags]      BFCC-TECH-PROCESS-EVENT-CRITERIA-01      auto
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    ${completed}        Get Completed Studies On Page
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${completed} if item['Total Events'].split()[0] != '0']
    ${study_id}    Evaluate  random.choice(${studies_id})    random
    Filter Studies    search_by=Study ID         text_search=${study_id}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    events
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab      Notification Criteria
    ${actual_notification_criteria}        Get Notification Criteria
    ${expected_notification_criteria}     Create List      NOTIFICATION PROTOCOL AMENDMENTS        STUDY LOGS      STUDY NOTES
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${actual_notification_criteria}     ${expected_notification_criteria}

BFCC-TECH-PROCESS-EVENT-LOCK-01: Locking an event when the user is Editing an Event
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

    [Tags]      BFCC-TECH-PROCESS-EVENT-LOCK-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EVENT-LOCK-02: Locking events on the event list on the EVENTS page
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

    [Tags]      BFCC-TECH-PROCESS-EVENT-LOCK-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EVENT-REPORT-01: Generate event report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can generate an event report of a Valid event
    ...
    ...     Precondition:
    ...     - The user stays on the Event Details of the Event Edit page
    ...
    ...     Test Steps:
    ...     1. Select the Validity of the event as Valid, then click [Close] button
    ...     2. On Event Report tab, click [Generate Report] button
    ...
    ...     Expected Results:
    ...     1. Event Report tab shall display
    ...     2. The system will generate the event report:
    ...     - If the report was generated successfully, the portal will display the pop-up notification with the
    ...     following message: "Generate Report Success", and allow the user to view the pdf review
    ...     - If the report was generated unsuccessfully, an error message will be displayed

    [Tags]      BFCC-TECH-PROCESS-EVENT-REPORT-01        auto
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${STUDY_ID_COMPELTED}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    events
    Filter Study Events    by_validity=Invalid
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab      Event Details
    Edit Event Details     event_validity=Valid       is_close=${True}
    Navigate To Event Tab      Event Report
    Generate Event Report Data
    ${msg}      Get Toast Message
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        Generate Report Success
    ${status_report}    Check Generate Successful
    Run Keyword And Continue On Failure    Should Be True    ${status_report}
    Navigate To Event Tab      Event Details
    Edit Event Details     event_validity=Invalid

BFCC-TECH-PROCESS-EVENT-REPORT-02: Regenerate event report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can regenerate an event report of a Valid event
    ...
    ...     Precondition:
    ...     - The user is on Event Report tab of the Event Edit page
    ...     - The PDF files of the reports are already generated
    ...     - The reports are not in Sent or Dismissed status
    ...
    ...     Test Steps:
    ...     1. Observe [Generate Report] button
    ...     2. Click [Generate Report] button
    ...
    ...     Expected Results:
    ...     1. The [Generate Report] button is clickable
    ...     2. The system will regenerate the event report:
    ...     - After the PDF file has been re-generated, the report status should remain the same as “Ready“;
    ...     otherwise, the status will be changed to “Generated“
    ...     - If the report generation process succeeds, a message shall be displayed on the screen saying:
    ...     “Generate Report Success“
    ...     - If the report was generated unsuccessfully, an error message will be displayed

    [Tags]      BFCC-TECH-PROCESS-EVENT-REPORT-02       auto
    Navigate To Report Screen Has The Notification Reports With Study Id Is "${STUDY_ID_COMPELTED}"
    ${study_reports}        Get Study Reports
    ${report_status}        Evaluate    [item for item in ${study_reports} if item.get('Report Status') == 'Generated' and item.get('Report ID') != '00001']
    ${report_id}            Evaluate    [item['Report ID'] for item in ${report_status}]
    ${random_report_id}     Evaluate    random.choice(${report_id})    random
    Filter Study Reports    text_search=${random_report_id}
    ${study_reports}        Get Study Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Report Status]   Generated
    Edit Report On      row=1
    Navigate To Event Tab      Event Report
    Create Event Reports With Status Is Generate
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Be True    ${check_event_report}[PDF Viewer]
    Run Keyword And Continue On Failure     Should Be Equal   ${check_event_report}[Text Report]      Ready
    Run Keyword And Continue On Failure     Should Be True    ${check_event_report}[Generate Report]
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${STUDY_ID_COMPELTED}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    reports
    Filter Study Reports    by_report=Notification reports      text_search=${random_report_id}
    ${study_reports}        Get Study Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Report Status]   Generated

BFCC-TECH-PROCESS-EVENT-REPORT-03: Upload an event report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can upload a PDF report from my computer to a report
    ...
    ...     Precondition:
    ...     - The user is on Event Report tab of the Event Edit page
    ...     - The reports are not in Sent or Dismissed status
    ...
    ...     Test Steps:
    ...     1. Observe [Upload Report] button
    ...     2. Click [Upload Report] button
    ...     3. Select a PDF file from the computer to upload
    ...
    ...     Expected Results:
    ...     1. The [Upload Report] button is clickable
    ...     2. A prompt shall be displayed on the screen with a message stating: “Please make sure you are uploading
    ...     report for [Patient_Name] that appears for the study in the portal.”
    ...     - A file browser window will appear which should allow the user to select a PDF file to upload
    ...     3. After the file is uploaded:
    ...     - The system should display the following message: "Upload PDF Report Success"
    ...     - The PDF report will be displayed in a PDF preview
    ...     - The uploaded PDF report will replace the previous PDF report
    ...     - If the uploading PDF report was unsuccessful, an error message will be displayed
    ...
    ...     **Others**
    ...     Update date: 3/11/2024 - Nhan Nguyen - Remove this feature

    [Tags]      BFCC-TECH-PROCESS-EVENT-REPORT-03        manual     deactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EVENT-REPORT-04: Set event report status to Ready
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can set event report status to Ready
    ...
    ...     Precondition:
    ...     - The user is on Event Report tab of the Event Edit page
    ...     - The PDF file of the event report has generated
    ...
    ...     Test Steps:
    ...     1. Select a priority
    ...     2. Click [Ready] button
    ...
    ...     Expected Results:
    ...     1. The [Ready] button is clickable
    ...     2. The status of the event report should be changed from Generated to Ready
    ...     - The event report should appear in the Ready tab under the Notification Reports subtab of the REPORTS page

    [Tags]      BFCC-TECH-PROCESS-EVENT-REPORT-04        auto
    Navigate To Report Screen Has The Notification Reports With Study Id Is "${STUDY_ID_COMPELTED}"
    ${study_reports}        Get Study Reports
    ${report_status}        Evaluate    [item for item in ${study_reports} if item.get('Report Status') == 'Generated']
    ${report_id}            Evaluate    [item['Report ID'] for item in ${report_status}]
    ${random_report_id}     Evaluate    random.choice(${report_id})    random
    Filter Study Reports    text_search=${random_report_id}
    ${study_reports}        Get Study Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Report Status]   Generated
    Edit Report On      row=1
    Navigate To Event Tab      Event Report
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Be True    ${check_event_report}[PDF Viewer]
    Run Keyword And Continue On Failure     Should Be Equal   ${check_event_report}[Text Report]      Ready
    Filter Event Report    priority=Low
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Not Be True    ${check_event_report}[Status Report]
    ${actual_event_report}         Get Study Overview
    Filter Event Report     is_click=${True}
    Navigate To Report Screen Has The Notification Reports With Study Id Is "${STUDY_ID_COMPELTED}"
    Filter Study Reports      text_search=${random_report_id}
    ${study_reports}        Get Study Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Report Status]   Ready
    Navigate To Reports
    Filter Reports    search_by=Study ID    text_search=${STUDY_ID_COMPELTED}     report_state=Ready      report_type=Notification reports
    ${expected_event_report}        Get Ready Notification Event Reports Detail
    ${event_id}                     Evaluate    [item['Event ID'] for item in ${expected_event_report}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${event_id}        ${random_report_id}

BFCC-TECH-PROCESS-EVENT-REPORT-05: Can not send event report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The Technician can't send an event report
    ...
    ...     Precondition:
    ...     - The user is on Event Report tab of the Event Edit page
    ...     - Report status has been set to Ready
    ...
    ...     Test Steps:
    ...     1. Navigate to "Event Report" screen
    ...     2. Obsever the result
    ...
    ...     Expected Results:
    ...     2. The button status is "Send" and disbaled

    [Tags]      BFCC-TECH-PROCESS-EVENT-REPORT-05        auto
    Navigate To Report Screen Has The Notification Reports With Study Id Is "${STUDY_ID_COMPELTED}"
    ${study_reports}        Get Study Reports
    ${report_status}        Evaluate    [item for item in ${study_reports} if item.get('Report Status') == 'Ready']
    ${report_id}            Evaluate    [item['Report ID'] for item in ${report_status}]
    ${random_report_id}     Evaluate    random.choice(${report_id})    random
    Filter Study Reports    text_search=${random_report_id}
    ${study_reports}        Get Study Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Report Status]   Ready
    Edit Report On      row=1
    Navigate To Event Tab      Event Report
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Be True    ${check_event_report}[Status Report Technician]
    Run Keyword And Continue On Failure     Should Be True    ${check_event_report}[Generate Report]
#    Run Keyword And Continue On Failure     Should Be True    ${check_event_report}[Upload Report]

BFCC-TECH-PROCESS-EVENT-REPORT-12: Can not Recall an event report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The Technician can not recall an event report
    ...
    ...     Precondition:
    ...     - The user is on Event Report tab of the Event Edit page
    ...     - Report status is Sent
    ...
    ...     Test Steps:
    ...     1. Navigate to the "Event Report" screen
    ...     2. Obsever the result
    ...
    ...     Expected Results:
    ...     1. The report will disappear from the clinician inbox
    ...     - The system displays message "Report sent to Clinician Inbox"
    ...     - Can not Recall an event report
    ...     - The button "Report Status", "Generate", "Upload Report" is disabled
    ...     - The dropdown list status is disbaled

    [Tags]      BFCC-TECH-PROCESS-EVENT-REPORT-12        auto
    Navigate To Report Screen Has The Notification Reports With Study Id Is "${STUDY_ID_COMPELTED}"
    ${study_reports}        Get Study Reports
    ${report_status}        Evaluate    [item for item in ${study_reports} if item.get('Report Status') == 'Sent']
    ${report_id}            Evaluate    [item['Report ID'] for item in ${report_status}]
    ${random_report_id}     Evaluate    random.choice(${report_id})    random
    Filter Study Reports    text_search=${random_report_id}
    ${study_reports}        Get Study Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Report Status]   Sent
    Edit Report On      row=1
    Navigate To Event Tab      Event Report
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Be True    ${check_event_report}[Status Report Technician]
    Run Keyword And Continue On Failure     Should Not Be True    ${check_event_report}[Generate Report]
    Run Keyword And Continue On Failure     Should Not Be True    ${check_event_report}[Upload Report]
    ${text_sent_message}        Get Text Sent Message
    Run Keyword And Continue On Failure     Should Be Equal    ${text_sent_message}     Report sent to Clinician Inbox

BFCC-TECH-PROCESS-EVENT-REPORT-13: The 'Dismiss' and 'Assignee' button is not displayed
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The Technician can not dismiss an event report
    ...
    ...     Precondition:
    ...     - The user is on Event Report tab of the Event Edit page
    ...
    ...     Test Steps:
    ...     1. Navigate to the 'Event Report' screen
    ...
    ...     Expected Results:
    ...     1. The button "Dismiss" is not displayed
    ...        The button "Assignee" is not displayed

    [Tags]      BFCC-TECH-PROCESS-EVENT-REPORT-13        auto
    Navigate To Report Screen Has The Notification Reports With Study Id Is "${STUDY_ID_COMPELTED}"
    Edit Report On      row=1
    Navigate To Event Tab      Event Report
    ${check_event_report}       Check Displayed On Event Report
    Run Keyword And Continue On Failure     Should Not Be True    ${check_event_report}[Text Dismiss]
    Run Keyword And Continue On Failure     Should Not Be True    ${check_event_report}[Assigned]

BFCC-TECH-PROCESS-EVENT-REPORT-17: Download event report
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

    [Tags]      BFCC-TECH-PROCESS-EVENT-REPORT-17        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EVENT-REPORT-18: Details of Event Report
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

    [Tags]      BFCC-TECH-PROCESS-EVENT-REPORT-18        manual
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
