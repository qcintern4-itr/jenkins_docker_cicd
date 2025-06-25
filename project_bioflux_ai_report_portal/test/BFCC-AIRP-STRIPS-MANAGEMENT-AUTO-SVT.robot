*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT
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

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT  web
Test Timeout    30m

*** Test Cases ***
BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-VIEW-08: Verify that the SVT strips captured by the system are displayed correctly
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The study has just been stopped, and the user hasn't processed any AI data yet
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. AI will capture the SVT/SVE Run event’s duration with maximum time 30 seconds:
    ...     - Fastest and Longest
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-VIEW-08       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-ADD-01: Create the auto events with event type "SVT"
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Create the auto events with event type "SVT"
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to "ECG Events" page
    ...     2. Select the "SVT" Rhythm events
    ...     3. Capture the event
    ...     4. Navigate to "Strips Management" page
    ...     5. Click on "SVT" link
    ...     6. Observe the result
    ...
    ...     Expected Results:
    ...     6. Verify the information that has been captured and displayed is correct
    ...
    ...     **Others**
    ...     Create date: 05/17/2024 - Thang Tran
    ...     Auto Create: 06/03/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-ADD-01      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVT
    Filter Capture    duration=20s      channel=CH1     comment=Add capture afib to strips management       is_submit=${True}
    ${msg}          Get Toast Message
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        You can find captured strip in "Strips Management" tab.
    Filter Header    is_save=${True}
    ${event_box}        Get Panel Information Event
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=SVT
    ${strips_management}        Get Strips Management Selected
    Run Keyword And Continue On Failure    Should Be Equal    ${strips_management}[0][Comment]      Add capture afib to strips management
    Run Keyword And Continue On Failure    Should Be Equal    ${strips_management}[0][Include report]      Incl. in report
    Run Keyword And Continue On Failure    Should Be Equal    ${strips_management}[0][Include strip]       Incl. strip
    ${trigger_time}         Get Strips Management Box
    ${date_time}       Convert Datetime To Timezone    ${trigger_time}[Trigger time]
    Run Keyword And Continue On Failure    Should Be Equal      ${event_box}[Start time]        ${date_time}
    Run Keyword And Continue On Failure    Should Be Equal      ${strips_management}[0][Comment]        ${trigger_time}[Technician comment]
    Run Keyword And Continue On Failure    Should Be Equal      ${trigger_time}[Event type]         SVT
    Delete Events Strips Management
    Filter Strips Management        is_save=${True}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-VIEW-01: Check the toolbar header in the "SVT" page working properly
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: The filters in the "SVT" page is: Delete, Include event in report, Include strip, Size, Hide excluded, Reload
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to "Strips Management" page
    ...     2. Click on "SVT" link
    ...     3. Observe the result
    ...
    ...     Expected Results:
    ...     3. - The check box "Include event in report" has been marked
    ...        - AThe check box "Incl. in report" has been marked
    ...        - The Size default is Small
    ...
    ...     **Others**
    ...     Create date: 05/17/2024 - Thang Tran
    ...     Auto Create: 06/03/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-VIEW-01     auto
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=SVT
    ${status_toolbar}       Check Toolbar Strips Management Available
    Run Keyword And Continue On Failure    Should Be True    ${status_toolbar}[Delete]
    Run Keyword And Continue On Failure    Should Be True    ${status_toolbar}[Include strip]
    Run Keyword And Continue On Failure    Should Be True    ${status_toolbar}[Include event in report]
    Run Keyword And Continue On Failure    Should Be True    ${status_toolbar}[Refresh]
    ${current_values}       Get Current Values Toolbar Strips Management
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Size]        Small
    Run Keyword And Continue On Failure    Should Be True     ${current_values}[Hide excluded]
    ${status_include}       Check Mark Include Toolbar Available
    Run Keyword And Continue On Failure    Should Be True    ${status_include}[Include event in report]
    Run Keyword And Continue On Failure    Should Be True    ${status_include}[Include strip]

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-VIEW-02: View the size option
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Verify the size option
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "SVT" link
    ...     4. Select a event
    ...     5. Select the size option -> Observe the result
    ...
    ...     Expected Results:
    ...     5. Verify the size option: Small, Medium, Large
    ...
    ...     **Others**
    ...     Create date: 05/15/2024 - Thang Tran
    ...     Auto Create: 06/03/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-VIEW-02    auto
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=SVT
#    ${included_report}     Get Strips Management
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${included_report}
    ${expected_size}        Create List    Small    Medium    Large
    ${size_option}      Get Size Options
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_size}      ${size_option}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-EDIT-01: Verify the event when change the event to not marked "Include event in report"
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
    ...     3. Click on the "SVT" link
    ...     4. Select a event
    ...     5. Unmark the Include event in report -> Observe the result
    ...     6. Click on "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     5. The checkbox Include strip shall be disabled -> The text "Incl. in report" and "Incl. strip" not displayed
