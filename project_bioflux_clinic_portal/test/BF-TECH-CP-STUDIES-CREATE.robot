*** Settings ***
Documentation   Test Suite - Clinic Portal - Create study
Metadata    sid     BF-TECH-CP-STUDIES-CREATE
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     Collections
Library     DateTime
Library     corelib/WebHandler.py       ${BROWSER}  ${HEADLESS}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py    ${ENV}        WITH NAME   CpConfig
Library     project_admin_portal/lib/ConfigHandler.py             ${ENV}        WITH NAME   AdConfig
Library     project_bioflux_clinic_portal/lib/api/Clinic.py       ${ENV}
Library     project_bioflux_clinic_portal/lib/api/Admin.py        ${ENV}
Library     project_bioflux_clinic_portal/lib/api/Auth.py         ${ENV}
Library     project_bioflux_clinic_portal/lib/web/Common.py
Library     project_bioflux_clinic_portal/lib/web/Studies.py

Suite Setup         SUITE SETUP
Suite Teardown      SUITE TEARDOWN
Force Tags          BF-TECH-CP-STUDIES-CREATE       web
Test Timeout        1h

*** Test Cases ***
BF-TECH-CP-STUDIES-CREATE-STEP1-01: Fill information in step 1-Patient information
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician can fill information in step 1- Patient information
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 1 (Patient information)
    ...     2. There is a bioflux device that is on Ready for new study status
    ...     3. There is a biotres device that is on Ready for new study status
    ...
    ...     Test Steps:
    ...     1. Enter valid value on the Patient ID field
    ...     2. Enter valid value on the First name field
    ...     3. Enter valid value on the Middle name (optional) field
    ...     4. Enter valid value on the Last name field
    ...     5. Enter valid value on the Date of birth field
    ...     6. Select the Male or Female Gender toggle button
    ...     7. Enter a valid value in the Height field ( must be ≥ 1 ft and ≤ 9 ft 11 in - integers only)
    ...     8. Enter a valid value in the Weight field (must be ≥ 1 lb and ≤ 800.9 lb)
    ...     9. Select the Yes or No Pacemaker toggle button
    ...     10. Click the Next button
    ...
    ...     Expected Results:
    ...     1. The entered data shall be displayed
    ...     2. At step 10, the user should be navigated to step 2 (Patient contact)

    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP1-01       auto
    Navigate To Studies Page
    Open New Study
    Create New Study Page 1    patient_id=PT1    first_name=Patient     middle_name=Test    last_name=01    dob=11/11/1999    height=0ft, 12in    weight=801lb      ethnicity=caucasian      pacemaker=${True}     gender=Male     is_next=${True}
    ${err_messages}     Get Error Messages
    Run Keyword And Continue On Failure    List Should Contain Value    ${err_messages}     Height must be ≥ 1 ft and ≤ 9 ft 11 in
    Run Keyword And Continue On Failure    List Should Contain Value    ${err_messages}     Weight must be ≥ 1 lb and ≤ 800.9 lb
    Create New Study Page 1    height=12ft, 0in    weight=0lb     is_next=${True}
    ${err_messages}     Get Error Messages
    Run Keyword And Continue On Failure    List Should Contain Value    ${err_messages}     Height must be ≥ 1 ft and ≤ 9 ft 11 in
    Run Keyword And Continue On Failure    List Should Contain Value    ${err_messages}     Weight must be ≥ 1 lb and ≤ 800.9 lb
    Create New Study Page 1    height=5ft, 8in    weight=66lb     is_next=${False}
    ${values}       Get New Study Values Page 1
    Run Keyword And Continue On Failure    Should Be Equal    ${values}[Patient ID]     PT1
    Run Keyword And Continue On Failure    Should Be Equal    ${values}[First name]     Patient
    Run Keyword And Continue On Failure    Should Be Equal    ${values}[Middle name]    Test
    Run Keyword And Continue On Failure    Should Be Equal    ${values}[Last name]      01
    Run Keyword And Continue On Failure    Should Be Equal    ${values}[Date of birth]  11/11/1999
    Run Keyword And Continue On Failure    Should Be Equal    ${values}[Gender]         Male
    Run Keyword And Continue On Failure    Should Be Equal    ${values}[Height (ft)]    5
    Run Keyword And Continue On Failure    Should Be Equal    ${values}[Height (in)]    8
    Run Keyword And Continue On Failure    Should Be Equal    ${values}[Weight]         66
    Run Keyword And Continue On Failure    Should Be Equal    ${values}[Pacemaker]      ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${values}[ICD]            ${False}
    Create New Study Page 1    is_next=${True}
    ${current_page}      Get Current New Study Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page}       Patient contact

BF-TECH-CP-STUDIES-CREATE-STEP1-02: Verify the message when the all filed are blank in step 1
    [Documentation]
    ...     Description: The clinic Technician all filed are blank in step 1- Patient information
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 1 (Patient information)
    ...     2. There is a bioflux device that is on Ready for new study status
    ...     3. There is a biotres device that is on Ready for new study status
    ...
    ...     Test Steps:
    ...     1. Navigate to "Create new study" screen
    ...     2. In step1 click on the "Next" button
    ...
    ...     Expected Results:
    ...     1. Check the message when the all filed are blank (except(optional))
    ...
    ...     **Others**
    ...     Author: Thang Tran
    ...     Create Date: 10/24/2023
    ...
    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP1-02       auto
    Navigate To Studies Page
    Open New Study
    Create New Study Page 1    is_next=${True}
    ${err_messages}     Get Error Messages Step 1
    Run Keyword And Continue On Failure    Should Be Equal    ${err_messages}[First name]       Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${err_messages}[Last name]        Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${err_messages}[Patient ID]       Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${err_messages}[DoB]              Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${err_messages}[Height]           Height must be ≥ 1 ft and ≤ 9 ft 11 in
    Run Keyword And Continue On Failure    Should Be Equal    ${err_messages}[Weight]           Weight must be ≥ 1 lb and ≤ 800.9 lb

BF-TECH-CP-STUDIES-CREATE-STEP2-02: Verify the message when the all filed are blank in step 2
    [Documentation]
    ...     Description: The clinic Technician all filed are blank in step 2- Patient contact
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 2 (Patient contact)
    ...     2. There is a bioflux device that is on Ready for new study status
    ...     3. There is a biotres device that is on Ready for new study status
    ...
    ...     Test Steps:
    ...     1. Navigate to "Create new study" screen
    ...     2. Fill all information step 1 -> Click on the "Next" button
    ...     3. In step2 click on the "Next" button
    ...     4. Input invalid Primary Phone Number
    ...
    ...     Expected Results:
    ...     3. Check the message when the all filed are blank (except(optional))
    ...     4. Verify invalid Primary Phone Number
    ...
    ...     **Others**
    ...     Author: Thang Tran
    ...     Create Date: 10/24/2023
    ...
    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP2-02       auto
    Navigate To Studies Page
    Open New Study
    Create New Study Page 1    patient_id=PT103     first_name=Patient     middle_name=Test      last_name=01     dob=11/11/2000      height=4ft, 3in     weight=50lb     ethnicity=Asian      pacemaker=${True}     icd=${True}
    Create New Study Page 2    is_next=${True}
    ${err_messages}     Get Error Messages Step 2
    Run Keyword And Continue On Failure    Should Be Equal    ${err_messages}[Address]                  Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${err_messages}[City]                     Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${err_messages}[State]                    Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${err_messages}[Zip code]                 Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${err_messages}[Primary phone number]     Invalid value
    Create New Study Page 2    primary_phone_number=123-456-789     is_next=${True}
    ${err_messages}     Get Error Messages Step 2
    Run Keyword And Continue On Failure    Should Be Equal    ${err_messages}[Primary phone number]     Invalid value

BF-TECH-CP-STUDIES-CREATE-STEP3-09: Verify the message when the all filed are blank in step 3
    [Documentation]
    ...     Description: The clinic Technician all filed are blank in step 3 - Study information
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 3 (Study information)
    ...     2. There is a bioflux device that is on Ready for new study status
    ...     3. There is a biotres device that is on Ready for new study status
    ...
    ...     Test Steps:
    ...     1. Navigate to "Create new study" screen
    ...     2. Fill all information step 1 -> Click on the "Next" button
    ...     3. Fill all information step 2 -> Click on the "Next" button
    ...     4. In step3 click on the "Next" button
    ...     5. Input the value in study duration -> Click on the "Next" button
    ...
    ...     Expected Results:
    ...     4. Check the message when the all filed are blank (except(optional))
    ...     5. Input value = 0 -> verify the message invalid
    ...        Input value = 31 -> verify the message invalid
    ...
    ...     **Others**
    ...     Author: Thang Tran
    ...     Create Date: 10/24/2023
    ...
    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-09       auto
    Navigate To Studies Page
    Open New Study
    Create New Study Page 1    patient_id=PT103     first_name=Patient     middle_name=Test      last_name=01     dob=11/11/2000      height=4ft, 3in     weight=50lb     ethnicity=Asian      pacemaker=${True}     icd=${True}
    ${second_contact}   Create Dictionary    name=Jonh     relationship=brother     phone_number=049-586-7594     email=jonh@yopmail.com
    Create New Study Page 2    country=Canada      address=AAR Plumbing and Heating Supply, Steeles Avenue East, Brampton, ON, Canada       primary_phone_number=084-657-4637      secondary_phone_number=0293757473      secondary_contact=${second_contact}
    Create New Study Page 3    is_next=${True}
    ${err_messages}     Get Error Messages Step 3
    Run Keyword And Continue On Failure    Should Be Equal    ${err_messages}[Device ID]                    Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${err_messages}[Referring physician]          Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${err_messages}[Interpreting physician]       Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${err_messages}[Study type]                   Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${err_messages}[Clinician Initials]           Invalid value
    Create New Study Page 3    study_duration=0     is_next=${True}
    ${err_messages}     Get Error Messages Step 3
    Run Keyword And Continue On Failure    Should Be Equal    ${err_messages}[Study duration]               The duration must be between 1 and 30 days for null study.
    Create New Study Page 3    study_duration=31     is_next=${True}
    ${err_messages}     Get Error Messages Step 3
    Run Keyword And Continue On Failure    Should Be Equal    ${err_messages}[Study duration]               The duration must be between 1 and 30 days for null study.

BF-TECH-CP-STUDIES-CREATE-STEP4-04: Verify the message when the all filed are blank in step 4
    [Documentation]
    ...     Description: The clinic Physician all filed are blank in step 4 - diagnosis
    ...
    ...     Precondition:
    ...     1. The Clinic Physician user is on Create new study screen – step 4 diagnosis
    ...     2. There is a bioflux device that is on Ready for new study status
    ...     3. There is a biotres device that is on Ready for new study status
    ...
    ...     Test Steps:
    ...     1. Navigate to "Create new study" screen
    ...     2. Fill all information step 1 -> Click on the "Next" button
    ...     3. Fill all information step 2 -> Click on the "Next" button
    ...     4. Fill all information step 3 -> Click on the "Next" button
    ...     5. In step4 click on the "Initiate Study" button
    ...     6. Select the primary and secondary code with the value is "Ohter" -> Click on the "Initiate Study" button
    ...
    ...     Expected Results:
    ...     5. Check the message when the all filed are blank (except(optional))
    ...     6. Verify the message invalid in textfield Other primary diagnosis code and Other secondary diagnosis code
    ...
    ...     **Others**
    ...     Author: Thang Tran
    ...     Create Date: 10/24/2023
    ...
    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP4-04       auto
    Navigate To Studies Page
    Open New Study
    Create New Study Page 1    patient_id=PT103     first_name=Patient     middle_name=Test      last_name=01     dob=11/11/2000      height=4ft, 3in     weight=50lb     ethnicity=Asian      pacemaker=${True}     icd=${True}
    ${second_contact}   Create Dictionary    name=Jonh     relationship=brother     phone_number=049-586-7594     email=jonh@yopmail.com
    Create New Study Page 2     country=Canada      address=AAR Plumbing and Heating Supply, Steeles Avenue East, Brampton, ON, Canada       primary_phone_number=084-657-4637        email=patient@yopmail.com
    ...  secondary_phone_number=0293757473      secondary_contact=${second_contact}
    ${date}     Get Current Date    result_format=%m/%d/%Y    increment=+15 day
    Create New Study Page 3    facility=${FACILITIES}[0][name]      use_biodirect=True     referring_physician=Physician Qa Team 01    study_type=MCT – 93228-93229        study_duration=3      patient_return_visit=${date}
    ...  clinician_initials=Initials        interpreting_physician=Physician Qa Team 01
    Create New Study Page 4    is_initiate=${True}
    ${err_messages}     Get Error Messages Step 4
    Run Keyword And Continue On Failure    Should Be Equal    ${err_messages}[Primary diagnosis code]       Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${err_messages}[Insurance type]               Invalid value
    Create New Study Page 4    primary_diagnosis_other=Other     secondary_diagnosis_other=Other     is_initiate=${False}
    Clear Text On Other Diagnosis Code
    Create New Study Page 4    is_initiate=${True}
    ${err_messages}     Get Error Messages Step 4
    Run Keyword And Continue On Failure    Should Be Equal    ${err_messages}[Other primary diagnosis code]       Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${err_messages}[Other secondary diagnosis code]     Invalid value

