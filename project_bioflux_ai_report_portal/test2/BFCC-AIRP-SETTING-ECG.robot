*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-SETTING-ECG
Metadata    owner   Thang Tran
Library     corelib/AssertionExtension.py
Library     Collections
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_ai_report_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_ai_report_portal/lib/web/Reports.py
Library     project_bioflux_ai_report_portal/lib/web/Common.py
Library     project_bioflux_ai_report_portal/lib/web/Studies.py
Library     project_bioflux_ai_report_portal/lib/web/VMorphologies.py
Library     project_bioflux_ai_report_portal/lib/web/StripsManagement.py
Library     project_bioflux_ai_report_portal/lib/web/EcgEvent.py

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BFCC-AIRP-SETTING-ECG   web
Test Timeout    15m

*** Test Cases ***

BFCC-AIRP-SETTING-ECG-SPEED-01: Verify that ECG Viewer retains the speed setting of 2.5 mm/s and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the speed setting of 2.5 mm/s and synchronizes it across all tabs
    ...
    ...     Precondition: User is on AIRP portal
    ...
    ...     Test Steps:
    ...     1. Navigate to Beats tab
    ...     2. Switch to Artifact areas sub tab
    ...     3. Choose the a card with valid day
    ...     4. Change Speed toolbar on ECG Viewer with value set to 2.5 mm/s
    ...     5. Navigate to another sub tabs on Beats tab, V Morphologies tab, HR Summary tab, ECG Events tab, ECG Disclosure sub tab
    ...     6. View setting on ECG Viewer on all tabs
    ...
    ...     Expected Results:
    ...     1. ECG Viewer retains the speed setting of 2.5 mm/s and synchronizes it across: Beats tab, V Morphologies tab, HR Summary tab, ECG Events tab, ECG Disclosure sub tab
    ...
    ...     **Others**
    ...     Update date: 05/23/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-SPEED-01       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-SPEED-02: Verify that ECG Viewer retains the speed setting of 10 mm/s and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the speed setting of 10 mm/s and synchronizes it across all tabs
    ...
    ...     Precondition: User is on AIRP portal
    ...
    ...     Test Steps:
    ...     1. Navigate to Beats tab
    ...     2. Switch to Artifact areas sub tab
    ...     3. Choose the a card with valid day
    ...     4. Change Speed toolbar on ECG Viewer with value set to 10 mm/s
    ...     5. Navigate to another sub tabs on Beats tab, V Morphologies tab, HR Summary tab, ECG Events tab, ECG Disclosure sub tab
    ...     6. View setting on ECG Viewer on all tabs
    ...
    ...     Expected Results:
    ...     1. ECG Viewer retains the speed setting of 10 mm/s and synchronizes it across: Beats tab, V Morphologies tab, HR Summary tab, ECG Events tab, ECG Disclosure sub tab
    ...
    ...     **Others**
    ...     Update date: 05/23/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-SPEED-02       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-SPEED-03: Verify that ECG Viewer retains the speed setting of 25 mm/s and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the speed setting of 25 mm/s and synchronizes it across all tabs
    ...
    ...     Precondition: User is on AIRP portal
    ...
    ...     Test Steps:
    ...     1. Navigate to Beats tab
    ...     2. Switch to Artifact areas sub tab
    ...     3. Choose the a card with valid day
    ...     4. Change Speed toolbar on ECG Viewer with value set to 25 mm/s
    ...     5. Navigate to another sub tabs on Beats tab, V Morphologies tab, HR Summary tab, ECG Events tab, ECG Disclosure sub tab
    ...     6. View setting on ECG Viewer on all tabs
    ...
    ...     Expected Results:
    ...     1. ECG Viewer retains the speed setting of 25 mm/s and synchronizes it across: Beats tab, V Morphologies tab, HR Summary tab, ECG Events tab, ECG Disclosure sub tab
    ...
    ...     **Others**
    ...     Update date: 05/23/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-SPEED-03       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-SPEED-04: Verify that ECG Viewer retains the speed setting of 50 mm/s and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the speed setting of 50 mm/s and synchronizes it across all tabs
    ...
    ...     Precondition: User is on AIRP portal
    ...
    ...     Test Steps:
    ...     1. Navigate to Beats tab
    ...     2. Switch to Artifact areas sub tab
    ...     3. Choose the a card with valid day
    ...     4. Change Speed toolbar on ECG Viewer with value set to 50 mm/s
    ...     5. Navigate to another sub tabs on Beats tab, V Morphologies tab, HR Summary tab, ECG Events tab, ECG Disclosure sub tab
    ...     6. View setting on ECG Viewer on all tabs
    ...
    ...     Expected Results:
    ...     1. ECG Viewer retains the speed setting of 50 mm/s and synchronizes it across: Beats tab, V Morphologies tab, HR Summary tab, ECG Events tab, ECG Disclosure sub tab
    ...
    ...     **Others**
    ...     Update date: 05/23/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-SPEED-04       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-SPEED-05: Verify that ECG Viewer retains the speed setting of 75 mm/s and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the speed setting of 75 mm/s and synchronizes it across all tabs
    ...
    ...     Precondition: User is on AIRP portal
    ...
    ...     Test Steps:
    ...     1. Navigate to Beats tab
    ...     2. Switch to Artifact areas sub tab
    ...     3. Choose the a card with valid day
    ...     4. Change Speed toolbar on ECG Viewer with value set to 75 mm/s
    ...     5. Navigate to another sub tabs on Beats tab, V Morphologies tab, HR Summary tab, ECG Events tab, ECG Disclosure sub tab
    ...     6. View setting on ECG Viewer on all tabs
    ...
    ...     Expected Results:
    ...     1. ECG Viewer retains the speed setting of 75 mm/s and synchronizes it across: Beats tab, V Morphologies tab, HR Summary tab, ECG Events tab, ECG Disclosure sub tab
    ...
    ...     **Others**
    ...     Update date: 05/23/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-SPEED-05       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-SPEED-06: Verify that ECG Viewer retains the speed setting of 100 mm/s and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the speed setting of 100 mm/s and synchronizes it across all tabs
    ...
    ...     Precondition: User is on AIRP portal
    ...
    ...     Test Steps:
    ...     1. Navigate to Beats tab
    ...     2. Switch to Artifact areas sub tab
    ...     3. Choose the a card with valid day
    ...     4. Change Speed toolbar on ECG Viewer with value set to 100 mm/s
    ...     5. Navigate to another sub tabs on Beats tab, V Morphologies tab, HR Summary tab, ECG Events tab, ECG Disclosure sub tab
    ...     6. View setting on ECG Viewer on all tabs
    ...
    ...     Expected Results:
    ...     1. ECG Viewer retains the speed setting of 100 mm/s and synchronizes it across: Beats tab, V Morphologies tab, HR Summary tab, ECG Events tab, ECG Disclosure sub tab
    ...
    ...     **Others**
    ...     Update date: 05/23/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-SPEED-06       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-SPEED-07: Verify that ECG Viewer retains the speed setting of 200 mm/s and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the speed setting of 200 mm/s and synchronizes it across all tabs
    ...
    ...     Precondition: User is on AIRP portal
    ...
    ...     Test Steps:
    ...     1. Navigate to Beats tab
    ...     2. Switch to Artifact areas sub tab
    ...     3. Choose the a card with valid day
    ...     4. Change Speed toolbar on ECG Viewer with value set to 200 mm/s
    ...     5. Navigate to another sub tabs on Beats tab, V Morphologies tab, HR Summary tab, ECG Events tab, ECG Disclosure sub tab
    ...     6. View setting on ECG Viewer on all tabs
    ...
    ...     Expected Results:
    ...     1. ECG Viewer retains the speed setting of 200 mm/s and synchronizes it across: Beats tab, V Morphologies tab, HR Summary tab, ECG Events tab, ECG Disclosure sub tab
    ...
    ...     **Others**
    ...     Update date: 05/23/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-SPEED-07       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-SPEED-08: Verify that ECG Viewer retains the speed setting of 500 mm/s and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the speed setting of 500 mm/s and synchronizes it across all tabs
    ...
    ...     Precondition: User is on AIRP portal
    ...
    ...     Test Steps:
    ...     1. Navigate to Beats tab
    ...     2. Switch to Artifact areas sub tab
    ...     3. Choose the a card with valid day
    ...     4. Change Speed toolbar on ECG Viewer with value set to 500 mm/s
    ...     5. Navigate to another sub tabs on Beats tab, V Morphologies tab, HR Summary tab, ECG Events tab, ECG Disclosure sub tab
    ...     6. View setting on ECG Viewer on all tabs
    ...
    ...     Expected Results:
    ...     1. ECG Viewer retains the speed setting of 500 mm/s and synchronizes it across: Beats tab, V Morphologies tab, HR Summary tab, ECG Events tab, ECG Disclosure sub tab
    ...
    ...     **Others**
    ...     Update date: 05/23/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-SPEED-08       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-GAIN-01: Verify that ECG Viewer retains the gain setting of 1 mm/mV and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the gain setting of 1 mm/mV and synchronizes it across all tabs
    ...
    ...     Precondition: User is on AIRP portal
    ...
    ...     Test Steps:
    ...     1. Navigate to Beats tab
    ...     2. Switch to Artifact areas sub tab
    ...     3. Choose the a card with valid day
    ...     4. Change Gain toolbar on ECG Viewer with value set to 1 mm/mV
    ...     5. Navigate to another sub tabs on Beats tab, V Morphologies tab, HR Summary tab, ECG Events tab, ECG Disclosure sub tab
    ...     6. View setting on ECG Viewer on all tabs
    ...
    ...     Expected Results:
    ...     1. ECG Viewer retains the gain setting of 1 mm/mV and synchronizes it across: Beats tab, V Morphologies tab, HR Summary tab, ECG Events tab, ECG Disclosure sub tab
    ...
    ...     **Others**
    ...     Update date: 05/23/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-GAIN-01       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-GAIN-02: Verify that ECG Viewer retains the gain setting of 2 mm/mV and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the gain setting of 2 mm/mV and synchronizes it across all tabs
    ...
    ...     Precondition: User is on AIRP portal
    ...
    ...     Test Steps:
    ...     1. Navigate to Beats tab
    ...     2. Switch to Artifact areas sub tab
    ...     3. Choose the a card with valid day
    ...     4. Change Gain toolbar on ECG Viewer with value set to 2 mm/mV
    ...     5. Navigate to another sub tabs on Beats tab, V Morphologies tab, HR Summary tab, ECG Events tab, ECG Disclosure sub tab
    ...     6. View setting on ECG Viewer on all tabs
    ...
    ...     Expected Results:
    ...     1. ECG Viewer retains the gain setting of 2 mm/mV and synchronizes it across: Beats tab, V Morphologies tab, HR Summary tab, ECG Events tab, ECG Disclosure sub tab
    ...
    ...     **Others**
    ...     Update date: 05/23/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-GAIN-02       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-GAIN-03: Verify that ECG Viewer retains the gain setting of 5 mm/mV and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the gain setting of 5 mm/mV and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/23/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-GAIN-03       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-GAIN-04: Verify that ECG Viewer retains the gain setting of 7.5 mm/mV and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the gain setting of 7.5 mm/mV and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-GAIN-04       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-GAIN-05: Verify that ECG Viewer retains the gain setting of 10 mm/mV and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the gain setting of 10 mm/mV and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-GAIN-05       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-GAIN-06: Verify that ECG Viewer retains the gain setting of 20 mm/mV and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the gain setting of 20 mm/mV and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-GAIN-06       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-GAIN-07: Verify that ECG Viewer retains the gain setting of 50 mm/mV and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the gain setting of 50 mm/mV and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-GAIN-07       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-GAIN-08: Verify that ECG Viewer retains the gain setting of 100 mm/mV and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the gain setting of 100 mm/mV and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-GAIN-08       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-GAIN-09: Verify that ECG Viewer retains the gain setting of 200 mm/mV and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the gain setting of 200 mm/mV and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-GAIN-09       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-HP-01: Verify that ECG Viewer retains the high pass filter setting of No and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the high pass filter setting of No and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-HP-01       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-HP-02: Verify that ECG Viewer retains the high pass filter setting of 0.05 Hz and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the high pass filter setting of 0.05 Hz and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-HP-02       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-HP-03: Verify that ECG Viewer retains the high pass filter setting of 0.5 Hz and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the high pass filter setting of 0.5 Hz and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-HP-03       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-HP-04: Verify that ECG Viewer retains the high pass filter setting of 1 Hz and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the high pass filter setting of 1 Hz and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-HP-04       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-HP-05: Verify that ECG Viewer retains the high pass filter setting of 2 Hz and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the high pass filter setting of 2 Hz and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-HP-05       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-LP-01: Verify that ECG Viewer retains the low pass filter setting of No and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the low pass filter setting of No and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-LP-01       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-LP-02: Verify that ECG Viewer retains the low pass filter setting of 15 Hz and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the low pass filter setting of 15 Hz and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-LP-02       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-LP-03: Verify that ECG Viewer retains the low pass filter setting of 30 Hz and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the low pass filter setting of 30 Hz and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-LP-03       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-LP-04: Verify that ECG Viewer retains the low pass filter setting of 40 Hz and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the low pass filter setting of 40 Hz and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-LP-04       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-LP-05: Verify that ECG Viewer retains the low pass filter setting of 50 Hz (Notch) and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the low pass filter setting of 50 Hz (Notch) and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-LP-05       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-LP-06: Verify that ECG Viewer retains the low pass filter setting of 60 Hz (Notch) and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the low pass filter setting of 60 Hz (Notch) and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-LP-06       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-LP-07: Verify that ECG Viewer retains the low pass filter setting of 100 Hz and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the low pass filter setting of 100 Hz and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-LP-07       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-CHANNEL-01: Verify that ECG Viewer retains the hidden only CH1 channel setting and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the hidden only CH1 channel setting and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-CHANNEL-01       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-CHANNEL-02: Verify that ECG Viewer retains the hidden only CH2 channel setting and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the hidden only CH2 channel setting and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-CHANNEL-02       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-CHANNEL-03: Verify that ECG Viewer retains the hidden only CH3 channel setting and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the hidden only CH3 channel setting and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-CHANNEL-03       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-CHANNEL-04: Verify that ECG Viewer retains the hidden CH1 & CH2 channel setting and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the hidden CH1 & CH2 channel setting and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-CHANNEL-04       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-CHANNEL-05: Verify that ECG Viewer retains the hidden CH1 & CH3 channel setting and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the hidden CH1 & CH3 channel setting and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-CHANNEL-05       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-CHANNEL-06: Verify that ECG Viewer retains the hidden CH2 & CH3 channel setting and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains the hidden CH2 & CH3 channel setting and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-CHANNEL-06       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-ZOOM-01: Verify that ECG Viewer retains zoom in setting and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains zoom in setting and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-ZOOM-01       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-ZOOM-02: Verify that ECG Viewer retains zoom out setting and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains zoom out setting and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-ZOOM-02       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-SETTING-ECG-VIEW-ALL-01: Verify that ECG Viewer retains view all setting and synchronizes it across all tabs
    [Documentation]     Author: Hang Le
    ...
    ...     Description: Ensure that ECG Viewer retains view all setting and synchronizes it across all tabs
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/29/2025 - Hang Le

    [Tags]      BFCC-AIRP-SETTING-ECG-VIEW-ALL-01       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_ai_report_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Reports.py      ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Studies.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/VMorphologies.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/StripsManagement.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/EcgEvent.py            ${BROWSER_NODE}     ${ENV}
    ${USERS}                Get Config Param    NEW_USERS
    ${STUDY_ID}             Get Config Param    STUDY_ID
    ${CURRENT_USER}         Set Variable        ${USERS}[callcenter_airp]
    ${STUDY_ID_COMPLETED}      Set Variable        ${STUDY_ID}[study_id_completed]
    Navigate To Callcenter Sign In Page
    ${TOKEN}                Sign In Callcenter  ${CURRENT_USER}[username]      ${CURRENT_USER}[password]
    Set Suite Variable      ${TOKEN}
    Set Global Variable     ${STUDY_ID_COMPLETED}
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies      search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_strips_management_2]
    ${reports}      Get Completed Studies On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Manage Complete Study On              row=1
    Navigate To Studies Type        Reports
    View Completed New Report Status On          row=1
    Switch Tab
    ${RELEASE_VERSION}      Get Release Version Aireport
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Stop Processing
    Quit Browser

