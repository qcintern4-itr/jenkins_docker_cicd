*** Settings ***
Documentation   Cardiac Patients - New page test suite
Metadata    sid     BCP-NURSE-PTNEW
Metadata    owner   Khang Nguyen
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
Library     project_cardiac_portal/lib/web/Common.py
Library     project_cardiac_portal/lib/web/PatientsNew.py
Library     project_cardiac_portal/lib/web/Templates.py
Library     project_cardiac_portal/lib/web/PatientDetails.py
Library     project_cardiac_portal/lib/web/Appointment.py
Library     project_cardiac_portal/lib/web/PatientsActive.py
Library     project_cardiac_portal/lib/web/PatientsInactive.py

Suite Setup     Suite Setup
Suite Teardown  Suite Teardown
Force Tags      BCP-NURSE-PTNEW     web
Test Timeout    1h

*** Test Cases ***
BCP-NURSE-PTNEW-01: Create New Template
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Click on Create new template button at the top of the manage templates screen
    ...  - Select one or more facilities from the list
    ...  - Click on Create template from the pop-up
    ...  - Fill out all the required fields with valid value
    ...  - Click Create button
    ...  Expected Output:
    ...  - A new template will be saved and displayed on the General cardiac templates list
    [Tags]    BCP-NURSE-PTNEW-01     manual       inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    Navigate To Patients New
#    Open Management Templates
#    Open New Template     facilities=${FACILITIES}[0]
#    # Template name + number in title
#    ${title}    Set Variable    Test Template 01
#    ${medication}       Create Dictionary    medication_name=Zinc oxide 13.2% Lotion        quantity=100       unit=pill(s)     frequency=2 times / day    time_to_take=09:30 AM, 09:45 PM      note=Note       prescribed_date=today
#    Create New Template    template_title=${title}     current_symptoms=Dyspnea     past_medicals=Atrial Fibrillation        medications=${medication}
#    ${message}      Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${message}     	The template is created successfully!
#    Refresh Page
#    # Verify list of template
#    ${template_list}        Get Templates
#    Run Keyword And Continue On Failure    Should Contain    ${template_list}[${FACILITIES}[0]]       ${title}
#    # template path: Facilities > Template name
#    ${template_path}    Set Variable    ${FACILITIES}[0] > ${title}
#    View Template Details On    template_path=${template_path}
#    ${template_details}    Get Template Details
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${template_details}       Template `${title}` is null
#    Run Keyword And Continue On Failure    Should Be Equal     ${template_details}[Template title]                          ${title}
#    Run Keyword And Continue On Failure    Should Be Equal     ${template_details}[Current symptoms]                        Dyspnea
#    Run Keyword And Continue On Failure    Should Be Equal     ${template_details}[Past medical history]                    Atrial Fibrillation
#    Run Keyword And Continue On Failure    Should Be Equal     ${template_details}[Medication(s) currently being used]      Zinc oxide 13.2% Lotion

BCP-NURSE-PTNEW-02: Edit Template
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Click on Edit template button at the top of the manage templates screen
    ...  - Edit any of the template's info and click Save
    ...  Expected Output:
    ...  - New template information shall be saved and displayed
    [Tags]    BCP-NURSE-PTNEW-02        manual     inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    # Init data
#    Navigate To Patients New
#    Open Management Templates
#    Open New Template     facilities=${FACILITIES}[0]
#    # Template name + number in title
#    ${medication}       Create Dictionary    medication_name=Zinc oxide 13.2% Lotion        quantity=100       unit=pill(s)     frequency=2 times / day    time_to_take=09:30 AM, 09:45 PM      note=Note       prescribed_date=today
#    Create New Template    template_title=Test Template 02     current_symptoms=Dyspnea, Decreasing exercise capacity     past_medicals=Atrial Fibrillation, Heart rate - slow (bradycardia)        medications=${medication}
#    Refresh Page
#    # Verify list of template
#    ${template_list}        Get Templates
#    Run Keyword And Continue On Failure    Should Contain    ${template_list}[${FACILITIES}[0]]       Test Template 02
#    # template path: Facilities > Template name
#    ${template_path}    Set Variable    ${FACILITIES}[0] > Test Template 02
#    View Template Details On    template_path=${template_path}
#    ${template_details}    Get Template Details
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${template_details}
#    Run Keyword And Continue On Failure    Should Be Equal        ${template_details}[Template title]                          Test Template 02
#    Run Keyword And Continue On Failure    Should Be Equal        ${template_details}[Current symptoms]                        Decreasing exercise capacity, Dyspnea
#    Run Keyword And Continue On Failure    Should Be Equal        ${template_details}[Past medical history]                    Atrial Fibrillation, Heart rate - slow (bradycardia)
#    Run Keyword And Continue On Failure    Should Be Equal        ${template_details}[Medication(s) currently being used]      Zinc oxide 13.2% Lotion
#    # Edit
#    ${medication_to_edit}       Create Dictionary    medication_name=Ethanol 70% Topical Solution        quantity=30       unit=application(s)     frequency=2 times / day    time_to_take=09:30 AM, 09:45 PM      note=Note       prescribed_date=today
#    View Template Details On    ${template_path}
#    Edit Template       template_title=Test Edit Template 02     del_current_symptoms=Dyspnea      add_current_symptoms=${EMPTY}     del_past_medicals=all       add_past_medicals=Coronary artery disease (CAD)     del_medications=all
#    ...  add_medications=${medication_to_edit}
#    ${mesage}       Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal        ${mesage}    The template is updated successfully!
#    ${template_path}    Set Variable    ${FACILITIES}[0] > Test Edit Template 02
#    View Template Details On    template_path=${template_path}
#    ${template_details}    Get Template Details
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${template_details}
#    Run Keyword And Continue On Failure    Should Be Equal        ${template_details}[Template title]                          Test Edit Template 02
#    Run Keyword And Continue On Failure    Should Be Equal        ${template_details}[Current symptoms]                        Decreasing exercise capacity
#    Run Keyword And Continue On Failure    Should Be Equal        ${template_details}[Past medical history]                    Coronary artery disease (CAD)
#    Run Keyword And Continue On Failure    Should Be Equal        ${template_details}[Medication(s) currently being used]      Ethanol 70% Topical Solution

BCP-NURSE-PTNEW-03: Duplicate Template
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - On a specific template details screen, select Duplicate button on the top right
    ...  - Select at least a facility from the list
    ...  - Click on Duplicate template button
    ...  Expected Output:
    ...  - The template being chose shall be duplicated to the facility(s) that user selects
    [Tags]    BCP-NURSE-PTNEW-03     manual       inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    # Init data
#    Navigate To Patients New
#    Open Management Templates
#    Open New Template     facilities=${FACILITIES}[0]
#    # Template name + number in title
#    ${medication}       Create Dictionary    medication_name=Zinc oxide 13.2% Lotion        quantity=100       unit=pill(s)     frequency=2 times / day    time_to_take=09:30 AM, 09:45 PM      note=Note       prescribed_date=today
#    Create New Template    template_title=Test Template 03     current_symptoms=Decreasing exercise capacity     past_medicals=Atrial Fibrillation        medications=${medication}
#    # Verify list of template
#    Refresh Page
#    ${template_list}        Get Templates
#    Run Keyword And Continue On Failure    Should Contain    ${template_list}[${FACILITIES}[0]]       Test Template 03
#    # template path: Facilities > Template name
#    ${template_path}    Set Variable    ${FACILITIES}[0] > Test Template 03
#    View Template Details On    template_path=${template_path}
#    ${template_details}    Get Template Details
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${template_details}
#    Run Keyword And Continue On Failure    Should Be Equal        ${template_details}[Template title]                          Test Template 03
#    Run Keyword And Continue On Failure    Should Be Equal        ${template_details}[Current symptoms]                        Decreasing exercise capacity
#    Run Keyword And Continue On Failure    Should Be Equal        ${template_details}[Past medical history]                    Atrial Fibrillation
#    Run Keyword And Continue On Failure    Should Be Equal        ${template_details}[Medication(s) currently being used]      Zinc oxide 13.2% Lotion
#    Duplicate Template On       template_path=${template_path}      facilities=${FACILITIES}[1]
#    ${template_list}        Get Templates
#    Run Keyword And Continue On Failure    Should Contain    ${template_list}[${FACILITIES}[1]]       Test Template 03 (copy)
#    View Template Details On    ${FACILITIES}[1] > Test Template 03 (copy)
#    ${dup_temp_details}     Get Template Details
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${dup_temp_details}
#    Run Keyword And Continue On Failure    Should Be Equal        ${dup_temp_details}[Template title]                          Test Template 03 (copy)
#    Run Keyword And Continue On Failure    Should Be Equal        ${dup_temp_details}[Current symptoms]                        Decreasing exercise capacity
#    Run Keyword And Continue On Failure    Should Be Equal        ${dup_temp_details}[Past medical history]                    Atrial Fibrillation
#    Run Keyword And Continue On Failure    Should Be Equal        ${dup_temp_details}[Medication(s) currently being used]      Zinc oxide 13.2% Lotion

BCP-NURSE-PTNEW-04: Delete Template
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - On a specific template details screen, select Delete button on the top right
    ...  - Click No
    ...  - Click Delete template button again
    ...  - Click Yes
    ...  Expected Output:
    ...  - Will dismiss the modal and the template will be deleted
    [Tags]    BCP-NURSE-PTNEW-04     manual       inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
    # Init data
