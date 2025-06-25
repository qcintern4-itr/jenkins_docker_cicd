*** Settings ***
Documentation   Test Suite - Call Center QA Portal - Process Event
Metadata    sid     BFCC-QA-PROCESS-EVENT
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

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BFCC-QA-PROCESS-EVENT   web
Test Timeout    15m

*** Test Cases ***
BFCC-QA-PROCESS-EVENT-DETAILS-01: Change the type of an Auto event
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

    [Tags]      BFCC-QA-PROCESS-EVENT-DETAILS-01      auto
    Navigate to event detail with event type is "Manual"
    Switch Tab
    Navigate To Event Tab      Event Details
    ${items}       Check Events Items Available    items=event type
    Run Keyword And Continue On Failure    Should Be Equal    ${items}[event type]     disabled
    ${item_event_type}      Set Variable    Pause
    Navigate to event detail with event type is "${item_event_type}"
    Switch Tab
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

BFCC-QA-PROCESS-EVENT-DETAILS-02: Mark an event as valid or invalid
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

    [Tags]      BFCC-QA-PROCESS-EVENT-DETAILS-02       auto
    [Setup]    Navigate To Event Details
    ${ls_evalidity}     Create List    Valid     Invalid
    ${event_validity}   Get Top Event Detail Options
    ${random_evalidity}     Evaluate    random.choice(${ls_evalidity})    random
    Run Keyword And Continue On Failure    Should Be Equal    ${ls_evalidity}    ${event_validity}[Validity]
    Edit Event Details    event_validity=${random_evalidity}
    ${event_id}     Get Event Summary
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies    search_by=Study ID         text_search=${study_id}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    events
    Filter Study Events    text_search=${event_id}[EVENT ID]
    ${etype_change}     Get Study Events
#    Run Keyword And Continue On Failure    Should Be Equal    ${etype_change}[0][Event Type]      ${random_etype}

BFCC-QA-PROCESS-EVENT-DETAILS-03: Include a strip of Manual event in a report
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
    ...     - The “Include in report” checkbox is pre-selected and disabled
    ...     - The user shall not be able to uncheck the “Include in report” checkbox
    ...     2. In step 2: The new change is saved

    [Tags]      BFCC-QA-PROCESS-EVENT-DETAILS-03      auto
    Navigate To Event Detail With Event Type Is "Manual"
    Switch Tab
    Navigate To Event Tab      Event Details
    Edit Event Details    event_validity=Valid
    ${items}       Check Events Items Available    items=include report
    Run Keyword And Continue On Failure    Should Be True    ${items}[include report]

BFCC-QA-PROCESS-EVENT-DETAILS-04: Include/exclude a strip of Auto event in a report
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

    [Tags]      BFCC-QA-PROCESS-EVENT-DETAILS-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-EVENT-DETAILS-05: Mark call status
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

    [Tags]      BFCC-QA-PROCESS-EVENT-DETAILS-05       auto
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

BFCC-QA-PROCESS-EVENT-DETAILS-06: Edit an MCT event using ECG viewer
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

    [Tags]      BFCC-QA-PROCESS-EVENT-DETAILS-06       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-EVENT-DETAILS-07: Edit an event using AI assist tool
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

    [Tags]      BFCC-QA-PROCESS-EVENT-DETAILS-07       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-EVENT-DETAILS-08: Edit event parameters of an Auto event that has completed ans its params uploaded
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

    [Tags]      BFCC-QA-PROCESS-EVENT-DETAILS-08       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-EVENT-DETAILS-09: Edit event parameters of an Auto event that has not been fully uploaded
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

    [Tags]      BFCC-QA-PROCESS-EVENT-DETAILS-09       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-EVENT-DETAILS-10: Edit event tags
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
    ...     - The following tags displayed: 1st Deg HB, 2nd Deg HB, 3rd Deg HB, VTach, SVT, AFIB, AFlutter, Tachy, Brady, PAC,
    ...     Paced, PVC, Pause, Sinus Rhythm, Single VEs, VEs Run, VEs Couplet, VEs Bigeminy, Single SVEs, SVEs Couplet,
    ...     SVEs Run, SVEs Bigeminy, SVEs Trigeminal, Min HR, Max HR, Long RR, IVCD
    ...     2. Event tags shall be saved

    [Tags]      BFCC-QA-PROCESS-EVENT-DETAILS-10       auto
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
    Navigate To Study Management Type    events
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab      Event Details
    ${actual_event_tag}   Get Current Event Tag
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_event_tag}     ${actual_event_tag}
    Clear Event Tag
    Edit Event Tag    is_save=${True}
    ${event_tag_clear}   Get Current Event Tag
    Run Keyword And Continue On Failure    Should Be Empty    ${event_tag_clear}

BFCC-QA-PROCESS-EVENT-DETAILS-11: Edit technician comments
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

    [Tags]      BFCC-QA-PROCESS-EVENT-DETAILS-11       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    [Setup]    Navigate To Event Details
#    Add Technician Comments         When input more than 520 characters the portal will display the following message "Exceeded maximum of 520 characters in Technician Comments" Technician comments must appear in the event report at the TECHNICIAN COMMENTS section. When input more than 520 characters the portal will display the following message "Exceeded maximum of 520 characters in Technician Comments" Technician comments must appear in the event report at the TECHNICIAN COMMENTS section. When input more than 520 characters the portal will display 1
#    Edit Event Tag    is_save=${True}
#    ${msg_character}     Get Message Character Error
#    Run Keyword And Continue On Failure    Should Be Equal    ${msg_character}      Exceeded maximum of 520 characters in Technician Comments

BFCC-QA-PROCESS-EVENT-DETAILS-12: View full data of an Auto event
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

    [Tags]      BFCC-QA-PROCESS-EVENT-DETAILS-12       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#BFCC-QA-PROCESS-EVENT-DETAILS-13: View Event Information
