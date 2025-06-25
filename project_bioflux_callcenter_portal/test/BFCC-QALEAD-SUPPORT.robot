*** Settings ***
Documentation   Test Suite - Call Center QA Leader Portal - Support page
Metadata    sid     BFCC-QALEAD-SUPPORT
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library    Collections
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_callcenter_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_callcenter_portal/lib/web/Common.py
Library     project_bioflux_callcenter_portal/lib/web/Support.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BFCC-QALEAD-SUPPORT     web
Test Timeout    1h

*** Test Cases ***
BFCC-QALEAD-SUPPORT-VIEW-01: View list of Support requests on the Open tab
    [Documentation]   Author: Trinh Nguyen
    ...     Description: The Call Center QA, QA Leader and Supervisor can view list of Support requests
    ...
    ...     Precondition:
    ...     - The is on the Support request page
    ...
    ...     Test Steps:
    ...     1. Click the Open tab
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. All the request from Clinic protal shall be displayed with the following categories:
    ...     - Change study type
    ...     - Abort study
    ...     - Report request
    ...     2. The list of requests shall be displayed with the following information:
    ...     - Request ID
    ...     - Request Time - the time of Clinic user creating ticket
    ...     - Facility - hyperlink
    ...     - Category
    ...     - Requester
    ...     3. In case the request has new message in 'Communication', there shall be an icon to display on the list
    ...     - The user goes to the details ticket, the icon will disappear on the list

    [Tags]  BFCC-QALEAD-SUPPORT-VIEW-01    CP-2.12.0    auto
    Navigate To Support
    Navigate To Support Menu    Open
    ${options}      Get Support Filter Options
    ${values}       Create List    All requests      Report request      Change study type       Abort study
    Run Keyword And Continue On Failure    Should Be Equal    ${options}[Category]      ${values}
    ${requests}     Get Open Supports       row=1
    ${request_header}     Evaluate    [k for k, v in ${requests}.items()]
    ${headers}      Create List     Request ID      Request Time    Facility        Category        Requestor
    Run Keyword And Continue On Failure    Should Be Equal    ${request_header}     ${headers}

BFCC-QALEAD-SUPPORT-VIEW-02: View list of Support request on the Resolved tab
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The Call Center QA, QA Leader and Supervisor can view list of Support requests
    ...
    ...     Precondition:
    ...     - The user is on the support page
    ...
    ...     Test Steps:
    ...     1. Click the Resolved tab
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. All the requests that are resolved by Call Center users shall be displayed
    ...     2. The list of requests shall be displayed with the following information:
    ...     - Request ID
    ...     - Request Time - the time of Clinic user creating ticket
    ...     - Facility - hyperlink
    ...     - Category
    ...     - Requester
    ...     - Resolved Time - the time of Call Center user resolving ticket
    ...     - Resolved By

    [Tags]  BFCC-QALEAD-SUPPORT-VIEW-02  CP-2.12.0    auto
    Navigate To Support
    Navigate To Support Menu    Resolved
    ${supports}      Get Resolved Supports   row=1
    Run Keyword And Continue On Failure    Should Not Be Empty    ${supports}       No resolved support found
    ${data_header}          Evaluate    [k for k, v in ${supports}.items()]
    ${expected_header}      Create List    Request ID    Request Time    Facility    Category    Requestor   Resolved Time    Resolved By
    Run Keyword And Continue On Failure     Should Be Equal    ${data_header}       ${expected_header}

BFCC-QALEAD-SUPPORT-VIEW-03: Check pagination tool works properly
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The support request lists are divided into pages
    ...
    ...     Precondition: The user is on Open/Resolved tab of the Support page
    ...
    ...     Test Steps:
    ...     1. Observe the pagination tool displays at the bottom of the table
    ...     2. Select value "30 rows" from the dropdown box
    ...     3. Select value "50 rows" from the dropdown box
    ...     4. Click [>]/[<] button
    ...
    ...     Expected Results:
    ...     1. In step 1:
    ...     -   There shall be a dropdown box with values (10 rows - 30 rows - 50 rows) to be selected
    ...     -   The default value of the dropdown box is 10 rows
    ...     -   If the device list is less than 10 then the pagination tool shall be hidden
    ...     2. In step 2:
    ...     -   The list shall displays a maximum of 30 items per page
    ...     3. In step 3:
    ...     -   The list shall displays a maximum of 50 items per page
    ...     4. In step 4:
    ...     -   The user shall be able to navigate between loaded pages

    [Tags]      BFCC-QALEAD-SUPPORT-VIEW-03  CP-2.16.4       auto
    Navigate To Support
    Navigate To Support Menu    Resolved
    Filter Support     facility=All facilities      by_category=All requests
    ${supports}      Get Resolved Supports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${supports}
    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${supports}                      10