#    Navigate To Patients New
#    Open Management Templates
#    Open New Template     facilities=${FACILITIES}[0]
#    # Template name + number in title
#    ${medication}       Create Dictionary    medication_name=Zinc oxide 13.2% Lotion        quantity=100       unit=pill(s)     frequency=2 times / day    time_to_take=09:30 AM, 09:45 PM      note=Note       prescribed_date=today
#    Create New Template    template_title=Test Template 04     current_symptoms=Decreasing exercise capacity     past_medicals=Atrial Fibrillation        medications=${medication}
#    # Verify list of template
#    Refresh Page
#    ${template_list}        Get Templates
#    Run Keyword And Continue On Failure    Should Contain    ${template_list}[${FACILITIES}[0]]       Test Template 04
#    # template path: Facilities > Template name
#    ${template_path}    Set Variable    ${FACILITIES}[0] > Test Template 04
#    View Template Details On    template_path=${template_path}
#    ${template_details}    Get Template Details
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${template_details}
#    Run Keyword And Continue On Failure    Should Be Equal        ${template_details}[Template title]                          Test Template 04
#    Run Keyword And Continue On Failure    Should Be Equal        ${template_details}[Current symptoms]                        Decreasing exercise capacity
#    Run Keyword And Continue On Failure    Should Be Equal        ${template_details}[Past medical history]                    Atrial Fibrillation
#    Run Keyword And Continue On Failure    Should Be Equal        ${template_details}[Medication(s) currently being used]      Zinc oxide 13.2% Lotion
#    View Template Details On      ${template_path}
#    Delete The Template    ${FACILITIES}[0]     Test Template 04

BCP-NURSE-PTNEW-05: New patients - Add new patient by manual input consecutively
    [Documentation]    Author: Hoang Le
    ...
    ...  Test Steps:
    ...  1. Go to the New patients page from the main navigation
    ...  2. Click Add new patient button on the right side of the page
    ...  3. On the Patient information screen, select Facility
    ...  4. Input Personal details, such as (first name/last name/dob/gender/height/weight)
    ...  5. Input Address details, such as (country/state/address/city/zip code)
    ...  6. Input Contact details, such as (email/mobile number/emergency contact phone/home phone)
    ...  7. Input preferred contact method, such as (email/sms/both)
    ...  8. Input Insurance: payment type such as (cash/credit card paying/insurance)
    ...  9. Input Healthcare program details, such as (plan type/register clinic/nurse/physician/general cardiac template)
    ...  10. Select Save & add another patient button.
    ...  Expected Output:
    ...  The Save & add another patient button shall be enabled if all the required fields are filled out
    ...  The patient info shall be displayed on the New-registered patients tab
    ...  All the fields on the Add new patient page shall be cleared out for the next input.
    [Tags]    BCP-NURSE-PTNEW-05    manual      [BCP-2.15]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
    # Can not handle data after test
#    Navigate To Patients New
#    Open Add New Patient
#    # Patient first name + number in title
#    ${fname}    Set Variable    patient_05
#    ${email}    Catenate    ${fname}     @hotmail.com
#    ${insurance}    Create Dictionary    insurance_name=CVS     insurance_expiration=today
#    Add New Patient By Manual Input     clinic_info=Biotres Demo      template=No template    email=${email.replace(' ', '')}      first_name=${fname}      last_name=test      dob=today     gender=Male     phone_number=0342427242
#    ...  country=United States      address=America Dream America Dream Way, East Rutherford, NJ, USA      city=East Rutherford     state=New Jersey       zip_code=07073      height=10ft, 2in    weight=90lb
#    ...  payment_type=Insurance     insurance_details=${insurance}
#    ${message}      Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal     ${message}    Add new patient sucessfully!
#    ${patient_name}     Catenate     ${fname}    test
#    Filter Registered Patients      search_by=patient name      text_search=${patient_name}
#    ${patient_info}     Get Registered Patients     row=1
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${patient_info}       No Patient found
#    Run Keyword And Continue On Failure    Should Be Equal        ${patient_info}[Clinic]     Biotres Demo
#    Run Keyword And Continue On Failure    Should Be Equal        ${patient_info}[Patient name]     ${patient_name}
#    Run Keyword And Continue On Failure    Should Be Equal        ${patient_info}[Phone number]     034-242-7242
#    Run Keyword And Continue On Failure    Should Be Equal        ${patient_info}[Email]      ${email.replace(' ', '')}

BCP-NURSE-PTNEW-06: New patients - Add new patient by manual input (CCM/RPM/CCM&RPM)
    [Documentation]    Author: Hoang Le
    ...
    ...  Test steps:
    ...  1. Go to the New patients page from the main navigation
    ...  2. Click Add new patient button on the right side of the page
    ...  3. On the Patient information screen, select Facility
    ...  4. Input Personal details, such as (first name/last name/dob/gender/height/weight)
    ...  5. Input Address details, such as (country/state/address/city/zip code)
    ...  6. Input Contact details, such as (email/mobile number/emergency contact phone/home phone)
    ...  7. Input preferred contact method, such as (email/sms/both)
    ...  8. Input Insurance: payment type such as (cash/credit card paying/insurance)
    ...  9. Input Healthcare program details, such as (plan type/register clinic/nurse/physician/general cardiac template)
    ...  10. Select Add patient button
    ...  Expected results:
    ...  The Add patient button shall be enabled if all the required fields are filled out
    ...  User shall be navigated to the New patients page where patient info shall be displayed.
    [Tags]    BCP-NURSE-PTNEW-06          manual        [BCP-2.17]
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-07: Add new patient with imported data - Searching for patient info by first & last name
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
    [Tags]    BCP-NURSE-PTNEW-07          manual
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-08: Add new patient with imported data - Searching for patient info by first/last name and dob
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
    [Tags]    BCP-NURSE-PTNEW-08         manual
    Manual Should Be Passed        ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-09: Add new patient with missing info of imported data
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
    [Tags]    BCP-NURSE-PTNEW-09           manual
    Manual Should Be Passed       ${TEST NAME}       ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-10: Undo the patient imported info on Add new patient page
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
    [Tags]    BCP-NURSE-PTNEW-10            manual
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW- : Search for patient not included in the imported data list
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
    [Tags]    BCP-NURSE-PTNEW-             manual
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-11: User works for a clinic which has the imported data
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
    [Tags]    BCP-NURSE-PTNEW-11             manual
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-12: User belongs to many clinics (include Athena)
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
    [Tags]    BCP-NURSE-PTNEW-12             manual
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-13: User works for clinic(s) (not include Athena)
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
    [Tags]    BCP-NURSE-PTNEW-13             manual
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-14: Changing the facility option after selecting patient info from the imported list
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
    [Tags]    BCP-NURSE-PTNEW-14             manual
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-15: Add New Patient By Bulk Import
    [Documentation]    Author: Khang Nguyen
    ...  Pre-condition: The file should be in csv or xlsx format
    ...  Test Steps:
    ...  - Click on Add new patient button from New patients page
    ...  - Select Bulk import button
    ...  - Select Clinic information
    ...  - Click on Import patient list button
    ...  - Click or drag a valid file to upload the templates list
    ...  - Click on Import patient list button
    ...  - Click on Add patient(s) button
    ...  Expected Output:
    ...  - The patients list will be added successfully
    ...  - The new patient's care plan will be added and displayed on the New patients page
    [Tags]    BCP-NURSE-PTNEW-15    manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
    # Can not handle data after test
#    Navigate To Patients New
#    Open Add New Patient
#    Add New Patients By Bulk Import     clinic_info=Bioflux Facility     file_path=project_cardiac_portal/test/data/PatientTemplates.xlsx     template=No Template
#    ${message}    Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${message}        The file is successfully uploaded!
#    ${patients_before}      Get Import Patient List
#    Add Patient List
#    ${patient_name}     Set Variable    ${patients_before}[0][First name] ${patients_before}[0][Last name]
#    ${message}    Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${message}        The patient is added successfully!
#    Navigate To Patients New
#    Filter Registered Patients
#    # Get first patient
#    ${patients_after}    Get Registered Patients    row=1
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${patients_after}      Not found any patient
#    # Verify first patient
#    Run Keyword And Continue On Failure    Should Be Equal    ${patients_after}[Clinic]     Bioflux Facility
#    Run Keyword And Continue On Failure    Should Be Equal    ${patients_after}[Patient name]     ${patient_name}
#    Run Keyword And Continue On Failure    Should Be Equal    ${patients_after}[Phone number]     ${patients_before}[0][Phone number]
#    Run Keyword And Continue On Failure    Should Be Equal    ${patients_after}[Email]            ${patients_before}[0][Email]

BCP-NURSE-PTNEW-16: Assign A Physician
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Click on the Assign a physician button from the bottom of the patient's demographic side tab
    ...  - Enter a physician name and select them
    ...  - Click on Assign button
    ...  Expected Output:
    ...  - A physician who is chose by the user will be assigned as a physician for the care plan
    [Tags]    BCP-NURSE-PTNEW-16    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
    # Can not handle data after test
#    # Assign nurse
#    Navigate To Patients New
#    Filter Registered Patients    search_by=Patient name    text_search=${patient_name}
#    View Registered Patient Appointment Summary On    row=1
#    Go To Patient Details
#    Assign Nurse    nurse=me
#    # Assign physician
#    Assign Physician    physician=${PHY_ACT}[name]
#    ${patient_details}     Get Patient Details Common
#    # Assigned tab
#    Navigate To Patients New
#    Filter Assigned Patients    by_patient=All patients      search_by=patient name      text_search=${patient_name}
#    ${assigned_patients}     Get Assigned Patients
#    Run Keyword And Continue On Failure    Should Be True    all('${CURR_USER}[name]'.lower() in patient['Nurse'].lower() for patient in ${assigned_patients})
#    view_assigned_patient_appointment_summary_on    row=1
#    ${sum_info}     Get Appointment Summary
#    Run Keyword And Continue On Failure    Should Be Equal    ${patient_details}[0][Caregivers]      ${sum_info}[Caregivers]

BCP-NURSE-PTNEW-17: Re-assign A Nurse
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Go to a patient details page - Profile tab
    ...  - Click on Edit button from the Caregivers section
    ...  - Enter a nurse name and select them
    ...  - Click on Change button
    ...  Expected Output:
    ...  - A nurse who is re-placed by the user will be re-assigned as a nurse for the care plan
    ...  - All patient's care plan information will be moved to the new caregiver portal
    [Tags]    BCP-NURSE-PTNEW-17     manual       inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    Navigate To Patients New
