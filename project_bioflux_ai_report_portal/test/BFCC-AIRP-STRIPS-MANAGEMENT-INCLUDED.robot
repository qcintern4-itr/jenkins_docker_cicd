*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED
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
Force Tags      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED  web
Test Timeout    30m

*** Test Cases ***
BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-ADD-01: Create the new event to "Included in report" page
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: The event has been "Included in report" displayed on page
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...     - The event has been closed and marked "Include in report"
    ...
    ...     Test Steps:
    ...     1. Navigate to study "Events" page
    ...     2. Select the value "Invalid" -> click on "Edit" button
    ...     3. Select the value "Valid" -> Observe the result -> click on "Save" button
    ...     4. Navigate to airp page
    ...     5. Click on the "Strips Management" button
    ...     6. Click on the "Included in report" link
    ...     7. Observe the result
    ...
    ...     Expected Results:
    ...     3. Verify the check box "Include in report" has been marked and the event has been closed
    ...     7. Verify the new event displayed on page
    ...
    ...     **Others**
    ...     Create date: 05/15/2024 - Thang Tran
    ...     Auto create: 05/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-ADD-01      auto
    [Setup]     SUITE SETUP
    Create The Included In Report
    Navigate To Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    Filter Strips Management    text_search=${events_id}[0]
    ${strips_info}     Get Strips Management
    ${type_or_symptoms}     Evaluate    [(item.get('Symptoms') or item.get('Type')) for item in ${strips_info}]
    ${strips_box_info}  Get Strips Management Box
    ${type_or_symptoms_box}     Evaluate    {value for key, value in ${strips_box_info}.items() if key == 'Symptoms' or key == 'Event type'}
    ${type_or_symptoms_box}     Evaluate    next(iter(${type_or_symptoms_box}))
    Run Keyword And Continue On Failure    Should Be Equal    ${strips_info}[0][Event ID]      ${strips_box_info}[Event ID]
