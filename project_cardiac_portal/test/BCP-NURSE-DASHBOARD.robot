*** Settings ***
Documentation   Cardiac Dashboard page test suite
Metadata    sid     BCP-NURSE-DASHBOARD
Metadata    owner   Khang Nguyen
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/Dashboard.py
#Library     project_cardiac_portal/lib/web/Appointment.py
#Library     project_cardiac_portal/lib/web/PatientDetails.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-NURSE-DASHBOARD     web
Test Timeout    1h

*** Test Cases ***
BCP-NURSE-DASHBOARD-01: New patients card - Accessing the CCM plan type from Dashboard page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Dashboard page
    ...   2.Click on the CCM row on the New patients card at the top of the page
    ...   Expected results:
    ...   Clicks on the row will open the New patient list – Registered tab
    ...   The list will be sorted by 'my patients' filter, 'unread' status, 'CCM' plan type, and date in descending order.
    [Tags]   BCP-NURSE-DASHBOARD-01     manual      [BCP-2.15]
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-DASHBOARD-02: New patients card - Accessing the RPM plan type from Dashboard page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Dashboard page
    ...   2.Click on the RPM row on the New patients card at the top of the page
    ...   Expected results:
    ...   Clicks on the row will open the New patient list – Registered tab
    ...   The list will be sorted by 'my patients' filter, 'unread' status, 'RPM' plan type, and date in descending order.
    [Tags]   BCP-NURSE-DASHBOARD-02     manual      [BCP-2.15]
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-DASHBOARD-03: New patients card - Accessing the CCM&RPM plan type from Dashboard page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Dashboard page
    ...   2.Click on the CCM&RPM row on the New patients card at the top of the page
    ...   Expected results:
    ...   Clicks on the row will open the New patient list – Registered tab
    ...   The list will be sorted by 'my patients' filter, 'unread' status, 'CCM&RPM' plan type, and date in descending order.
    [Tags]   BCP-NURSE-DASHBOARD-03     manual      [BCP-2.15]
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-DASHBOARD-04: Bioheart reports card - Accessing the CCM plan type from Dashboard page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Dashboard page
    ...   2.Click on the CCM row on the Bioheart reports card at the top of the page
    ...   Expected results:
    ...   Clicks on this row will open the Bioheart reports page
    ...   The list will be sorted by my patients filter, CCM plan type, unreviewed status and date in descending order.
    [Tags]   BCP-NURSE-DASHBOARD-04     manual      [BCP-2.15]
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-DASHBOARD-05: Bioheart reports card - Accessing the RPM plan type from Dashboard page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Dashboard page
    ...   2.Click on the RPM row on the Bioheart reports card at the top of the page
    ...   Expected results:
    ...   Clicks on this row will open the Bioheart reports page
    ...   The list will be sorted by my patients filter, RPM plan type, unreviewed status and date in descending order.
    [Tags]   BCP-NURSE-DASHBOARD-05     manual      [BCP-2.15]
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-DASHBOARD-06: Bioheart reports card - Accessing the CCM&RPM plan type from Dashboard page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Dashboard page
    ...   2.Click on the CCM&RPM row on the Bioheart reports card at the top of the page
    ...   Expected results:
    ...   Clicks on this row will open the Bioheart reports page
    ...   The list will be sorted by my patients filter, CCM&RPM plan type, unreviewed status and date in descending order.
    [Tags]   BCP-NURSE-DASHBOARD-06     manual      [BCP-2.15]
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-DASHBOARD-07: Heart monitor notifications card - Accessing the CCM plan type from Dashboard page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Dashboard page
    ...   2.Click on the CCM row on the Heart monitor notifications card at the top of the page
    ...   Expected results:
    ...   Clicks on this row will open the HM notification page
    ...   The list will be sorted by my patients filter, unreviewed status and date in descending order.
    [Tags]   BCP-NURSE-DASHBOARD-07     manual      [BCP-2.15]
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-DASHBOARD-08: Heart monitor notifications card - Accessing the CCM&RPM plan type from Dashboard page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Dashboard page
    ...   2.Click on the CCM&RPM row on the Heart monitor notifications card at the top of the page
    ...   Expected results:
    ...   Clicks on this row will open the HM notification page
    ...   The list will be sorted by my patients filter, unreviewed status and date in descending order.
    [Tags]   BCP-NURSE-DASHBOARD-08     manual      [BCP-2.15]
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-DASHBOARD-09: Monthly reports card - Accessing the CCM plan type from Dashboard page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Dashboard page
    ...   2.Click on the CCM row on the Monthly reports card at the top of the page
    ...   Expected results:
    ...   Clicks on this row will open the Monthly reports page
    ...   The list will be sorted by my patients filter, CCM plan type, unreviewed status and date in descending order.
    [Tags]   BCP-NURSE-DASHBOARD-09     manual      [BCP-2.15]
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-DASHBOARD-10 : Monthly reports card - Accessing the RPM plan type from Dashboard page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Dashboard page
    ...   2.Click on the RPM row on the Monthly reports card at the top of the page
    ...   Expected results:
    ...   Clicks on this row will open the Monthly reports page
    ...   The list will be sorted by my patients filter, RPM plan type, unreviewed status and date in descending order.
    [Tags]   BCP-NURSE-DASHBOARD-10     manual      [BCP-2.15]
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-DASHBOARD-11: Monthly reports card - Accessing the CCM&RPM plan type from Dashboard page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Dashboard page
    ...   2.Click on the CCM&RPM row on the Monthly reports card at the top of the page
    ...   Expected results:
    ...   Clicks on this row will open the Monthly reports page
    ...   The list will be sorted by my patients filter, CCM&RPM plan type, unreviewed status and date in descending order.
    [Tags]   BCP-NURSE-DASHBOARD-11     manual      [BCP-2.15]
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-DASHBOARD-12: Billable patients - Accessing the CCM plan type from Dashboard page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Dashboard page from the main navigation
    ...   2.Click on the CCM row on the Billable patients at the top of the page
    ...   Expected results:
    ...   Clicks on the record will navigate the user to In progress tab in the Billing section sorted in descending order by date (shows latest to oldest)
    ...   Filter by “My patients” option in the Patient filter
    ...   Filter by “CCM” option in the Plan type filter
    ...   Filter by “Not created” option in Process status filter
    ...   Filter by “Billable” option in the Billing status filter (duration = 20+ minutes).
    [Tags]    BCP-NURSE-DASHBOARD-12     manual     [BCP-2.15]
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-DASHBOARD-13: Billable patients - Accessing the RPM plan type from Dashboard page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Dashboard page from the main navigation
    ...   2.Click on the RPM row on the Billable patients at the top of the page
    ...   Expected results:
    ...   Clicks on the record will navigate the user to In progress tab in the Billing section sorted in descending order by date (shows latest to oldest)
    ...   Filter by “My patients” option in the Patient filter
    ...   Filter by “RPM” option in the Plan type filter
    ...   Filter by “Not created” option in Process status filter
    ...   Filter by “Billable” option in the Billing status filter (duration = 20+ minutes+ or transmission days = 16+ or both conditions).
    [Tags]    BCP-NURSE-DASHBOARD-13     manual     [BCP-2.15]
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-DASHBOARD-14: Billable patients - Accessing the CCM&RPM plan type from Dashboard page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Dashboard page from the main navigation
    ...   2.Click on the CCM&RPM row on the Billable patients at the top of the page
    ...   Expected results:
    ...   Clicks on the record will navigate the user to In progress tab in the Billing section sorted in descending order by date (shows latest to oldest)
    ...   Filter by “My patients” option in the Patient filter
    ...   Filter by “CCM&RPM” option in the Plan type filter
    ...   Filter by “Not created” option in Process status filter
    ...   Filter by “Billable” option in the Billing status filter (duration = 20+ minutes+ or transmission days = 16+ or both conditions).
    [Tags]    BCP-NURSE-DASHBOARD-14     manual     [BCP-2.15]
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-DASHBOARD-15: Go to the Calendar page from Dashboard page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Dashboard page
    ...   2.When there is no upcoming events displayed, click Go to calendar button
    ...   Expected results:
    ...   The user shall be navigated to Calendar page in Day view.
    [Tags]   BCP-NURSE-DASHBOARD-15     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-DASHBOARD-16: Go to an Appointment details page from Dashboard page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Dashboard page
    ...   2.Click on a specific appointment row on an Upcoming events section
    ...   Expected results:
    ...   The user shall be navigated to the Appointment details page
    [Tags]   BCP-NURSE-DASHBOARD-16     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-DASHBOARD-17: Go to the specific Calendar month on patient details page from Dashboard page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Dashboard page
    ...   2.Click on a specific item on the Billable patients section
    ...   Expected results:
    ...   The user shall be navigated to the specific Calendar month on a patient details page.
    [Tags]   BCP-NURSE-DASHBOARD-17     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-DASHBOARD-18: Go to the Notification reports details from Dashboard page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Dashboard page
    ...   2.Click on a specific item on the Notification reports section
    ...   Expected results:
    ...   The user shall be navigated to the Notification details page.
    [Tags]   BCP-NURSE-DASHBOARD-18     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-DASHBOARD-19: Go to the Active patient care plan from Dashboard page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Dashboard page
    ...   2.Click on a specific item on the New active patients section
    ...   Expected results:
    ...   The user shall be navigated to the Patient care plan details page.
    [Tags]   BCP-NURSE-DASHBOARD-19     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-DASHBOARD-20: Go To The Patient Details Page By Clicking Patient Name Hyperlink From Upcoming Events
    [Documentation]     Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Click on Dashboard tab from the main navigation
    ...   2.On Upcoming events section, click on Patient name hyperlink
    ...   3.On the Care plan info side tab, click Go to patient details button
    ...   Expected Result:
    ...   At step 2, the Care plan info side tab will be displayed with the Care plan's patient info and Appointments info
    ...   At step 3, user shall be navigated to the Patient details page
    [Tags]   BCP-NURSE-DASHBOARD-20     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    # Need init data before test
