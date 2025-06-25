*** Settings ***
Documentation   Test Suite - Clinic Portal - Patients page
Metadata    sid     BF-PHY-PATIENTS
Metadata    owner   Nhan Nguyen
Library     Collections
Library     DateTime
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_clinic_portal/lib/web/Common.py


Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BF-PHY-PATIENTS      web
Test Timeout    1h

*** Test Cases ***
BF-PHY-PATIENTS-01: View list of App users in the Biotricity Biocare Clinic
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - Login user that has been assigned to facility "Biotricity Biocare Clinic"
    ...
    ...     Test Steps:
    ...     1. Create new patient from Biocare health app, biosphere >> Login to Biocare Health app and View App users list
    ...     2. Disease Management portal: Perform Enroll in CCM/RPM program >> View App users
    ...     3. Disease Management portal: Stop Enroll in CCM/RPM program >> View App users
    ...
    ...     Expected Results:
    ...     1. The patient is displayed on the list
    ...     2. The patient is removed from the list
    ...     3. The patient is displayed on the list
    ...

    [Tags]  BF-PHY-PATIENTS-01       manual       R1    CP-2.20.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-PATIENTS-02: View list of CCM/RPM requested in the Biotricity Biocare Clinic
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - Login user that has been assigned to facility "Biotricity Biocare Clinic"
    ...
    ...     Test Steps:
    ...     1. Create new patient from Biocare health app, biosphere >> Login to Biocare Health app
    ...     2. On Biocare health app, request CCM/RPM >> View list on App users and CCM/RPM requested
    ...
    ...     Expected Results:
    ...     - The patient is displayed on both App users and CCM/RPM requested list
    ...

    [Tags]  BF-PHY-PATIENTS-02       manual       R1    CP-2.20.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-PATIENTS-03: View info displayed on App users list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - Login user that has been assigned to facility "Biotricity Biocare Clinic"
    ...
    ...     Test Steps:
    ...     1. View all info on the App users list
    ...
    ...     Expected Results:
    ...     The following information is displayed:
    ...     - Patient name - Enrollment request tag
    ...     - Email
    ...     - Last online
    ...     - Action "View" when hovering over patient row
    ...

    [Tags]  BF-PHY-PATIENTS-03       manual       R1    CP-2.20.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-PATIENTS-04: View info displayed on CCM/RPM requested list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - Login user that has been assigned to facility "Biotricity Biocare Clinic"
    ...
    ...     Test Steps:
    ...     1. View all info on the CCM/RPM requested list
    ...
    ...     Expected Results:
    ...     The following information is displayed:
    ...     - Patient name - Enrollment request tag
    ...     - Email
    ...     - Last online
    ...     - Action "View" when hovering over patient row
    ...

    [Tags]  BF-PHY-PATIENTS-04       manual       R1    CP-2.20.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-PATIENTS-05: View details of a patient on App users list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - Login user that has been assigned to facility "Biotricity Biocare Clinic"
    ...
    ...     Test Steps:
    ...     1. On App users, hover over patient row and click "View" button
    ...
    ...     Expected Results:
    ...     Navigate the user to the patient details page in the Biocare DM portal
    ...

    [Tags]  BF-PHY-PATIENTS-05       manual       R1    CP-2.20.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-PATIENTS-06: View details of a patient on CCM/RPM requested list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - Login user that has been assigned to facility "Biotricity Biocare Clinic"
    ...
    ...     Test Steps:
    ...     1. On CCM/RPM requested, hover over patient row and click "View" button
    ...
    ...     Expected Results:
    ...     Navigate the user to the patient details page in the Biocare DM portal
    ...

    [Tags]  BF-PHY-PATIENTS-06       manual       R1    CP-2.20.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-PATIENTS-07: Search by Patient name
    [Documentation]     Author: Nhan Nguyen
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

    [Tags]  BF-PHY-PATIENTS-07       manual       R1    CP-2.20.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-PATIENTS-08: Pagination tool working properly
    [Documentation]     Author: Nhan Nguyen
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

    [Tags]  BF-PHY-PATIENTS-08      manual       R1    CP-2.20.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