#    ...     6. The event not displayed on page
    ...
    ...     **Others**
    ...     Create date: 05/17/2024 - Thang Tran
    ...     Auto Create: 06/03/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-EDIT-01     auto
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=SVT
    Select Strips Management On    row=2
    Filter Strips Management      include_report=${False}
    ${strips_management}     Get Strips Management Selected
    Run Keyword And Continue On Failure    Should Be Equal    ${strips_management}[0][Status]        Edited
    ${status}   Check Toolbar Strips Management Available
    Run Keyword And Continue On Failure    Should Not Be True    ${status}[Include strip]
    ${status_include}       Check Mark Include Toolbar Available
    Run Keyword And Continue On Failure    Should Not Be True    ${status_include}[Include event in report]
    Run Keyword And Continue On Failure    Should Not Be True    ${status_include}[Include strip]
    Filter Header    is_save=${True}
    View Strips Management On    2
    ${status}   Check Toolbar Strips Management Available
    Run Keyword And Continue On Failure    Should Not Be True    ${status}[Include strip]
    ${status_include}       Check Mark Include Toolbar Available
    Run Keyword And Continue On Failure    Should Not Be True    ${status_include}[Include event in report]
    Run Keyword And Continue On Failure    Should Not Be True    ${status_include}[Include strip]
    ${strips_management}     Get Strips Management Selected
    ${actual_afib}          Evaluate    [k for k, v in ${strips_management}[0].items()]
    ${expected_afib}        Create List    DateTime     Comment
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_afib}        ${actual_afib}
    Filter Strips Management      include_report=${True}
    Filter Strips Management        is_save=${True}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-EDIT-02:Verify the events when change the multiple event to not marked "Include event in report"
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
    ...
    ...     Expected Results:
    ...     5. The checkbox Include strip shall be disabled -> The text "Incl. in report" and "Incl. strip" not displayed