BF-TECH-CP-STUDIES-CREATE-STEP2-01: Fill information in step 2-Patient contact
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician can fill information in step 2- Patient contact
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 2 (Patient contact)
    ...
    ...     Test Steps:
    ...     1. Select the specific country
    ...     2. In the address field, enter the keyword and select the suggested address
    ...     3. In the primary phone number field, enter a valid phone number
    ...     4. Enter valid email format on the Email (optional) field
    ...     5. In the Secondary phone number (optional) field, enter a valid phone number
    ...     6. On the SECONDARY CONTACT section, click the Add secondary contact (optional) button
    ...     7. Enter valid value on the Name (optional) field
    ...     8. Enter valid value on the Relationship (optional) field
    ...     9. Enter valid value on the Phone number (optional) field
    ...     10. Enter valid value on the Email (optional) field
    ...     11. Click the Previous button
    ...     12. Click the Next button
    ...
    ...     Expected Results:
    ...     1. The entered data shall be displayed
    ...     2. At step 2, the city, state, and zip code fields will be automatically filled according to
    ...     the selected address
    ...     3. At step 11, the user will navigate back to step 1 (Patient information)
    ...     4. At step 12, The user should be navigated to step 3 (Study information)

    [Tags]      BF-TECH-CP-STUDIES-CREATE-STEP2-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Studies Page
#    Open New Study
#    Create New Study Page 1    patient_id=PT1    first_name=Patient     middle_name=Test    last_name=01    dob=11/11/1999    height=5ft, 7in    weight=79lb      ethnicity=caucasian      pacemaker=${True}     gender=Male     is_next=${True}
#    ${second_contact}    Create Dictionary    name=Jonh     relationship=brother     phone_number=049-586-7594     email=jonh@gmail.com
#    Create New Study Page 2     country=Canada      address=AAR Plumbing and Heating Supply, Steeles Avenue East, Brampton, ON, Canada     primary_phone_number=084-657-4637      email=patient@gmail.com     secondary_phone_number=029-375-7473
#    ...  secondary_contact=${second_contact}     is_next=${False}     is_previous=${False}
#    ${values}       Get New Study Values Page 2
#    Run Keyword And Continue On Failure    Should Be Equal        ${values}[Country]        Canada
#    Run Keyword And Continue On Failure    Should Contain         AAR Plumbing and Heating Supply, Steeles Avenue East, Brampton, ON, Canada     ${values}[Address]
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${values}[City]
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${values}[State]
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${values}[Zip code]
#    Run Keyword And Continue On Failure    Should Be Equal        ${values}[Primary phone number]        084-657-4637
#    Run Keyword And Continue On Failure    Should Be Equal        ${values}[Secondary phone number]      029-375-7473
#    Run Keyword And Continue On Failure    Should Be Equal        ${values}[Email]                       patient@gmail.com
#    Run Keyword And Continue On Failure    Should Be Equal        ${values}[Secondary contact name]                       Jonh
#    Run Keyword And Continue On Failure    Should Be Equal        ${values}[Secondary contact relationship]               brother
#    Run Keyword And Continue On Failure    Should Be Equal        ${values}[Secondary contact phone number]               049-586-7594
#    Run Keyword And Continue On Failure    Should Be Equal        ${values}[Secondary contact email]                      jonh@gmail.com
#    Create New Study Page 2    is_next=${False}    is_previous=${True}
#    ${current_page}     Get Current New Study Page
#    Run Keyword And Continue On Failure     Should Be Equal    ${current_page}    Patient information
#    Create New Study Page 1    is_next=${True}
#    ${current_page}     Get Current New Study Page
#    Run Keyword And Continue On Failure     Should Be Equal    ${current_page}    Patient contact
#    Create New Study Page 2    is_next=${True}     is_previous=${False}
#    ${current_page}     Get Current New Study Page
#    Run Keyword And Continue On Failure     Should Be Equal    ${current_page}    Study information

