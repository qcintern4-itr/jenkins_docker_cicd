*** Settings ***
Documentation   Cardiac Patient Details page > Medical Test Results test suite
Metadata    sid     BCP-NURSE-PTDET-MEDIR
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/PatientDetails.py
#Library     project_cardiac_portal/lib/web/PatientsNew.py
#Library     project_cardiac_portal/lib/web/PatientsActive.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-NURSE-PTDET-MEDIR       web
Test Timeout    1h

*** Test Cases ***
BCP-NURSE-PTDET-MEDIR-01: Add Medical Test Results
    [Documentation]    Author: Khang Nguyen
    ...  Test Steps:
    ...  - Click on Add new test result button from any medical sub-tab
    ...  - Fill out all the required fields with valid value
    ...  - Click on Add test result button
    ...  Expected Output:
    ...  - Add new test result screen is displayed
    ...  - Add test result button is enabled
    ...  - The medical test result information will be saved and displayed
    [Tags]    BCP-NURSE-PTDET-MEDIR-01      manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    ${patient_name}     Create New Account      medicalresuls01
#    Navigate To Patients New
#    Filter Registered Patients    by_status=All statuses    search_by=Patient name     text_search=${patient_name}
#    View Registered Patient Details On    row=1
#    Assign Nurse    me
#    Assign Physician    ${PHY_ACT}[name]
#    Start Health Care Program
#    Navigate To Patients Active
#    Filter Active Patients    by_patient=My patients    search_by=Patient name      text_search=medicalresuls05 auto
#    View Active Patient Details On    row=1
#    Navigate To Patient Details Tab     Medical test results
#    Add Medical Test Results     add_stress_test=True       stress_test_date=today      stress_test_summary=Stress test summary     stress_test_attachment=stress_text.csv     add_blood_count=True     blood_count_date=today     blood_count_summary=Complete blood count summary
#    ...  blood_count_attachment=complblood.csv       add_func_test=True     func_test_date=today    func_test_attachment=func_test.csv      func_test_summary=Liver functest summary      add_blood_sugar=True        blood_sugar_date=today      blood_sugar_attachment=blood_sugar.png
#    ...  blood_sugar_summary=Fasting blood sugar summary     add_lipid_profile=True     lipid_profile_date=today     lipid_profile_attachment=lipid_profile.csv     lipid_profile_summary=Lipid profile summary      add_inr=True      inr_date=today      inr_result=5     inr_attachment=inr.csv
#    ...  inr_summary=inr summary     add_tsh=True       tsh_date=today      tsh_summary=tsh summary     tsh_attachment=tsh.csv      add_creatinine=True     creatinine_date=today       creatinine_summary=creatinine summary       creatinine_attachment=creatinine.csv    add_hba1c=True
#    ...  hba1c_date=today     hba1c_percent=45       hba1c_summary=HbA1c summary     hba1c_attachment=hba1c.csv     add_echocardiogram=True     echocardiogram_date=today       echocardiogram_lvef=99      echocardiogram_summary=echocardiogram summary       echocardiogram_attachment=echocardiogram.csv
#    ...  add_other_test=True     other_test_title=Other Test Title      other_test_date=today    other_test_summary=Other test summary      other_test_attachment=other_test.csv
#    ${results}      Get Patient Details Medical Test Results
#    ${curr_date} =    Get Current Date    result_format=%d/%m/%Y
#    # Verify (Attached files: TDB)
#    Run Keyword And Continue On Failure    Should Contain    ${results}[Stress test]                   ${curr_date}
#    Run Keyword And Continue On Failure    Should Contain    ${results}[Stress test]                   Summary | Stress test summary
#    Run Keyword And Continue On Failure    Should Contain    ${results}[Complete blood count]          ${curr_date}
#    Run Keyword And Continue On Failure    Should Contain    ${results}[Complete blood count]          Summary | Complete blood count summary
#    Run Keyword And Continue On Failure    Should Contain    ${results}[Liver function testing]        ${curr_date}
#    Run Keyword And Continue On Failure    Should Contain    ${results}[Liver function testing]        Summary | Liver functest summary
#    Run Keyword And Continue On Failure    Should Contain    ${results}[Fasting blood sugar]           ${curr_date}
#    Run Keyword And Continue On Failure    Should Contain    ${results}[Fasting blood sugar]           Summary | Fasting blood sugar summary
#    Run Keyword And Continue On Failure    Should Contain    ${results}[Lipid profile]                 ${curr_date}
#    Run Keyword And Continue On Failure    Should Contain    ${results}[Lipid profile]                 Summary | Lipid profile summary
#    Run Keyword And Continue On Failure    Should Contain    ${results}[INR]                           ${curr_date}
#    Run Keyword And Continue On Failure    Should Contain    ${results}[INR]                           Summary | inr summary
#    Run Keyword And Continue On Failure    Should Contain    ${results}[TSH]                           ${curr_date}
#    Run Keyword And Continue On Failure    Should Contain    ${results}[TSH]                           Summary | tsh summary
#    Run Keyword And Continue On Failure    Should Contain    ${results}[Creatinine]                    ${curr_date}
#    Run Keyword And Continue On Failure    Should Contain    ${results}[Creatinine]                    Summary | creatinine summary
#    Run Keyword And Continue On Failure    Should Contain    ${results}[HbA1c]                         ${curr_date}
#    Run Keyword And Continue On Failure    Should Contain    ${results}[HbA1c]                         Summary | HbA1c summary
#    Run Keyword And Continue On Failure    Should Contain    ${results}[HbA1c]                         HbA1c | 45%
#    Run Keyword And Continue On Failure    Should Contain    ${results}[Echocardiogram]                ${curr_date}
#    Run Keyword And Continue On Failure    Should Contain    ${results}[Echocardiogram]                Summary | echocardiogram summary
#    Run Keyword And Continue On Failure    Should Contain    ${results}[Other tests]                   ${curr_date}
#    Run Keyword And Continue On Failure    Should Contain    ${results}[Other tests]                   Test title | Other Test Title
#    Run Keyword And Continue On Failure    Should Contain    ${results}[Other tests]                   Summary | Other test summary

