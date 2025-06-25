*** Settings ***
Documentation   Cardiac Calendar page test suite
Metadata    sid     BCP-PHY-CAL
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
Library     DateTime
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/Calendar.py
#Library     project_cardiac_portal/lib/web/Appointment.py
#Library     project_cardiac_portal/lib/web/PatientsNew.py
#Library     project_cardiac_portal/lib/web/PatientsActive.py
#Library     project_cardiac_portal/lib/web/PatientDetails.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-PHY-CAL     web
Test Timeout    1h

*** Test Cases ***
BCP-PHY-CAL-01: Schedule new appointment for CCM/RPM patients through Calendar page
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
    [Tags]    BCP-PHY-CAL-01         manual       [BCP-2.15]
    Manual Should Be Passed         ${TEST NAME}        ${TEST DOCUMENTATION}
#    Navigate To Patients New
#    Filter New Patients     by_patient=All patients    by_status=All statuses     search_by=Patient name        text_search=${PATIENTS}[5]
#    ${new_patient}       Get New Patients
#    Navigate To Calendar
#    Filter Scheduled Appointments
#    Open New Appointment
#    ${medications}      Create Dictionary    medication=Midazolam 100 mg /7mL Injectable Solution [Busulfex]       quantity=90      unit=patch(es)      frequency=1 time / day      time_to_take=11:00 PM       notes=Add medication
#    ${date}             Get Current Date    result_format=%m/%d/%Y    increment=+300 day
#    ${time}             Get Current Date    result_format=%I:%M %p    increment=+30 minute
#    ${time_to}          Get Current Date    result_format=%I:%M %p    increment=+45 minute
#    Create New Appointment    clinic=${FACILITIES}[0]      patient=Chronic patients     patient_name=${PATIENTS}[5]     appt_type=In-person     date=${date}      time=${time}     duration=15     reasons=Eyelid swelling, Headache
#    ...  nurse=${NURSE_ACT}[name]     physician=${CURR_USER}[name]     medications=${medications}     note=Test create new appointment
#    ${message}      Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${message}      The appointment is successfully created!
#    Navigate To Calendar
#    ${fdate}            Get Current Date    result_format=%A, %B %d, %Y    increment=+300 day   # reformat date to filter
#    Filter Scheduled Appointments     date=${fdate}    by_type=In-person      by_calendar=Clinic calendar      text_search=${PATIENTS}[5]
#    ${sche_appts}       Get Scheduled Appointment Items On    booking_time=${time} - ${time_to}, In-person      reason_for_visit=Eyelid swelling, Headache
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${sche_appts}
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Patient]              ${new_patient}[0][Patient name]        # Patient name
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Patient]              ${new_patient}[0][Care plan ID]        # Care plan ID
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Booking time]         ${time} - ${time_to}                   # Booking time
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Booking time]         In-person                              # Type
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Reason for visit]     Eyelid swelling, Headache              # Reason for visit
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Clinic]               ${FACILITIES}[0]                       # Facility
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Attendees]            ${NURSE_ACT}[name]                     # Nurse
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Attendees]            ${CURR_USER}[name] (You)               # Physician

BCP-PHY-CAL-02: Create One-Off Appointment In The Patient - New Tab
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Go to the New patients page
    ...  - Click on 'Create appointment' button on a specific patient row
    ...  - Fill out all the required fields with valid value
    ...  - Click on 'Create' button
    ...  - Go back to the Calendar - Scheduled appointments tab to check appointment data
    ...  Expected Output:
    ...  - Appointment is created and displayed in the Scheduled appointments tab
    ...  - A snack bar will be displayed: 'The appointment is successfully created'
    ...  - The appointment will be displayed on the Scheduled appointments tab of the date that user creates it with the correct information
    [Tags]    BCP-PHY-CAL-02        inactive    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    Navigate To Patients New