#    Navigate To Dashboard
#    ${events}       Get Dashboard Upcoming Events
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${events}     No upcoming events found
#    View Upcoming Appointment Summary On    patient_name=${events}[0][Patient name]     care_plan_id=${events}[0][Care plan ID]
#    ${appt_summary}     Get Appointment Summary    is_close=False
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${appt_summary}
#    Run Keyword And Continue On Failure    Should Contain          ${appt_summary}[Top info]      ${events}[0][Patient name]           # Patient name
#    Run Keyword And Continue On Failure    Should Contain          ${appt_summary}[Top info]      Care plan ID: ${events}[0][Care plan ID]           # Care plan ID
#    Go To Patient Details
#    ${page_header}      Get Page Header
#    Run Keyword And Continue On Failure    Should Contain    ${page_header}     ${events}[0][Patient name]

BCP-NURSE-DASHBOARD-21: Go To The Patient Details Page By Clicking Patient Name Hyperlink From Billable Patients
    [Documentation]     Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Click on Dashboard tab from the main navigation
    ...   2.On Billable patients section, click on Patient name hyperlink
    ...   3.On the Care plan info side tab, click Go to patient details button
    ...   Expected Result:
    ...   At step 2, the Care plan info side tab will be displayed with the Care plan's patient info and Appointments info
    ...   At step 3, user shall be navigated to the Patient details page
    [Tags]   BCP-NURSE-DASHBOARD-21     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    # Need init data before test
