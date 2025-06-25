*** Settings ***
Documentation   Cardiac Patients - Baseline info test suite
Metadata    sid     BCP-NURSE-PTDET-BASELINE
Metadata    owner   Khang Nguyen
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/PatientsNew.py
#Library     project_cardiac_portal/lib/web/Templates.py
#Library     project_cardiac_portal/lib/web/PatientDetails.py
#Library     project_cardiac_portal/lib/web/Appointment.py
#Library     project_cardiac_portal/lib/web/PatientsActive.py
#Library     project_cardiac_portal/lib/web/PatientsInactive.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-NURSE-PTDET-BASELINE        web
Test Timeout    1h

*** Test Cases ***
BCP-NURSE-PTDET-BASELINE-01: Input Baseline Info
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Select on Input baseline info button
    ...  - Fill out all the required fields with valid value
    ...  - Select on Finish button
    ...  Exected Output:
    ...  - The baseline info shall be saved and displayed
    [Tags]    BCP-NURSE-PTDET-BASELINE-01       manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
    # Can not delete this after done test
#    Filter Registered Patients    search_by=Patient name     text_search=${patient_name}
#    View Registered Patient Details On    row=1
#    Add Baseline Information    diagnosed_conditions=Angina pectoris     onset_date=09/12/2022     confirm_via=bioflux      at_risk_conditions=Angina - unstable, Atrial arrhythmias, Atrial Fibrillatio      notes=Test Input BL information Step 1/7
#    ...  blood_count_date=09/15/2022     blood_count_summary=Complete blood count Test Summary     function_test_date=09/08/2022     function_test_summary=Liver function test Summary      leads_ecg_date=09/15/2022     leads_ecg_summary=12 leads ECG Summary
#    ...  exercise_testing_date=09/15/2022      exercise_testing_summary=Exercise stress testing Summary      echo_date=09/12/2022        echo_lvef=95      cha2ds2_vasc_scores=Congestive heart failure, Diabetes mellitus, Sex Female, Age ≥ 75
#    ...  has_bled_clinical_characteristic=Labile INRs, Elderly (Age >65)     ehra_score=Severe - 2      add_framingham_risk_score=True      gender=Male     age=35      smoker=yes    total_cholesterol=100     hdl_cholesterol=70      systolic_bp=50    blood_pressure=yes
#    ${bl_data}     Get Patient Details Baseline Info
#    # Verify
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${bl_data}
#    # Diagnosed conditions: 1
#    Run Keyword And Continue On Failure    Should Contain    ${bl_data}     Angina pectoris
#    Run Keyword And Continue On Failure    Should Contain    ${bl_data}     09/12/2022      # Onset date
#    Run Keyword And Continue On Failure    Should Contain    ${bl_data}     Bioflux     #Confirmed via
#    Run Keyword And Continue On Failure    Should Contain    ${bl_data}     • Angina - unstable\n• Atrial arrhythmias\n• Other: Atrial Fibrillatio      #At-risk conditions
#    Run Keyword And Continue On Failure    Should Contain    ${bl_data}     Test Input BL information Step 1/7      #Notes
#    # Complete blood count
#    Run Keyword And Continue On Failure    Should Contain    ${bl_data}     09/15/2022      #Notes
#    Run Keyword And Continue On Failure    Should Contain    ${bl_data}     Complete blood count Test Summary      #Summary
#    # Liver function test
#    Run Keyword And Continue On Failure    Should Contain    ${bl_data}     09/08/2022      #Date
#    Run Keyword And Continue On Failure    Should Contain    ${bl_data}     Liver function test Summary      #Summary
#    # 12-lead ECG
#    Run Keyword And Continue On Failure    Should Contain    ${bl_data}     09/08/2022      #Date
#    Run Keyword And Continue On Failure    Should Contain    ${bl_data}     12 leads ECG Summary      #Summary
#    # Exercise stress testing
#    Run Keyword And Continue On Failure    Should Contain    ${bl_data}     09/15/2022      #Date
#    Run Keyword And Continue On Failure    Should Contain    ${bl_data}     Exercise stress testing Summary      #Summary
#    # Echocardiogram
#    Run Keyword And Continue On Failure    Should Contain    ${bl_data}     09/12/2022      #Date
#    Run Keyword And Continue On Failure    Should Contain    ${bl_data}     95 %      #LVEF
#    # Scoring (Value | Score | Risk factors)
#    Run Keyword And Continue On Failure    Should Contain    ${bl_data}     ChA2DS2-VASc\n5\n6.7%
#    Run Keyword And Continue On Failure    Should Contain    ${bl_data}     HAS-BLED\n2\nRisk was 4.1% in one validation study (Lip 2011) and 1.88 bleeds per 100 patient-years in another validation study (Pisters 2010).
#    ...  \n\nAnticoagulation should be considered: Patient has a relatively low risk for major bleeding (~2/100 patient-years).
#    Run Keyword And Continue On Failure    Should Contain    ${bl_data}     EHRA\n2\nSevere
#    Run Keyword And Continue On Failure    Should Contain    ${bl_data}     FRS\n8\n10 years CVD risk: 6.7%\nHeart age: 48 years\nRisk: Low

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
