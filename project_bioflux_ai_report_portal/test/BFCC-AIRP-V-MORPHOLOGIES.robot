*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-V-MORPHOLOGIES
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
Force Tags      BFCC-AIRP-V-MORPHOLOGIES   web
Test Timeout    15m

*** Test Cases ***
BFCC-AIRP-V-MORPHOLOGIES-VIEW-01: Verify the V Morphologies page displays all information correctly
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Ensure that the V Morphologies page displays all relevant information correctly and fully.
    ...
    ...     Precondition:
    ...    1. A valid study with V beats
    ...    2. At least 1 V morphology template is detected by AI
    ...
    ...
    ...     Test Steps:
    ...    1. Navigate to the Report Editing Page of a study
    ...    2. Go to the "V Morphologies" page
    ...    3. Observe the layout and data display of the page
    ...
    ...
    ...     Expected Results:
    ...     1.Each V Template must show:
    ...     - A unique identifier (sorted by beat count, max 10 templates shown, rest under "Unclassified")
    ...     - Waveform preview (average of assigned beats)
    ...     - Beat count
    ...     - List of assigned V beats
    ...     2. Template Actions and Features:
    ...     - View individual beats
    ...     - Change beat type
    ...     - Delete beat / bulk edit
    ...     - Mark as Reviewed
    ...     - Swap Template
    ...     - Include / Exclude in report
    ...     - Sync/save actions
    ...     3. Additional Notes:
    ...     - Unclassified beats cannot be marked as reviewed or included in report
    ...     - Template view updates dynamically when beats are reassigned; changes apply only after saving
    ...
    ...     **Others**
    ...     Create date: 3/13/2025 - Trinh Nguyen
    ...     Update date: 4/21/2025 - Trinh Nguyen
    ...     Auto create: 04/21/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-VIEW-01       AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${expected_template}    Check Template Displayed
    Run Keyword And Continue On Failure    Should Be True    ${expected_template}[Identifier]
    Run Keyword And Continue On Failure    Should Be True    ${expected_template}[Waveform]
    Run Keyword And Continue On Failure    Should Be True    ${expected_template}[Beat Count]
    Run Keyword And Continue On Failure    Should Be True    ${expected_template}[Swap Template]
    Run Keyword And Continue On Failure    Should Be True    ${expected_template}[Mark as reviewed]
    Run Keyword And Continue On Failure    Should Be True    ${expected_template}[Include in report]
    Run Keyword And Continue On Failure    Should Be True    ${expected_template}[Beat N]
    Run Keyword And Continue On Failure    Should Be True    ${expected_template}[Beat S]
    Run Keyword And Continue On Failure    Should Be True    ${expected_template}[Beat V]
    Run Keyword And Continue On Failure    Should Be True    ${expected_template}[Beat Q]
    Run Keyword And Continue On Failure    Should Be True    ${expected_template}[Delete Beat]
    Run Keyword And Continue On Failure    Should Be True    ${expected_template}[List of Beats]
    Run Keyword And Continue On Failure    Should Be True    ${expected_template}[All beats actions]
    Run Keyword And Continue On Failure    Should Be True    ${expected_template}[Page actions]
    ${expected_status}     Check Toolbar Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Speed]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Gain]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[High Pass]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Low Pass]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH1]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH2]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH3]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Capture]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Beat Marker Tool]
    Run Keyword And Continue On Failure    Should Not Be True    ${expected_status}[View All Strip]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Add Beat Marker N]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Add Beat Marker S]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Add Beat Marker V]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Add Beat Marker Q]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Beat Marker Delete]

BFCC-AIRP-V-MORPHOLOGIES-VIEW-02: Verify that the main interface will be displayed maximum 10 templates
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 3/13/2025 - Trinh Nguyen
    ...     Auto create: 04/21/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-VIEW-02       AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${expected_template}    Check Template Displayed
    Run Keyword And Continue On Failure    Should Be True    ${expected_template}[Identifier]

BFCC-AIRP-V-MORPHOLOGIES-VIEW-03: Verify that any additional templates will be categorized under an "Unclassified" section
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 3/13/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-VIEW-03       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-VIEW-04: Verify that the waveform preview is displayed correctly
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...     1. Representing the morphology, calculated as the average waveform of all V beats assigned to the template to ensure accuracy
    ...
    ...     **Others**
    ...     Create date: 3/13/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-VIEW-04       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-VIEW-05: Verify that the beat count in each templated is displayed correctly
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 3/13/2025 - Trinh Nguyen
    ...     Auto create: 04/21/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-VIEW-05       AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    FOR    ${i}    IN RANGE    1    11
    Navigate To Template On    row=${i}
    ${actual_number_of_beats}    Get Number Beats
    ${expected_number_of_beats}    Get Total Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_of_beats}    ${expected_number_of_beats}
    END

BFCC-AIRP-V-MORPHOLOGIES-VIEW-06: Verify that the template is a unique identifier, generated based on the similarity of V waveforms
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:  Ensure that each V template has a unique identifier, which is generated based on the similarity of V waveforms
    ...
    ...     Precondition:
    ...    1. The system contains V beats
    ...
    ...     Test Steps:
    ...    1. Click on the V morphologies page, then view the specific template
    ...
    ...     Expected Results:
    ...     1. Each V template should have a unique identifier
    ...     2. The identifier must be generated based on the similarity of the V waveforms
    ...     3. Templates that represent similar V waveforms should share a similar identifier structure
    ...     4. No two templates should have the same identifier
    ...
    ...     **Others**
    ...     Create date: 3/14/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-VIEW-06       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-VIEW-07: Verify that the 'No data to display' screen is shown if the study contains no V beats
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1.
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-VIEW-07       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-VIEW-08: Can navigate between beats in the list by using keyboard (Arrow left/right/up/down)
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1.
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-VIEW-08       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-SORT-01: Verify that the template is sorted in descending order based on the number of assigned beats
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Ensure that V templates are correctly sorted in descending order based on the number of assigned beats, with the templates having the highest number of beats displayed at the top
    ...
    ...     Precondition:
    ...    1. The system has a set of V templates generated from V beats
    ...    2. Each template has a count of assigned V beats
    ...
    ...     Test Steps:
    ...    1. Open the V morphologies page
    ...    2. Observe the template lists
    ...
    ...     Expected Results:
    ...    1. V templates should be displayed in descending order based on the number of beats assigned to each template
    ...    2. The template with the highest number of assigned beats should appear at the top
    ...
    ...     **Others**
    ...     Create date: 3/14/2025 - Trinh Nguyen
    ...     Auto create: 04/21/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-SORT-01       AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    Verify the number of beats in descending order

BFCC-AIRP-V-MORPHOLOGIES-SORT-01.1: Verify that the template will be re-sorted if the user updates multiple beats from the Q-Q tab to V in the R-R heatmap section on the Beat pages by using all beats actions
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Ensure that the template will be re-sorted correctly if the user updates multiple beats from the Q-Q tab to V in the R-R heatmap section on the Beat pages. The sorting should be based on the number of beats assigned to each template
    ...
    ...     Precondition:
    ...    1. There must be multiple Q beats in the R-R heatmap section
    ...    2. The user has permission to modify beats in the R-R heatmap section
    ...
    ...     Test Steps:
    ...    1.Open the Beat pages and navigate to the R-R heatmap section
    ...    2. Select multiple beats in the R-R heatmap section and update their type from Q to V by using all beats actions
    ...    3. Observe the change in the template associated with these beats
    ...    4. Verify that the template is re-sorted based on the new count of V beats
    ...    5. Ensure that the templates are now correctly sorted in descending order based on the number of V beats assigned to each template
    ...
    ...     Expected Results:
    ...    1.The templates should be re-sorted automatically after the user updates the beats
    ...    2. The updated template should reflect the new count of V beats
    ...    3. The templates must be displayed in descending order, with the one having the most V beats at the top
    ...
    ...     **Others**
    ...     Create date: 3/14/2025 - Trinh Nguyen
    ...     Auto create: 04/21/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-SORT-01.1       AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${actual_number_of_beats}    Get All Numbers Beats
    ${actual_list_of_beats}    Create List    ${actual_number_of_beats}
    Navigate Airp Tab    tab=Beats
    Navigate To Heatmap Beat    beat=Q - Q beats
    ${cell_random}     Get Elements Cell On Chart
    Select Cell On Chart    element_or_locator=${cell_random}
    Filter Action Change All Beats Actions    beat_change=Change all to V beat
    Filter Header    is_save=${True}
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${expected_number_of_beats}    Get All Numbers Beats
    ${expected_list_of_beats}    Create List    ${expected_number_of_beats}
    Run Keyword And Continue On Failure    Should Not Be Equal   ${actual_list_of_beats}    ${expected_list_of_beats}
    Verify the number of beats in descending order


BFCC-AIRP-V-MORPHOLOGIES-SORT-05: Verify that the template will be re-sorted if the user updates multiple beats from the Q-N/S/V tab to V in the R-R heatmap section on the Beat pages by using all beats actions
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Ensure that the template will be re-sorted correctly if the user updates multiple beats from the Q-N/S/V tab to V in the R-R heatmap section on the Beat pages. The sorting should be based on the number of beats assigned to each template
    ...
    ...     Precondition:
    ...    1. There must be multiple Q beats in the R-R heatmap section
    ...    2. The user has permission to modify beats in the R-R heatmap section
    ...
    ...     Test Steps:
    ...    1.Open the Beat pages and navigate to the R-R heatmap section
    ...    2. Select multiple beats in the R-R heatmap section and update their type from Q to V by using all beats actions
    ...    3. Observe the change in the template associated with these beats
    ...    4. Verify that the template is re-sorted based on the new count of V beats
    ...    5. Ensure that the templates are now correctly sorted in descending order based on the number of V beats assigned to each template
    ...
    ...     Expected Results:
    ...    1.The templates should be re-sorted automatically after the user updates the beats
    ...    2. The updated template should reflect the new count of V beats
    ...    3. The templates must be displayed in descending order, with the one having the most V beats at the top
    ...
    ...     **Others**
    ...     Create date: 3/14/2025 - Trinh Nguyen
    ...     Auto create: 04/21/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-SORT-05       AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${actual_number_of_beats}    Get All Numbers Beats
    ${actual_list_of_beats}    Create List    ${actual_number_of_beats}
    Navigate Airp Tab    tab=Beats
    Navigate To Heatmap Beat    beat=Q - N/S/V beats
    ${cell_random}     Get Elements Cell On Chart
    Select Cell On Chart    element_or_locator=${cell_random}
    Filter Action Change All Beats Actions    beat_change=Change all to V beat
    Filter Header    is_save=${True}
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${expected_number_of_beats}    Get All Numbers Beats
    ${expected_list_of_beats}    Create List    ${expected_number_of_beats}
    Run Keyword And Continue On Failure    Should Not Be Equal   ${actual_list_of_beats}    ${expected_list_of_beats}
    Verify the number of beats in descending order

BFCC-AIRP-V-MORPHOLOGIES-SORT-06: Verify that the template will be re-sorted if the user updates multiple beats from the S tab to V in the R-R heatmap section on the Beat pages by using all beats actions
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Ensure that the template will be re-sorted correctly if the user updates multiple beats from the S tab to V in the R-R heatmap section on the Beat pages. The sorting should be based on the number of beats assigned to each template
    ...
    ...     Precondition:
    ...    1. There must be multiple S beats in the R-R heatmap section
    ...    2. The user has permission to modify beats in the R-R heatmap section
    ...
    ...     Test Steps:
    ...    1.Open the Beat pages and navigate to the R-R heatmap section
    ...    2. Select multiple beats in the R-R heatmap section and update their type from S to V by using all beats actions
    ...    3. Observe the change in the template associated with these beats
    ...    4. Verify that the template is re-sorted based on the new count of V beats
    ...    5. Ensure that the templates are now correctly sorted in descending order based on the number of V beats assigned to each template
    ...
    ...     Expected Results:
    ...    1.The templates should be re-sorted automatically after the user updates the beats
    ...    2. The updated template should reflect the new count of V beats
    ...    3. The templates must be displayed in descending order, with the one having the most V beats at the top
    ...
    ...     **Others**
    ...     Create date: 3/14/2025 - Trinh Nguyen
    ...     Auto create: 04/21/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-SORT-06       AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${actual_number_of_beats}    Get All Numbers Beats
    ${actual_list_of_beats}    Create List    ${actual_number_of_beats}
    Navigate Airp Tab    tab=Beats
    Navigate To Heatmap Beat    beat=S beats
    ${cell_random}     Get Elements Cell On Chart
    Select Cell On Chart    element_or_locator=${cell_random}
    Filter Action Change All Beats Actions    beat_change=Change all to V beat
    Filter Header    is_save=${True}
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${expected_number_of_beats}    Get All Numbers Beats
    ${expected_list_of_beats}    Create List    ${expected_number_of_beats}
    Run Keyword And Continue On Failure    Should Not Be Equal   ${actual_list_of_beats}    ${expected_list_of_beats}
    Verify the number of beats in descending order

BFCC-AIRP-V-MORPHOLOGIES-SORT-07: Verify that the template will be re-sorted if the user updates multiple beats from the N tab to V in the R-R heatmap section on the Beat pages by using all beats actions
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Ensure that the template will be re-sorted correctly if the user updates multiple beats from the N tab to V in the R-R heatmap section on the Beat pages. The sorting should be based on the number of beats assigned to each template
    ...
    ...     Precondition:
    ...    1. There must be multiple N beats in the R-R heatmap section
    ...    2. The user has permission to modify beats in the R-R heatmap section
    ...
    ...     Test Steps:
    ...    1.Open the Beat pages and navigate to the R-R heatmap section
    ...    2. Select multiple beats in the R-R heatmap section and update their type from N to V by using all beats actions
    ...    3. Observe the change in the template associated with these beats
    ...    4. Verify that the template is re-sorted based on the new count of V beats
    ...    5. Ensure that the templates are now correctly sorted in descending order based on the number of V beats assigned to each template
    ...
    ...     Expected Results:
    ...    1.The templates should be re-sorted automatically after the user updates the beats
    ...    2. The updated template should reflect the new count of V beats
    ...    3. The templates must be displayed in descending order, with the one having the most V beats at the top
    ...
    ...     **Others**
    ...     Create date: 3/14/2025 - Trinh Nguyen
    ...     Auto create: 04/21/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-SORT-07       AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${actual_number_of_beats}    Get All Numbers Beats
    ${actual_list_of_beats}    Create List    ${actual_number_of_beats}
    Navigate Airp Tab    tab=Beats
    Navigate To Heatmap Beat    beat=N beats
    ${cell_random}     Get Elements Cell On Chart
    Select Cell On Chart    element_or_locator=${cell_random}
    Filter Action Change All Beats Actions    beat_change=Change all to V beat
    Filter Header    is_save=${True}
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${expected_number_of_beats}    Get All Numbers Beats
    ${expected_list_of_beats}    Create List    ${expected_number_of_beats}
    Run Keyword And Continue On Failure    Should Not Be Equal   ${actual_list_of_beats}    ${expected_list_of_beats}
    Verify the number of beats in descending order

BFCC-AIRP-V-MORPHOLOGIES-SORT-08: Verify that the template will be re-sorted if the user updates multiple beats from the V tab to N in the R-R heatmap section on the Beat pages by using all beats actions
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Ensure that the template will be re-sorted correctly if the user updates multiple beats from the V tab to N in the R-R heatmap section on the Beat pages. The sorting should be based on the number of beats assigned to each template
    ...
    ...     Precondition:
    ...    1. There must be multiple V beats in the R-R heatmap section
    ...    2. The user has permission to modify beats in the R-R heatmap section
    ...
    ...     Test Steps:
    ...    1.Open the Beat pages and navigate to the R-R heatmap section
    ...    2. Select multiple beats in the R-R heatmap section and update their type from V to N by using all beats actions
    ...    3. Observe the change in the template associated with these beats
    ...    4. Verify that the template is re-sorted based on the new count of V beats
    ...    5. Ensure that the templates are now correctly sorted in descending order based on the number of V beats assigned to each template
    ...
    ...     Expected Results:
    ...    1.The templates should be re-sorted automatically after the user updates the beats
    ...    2. The updated template should reflect the new count of V beats
    ...    3. The templates must be displayed in descending order, with the one having the most V beats at the top
    ...
    ...     **Others**
    ...     Create date: 3/14/2025 - Trinh Nguyen
    ...     Auto create: 04/21/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-SORT-08       AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${actual_number_of_beats}    Get All Numbers Beats
    ${actual_list_of_beats}    Create List    ${actual_number_of_beats}
    Navigate Airp Tab    tab=Beats
    Navigate To Heatmap Beat    beat=V beats
    ${cell_random}     Get Elements Cell On Chart
    Select Cell On Chart    element_or_locator=${cell_random}
    Filter Action Change All Beats Actions    beat_change=Change all to N beat
    Filter Header    is_save=${True}
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${expected_number_of_beats}    Get All Numbers Beats
    ${expected_list_of_beats}    Create List    ${expected_number_of_beats}
    Run Keyword And Continue On Failure    Should Not Be Equal   ${actual_list_of_beats}    ${expected_list_of_beats}
    Verify the number of beats in descending order


BFCC-AIRP-V-MORPHOLOGIES-SORT-08.: Verify that the template will be re-sorted if the user updates multiple beats from the V tab to S in the R-R heatmap section on the Beat pages by using all beats actions
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Ensure that the template will be re-sorted correctly if the user updates multiple beats from the V tab to S in the R-R heatmap section on the Beat pages. The sorting should be based on the number of beats assigned to each template
    ...
    ...     Precondition:
    ...    1. There must be multiple V beats in the R-R heatmap section
    ...    2. The user has permission to modify beats in the R-R heatmap section
    ...
    ...     Test Steps:
    ...    1.Open the Beat pages and navigate to the R-R heatmap section
    ...    2. Select multiple beats in the R-R heatmap section and update their type from V to S by using all beats actions
    ...    3. Observe the change in the template associated with these beats
    ...    4. Verify that the template is re-sorted based on the new count of V beats
    ...    5. Ensure that the templates are now correctly sorted in descending order based on the number of V beats assigned to each template
    ...
    ...     Expected Results:
    ...    1.The templates should be re-sorted automatically after the user updates the beats
    ...    2. The updated template should reflect the new count of V beats
    ...    3. The templates must be displayed in descending order, with the one having the most V beats at the top
    ...
    ...     **Others**
    ...     Create date: 3/14/2025 - Trinh Nguyen
    ...     Auto create: 04/21/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-SORT-08.       AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${actual_number_of_beats}    Get All Numbers Beats
    ${actual_list_of_beats}    Create List    ${actual_number_of_beats}
    Navigate Airp Tab    tab=Beats
    Navigate To Heatmap Beat    beat=V beats
    ${cell_random}     Get Elements Cell On Chart
    Select Cell On Chart    element_or_locator=${cell_random}
    Filter Action Change All Beats Actions    beat_change=Change all to S beat
    Filter Header    is_save=${True}
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${expected_number_of_beats}    Get All Numbers Beats
    ${expected_list_of_beats}    Create List    ${expected_number_of_beats}
    Run Keyword And Continue On Failure    Should Not Be Equal   ${actual_list_of_beats}    ${expected_list_of_beats}
    Verify the number of beats in descending order

BFCC-AIRP-V-MORPHOLOGIES-SORT-09: Verify that the template will be re-sorted if the user updates multiple beats from the V tab to Q in the R-R heatmap section on the Beat pages by using all beats actions
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Ensure that the template will be re-sorted correctly if the user updates multiple beats from the V tab to Q in the R-R heatmap section on the Beat pages. The sorting should be based on the number of beats assigned to each template
    ...
    ...     Precondition:
    ...    1. There must be multiple V beats in the R-R heatmap section
    ...    2. The user has permission to modify beats in the R-R heatmap section
    ...
    ...     Test Steps:
    ...    1.Open the Beat pages and navigate to the R-R heatmap section
    ...    2. Select multiple beats in the R-R heatmap section and update their type from V to Q by using all beats actions
    ...    3. Observe the change in the template associated with these beats
    ...    4. Verify that the template is re-sorted based on the new count of V beats
    ...    5. Ensure that the templates are now correctly sorted in descending order based on the number of V beats assigned to each template
    ...
    ...     Expected Results:
    ...    1.The templates should be re-sorted automatically after the user updates the beats
    ...    2. The updated template should reflect the new count of V beats
    ...    3. The templates must be displayed in descending order, with the one having the most V beats at the top
    ...
    ...     **Others**
    ...     Create date: 3/14/2025 - Trinh Nguyen
    ...     Auto create: 04/21/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-SORT-09       AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${actual_number_of_beats}    Get All Numbers Beats
    ${actual_list_of_beats}    Create List    ${actual_number_of_beats}
    Navigate Airp Tab    tab=Beats
    Navigate To Heatmap Beat    beat=V beats
    ${cell_random}     Get Elements Cell On Chart
    Select Cell On Chart    element_or_locator=${cell_random}
    Filter Action Change All Beats Actions    beat_change=Change all to Q beat
    Filter Header    is_save=${True}
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${expected_number_of_beats}    Get All Numbers Beats
    ${expected_list_of_beats}    Create List    ${expected_number_of_beats}
    Run Keyword And Continue On Failure    Should Not Be Equal   ${actual_list_of_beats}    ${expected_list_of_beats}
    Verify the number of beats in descending order

BFCC-AIRP-V-MORPHOLOGIES-SORT-10: Verify that the template will be re-sorted if the user updates multiple beats from the Q-Q tab to V in the R-R heatmap section on the Beat pages by using page actions
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Ensure that the template will be re-sorted correctly if the user updates multiple beats from the Q-Q tab to V in the R-R heatmap section on the Beat pages. The sorting should be based on the number of beats assigned to each template
    ...
    ...     Precondition:
    ...    1. There must be multiple Q beats in the R-R heatmap section
    ...    2. The user has permission to modify beats in the R-R heatmap section
    ...
    ...     Test Steps:
    ...    1.Open the Beat pages and navigate to the R-R heatmap section
    ...    2. Select multiple beats in the R-R heatmap section and update their type from Q to V by using page actions
    ...    3. Observe the change in the template associated with these beats
    ...    4. Verify that the template is re-sorted based on the new count of V beats
    ...    5. Ensure that the templates are now correctly sorted in descending order based on the number of V beats assigned to each template
    ...
    ...     Expected Results:
    ...    1.The templates should be re-sorted automatically after the user updates the beats
    ...    2. The updated template should reflect the new count of V beats
    ...    3. The templates must be displayed in descending order, with the one having the most V beats at the top
    ...
    ...     **Others**
    ...     Create date: 3/14/2025 - Trinh Nguyen
    ...     Auto create: 04/21/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-SORT-10       AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${actual_number_of_beats}    Get All Numbers Beats
    ${actual_list_of_beats}    Create List    ${actual_number_of_beats}
    Navigate Airp Tab    tab=Beats
    Navigate To Heatmap Beat    beat=Q - Q beats
    ${cell_random}     Get Elements Cell On Chart
    Select Cell On Chart    element_or_locator=${cell_random}
    Filter Action Change    beat_change=Change all to V beat
    Filter Header    is_save=${True}
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${expected_number_of_beats}    Get All Numbers Beats
    ${expected_list_of_beats}    Create List    ${expected_number_of_beats}
    Run Keyword And Continue On Failure    Should Not Be Equal   ${actual_list_of_beats}    ${expected_list_of_beats}
    Verify the number of beats in descending order

BFCC-AIRP-V-MORPHOLOGIES-SORT-11: Verify that the template will be re-sorted if the user updates multiple beats from the Q-N/S/V tab to V in the R-R heatmap section on the Beat pages by using page actions
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Ensure that the template will be re-sorted correctly if the user updates multiple beats from the Q-N/S/V tab to V in the R-R heatmap section on the Beat pages. The sorting should be based on the number of beats assigned to each template
    ...
    ...     Precondition:
    ...    1. There must be multiple Q beats in the R-R heatmap section
    ...    2. The user has permission to modify beats in the R-R heatmap section
    ...
    ...     Test Steps:
    ...    1.Open the Beat pages and navigate to the R-R heatmap section
    ...    2. Select multiple beats in the R-R heatmap section and update their type from Q to V by using page actions
    ...    3. Observe the change in the template associated with these beats
    ...    4. Verify that the template is re-sorted based on the new count of V beats
    ...    5. Ensure that the templates are now correctly sorted in descending order based on the number of V beats assigned to each template
    ...
    ...     Expected Results:
    ...    1.The templates should be re-sorted automatically after the user updates the beats
    ...    2. The updated template should reflect the new count of V beats
    ...    3. The templates must be displayed in descending order, with the one having the most V beats at the top
    ...
    ...     **Others**
    ...     Create date: 3/14/2025 - Trinh Nguyen
    ...     Auto create: 04/21/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-SORT-11       AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${actual_number_of_beats}    Get All Numbers Beats
    ${actual_list_of_beats}    Create List    ${actual_number_of_beats}
    Navigate Airp Tab    tab=Beats
    Navigate To Heatmap Beat    beat=Q - N/S/V beats
    ${cell_random}     Get Elements Cell On Chart
    Select Cell On Chart    element_or_locator=${cell_random}
    Filter Action Change    beat_change=Change all to V beat
    Filter Header    is_save=${True}
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${expected_number_of_beats}    Get All Numbers Beats
    ${expected_list_of_beats}    Create List    ${expected_number_of_beats}
    Run Keyword And Continue On Failure    Should Not Be Equal   ${actual_list_of_beats}    ${expected_list_of_beats}
    Verify the number of beats in descending order

BFCC-AIRP-V-MORPHOLOGIES-SORT-12: Verify that the template will be re-sorted if the user updates multiple beats from the S tab to V in the R-R heatmap section on the Beat pages by using page actions
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Ensure that the template will be re-sorted correctly if the user updates multiple beats from the S tab to V in the R-R heatmap section on the Beat pages. The sorting should be based on the number of beats assigned to each template
    ...
    ...     Precondition:
    ...    1. There must be multiple S beats in the R-R heatmap section
    ...    2. The user has permission to modify beats in the R-R heatmap section
    ...
    ...     Test Steps:
    ...    1.Open the Beat pages and navigate to the R-R heatmap section
    ...    2. Select multiple beats in the R-R heatmap section and update their type from S to V by using page actions
    ...    3. Observe the change in the template associated with these beats
    ...    4. Verify that the template is re-sorted based on the new count of V beats
    ...    5. Ensure that the templates are now correctly sorted in descending order based on the number of V beats assigned to each template
    ...
    ...     Expected Results:
    ...    1.The templates should be re-sorted automatically after the user updates the beats
    ...    2. The updated template should reflect the new count of V beats
    ...    3. The templates must be displayed in descending order, with the one having the most V beats at the top
    ...
    ...     **Others**
    ...     Create date: 3/14/2025 - Trinh Nguyen
    ...     Auto create: 04/21/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-SORT-12       AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${actual_number_of_beats}    Get All Numbers Beats
    ${actual_list_of_beats}    Create List    ${actual_number_of_beats}
    Navigate Airp Tab    tab=Beats
    Navigate To Heatmap Beat    beat=S beats
    ${cell_random}     Get Elements Cell On Chart
    Select Cell On Chart    element_or_locator=${cell_random}
    Filter Action Change    beat_change=Change all to V beat
    Filter Header    is_save=${True}
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${expected_number_of_beats}    Get All Numbers Beats
    ${expected_list_of_beats}    Create List    ${expected_number_of_beats}
    Run Keyword And Continue On Failure    Should Not Be Equal   ${actual_list_of_beats}    ${expected_list_of_beats}
    Verify the number of beats in descending order

BFCC-AIRP-V-MORPHOLOGIES-SORT-13: Verify that the template will be re-sorted if the user updates multiple beats from the N tab to V in the R-R heatmap section on the Beat pages by using page actions
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Ensure that the template will be re-sorted correctly if the user updates multiple beats from the N tab to V in the R-R heatmap section on the Beat pages. The sorting should be based on the number of beats assigned to each template
    ...
    ...     Precondition:
    ...    1. There must be multiple N beats in the R-R heatmap section
    ...    2. The user has permission to modify beats in the R-R heatmap section
    ...
    ...     Test Steps:
    ...    1.Open the Beat pages and navigate to the R-R heatmap section
    ...    2. Select multiple beats in the R-R heatmap section and update their type from N to V by using page actions
    ...    3. Observe the change in the template associated with these beats
    ...    4. Verify that the template is re-sorted based on the new count of V beats
    ...    5. Ensure that the templates are now correctly sorted in descending order based on the number of V beats assigned to each template
    ...
    ...     Expected Results:
    ...    1.The templates should be re-sorted automatically after the user updates the beats
    ...    2. The updated template should reflect the new count of V beats
    ...    3. The templates must be displayed in descending order, with the one having the most V beats at the top
    ...
    ...     **Others**
    ...     Create date: 3/14/2025 - Trinh Nguyen
    ...     Auto create: 04/21/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-SORT-13       AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${actual_number_of_beats}    Get All Numbers Beats
    ${actual_list_of_beats}    Create List    ${actual_number_of_beats}
    Navigate Airp Tab    tab=Beats
    Navigate To Heatmap Beat    beat=N beats
    ${cell_random}     Get Elements Cell On Chart
    Select Cell On Chart    element_or_locator=${cell_random}
    Filter Action Change    beat_change=Change all to V beat
    Filter Header    is_save=${True}
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${expected_number_of_beats}    Get All Numbers Beats
    ${expected_list_of_beats}    Create List    ${expected_number_of_beats}
    Run Keyword And Continue On Failure    Should Not Be Equal   ${actual_list_of_beats}    ${expected_list_of_beats}
    Verify the number of beats in descending order

BFCC-AIRP-V-MORPHOLOGIES-SORT-14: Verify that the template will be re-sorted if the user updates multiple beats from the V tab to N in the R-R heatmap section on the Beat pages by using page actions
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Ensure that the template will be re-sorted correctly if the user updates multiple beats from the V tab to N in the R-R heatmap section on the Beat pages. The sorting should be based on the number of beats assigned to each template
    ...
    ...     Precondition:
    ...    1. There must be multiple V beats in the R-R heatmap section
    ...    2. The user has permission to modify beats in the R-R heatmap section
    ...
    ...     Test Steps:
    ...    1.Open the Beat pages and navigate to the R-R heatmap section
    ...    2. Select multiple beats in the R-R heatmap section and update their type from V to N by using page actions
    ...    3. Observe the change in the template associated with these beats
    ...    4. Verify that the template is re-sorted based on the new count of V beats
    ...    5. Ensure that the templates are now correctly sorted in descending order based on the number of V beats assigned to each template
    ...
    ...     Expected Results:
    ...    1.The templates should be re-sorted automatically after the user updates the beats
    ...    2. The updated template should reflect the new count of V beats
    ...    3. The templates must be displayed in descending order, with the one having the most V beats at the top
    ...
    ...     **Others**
    ...     Create date: 3/14/2025 - Trinh Nguyen
    ...     Auto create: 04/21/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-SORT-14       AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${actual_number_of_beats}    Get All Numbers Beats
    ${actual_list_of_beats}    Create List    ${actual_number_of_beats}
    Navigate Airp Tab    tab=Beats
    Navigate To Heatmap Beat    beat=V beats
    ${cell_random}     Get Elements Cell On Chart
    Select Cell On Chart    element_or_locator=${cell_random}
    Filter Action Change    beat_change=Change all to N beat
    Filter Header    is_save=${True}
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${expected_number_of_beats}    Get All Numbers Beats
    ${expected_list_of_beats}    Create List    ${expected_number_of_beats}
    Run Keyword And Continue On Failure    Should Not Be Equal   ${actual_list_of_beats}    ${expected_list_of_beats}
    Verify the number of beats in descending order
    

BFCC-AIRP-V-MORPHOLOGIES-SORT-15: Verify that the template will be re-sorted if the user updates multiple beats from the V tab to S in the R-R heatmap section on the Beat pages by using page actions
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Ensure that the template will be re-sorted correctly if the user updates multiple beats from the V tab to S in the R-R heatmap section on the Beat pages. The sorting should be based on the number of beats assigned to each template
    ...
    ...     Precondition:
    ...    1. There must be multiple V beats in the R-R heatmap section
    ...    2. The user has permission to modify beats in the R-R heatmap section
    ...
    ...     Test Steps:
    ...    1.Open the Beat pages and navigate to the R-R heatmap section
    ...    2. Select multiple beats in the R-R heatmap section and update their type from V to S by using page actions
    ...    3. Observe the change in the template associated with these beats
    ...    4. Verify that the template is re-sorted based on the new count of V beats
    ...    5. Ensure that the templates are now correctly sorted in descending order based on the number of V beats assigned to each template
    ...
    ...     Expected Results:
    ...    1.The templates should be re-sorted automatically after the user updates the beats
    ...    2. The updated template should reflect the new count of V beats
    ...    3. The templates must be displayed in descending order, with the one having the most V beats at the top
    ...
    ...     **Others**
    ...     Create date: 3/14/2025 - Trinh Nguyen
    ...     Auto create: 04/21/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-SORT-15       AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${actual_number_of_beats}    Get All Numbers Beats
    ${actual_list_of_beats}    Create List    ${actual_number_of_beats}
    Navigate Airp Tab    tab=Beats
    Navigate To Heatmap Beat    beat=V beats
    ${cell_random}     Get Elements Cell On Chart
    Select Cell On Chart    element_or_locator=${cell_random}
    Filter Action Change    beat_change=Change all to S beat
    Filter Header    is_save=${True}
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${expected_number_of_beats}    Get All Numbers Beats
    ${expected_list_of_beats}    Create List    ${expected_number_of_beats}
    Run Keyword And Continue On Failure    Should Not Be Equal   ${actual_list_of_beats}    ${expected_list_of_beats}
    Verify the number of beats in descending order

BFCC-AIRP-V-MORPHOLOGIES-SORT-16: Verify that the template will be re-sorted if the user updates multiple beats from the V tab to Q in the R-R heatmap section on the Beat pages by using page actions
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Ensure that the template will be re-sorted correctly if the user updates multiple beats from the V tab to Q in the R-R heatmap section on the Beat pages. The sorting should be based on the number of beats assigned to each template
    ...
    ...     Precondition:
    ...    1. There must be multiple V beats in the R-R heatmap section
    ...    2. The user has permission to modify beats in the R-R heatmap section
    ...
    ...     Test Steps:
    ...    1.Open the Beat pages and navigate to the R-R heatmap section
    ...    2. Select multiple beats in the R-R heatmap section and update their type from V to Q by using page actions
    ...    3. Observe the change in the template associated with these beats
    ...    4. Verify that the template is re-sorted based on the new count of V beats
    ...    5. Ensure that the templates are now correctly sorted in descending order based on the number of V beats assigned to each template
    ...
    ...     Expected Results:
    ...    1.The templates should be re-sorted automatically after the user updates the beats
    ...    2. The updated template should reflect the new count of V beats
    ...    3. The templates must be displayed in descending order, with the one having the most V beats at the top
    ...
    ...     **Others**
    ...     Create date: 3/14/2025 - Trinh Nguyen
    ...     Auto create: 04/21/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-SORT-16       AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${actual_number_of_beats}    Get All Numbers Beats
    ${actual_list_of_beats}    Create List    ${actual_number_of_beats}
    Navigate Airp Tab    tab=Beats
    Navigate To Heatmap Beat    beat=V beats
    ${cell_random}     Get Elements Cell On Chart
    Select Cell On Chart    element_or_locator=${cell_random}
    Filter Action Change    beat_change=Change all to Q beat
    Filter Header    is_save=${True}
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${expected_number_of_beats}    Get All Numbers Beats
    ${expected_list_of_beats}    Create List    ${expected_number_of_beats}
    Run Keyword And Continue On Failure    Should Not Be Equal   ${actual_list_of_beats}    ${expected_list_of_beats}
    Verify the number of beats in descending order

BFCC-AIRP-V-MORPHOLOGIES-SORT-17: Verify that the template will be re-sorted if the user adds a new artifact event in the area containing multiple V beats
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 3/14/2025 - Trinh Nguyen
    ...     Auto create: 04/21/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-SORT-17       AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${actual_number_of_beats}    Get All Numbers Beats
    ${actual_list_of_beats}    Create List    ${actual_number_of_beats}
    Navigate Airp Tab    tab=Beats
    Navigate To Heatmap Beat    beat=V beats
    ${cell_random}     Get Elements Cell On Chart
    Select Cell On Chart    element_or_locator=${cell_random}
    Navigate To Add New Event
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-300      y_offset_start_time=10      x_offset_end_time=100      y_offset_end_time=10
    Run Keyword And Continue On Failure    Edit Artifact Event      is_submit=${True}
    Filter Header    is_save=${True}
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    ${expected_number_of_beats}    Get All Numbers Beats
    ${expected_list_of_beats}    Create List    ${expected_number_of_beats}
    Run Keyword And Continue On Failure    Should Not Be Equal   ${actual_list_of_beats}    ${expected_list_of_beats}
    Verify the number of beats in descending order

BFCC-AIRP-V-MORPHOLOGIES-SORT-18: Verify that the V morphology templates re-sort after deleting beats from the V tab in the R-R heatmap section
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-SORT-18       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-SORT-19: Verify that the V morphology templates re-sort after changing included template’s beats to N beats in V morphologies page
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-SORT-19       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-SORT-20: Verify that the V morphology templates re-sort after changing included template’s beats to S beats in V morphologies page
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-SORT-20       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-SORT-21: Verify that the V morphology templates re-sort after changing included template’s beats to Q beats in V morphologies page
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-SORT-21       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-SORT-22: Verify that the V morphology templates re-sort after deleting included template’s beats in V morphologies page
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-SORT-22       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-SORT-23: Verify that the V morphology templates re-sort after swapping included template’s beats with another template in V morphologies page
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-SORT-23       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-VIEW-BEAT-01: Verify that the user can view individual beats within a template
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that the user can interact with individual beat thumbnails within a V morphology template
    ...    - Upon clicking a beat, its waveform is rendered in the ECG viewer for detailed inspection
    ...
    ...     Precondition:
    ...    - A valid study with V beats has been uploaded and processed
    ...    - At least one V morphology template is detected by AI and available in the “V Morphologies” page
    ...
    ...     Test Steps:
    ...    1. Navigate to the Report Editing Page of a processed study
    ...    2. Go to the “V Morphologies” page
    ...    3. Select a V morphology template that has beats assigned
    ...    4. Click on a beat thumbnail within the selected template
    ...
    ...     Expected Results:
    ...    1. The beat is opened in the ECG viewer with a detailed waveform view
    ...
    ...     **Others**
    ...     Create date: 4/23/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-VIEW-BEAT-01      AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-EDIT-01: Can swap template for one event by "Swap template" button
    [Documentation]     Author: Hoang Nguyen
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
    ...
    ...     **Others**
    ...     Update date: 02/26/2025 - Hoang Nguyen
    ...     Auto Update: 02/26/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-EDIT-01     auto
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=2
    View Each Beats On Thumbnail    row=2
    ${total_number_beats}    Get Number Beats
    Filter Action         is_swap_template=${True}    select_template_type=#1    is_save=${True}
    ${total_number_beats_after_saved}    Get Number Beats
    Run Keyword And Continue On Failure    Should Not Be Equal   ${total_number_beats}    ${total_number_beats_after_saved}

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-01: Verify that the user can change the V beat in a template to S beat by using S button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that users can reclassify a V beat to another type using the toolbar buttons
    ...    - Once saved, the beat will be removed from the current template, and the waveform preview may be updated to reflect the change
    ...
    ...     Precondition:
    ...    - A study contains at least one V beat
    ...
    ...     Test Steps:
    ...    1. Navigate to the Report Editing Page of a processed study
    ...    2. Go to the “V Morphologies” page
    ...    3. Select a template that contains at least one V beat
    ...    4. Click on any beat thumbnail to view it in the ECG viewer
    ...    5. Click the "S" button from the beat toolbar to change beat type
    ...    6. Click the "Save" button to confirm the change
    ...
    ...     Expected Results:
    ...    1. The beat is reclassified as an S beat
    ...    2. Once saved, the beat is removed from the current V template
    ...    3. The waveform preview of the template may be updated based on the remaining beats
    ...    4. The total count of V beats is decreased
    ...    5. All statistics and visualizations related to V beats are updated accordingly, including:
    ...       - R-R heatmap: the reclassified beat is no longer counted under V classification
    ...       - Findings section: updated V-related summaries and metrics
    ...       - PDF report: VE Summary, VE Burden chart, Morphology section, and other V-related data reflect the updated classification
    ...       - All statistical fields across the report are recalculated to match the new V beat count
    ...
    ...     **Others**
    ...     Create date: 4/23/2025 - Trinh Nguyen
    ...     Auto create: 4/28/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-01      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Change Beats To "S" Beats By Button

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-02: Verify that the user can change the V beat in a template to N beat by using N button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that users can reclassify a V beat to N beat using the "N" button in the beat toolbar
    ...    - Once saved, the beat will be removed from the current V template, and the waveform preview may be updated to reflect the change
    ...
    ...     Precondition:
    ...    - A study contains at least one V beat
    ...
    ...     Test Steps:
    ...    1. Navigate to the Report Editing Page of a processed study
    ...    2. Go to the “V Morphologies” page
    ...    3. Select a template that contains at least one V beat
    ...    4. Click on any beat thumbnail to view it in the ECG viewer
    ...    5. Click the "N" button from the beat toolbar to change beat type
    ...    6. Click the "Save" button to confirm the change
    ...
    ...     Expected Results:
    ...    1. The beat is reclassified as an N beat
    ...    2. Once saved, the beat is removed from the current V template
    ...    3. The waveform preview of the template may be updated based on the remaining beats
    ...    4. The total count of V beats is decreased
    ...    5. All statistics and visualizations related to V beats are updated accordingly, including:
    ...       - R-R heatmap: the reclassified beat is no longer counted under V classification
    ...       - Findings section: updated V-related summaries and metrics
    ...       - PDF report: VE Summary, VE Burden chart, Morphology section, and other V-related data reflect the updated classification
    ...       - All statistical fields across the report are recalculated to match the new V beat count
    ...
    ...     **Others**
    ...     Create date: 4/23/2025 - Trinh Nguyen
    ...     Auto create: 4/28/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-02      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Change Beats To "N" Beats By Button

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-03: Verify that the user can change the V beat in a template to Q beat by using Q button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that users can reclassify a V beat to Q beat using the "Q" button in the beat toolbar
    ...    - Once saved, the beat will be removed from the current template, and the waveform preview may be updated to reflect the change
    ...
    ...     Precondition:
    ...    - A study contains at least one V beat
    ...
    ...     Test Steps:
    ...    1. Navigate to the Report Editing Page of a processed study
    ...    2. Go to the “V Morphologies” page
    ...    3. Select a template that contains at least one V beat
    ...    4. Click on any beat thumbnail to view it in the ECG viewer
    ...    5. Click the "Q" button from the beat toolbar to change beat type
    ...    6. Click the "Save" button to confirm the change
    ...
    ...     Expected Results:
    ...    1. The beat is reclassified as a Q beat
    ...    2. Once saved, the beat is removed from the current V template
    ...    3. The waveform preview of the template may be updated based on the remaining beats
    ...    4. The total count of V beats is decreased
    ...    5. All statistics and visualizations related to V beats are updated accordingly, including:
    ...       - R-R heatmap: the reclassified beat is no longer counted under V classification
    ...       - Findings section: updated V-related summaries and metrics
    ...       - PDF report: VE Summary, VE Burden chart, Morphology section, and other V-related data reflect the updated classification
    ...       - All statistical fields across the report are recalculated to match the new V beat count
    ...
    ...     **Others**
    ...     Create date: 4/23/2025 - Trinh Nguyen
    ...     Auto create: 4/28/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-03      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Change Beats To "Q" Beats By Button

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-04: Verify that the user can change the V beat in a template to S beat by using S hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that users can reclassify a V beat to S beat using the "S" hotkey from the keyboard while in the ECG viewer
    ...    - Once saved, the beat will be removed from the current template, and the waveform preview may be updated to reflect the change
    ...
    ...     Precondition:
    ...    - A study contains at least one V beat
    ...
    ...     Test Steps:
    ...    1. Navigate to the Report Editing Page of a processed study
    ...    2. Go to the “V Morphologies” page
    ...    3. Select a template that contains at least one V beat
    ...    4. Click on any beat thumbnail to open it in the ECG viewer
    ...    5. Press the "S" key on the keyboard to change the beat type
    ...    6. Click the "Save" button to confirm the change
    ...
    ...     Expected Results:
    ...    1. The beat is reclassified as an S beat
    ...    2. Once saved, the beat is removed from the current V template
    ...    3. The waveform preview of the template may be updated based on the remaining beats
    ...    4. The total count of V beats is decreased
    ...    5. All statistics and visualizations related to V beats are updated accordingly, including:
    ...       - R-R heatmap: the reclassified beat is no longer counted under V classification
    ...       - Findings section: updated V-related summaries and metrics
    ...       - PDF report: VE Summary, VE Burden chart, Morphology section, and other V-related data reflect the updated classification
    ...       - All statistical fields across the report are recalculated to match the new V beat count
    ...
    ...     **Others**
    ...     Create date: 4/24/2025 - Trinh Nguyen
    ...     Auto create: 4/28/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-04      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Change Beats To "S" Beats By Hotkey "S"

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-05: Verify that the user can change the V beat in a template to Q beat by using Q hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that users can reclassify a V beat to N beat using the "N" hotkey from the keyboard while in the ECG viewer
    ...    - Once saved, the beat will be removed from the current template, and the waveform preview may be updated to reflect the change
    ...
    ...     Precondition:
    ...    - A study contains at least one V beat
    ...
    ...     Test Steps:
    ...    1. Navigate to the Report Editing Page of a processed study
    ...    2. Go to the “V Morphologies” page
    ...    3. Select a template that contains at least one V beat
    ...    4. Click on any beat thumbnail to open it in the ECG viewer
    ...    5. Press the "N" key on the keyboard to change the beat type
    ...    6. Click the "Save" button to confirm the change
    ...
    ...     Expected Results:
    ...    1. The beat is reclassified as an N beat
    ...    2. Once saved, the beat is removed from the current V template
    ...    3. The waveform preview of the template may be updated based on the remaining beats
    ...    4. The total count of V beats is decreased
    ...    5. All statistics and visualizations related to V beats are updated accordingly, including:
    ...       - R-R heatmap: the reclassified beat is no longer counted under V classification
    ...       - Findings section: updated V-related summaries and metrics
    ...       - PDF report: VE Summary, VE Burden chart, Morphology section, and other V-related data reflect the updated classification
    ...       - All statistical fields across the report are recalculated to match the new V beat count
    ...
    ...     **Others**
    ...     Create date: 4/24/2025 - Trinh Nguyen
    ...     Auto create: 4/28/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-05      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Change Beats To "Q" Beats By Hotkey "Q"

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-06: Verify that the user can change the V beat in a template to N beat by using N hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that users can reclassify a V beat to Q beat using the "Q" hotkey from the keyboard while in the ECG viewer
    ...    - Once saved, the beat will be removed from the current template, and the waveform preview may be updated to reflect the change
    ...
    ...     Precondition:
    ...    - A study contains at least one V beat
    ...
    ...     Test Steps:
    ...    1. Navigate to the Report Editing Page of a processed study
    ...    2. Go to the “V Morphologies” page
    ...    3. Select a template that contains at least one V beat
    ...    4. Click on any beat thumbnail to open it in the ECG viewer
    ...    5. Press the "Q" key on the keyboard to change the beat type
    ...    6. Click the "Save" button to confirm the change
    ...
    ...     Expected Results:
    ...    1. The beat is reclassified as a Q beat
    ...    2. Once saved, the beat is removed from the current V template
    ...    3. The waveform preview of the template may be updated based on the remaining beats
    ...    4. The total count of V beats is decreased
    ...    5. All statistics and visualizations related to V beats are updated accordingly, including:
    ...       - R-R heatmap: the reclassified beat is no longer counted under V classification
    ...       - Findings section: updated V-related summaries and metrics
    ...       - PDF report: VE Summary, VE Burden chart, Morphology section, and other V-related data reflect the updated classification
    ...       - All statistical fields across the report are recalculated to match the new V beat count
    ...
    ...     **Others**
    ...     Create date: 4/24/2025 - Trinh Nguyen
    ...     Auto create: 4/28/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-06      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Change Beats To "N" Beats By Hotkey "N"

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-07: Verify that the user can delete the V beat in a template by using Delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that users can delete a V beat from a morphology template using the Delete button on the portal interface
    ...    - Once saved, the beat will be removed from the current template, and the waveform preview may be updated to reflect the change
    ...
    ...     Precondition:
    ...    - A study contains at least one V beat
    ...
    ...     Test Steps:
    ...    1. Navigate to the Report Editing Page of a processed study
    ...    2. Go to the “V Morphologies” page
    ...    3. Select a template that contains at least one V beat
    ...    4. Click on any beat thumbnail to open it in the ECG viewer
    ...    5. Click the "Delete" button from the beat toolbar to remove the beat
    ...    6. Click the "Save" button to confirm the deletion
    ...
    ...     Expected Results:
    ...    1. The beat is deleted from the current template
    ...    2. Once saved, the beat is permanently removed from the template
    ...    3. The waveform preview of the template may be updated based on the remaining beats
    ...    4. The total count of V beats is decreased
    ...    5. All statistics and visualizations related to V beats are updated accordingly, including:
    ...       - R-R heatmap: the deleted beat is no longer counted under V classification
    ...       - Findings section: updated V-related summaries and metrics
    ...       - PDF report: VE Summary, VE Burden chart, Morphology section, and other V-related data reflect the updated count
    ...       - All statistical fields across the report are recalculated to match the new V beat count
    ...
    ...     **Others**
    ...     Create date: 4/24/2025 - Trinh Nguyen
    ...     Auto create: 4/28/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-07      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Delete a beats by button

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-08: Verify that the user can delete the V beat in a template by using D hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that users can delete a V beat from a morphology template using the "D" hotkey while in the ECG viewer
    ...    - Once saved, the beat will be removed from the current template, and the waveform preview may be updated to reflect the change
    ...
    ...     Precondition:
    ...    - A study contains at least one V beat
    ...
    ...     Test Steps:
    ...    1. Navigate to the Report Editing Page of a processed study
    ...    2. Go to the “V Morphologies” page
    ...    3. Select a template that contains at least one V beat
    ...    4. Click on any beat thumbnail to open it in the ECG viewer
    ...    5. Press the "D" key on the keyboard to delete the beat
    ...    6. Click the "Save" button to confirm the deletion
    ...
    ...     Expected Results:
    ...    1. The beat is deleted from the current template
    ...    2. Once saved, the beat is permanently removed from the template
    ...    3. The waveform preview of the template may be updated based on the remaining beats
    ...    4. The total count of V beats is decreased
    ...    5. All statistics and visualizations related to V beats are updated accordingly, including:
    ...       - R-R heatmap: the deleted beat is no longer counted under V classification
    ...       - Findings section: updated V-related summaries and metrics
    ...       - PDF report: VE Summary, VE Burden chart, Morphology section, and other V-related data reflect the updated count
    ...       - All statistical fields across the report are recalculated to match the new V beat count
    ...
    ...     **Others**
    ...     Create date: 4/24/2025 - Trinh Nguyen
    ...     Auto create: 4/28/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-08      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Delete a beats by hotkey

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-09: Verify that the user can change the V beat in a template to N beat by using N button in Beat marker tool
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that users can reclassify a V beat to N beat using the "N" button inside the Beat Marker Tool located in the ECG viewer
    ...    - The user activates the tool, selects the desired beat type (N), clicks on a beat within the viewer, and then saves the change
    ...    - Once saved, the beat will be removed from the current template, and the waveform preview may be updated to reflect the change
    ...
    ...     Precondition:
    ...    - A study contains at least one V beat
    ...
    ...     Test Steps:
    ...    1. Navigate to the Report Editing Page of a processed study
    ...    2. Go to the “V Morphologies” page
    ...    3. Select a template that contains at least one V beat
    ...    4. Click on any beat thumbnail to open it in the ECG viewer
    ...    5. Open the Beat Marker Tool located at the top-right corner of the ECG viewer
    ...    6. Select "N" from the marker tool options
    ...    7. Click directly on the beat in the ECG waveform to reclassify it
    ...    8. Click the "Save" button to confirm the change
    ...
    ...     Expected Results:
    ...    1. The beat is reclassified as an N beat
    ...    2. Once saved, the beat is removed from the current V template
    ...    3. The waveform preview of the template may be updated based on the remaining beats
    ...    4. The total count of V beats is decreased
    ...    5. All statistics and visualizations related to V beats are updated accordingly, including:
    ...       - R-R heatmap: the reclassified beat is no longer counted under V classification
    ...       - Findings section: updated V-related summaries and metrics
    ...       - PDF report: VE Summary, VE Burden chart, Morphology section, and other V-related data reflect the updated classification
    ...       - All statistical fields across the report are recalculated to match the new V beat count
    ...
    ...     **Others**
    ...     Create date: 4/24/2025 - Trinh Nguyen
    ...     Auto create: 4/28/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-09      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    ${number_beats}   Get Number Beats
    ${number_beats_processed}       Evaluate    ${number_beats}-1
    Add Beats In Ecg Viewer    is_add_N_beat=${True}     x_offset_time=472      y_offset_time=12
    Filter Header    is_save=${True}
    ${expected_number_beats}         Get Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats_processed}     ${expected_number_beats}

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-10: Verify that the user can change the V beat in a template to S beat by using S button in Beat marker tool
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that users can reclassify a V beat to S beat using the "S" button inside the Beat Marker Tool located in the ECG viewer
    ...    - The user activates the tool, selects the desired beat type (S), clicks on a beat within the viewer, and then saves the change
    ...    - Once saved, the beat will be removed from the current template, and the waveform preview may be updated to reflect the change
    ...
    ...     Precondition:
    ...    - A study contains at least one V beat
    ...
    ...     Test Steps:
    ...    1. Navigate to the Report Editing Page of a processed study
    ...    2. Go to the “V Morphologies” page
    ...    3. Select a template that contains at least one V beat
    ...    4. Click on any beat thumbnail to open it in the ECG viewer
    ...    5. Open the Beat Marker Tool located at the top-right corner of the ECG viewer
    ...    6. Select "S" from the marker tool options
    ...    7. Click directly on the beat in the ECG waveform to reclassify it
    ...    8. Click the "Save" button to confirm the change
    ...
    ...     Expected Results:
    ...    1. The beat is reclassified as an S beat
    ...    2. Once saved, the beat is removed from the current V template
    ...    3. The waveform preview of the template may be updated based on the remaining beats
    ...    4. The total count of V beats is decreased
    ...    5. All statistics and visualizations related to V beats are updated accordingly, including:
    ...       - R-R heatmap: the reclassified beat is no longer counted under V classification
    ...       - Findings section: updated V-related summaries and metrics
    ...       - PDF report: VE Summary, VE Burden chart, Morphology section, and other V-related data reflect the updated classification
    ...       - All statistical fields across the report are recalculated to match the new V beat count
    ...
    ...     **Others**
    ...     Create date: 4/24/2025 - Trinh Nguyen
    ...     Auto create: 4/29/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-10      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    ${number_beats}   Get Number Beats
    ${number_beats_processed}       Evaluate    ${number_beats} -1
    Add Beats In Ecg Viewer    is_add_S_beat=${True}     x_offset_time=472      y_offset_time=12
    Filter Header    is_save=${True}
    ${expected_number_beats}         Get Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats_processed}     ${expected_number_beats}

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-11: Verify that the user can change the V beat in a template to Q beat by using Q button in Beat marker tool
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that users can reclassify a V beat to Q beat using the "Q" button inside the Beat Marker Tool located in the ECG viewer
    ...    - The user activates the tool, selects the desired beat type (Q), clicks on a beat within the viewer, and then saves the change
    ...    - Once saved, the beat will be removed from the current template, and the waveform preview may be updated to reflect the change
    ...
    ...     Precondition:
    ...    - A study contains at least one V beat
    ...
    ...     Test Steps:
    ...    1. Navigate to the Report Editing Page of a processed study
    ...    2. Go to the “V Morphologies” page
    ...    3. Select a template that contains at least one V beat
    ...    4. Click on any beat thumbnail to open it in the ECG viewer
    ...    5. Open the Beat Marker Tool located at the top-right corner of the ECG viewer
    ...    6. Select "Q" from the marker tool options
    ...    7. Click directly on the beat in the ECG waveform to reclassify it
    ...    8. Click the "Save" button to confirm the change
    ...
    ...     Expected Results:
    ...    1. The beat is reclassified as a Q beat
    ...    2. Once saved, the beat is removed from the current V template
    ...    3. The waveform preview of the template may be updated based on the remaining beats
    ...    4. The total count of V beats is decreased
    ...    5. All statistics and visualizations related to V beats are updated accordingly, including:
    ...       - R-R heatmap: the reclassified beat is no longer counted under V classification
    ...       - Findings section: updated V-related summaries and metrics
    ...       - PDF report: VE Summary, VE Burden chart, Morphology section, and other V-related data reflect the updated classification
    ...       - All statistical fields across the report are recalculated to match the new V beat count
    ...
    ...     **Others**
    ...     Create date: 4/24/2025 - Trinh Nguyen
    ...     Auto create: 4/29/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-11      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    ${number_beats}   Get Number Beats
    ${number_beats_processed}       Evaluate    ${number_beats}-1
    Add Beats In Ecg Viewer    is_add_Q_beat=${True}     x_offset_time=472      y_offset_time=12
    Filter Header    is_save=${True}
    ${expected_number_beats}         Get Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats_processed}     ${expected_number_beats}

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-12: Verify that the user can change the V beat in a template to N beat by using N option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that users can reclassify a V beat to N beat using the context menu (right-click) on a beat in the ECG viewer
    ...    - Once saved, the beat will be removed from the current template, and the waveform preview may be updated to reflect the change
    ...
    ...     Precondition:
    ...    - A study contains at least one V beat
    ...
    ...     Test Steps:
    ...    1. Navigate to the Report Editing Page of a processed study
    ...    2. Go to the “V Morphologies” page
    ...    3. Select a template that contains at least one V beat
    ...    4. Click on any beat thumbnail to open it in the ECG viewer
    ...    5. Hover the mouse cursor over the beat to be changed on the ECG waveform
    ...    6. Right-click on the beat to open the context menu
    ...    7. Click on the "Change Beat Type" option from the context menu
    ...    8. Select "N" from the beat type options
    ...    9. Click the "Save" button to confirm the change
    ...
    ...     Expected Results:
    ...    1. The beat is reclassified as an N beat
    ...    2. Once saved, the beat is removed from the current V template
    ...    3. The waveform preview of the template may be updated based on the remaining beats
    ...    4. The total count of V beats is decreased
    ...    5. All statistics and visualizations related to V beats are updated accordingly, including:
    ...       - R-R heatmap: the reclassified beat is no longer counted under V classification
    ...       - Findings section: updated V-related summaries and metrics
    ...       - PDF report: VE Summary, VE Burden chart, Morphology section, and other V-related data reflect the updated classification
    ...       - All statistical fields across the report are recalculated to match the new V beat count
    ...
    ...     **Others**
    ...     Create date: 4/24/2025 - Trinh Nguyen
    ...     Auto create: 5/5/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-12      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    ${number_beats}   Get Number Beats
    ${number_beats_processed}       Evaluate    ${number_beats} -1
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Add Beats In Ecg Viewer From Context Menu    is_add_N_beat=${True}     x_offset_time=472      y_offset_time=12
    Filter Header    is_save=${True}
    ${expected_number_beats}         Get Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats_processed}     ${expected_number_beats}

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-13: Verify that the user can change the V beat in a template to S beat by using S option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that users can reclassify a V beat to S beat using the context menu (right-click) on a beat in the ECG viewer
    ...    - Once saved, the beat will be removed from the current template, and the waveform preview may be updated to reflect the change
    ...
    ...     Precondition:
    ...    - A study contains at least one V beat
    ...
    ...     Test Steps:
    ...    1. Navigate to the Report Editing Page of a processed study
    ...    2. Go to the “V Morphologies” page
    ...    3. Select a template that contains at least one V beat
    ...    4. Click on any beat thumbnail to open it in the ECG viewer
    ...    5. Hover the mouse cursor over the beat to be changed on the ECG waveform
    ...    6. Right-click on the beat to open the context menu
    ...    7. Click on the "Change Beat Type" option from the context menu
    ...    8. Select "S" from the beat type options
    ...    9. Click the "Save" button to confirm the change
    ...
    ...     Expected Results:
    ...    1. The beat is reclassified as an S beat
    ...    2. Once saved, the beat is removed from the current V template
    ...    3. The waveform preview of the template may be updated based on the remaining beats
    ...    4. The total count of V beats is decreased
    ...    5. All statistics and visualizations related to V beats are updated accordingly, including:
    ...       - R-R heatmap: the reclassified beat is no longer counted under V classification
    ...       - Findings section: updated V-related summaries and metrics
    ...       - PDF report: VE Summary, VE Burden chart, Morphology section, and other V-related data reflect the updated classification
    ...       - All statistical fields across the report are recalculated to match the new V beat count
    ...
    ...     **Others**
    ...     Create date: 4/24/2025 - Trinh Nguyen
    ...     Auto create: 5/5/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-13      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    ${number_beats}   Get Number Beats
    ${number_beats_processed}       Evaluate    ${number_beats} -1
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Add Beats In Ecg Viewer From Context Menu    is_add_S_beat=${True}     x_offset_time=472      y_offset_time=12
    Filter Header    is_save=${True}
    ${expected_number_beats}         Get Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats_processed}     ${expected_number_beats}

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-14: Verify that the user can change the V beat in a template to Q beat by using Q option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that users can reclassify a V beat to Q beat using the context menu (right-click) on a beat in the ECG viewer
    ...    - Once saved, the beat will be removed from the current template, and the waveform preview may be updated to reflect the change
    ...
    ...     Precondition:
    ...    - A study contains at least one V beat
    ...
    ...     Test Steps:
    ...    1. Navigate to the Report Editing Page of a processed study
    ...    2. Go to the “V Morphologies” page
    ...    3. Select a template that contains at least one V beat
    ...    4. Click on any beat thumbnail to open it in the ECG viewer
    ...    5. Hover the mouse cursor over the beat to be changed on the ECG waveform
    ...    6. Right-click on the beat to open the context menu
    ...    7. Click on the "Change Beat Type" option from the context menu
    ...    8. Select "Q" from the beat type options
    ...    9. Click the "Save" button to confirm the change
    ...
    ...     Expected Results:
    ...    1. The beat is reclassified as a Q beat
    ...    2. Once saved, the beat is removed from the current V template
    ...    3. The waveform preview of the template may be updated based on the remaining beats
    ...    4. The total count of V beats is decreased
    ...    5. All statistics and visualizations related to V beats are updated accordingly, including:
    ...       - R-R heatmap: the reclassified beat is no longer counted under V classification
    ...       - Findings section: updated V-related summaries and metrics
    ...       - PDF report: VE Summary, VE Burden chart, Morphology section, and other V-related data reflect the updated classification
    ...       - All statistical fields across the report are recalculated to match the new V beat count
    ...
    ...     **Others**
    ...     Create date: 4/24/2025 - Trinh Nguyen
    ...     Auto create: 5/5/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-14      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    ${number_beats}   Get Number Beats
    ${number_beats_processed}       Evaluate    ${number_beats} -1
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Add Beats In Ecg Viewer From Context Menu    is_add_Q_beat=${True}     x_offset_time=472      y_offset_time=12
    Filter Header    is_save=${True}
    ${expected_number_beats}         Get Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats_processed}     ${expected_number_beats}

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-15: Verify that the user can delete the V beat in a template by using Delete button in Beat marker tool
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that users can delete a V beat from a morphology template using the Delete button inside the Beat Marker Tool in the ECG viewer
    ...    - Once saved, the beat will be removed from the current template, and the waveform preview may be updated to reflect the change
    ...
    ...     Precondition:
    ...    - A study contains at least one V beat
    ...
    ...     Test Steps:
    ...    1. Navigate to the Report Editing Page of a processed study
    ...    2. Go to the “V Morphologies” page
    ...    3. Select a template that contains at least one V beat
    ...    4. Click on any beat thumbnail to open it in the ECG viewer
    ...    5. Open the Beat Marker Tool located at the top-right corner of the ECG viewer
    ...    6. Select "Delete" from the marker tool options
    ...    7. Click directly on the beat in the ECG waveform to delete it
    ...    8. Click the "Save" button to confirm the deletion
    ...
    ...     Expected Results:
    ...    1. The beat is deleted from the current template
    ...    2. Once saved, the beat is permanently removed from the template
    ...    3. The waveform preview of the template may be updated based on the remaining beats
    ...    4. The total count of V beats is decreased
    ...    5. All statistics and visualizations related to V beats are updated accordingly, including:
    ...       - R-R heatmap: the deleted beat is no longer counted under V classification
    ...       - Findings section: updated V-related summaries and metrics
    ...       - PDF report: VE Summary, VE Burden chart, Morphology section, and other V-related data reflect the updated count
    ...       - All statistical fields across the report are recalculated to match the new V beat count
    ...
    ...     **Others**
    ...     Create date: 4/24/2025 - Trinh Nguyen
    ...     Auto create: 5/5/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-15      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    ${number_beats}   Get Number Beats
    ${number_beats_processed}       Evaluate    ${number_beats} -1
    Add Beats In Ecg Viewer    is_delete_beat=${True}     x_offset_time=472      y_offset_time=12
    Filter Header    is_save=${True}
    ${expected_number_beats}         Get Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats_processed}     ${expected_number_beats}

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-16: Verify that the user can delete the V beat in a template by using Remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that users can delete a V beat from a morphology template using the "Remove beat" option in the right-click context menu on the ECG viewer
    ...    - Once saved, the beat will be removed from the current template, and the waveform preview may be updated to reflect the change
    ...
    ...     Precondition:
    ...    - A study contains at least one V beat
    ...
    ...     Test Steps:
    ...    1. Navigate to the Report Editing Page of a processed study
    ...    2. Go to the “V Morphologies” page
    ...    3. Select a template that contains at least one V beat
    ...    4. Click on any beat thumbnail to open it in the ECG viewer
    ...    5. Hover the mouse cursor over the beat to be deleted on the ECG waveform
    ...    6. Right-click on the beat to open the context menu
    ...    7. Click on the "Remove beat" option from the menu
    ...    8. Click the "Save" button to confirm the deletion
    ...
    ...     Expected Results:
    ...    1. The beat is deleted from the current template
    ...    2. Once saved, the beat is permanently removed from the template
    ...    3. The waveform preview of the template may be updated based on the remaining beats
    ...    4. The total count of V beats is decreased
    ...    5. All statistics and visualizations related to V beats are updated accordingly, including:
    ...       - R-R heatmap: the deleted beat is no longer counted under V classification
    ...       - Findings section: updated V-related summaries and metrics
    ...       - PDF report: VE Summary, VE Burden chart, Morphology section, and other V-related data reflect the updated count
    ...       - All statistical fields across the report are recalculated to match the new V beat count
    ...
    ...     **Others**
    ...     Create date: 4/24/2025 - Trinh Nguyen
    ...     Auto create: 5/5/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-BEAT-16      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    ${number_beats}   Get Number Beats
    ${number_beats_processed}       Evaluate    ${number_beats} -1
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Remove Beats In Ecg Viewer From Context Menu       x_offset_time=472      y_offset_time=12
    Filter Header    is_save=${True}
    ${expected_number_beats}         Get Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats_processed}     ${expected_number_beats}

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-ALL-01: Verify that the user can change all V beats in a template to N beat by using Change all to N beat action
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that users can reclassify all V beats within a morphology template to N beat using the "Change all to N beat" action
    ...    - Once saved, the template will be removed, and the template list will be re-sorted accordingly
    ...
    ...     Precondition:
    ...    - A study contains at least one V morphology template with more than one V beat
    ...
    ...     Test Steps:
    ...    1. Navigate to the Report Editing Page of a processed study
    ...    2. Go to the “V Morphologies” page
    ...    3. Select a V morphology template that contains multiple beats
    ...    4. Click the "All Beat Actions" button on the selected template
    ...    5. Choose the option "Change all to N beat"
    ...    6. Click the "Save" button to confirm the change
    ...
    ...     Expected Results:
    ...    1. All V beats in the selected template are reclassified as N beats
    ...    2. Once saved, the template is removed from the V Morphologies list
    ...    3. The template list is re-sorted based on the updated number of beats in remaining templates
    ...    4. All statistics and visualizations related to V beats are updated accordingly, including:
    ...       - R-R heatmap: reclassified beats are no longer counted under V classification
    ...       - Findings section: updated V-related summaries and metrics
    ...       - PDF report: VE Summary, VE Burden chart, Morphology section, and other V-related data reflect the updated classification
    ...       - All statistical fields across the report are recalculated to match the new V beat count
    ...
    ...     **Others**
    ...     Create date: 4/24/2025 - Trinh Nguyen
    ...     Auto create: 4/29/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-ALL-01      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Check Beats Change By Action "Change all to N beat" For Beat By "All Beats Actions" Feature

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-ALL-02: Verify that the user can change all V beats in a template to S beat by using Change all to S beat action
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that users can reclassify all V beats within a morphology template to S beat using the "Change all to S beat" action
    ...    - Once saved, the template will be removed, and the template list will be re-sorted accordingly
    ...
    ...     Precondition:
    ...    - A study contains at least one V morphology template with more than one V beat
    ...
    ...     Test Steps:
    ...    1. Navigate to the Report Editing Page of a processed study
    ...    2. Go to the “V Morphologies” page
    ...    3. Select a V morphology template that contains multiple beats
    ...    4. Click the "All Beat Actions" button on the selected template
    ...    5. Choose the option "Change all to S beat"
    ...    6. Click the "Save" button to confirm the change
    ...
    ...     Expected Results:
    ...    1. All V beats in the selected template are reclassified as S beats
    ...    2. Once saved, the template is removed from the V Morphologies list
    ...    3. The template list is re-sorted based on the updated number of beats in remaining templates
    ...    4. All statistics and visualizations related to V beats are updated accordingly, including:
    ...       - R-R heatmap: reclassified beats are no longer counted under V classification
    ...       - Findings section: updated V-related summaries and metrics
    ...       - PDF report: VE Summary, VE Burden chart, Morphology section, and other V-related data reflect the updated classification
    ...       - All statistical fields across the report are recalculated to match the new V beat count
    ...
    ...     **Others**
    ...     Create date: 4/24/2025 - Trinh Nguyen
    ...     Auto create: 4/28/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-ALL-02      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Check Beats Change By Action "Change all to S beat" For Beat By "All Beats Actions" Feature

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-ALL-03: Verify that the user can change all V beats in a template to Q beat by using Change all to Q beat action
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that users can reclassify all V beats within a morphology template to Q beat using the "Change all to Q beat" action
    ...    - Once saved, the template will be removed, and the template list will be re-sorted accordingly
    ...
    ...     Precondition:
    ...    - A study contains at least one V morphology template with more than one V beat
    ...
    ...     Test Steps:
    ...    1. Navigate to the Report Editing Page of a processed study
    ...    2. Go to the “V Morphologies” page
    ...    3. Select a V morphology template that contains multiple beats
    ...    4. Click the "All Beat Actions" button on the selected template
    ...    5. Choose the option "Change all to Q beat"
    ...    6. Click the "Save" button to confirm the change
    ...
    ...     Expected Results:
    ...    1. All V beats in the selected template are reclassified as Q beats
    ...    2. Once saved, the template is removed from the V Morphologies list
    ...    3. The template list is re-sorted based on the updated number of beats in remaining templates
    ...    4. All statistics and visualizations related to V beats are updated accordingly, including:
    ...       - R-R heatmap: reclassified beats are no longer counted under V classification
    ...       - Findings section: updated V-related summaries and metrics
    ...       - PDF report: VE Summary, VE Burden chart, Morphology section, and other V-related data reflect the updated classification
    ...       - All statistical fields across the report are recalculated to match the new V beat count
    ...
    ...     **Others**
    ...     Create date: 4/24/2025 - Trinh Nguyen
    ...     Auto create: 4/28/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-ALL-03      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Check Beats Change By Action "Change all to Q beat" For Beat By "All Beats Actions" Feature

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-ALL-04: Verify that the user can delete all V beats in a template by using Delete all beats action
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that users can delete all V beats in a morphology template using the "Delete all beats" action
    ...    - Once saved, the template will be removed, and the template list will be re-sorted accordingly
    ...
    ...     Precondition:
    ...    - A study contains at least one V morphology template with more than one V beat
    ...
    ...     Test Steps:
    ...    1. Navigate to the Report Editing Page of a processed study
    ...    2. Go to the “V Morphologies” page
    ...    3. Select a V morphology template that contains multiple beats
    ...    4. Click the "All Beat Actions" button on the selected template
    ...    5. Choose the option "Delete all beats"
    ...    6. Click the "Save" button to confirm the deletion
    ...
    ...     Expected Results:
    ...    1. All V beats in the selected template are deleted
    ...    2. Once saved, the template is removed from the V Morphologies list
    ...    3. The template list is re-sorted based on the updated number of beats in remaining templates
    ...    4. All statistics and visualizations related to V beats are updated accordingly, including:
    ...       - R-R heatmap: deleted beats are no longer counted under V classification
    ...       - Findings section: updated V-related summaries and metrics
    ...       - PDF report: VE Summary, VE Burden chart, Morphology section, and other V-related data reflect the updated count
    ...       - All statistical fields across the report are recalculated to match the new V beat count
    ...
    ...     **Others**
    ...     Create date: 4/24/2025 - Trinh Nguyen
    ...     Auto create: 4/28/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-ALL-04      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Check Beats Change By Action "Delete all beats" For Beat By "All Beats Actions" Feature

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-ALL-05: Verify that the user can swap all V beats in a template to another template by using Swap the template action
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that users can move all V beats from one morphology template to another using the "Swap the template" action
    ...    - Once saved, the beats are merged into the selected target template, and the source template is removed from the list
    ...
    ...     Precondition:
    ...    - A study contains at least two V morphology templates
    ...
    ...     Test Steps:
    ...    1. Navigate to the Report Editing Page of a processed study
    ...    2. Go to the “V Morphologies” page
    ...    3. Select a V morphology template that contains multiple beats
    ...    4. Click the "All Beat Actions" button on the selected template
    ...    5. Choose the option "Swap the template"
    ...    6. Select another existing template as the target to receive the beats
    ...    7. Click the "Save" button to confirm the action
    ...
    ...     Expected Results:
    ...    1. All V beats in the selected template are reassigned to the target template
    ...    2. Once saved, the source template is removed from the V Morphologies list
    ...    3. The target template now contains all combined beats and may have an updated waveform preview
    ...    4. The template list is re-sorted based on the updated number of beats in each template
    ...    5. R-R heatmap and Findings section remain unchanged
    ...    6. In the final PDF report:
    ...       - No changes occur in VE Summary, VE Burden chart, or Findings
    ...       - If the original template was previously marked as "Include in report", it will no longer appear in the V Morphologies page
    ...
    ...     **Others**
    ...     Create date: 4/27/2025 - Trinh Nguyen
    ...     Auto create: 4/28/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-ALL-05      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Check Beats Change By Action "Swap the template" For Beat By "All Beats Actions" Feature

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-01: Verify that the user can Do nothing action to all beats in a page by using Do nothing button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    -
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...
    ...     **Others**
    ...     Create date: 4/27/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-01      AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-02: Verify user can apply "Change all to N beat" across pages using button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    -
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...
    ...     **Others**
    ...     Create date: 4/27/2025 - Trinh Nguyen
    ...     Auto create: 5/5/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-02      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Check Beats Change By Action "Change all to N beat" For Beat By "Page Actions" Feature

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-03: Verify user can apply "Change all to S beat" across pages using button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    -
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...
    ...     **Others**
    ...     Create date: 4/27/2025 - Trinh Nguyen
    ...     Auto create: 5/5/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-03      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Check Beats Change By Action "Change all to S beat" For Beat By "Page Actions" Feature

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-04: Verify user can apply "Change all to V beat" across pages using button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    -
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...
    ...     **Others**
    ...     Create date: 4/27/2025 - Trinh Nguyen
    ...     Auto create: 5/5/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-04      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Check Beats Change By Action "Change all to V beat" For Beat By "Page Actions" Feature

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-05: Verify user can apply "Change all to Q beat" across pages using button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    -
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...
    ...     **Others**
    ...     Create date: 4/27/2025 - Trinh Nguyen
    ...     Auto create: 5/5/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-05      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Check Beats Change By Action "Change all to Q beat" For Beat By "Page Actions" Feature

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-06: Verify user can apply "Delete all beats" across pages using button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    -
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...
    ...     **Others**
    ...     Create date: 4/27/2025 - Trinh Nguyen
    ...     Auto create: 5/5/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-06      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Check Beats Change By Action "Delete all beats" For Beat By "Page Actions" Feature

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-07: Verify user can apply "Swap the template" across pages using button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    -
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...
    ...     **Others**
    ...     Create date: 4/27/2025 - Trinh Nguyen
    ...     Auto create: 5/5/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-07      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Check Beats Change By Action "Swap the template" For Beat By "Page Actions" Feature

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-08: Verify that the user can Do nothing action to all beats in a page by using hotkey 1
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    -
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...
    ...     **Others**
    ...     Create date: 4/27/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-08      AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-09: Verify user can apply "Change all to N beat" across pages using hotkey 2
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    -
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...
    ...     **Others**
    ...     Create date: 4/27/2025 - Trinh Nguyen
    ...     Auto create: 5/5/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-09      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Check Beats Change By Action With Hotkey "2" For Beat "N" By "Page Actions" Feature

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-10: Verify user can apply "Change all to S beat" across pages using hotkey 3
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    -
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...
    ...     **Others**
    ...     Create date: 4/27/2025 - Trinh Nguyen
    ...     Auto create: 5/5/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-10      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Check Beats Change By Action With Hotkey "3" For Beat "S" By "Page Actions" Feature

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-11: Verify user can apply "Change all to V beat" across pages using hotkey 4
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    -
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...
    ...     **Others**
    ...     Create date: 4/27/2025 - Trinh Nguyen
    ...     Auto create: 5/5/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-11      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Check Beats Change By Action With Hotkey "4" For Beat "V" By "Page Actions" Feature

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-12: Verify user can apply "Change all to Q beat" across pages using hotkey 5
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    -
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...
    ...     **Others**
    ...     Create date: 4/27/2025 - Trinh Nguyen
    ...     Auto create: 5/5/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-12      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Check Beats Change By Action With Hotkey "5" For Beat "Q" By "Page Actions" Feature

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-13: Verify user can apply "Delete all beats" across pages using hotkey 6
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    -
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...
    ...     **Others**
    ...     Create date: 4/27/2025 - Trinh Nguyen
    ...     Auto create: 5/5/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-13      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Check Beats Change By Action With Hotkey "6" For "Delete all beats" Beat By "Page Actions" Feature

BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-14: Verify user can apply "Swap the template" across pages using hotkey 7
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    -
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...
    ...     **Others**
    ...     Create date: 4/27/2025 - Trinh Nguyen
    ...     Auto create: 5/5/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CHANGE-PAGE-14      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    ${number_beats}   Get Number Beats
    ${number_beats_processed}       Evaluate    ${number_beats} -16
    ${number_page}    Get Current Total Page Airp Pagination
    ${actual_number_page}    Evaluate    ${number_page}-1
    Change Strip To Beats On Page     beat_change_by_hotkey=7
    ${current_action}       Get Current Action Change
    Run Keyword And Continue On Failure    Should Be Equal   ${current_action}        Swap the template
    ${action_selected}      Get Action Change Selected
    Run Keyword And Continue On Failure    Should Be Equal    ${action_selected}[0][Beat Change]       Swap the template
    Run Keyword And Continue On Failure    Should Be Equal    ${action_selected}[0][Hotkey]       7
    Filter Header    is_save=${True}
    ${expected_number_page}    Get Current Total Page Airp Pagination
    ${expected_number_beats}         Get Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats_processed}     ${expected_number_beats}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_page}     ${expected_number_page}


BFCC-AIRP-V-MORPHOLOGIES-MARK-REVIEWED-01: Verify user can mark templates as reviewed by using Mark as reviewed button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    -
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...
    ...     **Others**
    ...     Create date: 4/27/2025 - Trinh Nguyen
    ...     Auto create: 5/6/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-MARK-REVIEWED-01      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    ${result}    Get Icon In Template
    Run Keyword And Continue On Failure    Should Not Be True    ${result}
    Filter Action    is_mark_as_reviewed=${True}
    ${result_1}    Get Icon In Template
    Run Keyword And Continue On Failure    Should Be True    ${result_1}
    Filter Action    is_save=${True}
    ${result_2}    Get Icon In Template
    Run Keyword And Continue On Failure    Should Be True    ${result_2}
    Navigate To Template On    row=1
    Filter Action    is_mark_as_reviewed=${True}
    Filter Action    is_save=${True}
    ${result_3}    Get Icon In Template
    Run Keyword And Continue On Failure    Should Not Be True    ${result_3}
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-MARK-REVIEWED-01      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    ${result}    Get Icon In Template
    Run Keyword And Continue On Failure    Should Not Be True    ${result}
    Filter Action    is_mark_as_reviewed=${True}
    ${result_1}    Get Icon In Template
    Run Keyword And Continue On Failure    Should Be True    ${result_1}
    Filter Action    is_save=${True}
    ${result_2}    Get Icon In Template
    Run Keyword And Continue On Failure    Should Be True    ${result_2}
    Navigate To Template On    row=1
    Filter Action    is_mark_as_reviewed=${True}
    Filter Action    is_save=${True}
    ${result_3}    Get Icon In Template
    Run Keyword And Continue On Failure    Should Not Be True    ${result_3}

BFCC-AIRP-V-MORPHOLOGIES-MARK-REVIEWED-02: Verify user can mark templates as reviewed by using hotkey R
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    -
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...
    ...     **Others**
    ...     Create date: 4/27/2025 - Trinh Nguyen
    ...     Auto create: 5/6/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-MARK-REVIEWED-02      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    ${result}    Get Icon In Template
    Run Keyword And Continue On Failure    Should Not Be True    ${result}
    Filter Action    is_mark_as_reviewed=${True}    by_hotkey=${True}
    ${result_1}    Get Icon In Template
    Run Keyword And Continue On Failure    Should Be True    ${result_1}
    Filter Action    is_save=${True}
    ${result_2}    Get Icon In Template
    Run Keyword And Continue On Failure    Should Be True    ${result_2}
    Navigate To Template On    row=1
    Filter Action    is_mark_as_reviewed=${True}    by_hotkey=${True}
    Filter Action    is_save=${True}
    ${result_3}    Get Icon In Template
    Run Keyword And Continue On Failure    Should Not Be True    ${result_3}
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-MARK-REVIEWED-02      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    ${result}    Get Icon In Template
    Run Keyword And Continue On Failure    Should Not Be True    ${result}
    Filter Action    is_mark_as_reviewed=${True}    by_hotkey=${True}
    ${result_1}    Get Icon In Template
    Run Keyword And Continue On Failure    Should Be True    ${result_1}
    Filter Action    is_save=${True}
    ${result_2}    Get Icon In Template
    Run Keyword And Continue On Failure    Should Be True    ${result_2}
    Navigate To Template On    row=1
    Filter Action    is_mark_as_reviewed=${True}    by_hotkey=${True}
    Filter Action    is_save=${True}
    ${result_3}    Get Icon In Template
    Run Keyword And Continue On Failure    Should Not Be True    ${result_3}

BFCC-AIRP-V-MORPHOLOGIES-MARK-REVIEWED-03: Verify that the 'Mark as reviewed' function is not available for the Unclassified category
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    -
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...
    ...     **Others**
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/6/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-MARK-REVIEWED-03      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    Navigate To Unclassified
    ${result}    Check Template Displayed
    Run Keyword And Continue On Failure    Should Not Be True    ${result}[Mark as reviewed]

BFCC-AIRP-V-MORPHOLOGIES-MARK-REVIEWED-04: Verify that a tooltip is displayed when the user hovers over the 'Mark as reviewed' button while the Unclassified category is selected
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    -
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...
    ...     **Others**
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-MARK-REVIEWED-04      AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-INCLUDE-REPORT-01: Verify that the user is able to select up to five morphology patterns to be included in the final EOU report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    -
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...
    ...     **Others**
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/6/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-INCLUDE-REPORT-01      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    Include in report full template
    Undo Until Disabled

BFCC-AIRP-V-MORPHOLOGIES-INCLUDE-REPORT-02: Verify that a warning is displayed if the user selects more than five morphology patterns
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    -
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...
    ...     **Others**
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/6/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-INCLUDE-REPORT-02      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    Include in report full template
    Navigate To Template On    row=6
    ${result}    Get Icon In Template
    Run Keyword And Continue On Failure    Should Not Be True    ${result}
    Filter Action    is_include_in_report=${True}
    ${msg}    Get Modal Texts
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}[0][Title]    Cannot include morphology
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}[0][Message]    A maximum of 5 morphologies can be included in the report. Please exclude others and try again.
    Filter Action    is_okay=${True}
    Undo Until Disabled


BFCC-AIRP-V-MORPHOLOGIES-INCLUDE-REPORT-03: Verify that the Okay button on the warning is working properly
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    -
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...
    ...     **Others**
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/6/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-INCLUDE-REPORT-03      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    Include in report full template
    Navigate To Template On    row=6
    ${result}    Get Icon In Template
    Run Keyword And Continue On Failure    Should Not Be True    ${result}
    Filter Action    is_include_in_report=${True}
    ${msg}    Get Modal Texts
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}[0][Title]     Cannot include morphology
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}[0][Message]    A maximum of 5 morphologies can be included in the report. Please exclude others and try again.
    Filter Action    is_okay=${True}
    Verify Popup Turn Off
    Undo Until Disabled

BFCC-AIRP-V-MORPHOLOGIES-INCLUDE-REPORT-04: Verify that the 'Include in Report' function is not available for the Unclassified category
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    -
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...
    ...     **Others**
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/6/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-INCLUDE-REPORT-04      AIRP-1.15.0       auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    Navigate To Unclassified
    ${result}    Check Template Displayed
    Run Keyword And Continue On Failure    Should Not Be True    ${result}[Include in report]

BFCC-AIRP-V-MORPHOLOGIES-INCLUDE-REPORT-05: Verify that a tooltip is displayed when the user hovers over the 'Include in Report' button while the Unclassified category is selected
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    -
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...
    ...     **Others**
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-INCLUDE-REPORT-05      AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-01: Verify the first event will be selected by default
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 4/29/2025 - Trinh Nguyenn
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-01       AIRP-1.15.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-02: Verify the thumbnail is displayed correctly in the first view
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
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/6/2025 - Hoang Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-02       AIRP-1.15.0             auto      R2
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    ${thumbnail_beats}       Select Thumbnail Option On    CH1, CH2, CH3
    ${expected_option_one}       Create List    CH1   CH2   CH3
    ${expected_option_two}       Create List    AI
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_option_one}    ${thumbnail_beats}
    ${thumbnail_beats}       Select Thumbnail Option On    AI
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_option_two}    ${thumbnail_beats}

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-02.1: Verify that all functionalities are working properly
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/6/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-02.1       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    ${actual_channel_config}        Get Thumbnail Overview
    ${expected_channel_config}      Create List    CH1   CH2   CH3   AI
    ${expected_size_config}         Create List    Small   Medium   Large
    ${expected_gain_config}         Create List    1 mm/mV   2 mm/mV   5 mm/mV   7.5 mm/mV   10 mm/mV   20 mm/mV    50 mm/mV   100 mm/mV    200 mm/mV
    ${expected_highpass_config}     Create List    No   0.05 Hz    0.5 Hz    1 Hz    2 Hz
    ${actual_size_config}           Get Size Config
    ${actual_gain_config}           Get Gain Config
    ${actual_highpass_config}       Get Highpass Config
    Run Keyword And Continue On Failure    Lists Should Be Equal   ${expected_gain_config}          ${actual_gain_config}
    Run Keyword And Continue On Failure    Lists Should Be Equal   ${expected_highpass_config}          ${actual_highpass_config}
    Run Keyword And Continue On Failure    Lists Should Be Equal   ${expected_channel_config}       ${actual_channel_config}[Thumbnail]
    Run Keyword And Continue On Failure    Lists Should Be Equal   ${expected_size_config}          ${actual_size_config}
    Run Keyword And Continue On Failure     Should Be Equal    ${actual_channel_config}[Size][0]       Medium
    Run Keyword And Continue On Failure     Should Be Equal    ${actual_channel_config}[Gain][0]       7.5
    Run Keyword And Continue On Failure     Should Be Equal    ${actual_channel_config}[HP][0]        1

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-03: Verify the channel on thumbnail is displayed correctly after selecting only CH1 channel
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
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/6/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-03       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Filter Header    channel=CH1
    ${events_thumbnail}     Get Thumbnail Events
    ${actual_channel}         Evaluate    [item['Channel'][0] for item in ${events_thumbnail}]
    ${all_value}          Evaluate      all([value == 'CH1' for value in ${actual_channel}])
    Run Keyword And Continue On Failure     Should Be Equal     ${all_value}     ${True}

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-04: Verify the channel on thumbnail is displayed correctly after selecting only CH2 channel
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
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/6/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-04       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Filter Header    channel=CH2
    ${events_thumbnail}     Get Thumbnail Events
    ${actual_channel}         Evaluate    [item['Channel'][0] for item in ${events_thumbnail}]
    ${all_value}          Evaluate      all([value == 'CH2' for value in ${actual_channel}])
    Run Keyword And Continue On Failure     Should Be Equal     ${all_value}     ${True}


BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-05: Verify the channel on thumbnail is displayed correctly after selecting only CH3 channel
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
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/6/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-05       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Filter Header    channel=CH3
    ${events_thumbnail}     Get Thumbnail Events
    ${actual_channel}         Evaluate    [item['Channel'][0] for item in ${events_thumbnail}]
    ${all_value}          Evaluate      all([value == 'CH3' for value in ${actual_channel}])
    Run Keyword And Continue On Failure     Should Be Equal     ${all_value}     ${True}


BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-06: Verify the channel on thumbnail is displayed correctly after selecting only AI channel
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
    ...     Create date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-06       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-07: Verify the channel on thumbnail is displayed correctly after selecting CH1 & CH2 channels
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
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/6/2025 - Hoang Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-07       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Filter Header       channel=CH1, CH2
    ${list_channel}       Create List    CH1  CH2
    ${channel_active}    Get Channels On Thumbnail
    ${number_channel}     Get Number Channel
    Run Keyword And Continue On Failure    Should Be Equal    ${list_channel}    ${channel_active}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${number_channel}    2

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-08: Verify the channel on thumbnail is displayed correctly after selecting CH1 & CH3 channels
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
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/6/2025 - Hoang Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-08       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Filter Header       channel=CH1, CH3
    ${list_channel}       Create List    CH1  CH3
    ${channel_active}    Get Channels On Thumbnail
    ${number_channel}     Get Number Channel
    Run Keyword And Continue On Failure    Should Be Equal    ${list_channel}    ${channel_active}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${number_channel}    2

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-09: Verify the channel on thumbnail is displayed correctly after selecting CH2 & CH3 channels
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
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/6/2025 - Hoang Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-09       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Filter Header       channel=CH2, CH3
    ${list_channel}       Create List    CH2  CH3
    ${channel_active}    Get Channels On Thumbnail
    ${number_channel}     Get Number Channel
    Run Keyword And Continue On Failure    Should Be Equal    ${list_channel}    ${channel_active}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${number_channel}    2

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-10: Verify the channel on thumbnail is displayed correctly after selecting CH1 & CH2 & CH3 channels
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
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/6/2025 - Hoang Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-10       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Filter Header       channel=CH1, CH2, CH3
    ${list_channel}       Create List    CH1  CH2  CH3
    ${channel_active}    Get Channels On Thumbnail
    ${number_channel}     Get Number Channel
    Run Keyword And Continue On Failure    Should Be Equal    ${list_channel}    ${channel_active}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${number_channel}    3

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-11: Verify the size on thumbnail is displayed correctly after selecting Small size
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/6/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-11       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    ${number_small_size}          Filter Header    size=Small
    ${number_medium_size}         Filter Header    size=Medium
    ${number_large_size}          Filter Header    size=Large
    ${number_status}              Verify Number Size Heatmap    number_small=${number_small_size}   number_medium=${number_medium_size}     number_large=${number_large_size}
    Run Keyword And Continue On Failure    Should Be Equal     ${number_status}     ${True}

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-12: Verify the size on thumbnail is displayed correctly after selecting Medium size
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
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/6/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-12       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #This case has been auto at BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-11

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-13: Verify the size on thumbnail is displayed correctly after selecting Large size
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
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/6/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-13       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #This case has been auto at BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-11

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-14: Verify the gain on thumbnail is displayed correctly after selecting 1 mm/mV gain
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
    ...     Create date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-14       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-15: Verify the gain on thumbnail is displayed correctly after selecting 2 mm/mV gain
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
    ...     Create date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-15       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-16: Verify the gain on thumbnail is displayed correctly after selecting 5 mm/mV gain
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
    ...     Create date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-16       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-18: Verify the gain on thumbnail is displayed correctly after selecting 7.5 mm/mV gain
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
    ...     Create date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-18       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-19: Verify the gain on thumbnail is displayed correctly after selecting 10 mm/mV gain
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
    ...     Create date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-19       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-20: Verify the gain on thumbnail is displayed correctly after selecting 20 mm/mV gain
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
    ...     Create date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-20       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-21: Verify the gain on thumbnail is displayed correctly after selecting 50 mm/mV gain
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
    ...     Create date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-21       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-22: Verify the gain on thumbnail is displayed correctly after selecting 100 mm/mV gain
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
    ...     Create date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-22       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-23: Verify the gain on thumbnail is displayed correctly after selecting 200 mm/mV gain
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
    ...     Create date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-23       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-24: Verify the HP on thumbnail is displayed correctly after selecting No HP
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
    ...     Create date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-24       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-25: Verify the HP on thumbnail is displayed correctly after selecting 0.05 Hz HP
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
    ...     Create date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-25       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-26: Verify the HP on thumbnail is displayed correctly after selecting 0.5 Hz HP
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
    ...     Create date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-26       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-27: Verify the HP on thumbnail is displayed correctly after selecting 1 Hz HP
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
    ...     Create date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-27       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-28: Verify the HP on thumbnail is displayed correctly after selecting 2 Hz HP
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
    ...     Create date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-FUNCTIONALITY-28       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-PAGINATION-01: Can next page by using Next/Previous button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/6/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-PAGINATION-01       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    ${current_pagination_default}     Get Current Airp Pagination
    Pagination Aireports    next_or_previous=next
    ${current_pagination_next}     Get Current Airp Pagination
    Pagination Aireports    next_or_previous=previous
    ${current_pagination_previous}     Get Current Airp Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_default}[Page]     1
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_next}[Page]     2
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_previous}[Page]     1

BFCC-AIRP-V-MORPHOLOGIES-PAGINATION-02: Can next page by using the hotkey ‘Z’ or ‘X’
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     3.
    ...
    ...     **Others**
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/6/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-PAGINATION-02       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    ${current_pagination_default}     Get Current Airp Pagination
    Pagination Aireports Hotkey    next_or_previous=next
    ${current_pagination_next}     Get Current Airp Pagination
    Pagination Aireports Hotkey    next_or_previous=previous
    ${current_pagination_previous}     Get Current Airp Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_default}[Page]     1
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_next}[Page]     2
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_previous}[Page]     1

BFCC-AIRP-V-MORPHOLOGIES-PAGINATION-03: Can manually input a number within the limit displayed on the page number
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/6/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-PAGINATION-03       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    ${current_pagination_default}     Get Current Airp Pagination
    ${status_page_less_than}     Edit Page Number      page_number=0
    ${current_total_page}     Get Current Total Page Airp Pagination
    ${current_total_page}     Evaluate    ${current_total_page} + 1
    ${status_page_lager_than}     Edit Page Number      page_number=${current_total_page}
    ${status_page}     Edit Page Number      page_number=1
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_default}[Page]     1
    Run Keyword And Continue On Failure    Should Be Equal    ${status_page_less_than}        ${False}
    Run Keyword And Continue On Failure    Should Be Equal    ${status_page_lager_than}       ${False}
    Run Keyword And Continue On Failure    Should Be Equal    ${status_page}      ${True}

BFCC-AIRP-V-MORPHOLOGIES-PAGINATION-04: Check case user input the number is larger than the all page number
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
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-PAGINATION-04       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-PAGINATION-05: Check case the system shall block the entry of values other than integers
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
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-PAGINATION-05       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-THUMBNAIL-01: Verify that all information on the V beat thumbnail is displayed completely
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Create date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-THUMBNAIL-01      AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-01: Verify the data shall be shown corresponding in ECG viewer once the user selects the event
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-01       AIRP-1.15.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-02: Can go to next/previous second
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
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/7/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-02       AIRP-1.15.0     auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    ${time_default}     Get Time Strip Info
    ${start_time}      Get From Dictionary    ${time_default}    Start Time
    ${stop_time}       Get From Dictionary    ${time_default}    Stop Time
    ${start_back_10}  Evaluate    (datetime.datetime.strptime("${start_time}", "%H:%M:%S") - datetime.timedelta(seconds=10)).time().strftime("%H:%M:%S")    modules=datetime
    ${stop_back_10}   Evaluate    (datetime.datetime.strptime("${stop_time}", "%H:%M:%S") - datetime.timedelta(seconds=10)).time().strftime("%H:%M:%S")    modules=datetime
    Filter Action    is_back_second=${True}
    ${expected_back_time}     Get Time Strip Info
    ${start_time_back}     Get From Dictionary    ${expected_back_time}    Start Time
    ${stop_time_back}      Get From Dictionary    ${expected_back_time}    Stop Time
    Run Keyword And Continue On Failure    Should Be Equal    ${start_time_back}     ${start_back_10}
    Run Keyword And Continue On Failure    Should Be Equal    ${stop_time_back}      ${stop_back_10}
    Reload Page
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    ${time_default_1}     Get Time Strip Info
    ${start_time_1}      Get From Dictionary    ${time_default_1}    Start Time
    ${stop_time_1}       Get From Dictionary    ${time_default_1}    Stop Time
    ${start_next_10}   Evaluate    (datetime.datetime.strptime("${start_time_1}", "%H:%M:%S") + datetime.timedelta(seconds=10)).time().strftime("%H:%M:%S")    modules=datetime
    ${stop_next_10}    Evaluate    (datetime.datetime.strptime("${stop_time_1}", "%H:%M:%S") + datetime.timedelta(seconds=10)).time().strftime("%H:%M:%S")    modules=datetime
    Filter Action    is_next_second=${True}
    ${expected_next_time}     Get Time Strip Info
    ${start_time_next}     Get From Dictionary    ${expected_next_time}    Start Time
    ${stop_time_next}      Get From Dictionary    ${expected_next_time}    Stop Time
    Run Keyword And Continue On Failure    Should Be Equal    ${start_time_next}     ${start_next_10}
    Run Keyword And Continue On Failure    Should Be Equal    ${stop_time_next}      ${stop_next_10}



BFCC-AIRP-V-MORPHOLOGIES-ECG-03: Check the toolbar on ECG viewer is working properly
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
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/7/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-03     AIRP-1.15.0    auto        R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    ${expected_status}     Check Toolbar Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Speed]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Gain]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[High Pass]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Low Pass]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH1]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH2]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH3]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Capture]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Beat Marker Tool]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[View All Strip]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Zool Tool]


BFCC-AIRP-V-MORPHOLOGIES-ECG-05: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 2.5 mm/s
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-05       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-04.1: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 10 mm/s
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-04.1       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-05.1: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 25 mm/s
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-05.1       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-06: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 50 mm/s
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-06       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-07: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 75 mm/s
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-07       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-08: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 100 mm/s
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-08       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-09: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 200 mm/s
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-09       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-10: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 500 mm/s
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-10       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-11: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 1 mm/mV
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-11       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-12: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 2 mm/mV
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-12       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-13: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 5 mm/mV
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-13       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-14: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 7.5 mm/mV
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-14       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-15: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 10 mm/mV
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-15       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-16: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 20 mm/mV
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-16       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-17: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 50 mm/mV
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-17       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-18: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 100 mm/mV
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-18       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-19: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 200 mm/mV
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-19       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-20: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to No
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-20       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-21: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 0.05 Hz
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-21       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-22: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 0.5 Hz
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-22       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-23: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 1 Hz
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-23      AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-24: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 2 Hz
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-24       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-25: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to No
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-25       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-26: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 15 Hz
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-26       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-27: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 30 Hz
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-27       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-28: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 40 Hz
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-28       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-29: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 50 Hz (Notch)
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-29       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-30: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 60 Hz (Notch)
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-30       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-31: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 100 Hz
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-31       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-32: Verify that the the ECG Viewer displays correctly after hiding only the CH1 channel
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-32       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-33: Verify that the the ECG Viewer displays correctly after hiding only the CH2 channel
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-33       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-34: Verify that the the ECG Viewer displays correctly after hiding only the CH3 channel
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-34       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-35: Verify that the the ECG Viewer displays correctly after hiding the CH1 & CH2 channel
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-35       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-36: Verify that the the ECG Viewer displays correctly after hiding the CH1 & CH3 channel
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-36       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-37: Verify that the the ECG Viewer displays correctly after hiding the CH2 & CH3 channel
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
    ...     Update date: 4/29/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-37       AIRP-1.15.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-49.3: Verify that the user can add an N beat in the ECG Viewer using the N beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/7/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-49.3       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Add Beats In Ecg Viewer    is_add_N_beat=${True}   x_offset_time=-410    y_offset_time=100
    Filter Header   is_reset_change=${True}
    Add Beats In Ecg Viewer    is_add_N_beat=${True}   x_offset_time=-410    y_offset_time=100
    Filter Header   is_save=${True}


BFCC-AIRP-V-MORPHOLOGIES-ECG-50: Verify that the user can add an N beat in the ECG Viewer using the 'N' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/7/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-50       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Add Beats In Ecg Viewer    is_add_N_beat=${True}   x_offset_time=-410    y_offset_time=100    use_hotkey=${True}
    Filter Header   is_reset_change=${True}
    Add Beats In Ecg Viewer    is_add_N_beat=${True}   x_offset_time=-410    y_offset_time=100    use_hotkey=${True}
    Filter Header   is_save=${True}


BFCC-AIRP-V-MORPHOLOGIES-ECG-51: Verify that the user can add an N beat in the ECG Viewer using add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/7/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-51       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Add Beats In Ecg Viewer From Context Menu    is_add_N_beat=${True}     x_offset_time=-410      y_offset_time=100
    Filter Header   is_reset_change=${True}
    Add Beats In Ecg Viewer From Context Menu    is_add_N_beat=${True}     x_offset_time=-410      y_offset_time=100
    Filter Header   is_save=${True}


BFCC-AIRP-V-MORPHOLOGIES-ECG-52: Verify that the user can change V/S/Q beat to N beat in the ECG Viewer using the N beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-52       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-53: Verify that the user can change V/S/Q beat to N beat in the ECG Viewer using the 'N' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-53       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-54: Verify that the user can change V/S/Q beats to N beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-54       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-55: Verify that the user can delete an N beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-55       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-56: Verify that the user can delete an N beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-56       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-57: Verify that the user can delete an N beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-57       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-59: Verify that the user can add an S beat in the ECG Viewer using the S beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/8/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-59       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Add Beats In Ecg Viewer From Context Menu    is_add_S_beat=${True}     x_offset_time=-410      y_offset_time=100
    Filter Header   is_reset_change=${True}
    Add Beats In Ecg Viewer From Context Menu    is_add_S_beat=${True}     x_offset_time=-410      y_offset_time=100
    Filter Header   is_save=${True}

BFCC-AIRP-V-MORPHOLOGIES-ECG-60: Verify that the user can add an S beat in the ECG Viewer using the 'S' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/8/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-60       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Add Beats In Ecg Viewer From Context Menu    is_add_S_beat=${True}     x_offset_time=-410      y_offset_time=100    use_hotkey=${True}
    Filter Header   is_reset_change=${True}
    Add Beats In Ecg Viewer From Context Menu    is_add_S_beat=${True}     x_offset_time=-410      y_offset_time=100    use_hotkey=${True}
    Filter Header   is_save=${True}

BFCC-AIRP-V-MORPHOLOGIES-ECG-61: Verify that the user can add an S beat in the ECG Viewer using the add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/8/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-61       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Add Beats In Ecg Viewer From Context Menu    is_add_N_beat=${True}     x_offset_time=-410      y_offset_time=100
    Filter Header   is_reset_change=${True}
    Add Beats In Ecg Viewer From Context Menu    is_add_N_beat=${True}     x_offset_time=-410      y_offset_time=100
    Filter Header   is_save=${True}

BFCC-AIRP-V-MORPHOLOGIES-ECG-62: Verify that the user can change N/V/Q beat to S beat in the ECG Viewer using the S beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-62       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-63: Verify that the user can change N/V/Q beat to S beat in the ECG Viewer using the 'S' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-63       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-64: Verify that the user can change N/V/Q beat to S beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-64       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-65: Verify that the user can delete an S beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-65       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-66: Verify that the user can delete an S beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-66       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-67: Verify that the user can delete an S beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-67       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-69: Verify that the user can add an V beat in the ECG Viewer using the V beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/8/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-69       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Add Beats In Ecg Viewer From Context Menu    is_add_V_beat=${True}     x_offset_time=-410      y_offset_time=100
    Filter Header   is_reset_change=${True}
    Add Beats In Ecg Viewer From Context Menu    is_add_V_beat=${True}     x_offset_time=-410      y_offset_time=100
    Filter Header   is_save=${True}

BFCC-AIRP-V-MORPHOLOGIES-ECG-70: Verify that the user can add an V beat in the ECG Viewer using the add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/8/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-70       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Add Beats In Ecg Viewer From Context Menu    is_add_V_beat=${True}     x_offset_time=-410      y_offset_time=100
    Filter Header   is_reset_change=${True}
    Add Beats In Ecg Viewer From Context Menu    is_add_V_beat=${True}     x_offset_time=-410      y_offset_time=100
    Filter Header   is_save=${True}

BFCC-AIRP-V-MORPHOLOGIES-ECG-71: Verify that the user can add an V beat in the ECG Viewer using the 'V' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/8/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-71       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Add Beats In Ecg Viewer From Context Menu    is_add_V_beat=${True}     x_offset_time=-410      y_offset_time=100    use_hotkey=${True}
    Filter Header   is_reset_change=${True}
    Add Beats In Ecg Viewer From Context Menu    is_add_V_beat=${True}     x_offset_time=-410      y_offset_time=100    use_hotkey=${True}
    Filter Header   is_save=${True}

BFCC-AIRP-V-MORPHOLOGIES-ECG-72: Verify that the user can change N/S/Q beat to V in the ECG Viewer using the V beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-72       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-73: Verify that the user can change N/S/Q beat to V beat in the ECG Viewer using the 'V' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-73       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-74: Verify that the user can change N/S/Q beat to V beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-74       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-75: Verify that the user can delete an V beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-75       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-76: Verify that the user can delete an V beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-76       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-77: Verify that the user can delete an V beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-77       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-78: Verify that the user can delete an V beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-78       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-79: Verify that the user can add an Q beat in the ECG Viewer using the Q beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/8/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-79       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Add Beats In Ecg Viewer From Context Menu    is_add_Q_beat=${True}     x_offset_time=-410      y_offset_time=100
    Filter Header   is_reset_change=${True}
    Add Beats In Ecg Viewer From Context Menu    is_add_Q_beat=${True}     x_offset_time=-410      y_offset_time=100
    Filter Header   is_save=${True}

BFCC-AIRP-V-MORPHOLOGIES-ECG-80: Verify that the user can add an Q beat in the ECG Viewer using the 'Q' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/8/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-80       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Add Beats In Ecg Viewer From Context Menu    is_add_N_beat=${True}     x_offset_time=-410      y_offset_time=100    use_hotkey=${True}
    Filter Header   is_reset_change=${True}
    Add Beats In Ecg Viewer From Context Menu    is_add_N_beat=${True}     x_offset_time=-410      y_offset_time=100    use_hotkey=${True}
    Filter Header   is_save=${True}

BFCC-AIRP-V-MORPHOLOGIES-ECG-81: Verify that the user can add an Q beat in the ECG Viewer using the add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...     Auto create: 5/8/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-81       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Add Beats In Ecg Viewer From Context Menu    is_add_Q_beat=${True}     x_offset_time=-410      y_offset_time=100
    Filter Header   is_reset_change=${True}
    Add Beats In Ecg Viewer From Context Menu    is_add_Q_beat=${True}     x_offset_time=-410      y_offset_time=100
    Filter Header   is_save=${True}

BFCC-AIRP-V-MORPHOLOGIES-ECG-82: Verify that the user can change N/S/V beat to Q beat in the ECG Viewer using the Q beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-82       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-83: Verify that the user can change N/S/V beat to Q beat in the ECG Viewer using the 'Q' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-83       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-84: Verify that the user can change N/S/V beat to Q beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-84       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-85: Verify that the user can delete an Q beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-85       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-86: Verify that the user can delete an Q beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-86       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-87: Verify that the user can delete an Q beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-87       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-88: Verify that the user can delete an Q beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-88       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-89: Verify that the Zoom in toolbar is functioning correctly in ECG Viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-89       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-90: Verify that the Zoom out toolbar is functioning correctly in ECG Viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-90       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-91: Verify that the user can exit "View All Strips" mode by clicking the "Exit view all strip mode" button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-91       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-92: Verify that the Horizontal Caliper option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-92       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-93: Verify that the Horizontal Caliper option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-93       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-94: Verify that the Vertical Caliper option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-94       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-95: Verify that the Beat Calipers option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-95       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-96: Verify that the Text Annotation option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-96       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-97: Verify that the Mark a Pattern option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-97       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-99: Verify that the Hide Beat Markers option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-99       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-ECG-100: Verify that the Show Beat Markers option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 4/29/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-ECG-100       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-CAPTURE-38: Can mark a strip that does not belong to any event
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
    ...     Update date: 5/3/2025 - Trinh Nguyen
    ...     Auto create: 5/8/2025 - Hoang Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CAPTURE-38       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Filter Capture    title=V Tab Captured Test      channel=CH1     comment=Add capture afib to strips management       is_submit=${True}
    Filter Header    is_save=${True}
    Navigate Airp Tab     tab=Strips Management
    Navigate To Event Tab    tab_name=OTHER AUTO
    ${strips_management}        Get Strips Management Selected
    Run Keyword And Continue On Failure    Should Be Equal    ${strips_management}[0][Comment]      Add capture afib to strips management
    Run Keyword And Continue On Failure    Should Be Equal    ${strips_management}[0][Title]        V Tab Captured Test
    Run Keyword And Continue On Failure    Should Be Equal    ${strips_management}[0][Include report]      Incl. in report
    Run Keyword And Continue On Failure    Should Be Equal    ${strips_management}[0][Include strip]       Incl. strip
    ${trigger_time}         Get Strips Management Box
    Run Keyword And Continue On Failure    Should Be Equal      ${strips_management}[0][Title]        ${trigger_time}[Title]
    Run Keyword And Continue On Failure    Should Be Equal      ${strips_management}[0][Comment]        ${trigger_time}[Technician comment]
    Delete Events Strips Management
    Filter Strips Management        is_save=${True}

BFCC-AIRP-V-MORPHOLOGIES-CAPTURE-39: Can mark multiple strips that does not belong to any event at the same time
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
    ...     Update date: 5/3/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CAPTURE-39       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-CAPTURE-40: Cannot mark a strip that does not belong to any event without entering title
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
    ...     Update date: 5/3/2025 - Trinh Nguyen
    ...     Auto create: 5/8/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CAPTURE-40       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Mark A Strip Airp    technician_comment=test capture        is_save=${True}
    ${msg}      Get Message Input Airp
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        Please enter a title

BFCC-AIRP-V-MORPHOLOGIES-CAPTURE-41: Cannot mark a strip that does not belong to any event without entering technician comment
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
    ...     Update date: 5/3/2025 - Trinh Nguyen
    ...     Auto create: 5/8/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CAPTURE-41       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Filter Header    panel_tab=Minute info
    Mark A Strip Airp    title=test capture        is_save=${True}
    ${msg}      Get Message Input Airp
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        Please enter a comment

BFCC-AIRP-V-MORPHOLOGIES-CAPTURE-42: Verify the system shall automatically recapture the strip in case updating S/V/Q beat to previous strip
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 5/3/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CAPTURE-42       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-CAPTURE-43: Verify that the user can capture multiple strips within a minute while in unsaved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 5/3/2025 - Trinh Nguyenv
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CAPTURE-43       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-CAPTURE-44: Verify that the user can capture multiple strips within a minute while in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 5/3/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CAPTURE-44       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-CAPTURE-45: Verify if the user captures the same Start time, Stop time and Type, the system will take a new strip and overwrite the old strip
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
#    ...     1.  nếu user capture cùng Starttime, Stoptime, và Type thì nó sẽ lấy cái mới đè lên cái cũ, Panel info sẽ update về cái mới nhất (xét 3 cái trên được r, ko xét đến channel)
    ...
    ...     **Others**
    ...     Update date: 5/3/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CAPTURE-45       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-CAPTURE-46: Verify that the user can simultaneously update the beat (N/S/V/Q) and capture
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 5/3/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CAPTURE-46       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-CAPTURE-47: Verify that the user can simultaneously add the new beat (N/S/V/Q) and capture
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 5/3/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CAPTURE-47       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-CAPTURE-48: Verify that the user cannot capture data in areas where no data is available
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 5/3/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-CAPTURE-48       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-01: Verify the user can view all information on Mark a flag modal by clicking Add a bookmark button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The modal shall feature 2 sections: timestamp and notes
    ...     2. “Timestamp” sections shall also feature 2 buttons, “Jump to” and “Pick on ECG viewer”
    ...     3. There shall be a textbox for the user to leave their bookmark’s comments. This section is optional
    ...     4. There shall be “Add” and “Cancel” buttons for the user to add and cancel the bookmark
    ...
    ...     **Others**
    ...     Update date: 5/3/2025 - Trinh Nguyen
    ...     Auto create: 5/8/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-01       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Filter Bookmark    add_bookmark=${True}
    ${bookmark_status}      Check Event Bookmark
    Run Keyword And Continue On Failure    Should Be True    ${bookmark_status}[Cancel]
    Run Keyword And Continue On Failure    Should Not Be True    ${bookmark_status}[Jump To Timestamp]
    Run Keyword And Continue On Failure    Should Be True    ${bookmark_status}[Pick on ECG Viewer]
    Run Keyword And Continue On Failure    Should Be True    ${bookmark_status}[Add Bookmark]
    Filter Bookmark    is_cancel=${True}

BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-02: Verify the user can view all information on Mark a flag modal by using F hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The modal shall feature 2 sections: timestamp and notes
    ...     2. “Timestamp” sections shall also feature 2 buttons, “Jump to” and “Pick on ECG viewer”
    ...     3. There shall be a textbox for the user to leave their bookmark’s comments. This section is optional
    ...     4. There shall be “Add” and “Cancel” buttons for the user to add and cancel the bookmark
    ...
    ...     **Others**
    ...     Update date: 5/3/2025 - Trinh Nguyen
    ...     Auto create: 5/8/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-02       AIRP-1.15.0             auto      R1
    Navigate Airp Tab    tab=V Morphologies
    Navigate To Template On    row=1
    View Each Beats On Thumbnail    row=1
    Filter Thumbnail Option    by_hotkey=F
    ${bookmark_status}      Check Event Bookmark
    Run Keyword And Continue On Failure    Should Be True    ${bookmark_status}[Cancel]
    Run Keyword And Continue On Failure    Should Not Be True    ${bookmark_status}[Jump To Timestamp]
    Run Keyword And Continue On Failure    Should Be True    ${bookmark_status}[Pick on ECG Viewer]
    Run Keyword And Continue On Failure    Should Be True    ${bookmark_status}[Add Bookmark]
    Filter Bookmark    is_cancel=${True}

BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-03: Verify the timestamp is displayed after using the Pick on ECG button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 5/3/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-03       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-04: Verify the timestamp is updated after selecting another date and time using Pick on ECG viewer button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 5/3/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-04       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-05: Verify the bookmark time indicator is displayed if the timestamp is selected by the user
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 5/3/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-05       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-06: Verify that the Jump to button will be disable if there is no data in the Timestamp
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 5/3/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-06       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-07: Verify that clicking the 'Jump To' button navigates the user to the specified timestamp on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Selecting the “Jump to” button shall navigate the user to the timestamp on the ECG viewer
    ...     - The bookmark will appear in the center of the ECG viewer, excluding the timeframes [0:01 -> 0:04] and [0:56 -> 0:59]
    ...
    ...     **Others**
    ...     Update date: 5/3/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-07       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-08: Verify user can close the pop-up and exit the Add a bookmark function by using Cancel button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 5/3/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-08       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-09: Verify that the user can add a flag without enter Notes on Mark a flag modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 5/3/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-09       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-10: Verify that the limit for the 'Notes' field is 200 characters in the 'Mark a flag' modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 5/3/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-10       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-11: Verify there shall be a warning message to display if there is no data on the timestamp
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 5/3/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-11       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-12: Verify that the user can mark a position in the Artifact Areas tab using the 'Add Bookmark' button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 5/3/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-12       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-13: Verify that user can mark the position on the AFib events tab using the 'Add a Bookmark' button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 5/3/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-13       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-14: Verify that user can mark the position on the AFib events tab using the F hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 5/3/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-V-MORPHOLOGIES-BOOKMARK-14       AIRP-1.15.0             manual      R1
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

Include in report full template
    FOR    ${i}    IN RANGE    1    6
        Navigate To Template On    row=${i}
        Filter Action    is_include_in_report=${True}
        ${results}     Get Icon In Template
        Run Keyword And Continue On Failure    Should Be True    ${results}
    END