#    Navigate To Dashboard
#    ${patients}     Get Dashboard Billable Patients
#    ${patient_name}     Set Variable    ${patients}[0][Patient name]
#    View Billable Patients Appointment Summary On    patient_name=${patient_name}       date_of_service=${patients}[0][Date of service]     duration=${patients}[0][Duration]
#    ${appt_summary}     Get Appointment Summary    is_close=False
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${appt_summary}
#    Run Keyword And Continue On Failure    Should Contain          ${appt_summary}[Top info]      ${patient_name}                        # Patient name
#    Go To Patient Details
#    ${page_header}      Get Page Header
#    Run Keyword And Continue On Failure    Should Contain    ${page_header}     ${patient_name}

BCP-NURSE-DASHBOARD-22: Go To The Patient Details Page By Clicking Patient Name Hyperlink From Notification Reports
    [Documentation]     Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Click on Dashboard tab from the main navigation
    ...   2.On Notification reports section, click on Patient name hyperlink
    ...   3.On the Care plan info side tab, click Go to patient details button
    ...   Expected Result:
    ...   At step 2, the Care plan info side tab will be displayed with the Care plan's patient info and Appointments info
    ...   At step 3, user shall be navigated to the Patient details page
    [Tags]   BCP-NURSE-DASHBOARD-22     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    # Need init data before test