#    [Documentation]     Author: Nhan Nguyen
#    ...
#    ...     Description: The user can view Event Information
#    ...
#    ...     Precondition:
#    ...     - The user is on the Event Details tab of the Event Edit page
#    ...
#    ...     Test Steps:
#    ...     1. Observe Event Information section
#    ...
#    ...     Expected Results:
#    ...     1. The following information displayed:
#    ...     - Symptoms: The patient’s symptoms, only exist when the type of event is Manual
#    ...     - Device ID: ID of the Bioflux device running the study
#    ...     - Trigger time: The time when the event is triggered
#    ...     - Upload Time: the time when the event is uploaded to the server
#    ...     - First Opened: the time when the event was first opened in the Event Editing page by a user.
#    ...     For invalid events closed on the EVENTS page (without going to the Event Editing page), First Opened time
#    ...     should be the same as Closed time
#    ...     - Closed Time: the time when the event is closed
#
#    [Tags]      BFCC-QA-PROCESS-EVENT-DETAILS-13      manual
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-EVENT-DETAILS-14: View Study Settings
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
    ...     - Study Duration: the total time/day of the study
    ...     - Post-event Time: The amount of time (second) after the happening of the event
    ...     - Bradycardia Threshold: The lower threshold of a normal resting heart. Brady events will be detected when
    ...     the heartbeat lesser than this threshold
    ...     - Diagnosis Lead: Which lead/channel to take into account (1, 2, 3)
    ...     - AFib Detection: Enable detecting Afib event (On, Off)
    ...     - Amplify ECG Signal Rate
    ...
    [Tags]      BFCC-QA-PROCESS-EVENT-DETAILS-14       auto
    Navigate To Event Details
    ${event_details}    Get Event Details
    ${actual_study_setting}     Evaluate    [k for k, v in ${event_details}[STUDY SETTINGS].items()]
    ${expected_study_setting}     Create List    Pre-event Time     Post-event Time   Tachycardia Threshold    Bradycardia Threshold    Pause Level      Diagnosis Lead    Pause Detection     AFib Detection      Study Duration    Amplify ECG Signal Rate
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${actual_study_setting}       ${expected_study_setting}
    ${event_infor}     Evaluate    {k: v for k, v in ${event_details}[STUDY SETTINGS].items()}
    ${expected_status}          Create List    On   Off
    Run Keyword And Continue On Failure    List Should Contain Value        ${expected_status}      ${event_infor}[Pause Detection]
    Run Keyword And Continue On Failure    List Should Contain Value        ${expected_status}      ${event_infor}[AFib Detection]

BFCC-QA-PROCESS-EVENT-DETAILS-15: Mark and Unmark an event as Process Later
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

    [Tags]      BFCC-QA-PROCESS-EVENT-DETAILS-15       auto
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    ${completed}        Get Completed Studies On Page
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${completed} if item['Total Events'].split()[0] != '0']
    ${study_id}    Evaluate  random.choice(${studies_id})    random
    Filter Studies    search_by=Study ID         text_search=${study_id}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    events
    ${study_event}    Get Study Events
    ${event_search}     Set Variable    ${study_event}[0][Event ID]
    Filter Study Events    text_search=${event_search}
    Bookmark Event On  row=1
    Clear Event Text Search
    Filter Study Events    by_status=Process Later
    ${study_event}    Get Study Events
    ${event_id}         Evaluate    [item['Event ID'] for item in ${study_event}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${event_id}     ${event_search}
    UnBookmark Event On  row=1
    Filter Study Events    by_status=Open
    Filter Study Events    by_status=Process Later
    ${study_event}    Get Study Events
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${study_event}     ${event_search}

BFCC-QA-PROCESS-EVENT-CRITERIA-01: View Notification Criteria
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

    [Tags]      BFCC-QA-PROCESS-EVENT-CRITERIA-01      auto
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

BFCC-QA-PROCESS-EVENT-LOCK-01: Locking an event when the user is Editing an Event
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

    [Tags]      BFCC-QA-PROCESS-EVENT-LOCK-01      manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Tab Menu      Studies
#    Navigate To Studies Type        Completed
#    Manage Complete Study On        row=1
#    Navigate To Study Management Type    events
#    Filter Study Events    by_type=Manual
#    Edit Study Event On        row=1
#    Switch Tab    tab_id=0
#    Edit Study Event On        row=1
#    Switch Tab
#    ${actual_msg}       Get Message Locking
#    Run Keyword And Continue On Failure    Should Be Equal    ${actual_msg}     Be careful. Someone is editing this event
#    ${number}       Get Count User Opening
#    ${status} =  Evaluate  ${number} > 1
#    Run Keyword And Continue On Failure    Should Be True    ${status}

BFCC-QA-PROCESS-EVENT-LOCK-02: Locking events on the event list on the EVENTS page
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

    [Tags]      BFCC-QA-PROCESS-EVENT-LOCK-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-EVENT-REPORT-01: Generate event report
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

    [Tags]      BFCC-QA-PROCESS-EVENT-REPORT-01        auto
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

BFCC-QA-PROCESS-EVENT-REPORT-02: Regenerate event report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can regenerate an event report of a Valid event
    ...
    ...     Precondition:
    ...     - The user is on Event Report tab of the Event Edit page
    ...     - The PDF files of the reports are already generated
    ...     - The reports is generate status
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

    [Tags]      BFCC-QA-PROCESS-EVENT-REPORT-02        auto
    [Setup]    Create Event Report Has The Status Is Generated
    Navigate to report screen has the notification reports with study id is "${study_id}"
    Filter Study Reports    text_search=${event_search}
    ${study_reports}        Get Study Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Report Status]   Generated
    Edit Report On      row=1
    Navigate To Event Tab      Event Report
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Be True    ${check_event_report}[PDF Viewer]
    Run Keyword And Continue On Failure     Should Be Equal   ${check_event_report}[Text Report]      Ready
    Run Keyword And Continue On Failure     Should Be Equal    ${check_event_report}[Text Dismiss]    Dismiss report
    Run Keyword And Continue On Failure     Should Be True    ${check_event_report}[Generate Report]
    Generate Event Report Data
    ${msg}      Get Toast Message
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        Generate Report Success
    ${status_report}    Check Generate Successful
    Run Keyword And Continue On Failure    Should Be True    ${status_report}
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    reports
    Filter Study Reports    by_report=Notification reports      text_search=${event_search}
    ${study_reports}        Get Study Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Report Status]   Generated

