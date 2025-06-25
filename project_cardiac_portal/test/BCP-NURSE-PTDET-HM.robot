*** Settings ***
Documentation   Cardiac Patient Details page > Heart Monitor test suite
Metadata    sid     BCP-NURSE-PTDET-HM
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/PatientDetails.py
#Library      project_cardiac_portal/lib/web/HeartMonitorStudy.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-NURSE-PTDET-HM      web
Test Timeout    1h

*** Test Cases ***
BCP-NURSE-PTDET-HM-01: Prescribe A Bioflux Heart Study
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Click on Prescribe new study
    ...  - Select Study type as MCT/MCT PEEK/HOLTER/EXTENDED HOLTER/CARDIAC EVENT
    ...  - Input Study duration in a allowed range depends on Study type
    ...  - Fill out all the rest fields with valid value
    ...  - Click Add study
    ...  Expected Output:
    ...  - The study prescription card is displayed
    [Tags]    BCP-NURSE-PTDET-HM-01     manual    inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    # Patient active
#    Navigate To Patients Active
#    Filter Active Patients    by_patient=All patients    search_by=Patient name      text_search=${PATIENTS}[1]
#    View Active Patient Details On    row=1
#    Navigate To Patient Details Tab    tab=Heart monitor
#    # Prescribe study
#    Prescribe New Study   use_biodirect=True    device=bioflux    study_type=MCT - 93228-29    study_duration=3    primary_diagnosis_code=I49.5 - Sick sinus syndrome      secondary_diagnosis_code=I49.8 - Other specified cardiac arrhythmias
#    ...  notes=Physician amendments notes (optional) Test
#    ${pre_study}      Get Patient Details Heart Monitor Current Study
#    Run Keyword And Continue On Failure     Should Not Contain    ${pre_study}      There is no study yet
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      New study prescribed!
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      Service type | Biodirect
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      Device model | Bioflux
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      Study type | MCT
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      Study duration | 3 days
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      Primary diagnosis code | I49.5 - Sick sinus syndrome
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      Secondary diagnosis code | I49.8 - Other specified cardiac arrhythmias
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      PHYSICIAN AMENDMENTS NOTES | Physician amendments notes (optional) Test

BCP-NURSE-PTDET-HM-02: Prescribe A Biotres Heart Study
    [Documentation]     Author: Hoang Le
    ...
    ...   Test Steps:
    ...  - Click on Prescribe new study
    ...  - Select Study type as HOLTER/EXTENDED HOLTER
    ...  - Input Study duration in a allowed range depends on Study type
    ...  - Fill out all the rest fields with valid value
    ...  - Click Add study
    ...  Expected Output:
    ...  - The study prescription card is displayed
    [Tags]    BCP-NURSE-PTDET-HM-02     manual    inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    # Patient active
#    Navigate To Patients Active
#    Filter Active Patients    by_patient=All patients    search_by=Patient name      text_search=${PATIENTS}[2]
#    View Active Patient Details On    row=1
#    Navigate To Patient Details Tab    tab=Heart monitor
#    # Prescribe study
#    Prescribe New Study   use_biodirect=True    device=Biotres    study_type=EXTENDED HOLTER - 93241 - 93247    study_duration=3    primary_diagnosis_code=I49.5 - Sick sinus syndrome      secondary_diagnosis_code=I49.8 - Other specified cardiac arrhythmias
#    ...  notes=Physician amendments notes (optional) Test
#    ${pre_study}      Get Patient Details Heart Monitor Current Study
#    Run Keyword And Continue On Failure     Should Not Contain    ${pre_study}      There is no study yet
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      New study prescribed!
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      Service type | Biodirect
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      Device model | Biotres
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      Study type | EXTENDED HOLTER
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      Study duration | 3 days
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      Primary diagnosis code | I49.5 - Sick sinus syndrome
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      Secondary diagnosis code | I49.8 - Other specified cardiac arrhythmias
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      PHYSICIAN AMENDMENTS NOTES | Physician amendments notes (optional) Test

BCP-NURSE-PTDET-HM-03: Create A Heart Study
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Select Create study button
    ...  - Fill out all the required fields with valid value
    ...  - Click Initate
    ...  Expected Output:
    ...  - The study will be initated successfully
    ...  - The study is displayed with On-going status
    [Tags]    BCP-NURSE-PTDET-HM-03     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    # Patient active