Navigate to aireport
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies      search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_strips_management_2]
    ${reports}      Get Completed Studies On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Manage Complete Study On              row=1
    Navigate To Studies Type        Reports
    View Completed New Report Status On          row=1
    Switch Tab

Stop Processing
    Stop Ai Processing
    ${msg}      Get Message Stop Successful
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}    Stop AI processing success

Change beats to "${beat_name}" beats by hotkey "${keyword}"
    ${number_beats}   Get Number Beats
    ${number_beats_processed}       Evaluate    ${number_beats} - 1
    ${results}     Change Strip To Beats On Page     beat_change_by_hotkey=${keyword}
    Run Keyword And Continue On Failure    List Should Contain Value    ${results}        ${keyword}
    Run Keyword And Continue On Failure    List Should Contain Value    ${results}        ${beat_name}
    Filter Header    is_save=${True}
    ${expected_number_beats}         Get Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats_processed}     ${expected_number_beats}

Change beats to "${beat_name}" beats by button
    ${number_beats}   Get Number Beats
    ${number_beats_processed}       Evaluate    ${number_beats} - 1
    ${results}     Change Strip To Beats On Page     beat_change=beat${beat_name}
    Run Keyword And Continue On Failure    List Should Contain Value    ${results}        ${beat_name}
    Filter Header    is_save=${True}
    ${expected_number_beats}         Get Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats_processed}     ${expected_number_beats}