#    Filter Assigned Patients    by_patient=All patients      search_by=Patient name      text_search=${PATIENTS}[5]
#    ${assigned_patient}     Get Assigned Patients
#    Run Keyword And Continue On Failure    Should Be True    all('${CURR_USER}[name] (You)'.lower() in patient['Nurse'].lower() for patient in ${assigned_patient})
#    View Assigned Patient Appointment Summary On    row=1
#    ${sum_info}     Get Appointment Summary
#    View Assigned Patient Details On    row=1
#    ${text}     Get Patient Details Common
#    ${sum_caregivers}     Evaluate    '${sum_info}[Caregivers]'.split(',')[0]
#    ${common_caregivers}      Evaluate    '${text}[0][Caregivers]'.split(',')[0]
#    Run Keyword And Continue On Failure    Should Be Equal    ${common_caregivers}      ${sum_caregivers}
#    # Re-assign nurse
#    Edit Caregivers    nurse=${NURSE_ACT}[name]
#    ${text}     Get Patient Details Common
#    ${common_caregivers}      Evaluate    '${text}[0][Caregivers]'.split(',')[0]
#    Navigate To Patients New
#    Filter Assigned Patients    by_patient=All patients      search_by=patient name      text_search=${PATIENTS}[5]
#    ${assigned_patient}     Get Assigned Patients       row=1
#    Run Keyword And Continue On Failure    Should Contain     ${assigned_patient}[Nurse]    ${NURSE_ACT}[name]
#    View Assigned Patient Appointment Summary On    row=1
#    ${appt_info}     Get Appointment Summary
#    Run Keyword And Continue On Failure    Should Be Equal    ${common_caregivers}      ${sum_caregivers}

BCP-NURSE-PTNEW-18: Re-assign A Physician
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...   - Go to a patient details page - Profile tab
    ...  - Click on Edit button from the Caregivers section
    ...  - Enter a physician name and select them
    ...  - Click on Change button
    ...  Expected Output:
    ...  - A physician who is re-placed by the user will be assigned as a physician for the care plan
    ...  - All patient's care plan information will be moved to the new caregiver portal
    [Tags]    BCP-NURSE-PTNEW-18     manual       inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    Navigate To Patients New
#    Filter Assigned Patients    by_patient=All patients      search_by=patient name      text_search=${PATIENTS}[5]
#    View Assigned Patient Details On    row=1
#    ${common_info}      Get Patient Details Common
#    # Assigned tab
#    Navigate To Patients New
#    Filter Assigned Patients    by_patient=All patients      search_by=patient name      text_search=${PATIENTS}[5]
#    ${assigned_patient}     Get Assigned Patients
#    # Only show Nures
#    Run Keyword And Continue On Failure     Should Be True    ['${CURR_USER}[name]' in patient['Nurse'] for patient in ${assigned_patient}]
#    View Assigned Patient Appointment Summary On    row=1
#    ${appt_info}     Get Appointment Summary
#    View Assigned Patient Details On    row=1
#    ${sum_caregivers}     Evaluate    '${appt_info}[Caregivers]'.split(',')[0]
#    ${common_caregivers}      Evaluate    '${common_info}[0][Caregivers]'.split(',')[0]
#    Run Keyword And Continue On Failure    Should Be Equal    ${common_caregivers}      ${sum_caregivers}
#    # Re-assgned
#    Edit Caregivers    physician=${PHY_ACT}[name]
#    ${common_info}      Get Patient Details Common
#    Navigate To Patients New
#    Filter Assigned Patients    by_patient=All patients      search_by=patient name      text_search=${PATIENTS}[5]
#    View Assigned Patient Appointment Summary On    row=1
#    ${appt_info}     Get Appointment Summary
#    ${sum_caregivers}     Evaluate    '${appt_info}[Caregivers]'.split(',')[0]
#    ${common_caregivers}      Evaluate    '${common_info}[0][Caregivers]'.split(',')[0]
#    Run Keyword And Continue On Failure     Should Be Equal    ${sum_caregivers}      ${common_caregivers}

BCP-NURSE-PTNEW-19: Start Healthcare Program
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Go to a specific patient's details page
    ...  - Select on Start healthcare program button
    ...  Expected Output:
    ...  - The care plan shall be removed from the New tab
    ...  - The care plan shall be moved to the Active tab
    [Tags]    BCP-NURSE-PTNEW-19    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
    # Can not handle data after test
#    Navigate To Patients New
#    Filter Registered Patients      search_by=patient name      text_search=${patient_name}
#    ${registered_patients}     Get Registered Patients
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${registered_patients}
#    View Registered Patient Appointment Summary On    row=1
#    Go To Patient Details
#    Assign Nurse    nurse=${CURR_USER}[name]
#    # Assign physician
#    Assign Physician    physician=${PHY_ACT}[name]
#    Start Health Care Program
#    ${message}     Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal     ${message}    Care plan is started sucessfully!
#    Navigate To Patients Active
#    Filter Active Patients    by_patient=All patient       search_by=Patient name       text_search=${patient_name}
#    ${active_patients}     Get Active Patients
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${active_patients}     No patient found - without patient name
#    Run Keyword And Continue On Failure    Should Be True    all('${patient_name}' in patient['Patient name'] for patient in ${active_patients})

BCP-NURSE-PTNEW-20: Stop A Healthcare Program
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Go to a specific patient's details page
    ...  - Click on Stop healthcare program button at the bottom of the page
    ...  - Select one of the reason on the modal
    ...  - Select Stop health care program button
    ...  Expected Output:
    ...  - The care plan will be stopped successfully
    [Tags]    BCP-NURSE-PTNEW-20     manual       inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    Navigate To Patients Active
#    Filter Active Patients    by_patient=All patients       search_by=Patient name       text_search=${PATIENTS}[19]
#    View Active Patient Details On    row=1
#    Stop Health Care Program      reason=Moved
#    ${message}      Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${message}    Health care program is stopped successfully!
#    Navigate To Patients Inactive
#    Filter Inactive Patients    by_patient=All patients      search_by=patient name      text_search=${PATIENTS}[19]
#    ${inact_patients}     Get Inactive Patients     row=1
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${inact_patients}
#    Run Keyword And Continue On Failure    Should Be Equal     ${inact_patients}[Patient Name]     ${PATIENTS}[19]
#    Run Keyword And Continue On Failure    Should Be Equal     ${inact_patients}[Reason For Completion]     Moved

BCP-NURSE-PTNEW-21: Filter New-Registered patients
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to Patients-New patients page
    ...   - Select on Registered tab
    ...   - Search patient by Patient name or Care plan ID
    ...   - Click on a specific patient's care plan row which user wants to view the details
    ...   Expected Result:
    ...   - Patient's care plan details page shall be displayed.
    [Tags]     BCP-NURSE-PTNEW-21     manual      inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    [Template]    Filter New - Registered Patients
#    Read            Care Plan ID
#    All statuses    Patient Name
##    Unread          Patient Name       # Need resolve data before/after test

BCP-NURSE-PTNEW-22: Filter New-Assigned patients by "My patients"
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to Patients-New patients page
    ...   - Select on Assigned tab
    ...   - Filter patients list by "My patients"
    ...   - Search patient by Patient name or Care plan ID
    ...   - Click on a specific patient's care plan row which user wants to view the details
    ...   Expected Result:
    ...   - Patient's care plan details page shall be displayed.
    [Tags]    BCP-NURSE-PTNEW-22     manual      inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    [Template]    Filter New - Assigned Patients
#    My patients     Patient Name
#    My patients     Care Plan ID

BCP-NURSE-PTNEW-23: Filter New-Assigned patients by "All patients"
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to Patients-New patients page
    ...   - Select on Assigned tab
    ...   - Filter patients list by "All patients"
    ...   - Search patient by Patient name or Care plan ID
    ...   - Click on a specific patient's care plan row which user wants to view the details
    ...   Expected Result:
    ...   - Patient's care plan details page shall be displayed.
    [Tags]    BCP-NURSE-PTNEW-23     manual      inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    [Template]    Filter New - Assigned Patients
#    All patients     Patient Name
#    All patients     Care Plan ID

BCP-NURSE-PTNEW-24: Filter New-Deleted care plans by "My patients"
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to Patients-New patients page
    ...   - Select on Deleted tab
    ...   - Filter patients list by "My patients"
    ...   - Search patient by Patient name or Care plan ID
    ...   Expected Result:
    ...   - The deleted care plan list shall be displayed as user's filter.
    [Tags]    BCP-NURSE-PTNEW-24    manual      inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    [Template]    Filter New - Deleted Patients
#    My patients     Patient Name
#    My patients     Care Plan ID

BCP-NURSE-PTNEW-25: Filter New-Deleted care plans by "All patients"
    [Documentation]    Author: Hoang Le
    ...
    ...  Test Steps:
    ...  - Go to Patients-New patients page
    ...  - Select on Deleted tab
    ...  - Filter patients list by "All patients"
    ...  - Search patient by Patient name or Care plan ID
    ...   Expected Results:
    ...   - The deleted care plan list shall be displayed as user's filter.
    [Tags]    BCP-NURSE-PTNEW-25     manual      inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    [Template]    Filter New - Deleted Patients
#    All patients     Patient Name
#    All patients     Care Plan ID

BCP-NURSE-PTNEW-26: View facility's templates list
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to Patients-New patients page
    ...   - Select on Manage templates button on the right side
    ...   Expected Results:
    ...   - General cardiac templates shall be displayed
    ...   - A list of facilities's templates shall be displayed.
    [Tags]    BCP-NURSE-PTNEW-26     manual      inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    Navigate To Patients New
#    Open Management Templates
#    ${page_header}    Get Page Header
#    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      General cardiac templates
#    ${templates}      Get Templates
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${templates}      No template found

BCP-NURSE-PTNEW-27: TemplatesManagement - Filter Clinic
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to New patients page
    ...   2.Filter the clinic as user wanted
    ...   3.Select Manage templates button from the top left
    ...   4.Observe the Templates list displayed below
    ...   Expected Results:
    ...   - At step 3, General cardiac templates page shall be displayed
    ...   - At step 4, the Clinic's templates which one user chose shall be displayed as the default value.
    [Tags]    BCP-NURSE-PTNEW-27     manual      inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    Navigate To Patients New