#    Navigate To Patients Active
#    Filter Active Patients    by_patient=My patients    search_by=Patient name      text_search=${patient_name}
#    View Active Patient Details On    row=1
#    Navigate To Patient Details Tab    tab=Heart monitor
#    # Prescribe study
#    Prescribe New Study   use_biodirect=True    device=Biotres    study_type=EXTENDED HOLTER - 93241 - 93247    study_duration=3    primary_diagnosis_code=I49.5 - Sick sinus syndrome      secondary_diagnosis_code=I49.8 - Other specified cardiac arrhythmias
#    ...  notes=Physician amendments notes (optional) Test
#    ${pre_study}      Get Patient Details Heart Monitor Current Study
#    Run Keyword And Continue On Failure     Should Not Contain    ${pre_study}      There is no study yet
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      New study prescribed!
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      Service type | Biodirect
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      Device model | Biotres
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      Study type | EXTENDED HOLTER
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      Study duration | 3 days
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      Primary diagnosis code | I49.5 - Sick sinus syndrome
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      Secondary diagnosis code | I49.8 - Other specified cardiac arrhythmias
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      PHYSICIAN AMENDMENTS NOTES | Physician amendments notes (optional) Test
#    # Heart study
#    ${secondary_contact}      Create Dictionary     name=Sister Name     relationship=Sister    phone_number=0999995555     email=Jane01@yopmail.com
#    Create Heart Monitor Study    patient_id=HM-03      pacemaker=Yes    secondary_phone_number=06667555589      secondary_contact=${secondary_contact}      use_biodirect=True      device_type=Bioflux     interpreting_physician=${PHY_ACT}[name]
#    ...  referring_physician=${PHY_NACT}[name]      study_type=HOLTER - 93224-27      study_duration=3      patient_return_visit=today      clinician_initials=Jept     primary_diagnosis_code=R00.2 - Palpitations     secondary_diagnosis_code=R00.2 - Palpitations
#    ...  patient_medication=Patient medication Test     physician_amend_notes=Physician amendments notes      insurance_provider=US     insurance_pre_auth_required=yes     medication_symptoms=Palpitations, Feeling clammy/sweaty     medication_symptom_answer1=From 6 to 12
#    ...  medication_symptom_answer2=no
#    ${message}      Get Success Message
#    Run Keyword And Continue On Failure     Should Be Equal    ${message}    Create study successfully!
#    ${heart_study}    Get Patient Details Heart Monitor Current Study
#    Run Keyword And Continue On Failure     Should Not Be Equal    ${heart_study}      ${pre_study}
#    Run Keyword And Continue On Failure     Should Not Contain     ${heart_study}      There is no study yet
#    Run Keyword And Continue On Failure     Should Contain     ${heart_study}      Not started      # State of study
#    Run Keyword And Continue On Failure     Should Contain     ${heart_study}      Patient ID | HM-03
#    Run Keyword And Continue On Failure     Should Contain     ${heart_study}      Service type | Biodirect
#    Run Keyword And Continue On Failure     Should Contain     ${heart_study}      Study type | HOLTER
#    Run Keyword And Continue On Failure     Should Contain     ${heart_study}      Study duration | 3 days

BCP-NURSE-PTDET-HM-04: Resend Biotres Reference Code
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Click on Resend button on the heart study card or study information side tab bar
    ...  - Select on Resend button
    ...  Expected Output:
    ...  - A reference code will be resent to patient's email
    [Tags]    BCP-NURSE-PTDET-HM-04     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}


BCP-NURSE-PTDET-HM-05: Stop An On-Going Heart Study
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Click stop study on the study card
    ...  Expected Output:
    ...  - The study will be uploaded and changed to Completed status
    [Tags]    BCP-NURSE-PTDET-HM-05     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-PTDET-HM-06: Cancel A Study Prescription
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - On the study prescription card, select Cancel
    ...  - Select Yes
    ...  Expected Output:
    ...  - A study prescription will be canceled and deleted from the current study tab
    [Tags]    BCP-NURSE-PTDET-HM-06     manual    inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    # Patient active