#    Filter New Patients     by_patient=All patients     by_status=All statuses      search_by=Patient name      text_search=${PATIENTS}[6]
#    ${patients_new}     Get New Patients
#    ${patient_name}     Set Variable    ${patients_new}[0][Patient name]
#    Open New Patient New Appointment On    Patient_name=${patient_name}
#    ${medications}      Create Dictionary    medication=Midazolam 100 mg /7mL Injectable Solution [Busulfex]       quantity=90      unit=patch(es)      frequency=1 time / day      time_to_take=11:00 PM       notes=Add medication
#    ${date}             Get Current Date    result_format=%m/%d/%Y    increment=+301 day
#    ${time}             Get Current Date    result_format=%I:%M %p    increment=+30 minute
#    ${time_to}          Get Current Date    result_format=%I:%M %p    increment=+45 minute
#    Create New Appointment    appt_type=In-person     date=${date}      time=${time}     duration=15     reasons=Anxiety    nurse=${NURSE_ACT}[name]     physician=${CURR_USER}[name]     medications=${medications}    note=Test create new appointment
#    ${message}      Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${message}        The appointment is successfully created!
#    # Verify on Scheduled Appointments
#    Navigate To Calendar
#    ${fdate}            Get Current Date    result_format=%A, %B %d, %Y    increment=+301 day   # reformat date to filter
#    Filter Scheduled Appointments    date=${fdate}     by_type=In-person     by_calendar=My calendar      text_search=${patient_name}
#    ${sche_appts}       Get Scheduled Appointment Items On      booking_time=${time} - ${time_to}, In-person      reason_for_visit=Anxiety
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${sche_appts}
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Patient]              ${patient_name}                       # Patient name
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Patient]              ${patients_new}[0][Care plan ID]      # Care plan ID
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Booking time]         ${time} - ${time_to}                  # Booking time
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Booking time]         In-person                             # Type
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Reason for visit]     Anxiety                               # Reason for visit
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Clinic]               ${FACILITIES}[0]                      # Facility
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Attendees]            ${NURSE_ACT}[name]                    # Nurse
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Attendees]            ${CURR_USER}[name] (You)              # Physician

BCP-PHY-CAL-03: Create One-Off Appointment In The Patient - Active Tab
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Go to the Active patients page
    ...  - Click on 'Create appointment' button on a specific patient row
    ...  - Fill out all the required fields with valid value
    ...  - Click on 'Create' button
    ...  - Go back to the Calendar - Scheduled appointments tab to check appointment data
    ...  Expected Output:
    ...  - Appointment is created and displayed in the Scheduled appointments tab
    ...  - A snack bar will be displayed: 'The appointment is successfully created'
    ...  - The appointment will be displayed on the Scheduled appointments tab of the date that user creates it with the correct information
    [Tags]    BCP-PHY-CAL-03        inactive    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    Navigate To Patients Active
#    Filter Active Patients    by_patient=All patients     search_by=Patient name     text_search=${PATIENTS}[19]
#    ${active_patients}      Get Active Patients
#    ${patient_name}     Set Variable    ${active_patients}[0][Patient name]
#    Open Active Patient New Appointment On    patient_name=${patient_name}
#    ${medications}      Create Dictionary    medication=Midazolam 100 mg /7mL Injectable Solution [Busulfex]       quantity=90      unit=patch(es)      frequency=1 time / day      time_to_take=11:00 PM       notes=Add medication
#    ${date}             Get Current Date    result_format=%m/%d/%Y    increment=+302 day
#    ${time}             Get Current Date    result_format=%I:%M %p    increment=+30 minute
#    ${time_to}          Get Current Date    result_format=%I:%M %p    increment=+45 minute
#    Create New Appointment    appt_type=In-person     date=${date}      time=${time}     duration=15     reasons=Chest pain or pressure at rest    nurse=${NURSE_ACT}[name]     physician=${CURR_USER}[name]     medications=${medications}    note=Test create new appointment
#    ${message}          Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${message}      The appointment is successfully created!
#    # Verify on Scheduled Appointments
#    ${fdate}            Get Current Date    result_format=%A, %B %d, %Y    increment=+302 day   # reformat date to filter
#    Navigate To Calendar
#    Filter Scheduled Appointments    date=${fdate}     by_type=In-person     by_calendar=My calendar      text_search=${patient_name}
#    ${sche_appts}       Get Scheduled Appointment Items On      booking_time=${time} - ${time_to}, In-person      reason_for_visit=Chest pain or pressure at rest
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${sche_appts}
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Patient]              ${patient_name}                       # Patient name
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Patient]              ${active_patients}[0][Care plan ID]   # Care plan ID
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Booking time]         ${time} - ${time_to}                  # Booking time
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Booking time]         In-person                             # Type
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Reason for visit]     Chest pain or pressure at rest        # Reason for visit
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Clinic]               ${active_patients}[0][Clinic]         # Facility
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Attendees]            ${NURSE_ACT}[name]                    # Nurse
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Attendees]            ${CURR_USER}[name] (You)              # Physician

BCP-PHY-CAL-04: Create One-Off Appointment In The Specific Patient's Details Page
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Go to the patient's details page of a specific care plan
    ...  - Click on 'Create appointment' button at the bottom of the patient's demographic side tab info
    ...  - Fill out all the required fields with valid value
    ...  - Click on 'Create' button
    ...  - Go back to the Calendar - Scheduled appointments tab to check appointment data
    ...  Expected Output:
    ...  - Appointment is created and displayed in the Scheduled appointments tab
    ...  - A snack bar will be displayed: 'The appointment is successfully created'
    ...  - The appointment will be displayed on the Scheduled appointments tab of the date that user creates it with the correct information
    [Tags]    BCP-PHY-CAL-04      inactive    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

