*** Settings ***
Documentation   Test Suite - Call Center Technician Portal - Events page
Metadata    sid     BFCC-TECH-EVENTS
Metadata    owner   Nhan Nguyen
Library     Collections
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_callcenter_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_callcenter_portal/lib/web/Common.py
Library     project_bioflux_callcenter_portal/lib/web/Events.py
Library     project_bioflux_callcenter_portal/lib/web/EventDetails.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BFCC-TECH-EVENTS      web
Test Timeout    1h

*** Test Cases ***
BFCC-TECH-EVENTS-NONVIABLE-VIEW-01: View the list without starting the event processing
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list when no start event processing
    ...
    ...     Precondition:
    ...     -   The CCT has logged in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click on Events page >> Open tab >> Non-viable subtab
    ...     - 2. Observe the page
    ...
    ...     Expected Results:
    ...     - -   This tab displays events in the Non-viable subtab in Open status
    ...     - -   The total number of Open events is shown on the tab header
    ...     - -   The total number of Non-viable event is shown on the subtab header
    ...     - -   There is a Search icon
    ...     - -   The message: "Press the button below to start processing events" shall be displayed and there shall be
    ...     a “Start Event Processing” button by default
    ...     - -   “More option” button: The user shall view the events in either two columns or one column.
    ...     The default view shall be two columns

    [Tags]      BFCC-TECH-EVENTS-NONVIABLE-VIEW-01      auto
    #  ****Need prepare multiple open events and events bucket before test
    Navigate To Events
    Navigate To Event Menu    Open
    ${events}           Get Open Events
    ${is_starting}      Run Keyword And Return Status    Should Not Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If      '${is_starting}' == '${True}'    Stop Open Event Processing      # Stop event processing if it is starting
    ${event_tab}        Get Current Event State
    ${event_bucket}     Get Current Event Bucket
    Run Keyword And Continue On Failure    Should Contain    ${event_tab}           Open
    Run Keyword And Continue On Failure    Should Contain    ${event_bucket}        Non-viable
    ${open_event_number}        Evaluate   '${event_tab}'.split()[-1]
    ${event_bucket_number}      Evaluate   '${event_bucket}'.split()[-1]
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${open_event_number}          ${open_event_number}
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${event_bucket_number}        ${event_bucket_number}
    # Search icon
    ${search_icon}        Check Open Event Items Available        Search icon
    Run Keyword And Continue On Failure    Should Be Equal    ${search_icon}[Search icon]     ${True}
    # Message
    ${msg}      Get Open Events
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}      Press the button below to start processing events
    # Start event processing
    Start Open Event Processing
    ${load_more_button}    Check Open Event Items Available        Load more
    Run Keyword And Continue On Failure    Should Be Equal    ${load_more_button}[Load more]     ${True}
    # Event Colum
    ${event_columns}        Get Event Columns
    Run Keyword And Continue On Failure    Should Be Equal    ${event_columns}      Two Columns     # Two Columns is default
    Filter Events    by_layout=One Column
    ${event_columns}        Get Event Columns
    Run Keyword And Continue On Failure    Should Be Equal    ${event_columns}      One Column

BFCC-TECH-EVENTS-NONVIABLE-VIEW-02: View the list when starting the event processing
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list when the user has started event processing
    ...
    ...     Precondition:
    ...     - The CCT has logged in to the portal
    ...     - Have events that do not belong to Viable, Sinus, Sinus Tachy, Sinus Brady, Pause, or Priority sub-tab
    ...     - No one is processing the event to make sure that having event for the user to process
    ...
    ...     Test Steps:
    ...     - 1. Click on Events page >> Open tab >> Non-viable subtab
    ...     - 2. Click "Start Event Processing" button and observe the page
    ...
    ...     Expected Results:
    ...     - 1. This tab displays events in the Non-viable subtab in Open status
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Non-viable event is shown on the subtab header
    ...     -   There is a Search icon
    ...     -   The message: "Press the button below to start processing events" shall be displayed and there shall be
    ...     a “Start Event Processing” button by default
    ...     -   “More option” button: The user shall view the events in either two columns or one column.
    ...     The default view shall be two columns
    ...     - 2. The system will load 10 events onto the page for the user to process
    ...     - Each event card shall display the following information/UI components:
    ...         -   Study ID (Quick access hyperlink for Study Information)
    ...         -   Event ID
    ...         -   Avatar: Avatar of the Call Center users shall be displayed on the event card when they are editing
    ...     an event. Avatar of the Call Center users shall be hidden when the user hovers over the event card
    ...         -   Strip images
    ...         -   Event type: Manual or Auto
    ...         -   AI suggests
    ...         -   Open new tab Button
    ...         -   Move button
    ...     - There shall be a "Load more" button at the end of the list
    ...     - "Stop processing" button
    ...     - “Close all” icon/button

    [Tags]      BFCC-TECH-EVENTS-NONVIABLE-VIEW-02      auto
    Navigate To Events
    Navigate To Event Menu    Open
    ${events}           Get Open Events
    ${is_starting}      Run Keyword And Return Status    Should Not Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If      '${is_starting}' == '${True}'    Stop Open Event Processing      # Stop event processing if it is starting
    ${event_tab}        Get Current Event State
    ${event_bucket}     Get Current Event Bucket
    Run Keyword And Continue On Failure    Should Contain    ${event_tab}           Open
    Run Keyword And Continue On Failure    Should Contain    ${event_bucket}        Non-viable
    ${open_event_number}        Evaluate   '${event_tab}'.split()[-1]
    ${event_bucket_number}      Evaluate   '${event_bucket}'.split()[-1]
    # Verify event state and bucket contains number
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${open_event_number}          ${open_event_number}
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${event_bucket_number}        ${event_bucket_number}
    ${search_icon}        Check Open Event Items Available      Search icon
    Run Keyword And Continue On Failure    Should Be Equal    ${search_icon}[Search icon]     ${True}
    # Start event processing
    Start Open Event Processing
    ${events}           Get Open Events
    # Event items size/page
    Run Keyword And Continue On Failure    Length Should Be    ${events}        10
    # items header
    ${event_info}       Evaluate           [header for header, content in ${events}[0].items()]
    ${expected_info}        Create List    Study ID     Event ID     AI suggest     Event Type     Strip Image
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_info}       ${expected_info}
    # check Load more button
    ${attribute}        Check Open Event Items Available       Load more, Close all
    Run Keyword And Continue On Failure    Should Be Equal    ${attribute}[Load more]       ${True}
    # check close all button
    Run Keyword And Continue On Failure    Should Be Equal    ${attribute}[Close all]       ${True}

BFCC-TECH-EVENTS-NONVIABLE-VIEW-03: View the list when having no event in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list when having no event in the system
    ...
    ...     Precondition:
    ...     - The CCT has logged in to the portal
    ...     - No events in Non-viable tab
    ...
    ...     Test Steps:
    ...     - 1. Click on Events page >> Open tab >> Non-viable subtab
    ...     - 2. Observe the page
    ...
    ...     Expected Results:
    ...     - -   The total number of Open events is shown on the tab header
    ...     - -   The total number of Non-viable event (0 event) is shown on the subtab header
    ...     - -   There is a Search icon (unclickable)
    ...     - -   The “Start Event Processing” button shall be hidden
    ...     - -   “More option” button (unclickable)

    [Tags]      BFCC-TECH-EVENTS-NONVIABLE-VIEW-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-NONVIABLE-VIEW-04: View the list when all events have been distributed to other users
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list when all events have been distributed to other users
    ...
    ...     Precondition:
    ...     - The CCT has logged in to the portal
    ...     - All events in Non-viable tab have been distributed to other users
    ...
    ...     Test Steps:
    ...     - 1. Click on Events page >> Open tab >> Non-viable subtab
    ...     - 2. Click "Start Event Processing" and observe the page
    ...
    ...     Expected Results:
    ...     - -   The total number of Open events is shown on the tab header
    ...     - -   The total number of Non-viable event is shown on the subtab header
    ...     - -   There is a Search icon (unclickable)
    ...     - -   A message stating: “No more event for you to process at this time.” shall be displayed on the screen
    ...     - -   “More option” button (unclickable)

    [Tags]      BFCC-TECH-EVENTS-NONVIABLE-VIEW-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-NONVIABLE-VIEW-04-CP2.16.7: View the list of closed events in Closed tab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user has started event processing in Open >> Non-viable tab
    ...
    ...     Test Steps:
    ...     - 1. Click [Closed] tab
    ...     - 2. Observe the closed event list
    ...
    ...     Expected Results:
    ...     - Closed Non-viable bucket shall display events that are closed by the user
    ...
    ...     **Others**
    ...     - Updated date: 9/12/2023 - Nhan Nguyen

    [Tags]      BFCC-TECH-EVENTS-NONVIABLE-VIEW-04-CP2.16.7       manual    CP-2.16.7
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-NONVIABLE-STOP-01: Stop event processing
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can stop event processing on Nonviable Events subtab
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Click [Stop Processing] button
    ...
    ...     Expected Results:
    ...     -   All events shall be hidden

    [Tags]      BFCC-TECH-EVENTS-NONVIABLE-STOP-01      auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Non-viable
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Should Not Be Empty    ${events}     No event found
    # Stop event processing
    Stop Open Event Processing
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Should Be Equal    ${events}     Press the button below to start processing events

BFCC-TECH-EVENTS-NONVIABLE-CLOSE-01: Close all events
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can close all loaded events
    ...
    ...     Precondition:
    ...     - The CCT has already start event processing
    ...
    ...     Test Steps:
    ...     - 1. Open an event in a new tab
    ...     - 2. Click [Close all] button
    ...     - 3. Check status of event in step 1 (including validity and close status)
    ...
    ...     Expected Results:
    ...     -   All events shall be closed as invalid

    [Tags]      BFCC-TECH-EVENTS-NONVIABLE-CLOSE-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-NONVIABLE-CLOSE-02: Cannot close all events that has been editing/viewing by other users
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Cannot close all events that has been editing/viewing by other users
    ...
    ...     Precondition:
    ...     - The CCT has already start event processing
    ...
    ...     Test Steps:
    ...     - 1. Other users [User 2] - Go to Event details page of an event that is being processed by this user [User 1]
    ...     - 2. [User 1] - Click [Close all] button
    ...     - 3. [User 1] - Check event list
    ...
    ...     Expected Results:
    ...     -   All events shall be closed as invalid except event is being edited/viewed by [User 2]

    [Tags]      BFCC-TECH-EVENTS-NONVIABLE-CLOSE-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-NONVIABLE-ECG-01: View full ECG strip
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view full ECG strip
    ...
    ...     Precondition:
    ...     - The CCT has already start event processing
    ...
    ...     Test Steps:
    ...     - 1. Hover over the strip image of the event card and click on it
    ...
    ...     Expected Results:
    ...     -   The Open new tab button shall also be displayed on the right corner of the screen,
    ...     next to the Close button
    ...     -   Each image presents 10-second data. The user shall scroll down or up to view other strips
    ...     in the zoomed-in version

    [Tags]      BFCC-TECH-EVENTS-NONVIABLE-ECG-01        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-NONVIABLE-OPEN-01: Open event in a new tab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can open event in a new tab
    ...
    ...     Precondition:
    ...     - The CCT has already start event processing
    ...
    ...     Test Steps:
    ...     - 1. In each event card, click [Open in a new tab] icon
    ...     - 2. In zoom-in mode, click [Open] button
    ...
    ...     Expected Results:
    ...     -   The user shall be navigated to Event Details page

    [Tags]      BFCC-TECH-EVENTS-NONVIABLE-OPEN-01      auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Non-viable
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}        Get Open Events
    View Open Events Details On    row=1        # First event
    ${page_header}          Get Current Page Header
    ${event_summary}        Get Event Summary
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}        EVENT
    Run Keyword And Continue On Failure    Should Be Equal    ${events}[0][Study ID]     ${event_summary}[STUDY ID]
    Run Keyword And Continue On Failure    Should Be Equal    ${events}[0][Event ID]     ${event_summary}[EVENT ID]

BFCC-TECH-EVENTS-NONVIABLE-MOVE-01: Move event to Viable subtab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can move event to Viable subtab
    ...
    ...     Precondition:
    ...     - The CCT has already start event processing
    ...
    ...     Test Steps:
    ...     - 1. Hover over the strip image of the event card and click [Move] button (take note study ID and event ID)
    ...     - 2. Switch to "Viable" tab and search by study ID took note in step 1
    ...
    ...     Expected Results:
    ...     -   The event shall be moved to the Viable subtab

    [Tags]      BFCC-TECH-EVENTS-NONVIABLE-MOVE-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-NONVIABLE-SEARCH-01: Search for event list by study ID in Open tab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for event list by study ID
    ...
    ...     Precondition:
    ...     - The CCT has already start event processing
    ...
    ...     Test Steps:
    ...     - 1. Input a study ID into the search bar, then press Enter key to search
    ...     - 2. Click [x] button next to [Stop Processing] button
    ...
    ...     Expected Results:
    ...     1. The system shall filter and display the result accordingly with the search value
    ...     2. Exit search mode

    [Tags]      BFCC-TECH-EVENTS-NONVIABLE-SEARCH-01        auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Non-viable
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}    Get Open Events
    ${text}      Set Variable    ${events}[0][Study ID]
    Filter Events    text_search=${text}
    ${events}    Get Open Events
    Run Keyword And Continue On Failure    Should Not Be Empty    ${events}     No event found - with text search ${text}
    Run Keyword And Continue On Failure    Should Be True         all('${text}' == event['Study ID'] for event in ${events})
    Filter Events       exit_search_mode=${True}
    ${search_bar}       Check Open Event Items Available        search bar
    Run Keyword And Continue On Failure    Should Be Equal    ${search_bar}[search bar]    ${False}

BFCC-TECH-EVENTS-NONVIABLE-SEARCH-01-CP2.16.7: Search for event list by study ID in Closed tab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for event list by study ID
    ...
    ...     Precondition:
    ...     - The CCT has already start event processing on Open tab
    ...
    ...     Test Steps:
    ...     - 1. Input a study ID into the search bar, then press Enter key to search
    ...
    ...     Expected Results:
    ...     1. The system shall filter and display the result accordingly with the search value
    ...     2. The search result only display the closed events by the user
    ...
    ...     **Others**
    ...     - Updated date: 9/12/2023 - Nhan Nguyen

    [Tags]      BFCC-TECH-EVENTS-NONVIABLE-SEARCH-01-CP2.16.7      manual   CP-2.16.7
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-NONVIABLE-LOADMORE-01: Load more events
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can load more events
    ...
    ...     Precondition:
    ...     - The CCT has already start event processing
    ...
    ...     Test Steps:
    ...     - 1. Scroll to the end of the list
    ...     - 2. Click [Load more] button
    ...
    ...     Expected Results:
    ...     -   The system shall load 10 events at a time
    ...     -   There are no more events to load, a message saying: “No more events available” shall be displayed

    [Tags]      BFCC-TECH-EVENTS-NONVIABLE-LOADMORE-01      auto
    # Required data > 20 events
    Navigate To Events
    Navigate To Event Menu    Open
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Length Should Be    ${events}      10
    # Load more
    Load More Open Events
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Length Should Be    ${events}      20