Delete a beats by button
    ${number_beats}   Get Number Beats
    ${number_beats_processed}       Evaluate    ${number_beats} - 1
    ${beats}              Get Strips Beats On Page
    ${actual_beats_name}       Evaluate    [item['Beat Name'] for item in ${beats}]
    Deleted Strip Beat Hr Heatmap
    ${expected_status}      Check Toolbar Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Reset Changes]
    Filter Header    is_reset_change=${True}
    ${beats}              Get Strips Beats On Page
    ${expected_beats_name}       Evaluate    [item['Beat Name'] for item in ${beats}]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${actual_beats_name}     ${expected_beats_name}
    Deleted Strip Beat Hr Heatmap          is_save=${True}
    ${expected_number_beats}   Get Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats_processed}     ${expected_number_beats}

Delete a beats by hotkey
    ${number_beats}   Get Number Beats
    ${number_beats_processed}       Evaluate    ${number_beats} - 1
    ${beats}              Get Strips Beats On Page
    ${actual_beats_name}       Evaluate    [item['Beat Name'] for item in ${beats}]
    Deleted Strip Beat Hr Heatmap    by_hotkey=D
    ${expected_status}      Check Toolbar Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Reset Changes]
    Filter Header    is_reset_change=${True}
    ${beats}              Get Strips Beats On Page
    ${expected_beats_name}       Evaluate    [item['Beat Name'] for item in ${beats}]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${actual_beats_name}     ${expected_beats_name}
    Deleted Strip Beat Hr Heatmap          is_save=${True}
    ${expected_number_beats}   Get Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats_processed}     ${expected_number_beats}

