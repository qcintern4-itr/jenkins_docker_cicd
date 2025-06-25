*** Settings ***
Documentation   Test Suite - Clinic Portal - Active studies page
Metadata    sid     BF-TECH-CP-STUDIES-ACTIVE
Metadata    owner   Nhan Nguyen
Library     Collections
Library     DateTime
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_clinic_portal/lib/api/Clinic.py       ${ENV}
Library     project_bioflux_clinic_portal/lib/api/Auth.py         ${ENV}
Library     project_bioflux_clinic_portal/lib/web/Common.py
Library     project_bioflux_clinic_portal/lib/web/Studies.py
Library     project_bioflux_clinic_portal/lib/web/StudyDetails.py
Library     project_bioflux_clinic_portal/lib/web/Inbox.py

Suite Setup         SUITE SETUP
Suite Teardown      SUITE TEARDOWN
Force Tags          BF-TECH-CP-STUDIES-ACTIVE       web
Test Timeout        1h

# Facing bug: https://itrvn.atlassian.net/browse/BF-3368
*** Test Cases ***
BF-TECH-CP-STUDIES-ACTIVE-VIEW-01: View a list of active studies  # Step 2: Break to new case
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The user can view a list of active studies
    ...
    ...     Precondition:
    ...     - The user is on the Active tab of the STUDIES page
    ...
    ...     Test Steps:
    ...     1. Observe  a list of studies in the Active tab
    ...
    ...     Expected Results:
    ...     1. The list shall display all study cards
    ...     2. The list is sorted by Study ID in descending order
    ...     3. By default, the list loads a maximum of 10 studies. The user can scroll down to load more studies

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-VIEW-01      auto
    Navigate To Studies Page
    Filter Studies    study_state=Active
    ${studies}        Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No active study found
    ${study_ids}        Evaluate    [item['Study'] for item in ${studies}]
    ${expected_study_ids}        Evaluate    sorted(${study_ids}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Length Should Be    ${studies}       10
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${study_ids}        ${expected_study_ids}
    Filter Studies    study_state=Active        search_by=Study ID      text_search=${studies}[0][Study]
    ${studies}        Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No active study found with text search ${studies}[0][Study]
    ${studies}           Get Active Studies
    ${items}            Check Active Study Items Available
    ${expect_header}    Create List    Device    Study    Patient   Facility    Patient ID   Start time   Study type   Study duration    Initial duration    Patient return visit
    ...  Last strip update    Reference code   Biodirect    Progress
    ${actual_headers}   Evaluate    [k for k, v in ${studies}[0].items()]
    ${items}            Check Active Study Items Available
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${actual_headers}       ${expect_header}
    Run Keyword And Continue On Failure    Should Be True    ${items}[0][Copy button]
    Run Keyword And Continue On Failure    Should Not Be True    ${items}[0][Get ECG button]
    Run Keyword And Continue On Failure    Should Be True    ${items}[0][View study button]
    Run Keyword And Continue On Failure    Should Not Be True    ${items}[0][Stop button]
    Run Keyword And Continue On Failure    Should Be True    ${items}[0][Progress bar]

BF-TECH-CP-STUDIES-ACTIVE-VIEW-02: View study info of a Draft/Ongoing study that not running with Biodirect service
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: View study info of a Draft/Ongoing study that not running with Biodirect service
    ...
    ...     Precondition:
    ...     - The user is on the Active tab of the STUDIES page
    ...     - There is a study is on Draft/Ongoing status that not running with Biodirect service
    ...
    ...     Test Steps:
    ...     1. Search for study mentioned in Precondition
    ...     2. View info displayed in study card
    ...
    ...     Expected Results:
    ...     1. The study card shall display with the following info:
    ...     - Device ID
    ...     - Study ID
    ...     - Patient Name
    ...     - Facility Name (in the case the clinic user has been assigned to multiple facilities and All facilities is filtered)
    ...     - Patient ID
    ...     - Start time
    ...     - Study type
    ...     - Patient return visit
    ...     - Study duration
    ...     - Last strip update
    ...     - Progress of the study and study remaining time
    ...     - Strip images of the latest Evaluation strip
    ...     - A [Stop] button for the user to stop the study
    ...     - A [Get ECG] button for the user to get an Evaluation strip of the study
    ...     - A [Copy] button for the user to copy information of the study to a new study
    ...     - A [View Study] button for the user to view the STUDY MANAGEMENT page of the study

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-VIEW-02      auto
    Navigate To Studies Page
    Open New Study
    ${current_page}     Get Current New Study Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page}       Patient information       # PAGE 1
    ${second_contact}   Create Dictionary    name=Jonh     relationship=brother     phone_number=049-586-7594     email=jonh@yopmail.com
    ${date}     Get Current Date    result_format=%m/%d/%Y    increment=+15 day
    Create New Study Page 1     patient_id=PT103     first_name=Patient     middle_name=Test      last_name=01     dob=11/11/2000      height=4ft, 3in     weight=50lb     ethnicity=Asian      pacemaker=${True}     icd=${True}   is_next=${False}
    ${values_page_1}        Get New Study Values Page 1
    Create New Study Page 1     is_next=${True}
    Create New Study Page 2     country=Canada      address=AAR Plumbing and Heating Supply, Steeles Avenue East, Brampton, ON, Canada       primary_phone_number=084-657-4637        email=patient@yopmail.com
    ...  secondary_phone_number=0293757473      secondary_contact=${second_contact}
    Create New Study Page 3     facility=${FACILITIES}[0][name]      device_type=Bioflux   device_id=${DEVICES}[bioflux_device][0][id]     referring_physician=Physician Qa Team 01    study_type=MCT – 93228-93229        study_duration=3      patient_return_visit=${date}
    ...  clinician_initials=Initials        is_next=${False}        interpreting_physician=Physician Qa Team 01
    ${values_page_3}        Get New Study Values Page 3
    Create New Study Page 3    is_next=${True}
    Create New Study Page 4    primary_diagnosis_other=Other     primary_diagnosis_code_other_input=Other Pri Test      secondary_diagnosis_other=Other    secondary_diagnosis_code_other_input=Other second Test    patient_medication=medication
    ...  physician_notes=Phy Notes      insurance_type=Other    insurance_provider=Provider    pre_authorization=No     symptoms=TIA, Chest pain        symptoms_times_happen=Less than 6     before_heart_monitor=No     is_initiate=${False}
    ${values_page_4}        Get New Study Values Page 4
    Create New Study Page 4    is_initiate=${True}
    Create New Study Page 5
    Navigate To Studies Page
    ${studies}        Get Active Studies
    ${study_id}       Set Variable    ${studies}[0][Study]
    Filter Studies      search_by=Study ID      text_search=${study_id}
    ${studies}        Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No active study found with text search ${studies}[0][Study]
    Wait Active Study Ecg View Available
    ${check_active}     Check Active Study Items Available
    ${studies}        Get Active Studies
    ${expected_result}      Evaluate    {k: v for k, v in ${studies}[0].items()}
    ${actual_patient_name}      Set Variable    ${values_page_1}[First name] ${values_page_1}[Last name]
    ${actual_study_type}     Evaluate       '${values_page_3}[Study type]'.split()[0].strip()
#    ${expected_biodirect}      Evaluate     '${expected_result}[Biodirect]'.replace('Biodirect ', '', 1)
    ${expected_study_duartion}      Evaluate     '${expected_result}[Study duration]'.split()[0].strip()
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}
    Run Keyword And Continue On Failure    Should Be Equal      ${values_page_1}[Patient ID]        ${expected_result}[Patient ID]
    Run Keyword And Continue On Failure    Should Be Equal      ${expected_result}[Device]          ${DEVICES}[bioflux_device][0][id]
    Run Keyword And Continue On Failure    Should Be Equal      ${expected_result}[Patient]         ${actual_patient_name}
    Run Keyword And Continue On Failure    Should Be Equal      ${expected_result}[Facility]        ${values_page_3}[Facility]
    Run Keyword And Continue On Failure    Should Not Be Empty      ${expected_result}[Study]
    Run Keyword And Continue On Failure    Should Not Be Equal    ${expected_result}[Start time]     ⁃⁃
    Run Keyword And Continue On Failure    Should Be Equal      ${expected_result}[Study type]      ${actual_study_type}
    Run Keyword And Continue On Failure    Should Be Equal      ${expected_result}[Patient return visit]        ${values_page_3}[Patient return visit]
    Run Keyword And Continue On Failure    Should Be Equal      ${expected_study_duartion}            ${values_page_3}[Study duration]d
    Run Keyword And Continue On Failure    Should Not Be Equal      ${expected_result}[Last strip update]   ⁃⁃
    Run Keyword And Continue On Failure    Should Not Be Equal      ${expected_result}[Reference code]      ⁃⁃
    Run Keyword And Continue On Failure    Should Be True    ${check_active}[0][Copy button]
    Run Keyword And Continue On Failure    Should Be True    ${check_active}[0][Get ECG button]
    Run Keyword And Continue On Failure    Should Be True    ${check_active}[0][View study button]
    Run Keyword And Continue On Failure    Should Be True    ${check_active}[0][Stop button]
    Run Keyword And Continue On Failure    Should Be True    ${check_active}[0][Progress bar]
    Run Keyword And Continue On Failure    Should Be True    ${check_active}[0][Strip image]
    Stop Active Studies    row=1

BF-TECH-CP-STUDIES-ACTIVE-VIEW-03: View study info of End of duration study that not running with Biodirect service
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: View study info of End of duration study that not running with Biodirect service
    ...
    ...     Precondition:
    ...     - The user is on the Active tab of the STUDIES page
    ...     - There is a study is on End of duration status that not running with Biodirect service
    ...
    ...     Test Steps:
    ...     1. Search for study mentioned in Precondition
    ...     2. View info displayed in study card
    ...
    ...     Expected Results:
    ...     1. The study card shall display with the following info:
    ...     - Device ID
    ...     - Study ID
    ...     - Patient Name
    ...     - Facility Name (in the case the clinic user has been assigned to multiple facilities and All facilities is filtered)
    ...     - Patient ID
    ...     - Start time
    ...     - Study type
    ...     - Patient return visit
    ...     - Study duration
    ...     - Last strip update
    ...     - Progress of the study and text "Study duration ended"
    ...     - Strip images of the latest Evaluation strip
    ...     - A disabled [Stop] button
    ...     - A disabled [Get ECG] button
    ...     - A [Copy] button for the user to copy information of the study to a new study
    ...     - A [View Study] button for the user to view the STUDY MANAGEMENT page of the study

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-VIEW-03      manual    R2      manual_updated
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-VIEW-04: View study info of a study running Biodirect and its order is being processed/initiated
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: View study info of a study running Biodirect and its order is being processed/initiated
    ...
    ...     Precondition:
    ...     - The user is on the Active tab of the STUDIES page
    ...     - There is a study running Biodirect and its order is being processed/initiated (The Biodirect ticket is in ‘Orders’)
    ...
    ...     Test Steps:
    ...     1. Search for study mentioned in Precondition
    ...     2. View info displayed in study card
    ...
    ...     Expected Results:
    ...     1. The study card shall display with the following info:
    ...     - Device ID: display "--"
    ...     - Study ID
    ...     - Patient Name
    ...     - Facility Name (in the case the clinic user has been assigned to multiple facilities and All facilities is filtered)
    ...     - Patient ID
    ...     - Start time: display "--"
    ...     - Study type
    ...     - Patient return visit
    ...     - Study duration
    ...     - Last strip update: display "--"
    ...     - Progress of the study and study remaining time
    ...     - Strip images of the latest Evaluation strip: display "There is no strip to display"
    ...     - A disabled [Stop] button
    ...     - A disabled [Get ECG] button
    ...     - A [Copy] button for the user to copy information of the study to a new study
    ...     - A [View Study] button for the user to view the STUDY MANAGEMENT page of the study
    ...     - Biodirect tag with text "Biodirect request is being processed"

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-VIEW-04      auto
    Navigate To Studies Page
    Open New Study
    ${current_page}     Get Current New Study Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page}       Patient information       # PAGE 1
    ${second_contact}   Create Dictionary    name=Jonh     relationship=brother     phone_number=049-586-7594     email=jonh@yopmail.com
    ${date}     Get Current Date    result_format=%m/%d/%Y    increment=+15 day
    Create New Study Page 1     patient_id=PT103     first_name=Patient     middle_name=Test      last_name=01     dob=11/11/2000      height=4ft, 3in     weight=50lb     ethnicity=Asian      pacemaker=${True}     icd=${True}   is_next=${False}
    ${values_page_1}        Get New Study Values Page 1
    Create New Study Page 1     is_next=${True}
    Create New Study Page 2     country=Canada      address=AAR Plumbing and Heating Supply, Steeles Avenue East, Brampton, ON, Canada       primary_phone_number=084-657-4637        email=patient@yopmail.com
    ...  secondary_phone_number=0293757473      secondary_contact=${second_contact}
    Create New Study Page 3     facility=${FACILITIES}[0][name]      use_biodirect=True     referring_physician=Physician Qa Team 01    study_type=MCT – 93228-93229        study_duration=3      patient_return_visit=${date}
    ...  clinician_initials=Initials        is_next=${False}        interpreting_physician=Physician Qa Team 01
    ${values_page_3}        Get New Study Values Page 3
    Create New Study Page 3    is_next=${True}
    Create New Study Page 4    primary_diagnosis_other=Other     primary_diagnosis_code_other_input=Other Pri Test      secondary_diagnosis_other=Other    secondary_diagnosis_code_other_input=Other second Test    patient_medication=medication
    ...  physician_notes=Phy Notes      insurance_type=Other    insurance_provider=Provider    pre_authorization=No     symptoms=TIA, Chest pain        symptoms_times_happen=Less than 6     before_heart_monitor=No     is_initiate=${False}
    ${values_page_4}        Get New Study Values Page 4
    Create New Study Page 4    is_initiate=${True}
    Navigate To Studies Page
    ${studies}        Get Active Studies
    ${study_id}       Set Variable    ${studies}[0][Study]
    Filter Studies      search_by=Study ID      text_search=${study_id}
    ${studies}        Get Active Studies
    ${expected_result}      Evaluate    {k: v for k, v in ${studies}[0].items()}
    ${actual_patient_name}      Set Variable    ${values_page_1}[First name] ${values_page_1}[Last name]
    ${actual_study_type}     Evaluate       '${values_page_3}[Study type]'.split()[0].strip()
    ${expected_biodirect}      Evaluate     '${expected_result}[Biodirect]'.replace('Biodirect ', '', 1)
    ${expected_study_duartion}      Evaluate     '${expected_result}[Study duration]'.split()[0].strip()
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}
    Run Keyword And Continue On Failure    Should Be Equal      ${values_page_1}[Patient ID]        ${expected_result}[Patient ID]
    Run Keyword And Continue On Failure    Should Be Equal      ${expected_result}[Device]          ⁃⁃
    Run Keyword And Continue On Failure    Should Be Equal      ${expected_result}[Patient]         ${actual_patient_name}
    Run Keyword And Continue On Failure    Should Be Equal      ${expected_result}[Facility]        ${values_page_3}[Facility]
    Run Keyword And Continue On Failure    Should Not Be Empty          ${expected_result}[Study]
    Run Keyword And Continue On Failure    Should Be Equal      ${expected_result}[Start time]      ⁃⁃
    Run Keyword And Continue On Failure    Should Be Equal      ${expected_result}[Study type]      ${actual_study_type}
    Run Keyword And Continue On Failure    Should Be Equal      ${expected_result}[Patient return visit]        ${values_page_3}[Patient return visit]
    Run Keyword And Continue On Failure    Should Be Equal      ${expected_study_duartion}              ${values_page_3}[Study duration]d
    Run Keyword And Continue On Failure    Should Be Equal      ${expected_result}[Last strip update]          ⁃⁃
    Run Keyword And Continue On Failure    Should Be Equal      ${expected_result}[Reference code]             ⁃⁃
    Run Keyword And Continue On Failure    Should Be Equal      ${expected_biodirect}             Biodirect request is being processed
    ${check_active}     Check Active Study Items Available