BFCC-TECH-EVENTS-NONVIABLE-QUICKACCESS-01: Quick access to study information
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can quick access to study information
    ...
    ...     Precondition:
    ...     - The CCT has already start event processing
    ...
    ...     Test Steps:
    ...     - 1. Click [Study ID] hyperlink
    ...
    ...     Expected Results:
    ...     The Study Information sidebar displays the following information:
    ...     - 1.  Study Information:  In the case a study has been canceled, a message stating: “ This study has been
    ...     aborted and will not be counted toward your billing.” shall be displayed on top of the Study Information section
    ...         -   Study status
    ...         -   Start time
    ...         -   End time
    ...         -   Study type
    ...         -   Patient return visit date
    ...         -   Device ID: If the device is an End-of-life device, there shall be an EOL tag next to the device ID
    ...         -   Study duration
    ...         -   Facility
    ...         -   Total artifact percentage - Flagged issue tag
    ...     - 2. Study notes
    ...     - 3. Physician Amendments notes
    ...     - 4. Referring physician: Physician name, Day phone number, After hours phone number, Fax number, Email address
    ...     - 5. Interpreting physician: Physician name, Day phone number, After hours phone number, Fax number, Email address
    ...     - 6. A link for the user to go to the study management page of the study
    ...     - 7. Follow-on study tracking (if study type is Holter and Follow on study)

    [Tags]      BFCC-TECH-EVENTS-NONVIABLE-QUICKACCESS-01       auto
    # Just handle verifying the Ui of study infomation
    Navigate To Events
    Navigate To Event Menu    Open
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}       Get Open Events
    View Open Events Study Information On    row=1
    ${study_info}       Get Study Information
    ${study_section}    Evaluate    [k for k, v in ${study_info}.items()]  # Headers
    ${study_details}    Evaluate    [k for k, v in ${study_info}[STUDY INFORMATION].items()]  # headers of study information field
    ${referring_phy}    Evaluate    [k for k, v in ${study_info}[REFERRING PHYSICIAN].items()]  # headers of referring physician field
    ${interpre_phy}     Evaluate    [k for k, v in ${study_info}[INTERPRETING PHYSICIAN].items()]  # headers of interpreting physician field
    ${ex_study_section}     Create List     STUDY INFORMATION    STUDY NOTES     PHYSICIAN AMENDMENTS NOTES    REFERRING PHYSICIAN    INTERPRETING PHYSICIAN
    ${ex_study_details}     Create List     Status     Start Time    End Time    Study Type     Patient Return Visit     Device ID    Duration    Facility   Total artifact percentage    EOL
    ${ex_referring_phy}     Create List     Name    Day Phone    After Hours Phone    Email    Fax Number
    ${ex_interpre_phy}      Create List     Name    Day Phone    After Hours Phone    Email    Fax Number
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_study_section}    ${study_section}
    # Study details
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_study_details}    ${study_details}
    # Referring physician
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_referring_phy}    ${referring_phy}
    # Interpreting physician
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_interpre_phy}     ${interpre_phy}
    # Stop event processing
    Stop Open Event Processing
    ${events}        Get Open Events
    Run Keyword And Continue On Failure    Should Be Equal    ${events}      Press the button below to start processing events


BFCC-TECH-EVENTS-PAUSE-VIEW-01: View the list without starting the event processing
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list when no start event processing
    ...
    ...     Precondition:
    ...     -   The CCT has logged in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click on Events page >> Open tab >> Pause subtab
    ...     - 2. Observe the page
    ...
    ...     Expected Results:
    ...     -   This tab displays events in the Pause subtab in Open status
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Pause event is shown on the subtab header
    ...     -   There is a Search icon
    ...     -   The message: "Press the button below to start processing events" shall be displayed and there shall be
    ...     a “Start Event Processing” button by default
    ...     -   “More option” button: The user shall view the events in either two columns or one column.
    ...     The default view shall be two columns

    [Tags]      BFCC-TECH-EVENTS-PAUSE-VIEW-01      auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Pause
    ${events}           Get Open Events
    ${is_starting}      Run Keyword And Return Status    Should Not Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If      '${is_starting}' == '${True}'    Stop Open Event Processing      # Stop event processing if it is starting
    ${event_tab}        Get Current Event State
    ${event_bucket}     Get Current Event Bucket
    Run Keyword And Continue On Failure    Should Contain    ${event_tab}           Open
    Run Keyword And Continue On Failure    Should Contain    ${event_bucket}        Pause
    ${open_event_number}        Evaluate   '${event_tab}'.split()[-1]
    ${event_bucket_number}      Evaluate   '${event_bucket}'.split()[-1]
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${open_event_number}          ${open_event_number}
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${event_bucket_number}        ${event_bucket_number}
    # Search icon
    ${search_icon}        Check Open Event Items Available        Search icon
    Run Keyword And Continue On Failure    Should Be Equal    ${search_icon}[Search icon]     ${True}
    # Message
    Run Keyword And Continue On Failure    Should Be Equal    ${events}      Press the button below to start processing events
    # Start event processing
    Start Open Event Processing
    ${load_more_button}    Check Open Event Items Available        Load more
    Run Keyword And Continue On Failure    Should Be Equal    ${load_more_button}[Load more]     ${True}
    # Event Colum
    ${event_columns}        Get Event Columns
    Run Keyword And Continue On Failure    Should Be Equal    ${event_columns}      Two Columns     # Two Columns is default
    Filter Events    by_layout=One Column
    ${event_columns}        Get Event Columns
    Run Keyword And Continue On Failure    Should Be Equal    ${event_columns}      One Column
    Stop Open Event Processing
    ${events}        Get Open Events
    Run Keyword And Continue On Failure    Should Be Equal    ${events}      Press the button below to start processing events

BFCC-TECH-EVENTS-PAUSE-VIEW-02: View the list when starting the event processing
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list when starting the event processing
    ...
    ...     Precondition:
    ...     - The CCT has logged in to the portal
    ...     - Pause subtab shall display events from 2.5 to 2.9 seconds
    ...     - No one is processing the event to make sure that having event for the user to process
    ...
    ...     Test Steps:
    ...     - 1. Click on Events page >> Open tab >> Pause subtab
    ...     - 2. Click "Start Event Processing" button and observe the page
    ...
    ...     Expected Results:
    ...     - 1. This tab displays events in the Pause subtab in Open status
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Pause event is shown on the subtab header
    ...     -   There is a Search icon
    ...     -   The message: "Press the button below to start processing events" shall be displayed and there shall be
    ...     a “Start Event Processing” button by default
    ...     -   “More option” button: The user shall view the events in either two columns or one column.
    ...     The default view shall be two columns
    ...     - 2. The system will load 10 events onto the page for the user to process
    ...     -   Each event card shall display the following information/UI components:
    ...         -   Study ID (Quick access hyperlink for Study Information)
    ...         -   Event ID
    ...         -   Avatar: Avatar of the Call Center users shall be displayed on the event card when they are editing
    ...     an event. Avatar of the Call Center users shall be hidden when the user hovers over the event card
    ...         -   Strip images
    ...         -   Event type: Manual or Auto
    ...         -   AI suggests
    ...         -   Open new tab Button
    ...     -  There shall be a "Load more" button at the end of the list
    ...     - "Stop processing" button
    ...     - “Close all” icon/button

    [Tags]      BFCC-TECH-EVENTS-PAUSE-VIEW-02      auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Pause
    ${events}           Get Open Events
    ${is_starting}      Run Keyword And Return Status    Should Not Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If      '${is_starting}' == '${True}'    Stop Open Event Processing      # Stop event processing if it is starting
    ${event_tab}        Get Current Event State
    ${event_bucket}     Get Current Event Bucket
    Run Keyword And Continue On Failure    Should Contain    ${event_tab}           Open
    Run Keyword And Continue On Failure    Should Contain    ${event_bucket}        Pause
    ${open_event_number}        Evaluate   '${event_tab}'.split()[-1]
    ${event_bucket_number}      Evaluate   '${event_bucket}'.split()[-1]
    # Verify event state and bucket contains number
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${open_event_number}          ${open_event_number}
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${event_bucket_number}        ${event_bucket_number}
    ${search_icon}        Check Open Event Items Available      Search icon
    Run Keyword And Continue On Failure    Should Be Equal    ${search_icon}[Search icon]     ${True}
    # Start event processing
    Start Open Event Processing
    Wait Open Events Available
    ${events}           Get Open Events
    # Event items size/page
#    Run Keyword And Continue On Failure    Length Should Be    ${events}        10
    # items header
    ${event_info}       Evaluate           [header for header, content in ${events}[0].items()]
    ${expected_info}        Create List    Study ID     Event ID     AI suggest     Event Type     Strip Image
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_info}       ${expected_info}
    # check Load more button
    ${attribute}        Check Open Event Items Available       Load more, Close all
    Run Keyword And Continue On Failure    Should Be Equal    ${attribute}[Load more]       ${True}

BFCC-TECH-EVENTS-PAUSE-VIEW-03: View the list when having no event in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list when having no event in the system
    ...
    ...     Precondition:
    ...     - The CCT has logged in to the portal
    ...     - No events in Pause tab
    ...
    ...     Test Steps:
    ...     - 1. Click on Events page >> Open tab >> Pause subtab
    ...     - 2. Observe the page
    ...
    ...     Expected Results:
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Pause event (0 event) is shown on the subtab header
    ...     -   There is a Search icon (unclickable)
    ...     -   The “Start Event Processing” button shall be hidden
    ...     -   “More option” button (unclickable)

    [Tags]      BFCC-TECH-EVENTS-PAUSE-VIEW-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-PAUSE-VIEW-04: View the list when all events have been distributed to other users
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list when all events have been distributed to other users
    ...
    ...     Precondition:
    ...     - The CCT has logged in to the portal
    ...     - All events in Pause tab have been distributed to other users
    ...
    ...     Test Steps:
    ...     - 1. Click on Events page >> Open tab >> Pause subtab
    ...     - 2. Click "Start Event Processing" and observe the page
    ...
    ...     Expected Results:
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Pause event (0 event) is shown on the subtab header
    ...     -   There is a Search icon (unclickable)
    ...     -   A message stating: “No more event for you to process at this time.” shall be displayed on the screen
    ...     -   “More option” button (unclickable)

    [Tags]      BFCC-TECH-EVENTS-PAUSE-VIEW-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-PAUSE-STOP-01: Stop event processing
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can stop event processing on PAUSE Events subtab
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Click [Stop Processing] button
    ...
    ...     Expected Results:
    ...     -   All events shall be hidden

    [Tags]      BFCC-TECH-EVENTS-PAUSE-STOP-01      auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Pause
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Should Not Be Empty    ${events}     No event found
    # Stop event processing
    Stop Open Event Processing
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Should Be Equal    ${events}     Press the button below to start processing events

BFCC-TECH-EVENTS-PAUSE-CLOSE-01: Close all events
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can close all loaded events
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     - 1. Open an event in a new tab
    ...     - 2. Click [Close all] button
    ...     - 3. Check status of event in step 1 (including validity and close status)
    ...
    ...     Expected Results:
    ...     -   All events shall be closed as invalid

    [Tags]      BFCC-TECH-EVENTS-PAUSE-CLOSE-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-PAUSE-CLOSE-02: Cannot close all events that has been editing/viewing by other users
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Cannot close all events that has been editing/viewing by other users
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     - 1. Other users [User 2] - Go to Event details page of an event that is being processed by this user [User 1]
    ...     - 2. [User 1] - Click [Close all] button
    ...     - 3. [User 1] - Check event list
    ...
    ...     Expected Results:
    ...     -   All events shall be closed as invalid except event is being edited/viewed by [User 2]

    [Tags]      BFCC-TECH-EVENTS-PAUSE-CLOSE-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-PAUSE-ECG-01: View full ECG strip
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view full ECG strip
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Hover over the strip image of the event card and click on it
    ...
    ...     Expected Results:
    ...     -   The Open new tab button shall also be displayed on the right corner of the screen,
    ...     next to the Close button
    ...     -   Each image presents 10-second data. The user shall scroll down or up to view other strips
    ...     in the zoomed-in version

    [Tags]      BFCC-TECH-EVENTS-PAUSE-ECG-01        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-PAUSE-OPEN-01: Open event in a new tab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can open event in a new tab
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. In each event card, click [Open in a new tab] icon
    ...     2. In zoom-in mode, click [Open] button
    ...
    ...     Expected Results:
    ...     -   The user shall be navigated to Event Details page

    [Tags]      BFCC-TECH-EVENTS-PAUSE-OPEN-01      auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Pause
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}        Get Open Events
    View Open Events Details On    row=1        # First event
    ${page_header}          Get Current Page Header
    ${event_summary}        Get Event Summary
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}        EVENT
    Run Keyword And Continue On Failure    Should Be Equal    ${events}[0][Study ID]     ${event_summary}[STUDY ID]
    Run Keyword And Continue On Failure    Should Be Equal    ${events}[0][Event ID]     ${event_summary}[EVENT ID]

BFCC-TECH-EVENTS-PAUSE-SEARCH-01: Search for event list by study ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for event list by study ID
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Input a study ID into the search bar, then press Enter key to search
    ...     2. Click [x] button next to [Stop Processing] button
    ...
    ...     Expected Results:
    ...     1. The system shall filter and display the result accordingly with the search value
    ...     2. Exit search mode

    [Tags]      BFCC-TECH-EVENTS-PAUSE-SEARCH-01        auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Pause
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}    Get Open Events
    ${text}      Set Variable    ${events}[0][Study ID]
    Filter Events    text_search=${text}
    ${open_events}      Get Open Events
    Run Keyword And Continue On Failure    Should Not Be Empty    ${open_events}     No event found - with text search ${text}
    Run Keyword And Continue On Failure    Should Be True         all('${text}' == event['Study ID'] for event in ${open_events})
    Filter Events       exit_search_mode=${True}
    ${search_bar}       Check Open Event Items Available        search bar
    Run Keyword And Continue On Failure    Should Be Equal    ${search_bar}[search bar]    ${False}

BFCC-TECH-EVENTS-PAUSE-LOADMORE-01: Load more events
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can load more events
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Scroll to the end of the list
    ...     2. Click [Load more] button
    ...
    ...     Expected Results:
    ...     -   The system shall load 10 events at a time
    ...     -   There are no more events to load, a message saying: “No more events available” shall be displayed

    [Tags]      BFCC-TECH-EVENTS-PAUSE-LOADMORE-01      auto
    # Required data > 20 events
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events       event_bucket=Pause
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
#    ${events}       Get Open Events
#    Run Keyword And Continue On Failure    Length Should Be    ${events}      10
    # Load more
#    Load More Open Events
#    ${events}       Get Open Events
#    Run Keyword And Continue On Failure    Length Should Be    ${events}      20