#    Navigate To Dashboard
#    ${reports}          Get Dashboard Notification Reports
#    ${patient_name}     Set Variable     ${reports}[0][Patient name]
#    View Notification Reports Appointment Summary On    row=1
#    ${appt_summary}     Get Appointment Summary    is_close=False
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${appt_summary}
#    Run Keyword And Continue On Failure    Should Contain          ${appt_summary}[Top info]      ${patient_name}                        # Patient name
#    Run Keyword And Continue On Failure    Should Contain          ${appt_summary}[Top info]      Care plan ID: ${reports}[0][Care plan ID]            # Care plan ID
#    Go To Patient Details
#    ${page_header}      Get Page Header
#    Run Keyword And Continue On Failure    Should Contain    ${page_header}     ${patient_name}

BCP-NURSE-DASHBOARD-23: Go To The Patient Details Page By Clicking Patient Name Hyperlink From New Active Patients
    [Documentation]     Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1. Click on Dashboard tab from the main navigation
    ...   2. On New assigned patients section, click on Patient name hyperlink
    ...   3. On the Care plan info side tab, click Go to patient details button
    ...   Expected Result:
    ...   At step 2, the Care plan info side tab will be displayed with the Care plan's patient info and Appointments info
    ...   At step 3, user shall be navigated to the Patient details page
    [Tags]   BCP-NURSE-DASHBOARD-23     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Dashboard
#    ${act_patients}     Get Dashboard New Active Patients
#    ${patient_name}     Set Variable    ${act_patients}[0][Patient name]
#    View New Active Patients Appointment Details On    patient_name=${patient_name}     care_plan_id=${act_patients}[0][Care plan ID]
#    ${appt_summary}     Get Appointment Summary    is_close=False
#    Run Keyword And Continue On Failure    Should Not Be Empty     ${appt_summary}
#    Run Keyword And Continue On Failure    Should Contain          ${appt_summary}[Top info]      ${patient_name}                        # Patient name
#    Run Keyword And Continue On Failure    Should Contain          ${appt_summary}[Top info]      Care plan ID: ${act_patients}[0][Care plan ID]       # Care plan ID
#    Go To Patient Details
#    ${page_header}      Get Page Header
#    Run Keyword And Continue On Failure    Should Contain    ${page_header}     ${patient_name}