#    Navigate To Patients Active
#    Filter Active Patients     by_patient=All patients      search_by=Patient name     text_search=${PATIENTS}[1]
#    ${active_patient}     Get Active Patients
#    ${patient_name}       Set Variable    ${active_patient}[0][Patient name]
#    View Active Patient Details On    care_plan_id=${active_patient}[0][Care plan ID]     patient_name=${patient_name}
#    # On DemoGraphic
#    Open Create New Appointment
#    ${medications}      Create Dictionary    medication=Midazolam 100 mg /7mL Injectable Solution [Busulfex]       quantity=90      unit=patch(es)      frequency=1 time / day      time_to_take=11:00 PM       notes=Add medication
#    ${date}             Get Current Date    result_format=%m/%d/%Y    increment=+303 day
#    ${time}             Get Current Date    result_format=%I:%M %p    increment=+30 minute
#    ${time_to}          Get Current Date    result_format=%I:%M %p    increment=+45 minute
#    Create New Appointment    appt_type=In-person     date=${date}      time=${time}     duration=15     reasons=Birth control method (new)    nurse=${NURSE_ACT}[name]     physician=${CURR_USER}[name]     medications=${medications}    note=Test create new appointment
#    ${message}          Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${message}      The appointment is successfully created!
#    # Verify on Scheduled Appointments
#    ${fdate}            Get Current Date    result_format=%A, %B %d, %Y    increment=+303 day   # reformat date to filter
#    Navigate To Calendar
#    Filter Scheduled Appointments    date=${fdate}     by_type=In-person     by_calendar=My calendar      text_search=${patient_name}
#    ${sche_appts}       Get Scheduled Appointment Items On      booking_time=${time} - ${time_to}, In-person      reason_for_visit=Birth control method (new)
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${sche_appts}
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Patient]              ${patient_name}                       # Patient name
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Patient]              ${active_patient}[0][Care plan ID]    # Care plan ID
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Booking time]         ${time} - ${time_to}                  # Booking time
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Booking time]         In-person                             # Type
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Reason for visit]     Birth control method (new)            # Reason for visit
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Clinic]               ${active_patient}[0][Clinic]          # Facility
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Attendees]            ${NURSE_ACT}[name]                    # Nurse
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Attendees]            ${CURR_USER}[name] (You)              # Physician

BCP-PHY-CAL-05: Create One-Off Appointment in the past date&time fail
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to Calendar - Scheduled appointments tab
    ...   - Select New button from the top right
    ...   - Fill out all the required fields with valid value but in the past date&time
    ...   - Click Create button
    ...   Expected Result:
    ...   - A snack bar is displayed "Please select a future date/time!"
    ...   - An appointment can not be created
    [Tags]    BCP-PHY-CAL-05   inactive    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
    # Create appt
#    Navigate To Calendar
#    Filter Scheduled Appointments
#    Open New Appointment
#    ${medications}      Create Dictionary    medication=Midazolam 100 mg /7mL Injectable Solution [Busulfex]       quantity=90      unit=patch(es)      frequency=1 time / day      time_to_take=11:00 PM       notes=Add medication
#    ${time}    Get Current Date    result_format=%I:%M %p    increment=+1 minute
#    Create New Appointment Page 1     clinic=${FACILITIES}[0]      patient=Chronic patients     patient_name=${PATIENTS}[2]
#    Create New Appointment Page 2     appt_type=In-person     date=today      time=${time}    duration=15     reasons=Eyelid swelling, Headache    nurse=${NURSE_ACT}[name]     physician=${CURR_USER}[name]
#    Create New Appointment Page 3     medications=${medications}
#    Sleep   65s     # Wait until creation time expires
#    Create New Appointment Page 4     note=Test create new appointment with in the past date&time fail
#    ${message}      Get Error Message
#    Run Keyword And Continue On Failure     Should Be Equal    ${message}     Please select a future date/time!
#    Back From Create Appointment  # resolve timeout

BCP-PHY-CAL-06: Create One-Off Appointment with the busy attendee(s) success
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to Calendar - Scheduled appointments tab
    ...   - Select New button from the top right
    ...   - Fill out all the required fields with valid value and busy attendee(s)
    ...   - Click Create button
    ...   Expected Result:
    ...   - Appointment is created and displayed in the Scheduled appointments tab
    ...   - A snack bar will be displayed: 'The appointment is successfully created'
    ...   - The appointment will be displayed on the Scheduled appointments tab of the date that user creates it with the correct information
    [Tags]    BCP-PHY-CAL-06    inactive    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    Navigate To Calendar