BFCC-QA-PROCESS-EVENT-REPORT-03: Upload an event report
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

    [Tags]      BFCC-QA-PROCESS-EVENT-REPORT-03        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-EVENT-REPORT-04: Set event report status to Ready
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

    [Tags]      BFCC-QA-PROCESS-EVENT-REPORT-04        auto
    [Setup]    Create Event Report Has The Status Is Generated
    Navigate to report screen has the notification reports with study id is "${study_id}"
    Filter Study Reports    text_search=${event_search}
    ${study_reports}        Get Study Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Report Status]   Generated
    Edit Report On      row=1
    Navigate To Event Tab      Event Report
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Be True    ${check_event_report}[PDF Viewer]
    Run Keyword And Continue On Failure     Should Be Equal   ${check_event_report}[Text Report]      Ready
    Run Keyword And Continue On Failure     Should Be Equal    ${check_event_report}[Text Dismiss]    Dismiss report
    Filter Event Report    priority=Low
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Not Be True    ${check_event_report}[Status Report]
    ${actual_event_report}         Get Study Overview
    Filter Event Report     is_click=${True}
    Navigate to report screen has the notification reports with study id is "${study_id}"
    Filter Study Reports      text_search=${event_search}
    ${study_reports}        Get Study Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Report Status]   Ready
    Navigate To Reports
    Filter Reports     report_state=Ready      report_type=Notification reports      by_assignee=All
    Filter Reports     search_by=Study ID    text_search=${study_id}
    ${expected_event_report}        Get Ready Notification Event Reports Detail
    ${event_id}                     Evaluate    [item['Event ID'] for item in ${expected_event_report}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${event_id}        ${event_search}

BFCC-QA-PROCESS-EVENT-REPORT-05: Send event report in the case the user does not assign the report to himself or herself
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The CCQA, QA Leader, Supervisor can send an event report
    ...
    ...     Precondition:
    ...     - The user is on Event Report tab of the Event Edit page
    ...     - Report status has been set to Ready
    ...     - Report has not yet assigned to anyone
    ...
    ...     Test Steps:
    ...     1. Click [Send] button
    ...     2. On confirmation dialog, click [Send] button
    ...     3. On confirmation dialog, click [Cancel] button
    ...
    ...     Expected Results:
    ...     1. A confirmation dialog with the following message: “This report is currently not assigned to anyone.
    ...     The task completion of sending this report will not be counted towards you.” shall be displayed:
    ...     - [Send] button
    ...     - [Cancel] button
    ...     2. The Report will be sent to the clinician inbox, it will be moved to the appropriate type of the report
    ...     tab on the INBOX page
    ...     - The report shall be sent and the task won’t be counted to the QA’s performance
    ...     - The report status will change from Ready to Sent
    ...     3. The dialog shall be closed

    [Tags]      BFCC-QA-PROCESS-EVENT-REPORT-05        auto
    [Setup]    Create Event Report Has The Status Is Ready
    Navigate To Report Screen Has The Notification Reports With Study Id Is "${study_id}"
    ${study_reports}        Get Study Reports
    ${report_status}        Evaluate    [item for item in ${study_reports} if item.get('Report Status') == 'Ready']
    Filter Study Reports    text_search=${event_search}
    ${study_reports}        Get Study Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Report Status]   Ready
    Edit Report On      row=1
    Navigate To Event Tab      Event Report
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Be True    ${check_event_report}[PDF Viewer]
    Run Keyword And Continue On Failure     Should Be Equal   ${check_event_report}[Text Report]      Send Report
    Run Keyword And Continue On Failure     Should Be Equal    ${check_event_report}[Text Dismiss]    Dismiss report
    Run Keyword And Continue On Failure     Should Not Be True    ${check_event_report}[Status Report]
    Filter Event Report     is_click=${True}
    ${msg}      Get Message Notice Assigned
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        This report is currently not assigned to anyone. The task completion of sending this report will not be counted towards you.
    Filter Event Report     is_cancel=${True}
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Be Equal   ${check_event_report}[Text Report]      Send Report
    Filter Event Report     is_click=${True}    is_send=${True}
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Be Equal   ${check_event_report}[Text Report]      Update Report
    Navigate To Report Screen Has The Notification Reports With Study Id Is "${study_id}"
    Filter Study Reports    text_search=${event_search}
    ${study_reports}        Get Study Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Report Status]   Sent

BFCC-QA-PROCESS-EVENT-REPORT-06: Send event report in the case the study has already been assigned to another QA user
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The CCQA, QA Leader, Supervisor can send an event report
    ...
    ...     Precondition:
    ...     - The user is on Event Report tab of the Event Edit page
    ...     - Report status has been set to Ready
    ...     - Report has been assigned to another QA user
    ...
    ...     Test Steps:
    ...     1. Click [Send] button
    ...     2. On confirmation dialog, click [Send] button
    ...     3. On confirmation dialog, click [Cancel] button
    ...
    ...     Expected Results:
    ...     1. A confirmation dialog with the following message: “This report is currently assigned to [QA Firstname] [QA Lastname]”
    ...     The task completion of sending this report will not be counted towards you.” shall be displayed:
    ...     - [Send] button
    ...     - [Cancel] button
    ...     2. The Report will be sent to the clinician inbox, it will be moved to the appropriate type of the report
    ...     tab on the INBOX page
    ...     - The report shall be sent and the task won’t be counted to the QA’s performance
    ...     - The report status will change from Ready to Sent
    ...     3. The dialog shall be closed

    [Tags]      BFCC-QA-PROCESS-EVENT-REPORT-06         manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Reports
