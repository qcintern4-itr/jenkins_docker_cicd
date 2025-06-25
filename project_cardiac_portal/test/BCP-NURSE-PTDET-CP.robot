*** Settings ***
Documentation   Cardiac Patient Details page > Care Plan test suite
Metadata    sid     BCP-NURSE-PTDET-CP
Metadata    owner   Hoang Le
Library     DateTime
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/PatientDetails.py
#Library     project_cardiac_portal/lib/web/PatientsNew.py
#Library     project_cardiac_portal/lib/web/Templates.py
#Library     project_cardiac_portal/lib/web/Appointment.py
#Library     project_cardiac_portal/lib/web/PatientsActive.py

#Suite Setup       #Suite Setup
#Suite Teardown    #Suite Teardown
Force Tags        BCP-NURSE-PTDET-CP      web
Test Timeout      1h

# NOTES: Facing issue about sorting medication afer add done

*** Test Cases ***
BCP-NURSE-PTDET-CP-01: Input Care Plan Overview
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Select on Add care plan overview button
    ...  - Fill out the fields with valid value
    ...  - Click on Add button
    ...  Expected Output:
    ...  - The care plan overview info shall be saved and displayed
    [Tags]    BCP-NURSE-PTDET-CP-01     manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
    # Can not handle data after test
#    Filter Registered Patients      search_by=patient name      text_search=${patient_name}
#    ${text}     Get Registered Patients
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${text}
#    View Registered Patient Details On    row=1
#    Assign Nurse    nurse=me
#    # Assign physician
#    Assign Physician    physician=${PHY_ACT}[name]
#    Start Health Care Program
#    ${message}     Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal     ${message}    Care plan is started sucessfully!
#    Navigate To Patients Active
#    Filter Active Patients      by_patient=All patients     search_by=Patient name      text_search=${patient_name}
#    View Active Patient Details On    row=1
#    # next date = current date + 1 day
#    Navigate To Patient Details Tab    Care plan
#    ${date}    Get Current Date    result_format=%m/%d/%Y    increment=+1 day
#    ${bloodwork}       Create Dictionary    frequency=50      unit=per month      due_next=${date}    test_types=TSH, Fasting Blood Sugar, Lipid profile
#    ${stress_test}     Create Dictionary    frequency=50      unit=per 2 weeks    due_next=${date}
#    Add Care Plan Overview      equipments=Biokit, weight scale     bloodwork=${bloodwork}      stress_test=${stress_test}      fwu_schedule=Weekly     notes=AT Test
#    Navigate To Patient Details Tab    Care plan
#    ${care_plan}     Get Care Plan Overview
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${care_plan}     Overview is null
#    # Patient education default 3 selected option
#    Run Keyword And Continue On Failure    Should Be True    ['1. Printed materials provided' in ${care_plan}[Patient education]]
#    Run Keyword And Continue On Failure    Should Be True    ['2. App access provided' in ${care_plan}[Patient education]]
#    Run Keyword And Continue On Failure    Should Be True    ['3. Online education booked' in ${care_plan}[Patient education]]
#    # Required equipment provided
#    Run Keyword And Continue On Failure    Should Be True    ['Biokit' in ${care_plan}[Required equipment provided]]
#    Run Keyword And Continue On Failure    Should Be True    ['Weight scale' in ${care_plan}[Required equipment provided]]
#    # Bloodwork
#    Run Keyword And Continue On Failure    Should Be True    ['50 times per month' in ${care_plan}[Bloodwork]]
#    Run Keyword And Continue On Failure    Should Be True    ['${date} ' in ${care_plan}[Bloodwork]]

BCP-NURSE-PTDET-CP-02: Select Condition Information
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Click on Select conditions button from the Conditions being monitored section
    ...  - Select on Diagnosed conditions field - (this section is required)
    ...  - Choose one of the baseline value from the list
    ...  - Select on At-risk conditions field
    ...  - Choose one of the baseline value from the list
    ...  Expected Output:
    ...  - A list bases on Baseline conditions information shall be displayed
    ...  - The list of chosen options will be displayed below.
    [Tags]    BCP-NURSE-PTDET-CP-02     manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
    # Can not handle data after test