BFCC-TECH-EVENTS-PAUSE-QUICKACCESS-01: Quick access to study information
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can quick access to study information
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Click [Study ID] hyperlink
    ...
    ...     Expected Results:
    ...     The Study Information sidebar displays the following information:
    ...     - 1.  Study Information:  In the case a study has been canceled, a message stating: “ This study has been
    ...     aborted and will not be counted toward your billing.” shall be displayed on top of the Study Information section
    ...         -   Study status
    ...         -   Start time
    ...         -   End time
    ...         -   Study type
    ...         -   Patient return visit date
    ...         -   Device ID: If the device is an End-of-life device, there shall be an EOL tag next to the device ID
    ...         -   Study duration
    ...         -   Facility
    ...         -   Total artifact percentage - Flagged issue tag
    ...     - 2. Study notes
    ...     - 3. Physician Amendments notes
    ...     - 4. Referring physician: Physician name, Day phone number, After hours phone number, Fax number, Email address
    ...     - 5. Interpreting physician: Physician name, Day phone number, After hours phone number, Fax number, Email address
    ...     - 6. A link for the user to go to the study management page of the study
    ...     - 7. Follow-on study tracking (if study type is Holter and Follow on study)

    [Tags]      BFCC-TECH-EVENTS-PAUSE-QUICKACCESS-01       auto
    # Just handle verifying the Ui of study infomation
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Pause
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}       Get Open Events
    View Open Events Study Information On    row=1
    ${study_info}       Get Study Information
    ${study_section}    Evaluate    [k for k, v in ${study_info}.items()]  # Headers
    ${study_details}    Evaluate    [k for k, v in ${study_info}[STUDY INFORMATION].items()]  # headers of study information field
    ${referring_phy}    Evaluate    [k for k, v in ${study_info}[REFERRING PHYSICIAN].items()]  # headers of referring physician field
    ${interpre_phy}     Evaluate    [k for k, v in ${study_info}[INTERPRETING PHYSICIAN].items()]  # headers of interpreting physician field
    ${ex_study_section}     Create List     STUDY INFORMATION    STUDY NOTES     PHYSICIAN AMENDMENTS NOTES    REFERRING PHYSICIAN    INTERPRETING PHYSICIAN
    ${ex_study_details}     Create List     Status     Start Time    End Time    Study Type     Patient Return Visit     Device ID    Duration    Facility   Total artifact percentage   EOL
    ${ex_referring_phy}     Create List     Name    Day Phone    After Hours Phone    Email    Fax Number
    ${ex_interpre_phy}      Create List     Name    Day Phone    After Hours Phone    Email    Fax Number
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_study_section}    ${study_section}
    # Study details
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_study_details}    ${study_details}
    # Referring physician
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_referring_phy}    ${referring_phy}
    # Interpreting physician
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_interpre_phy}     ${interpre_phy}
    # Stop event processing
    Stop Open Event Processing
    ${events}        Get Open Events
    Run Keyword And Continue On Failure    Should Be Equal    ${events}      Press the button below to start processing events

BFCC-TECH-EVENTS-PRIORITY-VIEW-01: View the list without starting the event processing
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list without starting the event processing
    ...
    ...     Precondition:
    ...     -   The CCT has logged in to the portal
    ...
    ...     Test Steps:
    ...     1. Click on Events page >> Open tab >> Priority subtab
    ...     2. Observe the page
    ...
    ...     Expected Results:
    ...     -   This tab displays events in the Priority subtab in Open status
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Priority event is shown on the subtab header
    ...     -   There is a Search icon
    ...     -   The message: "Press the button below to start processing events" shall be displayed and there shall be
    ...     a “Start Event Processing” button by default
    ...     -   “More option” button: The user shall view the events in either two columns or one column.
    ...     The default view shall be two columns

    [Tags]      BFCC-TECH-EVENTS-PRIORITY-VIEW-01       auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Priority
    ${events}           Get Open Events
    ${is_starting}      Run Keyword And Return Status    Should Not Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If      '${is_starting}' == '${True}'    Stop Open Event Processing      # Stop event processing if it is starting
    ${event_tab}        Get Current Event State
    ${event_bucket}     Get Current Event Bucket
    Run Keyword And Continue On Failure    Should Contain    ${event_tab}           Open
    Run Keyword And Continue On Failure    Should Contain    ${event_bucket}        Priority
    ${open_event_number}        Evaluate   '${event_tab}'.split()[-1]
    ${event_bucket_number}      Evaluate   '${event_bucket}'.split()[-1]
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${open_event_number}          ${open_event_number}
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${event_bucket_number}        ${event_bucket_number}
    # Search icon
    ${search_icon}        Check Open Event Items Available        Search icon
    Run Keyword And Continue On Failure    Should Be Equal    ${search_icon}[Search icon]     ${True}
    # Message
    ${msg}      Get Open Events
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}      Press the button below to start processing events
    # Start event processing
    Start Open Event Processing
    ${load_more_button}    Check Open Event Items Available        Load more
    Run Keyword And Continue On Failure    Should Be Equal    ${load_more_button}[Load more]     ${True}
    # Event Colum
    ${event_columns}        Get Event Columns
    Run Keyword And Continue On Failure    Should Be Equal    ${event_columns}      Two Columns     # Two Columns is default
    Filter Events    by_layout=One Column
    ${event_columns}        Get Event Columns
    Run Keyword And Continue On Failure    Should Be Equal    ${event_columns}      One Column

BFCC-TECH-EVENTS-PRIORITY-VIEW-02: View the list when starting the event processing
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list when starting the event processing
    ...
    ...     Precondition:
    ...     -   The CCT has logged in to the portal
    ...     -   Priority events are events that have all pause events greater than or equal to 3 seconds,
    ...     Tachy > 150bpm, Brady < 40bpm, AFib > 150bpm, and AFib < 30bpm
    ...         - When the event type of an event is Manual, the AI shall prioritize to check if that event meets all
    ...         the conditions of the Priority bucket
    ...         - In the case it meets all the conditions, that Manual event shall be placed in the Priority bucket
    ...     - No one is processing the event to make sure that having event for the user to process
    ...
    ...     Test Steps:
    ...     - 1. Click on Events page >> Open tab >> Priority subtab
    ...     - 2. Click "Start Event Processing" button and observe the page
    ...
    ...     Expected Results:
    ...     - 1.  This tab displays events in the Priority subtab in Open status
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Priority event is shown on the subtab header
    ...     -   There is a Search icon
    ...     -   The message: "Press the button below to start processing events" shall be displayed and there shall be
    ...     a “Start Event Processing” button by default
    ...     -   “More option” button: The user shall view the events in either two columns or one column.
    ...     The default view shall be two columns
    ...     - 2. The system will load 10 events onto the page for the user to process
    ...     -   Each event card shall display the following information/UI components:
    ...         -   Study ID (Quick access hyperlink for Study Information)
    ...         -   Event ID
    ...         -   Avatar: Avatar of the Call Center users shall be displayed on the event card when they are editing
    ...     an event. Avatar of the Call Center users shall be hidden when the user hovers over the event card
    ...         -   Checkbox
    ...         -   Strip images
    ...         -   Event type: Manual or Auto
    ...         -   AI suggests
    ...         -   Open new tab Button
    ...         -   Close button
    ...     -   There shall be a "Load more" button at the end of the list
    ...     - "Stop processing" button

    [Tags]      BFCC-TECH-EVENTS-PRIORITY-VIEW-02       auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Priority
    ${events}           Get Open Events
    ${is_starting}      Run Keyword And Return Status    Should Not Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If      '${is_starting}' == '${True}'    Stop Open Event Processing      # Stop event processing if it is starting
    ${event_tab}        Get Current Event State
    ${event_bucket}     Get Current Event Bucket
    Run Keyword And Continue On Failure    Should Contain    ${event_tab}           Open
    Run Keyword And Continue On Failure    Should Contain    ${event_bucket}        Priority
    ${open_event_number}        Evaluate   '${event_tab}'.split()[-1]
    ${event_bucket_number}      Evaluate   '${event_bucket}'.split()[-1]
    # Verify event state and bucket contains number
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${open_event_number}          ${open_event_number}
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${event_bucket_number}        ${event_bucket_number}
    ${search_icon}        Check Open Event Items Available      Search icon
    Run Keyword And Continue On Failure    Should Be Equal    ${search_icon}[Search icon]     ${True}
    # Start event processing
    Start Open Event Processing
    ${events}           Get Open Events
    # Event items size/page
    Run Keyword And Continue On Failure    Length Should Be    ${events}        10
    # items header
    ${event_info}       Evaluate           [header for header, content in ${events}[0].items()]
    ${expected_info}        Create List    Study ID     Event ID     AI suggest     Event Type     Strip Image
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_info}       ${expected_info}
    # check Load more button
    ${attribute}        Check Open Event Items Available       Load more, Close all
    Run Keyword And Continue On Failure    Should Be Equal    ${attribute}[Load more]       ${True}

BFCC-TECH-EVENTS-PRIORITY-VIEW-03: View the list when having no event in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list when having no event in the system
    ...
    ...     Precondition:
    ...     -   The CCT has logged in to the portal
    ...     - No events in Priority tab
    ...
    ...     Test Steps:
    ...     1. Click on Events page >> Open tab >> Priority subtab
    ...     2. Observe the page
    ...
    ...     Expected Results:
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Priority event (0 event) is shown on the subtab header
    ...     -   There is a Search icon (unclickable)
    ...     -   The “Start Event Processing” button shall be hidden
    ...     -   “More option” button (unclickable)

    [Tags]      BFCC-TECH-EVENTS-PRIORITY-VIEW-03        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-PRIORITY-VIEW-04: View the list when all events have been distributed to other users
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list when all events have been distributed to other users
    ...
    ...     Precondition:
    ...     - The CCT has logged in to the portal
    ...     - All events in Priority tab have been distributed to other users
    ...
    ...     Test Steps:
    ...     - 1. Click on Events page >> Open tab >> Priority subtab
    ...     - 2. Click "Start Event Processing" and observe the page
    ...
    ...     Expected Results:
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Priority event is shown on the subtab header
    ...     -   There is a Search icon (unclickable)
    ...     -   A message stating: “No more event for you to process at this time.” shall be displayed on the screen
    ...     -   “More option” button (unclickable)

    [Tags]      BFCC-TECH-EVENTS-PRIORITY-VIEW-04        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-PRIORITY-STOP-01: Stop event processing
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can stop event processing on Priority Events subtab
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Click [Stop Processing] button
    ...
    ...     Expected Results:
    ...     -   All events shall be hidden

    [Tags]      BFCC-TECH-EVENTS-PRIORITY-STOP-01       auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Priority
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Should Not Be Empty    ${events}     No event found
    # Stop event processing
    Stop Open Event Processing
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Should Be Equal    ${events}     Press the button below to start processing events

BFCC-TECH-EVENTS-PRIORITY-CLOSE-01: Close an event as Valid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can close an event as Valid
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Open an event in a new tab
    ...     2. Hover over an event card and click [Close] button
    ...     3. Select [Close as Valid] button
    ...     4. Check status of event in step 1 (including validity and close status)
    ...
    ...     Expected Results:
    ...     - In step 2, the event shall be closed as valid status with the event type detected by the AI, except for Manual events
    ...     and event strip shall not be included in the report, except for Manual events
    ...     - In step 4, event is closed as valid

    [Tags]      BFCC-TECH-EVENTS-PRIORITY-CLOSE-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-PRIORITY-CLOSE-02: Close an event as Invalid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can close an event as Invalid
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Open an event in a new tab
    ...     2. Hover over an event card and click [Close] button
    ...     3. Select [Close as Invalid] button
    ...     4. Check status of event in step 1 (including validity and close status)
    ...
    ...     Expected Results:
    ...     The event shall be closed as invalid status

    [Tags]      BFCC-TECH-EVENTS-PRIORITY-CLOSE-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-PRIORITY-CLOSE-03: Cannot close an event that has been editing/viewing by other users
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Cannot close an event that has been editing/viewing by other users
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     - 1. Other users [User 2] - Go to Event details page of an event that is being processed by this user [User 1]
    ...     - 2. [User 1] - Hover over an event card and click [Close] button
    ...
    ...     Expected Results:
    ...     The [Close] button is unclickabled

    [Tags]      BFCC-TECH-EVENTS-PRIORITY-CLOSE-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-PRIORITY-CLOSE-04: Close multiple events as Valid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can close multiple events as Valid
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Select one or multiple checkboxes (open an event in a new tab)
    ...     2. Click [Select All] button
    ...     3. Click [Close as Valid] button
    ...     4. Check status of event in step 1 (including validity and close status)
    ...
    ...     Expected Results:
    ...     1. In step 1: The event card is highlighted, the toolbar shall replace all the sub-tabs, including: the number of
    ...     selected events, Select All button, Close As Valid button, Close As Valid button
    ...     2. In step 2, all loaded events shall be highlighted and the total number of selected events displayed properly
    ...     3. In step 3, all events shall be closed as valid status with the event type detected by the AI, except for Manual events
    ...     and event strip shall not be included in the report, except for Manual events
    ...     4. In step 4, event is closed as valid

    [Tags]      BFCC-TECH-EVENTS-PRIORITY-CLOSE-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-PRIORITY-CLOSE-05: Close multiple events as Invalid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can close multiple events as Valid
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Select one or multiple checkboxes (open an event in a new tab)
    ...     2. Click [Select All] button
    ...     3. Click [Close as Invalid] button
    ...     4. Check status of event in step 1 (including validity and close status)
    ...
    ...     Expected Results:
    ...     1. In step 1: The event card is highlighted, the toolbar shall replace all the sub-tabs, including: the number of
    ...     selected events, Select All button, Close As Valid button, Close As Valid button
    ...     2. In step 2, all loaded events shall be highlighted and the total number of selected events displayed properly
    ...     3. In step 3, in step 4, all events shall be closed as invalid status

    [Tags]      BFCC-TECH-EVENTS-PRIORITY-CLOSE-05       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-PRIORITY-CLOSE-06: Cannot close an event that has been editing/viewing by other users
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Cannot close an event that has been editing/viewing by other users
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     - 1. Other users [User 2] - Go to Event details page of an event that is being processed by this user [User 1]
    ...     - 2. [User 1] - Select a checkbox of an event that mentioned in step 1
    ...
    ...     Expected Results:
    ...     -   The checkbox of an event card shall be disabled when the event is being edited

    [Tags]      BFCC-TECH-EVENTS-PRIORITY-CLOSE-06       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-PRIORITY-ECG-01: View full ECG strip
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view full ECG strip
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Hover over the strip image of the event card and click on it
    ...
    ...     Expected Results:
    ...     -   The Open new tab button shall also be displayed on the right corner of the screen,
    ...     next to the Close button
    ...     -   Each image presents 10-second data. The user shall scroll down or up to view other strips
    ...     in the zoomed-in version

    [Tags]      BFCC-TECH-EVENTS-PRIORITY-ECG-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-PRIORITY-OPEN-01: Open event in a new tab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can open event in a new tab
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. In each event card, click [Open in a new tab] icon
    ...     2. In zoom-in mode, click [Open] button
    ...
    ...     Expected Results:
    ...     -   The user shall be navigated to Event Details page

    [Tags]      BFCC-TECH-EVENTS-PRIORITY-OPEN-01       auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Priority
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}        Get Open Events
    View Open Events Details On    row=1        # First event
    ${page_header}          Get Current Page Header
    ${event_summary}        Get Event Summary
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}        EVENT
    Run Keyword And Continue On Failure    Should Be Equal    ${events}[0][Study ID]     ${event_summary}[STUDY ID]
    Run Keyword And Continue On Failure    Should Be Equal    ${events}[0][Event ID]     ${event_summary}[EVENT ID]