BF-TECH-CP-STUDIES-ACTIVE-VIEW-05: View study info of a study running Biodirect and its order is in shipping process
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: View study info of a study running Biodirect and its order is in shipping process
    ...
    ...     Precondition:
    ...     - The user is on the Active tab of the STUDIES page
    ...     - There is a study running Biodirect and its order is in shipping process
    ...     (The Biodirect ticket is in ‘Pending' and there is an Outbound shipment label without 'Delivered’ status)
    ...
    ...     Test Steps:
    ...     1. Search for study mentioned in Precondition
    ...     2. View info displayed in study card
    ...
    ...     Expected Results:
    ...     1. The study card shall display with the following info:
    ...     - Device ID
    ...     - Study ID
    ...     - Patient Name
    ...     - Facility Name (in the case the clinic user has been assigned to multiple facilities and All facilities is filtered)
    ...     - Patient ID
    ...     - Start time
    ...     - Study type
    ...     - Patient return visit
    ...     - Study duration
    ...     - Last strip update
    ...     - Progress of the study and study remaining time
    ...     - Strip images of the latest Evaluation strip
    ...     - A [Stop] button
    ...     - A [Get ECG] button
    ...     - A [Copy] button for the user to copy information of the study to a new study
    ...     - A [View Study] button for the user to view the STUDY MANAGEMENT page of the study
    ...     - Biodirect tag with text "Biodirect device is being shipped"

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-VIEW-05      manual    R2      manual_updated
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-VIEW-06: View study info of a study running Biodirect and its order is in returning process
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: View study info of a study running Biodirect and its order is in returning process
    ...
    ...     Precondition:
    ...     - The user is on the Active tab of the STUDIES page
    ...     - There is a study running Biodirect and its order is in returning process
    ...     (The Biodirect ticket is in ‘Completed' and there is an Inbound shipment label without 'Delivered’ status)
    ...
    ...     Test Steps:
    ...     1. Search for study mentioned in Precondition
    ...     2. View info displayed in study card
    ...
    ...     Expected Results:
    ...     1. The study card shall display with the following info:
    ...     - Device ID
    ...     - Study ID
    ...     - Patient Name
    ...     - Facility Name (in the case the clinic user has been assigned to multiple facilities and All facilities is filtered)
    ...     - Patient ID
    ...     - Start time
    ...     - Study type
    ...     - Patient return visit
    ...     - Study duration
    ...     - Last strip update
    ...     - Progress of the study and study remaining time
    ...     - Strip images of the latest Evaluation strip
    ...     - A [Stop] button
    ...     - A [Get ECG] button
    ...     - A [Copy] button for the user to copy information of the study to a new study
    ...     - A [View Study] button for the user to view the STUDY MANAGEMENT page of the study
    ...     - Biodirect tag with text "Biodirect device is being returned"

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-VIEW-06     manual    R2      manual_updated
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-VIEW-07-CP-2.16.2: Can view the Disclaimer alert icon of single study in Starting/Ongoing status
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The user can view the disclaimer alert icon of single study in Starting/Ongoing status
    ...
    ...     Precondition:
    ...     - The user is on the Active tab of the STUDIES page
    ...     - The user has started a MCT/MCT PEEK/CARDIAC EVENT on Biocore/Biotres device
    ...     - The patient has not entered the reference code and connected the Biocore/Biotres device to the Biocare Health app
    ...
    ...     Test Steps:
    ...     1. Observe the study ID
    ...     2. Hovering on the icon
    ...     3. Tapping on the icon
    ...
    ...     Expected Results:
    ...     1. At step 1, there is a disclaimer alert icon shall be displayed and remain on the Active study page
    ...     2. At step 2, hovering on the icon shall display a Disclaimer tooltip with the following details:
    ...     - Content: “Disclaimer, click to learn more”
    ...     3. At step 3, tapping on the icon shall display a Disclaimer dialog with the following details:
    ...     - Title: Disclaime
    ...     - Content: “For MCT and Event studies, the patient must be instructed of the importance of maintaining a Biocore/Biotres
    ...     to Biocare Health app connection. Please ensure the reference code [REF-CODE] is entered on the mobile device
    ...     to connect their Biocore/Biotres device to the Biocare Health app and maintain the connection during the study.
    ...     Please note that study response times may be affected if the connection is not ensured.”
    ...     - Button: Okay. Tapping the button shall dismiss the modal.

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-VIEW-07-CP-2.16.2     manual      CP-2.16.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-VIEW-08-CP-2.16.2: Can view the Disclaimer alert icon of HOLTER AND FOLLOW ON STUDY in Starting/Ongoing status
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The user can view the disclaimer alert icon of HOLTER AND FOLLOW ON STUDY in Starting/Ongoing status
    ...
    ...     Precondition:
    ...     - The user is on the Active tab of the STUDIES page
    ...     - The user has started a HOLTER AND FOLLOW ON STUDY type on Biocore/Biotres device
    ...     - The patient has not entered the reference code and connected the Biocore/Biotres device to the Biocare Health app
    ...
    ...     Test Steps:
    ...     1. Observe the study ID of HOLTER study
    ...     2. Hovering on the icon
    ...     3. Tapping on the icon
    ...
    ...     Expected Results:
    ...     1. At step 1, there is a disclaimer alert icon shall be displayed and remain on the Active study page
    ...     2. At step 2, hovering on the icon shall display a Disclaimer tooltip with the following details:
    ...     - Content: “Disclaimer, click to learn more”
    ...     3. At step 3, tapping on the icon shall display a Disclaimer dialog with the following details:
    ...     - Title: Disclaime
    ...     - Content: “For MCT and Event studies, the patient must be instructed of the importance of maintaining a Biocore/Biotres
    ...     to Biocare Health app connection. Please ensure the reference code [REF-CODE] is entered on the mobile device
    ...     to connect their Biocore/Biotres device to the Biocare Health app and maintain the connection during the study.
    ...     Please note that study response times may be affected if the connection is not ensured.”
    ...     - Button: Okay. Tapping the button shall dismiss the modal.

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-VIEW-08-CP-2.16.2     manual      CP-2.16.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-VIEW-09-CP-2.16.2: Can view the Disclaimer alert icon of FOLLOW ON STUDY in Starting/Ongoing status
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The user can view the disclaimer alert icon of a Starting/Ongoing study
    ...
    ...     Precondition:
    ...     - The user is on the Active tab of the STUDIES page
    ...     - The user has started a HOLTER AND FOLLOW ON STUDY type on Biocore/Biotres device
    ...     - The patient has not entered the reference code and connected the Biocore/Biotres device to the Biocare Health app
    ...
    ...     Test Steps:
    ...     1. Clicking the Stop button on HOLTER study
    ...     2. Observe the study ID of FOLLOW ON study
    ...     3. Hovering on the icon
    ...     4. Tapping on the icon
    ...
    ...     Expected Results:
    ...     1. At step 2, there is a disclaimer alert icon shall be displayed and remain on the Active study page
    ...     2. At step 3, hovering on the icon shall display a Disclaimer tooltip with the following details:
    ...     - Content: “Disclaimer, click to learn more”
    ...     3. At step 4, tapping on the icon shall display a Disclaimer dialog with the following details:
    ...     - Title: Disclaime
    ...     - Content: “For MCT and Event studies, the patient must be instructed of the importance of maintaining a Biocore/Biotres
    ...     to Biocare Health app connection. Please ensure the reference code [REF-CODE] is entered on the mobile device
    ...     to connect their Biocore/Biotres device to the Biocare Health app and maintain the connection during the study.
    ...     Please note that study response times may be affected if the connection is not ensured.”
    ...     - Button: Okay. Tapping the button shall dismiss the modal.

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-VIEW-09-CP-2.16.2     manual        CP-2.16.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-VIEW-10-CP-2.16.2: Cannot view the Disclaimer alert icon
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The user cannot view the disclaimer alert icon of a Ongoing study
    ...
    ...     Precondition:
    ...     - The user is on the Active tab of the STUDIES page
    ...     - The user has started a MCT/MCT PEEK/CARDIAC EVENT/HOLTER AND FOLLOW ON STUDY type on Biocore/Biotres device
    ...
    ...     Test Steps:
    ...     1. The patient has entered the reference code and connected the Biocore/Biotres device to the Biocare Health app
    ...     2. Observe the study ID
    ...
    ...     Expected Results:
    ...     1. The disclaimer alert icon shall remove
    ...     2. For the HOLTER AND FOLLOW ON STUDY type, if the Holter study has entered the reference code and connected
    ...     the Biocore/Biotres device to the Biocare Health app, the Follow on study type shall not display the disclaimer icon

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-VIEW-10-CP-2.16.2     manual        CP-2.16.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BF-TECH-CP-STUDIES-ACTIVE-VIEW-11-CP-2.16.2: Can view the offline warning icon
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The user can view the offline warning icon
    ...
    ...     Precondition:
    ...     - The user is on the Active studies screen
    ...     - There is a study ID that has entered the reference code and connect the Biocore/Biotres device to the Biocare
    ...     Health app but during the study the device has been offline more than 2 hours
    ...
    ...     Test Steps:
    ...     1. Observe the Device ID
    ...     2. Hovering on the icon
    ...
    ...     Expected Results:
    ...     1. At step 1, there shall be a warning icon displayed next to that device ID in the Active study list
    ...     2. At step 2, hovering on the study section shall display a warning tooltip with the following details:
    ...     3. Content: “Device has been offline for more than 2 hours. Please ensure a continuous device-to-app
    ...     connection for real-time notifications and study reliability.”

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-VIEW-11-CP-2.16.2     manual      CP-2.16.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-VIEW-12-CP-2.16.5: Bioflux-Can view the Reference code on active study list when study status is Draft/Starting/Ongoing
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The user can view the Reference code on active study list
    ...
    ...     Precondition:
    ...     - The user is on the Active studies screen
    ...     - There is an MCT/MCT PEEK/CARDIAC EVENT/HOLTER AND FOLLOW ON STUYDY/HOLTER/EXTENDED HOLTER study type started
    ...     on a Bioflux device
    ...
    ...     Test Steps:
    ...     1. Observe the active study list in Draft/Starting/Ongoing status
    ...
    ...     Expected Results:
    ...     1. There shall be a reference code displayed for the user’s convenience
    ...
    ...     **Others**
    ...     Update Date: 9/13/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-VIEW-12-CP-2.16.5     manual      CP-2.16.5
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-VIEW-13-CP-2.16.2: Biolfux-Can resend ref code when study status is Ongoing
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-VIEW-13-CP-2.16.2     manual      CP-2.16.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-VIEW-14-CP-2.16.2: Biolfux-Cannot resend ref code when study status is Draft/Starting/Completed/Done
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-VIEW-14-CP-2.16.2     manual      CP-2.16.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-VIEW-15-CP-2.16.2: Biolfux-Cannot resend ref code if the duration between 2 clicking times is less than 5 minutes
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-VIEW-15-CP-2.16.2     manual      CP-2.16.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-VIEW-16-CP-2.16.5: Biocore/Biotres-Can view the Reference code on active study list when study status is Draft/Starting/Ongoing/Completed
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The user can view the Reference code on active study list
    ...
    ...     Precondition:
    ...     - The user is on the Active studies screen
    ...     - There is an MCT/MCT PEEK/CARDIAC EVENT/HOLTER AND FOLLOW ON STUYDY/HOLTER/EXTENDED HOLTER study type started
    ...     on a Biocore/Biotres device
    ...
    ...     Test Steps:
    ...     1. Observe the active study list in Draft/Starting/Ongoing/Completed status
    ...
    ...     Expected Results:
    ...     1. There shall be a reference code displayed for the user’s convenience
    ...
    ...     **Others**
    ...     Update Date: 9/13/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-VIEW-16-CP-2.16.5     manual      CP-2.16.5
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-VIEW-17-CP-2.16.2: Biocore/Biotres-Can resend ref code when study status is Ongoing/Completed
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-VIEW-17-CP-2.16.2     manual      CP-2.16.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-VIEW-18-CP-2.16.2: Biocore/Biotres-Cannot resend ref code when study status is Draft/Starting/Done
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-VIEW-18-CP-2.16.2     manual      CP-2.16.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-VIEW-19-CP-2.16.2: Biocore/Biotres-Cannot resend ref code if the duration between 2 clicking times is less than 5 minutes
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-VIEW-19-CP-2.16.2     manual      CP-2.16.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-ABORT-01: Can abort a Draft study (single type) running Biocore device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-ABORT-01     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-ABORT-02: Can abort a Draft study (FO type) running Biocore device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-ABORT-02     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-ABORT-03: Can abort a Draft study (single type) running Biocore Pro device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-ABORT-03     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-ABORT-04: Can abort a Draft study (FO type) running Biocore Pro device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-ABORT-04     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-ABORT-05: Can abort a Draft study (single type) running Bioflux device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-ABORT-05     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-ABORT-06: Can abort a Draft study (FO type) running Bioflux device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-ABORT-06     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-ABORT-07: Can abort a Starting study (single type) running Biocore device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-ABORT-07     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-ABORT-08: Can abort a Starting study (FO type) running Biocore device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-ABORT-08     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-ABORT-09: Can abort a Starting study (single type) running Biocore Pro device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-ABORT-09     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-ABORT-10: Can abort a Starting study (FO type) running Biocore Pro device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-ABORT-10     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-ABORT-11: Can abort a Starting study (single type) running Bioflux device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-ABORT-11     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-ABORT-12: Can abort a Starting study (FO type) running Bioflux device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-ABORT-12     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-ABORT-13: Cannot abort a Ongoing study
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-ABORT-13     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-ABORT-14: Can abort a Biodirect study in status Not started-Created from Clinic for Biocore (single type)
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-ABORT-14     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-ABORT-15: Can abort a Biodirect study in status Not started-Created from Clinic for Biocore (FO type)
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-ABORT-15     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-ABORT-16: Can abort a Biodirect study in status Not started-Created from Clinic for Biocore Pro (single type)
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-ABORT-16     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-ABORT-17: Can abort a Biodirect study in status Not started-Created from Clinic for Biocore Pro (FO type)
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-ABORT-17     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-ABORT-18: Can abort a Biodirect study in status Not started-Created from Clinic for Bioflux (single type)
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-ABORT-18     auto      CP-2.25.1     R1
    [Template]    Abort A Study With Running Biodirect
    MCT - 93228-93229
    MCT PEEK - 93228-93229
    CARDIAC EVENT - 93268-93272
    HOLTER - 93224-93227
    EXTENDED HOLTER - 93241-93247

BF-TECH-CP-STUDIES-ACTIVE-ABORT-19: Can abort a Biodirect study in status Not started-Created from Clinic for Bioflux (FO type)
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-ABORT-19     auto      CP-2.25.1     R1
    [Template]    Abort A Study With Running Biodirect
    FOLLOW-ON STUDY

BF-TECH-CP-STUDIES-ACTIVE-ABORT-20: Cannot abort a Biodirect study in status Not started-Created from HeartSecure
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-ABORT-20     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-ABORT-21: Check mail sent to Service team and Patient in case Study is aborted successfully
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-ABORT-21     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-REFCODE-01: Normal study-Can manual send ref code when study status is Starting
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-REFCODE-01     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-REFCODE-02: Normal study-Can auto send ref code when study status is Started
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-REFCODE-02     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-REFCODE-03: Normal study-Can manual resend ref code
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-REFCODE-03     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-REFCODE-04: Biodirect Bioflux study-Auto send ref code when study status is Started
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-REFCODE-04     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-REFCODE-05: Biodirect study-Can manual send ref code when study status is Starting
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-REFCODE-05     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-REFCODE-06: Biodirect Biocore study-Not Auto send ref code when study status is Started
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-REFCODE-06     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-REFCODE-07: Biodirect Biocore Pro study-Not Auto send ref code when study status is Started
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-REFCODE-07     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-REFCODE-08: Biodirect HeartSecure study-Not Auto send ref code when study status is Started
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-REFCODE-08     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-FILTER-FACILITY-01: View the name of the facility in case the user only associates with one facility
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Active tab of the STUDIES page
    ...     2. Observe the header of STUDIES page
    ...
    ...     Expected Results:
    ...     1. The facility name is displayed on the header of the STUDIES page
    ...     2. All the data associated with that facility shall be displayed

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-FILTER-FACILITY-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-FILTER-FACILITY-02: Filter by a specific facility in case the user associates with multiple facilities
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can select a specific facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...     - The Admin portal has associated the account with multiples facilities
    ...     Test Steps:
    ...     1. Click the Active tab of the STUDIES page
    ...     2. Click on the drop-down list on the header of the STUDIES page
    ...     3. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the STUDIES page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-FILTER-FACILITY-02        auto
    Navigate To Studies Page
    Filter Studies    study_state=Active
    Select Facility     Facility_Qa_01
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}     No devices found - with facility ${FACILITIES}[0][name]
    ${current_filter_study}       Get Current Facility
    # The filtered and selected facility shall be applied to other pages
    Check the facility on another page  Inbox       ${current_filter_study}
    Check the facility on another page  Devices     ${current_filter_study}
    Check the facility on another page  Fleet       ${current_filter_study}
    Check the facility on another page  Support     ${current_filter_study}
    Check the facility on another page  Studies     ${current_filter_study}
    Filter Studies    study_state=Active
    Select Facility Studies     Facility_Qa_02
    ${studies}          Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}      No active studies found - with facility 'Facility_Qa_02'
    ${current_filter_study}       Get Current Facility
    Check the facility on another page  Inbox       ${current_filter_study}
    Check the facility on another page  Devices     ${current_filter_study}
    Check the facility on another page  Fleet       ${current_filter_study}
    Check the facility on another page  Support     ${current_filter_study}
    Check the facility on another page  Studies     ${current_filter_study}
    Filter Studies    study_state=Active
    Select Facility Studies     All facilities
    ${studies}          Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}      No active studies found - with facility 'All facilities'

BF-TECH-CP-STUDIES-ACTIVE-SEARCH-01: View all search attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can view all search attributes on the STUDIES page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Active tab of the STUDIES page
    ...     2. Click the search option icon
    ...
    ...     Expected Results:
    ...     1. The search attributes shall be displayed:
    ...     - Patient Name
    ...     - Study ID
    ...     - Patient ID
    ...     - Device ID
    ...     2. The default search option should be Patient Name

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-SEARCH-01     auto
    Navigate To Studies Page
    Filter Studies    study_state=Active
    ${search_options}       Get Filter Options
    ${expected_options}     Create List    Patient name     Study ID      Patient ID      Device ID
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${search_options}[Search by]        ${expected_options}
    ${current_attribute}     Get Current Search Attribute
    Run Keyword And Continue On Failure    Should Be Equal    ${current_attribute}          Patient name
    ${current_filter}       Get Current Filter
    Run Keyword And Continue On Failure    Should Contain     ${current_filter}[Study state]    Active
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Search by]      Search...

BF-TECH-CP-STUDIES-ACTIVE-SEARCH-02: Search by Patient Name attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Patient attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Active tab of the STUDIES page
    ...     2. Click the search option icon
    ...     3. Select the Patient Name option
    ...     4. Enter the search input in the search field
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The Clear button is displayed
    ...     2. The report list shall be filtered and displayed accordingly with the entered Patient name
    ...     3. The search input in the search field shall be remained and be searched across each tab in the INBOX page
    ...     4. All entered text will be deleted

     [Tags]  BF-TECH-CP-STUDIES-ACTIVE-SEARCH-02       manual
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    [Template]    Filter Active - Studies
#    Patient name