#    Filter Registered Patients    search_by=Patient name     text_search=${patient_name}
#    View Registered Patient Details On    row=1
#    # Baseline information
#    Add Baseline Information    diagnosed_conditions=Angina pectoris     onset_date=today     confirm_via=bioflux      at_risk_conditions=Angina - unstable      notes=Test Input BL information Step 1/7
#    ...  blood_count_date=today     blood_count_summary=Complete blood count Test Summary     function_test_date=today     function_test_summary=Liver function test Summary      leads_ecg_date=today     leads_ecg_summary=12 leads ECG Summary
#    ...  exercise_testing_date=today      exercise_testing_summary=Exercise stress testing Summary      echo_date=today        echo_lvef=95      cha2ds2_vasc_scores=Congestive heart failure, Diabetes mellitus, Sex Female, Age ≥ 75
#    ...  has_bled_clinical_characteristic=Labile INRs, Elderly (Age >65)     ehra_score=Severe - 2      add_framingham_risk_score=True      gender=Male     age=35      smoker=yes    total_cholesterol=100     hdl_cholesterol=70      systolic_bp=50    blood_pressure=yes
#    # Assign nurse to able to input condition information
#    Assign Nurse    me
#    Navigate To Patient Details Tab    Care plan
#    ${conditions_info}      Get Care Plan Conditions Information
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${conditions_info}
#    Run Keyword And Continue On Failure    Should Be True    ['Angina pectoris' in ${conditions_info}[Baseline conditions]]
#    Run Keyword And Continue On Failure    Should Be True    ['Angina - unstable' in ${conditions_info}[Baseline conditions]]
#    # Select Conditions Information
#    Select Care Plan Conditions Information     diagnosed_conditions=Angina pectoris     at_risk_conditions=Angina - unstable
#    ${conditions_info}      Get Care Plan Conditions Information
#    Run Keyword And Continue On Failure    Should Contain      ${conditions_info}[Conditions being monitored][At-risk conditions]      Angina - unstable
#    Run Keyword And Continue On Failure    Should Contain      ${conditions_info}[Conditions being monitored][Diagnosed conditions]    Angina pectoris

BCP-NURSE-PTDET-CP-03: Add Medication
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Click on Start adding medications button
    ...  - Fill out all the required fields with valid value
    ...  - Select Save & add another button
    ...  - Fill out info for another medication
    ...  - Select on Save button
    ...  Expected Output:
    ...  - The medication is saved and displayed on the active medication list
    ...  - The side tab will be closed.
    [Tags]    BCP-NURSE-PTDET-CP-03     manual    inactive
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    Navigate To Patients Active
#    Filter Active Patients      by_patient=All patients    search_by=Patient name     text_search=${PATIENTS}[1]
#    View Active Patient Details On    row=1
#    Navigate To Patient Details Tab    Care plan
#    ${medication1}      Create Dictionary    medication=Capsaicin 0.1% Topical Cream     quantity=90     unit=application(s)     frequency=2 times / day     time_to_take=09:30 AM, 06:30 PM     notes=Add medication 1 test      save_action=Save & add another
#    ${medication2}      Create Dictionary    medication=Zinc oxide 13.44% Topical Lotion      quantity=100     unit=application(s)     frequency=1 time / day     time_to_take=09:30 AM     notes=Add medication 2 test         save_action=Save
#    Open Add Medication Side
#    Add Care Plan Active Medications    save_changes=False         medications=${medication1}  # Add and save & add another
#    Add Care Plan Active Medications    save_changes=True          medications=${medication2}  # Add and save
#    ${msg}    Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${msg}    Add medication successfully.
#    ${act_medi}     Get Care Plan Active Medications
#    ${act_medi}     Evaluate    sorted(${act_medi}, key=lambda x: x['Medication'])        # Asc sort data by medication
#    ${act_medi}     Evaluate    sorted(${act_medi}, key=lambda x: x['Medication'])        # Asc sort data by medication
#    # Medication 1
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Medication]   Capsaicin 0.1% Topical Cream        # Medication
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Quantity]     90 applications / time              # Quantity
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Frequency]    2 times / day (09:30 AM, 06:30 PM)  # Frequency
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Notes]        Add medication 1 test               # Notes
#    # Medication 2
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[1][Medication]   Zinc oxide 13.44% Topical Lotion        # Medication
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[1][Quantity]     100 applications / time                 # Quantity
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[1][Frequency]    1 time / day (09:30 AM)                 # Frequency
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[1][Notes]        Add medication 2 test                   # Notes