#    Select Clinic    clinic=${FACILITIES}[0]
#    Open Management Templates
#    ${header}       Get Page Header
#    Run Keyword And Continue On Failure    Should Contain    ${header}      General cardiac templates
#    ${template}     Get Templates
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${template}[${FACILITIES}[0]]
#    Navigate To Patients New
#    Select Clinic    clinic=${FACILITIES}[1]
#    Open Management Templates
#    ${header}       Get Page Header
#    Run Keyword And Continue On Failure    Should Contain    ${header}      General cardiac templates
#    ${template}     Get Templates
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${template}[${FACILITIES}[1]]
#    Select Clinic    clinic=All clinics

BCP-NURSE-PTNEW-28: Go to the Patient Details Page By Clicking Patient Name Hyperlink From New - Registered patients
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to New - Registered patients page
    ...   2.On the patients list, click Patient name hyperlink
    ...   3.On the Care plan info side tab, click Go to patient details button
    ...   Expected Results:
    ...   - At step 2, the Care plan info side tab will be displayed with the Care plan's patient info and Appointments info
    ...   - At step 3, user shall be navigated to the Patient details page
    [Tags]    BCP-NURSE-PTNEW-28     manual      inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    Navigate To Patients New
#    Filter Registered Patients    by_status=All statuses        search_by=Patient name      text_search=${PATIENTS}[10]
#    ${reg_patients}     Get Registered Patients
#    ${patient_name}     Set Variable    ${reg_patients}[0][Patient Name]
#    View Registered Patient Appointment Summary On    row=1
#    ${patient_appt}     Get Appointment Summary    is_close=False
#    Run Keyword And Continue On Failure    Should Be Equal      ${patient_appt}[Top info][0]       ${patient_name}
#    Run Keyword And Continue On Failure    Should Be Equal      ${patient_appt}[Top info][1]       Care plan ID: ${reg_patients}[0][Care Plan ID]
#    Go To Patient Details
#    ${header}       Get Page Header
#    Run Keyword And Continue On Failure    Should Contain    ${header}    ${patient_name}

BCP-NURSE-PTNEW-29: Go to the Patient Details Page By Clicking Patient Name Hyperlink From New - Assigned patients
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to New - Assigned patients page
    ...   2.On the patients list, click Patient name hyperlink
    ...   3.On the Care plan info side tab, click Go to patient details button
    ...   Expected Results:
    ...   - At step 2, the Care plan info side tab will be displayed with the Care plan's patient info and Appointments info
    ...   - At step 3, user shall be navigated to the Patient details page
    [Tags]    BCP-NURSE-PTNEW-29     manual      inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    Navigate To Patients New
#    Filter Assigned Patients    by_patient=All patients     search_by=Patient name      text_search=${PATIENTS}[13]
#    ${assigned_patient}     Get Assigned Patients
#    ${patient_name}         Set Variable    ${assigned_patient}[0][Patient Name]
#    View Assigned Patient Appointment Summary On    row=1
#    ${patient_appt}     Get Appointment Summary    is_close=False
#    Run Keyword And Continue On Failure    Should Be Equal      ${patient_appt}[Top info][0]       ${patient_name}
#    Run Keyword And Continue On Failure    Should Be Equal      ${patient_appt}[Top info][1]       Care plan ID: ${assigned_patient}[0][Care Plan ID]
#    Go To Patient Details
#    ${header}       Get Page Header
#    Run Keyword And Continue On Failure    Should Contain    ${header}    ${patient_name}

#BCP-NURSE-PTNEW-30: Delete A New Care Plan From New - Registered
#    [Documentation]    Author: Hoang Le
#    ...
#    ...   Test Steps:
#    ...   1.Go to New - Registered care plan tab
#    ...   2.Select any patient's care plan on the list
#    ...   3.On the patient details page, click the Delete button from the bottom of the Patient demographic side tab
#    ...   4.Select Yes/No from the confirmation pop-up displayed after that
#    ...   Expected Results:
#    ...   - At step 2, user shall be navigated to the Patient details page
#    ...   - At step 3, a confirmation pop-up with the content "Do you want to delete this care plan?" shall be displayed
#    ...   - At step 4, select Yes - the care plan will be deleted from the New patients list and be moved to Deleted care plan tab
#    ...   - The care plan will be unlinked from the patient account
#    ...   - All the future appointments will be deleted from the database
#    ...   - All the past appointments will be hidden
#    ...   - The Change history shall record the action
#    ...   - The initial date range of the Time tracking should remain
#    ...   - Assigned clinic users (if any) shall be notified of the action
#    ...   - (Mobile app) If the patient has already linked the care plan, they shall be notified via push notification
#    ...   - If they are being in app, a modal shall be displayed saying their care plan is deleted
#    ...   - Reference code (if not yet used) will become invalid
#    ...   - At step 4, select No - the confirmation pop-up will be closed and the care plan still be displayed on the New patients list.
#    [Tags]    BCP-NURSE-PTNEW-30    manual
#    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

#BCP-NURSE-PTNEW-31: Delete A New Care Plan From New - Assigned
#    [Documentation]    Author: Hoang Le
#    ...
#    ...   Test Steps:
#    ...   1.Go to New - Assigned care plan tab
#    ...   2.Select any patient's care plan on the list
#    ...   3.On the patient details page, click the Delete button from the bottom of the Patient demographic side tab
#    ...   4.Select Yes/No from the confirmation pop-up displayed after that
#    ...   Expected Results:
#    ...   - At step 2, user shall be navigated to the Patient details page
#    ...   - At step 3, a confirmation pop-up with the content "Do you want to delete this care plan?" shall be displayed
#    ...   - At step 4, select Yes - the care plan will be deleted from the New patients list and be moved to Deleted care plan tab
#    ...   - The care plan will be unlinked from the patient account
#    ...   - All the future appointments will be deleted from the database
#    ...   - All the past appointments will be hidden
#    ...   - The Change history shall record the action
#    ...   - The initial date range of the Time tracking should remain
#    ...   - Assigned clinic users (if any) shall be notified of the action
#    ...   - (Mobile app) If the patient has already linked the care plan, they shall be notified via push notification
#    ...   - If they are being in app, a modal shall be displayed saying their care plan is deleted
#    ...   - Reference code (if not yet used) will become invalid
#    ...   - At step 4, select No - the confirmation pop-up will be closed and the care plan still be displayed on the New patients list.
#    [Tags]    BCP-NURSE-PTNEW-31    manual
#    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

#BCP-NURSE-PTNEW-32: Restore A New Care Plan From New - Registered
#    [Documentation]    Author: Hoang Le
#    ...
#    ...   Test Steps:
#    ...   1.Go to New - Deleted care plan tab
#    ...   2.On a specific care plan row, click Restore button from the right
#    ...   3.Select Yes/No from the confirmation pop-up
#    ...   Expected Results:
#    ...   - At step 2, a confirmation modal shall be displayed with the content "Do you want to restore this care plan?"
#    ...   - At step 3, select Yes - the care plan will be moved back to the Registered tab from Deleted one
#    ...   - This care plan shall be displayed again in the Previous care plan section on the patient app of the patient.
#    ...   - All the past appointments will be displayed again
#    ...   - The Change history shall record the action
#    ...   - The initial date range of the Time tracking should continue
#    ...   - Assigned clinic users (if any) shall be notified of the action
#    ...   - An email (and SMS - for US patients only) with a new reference code shall be sent to the patient’s email.
#    ...   - At step 3, select No - the modal will be dissmissed
#    ...   - The care plan still be displayed on the Deleted care plan tab.
#    [Tags]    BCP-NURSE-PTNEW-32    manual
#    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

#BCP-NURSE-PTNEW-33: Restore A New Care Plan From New - Registered
#    [Documentation]    Author: Hoang Le
#    ...
#    ...   Test Steps:
#    ...   1.Go to New - Deleted care plan tab
#    ...   2.On a specific care plan row, click Restore button from the right
#    ...   3.Select Yes/No from the confirmation pop-up
#    ...   Expected Results:
#    ...   - At step 2, a confirmation modal shall be displayed with the content "Do you want to restore this care plan?"
#    ...   - At step 3, select Yes - the care plan will be moved back to the Registered tab from Deleted one
#    ...   - This care plan shall be displayed again in the Previous care plan section on the patient app of the patient.
#    ...   - All the past appointments will be displayed again
#    ...   - The Change history shall record the action
#    ...   - The initial date range of the Time tracking should continue
#    ...   - Assigned clinic users (if any) shall be notified of the action
#    ...   - An email (and SMS - for US patients only) with a new reference code shall be sent to the patient’s email.
#    ...   - At step 3, select No - the modal will be dissmissed
#    ...   - The care plan still be displayed on the Deleted care plan tab.
#    [Tags]    BCP-NURSE-PTNEW-33    manual
#    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

#BCP-NURSE-PTNEW-34: Restore A New Care Plan From New - Assigned
#    [Documentation]    Author: Hoang Le
#    ...
#    ...   Test Steps:
#    ...   1.Go to New - Deleted care plan tab
#    ...   2.On a specific care plan row, click Restore button from the right
#    ...   3.Select Yes/No from the confirmation pop-up
#    ...   Expected Results:
#    ...   - At step 2, a confirmation modal shall be displayed with the content "Do you want to restore this care plan?"
#    ...   - At step 3, select Yes - the care plan will be moved back to the Assigned tab from Deleted one
#    ...   - This care plan shall be displayed again in the Previous care plan section on the patient app of the patient.
#    ...   - All the past appointments will be displayed again
#    ...   - The Change history shall record the action
#    ...   - The initial date range of the Time tracking should continue
#    ...   - Assigned clinic users (if any) shall be notified of the action
#    ...   - An email (and SMS - for US patients only) with a new reference code shall be sent to the patient’s email.
#    ...   - At step 3, select No - the modal will be dissmissed
#    ...   - The care plan still be displayed on the Deleted care plan tab.
#    [Tags]    BCP-NURSE-PTNEW-34    manual
#    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