BF-TECH-CP-STUDIES-ACTIVE-SEARCH-03: Search by Study ID attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Study ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Active tab of the STUDIES page
    ...     2. Click the search option icon
    ...     3. Select the Study ID option
    ...     4. Enter the search input in the search field
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The Clear button is displayed
    ...     2. The report list shall be filtered and displayed accordingly with the entered Study ID
    ...     3. The search input in the search field shall be remained and be searched across each tab in the INBOX page
    ...     4. All entered text will be deleted

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-SEARCH-03     auto
    [Template]    Filter Active - Studies
    Study ID

BF-TECH-CP-STUDIES-ACTIVE-SEARCH-04: Search by Patient ID attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Study ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Active tab of the STUDIES page
    ...     2. Click the search option icon
    ...     3. Select the Patient ID option
    ...     4. Enter the search input in the search field
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The Clear button is displayed
    ...     2. The report list shall be filtered and displayed accordingly with the entered Patient ID
    ...     3. The search input in the search field shall be remained and be searched across each tab in the INBOX page
    ...     4. All entered text will be deleted

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-SEARCH-04     auto
    [Template]    Filter Active - Studies
    Patient ID

BF-TECH-CP-STUDIES-ACTIVE-SEARCH-05: Search by Device ID attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Device ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Active tab of the STUDIES page
    ...     2. Click the search option icon
    ...     3. Select the Device ID option
    ...     4. Enter the search input in the search field
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The Clear button is displayed
    ...     2. The report list shall be filtered and displayed accordingly with the entered Physician
    ...     3. The search input in the search field shall be remained and be searched across each tab in the INBOX page
    ...     4. All entered text will be deleted

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-SEARCH-05       manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    ${study_id}     ${friendly_id}      Api Study - Create
#    Filter Active - Studies     Device ID
#    [Teardown]    Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-TECH-CP-STUDIES-ACTIVE-STOP-01: Stop an active study
    [Documentation]     Author: Trinh Nguyen
    ...     Description: The user can stop an active study
    ...
    ...     Precondition:
    ...     - The clinician is on the Active tab of STUDIES page
    ...     - There is at least a study on active tab with an online device status
    ...
    ...     Test Steps:
    ...     1. Click the Stop button
    ...     2. Click the Cancel button on the modal
    ...     3. Click the Stop button then click the Stop button on the modal
    ...
    ...     Expected Results:
    ...     1. At step 2, the message box will disappear and the study still stays on the Active tab
    ...     2. At step 3, the system sends the command to the device, then the device stops the study and uploads data
    ...     to the system. At that time, the Stop button shall be dismissed, and the uploading progress in percentage
    ...     is displayed. When the upload is completed, the study is moved to the Completed tab

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-STOP-01      auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies    study_state=Active      search_by=Study ID    text_search=${friendly_id}
    ${studies}        Get Active Studies
    ${id}             Set Variable    ${studies}[0][Study]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No studies found with text search ${friendly_id}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${id}             ${friendly_id}
    Stop Active Studies     row=1       is_stop=${False}      is_cancel=${True}     # Stop Active Studies > Cancel
    ${studies}        Get Active Studies
    ${id}             Set Variable    ${studies}[0][Study]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No studies found with text search ${friendly_id}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${id}             ${friendly_id}
    Stop Active Studies     row=1
    Filter Studies    study_state=Active      search_by=Study ID    text_search=${friendly_id}
    ${studies}        Get Active Studies
    Run Keyword And Continue On Failure    Should Be Empty    ${studies}
    Filter Studies    study_state=Completed    search_by=Study ID       text_search=${id}
    ${studies}        Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}         No studies found with text search ${id}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${studies}[0][Study ID]       ${id}
    Delete Completed Study On    row=1
    ${studies}        Get Completed Studies
    Run Keyword And Continue On Failure    Should Be Empty    ${studies}

BF-TECH-CP-STUDIES-ACTIVE-STOP-02: Cannot stop an active study when device is offline
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-STOP-02     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-STOP-03: Can stop an active study when study status is paused and device is online
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-STOP-03     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-GET-ECG-01: Can get ECG when study status is Started/Resumed and device is online
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-GET-ECG-01     auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    ${actual_status}        Check Active Study Items Available
    Run Keyword And Continue On Failure    Should Be True    ${actual_status}[0][Get ECG button]
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-TECH-CP-STUDIES-ACTIVE-GET-ECG-02: Cannot get ECG when study status is Draft/Starting/Paused/Completed
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-GET-ECG-02     auto   R1
    Navigate To Studies Page
    Filter Studies    study_state=Active
    # Draft
    ${studies}      Get Active Studies
    ${study_ids}    Evaluate    [item['Study'] for item in ${studies} if item.get('Device') == '⁃⁃']
    ${study_id}     Evaluate    random.choice(${study_ids})    random
    Filter Studies    search_by=Study ID        text_search=${study_id}
    ${actual_status}     Check Active Study Items Available
    Run Keyword And Continue On Failure    Should Not Be True    ${actual_status}[0][Get ECG button]
    # Starting/Paused/Completed not running

BF-TECH-CP-STUDIES-ACTIVE-GET-ECG-03: Cannot get ECG when device is offline
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-GET-ECG-03     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-01: View details information for MCT/MCT PEEK/CARDIAC EVENT/HOLTER/EXT HOLTER studies
    [Documentation]    Author: Trinh Nguyen
    ...     Description: The user can view the detailed information of the study
    ...
    ...     Precondition:
    ...     - There is a study that match the criteria mentioned above
    ...     - The user is in the Study Details tab of the STUDY MANAGEMENT page
    ...
    ...     Test Steps:
    ...     1. Observe the information On the screen
    ...
    ...     Expected Results:
    ...     1. The Study Details tab is highlighted when it’s selected by the user and the screen
    ...     displays the following information:
    ...     - Study ID (located in the header of the page)
    ...     + Biodirect tag: There shall be a green label
    ...     with the “Biodirect” title on studies that are running with the biodirect service next to the Study ID.
    ...     - Patient Name - (located in the header of the page)
    ...     - Physician Name (Interpreting Physician - located in the header of the page)
    ...     - Facility Name: located in the header of the page
    ...     - Study Information
    ...     + Status
    ...     + Start Time
    ...     + End Time
    ...     + Study Type
    ...     + Study Duration
    ...     + Patient Return Visit (Date)
    ...     + Device ID
    ...     + Low Cell Signal
    ...     + RMA
    ...     + Reference code: only displayed if the device is ‘Biocore/Biotres’ and the service is not ‘Biodirect’
    ...     - Physician Information
    ...     + Referring physician:
    ...     . Physician name
    ...     . Day phone number
    ...     . After hours phone number
    ...     . Fax number
    ...     . Email address
    ...     + Interpreting physician
    ...     . Physician name
    ...     . Day phone number
    ...     . After hours phone number
    ...     . Fax number
    ...     . Email address
    ...     - Diagnosis
    ...     + Primary Diagnosis Code
    ...     + Secondary Diagnosis Code
    ...     + Patient medication
    ...     - Physician Amendments Notes
    ...     - Study History (Timezone of the study)
    ...     + These are the study events that are grouped by day: Draft, Starting, Started, Paused, Resumed, Completed,
    ...     Uploading, Uploaded, Erasing, Erased, Aborted. For the studies that run on the firmware version starting
    ...     4.0.010e and the newer ones, their events have the battery information:
    ...     . Started
    ...     . Paused
    ...     . Resumed
    ...     . Completed
    ...     . Uploaded
    ...     . Erased
    ...     - Device Notifications History (Timezone of the study)
    ...     + These are the device notifications that are grouped by day. The devices are run on the firmware version
    ...     starting 4.0.010e and the newer ones, their notifications have battery information:
    ...     . Battery low
    ...     . Battery critical
    ...     . Charger Connected
    ...     . Charger Disconnected
    ...     . Power On
    ...     . Power Off
    ...
    ...     **Others**
    ...     Update Date: 8/22/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-01      auto
    Navigate To Studies Page
    Filter Studies    study_state=Active
    ${studies}      Get Active Studies
    View Active Study Details On    row=1   # MCT/MCT PEEK/CARDIAC EVENT/HOLTER/EXT HOLTER
    # Verify page header
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    # Verify current study details tab
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Study details
    # Verify Study (study page ) >< Overview info (Study details)
    ${study_overview}        Get Study Details Overview
    ${study_details}         Get Study Details
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${studies}[0][Study]         ${study_overview}[Study ID]
    Run Keyword And Continue On Failure    Should Be Equal                ${studies}[0][Patient]       ${study_overview}[Patient]
    Run Keyword And Continue On Failure    Should Be Equal                ${studies}[0][Facility]      ${study_overview}[Facility]
#    Run Keyword And Continue On Failure    Should Be Equal                ${studies}[0][Biodirect]     ${study_overview}[Biodirect]
    Run Keyword And Continue On Failure    Should Be Equal                ${studies}[0][Device]     ${study_details}[Study Information][Device ID]
    # Verify title
    ${expected_top_title}        Create List     Study ID        Patient     Physician       Facility        Biodirect
    ${expected_study_info}       Create List     Status   Study type   Study duration    Start time    Initial duration   End time   Device ID   Patient return visit   Device status    Clinician initials   Low cell signal   Reference code
    ${expected_refer_physician}  Create List     Name    Day phone      After hours phone    Email      Fax number
    ${expected_inter_physician}  Create List     Name    Day phone      After hours phone    Email      Fax number
    ${expected_diagnosis}        Create List     Primary diagnosis code     Secondary diagnosis code     Patient medication
    # verify
    ${top_title}       Evaluate    [k for k, v in ${study_overview}.items()]
    ${study_info}      Evaluate    [k for k, v in ${study_details}[Study Information].items()]
    ${refer_phy}       Evaluate    [k for k, v in ${study_details}[Referring physician].items()]
    ${inter_phy}       Evaluate    [k for k, v in ${study_details}[Interpreting physician].items()]
    ${diagnosis}       Evaluate    [k for k, v in ${study_details}[Diagnosis].items()]
    Run Keyword And Continue On Failure    List Should Contain Sub List     ${top_title}     ${expected_top_title}
    Run Keyword And Continue On Failure    Lists Should Be Equal            ${study_info}    ${expected_study_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal            ${refer_phy}     ${expected_refer_physician}
    Run Keyword And Continue On Failure    Lists Should Be Equal            ${inter_phy}     ${expected_inter_physician}
    Run Keyword And Continue On Failure    List Should Contain Sub List     ${expected_diagnosis}     ${diagnosis}
    # PHYSICIAN AMENDMENTS NOTES     STUDY HISTORY    DEVICE NOTIFICATION HISTORY
    ${all_titles}        Evaluate    [k for k, v in ${study_details}.items()]
    ${expected_title2st}     Create List    Physician amendments notes     Study history    Device notification history
    Run Keyword And Continue On Failure     List Should Contain Sub List    ${all_titles}       ${expected_title2st}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-02: View details information for For studies running 'Holter & Follow-on' study
    [Documentation]    Author: Trinh Nguyen
    ...     Description: The user can view the detailed information of the study
    ...
    ...     Precondition:
    ...     - There is a study that match the criteria mentioned above
    ...     - The user is in the Study Details tab of the STUDY MANAGEMENT page
    ...
    ...     Test Steps:
    ...     1. Observe the information On the screen
    ...
    ...     Expected Results:
    ...     1. The Study Details tab is highlighted when it’s selected by the user and the screen
    ...     displays the following information:
    ...     - Study Information
    ...     + Study type
    ...     . If the study is a Holter or a Follow-on study and is part of the “Holter & Follow-on study”,
    ...     then there shall be a tag “*FO*” attached next to the study type
    ...     + Patient Return Visit (Date): This should display the Patient return visit date of the follow on study for
    ...     both Holter study and follow on study
    ...     - Follow-on study tracking:
    ...     + Holter study:
    ...     . Study ID: Shall only be available and displayed when the study started. The Study ID shall be a hyperlink
    ...     to the quick access study information sidebar of the Follow-on Study if the user is on the Study details
    ...     tab of the Holter study
    ...     . Study duration: Shall only be available and displayed when the study has not started
    ...     . Study Type - study type of the “Follow-on” study
#    Break to new case
#    ...     2. For aborted studies, there shall be a message displayed on the top of the page:
#    ...     “This study has been aborted and will not be counted toward your billing.”
    ...
    ...     **Others**
    ...     Update Date: 8/22/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-02       auto
    Navigate To Studies Page
    Filter Studies    study_state=Active
    ${compl_studies}        Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${compl_studies}      No studies found with text search `Study Holter & Follow-on`
    # Navigate to study management
#    ${study_id}     Evaluate    [item['Study'] for item in ${compl_studies} if item.get('Study type').endswith('Follow on') and item.get('Study Type').startswith('HOLTER')]
#    ${random_study_id}    Evaluate  random.choice(${study_id})    random
    Filter Studies    search_by=Study ID        text_search=${STUDY_ID_HOLTER}
    View Active Study Details On      row=1   # MCT/MCT PEEK/CARDIAC EVENT/HOLTER/EXT HOLTER
    # Verify page header
    ${page}     Get Page Header Detail
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${page}       STUDY
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}        Study details
    ${study_details}        Get Study Details
    ${study_details_tracking}       Get Study Details Tracking
    ${expected_follow_on}   Create List    MCT    MCT PEEK    CARDIAC EVENT   HOLTER      EXTENDED HOLTER
    Run Keyword And Continue On Failure    Should Not Be Empty    ${study_details}      No details of study found
    Run Keyword And Continue On Failure    Should Be Equal        ${study_details}[Study Information][Study type]       HOLTER | Follow on
    Run Keyword And Continue On Failure    Should Not Be Empty    ${study_details}[Study Information][Patient return visit]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${study_details_tracking}[Follow-on study tracking]
    Run Keyword And Continue On Failure    List Should Contain Value  ${expected_follow_on}        ${study_details_tracking}[Follow-on study tracking][Study type]
    ${actual_study_info_attributes}        Evaluate    [k for k, v in ${study_details}[Study Information].items()]
    ${expect_study_info_attributes}        Create List    Status   Study type   Study duration    Start time    Initial duration   End time   Device ID   Patient return visit   Device status    Clinician initials   Low cell signal   Reference code
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${actual_study_info_attributes}     ${expect_study_info_attributes}
    # Patient: Study Holter & Follow-on

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-03-CP-2.16.2: Can view the Disclaimer modal in study details of a study
    [Documentation]    Author: Trinh Nguyen
    ...     Description: The user can view the Disclaimer modal in study details of a study
    ...
    ...     Precondition:
    ...     - The user is on the Active studies screen
    ...     - There is a study ID has a disclaimer alert icon
    ...
    ...     Test Steps:
    ...     1. Click the View study button on the specific study card
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. A modal with the Disclaimer message shall be displayed and remain on the study details page
    ...     - Tile: Disclaimer
    ...     - Content: "For MCT and Event studies, the patient must be instructed of the importance of maintaining a Biocore/Biotres
    ...     to Biocare Health app connection. Please ensure the reference code [REF-CODE] is entered on the mobile device
    ...     to connect their Biocore/Biotres device to the Biocare Health app and maintain the connection during the study.
    ...     Please note that study response times may be affected if the connection is not ensured."
    ...     - Button: Okay. Tapping the button shall dismiss the modal

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-03-CP-2.16.2       manual       CP-2.16.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-04-CP-2.16.2: Can view the offline alert message in study details of a study
    [Documentation]    Author: Trinh Nguyen
    ...     Description: The user can view the offline message in study details of a study
    ...
    ...     Precondition:
    ...     - The user is on the Active studies screen
    ...     - There is a study ID that has entered the reference code and connect the Biocore/Biotres device to the Biocare
    ...     Health app but during the study the device has been offline more than 2 hours
    ...
    ...     Test Steps:
    ...     1. Click the View button on the specific study card
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. There shall be an alert message displayed on the study details page
    ...     2. The message content will be: "Device has been offline for more than 2 hours. Please ensure a continous
    ...     device-to-app connection for real-time notifications and study reliability."

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-04-CP-2.16.2       manual       CP-2.16.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-05: View study details of MCT/MCT PEEK/CARDIAC EVENT/HOLTER/EXT HOLTER study when create new study
    [Documentation]     Author: Trinh Nguyen
    ...     Description: The user can view the detailed information of the study
    ...
    ...     Precondition:
    ...     - There is a study that match the criteria mentioned above
    ...     - The user is in the Study Details tab of the STUDY MANAGEMENT page
    ...
    ...     Test Steps:
    ...     1. Observe the information On the screen
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Create Date: 8/22/2023
    ...     Create by: Thang Tran

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-05      auto
    Create a study with not running biodirect
    Navigate To Studies Page
    ${studies}        Get Active Studies
    ${study_id}       Set Variable    ${studies}[0][Study]
    Filter Studies      search_by=Study ID      text_search=${study_id}
    ${studies}        Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No active study found with text search ${studies}[0][Study]
    ${check_active}     Check Active Study Items Available
    View Active Study Details On      row=1   # MCT/MCT PEEK/CARDIAC EVENT/HOLTER/EXT HOLTER
    # Verify page header
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    # Verify current study details tab
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Study details
    # Verify Study (study page ) >< Overview info (Study details)
    ${study_overview}        Get Study Details Overview
    ${study_details}             Get Study Details
    ${actual_patient_name}      Set Variable    ${values_page_1}[First name] ${values_page_1}[Last name]
    ${actual_study_type}     Evaluate       '${values_page_3}[Study type]'.split()[0].strip()
    ${expected_study_duration}     Evaluate       '${study_details}[Study Information][Study duration]'.split()[0].strip()
    Run Keyword And Continue On Failure    Should Be Equal      ${study_overview}[Patient]         ${actual_patient_name}
    Run Keyword And Continue On Failure    Should Be Equal      ${study_overview}[Physician]         ${values_page_3}[Interpreting physician]
    Run Keyword And Continue On Failure    Should Be Equal      ${study_overview}[Facility]         ${values_page_3}[Facility]
    Run Keyword And Continue On Failure    Should Be Equal      ${study_details}[Study Information][Study type]         ${actual_study_type}
    Run Keyword And Continue On Failure    Should Not Be Equal      ${study_details}[Study Information][Status]        ⁃⁃
    Run Keyword And Continue On Failure    Should Be Equal      ${expected_study_duration}       ${values_page_3}[Study duration]d
    Run Keyword And Continue On Failure    Should Be Equal      ${study_details}[Study Information][Device ID]       ${values_page_3}[Device ID]
    Run Keyword And Continue On Failure    Should Not Be Equal      ${study_details}[Study Information][Low cell signal]        ⁃⁃
    Run Keyword And Continue On Failure    Should Not Be Equal      ${study_details}[Study Information][Start time]        ⁃⁃
    Run Keyword And Continue On Failure    Should Not Be Equal      ${study_details}[Study Information][End time]        ⁃⁃
    Run Keyword And Continue On Failure    Should Be Equal      ${study_details}[Study Information][Patient return visit]        ${values_page_3}[Patient return visit]
    Run Keyword And Continue On Failure    Should Be Equal      ${study_details}[Study Information][Clinician initials]        ${values_page_3}[Clinician Initials]
    Run Keyword And Continue On Failure    Should Not Be Equal      ${study_details}[Study Information][Reference code]        ⁃⁃
    Run Keyword And Continue On Failure    Should Be Equal      ${study_details}[Referring physician][Name]        ${values_page_3}[Referring physician]
    Run Keyword And Continue On Failure    Should Be Equal      ${study_details}[Interpreting physician][Name]        ${values_page_3}[Interpreting physician]
    Run Keyword And Continue On Failure    Should Be Equal      ${study_details}[Diagnosis][Primary diagnosis code]        ${values_page_4}[Other primary diagnosis code]
    Run Keyword And Continue On Failure    Should Be Equal      ${study_details}[Diagnosis][Secondary diagnosis code]        ${values_page_4}[Other secondary diagnosis code]
    Run Keyword And Continue On Failure    Should Be Equal      ${study_details}[Diagnosis][Patient medication]        ${values_page_4}[Patient medication]
    Run Keyword And Continue On Failure    Should Be Equal      ${study_details}[Physician amendments notes]      ${values_page_4}[Physician amendments notes]
    Navigate To Studies Page
    Filter Studies      search_by=Study ID      text_search=${study_id}
    Stop Active Studies    row=1
    ${studies}        Get Active Studies
    Run Keyword And Continue On Failure    Should Be Empty    ${studies}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-01: Can abort a Draft study (single type) running Biocore device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-01     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-02: Can abort a Draft study (FO type) running Biocore device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-02     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-03: Can abort a Draft study (single type) running Biocore Pro device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-03     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-04: Can abort a Draft study (FO type) running Biocore Pro device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-04     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-05: Can abort a Draft study (single type) running Bioflux device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-05     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-06: Can abort a Draft study (FO type) running Bioflux device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-06     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-07: Can abort a Starting study (single type) running Biocore device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-07     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-08: Can abort a Starting study (FO type) running Biocore device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-08     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-09: Can abort a Starting study (single type) running Biocore Pro device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-09     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-10: Can abort a Starting study (FO type) running Biocore Pro device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-10     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-11: Can abort a Starting study (single type) running Bioflux device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-11     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-12: Can abort a Starting study (FO type) running Bioflux device
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-12     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-13: Cannot abort a Ongoing study
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-13     manual      CP-2.25.1     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-14: Can abort a Biodirect study in status Not started-Created from Clinic for Biocore (single type)
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-14     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-15: Can abort a Biodirect study in status Not started-Created from Clinic for Biocore (FO type)
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-15     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-16: Can abort a Biodirect study in status Not started-Created from Clinic for Biocore Pro (single type)
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-16     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-17: Can abort a Biodirect study in status Not started-Created from Clinic for Biocore Pro (FO type)
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-17     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-18: Can abort a Biodirect study in status Not started-Created from Clinic for Bioflux (single type)
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-18     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-19: Can abort a Biodirect study in status Not started-Created from Clinic for Bioflux (FO type)
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-19     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-20: Cannot abort a Biodirect study in status Not started-Created from HeartSecure
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ABORT-20     manual      CP-2.25.1     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REFCODE-01: Normal study-Can manual send ref code when study status is Starting
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REFCODE-01     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REFCODE-02: Normal study-Can auto send ref code when study status is Started
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REFCODE-02     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REFCODE-03: Normal study-Can manual resend ref code
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REFCODE-03     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REFCODE-04: Biodirect Bioflux study-Auto send ref code when study status is Started
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REFCODE-04     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REFCODE-05: Biodirect study-Can manual send ref code when study status is Starting
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REFCODE-05     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REFCODE-06: Biodirect Biocore study-Not Auto send ref code when study status is Started
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REFCODE-06     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REFCODE-07: Biodirect Biocore Pro study-Not Auto send ref code when study status is Started
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REFCODE-07     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REFCODE-08: Biodirect HeartSecure study-Not Auto send ref code when study status is Started
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REFCODE-08     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-PATIENT-01: View the detailed information of the patient
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can view the detailed information of the patient
    ...
    ...     Precondition:
    ...     - The user is on the STUDY MANAGEMENT page
    ...
    ...     Test Steps:
    ...     1. Click the Patient Details tab
    ...     2. Observe the information on the screen
    ...
    ...     Expected Results:
    ...     1. The Patient Details tab is highlighted when it’s selected by the user and the screen displays the
    ...     following information:
    ...     - Header
    ...     + Study ID
    ...     + Patient Name
    ...     + Physician Name (Interpreting Physician)
    ...     + Facility Name
    ...     - Patient Information
    ...     + Name
    ...     + Gender
    ...     + Patient ID
    ...     + DOB
    ...     + Pacemaker (Yes/No)
    ...     - Patient Contact
    ...     + Address, city, state
    ...     + Zipcode
    ...     + Primary phone number
    ...     + Secondary phone number (optional)
    ...     + Email (optional)
    ...     - Secondary contact (optional)
    ...     + Name
    ...     + Phone number (text field)
    ...     + Relationship
    ...     + Email
    ...     - Insurance
    ...     + Insurance type
    ...     + The provider (optional)
    ...     + Pre-authorization required: two options: [Yes] or [No]
    ...     - Medical history: a medical history of the patient in the last 12 months
    ...     + Symptoms
    ...     + Symptom Frequency:
    ...     + Had a heart monitor before? - two options: [Yes] or [No]