BF-TECH-CP-STUDIES-CREATE-STEP3-01: Can Fill information in step 3-Study information
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician can fill information in step 3- Study information with device ready
    ...     for Protect+ program
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 3 (Study information)
    ...     2. There is a device ready for Protect+ (currently in Maintenance tab of Devices page
    ...
    ...     Test Steps:
    ...     1. On Device type section, select Bioflux model button and click on the Device ID dropdown list
    ...     2. Select the device has a Protect+ tag
    ...     3. Click the Cancel button
    ...     4. Click the Use anyway button
    ...     5. Select a physician on the Referring physician dropdown list
    ...     6. Select a physician on the Interpreting physician dropdown list
    ...     7. Select a type on the Study type dropdown list
    ...     8. Enter valid value on the Study duration field
    ...     9. Select a valid date on the Patient return visit datepicker
    ...     10. Enter valid value on the Clinic Initials field
    ...     11. Click the Previous button
    ...     12. Click the Next button
    ...
    ...     Expected Results:
    ...     1. At step 1, if the device ready for Protect+, there is a Protect+ tag displayed next to the Device ID
    ...     2. At step 2, The confirmation dialog shall be displayed with the following information:
    ...     - Title: Protect+
    ...     - Content: Please note this device has been marked ready for Protect+
    ...     - Buttons:
    ...      + Cancel
    ...      + Use anyway
    ...     3. At step 3, the confirmation dialog shall be removed
    ...     4. At step 4, confirm the use of that device and the selected device shall be displayed
    ...     5. At step 5,6,7,8,9,10 the selected/entered data shall be displayed
    ...     6. At step 11, the user will navigate back to step 2 (Patient contact)
    ...     7. At step 12, the user should be navigated to step 4 (Diagnosis)
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-02: Can Fill information in step 3-Study information
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician can fill information in step 3- Study information with Bioflux device
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 3 (Study information)
    ...
    ...     Test Steps:
    ...     1. On Device type section, select Bioflux model
    ...     2. Select a normal device ID
    ...     3. Select a physician on the Referring physician dropdown list
    ...     4. Select a physician on the Interpreting physician dropdown list
    ...     5. Select a specific study type on the Study type dropdown list
    ...     6. Enter valid value on the Study duration field
    ...     7. Select a valid date on the Patient return visit datepicker
    ...     8. Enter valid value on the Clinic Initials field
    ...     9. Click the Previous button
    ...     10. Click the Next button
    ...
    ...     Expected Results:
    ...     1. At step 1, the list of devices displayed if containing RMA devices shall be divided into 2 sections:
    ...     - Normal devices which are selectable
    ...     - RMA devices/Renewal devices which are disabled and cannot be selected
    ...     2. At step 2, the selected device ID shall be displayed
    ...     3. At step 3, 4, 5, 6, 7, 8 the selected/entered data shall be displayed
    ...     4. At step 9, the user will navigate back to step 2 (Patient contact)
    ...     5. At step 10, the user should be navigated to step 4 (Diagnosis)
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-03: Can Fill information in step 3-Study information
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician can fill information in step 3 with Biocore/Biotres device does not have
    ...     the auto-events detection enabled and firmware version has not been updated to the latest
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 3 (Study information)
    ...     2. There is a Biocore/Biotres device does not have the auto-events dectection enabled (process on the Sales portal)
    ...     3. The firmwave version of Biocore/Biotres device has not been updated to the latest
    ...
    ...     Test Steps:
    ...     1. On the facility dropdown list, click on the dropdown and select an active facility
    ...     2. On Device section, select Biocore/Biotres button and select a Device ID on dropdown list
    ...     3. Select a physician on the Referring physician dropdown list
    ...     4. Select a physician on the Interpreting physician dropdown list
    ...     5. Select a HOLTER/EXTENDED HOLTER on the Study type dropdown list
    ...     6. Enter valid value on the Study duration field
    ...     7. Select a valid date on the Patient return visit datepicker
    ...     8. Enter valid value on the Clinic Initials field
    ...     9. Click the Previous button
    ...     10. Click the Next button
    ...
    ...     Expected Results:
    ...     1. At step 1, There shall be a drop-down list of facilities in case the user has more than one assigned
    ...     facility. Otherwise, the Facility Name attribute shall be hidden
    ...     - In case the user selects a facility having a financial hold of 90 days, a pop-up alert message shall
    ...     be displayed to the user. The [Next] button of the Study Information page shall be disabled
    ...     2. At step 2, the selected device ID shall be displayed
    ...     3. At step 3,4,5,6,7,8 the selected/entered data shall be displayed
    ...     4. At step 9, the user will navigate back to step 2 (Patient contact)
    ...     5. At step 10, the user should be navigated to step 4 (Diagnosis)
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-03     manual       CP-2.14.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-04: Can Fill information in step 3-Study information
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician can fill all information in step 3 with Biocore/Biotres device does not have
    ...     the auto-events detection enabled and firmware version has been updated to the latest
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 3 (Study information)
    ...     2. There is a Biocore/Biotres device does not have the auto-events dectection enabled (process on the Sales portal)
    ...     3. The firmwave version of Biocore/Biotres device has been updated to the latest
    ...
    ...     Test Steps:
    ...     1. On the facility dropdown list, click on the dropdown and select an active facility
    ...     2. On Device section, select Biocore/Biotres button and select a Device ID on dropdown list
    ...     3. Select a physician on the Referring physician dropdown list
    ...     4. Select a physician on the Interpreting physician dropdown list
    ...     5. Select a HOLTER/EXTENDED HOLTER on the Study type dropdown list
    ...     6. Enter valid value on the Study duration field
    ...     7. Select a valid date on the Patient return visit datepicker
    ...     8. Enter valid value on the Clinic Initials field
    ...     9. Click the Previous button
    ...     10. Click the Next button
    ...
    ...     Expected Results:
    ...     1. At step 1, There shall be a drop-down list of facilities in case the user has more than one assigned
    ...     facility. Otherwise, the Facility Name attribute shall be hidden
    ...     - In case the user selects a facility having a financial hold of 90 days, a pop-up alert message shall
    ...     be displayed to the user. The [Next] button of the Study Information page shall be disabled
    ...     2. At step 2, the selected device ID shall be displayed
    ...     3. At step 3,4,5,6,7,8 the selected/entered data shall be displayed
    ...     4. At step 9, the user will navigate back to step 2 (Patient contact)
    ...     5. At step 10, the user should be navigated to step 4 (Diagnosis)
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-04     manual       CP-2.14.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-05: Can Fill information in step 3-Study information
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician can fill all information in step 3 with Biocore/Biotres device has the auto-events
    ...     detection enabled and firmware version has been updated to the latest
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 3 (Study information)
    ...     2. There is a Biocore/Biotres device has the auto-events dectection enabled (process on the Sales portal)
    ...     3. The firmwave version of Biocore/Biotres device has been updated to the latest
    ...
    ...     Test Steps:
    ...     1. On the facility dropdown list, click on the dropdown and select an active facility
    ...     2. On Device section, select Biocore/Biotres button and select a Device ID on dropdown list
    ...     3. Select a physician on the Referring physician dropdown list
    ...     4. Select a physician on the Interpreting physician dropdown list
    ...     5. Select a MCT/MCT PEEK/CARDIAC EVENT/HOLTER/EXTENDED HOLTER/HOLTER AND FOLLOW ON STUDY on the
    ...     Study type dropdown list
    ...     6. Enter valid value on the Study duration field
    ...     7. Select a valid date on the Patient return visit datepicker
    ...     8. Enter valid value on the Clinic Initials field
    ...     9. Click the Previous button
    ...     10. Click the Next button
    ...
    ...     Expected Results:
    ...     1. At step 1, There shall be a drop-down list of facilities in case the user has more than one assigned
    ...     facility. Otherwise, the Facility Name attribute shall be hidden
    ...     - In case the user selects a facility having a financial hold of 90 days, a pop-up alert message shall
    ...     be displayed to the user. The [Next] button of the Study Information page shall be disabled
    ...     2. At step 2, the selected device ID shall be displayed
    ...     3. At step 3,4,5,6,7,8 the selected/entered data shall be displayed
    ...     4. At step 9, the user will navigate back to step 2 (Patient contact)
    ...     5. At step 10, the user should be navigated to step 4 (Diagnosis)
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-05     manual       CP-2.14.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-06: Cannot Fill information in step 3-Study information
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician cannot fill all information in step 3 with Biocore/Biotres device does not have
    ...     the auto-events detection enabled and firmware version has not been updated to the latest
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 3 (Study information)
    ...     2. There is a Biocore/Biotres device does not have the auto-events dectection enabled (process on the Sales portal)
    ...     3. The firmwave version of Biocore/Biotres device has not been updated to the latest
    ...
    ...     Test Steps:
    ...     1. On the facility dropdown list, click on the dropdown and select an active facility
    ...     2. On Device section, select Biocore/Biotres button and select a Device ID on dropdown list
    ...     3. Select a physician on the Referring physician dropdown list
    ...     4. Select a physician on the Interpreting physician dropdown list
    ...     5. Select a MCT/MCT Peek/CARDIAC EVENT/HOLTER AND FOLLOW ON STUDY on the Study type dropdown list
    ...     6. Click the Okay button on pop-up
    ...     7. Enter valid value on the Study duration field
    ...     8. Select a valid date on the Patient return visit datepicker
    ...     9. Enter valid value on the Clinic Initials field
    ...     10. Click the Previous button
    ...     11. Observe the Next button
    ...
    ...     Expected Results:
    ...     1. At step 1, There shall be a drop-down list of facilities in case the user has more than one assigned
    ...     facility. Otherwise, the Facility Name attribute shall be hidden
    ...     - In case the user selects a facility having a financial hold of 90 days, a pop-up alert message shall
    ...     be displayed to the user. The [Next] button of the Study Information page shall be disabled
    ...     2. At step 2, the selected device ID shall be displayed
    ...     3. At step 3,4 the selected data shall be displayed
    ...     4. At step 5, a pop-up shall be displayed with the following information:
    ...     - Title: Feature not available
    ...     - Content: Please contact your sales representative to enable this feature.
    ...     - Button: Okay
    ...     5. At step 6, clicking the Okay button shall dismiss the modal and clear the current study type
    ...     6. At step 7,8,9 the entered/selected data shall be displayed
    ...     7. At step 10, the user will navigate back to step 2 (Patient contact)
    ...     8. At step 11, the Next button is disabled
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-06     manual       CP-2.14.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-07: Cannot Fill all information in step 3-Study information
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician cannot fill all information in step 3 with Biocore/Biotres device does not have
    ...     the auto-events detection enabled and firmware version has been updated to the latest
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 3 (Study information)
    ...     2. There is a Biocore/Biotres device does not have the auto-events dectection enabled (process on the Sales portal)
    ...     3. The firmwave version of Biocore/Biotres device has been updated to the latest
    ...
    ...     Test Steps:
    ...     1. On the facility dropdown list, click on the dropdown and select an active facility
    ...     2. On Device section, select Biocore/Biotres button and select a Device ID on dropdown list
    ...     3. Select a physician on the Referring physician dropdown list
    ...     4. Select a physician on the Interpreting physician dropdown list
    ...     5. Select a MCT/MCT Peek/CARDIAC EVENT/HOLTER AND FOLLOW ON STUDY on the Study type dropdown list
    ...     6. Click the Okay button on pop-up
    ...     7. Enter valid value on the Study duration field
    ...     8. Select a valid date on the Patient return visit datepicker
    ...     9. Enter valid value on the Clinic Initials field
    ...     10. Click the Previous button
    ...     11. Observe the Next button
    ...
    ...     Expected Results:
    ...     1. At step 1, There shall be a drop-down list of facilities in case the user has more than one assigned
    ...     facility. Otherwise, the Facility Name attribute shall be hidden
    ...     - In case the user selects a facility having a financial hold of 90 days, a pop-up alert message shall
    ...     be displayed to the user. The [Next] button of the Study Information page shall be disabled
    ...     2. At step 2, the selected device ID shall be displayed
    ...     3. At step 3,4 the selected data shall be displayed
    ...     4. At step 5, a pop-up shall be displayed with the following information:
    ...     - Title: Feature not available
    ...     - Content: Please contact your sales representative to enable this feature.
    ...     - Button: Okay
    ...     5. At step 6, clicking the Okay button shall dismiss the modal and clear the current study type
    ...     6. At step 7,8,9 the entered/selected data shall be displayed
    ...     7. At step 10, the user will navigate back to step 2 (Patient contact)
    ...     8. At step 11, the Next button is disabled
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-07     manual       CP-2.14.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-08: Cannot Fill information in step 3-Study information
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician cannot fill all information in step 3 with Biocore/Biotres device has
    ...     the auto-events detection enabled and firmware version has not been updated to the latest
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 3 (Study information)
    ...     2. There is a Biocore/Biotres device has the auto-events dectection enabled (process on the Sales portal)
    ...     3. The firmwave version of Biocore/Biotres device has not been updated to the latest
    ...
    ...     Test Steps:
    ...     1. On the facility dropdown list, click on the dropdown and select an active facility
    ...     2. On Device section, select Biocore/Biotres button and select a Device ID on dropdown list
    ...     3. Select a physician on the Referring physician dropdown list
    ...     4. Select a physician on the Interpreting physician dropdown list
    ...     5. Select a MCT/MCT Peek/CARDIAC EVENT/HOLTER AND FOLLOW ON STUDY on the Study type dropdown list
    ...     6. Click the Okay button on pop-up
    ...     7. Enter valid value on the Study duration field
    ...     8. Select a valid date on the Patient return visit datepicker
    ...     9. Enter valid value on the Clinic Initials field
    ...     10. Click the Previous button
    ...     11. Observe the Next button
    ...
    ...     Expected Results:
    ...     1. At step 1, There shall be a drop-down list of facilities in case the user has more than one assigned
    ...     facility. Otherwise, the Facility Name attribute shall be hidden
    ...     - In case the user selects a facility having a financial hold of 90 days, a pop-up alert message shall
    ...     be displayed to the user. The [Next] button of the Study Information page shall be disabled
    ...     2. At step 2, the selected device ID shall be displayed
    ...     3. At step 3,4 the selected data shall be displayed
    ...     4. At step 5, a pop-up shall be displayed with the following information:
    ...     - Title:  Firmware update required
    ...     - Content: This study type is not supported by the current firmware of this device. Please update the
    ...     firmware to its latest version.
    ...     - Button: Okay
    ...     5. At step 6, clicking the Okay button shall dismiss the modal and clear the current study type
    ...     6. At step 7,8,9 the entered/selected data shall be displayed
    ...     7. At step 10, the user will navigate back to step 2 (Patient contact)
    ...     8. At step 11, the Next button is disabled
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-08     manual       CP-2.14.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-CREATE-STEP3-10-CP2.24.2: Step 3-Display text notify about Diagnostics Yield in case of study duration less than 10d
    [Documentation]   Author: Nhan Nguyen
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-10-CP2.24.2     manual       CP-2.24.2    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-11-CP2.24.2: Step 3-Diagnostic Yield page: open in new tab when user click “Click to learn more”
    [Documentation]   Author: Tam Ho
    ...
    ...     Description:
    ...     The clinic Physician clicking the "Learn more" link in the text notify opens a reference page in a new browser tab
    ...
    ...     Precondition:
    ...     1. The Clinic Physician user is on Create new study screen – step 3 (Study information)
    ...     2. The study type is not Holter.
    ...     3. The system displays text notify for study durations less than 10 days.
    ...
    ...     Test Steps:
    ...     1. Set the study duration to less than 10 days (e.g., 7 days).
    ...     2. Click the Learn more link in the alert.
    ...
    ...     Expected Results:
    ...    The new tab displays the reference page linked to the "Learn more" link.


    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-11-CP2.24.2     manual       CP-2.24.2    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-CREATE-STEP3-12-CP2.24.2: Step 3-Diagnostic Yield: text notify does not close automatically
    [Documentation]   Author: Tam Ho
    ...
    ...     Description:
    ...     Ensure that the displayed text notify remains open until explicitly closed by the user.
    ...
    ...     Precondition:
    ...     1. The Clinic Physician user is on Create new study screen – step 3 (Study information)
    ...     2. The study type is not Holter.
    ...     3. The system displays text notify for study durations less than 10 days.
    ...
    ...     Test Steps:
    ...     1. Wait for 1-2 minutes without interacting with text notify
    ...
    ...     Expected Results:
    ...    The text notify remains visible and does not automatically close after a period of time


    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-12-CP2.24.2     manual       CP-2.24.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-TECH-CP-STUDIES-CREATE-STEP3-13-CP2.24.2: Step 3-Diagnostic Yield: text notify can be closed manually
    [Documentation]   Author: Tam Ho
    ...
    ...     Description:
    ...     Ensure that the user can close the text notify by clicking the close button.
    ...
    ...     Precondition:
    ...     1. The Clinic Physician user is on Create new study screen – step 3 (Study information)
    ...     2. The study type is not Holter.
    ...     3. The system displays text notify for study durations less than 10 days.
    ...
    ...     Test Steps:
    ...     1. Click the close button on the text notify .
    ...
    ...     Expected Results:
    ...     The text notify is dismissed and no longer visible on the page.


    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-13-CP2.24.2     manual       CP-2.24.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-14-CP2.26.0: UI Select Device: Auto-Suggests Devices with "Online"+ "Ready for New Study" (+Maintenance needed)
    [Documentation]   Author: Tam Ho
    ...
    ...     Description:
    ...
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...


    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-14-CP2.26.0     manual       CP-2.26.0    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-15-CP2.26.0: UI Select Device: Search for All Device IDs Regardless of Status
    [Documentation]   Author: Tam Ho
    ...
    ...     Description:
    ...
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...


    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-15-CP2.26.0     manual       CP-2.26.0    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-16-CP2.26.0: UI Select Device: Prioritize 'Online & Ready for New Study' Devices in Search Results
    [Documentation]   Author: Tam Ho
    ...
    ...     Description:
    ...
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...


    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-16-CP2.26.0     manual       CP-2.26.0    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-17-CP2.26.0: UI Select Device: Display "High Sample Rate" Tag for Devices with 'Online' and 'Ready for New Study' Status and High Sample Rate
    [Documentation]   Author: Tam Ho
    ...
    ...     Description:
    ...
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...


    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-17-CP2.26.0     manual       CP-2.26.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-18-CP2.26.0: UI Select Device: Display "RMA" Tag for Devices with "Online - Ready for New Study" and "RMA" Status
    [Documentation]   Author: Tam Ho
    ...
    ...     Description:
    ...
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...


    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-18-CP2.26.0     manual       CP-2.26.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-19-CP2.26.0: UI Select Device: Display "RMA" Tag for Devices with "High Sample Rate" and "RMA" Status
    [Documentation]   Author: Tam Ho
    ...
    ...     Description:
    ...
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...


    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-19-CP2.26.0     manual       CP-2.26.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-20-CP2.26.0: UI Select Device: Display "Renewal" Tag for Devices with "High Sample Rate" and "Renewal" Status
    [Documentation]   Author: Tam Ho
    ...
    ...     Description:
    ...
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...


    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-20-CP2.26.0     manual       CP-2.26.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-21-CP2.26.0: UI Select Device: Display "Offline" Tag for Devices with "High Sample Rate" and "Offline" Status
    [Documentation]   Author: Tam Ho
    ...
    ...     Description:
    ...
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...


    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-21-CP2.26.0     manual       CP-2.26.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-22-CP2.26.0: UI Select Device: Display "In Study" Tag for Devices with "High Sample Rate" and "In Study" Status
    [Documentation]   Author: Tam Ho
    ...
    ...     Description:
    ...
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...


    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-22-CP2.26.0     manual       CP-2.26.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-23-CP2.26.0: UI Select Device: Display "Offline" Tag for Devices with "Maintenance Needed" and "Offline" Status
    [Documentation]   Author: Tam Ho
    ...
    ...     Description:
    ...
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...


    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-23-CP2.26.0     manual       CP-2.26.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-24-CP2.26.0: UI Select Device: Display "In study" Tag for Devices with "Maintenance Needed" and "In study" Status
    [Documentation]   Author: Tam Ho
    ...
    ...     Description:
    ...
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...


    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-24-CP2.26.0     manual       CP-2.26.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-25-CP2.26.0: UI Select Device: Display "RMA" Tag for Devices with "RMA " and "Offline" Status
    [Documentation]   Author: Tam Ho
    ...
    ...     Description:
    ...
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...


    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-25-CP2.26.0     manual       CP-2.26.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-26-CP2.26.0: UI Select Device: Display "Renewal" Tag for Devices with "Renewal " and Offline" Status
    [Documentation]   Author: Tam Ho
    ...
    ...     Description:
    ...
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...


    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-26-CP2.26.0     manual       CP-2.26.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-27-CP2.26.0: UI Select Device: Display "In study" Tag for Devices with "In study" and Offline" Status
    [Documentation]   Author: Tam Ho
    ...
    ...     Description:
    ...
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...


    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-27-CP2.26.0     manual       CP-2.26.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-28-CP2.26.0: UI Select Device: Display Error Modal for RMA Device When Selecting Device with RMA Status
    [Documentation]   Author: Tam Ho
    ...
    ...     Description:
    ...
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...


    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-28-CP2.26.0     manual       CP-2.26.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-29-CP2.26.0: UI Select Device: Display Error Modal for "In Study" Device When Selecting Device with "In Study" Status
    [Documentation]   Author: Tam Ho
    ...
    ...     Description:
    ...
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...


    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-29-CP2.26.0     manual       CP-2.26.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-30-CP2.26.0: UI Select Device: Display Error Modal for "Offline" Device When Selecting Device with "Offline" Status
    [Documentation]   Author: Tam Ho
    ...
    ...     Description:
    ...
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...


    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-30-CP2.26.0     manual       CP-2.26.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-31-CP2.26.0: UI Select Device: Display Error Modal for "Renewal" Device When Selecting Device with "Renewal" Status
    [Documentation]   Author: Tam Ho
    ...
    ...     Description:
    ...
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...


    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-31-CP2.26.0     manual       CP-2.26.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-36-CP2.28.0: User Can Add a Physician via NPI Search
    [Documentation]   Author: Tam Ho
    ...
    ...     Description: Ensure the user can add a new physician by searching via NPI
    ...
    ...
    ...     Precondition: 
    ...     1. User at step 3 when create study
    ...     2. Add New Physician
    ...
    ...     Test Steps:
    ...     1. Enter a valid 10-digit NPI number in the search field
    ...     2. Click the "Search" button
    ...     3. Click "Add New Physician"
    ...
    ...     Expected Results:
    ...     1. Physician's details are populated based on the NPI
    ...     2. Add New Physician successfully

    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-36-CP2.28.0     manual       CP-2.28.0    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-37-CP2.28.0: NPI Search Input is Focused by Default
    [Documentation]   Author: Tam Ho
    ...
    ...     Description: Ensure the user can add a new physician via Manual entry
    ...
    ...     Precondition: 
    ...     1. User at step 3 when create study
    ...     2. Add New Physician
    ...     3. Switch to "Manual Entry" mode
    ...
    ...     Test Steps:
    ...     1. Full fill information
    ...     2. Click "Add New Physician"
    ...
    ...     Expected Results:
    ...     1. Add New Physician successfully

    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-37-CP2.28.0     manual       CP-2.28.0    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-38-CP2.28.0: NPI Search Input is Focused by Default
    [Documentation]   Author: Tam Ho
    ...
    ...     Description: Verify the NPI search input field is focused by default
    ...
    ...
    ...     Precondition:
    ...     1. User at step 3 when create study
    ...     2. Add New Physician
    ...
    ...     Test Steps:
    ...     1. Observe the state of the NPI search input field upon page load"
    ...
    ...     Expected Results:
    ...     1. The NPI search input field is focused automatically, allowing the user to start typing without clicking the input box

    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-38-CP2.28.0     manual       CP-2.28.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-39-CP2.28.0: Invalid NPI Input Shows Error
    [Documentation]   Author: Tam Ho
    ...
    ...     Description: Verify an error message is displayed for invalid NPI input
    ...
    ...
    ...     Precondition:
    ...     1. User at step 3 when create study
    ...     2. Add New Physician
    ...
    ...     Test Steps:
    ...     1. Enter an invalid NPI (e.g., fewer than 10 digits, letters, or special characters)
    ...     2. Click the "Search" button
    ...
    ...     Expected Results:
    ...     1. An error message is displayed, notifying the user that the NPI input is invalid and must be a 10-digit number

    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-39-CP2.28.0     manual       CP-2.28.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-40-CP2.28.0: Valid NPI with No Data Shows Message
    [Documentation]   Author: Tam Ho
    ...
    ...     Description: Verify a message is displayed when no data is found for a valid NPI
    ...
    ...
    ...     Precondition:
    ...     1. User at step 3 when create study
    ...     2. Add New Physician
    ...
    ...     Test Steps:
    ...     1. Enter a valid 10-digit NPI that does not exist in the CMS API database
    ...     2. Click the "Search" button
    ...
    ...     Expected Results:
    ...     1. A message is displayed notifying the user that no data was found for the entered NPI

    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-40-CP2.28.0     manual       CP-2.28.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-41-CP2.28.0: "Searching for Physician..." Screen Appears When Searching by NPI
    [Documentation]   Author: Tam Ho
    ...
    ...     Description: Verify the "Searching for physician..." screen appears while searching by NPI
    ...
    ...
    ...     Precondition:
    ...     1. User at step 3 when create study
    ...     2. Add New Physician
    ...
    ...     Test Steps:
    ...     1. Enter a valid 10-digit NPI number in the search field
    ...     2. Click the "Search" button
    ...
    ...     Expected Results:
    ...     1. A "Searching for physician..." screen or loading indicator is displayed while the system processes the NPI search
    ...     2. The loading indicator disappears once the search is completed

    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-41-CP2.28.0     manual       CP-2.28.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-42-CP2.28.0: Valid NPI Auto-Fills Fields
    [Documentation]   Author: Tam Ho
    ...
    ...     Description: Verify that valid NPI auto-fills physician details
    ...
    ...
    ...     Precondition:
    ...     1. User at step 3 when create study
    ...     2. Add New Physician
    ...
    ...     Test Steps:
    ...     1. Enter a valid 10-digit NPI number in the search field
    ...     2. Click the "Search" button
    ...
    ...     Expected Results:
    ...     Upon successful search, the following fields are auto-filled based on the API response:
    ...         1. First Name
    ...         2. Last Name
    ...         3. Title
    ...         4. NPI
    ...         5. Country
    ...         6. Address
    ...         7. City
    ...         8. State
    ...         9. Zip code
    ...         10. Phone number
    ...         11. After hours phone number
    ...         12. Email
    ...         13. Fax number

    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-42-CP2.28.0     manual       CP-2.28.0    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP3-43-CP2.28.0: Allow Editing of Auto-Filled Fields
    [Documentation]   Author: Tam Ho
    ...
    ...     Description: Verify that users can edit auto-filled physician details after a valid NPI search
    ...
    ...
    ...     Precondition:
    ...     1. User at step 3 when create study
    ...     2. Add New Physician
    ...
    ...     Test Steps:
    ...     1. Enter a valid 10-digit NPI number in the search field
    ...     2. Click the "Search" button
    ...     3. Modify the value of each field to something different
    ...     4. Click "Add New Physician"
    ...
    ...     Expected Results:
    ...     The user is able to modify all the auto-filled fields:
    ...         1. First Name
    ...         2. Last Name
    ...         3. Title
    ...         4. NPI
    ...         5. Country
    ...         6. Address
    ...         7. City
    ...         8. State
    ...         9. Zip code
    ...         10. Phone number
    ...         11. After hours phone number
    ...         12. Email
    ...         13. Fax number
    ...     Add New Physician successfully

    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-43-CP2.28.0     manual       CP-2.28.0    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BF-TECH-CP-STUDIES-CREATE-STEP3-44-CP2.29.1: Can Be Initiated study Without a Device ID
    [Documentation]   Author: Tam Ho
    ...
    ...     Description: Verify that users can initiate a study without a Device ID by selecting the "Assign Device Later" option
    ...
    ...
    ...     Precondition:
    ...     1. User at step 3 when create study
    ...     2. The Device Type and Device ID fields are visible by default.
    ...
    ...     Test Steps:
    ...     1. Select the "Assign Device Later" option
    ...     2. Observe the form
    ...     3. Deselect the "Assign Device Later" option
    ...     4. Observe the form again
    ...
    ...     Expected Results:
    ...     1. When the "Assign Device Later" option is selected
    ...         The Device Type and Device ID fields are hidden, even if data was previously entered
    ...     2. When the "Assign Device Later" option is deselected
    ...         The Device Type and Device ID fields reappear in their default state, clearing any previous input

    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP3-44-CP2.29.1     manual       CP-2.29.1    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-TEST-STEP3-05-CP2.16.8: Confirm returned device if the selected device is not returned - For Active facility
    [Documentation]   Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     1. The device is not returned (display on Fleet page >> Waiting for return tab)
    ...
    ...     Test Steps:
    ...     1. Select the device
    ...     2. On modal, click "Go to device’s previous study details." hyperlink
    ...     3. On modal, click "Continue" button
    ...     4. On modal, click "Cancel" button
    ...
    ...     Expected Results:
    ...     1. Display a confirmation modal with content "By clicking “Continue” implies that you have confirmed the
    ...     device has been returned with all the accompanying items. Are you sure you want to proceed?" Need more consideration? Go to device’s previous study details.
    ...     Notes: If the last study of this device was not handled by the current Physician, this text and hyperlink shall be hidden.
    ...     2. Redirect the user to the Study details page that the device was in in a new tab of the browser. The modal shall exit and the Device ID field shall be cleared
    ...     3. The device shall be returned with all items received, the modal shall be closed, the Device ID shall be kept on the field
    ...     4. The modal shall be closed and the field shall be cleared
    ...
    ...     **Others**
    ...     Update Date: 11/17/2023 - Nhan Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-TEST-STEP3-05-CP2.16.8     manual    CP-2.16.8
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP4-01: Fill information in step 4-Diagnosis
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician can fill information in step 4-Diagnosis
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 4 (Diagnosis)
    ...     2. The user has selected HOLTER/EXTENDED HOLTER on the Study type dropdown list at step 3 if Biocore/Biotres device
    ...     3. The user has selected all study types from dropdown list at step 3 if Bioflux device
    ...
    ...     Test Steps:
    ...     1. On Primary diagnosis code dropdown list, select a specific code
    ...     2. On the Secondary diagnosis code (optional) dropdown list, select a specific code
    ...     3. On the Patient medication (optional) text input, enter valid content
    ...     4. On the Physician amendments notes (optional) text input, enter valid content
    ...     5. On the Insurance type dropdown list, select a specific insurance
    ...     6. On the Provider (optional) text input, enter valid provider
    ...     7. On the Pre-authorization required, select the Yes or No toggle button
    ...     8. On the Symptoms the patient experienced dropdown list, select a specific symptoms
    ...     9. On the How many times did the symptoms happen? dropdown list, select a sepcific option
    ...     10. Select the Yes/No button on Had a heart monitor before? section
    ...     11. Click the Previous button
    ...     12. Click the Initiate button
    ...
    ...     Expected Results:
    ...     1. At step 1,2,3,4,5,6,7,8,9,10 the selected/entered data shall be displayed
    ...     2. At step 11, the user will navigate back to step 3 (Study information)
    ...     3. At step 12, clicking the Initiate button will initiate a new study on the device
    ...     4. After the study was initiated:
    ...     - The Biolfux/Biocore/Biotres device assigned to this study will display the study setup screen with the patient’s name,
    ...     patient ID, and study duration information inputted from the above steps
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP4-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP4-02-CP2.16.2: Fill information in step 4-Diagnosis
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician can fill information in step 4-Diagnosis
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 4 (Diagnosis)
    ...     2. The user selected a MCT/MCT Peek/CARDIAC EVENT/HOLTER AND FOLLOW ON STUDY on the Study type dropdown list
    ...     at step 3
    ...
    ...     Test Steps:
    ...     1. On Primary diagnosis code dropdown list, select a specific code
    ...     2. On the Secondary diagnosis code (optional) dropdown list, select a specific code
    ...     3. On the Patient medication (optional) text input, enter valid content
    ...     4. On the Physician amendments notes (optional) text input, enter valid content
    ...     5. On the Insurance type dropdown list, select a specific insurance
    ...     6. On the Provider (optional) text input, enter valid provider
    ...     7. On the Pre-authorization required, select the Yes or No toggle button
    ...     8. On the Symptoms the patient experienced dropdown list, select a specific symptoms
    ...     9. On the How many times did the symptoms happen? dropdown list, select a sepcific option
    ...     10. Select the Yes/No button on Had a heart monitor before? section
    ...     11. Click the Previous button
    ...     12. Click the Initiate button
    ...
    ...     Expected Results:
    ...     1. At step 1,2,3,4,5,6,7,8,9 the selected/entered data shall be displayed
    ...     2. At step 11, the user will navigate back to step 3 (Study information)
    ...     3. At step 12, clicking the Initiate button will display a "Disclaimer" pop-up saying:
    ...     - Content: "For MCT and Event studies, the patient must be instructed of the importance of maintaining a Biocore/Biotres
    ...     to Biocare Health app connection.  Please ensure the reference code is entered on the mobile device to
    ...     connect their Biocore/Biotres device to the Biocare Health app and maintain the connection during the study. Please
    ...     note that study response times may be affected if the connection is not ensured."
    ...     - Button: Cancel and Agree. Clicking the Cancel button shall dismiss the pop-up and the user is kept staying
    ...     at the current step. Click the Agree button shall initiate the study
    ...     4. After the study was initiated:
    ...     - The Biocore/Biotres device assigned to this study will display the study setup screen with the patient’s name,
    ...     patient ID, and study duration information inputted from the above steps
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP4-02-CP2.16.2     manual       CP-2.14.0      CP-2.16.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP4-03-CP2.16.6: Add new primary and secondary diagnosis code in step 4-Diagnosis
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic Physician can view and fill new primary and secondary diagnosis code in step 4-Diagnosis
    ...
    ...     Precondition:
    ...     1. The Clinic Physician user is on Create new study screen – step 4 (Diagnosis)
    ...     2. The user selected a MCT/MCT Peek/CARDIAC EVENT/HOLTER AND FOLLOW ON STUDY on the Study type dropdown list
    ...     at step 3
    ...
    ...     Test Steps:
    ...     1. On Primary diagnosis code dropdown list, click and enter the keyword related to the new primary diagnosis code
    ...     2. On Primary diagnosis code dropdown list, select the new primary diagnosis code
    ...     3. On the Secondary diagnosis code (optional) click and enter the keyword related to the new primary diagnosis code
    ...     4. On the Secondary diagnosis code (optional), select the new primary diagnosis code
    ...     5. On the Patient medication (optional) text input, enter valid content
    ...     6. On the Physician amendments notes (optional) text input, enter valid content
    ...     7. On the Insurance type dropdown list, select a specific insurance
    ...     8. On the Provider (optional) text input, enter valid provider
    ...     9. On the Pre-authorization required, select the Yes or No toggle button
    ...     10. On the Symptoms the patient experienced dropdown list, select a specific symptoms
    ...     11. On the How many times did the symptoms happen? dropdown list, select a sepcific option
    ...     12. Select the Yes/No button on Had a heart monitor before? section
    ...     13. Click the Previous button
    ...     14. Click the Initiate button
    ...
    ...     Expected Results:
    ...     1. At step 1,3: the new code "I25.118 - Atherosclerotic heart disease of a native coronary artery with other
    ...     forms of angina pectoris" is displayed
    ...     2. At step 2,4,5,6,7,8,9,10,11: The selected/entered data shall be displayed
    ...     3. At step 12, clicking the Initiate button will display a "Disclaimer" pop-up saying:
    ...     - Content: "For MCT and Event studies, the patient must be instructed of the importance of maintaining a Biocore/Biotres
    ...     to Biocare Health app connection.  Please ensure the reference code is entered on the mobile device to
    ...     connect their Biocore/Biotres device to the Biocare Health app and maintain the connection during the study. Please
    ...     note that study response times may be affected if the connection is not ensured."
    ...     - Button: Cancel and Agree. Clicking the Cancel button shall dismiss the pop-up and the user is kept staying
    ...     at the current step. Click the Agree button shall initiate the study
    ...     4. After the study was initiated:
    ...     - The Biocore/Biotres device assigned to this study will display the study setup screen with the patient’s name,
    ...     patient ID, and study duration information inputted from the above steps
    ...
    ...     **Others**
    ...     Update Date: 9/13/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP4-03-CP2.16.6     manual       CP-2.14.0      CP-2.16.6
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-STEP5-01: View information in step 5-Verify ECG signal
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician can view information in step 5-Verify ECG signal
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 4 (Verify ECG signal)
    ...
    ...     Test Steps:
    ...     1. Observe the screen
    ...
    ...     Expected Results:
    ...     - The portal shall display a screen for instructing the user to verify the ECG signal before starting the study
    ...     - There shall be a Done button. When the button is pressed, the user will be redirected to the STUDIES page,
    ...     the study shall appear on the active studies list
    ...     When the user clicks the Start button on Bioflux/Biocore/Biotres device:
    ...     - There shall be an email sent to the patient's mailbox containing the reference code
    ...     - There shall also an SMS sent to the patient if the patient locates inside the US or Canada
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-STEP5-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-DONE-01-CP2.29.1: Verify Study Redirection to Active Tab When Device Is Assigned
    [Documentation]   Author: Tam Ho
    ...
    ...     Description: Verify that after clicking the "Done" button, if a device is assigned, 
    ...     the user is redirected to the Active tab, and the study appears in the Active Studies list.
    ...
    ...     Precondition:
    ...     1. The study creation form is filled out completely
    ...     2. A device has been assigned to the study
    ...     3. The "Done" button is visible and enabled
    ...
    ...     Test Steps:
    ...     1. Click the "Done" button
    ...     2. Observe the page redirection
    ...
    ...     Expected Results:
    ...     - The user is redirected to the Active tab
    ...     - The study appears in the Active Studies list
    ...
    [Tags]  BF-TECH-CP-STUDIES-CREATE-DONE-01-CP2.29.1     manual    CP-2.29.1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-DONE-02-CP2.29.1: Verify Study Redirection to Unassigned Tab When No Device Is Assigned
    [Documentation]   Author: Tam Ho
    ...
    ...     Description: Verify that after clicking the "Done" button, if no device is assigned,
    ...     the user is redirected to the Unassigned tab, and the study appears in the Unassigned Studies list.
    ...
    ...     Precondition:
    ...     1. The study creation form is filled out completely
    ...     2. The "Assign Device Later" option is selected, meaning no device is assigned
    ...     3. The "Done" button is visible and enabled
    ...
    ...     Test Steps:
    ...     1. Click the "Done" button
    ...     2. Observe the page redirection
    ...
    ...     Expected Results:
    ...     - The user is redirected to the Unassigned tab
    ...     - The study appears in the Unassigned Studies list
    ...
    [Tags]  BF-TECH-CP-STUDIES-CREATE-DONE-02-CP2.29.1     manual    CP-2.29.1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-BIODIRECT-STEP1-01: Fill information in step 1-Patient information
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician can fill information in step 1- Patient information
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 1 (Patient information)
    ...     2. Bioflux Admin has enabled the Biolfux Direct to the facility
    ...
    ...     Test Steps:
    ...     1. Enter valid value on the Patient ID field
    ...     2. Enter valid value on the First name field
    ...     3. Enter valid value on the Middle name (optional) field
    ...     4. Enter valid value on the Last name field
    ...     5. Enter valid value on the Date of birth field
    ...     6. Select the Male or Female Gender toggle button
    ...     7. Enter a valid value in the Height field ( must be ≥ 1 ft and ≤ 9 ft 11 in -  integers only)
    ...     8. Enter a valid value in the Weight field (must be ≥ 1 lb and ≤ 800.9 lb)
    ...     9. Select the Yes or No Pacemaker toggle button
    ...     10. Click the Next button
    ...
    ...     Expected Results:
    ...     1. The entered data shall be displayed
    ...     2. At step 10, the user should be navigated to step 2 (Patient contact)

    [Tags]  BF-TECH-CP-STUDIES-CREATE-BIODIRECT-STEP1-01        auto
    Navigate To Studies Page
    Open New Study
    ${current_page}     Get Current New Study Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page}       Patient information      # PAGE 1
    Create New Study Page 1     patient_id=PT103     first_name=Patient     middle_name=Test      last_name=01     dob=11/11/2000      height=4ft, 3in     weight=50lb       ethnicity=Asian      pacemaker=${True}     icd=${True}    is_next=${False}
    ${values}       Get New Study Values Page 1
    Run Keyword And Continue On Failure    Should Be Equal      ${values}[Patient ID]     PT103
    Run Keyword And Continue On Failure    Should Be Equal      ${values}[First name]     Patient
    Run Keyword And Continue On Failure    Should Be Equal      ${values}[Middle name]    Test
    Run Keyword And Continue On Failure    Should Be Equal      ${values}[Last name]      01
    Run Keyword And Continue On Failure    Should Be Equal      ${values}[Date of birth]  11/11/2000
    Run Keyword And Continue On Failure    Should Be Equal      ${values}[Height (ft)]    4
    Run Keyword And Continue On Failure    Should Be Equal      ${values}[Height (in)]    3
    Run Keyword And Continue On Failure    Should Be Equal      ${values}[Weight]         50
    Run Keyword And Continue On Failure    Should Be Equal      ${values}[Ethnicity]      Asian
    Run Keyword And Continue On Failure    Should Be True       ${values}[Pacemaker]
    Run Keyword And Continue On Failure    Should Be True       ${values}[ICD]
    Create New Study Page 1    is_next=${True}     # Click on next
    ${current_page}     Get Current New Study Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page}       Patient contact        # PAGE 2