#    Filter Reports    report_state=Pending      report_type=End of Use reports      search_by=Study ID     text_search=12489
#    Manage Pending Eou Reports On    row=1
#    Navigate To Study Management Type    reports
#    Filter Study Reports    by_report=Notification reports
#    ${study_reports}        Get Study Reports
#    ${report_status}        Evaluate    [item for item in ${study_reports} if item.get('Report Status') == 'Ready' and item.get('Assignee') != '']
#    ${report_id}            Evaluate    [item['Report ID'] for item in ${report_status}]
#    ${random_report_id}     Evaluate    random.choice(${report_id})    random
#    Filter Study Reports    text_search=${random_report_id}
#    ${study_reports}        Get Study Reports
#    ${assignee_name}             Set Variable    ${study_reports}[0][Assignee]
#    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Report Status]   Ready
#    Edit Report On      row=1
#    Navigate To Event Tab      Event Report
#    ${check_event_report}       Check Active Event Report Available
#    Run Keyword And Continue On Failure     Should Be True    ${check_event_report}[PDF Viewer]
#    Run Keyword And Continue On Failure     Should Be Equal   ${check_event_report}[Text Report]      Send
#    Run Keyword And Continue On Failure     Should Be Equal    ${check_event_report}[Text Dismiss]    Dismiss
#    Run Keyword And Continue On Failure     Should Be True    ${check_event_report}[Status Report]
#    Filter Event Report     is_click=${True}
#    ${msg}      Get Message Notice Assigned
#    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        This report is currently assigned to ${assignee_name}. The task completion of sending this report will not be counted towards you.
#    Filter Event Report     is_cancel=${True}
#    ${check_event_report}       Check Active Event Report Available
#    Run Keyword And Continue On Failure     Should Be Equal   ${check_event_report}[Text Report]      Send
#    Filter Event Report     is_click=${True}    is_send=${True}
#    ${check_event_report}       Check Active Event Report Available
#    Run Keyword And Continue On Failure     Should Be Equal   ${check_event_report}[Text Report]      Update
#    Navigate To Reports
#    Filter Reports    report_state=Pending      report_type=End of Use reports      search_by=Study ID     text_search=12489
#    Manage Pending Eou Reports On    row=1
#    Navigate To Study Management Type    reports
#    Filter Study Reports    by_report=Notification reports      text_search=${random_report_id}
#    ${study_reports}        Get Study Reports
#    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Report Status]        Sent
#    [Teardown]    Run Keyword    Back to event id "${random_report_id}" of study id "12489" original with report status is Ready

BFCC-QA-PROCESS-EVENT-REPORT-07: Send event report in the case the study has already been assigned to yourself
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The CCQA, QA Leader, Supervisor can send an event report
    ...
    ...     Precondition:
    ...     - The user is on Event Report tab of the Event Edit page
    ...     - Report status has been set to Ready
    ...     - Report has been assigned to yourself
    ...
    ...     Test Steps:
    ...     1. Click [Send] button
    ...
    ...     Expected Results:
    ...     1. The Report will be sent to the clinician inbox, it will be moved to the appropriate type of the report
    ...     tab on the INBOX page
    ...     - The report status will change from Ready to Sent

    [Tags]      BFCC-QA-PROCESS-EVENT-REPORT-07        auto
    [Setup]    Create Ready Notification Reports With Study Id Is "${STUDY_ID_ASSIGN}[study_id_1]"
    Assign Event Reports To You
    Navigate To Report Screen Has The Notification Reports With Study Id Is "${study_id}"
    ${study_reports}        Get Study Reports
    ${report_status}        Evaluate    [item for item in ${study_reports} if item.get('Report Status') == 'Ready' and item.get('Assignee') == 'You']
    Filter Study Reports    text_search=${event_search}
    ${study_reports}        Get Study Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Report Status]   Ready
    Edit Report On      row=1
    Navigate To Event Tab      Event Report
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Be True    ${check_event_report}[PDF Viewer]
    Run Keyword And Continue On Failure     Should Be Equal   ${check_event_report}[Text Report]      Send Report
    Run Keyword And Continue On Failure     Should Be Equal    ${check_event_report}[Text Dismiss]    Dismiss report
    Run Keyword And Continue On Failure     Should Not Be True    ${check_event_report}[Status Report]
    Filter Event Report     is_click=${True}
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Be Equal   ${check_event_report}[Text Report]      Update Report
    Navigate To Report Screen Has The Notification Reports With Study Id Is "${study_id}"
    Filter Study Reports      text_search=${event_search}
    ${study_reports}        Get Study Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Report Status]        Sent