#    Break to new case
#    ...     - For aborted studies, there shall be a message displayed on the top of the page:
#    ...     “This study has been aborted and will not be counted toward your billing.”

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-PATIENT-01        auto
    #    For aborted studies  # TBD
    Navigate To Studies Page
    Filter Studies    study_state=Active
    ${studies}      Get Active Studies
    ${study_id}     Set Variable        ${studies}[0][Study]
    Filter Studies    study_state=Active     search_by=Study ID      text_search=${study_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No studies found - with text search ${study_id}
    View Active Study Object On    _object=patient    study=${study_id}  device=${studies}[0][Device]     patient=${studies}[0][Patient]
    ${patient_info_view}     Get Patient Info View
    View Active Study Details On    study=${study_id}   # MCT/MCT PEEK/CARDIAC EVENT/HOLTER/EXT HOLTER
    # Verify page header
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    # Verify current study details tab
    Navigate To Study Details Tab    Patient details
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Patient details
    # Get study details overview and verify headers and contents
    ${study_overview}       Get Study Details Overview
    ${patient_details}      Get Study Patient Details
    ${expected_top_title}       Create List    Study ID     Patient     Physician       Facility
    ${current_top_title}        Evaluate    [k for k, v in ${study_overview}.items() if k != 'Biodirect']
    Run Keyword And Continue On Failure    Lists Should Be Equal          ${expected_top_title}        ${current_top_title}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${studies}[0][Study]         ${study_overview}[Study ID]
    Run Keyword And Continue On Failure    Should Be Equal                ${studies}[0][Patient]       ${study_overview}[Patient]
    Run Keyword And Continue On Failure    Should Be Equal                ${studies}[0][Facility]      ${study_overview}[Facility]
    # Expected attributes
    ${expected_ptinfo_attributes}           Create List    Name     Gender   ID     DOB     Height    Weight    Ethnicity    Pacemaker   ICD
    ${expected_ptcontact_attributes}        Create List    Address      Zip code      Phone number     2nd phone number     Email
    ${expected_secondcontact_attributes}    Create List    Name     Phone number    Relationship    Email
    ${expected_insurance_attributes}        Create List    Insurance type    Provider     Pre-authorization required
    ${expected_medicalhistory_attributes}   Create List    Symptoms the patient experienced     Symptom frequency       Used heart monitor
    # Actual attributes
    ${patient_info}           Evaluate    [k for k, v in ${patient_details}[Patient information].items()]
    ${patient_contact}        Evaluate    [k for k, v in ${patient_details}[Patient contact].items()]
    ${second_contact}         Evaluate    [k for k, v in ${patient_details}[Secondary contact].items()]
    ${insurance}              Evaluate    [k for k, v in ${patient_details}[Insurance].items()]
    ${medical_history}        Evaluate    [k for k, v in ${patient_details}[Medical history].items()]
    # Verify atrributes
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_ptinfo_attributes}               ${patient_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_ptcontact_attributes}            ${patient_contact}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_secondcontact_attributes}        ${second_contact}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_insurance_attributes}            ${insurance}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_medicalhistory_attributes}       ${medical_history}
    # Verify patient info
    Run Keyword And Continue On Failure    Should Be Equal    ${patient_info_view}[Patient information]     ${patient_details}[Patient information]
    Run Keyword And Continue On Failure    Should Be Equal    ${patient_info_view}[Patient contact]         ${patient_details}[Patient contact]     # Facing bug: Address ${patient_info_view} and ${patient_details} are not equals
    Run Keyword And Continue On Failure    Should Be Equal    ${patient_info_view}[Insurance]               ${patient_details}[Insurance]
    Run Keyword And Continue On Failure    Should Be Equal    ${patient_info_view}[Medical history]         ${patient_details}[Medical history]

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-01: View list of reports sent by the Call center of a study
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-01       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-02: Search Interim/EOU report by Report ID
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-02       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-03: Search Notification/Event report by Report ID
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-03       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-04: Check a tooltip shall displayed when user hovers over the error tag
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-04       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-05: Can sort report by Report ID/Last Modified/Type/Reviewed
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-05       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-06: Check the pagination tool is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-06       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-07: Check user can go to the Report View page by clicking the Edit report button
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-07       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-08: View Interim/EOU report details in study management page
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-08       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-09: View Notification/Event report details in study management page
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-09       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-10: Can mark the reports as reviewed/unreviewed
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-10       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-11: Can navigate to the report screen of the study management page by clicking the close button
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-11       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-12: MCT study/EOU old report format-Add Interpretation
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-12       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-13: MCT study/EOU new report format-Add Interpretation
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-13       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-14: MCT Peek study/EOU old report format-Add Interpretation
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-14       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-15: MCT Peek study/EOU new report format-Add Interpretation
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-15       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-16: Holter/Ext.Holter study/EOU old report format-Add Interpretation
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-16       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-17: Holter/Ext.Holter study/EOU new report format-Add Interpretation
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-17       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-18: Cardiac Event study/EOU old report format-Add Interpretation
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-18       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-19: EOU-Download report
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-19       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-20: Interim-Add Interpretation
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-20       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-21: Interim-Download report
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-21       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-22: Notification-Add Interpretation
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-22       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-23: Notification-Download report
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-23       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-24: Event-Add Interpretation
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-24       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-25: Event-Download report
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-25       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-26: Event-View ECG strip
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-26       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-27: Cannot view Event/Notification report in case the financial hold of facility is 80 or 90 days
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-27       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-28: Cannot view Interim/EOU report in case the financial hold of facility is 80 or 90 days
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-28       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-29: The report tab shall not be displayed for aborted studies
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-REPORT-29       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-01: View components displayed on Events list
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can view all of valid and closed events of a study
    ...
    ...     Precondition:
    ...     - The user is on the Events tab of the STUDY MANAGEMENT page of an active/completed study
    ...     - The event list on this page must be Valid and Closed
    ...
    ...     Test Steps:
    ...     1. Observe the screen
    ...     Expected Results:
    ...     1. The following components appear on the screen:
    ...     - Study ID (located in the header of the page)
    ...     - Patient Name (located in the header of the page)
    ...     - Physician Name (Interpreting Physician - located in the header of the page)
    ...     - Facility Name (located in the header of the page)
    ...     2. The Events tab is highlighted when it’s selected by the user*.*
    ...     3. There should be an Events tab where all of the events of the study will be stored
    ...     4. The events list of a specific study can be filtered with the filter row, which shall be, located right
    ...     below the tab. The filters will include such as:
    ...     - Trigger Time (Date picker)
    ...     - Event Type]
    ...     - By default, the events list of a specific study should be filtered by the total study duration date, and
    ...     the filter is set to All Type
    ...     - Refresh/Reload button -  to reload the amount of the events and the event card itself in the Events tab
    ...     5. All events of a specific study will display the following information in rows:
    ...     - Event ID:
    ...     + The ID of the event
    ...     + Display format: 5 digits
    ...     - Event Type: can be one of the following values: Manual, Tachy, Brady, Pause, AFib, Auto, and Sinus
    ...     - Trigger Time:
    ...     + The time when the event is triggered
    ...     + Display format: MM/DD/YYYY HH:MM: SS
    ...     Symptoms: can be one or a combination of the following values: Baseline, Resume Study, Evaluation Strip,
    ...     Chest Pain or Pressure, Shortness of Breath, Palpitations, Dizziness, Other and Not Specified.
    ...     - Technician Comment: inputs by technicians about the event
    ...     - Strip images: the user can view the strip images of the event, each image presents 10-second data,
    ...     the user also can navigate between strip images
    ...     - There should be a View ECG button at each event in the list. When the user clicks on the View ECG button
    ...     they will be redirected to the ECG Viewer page where the user can view the ECG strip of an event with
    ...     appropriate ECG viewing tools
    ...     6. On the Event tab screen, there shall be a disclaimer message hovering: “The following event(s) may or
    ...     may not have been finalized and their classification may change upon final review”
    ...     7. The user should also have the option to search for other events in the Events tab. The search bar and
    ...     the search field should be located in the same row with an event filter
    ...     - The search field should have a string saying: “Search by Event ID”
    ...     - The user can search for different events by its ID as well as use the event filter to filter the search
    ...     8. The user shall also be able to sort the list manually by clicking on the Sort button to sort the events
    ...     by date-newest to oldest and vis-a-vis
    ...     9. By default, the list loads a maximum of 10 events. The user can scroll down to load more events