BF-TECH-CP-STUDIES-CREATE-BIODIRECT-STEP2-01: Fill information in step 2-Patient contact
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician can fill information in step 2- Patient contact
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 2 (Patient contact)
    ...
    ...     Test Steps:
    ...     1. Select the specific country
    ...     2. In the address field, enter the keyword and select the suggested address
    ...     3. In the primary phone number field, enter a valid phone number
    ...     4. Enter valid email format on the Email (optional) field
    ...     5. In the Secondary phone number (optional) field, enter a valid phone number
    ...     6. On the SECONDARY CONTACT section, click the Add secondary contact (optional) button
    ...     7. Enter valid value on the Name (optional) field
    ...     8. Enter valid value on the Relationship (optional) field
    ...     9. Enter valid value on the Phone number (optional) field
    ...     10. Enter valid value on the Email (optional) field
    ...     11. Click the Previous button
    ...     12. Click the Next button
    ...
    ...     Expected Results:
    ...     1. The entered data shall be displayed
    ...     2. At step 2, the city, state, and zip code fields will be automatically filled according to
    ...     the selected address
    ...     3. At step 11, the user will navigate back to step 1 (Patient information)
    ...     4. At step 12, The user should be navigated to step 3 (Study information)

    [Tags]  BF-TECH-CP-STUDIES-CREATE-BIODIRECT-STEP2-01        auto
    Navigate To Studies Page
    Open New Study
    ${current_page}     Get Current New Study Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page}       Patient information        # PAGE 1
    ${second_contact}   Create Dictionary    name=Jonh     relationship=brother     phone_number=049-586-7594     email=jonh@yopmail.com
    Create New Study Page 1     patient_id=PT103     first_name=Patient     middle_name=Test      last_name=01     dob=11/11/2000      height=4ft, 3in     weight=50lb     ethnicity=Asian      pacemaker=${True}     icd=${True}
    Create New Study Page 2     country=Canada      address=AAR Plumbing and Heating Supply, Steeles Avenue East, Brampton, ON, Canada       primary_phone_number=084-657-4637        email=patient@yopmail.com
    ...  secondary_phone_number=0293757473      secondary_contact=${second_contact}     is_next=${False}       is_previous=${True}
    ${current_page}      Get Current New Study Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page}       Patient information         # PAGE 1
    Create New Study Page 1    is_next=${True}
    ${current_page}      Get Current New Study Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page}       Patient contact       # PAGE 2
    ${values_page_2}     Get New Study Values Page 2
    Run Keyword And Continue On Failure    Should Be Equal        ${values_page_2}[Country]     Canada
    Run Keyword And Continue On Failure    Should Not Be Empty    ${values_page_2}[Address]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${values_page_2}[City]        # automatically filled
    Run Keyword And Continue On Failure    Should Not Be Empty    ${values_page_2}[State]       # automatically filled
    Run Keyword And Continue On Failure    Should Not Be Empty    ${values_page_2}[Zip code]
    Run Keyword And Continue On Failure    Should Be Equal        ${values_page_2}[Primary phone number]                084-657-4637
    Run Keyword And Continue On Failure    Should Be Equal        ${values_page_2}[Email]                               patient@yopmail.com
    Run Keyword And Continue On Failure    Should Be Equal        ${values_page_2}[Secondary phone number]              029-375-7473
    Run Keyword And Continue On Failure    Should Be Equal        ${values_page_2}[Secondary contact name]              Jonh
    Run Keyword And Continue On Failure    Should Be Equal        ${values_page_2}[Secondary contact relationship]      brother
    Run Keyword And Continue On Failure    Should Be Equal        ${values_page_2}[Secondary contact phone number]      049-586-7594
    Run Keyword And Continue On Failure    Should Be Equal        ${values_page_2}[Secondary contact email]             jonh@yopmail.com
    Create New Study Page 2    is_next=${False}    is_previous=${True}
    ${current_page}     Get Current New Study Page
    Run Keyword And Continue On Failure     Should Be Equal    ${current_page}    Patient information
    Create New Study Page 1    is_next=${True}
    ${current_page}     Get Current New Study Page
    Run Keyword And Continue On Failure     Should Be Equal    ${current_page}    Patient contact
    Create New Study Page 2    is_next=${True}     is_previous=${False}
    ${current_page}     Get Current New Study Page
    Run Keyword And Continue On Failure     Should Be Equal    ${current_page}    Study information