#BCP-NURSE-PTNEW-35: Receive Notification Of Care Plan Deletion From New - Registered
#    [Documentation]    Author: Hoang Le
#    ...
#    ...   Test Steps:
#    ...   1.Go to New - Registered care plan tab
#    ...   2.Select any patient's care plan on the list
#    ...   3.On the patient details page, click the Delete button from the bottom of the Patient demographic side tab
#    ...   4.Select Yes button from the confirmation pop-up displayed after that
#    ...   5.On the Notification center, click on a Notification
#    ...   Expected Results:
#    ...   - At step 4, a notification will be sent to the user if another clinic user deletes a care plan where they are the caregiver.
#    ...   - The content shall be:
#    ...   + Title: Care plan deleted
#    ...   + Content: “<Clinic user name> has deleted the care plan of <patient’s name> (ID:<CP ID>)”
#    ...   + Notification timestamp: HH:MM - MM/DD/YYYY (12-hour format)
#    ...   - At step 5, the notification status changes from new to read
#    ...   - The new notification count badge decreases to one unit
#    ...   - The user is navigated to the Deleted page.
#    [Tags]    BCP-NURSE-PTNEW-35    manual
#    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

#BCP-NURSE-PTNEW-36: Receive Notification Of Care Plan Deletion From New - Assigned
#    [Documentation]    Author: Hoang Le
#    ...
#    ...   Test Steps:
#    ...   1.Go to New - Assigned care plan tab
#    ...   2.Select any patient's care plan on the list
#    ...   3.On the patient details page, click the Delete button from the bottom of the Patient demographic side tab
#    ...   4.Select Yes button from the confirmation pop-up displayed after that
#    ...   5.On the Notification center, click on a Notification
#    ...   Expected Results:
#    ...   - At step 4, a notification will be sent to the user if another clinic user deletes a care plan where they are the caregiver.
#    ...   - The content shall be:
#    ...   + Title: Care plan deleted
#    ...   + Content: “<Clinic user name> has deleted the care plan of <patient’s name> (ID:<CP ID>)”
#    ...   + Notification timestamp: HH:MM - MM/DD/YYYY (12-hour format)
#    ...   - At step 5, the notification status changes from new to read
#    ...   - The new notification count badge decreases to one unit
#    ...   - The user is navigated to the Deleted page.
#    [Tags]    BCP-NURSE-PTNEW-36    manual
#    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

#BCP-NURSE-PTNEW-37: Receive Notification Of Care Plan Restore From New - Registered
#    [Documentation]    Author: Hoang Le
#    ...
#    ...   Test Steps:
#    ...   1.Go to New - Deleted care plan tab
#    ...   2.On a specific care plan row, click Restore button from the right
#    ...   3.Select Yes from the confirmation pop-up
#    ...   4.On the Notification center, click on a Notification
#    ...   Expected Results:
#    ...   - At step 3, notification will be sent to the user if another clinic user restores a care plan where they are the caregiver.
#    ...   - The content shall be:
#    ...   + Title: Care plan restored
#    ...   + Content: “<Clinic user name> has restored the care plan of <patient’s name> (ID:<CP ID>)”
#    ...   + Notification timestamp: HH:MM - MM/DD/YYYY (12-hour format)
#    ...   - At step 4, the notification status changes from new to read
#    ...   - The new notification count badge decreases to one unit
#    ...   - The user is navigated to the Patient details page.
#    [Tags]    BCP-NURSE-PTNEW-37    manual
#    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

#BCP-NURSE-PTNEW-38: Receive Notification Of Care Plan Restore From New - Assigned
#    [Documentation]    Author: Hoang Le
#    ...
#    ...   Test Steps:
#    ...   1.Go to New - Deleted care plan tab
#    ...   2.On a specific care plan row, click Restore button from the right
#    ...   3.Select Yes from the confirmation pop-up
#    ...   4.On the Notification center, click on a Notification
#    ...   Expected Results:
#    ...   - At step 3, notification will be sent to the user if another clinic user restores a care plan where they are the caregiver.
#    ...   - The content shall be:
#    ...   + Title: Care plan restored
#    ...   + Content: “<Clinic user name> has restored the care plan of <patient’s name> (ID:<CP ID>)”
#    ...   + Notification timestamp: HH:MM - MM/DD/YYYY (12-hour format)
#    ...   - At step 4, the notification status changes from new to read
#    ...   - The new notification count badge decreases to one unit
#    ...   - The user is navigated to the Patient details page.
#    [Tags]    BCP-NURSE-PTNEW-38    manual
#    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