BFCC-QA-PROCESS-EVENT-REPORT-08: Email an event report to clinic
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The CCQA, QA Leader, Supervisor can email an event report to clinic
    ...
    ...     Precondition:
    ...     - The user is on Event Report tab of the Event Edit page
    ...     - Report has been sent
    ...
    ...     Test Steps:
    ...     1. Click [Email] button
    ...     2. Fill out all information in the email dialog, then click [Send] button
    ...     3. In the email dialog, click [Exit] button
    ...
    ...     Expected Results:
    ...     1. The email dialog screen shall consist of the following components:
    ...     - To (text-field) - the notification clinic email/interpreting physician email shall be auto-filled. The field can be edited
    ...     - Subject (text-field) - this field shall be auto-filled and can be edited. It shall contain the following
    ...     example of the text: “[Priority] [Report type] for study [Study_ID]”
    ...     - Email’s text-editing toolbar
    ...     - The content shall contain the following template message:
    ...         “Hello,
    ...         This email is to inform you of [Report type] for study [Study_ID].
    ...         Please access the report via the link provided below:
    ...         [Report PDF Link]
    ...         We have also sent the report to your Bioflux Clinic’s portal inbox. Due to HIPAA, we are unable to
    ...         include the patient name associated with this study ID. Please let us know if you have any further questions.
    ...         Thank you!
    ...         [CC Initials]
    ...     - Send button and Exit (“X”) button
    ...     2. If the emailing process was successful, a message shall be displayed to the user “The report is emailed
    ...     to the clinic”:
    ...     - The last update of an email sent to the clinic shall be displayed next to the Email button
    ...     - Auto-log shall be logged in the study log
    ...     - The clinic shall receive the report an email with the attached link to the PDF format report
    ...     - If the emailing process was failed, an error message shall be displayed
    ...     3. The dialog shall be closed

    [Tags]      BFCC-QA-PROCESS-EVENT-REPORT-08        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-EVENT-REPORT-09: Auto-fax a report to the clinic
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The CCQA, QA Leader, Supervisor can auto-fax a report to the clinic
    ...
    ...     Precondition:
    ...     - The user is on Event Report tab of the Event Edit page
    ...     - Report status is Ready
    ...     - Auto-fax facility option was selected during the process of creating/editing a facility by the admin
    ...
    ...     Test Steps:
    ...     1. Click [Send] button
    ...
    ...     Expected Results:
    ...     1. The report shall be faxed automatically to the clinic
    ...     - The clinic shall receive the report with a cover page added.
    ...     - The cover page shall have the following information about the clinic:
    ...         - To: the name of the facility to be received the report
    ...         - ATTN: the name of the interpreting physician of the report
    ...         - Fax number: the fax number to which the report is sent

    [Tags]      BFCC-QA-PROCESS-EVENT-REPORT-09        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-EVENT-REPORT-10: Auto-fax a report to the physician
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The CCQA, QA Leader, Supervisor can auto-fax a report to the physician
    ...
    ...     Precondition:
    ...     - The user is on Event Report tab of the Event Edit page
    ...     - Report status is Ready
    ...     - Auto-fax physician option was selected during the process of creating/editing a facility by the admin
    ...
    ...     Test Steps:
    ...     1. Click [Send] button
    ...
    ...     Expected Results:
    ...     1. The report shall be faxed automatically to the physician
    ...     - The physician shall receive the report with a cover page added.
    ...     - The cover page shall have the following information about the clinic:
    ...         - To: the name of the facility to be received the report
    ...         - ATTN: the name of the interpreting physician of the report
    ...         - Fax number: the fax number to which the report is sent

    [Tags]      BFCC-QA-PROCESS-EVENT-REPORT-10        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-EVENT-REPORT-11: Manual fax a report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The CCQA, QA Leader, Supervisor can manual fax a report
    ...
    ...     Precondition:
    ...     - The user is on Event Report tab of the Event Edit page
    ...     - Report status is Ready or Sent
    ...
    ...     Test Steps:
    ...     1. Click [Fax] button
    ...     2. On dialog, select the desired fax numbers, then click [Fax report] button
    ...     3. On dialog, click [x] button
    ...
    ...     Expected Results:
    ...     1. A dialog shall be displayed with a list of fax numbers of either clinic or physician for the user to select
    ...     2. The report shall be faxed to the numbers selected
    ...     - If the faxing process was successful, a message should be displayed to the user “The report is faxed to clinic”
    ...     - If the faxing process was failed, an error message will be displayed
    ...     - The cover page shall have the following information about the clinic:
    ...         - To: the name of the facility to be received the report
    ...         - ATTN: the name of the interpreting physician of the report
    ...         - Fax number: the fax number to which the report is sent
    ...     3. The dialog shall be closed

    [Tags]      BFCC-QA-PROCESS-EVENT-REPORT-11        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-EVENT-REPORT-12: Recall an event report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The CCQA, QA Leader, Supervisor can recall an event report
    ...
    ...     Precondition:
    ...     - The user is on Event Report tab of the Event Edit page
    ...     - Report status is Sent
    ...
    ...     Test Steps:
    ...     1. Click [Recall] button
    ...
    ...     Expected Results:
    ...     1. The report will disappear from the clinician inbox
    ...     - Event reports shall be removed from the tab but not moved to any tabs on the REPORTS page
    ...     - The report status should be changed from Sent to Generated
    ...     - The Recall Report button or an icon will disappear
    ...     - An auto-log shall be created in the study log
    ...     - The system displays the pop-up notification when recalling successfully “Recall Report - Success“

    [Tags]      BFCC-QA-PROCESS-EVENT-REPORT-12        auto
    [Setup]    Navigate To Report Screen Has The Notification Reports
    ${study_reports}        Get Study Reports
    ${report_status}        Evaluate    [item for item in ${study_reports} if item.get('Report Status') == 'Sent']
    ${report_id}            Evaluate    [item['Report ID'] for item in ${report_status}]
    ${random_report_id}     Evaluate    random.choice(${report_id})    random
    Filter Study Reports    text_search=${random_report_id}
    Edit Report On      row=1
    Navigate To Event Tab      Event Report
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Be Equal   ${check_event_report}[Text Report]      Update Report
    Back To Event Original      is_recall=${True}
    Navigate To Report Screen Has The Notification Reports
    Filter Study Reports    text_search=${random_report_id}
    ${study_reports}        Get Study Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Report Status]   Generated

BFCC-QA-PROCESS-EVENT-REPORT-13: Dismiss an event report in the case the user does not assign the report to himself or herself
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The CCQA, QA Leader, Supervisor can dismiss an event report
    ...
    ...     Precondition:
    ...     - The user is on Event Report tab of the Event Edit page
    ...     - The report has not been sent
    ...     - Report has not yet assigned to anyone
    ...
    ...     Test Steps:
    ...     1. Click [Dismiss] button
    ...     2. On confirmation dialog, click [Dismiss] button
    ...     3. On confirmation dialog, click [Cancel] button
    ...
    ...     Expected Results:
    ...     1. A confirmation dialog with the following message: “This report is currently not assigned to anyone.
    ...     The task completion of sending this report will not be counted towards you.” shall be displayed:
    ...     - [Dismiss] button
    ...     - [Cancel] button
    ...     2. The dismissed report will be removed from any of the report tracking tabs
    ...     - The report shall be dismissed and the task won’t be counted to the QA’s performance
    ...     - The status of the report will be changed to Dismissed
    ...     - The Dismissed button will change to Reenable
    ...     - An auto-log shall be created in the study log
    ...     - The following message is displayed by the system when the report request is dismissed successfully: "This report is dismissed”
    ...     - An error message will be displayed by the system when the report request is dismissed unsuccessfully
    ...     3. The dialog shall be closed

    [Tags]      BFCC-QA-PROCESS-EVENT-REPORT-13        auto
    [Setup]    Create Event Report Has The Status Is Generated
    Navigate to report screen has the notification reports with study id is "${study_id}"
    ${study_reports}        Get Study Reports
    ${report_status}        Evaluate    [item for item in ${study_reports} if item.get('Report Status') != 'Sent' and item.get('Assignee') == '']
    Filter Study Reports    text_search=${event_search}
    ${study_reports}        Get Study Reports
    Run Keyword And Continue On Failure    Should Not Be Equal    ${study_reports}[0][Report Status]   Sent
    Edit Report On      row=1
    Navigate To Event Tab      Event Report
    Check Dismissed Event
    Navigate to report screen has the notification reports with study id is "${study_id}"
    Filter Study Reports    text_search=${event_search}
    ${study_reports}        Get Study Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Report Status]   Dismissed
    Edit Report On      row=1
    Navigate To Event Tab      Event Report
    Filter Event Report         is_dismiss=${True}