BFCC-TECH-EVENTS-PRIORITY-SEARCH-01: Search for event list by study ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for event list by study ID
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Input a study ID into the search bar, then press Enter key to search
    ...     2. Click [x] button next to [Stop Processing] button
    ...
    ...     Expected Results:
    ...     1. The system shall filter and display the result accordingly with the search value
    ...     2. Exit search mode

    [Tags]      BFCC-TECH-EVENTS-PRIORITY-SEARCH-01     auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Priority
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}    Get Open Events
    ${text}      Set Variable    ${events}[0][Study ID]
    Filter Events    text_search=${text}
    ${events}    Get Open Events
    Run Keyword And Continue On Failure    Should Not Be Empty    ${events}     No event found - with text search ${text}
    Run Keyword And Continue On Failure    Should Be True         all('${text}' == event['Study ID'] for event in ${events})
    Filter Events       exit_search_mode=${True}
    ${search_bar}       Check Open Event Items Available        search bar
    Run Keyword And Continue On Failure    Should Be Equal    ${search_bar}[search bar]    ${False}

BFCC-TECH-EVENTS-PRIORITY-LOADMORE-01: Load more events
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can load more events
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Scroll to the end of the list
    ...     2. Click [Load more] button
    ...
    ...     Expected Results:
    ...     -   The system shall load 10 events at a time
    ...     -   There are no more events to load, a message saying: “No more events available” shall be displayed

    [Tags]      BFCC-TECH-EVENTS-PRIORITY-LOADMORE-01       auto
    # Required data > 20 events
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events       event_bucket=Priority
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Length Should Be    ${events}      10
    # Load more
#    Load More Open Events
#    ${events}       Get Open Events
#    Run Keyword And Continue On Failure    Length Should Be    ${events}      20

BFCC-TECH-EVENTS-PRIORITY-QUICKACCESS-01: Quick access to study information
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can quick access to study information
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Click [Study ID] hyperlink
    ...
    ...     Expected Results:
    ...     The Study Information sidebar displays the following information:
    ...     1.  Study Information:  In the case a study has been canceled, a message stating: “ This study has been
    ...     aborted and will not be counted toward your billing.” shall be displayed on top of the Study Information section
    ...         -   Study status
    ...         -   Start time
    ...         -   End time
    ...         -   Study type
    ...         -   Patient return visit date
    ...         -   Device ID: If the device is an End-of-life device, there shall be an EOL tag next to the device ID
    ...         -   Study duration
    ...         -   Facility
    ...         -   Total artifact percentage - Flagged issue tag
    ...     2. Study notes
    ...     3. Physician Amendments notes
    ...     4. Referring physician: Physician name, Day phone number, After hours phone number, Fax number, Email address
    ...     5. Interpreting physician: Physician name, Day phone number, After hours phone number, Fax number, Email address
    ...     6. A link for the user to go to the study management page of the study
    ...     7. Follow-on study tracking (if study type is Holter and Follow on study)

    [Tags]      BFCC-TECH-EVENTS-PRIORITY-QUICKACCESS-01        auto
    # Just handle verifying the Ui of study infomation
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Priority
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}       Get Open Events
    View Open Events Study Information On    row=1
    ${study_info}       Get Study Information
    ${study_section}    Evaluate    [k for k, v in ${study_info}.items()]  # Headers
    ${study_details}    Evaluate    [k for k, v in ${study_info}[STUDY INFORMATION].items()]  # headers of study information field
    ${referring_phy}    Evaluate    [k for k, v in ${study_info}[REFERRING PHYSICIAN].items()]  # headers of referring physician field
    ${interpre_phy}     Evaluate    [k for k, v in ${study_info}[INTERPRETING PHYSICIAN].items()]  # headers of interpreting physician field
    ${ex_study_section}     Create List     STUDY INFORMATION    STUDY NOTES     PHYSICIAN AMENDMENTS NOTES    REFERRING PHYSICIAN    INTERPRETING PHYSICIAN
    ${ex_study_details}     Create List     Status     Start Time    End Time    Study Type     Patient Return Visit     Device ID    Duration    Facility   Total artifact percentage      EOL
    ${ex_referring_phy}     Create List     Name    Day Phone    After Hours Phone    Email    Fax Number
    ${ex_interpre_phy}      Create List     Name    Day Phone    After Hours Phone    Email    Fax Number
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_study_section}    ${study_section}
    # Study details
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_study_details}    ${study_details}
    # Referring physician
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_referring_phy}    ${referring_phy}
    # Interpreting physician
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_interpre_phy}     ${interpre_phy}
    # Stop event processing
    Stop Open Event Processing
    ${events}        Get Open Events
    Run Keyword And Continue On Failure    Should Be Equal    ${events}      Press the button below to start processing events

BFCC-TECH-EVENTS-SINUS-VIEW-01: View the list without starting the event processing
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list without starting the event processing
    ...
    ...     Precondition:
    ...     -   The CCT has logged in to the portal
    ...
    ...     Test Steps:
    ...     1. Click on Events page >> Open tab >> Sinus subtab
    ...     2. Observe the page
    ...
    ...     Expected Results:
    ...     -   This tab displays events in the Sinus subtab in Open status
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Sinus event is shown on the subtab header
    ...     -   There is a Search icon
    ...     -   The message: "Press the button below to start processing events" shall be displayed and there shall be
    ...     a “Start Event Processing” button by default
    ...     -   “More option” button: The user shall view the events in either two columns or one column.
    ...     The default view shall be two columns

    [Tags]      BFCC-TECH-EVENTS-SINUS-VIEW-01      auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Sinus
    ${events}           Get Open Events
    ${is_starting}      Run Keyword And Return Status    Should Not Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If      '${is_starting}' == '${True}'    Stop Open Event Processing      # Stop event processing if it is starting
    ${event_tab}        Get Current Event State
    ${event_bucket}     Get Current Event Bucket
    Run Keyword And Continue On Failure    Should Contain    ${event_tab}           Open
    Run Keyword And Continue On Failure    Should Contain    ${event_bucket}        Sinus
    ${open_event_number}        Evaluate   '${event_tab}'.split()[-1]
    ${event_bucket_number}      Evaluate   '${event_bucket}'.split()[-1]
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${open_event_number}          ${open_event_number}
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${event_bucket_number}        ${event_bucket_number}
    # Search icon
    ${search_icon}        Check Open Event Items Available        Search icon
    Run Keyword And Continue On Failure    Should Be Equal    ${search_icon}[Search icon]     ${True}
    # Message
    ${msg}      Get Open Events
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}      Press the button below to start processing events
    # Start event processing
    Start Open Event Processing
    ${load_more_button}    Check Open Event Items Available        Load more
    Run Keyword And Continue On Failure    Should Be Equal    ${load_more_button}[Load more]     ${True}
    # Event Colum
    ${event_columns}        Get Event Columns
    Run Keyword And Continue On Failure    Should Be Equal    ${event_columns}      Two Columns
    Filter Events    by_layout=One Column
    ${event_columns}        Get Event Columns
    Run Keyword And Continue On Failure    Should Be Equal    ${event_columns}      One Column

BFCC-TECH-EVENTS-SINUS-VIEW-02: View the list when starting the event processing
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list when starting the event processing
    ...
    ...     Precondition:
    ...     - The CCT has logged in to the portal
    ...     - Sinus subtab was selected during the process of creating/editing a Call Center Technician
    ...     - Sinus subtab shall display events with HR from 101 to 120 bpm and events with HR from 44 to 59 bpm
    ...    - No one is processing the event to make sure that having event for the user to process
    ...
    ...     Test Steps:
    ...     1. Click on Events page >> Open tab >> Sinus subtab
    ...     2. Click "Start Event Processing" button and observe the page
    ...
    ...     Expected Results:
    ...     - 1.  This tab displays events in the Sinus subtab in Open status
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Sinus event is shown on the subtab header
    ...     -   There is a Search icon
    ...     -   The message: "Press the button below to start processing events" shall be displayed and there shall be
    ...     a “Start Event Processing” button by default
    ...     -   “More option” button: The user shall view the events in either two columns or one column.
    ...     The default view shall be two columns
    ...     - 2. The system will load 10 events onto the page for the user to process
    ...     -   Each event card shall display the following information/UI components:
    ...         -   Study ID (Quick access hyperlink for Study Information)
    ...         -   Event ID
    ...         -   Avatar: Avatar of the Call Center users shall be displayed on the event card when they are editing
    ...     an event. Avatar of the Call Center users shall be hidden when the user hovers over the event card
    ...         -   Checkbox
    ...         -   Strip images
    ...         -   Event type: Manual or Auto
    ...         -   AI suggests
    ...         -   Open new tab Button
    ...         -   Close button
    ...     -   There shall be a "Load more" button at the end of the list
    ...     - "Stop processing" button

    [Tags]      BFCC-TECH-EVENTS-SINUS-VIEW-02      auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Sinus
    ${events}           Get Open Events
    ${is_starting}      Run Keyword And Return Status    Should Not Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If      '${is_starting}' == '${True}'    Stop Open Event Processing      # Stop event processing if it is starting
    ${event_tab}        Get Current Event State
    ${event_bucket}     Get Current Event Bucket
    Run Keyword And Continue On Failure    Should Contain    ${event_tab}           Open
    Run Keyword And Continue On Failure    Should Contain    ${event_bucket}        Sinus
    ${open_event_number}        Evaluate   '${event_tab}'.split()[-1]
    ${event_bucket_number}      Evaluate   '${event_bucket}'.split()[-1]
    # Verify event state and bucket contains number
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${open_event_number}          ${open_event_number}
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${event_bucket_number}        ${event_bucket_number}
    ${search_icon}        Check Open Event Items Available      Search icon
    Run Keyword And Continue On Failure    Should Be Equal    ${search_icon}[Search icon]     ${True}
    # Start event processing
    Start Open Event Processing
    ${events}           Get Open Events
    # Event items size/page
    Run Keyword And Continue On Failure    Length Should Be    ${events}        10
    # items header
    ${event_info}       Evaluate           [header for header, content in ${events}[0].items()]
    ${expected_info}        Create List    Study ID     Event ID     AI suggest     Event Type     Strip Image
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_info}       ${expected_info}
    # check Load more button
    ${attribute}        Check Open Event Items Available       Load more, Close all
    Run Keyword And Continue On Failure    Should Be Equal    ${attribute}[Load more]       ${True}

BFCC-TECH-EVENTS-SINUS-VIEW-03: View the list when having no event in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list when having no event in the system
    ...
    ...     Precondition:
    ...     -   The CCT has logged in to the portal
    ...     - No events in Sinus tab
    ...
    ...     Test Steps:
    ...     1. Click on Events page >> Open tab >> Sinus subtab
    ...     2. Observe the page
    ...
    ...     Expected Results:
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Sinus event (0 event) is shown on the subtab header
    ...     -   There is a Search icon (unclickable)
    ...     -   The “Start Event Processing” button shall be hidden
    ...     -   “More option” button (unclickable)

    [Tags]      BFCC-TECH-EVENTS-SINUS-VIEW-03        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-VIEW-04: View the list when all events have been distributed to other users
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list when all events have been distributed to other users
    ...
    ...     Precondition:
    ...     - The CCT has logged in to the portal
    ...     - All events in Sinus tab have been distributed to other users
    ...
    ...     Test Steps:
    ...     - 1. Click on Events page >> Open tab >> Sinus subtab
    ...     - 2. Click "Start Event Processing" and observe the page
    ...
    ...     Expected Results:
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Sinus event is shown on the subtab header
    ...     -   There is a Search icon (unclickable)
    ...     -   A message stating: “No more event for you to process at this time.” shall be displayed on the screen
    ...     -   “More option” button (unclickable)

    [Tags]      BFCC-TECH-EVENTS-SINUS-VIEW-04        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-STOP-01: Stop event processing
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can stop event processing on Sinus Events subtab
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Click [Stop Processing] button
    ...
    ...     Expected Results:
    ...     -   All events shall be hidden

    [Tags]      BFCC-TECH-EVENTS-SINUS-STOP-01      auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Sinus
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Should Not Be Empty    ${events}     No event found
    # Stop event processing
    Stop Open Event Processing
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Should Be Equal    ${events}     Press the button below to start processing events

BFCC-TECH-EVENTS-SINUS-CLOSE-01: Close an event as Valid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can close an event as Valid
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Open an event in a new tab
    ...     2. Hover over an event card and click [Close] button
    ...     3. Select [Close as Valid] button
    ...     4. Check status of event in step 1 (including validity and close status)
    ...
    ...     Expected Results:
    ...     - In step 2, the event shall be closed as valid status with the event type detected by the AI, except for Manual events
    ...     and event strip shall not be included in the report, except for Manual events
    ...     - In step 4, event is closed as valid

    [Tags]      BFCC-TECH-EVENTS-SINUS-CLOSE-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-CLOSE-02: Close an event as Invalid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can close an event as Invalid
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Open an event in a new tab
    ...     2. Hover over an event card and click [Close] button
    ...     3. Select [Close as Invalid] button
    ...     4. Check status of event in step 1 (including validity and close status)
    ...
    ...     Expected Results:
    ...     The event shall be closed as invalid status

    [Tags]      BFCC-TECH-EVENTS-SINUS-CLOSE-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-CLOSE-03: Cannot close an event that has been editing/viewing by other users
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Cannot close an event that has been editing/viewing by other users
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     - 1. Other users [User 2] - Go to Event details page of an event that is being processed by this user [User 1]
    ...     - 2. [User 1] - Hover over an event card and click [Close] button
    ...
    ...     Expected Results:
    ...     The [Close] button is unclickabled

    [Tags]      BFCC-TECH-EVENTS-SINUS-CLOSE-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-CLOSE-04: Close multiple events as Valid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can close multiple events as Valid
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Select one or multiple checkboxes (open an event in a new tab)
    ...     2. Click [Select All] button
    ...     3. Click [Close as Valid] button
    ...     4. Check status of event in step 1 (including validity and close status)
    ...
    ...     Expected Results:
    ...     1. In step 1: The event card is highlighted, the toolbar shall replace all the sub-tabs, including: the number of
    ...     selected events, Select All button, Close As Valid button, Close As Valid button
    ...     2. In step 2, all loaded events shall be highlighted and the total number of selected events displayed properly
    ...     3. In step 3, all events shall be closed as valid status with the event type detected by the AI, except for Manual events
    ...     and event strip shall not be included in the report, except for Manual events
    ...     4. In step 4, event is closed as valid

    [Tags]      BFCC-TECH-EVENTS-SINUS-CLOSE-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-CLOSE-05: Close multiple events as Invalid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can close multiple events as Valid
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Select one or multiple checkboxes (open an event in a new tab)
    ...     2. Click [Select All] button
    ...     3. Click [Close as Invalid] button
    ...     4. Check status of event in step 1 (including validity and close status)
    ...
    ...     Expected Results:
    ...     1. In step 1: The event card is highlighted, the toolbar shall replace all the sub-tabs, including: the number of
    ...     selected events, Select All button, Close As Valid button, Close As Valid button
    ...     2. In step 2, all loaded events shall be highlighted and the total number of selected events displayed properly
    ...     3. In step 3, in step 4, all events shall be closed as invalid status

    [Tags]      BFCC-TECH-EVENTS-SINUS-CLOSE-05       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-CLOSE-06: Cannot close an event that has been editing/viewing by other users
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Cannot close an event that has been editing/viewing by other users
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     - 1. Other users [User 2] - Go to Event details page of an event that is being processed by this user [User 1]
    ...     - 2. [User 1] - Select a checkbox of an event that mentioned in step 1
    ...
    ...     Expected Results:
    ...     -   The checkbox of an event card shall be disabled when the event is being edited

    [Tags]      BFCC-TECH-EVENTS-SINUS-CLOSE-06       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-ECG-01: View full ECG strip
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view full ECG strip
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Hover over the strip image of the event card and click on it
    ...
    ...     Expected Results:
    ...     -   The Open new tab button shall also be displayed on the right corner of the screen,
    ...     next to the Close button
    ...     -   Each image presents 10-second data. The user shall scroll down or up to view other strips
    ...     in the zoomed-in version

    [Tags]      BFCC-TECH-EVENTS-SINUS-ECG-01        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-OPEN-01: Open event in a new tab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can open event in a new tab
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. In each event card, click [Open in a new tab] icon
    ...     2. In zoom-in mode, click [Open] button
    ...
    ...     Expected Results:
    ...     -   The user shall be navigated to Event Details page

    [Tags]      BFCC-TECH-EVENTS-SINUS-OPEN-01      auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Sinus
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}        Get Open Events
    View Open Events Details On    row=1        # First event
    ${page_header}          Get Current Page Header
    ${event_summary}        Get Event Summary
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}        EVENT
    Run Keyword And Continue On Failure    Should Be Equal    ${events}[0][Study ID]     ${event_summary}[STUDY ID]
    Run Keyword And Continue On Failure    Should Be Equal    ${events}[0][Event ID]     ${event_summary}[EVENT ID]