#BCP-NURSE-PTNEW-39: Add new patient by manual input from New patients tab
#    [Documentation]    Author: Hoang Le
#    ...
#    ...   Test Steps:
#    ...   1. Go to New patients page
#    ...   2. Select Add new patient button
#    ...   3. Fill out all required (*) fields
#    ...   4. On Country field, search and select the one that patient locates on
#    ...   5. Check the Phone number field
#    ...   6. Click Save & add another patient or Add patient button
#    ...   Expected result:
#    ...   A new care plan shall be added and displayed on the New-Registered patients list
#    [Tags]    BCP-NURSE-PTNEW-39    manual
#    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-40: Select preferred contact method by Email on Add new patient progress
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1. Go to Add new patient page
    ...   2. Fill out all required fields on the page
    ...   3. Select preferred contact method by email
    ...   4. Click Save
    ...   Expected result:
    ...   All care plan information updated shall be sent to patient email (if any)
    [Tags]    BCP-NURSE-PTNEW-40    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-41: Select preferred contact method by Sms on Add new patient progress
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1. Go to Add new patient page
    ...   2. Fill out all required fields on the page
    ...   3. Select preferred contact method by sms
    ...   4. Click Save
    ...   Expected result:
    ...   All care plan information updated shall be sent to patient phone number (if any)
    [Tags]    BCP-NURSE-PTNEW-41    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-42: Select preferred contact method by both method (email & sms)
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1. Go to Add new patient page
    ...   2. Fill out all required fields on the page
    ...   3. Select preferred contact method by both (email & sms)
    ...   4. Click Save
    ...   Expected result:
    ...   All care plan information updated shall be sent to patient email and phone number (if any)
    [Tags]    BCP-NURSE-PTNEW-42    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-43: Add new patient by Athena health (CCM/RPM/CCM&RPM)
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The Athena health option is selected
    ...  The selected facility must include the Ahthena patient
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to search and add new patient by searching patient info on Add new patient page.
    [Tags]    BCP-NURSE-PTNEW-43        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-44: Add new patient by Biocare users (CCM/RPM/CCM&RPM)
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The Biocare users option is selected
    ...  The user used to have a Bioflux/Biotres study
    ...  The selected facility must include the Biocare user
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to search and add new patient by searching patient info on Add new patient page.
    [Tags]    BCP-NURSE-PTNEW-44        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-45: Switching between Manual input/Athena/Biocare options
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: one of the option is selected
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to switch between adding methods
    ...  The input information shall be cleared out after switching.
    [Tags]    BCP-NURSE-PTNEW-45        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-46: Bulk import - Import not supported file format
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: bulk import method is selected
    ...  Test steps:
    ...  Expected result:
    ...  The error message shall be displayed to notify that the file format is not supported.
    [Tags]    BCP-NURSE-PTNEW-46        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-47: Bulk import - Import 100 patients per file
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: bulk import method is selected
    ...  Test steps:
    ...  Expected result:
    ...  All 100 patients on file shall be exported to the new patients list successfully.
    [Tags]    BCP-NURSE-PTNEW-47        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-48: Bulk import - Import exceed 100 patients per file
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: bulk import method is selected
    ...  Test steps:
    ...  Expected result:
    ...  The error message shall be displayed to notify that the file exceeds 100 patients.
    [Tags]    BCP-NURSE-PTNEW-48        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-49: Bulk import - Import an empty file
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: bulk import method is selected
    ...  Test steps:
    ...  Expected result:
    ...  The error message shall be displayed to notify that the file is empty and can not be added.
    [Tags]    BCP-NURSE-PTNEW-49        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-50: Bulk import - Import the file with repeated patient info
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: bulk import method is selected
    ...  Test steps:
    ...  Expected result:
    ...  The file shall be added and the duplicated patient info shall be displayed once.
    [Tags]    BCP-NURSE-PTNEW-50        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-52: Column visibility - Hide/show column(s) on page
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: user is on the New patient page
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to hide/show any column(s) on page by setting on Column visibility button.
    [Tags]    BCP-NURSE-PTNEW-52        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-53: Add notes NOT included on the report for the program
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: user does not tick the Included on the Monthly report check box from the Notes side bar
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to add Notes successfully for a program
    [Tags]    BCP-NURSE-PTNEW-53        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-54: Add notes included on the report for the program
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: user ticks the Included on the Monthly report check box from the Notes side bar
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to add Notes successfully for a program
    ...  The Notes shall be displayed on the Monthly report.
    [Tags]    BCP-NURSE-PTNEW-54        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-55: Edit Notes of the program
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: there is a Note added to the program
    ...  Test steps:
    ...  Expected result:
    ...  The Notes shall be updated as the user inputs.
    [Tags]    BCP-NURSE-PTNEW-55        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-56: Delete Notes of the program
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: there is a Note added to the program
    ...  Test steps:
    ...  Expected result:
    ...  The Notes shall be deleted from the program.
    [Tags]    BCP-NURSE-PTNEW-56        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-57: Automatically assigned nurse
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  On the Add new patient process, the nurse who adds new patient shall be the one auto-displayed on the Care team section (nurse role)
    ...  User can keep the nurse or change to another one on the same facility.
    [Tags]    BCP-NURSE-PTNEW-57        manual      [BCP-2.15]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-58: Assign a caregiver who has never logged into the portal - Add new patient by manual input
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The caregiver who has never logged into the portal

    ...  Test steps:
    ...   1. Go to New patients page
    ...   2. Select Add new patient button
    ...   3. Fill out all required (*) fields
    ...   4. Input Healthcare program details
    ...   5. Search a caregiver who has never logged into the portal
    ...  Expected result:
    ...  Can not search for caregiver to assign.
    [Tags]    BCP-NURSE-PTNEW-58     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-59: Assign a caregiver who has logged in but not belongs to the registered facility - Add new patient by manual input
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The caregiver who has logged in but not belongs to the registered facility

    ...  Test steps:
    ...   1. Go to New patients page
    ...   2. Select Add new patient button
    ...   3. Fill out all required (*) fields
    ...   4. Input Healthcare program details
    ...   5. Search a caregiver who has logged in but not belongs to the registered facility
    ...  Expected result:
    ...  Can not search for caregiver to assign.
    [Tags]    BCP-NURSE-PTNEW-59     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-60: Assign a caregiver who has logged in & belongs to the registered facility - Add new patient by manual input
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The caregiver who has logged in but not belongs to the registered facility

    ...  Test steps:
    ...   1. Go to New patients page
    ...   2. Select Add new patient button
    ...   3. Fill out all required (*) fields
    ...   4. Input Healthcare program details
    ...   5. Search & select a caregiver who has logged in & belongs to the registered facility
    ...  Expected result:
    ...  Assign caregiver successfully.
    [Tags]    BCP-NURSE-PTNEW-60     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-61: Assign a caregiver who has never logged into the portal - Add new patient by bulk import
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The caregiver who has never logged into the portal

    ...  Test steps:
    ...   1. Go to New patients page
    ...   2. Select Add new patient button
    ...   3. Select Bulk import button
    ...   4. Select Clinic information
    ...   5. Click on Import patient list button
    ...   6. Select template
    ...   7. Click or drag a valid file to upload the templates list
    ...   8. Click on Import patient list button
    ...   9. Click on Edit button
    ...   10. Search a caregiver who has never logged into the portal
    ...  Expected result:
    ...  Can not search for caregiver to assign.
    [Tags]    BCP-NURSE-PTNEW-61     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-62: Assign a caregiver who has logged in but not belongs to the registered facility - Add new patient by bulk import
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The caregiver who has logged in but not belongs to the registered facility

    ...  Test steps:
    ...   1. Go to New patients page
    ...   2. Select Add new patient button
    ...   3. Select Bulk import button
    ...   4. Select Clinic information
    ...   5. Click on Import patient list button
    ...   6. Select template
    ...   7. Click or drag a valid file to upload the templates list
    ...   8. Click on Import patient list button
    ...   9. Click on Edit button
    ...   10. Search a caregiver who has logged in but not belongs to the registered facility
    ...  Expected result:
    ...  Can not search for caregiver to assign.
    [Tags]    BCP-NURSE-PTNEW-62     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-63: Assign a caregiver who has logged in & belongs to the registered facility - Add new patient by bulk import
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The caregiver who has logged in but not belongs to the registered facility

    ...  Test steps:
    ...   1. Go to New patients page
    ...   2. Select Add new patient button
    ...   3. Select Bulk import button
    ...   4. Select Clinic information
    ...   5. Click on Import patient list button
    ...   6. Select template
    ...   7. Click or drag a valid file to upload the templates list
    ...   8. Click on Import patient list button
    ...   9. Click on Edit button
    ...   10. Search a caregiver who has logged in & belongs to the registered facility
    ...  Expected result:
    ...  Assign caregiver successfully.
    [Tags]    BCP-NURSE-PTNEW-63     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-64: Re-assign a caregiver who has never logged into the portal
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The caregiver who has never logged into the portal

    ...  Test steps:
    ...   1. Go to Patient detail page
    ...   2. Click on Edit button from the Caregivers section
    ...   3. Search a caregiver who has never logged into the portal
    ...  Expected result:
    ...  Can not search for caregiver to assign.
    [Tags]    BCP-NURSE-PTNEW-64     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-65: Re-assign a caregiver who has logged in but not belongs to the registered facility
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The caregiver who has logged in but not belongs to the registered facility

    ...  Test steps:
    ...   1. Go to Patient detail page
    ...   2. Click on Edit button from the Caregivers section
    ...   3. Search a caregiver who has logged in but not belongs to the registered facility
    ...  Expected result:
    ...  Can not search for caregiver to assign.
    [Tags]    BCP-NURSE-PTNEW-65     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-66: Re-assign a caregiver who has logged in & belongs to the registered facility
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The caregiver who has logged in but not belongs to the registered facility

    ...  Test steps:
    ...   1. Go to Patient detail page
    ...   2. Click on Edit button from the Caregivers section
    ...   3. Search a caregiver who has logged in & belongs to the registered facility
    ...   4. Click on Change button
    ...  Expected result:
    ...  Assign caregiver successfully.
    [Tags]    BCP-NURSE-PTNEW-66    manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-67: Assign the deactivated caregiver account - Add new patient by manual input
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The caregiver who has deactivated account

    ...  Test steps:
    ...   1. Go to New patients page
    ...   2. Select Add new patient button
    ...   3. Fill out all required (*) fields
    ...   4. Input Healthcare program details
    ...   5. Search a caregiver who has deactivated account
    ...  Expected result:
    ...  Can not search for caregiver to assign.
    [Tags]    BCP-NURSE-PTNEW-67     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-68: Assign the deactivated caregiver account - Add new patient by by bulk import
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The caregiver who has deactivated account

    ...  Test steps:
    ...   1. Go to New patients page
    ...   2. Select Add new patient button
    ...   3. Select Bulk import button
    ...   4. Select Clinic information
    ...   5. Click on Import patient list button
    ...   6. Select template
    ...   7. Click or drag a valid file to upload the templates list
    ...   8. Click on Import patient list button
    ...   9. Click on Edit button
    ...   10. Search a caregiver who has deactivated account
    ...  Expected result:
    ...  Can not search for caregiver to assign.
    [Tags]    BCP-NURSE-PTNEW-68     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-69: Re-assign the deactivated caregiver account
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The caregiver who has logged in but not belongs to the registered facility

    ...  Test steps:
    ...   1. Go to Patient detail page
    ...   2. Click on Edit button from the Caregivers section
    ...   3. Search a caregiver who has deactivated account
    ...  Expected result:
    ...  Can not search for caregiver to assign.
    [Tags]    BCP-NURSE-PTNEW-69     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-70: Check UI patient details in New state without setup monitored Data
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...   1. Login Portal > Select menu Patients > Select Patient with New status, no setup monitored data
    ...   2. Display the Patient detail > Check UI screen
    ...  Expected result:
    ...  Display UI according to design, do not display any information of monitored data
    [Tags]    BCP-NURSE-PTNEW-70     manual      BCCA-2.24.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-71: Check UI patients details in New state with setup monitored Data
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...   1. Login Portal > Select menu Patients > Select Patient with status New > Setup monitored data including: Blood Pressure, Heart rate, SpO2, Temperature, Weight
    ...   2. Display the Patient detail > Check UI screen
    ...   3. Login Apps > Perform data entry for: Blood Pressure, Heart rate, SpO2, Temperature, Weight > Successfully entered
    ...   4. Check UI patients details portal
    ...  Expected result:
    ...   2. Display UI according to design, If it is turned on but there is no record for that biometric data, display ”- -”
    ...   4.  Display UI according to design, data displayed is similar to data entered in Apps
    [Tags]    BCP-NURSE-PTNEW-71     manual      BCCA-2.24.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-72: Check UI patients details are in Inactive state but have not setup monitored Data
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...   1. Login Portal > Select menu Patients > Select Patient with Inactive status, no setup monitored data
    ...   2. Display the Patient detail > Check UI screen

    ...  Expected result:
    ...   2. Display UI according to design, do not display any information of monitored data
    [Tags]    BCP-NURSE-PTNEW-72     manual      BCCA-2.24.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-73: Check UI patients details in Inactive state with setup monitored Data
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select menu Patients > Select Patient with Inactive status > Setup monitored data including: Blood Pressure, Heart rate, SpO2, Temperature, Weight    ...   2. Display the Patient detail > Check UI screen
    ...  2. Display the Patient detail > Check UI screen
    ...  3. Login Apps > Perform data entry for: Blood Pressure, Heart rate, SpO2, Temperature, Weight > Successfully entered
    ...  4. Check UI patients details portal
    ...  Expected result:
    ...   2.  Display UI according to design, If it is turned on but there is no record for that biometric data, display ”- -”
    ...   4.  Display UI according to design, do not display any information of monitored data
    [Tags]    BCP-NURSE-PTNEW-73     manual      BCCA-2.24.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-74: Check UI patients details in Incomplete state set up program with setup monitored Data
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select menu Patients > Select Patient with Incomplete set up program status > Setup monitored data including: Blood Pressure, Heart rate, SpO2, Temperature, Weight
    ...  2. Display the Patient detail > Check UI screen
    ...  3. Login Apps > Perform data entry for: Blood Pressure, Heart rate, SpO2, Temperature, Weight > Successfully entered
    ...  4. Check UI patients details portal
    ...  Expected result:
    ...   2.  Display UI according to design, If it is turned on but there is no record for that biometric data, display ”- -”
    ...   4.  Display UI according to design, data displayed is similar to data entered in Apps
    [Tags]    BCP-NURSE-PTNEW-74     manual      BCCA-2.24.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-75: Check UI patients details when Not in monitored data
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...   1. Login Portal > Select menu Patients > Select Monitored Data tab
    ...   2. Click the Set monitored data button > Perform Active Blood Pressure, Heart rate, Inactive Oxygen, Body temperature
    ...   3. Click Save > Check data UI

    ...  Expected result:
    ...   3. In header details, only displays Blood Pressure, Heart rate. Hide section: Oxygen, Body temperature
    [Tags]    BCP-NURSE-PTNEW-75     manual      BCCA-2.24.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-76: Check UI patients details when No Monitored data setup
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select menu Patients > Select Monitored Data tab
    ...  2. Click the Set monitored data button > Inactivate all section data
    ...  3. Click Save > Check UI
    ...  4. Click to select text link
    ...  Expected result:
    ...   3.  Display message: No data has been monitored. Display text link Set monitored data
    ...   4.  Navigate to the monitored data setup screen
    [Tags]    BCP-NURSE-PTNEW-76     manual      BCCA-2.24.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-77: Execute Stop program when there is a Monitored data setup
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select menu Patients > Select patient with monitored data installed
    ...  2. Display the patients detail screen > Click the Stop Program button
    ...  3. Click View more

    ...  Expected result:
    ...   2.  Hide all information of monitored data, patient on switch to Inactive tab, display text link View more
    ...   4.  Show previous basic information of patients according to design
    [Tags]    BCP-NURSE-PTNEW-77     manual      BCCA-2.24.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-78: Perform patient re-assignment to user clinic in Inactive state
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select menu Patients > Select patient with monitored data installed
    ...  2. Display patients detail screen > Click on button text link View more
    ...  3. Display the program screen > Assign care team to any clinic > Click Change
    ...  4. Login admin portal > Execute Inactive clinic user above > Click Save
    ...  5. Login portal > Check data
    ...  6. Click View more > Check UI care team

    ...  Expected result:
    ...   3.  Notification of success, displays notification for the clinic that has just been assigned
    ...   5.  Display "!" icon, move the mouse pointer to display popup: Please re-assgin care team
    ...   6.  Display "!" icon, and display popup: This user has never signed in to the portal. Please re-assign a new caregive
    [Tags]    BCP-NURSE-PTNEW-78     manual      BCCA-2.24.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-79: Check UI Re-design heart monitor tab
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select patient menu
    ...  2. Select any patient > Check UI

    ...  Expected result:
    ...   2. Displays UI according to design, Heart monitor tab is moved to header
    [Tags]    BCP-NURSE-PTNEW-79     manual      BCCA-2.24.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-80: Perform Prescribe Study at clinic user Nurse
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login to the portal using the Nurse/Physician user
    ...  2. Select menu Patients > Select any patient
    ...  3. At details patient header > Click the Prescribe Study button
    ...  4. Click Add Study > Add successfully
    ...  5. Check UI portal

    ...  Expected result:
    ...   3.  Displays the Prescribe new study program screen, including dropdown lists: Study type, Study duration (days), Primary diagnosis code, Second diagnosis code (optional),
    ...   5.  Display study information in the header. Display 2 buttons View prescription and Start study
    [Tags]    BCP-NURSE-PTNEW-80     manual      BCCA-2.24.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-81: Perform Prescribe Study at clinic user Physician
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login to the portal using the Physician user
    ...  2. Select menu Patients > Select any patient
    ...  3. At details patient header > Click the Prescribe Study button
    ...  4. Click Add Study > Add successfully
    ...  5. Check UI portal
    ...  6. Click on the task above > Check data
    ...  7. Click on the textlink "patient's study prescription" > Check data

    ...  Expected result:
    ...   3.  Displays the Prescribe new study program screen, including dropdown lists: Study type, Study duration (days), Primary diagnosis code, Second diagnosis code (optional),
    ...   5.  Display study information in the header. Display 2 buttons View prescription and Start study. Display the New Heart Study Prescription task
    ...   6.  Displays Study information. There is textlink "patient's study prescription"
    ...   7.  Navigate to the previously created Study link
    [Tags]    BCP-NURSE-PTNEW-81     manual      BCCA-2.24.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-82: Select the Prescription view
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login to the portal using the Nurse/Physician user
    ...  2. Select menu Patients > Select any patient
    ...  3. At details patient header > Click on the Prescription view button
    ...  4. Display the Start Study > Check UI screen
    ...  5. Click the Cancel button
    ...  6. Click No
    ...  7. Click Yes

    ...  Expected result:
    ...   4.  Displays the Prescription details screen. Display 2 buttons Cancel prescription and Start Study
    ...   5.  Display notification popup: "Cancel study prescription?"
    ...   6.  Turn off notification popups, return to Prescription details screen
    ...   7.  Return to the patient details screen, display the Prescription button
    [Tags]    BCP-NURSE-PTNEW-82     manual      BCCA-2.24.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-83: Check the UI consent screen
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login portal > Select menu Patients
    ...  2. Perform add new patient with full validation
    ...  3. At consent form > Perform uploaded/updated by clinics

    ...  Expected result:
    ...   4.   there is a message to inform the consent is uploaded/updated on a specific date.
    [Tags]    BCP-NURSE-PTNEW-83     manual      BCCA-2.28.0    R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-84: Make a request for a new signing consent
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login portal > The patient has signed full consent
    ...  2. Click on the "Request Signature" button
    ...  3. Click Cancel
    ...  4. Click Request Signature
    ...  5. Login app patient has just selected Request Signature
    ...  6. Re-sign consent in the app
    ...  7. Login portal > Check data view consent screen

    ...  Expected result:
    ...   2.  Display popup message: "Request Signature of Patient"
    ...   3.  The system remains unchanged
    ...   4.  Click successfully. Disable all buttons on the screen
    ...   5.  Displays a request to re-sign consent, required field
    ...   6.  Successfully signed the above consent
    ...   7.  Enable all buttons
    [Tags]    BCP-NURSE-PTNEW-84     manual      BCCA-2.28.0    R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-85: Make a request for a new signing consent
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login portal > The patient has signed full consent
    ...  2. Click on the "Request Signature" button
    ...  3. Click Cancel
    ...  4. Click Request Signature
    ...  5. Login app patient has just selected Request Signature
    ...  6. Re-sign consent in the app
    ...  7. Login portal > Check data view consent screen

    ...  Expected result:
    ...   2.  Display popup message: "Request Signature of Patient"
    ...   3.  The system remains unchanged
    ...   4.  Click successfully. Disable all buttons on the screen
    ...   5.  Displays a request to re-sign consent, required field
    ...   6.  Successfully signed the above consent
    ...   7.  Enable all buttons
    [Tags]    BCP-NURSE-PTNEW-85     manual      BCCA-2.28.0    R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-86: Create task alert Pain severity alert
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select Menu patients
    ...  2. Select the Monitored data tab > Click the "Set monitored data" button
    ...  3. Enable toggle button "Pain"
    ...  4. Select the Pain severity tab > 4, Consecutive days = 2
    ...  5. Login Apps > Select add pain log
    ...  6. Perform Severity data import 2 consecutive days = 4
    ...  7. Login portal > Check data
    ...  8. Perform Severity data entry 2 consecutive days = 7
    ...  9. Login portal > Check data
    ...  10. Check data detail tasks

    ...  Expected result:
    ...   7.  The system does not display data alert
    ...   9.  The system displays the task "Pain severity alert"
    ...   10. The system displays data Pain severity = 7
    [Tags]    BCP-NURSE-PTNEW-86     manual      BCCA-2.28.0    R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-87: Perform setup Pain log when setting up program for New patient
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select Menu patients
    ...  2. Create a new patient
    ...  3. Enter complete validation data > Click Save
    ...  4. Perform setup program
    ...  5. At Monitored information, enable toggle Pain > Click Save

    ...  Expected result:
    ...   3. Successfully saved patient data
    ...   5. Successfully saved patient with monitored pain
    [Tags]    BCP-NURSE-PTNEW-87     manual      BCCA-2.28.0    R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-88: Check excel data field after export
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select menu patients
    ...  2. At the patients screen > Click on the Add new patient button
    ...  3. Click on the "Bulk import" button
    ...  4. Click on the text link "download the template file here"
    ...  5. Check excel data field after export

    ...  Expected result:
    ...   4. Download successful
    ...   5.  • Patient name (First name + Last name)
    ...       • Email
    ...       • Mobile phones
    ...       . Program type (RPM/CCM/CCM &RPM)
    ...       • Nurse
    ...       • Physician"
    [Tags]    BCP-NURSE-PTNEW-88     manual      BCCA-2.31.0    R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-89: Check validate export file
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Open the excel file patients list
    ...  2. Leave blank or enter incorrect validation value
    ...  3. Leave blank or enter the wrong validate program type value

    ...  Expected result:
    ...   2. If one of the above fields is empty/invalid, the patient should be highlighted in red
    ...   5. Display “--”
    [Tags]    BCP-NURSE-PTNEW-89     manual      BCCA-2.31.0    R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-90: Perform import data patients list
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select menu patients
    ...  2. At the patients screen > Click on the Add new patient button
    ...  3. Click on the "Bulk import" button
    ...  4. Click on the text link "download the template file here"
    ...  5. Open the patient list excel file
    ...  6. Enter data for 5 patients one by one: A: has program type = CCM, B: has program type = CCM&RPM, C: has program type = RPM,  D: has program type = 0,  E: has program type = "
    ...  7. Perform import list patients above

    ...  Expected result:
    ...   7. Displays list of patients, program type E is marked in red because there is no program setting. Patients A,B,C,D display normally
    [Tags]    BCP-NURSE-PTNEW-90     manual      BCCA-2.31.0     R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-91: Perform edit patient list after import
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select patients menu
    ...  2. At the patients screen > Click on the Add new patient button
    ...  3. Click on the "Bulk import" button
    ...  4. Performing any import list of patients is not properly validated
    ...  5. Click on the "Edit" button icon
    ...  6. Check validate required fields
    ...  7. Leave blank or enter incorrectly to validate required fields

    ...  Expected result:
    ...   4. Successfully imported list of patients, the patient should be highlighted in red
    ...   5. Displays the Edit patient information screen
    ...   6. displays a red " * " icon in the fields First name, Last name, Email, Phone number, Nurse. With program type = CCM, CCM&RPM has Physician added
    ...   7. Disable the "Save" button, highlight fields that are not properly validated in red
    [Tags]    BCP-NURSE-PTNEW-91     manual      BCCA-2.31.0     R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-92: Perform select all patients list when performing bulk import
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select patients menu
    ...  2. At the patients screen > Click on the Add new patient button
    ...  3. Click on the "Bulk import" button
    ...  4. Perform bulk import list patients correctly and fully validate
    ...  5. Click select select all patients list
    ...  6. Click the Edit program type button
    ...  7. Select program type = CCM, click Save
    ...  8. Perform select all, update program type = RPM
    ...  9. Perform select all (30 patients), uncheck any 15 patients, update program type = CCM&RPM

    ...  Expected result:
    ...   5. The system selects all patients available on the system
    ...   7. All patients are checked and converted to program type = CCM
    ...   8. All patients are checked and converted to program type = RPM
    ...   9. 15 unchecked patients keep program type = RPM, 15 checked patients switch to program type = CCM&RPM
    [Tags]    BCP-NURSE-PTNEW-92     manual      BCCA-2.31.0     R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-93: Perform Assign care team when selecting all Patients
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select patients menu
    ...  2. At the patients screen > Click on the Add new patient button
    ...  3. Click on the "Bulk import" button
    ...  4. Perform bulk import list patients correctly and fully validate
    ...  5. Click select select all patients list
    ...  6. Click the Assign care team button
    ...  7. Implement Assign care team with Nurse = Ly Ly, Physician = Bob Smoak

    ...  Expected result:
    ...   6. Displays the Assign care team screen, default selects the clinic user who is performing the bulk import
    ...   7. selected successfully, all selected patients have Nurse = Ly Ly, Physician = Bob Smoak
    [Tags]    BCP-NURSE-PTNEW-93     manual      BCCA-2.31.0     R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-94: Perform Remove when selecting all Patients
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select patients menu
    ...  2. At the patients screen > Click on the Add new patient button
    ...  3. Click on the "Bulk import" button
    ...  4. Perform bulk import list patients correctly and fully validate
    ...  5. Click select select all patients list
    ...  6. Click on the "Remove" button
    ...  7. Click "No"
    ...  8. Click "Yes"

    ...  Expected result:
    ...   6. Display "Remove patients" popup
    ...   7. Keep the patient list screen intact
    ...   8. Remove all selected patients
    [Tags]    BCP-NURSE-PTNEW-94     manual      BCCA-2.31.0     R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTNEW-95: Check validate "Search phone number"
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select patients menu
    ...  2. At textbox search > Select search "Phone Number"
    ...  3. Perform input of special characters, letters, ...
    ...  4. Do a search for number 090

    ...  Expected result:
    ...   3. Entry not allowed
    ...   4. Displays all patients whose phone number is 090
    [Tags]    BCP-NURSE-PTNEW-95     auto
