*** Settings ***
Documentation   Biocare app QoL Assessment test suite
Metadata    sid     BIOC-HEARTREPORT
Metadata    owner   Tu Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}
#
#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-HEARTREPORT   mapp
Test Timeout    1h

*** Test Cases ***
BIOC-HEARTREPORT-ENABLE-01: Verify the study 1 report of follow-on study is still displayed and study 2 report isn't displayed after enabling share report in study 1 and disabling share report in study 2
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
     ...    1. Create the follow on study on the Diagnostics portal
    ...     2. start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Log in the Admin center
    ...     8. Click Disable Share Report
    ...     9. Stop the first study
    ...     10. Wait the report uploading, click View report
    ,,,     11. Stop the second study
    ...     12. Wait the report uploading, click View report
    ...
    ...
    ...
    ...     Expected Output:
    ...     The study 1 report of follow-on study is still display and study 2 report isn't display after enabling share report in study 1 and disabling share report in study 2
    [Tags]      BIOC-HEARTREPORT-ENABLE-01      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ENABLE-02: Verify the study 1 report of follow-on study isn't displayed and study 2 report is still displayed after enabling share report in study 1 and disabling share report in study 2
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Disable Share Report
    ...     3. Create the follow on study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Log in the Admin center
    ...     8. Click Enable Share Report
    ...     9. Stop the first study
    ...     10. Wait the report uploading, click View report
    ...     11. Stop the second study
    ...     12. Wait the report uploading, click View report
    ...
    ...     Expected Output:
    ...     The study 1 report of follow-on study isn't displayed and study 2 report is still displayed after enabling share report in study 1 and disabling share report in study 2
    [Tags]      BIOC-HEARTREPORT-ENABLE-02      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ENABLE-03:Verify the push-notif report display on the app when clicking enable share report and the status report is Signed/ Completed
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Enable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Change status of report is Completed/ Signed
    ...     13. Check the push-notif report
    ...
    ...     Expected Output:
    ...     The push-notif report display on the app when clicking enable share report and the status report is Signed/ Completed
    [Tags]      BIOC-HEARTREPORT-ENABLE-03      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ENABLE-04: Verify the push-notif report displays on the app when click Enable Share report and the study have status is New/Downloaded/Reviewed/Interpreted
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Enable Share Report
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Change status of report is New/Downloaded/Reviewed/Interpreted
    ...     13. Wait the 14 days, check the push-notif report
    ...
    ...     Expected Output:
    ...     The push-notif report displays on the app when click Enable Share report and the study have status is New/Downloaded/Reviewed/Interpreted
    [Tags]      BIOC-HEARTREPORT-ENABLE-04      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ENABLE-05: Verify the in- app report display on the app when clicking enable share report and the status report is Signed/ Completed
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Enable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Change status of report is Completed/ Signed
    ...     13. Click the in-app icon on the Home tab
    ...     14. Check the in- app notif
    ...
    ...     Expected Output:
    ...     The push-notif report display on the app when clicking enable share report and the status report is Signed/ Completed
    [Tags]      BIOC-HEARTREPORT-ENABLE-05      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ENABLE-06: Verify the in- app report display on the app on the app when click Enable Share report and the study have status is New/Downloaded/Reviewed/Interpreted
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Enable Share Report
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Change status of report is New/Downloaded/Reviewed/Interpreted
    ...     13. Wait the 14 days, click the in-app icon on the Home tab
    ...     14. Check the in- app notif
    ...
    ...     Expected Output:
    ...     The push-notif report displays on the app when click Enable Share report and the study have status is New/Downloaded/Reviewed/Interpreted
    [Tags]      BIOC-HEARTREPORT-ENABLE-06      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ENABLE-07:Verify the email notifying patients to download the app to view the study report is sent when clicking Enable share report
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Disable Share Report
    ...     3. Create the new user account
    ...     4. Create the study on the Diagnostics portal with the FN, LN and DoB of new user (study have the new user mail)
    ...     5. Start on the study
    ...
    ...     Test Steps:
    ...     1. Stop the study
    ...     2. Open the mail
    ...     Expected Output:
    ...      The email notifying patients to download the app to view the study report is sent when clicking enable share report
    [Tags]      BIOC-HEARTREPORT-ENABLE-07      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ENABLE-08: Verify the report display on the Home tab when clicking enable share report and click the in- app notif
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Disable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Change status of report is Signed/ Completed
    ...     13. Click the in-app icon on the Home tab
    ...     14. Click the in- app notif
    ...     Expected Output:
    ...     the report display on the Home tab when clicking enable share report and click the in- app notif
    [Tags]      BIOC-HEARTREPORT-ENABLE-08      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ENABLE-09: Verify the report display on the Home tab when clicking enable share report and click the push notif
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Disable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Change status of report is Signed/ Completed
    ...     13. Click the push notif
    ...     Expected Output:
    ...     the report display on the Home tab when clicking enable share report and click the push notif
    [Tags]      BIOC-HEARTREPORT-ENABLE-09      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ENABLE-10: Verify the report display on the Home tab when clicking enable share report 
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Disable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Change status of report is Signed/ Completed
    ...     13. Check the report on the Home tab
    ...     Expected Output:
    ...     the report display on the Home tab when clicking enable share report 
    [Tags]      BIOC-HEARTREPORT-ENABLE-10      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ENABLE-11: Verify the report display on the Home tab when clicking enable share report and click View button
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Disable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Change status of report is Signed/ Completed
    ...     13. Click View button
    ...
    ...     Expected Output:
    ...     The report display on the Home tab when clicking enable share report and click View button 
    [Tags]      BIOC-HEARTREPORT-ENABLE-11      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ENABLE-12: Verify the new report display on the Biocare History when clicking enable share report
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Disable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Change status of report is Signed/ Completed
    ...     13. Click the Biocare History
    ...     14. Click the new report
    ...
    ...     Expected Output:
    ...     The new report displays on the Biocare History when clicking enable share report
    [Tags]      BIOC-HEARTREPORT-ENABLE-12     BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ENABLE-13: Verify the old report display on the Biocare History when clicking enable share report
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Disable Share Report
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Biocare History
    ...     3. Click the old report
    ...
    ...     Expected Output:
    ...     The the old report display on the Biocare History when clicking enable share report
    [Tags]      BIOC-HEARTREPORT-ENABLE-13      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BIOC-HEARTREPORT-ENABLE-14: Verify the UI study display correct on the Home tab when clicking enable share report after creating study
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Enable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Change status of report is Signed/ Completed
    ...     Expected Output:
    ...     the UI display correct on the Home tab when clicking enable share report after creating study
    [Tags]      BIOC-HEARTREPORT-ENABLE-14      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ENABLE-15: Verify the UI display correct on the Home tab when clicking enable share report after creating study and wait to more 2 days
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Enale Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Change status of report is Signed/ Completed
    ...     13. Wait to more 2 days, check UI on the Home tab
    ...     Expected Output:
    ...     the UI display correct on the Home tab when clicking enable share report after creating study and wait to more 2 days
    [Tags]      BIOC-HEARTREPORT-ENABLE-15      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ENABLE-16: Verify the push-notif artifact display when clicking enable share report
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Enable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     9. Stop the study
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the study
    ...     13. Click Mark as Antifact button
    ...     Expected Output:
    ...      The push-notif artifact display when clicking enable share report
    [Tags]      BIOC-HEARTREPORT-ENABLE-16      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ENABLE-17 : Verify the in- app notif artifact display when clicking enable share report
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Enable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Click Mark as Antifact button
    ...     13. Click the notif in- app icon the Home tab
    ...     Expected Output:
    ...      The in- app notif artifact display when clicking enable share report
    [Tags]      BIOC-HEARTREPORT-ENABLE-17       BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ENABLE-18: Verify the update push-notif display when clicking enable share report
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Enable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Change status of report is New/Downloaded/Reviewed/Interpreted
    ...     13. Update status report
    ...     Expected Output:
    ...      The update push-notif display when clicking enable share report
    [Tags]      BIOC-HEARTREPORT-ENABLE-18      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ENABLE-19: Verify the update in-app notif display when clicking enable share report
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Enable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Change status of report is New/Downloaded/Reviewed/Interpreted
    ...     13. Update status report, click in- app icon on the Home tab
    ...     Expected Output:
    ...      The the update in-app notif display when clicking enable share report
    [Tags]      BIOC-HEARTREPORT-ENABLE-19      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ENABLE-20: Verify the 2 follow-on report display when clicking enable share report before creating study
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Enable Share Report
    ...     3. Create the follow- on study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     9. Stop the study
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose 2 studies
    ...     13. Create 2 reports
    ...     14. Change status of report is Completed
    ...     15. Click the Home tab
    ...     16. Check the report
    ...
    ...     Expected Output:
    ...     the 2 follow-on report can't display when clicking enable share report before creating study
    [Tags]      BIOC-HEARTREPORT-ENABLE-20      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-01:Verify the push-notif report isn't display on the app when clicking disable share report before creating study
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Disable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Change status of report is Completed
    ...     13. Check the push-notif report
    ...
    ...     Expected Output:
    ...     The push-notif report isn't display on the app when clicking disable share report before creating study
    [Tags]      BIOC-HEARTREPORT-DISABLE-01      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-02:Verify the push-notif report displays on the app when clicking disable share report after creating study
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Log in the Admin portal
    ...     8. Click Disable Share Report
    ...     9. Stop the study
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the study
    ...     13. Create the report
    ...     14. Change status of report is Completed
    ...     15. Check the push-notif report
    ...
    ...     Expected Output:
    ...     The push-notif report displays on the app when clicking disable share report after creating study
    [Tags]      BIOC-HEARTREPORT-DISABLE-02      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-03: Verify the in-app notif report isn't display on the app when clicking disable share report before creating study
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Disable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Change status of report is Completed
    ...     13. Click the in-app notif icon on the Home tab
    ...
    ...     Expected Output:
    ...     The in-app notif report isn't display on the app when clicking disable share report before creating study
    [Tags]      BIOC-HEARTREPORT-DISABLE-03      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-04: Verify the in-app notif report display on the app when clicking disable share report after creating study
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Log in the Admin portal
    ...     8. Click disable share report
    ...     8. Stop the study
    ...     9. Wait the report uploading
    ...     10. Log in the Call center
    ...     11. Choose the study
    ...     12. Create the report
    ...     13. Change status of report is Completed
    ...     14. Click the in-app notif icon on the Home tab
    ...
    ...     Expected Output:
    ...     The in-app notif report is display on the app when clicking disable share report before creating study
    [Tags]      BIOC-HEARTREPORT-DISABLE-04      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BIOC-HEARTREPORT-DISABLE-05: Verify the push-notif report isn't display on the app when clicking disable share report before creating study have status is New/Downloaded/Reviewed/Interpreted
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Disable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     8. Stop the study
    ...     9. Wait the report uploading
    ...     10. Log in the Call center
    ...     11. Choose the study
    ...     12. Create the report
    ...     13. Change status of report is is New/Downloaded/Reviewed/Interpreted
    ...     14. Wait the 14 days, check the push-notif report
    ...
    ...     Expected Output:
    ...     The push-notif report isn't display on the app when click disable report share before creating study have status is New/Downloaded/Reviewed/Interpreted
    [Tags]      BIOC-HEARTREPORT-DISABLE-05      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-06:Verify the push-notif report displays on the app when click disable report share after creating study have status is New/Downloaded/Reviewed/Interpreted
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Log in the Admin portal
    ...     8. Click Disable Share Report
    ...     9. Stop the study
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the study
    ...     13. Create the report
    ...     14. Change status of report is New/Downloaded/Reviewed/Interpreted
    ...     15. Wait the 14 days, check the push-notif report
    ...
    ...     Expected Output:
    ...     The push-notif report displays on the app when clicking disable share report after creating study have status is New/Downloaded/Reviewed/Interpreted
    [Tags]      BIOC-HEARTREPORT-DISABLE-06      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-07: Verify the in-app notif report isn't display on the app when clicking disable share report before creating study have status is New/Downloaded/Reviewed/Interpreted
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Disable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Change status of report is New/Downloaded/Reviewed/Interpreted
    ...     13. Click the in-app notif icon on the Home tab
    ...
    ...     Expected Output:
    ...     The in-app notif report isn't display on the app when clicking disable share report before creating study
    [Tags]      BIOC-HEARTREPORT-DISABLE-07      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-08: Verify the in-app notif report display on the app when clicking disable share report after creating study have status is New/Downloaded/Reviewed/Interpreted
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Log in the Admin portal
    ...     8. Click Disable Share Report
    ...     9. Stop the study
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the study
    ...     13. Create the report
    ...     14. Change status of report is New/Downloaded/Reviewed/Interpreted
    ...     15. Click the in-app notif icon on the Home tab
    ...
    ...     Expected Output:
    ...     The in-app notif report is display on the app when clicking disable share report before creating study have is New/Downloaded/Reviewed/Interpreted
    [Tags]      BIOC-HEARTREPORT-DISABLE-08      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-9: Verify the report displays on the app when creating the study, clicking disable share report and clicking push-notif report
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Log in the Admin portal
    ...     8. Click Disable Share Report
    ...     9. Stop the study
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the study
    ...     13. Create the report
    ...     14. Change status of report is Completed
    ...     15. Click the push-notif report
    ...
    ...     Expected Output:
    ...     The  report displays on the app when creating the study, clicking disable share report and clicking push-notif report
    [Tags]      BIOC-HEARTREPORT-DISABLE-9      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-10: Verify the report display on the app when clicking disable share report after creating study and clicking the in-app notif report
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Log in the Admin portal
    ...     8. Click Disable Share Report
    ...     9. Stop the study
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the study
    ...     13. Create the report
    ...     14. Change status of report is Completed
    ...     15. Click the in-app notif icon on the Home tab
    ...     16. Click the in-app notif
    ...
    ...     Expected Output:
    ...     The report is display on the app when clicking the in- app notif report
    [Tags]      BIOC-HEARTREPORT-DISABLE-10      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-11: Verify the report display on the app when clicking disable share report after creating study and clicking the push notif report
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Log in the Admin portal
    ...     8. Click Disable Share Report
    ...     9. Stop the study
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the study
    ...     13. Create the report
    ...     14. Change status of report is Completed
    ...     15. Click the push notif
    ...
    ...     Expected Output:
    ...     The report is display on the app when clicking the push- notif report
    [Tags]      BIOC-HEARTREPORT-DISABLE-11      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-12: Verify the UI display correct on the Home tab when clicking disable share report after creating study
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Disable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Change status of report is Signed/ Completed
    ...     Expected Output:
    ...     the UI display correct on the Home tab when clicking disable share report after creating study
    [Tags]      BIOC-HEARTREPORT-DISABLE-12      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-13: Verify the UI display correct on the Home tab when clicking disable share report after creating study and wait to more 2 days
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Disable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Change status of report is Signed/ Completed
    ...     13. Wait to more 2 days, check UI on the Home tab
    ...     Expected Output:
    ...     the UI display correct on the Home tab when clicking disable share report after creating study and wait to more 2 days
    [Tags]      BIOC-HEARTREPORT-DISABLE-13      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-14: Verify the UI onboarding process display correct
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     Expected Output:
    ...     the  the UI onboarding process display correct
    [Tags]      BIOC-HEARTREPORT-DISABLE-14      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-15: Verify the Study artifact UI can't display on the Heart Studies card when clicking disable share report
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Disable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Click Mark as Antifact button
    ...     Expected Output:
    ...      The Study artifact UI can't display on the Heart Studies card
    [Tags]      BIOC-HEARTREPORT-DISABLE-15      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-16: Verify the push-notif artifact can't display when clicking disable share report
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Disable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Click Mark as Antifact button
    ...     Expected Output:
    ...      The push-notif artifact can't display when clicking disable share report
    [Tags]      BIOC-HEARTREPORT-DISABLE-16      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-17: Verify the push-notif artifact display when clicking disable share report after creating the study
    [Documentation]     Author: Tu Nguyen
    ...
   ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Log in the Admin portal
    ...     8. Click Disable Share Report
    ...     9. Stop the study
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the study
    ...     13. Click Mark as Antifact button
    ...     Expected Output:
    ...      The push-notif artifact display when clicking disable share report after creating the study
    [Tags]      BIOC-HEARTREPORT-DISABLE-17      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-18: Verify the in- app notif artifact can't display when clicking disable share report
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Disable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Click Mark as Antifact button
    ...     13. Click the notif in- app icon the Home tab
    ...     Expected Output:
    ...      The in- app notif artifact can't display when clicking disable share report
    [Tags]      BIOC-HEARTREPORT-DISABLE-18      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-19: Verify the in- app artifact display when clicking disable share report after creating the study
    [Documentation]     Author: Tu Nguyen
    ...
   ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Log in the Admin portal
    ...     8. Click Disable Share Report
    ...     9. Stop the study
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the study
    ...     13. Click Mark as Antifact button
    ...     14. Click the notif in- app icon the Home tab
    ...     Expected Output:
    ...      The  the in- app antifact display when clicking disable share report after creating the study
    [Tags]      BIOC-HEARTREPORT-DISABLE-19      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-20: Verify the update notif can't display when clicking disable share report
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Disable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Change status of report is New/Downloaded/Reviewed/Interpreted
    ...     13. Update status report
    ...     Expected Output:
    ...      The  update notif can't display when clicking disable share report
    [Tags]      BIOC-HEARTREPORT-DISABLE-20      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-21: Verify the update notif display when clicking disable share report after creating the study
    [Documentation]     Author: Tu Nguyen
    ...
   ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Log in the Admin portal
    ...     8. Click Disable Share Report
    ...     9. Stop the study
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the study
    ...     13. Change status of report is New/Downloaded/Reviewed/Interpreted
    ...     14. Update status report
    ...     Expected Output:
    ...      The update notif display when clicking disable share report after creating the study
    [Tags]      BIOC-HEARTREPORT-DISABLE-21      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-22: Verify the update notif can't display when clicking disable share report
    [Documentation]     Author: Tu Nguyen
    ...
    ...    Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Disable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop the study
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the study
    ...     11. Create the report
    ...     12. Change status of report is New/Downloaded/Reviewed/Interpreted
    ...     13. Update status report
    ...     Expected Output:
    ...      The update notif can't display when clicking disable share report
    [Tags]      BIOC-HEARTREPORT-DISABLE-22      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-23: Verify the update notif display when clicking disable share report after creating the study
    [Documentation]     Author: Tu Nguyen
    ...
   ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Log in the Admin portal
    ...     8. Click Disable Share Report
    ...     9. Stop the study
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the study
    ...     13. Create the report
    ...     14. Change status of report is New/Downloaded/Reviewed/Interpreted
    ...     15. Update status report
    ...     Expected Output:
    ...      The  the update notif display when clicking disable share report after creating the study
    [Tags]      BIOC-HEARTREPORT-DISABLE-23      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-24: Verify the email notifying patients to download the app to view the study report can't sent when clicking disable share report after creating the study
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Disable Share Report
    ...     3. Create the new user account
    ...     4. Create the study on the Diagnostics portal with the FN, LN and DoB of new user (study have the new user mail)
    ...     5. Start on the study
    ...
    ...     Test Steps:
    ...     1. Stop the study
    ...     2. Open the mail
    ...     Expected Output:
    ...      The email notifying patients to download the app to view the study report can't sent when clicking disable share report after creating the study
    [Tags]      BIOC-HEARTREPORT-DISABLE-24      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-25: Verify the report can't display on the app when clicking disable share report before creating study
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Disable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     9. Stop the study
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the study
    ...     13. Create the report
    ...     14. Change status of report is Completed
    ...     15. Click the Home tab
    ...     16. Check the report
    ...
    ...     Expected Output:
    ...     the report can't display on the app when clicking disable share report before creating study
    [Tags]      BIOC-HEARTREPORT-DISABLE-25      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-26: Verify the report display when clicking disable share report after creating the study
    [Documentation]     Author: Tu Nguyen
    ...
   ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Log in the Admin portal
    ...     8. Click Disable Share Report
    ...     9. Stop the study
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the study
    ...     13. Create the report
    ...     14. Click the Home tab
    ...     15. Check the report
    ...     Expected Output:
    ...      the report display when clicking disable share report after creating the study
    [Tags]      BIOC-HEARTREPORT-DISABLE-26      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-27: Verify the report can't display on the Biocare history when clicking disable share report before creating study
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Disable Share Report
    ...     3. Create the study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     9. Stop the study
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the study
    ...     13. Create the report
    ...     14. Change status of report is Completed
    ...     15. Click the Service tab
    ...     16. Click the Biocare History
    ...     17. Click the report
    ...
    ...     Expected Output:
    ...     the report can't display on the Biocare history when clicking disable share report before creating study
    [Tags]      BIOC-HEARTREPORT-DISABLE-27      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-28: Verify the report display on the Biocare history when clicking disable share report after creating the study
    [Documentation]     Author: Tu Nguyen
    ...
   ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Log in the Admin portal
    ...     8. Click Disable Share Report
    ...     9. Stop the study
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the study
    ...     13. Create the report
    ...     14. Click the Service tab
    ...     15. Click the Biocare History
    ...     16. Click the report
    ...
    ...     Expected Output:
    ...      the report display on the Biocare history when clicking disable share report after creating the study
    [Tags]      BIOC-HEARTREPORT-DISABLE-28      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-29: Verify the 2 follow-on report display when clicking disable share report after creating the study
    [Documentation]     Author: Tu Nguyen
    ...
   ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Log in the Admin portal
    ...     8. Click Disable Share Report
    ...     9. Stop the study
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose 2 studies
    ...     13. Create 2 reports
    ...     14. Change status of report is Completed
    ...     15. Click the Home tab
    ...     16. Check the report
    ...
    ...     Expected Output:
    ...      the 2 follow-on report display when clicking disable share report after creating the study
    [Tags]      BIOC-HEARTREPORT-DISABLE-29      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DISABLE-30: Verify the 2 follow-on report can't display when clicking disable share report before creating study
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Log in the Admin portal
    ...     2. Click Disable Share Report
    ...     3. Create the follow- on study on the Diagnostics portal
    ...     4. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     9. Stop the study
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose 2 studies
    ...     13. Create 2 reports
    ...     14. Change status of report is Completed
    ...     15. Click the Home tab
    ...     16. Check the report
    ...
    ...     Expected Output:
    ...     the 2 follow-on report can't display when clicking disable share report before creating study
    [Tags]      BIOC-HEARTREPORT-DISABLE-30      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ADMINPORTAL-01: Verify the UI (including text and formatting) should match the design specifications exactly as shown in Figma
    [Documentation]     Author: Tu Nguyen
    ...
    ...
    ...     Test Steps:
    ...     1. Log in Admin portal
    ...     2. Click the Facilities tab
    ...     3. Click End of Use Report Configuration
    ...
    ...     Expected Output:
    ...     The UI (including text and formatting) should match the design specifications exactly as shown in Figma.
    [Tags]      BIOC-HEARTREPORT-ADMINPORTAL-01     BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BIOC-HEARTREPORT-ADMINPORTAL-02: Verify the default setting for the Enable Share Report is located in the Admin portal.
    [Documentation]     Author: Tu Nguyen
    ...
    ...
    ...     Test Steps:
    ...     1. Log in Admin portal
    ...     2. Click the Facilities tab
    ...     3. Click End of Use Report Configuration
    ...
    ...     Expected Output:
    ...     The default setting for the Enable Share Report is located in the Admin portal..
    [Tags]      BIOC-HEARTREPORT-ADMINPORTAL-02      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ADMINPORTAL-03: Verify the disable share report setting successfully adjusted on Admin portal.
    [Documentation]     Author: Tu Nguyen
    ...
    ...
    ...     Test Steps:
    ...     1. Log in Admin portal
    ...     2. Click the Facilities tab
    ...     3. Click End of Use Report Configuration
    ...     4. Click Display End of Use report to patient
    ...
    ...     Expected Output:
    ...     The disable share report setting successfully adjusted on Admin portal.
    [Tags]      BIOC-HEARTREPORT-ADMINPORTAL-03      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-01: Verify the report can't be view on the app When waiting for study duration end (using 1 account)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Waiting for study duration end
    ...     2. Log in the app
    ...     3. Click the Device tab
    ...     4. Click Scan the device id
    ...     5. Input the the device id
    ...     6. Click Check button
    ...     7. Go though the onboarding process
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the studies
    ...     11. Create the reports
    ...     12. Change status of report is Completed
    ...     13. Click the Biocare history
    ...     14. Check the report
    ...
    ...     Expected Output:
    ...     the report can't be view on the app When waiting for study duration end (using 1 account)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-01      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-02: Verify the report can't be view on the app When stop study before study duration end (using 1 account)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Stop the study
    ...     2. Log in the app
    ...     3. Click the Device tab
    ...     4. Click Scan the device id
    ...     5. Input the the device id
    ...     6. Click Check button
    ...     7. Go though the onboarding process
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the studies
    ...     11. Create the reports
    ...     12. Change status of report is Completed
    ...     13. Click the Biocare History
    ...     14. Check the report
    ...
    ...     Expected Output:
    ...     the report can't be view on the app When stop study before study duration end (using 1 account)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-02      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-03: Verify the report can't be view on the app When waiting for study duration end and the status of report is Signed/ Completed (using 1 account)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Waiting for study duration end
    ...     2. Log in the app
    ...     3. Click the Device tab
    ...     4. Click Scan the device id
    ...     5. Input the the device id
    ...     6. Click Check button
    ...     7. Go though the onboarding process
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the studies
    ...     11. Create the reports
    ...     12. Change status of report is Signed/ Completed
    ...     13. Click the Biocare history
    ...     14. Check the report
    ...
    ...     Expected Output:
    ...     the report can't be view on the app When waiting for study duration end and the status of report is Signed/ Completed (using 1 account)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-03      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-04: Verify the report can't be view on the app When stop study before study duration end and the status of report is Signed/ Completed (using 1 account)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Stop the study
    ...     2. Log in the app
    ...     3. Click the Device tab
    ...     4. Click Scan the device id
    ...     5. Input the the device id
    ...     6. Click Check button
    ...     7. Go though the onboarding process
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the studies
    ...     11. Create the reports
    ...     12. Change status of report is Signed/ Completed
    ...     13. Click the Biocare History
    ...     14. Check the report
    ...
    ...     Expected Output:
    ...     the report can't be view on the app When stop study before study duration end the status of report is Signed/ Completed (using 1 account)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-04      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-05: Verify the report can't be view on the app When waiting for study duration end and the status of report is New/Downloaded/Reviewed/Interpreted (using 1 account)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Waiting for study duration end
    ...     2. Log in the app
    ...     3. Click the Device tab
    ...     4. Click Scan the device id
    ...     5. Input the the device id
    ...     6. Click Check button
    ...     7. Go though the onboarding process
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the studies
    ...     11. Create the reports
    ...     12. Change status of report is New/Downloaded/Reviewed/Interpreted
    ...     13. Wait to more 14 days, click the Biocare history
    ...     14. Check the report
    ...
    ...     Expected Output:
    ...     the report can't be view on the app When waiting for study duration end and the status of report is New/Downloaded/Reviewed/Interpreted (using 1 account)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-05      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-06: Verify the report can't be view on the app When stop study before study duration end and the status of report is New/Downloaded/Reviewed/Interpreted (using 1 account)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Stop the study
    ...     2. Log in the app
    ...     3. Click the Device tab
    ...     4. Click Scan the device id
    ...     5. Input the the device id
    ...     6. Click Check button
    ...     7. Go though the onboarding process
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the studies
    ...     11. Create the reports
    ...     12. Change status of report is New/Downloaded/Reviewed/Interpreted
    ...     13. Wait to more 14 days, click the Biocare history
    ...     14. Check the report
    ...
    ...     Expected Output:
    ...     the report can't be view on the app When stop study before study duration end the status of report is Signed/ Completed (using 1 account)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-06     BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-07: Verify the notification can't be received on the app When waiting for study duration end and the status of report is Signed/ Completed (using 1 account)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Waiting for study duration end
    ...     2. Log in the app
    ...     3. Click the Device tab
    ...     4. Click Scan the device id
    ...     5. Input the the device id
    ...     6. Click Check button
    ...     7. Go though the onboarding process
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the studies
    ...     11. Create the reports
    ...     12. Change status of report is Signed/ Completed
    ...
    ...     Expected Output:
    ...     the notification can't be received When waiting for study duration end and the status of report is Signed/ Completed (using 1 account)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-07      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-08: Verify the notification can't be received on the app When stop study before study duration end and the status of report is Signed/ Completed (using 1 account)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Stop the study
    ...     2. Log in the app
    ...     3. Click the Device tab
    ...     4. Click Scan the device id
    ...     5. Input the the device id
    ...     6. Click Check button
    ...     7. Go though the onboarding process
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the studies
    ...     11. Create the reports
    ...     12. Change status of report is Signed/ Completed
    ...
    ...     Expected Output:
    ...     the notification can't be received on the app When stop study before study duration end the status of report is Signed/ Completed (using 1 account)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-08      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-09: Verify the notification can't be received on the app When waiting for study duration end and the status of report is New/Downloaded/Reviewed/Interpreted (using 1 account)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Waiting for study duration end
    ...     2. Log in the app
    ...     3. Click the Device tab
    ...     4. Click Scan the device id
    ...     5. Input the the device id
    ...     6. Click Check button
    ...     7. Go though the onboarding process
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the studies
    ...     11. Create the reports
    ...     12. Change status of report is New/Downloaded/Reviewed/Interpreted
    ...     13. Wait to more 14 days, check the notification
    ...
    ...     Expected Output:
    ...     the notification can't be received on the app When waiting for study duration end and the status of report is Signed/ Completed (using 1 account)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-09      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-10: Verify the notification can't be received on the app When stop study before study duration end and the status of report is New/Downloaded/Reviewed/Interpreted (using 1 account)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Stop the study
    ...     2. Log in the app
    ...     3. Click the Device tab
    ...     4. Click Scan the device id
    ...     5. Input the the device id
    ...     6. Click Check button
    ...     7. Go though the onboarding process
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the studies
    ...     11. Create the reports
    ...     12. Change status of report is New/Downloaded/Reviewed/Interpreted
    ...     13. Wait to more 14 days, check the notification
    ...
    ...     Expected Output:
    ...     the notification can't be received on the app When stop study before study duration end the status of report is New/Downloaded/Reviewed/Interpreted (using 1 account)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-10     BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-11: Verify the Mark as artifact notification can't be received on the app When waiting for study duration end (using 1 account)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Waiting for study duration end
    ...     2. Log in the app
    ...     3. Click the Device tab
    ...     4. Click Scan the device id
    ...     5. Input the the device id
    ...     6. Click Check button
    ...     7. Go though the onboarding process
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the studies
    ...     11. Create the reports
    ...     12. Click the Mark as artifact
    ...
    ...     Expected Output:
    ...     the Mark as artifact notification can't be received on the app When waiting for study duration end (using 1 account)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-11      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-12: Verify the Mark as artifact notification can't be received on the app When stop study before study duration end (using 1 account)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the  study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Stop the study
    ...     2. Log in the app
    ...     3. Click the Device tab
    ...     4. Click Scan the device id
    ...     5. Input the the device id
    ...     6. Click Check button
    ...     7. Go though the onboarding process
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the studies
    ...     11. Create the reports
    ...     12. Click the Mark as artifact
    ...
    ...     Expected Output:
    ...     the Mark as artifact notification can't be received on the app When stop study before study duration end (using 1 account)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-12     BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-13: Verify the update notification can't be received on the app When waiting for study duration end (using 1 account)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Waiting for study duration end
    ...     2. Log in the app
    ...     3. Click the Device tab
    ...     4. Click Scan the device id
    ...     5. Input the the device id
    ...     6. Click Check button
    ...     7. Go though the onboarding process
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the studies
    ...     11. Create the reports
    ...     12. Change the status of report
    ...     13. Update the status of report
    ...
    ...     Expected Output:
    ...     the update notification can't be received on the app When waiting for study duration end (using 1 account)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-13      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-14: Verify the update notification can't be received on the app When stop study before study duration end (using 1 account)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Stop the study
    ...     2. Log in the app
    ...     3. Click the Device tab
    ...     4. Click Scan the device id
    ...     5. Input the the device id
    ...     6. Click Check button
    ...     7. Go though the onboarding process
    ...     8. Wait the report uploading
    ...     9. Log in the Call center
    ...     10. Choose the studies
    ...     11. Create the reports
    ...     12. Change the status of report
    ...     13. Update the status of report
    ...
    ...     Expected Output:
    ...     the update notification can't be received on the app When stop study before study duration end (using 1 account)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-14     BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-15: Verify the report can't be view on the app When waiting for study duration end (using 2 account, account 1 can see report and account 2 can't see)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app with the account 1
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Waiting for study duration end
    ...     8. Log out the account 1
    ...     9. Log in the app with account 2
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the studies
    ...     13. Create the reports
    ...     14. Change status of report is Completed
    ...     15. Click the Biocare history
    ...     16. Check the report
    ...
    ...     Expected Output:
    ...    the report can't be view on the app When waiting for study duration end (using 2 account, account 1 can see report and account 2 can't see)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-15      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-16: Verify the report can't be view on the app When stop study before study duration end (using 2 account, account 1 can see report and account 2 can't see)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app with the account 1
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop study before study duration end
    ...     8. Log out the account 1
    ...     9. Log in the app with account 2
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the studies
    ...     13. Create the reports
    ...     14. Change status of report is Completed
    ...     15. Click the Biocare history
    ...     16. Check the report
    ...
    ...     Expected Output:
    ...     the report can't be view on the app When stop study before study duration end (using 2 account, account 1 can see report and account 2 can't see)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-16      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-17: Verify the report can't be view on the app When waiting for study duration end and the status of report is Signed/ Completed (using 2 account, account 1 can see report and account 2 can't see)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app with the account 1
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Waiting for study duration end
    ...     8. Log out the account 1
    ...     9. Log in the app with account 2
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the studies
    ...     13. Create the reports
    ...     14. Change status of report is Signed/Completed
    ...     15. Click the Biocare history
    ...     16. Check the report
    ...
    ...     Expected Output:
    ...     the report can't be view on the app When waiting for study duration end and the status of report is Signed/ Completed (using 2 account, account 1 can see report and account 2 can't see)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-17      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-18: Verify the report can't be view on the app When stop study before study duration end and the status of report is Signed/ Completed (using 2 account, account 1 can see report and account 2 can't see)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app with the account 1
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop study before study duration end
    ...     8. Log out the account 1
    ...     9. Log in the app with account 2
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the studies
    ...     13. Create the reports
    ...     14. Change status of report is Signed/Completed
    ...     15. Click the Biocare history
    ...     16. Check the report
    ...
    ...     Expected Output:
    ...     the report can't be view on the app When stop study before study duration end the status of report is Signed/ Completed (using 2 account, account 1 can see report and account 2 can't see))
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-18      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-19: Verify the report can't be view on the app When waiting for study duration end and the status of report is New/Downloaded/Reviewed/Interpreted (using 2 account, account 1 can see report and account 2 can't see)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app with the account 1
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop study before study duration end
    ...     8. Log out the account 1
    ...     9. Log in the app with account 2
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the studies
    ...     13. Create the reports
    ...     14. Change status of report is New/Downloaded/Reviewed/Interpreted
    ...     15. Wait to more 14 days, Click the Biocare history
    ...     16. Check the report
    ...
    ...     Expected Output:
    ...     the report can't be view on the app When waiting for study duration end and the status of report is New/Downloaded/Reviewed/Interpreted (using 2 account, account 1 can see report and account 2 can't see)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-19      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-20: Verify the report can't be view on the app When stop study before study duration end and the status of report is New/Downloaded/Reviewed/Interpreted (using 2 account, account 1 can see report and account 2 can't see)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app with the account 1
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop study before study duration end
    ...     8. Log out the account 1
    ...     9. Log in the app with account 2
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the studies
    ...     13. Create the reports
    ...     14. Change status of report is New/Downloaded/Reviewed/Interpreted
    ...     15. Wait to more 14 days, Click the Biocare history
    ...     16. Check the report
    ...
    ...     Expected Output:
    ...     the report can't be view on the app When stop study before study duration end the status of report is Signed/ Completed (using 2 account, account 1 can see report and account 2 can't see)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-20     BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-21: Verify the notification can't be received on the app When waiting for study duration end and the status of report is Signed/ Completed (using 2 account, account 1 can receive notif and account 2 can't receive)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app with the account 1
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Wait the study duration end
    ...     8. Log out the account 1
    ...     9. Log in the app with account 2
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the studies
    ...     13. Create the reports
    ...     14. Change status of report is Signed/Completed
    ...
    ...     Expected Output:
    ...     the notification can't be received When waiting for study duration end and the status of report is Signed/ Completed (using 1 account)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-21      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-22: Verify the notification can't be received on the app When stop study before study duration end and the status of report is Signed/ Completed (using 2 account, account 1 can receive notif and account 2 can't receive)
    [Documentation]     Author: Tu Nguyen
    ...
   ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app with the account 1
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop study before study duration end
    ...     8. Log out the account 1
    ...     9. Log in the app with account 2
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the studies
    ...     13. Create the reports
    ...     14. Change status of report is Signed/Completed
    ...
    ...     Expected Output:
    ...     the notification can't be received on the app When stop study before study duration end the status of report is Signed/ Completed (using 2 account, account 1 can receive notif and account 2 can't receive)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-22      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-23: Verify the notification can't be received on the app When waiting for study duration end and the status of report is New/Downloaded/Reviewed/Interpreted (using 2 account, account 1 can receive notif and account 2 can't receive)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app with the account 1
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Waiting for study duration end
    ...     8. Log out the account 1
    ...     9. Log in the app with account 2
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the studies
    ...     13. Create the reports
    ...     14. Change status of report is is New/Downloaded/Reviewed/Interpreted
    ...     15. Wait to more 14 days, check the notification
    ...
    ...     Expected Output:
    ...     the notification can't be received on the app When waiting for study duration end and the status of report is Signed/ Completed (using 2 account, account 1 can receive notif and account 2 can't receive)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-23      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-24: Verify the notification can't be received on the app When stop study before study duration end and the status of report is New/Downloaded/Reviewed/Interpreted (using 2 account, account 1 can receive notif and account 2 can't receive)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app with the account 1
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop study before study duration end
    ...     8. Log out the account 1
    ...     9. Log in the app with account 2
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the studies
    ...     13. Create the reports
    ...     14. Change status of report is New/Downloaded/Reviewed/Interpreted
    ...     15. Wait to more 14 days, check the notification
    ...
    ...     Expected Output:
    ...     the notification can't be received on the app When stop study before study duration end the status of report is New/Downloaded/Reviewed/Interpreted (using 2 account, account 1 can receive notif and account 2 can't receive)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-24     BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-25: Verify the Mark as artifact notification can't be received on the app When waiting for study duration end (using 2 account, account 1 can receive notif and account 2 can't receive)
    [Documentation]     Author: Tu Nguyen
    ...
     ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app with the account 1
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Waiting for study duration end
    ...     8. Log out the account 1
    ...     9. Log in the app with account 2
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the studies
    ...     13. Create the reports
    ...     14. Click the Mark as artifact
    ...
    ...     Expected Output:
    ...     the Mark as artifact notification can't be received on the app When waiting for study duration end (using 2 account, account 1 can receive notif and account 2 can't receive)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-25      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-26: Verify the Mark as artifact notification can't be received on the app When stop study before study duration end (using 2 account, account 1 can receive notif and account 2 can't receive)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app with the account 1
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop study before study duration end
    ...     8. Log out the account 1
    ...     9. Log in the app with account 2
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the studies
    ...     13. Create the reports
    ...     14. Click the Mark as artifact
    ...
    ...     Expected Output:
    ...     the Mark as artifact notification can't be received on the app When stop study before study duration end (using 2 account, account 1 can receive notif and account 2 can't receive)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-26     BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-27: Verify the update notification can't be received on the app When waiting for study duration end (using 2 account, account 1 can receive notif and account 2 can't receive)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app with the account 1
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Wait the study duration end
    ...     8. Log out the account 1
    ...     9. Log in the app with account 2
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the studies
    ...     13. Create the reports
    ...     14. Change the status of report
    ...     15. Update the status of report
    ...
    ...     Expected Output:
    ...     the update notification can't be received on the app When waiting for study duration end (using 2 account, account 1 can receive notif and account 2 can't receive)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-27      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-28: Verify the update notification can't be received on the app When stop study before study duration end (using 2 account, account 1 can receive notif and account 2 can't receive)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
     ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app with the account 1
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop study before study duration end
    ...     8. Log out the account 1
    ...     9. Log in the app with account 2
    ...     10. Wait the report uploading
    ...     11. Log in the Call center
    ...     12. Choose the studies
    ...     13. Create the reports
    ...     14. Change the status of report
    ...     15. Update the status of report
    ...
    ...     Expected Output:
    ...     the update notification can't be received on the app When stop study before study duration end (using 2 account, account 1 can receive notif and account 2 can't receive)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-28     BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-29: Verify the new user account can be linked with the study have the FN, LN and DoB same with new account When waiting for study duration end (using 1 account)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal with the same FN, LN and DoB with the new user account
    ...     2. Start on the study
    ...     3. Wait the study duration end
    ...
    ...     Test Steps:
    ...     1. Wait the uploading data
    ...     2. Log in the Call center
    ...     3. Choose the studies
    ...     4. Create the reports
    ...     5. Log in the app with the new user account
    ...     6. Check the report
    ...
    ...     Expected Output:
    ...     the new user account can be linked with the study have the FN, LN and DoB same with new account When waiting for study duration end (using 1 account)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-29      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-30: Verify the new user account can be linked with the study have the FN, LN and DoB same with new account When stop study before study duration end (using 1 account)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal with the same FN, LN and DoB with the new user account
    ...     2. Start on the study
    ...     3. Wait the study duration end
    ...
    ...     Test Steps:
    ...     1. Wait the uploading data
    ...     2. Log in the Call center
    ...     3. Choose the studies
    ...     4. Create the reports
    ...     5. Log in the app with the new user account
    ...     6. Check the report
    ...
    ...     Expected Output:
    ...    the new user account can be linked with the study have the FN, LN and DoB same with new account ( using 1 account)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-30     BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BIOC-HEARTREPORT-DURATIONEND-31: Verify the icon paired display on the portal When waiting for study duration end (using 2 account)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app with the account 1
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Wait the study duration end
    ...     8. Log out the account 1
    ...     9. Log in the app with account 2
    ...     10. Wait the report uploading
    ...     11. Log in the the Diagnostics portal
    ...     12. Check icon paired on the portal
    ...
    ...     Expected Output:
    ...     the icon paired display on the portal When waiting for study duration end (using 2 account)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-31      BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-DURATIONEND-32: Verify the icon paired display on the portal When stop study before study duration end (using 2 account)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
     ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app with the account 1
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Go though the onboarding process
    ...     7. Stop study before study duration end
    ...     8. Log out the account 1
    ...     9. Log in the app with account 2
    ...     10. Wait the report uploading
    ...     11. Log in the the Diagnostics portal
    ...     12. Check icon paired on the portal
    ...
    ...     Expected Output:
    ...     the the icon paired display on the portal When stop study before study duration end (using 2 account)
    [Tags]      BIOC-HEARTREPORT-DURATIONEND-32     BIOC-2.1.2  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-01: Verify the unlock bottom sheet display on the app when click the in-app notif
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the study
    ...
    ...     Expected Output:
    ...     the UI unlock bottom sheet display on the app when click the in-app notif
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-01     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-02: Verify the unlock bottom sheet display on the app when click study on the Biocare history
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...
    ...     Expected Output:
    ...     the UI unlock bottom sheet display on the app when click study on the Biocare history
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-02     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-03: Verify the unlock bottom sheet display on the app when click the report notification
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the app 
    ...     2. Log in the Call Center
    ...     3. Choose the study
    ...     4. Create the report
    ...     5. Change the status report
    ...     6. Click the notification
    ...
    ...     Expected Output:
    ...     the UI unlock bottom sheet display on the app when click the report notification
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-03     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-04: Verify UI the unlock bottom sheet match the design specifications exactly as shown in Figma
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...
    ...     Expected Output:
    ...     the UI unlock bottom sheet  match the design specifications exactly as shown in Figma
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-04     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-05: Verify the phone number keyboard display when input the number on the day, month, year field on the unlock bottom sheet
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input the number on  the day, month, year field
    ...
    ...     Expected Output:
    ...    the phone number keyboard display when input the number on the day, month, year field
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-05     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BIOC-HEARTREPORT-UNLOCKREPORT-06: Verify the special character can't input on the day, month, year field
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input the special character on  the day, month, year field
    ...
    ...     Expected Output:
    ...     the special character can't input on the day, month, year field
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-06     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BIOC-HEARTREPORT-UNLOCKREPORT-07: Verify the UI Verification failed modal match the design specifications exactly as shown in Figma
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input the month, day and year don't match with the system record
    ...
    ...     Expected Output:
    ...     the UI Verification failed modal match the design specifications exactly as shown in Figma
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-07     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-08: Verify the UI Contact support bottom sheet match the design specifications exactly as shown in Figma
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input the month, day and year don't match with the system record
    ...     9. Click the Contact Support button
    ...
    ...     Expected Output:
    ...     the UI Contact support bottom sheet match the design specifications exactly as shown in Figma
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-08     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-09: Verify the system auto jump on the Day field when input full number on the month field
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input full number on the month field
    ...
    ...     Expected Output:
    ...     the system auto jump on the Day field when input full number on the month field
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-09     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-10: Verify the system auto jump on the Year field when input full number on the Day field
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input full number on the Day field
    ...
    ...     Expected Output:
    ...     the system auto jump on the Year field when input full number on the Day field
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-10     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-11: Verify the study can't view when input wrong format on the Month field
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input wrong format on the Month field
    ...
    ...     Expected Output:
    ...     the study can't view when input wrong format on the Month field
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-11     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-12: Verify the study can't view when input wrong format on the Day field
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input wrong format on the Day field
    ...
    ...     Expected Output:
    ...     the study can't view when input wrong format on the Day field
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-12     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-13: Verify the study can't view when input wrong format on the Year field
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input wrong format on the Year field
    ...
    ...     Expected Output:
    ...     the study can't view when input wrong format on the Year field
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-13     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-14: Verify the study can't view when input wrong format on the Month, Day and Year field
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input wrong format on the Month, Day and Year field
    ...
    ...     Expected Output:
    ...     the study can't view when input wrong format on the Month, Day and Year field
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-14     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-15: Verify the study can't view when input wrong format on the Month, Day and Year field
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input wrong format on the Month, Day and Year field
    ...
    ...     Expected Output:
    ...     the study can't view when input wrong format on the Month, Day and Year field
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-15     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-16: Verify the system can navigate the study report for enable share report when input correct information study on the Month, Day and Year field
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition::
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input correct information on the Month, Day and Year field
    ...
    ...     Expected Output:
    ...     the system can navigate the study report for enable share report when input correct information study on the Month, Day and Year field
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-16     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-17: Verify the shared study report is still displayed correctly according to the current logic
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input correct information on the Month, Day and Year field
    ...
    ...     Expected Output:
    ...     the shared study report is still displayed correctly according to the current logic
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-17     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-18: Verify the system can navigate the study report for disable share report when input correct information study on the Month, Day and Year field
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. log in the Admin portal
    ...     2. Chosse the facility
    ...     3. Click disable share report
    ...     4. Create the study on the Diagnostics portal
    ...     5. Start on the study
    ...     6. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input correct information on the Month, Day and Year field
    ...
    ...     Expected Output:
    ...     the system can navigate the study report for disable share report when input correct information study on the Month, Day and Year field
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-18     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-19: Verify the study report can't displayed correctly according to the current logic
    [Documentation]     Author: Tu Nguyen
    ...
     ...     Pre-condition:
    ...     1. log in the Admin portal
    ...     2. Chosse the facility
    ...     3. Click disable share report
    ...     4. Create the study on the Diagnostics portal
    ...     5. Start on the study
    ...     6. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input correct information on the Month, Day and Year field
    ...
    ...     Expected Output:
    ...     the study report can't displayed correctly according to the current logic
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-19     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-20: Verify the study can't view when input missing information on the Month field
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input missing information on the Month field
    ...
    ...     Expected Output:
    ...     the study can't view when input missing information on the Month field
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-20     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-21: Verify the study can't view when input missing information on the Day field
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input missing information on the Day field
    ...
    ...     Expected Output:
    ...     the study can't view when input missing information on the Day field
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-21     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-22: Verify the study can't view when input missing information on the Year field
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input missing information on the Year field
    ...
    ...     Expected Output:
    ...     the study can't view when input missing information on the Year field
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-22     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-23: Verify the study can't view when input missing information on the Month, Day and Year field
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input wrong format on the Month, Day and Year field
    ...
    ...     Expected Output:
    ...     the study can't view when input missing information on the Month, Day and Year field
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-23    BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-24: Verify the validation message "Please enter all fields above to view report." display below 3 fields Day, Month, Year when leaving the field blank
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Don't input information on the Month, Day and Year field
    ...
    ...     Expected Output:
    ...     the validation message "Please enter all fields above to view report." display below 3 fields Day, Month, Year when leaving the field blank
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-24     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-25: Verify the validation message "Please enter a valid date of birth." will be displayed under 3 fields Day, Month, Year when input DoB information in the future (05/10/2026,...)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input DoB information in the future (05/10/2026,...)
    ...
    ...     Expected Output:
    ...     the validation message "Please enter all fields above to view report." display below 3 fields Day, Month, Year when leaving the field blank
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-25     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-26: Verify the validation message "Please enter a valid date of birth." will be displayed under 3 fields Day, Month, Year when input false DoB information (02/30/9999, 06/31/9999,...)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input false DoB information (02/30/9999, 06/31/9999,...)
    ...
    ...     Expected Output:
    ...     the validation message "Please enter a valid date of birth." will be displayed under 3 fields Day, Month, Year when input false DoB information (02/30/9999, 06/31/9999,...)
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-26     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-27: Verify the DoB used to unlock the study report must be the most recently updated DoB on the portal.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...     4. Change the Dob study report
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input recently updated DoB information
    ...     Expected Output:
    ...     the DoB used to unlock the study report must be the most recently updated DoB on the portal
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-27     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-28: Verify the DoB used to unlock the study report is updated when changing the DoB while the study is running.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Change the Dob study report
    ...     4. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input recently updated DoB information
    ...     9. Click the View Report button
    ...     Expected Output:
    ...     the DoB used to unlock the study report is updated when changing the DoB while the study is running.
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-28     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-29: Verify the study report is successfully unlocked, user will be able to access study report from other devices using the same account without having to verify again.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Change the Dob study report
    ...     4. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app 
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input DoB information
    ...     9. Log in the app same account with the other device
    ...     10. Click the Service tab
    ...     11. Click the Biocare History
    ...     12. Click the study
    ...     Expected Output:
    ...     the study report is successfully unlocked, user will be able to access study report from other devices using the same account without having to verify again.
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-29     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-30: Verify the user accesses study report successfully without re-verifying when 2 devices logged in with the same account at the same time.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Change the Dob study report
    ...     4. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app with the device 1
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input DoB information
    ...     9. In the same time, log in the app same account with the device 2
    ...     10. Click the Service tab
    ...     11. Click the Biocare History
    ...     12. Click the study
    ...     Expected Output:
    ...     the user accesses study report successfully without re-verifying when 2 devices logged in with the same account at the same time.
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-30     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-31: Verify the user accesses study report successfully without re-verifying when 2 devices logged in with the same account and not at the same time.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Change the Dob study report
    ...     4. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app with the device 1
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input DoB information
    ...     9. log in the app same account with the device 2
    ...     10. Click the Service tab
    ...     11. Click the Biocare History
    ...     12. Click the study
    ...     Expected Output:
    ...     the user accesses study report successfully without re-verifying when 2 devices logged in with the same account and not at the same time.
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-31     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-32: Verify the user accesses study report successfully without re-verifying when log in and log out account on the device 1 and log in again account on the device 2.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Change the Dob study report
    ...     4. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app with the device 1
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input DoB information
    ...     9. Click View Report button
    ...     10. Log out the account on the device 1
    ...     9. Log in the app same account with the device 2
    ...     10. Click the Service tab
    ...     11. Click the Biocare History
    ...     12. Click the study
    ...     Expected Output:
    ...     the user accesses study report successfully without re-verifying when log in and log out account on the device 1 and log in again account on the device 2.
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-32     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-33: Verify the user don't input DoB again when the Dob is updated on the Diagnostic portal.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     4. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input recently updated DoB information
    ...     9. Click the View Report button
    ...     Expected Output:
    ...     the DoB used to unlock the study report is updated when changing the DoB while the study is running.
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-33     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-34: Verify the Verification failed modal display when input the Dob doesn't match with the system record
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input the month, day and year doesn't match with the system record
    ...
    ...     Expected Output:
    ...     the Verification failed modal display when input the Dob doesn't match with the system record
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-34     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-35: Verify the Contact support display when click the " Contact support" button
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input the month, day and year don't match with the system record
    ...     9. Click the Contact Support button
    ...
    ...     Expected Output:
    ...     the Contact support display when click the " Contact support" button
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-35     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-36: Verify the unlock study report bottom sheet display again when click the Done button on the Contact support bottom sheet
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input the month, day and year don't match with the system record
    ...     9. Click the Contact Support button
    ...     10. Click the Done button
    ...
    ...     Expected Output:
    ...     the unlock study report bottom sheet display again when click the Done button on the Contact support bottom sheet
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-36     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-37: Verify the Verified failed can't display when click the "Try again" button
     [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Input the month, day and year doesn't match with the system record
    ...     9. Click " Try again" button
    ...
    ...     Expected Output:
    ...     the Verified failed can't display when click the "Try again" button
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-37     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-38: Verify the sanckbar "No internet connection" và Settings button display on the unlock study report bottom sheet when turn off the internet
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. Turn off the internet
    ...     8. Input the DoB
    ...     9. Click View Report button
    ...
    ...     Expected Output:
    ...     the sanckbar "No internet connection" và Settings button display on the unlock study report bottom sheet when turn off the internet
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-38     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-UNLOCKREPORT-39: Verify the sanckbar "Something went wrong. Please try again" when there is an unknown error
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. Start on the study
    ...     3. Stop the study
    ...
    ...     Test Steps:
    ...     1. Log in the Call Center
    ...     2. Choose the study
    ...     3. Create the report
    ...     4. Log in the app
    ...     5. Click the Service tab
    ...     6. Click the Biocare History
    ...     7. Click the study
    ...     8. App have an unknown error
    ...     8. Input the DoB
    ...     9. Click View Report button
    ...
    ...     Expected Output:
    ...     the sanckbar "Something went wrong. Please try again" when there is an unknown error
    [Tags]      BIOC-HEARTREPORT-UNLOCKREPORT-39     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ARTIFACT-01: Verify the Contact support display when click the " Contact support" button
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     1. Login Admin portal
    ...     2. Enable shared-report setting
    ...     3. Login Diagnostic portal
    ...     4. Create study type = MCT
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Connect the device with app
    ...     3. Stop the study
    ...     4. Log in the Callcenter
    ...     5. Click icon "…"
    ...     6. Click "marked as an artifact"
    ...
    ...     Expected Output:
    ...     In-app notif displays report marked as artifact
    [Tags]      BIOC-HEARTREPORT-ARTIFACT-01    BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ARTIFACT-02: Check push-notif of report will be displayed when report is marked as artifact
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     1. Login Admin portal
    ...     2. Enable shared-report setting
    ...     3. Login Diagnostic portal
    ...     4. Create study type = MCT
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Connect the device with app
    ...     3. Stop the study
    ...     4. Log in the Callcenter
    ...     5. Click icon "…"
    ...     6. Click "marked as an artifact"
    ...
    ...     Expected Output:
    ...      Push-notif displays report marked as artifact
    [Tags]      BIOC-HEARTREPORT-ARTIFACT-02     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ARTIFACT-03: Check UI pop-up notification
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     1. Login Admin portal
    ...     2. Enable shared-report setting
    ...     3. Login Diagnostic portal
    ...     4. Create study type = MCT
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Connect the device with app
    ...     3. Stop the study
    ...     4. Log in the Callcenter
    ...     5. Click icon "…"
    ...     6. Click "marked as an artifact"
    ...
    ...     Expected Output:
    ...      User will also receive a 'Heart Monitoring Unsuccessful!' notification
    [Tags]      BIOC-HEARTREPORT-ARTIFACT-03    BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ARTIFACT-04: Check data navigation when clicking notif in-app Biocare Health history
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     1. Login Admin portal
    ...     2. Enable shared-report setting
    ...     3. Login Diagnostic portal
    ...     4. Create study type = MCT
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Connect the device with app
    ...     3. Stop the study
    ...     4. Log in the Callcenter
    ...     5. Click icon "…"
    ...     6. Click "marked as an artifact"
    ...     7. Click notification in Biocare Health history
    ...
    ...     Expected Output:
    ...       The system navigates to the artifact study report in Biocare Health history
    [Tags]      BIOC-HEARTREPORT-ARTIFACT-04     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ARTIFACT-05: Check UI when study ends and report is not triggered
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     1. Login Admin portal
    ...     2. Enable shared-report setting
    ...     3. Login Diagnostic portal
    ...     4. Create study type = MCT
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Connect the device with app
    ...     3. Stop the study = 2 ways (duration end or stop manual). Do not trigger report
    ...
    ...     Expected Output:
    ...     Study report in Biocare Health history will display UI "Data is being processed..."
    [Tags]      BIOC-HEARTREPORT-ARTIFACT-05    BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ARTIFACT-06: Check push-notif of report will be displayed when report is marked as artifact
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     1. Login Admin portal
    ...     2. Enable shared-report setting
    ...     3. Login Diagnostic portal
    ...     4. Create study type = MCT
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Connect the device with app
    ...     3. Stop the study
    ...     4. Log in the Callcenter
    ...     5. Click icon "…"
    ...     6. Click "marked as an artifact"
    ...     7. Login app to check study report
    ...
    ...     Expected Output:
    ...      Display UI marked as artifact report
    [Tags]      BIOC-HEARTREPORT-ARTIFACT-06     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ARTIFACT-07: Check UI pop-up notification
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     1. Login Admin portal
    ...     2. Enable shared-report setting
    ...     3. Login Diagnostic portal
    ...     4. Create study type = MCT
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Connect the device with app
    ...     3. Stop the study
    ...     4. Log in the Callcenter
    ...     5. Click icon "…"
    ...     6. Click "marked as an artifact"
    ...
    ...     Expected Output:
    ...      User will also receive a 'Heart Monitoring Unsuccessful!' notification
    [Tags]      BIOC-HEARTREPORT-ARTIFACT-07    BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ARTIFACT-08: Disable shared-report setting and Check push-notif of report will be displayed when report is marked as artifact
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     1. Login Admin portal
    ...     2. Disable shared-report setting
    ...     3. Login Diagnostic portal
    ...     4. Create study type = MCT
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Connect the device with app
    ...     3. Stop the study
    ...     4. Log in the Callcenter
    ...     5. Click icon "…"
    ...     6. Click "marked as an artifact"
    ...
    ...     Expected Output:
    ...       No push notif of report will appear when report is marked as artifact
    [Tags]      BIOC-HEARTREPORT-ARTIFACT-08     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ARTIFACT-09: Check study reprot in Biocare Health history
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     1. Login Admin portal
    ...     2. Disable shared-report setting
    ...     3. Login Diagnostic portal
    ...     4. Create study type = MCT
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Connect the device with app
    ...     3. Stop the study
    ...
    ...     Expected Output:
    ...      Study report will still appear in Biocare Health history on app
    [Tags]      BIOC-HEARTREPORT-ARTIFACT-09    BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ARTIFACT-10: Disable shared-report setting and check UI when the study ends and the report has not been triggered
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Login Admin portal
    ...     2. Enable shared-report setting
    ...     3. Login Diagnostic portal
    ...     4. Create study type = MCT
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Connect the device with app
    ...     3. Stop the study
    ...     4. Log in the Callcenter
    ...     5. Click icon "…"
    ...     6. Click "marked as an artifact"
    ...     7. Login app to check study report
    ...
    ...     Expected Output:
    ...     Study report in Biocare Health history will display UI "Your physician will receive your report shortly."
    [Tags]      BIOC-HEARTREPORT-ARTIFACT-10     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ARTIFACT-11: Disable shared-report setting and check UI when report is marked as artifact
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     1. Login Admin portal
    ...     2. Enable shared-report setting
    ...     3. Login Diagnostic portal
    ...     4. Create study type = MCT
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Connect the device with app
    ...     3. Stop the study
    ...     4. Log in the Callcenter
    ...     5. Click icon "…"
    ...     6. Click "marked as an artifact"
    ...     7. Login app to check study report
    ...
    ...     Expected Output:
    ...      displays the UI of disable share report "Your physician will receive your report shortly"
    [Tags]      BIOC-HEARTREPORT-ARTIFACT-11     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ARTIFACT-12: Check report in-app notif will be displayed when report is unmarked as artifact
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     1. Login Admin portal
    ...     2. Enable shared-report setting
    ...     3. Login Diagnostic portal
    ...     4. Create study type = MCT
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Connect the device with app
    ...     3. Stop the study
    ...     4. Log in the Callcenter
    ...     5. Click icon "…"
    ...     6. Click "unmarked as artifact"
    ...
    ...     Expected Output:
    ...      Report in-app notif will not appear when report is unmarked as artifact
    [Tags]      BIOC-HEARTREPORT-ARTIFACT-12    BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ARTIFACT-13: Check push notif of report when report is unmarked as artifact
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     1. Login Admin portal
    ...     2. Disable shared-report setting
    ...     3. Login Diagnostic portal
    ...     4. Create study type = MCT
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Connect the device with app
    ...     3. Stop the study
    ...     4. Log in the Callcenter
    ...     5. Click icon "…"
    ...     6. Click "unmarked as artifact"
    ...
    ...     Expected Output:
    ...       No push-notif of report when report is unmarked as artifact
    [Tags]      BIOC-HEARTREPORT-ARTIFACT-13     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ARTIFACT-14: Check UI when study ends and report unmarked as artifact has not been triggered
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     1. Login Admin portal
    ...     2. Disable shared-report setting
    ...     3. Login Diagnostic portal
    ...     4. Create study type = MCT
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Connect the device with app
    ...     3. Stop study = 2 ways (duration end or stop manual). Do not trigger report
    ...
    ...     Expected Output:
    ...      Study report in Biocare Health history will display UI "Data is being processed..."
    [Tags]      BIOC-HEARTREPORT-ARTIFACT-14    BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ARTIFACT-15: Check data study report when changing status
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Login Admin portal
    ...     2. Enable shared-report setting
    ...     3. Login Diagnostic portal
    ...     4. Create study type = MCT
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Connect the device with app
    ...     3. Stop the study
    ...     4. Log in the Callcenter
    ...     5. Click icon "…"
    ...     6. Click "marked as an artifact"
    ...     7. Change status report is marked unmarked as artifact
    ...
    ...     Expected Output:
    ...      Data is displayed as normal based on status of report
    [Tags]      BIOC-HEARTREPORT-ARTIFACT-15     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ARTIFACT-16: Check push-notif of report when changing status
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     1. Login Admin portal
    ...     2. Enable shared-report setting
    ...     3. Login Diagnostic portal
    ...     4. Create study type = MCT
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Connect the device with app
    ...     3. Stop study
    ...     4. Log in the call center
    ...     5. Create the report
    ...     6. Change status report is marked unmarked as artifact
    ...
    ...     Expected Output:
    ...      Push-notif of report will be displayed as normal based on status of report
    [Tags]      BIOC-HEARTREPORT-ARTIFACT-16    BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ARTIFACT-17: Disable shared-report setting and check notif in-app of report will be shown when report is marked as unmarked as artifact
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Login Admin portal
    ...     2. Enable shared-report setting
    ...     3. Login Diagnostic portal
    ...     4. Create study type = MCT
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Connect the device with app
    ...     3. Stop the study
    ...     4. Log in the Callcenter
    ...     5. Click icon "…"
    ...     6. Click " Unmarked as an artifact"
    ...
    ...     Expected Output:
    ...     Not show notif in-app of report when report is unmarked as artifact
    [Tags]      BIOC-HEARTREPORT-ARTIFACT-17     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ARTIFACT-18: Check push-notif of report when changing status
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     1. Login Admin portal
    ...     2. Disable shared-report setting
    ...     3. Login Diagnostic portal
    ...     4. Create study type = MCT
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Connect the device with app
    ...     3. Stop the study
    ...     4. Log in the Callcenter
    ...     5. Click icon "…"
    ...     6. Click " Unmarked as an artifact"
    ...
    ...     Expected Output:
    ...     No push notif of report will appear when report is unmarked as artifact
    [Tags]      BIOC-HEARTREPORT-ARTIFACT-18    BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTREPORT-ARTIFACT-19: Disable shared-report setting and check notif in-app of report will be shown when report is marked as unmarked as artifact
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Login Admin portal
    ...     2. Disable shared-report setting
    ...     3. Login Diagnostic portal
    ...     4. Create study type = MCT
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Connect the device with app
    ...     3. Stop the study
    ...     4. Log in the Callcenter
    ...     5. Click icon "…"
    ...     6. Click " Unmarked as an artifact"
    ...
    ...     Expected Output:
    ...     Not push notif of report when report is unmarked as artifact
    [Tags]      BIOC-HEARTREPORT-ARTIFACT-19     BIOC-2.2.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${APP_NODE}       Get Device Node
    Import Library    project_biocare_app/lib/mapp/Common.py     ${APP_NODE}     ${ENV}
    Start Biocare App
    ${USER}     Get Config Param    USER
    Sign In Biocare App    email=${USER}[username]      password=${USER}[password]
    ${RELEASE_VERSION}     Get Release Version
    Set Suite Metadata     version     ${RELEASE_VERSION}

SUITE TEARDOWN
    Quit All