#    ...     6. The event not displayed on page
    ...
    ...     **Others**
    ...     Create date: 05/15/2024 - Thang Tran
    ...     Auto Create: 06/03/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-EDIT-02     auto
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=SVT
    View Strips Management On    1, 2
    Filter Strips Management      include_report=${False}
    ${strips_management}     Get Strips Management Selected
    ${status}               Evaluate    [item['Status'] for item in ${strips_management}]
    Run Keyword And Continue On Failure    List Should Contain Value       ${status}      Edited
    ${status}   Check Toolbar Strips Management Available
    Run Keyword And Continue On Failure    Should Not Be True    ${status}[Include strip]
    Filter Header    is_save=${True}
    View Strips Management On    1, 2
    ${status}   Check Toolbar Strips Management Available
    Run Keyword And Continue On Failure    Should Not Be True    ${status}[Include strip]
    ${strips_management}     Get Strips Management Selected
    ${actual_afib}          Evaluate    [k for k, v in ${strips_management}[0].items()]
    ${expected_afib}        Create List    DateTime     Comment
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_afib}        ${actual_afib}
    Delete Events Strips Management
    Filter Header        is_save=${True}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-EDIT-03: Verify the event when change the event to not marked "Include strip"
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Verify the event when change the event to not marked "Include strip
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "SVT" link
    ...     4. Select a event
    ...     5. Unarked the Include strip
    ...     6. Click on "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     6. The text "Incl. strip" not displayed on event and checkbox unmarked Include strip
    ...        The text "Incl. in report" displayed on event and checkbox marked Include event in report
    ...
    ...     **Others**
    ...     Create date: 05/17/2024 - Thang Tran
    ...     Auto Create: 06/03/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-EDIT-03      auto
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=SVT
    Select Strips Management On    row=2
    Filter Strips Management      include_strip=${False}
    ${strips_management}     Get Strips Management Selected
    Run Keyword And Continue On Failure    Should Be Equal    ${strips_management}[0][Status]        Edited
    ${status}   Check Toolbar Strips Management Available
    Run Keyword And Continue On Failure    Should Be True    ${status}[Include strip]
    Filter Header    is_save=${True}
    View Strips Management On    2
    ${status}   Check Toolbar Strips Management Available
    Run Keyword And Continue On Failure    Should Be True    ${status}[Include strip]
    ${strips_management}     Get Strips Management Selected
    ${afib_list}          Evaluate    [k for k, v in ${strips_management}[0].items()]
    Run Keyword And Continue On Failure    List Should Not Contain Value        ${afib_list}        Include strip
    Filter Strips Management      include_strip=${True}
    Filter Header    is_save=${True}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-EDIT-04: Verify the unmarked Include strip with the multiple events
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Verify the unmarked Include strip with a event
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "SVT" link
    ...     4. Select the multiple event
    ...     5. Unarked the Include strip
    ...     6. Click on "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     6. The text "Incl. strip" not displayed on event and checkbox unmarked Include strip
    ...        The text "Incl. in report" displayed on event and checkbox marked Include event in report
    ...
    ...     **Others**
    ...     Create date: 05/17/2024 - Thang Tran
    ...     Auto Create: 06/03/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-EDIT-04      auto
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=SVT
    View Strips Management On    1, 2
    Filter Strips Management      include_strip=${False}
    ${strips_management}     Get Strips Management Selected
    ${status}               Evaluate    [item['Status'] for item in ${strips_management}]
    Run Keyword And Continue On Failure    List Should Contain Value       ${status}      Edited
    ${status}   Check Toolbar Strips Management Available
    Run Keyword And Continue On Failure    Should Be True    ${status}[Include strip]
    Filter Header    is_save=${True}
    Get Strips Management
    View Strips Management On    1, 2
    ${status}   Check Toolbar Strips Management Available
    Run Keyword And Continue On Failure    Should Be True    ${status}[Include strip]
    ${strips_management}     Get Strips Management Selected
    ${afib_list}          Evaluate    [k for d in ${strips_management} for k, v in d.items()]
    Run Keyword And Continue On Failure    List Should Not Contain Value        ${afib_list}        Include strip
    Filter Strips Management      include_strip=${True}
    Filter Header    is_save=${True}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-VIEW-03: Verify the number event displayed on "SVT" page with different sizes
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
    ...     3. Click on the "SVT" link
    ...     4. Select "Small/Medium/Large" on the "Size" dropdown list -> Observe the result
    ...
    ...     Expected Results:
    ...     4. - Verify the number event thumbnail displayed: small > medium > large
    ...
    ...     **Others**
    ...     Create date: 05/17/2024 - Thang Tran
    ...     Auto Create: 06/03/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-VIEW-03     auto
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=SVT
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
    Filter Strips Management    size=Small
    Run Keyword And Continue On Failure    Should Be True    ${number_status}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-VIEW-04: Check the toolbar on "Edit Strip" event page
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
    ...     3. Click on the "SVT" link
    ...     4. Click on "Edit" button -> Observe the result
    ...
    ...     Expected Results:
    ...     5. Verify The toolbar displayed: SPEED, GAIN, HP, LP, CH1, CH2, CH3, Capture, Zoom Tool, View All Strip
    ...
    ...     **Others**
    ...     Create date: 05/17/2024 - Thang Tran
    ...     Auto Create: 06/03/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-VIEW-04     auto
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=SVT
#    ${include_reports}       Get Strips Management
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${include_reports}
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

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-VIEW-05: Can view the zoom in and zoom out on "Edit Strip" page
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
    ...     3. Click on the "SVT" link
    ...     4. Click on "Edit" button -> Observe the result
    ...
    ...     Expected Results:
    ...     4. Verify the zoom in, zoom out
    ...
    ...     **Others**
    ...     Create date: 05/17/2024 - Thang Tran
    ...     Auto Create: 06/03/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-VIEW-05      auto
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=SVT
#    ${include_reports}       Get Strips Management
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${include_reports}
    Filter Strips Management        edit_strip=${True}
    Filter Strips Management        zoom_tool_auto_events=${True}
    ${status}     Check Toolbar Ecg Viewer Strips Management Available
    Run Keyword And Continue On Failure    Should Be True    ${status}[Zoom In]
    Run Keyword And Continue On Failure    Should Be True    ${status}[Capture]
    Run Keyword And Continue On Failure    Should Not Be True    ${status}[View All Strip]

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-VIEW-06: View the toolbar options on "Edit Strip" page
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
    ...     3. Click on the "SVT" link
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
    ...     Create date: 05/17/2024 - Thang Tran
    ...     Auto Create: 06/03/2024 - Thang Tran
    ...
    [Tags]     BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-VIEW-06     auto
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=SVT
    ${infor_box}       Get Strips Management Box