BFCC-QA-PROCESS-EVENT-REPORT-14: Dismiss an event report in the case the study has already been assigned to another QA user
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The CCQA, QA Leader, Supervisor can dismiss an event report
    ...
    ...     Precondition:
    ...     - The user is on Event Report tab of the Event Edit page
    ...     - The report has not been sent
    ...     - Report has been assigned to another QA user
    ...
    ...     Test Steps:
    ...     1. Click [Dismiss] button
    ...     2. On confirmation dialog, click [Dismiss] button
    ...     3. On confirmation dialog, click [Cancel] button
    ...
    ...     Expected Results:
    ...     1. A confirmation dialog with the following message: “This report is currently assigned to [QA Firstname] [QA Lastname]”
    ...     The task completion of sending this report will not be counted towards you.” shall be displayed:
    ...     - [Dismiss] button
    ...     - [Cancel] button
    ...     2. The dismissed report will be removed from any of the report tracking tabs
    ...     - The report shall be dismissed and the task won’t be counted to the QA’s performance
    ...     - The status of the report will be changed to Dismissed
    ...     - The Dismissed button will change to Reenable
    ...     - An auto-log shall be created in the study log
    ...     - The following message is displayed by the system when the report request is dismissed successfully: "This report is dismissed”
    ...     - An error message will be displayed by the system when the report request is dismissed unsuccessfully
    ...     3. The dialog shall be closed

    [Tags]      BFCC-QA-PROCESS-EVENT-REPORT-14         manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Reports
#    Filter Reports    report_state=Pending      report_type=End of Use reports      search_by=Study ID     text_search=12489
#    Manage Pending Eou Reports On    row=1
#    Navigate To Study Management Type    reports
#    Filter Study Reports    by_report=Notification reports
#    ${study_reports}        Get Study Reports
#    ${report_status}        Evaluate    [item for item in ${study_reports} if item.get('Report Status') != 'Sent' and item.get('Assignee') != '']
#    ${report_id}            Evaluate    [item['Report ID'] for item in ${report_status}]
#    ${random_report_id}     Evaluate    random.choice(${report_id})    random
#    Filter Study Reports    text_search=${random_report_id}
#    ${study_reports}        Get Study Reports
#    ${assignee_name}             Set Variable    ${study_reports}[0][Assignee]
#    Edit Report On      row=1
#    Navigate To Event Tab      Event Report
#    ${check_event_report}       Check Active Event Report Available
#    Run Keyword And Continue On Failure     Should Be True    ${check_event_report}[PDF Viewer]
#    Run Keyword And Continue On Failure     Should Be Equal    ${check_event_report}[Text Dismiss]    Dismiss
#    Run Keyword And Continue On Failure     Should Be True    ${check_event_report}[Status Report]
#    Filter Event Report     is_dismiss=${True}
#    ${msg}      Get Message Notice Assigned
#    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        This report is currently assigned to ${assignee_name}. The task completion of dismissing this report will not be counted towards you.
#    Filter Event Report     is_cancel=${True}
#    ${check_event_report}       Check Active Event Report Available
#    Run Keyword And Continue On Failure     Should Be Equal   ${check_event_report}[Text Dismiss]    Dismiss
#    Filter Event Report     is_dismiss=${True}    is_send=${True}
#    ${check_event_report}       Check Active Event Report Available
#    Run Keyword And Continue On Failure     Should Be Equal   ${check_event_report}[Text Dismiss]    Reenable
#    ${msg_dismissed}        Get Message Report Dismissed
#    Run Keyword And Continue On Failure     Should Be Equal   ${msg_dismissed}    The report has been dismissed
#    Navigate To Reports
#    Filter Reports    report_state=Pending      report_type=End of Use reports      search_by=Study ID     text_search=12489
#    Manage Pending Eou Reports On    row=1
#    Navigate To Study Management Type    reports
#    Filter Study Reports    by_report=Notification reports      text_search=${random_report_id}
#    ${study_reports}        Get Study Reports
#    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Report Status]   Dismissed
#    [Teardown]    Run Keyword    Back to event id "${random_report_id}" of study id "12489" original with report status is dismissed

BFCC-QA-PROCESS-EVENT-REPORT-15: Dismiss an event report in the case the study has already been assigned to yourself
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The CCQA, QA Leader, Supervisor can dismiss an event report
    ...
    ...     Precondition:
    ...     - The user is on Event Report tab of the Event Edit page
    ...     - The report has not been sent
    ...     - Report has been assigned to yourself
    ...
    ...     Test Steps:
    ...     1. Click [Dismiss] button
    ...
    ...     Expected Results:
    ...     1. The dismissed report will be removed from any of the report tracking tabs
    ...     - The report shall be dismissed and the task won’t be counted to the QA’s performance
    ...     - The status of the report will be changed to Dismissed
    ...     - The Dismissed button will change to Reenable
    ...     - The following message is displayed by the system when the report request is dismissed successfully: "This report is dismissed”
    ...     - An error message will be displayed by the system when the report request is dismissed unsuccessfully

    [Tags]      BFCC-QA-PROCESS-EVENT-REPORT-15        auto
    Create Ready Notification Reports With Study Id Is "${STUDY_ID_ASSIGN}[study_id_1]"
    Navigate to report screen has the notification reports with study id is "${study_id}"
    Filter Study Reports    text_search=${event_search}
    ${study_reports}        Get Study Reports
    Run Keyword And Continue On Failure    Should Not Be Equal    ${study_reports}[0][Report Status]   Sent
    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Assignee]       You
    Edit Report On      row=1
    Navigate To Event Tab      Event Report
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Be True    ${check_event_report}[PDF Viewer]
    Run Keyword And Continue On Failure     Should Be Equal    ${check_event_report}[Text Dismiss]    Dismiss report
    Filter Event Report     is_dismiss=${True}
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Be Equal   ${check_event_report}[Text Dismiss]    Reenable
    ${msg_dismissed}        Get Message Report Dismissed
    Run Keyword And Continue On Failure     Should Be Equal   ${msg_dismissed}    The report has been dismissed
    Navigate To Report Screen Has The Notification Reports With Study Id Is "${study_id}"
    Filter Study Reports    text_search=${event_search}
    ${study_reports}        Get Study Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Report Status]   Dismissed
    Edit Report On      row=1
    Navigate To Event Tab      Event Report
    Filter Event Report         is_dismiss=${True}