#    Filter Scheduled Appointments
#    Open New Appointment
#    ${medications}      Create Dictionary    medication=Midazolam 100 mg /7mL Injectable Solution [Busulfex]       quantity=90      unit=patch(es)      frequency=1 time / day      time_to_take=11:00 PM       notes=Add medication
#    ${date}             Get Current Date    result_format=%m/%d/%Y    increment=+304 day
#    ${time}             Get Current Date    result_format=%I:%M %p    increment=+30 minute
#    ${time_to}          Get Current Date    result_format=%I:%M %p    increment=+45 minute
#    Create New Appointment    clinic=${FACILITIES}[0]      patient=Chronic patients     patient_name=${PATIENTS}[2]     appt_type=In-person     date=${date}      time=${time}     duration=15     reasons=Eyelid swelling, Headache
#    ...  nurse=${NURSE_ACT}[name]     physician=${CURR_USER}[name]     medications=${medications}     note=Test create new appointment
#    ${message}      Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${message}     The appointment is successfully created!
#    # Repeat under creating appt steps with same attendees on other patient
#    Navigate To Calendar
#    Filter Scheduled Appointments
#    Open New Appointment
#    ${medications}      Create Dictionary    medication=Midazolam 100 mg /7mL Injectable Solution [Busulfex]       quantity=90      unit=patch(es)      frequency=1 time / day      time_to_take=11:00 PM       notes=Add medication
#    Create New Appointment    clinic=${FACILITIES}[0]      patient=Chronic patients     patient_name=${PATIENTS}[2]     appt_type=In-person     date=${date}      time=${time}     duration=15     reasons=Anxiety
#    ...  nurse=${NURSE_ACT}[name]     physician=${CURR_USER}[name]     medications=${medications}     note=Test create new appointment
#    ${message}      Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${message}      The appointment is successfully created!
#    # Verify on Scheduled Appointments
#    ${fdate}            Get Current Date    result_format=%A, %B %d, %Y    increment=+304 day   # reformat date to filter
#    Navigate To Calendar
#    Filter Scheduled Appointments    date=${fdate}     by_type=In-person     by_calendar=Clinic calendar      text_search=${PATIENTS}[2]
#    ${sche_appts}       Get Scheduled Appointment Items On      booking_time=${time} - ${time_to}, In-person      reason_for_visit=Anxiety
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${sche_appts}
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Patient]              ${PATIENTS}[2]                        # Patient name
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Booking time]         ${time} - ${time_to}                  # Booking time
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Booking time]         In-person                             # Type
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Reason for visit]     Anxiety                               # Reason for visit
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Clinic]               ${FACILITIES}[0]                      # Facility
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Attendees]            ${NURSE_ACT}[name]                    # Nurse
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Attendees]            ${CURR_USER}[name]                    # Physician

BCP-PHY-CAL-07: Create One-Off Appointment with the attendee(s) who is not in their working hours
    [Documentation]    Author: Hoang Le
     ...
     ...   Test Steps:
     ...   - Go to Calendar - Scheduled appointments tab
     ...   - Select New button from the top right
     ...   - Fill out date&time fields
     ...   - Search for an attendee who does not work for a selected date&time
     ...   Expected Result:
     ...   - An attendee who is not in their working hours will not be displayed in the dropdown list
     [Tags]    BCP-PHY-CAL-07    manual     inactive
     Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-CAL-08: Create One-Off Appointment for unlinked patient's account
    [Documentation]    Author: Hoang Le
    ...   Test Steps:
    ...   - Go to Calendar - Scheduled appointments tab
    ...   - Select New button from the top right
    ...   - Fill out all the required fields and pre-selected appointment type will be "In-person" as default
    ...   - Select Create button at the last step
    ...   Expected Result:
    ...   - User just can create In-person appointment type for unlinked patient's account only
    [Tags]    BCP-PHY-CAL-08    inactive    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    Navigate To Calendar