BCP-NURSE-PTDET-CP-04: Edit Medication
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - On Care plan tab, click Medication-Active subtab
    ...   - Click Edit medications
    ...   - Add more new medication to the list or edit the one that existed
    ...   - Click Save changes
    ...   Expected Results:
    ...   - The Medication list shall be edited successfully.
    [Tags]    BCP-NURSE-PTDET-CP-04     manual    inactive
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    Navigate To Patients Active
#    Filter Active Patients      by_patient=All patients    search_by=Patient name     text_search=${PATIENTS}[2]
#    View Active Patient Details On    row=1
#    Navigate To Patient Details Tab    Care plan
#    ${medication}      Create Dictionary    medication=Zinc oxide 13.44% Topical Lotion      quantity=100     unit=application(s)     frequency=1 time / day     time_to_take=09:30 AM     notes=Add medication 1 test         save_action=Save
#    Open Add Medication Side
#    Add Care Plan Active Medications    save_changes=True          medications=${medication}  # Add and save
#    ${msg}    Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${msg}    Add medication successfully.
#    ${act_medi}     Get Care Plan Active Medications
#    # Veryfi added medication
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Medication]   Zinc oxide 13.44% Topical Lotion     # Medication
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Quantity]     100 applications / time              # Quantity
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Frequency]    1 time / day (09:30 AM)              # Frequency
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Notes]        Add medication 1 test                # Notes
#    # Edit
#    ${medication_new}      Create Dictionary    quantity=33     unit=application(s)     frequency=2 times / day     time_to_take=09:30 AM, 09:30 PM     notes=Edit medication test
#    Edit Care Plan Medication Active On    medications=${medication_new}        save_changes=True     medication=Zinc oxide 13.44% Topical Lotion      quantity=100 applications / time     frequency=1 time / day (09:30 AM)
#    ${new_act_medi}     Get Care Plan Active Medications
#    # Veryfi edited medication
#    Run Keyword And Continue On Failure    Should Not Be Equal    ${act_medi}       ${new_act_medi}                                    # Old and new medication info
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Medication]       ${new_act_medi}[0][Medication]          # Medication
#    Run Keyword And Continue On Failure    Should Contain     ${new_act_medi}[0][Quantity]     33 applications / time                  # Quantity
#    Run Keyword And Continue On Failure    Should Contain     ${new_act_medi}[0][Frequency]    2 times / day (09:30 AM, 09:30 PM)      # Frequency
#    Run Keyword And Continue On Failure    Should Contain     ${new_act_medi}[0][Notes]        Edit medication test                    # Notes

BCP-NURSE-PTDET-CP-05: Archive Medication
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - On Care plan tab, click Medication-Active subtab
    ...   - Click Archive button on a specific medication
    ...   - Click Save changes button
    ...   Expected Results:
    ...   - The medication shall be archived and displayed on Inactive subtab.
    [Tags]      BCP-NURSE-PTDET-CP-05       manual    inactive
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    Navigate To Patients Active
#    Filter Active Patients      by_patient=All patients    search_by=Patient name     text_search=${PATIENTS}[17]
#    View Active Patient Details On    row=1
#    Navigate To Patient Details Tab    Care plan
#    ${medication1}      Create Dictionary    medication=Capsaicin 0.1% Topical Cream     quantity=90     unit=application(s)     frequency=2 times / day     time_to_take=09:30 AM, 06:30 PM     notes=Add medication 1 test      save_action=Save & add another
#    ${medication2}      Create Dictionary    medication=Zinc oxide 13.44% Topical Lotion      quantity=100     unit=application(s)     frequency=1 time / day     time_to_take=09:30 AM     notes=Add medication 2 test         save_action=Save
#    Open Add Medication Side
#    Add Care Plan Active Medications    save_changes=False         medications=${medication1}  # Add and save & add another
#    Add Care Plan Active Medications    save_changes=True          medications=${medication2}  # Add and save
#    ${msg}    Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${msg}    Add medication successfully.
#    ${act_medi}     Get Care Plan Active Medications
#    ${act_medi}     Evaluate    sorted(${act_medi}, key=lambda x: x['Medication'])        # Asc sort data by medication
#    # Active Medication 1
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Medication]   Capsaicin 0.1% Topical Cream        # Medication
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Quantity]     90 applications / time              # Quantity
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Frequency]    2 times / day (09:30 AM, 06:30 PM)  # Frequency
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Notes]        Add medication 1 test               # Notes
#    # Active Medication 2
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[1][Medication]   Zinc oxide 13.44% Topical Lotion        # Medication
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[1][Quantity]     100 applications / time                 # Quantity
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[1][Frequency]    1 time / day (09:30 AM)                 # Frequency
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[1][Notes]        Add medication 2 test                   # Notes
#    # Archive all
#    Archive Care Plan Active Medication On    row=all
#    ${act_medi}          Get Care Plan Active Medications
#    Run Keyword And Continue On Failure    Should Be Empty    ${act_medi}       # Active medication is empty after archiving all medications
#    ${archived_medi}     Get Care Plan Archived Medications
#    ${archived_medi}     Evaluate    sorted(${archived_medi}, key=lambda x: x['Medication'])        # Asc sort data by medication
#    # Archive Medication 1
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[0][Medication]   Capsaicin 0.1% Topical Cream        # Medication
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[0][Quantity]     90 applications / time              # Quantity
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[0][Frequency]    2 times / day (09:30 AM, 06:30 PM)  # Frequency
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[0][Notes]        Add medication 1 test               # Notes
#    # Archive Medication 2
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[1][Medication]   Zinc oxide 13.44% Topical Lotion        # Medication
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[1][Quantity]     100 applications / time                 # Quantity
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[1][Frequency]    1 time / day (09:30 AM)                 # Frequency
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[1][Notes]        Add medication 2 test                   # Notes
#    ${inact_medi}       Get Care Plan Inactive Medications
#    ${inact_medi}       Evaluate    sorted(${inact_medi}, key=lambda x: x['Medication'])        # Asc sort data by medication
#    # Inactive Medication 1
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[0][Medication]   Capsaicin 0.1% Topical Cream        # Medication
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[0][Quantity]     90 applications / time              # Quantity
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[0][Frequency]    2 times / day (09:30 AM, 06:30 PM)  # Frequency
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[0][Notes]        Add medication 1 test               # Notes
#    # Inactive Medication 2
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[1][Medication]   Zinc oxide 13.44% Topical Lotion        # Medication
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[1][Quantity]     100 applications / time                 # Quantity
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[1][Frequency]    1 time / day (09:30 AM)                 # Frequency
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[1][Notes]        Add medication 2 test                   # Notes