BFCC-TECH-EVENTS-SINUS-SEARCH-01: Search for event list by study ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for event list by study ID
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Input a study ID into the search bar, then press Enter key to search
    ...     2. Click [x] button next to [Stop Processing] button
    ...
    ...     Expected Results:
    ...     1. The system shall filter and display the result accordingly with the search value
    ...     2. Exit search mode

    [Tags]      BFCC-TECH-EVENTS-SINUS-SEARCH-01        auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Priority
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}    Get Open Events
    ${text}      Set Variable    ${events}[0][Study ID]
    Filter Events    text_search=${text}
    ${event}    Get Open Events
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event}     No event found - with text search ${text}
    Run Keyword And Continue On Failure    Should Be True         all('${text}' == event['Study ID'] for event in ${event})
    Filter Events       exit_search_mode=${True}
    ${search_bar}       Check Open Event Items Available        search bar
    Run Keyword And Continue On Failure    Should Be Equal      ${search_bar}[search bar]     ${False}

BFCC-TECH-EVENTS-SINUS-LOADMORE-01: Load more events
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can load more events
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Scroll to the end of the list
    ...     2. Click [Load more] button
    ...
    ...     Expected Results:
    ...     -   The system shall load 10 events at a time
    ...     -   There are no more events to load, a message saying: “No more events available” shall be displayed

    [Tags]      BFCC-TECH-EVENTS-SINUS-LOADMORE-01      auto
    # Required data > 20 events
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events       event_bucket=Sinus
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Length Should Be    ${events}      10
    # Load more
    Load More Open Events
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Length Should Be    ${events}      20

BFCC-TECH-EVENTS-SINUS-QUICKACCESS-01: Quick access to study information
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can quick access to study information
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Click [Study ID] hyperlink
    ...
    ...     Expected Results:
    ...     The Study Information sidebar displays the following information:
    ...     1.  Study Information:  In the case a study has been canceled, a message stating: “ This study has been
    ...     aborted and will not be counted toward your billing.” shall be displayed on top of the Study Information section
    ...         -   Study status
    ...         -   Start time
    ...         -   End time
    ...         -   Study type
    ...         -   Patient return visit date
    ...         -   Device ID: If the device is an End-of-life device, there shall be an EOL tag next to the device ID
    ...         -   Study duration
    ...         -   Facility
    ...         -   Total artifact percentage - Flagged issue tag
    ...     2. Study notes
    ...     3. Physician Amendments notes
    ...     4. Referring physician: Physician name, Day phone number, After hours phone number, Fax number, Email address
    ...     5. Interpreting physician: Physician name, Day phone number, After hours phone number, Fax number, Email address
    ...     6. A link for the user to go to the study management page of the study
    ...     7. Follow-on study tracking (if study type is Holter and Follow on study)

    [Tags]      BFCC-TECH-EVENTS-SINUS-QUICKACCESS-01       auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Sinus
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}       Get Open Events
    View Open Events Study Information On    row=1
    ${study_info}       Get Study Information
    ${study_section}    Evaluate    [k for k, v in ${study_info}.items()]  # Headers
    ${study_details}    Evaluate    [k for k, v in ${study_info}[STUDY INFORMATION].items()]  # headers of study information field
    ${referring_phy}    Evaluate    [k for k, v in ${study_info}[REFERRING PHYSICIAN].items()]  # headers of referring physician field
    ${interpre_phy}     Evaluate    [k for k, v in ${study_info}[INTERPRETING PHYSICIAN].items()]  # headers of interpreting physician field
    ${ex_study_section}     Create List     STUDY INFORMATION    STUDY NOTES     PHYSICIAN AMENDMENTS NOTES    REFERRING PHYSICIAN    INTERPRETING PHYSICIAN        FOLLOW-ON STUDY TRACKING
    ${ex_study_details}     Create List     Status     Start Time    End Time    Study Type     Patient Return Visit     Device ID    Duration    Facility   Total artifact percentage      EOL
    ${ex_referring_phy}     Create List     Name    Day Phone    After Hours Phone    Email    Fax Number
    ${ex_interpre_phy}      Create List     Name    Day Phone    After Hours Phone    Email    Fax Number
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_study_section}    ${study_section}
    # Study details
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_study_details}    ${study_details}
    # Referring physician
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_referring_phy}    ${referring_phy}
    # Interpreting physician
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_interpre_phy}     ${interpre_phy}
    # Stop event processing
    Stop Open Event Processing
    ${events}        Get Open Events
    Run Keyword And Continue On Failure    Should Be Equal    ${events}      Press the button below to start processing events

BFCC-TECH-EVENTS-SINUS-BRADY-VIEW-01: View the list without starting the event processing
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list without starting the event processing
    ...
    ...     Precondition:
    ...     -   The CCT has logged in to the portal
    ...
    ...     Test Steps:
    ...     1. Click on Events page >> Open tab >> Sinus Brady subtab
    ...     2. Observe the page
    ...
    ...     Expected Results:
    ...     -   This tab displays events in the Sinus Brady subtab in Open status
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Sinus Brady event is shown on the subtab header
    ...     -   There is a Search icon
    ...     -   The message: "Press the button below to start processing events" shall be displayed and there shall be
    ...     a “Start Event Processing” button by default
    ...     -   “More option” button: The user shall view the events in either two columns or one column.
    ...     The default view shall be two columns

    [Tags]      BFCC-TECH-EVENTS-SINUS-BRADY-VIEW-01        auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Sinus Brady
    ${events}           Get Open Events
    ${is_starting}      Run Keyword And Return Status    Should Not Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If      '${is_starting}' == '${True}'    Stop Open Event Processing      # Stop event processing if it is starting
    ${event_tab}        Get Current Event State
    ${event_bucket}     Get Current Event Bucket
    Run Keyword And Continue On Failure    Should Contain    ${event_tab}           Open
    Run Keyword And Continue On Failure    Should Contain    ${event_bucket}        Sinus Brady
    ${open_event_number}        Evaluate   '${event_tab}'.split()[-1]
    ${event_bucket_number}      Evaluate   '${event_bucket}'.split()[-1]
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${open_event_number}          ${open_event_number}
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${event_bucket_number}        ${event_bucket_number}
    # Search icon
    ${search_icon}        Check Open Event Items Available        Search icon
    Run Keyword And Continue On Failure    Should Be Equal    ${search_icon}[Search icon]     ${True}
    # Message
    ${msg}      Get Open Events
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}      Press the button below to start processing events
    # Start event processing
    Start Open Event Processing
    ${load_more_button}    Check Open Event Items Available        Load more
    Run Keyword And Continue On Failure    Should Be Equal    ${load_more_button}[Load more]     ${True}
    # Event Colum
    ${event_columns}        Get Event Columns
    Run Keyword And Continue On Failure    Should Be Equal    ${event_columns}      Two Columns
    Filter Events    by_layout=One Column
    ${event_columns}        Get Event Columns
    Run Keyword And Continue On Failure    Should Be Equal    ${event_columns}      One Column

BFCC-TECH-EVENTS-SINUS-BRADY-VIEW-02: View the list when starting the event processing
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list when starting the event processing
    ...
    ...     Precondition:
    ...     -   The CCT has logged in to the portal
    ...     - Sinus Brady subtab was selected during the process of creating/editing a Call Center Technician
    ...     - Sinus Brady subtab shall display events with HR from 40-43 bpm
    ...     - No one is processing the event to make sure that having event for the user to process
    ...
    ...     Test Steps:
    ...     1. Click on Events page >> Open tab >> Sinus Brady subtab
    ...     2. Click "Start Event Processing" button and observe the page
    ...
    ...     Expected Results:
    ...     - 1.  This tab displays events in the Sinus Brady subtab in Open status
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Sinus Brady event is shown on the subtab header
    ...     -   There is a Search icon
    ...     -   The message: "Press the button below to start processing events" shall be displayed and there shall be
    ...     a “Start Event Processing” button by default
    ...     -   “More option” button: The user shall view the events in either two columns or one column.
    ...     The default view shall be two columns
    ...     - 2. The system will load 10 events onto the page for the user to process
    ...     -   Each event card shall display the following information/UI components:
    ...         -   Study ID (Quick access hyperlink for Study Information)
    ...         -   Event ID
    ...         -   Avatar: Avatar of the Call Center users shall be displayed on the event card when they are editing
    ...     an event. Avatar of the Call Center users shall be hidden when the user hovers over the event card
    ...         -   Checkbox
    ...         -   Strip images
    ...         -   Event type: Manual or Auto
    ...         -   AI suggests
    ...         -   Open new tab Button
    ...         -   Close button
    ...     -   There shall be a "Load more" button at the end of the list
    ...     - "Stop processing" button

    [Tags]      BFCC-TECH-EVENTS-SINUS-BRADY-VIEW-02        auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Sinus Brady
    ${events}           Get Open Events
    ${is_starting}      Run Keyword And Return Status    Should Not Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If      '${is_starting}' == '${True}'    Stop Open Event Processing      # Stop event processing if it is starting
    ${event_tab}        Get Current Event State
    ${event_bucket}     Get Current Event Bucket
    Run Keyword And Continue On Failure    Should Contain    ${event_tab}           Open
    Run Keyword And Continue On Failure    Should Contain    ${event_bucket}        Sinus Brady
    ${open_event_number}        Evaluate   '${event_tab}'.split()[-1]
    ${event_bucket_number}      Evaluate   '${event_bucket}'.split()[-1]
    # Verify event state and bucket contains number
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${open_event_number}          ${open_event_number}
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${event_bucket_number}        ${event_bucket_number}
    ${search_icon}        Check Open Event Items Available      Search icon
    Run Keyword And Continue On Failure    Should Be Equal    ${search_icon}[Search icon]     ${True}
    # Start event processing
    Start Open Event Processing
    ${events}           Get Open Events
    # Event items size/page
    Run Keyword And Continue On Failure    Length Should Be    ${events}        10
    # items header
    ${event_info}       Evaluate           [header for header, content in ${events}[0].items()]
    ${expected_info}        Create List    Study ID     Event ID     AI suggest     Event Type     Strip Image
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_info}       ${expected_info}
    # check Load more button
    ${attribute}        Check Open Event Items Available       Load more, Close all
    Run Keyword And Continue On Failure    Should Be Equal    ${attribute}[Load more]       ${True}

BFCC-TECH-EVENTS-SINUS-BRADY-VIEW-03: View the list when having no event in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list when having no event in the system
    ...
    ...     Precondition:
    ...     -   The CCT has logged in to the portal
    ...     - No events in Sinus Brady tab
    ...
    ...     Test Steps:
    ...     1. Click on Events page >> Open tab >> Sinus Brady subtab
    ...     2. Observe the page
    ...
    ...     Expected Results:
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Sinus Brady event (0 event) is shown on the subtab header
    ...     -   There is a Search icon (unclickable)
    ...     -   The “Start Event Processing” button shall be hidden
    ...     -   “More option” button (unclickable)

    [Tags]      BFCC-TECH-EVENTS-SINUS-BRADY-VIEW-03        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-BRADY-VIEW-04: View the list when all events have been distributed to other users
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list when all events have been distributed to other users
    ...
    ...     Precondition:
    ...     - The CCT has logged in to the portal
    ...     - All events in Sinus Brady tab have been distributed to other users
    ...
    ...     Test Steps:
    ...     - 1. Click on Events page >> Open tab >> Sinus Brady subtab
    ...     - 2. Click "Start Event Processing" and observe the page
    ...
    ...     Expected Results:
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Sinus Brady event is shown on the subtab header
    ...     -   There is a Search icon (unclickable)
    ...     -   A message stating: “No more event for you to process at this time.” shall be displayed on the screen
    ...     -   “More option” button (unclickable)

    [Tags]      BFCC-TECH-EVENTS-SINUS-BRADY-VIEW-04        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-BRADY-STOP-01: Stop event processing
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can stop event processing on SINUS BRADY Events subtab
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Click [Stop Processing] button
    ...
    ...     Expected Results:
    ...     -   All events shall be hidden

    [Tags]      BFCC-TECH-EVENTS-SINUS-BRADY-STOP-01        auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Sinus Brady
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Should Not Be Empty    ${events}     No event found
    # Stop event processing
    Stop Open Event Processing
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Should Be Equal    ${events}     Press the button below to start processing events