Delete multiple strips to beats by button
    ${number_beats}   Get Information Cell On Chart
    ${beats}              Get Strips Beats On Page
    ${actual_beats_name}       Evaluate    [item['Beat Name'] for item in ${beats}]
    Deleted Multiple Artifact Event Airp
    ${expected_status}      Check Toolbar Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Reset Changes]
    Filter Header    is_reset_change=${True}
    ${beats}              Get Strips Beats On Page
    ${expected_beats_name}       Evaluate    [item['Beat Name'] for item in ${beats}]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${actual_beats_name}     ${expected_beats_name}
    ${beats_deleted}      Deleted Multiple Artifact Event Airp    is_save=${True}
    Run Keyword And Continue On Failure    List Should Contain Value    ${beats_deleted}[Beat Name]        Deleted
    ${number_beats}       Evaluate    ${number_beats}[Number of beats] - ${beats_deleted}[Number Strips Beats]
    ${expected_strip_beats}         Get Number Strip Beats
    ${expected_beats}   Get Information Cell On Chart
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats}     ${expected_beats}[Number of beats]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_strip_beats}     ${expected_beats}[Number of beats]

Check reset change on beat "${beat_name}"
    ${beats}              Get Strips Beats On Page
    ${actual_beats_name}       Evaluate    [item['Beat Name'] for item in ${beats}]
    ${results}     Change Strip To Beats On Page     beat_change=beat${beat_name}
    Run Keyword And Continue On Failure    Should Be Equal    ${results}        ${beat_name}
    ${expected_status}      Check Toolbar Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Reset Changes]
    Filter Header    is_reset_change=${True}
    ${beats}              Get Strips Beats On Page
    ${expected_beats_name}       Evaluate    [item['Beat Name'] for item in ${beats}]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${actual_beats_name}     ${expected_beats_name}