BCP-NURSE-PTDET-CP-06: Prescribe Medication
    [Documentation]     Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - On Care plan tab, click Medication-Active subtab
    ...   - Click Prescribe button on a specific medication
    ...   - Click Save changes button
    ...   Expected Results:
    ...   - The medication shall be prescribed and displayed on Active subtab.
    [Tags]      BCP-NURSE-PTDET-CP-06       manual    inactive
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    Navigate To Patients Active
#    Filter Active Patients      by_patient=All patients    search_by=Patient name     text_search=${PATIENTS}[18]
#    View Active Patient Details On    row=1
#    Navigate To Patient Details Tab    Care plan
#    ${medication}      Create Dictionary    medication=Capsaicin 0.1% Topical Cream     quantity=90     unit=application(s)     frequency=2 times / day     time_to_take=09:30 AM, 06:30 PM     notes=Add medication 1 test      save_action=Save
#    Open Add Medication Side
#    Add Care Plan Active Medications    save_changes=True         medications=${medication}  # Add and save
#    ${msg}    Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${msg}    Add medication successfully.
#    ${act_medi}     Get Care Plan Active Medications
#    # Active Medication
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Medication]   Capsaicin 0.1% Topical Cream        # Medication
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Quantity]     90 applications / time              # Quantity
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Frequency]    2 times / day (09:30 AM, 06:30 PM)  # Frequency
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Notes]        Add medication 1 test               # Notes
#    # Archive all
#    Archive Care Plan Active Medication On    row=all
#    ${act_medi}          Get Care Plan Active Medications
#    Run Keyword And Continue On Failure    Should Be Empty    ${act_medi}     # Active medication is empty after archiving all medications
#    ${archived_medi}     Get Care Plan Archived Medications
#    # Archive Medication
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[0][Medication]   Capsaicin 0.1% Topical Cream        # Medication
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[0][Quantity]     90 applications / time              # Quantity
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[0][Frequency]    2 times / day (09:30 AM, 06:30 PM)  # Frequency
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[0][Notes]        Add medication 1 test               # Notes
#    # Prescribe
#    ${medi_to_prescribe}      Create Dictionary    quantity=90     unit=cap(s)     frequency=2 times / day     time_to_take=10:30 AM, 09:30 PM     notes=Prescribe medication test
#    Prescribe Care Plan Inactive Medication On     medications=${medi_to_prescribe}        save_changes=True          row=1         # Prescribe medication
#    # Get active medication and verify
#    ${act_medi}          Get Care Plan Active Medications
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${act_medi}
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Medication]   Capsaicin 0.1% Topical Cream             # Medication
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Quantity]     90 caps / time                           # Quantity
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Frequency]    2 times / day  (10:30 AM, 09:30 PM)      # Frequency
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Notes]        Prescribe medication test                # Notes

