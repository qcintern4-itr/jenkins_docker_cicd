*** Settings ***
Documentation   Cardiac Calendar page test suite
Metadata    sid     BCP-NURSE-CAL
Metadata    owner   Hoang Le
Library     DateTime
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/Calendar.py
#Library     project_cardiac_portal/lib/web/Appointment.py
#Library     project_cardiac_portal/lib/web/PatientsNew.py
#Library     project_cardiac_portal/lib/web/PatientDetails.py
#Library     project_cardiac_portal/lib/web/PatientsActive.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-NURSE-CAL       web
Test Timeout    1h

*** Test Cases ***
BCP-NURSE-CAL-01: List view mode - Filter scheduled appointments list
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Access the Calendar page from the main navigation
    ...   2.Select List view mode
    ...   3.Input patient name on the search field
    ...   4.On the left, select the Filter button
    ...   5.Select Appointment type (Virtual/In-person)
    ...   6.Select Plan type (CCM/RPM/CCM&RPM)
    ...   7.Next to the Filter button, select Calendar type (My calendar/Clinic calendar)
    ...   Expected results:
    ...   At step 3, the Appointment(s) list of the searched patient shall be displayed
    ...   At step 4, a modal shall be displayed within the Appointment type check boxes and Plan type check boxes
    ...   The user shall be navigated to the Appointment list of which date it’s created on Day view mode
    ...   The Appointment shall be displayed on both List/Day view mode.
    [Tags]    BCP-NURSE-CAL-01         manual       [BCP-2.15]
    Manual Should Be Passed         ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-CAL-02: Day view mode - Filter scheduled appointments list
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Access the Calendar page from the main navigation
    ...   2.Select Day view mode
    ...   3.Input patient name on the search field
    ...   4.On the left, select the Filter button
    ...   5.Select Appointment type (Virtual/In-person)
    ...   6.Select Plan type (CCM/RPM/CCM&RPM)
    ...   7.Next to the Filter button, select Calendar type (My calendar/Clinic calendar)
    ...   Expected results:
    ...   At step 3, the Appointment(s) list of the searched patient shall be displayed
    ...   At step 4, a modal shall be displayed within the Appointment type check boxes and Plan type check boxes
    ...   The user shall be navigated to the Appointment list of which date it’s created on Day view mode
    ...   The Appointment shall be displayed on both List/Day view mode.
    [Tags]    BCP-NURSE-CAL-02         manual       [BCP-2.15]
    Manual Should Be Passed         ${TEST NAME}        ${TEST DOCUMENTATION}
#    Navigate To Patients New
#    Filter Registered Patients    by_status=All statuses     search_by=Patient name        text_search=${PATIENTS}[0]
#    ${re_patient}       Get Registered Patients
#    Navigate To Calendar
#    Filter Scheduled Appointments
#    Open New Appointment
#    ${medications}      Create Dictionary    medication=Midazolam 100 mg /7mL Injectable Solution [Busulfex]       quantity=90      unit=patch(es)      frequency=1 time / day      time_to_take=11:00 PM       notes=Add medication
#    ${date}             Get Current Date    result_format=%m/%d/%Y    increment=+365 day
#    ${time}             Get Current Date    result_format=%I:%M %p    increment=+30 minute
#    ${time_to}          Get Current Date    result_format=%I:%M %p    increment=+45 minute
#    Create New Appointment    clinic=${FACILITIES}[0]      patient=Chronic patients     patient_name=${PATIENTS}[0]     appt_type=In-person     date=${date}      time=${TIME}     duration=15     reasons=Eyelid swelling, Headache
#    ...  nurse=${CURR_USER}[name]     physician=${PHY_ACT}[name]     medications=${medications}     note=Test create new appointment
#    ${message}      Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${message}      The appointment is successfully created!
#    Navigate To Calendar
#    ${fdate}            Get Current Date    result_format=%A, %B %d, %Y    increment=+365 day   # reformat date to filter
#    Filter Scheduled Appointments     date=${fdate}    by_type=In-person      by_calendar=Clinic calendar      text_search=${PATIENTS}[0]
#    ${sche_appts}       Get Scheduled Appointment Items On    booking_time=${time} - ${time_to}, In-person      reason_for_visit=Eyelid swelling, Headache
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${sche_appts}
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Patient]              ${re_patient}[0][Patient name]        # Patient name
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Patient]              ${re_patient}[0][Care plan ID]        # Care plan ID
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Booking time]         ${time} - ${time_to}                  # Booking time
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Booking time]         In-person                             # Type
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Reason for visit]     Eyelid swelling, Headache             # Reason for visit
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Clinic]               ${FACILITIES}[0]                      # Facility
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Attendees]            ${CURR_USER}[name] (You)              # Nurse
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Attendees]            ${PHY_ACT}[name]                      # Physician