#    Break to new case
#    ...     10. For aborted studies, this Events tab shall not be displayed

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-01-CP2.21.0: Display patient manual events, regardless of symptom, validitity, open or closed
    [Documentation]  Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-01-CP2.21.0       manual      R1     CP-2.21.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-02-CP2.21.0: Display auto events with status valid and closed
    [Documentation]  Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-02-CP2.21.0       manual      R1     CP-2.21.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-03-CP2.21.0: Not display manual events (Evaluation trips, baseline, resumed) unless status valid and closed
    [Documentation]  Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-03-CP2.21.0       manual      R1     CP-2.21.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-04-CP2.21.0: Check if an event is annotated with a section of ECG strip marked that strip shall be shown as annotated
    [Documentation]  Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-04-CP2.21.0       manual      R1     CP-2.21.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-02: Filter event list by range date of study duration
    [Documentation]  Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-02       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-03: Sort event list by descending/escending order
    [Documentation]  Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-03       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-04: Filter event list by event type
    [Documentation]  Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-04       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-05: Reload the event list by "Manual reload" button
    [Documentation]  Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-05       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-06: Search for an event by Event ID
    [Documentation]  Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-06       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-07: View ECG details of an event
    [Documentation]  Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-07       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-08: For aborted studies, this Events tab shall not be displayed
    [Documentation]  Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-EVENT-08       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-01:View details of the ECG Viewer tab
    [Documentation]     Author: Trinh Nguyen
    ...     Description: The user can details of the ECG Viewer tab
    ...
    ...     Precondition:
    ...     - The user is on the ECG Viewer tab of the STUDY MANAGEMENT page of an active/ACTIVE study
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-02: Check there is message displayed in case study running on Biodirect service has not been started by the patient
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-03: Check there is message displayed in case the event data of the selected date has not been uploaded to the system yet
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-03     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-04: The user can view the HR chart of a specific date by selecting the date from the drop-down selection
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-04     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-05: Check there is a message displayed in case the event data of the selected date has not been uploaded to the system yet
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-05     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-06: Check the Refresh button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-06     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-07: Check the Show event indicators checkbox is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-07     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-08: Check the Show event indicators checkbox is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-08     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-09: Check case there shall be highlighted blank spaces between the heartbeat lines in case there is no heart rate data at any time period in the HR chart
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-09     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-10: Check there shall be a vertical line indicating the time and the heart rate at that time when the user hovers over the HR chart
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-10     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-11: Check the label shall displayed the time and NA for HR at that time in case the user hovers over the period of time on the HR chart that does not have data
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-11     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-12: Check details of the ECG chart when the user clicks on the HR chart
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-12     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-13: Check the user cannot click on the HR chart of the time periods that do not have any data
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-13     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-14: Check details of the Event information bar under the HR chart when user clicks on the HR chart
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-14     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-15: Check behavior when the user clicks on the HR chart and drags
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-15     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-16: Check the Reset zoom button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-16     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-17: Check case the user selects the vertical line and then zooms in the HR chart
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-17     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-18: Check the user can only zoom in and zoom out one time
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-18     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-19: Check case the user clicks on an event in the event list while zooming in
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-19     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-20: Check details of the ECG chart
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-20     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-21: Check case the user clicks on an event in the event list while zooming in
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-21     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-22: Check Speed filter on ECG chart is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-22     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-23: Check Gain filter on ECG chart is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-23     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-24: Check High Pass filter tool on ECG chart is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-24     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-25: Check Low Pass filter tool on ECG chart is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-25     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-26: Check Show/Hide Channels button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-26     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-27: Check the Beat marker tool is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-27     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-28: Check the View all strip button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-28     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-29: Check user can Add beat marker
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-29     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-30: Check user can Remove beat marker
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-30     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-31: Check Horizontal Caliper button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-31     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-32: Check Vertical Caliper button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-32     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-33: Check Beat Calipers button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-33     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-34: Check Text Annotation button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-34     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-35: Check Mark 10 Sec button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-35     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-36: Check Mark 20 Sec button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-36     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-37: Check Mark a Pattern button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-37     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-38: Check Hide Beat Markers button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-38     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-39: Check details of the Event section
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-39     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-40: Check result when user clicks on the row of an event
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-40     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-41: Check the event type filter is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-41     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-42: Check the user can access the ECG Viewer Guideline
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-42     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-43: Check the Do not show this again checkbox is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-43     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-44: Check the Pagination tool below the Event lists is working prorerly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-44     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-45: The ECG Viewer tab shall not be dislayed for aborted studies
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-ECG-VIEWER-45     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-INSTANT-01: Create an manual Instant report
    [Documentation]  Author: Nhan Nguyen
    ...     Description: The user can create an Instant report
    ...
    ...     Precondition: 
    ...     1. User is on Instant reports tab.
    ...     2. The calendar is enabled when study start date > today.
    ...     3. Some study data has been uploaded.
    ...
    ...     Test Steps:
    ...     1. On the Instant reports tab, click "Generate Report."
    ...     2. Select a time frame from the calendar that does NOT overlap with any existing reports
    ...         The calendar is enabled: study start date > today
    ...     3. Click "Create Instant Report"
    ...
    ...     Expected Results:
    ...     1. A new record is created for the report.
    ...     2. A snackbar informs the user "Your request is being processed. The report will be ready within an hour."
    ...  
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/14/2025-TamHo
    ...
    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-INSTANT-01       manual    R1      CP-2.29.0    
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-INSTANT-02: Create an Instant Report With Overlapping Time Frame (No New Data Uploaded) and The previous report is generated
    [Documentation]  Author: Nhan Nguyen
    ...     Description: The user create an Instant Report for a time frame that overlaps an existing report, but no new data has been uploaded and The previous report is generated
    ...
    ...     Precondition:
    ...     1. User is on Instant reports tab.
    ...     2. The calendar is enabled when study start date > today.
    ...     3. Existing report(s) already generated for the overlapping date range.
    ...     4. No new data has been uploaded.
    ...
    ...     Test Steps:
    ...     1. On the Instant reports tab, click "Generate Report."
    ...     2. Select a time frame from the calendar that overlaps an existing report
    ...         The calendar is enabled: study start date > today
    ...     3. Click "Create Instant Report"
    ...
    ...     Expected Results:
    ...     1. Display an alert on the calendar: "A report already exists for the selected time period."
    ...     2. Provide a link to navigate to the previously generated report.
    ...     3. No new report is generated.
    ...
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/14/2025-TamHo
    ...
    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-INSTANT-02       manual    R2      CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-INSTANT-03: Create an Instant Report With Overlapping Time Frame (No New Data Uploaded) and The previous report is generating
    [Documentation]  Author: Nhan Nguyen
    ...     Description: The user create an Instant Report for a time frame that overlaps an existing report, but no new data has been uploaded and The previous report is generating
    ...
    ...     Precondition:
    ...     1. User is on Instant reports tab.
    ...     2. The calendar is enabled when study start date > today.
    ...     3. Existing report(s) generating for the overlapping date range.
    ...     4. No new data has been uploaded.
    ...
    ...     Test Steps:
    ...     1. On the Instant reports tab, click "Generate Report."
    ...     2. Select a time frame from the calendar that overlaps an existing report
    ...         The calendar is enabled: study start date > today
    ...     3. Click "Create Instant Report"
    ...
    ...     Expected Results:
    ...     1. Display an alert on the calendar: "A report for the selected time period is currently being generated and will be ready within an hour."
    ...     2. No new report is generated.
    ...
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/14/2025-TamHo
    ...
    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-INSTANT-03       manual    R2      CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-INSTANT-04: Create an Instant Report With Overlapping Time Frame (New Data Uploaded)
    [Documentation]  Author: Nhan Nguyen
    ...     Description: The user creates an Instant Report for a time frame that overlaps an existing report, and new data has been uploaded since the previous report.
    ...
    ...     Precondition:
    ...     1. User is on Instant reports tab.
    ...     2. The calendar is enabled when study start date > today.
    ...     3. Existing report(s) already generated for the overlapping date range.
    ...     4. NNew data has been uploaded since the last report.
    ...
    ...     Test Steps:
    ...     1. On the Instant reports tab, click "Generate Report."
    ...     2. Select a time frame from the calendar that overlaps an existing report
    ...         The calendar is enabled: study start date > today
    ...     3. Click "Create Instant Report"
    ...
    ...     Expected Results:
    ...     1. A new record is created for the report.
    ...     2. A snackbar informs the user "Your request is being processed. The report will be ready within an hour."
    ...
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/14/2025-TamHo
    ...
    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-INSTANT-04       manual    R1      CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-INSTANT-05: Create an Instant Report With Overlapping Time Frame (No New Data Uploaded) and The previous report is generated + Artifact
    [Documentation]  Author: Nhan Nguyen
    ...     Description: The user create an Instant Report for a time frame that overlaps an existing report, but no new data has been uploaded and The previous report is generated+ Artifact
    ...
    ...     Precondition:
    ...     1. User is on Instant reports tab.
    ...     2. The calendar is enabled when study start date > today.
    ...     3. There is an existing Case Report artifact for the selected time frame.
    ...     4. No new data has been uploaded.
    ...
    ...     Test Steps:
    ...     1. On the Instant reports tab, click "Generate Report."
    ...     2. Select a time frame from the calendar that overlaps an existing report
    ...         The calendar is enabled: study start date > today
    ...     3. Click "Create Instant Report"
    ...
    ...     Expected Results:
    ...     1. Display an alert on the calendar: "A report already exists for the selected time period."
    ...     2. No new report is generated.
    ...
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/14/2025-TamHo
    ...
    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-INSTANT-05       manual    R2      CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-INSTANT-06: View the List of Instant Reports
    [Documentation]  Author: Nhan Nguyen
    ...     Description: View the list of Instant Reports that have been generated + generating for a study, including reports created manually or automatically
    ...
    ...     Precondition:
    ...     1. User is on Instant reports tab.
    ...     2. There is at least one report in the list with the status "Generated" or "Generating"
    ...
    ...     Test Steps:
    ...     1. User is On the Instant reports tab
    ...
    ...     Expected Results:
    ...     1. The list of Instant Reports is displayed, showing reports generated either:  
    ...         - Manually by the clinic user
    ...         - Automatically after all study data is uploaded upon study completion
    ...     2. Reports are sorted by "Generated Time," from the latest to the oldest.  
    ...     3. Each report in the list displays the following details:  
    ...         - Report ID: Auto-generated in the format 'XXXXX' (starts at 00001 and increments by 1)
    ...         - Date of Service: Start and end dates the report covers
    ...         - Analysis Time: Total duration of data analyzed and included in the report
    ...         - Generated Time: Date and time the report was successfully generated
    ...         - Generated By: 'Clinic' if manually generated; 'Auto' if automatically generated
    ...         - Status:  
    ...                "Generating" if the report is still processing (includes status icon and tooltip explanation)  
    ...                "Generated" if the report has been successfully created  
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/14/2025-TamHo
    ...
    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-INSTANT-06       manual    R1      CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-INSTANT-07: View a Generated Instant Report
    [Documentation]  Author: Nhan Nguyen
    ...     Description: View the details of a Generated Instant Report by clicking on it in the Instant Reports list.
    ...
    ...     Precondition:
    ...     1. User is on Instant reports tab.
    ...     2. There is at least one report in the list with the status "Generated"
    ...
    ...     Test Steps:
    ...     1. User is On the Instant reports tab
    ...     2. Click on the icon view of the Generated report
    ...
    ...     Expected Results:
    ...     1. The system opens the detail of selected report.
    ...        
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/14/2025-TamHo
    ...
    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-INSTANT-07       manual    R1      CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-INSTANT-08: Check the pagniation tool is working
    [Documentation]  Author: Nhan Nguyen
    ...     Description: Navigate through the Instant Reports list using pagination when there are more than 10 reports.
    ...
    ...     Precondition:
    ...     1. User is on Instant reports tab.
    ...     2. There are more than 10 Instant Reports available for the selected study.
    ...
    ...     Test Steps:
    ...     1. User is On the Instant reports tab
    ...     2. Click ">" to navigate to the next page of reports
    ...     3. Click "<" to return to the previous page
    ...
    ...     Expected Results:
    ...     1. The system displays the first 10 reports on page 1 by default.
    ...     2. Click ">", The system displays the next set of 10 reports.
    ...     3. Click "<", The system displays the prior set of 10 reports.
    ...
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/14/2025-TamHo
    ...
    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-INSTANT-08       manual    R1      CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-INSTANT-09: Instant-Download report
    [Documentation]  Author: Nhan Nguyen
    ...     Description: User can download Instant report
    ...
    ...     Precondition:
    ...     1. The user is on the Instant Report Details
    ...
    ...     Test Steps:
    ...     1. Click the Download button.
    ...     2. Observe the system behavior.
    ...
    ...     Expected Results:
    ...     1. The system downloads the Instant Report as a PDF file
    ...
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/25/2025-TamHo
    ...
    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-INSTANT-09       manual    R1      CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-SORT-INSTANT-01: Sort the list of Instant reports
    [Documentation]  Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-SORT-INSTANT-01       manual    R1    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-INSTANT-01-CP2.24.0: View message when study is Draft, Starting, Ongoing, Completed
    [Documentation]  Author: Nhan Nguyen
    ...     Description: The user can create an Instant report
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     **Others
    ...     - Last updated: 07/25/2024-Nhannguyen
    ...
    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-INSTANT-01-CP2.24.0      manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-RETURN-01-CP2.16.8: Return Status tab not available for Test facility
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-RETURN-01-CP2.16.8       manual     R1     CP-2.16.8
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-RETURN-02-CP2.16.8: For Active facility - Edit Return status
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click "Device returned" toggle
    ...     2. Select or deselect the received items, the save the changes
    ...
    ...     Expected Results:
    ...     1. All checkboxes in Recieved items are selected
    ...     2. All updates are saved and the device is marked as returned and removed from Waiting for return tab

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-RETURN-02-CP2.16.8       manual     R1     CP-2.16.8
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-RETURN-03-CP2.16.8: For Active facility - Edit Notes
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-RETURN-03-CP2.16.8       manual     R1     CP-2.16.8
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-RETURN-04-CP2.16.8: For Active facility - Create a return shipping label
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-RETURN-04-CP2.16.8       manual     R1     CP-2.16.8
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-RETURN-05-CP2.16.8: For Active facility - Check "Device returned" toggle disabled
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     The toggle is disabled in the following cases:
    ...     - If the device is included in a newer study
    ...     - If the device is RMA and received by Biotricity Productions

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-RETURN-05-CP2.16.8       manual     R1     CP-2.16.8
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-DETAILS-RETURN-06-CP2.16.8: For Active facility - View Return Status of FO study
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Go to Study Details page of FO study and is on Return Status tab
    ...     2. Click "View Now" button
    ...
    ...     Expected Results:
    ...     1. Display message "The return status of a follow-on study is shown in its Holter study. Click “View Now” to be redirected to the Holter study."
    ...     2. Redirect the user to the Holter study

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-RETURN-06-CP2.16.8       manual     R1     CP-2.16.8
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-DETAILS-BIODIRECT-STATUS-01:Display Shipping Label Details for Sending Device Status
    [Documentation]     Author: Tam Ho
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

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-BIODIRECT-STATUS-01       manual     R1     CP-2.25.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-DETAILS-BIODIRECT-STATUS-02:Display Shipping Label Details for Returning Device Status
    [Documentation]     Author: Tam Ho
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

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-BIODIRECT-STATUS-02       manual     R1     CP-2.25.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-DETAILS-BIODIRECT-STATUS-03: Display message "No shipping label created yet" when Study Biodirect has not shipment label
    [Documentation]  Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     1. Study Biodirect has not shipment label (Outbound & Inbound)
    ...
    ...     Test Steps:
    ...     
    ...
    ...     Expected Results:
    ...     1. Display message "No shipping label created yet"
    ...
    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-DETAILS-BIODIRECT-STATUS-03      manual    CP-2.25.2    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-01: Can change study type of a study
    [Documentation]     Author: Trinh Nguyen
    ...     Description: The user can change the study type with the study has Biocore/Biotres device does not have
    ...     the auto-events detection enabled and firmware version has not been updated to the latest
    ...
    ...     Precondition:
    ...     1. There is HOLTER/EXTENDED HOLTER study with status is "ongoing" within the first 12 or 48 hours and
    ...        device status is online
    ...     2. This study has a Biocore/Biotres device does not have the auto-events dectection enabled (process on the Sales portal)
    ...     3. The firmwave version of Biocore/Biotres device has not been updated to the latest
    ...     4. Go to the Study Details tab in the Active tab of the study that meet the criteria listed above
    ...
    ...     Test Steps:
    ...     1. Click on the Edit button in STUDY INFORMATION section
    ...     2. Select HOLTER/EXTENDED HOLTER study type
    ...     3. Click the Save button
    ...     4. Click the Cancel button on Change study information pop-up
    ...     5. Click the Change button on Change study information pop-up

    ...     Expected Results:
    ...     1. At step 1, the Study information modal shall be displayed
    ...     2. At step 2, the selected study type shall be displayed
    ...     3. At step 3, after clicking the Save button, a confirmation message stating: "Are you sure you want to
    ...     apply the changes" shall be displayed, there are 2 buttons: Cancel, Change
    ...     4. At step 4, after clicking the Cancel button shall dismiss the changes
    ...     5. At step 5, after cllicking the Change button shall apply the changes, a message "Update successfully!"
    ...     shall display

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-01       auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    View Active Study Details On    row=1
    ${study_info}       Get Study Details
    ${current_study_info}       Set Variable    ${study_info}[Study Information]
    ${edited_items}     Create Dictionary       study_type=EXTENDED HOLTER      is_change=${False}      is_cancel=${True}
    Edit Study Details    study_information=${edited_items}
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    View Active Study Details On    row=1
    ${study_info}       Get Study Details
    ${expected_study_info}       Set Variable    ${study_info}[Study Information]
    Run Keyword And Continue On Failure    Should Be Equal    ${current_study_info}[Study type]         ${expected_study_info}[Study type]
    ${edited_items}     Create Dictionary       study_type=EXTENDED HOLTER
    Edit Study Details    study_information=${edited_items}
    ${msg}      Get Toast Success Message
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        Update Study Successfully!
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-02: Can change study type of a study
    [Documentation]     Author: Trinh Nguyen
    ...     Description: The user can change the study type with the study has Biocore/Biotres device does not have
    ...     the auto-events detection enabled and firmware version has been updated to the latest
    ...
    ...     Precondition:
    ...     1. There is HOLTER/EXTENDED HOLTER study with status is "ongoing" within the first 12 or 48 hours and
    ...     device status is online
    ...     2. This study has a Biocore/Biotres device does not have the auto-events dectection enabled (process on the Sales portal)
    ...     3. The firmwave version of Biocore/Biotres device has been updated to the latest
    ...     4. Go to the Study Details tab in the Active tab of the study that meet the criteria listed above
    ...
    ...     Test Steps:
    ...     1. Click on the Edit button in STUDY INFORMATION section
    ...     2. Select HOLTER/EXTENDED HOLTER study type
    ...     3. Click the Save button
    ...     4. Click the Cancel button on Change study information pop-up
    ...     5. Click the Change button on Change study information pop-up

    ...     Expected Results:
    ...     1. At step 1, the Study information modal shall be displayed
    ...     2. At step 2, the selected study type shall be displayed
    ...     3. At step 3, after clicking the Save button, a confirmation message stating: "Are you sure you want to
    ...     apply the changes" shall be displayed, there are 2 buttons: Cancel, Change
    ...     4. At step 4, after clicking the Cancel button shall dismiss the changes
    ...     5. At step 5, after cllicking the Change button shall apply the changes, a message "Update successfully!"
    ...     shall display

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-02        auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    View Active Study Details On    row=1
    ${new_type}     Create Dictionary       study_type=EXTENDED HOLTER
    Edit Study Details    study_information=${new_type}
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    View Active Study Details On    row=1
    ${new_type}     Create Dictionary       study_type=HOLTER
    Edit Study Details    study_information=${new_type}
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Be Equal    ${studies}[0][Study type]     HOLTER
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-03: Can change study type of a study
    [Documentation]     Author: Trinh Nguyen
    ...     Description: The user can change the study type with the study has Biocore/Biotres device has
    ...     the auto-events detection enabled and firmware version has not been updated to the latest
    ...
    ...     Precondition:
    ...     1. There is HOLTER/EXTENDED HOLTER study with status is "ongoing" within the first 12 or 48 hours and
    ...     device status is online
    ...     2. There is a Biocore/Biotres device has the auto-events dectection enabled (process on the Sales portal)
    ...     3. The firmwave version of Biocore/Biotres device has not been updated to the latest
    ...     4. Go to the Study Details tab in the Active tab of the study that meet the criteria listed above
    ...
    ...     Test Steps:
    ...     1. Click on the Edit button in STUDY INFORMATION section
    ...     2. Select HOLTER/EXTENDED HOLTER study type
    ...     3. Click the Save button
    ...     4. Click the Cancel button on Change study information pop-up
    ...     5. Click the Change button on Change study information pop-up

    ...     Expected Results:
    ...     1. At step 1, the Study information modal shall be displayed
    ...     2. At step 2, the selected study type shall be displayed
    ...     3. At step 3, after clicking the Save button, a confirmation message stating: "Are you sure you want to
    ...     apply the changes" shall be displayed, there are 2 buttons: Cancel, Change
    ...     4. At step 4, after clicking the Cancel button shall dismiss the changes
    ...     5. At step 5, after cllicking the Change button shall apply the changes, a message "Update successfully!"
    ...     shall display

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-03       manual     CP-2.14.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-04: Can change study type of a study
    [Documentation]     Author: Trinh Nguyen
    ...     Description: The user can change the study type with the study has Biocore/Biotres device has
    ...     the auto-events detection enabled and firmware version has been updated to the latest
    ...
    ...     Precondition:
    ...     1. There is MCT, MCT PEEK, CARDIAC EVENT, HOLTER, EXTENDED HOLTER study with status is "ongoing" within the
    ...     first 12 or 48 hours and device status is online
    ...     2. There is a Biocore/Biotres device has the auto-events dectection enabled (process on the Sales portal)
    ...     3. The firmwave version of Biocore/Biotres device has been updated to the latest
    ...     4. Go to the Study Details tab in the Active tab of the study that meet the criteria listed above
    ...
    ...     Test Steps:
    ...     1. Click on the Edit button in STUDY INFORMATION section
    ...     2. Select MCT/MCT PEEK/CARDIAC EVENT/HOLTER/EXTENDED HOLTER/HOLTER AND FOLLOW ON STUDY study type
    ...     3. Click the Save button
    ...     4. Click the Cancel button on Change study information pop-up
    ...     5. Click the Change button on Change study information pop-up
    ...     6. Hover over the Edit button STUDY INFORMATION section

    ...     Expected Results:
    ...     1. At step 1, the Study information modal shall be displayed
    ...     2. At step 2, the selected study type shall be displayed. In case user selected the HOLTER AND FOLLOW ON STUDY type,
    ...     the Follow on study type and Follow on study duration fields shall be displayed. The Patient return visit
    ...     will be updated according to the duration of the Holter study and follow on study
    ...     - The Follow on study type can be one of the following types:
    ...      . MCT
    ...      . MCT PEEK
    ...      . CARDIAC EVENT
    ...      . HOLTER
    ...      . EXTENDED HOLTER
    ...     3. At step 3, after clicking the Save button, a confirmation message stating: "Are you sure you want to
    ...     apply the changes" shall be displayed, there are 2 buttons: Cancel, Change
    ...     4. At step 4, after clicking the Cancel button shall dismiss the changes
    ...     5. At step 5, after cllicking the Change button shall apply the changes, a message "Update successfully!"
    ...     shall display
    ...     - For the selected is HOLTER AND FOLLOW ON STUDY type, after saving the changes, the FOLLOW-ON STUDY TRACKING
    ...     section shall be displayed in the Study details tab as well
    ...     6. At step 6, after hovering the Edit button, a tooltip with the following message shall be displayed: "Study
    ...     Information changes are being applied, please hold." and Edit button shall be disabled

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-04       manual     CP-2.14.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-05: Can change study type of a study
    [Documentation]     Author: Trinh Nguyen
    ...     Description: The user can change the study type the Ongoing Holter (first study) with the study has Biocore/Biotres
    ...     device has the auto-events detection enabled and firmware version has been updated to the latest
    ...
    ...     Precondition:
    ...     1. There is an ongoing HOLTER and FOLLOW ON study with status is "ongoing" within the first 12 or 48 hours
    ...     and device status is online
    ...     2. There is a Biocore/Biotres device has the auto-events dectection enabled (process on the Sales portal)
    ...     3. The firmwave version of Biocore/Biotres device has been updated to the latest
    ...     4. Go to the Study Details tab in the Active tab of the study that meet the criteria listed above
    ...
    ...     Test Steps:
    ...     1. Click on the Edit button in STUDY INFORMATION section of the HOLTER study (first study)
    ...     2. Select MCT/MCT PEEK/CARDIAC EVENT/HOLTER/EXTENDED HOLTER study type
    ...     3. Click the Save button
    ...     4. Click the Cancel button on Change study information pop-up
    ...     5. Click the Change button on Change study information pop-up
    ...     6. Hover over the Edit button in STUDY INFORMATION section

    ...     Expected Results:
    ...     1. At step 1, the Study information modal shall be displayed
    ...     2. At step 2, the selected study type shall be displayed. The Follow on study type an Follow on study duration
    ...     fields shall be removed and a message shall be displayed under the Study type field: "Caution: The follow
    ...     on study will be removed."
    ...     3. At step 3, after clicking the Save button, a confirmation message stating: "Are you sure you want to
    ...     apply the changes" shall be displayed, there are 2 buttons: Cancel, Change
    ...     4. At step 4, after clicking the Cancel button shall dismiss the changes
    ...     5. At step 5, after cllicking the Change button shall apply the changes, a message "Update successfully!"
    ...     shall display
    ...     - The Follow on study type an Follow on study duration fields shall be removed in the Study details tab
    ...     6. At step 6, after hovering the Edit button, a tooltip with the following message shall be displayed: "Study
    ...     Information changes are being applied, please hold." and Edit button shall be disabled

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-06: Biocore/Biotres (No Auto tag + FW <1.5.0)-Can change to Holter/Ext.Holter study type when study duration <=2d and ongoing time <= first 12h
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-06      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-07: Biocore/Biotres (No Auto tag + FW <1.5.0)-Can change to Holter/Ext.Holter study type when study duration >2d and ongoing time >= first 48h
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-07      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-08: Biocore/Biotres (No Auto tag + FW <1.5.0)-Cannot change to MCT/MCT Peek/Cardiac event/HnFO study type
    [Documentation]     Author: Nhan Nguyen
    ...     Description: Biocore/Biotres (No Auto tag + FW <1.5.0)-Cannot change to MCT/MCT Peek/Cardiac event study type
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-08      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-09: Biocore/Biotres (No Auto tag + FW >=1.5.0)-Can change to Holter/Ext.Holter study type when study duration <=2d and ongoing time <= first 12h
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-09      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-10: Biocore/Biotres (No Auto tag + FW >=1.5.0)-Can change to Holter/Ext.Holter study type when study duration >2d and ongoing time <= first 48h
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-10      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-11: Biocore/Biotres (No Auto tag + FW >=1.5.0)-Cannot change to MCT/MCT Peek/Cardiac/HnFO event study type
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-11    manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-12: Biocore/Biotres (Auto tag + FW <1.5.0)-Can change to Holter/Ext.Holter study type when study duration <=2d and ongoing time <= first 12h
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-12      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-13: Biocore/Biotres (Auto tag + FW <1.5.0)-Can change to Holter/Ext.Holter study type when study duration >2d and ongoing time <= first 48h
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-13      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-14: Biocore/Biotres (Auto tag + FW >=1.5.0)-Can change to any study type when study duration <=2d and ongoing time <= first 12h
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-14    manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-15: Biocore/Biotres (Auto tag + FW >=1.5.0)-Can change to any study type when study duration >2d and ongoing time <= first 48h
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-15    manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-16: Bioflux-Can change to any study type when study duration <=2d and ongoing time <= first 12h
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-16    manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-17: Bioflux-Can change to any study type when study duration > 2d and ongoing time <= first 48h
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-17    manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-18: Biocore/Biotres-Cannot change type when study duration <= 2d and ongoing time > first 12h
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-18      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-19: Biocore/Biotres-Cannot change type when study duration > 2d and ongoing time > first 48h
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-19      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-20-CP2.25.3: Biocore Pro-Cannot change type when study duration <= 2d and ongoing time > first 12h
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-20-CP2.25.3      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-21-CP2.25.3: Biocore Pro-Cannot change type when study duration > 2d and ongoing time > first 48h
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-21-CP2.25.3      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-20: Bioflux-Cannot change type when study duration <= 2d and ongoing time > first 12h
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-20      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-21: Bioflux-Cannot change type when study duration > 2d and ongoing time > first 48h
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-21      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-22: Biocore/Biotres-Cannot change type for Test study
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-22      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-22-CP2.25.3: Biocore Pro-Cannot change type for Test study
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-22-CP2.25.3      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-23: Bioflux-Cannot change type for Test study
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-23      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-24: Biocore/Biotres-Cannot change type when study status is Not started/Draft/Starting
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-24      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-24-CP2.25.3: Biocore Pro-Cannot change type when study status is Not started/Draft/Starting
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-24-CP2.25.3      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-25: Bioflux-Cannot change type when study status is Not started/Draft/Starting
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-25      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-26: Biocore/Biotres-Cannot change type when device is offline
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-26      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-26-CP2.25.3: Biocore Pro-Cannot change type when device is offline
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-26-CP2.25.3      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-27: Bioflux-Cannot change type when device is offline
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-27      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-28: Biocore/Biotres-Cannot change type when study status is Completed/Done
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-28      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-28-CP2.25.3: Biocore Pro-Cannot change type when study status is Completed/Done
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-28-CP2.25.3      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-29: Bioflux-Cannot change type when study status is Completed/Done
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-29      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-30: Bioflux-Cannot change type when study status is Completed/Done
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-30      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-31: Can change duration between 1 and 3d for Holter study
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-31      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-31-CP2.25.3: Can change duration between 1 and 72h for Holter study
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-31-CP2.25.3      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-32: Can change duration between 1 and 30d for MCT/MCT peek/Cardiac/Ext.Holter study
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-32      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-33: Cannot change duration when device is offline
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-33      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-34: Cannot change duration when study status is aborted
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-34      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-35: Cannot change duration when study status is Not started/Draft/Starting
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-35      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-36: Edit Patient return visit
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-36      auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    View Active Study Details On    row=1
    # Verify page header
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    # Verify current study details tab
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Study details
    ${date}     Get Study Details Return Visit
    ${convert_to_date}      Evaluate    [date.split('/')[1] for date in ${date}]
    ${study_information}      Create Dictionary    patient_return_visit=${convert_to_date}[0]     is_save=${False}     is_change=${False}
    Edit Study Details       study_information=${study_information}
    ${noti_patient_return}       Get Noti Patient Return Visit
    Run Keyword And Continue On Failure    Should Be Equal    ${noti_patient_return}[Notification]        The End of Use report may not be available at this time. The patient return visit date is within 3 business days of the end of the study.
    Edit Study Details Study Information       patient_return_visit=${convert_to_date}[1]      is_save=${False}     is_change=${False}
    ${noti_patient_return}       Get Noti Patient Return Visit
    Run Keyword And Continue On Failure    Should Be Equal    ${noti_patient_return}[Notification]        The End of Use report may not be available at this time. The patient return visit date is within 3 business days of the end of the study.
    Edit Study Details Study Information       patient_return_visit=${convert_to_date}[2]      is_save=${False}     is_change=${False}
    ${noti_patient_return}       Get Noti Patient Return Visit
