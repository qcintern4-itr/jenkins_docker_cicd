*** Settings ***
Documentation   Test Suite - Clinic Physician Portal - Optimize ECG Viewer
Metadata    sid     BF-PHY-OPTIMIZE-ECG
Metadata    owner   Nhan Nguyen
Library     Collections
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py    ${ENV}    WITH NAME   CpConfig
Library     project_admin_portal/lib/ConfigHandler.py             ${ENV}    WITH NAME   AdConfig
#Library     project_bioflux_clinic_portal/lib/web/Common.py
#Library     project_bioflux_clinic_portal/lib/web/Studies.py
#Library     project_bioflux_clinic_portal/lib/web/StudyDetails.py
#
#Suite Setup         SUITE SETUP
#Suite Teardown      SUITE TEARDOWN
Force Tags      BF-PHY-OPTIMIZE-ECG    web
Test Timeout    1h

*** Test Cases ***
BF-PHY-OPTIMIZE-ECG-01: Inbox page >> Notification Events report - Check View ECG button working properly
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
    ...     Epected Results:
    ...

    [Tags]  BF-PHY-OPTIMIZE-ECG-01       manual        CP-2.16.7
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-OPTIMIZE-ECG-02: Study Management page >> Reports tab >> Notification Event reports - Check View ECG button working properly
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
    ...     Epected Results:
    ...

    [Tags]  BF-PHY-OPTIMIZE-ECG-02       manual        CP-2.16.7
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#SUITE TEARDOWN
#    Quit Browser