BCP-NURSE-CAL-03: Schedule new appointment for CCM/RPM patients through Calendar page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Calendar page on the main navigation menu
    ...   2.Click New button at the top on the left page
    ...   3.On the Schedule appointment screen, select Patient type as Patient with care plan
    ...   4.Search for patient name on the search field
    ...   5.Select a patient from the results list
    ...   6.Input Appointment info
    ...   7.Select Attendees
    ...   8.Add note - if needed
    ...   9.Click Create button
    ...   Expected results:
    ...   At step 4, the list of patient info shall be displayed with the (CCM/RPM/CCM&RPM) tag
    ...   At step 5, the patient info shall be auto-filled and displayed
    ...   On the Review patient’s appointment screen, the Patient type tag (CCM/RPM/CCM&RPM) shall be displayed next to the Patient name
    ...   At step 9, an appointment shall be created successfully and the user shall be navigated to the Calendar page of which date the appointment is created.
    [Tags]    BCP-NURSE-CAL-03         manual       [BCP-2.15]
    Manual Should Be Passed         ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-CAL-04: Schedule new appointment for the non-CCM patients through Calendar page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Calendar page on the main navigation menu
    ...   2.Click New button at the top on the left page
    ...   3.On the Schedule appointment screen, select Patient type as Other patients
    ...   4.Search for patient name on the search field
    ...   5.Select a patient from the results list
    ...   6.Input Appointment info
    ...   7.Select Attendees
    ...   8.Add note - if needed
    ...   9.Click Create button
    ...   Expected results:
    ...   At step 4, the list of patient info shall be displayed with the ‘No plan’  tag
    ...   At step 5, the patient info shall be auto-filled and displayed
    ...   On the Review patient’s appointment screen, the Patient type tag ‘No plan’ shall be displayed next to the Patient name
    ...   At step 9, an appointment shall be created successfully and the user shall be navigated to the Calendar page of which date the appointment is created.
    [Tags]    BCP-NURSE-CAL-04         manual       [BCP-2.15]
    Manual Should Be Passed         ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-CAL-05: Schedule new Recurring appointment [2.14.0]
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to Calendar page from the main navigation
    ...   2.Click Schedule new appointment button
    ...   3.Fill in the Patient info
    ...   4.Fill in the Appointment info
    ...   5.On the Appointmnet info screen, click on the Recurring appointment check box
    ...   6.Select Frequency as (Daily/Weekly/Bi-weekly/Monthly/Bi-monthly/Every 3 months/Every 6 months/Yearly)
    ...   7.Select End date
    ...   8.Check the message displayed below the End date field
    ...   9.Input Additional info (optional)
    ...   10.On Review patient's appointment screen, click Create button
    ...   Expected result:
    ...   The appointment series shall be created successfully
    ...   The appointment series shall be displayed on the Calendar according to the Frequency as user input.
    [Tags]    BCP-NURSE-CAL-05     manual
    Manual Should Be Passed        ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-CAL-06: Edit an upcoming appointment on the schedules list [2.14.0]
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Calendar page
    ...   2.Click on a specific appointment on the list
    ...   3.Click the Edit button on the appointment side tab
    ...   4.Edit the appointment info
    ...   5.Click Save changes on the side tab
    ...   6.Select 'This appointment' option
    ...   Expected result:
    ...   An appointment info shall be updated successfully.
    [Tags]    BCP-NURSE-CAL-06     manual
    Manual Should Be Passed        ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-CAL-07: Edit an upcoming appointment & the following ones [2.14.0]
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Calendar page
    ...   2.Click on a specific appointment on the list
    ...   3.Click the Edit button on the appointment side tab
    ...   4.Edit the appointment info
    ...   5.Click Save changes on the side tab
    ...   6.Select 'This and all following appointments' option
    ...   Expected result:
    ...   A selected appointment info with all the following ones shall be updated successfully.
    [Tags]    BCP-NURSE-CAL-07     manual
    Manual Should Be Passed        ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-CAL-08: Edit all the appointments in the series [2.14.0]
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Calendar page
    ...   2.Click on a specific appointment on the list
    ...   3.Click the Edit button on the appointment side tab
    ...   4.Edit the appointment info
    ...   5.Click Save changes on the side tab
    ...   6.Select 'All appointments in the series' option
    ...   Expected result:
    ...   All the appointments in the series shall be updated successfully.
    [Tags]    BCP-NURSE-CAL-08     manual
    Manual Should Be Passed        ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-CAL-09: Finish a virtual appointment
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Calendar page
    ...   2.Click on a specific virtual appointment
    ...   3.On the appointment side tab, click Go to appointment details
    ...   4.On the appointment details page, click the Finish button
    ...   Expected result:
    ...   The appointment shall be displayed as Done.
    [Tags]    BCP-NURSE-CAL-09     manual
    Manual Should Be Passed        ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-CAL-10: Mark an in-person appointment as Done
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Calendar page
    ...   2.Click on a specific in-person appointment
    ...   3.On the appointment side tab, click Go to appointment details
    ...   4.On the appointment details page, click the Mark as done button
    ...   Expected result:
    ...   The appointment shall be displayed as Done.
    [Tags]    BCP-NURSE-CAL-10     manual
    Manual Should Be Passed        ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-CAL-11: Mark an in-person appointment as Overdue
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Calendar page
    ...   2.Click on a specific in-person appointment
    ...   3.On the appointment side tab, click Go to appointment details
    ...   4.On the appointment details page, click the Mark as overdue button
    ...   Expected result:
    ...   The appointment shall be displayed as Overdue.
    [Tags]    BCP-NURSE-CAL-11     manual
    Manual Should Be Passed        ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-CAL-12: Cancel an upcoming appointment [2.14.0]
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Calendar page
    ...   2.Click on a specific appointment
    ...   3.On the appointment side tab, click Go to appointment details
    ...   4.On the appointment details page, click the Cancel appointment button
    ...   5.Select 'This appointment' option
    ...   Expected result:
    ...   A selected appointment shall be deleted only.
    [Tags]    BCP-NURSE-CAL-12     manual
    Manual Should Be Passed        ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-CAL-13: Cancel an upcoming appointment & the following ones [2.14.0]
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Calendar page
    ...   2.Click on a specific appointment
    ...   3.On the appointment side tab, click Go to appointment details
    ...   4.On the appointment details page, click the Cancel appointment button
    ...   5.Select 'This and all following appointments' option
    ...   Expected result:
    ...   A selected appointment with all the following ones shall be deleted from the schedules list.
    [Tags]    BCP-NURSE-CAL-13     manual
    Manual Should Be Passed        ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-CAL-14: Cancel all the appointments in the series [2.14.0]
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Calendar page
    ...   2.Click on a specific appointment
    ...   3.On the appointment side tab, click Go to appointment details
    ...   4.On the appointment details page, click the Cancel appointment button
    ...   5.Select 'All appointments in the series' option
    ...   Expected result:
    ...   All the appointments in the series shall be deleted from the shedules list.
    [Tags]    BCP-NURSE-CAL-14     manual
    Manual Should Be Passed        ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-CAL-15: Schedule recurring appointment(s) from Calendar tab
    [Documentation]    Author: Hoang Le
    ...
    ...  Test Steps:
    ...  1. Go to Calendar tab
    ...  2. Click New button from the view
    ...  3. On step 2 of Schedule new appointment, tick on Recurring appointment check box
    ...  4. Select End date for the recurring appointments
    ...  5. Select Frequency for the recurring one as (daily/weekly/bi-weekly/monthly/bi-monthly/every 3 months/every 6 months/yearly)
    ...  6. Finish other steps as usual then click Create
    ...  Expected results:
    ...  - The recurring appointments shall be created successfully
    ...  - The recurring appointments shall be displayed on the Calendar view of which days it were created
    ...  - A notification shall be sent one time only to patient’s caregivers, appointment’s attendees and the patient
    ...  - Each appointment in the series will be occurred at the time set in the series
    [Tags]    BCP-NURSE-CAL-15    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-CAL-16: Schedule recurring appointment(s) from New/Active patients list
    [Documentation]    Author: Hoang Le
    ...
    ...  Test Steps:
    ...  1. Go to New/Active patients list
    ...  2. Click Create button on a specific care plan from the list
    ...  3. On step 2 of Schedule new appointment, tick on Recurring appointment check box
    ...  4. Select End date for the recurring appointments
    ...  5. Select Frequency for the recurring one as (daily/weekly/bi-weekly/monthly/bi-monthly/every 3 months/every 6 months/yearly)
    ...  6. Finish other steps as usual then click Create
    ...  Expected results:
    ...  - The recurring appointments shall be created successfully
    ...  - The recurring appointments shall be displayed on the Calendar view of which days it were created
    ...  - A notification shall be sent to patient’s caregivers, appointment’s attendees and patient just one time only
    ...  - Each appointment in the series will be occurred at the time set in the series
    [Tags]    BCP-NURSE-CAL-16    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-CAL-17: Schedule recurring appointment(s) from patient details page
    [Documentation]    Author: Hoang Le
    ...
    ...  Test Steps:
    ...  1. Go to a patient details page
    ...  2. Click Schedule new appointment button on Demographic side tab or Overview tab - Upcoming events
    ...  3. On step 2 of Schedule new appointment, tick on Recurring appointment check box
    ...  4. Select End date for the recurring appointments
    ...  5. Select Frequency for the recurring one as (daily/weekly/bi-weekly/monthly/bi-monthly/every 3 months/every 6 months/yearly)
    ...  6. Finish other steps as usual then click Create
    ...  Expected results:
    ...  - The recurring appointments shall be created successfully
    ...  - The recurring appointments shall be displayed on the Calendar view of which days it were created
    ...  - A notification shall be sent to a patient’s caregivers, appointment’s attendees and patient just one time only
    ...  - Each appointment in the series will be occurred at the time set in the series
    [Tags]    BCP-NURSE-CAL-17    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-CAL-18: Cancel a current appointment on appointment info side tab
    [Documentation]    Author: Hoang Le
    ...
    ...  Test Steps:
    ...  1. Go to Calendar tab
    ...  2. Pick an appointment which user wants to cancel
    ...  3. On the side tab, click Cancel appointment button
    ...  4. Select This appointment option
    ...  Expected results:
    ...  - An appointment shall be canceled from the series and disappeared from the Calendar
    ...  - An appointment shall be canceled from the patient app also
    [Tags]    BCP-NURSE-CAL-18    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-CAL-19: Cancel a current appointment on appointment details screen
    [Documentation]    Author: Hoang Le
    ...
    ...  Test Steps:
    ...  1. Go to Calendar tab
    ...  2. Pick an appointment which user wants to cancel
    ...  3. On the side tab, click Go to appointment details button
    ...  4. Select Cancel appointment button from the bottom
    ...  5. Click This appointment option
    ...  Expected results:
    ...  - An appointment shall be canceled from the series and disappeared from the Calendar
    ...  - An appointment shall be canceled from the patient app also
    [Tags]    BCP-NURSE-CAL-19    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-CAL-20: Cancel current and all following appointments on appointment info side tab
    [Documentation]    Author: Hoang Le
    ...
    ...  Test Steps:
    ...  1. Go to Calendar tab
    ...  2. Pick an appointment which user wants to cancel
    ...  3. On the side tab, click Cancel appointment button
    ...  4. Select This and all following appointments option
    ...  Expected results:
    ...  - All appointments from this and after this appointment shall be canceled from the series and disappeared from the Calendar
    ...  - All appointments shall be canceled from the patient app also
    [Tags]    BCP-NURSE-CAL-20    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-CAL-21: Cancel current and all following appointments on appointment info side tab
    [Documentation]    Author: Hoang Le
    ...
    ...  Test Steps:
    ...  1. Go to Calendar tab
    ...  2. Pick an appointment which user wants to cancel
    ...  3. On the side tab, click Go to appointment details button
    ...  4. Select Cancel appointment button from the bottom
    ...  5. Click This and all following appointments option
    ...  Expected results:
    ...  - All appointments from this and after this appointment shall be canceled from the series and disappeared from the Calendar
    ...  - All appointments shall be canceled from the patient app also
    [Tags]    BCP-NURSE-CAL-21    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-CAL-22: Cancel all appointments in the series from the appointment info side tab
    [Documentation]    Author: Hoang Le
    ...
    ...  Test Steps:
    ...  1. Go to Calendar tab
    ...  2. Pick an appointment which user wants to cancel
    ...  3. On the side tab, click Cancel appointment button
    ...  4. Select All appointments in the series option
    ...  Expected results:
    ...  - All appointments in the series (which is not yet occurred only) shall be canceled and disappeared on the Calendar
    ...  - All appointments in the series (which is not yet occurred only) shall be canceled from the patient app also
    [Tags]    BCP-NURSE-CAL-22    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-CAL-23: Cancel all appointments in the series from the appointment details screen
    [Documentation]    Author: Hoang Le
    ...
    ...  Test Steps:
    ...  1. Go to Calendar tab
    ...  2. Pick an appointment which user wants to cancel
    ...  3. On the side tab, click Go to appointment details button
    ...  4. Select Cancel appointment button from the bottom
    ...  5. Click All appointments in the series option
    ...  Expected results:
    ...  - All appointments in the series (which is not yet occurred only) shall be canceled and disappeared on the Calendar
    ...  - All appointments in the series (which is not yet occurred only) shall be canceled from the patient app also
    [Tags]    BCP-NURSE-CAL-23    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}