BF-TECH-CP-STUDIES-CREATE-BIODIRECT-STEP3-01: Fill information in step 3-Study information
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician can fill information in step 3- Study information
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 3 (Study information)
    ...     2. Bioflux Admin has enabled the Biolfux Direct to the facility
    ...
    ...     Test Steps:
    ...     1. On Device section, check the“Use Biodirect (added charge will be applied)”
    ...     2. Select a physician on the Referring physician dropdown list
    ...     3. Select a physician on the Interpreting physician dropdown list
    ...     4. Select a type on the Study type dropdown list
    ...     5. Enter valid value on the Study duration field
    ...     6. Select a valid date on the Patient return visit datepicker
    ...     7. Enter valid value on the Clinic Initials field
    ...     8. Click the Previous button
    ...     9. Click the Next button
    ...
    ...     Expected Results:
    ...     1. At step 1, If the user checked for Biodirect service => the Device ID component shall be disabled
    ...     - An alert message shall also be displayed under the Device field: “Please note that Biodirect requires the
    ...     patient's email for shipping purposes.”
    ...     - In case the user did not fill in the patient’s email in the previous step (Patient Contact):
    ...     + When he or she clicks the “Next” button to go to the next step, a confirmation dialog with the following
    ...     message shall be displayed: “The patient email is required for Biodirect study. Press Enter Now to go back
    ...     to Patient Contact step and complete the field.” with the “Enter Now” and “Cancel” options. The user can
    ...     select “Enter Now” to go back to the previous step to fill in the patient’s email or select “ Cancel” to
    ...     close the dialog. The user cannot proceed to the next step until the patient’s email is filled
    ...     + When the user is navigated back to the Patient’s Contact, an alert message stating:” Biodirect requires
    ...     the patient's email for shipping purposes” under the Patient’s email field
    ...     2. At step 3,4,5,6,7 the selected/entered data shall be displayed
    ...     3. At step 8, the user will navigate back to step 2 (Patient contact)
    ...     4. At step 9, the user should be navigated to step 4 (Diagnosis)

    [Tags]  BF-TECH-CP-STUDIES-CREATE-BIODIRECT-STEP3-01        auto
    Navigate To Studies Page
    Open New Study
    ${current_page}     Get Current New Study Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page}       Patient information       # PAGE 1
    ${second_contact}   Create Dictionary    name=Jonh     relationship=brother     phone_number=049-586-7594     email=jonh@yopmail.com
    ${date}     Get Current Date    result_format=%m/%d/%Y    increment=+15 day
    Create New Study Page 1     patient_id=PT103     first_name=Patient     middle_name=Test      last_name=01     dob=11/11/2000      height=4ft, 3in     weight=50lb     ethnicity=Asian      pacemaker=${True}     icd=${True}
    Create New Study Page 2     country=Canada      address=AAR Plumbing and Heating Supply, Steeles Avenue East, Brampton, ON, Canada       primary_phone_number=084-657-4637
    ...  secondary_phone_number=0293757473      secondary_contact=${second_contact}
    Create New Study Page 3     facility=${FACILITIES}[0][name]      use_biodirect=True     referring_physician=Physician Qa Team 01    interpreting_physician=Physician Qa Team 01    study_type=MCT – 93228-93229        study_duration=3      patient_return_visit=${date}
    ...  clinician_initials=Initials    is_next=${False}
    ${msg_biodirect}        Get Message Biodirect
    ${current_page}     Get Current New Study Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page}       Study information        # PAGE 3
    ${values_page_3}       Get New Study Values Page 3
    Run Keyword And Continue On Failure    Should Be Equal    ${values_page_3}[Facility]                ${FACILITIES}[0][name]
    Run Keyword And Continue On Failure    Should Be Equal    ${values_page_3}[Use Biodirect]           True
    Run Keyword And Continue On Failure    Should Be Equal    ${values_page_3}[Referring physician]     Physician Qa Team 01
    Run Keyword And Continue On Failure    Should Be Equal    ${values_page_3}[Interpreting physician]  Physician Qa Team 01
    Run Keyword And Continue On Failure    Should Be Equal    ${values_page_3}[Study type]              MCT – 93228-93229
    Run Keyword And Continue On Failure    Should Be Equal    ${values_page_3}[Study duration]          3
    Run Keyword And Continue On Failure    Should Be Equal    ${values_page_3}[Patient return visit]    ${date}
    Run Keyword And Continue On Failure    Should Be Equal    ${values_page_3}[Clinician Initials]      Initials
    Run Keyword And Continue On Failure    Should Be Equal    ${msg_biodirect}      Please note that Biodirect requires the patient's email for shipping purposes.
    Create New Study Page 3    is_next=${True}
    ${noti_biodirect}       Get Notification Biodirect      msg
    Run Keyword And Continue On Failure    Should Be Equal    ${noti_biodirect}         The patient email is required for Biodirect study. Press Enter Now to go back to Patient Contact step and complete the field.
    Get Notification Biodirect    is_cancel=${True}
    ${current_page}         Get Current New Study Page
    Run Keyword And Continue On Failure    Should Not Be Equal    ${current_page}       Diagnosis
    Create New Study Page 3    is_next=${True}
    ${noti_biodirect}       Get Notification Biodirect      msg
    Run Keyword And Continue On Failure    Should Be Equal    ${noti_biodirect}         The patient email is required for Biodirect study. Press Enter Now to go back to Patient Contact step and complete the field.
    Get Notification Biodirect    is_enter=${True}
    ${current_page}         Get Current New Study Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page}       Patient contact
    ${noti_email}           Get Noti Email
    Run Keyword And Continue On Failure    Should Be Equal    ${noti_email}       Biodirect requires the patient's email for shipping purposes
    Create New Study Page 2     email=patient@yopmail.com
    ${current_page}     Get Current New Study Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page}       Study information          # PAGE 3
    Create New Study Page 3    is_next=${False}     is_previous=${True}
    ${current_page}     Get Current New Study Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page}       Patient contact        # PAGE 2
    Create New Study Page 2    is_next=${True}
    ${current_page}     Get Current New Study Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page}       Study information
    Create New Study Page 3    is_next=${True}
    ${current_page}     Get Current New Study Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page}       Diagnosis                # PAGE 4                # PAGE 4