#    ${noti_patient_return}       Get Noti Patient Return Visit
    Edit Study Details Study Information       is_save=${True}     is_change=${True}
#    Run Keyword And Continue On Failure    Should Be Empty    ${noti_patient_return}[Notification]
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    View Active Study Details On    row=1
    ${studies}      Get Study Details
    ${expected_patient_return_visit}      Evaluate     {k: v for k, v in ${studies}[Study Information].items()}
    Run Keyword And Continue On Failure    Should Contain         ${noti_patient_return}[Date]         ${expected_patient_return_visit}[Patient return visit]
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-37: Change Referring physician
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-37      auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    View Active Study Details On    row=1
    # Verify page header
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    # Verify current study details tab
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Study details
    ${referring_physician}      Create Dictionary    referring_physician=${STUDY_ID_REFERRING}     is_change=${False}
    Edit Study Details       referring_physician=${referring_physician}
    ${current_referring_physician}       Get Current Referring Physician
    Edit Study Details Referring Physician       is_change=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    View Active Study Details On    row=1
    ${studies}      Get Study Details
    ${expected_referring_physician_infor}      Evaluate     {k: v for k, v in ${studies}[Referring physician].items()}
    Run Keyword And Continue On Failure    Should Contain         ${current_referring_physician}[Referring physician]         ${expected_referring_physician_infor}[Name]
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-38: Change Interpreting physician
    [Documentation]     Author: Nhan Nguyen
    ...     Description: The user to change the interpreting physician
    ...
    ...     Precondition:
    ...     The user login with account user technician
    ...
    ...     Test Steps:
    ...     1. Navigate to the "Edit study details" screen
    ...     2. Change interpreting physician
    ...     3. Back to the "Study Management" screen
    ...     4. Obsever the result
    ...
    ...     Expected Results:
    ...     4. Change the interpreting physician successfull
    ...
    ...     **Other**:
    ...     Update date: 10/19/2023
    ...     Author: Thang Tran
    ...
    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-38     auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    View Active Study Details On    row=1
    # Verify page header
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    # Verify current study details tab
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Study details
    ${interpreting_physician}      Create Dictionary    interpreting_physician=${STUDY_ID_REFERRING}     is_change=${False}
    Edit Study Details       interpreting_physician=${interpreting_physician}
    ${current_referring_physician}       Get Current Interpreting Physician
    Edit Study Details Interpreting Physician       is_change=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    View Active Study Details On    row=1
    ${studies}      Get Study Details
    ${expected_interpreting_physician}      Evaluate     {k: v for k, v in ${studies}[Interpreting physician].items()}
    Run Keyword And Continue On Failure    Should Contain         ${current_referring_physician}[Interpreting physician]         ${expected_interpreting_physician}[Name]
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-39: Edit Diagnosis info and Patient medication
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-39      auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    View Active Study Details On    row=1
    # Verify page header
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    # Verify current study details tab
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Study details
    ${diagnosis}      Create Dictionary    primary_diagnosis_code=I47.2 - Ventricular tachycardia     secondary_diagnosis_code=I48.3 - Typical atrial flutter      patient_medication=medication test      is_change=${False}
    Edit Study Details       diagnosis=${diagnosis}
    ${current_diagnosis}       Get Current Diagnosis
    Edit Study Details Diagnosis       is_change=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    View Active Study Details On    row=1
    ${studies}      Get Study Details
    ${expected_diagnosis}      Evaluate     {k: v for k, v in ${studies}[Diagnosis].items()}
    Run Keyword And Continue On Failure    Should Contain         ${current_diagnosis}[Primary diagnosis code]         ${expected_diagnosis}[Primary diagnosis code]
    Run Keyword And Continue On Failure    Should Contain         ${current_diagnosis}[Secondary diagnosis code]         ${expected_diagnosis}[Secondary diagnosis code]
    Run Keyword And Continue On Failure    Should Contain         ${current_diagnosis}[Patient medication]         ${expected_diagnosis}[Patient medication]
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-40: The Edit Physician admendments notes session is not displayed
    [Documentation]     Author: Nhan Nguyen
    ...     Description: The Edit Physician admendments notes session is not displayed
    ...
    ...     Precondition:
    ...     The user login with account user technician
    ...
    ...     Test Steps:
    ...     1. Navigate to the "Edit study details" screen
    ...
    ...     Expected Results:
    ...     1. The Edit Physician admendments notes session is not displayed
    ...
    ...     **Other**:
    ...     Update date: 10/19/2023
    ...     Author: Thang Tran
    ...
    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-40      auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    View Active Study Details On    row=1
    # Verify page header
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    # Verify current study details tab
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Study details
    ${title_study_detail_info}    Get Current Session Edit Study Detail
    Run Keyword And Continue On Failure    Should Not Be Empty                   ${title_study_detail_info}
    Run Keyword And Continue On Failure    List Should Not Contain Value         ${title_study_detail_info}         Physician admendments notes
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-41: Bioflux-Can resend ref code when study status is Started/Ongoing
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-41      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-42: Bioflux-Cannot resend ref code when study status is Draft/Starting/Completed/Done
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-42      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-43: Bioflux-Cannot resend ref code if the duration between 2 clicking times is less than 5 minutes
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-43      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-44: Biocore/Biotres-Can resend ref code for Holter/Ext.Holter when study status is Started/Ongoing/Completed
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-44      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-45: Biocore/Biotres-Cannot resend ref code for Holter/Ext.Holter when study status is Draft/Starting/Done
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-45      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-46: Biocore/Biotres-Can resend ref code for MCT/MCT Peek/Cardiac event when study status is Draft/Starting/Ongoing/Completed
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-46     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-47: Biocore/Biotres-Cannot resend ref code for MCT/MCT Peek/Cardiac event when study status is Done
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-47      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-48: Biocore/Biotres-Cannot resend ref code if the duration between 2 clicking times is less than 5 minutes
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-STUDY-INFO-48      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    ${study_id}     ${friendly_id}      Api Study - Create
#    Navigate To Studies Page
#    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
#    ${studies}      Get Active Studies
#    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
#    View Active Study Details On    row=1
#    ${edited_items}     Create Dictionary       study_type=EXTENDED HOLTER
#    Edit Study Details    study_information=${edited_items}
#    Navigate To Studies Page
#    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
#    ${studies}      Get Active Studies
#    Run Keyword And Continue On Failure    Should Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
#    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
#    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-PATIENT-INFO-01: Edit Patient info
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-PATIENT-INFO-01     auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    View Active Study Details On    row=1
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    Navigate To Study Details Tab    Patient details
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Patient details
    ${new_patient_info}     Create Dictionary      patient_id=PT1    first_name=Patient     middle_name=Test    last_name=01    dob=11/11/1999
    ...     height=5ft, 7in    weight=79lb      ethnicity=caucasian      pacemaker=${True}      icd=${True}     gender=Male     is_save=${False}
    Edit Patient Details        patient_info=${new_patient_info}
    ${current_patient_info_data}       Get Current Patient Info
    Edit Patient Information        is_save=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    View Active Study Details On    row=1
    ${patient_info}      Get Study Patient Details
    ${expected_patient_info}      Evaluate     {k: v for k, v in ${patient_info}[Patient information].items()}
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_info_data}[Name]                    ${expected_patient_info}[Name]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_info_data}[Gender]                  ${expected_patient_info}[Gender]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_info_data}[Patient ID]              ${expected_patient_info}[ID]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_info_data}[DOB]                     ${expected_patient_info}[DOB]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_info_data}[Height]                  ${expected_patient_info}[Height]
    Run Keyword And Continue On Failure    Should Contain         ${expected_patient_info}[Weight]                      ${current_patient_info_data}[Weight]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_info_data}[Ethnicity]               ${expected_patient_info}[Ethnicity]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_info_data}[Pacemaker]               ${expected_patient_info}[Pacemaker]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_info_data}[ICD]                     ${expected_patient_info}[ICD]
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-PATIENT-INFO-02: Edit Patient contact
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-PATIENT-INFO-02          auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    View Active Study Details On    row=1
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    Navigate To Study Details Tab    Patient Details
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Patient details
    ${new_patient_contact}     Create Dictionary      country=Canada      address=AAR Plumbing and Heating Supply, Steeles Avenue East, Brampton, ON, Canada
    ...     primary_phone_number=084-657-4638     secondary_phone_number=084-657-4637       is_save=${False}
    Edit Patient Details     patient_contact=${new_patient_contact}
    ${current_patient_contact_data}       Get Current Patient Contact
    Edit Patient Contact        is_save=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    View Active Study Details On    row=1
    ${patient_contact}      Get Study Patient Details
    ${patient_contact_infor}      Evaluate     {k: v for k, v in ${patient_contact}[Patient contact].items()}
    Run Keyword And Continue On Failure    Should Contain         ${patient_contact_infor}[Address]                             ${current_patient_contact_data}[Address]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_contact_data}[Zip code]                     ${patient_contact_infor}[Zip code]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_contact_data}[Primary phone number]         ${patient_contact_infor}[Phone number]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_contact_data}[Email]                        ${patient_contact_infor}[Email]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_contact_data}[Secondary phone number]       ${patient_contact_infor}[2nd phone number]
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-PATIENT-INFO-03: Edit Patient's secondary contact
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-PATIENT-INFO-03     auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    View Active Study Details On    row=1
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    Navigate To Study Details Tab    Patient details
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Patient details
    ${new_secondary_contact}     Create Dictionary      name=Jonh     phone_number=049-586-7594      relationship=brother     email=jonh@yopmail.com      is_save=${False}
    Edit Patient Details     secondary_contact=${new_secondary_contact}
    ${current_secondary_contact_data}       Get Current Secondary Contact
    Edit Secondary Contact          is_save=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    View Active Study Details On    row=1
    ${secondary_contact}      Get Study Patient Details
    ${secondary_contact_infor}      Evaluate     {k: v for k, v in ${secondary_contact}[Secondary contact].items()}
    Run Keyword And Continue On Failure     Should Be Equal           ${secondary_contact_infor}[Name]     ${current_secondary_contact_data}[Name]
    Run Keyword And Continue On Failure     Should Be Equal           ${secondary_contact_infor}[Phone number]     ${current_secondary_contact_data}[Phone Number]
    Run Keyword And Continue On Failure     Should Be Equal           ${secondary_contact_infor}[Relationship]     ${current_secondary_contact_data}[Relationship]
    Run Keyword And Continue On Failure     Should Be Equal           ${secondary_contact_infor}[Email]     ${current_secondary_contact_data}[Email]
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-PATIENT-INFO-04: Edit Patient's insurance
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-PATIENT-INFO-04     auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    View Active Study Details On    row=1
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    Navigate To Study Details Tab    Patient Details
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Patient details
    ${new_insurance}     Create Dictionary      insurance_type=Other     provider=Provider     pre_authorization=No     is_save=${False}
    Edit Patient Details     insurance=${new_insurance}
    ${current_insurance}       Get Current Insurance
    Edit Insurance      is_save=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    View Active Study Details On    row=1
    ${patient_details}      Get Study Patient Details
    ${expected_insurance_data}      Evaluate     {k: v for k, v in ${patient_details}[Insurance].items()}
    Run Keyword And Continue On Failure     Should Be Equal           ${current_insurance}[Insurance type]                  ${expected_insurance_data}[Insurance type]
    Run Keyword And Continue On Failure     Should Be Equal           ${current_insurance}[Provider]                        ${expected_insurance_data}[Provider]
    Run Keyword And Continue On Failure     Should Be Equal           ${current_insurance}[Pre-authorization required]      ${expected_insurance_data}[Pre-authorization required]
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-TECH-CP-STUDIES-ACTIVE-EDIT-PATIENT-INFO-05: Edit Patient's medical history
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-EDIT-PATIENT-INFO-05     auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    View Active Study Details On    row=1
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    Navigate To Study Details Tab    Patient Details
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Patient details
    ${new_medical_history}     Create Dictionary      symptoms=TIA, Chest pain        symptoms_times_happen=Less than 6       heart_monitor_before=No     is_save=${False}
    Edit Patient Details        medication_history=${new_medical_history}
    ${current_medical_history}       Get Current Medical History
    Edit Medical History    is_save=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    View Active Study Details On    row=1
    ${patient_details}      Get Study Patient Details
    ${expected_medical_history_data}      Evaluate     {k: v for k, v in ${patient_details}[Medical history].items()}
    Run Keyword And Continue On Failure     Should Be Equal           ${current_medical_history}[Symptoms the patient experienced]          ${expected_medical_history_data}[Symptoms the patient experienced]
    Run Keyword And Continue On Failure     Should Be Equal           ${current_medical_history}[Symptom frequency]                         ${expected_medical_history_data}[Symptom frequency]
    Run Keyword And Continue On Failure     Should Be Equal           ${current_medical_history}[Used heart monitor]                        ${expected_medical_history_data}[Used heart monitor]
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-TECH-CP-STUDIES-ACTIVE-QUICK-ACCESS-01: Quick access to study info and can go to study management page here
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-QUICK-ACCESS-01     auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    ${study}        Set Variable    ${studies}[0][Study]
    View Active Study Object On    _object=study    study=${study}
    ${page_header_study}      Get Page Header Quick Access
    ${current_page_header}          Set Variable        ${page_header_study}[0]
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page_header}          Study ${study}
    Go To Study Management
    ${page_header_detail}           Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header_detail}         STUDY
    ${page_header_overview}         Get Study Details Overview
    ${expected_study}               Set Variable        ${page_header_overview}[Study ID]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_study}         ${study}
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-TECH-CP-STUDIES-ACTIVE-QUICK-ACCESS-02: Quick access to patient info
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-QUICK-ACCESS-02     auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    ${patient}        Set Variable    ${studies}[0][Patient]
    View Active Study Object On    _object=patient    patient=${patient}
    ${page_header_patient}      Get Page Header Quick Access
    ${current_page_header}          Set Variable        ${page_header_patient}[0]
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page_header}          ${patient}
    ${patient_info_view}        Get Patient Info View
    ${expected_ptinfo_attributes}           Create List    Name     Gender   ID     DOB     Height    Weight    Ethnicity     Pacemaker     ICD
    ${expected_ptcontact_attributes}        Create List    Address      Zip code      Phone number     2nd phone number     Email
    ${expected_insurance_attributes}        Create List    Insurance type    Provider     Pre-authorization required
    ${expected_medicalhistory_attributes}   Create List    Symptoms the patient experienced     Symptom frequency       Used heart monitor
    # Verify atrributes
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_ptinfo_attributes}               ${patient_info_view}[Patient information]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_ptcontact_attributes}            ${patient_info_view}[Patient contact]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_insurance_attributes}            ${patient_info_view}[Insurance]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_medicalhistory_attributes}       ${patient_info_view}[Medical history]
    Run Keyword And Continue On Failure    Should Be Equal    ${patient}          ${patient_info_view}[Patient information][Name]
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-TECH-CP-STUDIES-ACTIVE-QUICK-ACCESS-03-CP-2.23.0: Quick access to device info
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. General info: Model - it can be
    ...     - Bioflux
    ...     - Biocore: if the Auto-events detection for the device, there shall be a message displayed next to the device model – (Auto-events detection enabled).
    ...     - Biocore Pro
    ...     - Time zone
    ...     - Firmware version
    ...     - Operator
    ...     - Network mode
    ...     - Device lifetime - the total time of the device in use since the first study and it is counted by day and month
    ...     if its lifetime is less than 1 year- ex: 1 month 3 days or month and year if its lifetime is equal to or greater
    ...     than 1 year - ex: 1 year 3 months
    ...     2. Last Synced Status
    ...     - RSSI
    ...     - Lead on
    ...     - Battery level
    ...     - SD card free space
    ...     - Charging state
    ...     - Last connect
    ...
    ...     **Others
    ...     Update date: 5/27/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-QUICK-ACCESS-03-CP-2.23.0     auto    CP-2.23.0
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    ${device}        Set Variable    ${studies}[0][Device]
    View Active Study Object On    _object=device    device=${device}
    ${page_header_device}      Get Page Header Quick Access
    ${current_page_header}          Set Variable        ${page_header_device}[0]
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page_header}          Device ${device}
    ${device_info_view}     Get Device Info View
    ${expect_general_info}  Create List    Facility     Model    Firmware version    Timezone    Operator    Network mode    Device lifetime
    ${expect_last_sync}     Create List    RSSI     Lead on     Battery level   SD card free space      Charging state     Last connect
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_info_view}[General information]           ${expect_general_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_info_view}[Last synced status]     ${expect_last_sync}
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-01: Biocore/Biotres/Biotres Pro-Cannot view live ECG of Draft study
    [Documentation]  Author: Nhan Nguyen
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
    ...     - On Active list and Study Details: "View Live ECG" button is disabled, there is a message "View live ECG is only available for on-going studies" when hovering over the button
    ...
    ...     **Others
    ...     Update date: 3/13/2024 - Nhan Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-01      manual    CP-2.20.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-02: Biocore/Biotres/Biotres Pro-View live ECG of Ongoing study and device is connected to Diagnostics app via BT
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - Biocore/Biotres/Biotres Pro is connected to Diagnostics app via BT
    ...     - Biocore/Biotres/Biotres Pro is online
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     On Active list and Study Details:
    ...     - "View Live ECG" button is enabled
    ...     - When clicking, it opens it opens the 'Live ECG' screen and start streaming. the 'Live ECG' screen and start streaming.
    ...     In case of any errors during streaming initiation, an error notifies the user in the streaming modal
    ...
    ...     **Others
    ...     Update date: 3/13/2024 - Nhan Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-02      manual     R1    CP-2.20.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-03: Biocore/Biotres/Biotres Pro-View live ECG in case of no user action in the streaming pop-up within 10m
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - Biocore/Biotres/Biotres Pro is connected to Diagnostics app via BT
    ...     - Biocore/Biotres/Biotres Pro is online
    ...
    ...     Test Steps:
    ...     No user action in 10 minutes
    ...
    ...     Expected Results:
    ...     On Active list and Study Details:
    ...     The ECG will continue streaming within the next 30 seconds.
    ...     - If the user responds within 30s, the pop-up closes, and ECG streaming continues
    ...     - •	If there is no user response after 30s, the ECG streaming stops automatically. Confirming "Resume" closes the pop-up,
    ...     and the portal either resumes ECG streaming or displays an error (if there is an issue while start streaming)
    ...
    ...     **Others
    ...     Update date: 3/13/2024 - Nhan Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-03      manual     R1    CP-2.20.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-04: Biocore/Biotres/Biotres Pro-Cannot view live ECG of Ongoing study and device is connected to Diagnostics app via USB
    [Documentation]  Author: Nhan Nguyen
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
    ...     **Others
    ...     Update date: 3/13/2024 - Nhan Nguyen

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-04      manual    CP-2.20.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-05: Biocore Pro-View live ECG of Ongoing study and device is Online via Cellular
    [Documentation]  Author: Tam Ho
    ...
    ...     Description: Live ECG streaming starts successfully when the Biocore Pro device is online via cellular
    ...
    ...     Precondition:
    ...     1. The Biocore Pro device is connected and online via cellular.
    ...     2. Facility settings for Live ECG streaming are enabled.
    ...     3. Study Ongoing
    ...
    ...     Test Steps:
    ...     1. Hover on  View live ECG button
    ...     2. Click on  View live ECG button
    ...
    ...     Expected Results:
    ...     1. Display text "View live ECG"
    ...     2. The window displays real-time ECG data streamed from the device
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-05      manual    CP-2.25.0    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-06: Automatic Stop of Live ECG Streaming After 5 Minutes
    [Documentation]  Author: Tam Ho
    ...
    ...     Description: Live ECG streaming stops automatically after 5 minutes of continuous operation
    ...
    ...     Precondition:
    ...     1. The Biocore Pro device is connected and online via cellular.
    ...     2. Facility settings for Live ECG streaming are enabled.
    ...     3. Study Ongoing
    ...
    ...     Test Steps:
    ...     1. Start Live ECG streaming via cellular
    ...     2. Wait for 5 minutes without any interaction
    ...
    ...     Expected Results:
    ...     1. Live ECG streaming stops after 5 minutes
    ...     2. A modal restart appear
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-06      manual    CP-2.25.0    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-07: Restart Live ECG Streaming via Cellular After 5-Minute Auto Stop
    [Documentation]  Author: Tam Ho
    ...
    ...     Description: Ensure Live ECG streaming can be restarted via cellular after it stops automatically at the 5-minute limit.
    ...
    ...     Precondition:
    ...     1. A modal restart appear
    ...
    ...     Test Steps:
    ...     1. Click "Restart" Button on modal restart
    ...
    ...     Expected Results:
    ...     1. Live ECG streaming restarts successfully
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-07      manual    CP-2.25.0    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-08: Live ECG Available When Facility Setting Is Off and Device Online via Bluetooth
    [Documentation]  Author: Tam Ho
    ...
    ...     Description: Live ECG can be accessed when the facility setting is off, and the device is online via Bluetooth
    ...
    ...     Precondition:
    ...     1. Facility setting for Live ECG streaming is Off
    ...     2. The device is connected and online via Bluetooth
    ...
    ...     Test Steps:
    ...     1. Locate the View Live ECG button
    ...     2. Click the button
    ...
    ...     Expected Results:
    ...     1. Live ECG streaming start successfully
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-08      manual    CP-2.25.0    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-09: Display Message When Device Offline
    [Documentation]  Author: Tam Ho
    ...
    ...     Description: Display the message "Live ECG not available for offline devices" when the device is offline and the facility setting is off
    ...
    ...     Precondition:
    ...     1. The device is offline
    ...
    ...     Test Steps:
    ...     1. Locate the View Live ECG button
    ...     2. Hover over the button
    ...
    ...     Expected Results:
    ...     1. The message "Live ECG not available for offline devices" is displayed
    ...     2. The View Live ECG button is disabled and cannot be clicked
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-09      manual    CP-2.25.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-10: Display Message When Device online Via USB
    [Documentation]  Author: Tam Ho
    ...
    ...     Description: Display the message "Live ECG not available when the device is connected via USB" when the device Device online Via USB
    ...
    ...     Precondition:
    ...     1.  Device online Via USB
    ...
    ...     Test Steps:
    ...     1. Locate the View Live ECG button
    ...     2. Hover over the button
    ...
    ...     Expected Results:
    ...     1. The message "Live ECG not available when the device is connected via USB" is displayed
    ...     2. The View Live ECG button is disabled and cannot be clicked
    ...
    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-10      manual    CP-2.25.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-11: Display Message for Bioflux
    [Documentation]  Author: Tam Ho
    ...
    ...     Description: Display the message "Live ECG not available for Bioflux devices" for device Bioflux
    ...
    ...     Precondition:
    ...     1.  Device Bioflux
    ...
    ...     Test Steps:
    ...     1. Locate the View Live ECG button
    ...     2. Hover over the button
    ...
    ...     Expected Results:
    ...     1. The message "Live ECG not available for Bioflux devices" is displayed
    ...     2. The View Live ECG button is disabled and cannot be clicked
    ...
    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-11      manual    CP-2.25.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-12: Display Message for paused study
    [Documentation]  Author: Tam Ho
    ...
    ...     Description: Display the message " Live ECG only available for on-going studies" for paused study
    ...
    ...     Precondition:
    ...     1.  Paused study
    ...
    ...     Test Steps:
    ...     1. Locate the View Live ECG button
    ...     2. Hover over the button
    ...
    ...     Expected Results:
    ...     1. The message " Live ECG only available for on-going studies" is displayed
    ...     2. The View Live ECG button is disabled and cannot be clicked
    ...
    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-12      manual    CP-2.25.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-13: Display Message for Biocore Pro FW<1.0.0.35
    [Documentation]  Author: Tam Ho
    ...
    ...     Description: Display the message " Live ECG not available for devices with outdated firmware" for paused study
    ...
    ...     Precondition:
    ...     1.  Device Biocore Pro FW<1.0.0.35
    ...
    ...     Test Steps:
    ...     1. Locate the View Live ECG button
    ...     2. Hover over the button
    ...
    ...     Expected Results:
    ...     1. The message " Live ECG not available for devices with outdated firmware" is displayed
    ...     2. The View Live ECG button is disabled and cannot be clicked
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-13      manual    CP-2.25.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-14: Display Message when device biocore Pro online via cellular and facility setting is off
    [Documentation]  Author: Tam Ho
    ...
    ...     Description: Display the message " Live ECG available only when the device is connected via Bluetooth" for paused study
    ...
    ...     Precondition:
    ...     1. Device Biocore Pro Online via cellular
    ...     2. Facility setting is off
    ...
    ...     Test Steps:
    ...     1. Locate the View Live ECG button
    ...     2. Hover over the button
    ...
    ...     Expected Results:
    ...     1. The message " Live ECG available only when the device is connected via Bluetooth" is displayed
    ...     2. The View Live ECG button is disabled and cannot be clicked
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-LIVEECG-14      manual    CP-2.25.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-1: Display Biodirect Tag on Studies with Biodirect Service
    [Documentation]  Author: Tam Ho
    ...
    ...     Description: Ensure that a green Biodirect tag is displayed next to the Study ID for studies running with the Biodirect service. Clicking on the tag should open the Biodirect drawer to view shipment details
    ...
    ...     Precondition:
    ...     1. Study Biodirect
    ...
    ...     Test Steps:
    ...     1. Navigate to the Active Studies list
    ...     2. Observe the Biodirect tag
    ...     3. Click the Biodirect tag
    ...
    ...     Expected Results:
    ...     1. Green Biodirect label is visible
    ...     2. Clicking on the Biodirect tag opens the Biodirect Drawer
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-1      manual    CP-2.25.2    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-2: Display Shipment Details in Biodirect Drawer
    [Documentation]  Author: Tam Ho
    ...
    ...     Description: Ensure that the Biodirect drawer displays shipment details, including shipping status, tracking information, and delivery estimate
    ...
    ...     Precondition:
    ...     1. Study Biodirect has shipment label (Outbound & Inbound)
    ...
    ...     Test Steps:
    ...     1. Click the Biodirect tag
    ...
    ...     Expected Results:
    ...     1. The Biodirect Drawer opens and displays the following details: Sending Device Status
    ...         - Tracking number
    ...         - Shipped date
    ...         - Estimated arrival
    ...         - Carrier
    ...         - Timeline
    ...     2. The Biodirect Drawer opens and displays the following details: Returning Device Status
    ...         - Tracking number
    ...         - Shipped date
    ...         - Estimated arrival
    ...         - Carrier
    ...         - Timeline

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-2      manual    CP-2.25.2    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-3: Display message "No shipping label created yet" in Biodirect Drawer
    [Documentation]  Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     1. Study Biodirect has not shipment label (Outbound & Inbound)
    ...
    ...     Test Steps:
    ...     1. Click the Biodirect tag
    ...
    ...     Expected Results:
    ...     1. Display message "No shipping label created yet"
    ...
    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-3      manual    CP-2.25.2    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-4: Biodirect status is "Preparing device for shipment " when The Biodirect ticket is in the Order tab
    [Documentation]  Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-4      manual    CP-2.25.2    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-5: Biodirect status is "Preparing device for shipment " when The Biodirect ticket is Pending tab + no Outbound shipment label
    [Documentation]  Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-5      manual    CP-2.25.2    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-6: Biodirect status is "Device is being shipped " when The Biodirect ticket is Pending tab + Outbound shipment label (no status Delivered)
    [Documentation]  Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-6      manual    CP-2.25.2    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-7: Biodirect status is "Device delivered to patient " when The Biodirect ticket is Pending tab + Outbound shipment label status "Delivered"
    [Documentation]  Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-7      manual    CP-2.25.2    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-8: Biodirect status is "Device delivered to patient " when The Biodirect ticket is marked as complete follow-up
    [Documentation]  Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-8      manual    CP-2.25.2    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-9: Biodirect status is "Device delivered to patient " when The Biodirect ticket is automatically moved to the Running tab
    [Documentation]  Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition: Outbound shipping label is delivered, and the study is ongoing
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-9      manual    CP-2.25.2    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-10: Biodirect status is "Device is being returned " when The Biodirect ticket is in the Complete tab + Inbound shipment label (no status Delivered)
    [Documentation]  Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-10      manual    CP-2.25.2    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-11: Biodirect status is "Device returned " when The Biodirect ticket Biodirect ticket is marked as Confirm Return (Done tab)
    [Documentation]  Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-11      manual    CP-2.25.2    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-12: Biodirect status is "Device returned " when Biodirect ticket is automatically moved to "Done"
    [Documentation]  Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition: Inbound label has a "Delivered" status + Study completed
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-12      manual    CP-2.25.2    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-13: Biodirect status of Study 1 is applied to Study 2 in a Follow-On Study
    [Documentation]  Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-ACTIVE-BIODIRECT-STATUS-13      manual    CP-2.25.2    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}       Start Browser
    Import Library        project_bioflux_clinic_portal/lib/web/Common.py         ${BROWSER_NODE}  ${ENV}
    Import Library        project_bioflux_clinic_portal/lib/web/Studies.py        ${BROWSER_NODE}  ${ENV}
    Import Library        project_bioflux_clinic_portal/lib/web/StudyDetails.py   ${BROWSER_NODE}  ${ENV}
    Import Library        project_bioflux_clinic_portal/lib/web/Inbox.py          ${BROWSER_NODE}  ${ENV}
    ${TECH_USER}          Get Config Param       NEW_USER > clinic_technician
    ${FACILITIES}         Get Config Param       FACILITY
    ${DEVICES}            Get Config Param       DEVICE
    ${AWS_AUTH}           Get Config Param       AWS_AUTH
    ${STUDY_ID_ACTIVE}         Get Config Param       STUDY_ID
    ${STUDY_ID_PHYSICIAN}         Get Config Param       PHYSICIAN
    ${STUDY_ID_HOLTER}   Set Variable        ${STUDY_ID_ACTIVE}[study_id_active][study_id_holter]
    ${STUDY_ID_REFERRING}   Set Variable        ${STUDY_ID_PHYSICIAN}[referring_physician]
    Set Suite Variable    ${STUDY_ID_REFERRING}
    Set Suite Variable    ${DEVICES}
    Set Suite Variable    ${TECH_USER}
    Set Suite Variable    ${FACILITIES}
    Set Suite Variable    ${STUDY_ID_HOLTER}
    ${TOKEN}              Sign In Bioflux       username=${TECH_USER}[0][username]       password=${TECH_USER}[0][password]
    ${AWS_RPS}            Initiate Auth         username=${AWS_AUTH}[users][0][username]        password=${AWS_AUTH}[users][0][password]        client_id=${AWS_AUTH}[client_id]
    Set Suite Variable    ${AWS_TOKEN}          ${AWS_RPS}[AuthenticationResult][AccessToken]
    ${VERSION}            Get Release Version
    Set Suite Variable    ${TOKEN}
    Set Suite Metadata    version     ${VERSION}
    Set Suite Metadata    browser     ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