BFCC-TECH-EVENTS-SINUS-BRADY-CLOSE-01: Close an event as Valid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can close an event as Valid
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Open an event in a new tab
    ...     2. Hover over an event card and click [Close] button
    ...     3. Select [Close as Valid] button
    ...     4. Check status of event in step 1 (including validity and close status)
    ...
    ...     Expected Results:
    ...     - In step 2, the event shall be closed as valid status with the event type detected by the AI, except for Manual events
    ...     and event strip shall not be included in the report, except for Manual events
    ...     - In step 4, event is closed as valid

    [Tags]      BFCC-TECH-EVENTS-SINUS-BRADY-CLOSE-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-BRADY-CLOSE-02: Close an event as Invalid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can close an event as Invalid
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Open an event in a new tab
    ...     2. Hover over an event card and click [Close] button
    ...     3. Select [Close as Invalid] button
    ...     4. Check status of event in step 1 (including validity and close status)
    ...
    ...     Expected Results:
    ...     The event shall be closed as invalid status

    [Tags]      BFCC-TECH-EVENTS-SINUS-BRADY-CLOSE-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-BRADY-CLOSE-03: Cannot close an event that has been editing/viewing by other users
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Cannot close an event that has been editing/viewing by other users
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     - 1. Other users [User 2] - Go to Event details page of an event that is being processed by this user [User 1]
    ...     - 2. [User 1] - Hover over an event card and click [Close] button
    ...
    ...     Expected Results:
    ...     The [Close] button is unclickabled

    [Tags]      BFCC-TECH-EVENTS-SINUS-BRADY-CLOSE-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-BRADY-CLOSE-04: Close multiple events as Valid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can close multiple events as Valid
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Select one or multiple checkboxes (open an event in a new tab)
    ...     2. Click [Select All] button
    ...     3. Click [Close as Valid] button
    ...     4. Check status of event in step 1 (including validity and close status)
    ...
    ...     Expected Results:
    ...     1. In step 1: The event card is highlighted, the toolbar shall replace all the sub-tabs, including: the number of
    ...     selected events, Select All button, Close As Valid button, Close As Valid button
    ...     2. In step 2, all loaded events shall be highlighted and the total number of selected events displayed properly
    ...     3. In step 3, all events shall be closed as valid status with the event type detected by the AI, except for Manual events
    ...     and event strip shall not be included in the report, except for Manual events
    ...     4. In step 4, event is closed as valid

    [Tags]      BFCC-TECH-EVENTS-SINUS-BRADY-CLOSE-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-BRADY-CLOSE-05: Close multiple events as Invalid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can close multiple events as Valid
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Select one or multiple checkboxes (open an event in a new tab)
    ...     2. Click [Select All] button
    ...     3. Click [Close as Invalid] button
    ...     4. Check status of event in step 1 (including validity and close status)
    ...
    ...     Expected Results:
    ...     1. In step 1: The event card is highlighted, the toolbar shall replace all the sub-tabs, including: the number of
    ...     selected events, Select All button, Close As Valid button, Close As Valid button
    ...     2. In step 2, all loaded events shall be highlighted and the total number of selected events displayed properly
    ...     3. In step 3, in step 4, all events shall be closed as invalid status

    [Tags]      BFCC-TECH-EVENTS-SINUS-BRADY-CLOSE-05       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-BRADY-CLOSE-06: Cannot close an event that has been editing/viewing by other users
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Cannot close an event that has been editing/viewing by other users
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     - 1. Other users [User 2] - Go to Event details page of an event that is being processed by this user [User 1]
    ...     - 2. [User 1] - Select a checkbox of an event that mentioned in step 1
    ...
    ...     Expected Results:
    ...     -   The checkbox of an event card shall be disabled when the event is being edited

    [Tags]      BFCC-TECH-EVENTS-SINUS-BRADY-CLOSE-06       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-BRADY-ECG-01: View full ECG strip
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view full ECG strip
    ...
    ...     Precondition:
    ...     - The CCT has already startedededededededededed event processing
    ...
    ...     Test Steps:
    ...     1. Hover over the strip image of the event card and click on it
    ...
    ...     Expected Results:
    ...     -   The Open new tab button shall also be displayed on the right corner of the screen,
    ...     next to the Close button
    ...     -   Each image presents 10-second data. The user shall scroll down or up to view other strips
    ...     in the zoomed-in version

    [Tags]      BFCC-TECH-EVENTS-SINUS-BRADY-ECG-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-BRADY-OPEN-01: Open event in a new tab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can open event in a new tab
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. In each event card, click [Open in a new tab] icon
    ...     2. In zoom-in mode, click [Open] button
    ...
    ...     Expected Results:
    ...     -   The user shall be navigated to Event Details page

    [Tags]      BFCC-TECH-EVENTS-SINUS-BRADY-OPEN-01        auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Sinus Brady
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}        Get Open Events
    View Open Events Details On    row=1        # First event
    ${page_header}          Get Current Page Header
    ${event_summary}        Get Event Summary
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}        EVENT
    Run Keyword And Continue On Failure    Should Be Equal    ${events}[0][Study ID]     ${event_summary}[STUDY ID]
    Run Keyword And Continue On Failure    Should Be Equal    ${events}[0][Event ID]     ${event_summary}[EVENT ID]

BFCC-TECH-EVENTS-SINUS-BRADY-SEARCH-01: Search for event list by study ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for event list by study ID
    ...
    ...     Precondition:
    ...     - The CCT has already startedededededededededed event processing
    ...
    ...     Test Steps:
    ...     1. Input a study ID into the search bar, then press Enter key to search
    ...     2. Click [x] button next to [Stop Processing] button
    ...
    ...     Expected Results:
    ...     1. The system shall filter and display the result accordingly with the search value
    ...     2. Exit search mode

    [Tags]      BFCC-TECH-EVENTS-SINUS-BRADY-SEARCH-01      auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Sinus Brady
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}    Get Open Events
    ${text}      Set Variable    ${events}[0][Study ID]
    Filter Events    text_search=${text}
    ${events}    Get Open Events
    Run Keyword And Continue On Failure    Should Not Be Empty    ${events}     No event found - with text search ${text}
    Run Keyword And Continue On Failure    Should Be True         all('${text}' == event['Study ID'] for event in ${events})
    Filter Events       exit_search_mode=${True}
    ${search_bar}       Check Open Event Items Available        search bar
    Run Keyword And Continue On Failure    Should Be Equal    ${search_bar}[search bar]     ${False}

BFCC-TECH-EVENTS-SINUS-BRADY-LOADMORE-01: Load more events
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can load more events
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Scroll to the end of the list
    ...     2. Click [Load more] button
    ...
    ...     Expected Results:
    ...     -   The system shall load 10 events at a time
    ...     -   There are no more events to load, a message saying: “No more events available” shall be displayed

    [Tags]      BFCC-TECH-EVENTS-SINUS-BRADY-LOADMORE-01        auto
    # Required data > 20 events
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events       event_bucket=Sinus Brady
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Length Should Be    ${events}      10
    # Load more
    Load More Open Events
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Length Should Be    ${events}      20

BFCC-TECH-EVENTS-SINUS-BRADY-QUICKACCESS-01: Quick access to study information
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can quick access to study information
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Click [Study ID] hyperlink
    ...
    ...     Expected Results:
    ...     The Study Information sidebar displays the following information:
    ...     1.  Study Information:  In the case a study has been canceled, a message stating: “ This study has been
    ...     aborted and will not be counted toward your billing.” shall be displayed on top of the Study Information section
    ...         -   Study status
    ...         -   Start time
    ...         -   End time
    ...         -   Study type
    ...         -   Patient return visit date
    ...         -   Device ID: If the device is an End-of-life device, there shall be an EOL tag next to the device ID
    ...         -   Study duration
    ...         -   Facility
    ...         -   Total artifact percentage - Flagged issue tag
    ...     2. Study notes
    ...     3. Physician Amendments notes
    ...     4. Referring physician: Physician name, Day phone number, After hours phone number, Fax number, Email address
    ...     5. Interpreting physician: Physician name, Day phone number, After hours phone number, Fax number, Email address
    ...     6. A link for the user to go to the study management page of the study
    ...     7. Follow-on study tracking (if study type is Holter and Follow on study)

    [Tags]      BFCC-TECH-EVENTS-SINUS-BRADY-QUICKACCESS-01     auto
    # Just handle verifying the Ui of study infomation
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Sinus Brady
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}       Get Open Events
    View Open Events Study Information On    row=1
    ${study_info}       Get Study Information
    ${study_section}    Evaluate    [k for k, v in ${study_info}.items()]  # Headers
    ${study_details}    Evaluate    [k for k, v in ${study_info}[STUDY INFORMATION].items()]  # headers of study information field
    ${referring_phy}    Evaluate    [k for k, v in ${study_info}[REFERRING PHYSICIAN].items()]  # headers of referring physician field
    ${interpre_phy}     Evaluate    [k for k, v in ${study_info}[INTERPRETING PHYSICIAN].items()]  # headers of interpreting physician field
    ${ex_study_section}     Create List     STUDY INFORMATION    STUDY NOTES     PHYSICIAN AMENDMENTS NOTES    REFERRING PHYSICIAN    INTERPRETING PHYSICIAN
    ${ex_study_details}     Create List     Status     Start Time    End Time    Study Type     Patient Return Visit     Device ID    Duration    Facility   Total artifact percentage   EOL
    ${ex_referring_phy}     Create List     Name    Day Phone    After Hours Phone    Email    Fax Number
    ${ex_interpre_phy}      Create List     Name    Day Phone    After Hours Phone    Email    Fax Number
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_study_section}    ${study_section}
    # Study details
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_study_details}    ${study_details}
    # Referring physician
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_referring_phy}    ${referring_phy}
    # Interpreting physician
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_interpre_phy}     ${interpre_phy}
    # Stop event processing
    Stop Open Event Processing
    ${events}        Get Open Events
    Run Keyword And Continue On Failure    Should Be Equal    ${events}      Press the button below to start processing events

BFCC-TECH-EVENTS-SINUS-TACHY-VIEW-01: View the list without starting the event processing
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list without starting the event processing
    ...
    ...     Precondition:
    ...     -   The CCT has logged in to the portal
    ...
    ...     Test Steps:
    ...     1. Click on Events page >> Open tab >> Sinus Tachy subtab
    ...     2. Observe the page
    ...
    ...     Expected Results:
    ...     -   This tab displays events in the Sinus Tachy subtab in Open status
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Sinus Tachy event is shown on the subtab header
    ...     -   There is a Search icon
    ...     -   The message: "Press the button below to start processing events" shall be displayed and there shall be
    ...     a “Start Event Processing” button by default
    ...     -   “More option” button: The user shall view the events in either two columns or one column.
    ...     The default view shall be two columns

    [Tags]      BFCC-TECH-EVENTS-SINUS-TACHY-VIEW-01        auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Sinus Tachy
    ${events}           Get Open Events
    ${is_starting}      Run Keyword And Return Status    Should Not Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If      '${is_starting}' == '${True}'    Stop Open Event Processing      # Stop event processing if it is starting
    ${event_tab}        Get Current Event State
    ${event_bucket}     Get Current Event Bucket
    Run Keyword And Continue On Failure    Should Contain    ${event_tab}           Open
    Run Keyword And Continue On Failure    Should Contain    ${event_bucket}        Sinus Tachy
    ${open_event_number}        Evaluate   '${event_tab}'.split()[-1]
    ${event_bucket_number}      Evaluate   '${event_bucket}'.split()[-1]
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${open_event_number}          ${open_event_number}
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${event_bucket_number}        ${event_bucket_number}
    # Search icon
    ${search_icon}        Check Open Event Items Available        Search icon
    Run Keyword And Continue On Failure    Should Be Equal    ${search_icon}[Search icon]     ${True}
    # Message
    ${msg}      Get Open Events
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}      Press the button below to start processing events
    # Start event processing
    Start Open Event Processing
    ${load_more_button}    Check Open Event Items Available       Load more
    Run Keyword And Continue On Failure    Should Be Equal    ${load_more_button}[Load more]     ${True}
    # Event Colum
    ${event_columns}        Get Event Columns
    Run Keyword And Continue On Failure    Should Be Equal    ${event_columns}      Two Columns
    Filter Events    by_layout=One Column
    ${event_columns}        Get Event Columns
    Run Keyword And Continue On Failure    Should Be Equal    ${event_columns}      One Column

BFCC-TECH-EVENTS-SINUS-TACHY-VIEW-02: View the list when starting the event processing
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list when starting the event processing
    ...
    ...     Precondition:
    ...     -   The CCT has logged in to the portal
    ...     - Sinus Tachy subtab was selected during the process of creating/editing a Call Center Technician
    ...     - Sinus Tachy subtab shall display events that have HR from 121 to 150 bpm
    ...     - No one is processing the event to make sure that having event for the user to process
    ...
    ...     Test Steps:
    ...     1. Click on Events page >> Open tab >> Sinus Tachy subtab
    ...     2. Click "Start Event Processing" button and observe the page
    ...
    ...     Expected Results:
    ...     - 1.  This tab displays events in the Sinus Tachy subtab in Open status
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Sinus Tachy event is shown on the subtab header
    ...     -   There is a Search icon
    ...     -   The message: "Press the button below to start processing events" shall be displayed and there shall be
    ...     a “Start Event Processing” button by default
    ...     -   “More option” button: The user shall view the events in either two columns or one column.
    ...     The default view shall be two columns
    ...     - 2. The system will load 10 events onto the page for the user to process
    ...     -   Each event card shall display the following information/UI components:
    ...         -   Study ID (Quick access hyperlink for Study Information)
    ...         -   Event ID
    ...         -   Avatar: Avatar of the Call Center users shall be displayed on the event card when they are editing
    ...     an event. Avatar of the Call Center users shall be hidden when the user hovers over the event card
    ...         -   Checkbox
    ...         -   Strip images
    ...         -   Event type: Manual or Auto
    ...         -   AI suggests
    ...         -   Open new tab Button
    ...         -   Close button
    ...     -   There shall be a "Load more" button at the end of the list
    ...     - "Stop processing" button

    [Tags]      BFCC-TECH-EVENTS-SINUS-TACHY-VIEW-02        auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Sinus Tachy
    ${events}           Get Open Events
    ${is_starting}      Run Keyword And Return Status    Should Not Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If      '${is_starting}' == '${True}'    Stop Open Event Processing      # Stop event processing if it is starting
    ${event_tab}        Get Current Event State
    ${event_bucket}     Get Current Event Bucket
    Run Keyword And Continue On Failure    Should Contain    ${event_tab}           Open
    Run Keyword And Continue On Failure    Should Contain    ${event_bucket}        Sinus Tachy
    ${open_event_number}        Evaluate   '${event_tab}'.split()[-1]
    ${event_bucket_number}      Evaluate   '${event_bucket}'.split()[-1]
    # Verify event state and bucket contains number
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${open_event_number}          ${open_event_number}
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${event_bucket_number}        ${event_bucket_number}
    ${search_icon}        Check Open Event Items Available      Search icon
    Run Keyword And Continue On Failure    Should Be Equal    ${search_icon}[Search icon]     ${True}
    # Start event processing
    Start Open Event Processing
    ${events}           Get Open Events
    # Event items size/page
    Run Keyword And Continue On Failure    Length Should Be    ${events}        10
    # items header
    ${event_info}       Evaluate           [header for header, content in ${events}[0].items()]
    ${expected_info}        Create List    Study ID     Event ID     AI suggest     Event Type     Strip Image
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_info}       ${expected_info}
    # Check Load more button
    ${attribute}        Check Open Event Items Available       Load more, Close all
    Run Keyword And Continue On Failure    Should Be Equal    ${attribute}[Load more]       ${True}