BF-TECH-CP-STUDIES-CREATE-BIODIRECT-STEP4-01: Fill information in step 4-Diagnosis
    [Documentation]     Author:  Trinh Nguyen
    ...
    ...     Description: The clinic technician can fill information in step 4-Diagnosis
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 4 (Diagnosis)
    ...
    ...     Test Steps:
    ...     1. On Primary diagnosis code dropdown list, select a specific code
    ...     2. On the Secondary diagnosis code (optional) dropdown list, select a specific code
    ...     3. On the Patient medication (optional) text input, enter valid content
    ...     4. On the Physician amendments notes (optional) text input, enter valid content
    ...     5. On the Insurance type dropdown list, select a specific insurance
    ...     6. On the Provider (optional) text input, enter valid provider
    ...     7. On the Pre-authorization required, select the Yes or No toggle button
    ...     8. On the Symptoms the patient experienced dropdown list, select a specific symptoms
    ...     9. On the How many times did the symptoms happen? dropdown list, select a sepcific option
    ...     10. Select the Yes/No button on Had a heart monitor before? section
    ...     11. Click the Previous button
    ...     12. Click the Initiate button
    ...
    ...     Expected Results:
    ...     1. At step 1,2,3,4,5,6,7,8,9 the selected/entered data shall be displayed
    ...     2. At step 11, the user will navigate back to step 3 (Study information)
    ...     3. At step 12, clicking the Initiate button will initiate a new study on the device
    ...     4. After the study was initiated:
    ...     - The user will be redirected to the STUDIES page, the study shall appear on the active studies list
    ...     - This study will display the study setup screen with the patient’s name, patient ID, and study duration
    ...     information inputted from the above steps

    [Tags]  BF-TECH-CP-STUDIES-CREATE-BIODIRECT-STEP4-01        auto
    Navigate To Studies Page
    Open New Study
    ${current_page}     Get Current New Study Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page}       Patient information       # PAGE 1
    ${second_contact}   Create Dictionary    name=Jonh     relationship=brother     phone_number=049-586-7594     email=jonh@yopmail.com
    ${date}     Get Current Date    result_format=%m/%d/%Y    increment=+15 day
    Create New Study Page 1     patient_id=PT103     first_name=Patient     middle_name=Test      last_name=01     dob=11/11/2000      height=4ft, 3in     weight=50lb     ethnicity=Asian      pacemaker=${True}     icd=${True}
    Create New Study Page 2     country=Canada      address=AAR Plumbing and Heating Supply, Steeles Avenue East, Brampton, ON, Canada       primary_phone_number=084-657-4637        email=patient@yopmail.com
    ...  secondary_phone_number=0293757473      secondary_contact=${second_contact}
    Create New Study Page 3     facility=${FACILITIES}[0][name]   device_type=Bioflux   device_id=${DEVICES}[0][id]   referring_physician=Physician Qa Team 01    interpreting_physician=Physician Qa Team 01    study_type=MCT – 93228-93229   study_duration=3   patient_return_visit=${date}
    ...  clinician_initials=Initials
    ${current_page}     Get Current New Study Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page}       Diagnosis
    Create New Study Page 4    primary_diagnosis_other=Other     primary_diagnosis_code_other_input=Other Pri Test      secondary_diagnosis_other=Other    secondary_diagnosis_code_other_input=Other second Test    patient_medication=medication
    ...  physician_notes=Phy Notes      insurance_type=Other    insurance_provider=Provider    pre_authorization=No     symptoms=TIA, Chest pain        symptoms_times_happen=Less than 6     before_heart_monitor=No   is_initiate=${False}
    ${values_page_4}        Get New Study Values Page 4
    ${symptoms}             Create List    TIA      Chest pain
    Run Keyword And Continue On Failure    Should Be Equal    ${values_page_4}[Primary diagnosis code]                      Other
    Run Keyword And Continue On Failure    Should Be Equal    ${values_page_4}[Other primary diagnosis code]                Other Pri Test
    Run Keyword And Continue On Failure    Should Be Equal    ${values_page_4}[Secondary diagnosis code]                    Other
    Run Keyword And Continue On Failure    Should Be Equal    ${values_page_4}[Other secondary diagnosis code]              Other second Test
    Run Keyword And Continue On Failure    Should Be Equal    ${values_page_4}[Patient medication]                          medication
    Run Keyword And Continue On Failure    Should Be Equal    ${values_page_4}[Physician amendments notes]                  Phy Notes
    Run Keyword And Continue On Failure    Should Be Equal    ${values_page_4}[Insurance type]                              Other
    Run Keyword And Continue On Failure    Should Be Equal    ${values_page_4}[Provider]                                    Provider
    Run Keyword And Continue On Failure    Should Be Equal    ${values_page_4}[Pre-authorization required]                  No
    Run Keyword And Continue On Failure    Should Be Equal    ${values_page_4}[Symptoms the patient experienced]            ${symptoms}
    Run Keyword And Continue On Failure    Should Be Equal    ${values_page_4}[How many times did the symptoms happen?]     Less than 6
    Run Keyword And Continue On Failure    Should Be Equal    ${values_page_4}[Had a heart monitor before?]                 No
    # Previous from 4 > 3
    Create New Study Page 4     is_initiate=${False}     is_previous=${True}
    ${current_page}     Get Current New Study Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page}       Study information
    ${values_page_3}       Get New Study Values Page 3
    ${device_id}            Set Variable        ${values_page_3}[Device ID]
    # Next from 3 > 4
    Create New Study Page 3     is_next=${True}
    ${current_page}     Get Current New Study Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page}       Diagnosis
    Create New Study Page 4     is_initiate=${True}
    Create New Study Page 5
    Navigate To Studies Page
    Filter Studies      search_by=Device ID      text_search=${device_id}
    ${studies}        Get Active Studies
    ${actual_result}    Create List    Patient     Study duration       Patient ID
    ${expected_result}      Evaluate    [key for key, value in ${studies}[0].items()]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}
    Run Keyword And Continue On Failure    List Should Contain Sub List   ${expected_result}     ${actual_result}
    Stop Active Studies    row=1