BCP-NURSE-PTDET-CP-07: Delete Medication
    [Documentation]     Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - On Care plan tab, click Medication-Inactive subtab
    ...   - Click Delete button on a specific medication
    ...   - Click Delete button on the confirmation pop-up
    ...   Expected Results:
    ...   - The medication shall be deleted from the list.
    [Tags]      BCP-NURSE-PTDET-CP-07   manual    inactive
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    Navigate To Patients Active
#    Filter Active Patients      by_patient=All patients    search_by=Patient name     text_search=${PATIENTS}[19]
#    View Active Patient Details On    row=1
#    Navigate To Patient Details Tab    Care plan
#    ${medication1}      Create Dictionary    medication=Capsaicin 0.1% Topical Cream     quantity=90     unit=application(s)     frequency=2 times / day     time_to_take=09:30 AM, 06:30 PM     notes=Add medication 1 test      save_action=Save & add another
#    ${medication2}      Create Dictionary    medication=Zinc oxide 13.44% Topical Lotion      quantity=100     unit=application(s)     frequency=1 time / day     time_to_take=09:30 AM     notes=Add medication 2 test         save_action=Save
#    Open Add Medication Side
#    Add Care Plan Active Medications    save_changes=False         medications=${medication1}  # Add and save & add another
#    Add Care Plan Active Medications    save_changes=True          medications=${medication2}  # Add and save
#    ${msg}    Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${msg}    Add medication successfully.
#    ${act_medi}     Get Care Plan Active Medications
#    ${act_medi}     Evaluate    sorted(${act_medi}, key=lambda x: x['Medication'])        # Asc sort data by medication
#    # Active Medication 1
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Medication]   Capsaicin 0.1% Topical Cream        # Medication
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Quantity]     90 applications / time              # Quantity
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Frequency]    2 times / day (09:30 AM, 06:30 PM)  # Frequency
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[0][Notes]        Add medication 1 test               # Notes
#    # Active Medication 2
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[1][Medication]   Zinc oxide 13.44% Topical Lotion        # Medication
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[1][Quantity]     100 applications / time                 # Quantity
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[1][Frequency]    1 time / day (09:30 AM)                 # Frequency
#    Run Keyword And Continue On Failure    Should Contain     ${act_medi}[1][Notes]        Add medication 2 test                   # Notes
#    # Archive all
#    Archive Care Plan Active Medication On    row=all
#    ${act_medi}          Get Care Plan Active Medications
#    Run Keyword And Continue On Failure    Should Be Empty    ${act_medi}       # Active medication is empty after archiving all medications
#    ${archived_medi}     Get Care Plan Archived Medications
#    ${archived_medi}     Evaluate    sorted(${archived_medi}, key=lambda x: x['Medication'])        # Asc sort data by medication
#    # Inactive Medication 1
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[0][Medication]   Capsaicin 0.1% Topical Cream        # Medication
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[0][Quantity]     90 applications / time              # Quantity
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[0][Frequency]    2 times / day (09:30 AM, 06:30 PM)  # Frequency
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[0][Notes]        Add medication 1 test               # Notes
#    # Inactive Medication 2
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[1][Medication]   Zinc oxide 13.44% Topical Lotion        # Medication
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[1][Quantity]     100 applications / time                 # Quantity
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[1][Frequency]    1 time / day (09:30 AM)                 # Frequency
#    Run Keyword And Continue On Failure    Should Contain     ${archived_medi}[1][Notes]        Add medication 2 test                   # Notes
#    ${inact_medi}        Get Care Plan Inactive Medications
#    Run Keyword And Continue On Failure    Should Not Be Empty       ${inact_medi}      # Inactive medications should not be empty
#    # Delete all
#    Delete All The Medications      ${PATIENTS}[19]
#    ${message}      Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${message}     Delete medication successfully.
#    ${inact_medi}        Get Care Plan Inactive Medications
#    Run Keyword And Continue On Failure    Should Be Empty    ${inact_medi}             # Inactive medications should not be empty after deleting all records

BCP-NURSE-PTDET-CP-08: Edit Report settings
    [Documentation]    Author: Hoang Le
    ...
    ...  Test Steps:
    ...  - Select item(s) to display
    ...  - Edit min-max of Vital signs range
    ...  - Edit min-max of Sleep & activity
    ...  - Edit consecutive days of medication nonadherence
    ...  - Edit consecutive days with symptoms
    ...  - Edit notes
    ...  Expected Output:
    ...  - The selected item(s) will be displayed as a section on Notification report triggers screen
    ...  - Maximum value must be greater than or equal to the minimum one
    ...  - The consecutive days must be between 1-7 days
    ...  - The consecutive days must be between 1-7 days
    ...  - The consecutive days must be between 1-7 days
    ...  - This section is not required.
    [Tags]    BCP-NURSE-PTDET-CP-08     manual
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-CP-09: Upload a consent file in PDF/PNG/JPG format for a New/Active patient's care plan
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to New/Active patients page
    ...   - Select on a specific patient's row on the New/Active care plan list
    ...   - On patient details page, select Care plan tab
    ...   - On Care plan tab, select Consent forms subtab
    ...   - On Consent forms subtab, click Upload consent button
    ...   - Pick any valid file from user's computer then add to this tab
    ...   Expected Results:
    ...   - A snack bar is displayed
    ...   - The file shall be uploaded successfully and displayed on the Consent forms subtab.
    [Tags]    BCP-NURSE-PTDET-CP-09     manual
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}
#    Navigate To Patients New
#    Filter Registered Patients    search_by=Patient name     text_search=${patient_name}
#    View Registered Patient Details On    row=1
#    Navigate To Patient Details Tab    Care plan
#    # JPG file
#    ${msg}  Upload Care Plan Consent File    file_path=project_cardiac_portal/test/data/CCM_consent.jpg
#    Run Keyword And Continue On Failure    Should Be Equal     ${msg}    CCM consent was uploaded successfully!