#    Navigate To Patients Active
#    Filter Active Patients    by_patient=All patients    search_by=Patient name      text_search=${PATIENTS}[19]
#    View Active Patient Details On    row=1
#    Navigate To Patient Details Tab    tab=Heart monitor
#    # Prescribe study
#    Prescribe New Study   use_biodirect=True    device=bioflux    study_type=MCT - 93228-29    study_duration=3    primary_diagnosis_code=I49.5 - Sick sinus syndrome      secondary_diagnosis_code=I49.8 - Other specified cardiac arrhythmias
#    ...  notes=Physician amendments notes (optional) Test
#    ${pre_study}      Get Patient Details Heart Monitor Current Study
#    Run Keyword And Continue On Failure     Should Not Contain    ${pre_study}      There is no study yet
#    Cancel Study Prescription
#    ${msg}      Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${msg}     Study prescription has been canceled successfully!
#    ${pre_study}      Get Patient Details Heart Monitor Current Study
#    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      There is no study yet

BCP-NURSE-PTDET-HM-07: Enable Bioheart Monitor
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Click on Enable button
    ...  - Set frequency for generating reports
    ...  - Click Enable on the modal
    ...  Expected Output:
    ...  - Bioheart monitor is enabled successfully with the selected frequency
    [Tags]    BCP-NURSE-PTDET-HM-07     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-PTDET-HM-08: Retry Generating A Bioheart Report Successfully
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Select 'Retry' button from a specific report row that generated failed
    ...  - Check while the report is being generated
    ...  - Check when report is re-generated success
    ...  Expected Output:
    ...  - The status of the report shall be changed to 'empty'
    ...  - The 'Retry' button wont be displayed
    [Tags]    BCP-NURSE-PTDET-HM-08     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-PTDET-HM-09: Disable Bioheart Monitor
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Go to Bioheart monitor tab on a specific patient details page
    ...  - Click Edit button on the Bioheart monitor page
    ...  - Click Disable
    ...  - Click Disable again
    ...  Expected Output:
    ...  - Disable monitor successfully
    [Tags]    BCP-NURSE-PTDET-HM-09     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-PTDET-HM-10: Edit Frequency
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Click Edit button on the Bioheart monitor page
    ...  - Change the report frequency
    ...  - Click Save button
    ...  Expected Output:
    ...  - The report frequency will be updated successfully
    [Tags]    BCP-NURSE-PTDET-HM-10     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-PTDET-HM-11: Collapse patient brief info for patient has linked care plan
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
    [Tags]    BCP-NURSE-PTDET-HM-11     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-PTDET-HM-12: Collapse patient brief info for patient has not linked care plan
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
    [Tags]    BCP-NURSE-PTDET-HM-12     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-PTDET-HM-13: Collapse patient brief info for patient which has missing info
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
    [Tags]    BCP-NURSE-PTDET-HM-13     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-PTDET-HM-14: Collapse patient brief info for patient which has deleted their account
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
    [Tags]    BCP-NURSE-PTDET-HM-14     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-PTDET-HM-15: Collapse patient brief info for patient which has missing info and has deleted their account
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
    [Tags]    BCP-NURSE-PTDET-HM-15     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-PTDET-HM-16: Column visibility - Hide/show column(s) on any tab(s) of the page
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: user is on the Heart monitor page
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to hide/show any column(s) on page by setting on Column visibility button.
    [Tags]    BCP-NURSE-PTDET-HM-16        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

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
#    Cancel Prescription - Study     ${PATIENTS}[1]
#    Cancel Prescription - Study     ${PATIENTS}[2]
    Quit Browser

Cancel Prescription - Study
    [Arguments]    ${patient}
    Navigate To Heart Monitor Study
    Filter Heart Monitor Prescription    by_prescription=All prescriptions      search_by=Patient name      text_search=${patient}
    # HM Study in patient details
    View Heart Monitor Prescription Study Details On    patient_name=${patient}
    ${pre_study}      Get Patient Details Heart Monitor Current Study
    Run Keyword And Continue On Failure     Should Not Contain    ${pre_study}      There is no study yet
    Cancel Study Prescription
    ${msg}      Get Success Message
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}     Study prescription has been canceled successfully!
    ${pre_study}      Get Patient Details Heart Monitor Current Study
    Run Keyword And Continue On Failure     Should Contain    ${pre_study}      There is no study yet