BF-TECH-CP-STUDIES-CREATE-TEST-STEP1-01: Fill information in step 1-Patient information
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician can fill information in step 1- Patient information
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 1 (Patient information)
    ...     2. There is a bioflux device that is on Ready for new study status
    ...     3. There is a biotres device that is on Ready for new study status
    ...
    ...     Test Steps:
    ...     1. Enter valid value on the Patient ID field
    ...     2. Enter valid value on the First name field
    ...     3. Enter valid value on the Middle name (optional) field
    ...     4. Enter valid value on the Last name field
    ...     5. Enter valid value on the Date of birth field
    ...     6. Select the Male or Female Gender toggle button
    ...     7. Enter a valid value in the Height field ( must be ≥ 1 ft and ≤ 9 ft 11 in -  integers only)
    ...     8. Enter a valid value in the Weight field (must be ≥ 1 lb and ≤ 800.9 lb)
    ...     9. Select the Yes or No Pacemaker toggle button
    ...     10. Click the Next button
    ...
    ...     Expected Results:
    ...     1. The entered data shall be displayed
    ...     2. At step 10, the user should be navigated to step 2 (Patient contact)
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-TEST-STEP1-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-TEST-STEP2-01: Fill information in step 2-Patient contact
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician can fill information in step 2- Patient contact
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 2 (Patient contact)
    ...
    ...     Test Steps:
    ...     1. Select the specific country
    ...     2. In the address field, enter the keyword and select the suggested address
    ...     3. In the primary phone number field, enter a valid phone number
    ...     4. Enter valid email format on the Email (optional) field
    ...     5. In the Secondary phone number (optional) field, enter a valid phone number
    ...     6. On the SECONDARY CONTACT section, click the Add secondary contact (optional) button
    ...     7. Enter valid value on the Name (optional) field
    ...     8. Enter valid value on the Relationship (optional) field
    ...     9. Enter valid value on the Phone number (optional) field
    ...     10. Enter valid value on the Email (optional) field
    ...     11. Click the Previous button
    ...     12. Click the Next button
    ...
    ...     Expected Results:
    ...     1. The entered data shall be displayed
    ...     2. At step 2, the city, state, and zip code fields will be automatically filled according to
    ...     the selected address
    ...     3. At step 11, the user will navigate back to step 1 (Patient information)
    ...     4. At step 12, The user should be navigated to step 3 (Study information)
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-TEST-STEP2-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-TEST-STEP3-01: Fill information in step 3-Study information - with device ready for Protect+ program
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician can fill information in step 3- Study information
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 3 (Study information)
    ...     2. There is a test facility
    ...     3. There is a device ready for Protect+ (currently in Maintenance tab of Devices page
    ...
    ...     Test Steps:
    ...     1. On the facility dropdown list, click on the dropdown
    ...     2. On Device section, select Bioflux/Biocore/Biotres button and select a Device ID on dropdown list
    ...     3. Select the device has a Protect+ tag
    ...     4. Click the Cancel button
    ...     5. Click the Use anyway button
    ...     6. Select a physician on the Referring physician dropdown list
    ...     7. Select a physician on the Interpreting physician dropdown list
    ...     8. Select a type on the Study type dropdown list
    ...     9. Enter valid value on the Study duration field
    ...     10. Select a valid date on the Patient return visit datepicker
    ...     11. Enter valid value on the Clinic Initials field
    ...     12. Click the Previous button
    ...     13. Click the Next button
    ...
    ...     Expected Results:
    ...     1. At step 1, There shall be a drop-down list of facilities in case the user has more than one assigned
    ...     facility. Otherwise, the Facility Name attribute shall be hidden
    ...     - In case the user selects a facility having a financial hold of 90 days, a pop-up alert message shall
    ...     be displayed to the user. The [Next] button of the Study Information page shall be disabled
    ...     - In the case the user selects a test facility, a checkbox named “Functional test” shall be displayed
    ...     2. At step 2, if the device ready for Protect+, there is a Protect+ tag displayed next to the Device ID
    ...     3. At step 3, The confirmation dialog shall be displayed with the following information:
    ...     - Title: Protect+
    ...     - Content: Please note this device has been marked ready for Protect+
    ...     - Buttons:
    ...      + Cancel
    ...      + Use anyway
    ...     3. At step 3, the confirmation dialog shall be removed
    ...     4. At step 4, confirm the use of that device and the selected device shall be displayed
    ...     5. At step 5,6,7,8,9,10,11 the selected/entered data shall be displayed
    ...     6. At step 12, the user will navigate back to step 2 (Patient contact)
    ...     7. At step 13, the user should be navigated to step 4 (Diagnosis)
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-TEST-STEP3-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-TEST-STEP3-02: Fill information in step 3 - with Biocore/Biotres device - Functional test
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician can fill information in step 3- Study information
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 3 (Study information)
    ...     2. There is a test facility
    ...
    ...     Test Steps:
    ...     1. On the facility dropdown list, click on the dropdown
    ...     2. Check the Functional test checkbox
    ...     3. On Device section, select Biocore/Biotres button and select a Device ID on dropdown list
    ...     4. Select a physician on the Referring physician dropdown list
    ...     5. Select a physician on the Interpreting physician dropdown list
    ...     6. Select a MCT/Cardiac event type on the Study type dropdown list
    ...     7. Enter valid value on the Study duration field
    ...     8. Select a valid date on the Patient return visit datepicker
    ...     9. Enter valid value on the Clinic Initials field
    ...     10. Click the Previous button
    ...     11. Click the Next button
    ...
    ...     Expected Results:
    ...     1. At step 1, There shall be a drop-down list of facilities in case the user has more than one assigned
    ...     facility. Otherwise, the Facility Name attribute shall be hidden
    ...     - In case the user selects a facility having a financial hold of 90 days, a pop-up alert message shall
    ...     be displayed to the user. The [Next] button of the Study Information page shall be disabled
    ...     - In the case the user selects a test facility, a checkbox named “Functional test” shall be displayed
    ...     2. At step 2, the checkbox is checked
    ...     3. At step 3, the selected device ID shall be displayed
    ...     4. At step 4,5,6,7,8,9 the selected/entered data shall be displayed
    ...     5. At step 10, the user will navigate back to step 2 (Patient contact)
    ...     6. At step 11, the user should be navigated to step 4 (Diagnosis)
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-TEST-STEP3-02     manual    CP-2.13.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-TEST-STEP3-03: Cannot fill information in step 3 - with Biocore/Biotres device - Functional test
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician cannot fill information in step 3- Study information
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 3 (Study information)
    ...     2. There is a test facility
    ...
    ...     Test Steps:
    ...     1. On the facility dropdown list, click on the dropdown
    ...     2. Check the Functional test checkbox
    ...     3. On Device section, select Biocore/Biotres button and select a Device ID on dropdown list
    ...     4. Select a physician on the Referring physician dropdown list
    ...     5. Select a physician on the Interpreting physician dropdown list
    ...     6. Select a MCT Peek/Holter/Extended Holter event type on the Study type dropdown list
    ...     7. Enter valid value on the Study duration field
    ...     8. Select a valid date on the Patient return visit datepicker
    ...     9. Enter valid value on the Clinic Initials field
    ...     10. Click the Previous button
    ...     11. Click the Next button
    ...
    ...     Expected Results:
    ...     1. At step 1, There shall be a drop-down list of facilities in case the user has more than one assigned
    ...     facility. Otherwise, the Facility Name attribute shall be hidden
    ...     - In case the user selects a facility having a financial hold of 90 days, a pop-up alert message shall
    ...     be displayed to the user. The [Next] button of the Study Information page shall be disabled
    ...     - In the case the user selects a test facility, a checkbox named “Functional test” shall be displayed
    ...     2. At step 2, the checkbox is checked
    ...     3. At step 3, the selected device ID shall be displayed
    ...     4. At step 4,5,6,7,8,9 the selected/entered data shall be displayed
    ...     5. At step 10, the user will navigate back to step 2 (Patient contact)
    ...     6. At step 11, a modal with the following error message shall be displayed: "You can only create an MCT
    ...     or Cardiac study. Please select another study type.", and he or she cannot go to the next step
    ...     7. Click the Okay button on the modal will dismiss the modal
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-TEST-STEP3-03     manual    CP-2.13.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-TEST-STEP3-04: Fill information in step 3 - with Biocore/Biotres device
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician can fill information in step 3 with Biocore/Biotres device have a FW version has been
    ...     updated to the latest
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 3 (Study information)
    ...     2. There is a test facility
    ...
    ...     Test Steps:
    ...     1. On the facility dropdown list, click and select a facility has test status on the dropdown
    ...     2. On Device section, select Biocore/Biotres button and select a Device ID on dropdown list
    ...     3. Select a physician on the Referring physician dropdown list
    ...     4. Select a physician on the Interpreting physician dropdown list
    ...     5. Select a MCT/MCT PEEK/CARDIAC EVENT/HOLTER/EXTENDED HOLTER/HOLTER AND FOLLOW ON STUDY type on the
    ...     Study type dropdown list
    ...     6. Enter valid value on the Study duration field
    ...     7. Select a valid date on the Patient return visit datepicker
    ...     8. Enter valid value on the Clinic Initials field
    ...     9. Click the Previous button
    ...     10. Click the Next button
    ...
    ...     Expected Results:
    ...     1. At step 1, There shall be a drop-down list of facilities in case the user has more than one assigned
    ...     facility. Otherwise, the Facility Name attribute shall be hidden
    ...     - In case the user selects a facility having a financial hold of 90 days, a pop-up alert message shall
    ...     be displayed to the user. The [Next] button of the Study Information page shall be disabled
    ...     - In the case the user selects a test facility, a checkbox named “Functional test” shall be displayed
    ...     2. At step 2, the selected device ID shall be displayed
    ...     3. At step 3,4,5,6,7,8 the selected/entered data shall be displayed
    ...     4. At step 9, the user will navigate back to step 2 (Patient contact)
    ...     5. At step 10, the user should be navigated to step 4 (Diagnosis)
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-TEST-STEP3-04     manual    CP-2.13.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-TEST-STEP3-05: Fill information in step 3 - with Bioflux device
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician can fill information in step 3- Study information
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 3 (Study information)
    ...     2. There is a test facility
    ...
    ...     Test Steps:
    ...     1. On the facility dropdown list, click and select a facility has test status on the dropdown
    ...     2. On Device section, select Bioflux button and select a Device ID on dropdown list
    ...     3. Select a physician on the Referring physician dropdown list
    ...     4. Select a physician on the Interpreting physician dropdown list
    ...     5. Select a MCT/MCT PEEK/CARDIAC EVENT/HOLTER/EXTENDED HOLTER/HOLTER AND FOLLOW ON STUDY type on the
    ...     Study type dropdown list
    ...     6. Enter valid value on the Study duration field
    ...     7. Select a valid date on the Patient return visit datepicker
    ...     8. Enter valid value on the Clinic Initials field
    ...     9. Click the Previous button
    ...     10. Click the Next button
    ...
    ...     Expected Results:
    ...     1. At step 1, There shall be a drop-down list of facilities in case the user has more than one assigned
    ...     facility. Otherwise, the Facility Name attribute shall be hidden
    ...     - In case the user selects a facility having a financial hold of 90 days, a pop-up alert message shall
    ...     be displayed to the user. The [Next] button of the Study Information page shall be disabled
    ...     - In the case the user selects a test facility, a checkbox named “Functional test” shall be displayed
    ...     2. At step 2, the selected device ID shall be displayed
    ...     3. At step 3,4,5,6,7,8 the selected/entered data shall be displayed
    ...     4. At step 11, the user will navigate back to step 2 (Patient contact)
    ...     5. At step 12, the user should be navigated to step 4 (Diagnosis)
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-TEST-STEP3-05     manual    CP-2.13.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-TEST-STEP4-01: Fill information in step 4-Diagnosis
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician can fill information in step 4-Diagnosis
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 4 (Diagnosis)
    ...     2. The user has selected HOLTER/EXTENDED HOLTER on the Study type dropdown list at step 3 if Biocore/Biotres device
    ...     3. The user has selected all study types from dropdown list at step 3 if Bioflux device
    ...
    ...     Test Steps:
    ...     1. On Primary diagnosis code dropdown list, select a specific code
    ...     2. On the Secondary diagnosis code (optional) dropdown list, select a specific code
    ...     3. On the Patient medication (optional) text input, enter valid content
    ...     4. On the Physician amendments notes (optional) text input, enter valid content
    ...     5. On the Insurance type dropdown list, select a specific insurance
    ...     6. On the Provider (optional) text input, enter valid provider
    ...     7. On the Pre-authorization required, select the Yes or No toggle button
    ...     8. On the Symptoms the patient experienced dropdown list, select a specific symptoms
    ...     9. On the How many times did the symptoms happen? dropdown list, select a sepcific option
    ...     10. Select the Yes/No button on Had a heart monitor before? section
    ...     11. Click the Previous button
    ...     12. Click the Initiate button
    ...
    ...     Expected Results:
    ...     1. At step 1,2,3,4,5,6,7,8,9 the selected/entered data shall be displayed
    ...     2. At step 11, the user will navigate back to step 3 (Study information)
    ...     3. At step 12, clicking the Initiate button will initiate a new study on the device
    ...     4. After the study was initiated:
    ...     - The Biolfux/Biocore/Biotres device assigned to this study will display the study setup screen with the patient’s name,
    ...     patient ID, and study duration information inputted from the above steps
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-TEST-STEP4-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-TEST-STEP4-02-CP2.16.2: Fill information in step 4-Diagnosis
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician can fill information in step 4-Diagnosis
    ...
    ...     Precondition:
    ...     1. The Clinic technician user is on Create new study screen – step 4 (Diagnosis)
    ...     2. The user selected a MCT/MCT Peek/CARDIAC EVENT/HOLTER AND FOLLOW ON STUDY on the Study type dropdown list
    ...     at step 3
    ...
    ...     Test Steps:
    ...     1. On Primary diagnosis code dropdown list, select a specific code
    ...     2. On the Secondary diagnosis code (optional) dropdown list, select a specific code
    ...     3. On the Patient medication (optional) text input, enter valid content
    ...     4. On the Physician amendments notes (optional) text input, enter valid content
    ...     5. On the Insurance type dropdown list, select a specific insurance
    ...     6. On the Provider (optional) text input, enter valid provider
    ...     7. On the Pre-authorization required, select the Yes or No toggle button
    ...     8. On the Symptoms the patient experienced dropdown list, select a specific symptoms
    ...     9. On the How many times did the symptoms happen? dropdown list, select a sepcific option
    ...     10. Select the Yes/No button on Had a heart monitor before? section
    ...     11. Click the Previous button
    ...     12. Click the Initiate button
    ...
    ...     Expected Results:
    ...     1. At step 1,2,3,4,5,6,7,8,9 the selected/entered data shall be displayed
    ...     2. At step 11, the user will navigate back to step 3 (Study information)
    ...     3. At step 12, clicking the Initiate button will display a "Disclaimer" pop-up saying:
    ...     - Content: "For MCT and Event studies, the patient must be instructed of the importance of maintaining a Biocore/Biotres
    ...     to Biocare Health app connection.  Please ensure the reference code is entered on the mobile device to
    ...     connect their Biocore/Biotres device to the Biocare Health app and maintain the connection during the study. Please
    ...     note that study response times may be affected if the connection is not ensured."
    ...     - Button: Cancel and Agree. Clicking the Cancel button shall dismiss the pop-up and the user is kept staying
    ...     at the current step. Click the Agree button shall initiate the study
    ...     4. After the study was initiated:
    ...     - The Biocore/Biotres device assigned to this study will display the study setup screen with the patient’s name,
    ...     patient ID, and study duration information inputted from the above steps
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-TEST-STEP4-02-CP2.16.2     manual       CP-2.14.0      CP-2.16.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-TEST-STEP5-01: View information in step 5-Verify ECG signal
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician can view information in step 5-Verify ECG signal
    ...
    ...     Precondition:
    ...     1. The Clinic Technician user is on Create new study screen – step 4 (Verify ECG signal)
    ...
    ...     Test Steps:
    ...     1. Observe the screen
    ...
    ...     Expected Results:
    ...     - The portal shall display a screen for instructing the user to verify the ECG signal before starting the study
    ...     - The message indicates the email and/or SMS dispatch will be displayed, the content will be different for
    ...     patients located in and outside the US
    ...     - There shall be a Done button. When the button is pressed, the user will be redirected to the STUDIES page,
    ...     the study shall appear on the active studies list
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-TEST-STEP5-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-TEST-STEP5-01-CP2.16.8: Check "Create Return Shipping Label" function for Active facility
    [Documentation]   Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Click "Create Return Shipping Label" button
    ...
    ...     Expected Results:
    ...     - Redirect the user to the Create Shipment Label page of the Study details page, Return Status tab
    ...
    ...     **Others**
    ...     Update Date: 11/17/2023 - Nhan Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-TEST-STEP5-01-CP2.16.8     manual      CP-2.16.8
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-TEST-01: Automatically stop study of Functional test study
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The study shall automatically be stopped
    ...
    ...     Precondition:
    ...     1. A functional test study has been created and having a manual baseline event has already sent on the system
    ...
    ...     Test Steps:
    ...     1. Create an AFib event, then wait for uploading on the system
    ...     2. Create a Tachy event, then wait for uploading on the system
    ...     3. Create a Brady event, then wait for uploading on the system
    ...     4. Create a Pause event, then wait for uploading on the system
    ...     5. Create a Manual patient trigger event, then wait for updaloading on the system
    ...     6. Create Lead off state, then wait for uploading on the system
    ...
    ...     Expected Results:
    ...     1. All events should be automatically closed, set to valid
    ...     2. Once the study has at least on event for each event type (AFib, Tachy, Brady, Manual baseline, Manual
    ...     patient trigger, Pause, and Lead off), the study shall automatically be stopped
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-TEST-01     manual  CP-2.13.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-TEST-02: Automatically generate EOU report
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The study shall automatically generate EOU report
    ...
    ...     Precondition:
    ...     1. A functional test study has been created
    ...
    ...     Test Steps:
    ...     1. Create an AFib event, then wait for uploading on the system
    ...     2. Create a Tachy event, then wait for uploading on the system
    ...     3. Create a Brady event, then wait for uploading on the system
    ...     4. Create a Pause event, then wait for uploading on the system
    ...     5. Create a Manual patient trigger event, then wait for updaloading on the system
    ...     6. Create Lead off state, then wait for uploading on the system
    ...     7. Create an Event Manual resumed, then wait for uploading on the system
    ...     8. Create a Event Manual evaluation, then wait for uploading on the system
    ...
    ...     Expected Results:
    ...     1. Event Manual resumed shall be closed as invalid
    ...     2. Event Manual evaluation shall be closed as invalid
    ...     3. Only the first event of each event type shall be included in the report
    ...     4. When the sudy is stopped and uploaded, the EOU report will be automatically generated with all events
    ...     included and the Device ID placed in the technician comments
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-TEST-02     manual  CP-2.13.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-COPY-01: Create a new study from an existing study (MCT/Cardiac/Holter/Extended Holter/MCT Peek
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The clinic technician can fill information in step 1- Patient information
    ...
    ...     Precondition:
    ...     1. The user is on the STUDIES page
    ...     2. Existing a study on the ongoing study list or the completed study list
    ...
    ...     Test Steps:
    ...     1. On each item of the study list, pressed the Copy button
    ...     Expected Results:
    ...     1. If the Financial hold of the facility is “None”, “60 days”, “70 days” or “80 days”: The user shall be able
    ...     to create new studies without any problem
    ...     - At step 1, the user shall be redirected to the [Create new study] page
    ...     - Most of the input fields are prefilled from the data of the copied study. Except for the Device ID,
    ...     the clinician has to manually select a device
    ...     - The prefilled information can be changed if needed
    ...     2.  If the Financial hold of the facility is “90 days”: The user shall not be able to create a new study
    ...     - If the user has one facility: An alert message will be displayed after the user clicks the [Copy] button
    ...     - If the user has more than one facility: An alert message will be displayed after the user clicks Next on
    ...     step 2. The user won’t be able to go to step 4 after that (The Next button is disabled)

    [Tags]  BF-TECH-CP-STUDIES-CREATE-COPY-01        auto
    # Update Financial hold of the facility is “None”
    [Setup]     Api Update Facility Financial Hold     token=${ADMIN_TOKEN}    facility_name=${FACILITIES}[0][name]      date=0
    # Create study
    Navigate To Studies Page
    Filter Studies    study_state=Active
    ${studies}        Get Active Studies
    Copy Active Studies On    row=1
    Create New Study Page 1   is_next=${True}
    Create New Study Page 2   is_next=${True}
    Create New Study Page 3   facility=${FACILITIES}[0][name]   device_type=${DEVICES}[0][model]   device_id=${DEVICES}[0][id]   referring_physician=${PHY_USER}[0][name]   is_next=${True}
    Create New Study Page 4   is_initiate=${True}
    Create New Study Page 5   is_done=${True}
    Navigate To Studies Page
    Filter Studies    study_state=Active      search_by=Device ID       text_search=${DEVICES}[0][id]
    ${studies}        Get Active Studies
    ${study_id}       Set Variable    ${studies}[0][Study]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}      No studies found with text search ${DEVICES}[0][id]
    Run Keyword And Continue On Failure    Should Be Equal        ${studies}[0][Device]     ${DEVICES}[0][id]
    # Get study friendly id
    ${filter}               Create Dictionary     status=Ongoing        deviceId=${DEVICES}[0][id]
    ${filter}               Create Dictionary     filter=${filter}
    ${study_response}       Api Clinic Studies    ${AWS_TOKEN}      ${filter}
    ${study_friendlyid}     Set Variable          ${study_response}[body][data][clinicStudies][0][id]
    # Stop and Delete study
    Stop Active Studies    row=1
    # Update Financial hold of the facility is “90 days”
    Api Update Facility Financial Hold      token=${ADMIN_TOKEN}     facility_name=${FACILITIES}[0][name]    date=90
    Navigate To Studies Page
    Filter Studies    study_state=Active
    ${studies}        Get Active Studies
    ${study_id}       Evaluate     [item['Study'] for item in ${studies} if item.get('Facility') == '${FACILITIES}[0][name]']
    Filter Studies    search_by=Study ID        text_search=${study_id}[0]
    Copy Active Studies On    row=1
    Create New Study Page 1   is_next=${True}
    Create New Study Page 2   is_next=${True}
#    Create New Study Page 3   facility=${FACILITIES}[1][name]     is_next=${False}
    Close Popup Financial 90 Day
    ${values}       Get New Study Values Page 3
    Run Keyword And Continue On Failure    Should Be Equal    ${values}[Next button]        Disabled
    [Teardown]    Run Keywords    Api Update Facility Financial Hold               token=${ADMIN_TOKEN}        facility_name=${FACILITIES}[0][name]      date=0
    ...           AND             Api Delete Studies      ${CLINIC_TOKEN}      studyIds=${study_friendlyid}

BF-TECH-CP-STUDIES-CREATE-01: Bioflux-Create new study with a single study type (MCT/MCT Peek/Cardiac event/Holter/Ext.Holter)
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-01     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-02-CP2.25.3: Bioflux-Create new study with a Holter and FO study
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-02-CP2.25.3     manual   R1    CP-2.25.3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-03-CP2.25.3: Bioflux-Create new study with an Ext.Holter and FO study
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-03-CP2.25.3     manual   R1    CP-2.25.3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-04-CP2.25.3: Biocore (FW>=1.5.0 and enabled Auto event detection)-Create new study with a Holter and FO study
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-04-CP2.25.3     manual   R1    CP-2.25.3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-05-CP2.25.3: Biocore (FW>=1.5.0 and enabled Auto event detection)-Create new study with a Ext.Holter and FO study
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-05-CP2.25.3     manual   R1    CP-2.25.3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-06-CP2.25.3: Biocore Pro-Create new study with an Holter and FO study
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-06-CP2.25.3     manual   R1    CP-2.25.3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-07-CP2.25.3: Biocore Pro-Create new study with an Ext.Holter and FO study
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-07-CP2.25.3     manual   R1    CP-2.25.3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-08-CP2.25.3: Biocore-Create new study with a Holter and FO study using Biodirect service
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-08-CP2.25.3     manual   R1    CP-2.25.3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-09-CP2.25.3: Biocore-Create new study with an Ext.Holter and FO study using Biodirect service
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-09-CP2.25.3     manual   R1    CP-2.25.3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-10-CP2.25.3: Biocore Pro-Create new study with a Holter and FO study using Biodirect service
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-10-CP2.25.3     manual   R1    CP-2.25.3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-11-CP2.25.3: Biocore Pro-Create new study with an Ext.Holter and FO study using Biodirect service
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-11-CP2.25.3     manual   R1    CP-2.25.3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-03: Bioflux-Create new study with a single study type (MCT/MCT Peek/Cardiac event/Holter/Ext.Holter) using Biodirect service
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-03     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-04: Bioflux-Create new study with a Holter and FO study using Biodirect service
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-04     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-05: Biocore/Biotres (No Auto tag + FW <1.5.0)-Can create new study with Holter/Ext.Holter study type
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-05     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-06: Biocore/Biotres (No Auto tag + FW <1.5.0)-Cannot create new study with MCT/MCT Peek/Cardiac Event/HnFO study type
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-06     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-07: Biocore/Biotres (No Auto tag + FW >=1.5.0)-Can create new study with Holter/Ext.Holter study type
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-07     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-08: Biocore/Biotres (No Auto tag + FW >=1.5.0)-Cannot create new study with MCT/MCT Peek/Cardiac Event/HnFO study type
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-08     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-09: Biocore/Biotres (Auto tag + FW <1.5.0)-Can create new study with Holter/Ext.Holter study type
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-09     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-10: Biocore/Biotres (Auto tag + FW <1.5.0)-Cannot create new study with MCT/MCT Peek/Cardiac Event/HnFO study type
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-10     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-11: Biocore/Biotres (Auto tag + FW >=1.5.0)-Can create new study with any study type
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-11     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-12: Biocore/Biotres-Cannot create new study using Biodirect service
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-12     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-13: Bioflux-Copy an existing study to create new study
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-13     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-14: Bioflux-Copy an existing study using Biodirect service to create new study
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-14     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-15: Biocore/Biotres-Copy an existing study to create new study
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-15     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-16: Bioflux-Can create new Test Study with MCT/Cardiac even type
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-16     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-17: Bioflux-Cannot create new Test Study with Holter/Ext.Holter/MCT Peek/HnFO type
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-17     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-18: Biocore/Biotres (FW <1.5.0)-Can create new Test Study with Holter/Ext.Holter type
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-18     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-19: Biocore/Biotres (FW <1.5.0)-Cannot create new Test Study with MCT/MCT Peek/Cardiac event type
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-19     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-20: Biocore/Biotres (FW >=1.5.0)-Can create new Test Study with MCT/Cardiac event type
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-20     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-21: Biocore/Biotres (FW >=1.5.0)-Cannot create new Test Study with MCT Peek/Holter/Ext.Holter/HnFO type
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-21     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-22: Bioflux-Copy an existing Test study to create new study
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-22     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-23: Biocore-Copy an existing Test study to create new study
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-23     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-23-CP2.25.3: Biocore Pro-Copy an existing Test study to create new study
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

    [Tags]  BF-TECH-CP-STUDIES-CREATE-23-CP2.25.3     manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-24: Cannot create a new study if financial hold is 90 days
    [Documentation]     Author: Trinh Nguyen
    ...     Description: User cannot create a new study if financial hold is 90 days
    ...
    ...     Precondition:
    ...     1. The user has one facility
    ...
    ...     Test Steps:
    ...     1. Click the New study button
    ...
    ...     Expected Results:
    ...     1. An alert message will be displayed after clicking the New study button
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-24    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-25: Cannot create a new study if financial hold is 90 days
    [Documentation]     Author: Trinh Nguyen
    ...     Description: User cannot create a new study if financial hold is 90 days
    ...
    ...     Precondition:
    ...     1. The user has more than one facility
    ...     2. The user is on step 2 and has filled all required fields
    ...
    ...     Test Steps:
    ...     1. Click Next button on step 2 screen
    ...     2. Observe the Next button on step 3
    ...
    ...     Expected Results:
    ...     1. An aleart message will be displayed after the user clicks the Next button
    ...     2. The next button on step 3 is disabled, the user cannot go to step 4
    ...
    ...     **Others**
    ...     Update Date: 8/21/2023 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-25    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BF-TECH-CP-STUDIES-CREATE-26: Active Facility-Can create Holter study with duration is in hours unit (from 1h to 72h)
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update Date: 9/25/2024 - Nhan Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-26    manual    CP-2.21.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-27: Active Facility-Can create Holter and FO study with duration is in hours unit (from 1h to 72h) for Holter type
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update Date: 9/25/2024 - Nhan Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-27    manual    CP-2.21.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-28: Test Facility-Can create Holter study with duration is in hours unit (from 1h to 72h)
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update Date: 9/25/2024 - Nhan Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-28    manual    CP-2.21.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-29: Test Facility-Can create Holter and FO study with duration is in hours unit (from 1h to 72h) for Holter type
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update Date: 9/25/2024 - Nhan Nguyen

    [Tags]  BF-TECH-CP-STUDIES-CREATE-29    manual    CP-2.21.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BF-TECH-CP-STUDIES-CREATE-30: Create Biodirect study for Biocore device
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-CREATE-30    manual    CP-2.22.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-31: Create Biodirect study for Biocore Pro device
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-CREATE-31   manual    CP-2.22.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-32: Create Biodirect study for Biocore from Bioheart shop
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-CREATE-32   manual    CP-2.22.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BF-TECH-CP-STUDIES-CREATE-33: Create study for Biocore using FW High sampling rate
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-CREATE-33   manual    CP-2.23.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-CREATE-34: Create study for Biocore Pro using FW High sampling rate
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-CP-STUDIES-CREATE-34   manual    CP-2.23.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}       Start Browser
    Import Library        project_bioflux_clinic_portal/lib/web/Common.py    ${BROWSER_NODE}  ${ENV}
    Import Library        project_bioflux_clinic_portal/lib/web/Studies.py   ${BROWSER_NODE}  ${ENV}
    ${TECH_USER}          CpConfig.Get Config Param       NEW_USER > clinic_technician
    ${PHY_USER}           CpConfig.Get Config Param       NEW_USER > clinic_physician
    ${FACILITIES}         CpConfig.Get Config Param       FACILITY
    ${DEVICES}            CpConfig.Get Config Param       DEVICE > bioflux_device
    ${ADMIN_USER}         AdConfig.Get Config Param       USER > admin_01
    ${AWS_AUTH}           CpConfig.Get Config Param       AWS_AUTH
    ${CLINIC_TOKEN}       Sign In Bioflux       username=${TECH_USER}[0][username]       password=${TECH_USER}[0][password]
    ${VERSION}            Get Release Version
    Set Suite Variable    ${TECH_USER}
    Set Suite Variable    ${PHY_USER}
    Set Suite Variable    ${FACILITIES}
    Set Suite Variable    ${DEVICES}
    Set Suite Metadata    version     ${VERSION}
    Set Suite Metadata    browser     ${BROWSER.capitalize()}
    ${RESPONSE}           Api Login    username=${ADMIN_USER}[username]      password=${ADMIN_USER}[password]
    ${ADMIN_TOKEN}        Set Variable    ${RESPONSE}[body][data][login][token]
    ${RESPONSE}           Api Login   username=${ADMIN_USER}[username]      password=${ADMIN_USER}[password]
    ${AWS_RPS}            Initiate Auth         username=${AWS_AUTH}[users][0][username]        password=${AWS_AUTH}[users][0][password]        client_id=${AWS_AUTH}[client_id]
    Set Suite Variable    ${AWS_TOKEN}          ${AWS_RPS}[AuthenticationResult][AccessToken]
    Set Suite Variable    ${ADMIN_TOKEN}        ${RESPONSE}[body][data][login][token]
    Set Suite Variable    ${CLINIC_TOKEN}

SUITE TEARDOWN
    Quit Browser