Filter Active - Studies
    [Arguments]    ${search_by}
    Navigate To Studies Page
    Filter Studies    study_state=Active        search_by=${search_by}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No active studies found - text search without text string
    ${text_search}      Set Variable If
    ...  '${search_by.lower()}' == 'study id'              ${studies}[0][Study]
    ...  '${search_by.lower()}' == 'device id'             ${studies}[0][Device]
    ...  '${search_by.lower()}' == 'patient id'            ${studies}[0][Patient ID]
    ...  '${search_by.lower()}' == 'patient name'          ${studies}[0][Patient]
    Filter Studies    study_state=Active        search_by=${search_by}      text_search=${text_search}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}      No active studies found - text search with ${text_search}
    Run Keyword If    '${search_by}'.lower() == 'study id'    Run Keywords
    ...  Run Keyword And Continue On Failure    Should Be Equal As Integers     ${studies}[0][Study]          ${text_search}
    ...  AND    Run Keyword And Continue On Failure    Length Should Be    ${studies}      1
    Run Keyword If    '${search_by}'.lower() == 'device id'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text_search}' == f['Device'] for f in ${studies})      Invalid results are showing - with ${search_by} text search `${text_search}`
    Run Keyword If    '${search_by}'.lower() == 'patient id'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text_search}' == f['Patient ID'] for f in ${studies})      Invalid results are showing - with ${search_by} text search `${text_search}`
    Run Keyword If    '${search_by}'.lower() == 'patient name'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text_search}'.lower() == f['Patient'].lower() for f in ${studies})     Invalid results are showing - with ${search_by} text search `${text_search}`
    Clear Studies Text Search
    ${text_search}     Get Studies Current Filter Values
    Run Keyword And Continue On Failure    Should Be Empty       ${text_search}[Text Search]