BFCC-TECH-EVENTS-SINUS-TACHY-VIEW-03: View the list when having no event in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list when having no event in the system
    ...
    ...     Precondition:
    ...     -   The CCT has logged in to the portal
    ...     - No events in Sinus Tachy tab
    ...
    ...     Test Steps:
    ...     1. Click on Events page >> Open tab >> Sinus Tachy subtab
    ...     2. Observe the page
    ...
    ...     Expected Results:
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Sinus Tachy  event (0 event) is shown on the subtab header
    ...     -   There is a Search icon (unclickable)
    ...     -   The “Start Event Processing” button shall be hidden
    ...     -   “More option” button (unclickable)

    [Tags]      BFCC-TECH-EVENTS-SINUS-TACHY-VIEW-03        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-TACHY-VIEW-04: View the list when all events have been distributed to other users
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list when all events have been distributed to other users
    ...
    ...     Precondition:
    ...     - The CCT has logged in to the portal
    ...     - All events in Sinus Tachy tab have been distributed to other users
    ...
    ...     Test Steps:
    ...     - 1. Click on Events page >> Open tab >> Sinus Tachy subtab
    ...     - 2. Click "Start Event Processing" and observe the page
    ...
    ...     Expected Results:
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Sinus Tachy event is shown on the subtab header
    ...     -   There is a Search icon (unclickable)
    ...     -   A message stating: “No more event for you to process at this time.” shall be displayed on the screen
    ...     -   “More option” button (unclickable)

    [Tags]      BFCC-TECH-EVENTS-SINUS-TACHY-VIEW-04        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-TACHY-STOP-01: Stop event processing
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can stop event processing on SINUS TACHY Events subtab
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Click [Stop Processing] button
    ...
    ...     Expected Results:
    ...     -   All events shall be hidden

    [Tags]      BFCC-TECH-EVENTS-SINUS-TACHY-STOP-01        auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Sinus Tachy
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Should Not Be Empty    ${events}     No event found
    # Stop event processing
    Stop Open Event Processing
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Should Be Equal    ${events}     Press the button below to start processing events

BFCC-TECH-EVENTS-SINUS-TACHY-CLOSE-01: Close an event as Valid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can close an event as Valid
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Open an event in a new tab
    ...     2. Hover over an event card and click [Close] button
    ...     3. Select [Close as Valid] button
    ...     4. Check status of event in step 1 (including validity and close status)
    ...
    ...     Expected Results:
    ...     - In step 2, the event shall be closed as valid status with the event type detected by the AI, except for Manual events
    ...     and event strip shall not be included in the report, except for Manual events
    ...     - In step 4, event is closed as valid

    [Tags]      BFCC-TECH-EVENTS-SINUS-TACHY-CLOSE-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-TACHY-CLOSE-02: Close an event as Invalid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can close an event as Invalid
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Open an event in a new tab
    ...     2. Hover over an event card and click [Close] button
    ...     3. Select [Close as Invalid] button
    ...     4. Check status of event in step 1 (including validity and close status)
    ...
    ...     Expected Results:
    ...     The event shall be closed as invalid status

    [Tags]      BFCC-TECH-EVENTS-SINUS-TACHY-CLOSE-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-TACHY-CLOSE-03: Cannot close an event that has been editing/viewing by other users
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Cannot close an event that has been editing/viewing by other users
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     - 1. Other users [User 2] - Go to Event details page of an event that is being processed by this user [User 1]
    ...     - 2. [User 1] - Hover over an event card and click [Close] button
    ...
    ...     Expected Results:
    ...     The [Close] button is unclickabled

    [Tags]      BFCC-TECH-EVENTS-SINUS-TACHY-CLOSE-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-TACHY-CLOSE-04: Close multiple events as Valid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can close multiple events as Valid
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Select one or multiple checkboxes (open an event in a new tab)
    ...     2. Click [Select All] button
    ...     3. Click [Close as Valid] button
    ...     4. Check status of event in step 1 (including validity and close status)
    ...
    ...     Expected Results:
    ...     1. In step 1: The event card is highlighted, the toolbar shall replace all the sub-tabs, including: the number of
    ...     selected events, Select All button, Close As Valid button, Close As Valid button
    ...     2. In step 2, all loaded events shall be highlighted and the total number of selected events displayed properly
    ...     3. In step 3, all events shall be closed as valid status with the event type detected by the AI, except for Manual events
    ...     and event strip shall not be included in the report, except for Manual events
    ...     4. In step 4, event is closed as valid

    [Tags]      BFCC-TECH-EVENTS-SINUS-TACHY-CLOSE-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-TACHY-CLOSE-05: Close multiple events as Invalid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can close multiple events as Valid
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Select one or multiple checkboxes (open an event in a new tab)
    ...     2. Click [Select All] button
    ...     3. Click [Close as Invalid] button
    ...     4. Check status of event in step 1 (including validity and close status)
    ...
    ...     Expected Results:
    ...     1. In step 1: The event card is highlighted, the toolbar shall replace all the sub-tabs, including: the number of
    ...     selected events, Select All button, Close As Valid button, Close As Valid button
    ...     2. In step 2, all loaded events shall be highlighted and the total number of selected events displayed properly
    ...     3. In step 3, in step 4, all events shall be closed as invalid status

    [Tags]      BFCC-TECH-EVENTS-SINUS-TACHY-CLOSE-05       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-TACHY-CLOSE-06: Cannot close an event that has been editing/viewing by other users
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Cannot close an event that has been editing/viewing by other users
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     - 1. Other users [User 2] - Go to Event details page of an event that is being processed by this user [User 1]
    ...     - 2. [User 1] - Select a checkbox of an event that mentioned in step 1
    ...
    ...     Expected Results:
    ...     -   The checkbox of an event card shall be disabled when the event is being edited

    [Tags]      BFCC-TECH-EVENTS-SINUS-TACHY-CLOSE-06       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-TACHY-ECG-01: View full ECG strip
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view full ECG strip
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Hover over the strip image of the event card and click on it
    ...
    ...     Expected Results:
    ...     -   The Open new tab button shall also be displayed on the right corner of the screen,
    ...     next to the Close button
    ...     -   Each image presents 10-second data. The user shall scroll down or up to view other strips
    ...     in the zoomed-in version

    [Tags]      BFCC-TECH-EVENTS-SINUS-TACHY-ECG-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-SINUS-TACHY-OPEN-01: Open event in a new tab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can open event in a new tab
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. In each event card, click [Open in a new tab] icon
    ...     2. In zoom-in mode, click [Open] button
    ...
    ...     Expected Results:
    ...     -   The user shall be navigated to Event Details page

    [Tags]      BFCC-TECH-EVENTS-SINUS-TACHY-OPEN-01        auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Sinus Tachy
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}        Get Open Events
    View Open Events Details On    row=1        # First event
    ${page_header}          Get Current Page Header
    ${event_summary}        Get Event Summary
    ${event_id}             Evaluate        "${event_summary['EVENT ID'].split('\n')[0]}"
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}        EVENT
    Run Keyword And Continue On Failure    Should Be Equal    ${events}[0][Study ID]     ${event_summary}[STUDY ID]
    Run Keyword And Continue On Failure    Should Be Equal    ${events}[0][Event ID]     ${event_id}

BFCC-TECH-EVENTS-SINUS-TACHY-SEARCH-01: Search for event list by study ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for event list by study ID
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Input a study ID into the search bar, then press Enter key to search
    ...     2. Click [x] button next to [Stop Processing] button
    ...
    ...     Expected Results:
    ...     1. The system shall filter and display the result accordingly with the search value
    ...     2. Exit search mode

    [Tags]      BFCC-TECH-EVENTS-SINUS-TACHY-SEARCH-01      auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Sinus Brady
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}    Get Open Events
    ${text}      Set Variable    ${events}[0][Study ID]
    Filter Events    text_search=${text}
    ${events}    Get Open Events
    Run Keyword And Continue On Failure    Should Not Be Empty    ${events}     No event found - with text search ${text}
    Run Keyword And Continue On Failure    Should Be True         all('${text}' == event['Study ID'] for event in ${events})
    Filter Events       exit_search_mode=${True}
    ${search_bar}       Check Open Event Items Available        search bar
    Run Keyword And Continue On Failure    Should Be Equal    ${search_bar}[search bar]     ${False}

BFCC-TECH-EVENTS-SINUS-TACHY-LOADMORE-01: Load more events
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can load more events
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Scroll to the end of the list
    ...     2. Click [Load more] button
    ...
    ...     Expected Results:
    ...     -   The system shall load 10 events at a time
    ...     -   There are no more events to load, a message saying: “No more events available” shall be displayed

    [Tags]      BFCC-TECH-EVENTS-SINUS-TACHY-LOADMORE-01        auto
    # Required data > 20 events
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events       event_bucket=Sinus Tachy
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Length Should Be    ${events}      10
    # Load more
    Load More Open Events
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Length Should Be    ${events}      20

BFCC-TECH-EVENTS-SINUS-TACHY-QUICKACCESS-01: Quick access to study information
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can quick access to study information
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Click [Study ID] hyperlink
    ...
    ...     Expected Results:
    ...     The Study Information sidebar displays the following information:
    ...     1.  Study Information:  In the case a study has been canceled, a message stating: “ This study has been
    ...     aborted and will not be counted toward your billing.” shall be displayed on top of the Study Information section
    ...         -   Study status
    ...         -   Start time
    ...         -   End time
    ...         -   Study type
    ...         -   Patient return visit date
    ...         -   Device ID: If the device is an End-of-life device, there shall be an EOL tag next to the device ID
    ...         -   Study duration
    ...         -   Facility
    ...         -   Total artifact percentage - Flagged issue tag
    ...     2. Study notes
    ...     3. Physician Amendments notes
    ...     4. Referring physician: Physician name, Day phone number, After hours phone number, Fax number, Email address
    ...     5. Interpreting physician: Physician name, Day phone number, After hours phone number, Fax number, Email address
    ...     6. A link for the user to go to the study management page of the study
    ...     7. Follow-on study tracking (if study type is Holter and Follow on study)

    [Tags]      BFCC-TECH-EVENTS-SINUS-TACHY-QUICKACCESS-01     auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Sinus Tachy
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}       Get Open Events
    View Open Events Study Information On    row=1
    ${study_info}       Get Study Information
    ${study_section}    Evaluate    [k for k, v in ${study_info}.items()]  # Headers
    ${study_details}    Evaluate    [k for k, v in ${study_info}[STUDY INFORMATION].items()]  # headers of study information field
    ${referring_phy}    Evaluate    [k for k, v in ${study_info}[REFERRING PHYSICIAN].items()]  # headers of referring physician field
    ${interpre_phy}     Evaluate    [k for k, v in ${study_info}[INTERPRETING PHYSICIAN].items()]  # headers of interpreting physician field
    ${ex_study_section}     Create List     STUDY INFORMATION    STUDY NOTES     PHYSICIAN AMENDMENTS NOTES    REFERRING PHYSICIAN    INTERPRETING PHYSICIAN
    ${ex_study_details}     Create List     Status     Start Time    End Time    Study Type     Patient Return Visit     Device ID    Duration    Facility   Total artifact percentage      EOL
    ${ex_referring_phy}     Create List     Name    Day Phone    After Hours Phone    Email    Fax Number
    ${ex_interpre_phy}      Create List     Name    Day Phone    After Hours Phone    Email    Fax Number
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_study_section}    ${study_section}
    # Study details
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_study_details}    ${study_details}
    # Referring physician
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_referring_phy}    ${referring_phy}
    # Interpreting physician
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_interpre_phy}     ${interpre_phy}
    # Stop event processing
    Stop Open Event Processing
    ${events}        Get Open Events
    Run Keyword And Continue On Failure    Should Be Equal    ${events}      Press the button below to start processing events

BFCC-TECH-EVENTS-VIABLE-VIEW-01: View the list without starting the event processing
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list without starting the event processing
    ...
    ...     Precondition:
    ...     -   The CCT has logged in to the portal
    ...
    ...     Test Steps:
    ...     1. Click on Events page >> Open tab >> Viable subtab
    ...     2. Observe the page
    ...
    ...     Expected Results:
    ...     -   This tab displays events in the Viable subtab in Open status
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Viable event is shown on the subtab header
    ...     -   There is a Search icon
    ...     -   The message: "Press the button below to start processing events" shall be displayed and there shall be
    ...     a “Start Event Processing” button by default
    ...     -   “More option” button: The user shall view the events in either two columns or one column.
    ...     The default view shall be two columns

    [Tags]      BFCC-TECH-EVENTS-VIABLE-VIEW-01     auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Viable
    ${events}           Get Open Events
    ${is_starting}      Run Keyword And Return Status    Should Not Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If      '${is_starting}' == '${True}'    Stop Open Event Processing      # Stop event processing if it is starting
    ${event_tab}        Get Current Event State
    ${event_bucket}     Get Current Event Bucket
    Run Keyword And Continue On Failure    Should Contain    ${event_tab}           Open
    Run Keyword And Continue On Failure    Should Contain    ${event_bucket}        Viable
    ${open_event_number}        Evaluate   '${event_tab}'.split()[-1]
    ${event_bucket_number}      Evaluate   '${event_bucket}'.split()[-1]
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${open_event_number}          ${open_event_number}
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${event_bucket_number}        ${event_bucket_number}
    # Search icon
    ${search_icon}        Check Open Event Items Available        Search icon
    Run Keyword And Continue On Failure    Should Be Equal    ${search_icon}[Search icon]     ${True}
    # Message
    ${msg}      Get Open Events
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}      Press the button below to start processing events
    # Start event processing
    Start Open Event Processing
    ${load_more_button}    Check Open Event Items Available        Load more
    Run Keyword And Continue On Failure    Should Be Equal    ${load_more_button}[Load more]     ${True}
    # Event Colum
    ${event_columns}        Get Event Columns
    Run Keyword And Continue On Failure    Should Be Equal    ${event_columns}      Two Columns
    Filter Events    by_layout=One Column
    ${event_columns}        Get Event Columns
    Run Keyword And Continue On Failure    Should Be Equal    ${event_columns}      One Column