#    Filter Scheduled Appointments
#    Open New Appointment
#    ${medications}      Create Dictionary    medication=Midazolam 100 mg /7mL Injectable Solution [Busulfex]       quantity=90      unit=patch(es)      frequency=1 time / day      time_to_take=11:00 PM       notes=Add medication
#    ${date}             Get Current Date    result_format=%m/%d/%Y    increment=+305 day
#    ${time}             Get Current Date    result_format=%I:%M %p    increment=+30 minute
#    ${time_to}          Get Current Date    result_format=%I:%M %p    increment=+45 minute
#    Create New Appointment Page 1    clinic=${FACILITIES}[0]      patient=Chronic patients     patient_name=${PATIENTS}[2]
#    Create New Appointment Page 2    appt_type=In-person     is_next=False  # stand on page 2 to verify type notice
#    # Verify the notice
#    ${notice}     Get New Appt Type Notice
#    Run Keyword And Continue On Failure    Should Be Equal    ${notice}     Only in-person appointment type is available for patients that have not linked their care plan
#    Create New Appointment Page 2    appt_type=In-person     date=${date}      time=${time}     duration=15     reasons=Anxiety    nurse=${NURSE_ACT}[name]     physician=${CURR_USER}[name]
#    Create New Appointment Page 3    medications=${medications}
#    Create New Appointment Page 4    note=Test create new appointment
#    ${message}      Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${message}        The appointment is successfully created!
#    # Verify on Scheduled Appointments
#    Navigate To Calendar
#    ${fdate}            Get Current Date    result_format=%A, %B %d, %Y    increment=+305 day   # reformat date to filter
#    Filter Scheduled Appointments    date=${fdate}     by_type=In-person     by_calendar=My calendar      text_search=${PATIENTS}[2]
#    ${sche_appts}       Get Scheduled Appointment Items On      booking_time=${time} - ${time_to}, In-person      reason_for_visit=Anxiety
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${sche_appts}
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Patient]              ${PATIENTS}[2]                        # Patient name
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Booking time]         ${time} - ${time_to}                  # Booking time
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Booking time]         In-person                             # Type
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Reason for visit]     Anxiety                               # Reason for visit
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Clinic]               ${FACILITIES}[0]                      # Facility
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Attendees]            ${NURSE_ACT}[name]                    # Nurse
#    Run Keyword And Continue On Failure    Should Contain     ${sche_appts}[Attendees]            ${CURR_USER}[name] (You)              # Physician