BCP-NURSE-PTDET-MEDIR-02: Collapse patient brief info for patient has linked care plan
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
    [Tags]    BCP-NURSE-PTDET-MEDIR-02     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-PTDET-MEDIR-03: Collapse patient brief info for patient has not linked care plan
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
    [Tags]    BCP-NURSE-PTDET-MEDIR-03     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-PTDET-MEDIR-04: Collapse patient brief info for patient which has missing info
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
    [Tags]    BCP-NURSE-PTDET-MEDIR-04     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-PTDET-MEDIR-05: Collapse patient brief info for patient which has deleted their account
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
    [Tags]    BCP-NURSE-PTDET-MEDIR-05     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-PTDET-MEDIR-06: Collapse patient brief info for patient which has missing info and has deleted their account
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
    [Tags]    BCP-NURSE-PTDET-MEDIR-06     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-PTDET-MEDIR-07: Add the test result with fully info
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the patient details on Active patients page
    ...   2.Select the Test results tab
    ...   3.Click Add test result button
    ...   4.Fill all the information that included on the section (test type/result date/summary)
    ...   5.Click Add test result
    ...   Expected result:
    ...   The test result shall be saved and displayed on the Test results tab successfully.
    [Tags]    BCP-NURSE-PTDET-MEDIR-07     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-PTDET-MEDIR-08: Add the test result with the attachment(s)
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the patient details on Active patients page
    ...   2.Select the Test results tab
    ...   3.Click Add test result button
    ...   4.Fill all the information that included on the section
    ...   5.Add an attachment to the test
    ...   6.Click Add test result
    ...   Expected result:
    ...   The test result with an attached file shall be saved and displayed on the Test results tab successfully.
    [Tags]    BCP-NURSE-PTDET-MEDIR-08     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-PTDET-MEDIR-09: Add the test result with the analyte value
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the patient details on Active patients page
    ...   2.Select the Test results tab
    ...   3.Click Add test result button
    ...   4.Fill all the information that included on the section
    ...   5.Add an analyte value for the test (analyte/value/unit/abnormal flag/note)
    ...   6.Click Add button on an analyte
    ...   7.Click Add test result button
    ...   Expected result:
    ...   The test result with an analyte value shall be saved and displayed on the Test results tab successfully.
    [Tags]    BCP-NURSE-PTDET-MEDIR-09     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-PTDET-MEDIR-10: Edit test type of the test result
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the patient details page of an Active patient
    ...   2.Select a test result to edit
    ...   3.Edit the test type info
    ...   4.Click Save button
    ...   Expected result:
    ...   The test type of the test result shall be updated successfully.
    [Tags]    BCP-NURSE-PTDET-MEDIR-10     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-PTDET-MEDIR-11: Edit summary of the test result
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the patient details page of an Active patient
    ...   2.Select a test result to edit
    ...   3.Edit the summary info
    ...   4.Click Save button
    ...   Expected result:
    ...   The summary of the test result shall be updated successfully.
    [Tags]    BCP-NURSE-PTDET-MEDIR-11     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-PTDET-MEDIR-12: Edit attachment of the test result
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the patient details page of an Active patient
    ...   2.Select a test result to edit
    ...   3.Remove or upload another attachment
    ...   4.Click Save button
    ...   Expected result:
    ...   The attachment of the test result shall be updated successfully.
    [Tags]    BCP-NURSE-PTDET-MEDIR-12     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-PTDET-MEDIR-13: Edit analyte of the test result
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the patient details page of an Active patient
    ...   2.Select a test result to edit
    ...   3.Edit the analyte info
    ...   4.Click Save button
    ...   Expected result:
    ...   The analyte info of the test result shall be updated successfully.
    [Tags]    BCP-NURSE-PTDET-MEDIR-13     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-PTDET-MEDIR-14: Delete analyte of the test result
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   1.Go to the patient details page of an Active patient
    ...   2.Select a test result to edit
    ...   3.Delete the analyte info
    ...   4.Click Save button
    ...   Expected result:
    ...   The analyte info of the test result shall be removed successfully.
    [Tags]    BCP-NURSE-PTDET-MEDIR-14     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

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

Create New Account
    [Arguments]    ${fname}
    Navigate To Patients New
    Open Add New Patient
    ${fname}    Set Variable    ${fname}
    ${patient_name}     Set Variable    ${fname} auto
    ${email}    Set Variable    ${patient_name.replace(' ', '_')}@yopmail.com
    Add New Patient By Manual Input     clinic_info=Bioflux Facility     template=No template    email=${email}      first_name=${fname}      last_name=auto      dob=today     gender=Male     phone_number=0342427242
    ...  country=United States      address=America Dream America Dream Way, East Rutherford, NJ, USA      city=East Rutherford     state=New Jersey       zip_code=07073      height=10ft, 2in    weight=90lb
    ...  payment_type=Cash/Credit card paying
    [Return]    ${patient_name}