#    Pagination Reports    next_or_previous=next
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
#    Pagination Reports    next_or_previous=previous
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Custom Reports Size Rows    rows=30 rows
#    ${current_pagination}     Get Current Pagination
#    ${supports}        Get Resolved Supports
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${supports}                      30
#    Custom Reports Size Rows    rows=50 rows
#    ${current_pagination}     Get Current Pagination
#    ${supports}        Get Resolved Supports
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${supports}                      50

BFCC-QALEAD-SUPPORT-SEARCH-01: Search in report requests list
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The Call Center QA, QA Leader and Supervisor can search for requests on the support requests list
    ...
    ...     Precondition:
    ...     - The user is on the Open/Resolved tab of the customer support page
    ...
    ...     Test Steps:
    ...     1. Click and enter the Request ID criteria on the search bar
    ...     2. Switch the tabs on the page
    ...
    ...     Expected Results:
    ...     1. At step 1, the search result shall be displayed
    ...     2. At step 2, the search value and its result should remain until it cleared out

      [Tags]  BFCC-QALEAD-SUPPORT-SEARCH-01  CP-2.12.0      auto
      Navigate To Support
      Navigate To Support Menu    Open
      ${requests}       Get Open Supports
      ${text}           Set Variable    ${requests}[0][Request ID]
      Filter Support    text_search=${text}
      ${requests}       Get Open Supports
      Run Keyword And Continue On Failure    Should Not Be Empty    ${requests}     No request found - with text search ${text}
      Run Keyword And Continue On Failure    Should Be Equal As Integers    ${requests}[0][Request ID]      ${text}
      # Open tab
      ${open_values}         Get Support Current Filter Values
      Run Keyword And Continue On Failure    Should Be Equal    ${open_values}[Text Search]     ${text}
      # Resolved tab
      Navigate To Support Menu    Resolved
      ${resolved_values}     Get Support Current Filter Values
      Run Keyword And Continue On Failure    Should Be Equal    ${open_values}[Text Search]     ${resolved_values}[Text Search]
      # Clear and verify text search
      Clear Support Text Search
      ${search_values}       Get Support Current Filter Values
      Run Keyword And Continue On Failure    Should Be Empty    ${search_values}[Text Search]

BFCC-QALEAD-SUPPORT-FILTER-01: Filter the list of Support requests
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The Call Center QA, QA Leader and Supervisor can filter the list of Support requests by
    ...     the following categories
    ...
    ...     Precondition:
    ...     - The user is on the Open/Resolved tab of the customer support page
    ...
    ...     Test Steps:
    ...     1. Click on the categories dropdown list
    ...     2. Select a specific category
    ...     3. Observe filter result
    ...
    ...     Expected Results:
    ...     1. At the step 1, the list of categories shall be displayed with the following:
    ...     - All requests (default value)
    ...     - Abort study
    ...     - Change study type
    ...     - Report request
    ...     2. The filter result shall be displayed
    ...     3. When the user switches the tabs on the page the filter value and its result should remain until it is
    ...     cleared out

    [Tags]  BFCC-QALEAD-SUPPORT-FILTER-01    CP-2.12.0      auto
    [Template]    Filter Support Request
    Abort study
    Change study type
    Report request
    All requests

BFCC-QALEAD-SUPPORT-FILTER-FACILITY-01-CP2.16.4: View the name of the facility in case the user only associates with one facility
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Call Center Portal
    ...
    ...     Test Steps:
    ...     1. Click the Support page
    ...     2. Observe the header of Support page
    ...
    ...     Epected Results:
    ...     1. The facility name is displayed on the header of the Support page
    ...     2. All the data associated with that facility shall be displayed

    [Tags]  BFCC-QALEAD-SUPPORT-FILTER-FACILITY-01-CP2.16.4  CP-2.16.4       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BFCC-QALEAD-SUPPORT-FILTER-FACILITY-02: Select a specific facility in case the user associates with multiples facility
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can select a specific facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Call Center Portal
    ...     - The Admin portal has associated the account with multiples facilities
    ...     Test Steps:
    ...     1. Click the Support page
    ...     2. Click on the drop-down list on the header of the Support page
    ...     3. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the Support page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly

   [Tags]  BFCC-QALEAD-SUPPORT-FILTER-FACILITY-02  CP-2.16.4       auto
    Navigate To Support
    Navigate To Support Menu    Resolved
    ${supports}      Get Resolved Supports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${supports}
    ${filter_options}       Get Filter Facilities Options
    ${actual_facilities}           Set Variable    ${filter_options}[Facilities]
    Filter Support         facility=${actual_facilities}[1]
    ${supports}          Get Resolved Supports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${supports}      No completed studies found - with facility '${actual_facilities}[1]'
    Filter Support     facility=${actual_facilities}[2]
    ${supports}          Get Resolved Supports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${supports}      No completed studies found - with facility '${actual_facilities}[2]'
    Filter Support     facility=All facilities
    ${supports}          Get Resolved Supports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${supports}      No completed studies found - with facility 'All facilities'
    