BCP-NURSE-PTDET-CP-10: Upload a consent file in another format(s) for a New/Active patient's care plan
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to New/Active patients page
    ...   - Select on a specific patient's row on the New/Active care plan list
    ...   - On patient details page, select Care plan tab
    ...   - On Care plan tab, select Consent forms subtab
    ...   - On Consent forms subtab, click Upload consent button
    ...   - Pick any file not in PDF/PNG/JPG foramt from user's computer then add to this tab
    ...   Expected Results:
    ...   - Error message is displayed
    ...   - The file can not be chose.
    [Tags]    BCP-NURSE-PTDET-CP-10     manual
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}
#    Navigate To Patients New
#    Filter Registered Patients    search_by=Patient name     text_search=${patient_name}
#    View Registered Patient Details On    row=1
#    Navigate To Patient Details Tab    Care plan
#    # auto generate and upload
#    ${msg}  Upload Care Plan Consent File By Automatically Generate File    file_name=consent_upload.jfif
#    Run Keyword And Continue On Failure    Should Be Equal     ${msg}    Invalid file type

BCP-NURSE-PTDET-CP-11: Upload a consent file under 4MB
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to New/Active patients page
    ...   - Select on a specific patient's row on the New/Active care plan list
    ...   - On patient details page, select Care plan tab
    ...   - On Care plan tab, select Consent forms subtab
    ...   - On Consent forms subtab, click Upload consent button
    ...   - Pick any file that under 4MB from user's computer then add to this tab
    ...   Expected Results:
    ...   - A snack bar is displayed
    ...   - The file shall be uploaded successfully and displayed on the Consent forms subtab.
    [Tags]    BCP-NURSE-PTDET-CP-11     manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-CP-12: Upload a consent file larger than 4MB
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to New/Active patients page
    ...   - Select on a specific patient's row on the New/Active care plan list
    ...   - On patient details page, select Care plan tab
    ...   - On Care plan tab, select Consent forms subtab
    ...   - On Consent forms subtab, click Upload consent button
    ...   - Pick any file that under 4MB from user's computer then add to this tab
    ...   Expected Results:
    ...   - A snack bar is displayed
    ...   - The system will automatically resize it to meet the requirement and upload it successfully.
    [Tags]    BCP-NURSE-PTDET-CP-12     manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-CP-13: Update a consent file in PDF/PNG/JPG format for a New/Active patient's care plan
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to New/Active patients page
    ...   - Select on a specific patient's row on the New/Active care plan list
    ...   - On patient details page, select Care plan tab
    ...   - On Care plan tab, select Consent forms subtab
    ...   - On Consent forms subtab, click Update consent button
    ...   - Pick any valid file from user's computer then add to this tab
    ...   Expected Results:
    ...   - A snack bar is displayed
    ...   - The file shall be uploaded successfully and displayed on the Consent forms subtab.
    [Tags]    BCP-NURSE-PTDET-CP-13     manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    Navigate To Patients New
#    Filter Registered Patients    search_by=Patient name     text_search=${PATIENTS}[10]
#    View Registered Patient Details On    row=1
#    Navigate To Patient Details Tab    Care plan
#    # JPG file
#    ${msg}  Upload Care Plan Consent File    file_path=project_cardiac_portal/test/data/CCM_consent.jpg
#    Run Keyword And Continue On Failure    Should Be Equal     ${msg}    CCM consent was uploaded successfully!
#    # PDF file
#    ${msg}  Upload Care Plan Consent File    file_path=project_cardiac_portal/test/data/CCM_consent.pdf
#    Run Keyword And Continue On Failure    Should Be Equal     ${msg}    CCM consent was updated successfully!
#    # PNG file
#    ${msg}  Upload Care Plan Consent File    file_path=project_cardiac_portal/test/data/CCM_consent.png
#    Run Keyword And Continue On Failure    Should Be Equal     ${msg}    CCM consent was updated successfully!

BCP-NURSE-PTDET-CP-14: Update a consent file in another format(s) for a New/Active patient's care plan
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to New/Active patients page
    ...   - Select on a specific patient's row on the New/Active care plan list
    ...   - On patient details page, select Care plan tab
    ...   - On Care plan tab, select Consent forms subtab
    ...   - On Consent forms subtab, click Update consent button
    ...   - Pick any file not in PDF/PNG/JPG foramt from user's computer then add to this tab
    ...   Expected Results:
    ...   - Error message is displayed
    ...   - The file can not be chose.
    [Tags]    BCP-NURSE-PTDET-CP-14     manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    Navigate To Patients New
#    Filter Registered Patients    search_by=Patient name     text_search=${PATIENTS}[10]
#    View Registered Patient Details On    row=1
#    Navigate To Patient Details Tab    Care plan
#    # Upload
#    ${msg}  Upload Care Plan Consent File    file_path=project_cardiac_portal/test/data/CCM_consent.pdf
#    Run Keyword And Continue On Failure    Should Be Equal     ${msg}       CCM consent was uploaded successfully!
#    Back From Patient Details
#    Navigate To Patients New
#    Filter Registered Patients    search_by=Patient name     text_search=${PATIENTS}[10]
#    View Registered Patient Details On    row=1
#    Navigate To Patient Details Tab    Care plan
#    # Update invalid type file
#    ${msg}  Upload Care Plan Consent File By Automatically Generate File    file_name=consent_test.txt
#    Run Keyword And Continue On Failure    Should Be Equal     ${msg}       Invalid file type