*** Keywords ***
#Suite Setup
    ${BROWSER_NODE}      Start Browser
    Import Library      project_cardiac_portal/lib/web/Common.py          ${BROWSER_NODE}  ${ENV}
    Import Library      project_cardiac_portal/lib/web/Appointment.py     ${BROWSER_NODE}  ${ENV}
    Import Library      project_cardiac_portal/lib/web/Calendar.py        ${BROWSER_NODE}  ${ENV}
    Import Library      project_cardiac_portal/lib/web/PatientsNew.py     ${BROWSER_NODE}  ${ENV}
    Import Library      project_cardiac_portal/lib/web/PatientDetails.py  ${BROWSER_NODE}  ${ENV}
    Import Library      project_cardiac_portal/lib/web/PatientsActive.py  ${BROWSER_NODE}  ${ENV}
    ${NURSES}         Get Config Param    USER > nurse
    ${PHYCISIANS}     Get Config Param    USER > physician
    ${PATIENTS}       Get Config Param    USER > patient
    ${FACILITIES}     Get Config Param    USER > facilities
    Set Suite Variable      ${CURR_USER}    ${NURSES}[0]
    Set Suite Variable      ${NURSE_ACT}    ${NURSES}[1]
    Set Suite Variable      ${NURSE_NACT}    ${NURSES}[2]
    Set Suite Variable      ${PHY_ACT}       ${PHYCISIANS}[0]
    Set Suite Variable      ${PHY_NACT}      ${PHYCISIANS}[1]
    Set Suite Variable      ${PATIENTS}
    Set Suite Variable      ${FACILITIES}
    ${TOKEN}        Sign In Cardiac     username=${CURR_USER}[username]   password=${CURR_USER}[password]
    ${VERSION}           Get Release Version
    Set Suite Variable   ${TOKEN}
    Set Suite Metadata   version    ${VERSION}
    Set Suite Metadata   browser    ${BROWSER.capitalize()}