#    Run Keyword And Continue On Failure    Should Be Equal    ${strips_info}[0][DateTime] EDT       ${strips_box_info}[Trigger time]
    Run Keyword And Continue On Failure    Should Be Equal    ${strips_info}[0][Comment]       ${strips_box_info}[Technician comment]
    Run Keyword And Continue On Failure    Should Be Equal    ${strips_info}[0][Validity Status]       Valid
    Run Keyword And Continue On Failure    Should Be Equal    ${strips_info}[0][Include report]       Incl. in report
    Run Keyword And Continue On Failure    Should Be Equal    ${type_or_symptoms}[0]       ${type_or_symptoms_box}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-01: Check the toolbar header in the "included in report" page working properly
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: The filters in the "included in report" page is: Valid/Invalid, Include event in report,
    ...     Inlude strip, Size, Search, Sort,  Filter option, Refresh page, Pagination
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "Included in report" link
    ...     4. Observe the result
    ...
    ...     Expected Results:
    ...     4. - The check box "Include event in report" has been marked
    ...        - All the event strips displayed the value on event "Incl. in report"
    ...        - The Valid is default
    ...        - The Size default is Small
    ...
    ...     **Others**
    ...     Create date: 05/15/2024 - Thang Tran
    ...     Auto create: 05/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-01      auto
    [Setup]     SUITE SETUP
    Navigate To Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${included_report}     Get Strips Management
    ${status_toolbar}       Check Toolbar Strips Management Available
    Run Keyword And Continue On Failure    Should Be True    ${status_toolbar}[Validity Status]
    Run Keyword And Continue On Failure    Should Be True    ${status_toolbar}[Include strip]
    Run Keyword And Continue On Failure    Should Be True    ${status_toolbar}[Include event in report]
    Run Keyword And Continue On Failure    Should Be True    ${status_toolbar}[Refresh]
    Run Keyword And Continue On Failure    Should Be True    ${status_toolbar}[Size]
    Run Keyword And Continue On Failure    Should Be True    ${status_toolbar}[Search]
    Run Keyword And Continue On Failure    Should Be True    ${status_toolbar}[Sort]
    ${current_values}       Get Current Values Toolbar Strips Management
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Size]        Small
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Validity Status]        Valid
    ${status_include}       Check Mark Include Toolbar Available
    Run Keyword And Continue On Failure    Should Be True    ${status_include}[Include event in report]
    Run Keyword And Continue On Failure    Should Not Be True        ${status_include}[Include strip]
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-02: Verify the sort event by Event ID
    [Documentation]     Author: Thang Tran
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "Included in report" link
    ...     4. Click on the "Sort" button
    ...     5. Observe the result
    ...
    ...     Expected Results:
    ...     5. Verify the event sort by time successfull
    ...
    ...     **Others**
    ...     Create date: 05/15/2024 - Thang Tran
    ...     Auto Create: 05/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-02      auto
    [Setup]     SUITE SETUP
    Navigate To Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${included_report}     Get Strips Management
    ${event_id}         Evaluate    [item['Event ID'] for item in ${included_report}]
    ${date_time}         Evaluate    [item['DateTime'] for item in ${included_report}]
    #sort ascending default
    ${ascending_device_id}      Evaluate    sorted(${event_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_id}        ${ascending_device_id}
    #sort descending
    Filter Strips Management        asc_or_desc=desc
    ${included_report}     Get Strips Management
    ${event_id}         Evaluate    [item['Event ID'] for item in ${included_report}]
    ${descending_device_id}      Evaluate    sorted(${event_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_id}        ${descending_device_id}
    #sort ascending
    Filter Strips Management        asc_or_desc=asc
    ${included_report}     Get Strips Management
    ${event_id}         Evaluate    [item['Event ID'] for item in ${included_report}]
    ${ascending_device_id}      Evaluate    sorted(${event_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_id}        ${ascending_device_id}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-03: Verify the sort event by date time
    [Documentation]     Author: Thang Tran
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "Included in report" link
    ...     4. Click on the "Sort" button
    ...     5. Observe the result
    ...
    ...     Expected Results:
    ...     5. Verify the event sort by time successfull
    ...
    ...     **Others**
    ...     Create date: 05/15/2024 - Thang Tran
    ...     Auto Create: 05/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-03      auto
    [Setup]     SUITE SETUP
    Navigate To Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${included_report}     Get Strips Management
    ${date_time}         Evaluate    [item['DateTime'] for item in ${included_report}]
    #sort ascending default
    ${acending_datetime}     Sort Asc By Datetime        date_time=${date_time}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${date_time}        ${acending_datetime}
    #sort descending
    Filter Strips Management        asc_or_desc=desc
    ${included_report}     Get Strips Management
    ${date_time}         Evaluate    [item['DateTime'] for item in ${included_report}]
    ${descending_datetime}     Sort Desc By Datetime        date_time=${date_time}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${date_time}        ${descending_datetime}
    #sort ascending
    Filter Strips Management        asc_or_desc=asc
    ${included_report}     Get Strips Management
    ${date_time}         Evaluate    [item['DateTime'] for item in ${included_report}]
    ${ascending_datetime}     Sort Asc By Datetime        date_time=${date_time}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${date_time}        ${ascending_datetime}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-04: View the validity status option and size option
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Verify the validity status option and size option
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "Included in report" link
    ...     4. Select a event
    ...     5. Select the validity status option -> Observe the result
    ...     6. Select the size option -> Observe the result
    ...
    ...     Expected Results:
    ...     5. Verify the validity status option: Valid/Invalid
    ...     6. Verify the size option: Small, Medium, Large
    ...
    ...     **Others**
    ...     Create date: 05/15/2024 - Thang Tran
    ...     Auto Create: 05/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-04      auto
    [Setup]     SUITE SETUP
    Navigate To Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${included_report}     Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${included_report}
    ${expected_validity}    Create List    Valid    Invalid
    ${expected_size}        Create List    Small    Medium    Large
    ${validity_option}      Get Validity Options
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_validity}      ${validity_option}
    ${size_option}      Get Size Options
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_size}      ${size_option}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-EDIT-01: Check the validity status when edit validity the event to Invalid
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: View the validity status when edit validity the event to Invalid
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "Included in report" link
    ...     4. Select a event
    ...     5. Select the validity status option
    ...     6. Select the "Invalid" value -> click on "Save" button -> Observe the result
    ...     7. Navigate to study "Events" report -> Observe the result
    ...
    ...     Expected Results:
    ...     6. The validity status of event changed to Invalid
    ...     7. The validity status of event changed to Invalid
    ...
    ...     **Others**
    ...     Create date: 05/15/2024 - Thang Tran
    ...     Auto Create: 05/24/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-EDIT-01      auto
    [Setup]     SUITE SETUP
    Navigate To Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${included_report}     Get Strips Management
#    Run Keyword And Continue On Failure    Should Be Equal    ${included_report}[0][Validity Status]        Valid
    Filter Strips Management    text_search=${included_report}[0][Event ID]       validity=Invalid
    Filter Header       is_save=${True}
    ${included_report}     Get Strips Management
    Run Keyword And Continue On Failure    Should Be Equal    ${included_report}[0][Validity Status]        Invalid
    Open To Event Details
    Switch Tab  tab_id=2
    Navigate To Event Tab    Event Details
    ${event_details}        Get Event Details
    Run Keyword And Continue On Failure    Should Be Equal    ${event_details}[Validity]        Invalid
    Edit Event Details     event_validity=Valid       is_close=${True}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-EDIT-02: Check the validity status when edit validity the multiple event to "Invalid"
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: View the validity status when edit validity the multiple event to Invalid
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "Included in report" link
    ...     4. Select the multiple events
    ...     5. Select the validity status option
    ...     6. Select the "Invalid" value -> click on "Save" button -> Observe the result
#    ...     7. Navigate to study "Events" report -> Observe the result
    ...
    ...     Expected Results:
    ...     6. The validity status of event changed to Invalid
#    ...     7. The validity status of event changed to Invalid
    ...
    ...     **Others**
    ...     Create date: 05/15/2024 - Thang Tran
    ...     Auto Create: 05/24/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-EDIT-02      auto
    [Setup]     SUITE SETUP
    Navigate To Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${included_report}     Get Strips Management
    View Strips Management On    2
    Filter Strips Management       validity=Invalid
    ${included_report}     Get Strips Management
    ${validity_status_list}     Evaluate    [item['Validity Status'] for item in ${included_report}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${validity_status_list}        Invalid
    ${status}     Evaluate    [item['Status'] for item in ${included_report}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${status}        Edited
    Filter Header       is_save=${True}
    Filter Strips Management        search_by=${True}      search_by_validity=Invalid       filter_submit=${True}
    ${included_report}     Get Strips Management
    ${validity_status_list}     Evaluate    [item['Validity Status'] for item in ${included_report}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${validity_status_list}        Invalid
    Filter Strips Management       validity=Valid
    Filter Header       is_save=${True}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-EDIT-03: Verify the event when change the event to not marked "Include event in report"
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Verify the event when change the event to not marked "Include event in report"
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "Included in report" link
    ...     4. Select a event
    ...     5. Unmark the Include event in report -> Observe the result
    ...     6. Click on "Save" button -> Observe the result
    ...     7. Navigate to study "Events" report -> Observe the result
    ...
    ...     Expected Results:
    ...     5. The checkbox Include strip shall be disabled -> The text "Incl. in report" and "Incl. strip" not displayed
    ...     6. The event not displayed on page
    ...     7. The checkbox unmark Include event report
    ...
    ...     **Others**
    ...     Create date: 05/15/2024 - Thang Tran
    ...     Auto Create: 05/24/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-EDIT-03      auto
    [Setup]     SUITE SETUP
    Navigate To Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${events_id}     Get Strips Management
    Filter Strips Management      text_search=${events_id}[0][Event ID]
    Wait Strips Items Available
    Filter Strips Management      include_report=${False}
    ${strip_management}     Get Strips Management
    ${included_report}      Evaluate    [k for k, v in ${strip_management}[0].items()]
    Run Keyword And Continue On Failure    Should Be Equal    ${strip_management}[0][Status]        Edited
    Run Keyword And Continue On Failure    Should Not Contain    ${included_report}     Include report
    ${status}   Check Toolbar Strips Management Available
    Run Keyword And Continue On Failure    Should Not Be True    ${status}[Include strip]
    Filter Header    is_save=${True}
    Check Strips Event With "${events_id}[0][Event ID]" Did Not Display
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-EDIT-04: Verify the events when change the multiple event to not marked "Include event in report"
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Verify the events when change the multiple event to not marked "Include event in report"
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "Included in report" link
    ...     4. Select the multiple events
    ...     5. Unmark the Include event in report -> Observe the result
    ...     6. Click on "Save" button -> Observe the result
    ...     7. Navigate to study "Events" report -> Observe the result
    ...
    ...     Expected Results:
    ...     5. The checkbox Include strip shall be disabled -> The text "Incl. in report" and "Incl. strip" not displayed
    ...     6. The event not displayed on page
    ...     7. The checkbox unmark Include event report
    ...
    ...     **Others**
    ...     Create date: 05/15/2024 - Thang Tran
    ...     Auto Create: 05/24/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-EDIT-04      auto
    [Setup]     SUITE SETUP
    Navigate To Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${included_report}     Get Strips Management
    ${events_id}               Evaluate    [item['Event ID'] for item in ${included_report}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${included_report}
    View Strips Management On    1,2
    Filter Strips Management      include_report=${False}
    ${strip_management}     Get Strips Management Selected
    ${status}               Evaluate    [item['Status'] for item in ${strip_management}]
    ${included_report}      Evaluate     [k for d in ${strip_management} for k in d.keys()]
    Run Keyword And Continue On Failure    List Should Contain Value       ${status}      Edited
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${included_report}     Include report
    ${status}   Check Toolbar Strips Management Available
    Run Keyword And Continue On Failure    Should Not Be True    ${status}[Include strip]
    Filter Header    is_save=${True}
    Check Strips Event With "${events_id}[0]" Did Not Display
    Check Strips Event With "${events_id}[1]" Did Not Display
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-ADD-02: Verify the event marked to "Include strip"
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Verify the event marked to "Include strip"
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "Included in report" link
    ...     4. Select a event
    ...     5. Marked the Include strip
    ...     6. Click on "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     6. The text "Incl. strip" displayed on event and checkbox marked Include strip
    ...
    ...     **Others**
    ...     Create date: 05/15/2024 - Thang Tran
    ...     Auto Create: 05/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-ADD-02     auto
    [Setup]     SUITE SETUP
    Navigate To Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${events_id}     Get Strips Management
    Filter Strips Management      text_search=${events_id}[0][Event ID]
    Wait Strips Items Available
    Filter Strips Management      include_strip=${True}
    ${strip_management}     Get Strips Management Selected
    ${included_report}      Evaluate    [k for k, v in ${strip_management}[0].items()]
    Run Keyword And Continue On Failure    Should Be Equal    ${strip_management}[0][Status]        Edited
    Run Keyword And Continue On Failure    Should Contain    ${included_report}     Include strip
    ${status}   Check Toolbar Strips Management Available
    Run Keyword And Continue On Failure    Should Be True    ${status}[Include strip]
    Filter Header    is_save=${True}
    Check That The Include Strip Has Been Marked With The Event "${strip_management}[0][Event ID]"
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-ADD-03: Verify the multiple event marked to "Include strip"
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Verify the multiple event marked to "Include strip"
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "Included in report" link
    ...     4. Select the multiple events
    ...     5. Marked the Include strip
    ...     6. Click on "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     6. The text "Incl. strip" displayed on event and checkbox marked Include strip
    ...
    ...     **Others**
    ...     Create date: 05/15/2024 - Thang Tran
    ...     Auto Create: 05/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-ADD-03    auto
    [Setup]     SUITE SETUP
    Navigate To Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${strip_management}     Get Strips Management
    ${events_id}               Evaluate    [item['Event ID'] for item in ${strip_management}]
    View Strips Management On    1,2
    Filter Strips Management       include_strip=${True}
    ${strip_management}     Get Strips Management Selected
    ${status}               Evaluate    [item['Status'] for item in ${strip_management}]
    ${included_strip}      Evaluate     [k for d in ${strip_management} for k in d.keys()]
    Run Keyword And Continue On Failure    List Should Contain Value       ${status}      Edited
    Run Keyword And Continue On Failure    List Should Contain Value       ${included_strip}     Include strip
    ${status}   Check Toolbar Strips Management Available
    Run Keyword And Continue On Failure    Should Be True    ${status}[Include strip]
    Filter Header    is_save=${True}
    Check That The Include Strip Has Been Marked With The Event "${events_id}[0]"
    Check That The Include Strip Has Been Marked With The Event "${events_id}[1]"
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-05: Verify the number event displayed on "Included in report" page with different sizes
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: The number event displayed correct follow the size is small, medium lager
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "Included in report" link
    ...     4. Select "Small/Medium/Large" on the "Size" dropdown list -> Observe the result
    ...
    ...     Expected Results:
    ...     4. - Verify the number event thumbnail displayed: small > medium > large
    ...
    ...     **Others**
    ...     Create date: 05/15/2024 - Thang Tran
    ...     Auto Create: 05/24/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-05     auto
    [Setup]     SUITE SETUP
    Navigate To Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    Filter Strips Management    size=Small
    ${number_small_size}          Get Strips Management
    ${number_small_size}        Evaluate    len(${number_small_size})
    Filter Strips Management    size=Medium
    ${number_medium_size}         Get Strips Management
    ${number_medium_size}        Evaluate    len(${number_medium_size})
    Filter Strips Management    size=Large
    ${number_large_size}          Get Strips Management
    ${number_large_size}        Evaluate    len(${number_large_size})
    ${number_status}              Verify Number Size Heatmap    number_small=${number_small_size}   number_medium=${number_medium_size}     number_large=${number_large_size}
    Then Run Keyword And Continue On Failure    Should Be True    ${number_status}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-06: can view event with search by event ID
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Verify search by event ID
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "Included in report" link
    ...     4. Input event ID to event search
    ...     5. Observe the result
    ...
    ...     Expected Results:
    ...     5. Verify the information event displayed to correctly
    ...
    ...     **Others**
    ...     Create date: 05/15/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-06     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-07: Verify filter event by Type and Validity
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Verify filter event by Type
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "Included in report" link
    ...     4. Click on Filter icon
    ...     5. Select the event type "All type/Brady/Tachy/AFib/Pause/Auto/Sinus/Manual" on the Type of event
    ...     6. Select validity status "Valid" -> Click on "Filter" button -> Observe the result
    ...     7. Click on Filter icon -> Select validity status "Invalid" -> Click on "Filter" button -> Observe the result
    ...
    ...     Expected Results:
    ...     6,7. Verify the information event displayed to correctly
    ...
    ...     **Others**
    ...     Create date: 05/15/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-07     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-08: Check the toolbar on "Edit Strip" event page
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Check the toolbar on "Edit Strip" event page
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "Included in report" link
    ...     4. Click on "Edit" button -> Observe the result
    ...
    ...     Expected Results:
    ...     5. Verify The toolbar displayed: SPEED, GAIN, HP, LP, CH1, CH2, CH3, Capture, Zoom Tool, View All Strip
    ...
    ...     **Others**
    ...     Create date: 05/15/2024 - Thang Tran
    ...     Auto Create: 05/24/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-08     auto
    [Setup]     SUITE SETUP
    Navigate To Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${include_reports}       Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${include_reports}
    Filter Strips Management        edit_strip=${True}
    ${expected_status}     Check Toolbar Ecg Viewer Strips Management Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Speed]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Gain]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[High Pass]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Low Pass]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH1]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH2]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH3]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Capture]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Zoom In]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[View All Strip]
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-09: Can view the zoom in and zoom out on "Edit Strip" page
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Can view the zoom in and zoom out on "Edit Strip" page
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "Included in report" link
    ...     4. Click on "Edit" button -> Observe the result
    ...
    ...     Expected Results:
    ...     4. Verify the zoom in, zoom out
    ...
    ...     **Others**
    ...     Create date: 05/15/2024 - Thang Tran
    ...     Auto Create: 05/24/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-09      auto
    [Setup]     SUITE SETUP
    Navigate To Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${include_reports}       Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${include_reports}
    Filter Strips Management        edit_strip=${True}
    Filter Strips Management        zoom_tool_device_events=${True}
    ${status}     Check Toolbar Ecg Viewer Strips Management Available
    Run Keyword And Continue On Failure    Should Be True    ${status}[Zoom In]
    Run Keyword And Continue On Failure    Should Be True    ${status}[Capture]
    Run Keyword And Continue On Failure    Should Not Be True    ${status}[View All Strip]
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-10: View the toolbar options on "Edit Strip" page
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: View the toolbar options on "Edit Strip" page
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "Included in report" link
    ...     4. Click on "Edit" button
    ...     5. Click on the "Speed/Gain/HP/LP" dropdown list -> Observe the result
    ...
    ...     Expected Results:
    ...     5. - on Speed: 2.5 mm/s, 10 mm/s, 25 mm/s, 50 mm/s, 75 mm/s, 100 mm/s, 200 mm/s, 500 mm/s
    ...        - on Gain: 1 mm/mV, 2 mm/mV, 5 mm/mV, 7.5 mm/mV, 10 mm/mV, 20 mm/mV, 50 mm/mV, 100 mm/mV, 200 mm/mV
    ...        - on HP: No, 0.05 Hz, 0.5 Hz, 1 Hz, 2 Hz
    ...        - on LP: No, 15 Hz, 30 Hz, 40 Hz, 50 Hz (Notch), 60 Hz (Notch), 100 Hz
    ...
    ...     **Others**
    ...     Create date: 05/15/2024 - Thang Tran
    ...     Auto Create: 05/24/2024 - Thang Tran
    ...
    [Tags]     BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-10     auto
    [Setup]     SUITE SETUP
    Navigate To Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${include_reports}       Get Strips Management
    ${infor_box}       Get Strips Management Box
    Run Keyword And Continue On Failure    Should Not Be Empty    ${include_reports}
    Filter Strips Management        edit_strip=${True}
    ${current_value_strips}         Get Current Value Strips Config
    ${start_time_edit}              Get Start Time Edit Strip
    ${expected_speed_config}         Create List    2.5 mm/s   10 mm/s    25 mm/s   50 mm/s   75 mm/s   100 mm/s   200 mm/s   500 mm/s
    ${expected_gain_config}         Create List    1 mm/mV   2 mm/mV   5 mm/mV   7.5 mm/mV   10 mm/mV   20 mm/mV    50 mm/mV   100 mm/mV    200 mm/mV
    ${expected_highpass_config}     Create List    No   0.05 Hz    0.5 Hz    1 Hz    2 Hz
    ${expected_lowpass_config}     Create List    No   15 Hz    30 Hz    40 Hz    50 Hz (Notch)    60 Hz (Notch)   100 Hz
    ${actual_speed_config}           Get Speed Edit Strip Config    is_auto_events=${True}
    ${actual_gain_config}           Get Gain Edit Strip Config    is_auto_events=${True}
    ${actual_highpass_config}       Get Highpass Edit Strip Config    is_auto_events=${True}
    ${actual_lowpass_config}       Get Lowpass Edit Strip Config    is_auto_events=${True}
    Run Keyword And Continue On Failure    Lists Should Be Equal   ${expected_speed_config}          ${actual_speed_config}
    Run Keyword And Continue On Failure    Lists Should Be Equal   ${expected_gain_config}          ${actual_gain_config}
    Run Keyword And Continue On Failure    Lists Should Be Equal   ${expected_highpass_config}          ${actual_highpass_config}
    Run Keyword And Continue On Failure    Lists Should Be Equal   ${expected_lowpass_config}          ${actual_lowpass_config}
    Run Keyword And Continue On Failure     Should Be Equal    ${current_value_strips}[Speed]       25
    Run Keyword And Continue On Failure     Should Be Equal    ${current_value_strips}[Gain]       10
    Run Keyword And Continue On Failure     Should Be Equal    ${current_value_strips}[High Pass]     1
    Run Keyword And Continue On Failure     Should Be Equal    ${current_value_strips}[Low Pass]      40
    Run Keyword And Continue On Failure     Should Be Equal    ${infor_box}[Captured time]      ${start_time_edit} PDT
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-11: The filter back to default status after reset the filter
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: The filter back to default status after reset the filter
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "Included in report" link
    ...     4. Click on filter icon
    ...     5. Change information on page
    ...     6. Click on "Reset filter" link
    ...
    ...     Expected Results:
    ...     5. Verify the information that back to default status after select the reset filter
    ...
    ...     **Others**
    ...     Create date: 04/16/2024 - Thang Tran
    ...     Auto Create: 05/24/2024 - Thang Tran
    ...
    [Tags]     BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-11     auto
    [Setup]     SUITE SETUP
    Navigate To Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    Filter Strips Management        search_by=${True}
    ${strip_management}     Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${strip_management}
    ${current_filter}       Get Current Filters Strip
    Filter Strips Management        search_by_event_type=Pause      search_by_validity=Valid
    ${actual_filter}       Get Current Filters Strip
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_filter}[Type of event]       Pause
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_filter}[Validity]       Valid
    Filter Strips Management        filter_submit=${True}
    Get Strips Management
    Filter Strips Management        search_by=${True}
    ${expected_filter}       Get Current Filters Strip
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_filter}[Type of event]       ${expected_filter}[Type of event]
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_filter}[Validity]       ${expected_filter}[Validity]
    Filter Strips Management        filter_reset=${True}
    ${filter_reset}       Get Current Filters Strip
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Type of event]       ${filter_reset}[Type of event]
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Validity]            ${filter_reset}[Validity]
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-PAGINATION-01: Can next page by using Next/Previous button
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: check the pagination tool is working properly
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. 1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "Included in report" link
    ...     4. Click on the "Next" button
    ...     5. Click on the "Previous"
    ...     6. Observe the result
    ...
    ...     Expected Results:
    ...     3. Verify the page displayed default is 1
    ...     4. Verify the page displayed is 2
    ...     5. Verify the page displayed is 1
    ...
    ...     **Others**
    ...     Create date: 05/16/2024 - Thang Tran
    ...     Auto Create: 05/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-PAGINATION-01    auto
    [Setup]     SUITE SETUP
    Navigate To Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${strips_management}       Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${strips_management}
    ${current_pagination_default}     Get Current Airp Pagination
    Pagination Aireports    next_or_previous=next
    Wait Strips Items Available
    ${current_pagination_next}     Get Current Airp Pagination
    Pagination Aireports    next_or_previous=previous
    Wait Strips Items Available
    ${current_pagination_previous}     Get Current Airp Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_default}[Page]     1
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_next}[Page]     2
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_previous}[Page]     1
    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-PAGINATION-02: Can next page by using Next/Previous by hotkey
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: check the pagination tool by hotkey is working properly
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "Included in report" link
    ...     4. Using hotkey "Z" (is Next button)
    ...     5. Using hotkey "X" (is Previous button)
    ...     6. Observe the result
    ...
    ...     Expected Results:
    ...     3. Verify the page displayed default is 1
    ...     4. Verify the page displayed is 2
    ...     6. Verify the page displayed is 1
    ...
    ...     **Others**
    ...     Create date: 05/16/2024 - Thang Tran
    ...     Auto Create: 05/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-PAGINATION-02      auto
    [Setup]     SUITE SETUP
    Navigate To Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${strips_management}       Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${strips_management}
    View Strips Management On    1
    ${current_pagination_default}     Get Current Airp Pagination
    Pagination Aireports Hotkey    next_or_previous=next
    Wait Strips Items Available
    ${current_pagination_next}     Get Current Airp Pagination
    Pagination Aireports Hotkey    next_or_previous=previous
    Wait Strips Items Available
    ${current_pagination_previous}     Get Current Airp Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_default}[Page]     1
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_next}[Page]     2
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_previous}[Page]     1
    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-PAGINATION-03: Verify the pagination tool can manually input a number within the limit displayed on the page number
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: check the pagination tool can manually input a number within the limit displayed on the page number
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "Included in report" link
    ...     4. Input number in page input
    ...
    ...     Expected Results:
    ...     4. - Input the page number is 0 -> verify message displayed
    ...        - Input the number is larger than the ‘all page’ number -> verify message displayed
    ...        - Check the user fill in only integers
    ...
    ...     **Others**
    ...     Create date: 05/15/2024 - Thang Tran
    ...     Auto Create: 05/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-PAGINATION-03     auto
    [Setup]     SUITE SETUP
    Navigate To Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${strips_management}       Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${strips_management}
    ${current_pagination_default}     Get Current Airp Pagination
    ${status_page_less_than}     Edit Page Number      page_number=0
    ${current_total_page}     Get Current Total Page Airp Pagination
    ${current_total_page}     Evaluate    ${current_total_page} + 1
    ${status_page_lager_than}     Edit Page Number      page_number=${current_total_page}
    ${status_page}     Edit Page Number      page_number=1
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_default}[Page]     1
    Run Keyword And Continue On Failure    Should Not Be True    ${status_page_less_than}
    Run Keyword And Continue On Failure    Should Not Be True    ${status_page_lager_than}
    Run Keyword And Continue On Failure    Should Be True    ${status_page}
    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-MARK-01: Verify that all events in the "Included in report" tab are marked as "Include in report"
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-MARK-01       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-01: Verify that all events in the "Included in report" tab are marked as "Valid" and "Include in report" in "Callcenter" tab
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-01       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-02:Verify event will disappear from "Included in report" tab when not marked "Include in report" in "Callcenter" tab
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-02       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-03:Verify event will disappear from "Included in report" tab when "Invalid" in "Callcenter" tab
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-03       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-04:Can select the device events you want to appear in the report
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/28/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-04       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-05:Verify event is selected valid in "Callcenter" tab but in "AIRP" tab is not Include Strips
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/28/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-05       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-06: Verify when selecting Valid status for event will automatically mark " Include in report "
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/28/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-06       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-07: Can select type AFib event for event in "Callcenter" tab
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/28/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-07       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-08: Can select type Brady event for event in "Callcenter" tab
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/28/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-08       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-09: Can select type Tachy event for event in "Callcenter" tab
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/28/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-09       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-10: Can select type Pause event for event in "Callcenter" tab
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/28/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-10       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-11: Can select type Auto event for event in "Callcenter" tab
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/28/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-11       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-12: Can select type Sinus event for event in "Callcenter" tab
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/28/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-CALL-CENTER-12       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-MARK-02: Verify event will disappear from "Included in report" tab when " Include event in report" is not marked
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-MARK-02       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-MARK-03:Verify event will not disappear from "Included in report" tab when changed to "Invalid"
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-MARK-03       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-MARK-04: Verify event will not disappear from "Included in report" tab when marked "Include strip"
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-MARK-04       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-12:Verify the number of events currently available is equal to the number of events displayed on the sub-section
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-12       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-13: Verify if the number of events is greater than 100 will display "99+" on the subsection
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-13       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-14:Verify when hovering over "99+" will show the exact number of events
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-14       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-15: Verify A list of device events sorted by ascending time
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-15       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-16: Verify when entering the "Included in report" tab, the first event will be selected.
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-16       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-17:Verify when using the "Next" button to move the page the first event will be selected.
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-17       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-18:Verify thumbnail size selection function
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-18       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-19: Verify size "Small" is selected as default when clicking on "Included in report" tab
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-19       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-SIZE-01: Can choose size "Small" for thumbnail
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-SIZE-01       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-SIZE-02: Can choose size "Medium" for thumbnail
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-SIZE-02       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-SIZE-03: Can choose size "Large" for thumbnail
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-SIZE-03       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-20: Verify the validity status on the event card in sync with the validity status options bar
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-20       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-01-1.12.0: Verify the 'Strips Configuration' is updated when the user has previously selected the 'Include Strip' checkbox for all Valid events, then proceed to deploy
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid events
    ...
    ...     Test Steps:
    ...     1. Update the specified configuration value on PDF report tab
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. Check for all Valid events, including:
    ...     - Patient triggered: Palpitations , Shortness of breath , Dizziness , Chest Pain, Other, Not Specified
    ...     - Other: Baseline, Resume study, Evaluation strip
    ...     - Auto events: Tachy, Brady, Pause, AFib, Auto, Sinus
    ...     2. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-01-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-02-1.12.0: Verify the 'Strips Configuration' is updated when the user has previously selected the 'Include Strip' checkbox for all Invalid events, then proceed to deploy
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Invalid events
    ...
    ...     Test Steps:
    ...     1. Update the specified configuration value on PDF report tab
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. Check for all Invalid events, including:
    ...     - Patient triggered: Palpitations , Shortness of breath , Dizziness , Chest Pain, Other, Not Specified
    ...     - Other: Baseline, Resume study, Evaluation strip
    ...     - Auto events: Tachy, Brady, Pause, AFib, Auto, Sinus
    ...     2. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-02-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-03-1.12.0: Verify the 'Strips Configuration' is updated when the user hasnot previously selected the 'Include Strip' checkbox for all Valid events, then proceed to deploy
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid events
    ...
    ...     Test Steps:
    ...     1. Check Include strip for all Valid events
    ...     2. Update the specified configuration value on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. Check for all Valid events, including:
    ...     - Patient triggered: Palpitations , Shortness of breath , Dizziness , Chest Pain, Other, Not Specified
    ...     - Other: Baseline, Resume study, Evaluation strip
    ...     - Auto events: Tachy, Brady, Pause, AFib, Auto, Sinus
    ...     2. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-03-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-04-1.12.0: Verify the 'Strips Configuration' is updated when the user hasnot previously selected the 'Include Strip' checkbox for all Invalid events, then proceed to deploy
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Invalid events
    ...
    ...     Test Steps:
    ...     1. Check Include strip for all Invalid events
    ...     2. Update the specified configuration value on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. Check for all Invalid events, including:
    ...     - Patient triggered: Palpitations , Shortness of breath , Dizziness , Chest Pain, Other, Not Specified
    ...     - Other: Baseline, Resume study, Evaluation strip
    ...     - Auto events: Tachy, Brady, Pause, AFib, Auto, Sinus
    ...     2. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-04-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-05-1.12.0: Verify the 'Strips Configuration' is not updated when the user has previously selected the 'Include Strip' checkbox for all Valid events, then proceed to deploy
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid events
    ...
    ...     Test Steps:
    ...     1. Don't pdate the configuration value on PDF report tab
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. Check for all Valid events, including:
    ...     - Patient triggered: Palpitations , Shortness of breath , Dizziness , Chest Pain, Other, Not Specified
    ...     - Other: Baseline, Resume study, Evaluation strip
    ...     - Auto events: Tachy, Brady, Pause, AFib, Auto, Sinus
    ...     2. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-05-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-06-1.12.0: Verify the 'Strips Configuration' is not updated correctly when the user has previously selected the 'Include Strip' checkbox for all Invalid events, then proceed to deploy
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Invalid events
    ...
    ...     Test Steps:
    ...     1. Don't pdate the configuration value on PDF report tab
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. Check for all Invalid events, including:
    ...     - Patient triggered: Palpitations , Shortness of breath , Dizziness , Chest Pain, Other, Not Specified
    ...     - Other: Baseline, Resume study, Evaluation strip
    ...     - Auto events: Tachy, Brady, Pause, AFib, Auto, Sinus
    ...     2. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-06-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-07-1.12.0: Verify the 'Strips Configuration' is not updated when the user hasnot previously selected the 'Include Strip' checkbox for all Valid events, then proceed to deploy
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid events
    ...
    ...     Test Steps:
    ...     1. Check Include strip for all Valid events
    ...     2. Don't pdate the configuration value on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. Check for all Valid events, including:
    ...     - Patient triggered: Palpitations , Shortness of breath , Dizziness , Chest Pain, Other, Not Specified
    ...     - Other: Baseline, Resume study, Evaluation strip
    ...     - Auto events: Tachy, Brady, Pause, AFib, Auto, Sinus
    ...     2. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-07-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-08-1.12.0: Verify the 'Strips Configuration' is not updated when the user hasnot previously selected the 'Include Strip' checkbox for all Invalid events, then proceed to deploy
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check Include strip for all Invalid events
    ...     2. Don't pdate the configuration value on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. Check for all Invalid events, including:
    ...     - Patient triggered: Palpitations , Shortness of breath , Dizziness , Chest Pain, Other, Not Specified
    ...     - Other: Baseline, Resume study, Evaluation strip
    ...     - Auto events: Tachy, Brady, Pause, AFib, Auto, Sinus
    ...     2. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-08-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-09-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the Baseline event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-09-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-10-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the Resume study event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-10-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-11-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the Evaluation strip event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-11-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-12-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the Palpitations symptoms
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on symptoms, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-12-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-13-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the Shortness of breath symptoms
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on symptoms, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-13-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-14-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the Dizziness symptoms
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on symptoms, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-14-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-15-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the Chest Pain symptoms
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on symptoms, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-15-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-16-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the Other symptoms
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on symptoms, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-16-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-17-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the Not Specified symptoms
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on symptoms, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-17-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-18-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-18-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-19-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-19-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-20-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-20-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-21-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-21-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-22-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the Auto event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click Open button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. On Include in report tab, click reload button, then click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-22-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-23-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the Sinus event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click Open button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. On Include in report tab, click reload button, then click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-23-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-24-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration on Call center portal for the Baseline event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click Open button on event, update capture and configuration on Call center portal, then click save button
    ...     2. On Include in report tab, click reload button, then click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-24-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-25-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration on Call center portal for the Resume study event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click Open button on event, update capture and configuration on Call center portal, then click save button
    ...     2. On Include in report tab, click reload button, then click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-25-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-26-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration on Call center portal for the Evaluation strip event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click Open button on event, update capture and configuration on Call center portal, then click save button
    ...     2. On Include in report tab, click reload button, then click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-26-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-27-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration on Call center portal for the Palpitations symptoms
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click Open button on event, update capture and configuration on Call center portal, then click save button
    ...     2. On Include in report tab, click reload button, then click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-27-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-28-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration on Call center portal for the Shortness of breath symptoms
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click Open button on event, update capture and configuration on Call center portal, then click save button
    ...     2. On Include in report tab, click reload button, then click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-28-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-29-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration on Call center portal for the Dizziness symptoms
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click Open button on event, update capture and configuration on Call center portal, then click save button
    ...     2. On Include in report tab, click reload button, then click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-29-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-30-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration on Call center portal for the Chest Pain symptoms
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click Open button on event, update capture and configuration on Call center portal, then click save button
    ...     2. On Include in report tab, click reload button, then click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-30-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-31-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration on Call center portal for the Other symptoms
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click Open button on event, update capture and configuration on Call center portal, then click save button
    ...     2. On Include in report tab, click reload button, then click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-31-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-32-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration on Call center portal for the Not Specified symptoms
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click Open button on event, update capture and configuration on Call center portal, then click save button
    ...     2. On Include in report tab, click reload button, then click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-32-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-33-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration on Call center portal for the Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click Open button on event, update capture and configuration on Call center portal, then click save button
    ...     2. On Include in report tab, click reload button, then click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-33-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-34-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration on Call center portal for the Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click Open button on event, update capture and configuration on Call center portal, then click save button
    ...     2. On Include in report tab, click reload button, then click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-34-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-35-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration on Call center portal for the Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click Open button on event, update capture and configuration on Call center portal, then click save button
    ...     2. On Include in report tab, click reload button, then click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-35-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-36-1.12.0: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration on Call center portal for the AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click Open button on event, update capture and configuration on Call center portal, then click save button
    ...     2. On Include in report tab, click reload button, then click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-36-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-24: Verify the 'Strips Configuration' is updated when the user changes the capture in the Edit Strip modal for the Baseline event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on the event, update capture on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-24       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-25: Verify the 'Strips Configuration' is updated when the user changes the capture in the Edit Strip modal for the Resume study event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on the event, update capture on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-25       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-26: Verify the 'Strips Configuration' is updated when the user changes the capture in the Edit Strip modal for the Evaluation strip event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on the event, update capture on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-26       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-27: Verify the 'Strips Configuration' is updated when the user changes the capture in the Edit Strip modal for the Evaluation strip event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on the event, update capture on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-27       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-28: Verify the 'Strips Configuration' is updated when the user changes the capture in the Edit Strip modal for the Palpitaions symptoms
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on Baseline event, update capture on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-28       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-29: Verify the 'Strips Configuration' is updated when the user changes the capture in the Edit Strip modal for the Shortness of breath symptoms
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on Baseline event, update capture on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-29       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-30: Verify the 'Strips Configuration' is updated when the user changes the capture in the Edit Strip modal for the Chest Pain symptoms
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on Baseline event, update capture on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-30       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-31: Verify the 'Strips Configuration' is updated when the user changes the capture in the Edit Strip modal for the Other symptoms
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on Baseline event, update capture on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-31       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-32: Verify the 'Strips Configuration' is updated when the user changes the capture in the Edit Strip modal for the Not Specified symptoms
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on Baseline event, update capture on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-32       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-33: Verify the 'Strips Configuration' is updated when the user changes the capture in the Edit Strip modal for the Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on Baseline event, update capture on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-33       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-34: Verify the 'Strips Configuration' is updated when the user changes the capture in the Edit Strip modal for the Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on Baseline event, update capture on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-34       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-35: Verify the 'Strips Configuration' is updated when the user changes the capture in the Edit Strip modal for the Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on Baseline event, update capture on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-35       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-36: Verify the 'Strips Configuration' is updated when the user changes the capture in the Edit Strip modal for the AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on Baseline event, update capture on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-36       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-37: Verify the 'Strips Configuration' is updated when the user changes the capture in the Edit Strip modal for the Auto event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on Baseline event, update capture on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-37       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-38: Verify the 'Strips Configuration' is updated when the user changes the capture in the Edit Strip modal for the Sinus event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on Baseline event, update capture on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-38       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-39: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the Baseline event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on the event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-39       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-40: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the Resume study event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on the event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-40       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-41: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the Evaluation strip event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on the event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-41       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-42: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the Evaluation strip event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on the event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-42       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-43: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the Palpitaions symptoms
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on Baseline event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-43       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-44: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the Shortness of breath symptoms
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on Baseline event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-44       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-45: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the Chest Pain symptoms
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on Baseline event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-45       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-46: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the Other symptoms
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on Baseline event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-46       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-47: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the Not Specified symptoms
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on Baseline event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-47       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-48: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on Baseline event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-48       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-49: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on Baseline event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-49       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-50: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on Baseline event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-50       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-51: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on Baseline event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-51       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-52: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the Auto event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on Baseline event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-52       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-53: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the Sinus event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has previously selected the 'Include Strip' checkbox for all Valid/Invalid events
    ...
    ...     Test Steps:
    ...     1. Click edit button on Baseline event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-53       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-54: Verify the 'Strips Configuration' is not updated when the user hasnot selected the 'Include Strip' checkbox for all events
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user hasnot selected the 'Include Strip' checkbox for all Valid/Invalid events in Include in report tab
    ...
    ...     Test Steps:
    ...     1. Update the specified configuration value on PDF report tab
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. Check for all Valid/Invalids events, including:
    ...     - Patient triggered: Palpitations , Shortness of breath , Dizziness , Chest Pain, Other, Not Specified
    ...     - Other: Baseline, Resume study, Evaluation strip
    ...     - Auto events: Tachy, Brady, Pause, AFib, Auto, Sinus
    ...     2. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-VIEW-54       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-SORT-01: Verify the list of manual event is sorted by captured time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-SORT-01       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-SORT-02: Verify that manual events are sorted by capture time, not triggered time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that manual events are sorted based on their capture time rather than triggered time
    ...    - Especially relevant when events occur close together in time
    ...
    ...     Precondition:
    ...    - Two manual events exist with distinct triggered and captured timestamps
    ...     Test Steps:
    ...    1. Navigate to the Patient Event Summary page
    ...    2. Navigate to the Strip Management page
    ...    3. Navigate to the Sample Strip page
    ...    4. Observe the following two manual events:
    ...       - Event A: Triggered at 04/08/2025, 23:21:49, captured at 23:22:09
    ...       - Event B: Triggered at 04/08/2025, 23:22:26, captured at 23:21:56
    ...    5. Observe the order in which the events appear
    ...
    ...     Expected Results:
    ...    1. Manual events should be sorted by captured time in ascending order
    ...    2. Event B (captured at 23:21:56) should appear **before** Event A (captured at 23:22:09)
    ...    3. Follow issue https://github.com/ITR-vietnam/btcy-bioflux-qc-bug_report/issues/2499
    ...
    ...     **Others**
    ...     Create date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-SORT-02       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-SORT-03: Verify that auto device events are sorted by capture time, not triggered time
    [Documentation]     Author: Trinh Nguyen
    ...
 ...     Description:
    ...    - This test case verifies that auto device events are sorted based on their capture time rather than triggered time
    ...    - Ensures correct order display in the UI, especially when triggered times are close (within ~1 minute)
    ...
    ...     Precondition:
    ...    - Two auto device events exist with different captured times
    ...    - Their triggered times are close together (within ~1 minute)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Patient Event Summary page
    ...    2. Navigate to the Strip Management page
    ...    3. Navigate to the Sample Strip page
    ...    4. Observe the following two auto device events:
    ...       - Event A: Triggered at 04/08/2025, 23:21:49, captured at 23:22:09
    ...       - Event B: Triggered at 04/08/2025, 23:22:26, captured at 23:21:56
    ...    5. Observe the order in which the events appear
    ...
    ...     Expected Results:
    ...    1. Auto device events should be sorted by captured time in ascending order
    ...    2. Event B (captured at 23:21:56) should appear **before** Event A (captured at 23:22:09)
    ...    3. Triggered time should not affect sorting priority when capture time is available
    ...
    ...     **Others**
    ...     Create date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-SORT-03       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-SORT-04: Verify that auto AI events (e.g., AFib) are sorted by capture time, not triggered time
    [Documentation]     Author: Trinh Nguyen
    ...
        ...     Description:
    ...    - This test case verifies that auto AI events of the same type (e.g., AFib) are sorted based on their capture time rather than triggered time
    ...    - Ensures correct display order when triggered times are close (within ~1 minute)
    ...
    ...     Precondition:
    ...    - Two auto AI events of type AFib exist with different capture times
    ...    - Their triggered times are close together (within ~1 minute)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Patient Event Summary page
    ...    2. Navigate to the Strip Management page
    ...    3. Navigate to the Sample Strip page
    ...    4. Observe the following two AFib events:
    ...       - Event A: Triggered at 04/08/2025, 23:21:49, captured at 23:22:09
    ...       - Event B: Triggered at 04/08/2025, 23:22:26, captured at 23:21:56
    ...    5. Observe the order in which the events are listed in the UI
    ...
    ...     Expected Results:
    ...    1. Auto AI events should be sorted by captured time in ascending order
    ...    2. Event B (captured at 23:21:56) should appear **before** Event A (captured at 23:22:09)
    ...    3. Triggered time should not affect sorting priority when capture time is available
    ...
    ...     **Others**
    ...     Create date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-SORT-04       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-SORT-05: Verify that auto AI events of different types (e.g., Tachy and Brady) are sorted by capture time, not triggered time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that auto AI events of different types (e.g., Tachycardia and Bradycardia) are sorted based on their capture time rather than triggered time
    ...    - Ensures correct chronological display in the UI when triggered times are close (within ~1 minute)
    ...
    ...     Precondition:
    ...    - Two auto AI events exist: one Tachy and one Brady
    ...    - Triggered times are close together (e.g., ~1 minute apart)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Patient Event Summary page
    ...    2. Navigate to the Strip Management page
    ...    3. Navigate to the Sample Strip page
    ...    4. Observe the following two events:
    ...       - Event A (Tachycardia): Triggered at 04/08/2025, 23:21:49, captured at 23:22:09
    ...       - Event B (Bradycardia): Triggered at 04/08/2025, 23:22:26, captured at 23:21:56
    ...    5. Observe how the events are ordered in the UI
    ...
    ...     Expected Results:
    ...    1. Auto AI events of different types should still be sorted by captured time
    ...    2. Event B (Brady, captured at 23:21:56) should appear **before** Event A (Tachy, captured at 23:22:09)
    ...    3. Event type and triggered time should not affect the order when capture time is available
    ...
    ...     **Others**
    ...     Create date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-SORT-05       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-SORT-06: Verify that auto AI and auto device events of different types are sorted by capture time when captured times are close
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that auto AI and auto device events of different types (e.g., VT and Brady) are sorted by captured time even when captured times are close together
    ...    - Ensures correct chronological display in the UI when triggered times are close (within ~1 minute)
    ...
    ...     Precondition:
    ...    - Two events exist with close triggered times (~1 minute apart) and close captured times (~a few seconds apart)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Patient Event Summary page
    ...    2. Navigate to the Strip Management page
    ...    3. Navigate to the Sample Strip page
    ...    4. Observe the following two events:
    ...       - Event A (VT – Auto AI): Triggered at 04/08/2025, 23:21:49, captured at 23:22:09
    ...       - Event B (Brady – Auto Device): Triggered at 04/08/2025, 23:22:26, captured at 23:22:05
    ...    5. Observe how the events are listed in the UI
    ...
    ...     Expected Results:
    ...    1. Events should be sorted by captured time in ascending order, regardless of event type or source
    ...    2. Event B (Brady, captured at 23:22:05) should appear **before** Event A (VT, captured at 23:22:09)
    ...    3. Triggered time and event source should not affect the order when captured time is present and close
    ...
    ...     **Others**
    ...     Create date: 7/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-SORT-06       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-SORT-07: Verify that auto AI and manual device events are sorted by capture time when captured times are close
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that auto AI and manual device events are sorted based on captured time
    ...    - Ensures accurate chronological display even when captured times are close (within ~15 seconds)
    ...
    ...     Precondition:
    ...    - Two events exist with close captured times (e.g., within ~15 seconds):
    ...    - VT event (Auto AI): Triggered at 04/08/2025, 23:21:49, captured at 23:22:09
    ...    - Manual Device event: Triggered at 04/08/2025, 23:22:26, captured at 23:21:56
    ...
    ...     Test Steps:
    ...    1. Navigate to the Patient Event Summary page
    ...    2. Navigate to the Strip Management page
    ...    3. Navigate to the Sample Strip page
    ...    4. Observe the following two events:
    ...       - Event A (VT – Auto AI): Triggered at 04/08/2025, 23:21:49, captured at 23:22:09
    ...       - Event B (Manual Device): Triggered at 04/08/2025, 23:22:26, captured at 23:21:56
    ...    5. Observe the order in which the events are displayed
    ...
    ...     Expected Results:
    ...    1. Events should be sorted in ascending order of captured time, regardless of event type or origin
    ...    2. Event B (Manual, captured at 23:21:56) should appear **before** Event A (VT, captured at 23:22:09)
    ...    3. Triggered time and classification should not override captured time in sorting logic
    ...
    ...     **Others**
    ...     Create date: 7/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-INCLUDED-SORT-07       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


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

Create the included in report
    Navigate To Events Page
    Filter Study Events     by_validity=Invalid
    ${events}   Get Study Events
    ${events_id}     Evaluate    [item['Event ID'] for item in ${events}]
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab    Event Details
    ${event_type}   Get Event Details
    Edit Event Details     event_validity=Valid       is_close=${True}
#    Back From Study Management
    Set Global Variable    ${events_id}
    Set Global Variable    ${event_type}

Check that the include strip has been marked with the event "${event_id}"
    Filter Strips Management      text_search=${event_id}
    ${strip_management}     Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${strip_management}
    Run Keyword And Continue On Failure    Should Be Equal    ${strip_management}[0][Include strip]      Incl. strip
    ${status_include}       Check Mark Include Toolbar Available
    Run Keyword And Continue On Failure    Should Be True    ${status_include}[Include strip]
    Filter Strips Management      include_strip=${False}
    Filter Header    is_save=${True}

Check strips event with "${event_id}" did not display
    Filter Strips Management      text_search=${event_id}
    ${msg_data}     Get Message Strip Management
    Run Keyword And Continue On Failure    Should Be Equal     ${msg_data}      There is no data to display