BFCC-QALEAD-SUPPORT-SORT-01: Sort the Support request list manually
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can sort the support request list manually
    ...
    ...     Precondition:
    ...     - The user is on Open/Resolved tab of the Support page
    ...
    ...     Test Steps:
    ...     1. Click the [Sort] button next to the Request ID
    ...     2. Click the [Sort] button next to the Request ID again
    ...
    ...     Expected Results:
    ...     1. The Support request list shall sort from largest to smallest
    ...     2. The Support request list shall sort from smallest to largest

   [Tags]  BFCC-QALEAD-SUPPORT-SORT-01  CP-2.16.4      auto
    Navigate To Support
    Navigate To Support Menu    Resolved
    ${supports}      Get Resolved Supports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${supports}
    ${filter_options}       Get Filter Facilities Options
    ${actual_facilities}           Set Variable    ${filter_options}[Facilities]
    Filter Support         facility=${actual_facilities}[2]
    ${reports}      Get Resolved Supports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${supports}
    # sort descending
    Sort Resolved Support      desc
    ${supports}      Get All Supports
    ${request_id}       Evaluate    [item['Request ID'] for item in ${supports}]
    ${descending_request_id}      Evaluate    sorted(${request_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${request_id}        ${descending_request_id}
    # sort ascending
    Sort Resolved Support      asc
    ${supports}      Get All Supports
    ${request_id}       Evaluate    [item['Request ID'] for item in ${supports}]
    ${ascending_request_id}      Evaluate    sorted(${request_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${request_id}        ${ascending_request_id}

BFCC-QALEAD-SUPPORT-VIEW-DETAILS-OPEN-01: View details of open support request
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The Call Center QA, QA Leader and Supervisor can view details of open support request
    ...
    ...     Precondition:
    ...     - The user is on the Open tab of the customer support page
    ...
    ...     Test Steps:
    ...     1. Hover over a specific Request ID, select the View button
    ...     2. Observe the Header information
    ...     3. Observe the Request's information
    ...     4. Observe the Participant
    ...     5. Observe the Communication
    ...     6. Observe the Internal notes
    ...
    ...     Expected Results:
    ...     1. At the step 1, the user is on the details of support request
    ...     2. At step 2, the user should able to view the following information:
    ...     - Request ID
    ...     - Facility - hyperlink
    ...     - Category
    ...     3. At step 3, there should be an Information section and its content depends on the chosen Category
    ...     - Change study type:
    ...     + Study ID
    ...     + Current study type
    ...     + New study type
    ...     + Message from Clinic portal
    ...     - Abort study/Report request
    ...     + Study ID
    ...     + Message from Clinic portal
    ...     4. At step 4, there shall be a Participant section, it will display the people (avatar and name) who have
    ...     the following action:
    ...     - Completed the request
    ...     - Leave the message
    ...     - Requester
    ...     - Re-open the request
    ...     5. At step 5, there shall be an input field for the user to leave the message:
    ...     - There shall be a ‘Send’ button:
    ...     + Clicking on the button shall add the message to the section
    ...     + The button shall be disabled until there is a data in the input field
    ...     - Once the message is submitted or actions to be taken in relation to this request, each message shall
    ...     display with the following information
    ...     + Avatar
    ...     + Name
    ...     + Date and time
    ...     + Message or action description
    ...     6. At step 6, observe the Internal notes section:
    ...     - Should have a text field for typing text entries
    ...     - Should have an Add Internal Notes button for saving the text entry
    ...     - When the log entry is submitted, it is displayed on the Internal notes, basing on the structure (Name+
    ...     role + date and time] and the content
    ...
    ...     **Others**
    ...     Update Date: 8/15/2023 - Trinh Nguyen

    [Tags]  BFCC-QALEAD-SUPPORT-VIEW-DETAILS-OPEN-01   CP-2.12.0    auto     CP-2.16.4
    Navigate To Support
    Navigate To Support Menu    open
    Filter Support    by_category=Report request
    ${supports}     Get Open Supports
    Run Keyword And Continue On Failure    Should Not Be Empty      ${supports}
    Filter Support    text_search=${supports}[0][Request ID]
    ${supports}     Get Open Supports
    Run Keyword And Continue On Failure    Should Not Be Empty      ${supports}
    View Open Support Request On    row=1
    ${request_details}     Get Support Request Details
    # Header
    Run Keyword And Continue On Failure    Should Be Equal    ${supports}[0][Request ID]        ${request_details}[Header][Request ID]
    Run Keyword And Continue On Failure    Should Be Equal    ${supports}[0][Facility]        ${request_details}[Header][Facility]
    Run Keyword And Continue On Failure    Should Be Equal    ${supports}[0][Category]        ${request_details}[Header][Request Type]
    # Request by Abort study/Report request
    Run Keyword And Continue On Failure    Should Not Be Empty    ${request_details}[Requests][Study ID]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${request_details}[Requests][Message]
    # Communication
    ${message}     Send Support Request    support request
    ${request_details}     Get Support Request Details
    Run Keyword And Continue On Failure    List Should Contain Value       ${request_details}[Communication][Description]        ${message}
    ${actual_communication}      Evaluate        [k for k, v in ${request_details}[Communication].items()]
    ${expected_communicaation}      Create List    Avatar   Name   DateTime    Description
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${actual_communication}     ${expected_communicaation}
    # Internal notes
    ${internal_notes}   Send Internal Note    internal notes message
    ${request_details}     Get Support Request Details
    Run Keyword And Continue On Failure    List Should Contain Value       ${request_details}[Internal][Description]        ${internal_notes}

BFCC-QALEAD-SUPPORT-DETAILS-RESOLVED-01-CP2.16.4: View details of resolved support request
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The Call Center QA, QA Leader and Supervisor can view details of resolved support request
    ...
    ...     Precondition:
    ...     - The user is on the Resolved tab of the customer support page
    ...
    ...     Test Steps:
    ...     1. Hover over a specific Request ID, select the View button
    ...     2. Observe the Header information
    ...     3. Observe the Request's information
    ...     4. Observe the Participant
    ...     5. Observe the Internal notes
    ...
    ...     Expected Results:
    ...     1. At the step 1, the user is on the details of support request
    ...     2. At step 2, the user should able to view the following information:
    ...     - Request ID
    ...     - Facility - hyperlink
    ...     - Category
    ...     3. At step 3, there should be an Information section and its content depends on the chosen Category
    ...     - Change study type:
    ...     + Study ID
    ...     + Current study type
    ...     + New study type
    ...     + Message from Clinic portal
    ...     - Abort study/Report request
    ...     + Study ID
    ...     + Message from Clinic portal
    ...     4. At step 4, there shall be a Participant section, it will display the people (avatar and name) who have
    ...     the following action:
    ...     - Completed the request
    ...     - Leave the message
    ...     - Requester
    ...     - Re-open the request
    ...     5. At step 5, observe the Internal notes section:
    ...     - Should have a text field for typing text entries
    ...     - Should have an Add Internal Notes button for saving the text entry
    ...     - When the log entry is submitted, it is displayed on the Internal notes, basing on the structure (Name+
    ...     role + date and time] and the content
    ...
    ...     **Others**
    ...     Update Date: 8/15/2023 - Trinh Nguyen

    [Tags]  BFCC-QALEAD-SUPPORT-DETAILS-RESOLVED-01-CP2.16.4      CP-2.12.0       manual     CP-2.16.4
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-SUPPORT-COMMUNICATION-01: Leave the message in the input field
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The Call Center QA, QA Leader and Supervisor can leave the message in the support request
    ...
    ...     Precondition:
    ...     - The user is on the Open tab of the customer support page
    ...
    ...     Test Steps:
    ...     1. Hover over a specific Request ID, select the View button
    ...     2. Enter message in the input field
    ...     3. Click the Send button
    ...
    ...     Expected Results:
    ...     1. At the step 1, the user shall be navigated to the ticket details page
    ...     2. At step 2, the Send button shall be enabled
    ...     3. The message shall be added to the section

    [Tags]  BFCC-QALEAD-SUPPORT-COMMUNICATION-01   CP-2.12.0       auto       CP-2.16.4
    Navigate To Support
    Navigate To Support Menu    open
    ${supports}     Get Open Supports
    Run Keyword And Continue On Failure    Should Not Be Empty      ${supports}
    ${request_id}       Set Variable    ${supports}[0][Request ID]
    Filter Support    text_search=${request_id}
    View Open Support Request On    row=1
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}         SUPPORT REQUEST
    ${actual_msg}   Send Support Request    Test Message Request
    ${msg_section}     Get Support Request Details
    ${expected_msg}     Set Variable    ${msg_section}[Communication][Description]
    Run Keyword And Continue On Failure    List Should Contain Value     ${expected_msg}        ${actual_msg}

BFCC-QALEAD-SUPPORT-COMMUNICATION-02: Leave a note in the Internal notes text field
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The Call Center QA, QA Leader and Supervisor can leave the note in the Internal notes textfield
    ...
    ...     Precondition:
    ...     - The user is on the Open/Resolved tab of the customer support page
    ...
    ...     Test Steps:
    ...     1. Hover over a specific Request ID, select the View button
    ...     2. Enter note in the Internal notes input field
    ...     3. Click the Add Internal Notes button
    ...
    ...     Expected Results:
    ...     1. At the step 1, the user shall be navigated to the ticket details page
    ...     2. At step 2, the Add Internal Notes button shall be enabled
    ...     3. The note shall be displayed on the Internal notes, basing on the structure [Name + role + date and time] and the content

    [Tags]  BFCC-QALEAD-SUPPORT-COMMUNICATION-02   CP-2.12.0       auto       CP-2.16.4
    Navigate To Support
    Navigate To Support Menu    open
    ${supports}     Get Open Supports
    Run Keyword And Continue On Failure    Should Not Be Empty      ${supports}
    ${request_id}       Set Variable    ${supports}[0][Request ID]
    Filter Support    text_search=${request_id}
    View Open Support Request On    row=1
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}         SUPPORT REQUEST
#    ${actual_internal_note}   Send Internal Note    Test internal notes
    ${internal_notes}     Get Support Request Internal Note

BFCC-QALEAD-SUPPORT-RESOLVE-01: Resolve the support request
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The Call Center QA, QA Leader and Supervisor can resolve the support request
    ...
    ...     Precondition:
    ...     - The user is on the Open tab of the customer support page
    ...
    ...     Test Steps:
    ...     1. Hover over a specific Request ID, select the View button
    ...     2. Click the Resolve button
    ...
    ...     Expected Results:
    ...     1. At the step 1, the user shall be navigated to the ticket details page
    ...     2. At step 2, upon pressing the button, the user should be prompted to confirm that they want to resolve the ticket
    ...     3. Once the confirmation goes through, the ticket should be moved to the “Resolved” tab

    [Tags]  BFCC-QALEAD-SUPPORT-RESOLVE-01   CP-2.12.0       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_callcenter_portal/lib/web/Common.py        ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/Support.py       ${BROWSER_NODE}     ${ENV}
    ${USERS}             Get Config Param    NEW_USERS
    ${CURRENT_USER}      Set Variable        ${USERS}[callcenter_qaleader]
    ${RELEASE_VERSION}   Navigate To Callcenter Sign In Page
    ${TOKEN}             Sign In Callcenter  ${CURRENT_USER}[username]      ${CURRENT_USER}[password]
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

Filter Support Request
    [Arguments]    ${category}
    Navigate To Support
    # Open tab
    Navigate To Support Menu    Open
    Filter Support    by_category=${category}
    ${open_requests}       Get Open Supports
    ${text}                Set Variable    ${open_requests}[0][Request ID]
    Filter Support    text_search=${text}
    ${open_requests}       Get Open Supports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${open_requests}      No Open request found - with text search ${text}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${open_requests}[0][Request ID]       ${text}
    ${filter_values}        Get Support Current Filter Values
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${filter_values}[Text Search]     ${text}
    # Resolved tab
    Navigate To Support Menu    Resolved
    ${rfilter_values}       Get Support Current Filter Values
    Run Keyword And Continue On Failure    Should Be Equal    ${filter_values}[Category]      ${rfilter_values}[Category]
    Run Keyword And Continue On Failure    Should Be Equal    ${filter_values}[Text Search]   ${rfilter_values}[Text Search]