BFCC-TECH-EVENTS-VIABLE-VIEW-02: View the list when starting the event processing
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list when starting the event processing
    ...
    ...     Precondition:
    ...     -   The CCT has logged in to the portal
    ...     - Viable subtab was selected during the process of creating/editing a Call Center Technician
    ...     - Viable events shall display events that have AFib with HR 30-150 bpm, events that contain SVES and
    ...     VES beats, or patient-triggered (manual) events that do not meet the conditions of the Priority bucket
    ...     - No one is processing the event to make sure that having event for the user to process
    ...
    ...     Test Steps:
    ...     1. Click on Events page >> Open tab >> Viable subtab
    ...     2. Click "Start Event Processing" button and observe the page
    ...
    ...     Expected Results:
    ...     - 1.  This tab displays events in the Viable subtab in Open status
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Viable event is shown on the subtab header
    ...     -   There is a Search icon
    ...     -   The message: "Press the button below to start processing events" shall be displayed and there shall be
    ...     a “Start Event Processing” button by default
    ...     -   “More option” button: The user shall view the events in either two columns or one column.
    ...     The default view shall be two columns
    ...     - 2. The system will load 10 events onto the page for the user to process
    ...     -   Each event card shall display the following information/UI components:
    ...         -   Study ID (Quick access hyperlink for Study Information)
    ...         -   Event ID
    ...         -   Avatar: Avatar of the Call Center users shall be displayed on the event card when they are editing
    ...     an event. Avatar of the Call Center users shall be hidden when the user hovers over the event card
    ...         -   Checkbox
    ...         -   Strip images
    ...         -   Event type: Manual or Auto
    ...         -   AI suggests
    ...         -   Open new tab Button
    ...         -   Close button
    ...     -   There shall be a "Load more" button at the end of the list
    ...     - "Stop processing" button

    [Tags]      BFCC-TECH-EVENTS-VIABLE-VIEW-02     auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Viable
    ${events}           Get Open Events
    ${is_starting}      Run Keyword And Return Status    Should Not Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If      '${is_starting}' == '${True}'    Stop Open Event Processing      # Stop event processing if it is starting
    ${event_tab}        Get Current Event State
    ${event_bucket}     Get Current Event Bucket
    Run Keyword And Continue On Failure    Should Contain    ${event_tab}           Open
    Run Keyword And Continue On Failure    Should Contain    ${event_bucket}        Viable
    ${open_event_number}        Evaluate   '${event_tab}'.split()[-1]
    ${event_bucket_number}      Evaluate   '${event_bucket}'.split(' | ')[-1]
    # Verify event state and bucket contains number
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${open_event_number}          ${open_event_number}
    Run Keyword And Continue On Failure    Should Be Equal As Integers      ${event_bucket_number}        ${event_bucket_number}
    ${search_icon}        Check Open Event Items Available      Search icon
    Run Keyword And Continue On Failure    Should Be Equal    ${search_icon}[Search icon]     ${True}
    # Start event processing
    Start Open Event Processing
    ${events}           Get Open Events
    # Event items size/page
    Run Keyword And Continue On Failure    Length Should Be    ${events}        10
    # items header
    ${event_info}       Evaluate           [header for header, content in ${events}[0].items()]
    ${expected_info}        Create List    Study ID     Event ID     AI suggest     Event Type     Strip Image
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_info}       ${expected_info}
    # check Load more button
    ${attribute}        Check Open Event Items Available       Load more, Close all
    Run Keyword And Continue On Failure    Should Be Equal    ${attribute}[Load more]       ${True}

BFCC-TECH-EVENTS-VIABLE-VIEW-03: View the list when having no event in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list when having no event in the system
    ...
    ...     Precondition:
    ...     -   The CCT has logged in to the portal
    ...
    ...     Test Steps:
    ...     1. Click on Events page >> Open tab >> Viable subtab
    ...     2. Observe the page
    ...
    ...     Expected Results:
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Viable event (0 event) is shown on the subtab header
    ...     -   There is a Search icon (unclickable)
    ...     -   The “Start Event Processing” button shall be hidden
    ...     -   “More option” button (unclickable)

    [Tags]      BFCC-TECH-EVENTS-VIABLE-VIEW-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-VIABLE-VIEW-04: View the list when all events have been distributed to other users
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View the list when all events have been distributed to other users
    ...
    ...     Precondition:
    ...     - The CCT has logged in to the portal
    ...     - All events in Viable tab have been distributed to other users
    ...
    ...     Test Steps:
    ...     - 1. Click on Events page >> Open tab >> Viable subtab
    ...     - 2. Click "Start Event Processing" and observe the page
    ...
    ...     Expected Results:
    ...     -   The total number of Open events is shown on the tab header
    ...     -   The total number of Priority event is shown on the subtab header
    ...     -   There is a Search icon (unclickable)
    ...     -   A message stating: “No more event for you to process at this time.” shall be displayed on the screen
    ...     -   “More option” button (unclickable)

    [Tags]      BFCC-TECH-EVENTS-VIABLE-VIEW-04        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-VIABLE-STOP-01: Stop event processing
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can stop event processing on VIABLE Events subtab
    ...
    ...     Precondition:
    ...     - The CCT has already start event processing
    ...
    ...     Test Steps:
    ...     1. Click [Stop Processing] button
    ...
    ...     Expected Results:
    ...     -   All events shall be hidden

    [Tags]      BFCC-TECH-EVENTS-VIABLE-STOP-01     auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Viable
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Should Not Be Empty    ${events}     No event found
    # Stop event processing
    Stop Open Event Processing
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Should Be Equal    ${events}     Press the button below to start processing events

BFCC-TECH-EVENTS-VIABLE-CLOSE-01: Close an event as Valid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can close an event as Valid
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Open an event in a new tab
    ...     2. Hover over an event card and click [Close] button
    ...     3. Select [Close as Valid] button
    ...     4. Check status of event in step 1 (including validity and close status)
    ...
    ...     Expected Results:
    ...     - In step 2, the event shall be closed as valid status with the event type detected by the AI, except for Manual events
    ...     and event strip shall not be included in the report, except for Manual events
    ...     - In step 4, event is closed as valid

    [Tags]      BFCC-TECH-EVENTS-VIABLE-CLOSE-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-VIABLE-CLOSE-02: Close an event as Invalid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can close an event as Invalid
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Open an event in a new tab
    ...     2. Hover over an event card and click [Close] button
    ...     3. Select [Close as Invalid] button
    ...     4. Check status of event in step 1 (including validity and close status)
    ...
    ...     Expected Results:
    ...     The event shall be closed as invalid status

    [Tags]      BFCC-TECH-EVENTS-VIABLE-CLOSE-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-VIABLE-CLOSE-03: Cannot close an event that has been editing/viewing by other users
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Cannot close an event that has been editing/viewing by other users
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     - 1. Other users [User 2] - Go to Event details page of an event that is being processed by this user [User 1]
    ...     - 2. [User 1] - Hover over an event card and click [Close] button
    ...
    ...     Expected Results:
    ...     The [Close] button is unclickabled

    [Tags]      BFCC-TECH-EVENTS-VIABLE-CLOSE-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-VIABLE-CLOSE-04: Close multiple events as Valid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can close multiple events as Valid
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Select one or multiple checkboxes (open an event in a new tab)
    ...     2. Click [Select All] button
    ...     3. Click [Close as Valid] button
    ...     4. Check status of event in step 1 (including validity and close status)
    ...
    ...     Expected Results:
    ...     1. In step 1: The event card is highlighted, the toolbar shall replace all the sub-tabs, including: the number of
    ...     selected events, Select All button, Close As Valid button, Close As Valid button
    ...     2. In step 2, all loaded events shall be highlighted and the total number of selected events displayed properly
    ...     3. In step 3, all events shall be closed as valid status with the event type detected by the AI, except for Manual events
    ...     and event strip shall not be included in the report, except for Manual events
    ...     4. In step 4, event is closed as valid

    [Tags]      BFCC-TECH-EVENTS-VIABLE-CLOSE-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-VIABLE-CLOSE-05: Close multiple events as Invalid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can close multiple events as Valid
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     1. Select one or multiple checkboxes (open an event in a new tab)
    ...     2. Click [Select All] button
    ...     3. Click [Close as Invalid] button
    ...     4. Check status of event in step 1 (including validity and close status)
    ...
    ...     Expected Results:
    ...     1. In step 1: The event card is highlighted, the toolbar shall replace all the sub-tabs, including: the number of
    ...     selected events, Select All button, Close As Valid button, Close As Valid button
    ...     2. In step 2, all loaded events shall be highlighted and the total number of selected events displayed properly
    ...     3. In step 3, in step 4, all events shall be closed as invalid status

    [Tags]      BFCC-TECH-EVENTS-VIABLE-CLOSE-05       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-VIABLE-CLOSE-06: Cannot close an event that has been editing/viewing by other users
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Cannot close an event that has been editing/viewing by other users
    ...
    ...     Precondition:
    ...     - The CCT has already started event processing
    ...
    ...     Test Steps:
    ...     - 1. Other users [User 2] - Go to Event details page of an event that is being processed by this user [User 1]
    ...     - 2. [User 1] - Select a checkbox of an event that mentioned in step 1
    ...
    ...     Expected Results:
    ...     -   The checkbox of an event card shall be disabled when the event is being edited

    [Tags]      BFCC-TECH-EVENTS-VIABLE-CLOSE-06       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-VIABLE-ECG-01: View full ECG strip
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view full ECG strip
    ...
    ...     Precondition:
    ...     - The CCT has already start event processing
    ...
    ...     Test Steps:
    ...     1. Hover over the strip image of the event card and click on it
    ...
    ...     Expected Results:
    ...     -   The Open new tab button shall also be displayed on the right corner of the screen,
    ...     next to the Close button
    ...     -   Each image presents 10-second data. The user shall scroll down or up to view other strips
    ...     in the zoomed-in version

    [Tags]      BFCC-TECH-EVENTS-VIABLE-ECG-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-EVENTS-VIABLE-OPEN-01: Open event in a new tab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can open event in a new tab
    ...
    ...     Precondition:
    ...     - The CCT has already start event processing
    ...
    ...     Test Steps:
    ...     1. In each event card, click [Open in a new tab] icon
    ...     2. In zoom-in mode, click [Open] button
    ...
    ...     Expected Results:
    ...     -   The user shall be navigated to Event Details page

    [Tags]      BFCC-TECH-EVENTS-VIABLE-OPEN-01     auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Viable
    ${events}        Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}        Get Open Events
    View Open Events Details On    row=1        # First event
    ${page_header}          Get Current Page Header
    ${event_summary}        Get Event Summary
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}        EVENT
    Run Keyword And Continue On Failure    Should Contain     ${event_summary}[STUDY ID]        ${events}[0][Study ID]
    Run Keyword And Continue On Failure    Should Contain     ${event_summary}[EVENT ID]        ${events}[0][Event ID]

BFCC-TECH-EVENTS-VIABLE-SEARCH-01: Search for event list by study ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for event list by study ID
    ...
    ...     Precondition:
    ...     - The CCT has already start event processing
    ...
    ...     Test Steps:
    ...     1. Input a study ID into the search bar, then press Enter key to search
    ...     2. Click [x] button next to [Stop Processing] button
    ...
    ...     Expected Results:
    ...     1. The system shall filter and display the result accordingly with the search value
    ...     2. Exit search mode

    [Tags]      BFCC-TECH-EVENTS-VIABLE-SEARCH-01       auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Viable
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}    Get Open Events
    ${text}      Set Variable    ${events}[0][Study ID]
    Filter Events    text_search=${text}
    ${events}    Get Open Events
    Run Keyword And Continue On Failure    Should Not Be Empty    ${events}     No event found - with text search ${text}
    Run Keyword And Continue On Failure    Should Be True         all('${text}' == event['Study ID'] for event in ${events})
    Filter Events       exit_search_mode=${True}
    ${search_bar}       Check Open Event Items Available        search bar
    Run Keyword And Continue On Failure    Should Be Equal    ${search_bar}[search bar]     ${False}

BFCC-TECH-EVENTS-VIABLE-LOADMORE-01: Load more events
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can load more events
    ...
    ...     Precondition:
    ...     - The CCT has already start event processing
    ...
    ...     Test Steps:
    ...     1. Scroll to the end of the list
    ...     2. Click [Load more] button
    ...
    ...     Expected Results:
    ...     -   The system shall load 10 events at a time
    ...     -   There are no more events to load, a message saying: “No more events available” shall be displayed

    [Tags]      BFCC-TECH-EVENTS-VIABLE-LOADMORE-01     auto
    # Required data > 20 events
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events       event_bucket=Viable
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Length Should Be    ${events}      10
    # Load more
    Load More Open Events
    ${events}       Get Open Events
    Run Keyword And Continue On Failure    Length Should Be    ${events}      20

BFCC-TECH-EVENTS-VIABLE-QUICKACCESS-01: Quick access to study information
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can quick access to study information
    ...
    ...     Precondition:
    ...     - The CCT has already start event processing
    ...
    ...     Test Steps:
    ...     1. Click [Study ID] hyperlink
    ...
    ...     Expected Results:
    ...     The Study Information sidebar displays the following information:
    ...     1.  Study Information:  In the case a study has been canceled, a message stating: “ This study has been
    ...     aborted and will not be counted toward your billing.” shall be displayed on top of the Study Information section
    ...         -   Study status
    ...         -   Start time
    ...         -   End time
    ...         -   Study type
    ...         -   Patient return visit date
    ...         -   Device ID: If the device is an End-of-life device, there shall be an EOL tag next to the device ID
    ...         -   Study duration
    ...         -   Facility
    ...         -   Total artifact percentage - Flagged issue tag
    ...     2. Study notes
    ...     3. Physician Amendments notes
    ...     4. Referring physician: Physician name, Day phone number, After hours phone number, Fax number, Email address
    ...     5. Interpreting physician: Physician name, Day phone number, After hours phone number, Fax number, Email address
    ...     6. A link for the user to go to the study management page of the study
    ...     7. Follow-on study tracking (if study type is Holter and Follow on study)

    [Tags]      BFCC-TECH-EVENTS-VIABLE-QUICKACCESS-01      auto
    Navigate To Events
    Navigate To Event Menu    Open
    Filter Events    event_bucket=Viable
    ${events}       Get Open Events
    ${is_not_start}    Run Keyword And Return Status    Should Be Equal    ${events}     Press the button below to start processing events
    Run Keyword If    '${is_not_start}' == '${True}'    Start Open Event Processing   # Start event processing
    ${events}       Get Open Events
    View Open Events Study Information On    row=1
    ${study_info}       Get Study Information
    ${study_section}    Evaluate    [k for k, v in ${study_info}.items()]  # Headers
    ${study_details}    Evaluate    [k for k, v in ${study_info}[STUDY INFORMATION].items()]  # headers of study information field
    ${referring_phy}    Evaluate    [k for k, v in ${study_info}[REFERRING PHYSICIAN].items()]  # headers of referring physician field
    ${interpre_phy}     Evaluate    [k for k, v in ${study_info}[INTERPRETING PHYSICIAN].items()]  # headers of interpreting physician field
    ${ex_study_section}     Create List     STUDY INFORMATION    STUDY NOTES     PHYSICIAN AMENDMENTS NOTES    REFERRING PHYSICIAN    INTERPRETING PHYSICIAN     FOLLOW-ON STUDY TRACKING
    ${ex_study_details}     Create List     Status     Start Time    End Time    Study Type     Patient Return Visit     Device ID    Duration    Facility   Total artifact percentage      EOL
    ${ex_referring_phy}     Create List     Name    Day Phone    After Hours Phone    Email    Fax Number
    ${ex_interpre_phy}      Create List     Name    Day Phone    After Hours Phone    Email    Fax Number
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_study_section}    ${study_section}
    # Study details
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_study_details}    ${study_details}
    # Referring physician
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_referring_phy}    ${referring_phy}
    # Interpreting physician
    Run Keyword And Continue On Failure     List Should Contain Sub List     ${ex_interpre_phy}     ${interpre_phy}
    # Stop event processing
    Stop Open Event Processing
    ${events}        Get Open Events
    Run Keyword And Continue On Failure    Should Be Equal    ${events}      Press the button below to start processing events

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_callcenter_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/Events.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/EventDetails.py       ${BROWSER_NODE}     ${ENV}
    ${USERS}             Get Config Param    NEW_USERS
    ${CURRENT_USER}      Set Variable        ${USERS}[callcenter_technician_event]
    ${RELEASE_VERSION}   Navigate To Callcenter Sign In Page
    ${TOKEN}             Sign In Callcenter    username=${CURRENT_USER}[username]     password=${CURRENT_USER}[password]
    Set Suite Variable   ${TOKEN}
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser
