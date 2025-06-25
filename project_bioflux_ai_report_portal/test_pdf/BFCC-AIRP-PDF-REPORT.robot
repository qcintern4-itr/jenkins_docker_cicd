*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-PDF-REPORT
Metadata    owner   Trinh Nguyen
Library     corelib/AssertionExtension.py
Library     Collections
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_ai_report_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py     ${ENV}
Library     project_bioflux_ai_report_portal/lib/web/Reports.py
Library     project_bioflux_ai_report_portal/lib/web/Common.py
Library     project_bioflux_ai_report_portal/lib/web/Studies.py
Library     project_bioflux_ai_report_portal/lib/web/EcgEvent.py
Library     project_bioflux_ai_report_portal/lib/web/PdfReport.py
Library       project_bioflux_clinic_portal/lib/web/Studies.py
Library       project_bioflux_clinic_portal/lib/web/StudyDetails.py
Library       project_bioflux_clinic_portal/lib/web/Common.py
Library       project_bioflux_ai_report_portal/lib/web/StudyManagement.py
Library       project_bioflux_callcenter_portal/lib/web/EventDetails.py
Library       project_bioflux_ai_report_portal/lib/web/StripsManagement.py

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BFCC-AIRP-PDF-REPORT  web
Test Timeout    30m

*** Test Cases ***

BFCC-AIRP-PDF-REPORT-REGEN-01: Verify the We ran into a problem is displayed when it has an issue
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update Date: 9/27/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-REGEN-01       AIRP-1.6.7       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-REGEN-02: Verify the close button on the We ran into a problem modal is working propely
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update Date: 9/27/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-REGEN-02       AIRP-1.6.7       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-REGEN-03: Verify the Generate button on the We ran into a problem modal is working propely
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update Date: 9/27/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-REGEN-03       AIRP-1.6.7       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-VIEW-01: View all information on the PDF Report tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     - PDF Viewer
    ...     - Facility notes
    ...     - Findings
    ...     - Update findings button
    ...     - Report section
    ...     - ECG captured strips configuration
    ...     - Download button
    ...     - Upload button
    ...     - Copy report to Call center button
    ...     - Generate report button
    ...

    [Tags]      BFCC-AIRP-PDF-REPORT-VIEW-01       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate Airp Tab     tab=PDF Report
#    Wait For Pdf Viewer Available
#    Get Image Pdf Report Page
#    ${expected_result}           Check Interim Report Summary        image_name_original=pdf_report_page        image_name_compare=pdf_report_page
#    Run Keyword And Continue On Failure    Should Be True    ${expected_result}

