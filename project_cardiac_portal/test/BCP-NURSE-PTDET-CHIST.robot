*** Settings ***
Documentation   Cardiac Patient Details page > Change History test suite
Metadata    sid     BCP-NURSE-PTDET-CHIST
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     DateTime
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/PatientDetails.py
#Library     project_cardiac_portal/lib/web/PatientsNew.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-NURSE-PTDET-CHIST       web
Test Timeout    1h

*** Test Cases ***
BCP-NURSE-PTDET-CHIST-01: Change History  # TBD
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Check the change log if user did any actions
    ...  Expected Output:
    ...  - The actions will be logged according to user's actions
    [Tags]    BCP-NURSE-PTDET-CHIST-01   manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
    # Create patient
#    Navigate To Patients New
#    Open Add New Patient
#    ${fname}    Set Variable    patient_test_018
#    ${email}    Catenate    ${fname}     @hotmail.com
#    ${patient_name}     Catenate     ${fname}    test
#    Add New Patient By Manual Input     clinic_info=Bioflux Facility     template=No template    email=${email.replace(' ', '')}      first_name=${fname}      last_name=test      dob=today     gender=Male     phone_number=0342427242
#    ...  country=United States      address=America Dream America Dream Way, East Rutherford, NJ, USA      city=East Rutherford     state=New Jersey       zip_code=07073      height=10ft, 2in    weight=90lb
#    ...  payment_type=Cash/Credit card paying
#    Navigate To Patients New
#    Filter Registered Patients    search_by=Patient name     text_search=${patient_name}
#    View Registered Patient Details On    row=1
#    # Update info
#    Open Edit Patient Information
#    ${insurance}      Create Dictionary    insurance_name=Insurance name test       provincial_billing=Provincial billing test      expiration_date=today
#    Edit Patient Information    email=email_updated@yopmail.com     first_name=e${fname}   last_name=edit    gender=Female     dob=today     phone_number=0342555555       country=Canada      address=Airport Calgary, AB, Canada
#    ...  payment_type=Insurance     insurance_details=${insurance}
#    Navigate To Patient Details Tab     Change history
#    ${histories}      Get Patient Details Change History
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${histories}      No Change Histories found
#    Run Keyword And Continue On Failure    Should Contain      ${histories}[0]      Demographic information updated
#    Run Keyword And Continue On Failure    Should Contain      ${histories}[0]      Email, First name, Last name, Gender, Phone number, Country, Address, Insurance
#    # Add caregiver
#    Assign Nurse    ${CURR_USER}[name]
#    Assign Physician    ${PHY_ACT}[name]
#    Navigate To Patient Details Tab     Change history
#    ${histories}      Get Patient Details Change History
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${histories}      No Change Histories found
#    Run Keyword And Continue On Failure    Should Contain      ${histories}[0]      Caregiver added
#    Run Keyword And Continue On Failure    Should Contain      ${histories}[0]      ${PHY_ACT}[name] is assigned as a physician.
#    Run Keyword And Continue On Failure    Should Contain      ${histories}[1]      Caregiver added
#    Run Keyword And Continue On Failure    Should Contain      ${histories}[1]      ${CURR_USER}[name] is assigned as a nurse.

BCP-NURSE-PTDET-CHIST-02: Collapse patient brief info for patient has linked care plan
    [Documentation]    Author: Xuan Trinh
    ...
    ...  1. Scroll down the page
    ...  2. Click on ... box
    ...  3. Scroll up the page
    ...  Expected Output:
    ...  - The collapsed header includes the following information: Profile picture, First name and last name, Plan type tag, Care plan ID, Date of birth & Age, Gender, Notes
    ...  - In step 2,
    ...   + For CCM or CCM&RPM plan type, it will display 3 fields: Switch to RPM, Schedule new appointment, Stop care plan.
    ...   + For RPM plan type, it will display 3 fields: Switch to CCM, Schedule new appointment, Stop care plan.
    ...  - In step 3, the brief info header will be expanded
    [Tags]    BCP-NURSE-PTDET-CHIST-02   manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-CHIST-03: Collapse patient brief info for patient has not linked care plan
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
    [Tags]    BCP-NURSE-PTDET-CHIST-03   manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-CHIST-04: Collapse patient brief info for patient which has missing info
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
    [Tags]    BCP-NURSE-PTDET-CHIST-04   manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-CHIST-05: Collapse patient brief info for patient which has deleted their account
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
    [Tags]    BCP-NURSE-PTDET-CHIST-05   manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-CHIST-06: Collapse patient brief info for patient which has missing info and has deleted their account
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
    [Tags]    BCP-NURSE-PTDET-CHIST-06   manual
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
    Quit Browser