#Create A Study      # Can not resolve data after test
#    [Arguments]    ${patient_id}     ${first_name}     ${last_name}     ${dob}      ${height}     ${weight}     ${pacemaker}     ${gender}      ${country}
#    ...  ${address}     ${city}     ${state}        ${zip_code}     ${primary_phone_number}    ${email}      ${facility}      ${use_biodirect}      ${new_physician}
#    ...  ${referring_physician}     ${interpreting_physician}      ${study_type}       ${clinician_initials}       ${primary_diagnosis_code}       ${insurance_type}
#    Navigate To Studies Page
#    Open New Study
#    # Just handle filling required fields
#    Create New Study    patient_id=${patient_id}       first_name=${first_name}       last_name=${last_name}        dob=${dob}      height=${height}        weight=${weight}
#    ...  pacemaker=${pacemaker}     gender=${gender}        country=${country}      address=${address}      city=${city}       state=${state}       zip_code=${zip_code}
#    ...  primary_phone_number=${primary_phone_number}       email=${email}      facility=${facility}       use_biodirect=${use_biodirect}       new_physician_info=${new_physician}
#    ...  referring_physician=${referring_physician}     interpreting_physician=${interpreting_physician}     study_type=${study_type}       clinician_initials=${clinician_initials}
#    ...  primary_diagnosis_code=${primary_diagnosis_code}       insurance_type=${insurance_type}
#    Filter Studies    Active     search_by=Patient ID       text_search=${patient_id}
#    ${Studies}      Get Active Studies
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${Studies}        No Studies found - with patient id ${patient_id}
#    Run Keyword And Continue On Failure    Should Be Equal        ${Studies}[0][Device]         --
#    Run Keyword And Continue On Failure    Should Be Equal        ${Studies}[0][Patient]        ${first_name} ${last_name}
#    Run Keyword And Continue On Failure    Should Be Equal        ${Studies}[0][Facility]       ${facility}
#    Run Keyword And Continue On Failure    Should Be Equal        ${Studies}[0][Patient ID]     ${patient_id}

Navigate To Instant Reports - Study Details
    Navigate To Inbox
    Navigate To Report Type    Instant reports
    Select Report    row=1
    Open Instant Report Study Details
    ${header}       Get Page Header Detail
    ${current_tab}  Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${header}          STUDY
    Run Keyword And Continue On Failure    Should Be Equal    ${current_tab}     Instant Reports

Api Study - Create
    Api Create Study On    token=${AWS_TOKEN}    facility=${FACILITIES}[0][id]   device_id=${DEVICES}[bioflux_device][0][id]   study_type=CARDIAC EVENT   device_type=Bioflux
    ${filter}          Create Dictionary     status=Ongoing        deviceId=${DEVICES}[bioflux_device][0][id]
    ${filter}          Create Dictionary     filter=${filter}
    ${studies}         Api Clinic Studies    ${AWS_TOKEN}      ${filter}
    ${study_id}        Set Variable     ${studies}[body][data][clinicStudies][0][id]
    ${friendly_id}     Set Variable     ${studies}[body][data][clinicStudies][0][friendlyId]
    Set Global Variable    ${study_id}
    Set Global Variable    ${friendly_id}
    RETURN    ${study_id}     ${friendly_id}

Check the facility on another page
    [Arguments]    ${page}      ${expected_filter}
    Navigate To Other Page    page=${page}
    ${current_filter_studies}       Get Current Facility
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter_studies}       ${expected_filter}

Create a study with not running biodirect
    Navigate To Studies Page
    Open New Study
    ${current_page}     Get Current New Study Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page}       Patient information       # PAGE 1
    ${second_contact}   Create Dictionary    name=Jonh     relationship=brother     phone_number=049-586-7594     email=jonh@yopmail.com
    ${date}     Get Current Date    result_format=%m/%d/%Y    increment=+15 day
    Create New Study Page 1     patient_id=PT103     first_name=Patient     middle_name=Test      last_name=01     dob=11/11/2000      height=4ft, 3in     weight=50lb     ethnicity=Asian      pacemaker=${True}     icd=${True}   is_next=${False}
    ${values_page_1}        Get New Study Values Page 1
    Create New Study Page 1     is_next=${True}
    Create New Study Page 2     country=Canada      address=AAR Plumbing and Heating Supply, Steeles Avenue East, Brampton, ON, Canada       primary_phone_number=084-657-4637        email=patient@yopmail.com
    ...  secondary_phone_number=0293757473      secondary_contact=${second_contact}     is_next=${False}
    ${values_page_2}        Get New Study Values Page 2
    Create New Study Page 2     is_next=${True}
    Create New Study Page 3     facility=${FACILITIES}[1][name]      device_type=Bioflux   device_id=${DEVICES}[bioflux_device][2][id]     referring_physician=Physician Qa Team 01    study_type=MCT – 93228-93229        study_duration=3      patient_return_visit=${date}
    ...  clinician_initials=Initials        is_next=${False}        interpreting_physician=Physician Qa Team 01
    ${values_page_3}        Get New Study Values Page 3
    Create New Study Page 3    is_next=${True}
    Create New Study Page 4    primary_diagnosis_other=Other     primary_diagnosis_code_other_input=Other Pri Test      secondary_diagnosis_other=Other    secondary_diagnosis_code_other_input=Other second Test    patient_medication=medication
    ...  physician_notes=Phy Notes      insurance_type=Other    insurance_provider=Provider    pre_authorization=No     symptoms=TIA, Chest pain        symptoms_times_happen=Less than 6     before_heart_monitor=No     is_initiate=${False}
    ${values_page_4}        Get New Study Values Page 4
    Create New Study Page 4    is_initiate=${True}
    Create New Study Page 5
    Set Global Variable     ${values_page_1}
    Set Global Variable     ${values_page_2}
    Set Global Variable     ${values_page_3}
    Set Global Variable     ${values_page_4}

Abort a study with running biodirect
    [Arguments]    ${study_type}
    Navigate To Studies Page
    Open New Study
    ${current_page}     Get Current New Study Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page}       Patient information       # PAGE 1
    ${second_contact}   Create Dictionary    name=Jonh     relationship=brother     phone_number=049-586-7594     email=jonh@gmail.com
    ${date}     Get Current Date    result_format=%m/%d/%Y    increment=+15 day
    Create New Study Page 1     patient_id=PT103     first_name=Patient     middle_name=Test      last_name=01     dob=11/11/2000      height=4ft, 3in     weight=50lb     ethnicity=Asian      pacemaker=${True}     icd=${True}   is_next=${False}
    ${values_page_1}        Get New Study Values Page 1
    Create New Study Page 1     is_next=${True}
    Create New Study Page 2     country=Canada      address=AAR Plumbing and Heating Supply, Steeles Avenue East, Brampton, ON, Canada       primary_phone_number=084-657-4637        email=patient@gmail.com
    ...  secondary_phone_number=0293757473      secondary_contact=${second_contact}
    Create New Study Page 3     facility=${FACILITIES}[0][name]      use_biodirect=True     referring_physician=Physician Qa Team 01    interpreting_physician=Physician Qa Team 01       study_duration=3      patient_return_visit=${date}
    ...  clinician_initials=Initials    study_type=${study_type}        is_next=${False}
    ${values_page_3}        Get New Study Values Page 3
    Create New Study Page 3    is_next=${True}
    Create New Study Page 4    primary_diagnosis_other=Other     primary_diagnosis_code_other_input=Other Pri Test      secondary_diagnosis_other=Other    secondary_diagnosis_code_other_input=Other second Test    patient_medication=medication
    ...  physician_notes=Phy Notes      insurance_type=Other    insurance_provider=Provider    pre_authorization=No     symptoms=TIA, Chest pain        symptoms_times_happen=Less than 6     before_heart_monitor=No     is_initiate=${False}
    ${values_page_4}        Get New Study Values Page 4
    Create New Study Page 4    is_initiate=${True}
    Navigate To Studies Page
    ${studies}        Get Active Studies
    ${study_id}       Set Variable    ${studies}[0][Study]
    Filter Studies      search_by=Study ID      text_search=${study_id}
    ${studies}        Get Active Studies
    Abort Study
    Filter Studies      search_by=Study ID      text_search=${study_id}
    ${studies}        Get Active Studies