BFCC-AIRP-PDF-REPORT-VIEW-02: Cannot view PDF report information in case study data are artifacts
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]      BFCC-AIRP-PDF-REPORT-VIEW-02       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-FINDINGS-01: Verify that the system replaces dashes in the Findings section with a bullet point count format
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update Date: 8/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-FINDINGS-01       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-FINDINGS-LINE1-01: Verify that the Predominant Rhythm is correctly displayed in Findings after stopping the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that, after the study is stopped, the PDF report correctly displays the Predominant Rhythm in the Findings section
    ...    - The rhythm must cover more than 50% of total study time to be considered predominant
    ...    - Additional findings such as First Degree AV Block and IVCD should also be included if present
    ...
    ...     Precondition:
    ...    - A completed (stopped) study
    ...    - One rhythm type occupies more than 50% of the study duration
    ...
    ...     Test Steps:
    ...    1. Navigate to the PDF Report page of a stopped study
    ...    2. Scroll to the Findings section
    ...    3. Locate the first line showing the Predominant Rhythm
    ...
    ...     Expected Results:
    ...    1. The Predominant Rhythm is shown correctly based on rhythm burden > 50%
    ...    2. If First Degree AV Block or IVCD is present, they appear on the same line
    ...    3. Example: "Predominant Rhythm was Sinus Rhythm with First Degree AV Block"
    ...
    ...     **Others**
    ...     Update Date: 8/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-FINDINGS-LINE1-01       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-FINDINGS-LINE1-02: Verify that regenerating findings after beat/event update reflects the new Predominant Rhythm
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that if the user updates beats or rhythm-related events, the Predominant Rhythm in Findings will update accordingly after regenerating
    ...    - This update should also be reflected in the Findings section of the Cover Page in the regenerated PDF report
    ...
    ...     Precondition:
    ...    - A completed (stopped) study
    ...
    ...     Test Steps:
    ...    1. Navigate to the Beat or ECG Event page
    ...    2. Update beats or rhythm events in a way that affects the overall rhythm burden (e.g., reclassify beats to a different rhythm type so that it becomes the new dominant rhythm)
    ...    3. Navigate to the Findings section in the Report Editing Page
    ...    4. Click the "Regenerate Findings" button
    ...    5. Click the "Continue" button when prompted
    ...    6. Wait for the system to regenerate new findings
    ...    7. Observe the updated Predominant Rhythm line
    ...    8. Regenerate the full PDF report
    ...    9. Check the Findings section on the Cover Page of the updated report
    ...
    ...     Expected Results:
    ...    1. The new Predominant Rhythm reflects the updated rhythm burden
    ...    2. The Findings line in the UI updates accordingly
    ...    3. The same updated line appears in the Cover Page → Findings section of the regenerated PDF report
    ...
    ...     **Others**
    ...     Update Date: 8/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-FINDINGS-LINE1-02       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-FINDINGS-LINE1-03: Verify that Predominant Rhythm displays correctly when it is <50% of the study's burden
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when no rhythm covers more than 50% of the study's burden, the Predominant Rhythm will either display as "Predominant Rhythm was Sinus Rhythm"
    ...
    ...     Precondition:
    ...    - A completed (stopped) study where no rhythm exceeds 50% of the burden
    ...
    ...     Test Steps:
    ...    1. Navigate to the PDF Report page of a stopped study
    ...    2. Scroll to the Findings section
    ...    3. Locate the first line showing the Predominant Rhythm
    ...
    ...     Expected Results:
    ...    1. The Predominant Rhythm displays as "Predominant Rhythm was Sinus Rhythm"
    ...
    ...     **Others**
    ...     Update Date: 8/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-FINDINGS-LINE1-03       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-FINDINGS-LINE1-04: Verify that Predominant Rhythm displays as "Predominant Rhythm was Sinus Rhythm" when burden is <50% after updating beats/events
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when the user updates beats or ECG events, causing the Predominant Rhythm of the study to have a burden <50%, the "Predominant Rhythm" line in the Findings section should display as "Predominant Rhythm was Sinus Rhythm"
    ...
    ...     Precondition:
    ...    - A completed (stopped) study
    ...
    ...     Test Steps:
    ...    1. The user updates beats or ECG events that affect the overall rhythm burden, making no rhythm exceed 50% of the total burden.
    ...    2. After the update, the user navigates back to the Findings section in the Report Editing page
    ...    3. Check the "Predominant Rhythm" line in the Findings section
    ...
    ...     Expected Results:
    ...    1. After the update, the Findings section should display "Predominant Rhythm was Sinus Rhythm," indicating no rhythm dominates the study by more than 50%
    ...
    ...     **Others**
    ...     Update Date: 8/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-FINDINGS-LINE1-04       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-FINDINGS-LINE2-01: Verify that Min/Max/Avg HR values in Findings match HR Summary page after study completed
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that after the study ends, the Min, Max, and Avg HR values in the Findings section match those displayed in the HR Summary page
    ...
    ...     Precondition:
    ...    - A completed (stopped) study
    ...
    ...     Test Steps:
    ...    1.Navigate to the HR Summary page.
    ...    2. Observe the Min HR Event, Max HR Event, and Avg HR values on the HR Summary page.
    ...    3. Navigate to the Findings section of the PDF report.
    ...    4. Verify that the Min, Max, and Avg HR values in the Findings section match the values from the HR Summary page.
    ...
    ...     Expected Results:
    ...    1. The Min HR, Max HR, and Avg HR values in the Findings section should match the corresponding values in the HR Summary page
    ...
    ...     **Others**
    ...     Update Date: 8/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-FINDINGS-LINE2-01       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#update them tcs lien quan toi HR Summary

BFCC-AIRP-PDF-REPORT-FINDINGS-LINE2-02: Verify that Min/Max/Avg HR values in Findings match ECG Event page after study completed
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that after the study ends, the Min and Max HR values in the Findings section match those displayed in the ECG Event page
    ...
    ...     Precondition:
    ...    - A completed (stopped) study
    ...
    ...     Test Steps:
    ...    1. Navigate to the ECG Event page
    ...    2. Observe the Min HR and Max HR values on the respective tabs (Min HR tab and Max HR tab)
    ...    3. Navigate to the Findings section of the PDF report.
    ...    4. Verify that the Min, Max, and Avg HR values in the Findings section match the values from the ECG Event page.
    ...
    ...     Expected Results:
    ...    1. The Min HR and Max HR values in the Findings section should match the corresponding values in the ECG Event page
    ...
    ...     **Others**
    ...     Update Date: 8/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-FINDINGS-LINE2-02       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-FINDINGS-LINE2-03: Verify that Min/Max HR values in Findings match Strip Management after study completed
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that after the study ends, the Min and Max HR values in the Findings section match those displayed in the Strip Management page, where technician comments indicate corresponding HR values
    ...
    ...     Precondition:
    ...    - A completed (stopped) study
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page.
    ...    2. Observe the HR values for Min HR and Max HR in the technician comments section.
    ...    3. Navigate to the Findings section of the PDF report.
    ...    4. Verify that the Min HR and Max HR values in the Findings section match the values from the Strip Management page
    ...
    ...     Expected Results:
    ...    1. The Min HR and Max HR values in the Findings section should match the corresponding values in the Strip Management page
    ...
    ...     **Others**
    ...     Update Date: 8/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-FINDINGS-LINE2-03       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-FINDINGS-LINE2-04: Verify that Min/Max/Avg HR values in Findings match Cover Page and Test Summary page after study completed
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that after the study ends, the Min, Max, and Avg HR values in the Findings section match those displayed in the Heart Rate section of the Cover Page and Test Summary page in the PDF report
    ...
    ...     Precondition:
    ...    - A completed (stopped) study
    ...
    ...     Test Steps:
    ...    1. Navigate to the Cover Page of the PDF report.
    ...    2. Observe the Min, Max, and Avg HR values in the Heart Rate section.
    ...    3. Navigate to the Test Summary page of the PDF report.
    ...    4. Observe the Min, Max, and Avg HR values in the Heart Rate section.
    ...    5. Navigate to the Findings section of the PDF report.
    ...    6. Verify that the Min, Max, and Avg HR values in the Findings section match those in the Heart Rate sections on the Cover Page and Test Summary page
    ...
    ...     Expected Results:
    ...    1. The Min, Max, and Avg HR values in the Findings section should match the corresponding values in the Cover Page and Test Summary page
    ...
    ...     **Others**
    ...     Update Date: 8/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-FINDINGS-LINE2-04       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-FINDINGS-LINE2-05: Verify that Min/Max HR values in Findings update correctly after modifying ECG Event entries
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that when the user modifies entries in the ECG Event page (e.g., changes Min or Max HR values), the updated values are reflected in the Findings section after regeneration
    ...
    ...     Precondition:
    ...    - A completed (stopped) study
    ...
    ...     Test Steps:
    ...    1. Navigate to the ECG Event page
    ...    2. Modify the HR value in either the Min HR tab or Max HR tab (e.g., reclassify or delete an event so that a new event becomes the min/max)
    ...    3. Go to the Report Editing page
    ...    4. Click the "Regenerate Findings" button and proceed
    ...    5. Regenerate the full PDF report
    ...    6. Check the Findings section of the regenerated report
    ...
    ...     Expected Results:
    ...    1. The new Min or Max HR value from ECG Event page is shown in the Findings section
    ...    2. The change is also reflected in the PDF's Cover Page and Test Summary page
    ...
    ...     **Others**
    ...     Update Date: 8/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-FINDINGS-LINE2-05       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-FINDINGS-LINE2-06: Verify Min/Max/Avg HR values are synchronized across Findings, Cover Page, Test Summary Page, HR Summary, ECG Event, and Strip Management
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that after regenerating findings (following any HR-related updates), the updated values for Min/Max/Avg HR are reflected consistently across:
    ...     + Findings section
    ...     + Cover Page → Heart Rate section
    ...     + Test Summary Page → Heart Rate section
    ...     + HR Summary page
    ...     + ECG Event page
    ...     + Strip Management page
    ...
    ...     Precondition:
    ...    - A stopped study with existing data in all the related pages above.
    ...
    ...     Test Steps:
    ...    1.Update beat or ECG event data so that Min, Max HR or Avg HR changes.
    ...    2. Navigate to the Report Editing page and regenerate findings.
    ...    3. Regenerate the PDF report.
    ...    4. Navigate to:
    ...    - Findings section
    ...    - Cover Page → Heart Rate section
    ...    - Test Summary Page → Heart Rate section
    ...    - HR Summary page
    ...    - Event page (Min HR tab / Max HR tab)
    ...    - Strip Management page (check strips where bpm is shown)
    ...    5. Record and compare the Min/Max/Avg HR values from each of the sections above
    ...
    ...     Expected Results:
    ...    1. Min/Max/Avg HR values are identical across all pages and sections listed.
    ...    2. Strip Management shows updated bpm values that match updated HR events.
    ...    3. No mismatch between regenerated PDF and UI pages
    ...
    ...     **Others**
    ...     Update Date: 8/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-FINDINGS-LINE2-06       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-FINDINGS-LINE2-07: Verify that Min/Max/Avg HR values show as "N/A" across Findings, PDF, and related pages when HR data becomes unavailable
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that if all beat or event data used to determine Min/Max/Avg HR is removed or reclassified such that no valid HR data remains, the corresponding fields display "N/A" consistently across all related sections and pages:
    ...     + Findings
    ...     + Cover Page → Heart Rate
    ...     + Cover Page → Heart Rate
    ...     + HR Summary
    ...     + ECG Event
    ...     + Strip Management
    ...
    ...     Precondition:
    ...    - A stopped study where beat/event data can be modified
    ...
    ...     Test Steps:
    ...    1. Navigate to the Beat tab and/or ECG Event tab.
    ...    2. Delete or reclassify all entries that contribute to HR calculations (e.g., remove all Max HR and Min HR events, or set them to types not counted).
    ...    3. Navigate to Report Editing → Regenerate Findings → Click Continue.
    ...    4. Regenerate the full PDF report.
    ...    5. Go to the following locations and observe HR values:
    ...    - Findings section
    ...    - Cover Page → Heart Rate
    ...    - Test Summary Page → Heart Rate
    ...    - HR Summary page
    ...    - ECG Event page
    ...    - Strip Management
    ...
    ...     Expected Results:
    ...    1. Min/Max/Avg HR values display as "N/A" in:
    ...    - Findings
    ...    - Cover Page → Heart Rate
    ...    - Test Summary Page → Heart Rate
    ...    - HR Summary
    ...    - ECG Event page (Min HR and Max HR tabs are empty or not shown)
    ...    No strips are displayed in the Strip Management page
    ...
    ...     **Others**
    ...     Update Date: 8/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-FINDINGS-LINE2-07       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-FINDINGS-LINE3-01: Verify that the number of Symptomatic Events in Findings matches the number of manual events in the Include in Report tab in Strip Management after stopping the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that, after a study is stopped, the number of Symptomatic Events (manual events with 'Include in report' enabled) displayed in the Findings section is correct and matches the
    ...    number of events in the Include in report tab in the Strip Management page
    ...
    ...     Precondition:
    ...    - A stopped study with manual events marked as "Include in report"
    ...
    ...     Test Steps:
    ...    1. Stop the study.
    ...    2. Navigate to the PDF Report page.
    ...    3. Scroll to the Findings section and observe the number of Symptomatic Events (line 3).
    ...    4. Navigate to the Strip Management page and view the manual events in the Include in report tab.
    ...    5. Compare the count of events in the Findings section with the Include in report tab in Strip Management.


    ...
    ...     Expected Results:
    ...    1. The number of Symptomatic Events in the Findings section matches the number of events listed in the Include in report tab in Strip Management
    ...
    ...     **Others**
    ...     Update Date: 8/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-FINDINGS-LINE3-01       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-FINDINGS-LINE3-02: Verify that excluding an event from the report in Strip Management reduces the count of Symptomatic Events in Findings
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when a manual event is excluded from the report (by unchecking the 'Include event in report' box), the count of Symptomatic
    ...    Events in the Findings section is reduced accordingly after regenerating the findings and report
    ...
    ...     Precondition:
    ...    - A stopped study with at least one manual event included in the report
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page.
    ...    2. Locate a manual event that is marked as "Include event in report".
    ...    3. Uncheck the 'Include event in report' checkbox for that event.
    ...    4. Navigate to the Report Editing page and click Regenerate Findings.
    ...    5. Regenerate the full PDF report.
    ...    6. Observe the Symptomatic Events count in the Findings section.
    ...
    ...     Expected Results:
    ...    1. The Symptomatic Events count in the Findings section should decrease by one, reflecting the exclusion of the event from the report
    ...
    ...     **Others**
    ...     Update Date: 8/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-FINDINGS-LINE3-02       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-FINDINGS-LINE3-03: Verify that including an event in the report in Strip Management increases the count of Symptomatic Events in Findings


    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when a manual event is included in the report (by checking the 'Include event in report' box), the count of Symptomatic Events
    ...    in the Findings section increases accordingly after regenerating the findings and report
    ...
    ...     Precondition:
    ...    - A stopped study with at least one manual event included in the report
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page.
    ...    2. Locate a manual event that is not marked as "Include event in report".
    ...    3. Check the 'Include event in report' checkbox for that event.
    ...    4. Navigate to the Report Editing page and click Regenerate Findings.
    ...    5. Regenerate the full PDF report.
    ...    6. Observe the Symptomatic Events count in the Findings section
    ...
    ...     Expected Results:
    ...    1. The Symptomatic Events count in the Findings section should increase by one, reflecting the inclusion of the event in the report
    ...
    ...     **Others**
    ...     Update Date: 8/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-FINDINGS-LINE3-03       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#se update sau ơ dong 4, 5, 6, 7
*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_ai_report_portal/lib/web/Common.py       ${BROWSER_NODE}        ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Reports.py      ${BROWSER_NODE}        ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/EcgEvent.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/PdfReport.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Studies.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/StudyManagement.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/EventDetails.py           ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/StripsManagement.py           ${BROWSER_NODE}     ${ENV}
    ${USERS}                Get Config Param    NEW_USERS
    ${STUDY_ID}             Get Config Param    STUDY_ID
    ${CURRENT_USER}         Set Variable        ${USERS}[callcenter_airp_pdf]
    ${STUDY_ID_COMPLETED}      Set Variable        ${STUDY_ID}[study_id_completed]
    Navigate To Callcenter Sign In Page
    ${TOKEN}                Sign In Callcenter  ${CURRENT_USER}[username]      ${CURRENT_USER}[password]
    Set Suite Variable      ${TOKEN}
    Set Global Variable     ${STUDY_ID_COMPLETED}
    Navigate To Tab Menu      Studies
    Navigate To Subtab Menu        Completed
    Filter Studies    search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_pdf_report]
    Manage Complete Study On              row=1
    Navigate To Studies Type        Reports
    View Completed New Report Status On          row=1
    Switch Tab
    ${RELEASE_VERSION}      Get Release Version Aireport
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

Navigate to ai report page
    Navigate To Tab Menu      Studies
    Navigate To Subtab Menu        Completed
    Filter Studies    search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_pdf_report]
    Manage Complete Study On              row=1
    Navigate To Subtab Menu     Reports
    View Completed New Report Status On          row=1
    Switch Tab

Navigate to study management page
    Navigate To Tab Menu      Studies
    Navigate To Subtab Menu        Completed
    Filter Studies    search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_pdf_report]
    Manage Complete Study On              row=1

Download the pdf file on pdf report
    Navigate Airp Tab     tab=PDF Report
    Wait For Pdf Viewer Available
    Generate Pdf Report
    Download File Pdf

Stop Processing
    Stop Ai Processing
    ${msg}      Get Message Stop Successful
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}    Stop AI processing success

Add new the event
    Edit Artifact Event      is_hr_chart=${True}         x_offset_start_time=350      y_offset_start_time=20
    Navigate To Add New Event
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-400     y_offset_start_time=10      x_offset_end_time=300      y_offset_end_time=100
    Edit Artifact Event      is_submit=${True}
    Filter Header    is_save=${True}
#    ${panel_infor}          Get Panel Information Event
#    ${time_duration}        Evaluate    '${panel_infor}[Duration]'.replace('s', '')
#    ${new_time}             Conversion Duration Time    duration_time=${time_duration}
#    Set Global Variable    ${new_time}

Delete the afib event on Beats
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Edit Artifact Event      is_hr_chart=${True}         x_offset_start_time=350      y_offset_start_time=20
    Filter Header       is_deleted=${True}      is_save=${True}

Select start and end time override
    Edit Artifact Event      is_start_time=${True}        x_offset_start_time=-450      y_offset_start_time=10
    Filter Thumbnail Option        jum_to_end_time=${True}
    Edit Artifact Event      is_end_time=${True}     x_offset_end_time=300      y_offset_end_time=100
    Edit Artifact Event      is_submit=${True}
    Filter Header    is_save=${True}

Change event duration
    Change Event Duration Airp
    Edit Artifact Event      is_start_time=${True}        x_offset_start_time=-450      y_offset_start_time=10
    Edit Artifact Event      is_end_time=${True}     x_offset_end_time=150      y_offset_end_time=100
    Edit Artifact Event      is_submit=${True}
    Filter Header    is_save=${True}

Add new artifact
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=Artifact
    Edit Artifact Event      is_start_time=${True}        x_offset_start_time=-460      y_offset_start_time=10
    Edit Artifact Event      is_end_time=${True}     x_offset_end_time=250      y_offset_end_time=100
    Filter Thumbnail Option          is_add=${True}
    Filter Header    is_save=${True}

Delete the "${events_type}" event on ECG events
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    ${events_type}
    Edit Artifact Event      is_hr_chart=${True}         x_offset_start_time=350      y_offset_start_time=20
    Filter Thumbnail Option    is_deleted_event=${True}
    Filter Header      is_save=${True}

Get value min heart rate on beats page
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab     HR summary
    ${thumbnail}         Get All Thumbnail Hr Summary
    ${min_hr}           Evaluate    [item['Min'] for item in ${thumbnail}]
    ${actual_min_hr}           Evaluate    min(${min_hr})
    Set Global Variable    ${actual_min_hr}
    [Return]    ${actual_min_hr}

Get value max heart rate on beats page
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab     HR summary
    ${thumbnail}         Get All Thumbnail Hr Summary
    ${max_hr}           Evaluate    [item['Max'] for item in ${thumbnail}]
    ${actual_max_hr}           Evaluate    max(${max_hr})
    Set Global Variable    ${actual_max_hr}
    [Return]    ${actual_max_hr}

Get value "${value_name}" heart rate on ecg event page
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    ${value_name}
    ${panel_infor}         Get Panel Information Event
    ${actual_ecg_event}           Evaluate    int("${panel_infor}[${value_name}]".split()[0])
    Set Global Variable    ${actual_ecg_event}
    [Return]    ${actual_ecg_event}

Get value "${value_name}" heart rate on strips management page
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=${value_name}
    ${infor_box}       Get Strips Management Box
    ${strip_management_min_hr}           Evaluate     int("${infor_box}[Technician comment]".split()[3])
    Set Global Variable    ${strip_management_min_hr}
    [Return]    ${strip_management_min_hr}

Get value "${value_name}" heart rate on cover page
    ${data_cover_page}     Read File Pdf Pages On     page_number=0
    ${value_cover_page}     Get Value In Cover File Pdf   data_pdf=${data_cover_page}
    ${expected_cover_page}     Evaluate    int("${value_cover_page}[${value_name}]".split()[0])
    Set Global Variable     ${expected_cover_page}
    [Return]    ${expected_cover_page}

Get value "${value_name}" heart rate on summary page
    ${data_summary_page}     Read File Pdf Pages On     page_number=2
    ${values_summary_page}     Get Value In Summary File Pdf       data_pdf=${data_summary_page}
    ${expected_summary_page}     Evaluate    int("${values_summary_page}[${value_name}]".split()[0])
    Set Global Variable     ${expected_summary_page}
    [Return]    ${expected_summary_page}

Edit min hr on beats page
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab     HR summary
    View Thumbnail Hr Summary On    row=2
    Edit Hr On Hr Summary    min_hr=10      is_save=${True}
    Filter Header    is_save=${True}
    ${thumbnail}         Get All Thumbnail Hr Summary
    ${min_hr}           Evaluate    [item['Min'] for item in ${thumbnail}]
    ${actual_min_hr}           Evaluate    min(${min_hr})
    Set Global Variable     ${actual_min_hr}
    [Return]    ${actual_min_hr}

Edit max hr on beats page
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab     HR summary
    View Thumbnail Hr Summary On    row=2
    Edit Hr On Hr Summary    max_hr=999      is_save=${True}
    Filter Header    is_save=${True}
    ${thumbnail}         Get All Thumbnail Hr Summary
    ${max_hr}           Evaluate    [item['Max'] for item in ${thumbnail}]
    ${actual_max_hr}           Evaluate    max(${max_hr})
    Set Global Variable     ${actual_max_hr}
    [Return]    ${actual_max_hr}

Edit avg hr on beats page
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab     HR summary
    View Thumbnail Hr Summary On    row=2
    Edit Hr On Hr Summary    avg_hr=40      is_save=${True}
    Filter Header    is_save=${True}
    ${thumbnail}         Get All Thumbnail Hr Summary
    ${avg_hr}           Evaluate    [item['Avg'] for item in ${thumbnail}]
    ${sum_avg_hr}       Evaluate    round(sum(${avg_hr}) / len(${avg_hr}), 1)
    ${actual_avg_hr}    Conversion Duration Time    duration_time=${sum_avg_hr}
    Set Global Variable     ${actual_avg_hr}
    [Return]    ${actual_avg_hr}

Delete the "${event_type}" event on ECG events by button
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    ${event_type}
    Filter Thumbnail Option        is_deleted_event=${True}
    Filter Header    is_save=${True}

Mark the "${event_type}" event on ECG events
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    ${event_type}
    Filter Thumbnail Option        is_mark_as_artifact=${True}
    Filter Header    is_save=${True}

Add new "${event_type}" event on ECG events
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    ${event_type}
    Add New The Event

Add new event on Beats
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Add New The Event

Change "${event_type}" event to "${other_event_type}" event on ECG events
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    ${event_type}
    Filter Thumbnail Option        is_change_event_type=${True}     select_event_type=${other_event_type}       is_save=${True}
    Filter Header    is_save=${True}

Change "${event_type}" event duration on ECG events
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    ${event_type}
    Filter Thumbnail Option        change_event_duration=${True}
    Select Start And End Time Override
    Filter Header    is_save=${True}

Verify the total afib episodes on pdf page
    [Arguments]     ${actual_total_afib}
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${expected_total_afib_cover}      Evaluate    int(${test_summary}[total_afib_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_afib_cover}        ${actual_total_afib}
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_afib_summary}      Evaluate    int(${test_summary}[total_afib_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_afib_summary}        ${expected_total_afib_cover}

Verify the value avg hr on pdf page
    [Arguments]     ${actual_avg_hr}
    Download The Pdf File On Pdf Report
    ${data_cover_page}     Read File Pdf Pages On     page_number=0
    ${value_cover_page}     Get Value In Cover File Pdf   data_pdf=${data_cover_page}
    ${expected_avg_hr}     Evaluate    int("${value_cover_page}[avg_hr])".split()[0])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_avg_hr}        ${actual_avg_hr}
    ${data_summary_page}     Read File Pdf Pages On     page_number=2
    ${values_summary_page}     Get Value In Summary File Pdf       data_pdf=${data_summary_page}
    ${expected_avg_hr_summary_page}     Evaluate    int("${values_summary_page}[avg_hr])".split()[0])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_avg_hr_summary_page}     ${actual_avg_hr}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_avg_hr_summary_page}     ${expected_avg_hr}