#    Navigate To Patient Details Bao     phone_number=2709778713
    Navigate To Filter Menu Patient      programtype=CCM & RPM
#   Verify patient info
    ${reg_patients}     Get Capture Detail Info
    Run Keyword And Continue On Failure    Should Be Equal    ${reg_patients}[PatienName]       Ez Baovan1(staging)
    Run Keyword And Continue On Failure    Should Be Equal    ${reg_patients}[Email]       ezbaovan1@yopmail.com
    Run Keyword And Continue On Failure    Should Be Equal    ${reg_patients}[ProgramID]       CCM & RPM - 00002
    Run Keyword And Continue On Failure    Should Be Equal    ${reg_patients}[Facility]       Bioflux Solutions


BCP-NURSE-PTNEW-96: Check validate "Search phone number"
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select menu patients
    ...  2. Check UI 3 tabs: Active, New, Inactive

    ...  Expected result:
    ...   2. Displayed as designed, with additional data field "Phone Number"
    [Tags]    BCP-NURSE-PTNEW-96     manual      BCCA-2.32.0     R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

*** Keywords ***
Suite Setup
    ${BROWSER_NODE}      Start Browser
    Import Library       project_cardiac_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${NURSES}            Get Config Param    USER > nurse
    ${TOKEN}             Sign In Cardiac     username=${NURSES}[0][username]     password=${NURSES}[0][password]
    ${VERSION}           Get Release Version
    Set Suite Metadata   version    ${VERSION}
    Set Suite Metadata   browser    ${BROWSER.capitalize()}