#Suite Teardown
    Quit Browser

Filter Follow-up
    [Arguments]    ${by_patient}    ${date}
    Navigate To Calendar
    Filter Follow Up     date=${date}     by_patient=${by_patient}
    ${fwu_patients}     Get Follow Up Items
    ${text}     Set Variable    ${fwu_patients}[0][Patient][0]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${fwu_patients}      No Follow-up patient found - Patient name without text string
    Filter Follow Up     date=${date}     by_patient=${by_patient}      text_search=${text}
    ${fwu_patients}     Get Follow Up Items
    Run Keyword And Continue On Failure    Should Not Be Empty    ${fwu_patients}      No Follow-up patient found - Patient ${text}
    Run Keyword And Continue On Failure    Should Be True    all('${text}'.lower() in p['Patient'][0].lower() for p in ${fwu_patients})

Filter Scheduled Appt
    [Arguments]     ${by_calendar}     ${by_type}     ${date}
    Navigate To Calendar
    Filter Scheduled Appointments    date=${date}    by_calendar=${by_calendar}     by_type=${by_type}
    ${sche_patients}    Get Scheduled Appointment Items
    Run Keyword And Continue On Failure    Should Not Be Empty    ${sche_patients}      No Scheduled patient appointment found - patient name without text string
    ${patient}     Set Variable    ${sche_patients}[0][Patient]
    ${text}        Set Variable    ${patient.split(', ')}[0]
    Filter Scheduled Appointments    date=${date}    by_calendar=${by_calendar}    by_type=${by_type}    text_search=${text}
    ${sche_patients}    Get Scheduled Appointment Items
    Run Keyword And Continue On Failure    Should Not Be Empty    ${sche_patients}      No Scheduled patient appointment found - patient name ${text}
    Run Keyword And Continue On Failure    Should Be True    all('${text}'.lower() in p['Patient'].split(', ')[0].lower() for p in ${sche_patients})
    Run Keyword If    '${by_type}' != 'All types'  # Booking time also contains appt type
    ...  Run Keyword And Continue On Failure    Should Be True    all('${by_type}' in p['Booking time'] for p in ${sche_patients})
    Run Keyword If    '${by_calendar}' == 'My calendar'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${CURR_USER}[name] (You)' in p['Attendees'].split(', ')[0] for p in ${sche_patients})
    View Appointment Details    row=1
    ${header}      Get Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}      Appointment details
    ${appt_details}     Get Appointment Details
    Run Keyword And Continue On Failure    Should Be Equal    ${appt_details}[Name]     ${text}

Create New Scheduled Appointment
    [Arguments]    ${date}      ${patient}      ${assignee}
    Navigate To Calendar
    Filter Scheduled Appointments
    Open New Appointment
    ${medications}      Create Dictionary    medication=Midazolam 100 mg /7mL Injectable Solution [Busulfex]       quantity=90      unit=patch(es)      frequency=1 time / day      time_to_take=11:00 PM       notes=Add medication
    ${time}             Get Current Date    result_format=%I:%M %p    increment=+30 minute
    Create New Appointment    clinic=${FACILITIES}[0]      patient=Chronic patients     patient_name=${PATIENTS}[0]     appt_type=In-person     date=${date}      time=${TIME}     duration=15     reasons=Eyelid swelling, Headache
    ...  nurse=${assignee}     physician=${PHY_ACT}[name]     medications=${medications}     note=Test create new appointment
    ${message}      Get Success Message
    Run Keyword And Continue On Failure    Should Be Equal    ${message}      The appointment is successfully created!