BCP-PHY-CAL-09: Edit One-Off Appointment
     [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Go to Calendar - Scheduled appointments tab
    ...  - Select on a specific appointments row
    ...  - Click on Edit icon at the top page of Appointment details page
    ...  - Edit information with the valid value
    ...  - Select Save
    ...  Expected Output:
    ...  - The Save button will be enabled if all the changes are valid
    ...  - The changes will be saved and displayed with a confirmation toast
    [Tags]    BCP-PHY-CAL-09   inactive    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
    # Create appt
#    Navigate To Patients New
#    Filter New Patients     by_patient=All patients     by_status=All statuses    search_by=Patient name       text_search=${PATIENTS}[5]
#    ${new_patients}     Get New Patients
#    ${patient_name}     Set Variable    ${new_patients}[0][Patient name]
#    Navigate To Calendar
#    Filter Scheduled Appointments
#    Open New Appointment
#    ${medications}      Create Dictionary    medication=Midazolam 100 mg /7mL Injectable Solution [Busulfex]       quantity=90      unit=patch(es)      frequency=1 time / day      time_to_take=11:00 PM       notes=Add medication
#    ${date}             Get Current Date    result_format=%m/%d/%Y          increment=+306 day
#    ${time}             Get Current Date    result_format=%I:%M %p          increment=+30 minute
#    ${time_to}          Get Current Date    result_format=%I:%M %p          increment=+45 minute
#    ${fdate}            Get Current Date    result_format=%A, %B %d, %Y     increment=+306 day   # reformat date to filter
#    Create New Appointment    clinic=${new_patients}[0][Clinic]      patient=Chronic patients     patient_name=${patient_name}     appt_type=In-person     date=${date}      time=${time}     duration=15     reasons=Eyelid swelling, Headache
#    ...  nurse=${NURSE_ACT}[name]     physician=${CURR_USER}[name]     medications=${medications}     note=Test create new appointment
#    ${message}      Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${message}     The appointment is successfully created!
#    Navigate To Calendar
#    Filter Scheduled Appointments       date=${fdate}      by_calendar=My calendar     by_type=In-person       text_search=${patient_name}
#    View Appointment Details    booking_time=${time} - ${time_to}, In-person      Patient=${patient_name}, Care plan: ${new_patients}[0][Care plan ID]
#    ${old_appt_details}     Get Appointment Details
#    # Calendar -> Scheduled appt
#    Navigate To Calendar
#    Filter Scheduled Appointments       date=${fdate}      by_calendar=My calendar     by_type=In-person       text_search=${patient_name}
#    ${old_sched_appt}     Get Scheduled Appointment Items On    booking_time=${time} - ${time_to}, In-person      Patient=${patient_name}, Care plan: ${new_patients}[0][Care plan ID]
#    # Edit attendees
#    View Appointment Details    booking_time=${time} - ${time_to}, In-person      Patient=${patient_name}, Care plan: ${new_patients}[0][Care plan ID]
#    Edit Appointment     nurse=${NURSE_NACT}[name]     physician=${PHY_ACT}[name]
#    ${message}      Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal     ${message}    The appointment has been successfully updated!
#    ${new_appt_details}     Get Appointment Details
#    # Compare old and new appt details
#    Run Keyword And Continue On Failure    Should Not Be Equal          ${new_appt_details}                      ${old_appt_details}
#    Run Keyword And Continue On Failure    Should Not Be Equal          ${new_appt_details}[Attendees]           ${old_appt_details}[Attendees]
#    Run Keyword And Continue On Failure    Should Be Equal              ${new_appt_details}[Name]                ${old_appt_details}[Name]
#    Run Keyword And Continue On Failure    Should Be Equal              ${new_appt_details}[Type]                ${old_appt_details}[Type]
#    Run Keyword And Continue On Failure    Should Be Equal              ${new_appt_details}[Reason for visit]    ${old_appt_details}[Reason for visit]
#    Run Keyword And Continue On Failure    Should Be Equal              ${new_appt_details}[Medication]          ${old_appt_details}[Medication]
#    # Verify new appt on schedule
#    Navigate To Calendar
#    Filter Scheduled Appointments       date=${fdate}      by_calendar=Clinic calendar     by_type=In-person       text_search=${patient_name}
#    ${new_sched_appt}       Get Scheduled Appointment Items On    booking_time=${time} - ${time_to}, In-person      Patient=${patient_name}, Care plan: ${new_patients}[0][Care plan ID]
#    Run Keyword And Continue On Failure    Should Not Be Equal    ${new_sched_appt}                          ${old_sched_appt}
#    Run Keyword And Continue On Failure    Should Not Be Equal    ${new_sched_appt}[Attendees]               ${old_sched_appt}[Attendees]
#    Run Keyword And Continue On Failure    Should Be Equal        ${new_sched_appt}[Booking time]            ${old_sched_appt}[Booking time]            # Booking time
#    Run Keyword And Continue On Failure    Should Contain         ${new_sched_appt}[Attendees]               ${NURSE_NACT}[name]                        # New Nurse
#    Run Keyword And Continue On Failure    Should Contain         ${new_sched_appt}[Attendees]               ${PHY_ACT}[name]                           # New Physician
#    Run Keyword And Continue On Failure    Should Be Equal        ${new_sched_appt}[Reason for visit]        ${old_sched_appt}[Reason for visit]        # Reason
#    Run Keyword And Continue On Failure    Should Be Equal        ${new_sched_appt}[Clinic]                  ${old_sched_appt}[Clinic]                  # Clinic

BCP-PHY-CAL-10: Finish a virtual appointment
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to Calendar - Scheduled appointments tab
    ...   - Select on a specific appointments row
    ...   - On appointment details page, click Finish appointment button
    ...   Expected Result:
    ...   - An appointment status will be displayed as "Done"
    ...   - An appointment will be fisnished successfully
    [Tags]    BCP-PHY-CAL-10    manual     inactive
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-CAL-11: Mark an In-person appointment as Done
    [Documentation]   Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to Calendar - Scheduled appointments tab
    ...   - Select on a specific appointment row
    ...   - On appointment details page, click Mark as done button
    ...   Expected Result:
    ...   - An appointment status will be displayed as "Done"
    ...   - An appointment will be fisnished successfully
    [Tags]  BCP-PHY-CAL-11   inactive    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
    # Create appt
#    Navigate To Calendar
#    Filter Scheduled Appointments
#    Open New Appointment
#    ${medications}      Create Dictionary    medication=Midazolam 100 mg /7mL Injectable Solution [Busulfex]       quantity=90      unit=patch(es)      frequency=1 time / day      time_to_take=11:00 PM       notes=Add medication
#    ${date}             Get Current Date    result_format=%m/%d/%Y
#    ${time}    Get Current Date    result_format=%I:%M %p    increment=+2 minute
#    ${time_to}          Get Current Date    result_format=%I:%M %p    increment=+17 minute
#    Create New Appointment     clinic=${FACILITIES}[0]      patient=Chronic patients     patient_name=${PATIENTS}[17]    appt_type=In-person     date=${date}      time=${time}     duration=15     reasons=Eyelid swelling, Headache
#    ...  nurse=${NURSE_ACT}[name]     physician=${CURR_USER}[name]     medications=${medications}     note=Test create new appointment
#    ${message}      Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${message}     The appointment is successfully created!
#    # Sche
#    ${fdate}            Get Current Date    result_format=%A, %B %d, %Y     # reformat date to filter
#    Navigate To Calendar
#    Filter Scheduled Appointments    date=${fdate}    by_calendar=My calendar     by_type=In-person       text_search=${PATIENTS}[17]
#    View Appointment Details     booking_time=${time} - ${time_to}, In-person     patient=${PATIENTS}[17], Care plan: 01492
#    ${appt_details}     Get Appointment Details
#    Run Keyword And Continue On Failure    Should Be Empty    ${appt_details}[Final status]
#    # Done
#    Mark As Done Appointment
#    ${appt_details}     Get Appointment Details
#    Run Keyword And Continue On Failure    Should Be Equal    ${appt_details}[Final status]     Done

BCP-PHY-CAL-12: Mark an In-person appointment as Overdue
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to Calendar - Scheduled appointments tab
    ...   - Select on a specific appointment row
    ...   - On appointment details page, click Mark as Overdue button
    ...   Expected result:
    ...   - An appointment status will be displayed as "Overdue"
    [Tags]    BCP-PHY-CAL-12    inactive    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
    # Create appt
#    Navigate To Calendar
#    Filter Scheduled Appointments
#    Open New Appointment
#    ${medications}      Create Dictionary    medication=Midazolam 100 mg /7mL Injectable Solution [Busulfex]       quantity=90      unit=patch(es)      frequency=1 time / day      time_to_take=11:00 PM       notes=Add medication
#    ${date}             Get Current Date    result_format=%m/%d/%Y
#    ${time}             Get Current Date    result_format=%I:%M %p    increment=+2 minute
#    ${time_to}          Get Current Date    result_format=%I:%M %p    increment=+17 minute
#    Create New Appointment     clinic=${FACILITIES}[0]      patient=Chronic patients     patient_name=${PATIENTS}[19]    appt_type=In-person     date=${date}      time=${time}     duration=15     reasons=Eyelid swelling, Headache
#    ...  nurse=${NURSE_ACT}[name]     physician=${CURR_USER}[name]     medications=${medications}     note=Test create new appointment
#    ${message}      Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${message}     The appointment is successfully created!
#    # Sche
#    ${fdate}            Get Current Date    result_format=%A, %B %d, %Y     # reformat date to filter
#    Navigate To Calendar
#    Filter Scheduled Appointments    date=${fdate}    by_calendar=My calendar     by_type=In-person       text_search=${PATIENTS}[19]
#    View Appointment Details     booking_time=${time} - ${time_to}, In-person     patient=${PATIENTS}[19], Care plan: 01494
#    ${appt_details}     Get Appointment Details
#    Run Keyword And Continue On Failure    Should Be Empty    ${appt_details}[Final status]
#    # Overdue
#    Mark As Overdue Appointment
#    ${appt_details}     Get Appointment Details
#    Run Keyword And Continue On Failure    Should Be Equal    ${appt_details}[Final status]     Overdue

BCP-PHY-CAL-13: Cancel One-Off Appointment
     [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Go to Calendar - Scheduled appointments tab
    ...  - Select on a specific appointments row
    ...  - Select on Cancel appointment
    ...  - Click Yes
    ...  Expected Output:
    ...  - An appointment shall be deleted successfully with a toast displayed
    [Tags]    BCP-PHY-CAL-13      inactive    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
    # Create appt
#    Navigate To Calendar
#    Filter Scheduled Appointments
#    Open New Appointment
#    ${medications}      Create Dictionary   medication=Midazolam 100 mg /7mL Injectable Solution [Busulfex]       quantity=90      unit=patch(es)      frequency=1 time / day      time_to_take=11:00 PM       notes=Add medication
#    ${date}             Get Current Date    result_format=%m/%d/%Y
#    ${time}             Get Current Date    result_format=%I:%M %p    increment=+2 minute
#    ${time_to}          Get Current Date    result_format=%I:%M %p    increment=+17 minute
#    Create New Appointment     clinic=${FACILITIES}[0]      patient=Chronic patients     patient_name=${PATIENTS}[18]    appt_type=In-person     date=${date}      time=${time}     duration=15     reasons=Eyelid swelling, Headache
#    ...  nurse=${NURSE_ACT}[name]     physician=${CURR_USER}[name]     medications=${medications}     note=Test create new appointment
#    ${message}      Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${message}     The appointment is successfully created!
#    # Sche
#    ${fdate}            Get Current Date    result_format=%A, %B %d, %Y     # reformat date to filter
#    Navigate To Calendar
#    Filter Scheduled Appointments    date=${fdate}    by_calendar=My calendar     by_type=In-person       text_search=${PATIENTS}[18]
#    View Appointment Details     booking_time=${time} - ${time_to}, In-person     patient=${PATIENTS}[18], Care plan: 01493
#    ${before_appt}      Get Appointment Details
#    # Cancel
#    Cancel Appointment
#    ${message}      Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${message}     The appointment is successfully canceled!
#    ${after_appt}       Get Appointment Details
#    Run Keyword And Continue On Failure    Should Not Be Equal    ${after_appt}[Final status]       ${before_appt}[Final status]
#    Run Keyword And Continue On Failure    Should Be Equal    ${after_appt}[Final status]       Canceled

BCP-PHY-CAL-14: Filter Scheduled appointments
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to Calendar - Scheduled appointments
    ...   - Select a date from the date-picker
    ...   - Filter Calendar by My calendar/ Clinic calendar
    ...   - Filter appointment type by All types/ Virtual/ In-person
    ...   - Search appointment by Patient name
    ...   - Click on a specific appointment from the list
    ...   Expected Result:
    ...   - The list of appointments which user searchs for will be displayed
    ...   - User shall be able to view the appointment details by clicking on it.
    [Tags]    BCP-PHY-CAL-14    inactive    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    [Template]    Filter Scheduled Appt
#    My calendar         All types      today
##    My calendar         Virtual        today
#    Clinic calendar     All types      today
##    Clinic calendar     In-person      today

BCP-PHY-CAL-15: Go To Patient Details By Clicking Patient Name Hyperlink From Scheduled Appointments
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1. Go to Calendar - Scheduled appointments tab
    ...   2. Click the Patient name hyperlink from a specific Scheduled appointments row
    ...   3. On the Care plan side tab, click Go to patient details button
    ...   Expected Results:
    ...   At step 2, a side tab bar of Care plan information shall be displayed
    ...   At step 3, user shall be navigated to the Patient details page.
    [Tags]    BCP-PHY-CAL-15    inactive    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
    # Need to prepare data before test
#    Navigate To Calendar
#    Filter Scheduled Appointments    date=today     by_type=All types       by_calendar=Clinic calendar
#    ${sche_patient}     Get Scheduled Appointment Items
#    ${patient}          Set Variable    ${sche_patient}[0][Patient]
#    ${care_plan}        Set Variable    ${patient.replace('Care plan: ', '').split(',')}[1]
#    View Scheduled Appointment Summary On    patient=${patient}
#    ${appt_summary}     Get Appointment Summary     is_close=False
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${appt_summary}
#    Run Keyword And Continue On Failure    Should Contain    ${appt_summary}[Top info]              ${patient.split(', ')}[0]            # Patient name
#    Run Keyword And Continue On Failure    Should Contain    ${appt_summary}[Top info]              Care plan ID: ${care_plan.strip()}   # Care plan ID
#    Run Keyword And Continue On Failure    Should Contain    ${appt_summary}[Registered clinic]     ${sche_patient}[0][Clinic]           # Facility
#    Go To Patient Details
#    ${page_header}      Get Page Header
#    Run Keyword And Continue On Failure    Should Contain       ${page_header}    ${patient.split(', ')}[0]  # page header - patient name

BCP-PHY-CAL-16: Schedule recurring appointment(s) from Calendar tab
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
    [Tags]    BCP-PHY-CAL-16    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-CAL-17: Schedule recurring appointment(s) from New/Active patients list
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
    [Tags]    BCP-PHY-CAL-17    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-CAL-18: Schedule recurring appointment(s) from patient details page
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
    [Tags]    BCP-PHY-CAL-18    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-CAL-19: Cancel a current appointment on appointment info side tab
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
    [Tags]    BCP-PHY-CAL-19    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-CAL-20: Cancel a current appointment on appointment details screen
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
    [Tags]    BCP-PHY-CAL-20    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-CAL-21: Cancel current and all following appointments on appointment info side tab
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
    [Tags]    BCP-PHY-CAL-21    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-CAL-22: Cancel current and all following appointments on appointment info side tab
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
    [Tags]    BCP-PHY-CAL-22    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-CAL-23: Cancel all appointments in the series from the appointment info side tab
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
    [Tags]    BCP-PHY-CAL-23    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-CAL-24: Cancel all appointments in the series from the appointment details screen
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
    [Tags]    BCP-PHY-CAL-24    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-CAL-25: List view mode - Filter scheduled appointments list
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
    [Tags]    BCP-PHY-CAL-25         manual       [BCP-2.15]
    Manual Should Be Passed         ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-PHY-CAL-26: Day view mode - Filter scheduled appointments list
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
    [Tags]    BCP-PHY-CAL-26        manual       [BCP-2.15]
    Manual Should Be Passed         ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-PHY-CAL-27: Schedule new appointment for the non-CCM patients through Calendar page
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
    [Tags]    BCP-PHY-CAL-27         manual       [BCP-2.15]
    Manual Should Be Passed         ${TEST NAME}        ${TEST DOCUMENTATION}

*** Keywords ***
#Suite Setup
    ${BROWSER_NODE}      Start Browser
    Import Library       project_cardiac_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${NURSES}            Get Config Param    USER > nurse
    ${TOKEN}             Sign In Cardiac     username=${NURSES}[0][username]     password=${NURSES}[0][password]
    ${VERSION}           Get Release Version
    Set Suite Metadata   version    ${VERSION}
    Set Suite Metadata   browser    ${BROWSER.capitalize()}

#Suite Teardown
    Quit Browser

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
    ...  Run Keyword And Continue On Failure    Should Be True    all('${CURR_USER}[name] (You)' in p['Attendees'].split(', ')[1] for p in ${sche_patients})
    View Appointment Details    row=1
    ${header}      Get Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}      Appointment details
    ${appt_details}     Get Appointment Details
    Run Keyword And Continue On Failure    Should Be Equal    ${appt_details}[Name]     ${text}