#    ${include_reports}       Get Strips Management
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${include_reports}
    Filter Strips Management        edit_strip=${True}
    ${current_value_strips}         Get Current Value Auto Event Config
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

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-PAGINATION-01: Can next page by using Next/Previous button
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: check the pagination tool is working properly
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Navigate to airp page
    ...     2. Click on the "Strips Management" button
    ...     3. Click on the "SVT" link
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
    ...     Create date: 05/17/2024 - Thang Tran
    ...     Auto Create: 06/03/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-PAGINATION-01    auto
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=SVT
#    ${strips_management}       Get Strips Management
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${strips_management}
    ${current_pagination_default}     Get Current Pagination Strips Management
    Pagination Strips Management    next_or_previous=next
    Wait Strips Items Available
    ${current_pagination_next}     Get Current Pagination Strips Management
    Pagination Strips Management    next_or_previous=previous
    Wait Strips Items Available
    ${current_pagination_previous}     Get Current Pagination Strips Management
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_default}[Page]     1
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_next}[Page]     2
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_previous}[Page]     1

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-PAGINATION-02: Can next page by using Next/Previous by hotkey
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
    ...     3. Click on the "SVT" link
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
    ...     Create date: 05/17/2024 - Thang Tran
    ...     Auto Create: 06/03/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-PAGINATION-02      auto
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=SVT
    View Strips Management On    1
    ${current_pagination_default}     Get Current Pagination Strips Management
    Pagination Aireports Hotkey    next_or_previous=next
    Wait Strips Items Available
    ${current_pagination_next}     Get Current Pagination Strips Management
    Pagination Aireports Hotkey    next_or_previous=previous
    Wait Strips Items Available
    ${current_pagination_previous}     Get Current Pagination Strips Management
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_default}[Page]     1
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_next}[Page]     2
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_previous}[Page]     1

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-PAGINATION-03: Verify the pagination tool can manually input a number within the limit displayed on the page number
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
    ...     3. Click on the "SVT" link
    ...     4. Input number in page input
    ...
    ...     Expected Results:
    ...     4. - Input the page number is 0 -> verify message displayed
    ...        - Input the number is larger than the ‘all page’ number -> verify message displayed
    ...        - Check the user fill in only integers
    ...
    ...     **Others**
    ...     Create date: 05/17/2024 - Thang Tran
    ...     Auto Create: 06/03/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-PAGINATION-03     auto
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=SVT
#    ${strips_management}       Get Strips Management
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${strips_management}
    ${current_pagination_default}     Get Current Pagination Strips Management
    ${status_page_less_than}     Edit Page Number Strip Management          page_number=0
    ${current_total_page}     Get Current Total Page Strip Management
    ${current_total_page}     Evaluate    ${current_total_page} + 1
    ${status_page_lager_than}     Edit Page Number Strip Management          page_number=${current_total_page}
    ${status_page}     Edit Page Number Strip Management          page_number=1
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_default}[Page]     1
    Run Keyword And Continue On Failure    Should Not Be True    ${status_page_less_than}
    Run Keyword And Continue On Failure    Should Not Be True    ${status_page_lager_than}
    Run Keyword And Continue On Failure    Should Be True    ${status_page}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-15: Check captured channel in strip management after recaptured event
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     - Changes after recaptured will be recorded
    ...
    ...     **Others**
    ...     Create date: 05/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-15      manual    AIRP-1.9.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-VIEW-17-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the SVT strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-VIEW-17-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-VIEW-43: Verify that the SVT strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-VIEW-43      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-VIEW-66: Verify that SVT event strip automatically checks 'Include event in report' and 'Include strip in report' after capturing from ECG event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-VIEW-66      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-CONFIG-22: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-CONFIG-22       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-CONFIG-43: Verify the 'Strips Configuration' is not updated when the user has captured and modifies configuration from ECG events tab for SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-CONFIG-43       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-CONFIG-63: Verify the 'Strips Configuration' is not updated when the user has just captured a strip from ECG events tab for SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-CONFIG-63       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-CONFIG-88: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-CONFIG-88       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-CONFIG-109: Verify the 'Strips Configuration' is updated when the user has captured and modifies configuration from ECG events tab for SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Update the configuration on PDF report tab
    ...     4. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-CONFIG-109       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-CONFIG-129: Verify the 'Strips Configuration' is updated when the user has just captured a strip from ECG events tab for SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-CONFIG-129       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}    

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-ICON-01: Verify that hovering over the “Re-capture” button displays a tooltip
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...    - This test case verifies that when the user hovers the mouse over the “Re-capture” button in the Strip Management page, a tooltip appears
    ...    - The tooltip provides additional explanation of the button’s function
    ...
    ...     Expected Results:
    ...    1. A tooltip is displayed near the “Re-capture” button
    ...
    ...     **Others**
    ...     Create date: 6/16/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-ICON-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-ICON-02: Verify that hovering on the icon of auto events displays a tooltip
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that for auto events that are updated or created, an icon appears at the top-right corner of the strip card
    ...    - When the user hovers over the icon, a tooltip is displayed explaining the origin of the event
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Identify any auto event that was updated or created (e.g., after clicking “Re-capture”)
    ...    3. Hover the mouse cursor over the icon located in the top-right corner of the strip card
    ...
    ...     Expected Results:
    ...    1. A tooltip appears when hovering over the icon
    ...     **Others**
    ...     Create date: 6/16/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-ICON-02       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-ICON-03: Verify that the auto-icon disappears after the user updates the technician comment in the Strip Management tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...     **Others**
    ...     Create date: 6/16/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-ICON-03       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-ICON-04: Verify that the auto-icon disappears after the user recaptures the strip in the Strip Management tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...     **Others**
    ...     Create date: 6/16/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-ICON-04       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-ICON-05: Verify that the auto-icon does not disappear after the user unchecks "Include Strip" in the Strip Management tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...     **Others**
    ...     Create date: 6/16/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-ICON-05       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-ICON-06: Verify that the auto-icon does not disappear after the user unchecks "Include event in report" in the Strip Management tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...     **Others**
    ...     Create date: 6/16/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-ICON-06       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-ICON-07: Verify that the auto-icon disappears after the user updates the technician comment in the ECG Event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...     **Others**
    ...     Create date: 6/16/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-ICON-07       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-FILTER-01: Verify that the filter modal allows users to filter Auto Events by capture type
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that clicking the filter button opens a modal containing filtering options for Auto Events
    ...    - Users can choose to show all, only auto captured events, or only manually captured events
    ...    - Clicking the "Apply" button applies the selected filter to the Auto Events list
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the filter button
    ...    3. Observe that a modal appears with the following options:
    ...       - Show all events
    ...       - Only show auto captured events
    ...       - Only show manually captured events
    ...    4. Select “Only show auto captured events” and click “Apply”
    ...    5. Observe the filtered result
    ...    6. Repeat step 4 with “Only show manually captured events” and click “Apply”
    ...    7. Repeat step 4 with “Show all events” and click “Apply”
    ...
    ...     Expected Results:
    ...    1. The modal appears with the 3 correct filtering options
    ...    2. When "Only show auto captured events" is selected and applied:
    ...       - Only events captured automatically are shown in the list
    ...    3. When "Only show manually captured events" is selected and applied:
    ...       - Only events captured manually by users are shown
    ...    4. When "Show all events" is selected and applied:
    ...       - Both auto and manually captured events are displayed
    ...
    ...     **Others**
    ...     Create date: 6/16/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-FILTER-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-FILTER-02: Verify that closing the filter modal without clicking “Apply” does not change the filter
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that if the user closes the filter modal without clicking “Apply,” the selected filter is not applied to the Auto Events list
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the filter button
    ...    3. Select the option “Only show manually captured events”
    ...    4. Click outside the modal area to close it (anywhere on the portal outside the modal)
    ...
    ...     Expected Results:
    ...    1. The filter is not applied
    ...    2. The list of Auto Events remains unchanged
    ...
    ...     **Others**
    ...     Create date: 6/16/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-FILTER-02       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-FILTER-03: Verify that “Show all events” is selected by default when opening the filter modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when the filter modal is opened, the default selected option is “Show all events”
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the filter button
    ...
    ...     Expected Results:
    ...    1. The filter modal opens
    ...    2. The radio option “Show all events” is pre-selected by default
    ...
    ...     **Others**
    ...     Create date: 6/16/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-FILTER-03       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-FILTER-04: Verify that “Show all events” is selected by default when opening the filter modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when the filter modal is opened, the default selected option is “Show all events”
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the filter button
    ...
    ...     Expected Results:
    ...    1. The filter modal opens
    ...    2. The radio option “Show all events” is pre-selected by default
    ...
    ...     **Others**
    ...     Create date: 6/16/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-FILTER-04       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-SVT-01: Verify that system re-captures the SVT event with the fastest HR
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that the system captures the Supraventricular Tachycardia (SVT) event with the highest HR after clicking re-capture
    ...
    ...     Precondition:
    ...    - A completed study that contains only SVT events
    ...    - The study does not contain SVE Run or VE Run events
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the "Re-capture" button
    ...    3. Wait for the auto events list to be refreshed
    ...    4. Identify the SVT event with the highest average HR
    ...
    ...     Expected Results:
    ...    1. The system captures the fastest SVT event
    ...    2. The event appears in both ECG Event and Strip Management tabs
    ...    3. The event includes a strip
    ...    4. The event is marked as auto-captured
    ...
    ...     **Others**
    ...     Create date: 6/16/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-SVT-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-SVT-02: Verify that system re-captures the SVT event with the longest duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that the system captures the SVT event with the longest run after re-capture
    ...
    ...     Precondition:
    ...    - A completed study that contains only SVT events
    ...    - The study does not contain SVE Run or VE Run events
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the "Re-capture" button
    ...    3. Wait for the auto events list to be refreshed
    ...    4. Identify the SVT event with the longest duration or beat count
    ...
    ...     Expected Results:
    ...    1. The system captures the longest SVT event
    ...    2. The event appears in both ECG Event and Strip Management tabs
    ...    3. The event includes a strip
    ...    4. The event is marked as auto-captured
    ...
    ...     **Others**
    ...     Create date: 6/16/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-SVT-02       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-SVE-01: Verify that system captures the fastest event among SVT and SVE Run
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when both SVT and SVE Run events exist, the system selects the one with the highest HR
    ...
    ...     Precondition:
    ...    - A completed study containing both SVT and SVE Run events
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the "Re-capture" button
    ...    3. Wait for auto event list to refresh
    ...    4. Identify SVT and SVE Run events and compare average HR
    ...
    ...     Expected Results:
    ...    1. The event (SVT or SVE Run) with highest HR is captured
    ...    2. The event is listed in ECG Event and Strip Management tabs
    ...    3. A strip is included and marked as auto-captured
    ...
    ...     **Others**
    ...     Create date: 6/16/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-SVE-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-SVE-02: Verify that system captures the longest event among SVT and SVE Run
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when both SVT and SVE Run events exist, the system selects the one with the longest run (duration or beat count)
    ...
    ...     Precondition:
    ...    - A completed study containing both SVT and SVE Run events
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the "Re-capture" button
    ...    3. Wait for auto event list to refresh
    ...    4. Identify SVT and SVE Run events and compare duration/beat count
    ...
    ...     Expected Results:
    ...    1. The longest SVT or SVE Run event is captured
    ...    2. The event appears in ECG Event and Strip Management tabs
    ...    3. A strip is included and marked as auto-captured
    ...
    ...     **Others**
    ...     Create date: 6/16/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-SVE-02       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-04: Verify that auto SVT is not displayed if an existing SVT with same Event ID was previously captured
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that the system does not show a new auto SVT strip if a previous SVT event with the same Event ID has already been captured
    ...
    ...     Precondition:
    ...    - A completed study with SVT event already captured (manual or from previous re-capture)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm there is a SVT event present in the list
    ...    3. Click "Re-capture" button
    ...    4. Observe whether a new auto SVT with the same Event ID appears
    ...
    ...     Expected Results:
    ...    1. The system does not display a new auto SVT if its Event ID matches an existing event
    ...    2. Existing captured SVT remains in the list
    ...
    ...     **Others**
    ...     Create date: 6/18/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SVT-RECAPTURE-04       AIRP-1.16.0       manual      R1
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

Navigate to events page
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies      search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_strips_management]
    ${reports}      Get Completed Studies On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Manage Complete Study On              row=1
    Navigate To Studies Type        Events

Stop Processing
    Stop Ai Processing
    ${msg}      Get Message Stop Successful
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}    Stop AI processing success