#BFCC-QA-PROCESS-EVENT-REPORT-16: Re-enable an event report
#    [Documentation]     Author: Nhan Nguyen
#    ...
#    ...     Description: The CCQA, QA Leader, Supervisor can re-enable an event report
#    ...
#    ...     Precondition:
#    ...     - The user is on Event Report tab of the Event Edit page
#    ...     - The report is in the Dismissed status
#    ...
#    ...     Test Steps:
#    ...     1. Click [Reenable] button
#    ...
#    ...     Expected Results:
#    ...     1. The status of the report shall be changed to Not Generated
#    ...     - An auto-log shall be created in the study log
#    ...     - The following message is displayed by the system when the report request is successfully reenabled:
#    ...     "The report has been successfully re-enabled."
#    ...     - An error message will be displayed by the system when the report request is reenabled unsuccessfully
#
#    [Tags]      BFCC-QA-PROCESS-EVENT-REPORT-16        manual
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-EVENT-REPORT-17: Download event report
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

    [Tags]      BFCC-QA-PROCESS-EVENT-REPORT-17        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-EVENT-REPORT-18: Details of Event Report
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

    [Tags]      BFCC-QA-PROCESS-EVENT-REPORT-18        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-EVENT-DETAILS-22: Edit technician comments
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
    ...     - Technician comments must appear in the event report at the TECHNICIAN COMMENTS section

    [Tags]      BFCC-QA-PROCESS-EVENT-DETAILS-22       auto
    Navigate To Event Details
    Add Technician Comments         When input more than 520 characters the portal will display the following message "Exceeded maximum of 520 characters in Technician Comments" Technician comments must appear in the event report at the TECHNICIAN COMMENTS section. When input more than 520 characters the portal will display the following message "Exceeded maximum of 520 characters in Technician Comments" Technician comments must appear in the event report at the TECHNICIAN COMMENTS section. When input more than 520 characters the portal will display
    ${expected_technician_comments}   Get Current Technician Comment
    Edit Event Tag    is_save=${True}
    Refresh Page
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies    search_by=Study ID         text_search=${study_id}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    events
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab      Event Details
    ${actual_technician_comments}   Get Current Technician Comment
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_technician_comments}      ${expected_technician_comments}
    Clear Technician Comments
    Edit Event Tag    is_save=${True}
    ${clear_technician_comment}   Get Current Technician Comment
    Run Keyword And Continue On Failure    Should Be Empty    ${clear_technician_comment}

BFCC-QA-PROCESS-EVENT-DETAILS-23: Verify UI for the Event Information in "Event Details" screen
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Verify UI for the Event Information in "Event Details" screen
    ...
    ...     Precondition:
    ...     - The user is on the Event Details tab of the Event Edit page
    ...     - Event type is manual
    ...
    ...     Test Steps:
    ...     1.  Navigate to "Event Details" screen
    ...     2. Observe Event Information section
    ...
    ...     Expected Results:
    ...     2. The following information displayed:
    ...     - Symptoms: The patient’s symptoms, only exist when the type of event is Manual
    ...     - Device ID
    ...     - Trigger time
    ...     - Upload Time
    ...     - First Opened
    ...     - Closed Time
    ...
    ...     **Others**
    ...     Create date: 11/23/2023
    ...     Author: Thang Tran
    ...     Last update:
    ...
    [Tags]      BFCC-QA-PROCESS-EVENT-DETAILS-23       auto
    Navigate To Event Detail With Event Type Is "Manual"
    Switch Tab
    Navigate To Event Tab      Event Details
    ${event_details}    Get Event Details
    ${actual_event_infor}     Evaluate    [k for k, v in ${event_details}[EVENT INFORMATION].items()]
    ${expected_event_infor}     Create List    Symptoms     Device ID   Trigger Time    Upload Time    First Opened      Closed Time
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${actual_event_infor}       ${expected_event_infor}
    ${event_infor}     Evaluate    {k: v for k, v in ${event_details}[EVENT INFORMATION].items()}
    Run Keyword And Continue On Failure    Should Not Be Equal    ${event_infor}[Symptoms]      --

BFCC-QA-PROCESS-EVENT-DETAILS-24: Verify UI for the Event Information in "Event Details" screen
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Verify UI for the Event Information in "Event Details" screen
    ...
    ...     Precondition:
    ...     - The user is on the Event Details tab of the Event Edit page
    ...     - Event type is Brady, Tachy, AFib, Pause, Auto, Sinus
    ...
    ...     Test Steps:
    ...     1.  Navigate to "Event Details" screen
    ...     2. Observe Event Information section
    ...
    ...     Expected Results:
    ...     2. The following information displayed:
    ...     - Symptoms: The patient’s symptoms, only exist when the type of event is Manual
    ...     - Device ID
    ...     - Trigger time
    ...     - Upload Time
    ...     - First Opened
    ...     - Closed Time
    ...
    ...     **Others**
    ...     Create date: 11/23/2023
    ...     Author: Thang Tran
    ...     Last update:
    ...
    [Tags]      BFCC-QA-PROCESS-EVENT-DETAILS-24       auto
    [Template]  Check Event Information With Event Type
    Brady
    Tachy
    AFib
    Pause
    Auto
    Sinus