BCP-NURSE-PTDET-CP-15: Update a consent file under 4MB
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to New/Active patients page
    ...   - Select on a specific patient's row on the New/Active care plan list
    ...   - On patient details page, select Care plan tab
    ...   - On Care plan tab, select Consent forms subtab
    ...   - On Consent forms subtab, click Update consent button
    ...   - Pick any file that under 4MB from user's computer then add to this tab
    ...   Expected Results:
    ...   - A snack bar is displayed
    ...   - The file shall be uploaded successfully and displayed on the Consent forms subtab.
    [Tags]    BCP-NURSE-PTDET-CP-15     manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-CP-16: Update a consent file larger than 4MB
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to New/Active patients page
    ...   - Select on a specific patient's row on the New/Active care plan list
    ...   - On patient details page, select Care plan tab
    ...   - On Care plan tab, select Consent forms subtab
    ...   - On Consent forms subtab, click Update consent button
    ...   - Pick any file that under 4MB from user's computer then add to this tab
    ...   Expected Results:
    ...   - A snack bar is displayed
    ...   - The system will automatically resize it to meet the requirement and upload it successfully.
    [Tags]    BCP-NURSE-PTDET-CP-16     manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-CP-17: Download a consent file
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to New/Active patients page
    ...   - Select on a specific patient's row on the New/Active care plan list
    ...   - On patient details page, select Care plan tab
    ...   - On Care plan tab, select Consent forms subtab
    ...   - On Consent forms subtab, Download button
    ...   Expected Results:
    ...   - A consent file will be downloaded successfully with the "CCM consent - Patient name" file name.
    [Tags]     BCP-NURSE-PTDET-CP-17     manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-CP-18: Set weight gain or loss as ON
    [Documentation]    Author: Hoang Le
    ...
    ...  Test Steps:
    ...  1. Go to patient details page
    ...  2. Assign a nurse for the care plan
    ...  3. Select Care plan tab
    ...  4. Select Report settings sub-tab
    ...  5. Click Edit report settings button
    ...  6. From the item dropdown, click the Weight gain/loss check boxes
    ...  7. Click Save button
    ...  Expected results:
    ...  - The Weight section is hidden as default
    ...  - The default value of weight gain/loss in 1 day is >=2
    ...  - The default value of weight gain/loss in 7 days is >=5
    ...  - A notification report shall be triggered if the weight range is reached out of the approval range as user set in this section
    [Tags]    BCP-NURSE-PTDET-CP-18    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-CP-19: Set weight gain or loss as OFF
    [Documentation]    Author: Hoang Le
    ...
    ...  Test Steps:
    ...  1. Go to patient details page
    ...  2. Select Care plan tab
    ...  3. Select Report settings sub-tab
    ...  4. Click Edit report settings button
    ...  5. From the item dropdown, untick the Weight gain/loss check boxes
    ...  6. Click Save button
    ...  Expected results:
    ...  - The Weight section shall be hidden
    ...  - No notification report will be triggered if there is any patient’s abnormal range of weight reached out
    [Tags]    BCP-NURSE-PTDET-CP-19    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-CP-20: Set weight gain or weight loss as ON
    [Documentation]    Author: Hoang Le
    ...
    ...  Test Steps:
    ...  1. Go to patient details page
    ...  2. Select Care plan tab
    ...  3. Select Report settings sub-tab
    ...  4. Click Edit report settings button
    ...  5. Tick one of the weight gain or loss check box only
    ...  6. Click Save button
    ...  Expected results:
    ...  - The item which is selected shall be displayed, and the other one shall be hidden
    ...  - The default value shall be displayed as >=2 or >=5 depends on which item user turns on
    ...  - A notification report shall be triggered if there is any abnormal weight range of which item user turns on in this section
    [Tags]    BCP-NURSE-PTDET-CP-20   manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-CP-21: Collapse patient brief info for patient has linked care plan
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Scroll down the page
    ...  2. Click on ... box
    ...  3. Scroll up the page
    ...  Expected Output:
    ...  - The collapsed header includes the following information: Profile picture, First name and last name, Plan type tag, Care plan ID, Date of birth & Age, Gender, Notes
    ...  - In step 2,
    ...   + For CCM or CCM&RPM plan type, it will display 3 fields: Switch to RPM, Schedule new appointment, Stop care plan.
    ...   + For RPM plan type, it will display 3 fields: Switch to CCM, Schedule new appointment, Stop care plan.
    ...  - In step 3, the brief info header will be expanded
    [Tags]    BCP-NURSE-PTDET-CP-21   manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-CP-22: Collapse patient brief info for patient has not linked care plan
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Scroll down the page
    ...  2. Click on ... box
    ...  3. Scroll up the page
    ...  Expected Output:
    ...  - The collapsed header includes the following information: Profile picture, First name and last name, Plan type tag, Care plan ID, Date of birth & Age, Gender, Notes
    ...  - In step 2,
    ...   + For CCM or CCM&RPM plan type, it will display 4 fields: Switch to RPM, Resend Reference code, Schedule new appointment, Stop care plan.
    ...   + For RPM plan type, it will display 4 fields: Switch to CCM, Resend Reference code, Schedule new appointment, Stop care plan.
    ...  - In step 3, the brief info header will be expanded
    [Tags]    BCP-NURSE-PTDET-CP-22   manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-CP-23: Collapse patient brief info for patient which has missing info
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Scroll down the page
    ...  2. Click on ... box
    ...  3. Hover the missing info tag
    ...  4. Scroll up the page
    ...  Expected Output:
    ...  - The collapsed header includes the following information: Profile picture, First name and last name, Plan type tag, Missing info tag, Care plan ID, Date of birth & Age, Gender, Notes
    ...  - In step 2,
    ...   + For CCM or CCM&RPM plan type, it will display 3 fields: Switch to RPM, Schedule new appointment, Stop care plan.
    ...   + For RPM plan type, it will display 3 fields: Switch to CCM, Schedule new appointment, Stop care plan.
    ...  - In step 3, the type of information is missing will display
    ...  - In step 4, the brief info header will be expanded
    [Tags]    BCP-NURSE-PTDET-CP-23   manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-CP-24: Collapse patient brief info for patient which has deleted their account
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Scroll down the page
    ...  2. Click on ... box
    ...  3. Hover the exclamation mark symbol
    ...  4. Scroll up the page
    ...  Expected Output:
    ...  - The collapsed header includes the following information: Profile picture, First name and last name, Plan type tag, Patient deletes account tag, Care plan ID, Date of birth & Age, Gender, Note
    ...  - In step 2,
    ...   + For CCM or CCM&RPM plan type, it will display 3 fields: Switch to RPM, Schedule new appointment, Stop care plan.
    ...   + For RPM plan type, it will display 3 fields: Switch to CCM, Schedule new appointment, Stop care plan.
    ...  - In step 3, the deleted date will display
    ...  - In step 4, the brief info header will be expanded
    [Tags]    BCP-NURSE-PTDET-CP-24   manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-CP-25: Collapse patient brief info for patient which has missing info and has deleted their account
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Scroll down the page
    ...  2. Click on ... box
    ...  3. Hover the missing info tag
    ...  4. Hover the exclamation mark symbol
    ...  5. Scroll up the page
    ...  Expected Output:
    ...  - The collapsed header includes the following information: Profile picture, First name and last name, Plan type tag, Patient deletes account tag, Care plan ID, Date of birth & Age, Gender, Note
    ...  - In step 2,
    ...   + For CCM or CCM&RPM plan type, it will display 3 fields: Switch to RPM, Schedule new appointment, Stop care plan.
    ...   + For RPM plan type, it will display 3 fields: Switch to CCM, Schedule new appointment, Stop care plan.
    ...  - In step 3, the type of information is missing will display
    ...  - In step 4, the deleted date will display
    ...  - In step 5, the brief info header will be expanded
    [Tags]    BCP-NURSE-PTDET-CP-25   manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

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
    # Delete medications after suite
    Delete All The Medications       ${PATIENTS}[1]
    Delete All The Medications       ${PATIENTS}[2]
    Delete All The Medications       ${PATIENTS}[17]
    Delete All The Medications       ${PATIENTS}[18]
    Quit Browser

Delete All The Medications
    # Delete the medication from existing active record
    [Arguments]    ${patient_name}
    Navigate To Patients Active
    Filter Active Patients    by_patient=All patients       search_by=Patient name      text_search=${patient_name}
    View Active Patient Details On     row=1
    Navigate To Patient Details Tab    Care plan
    ${active_medication}        Get Care Plan Active Medications
    ${is_empty}     Run Keyword And Return Status    Should Be Empty    ${active_medication}
    Run Keyword If     '${is_empty}' == 'False'     Run Keywords
    ...  Archive Care Plan Active Medication On     row=all
    ...  AND    Delete Care Plan Inactive Medication On     row=all
    ${inactive_medication}      Get Care Plan Inactive Medications
    ${is_empty}     Run Keyword And Return Status    Should Be Empty    ${inactive_medication}
    Run Keyword If     '${is_empty}' == 'False'    Run Keyword
    ...  Delete Care Plan Inactive Medication On    row=all
    Back From Patient Details   # Handle Leave site when logs not be saved