Verify the number of beats in descending order
    ${number_of_beats}    Get All Numbers Beats
    ${list_of_beats}    Create List    ${number_of_beats}
    ${result}    Evaluate    ${list_of_beats} == sorted(${list_of_beats}, reverse=True)
    Run Keyword And Continue On Failure    Should Be True    ${result}

Check beats change by action "${action_name}" for beat by "All beats actions" feature
    ${number_list}    Get Number The V Morphologies List
    ${actual_number_list}    Evaluate    ${number_list} -1
    Filter Action Change All Beats Actions        beat_change=${action_name}
    Filter Header    is_save=${True}
    ${expected_number_list}    Get Number The V Morphologies List
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_list}     ${expected_number_list}

Check beats change by action "${action_name}" for beat by "Page actions" feature
    ${number_beats}   Get Number Beats
    ${number_beats_processed}       Evaluate    ${number_beats} -16
    ${number_page}    Get Current Total Page Airp Pagination
    ${actual_number_page}    Evaluate    ${number_page}-1
    Filter Action Change    beat_change=${action_name}
    ${current_action}       Get Current Action Change
    Run Keyword And Continue On Failure    Should Be Equal   ${current_action}        ${action_name}
    ${action_selected}      Get Action Change Selected
    Run Keyword And Continue On Failure    Should Be Equal    ${action_selected}[0][Beat Change]       ${action_name}
    Filter Header    is_save=${True}
    ${expected_number_page}    Get Current Total Page Airp Pagination
    ${expected_number_beats}         Get Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats_processed}     ${expected_number_beats}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_page}     ${expected_number_page}