BFCC-QA-PROCESS-EVENT-REPORT-19: Regenerate event report with report status is ready
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can regenerate an event report of a Valid event
    ...
    ...     Precondition:
    ...     - The user is on Event Report tab of the Event Edit page
    ...     - The PDF files of the reports are already generated
    ...     - The reports is Ready
    ...
    ...     Test Steps:
    ...     1. Observe [Generate Report] button
    ...     2. Click [Generate Report] button
    ...
    ...     Expected Results:
    ...     1. The [Generate Report] button is clickable
    ...     2. The system will regenerate the event report:
    ...     - After the PDF file has been re-generated, the report status should remain the same as “Send“; and the status should remain the same as “Ready“
    ...     - If the report generation process succeeds, a message shall be displayed on the screen saying:
    ...     “Generate Report Success“
    ...     - If the report was generated unsuccessfully, an error message will be displayed

    [Tags]      BFCC-QA-PROCESS-EVENT-REPORT-19        auto
    [Setup]     Create Event Report Has The Status Is Ready
    Navigate To Report Screen Has The Notification Reports With Study Id Is "${study_id}"
    ${study_reports}        Get Study Reports
    ${report_status}        Evaluate    [item for item in ${study_reports} if item.get('Report Status') == 'Ready']
    Filter Study Reports    text_search=${event_search}
    ${study_reports}        Get Study Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Report Status]   Ready
    Edit Report On      row=1
    Navigate To Event Tab      Event Report
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Be True    ${check_event_report}[PDF Viewer]
    Run Keyword And Continue On Failure     Should Be Equal   ${check_event_report}[Text Report]      Send Report
    Run Keyword And Continue On Failure     Should Be Equal    ${check_event_report}[Text Dismiss]    Dismiss report
    Run Keyword And Continue On Failure     Should Be True    ${check_event_report}[Generate Report]
    Generate Event Report Data
    ${status_report}    Check Generate Successful
    Run Keyword And Continue On Failure    Should Be True    ${status_report}
    Navigate To Report Screen Has The Notification Reports With Study Id Is "${study_id}"
    Filter Study Reports    text_search=${event_search}
    ${study_reports}        Get Study Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Report Status]   Ready

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
    ${STUDY_ID_COMPELTED}   Set Variable        ${STUDY_ID}[study_id_completed][study_id_11]
    ${CURRENT_USER}         Set Variable        ${USERS}[callcenter_qa]
    ${STUDY_ID_ASSIGN}      Set Variable        ${STUDY_ID}[study_id_completed]
    ${RELEASE_VERSION}      Navigate To Callcenter Sign In Page
    ${TOKEN}                Sign In Callcenter  ${CURRENT_USER}[username]      ${CURRENT_USER}[password]
    Set Global Variable     ${STUDY_ID_COMPELTED}
    Set Suite Variable      ${TOKEN}
    Set Global Variable     ${STUDY_ID_ASSIGN}
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

Check event information with event type
    [Arguments]    ${event_type}
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${STUDY_ID_COMPELTED}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    events
    Filter Study Events    by_type=${event_type}
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab      Event Details
    ${event_details}    Get Event Details
    ${actual_event_infor}     Evaluate    [k for k, v in ${event_details}[EVENT INFORMATION].items()]
    ${expected_event_infor}     Create List    Symptoms     Device ID   Trigger Time    Upload Time    First Opened      Closed Time
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${actual_event_infor}       ${expected_event_infor}
    ${event_infor}     Evaluate    {k: v for k, v in ${event_details}[EVENT INFORMATION].items()}
    Run Keyword And Continue On Failure    Should Be Equal    ${event_infor}[Symptoms]      --

Back to event id "${event_id}" of study id "${study_id}" original with report status is Ready
    Navigate To Reports
    Filter Reports    report_state=Pending      report_type=End of Use reports      search_by=Study ID     text_search=${study_id}
    Manage Pending Eou Reports On    row=1
    Navigate To Study Management Type    reports
    Filter Study Reports    by_report=Notification reports      text_search=${event_id}
    Edit Report On      row=1
    Navigate To Event Tab      Event Report
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Be Equal   ${check_event_report}[Text Report]      Update
    Back To Event Original      is_recall=${True}       is_click=${True}
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Be Equal   ${check_event_report}[Text Report]      Send

Back to event id "${event_id}" of study id "${study_id}" original with report status is dismissed
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    reports
    Filter Study Reports    by_report=Notification reports      text_search=${event_id}
    Edit Report On      row=1
    Navigate To Event Tab      Event Report
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Be Equal   ${check_event_report}[Text Dismiss]      Reenable
    Filter Event Report    is_dismiss=${True}
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Be Equal   ${check_event_report}[Text Dismiss]      Dismiss
    Generate Event Report Data
    ${msg}      Get Toast Message
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        Generate Report Success
    ${status_report}    Check Generate Successful
    Run Keyword And Continue On Failure    Should Be True    ${status_report}

Back to event type original with type is "${event_type}"
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab      Event Details
    Edit Event Details    event_type=${event_type}

Navigate to event detail with event type is "${item_event}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${STUDY_ID_COMPELTED}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    events
    Filter Study Events    by_type=${item_event}
    Edit Study Event On        row=1

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
    Set Global Variable   ${study_id}

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

Create event report has the status is Ready
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
    Create Event Reports With Status Is Ready
    Set Global Variable     ${event_search}
    Set Global Variable     ${study_id}

Create event report has the status is Dismissed
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Manage Complete Study On    row=7
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

Navigate to report screen has the notification reports
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${STUDY_ID_COMPELTED}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    reports
    Filter Study Reports    by_report=Notification reports

Navigate to report screen has the notification reports with study id is "${study_id}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    reports
    Filter Study Reports    by_report=Notification reports

Create event report assign to you
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${STUDY_ID_ASSIGN}
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
    Assign Event Reports To You
    Set Global Variable     ${event_search}
    Set Global Variable     ${study_id}

Check dismissed event
    ${event_header}       Get Event Summary
    ${study_id}         Set Variable    ${event_header}[STUDY ID]
    Generate Event Report Data
    ${status_report}    Check Generate Successful
    Run Keyword And Continue On Failure    Should Be True    ${status_report}
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Be True    ${check_event_report}[PDF Viewer]
    Run Keyword And Continue On Failure     Should Be Equal    ${check_event_report}[Text Dismiss]    Dismiss
    Filter Event Report     is_dismiss=${True}
    ${msg}      Get Message Notice Assigned
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        This report is currently not assigned to anyone. The task completion of dismissing this report will not be counted towards you.
    Filter Event Report     is_cancel=${True}
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Be Equal   ${check_event_report}[Text Dismiss]    Dismiss
    Filter Event Report     is_dismiss=${True}    is_dismiss_submit=${True}
    ${check_event_report}       Check Active Event Report Available
    Run Keyword And Continue On Failure     Should Be Equal   ${check_event_report}[Text Dismiss]    Reenable
    ${msg_dismissed}        Get Message Report Dismissed
    Run Keyword And Continue On Failure     Should Be Equal   ${msg_dismissed}    The report has been dismissed

Create ready notification reports with study id is "${study_id}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id}
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