Suite Teardown
    Quit Browser

Filter New - Registered Patients
    [Arguments]     ${status}   ${search_by}
    Navigate To Patients New
    Filter Registered Patients     by_status=${status}    search_by=${search_by}
    ${reg_patients}     Get Registered Patients
    ${text}     Set Variable    ${reg_patients}[0][${search_by}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reg_patients}       No registered patient found - ${search_by} without text string
    Filter Registered Patients      by_status=${status}    search_by=${search_by}      text_search=${text}
    ${reg_patients}     Get Registered Patients
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reg_patients}       No registered patient found - ${search_by} ${text}
    Run Keyword If    '${search_by}' == 'Patient Name'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}'.lower() in p['${search_by}'].lower() for p in ${reg_patients})
    Run Keyword If    '${search_by}' == 'Care Plan ID'      Run Keywords
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}' == p['${search_by}'] for p in ${reg_patients})
    ...  AND    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${text}       ${reg_patients}[0][${search_by}]
    View Registered Patient Details On    row=1
    ${head}     Get Page Header
    Run Keyword And Continue On Failure    Should Contain    ${head}    ${reg_patients}[0][Patient Name]
    ${patient_details}      Get Patient Details Common
    Run Keyword And Continue On Failure    Should Not Be Empty    ${patient_details}
    Run Keyword And Continue On Failure    Should Be True    ['${reg_patients}[0][Patient Name]' in ${patient_details}[0].keys()]
    Run Keyword And Continue On Failure    Should Contain    ${patient_details}[0]      Care plan ID: ${reg_patients}[0][Care Plan ID]
    Run Keyword And Continue On Failure    Should Contain    ${patient_details}[0][Registered clinic]    ${reg_patients}[0][Clinic]

Filter New - Assigned Patients
    [Arguments]    ${by_patient}       ${search_by}
    Navigate To Patients New
    Filter Assigned Patients      by_patient=${by_patient}    search_by=${search_by}
    ${assigned_patients}     Get Assigned Patients
    Run Keyword And Continue On Failure    Should Not Be Empty    ${assigned_patients}     No assigned patient found - ${search_by} without text string
    ${text}     Set Variable    ${assigned_patients}[0][${search_by}]
    Filter Assigned Patients      by_patient=${by_patient}    search_by=${search_by}     text_search=${text}
    ${assigned_patients}     Get Assigned Patients
    Run Keyword And Continue On Failure    Should Not Be Empty    ${assigned_patients}     No assigned patient found - ${search_by} ${text}
    Run Keyword If    '${search_by}' == 'Patient Name'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}'.lower() in p['${search_by}'].lower() for p in ${assigned_patients})
    Run Keyword If    '${search_by}' == 'Care Plan ID'      Run Keywords
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}' == p['${search_by}'] for p in ${assigned_patients})
    ...  AND    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${text}       ${assigned_patients}[0][${search_by}]
    View Assigned Patient Details On    row=1
    ${head}     Get Page Header
    Run Keyword And Continue On Failure    Should Contain    ${head}    ${assigned_patients}[0][Patient Name]
    ${patient_details}      Get Patient Details Common
    Run Keyword And Continue On Failure    Should Not Be Empty    ${patient_details}
    Run Keyword And Continue On Failure    Should Be True    ['${assigned_patients}[0][Patient Name]' in ${patient_details}[0].keys()]
    Run Keyword And Continue On Failure    Should Contain    ${patient_details}[0]      Care plan ID: ${assigned_patients}[0][Care Plan ID]
    Run Keyword And Continue On Failure    Should Contain    ${patient_details}[0][Registered clinic]    ${assigned_patients}[0][Clinic]

Filter New - Deleted Patients
    [Arguments]    ${by_patient}       ${search_by}
    Navigate To Patients New
    Filter Deleted Patients    by_patient=${by_patient}    search_by=${search_by}
    ${del_patients}     Get Deleted Patients
    ${text}     Set Variable    ${del_patients}[0][${search_by}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${del_patients}     No deleted patient found - ${search_by} without text string
    Filter Deleted Patients    by_patient=${by_patient}    search_by=${search_by}     text_search=${text}
    ${del_patients}     Get Deleted Patients    row=1
    Run Keyword And Continue On Failure    Should Not Be Empty    ${del_patients}     No deleted patient found - ${search_by} ${text}
    Run Keyword If    '${search_by}' == 'Patient Name'
    ...  Run Keyword And Continue On Failure    Should Contain      ${del_patients}[${search_by}]    ${text}
    Run Keyword If    '${search_by}' == 'Care Plan ID'      Run Keywords
    ...  Run Keyword And Continue On Failure    Should Be Equal    ${text}      ${del_patients}[${search_by}]
    ...  AND    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${text}       ${del_patients}[${search_by}]

Delete The Template
    [Arguments]    ${facility}    ${template}
    Navigate To Patients New
    Open Management Templates
    ${templates}        Get Templates
    Run Keyword If    ${templates} != None and '${template}' in ${templates}[${facility}]
    ...  Delete Template On      template_path=${facility} > ${template}
    Refresh Page
    ${templates}        Get Templates
    Run Keyword And Continue On Failure    Should Not Contain    ${templates}[${facility}]      ${template}

Reactivate The Care Plan
    [Arguments]    ${inac_patient}
    Navigate To Patients Inactive
    Filter Inactive Patients        by_patient=All patients        search_by=Patient name      text_search=${inac_patient}
    ${inact_patients}     Get Inactive Patients
    Run Keyword If      ${inact_patients} != None and all('${inac_patient}'.lower() in p['Patient Name'].lower() for p in ${inact_patients})      Run Keywords
    ...  View Inactive Patient Details On    row=1
    ...  AND    Reactivate Care Plan

Edit The Caregivers
    [Arguments]     ${assigned_nurse}    ${assigned_phy}    ${patient_name}
    Navigate To Patients New
    Filter Assigned Patients    by_patient=All patients     search_by=Patient name      text_search=${patient_name}
    View Assigned Patient Details On    row=1
    ${details}      Get Patient Details Common
    ${caregiver}    Set Variable    ${details}[0][Caregivers]
    Run Keyword If    '${assigned_nurse}' not in '${caregiver}'     Run Keyword
    ...  Edit Caregivers    nurse=${assigned_nurse}
    Run Keyword If    '${assigned_phy}' not in '${caregiver}'     Run Keyword
    ...  Edit Caregivers    physician=${assigned_phy}
    Refresh Page
    ${details}      Get Patient Details Common
    ${caregiver}    Set Variable    ${details}[0][Caregivers]
    Run Keyword And Continue On Failure    Should Contain     ${caregiver}       ${assigned_nurse}
    Run Keyword And Continue On Failure    Should Contain     ${caregiver}       ${assigned_phy}