Check beats change by action with hotkey "${hotkey_name}" for beat "${beat_name}" by "Page actions" feature
    ${number_beats}   Get Number Beats
    ${number_beats_processed}       Evaluate    ${number_beats} -16
    ${number_page}    Get Current Total Page Airp Pagination
    ${actual_number_page}    Evaluate    ${number_page}-1
    Change Strip To Beats On Page     beat_change_by_hotkey=${hotkey_name}
    ${current_action}       Get Current Action Change
    Run Keyword And Continue On Failure    Should Be Equal   ${current_action}        Change all to ${beat_name} beat
    ${action_selected}      Get Action Change Selected
    Run Keyword And Continue On Failure    Should Be Equal    ${action_selected}[0][Beat Change]       Change all to ${beat_name} beat
    Run Keyword And Continue On Failure    Should Be Equal    ${action_selected}[0][Hotkey]       ${hotkey_name}
    Filter Header    is_save=${True}
    ${expected_number_page}    Get Current Total Page Airp Pagination
    ${expected_number_beats}         Get Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats_processed}     ${expected_number_beats}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_page}     ${expected_number_page}

Check beats change by action with hotkey "${hotkey_name}" for "Delete all beats" beat by "Page actions" feature
    ${number_beats}   Get Number Beats
    ${number_beats_processed}       Evaluate    ${number_beats} -16
    ${number_page}    Get Current Total Page Airp Pagination
    ${actual_number_page}    Evaluate    ${number_page}-1
    Change Strip To Beats On Page     beat_change_by_hotkey=${hotkey_name}
    ${current_action}       Get Current Action Change
    Run Keyword And Continue On Failure    Should Be Equal   ${current_action}        Delete all beats
    ${action_selected}      Get Action Change Selected
    Run Keyword And Continue On Failure    Should Be Equal    ${action_selected}[0][Beat Change]       Delete all beats
    Run Keyword And Continue On Failure    Should Be Equal    ${action_selected}[0][Hotkey]       ${hotkey_name}
    Filter Header    is_save=${True}
    ${expected_number_page}    Get Current Total Page Airp Pagination
    ${expected_number_beats}         Get Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats_processed}     ${expected_number_beats}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_page}     ${expected_number_page}