BCP-NURSE-DASHBOARD-24: Dashboard - Add new patient by manual input consecutively
    [Documentation]     Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1. Go to the Dashboard page from the main navigation
    ...   2. Click Add new patient button on the right side of the page
    ...   3. On the Patient information screen, select Facility
    ...   4. Input Personal details, such as (first name/last name/dob/gender/height/weight)
    ...   5. Input Address details, such as (country/state/address/city/zip code)
    ...   6. Input Contact details, such as (email/mobile number/emergency contact phone/home phone)
    ...   7. Input preferred contact method, such as (email/sms/both)
    ...   8. Input Insurance: payment type such as (cash/credit card paying/insurance)
    ...   9. Input Healthcare program details, such as (plan type/register clinic/nurse/physician/general cardiac template)
    ...   10. Select Save & add another patient button
    ...   Expected results:
    ...   The Save & add another patient button shall be enabled if all the required fields are filled out
    ...   The patient info shall be displayed on the New-registered patients tab
    ...   All the fields on the Add new patient page shall be cleared out for the next input.
    [Tags]   BCP-NURSE-DASHBOARD-24     manual      [BCP-2.15]
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-DASHBOARD-25: Dashboard - Add new patient by manual input
    [Documentation]     Author: Hoang Le
    ...
    ...   Test steps:
    ...   1. Go to the Dashboard page from the main navigation
    ...   2. Click Add new patient button on the right side of the page
    ...   3. On the Patient information screen, select Facility
    ...   4. Input Personal details, such as (first name/last name/dob/gender/height/weight)
    ...   5. Input Address details, such as (country/state/address/city/zip code)
    ...   6. Input Contact details, such as (email/mobile number/emergency contact phone/home phone)
    ...   7. Input preferred contact method, such as (email/sms/both)
    ...   8. Input Insurance: payment type such as (cash/credit card paying/insurance)
    ...   9. Input Healthcare program details, such as (plan type/nurse/physician/general cardiac template)
    ...   10. Select Add patient button
    ...   Expected results:
    ...   The Add patient button shall be enabled if all the required fields are filled out
    ...   User shall be navigated to the New patients page where patient info shall be displayed.
    [Tags]    BCP-NURSE-DASHBOARD-25       manual       [BCP-2.15]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-DASHBOARD-26: Add new patient with imported data - Searching for patient info by first & last name
    [Documentation]     Author: Hoang Le
    ...
    ...   Test steps:
    ...   1. Go to Add new patient page
    ...   2. Input patient first name
    ...   3. Input patient last name
    ...   4. On the search result, click Add button on the info row which one user wants to add
    ...   Expected results:
    ...   The patient info shall be filled out to the below fields
    ...   Save & add another patient shall be enabled
    ...   Add patient button is enabled.
    [Tags]    BCP-NURSE-DASHBOARD-26          manual        [BCP-2.15]
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-DASHBOARD-27: Add new patient with imported data - Searching for patient info by first/last name and dob
    [Documentation]     Author: Hoang Le
    ...
    ...   Test steps:
    ...   1. Go to Add new patient page
    ...   2. Input first name
    ...   3. Input last name
    ...   4. Input patient dob
    ...   5. On the search result, click Add button on the info row which one user wants to add
    ...   Expected results:
    ...   The patient info shall be filled out to the below fields
    ...   Save & add another patient shall be enabled
    ...   Add patient button is enabled.
    [Tags]    BCP-NURSE-DASHBOARD-27          manual        [BCP-2.15]
    Manual Should Be Passed        ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-DASHBOARD-28: Add new patient with missing info of imported data
    [Documentation]     Author: Hoang Le
    ...
    ...   Test steps:
    ...   1. Go to Add new patient page
    ...   2. Input patient first name
    ...   3. Input patient last name
    ...   4. On the result table, select the one which is lacked of info
    ...   5. Click Add button
    ...   6. Select Add patient button
    ...   Expected results:
    ...   The Save & add another patient button shall be enabled
    ...   The Add patient button shall be enabled
    ...   The care plan shall be displayed on the New patients page with the missing info and the user can input it later
    ...   The missing tag shall be displayed on the patient details if the care plan is started.
    [Tags]    BCP-NURSE-DASHBOARD-28           manual       [BCP-2.15]
    Manual Should Be Passed       ${TEST NAME}       ${TEST DOCUMENTATION}

BCP-NURSE-DASHBOARD-29: Undo the patient imported info on Add new patient page
    [Documentation]     Author: Hoang Le
    ...
    ...   Test steps:
    ...   1. Go to Add new patient page
    ...   2. Input patient first name
    ...   3. Input patient last name
    ...   4. Input dob (optional)
    ...   5. On the results table, click Add button on a specific patient row
    ...   6. After the patient info is added on the page, click Undo button
    ...   Expected results:
    ...   The patient’s input shall be remained unchanged
    ...   The Add button shall be displayed again on patient info row after clicking Undo button
    ...   All the left info shall be cleared out from the other fields.
    [Tags]    BCP-NURSE-DASHBOARD-29            manual      [BCP-2.15]
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-DASHBOARD-30: Search for patient not included in the imported data list
    [Documentation]     Author: Hoang Le
    ...
    ...   Test steps:
    ...   1. Go to Add new patient page
    ...   2. Input patient first name which is not existed in the imported list
    ...   3. Input patient last name which is not existed in the imported list
    ...   4. Observe the search result table
    ...   Expected results:
    ...   The result table shall not be displayed
    ...   User has to input the data manually.
    [Tags]    BCP-NURSE-DASHBOARD-30             manual     [BCP-2.15]
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-DASHBOARD-31: User works for a clinic which has the imported data
    [Documentation]     Author: Hoang Le
    ...
    ...   Test steps:
    ...   1. Go to Add new patient page
    ...   2. Input first name & last name
    ...   3. Input the dob (optional)
    ...   4. Observe the results list
    ...   Expected results:
    ...   The search results shall be displayed on the table below first name & last name fields
    ...   The user selects the Add button of which patient row that they want to.
    [Tags]    BCP-NURSE-DASHBOARD-31             manual     [BCP-2.15]
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-DASHBOARD-32: User belongs to many clinics (include Athena)
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1. Go to Add new patient page
    ...   2. Input first name & last name
    ...   3. Input the dob (optional)
    ...   4. Observe the results list
    ...   Expected results:
    ...   The search results shall be displayed on the table below first name & last name fields
    ...   The user selects the Add button of which patient row that they want to.
    [Tags]    BCP-NURSE-DASHBOARD-32             manual     [BCP-2.15]
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-DASHBOARD-33: User works for clinic(s) (not include Athena)
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1. Go to Add new patient page
    ...   2. Input first name & last name
    ...   3. Input the dob (optional)
    ...   4. Observe the results list
    ...   Expected results:
    ...   The result table shall not be displayed
    ...   User has to input the data manually.
    [Tags]    BCP-NURSE-DASHBOARD-33             manual     [BCP-2.15]
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-DASHBOARD-34: Changing the facility option after selecting patient info from the imported list
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1. Go to Add new patient page
    ...   2. Input first name & last name
    ...   3. Input the dob (optional)
    ...   4. Click Add button on a specific patient info row
    ...   5. After the info is filled out, re-select another facility
    ...   Expected results:
    ...   The filled data shall be remained unchanged.
    [Tags]    BCP-NURSE-DASHBOARD-34             manual     [BCP-2.15]
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-DASHBOARD-35: Schedule new appointment for CCM/RPM patients through Dashboard page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Dashboard page from the main navigation
    ...   2.Click Schedule new appointment button at the top on the left page
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
    [Tags]    BCP-NURSE-DASHBOARD-35      manual        [BCP-2.15]
    Manual Should Be Passed         ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-DASHBOARD-36: Schedule new appointment for the non-CCM patients through Dashboard page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the Dashboard page from the main navigation
    ...   2.Click Schedule new appointment button at the top on the left page
    ...   3.On the Schedule appointment screen, select Patient type as Other patients
    ...   4.Search for patient name or email on the search field
    ...   5.Select a patient from the results list
    ...   6.Input Appointment info
    ...   7.Select Attendees
    ...   8.Add note - if needed
    ...   9.Click Create button
    ...   Expected results:
    ...   At step 4, the list of patient info shall be displayed with the ‘No plan’ tag
    ...   At step 5, the patient info shall be auto-filled and displayed
    ...   On the Review patient’s appointment screen, the Patient type tag  ‘No plan’  shall be displayed next to the Patient name
    ...   At step 9, an appointment shall be created successfully and the user shall be navigated to the Calendar page of which date the appointment is created.
    [Tags]    BCP-NURSE-DASHBOARD-36      manual        [BCP-2.15]
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
