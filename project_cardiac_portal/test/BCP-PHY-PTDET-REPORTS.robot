*** Settings ***
Documentation   Cardiac Patient Details page > Reports test suite
Metadata    sid     BCP-PHY-PTDET-REPORTS
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/PatientDetails.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-PHY-PTDET-REPORTS       web
Test Timeout    1h

*** Test Cases ***
BCP-PHY-PTDET-REPORTS-01: View an On-demand report in details
    [Documentation]    Author: Hoang Le
    ...
    ...  Test steps:
    ...  - Go to a patient details page
    ...  - Select Reports tab
    ...  - Select On-demand reports sub-tab
    ...  - Click on a report which user wants to view in details
    ...  Expected results:
    ...  - The report shall be displayed in details successfully.
    [Tags]    BCP-PHY-PTDET-REPORTS-01       manual
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-02: Generate On-Demand Reports
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Go to a patient details page
    ...  - Select Reports tab
    ...  - Select On-demand reports sub-tab
    ...  - Click on Create report button on the right side
    ...  - Select/input manually a time range (start date-end date) for the report generating
    ...  - Click Create button on a modal
    ...  Expected Output:
    ...  - Report is generated successfully with a confirmation toast displayed
    ...  - The timeframe is required to be at least 7 days and less than 31 days
    ...  - The Create button shall be enabled when the start date and end date are selected.
    [Tags]    BCP-PHY-PTDET-REPORTS-02    manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-03: Re-Generate An On-Demand Report by selecting from the date picker
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - On the On-demand reports tab, select Create report button
    ...  - Pick a time range (start date-end date) of which time range user wants to re-generate report
    ...  - Click Create button
    ...  Expected Output:
    ...  - A report is re-generated successfully if its generating time is 1 hour before.
    ...  - If the generating time of the report is within 1 hour, there shall be a toast displayed to notify user 'The report can only be generated once every one hour. Please wait before taking your next action!'.
    [Tags]    BCP-PHY-PTDET-REPORTS-03    manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-04: Re-Generate An On-Demand Report by accessing to the report details
    [Documentation]    Author: Hoang Le
    ...
    ...  Test steps:
    ...  - On the On-demand reports tab, select the report row which user wants to re-generate
    ...  - On the report details page, click Re-generate button
    ...  Expected results:
    ...  - A report is re-generated successfully if its generating time is 1 hour before.
    ...  - If the generating time of the report is within 1 hour, there shall be a toast displayed to notify user 'The report can only be generated once every one hour. Please wait before taking your next action!'.
    [Tags]    BCP-PHY-PTDET-REPORTS-04     manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-05: Delete An On-Demand Report from the On-demand reports list
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Check the reports list if there is any report wanting to delete
    ...  - Click Delete icon
    ...  Expected Output:
    ...  - A confirmation pop-up shall be displayed to ask if user wants to delete the report or not
    ...  - A report is deleted successfully with a confirmation toast if user selects Delete button from the pop-up.
    [Tags]    BCP-PHY-PTDET-REPORTS-05   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-06: Delete An On-Demand Report by accessing to the report details
    [Documentation]    Author: Hoang Le
    ...
    ...  Test steps:
    ...  - On the On-demand reports tab, select the report row which user wants to delete
    ...  - On the report details, click Delete button
    ...  Expected results:
    ...  - A confirmation pop-up shall be displayed to ask if user wants to delete the report or not
    ...  - A report is deleted successfully with a confirmation toast if user selects Delete button from the pop-up.
    [Tags]    BCP-PHY-PTDET-REPORTS-06     manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-07: View Report log of a specific On-demand report by accessing the patient details page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to the patient details page of a specific patient care plan
    ...   - Select Reports tab
    ...   - Select On-demand reports subtab
    ...   - Select on a specific report from the list
    ...   - On the top right of the report details, click the Report log icon
    ...   Expected Result:
    ...   - User shall be able to view the action of themselve and also the other users if anyone takes any action on the report.
    [Tags]     BCP-PHY-PTDET-REPORTS-07    manual
    Manual Should Be Passed     ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-08: Download an On-demand report
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Access to the On-demand reports list
    ...   - Pick the one which user wants to view from the list
    ...   - At the bottom of the left, select the Download button
    ...   Expected Results:
    ...   - The report shall be downloaded successfully.
    [Tags]    BCP-PHY-PTDET-REPORTS-08    manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-09: Add Physician interpretation
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Access to the Monthly reports list
    ...   - Pick the one which user wants to view from the list
    ...   - At the bottom of the left, select the Add comment icon
    ...   - Input data then click Add interpretation button
    ...   - Click Save button to save the data.
    ...   Expected results:
    ...   - The Physician interpretation shall be added to the report successfully.
    [Tags]    BCP-PHY-PTDET-REPORTS-09    manual
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-10: Save the changes made on the report
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Access to the On-demand reports list
    ...   - Pick the one which user wants to view from the list
    ...   - At the bottom of the left, select the Save changes button
    ...   Expected Results:
    ...   - The changes was made will be saved successfully
    ...   - If user leaves the report without saving the change, a pop-up will be displayed to confirm if they want to save it or not.
    [Tags]    BCP-PHY-PTDET-REPORTS-10   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-11: Edit Report Settings of Notification report on a specific patient details page [2.14.0]
    [Documentation]    Author: Hoang Le
    ...
    ...  Test Steps:
    ...  - On Assigned/Active patients page, click on a specific care plan
    ...  - Select Care plan - Report settings sub-tab
    ...  - Tick/untick on 'Monthly report access for nurse' checkbox
    ...  - Select item(s) to display
    ...  - Edit min-max of Vital signs range
    ...  - Edit Weight gain-loss range in 1-7 days
    ...  - Edit min-max of Sleep & activity
    ...  - Edit consecutive days of Medication adherence
    ...  - Switch on/off Medication overdose button
    ...  - Edit consecutive days with Symptoms
    ...  - Edit notes
    ...  Expected Output:
    ...  - The selected item(s) will be displayed as a section on Notification report triggers screen
    ...  - The default value of all sections are ticked and displayed
    ...  - Maximum value must be greater than or equal to the minimum one
    ...  - The consecutive days must be between 1-7 days
    ...  - The dropdown list of Weight gain in 1 day shall be included as (None/>=1/>=2/>=3/>=4), default value is >=4
    ...  - The dropdown list of Weight gain in 7 days shall be included as (None/>=5/>=6/>=7/>=8/>=9/>=10), default value is >= 10
    ...  - The dropdown list of Weight loss in 1 day shall be included as (None/>=1/>=2/>=3/>=4), default value is >=4
    ...  - The dropdown list of Weight loss in 7 days shall be included as (None/>=5/>=6/>=7/>=8/>=9/>=10), default value is >= 10.
    [Tags]    BCP-PHY-PTDET-REPORTS-11    manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-12: View Notification reports of a specific patient on the patient details page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to an Active patients tab by clicking Active button from the main navigation
    ...   - Select a specific patient row which user wants to view the Notification reports
    ...   - On the patient details page, select the Reports sub-tab
    ...   - Then select Notification reports sub-tab
    ...   - Filter the report Review by Reviewed/Unreviewed
    ...   - After a list of Notification reports is displayed, select which one user wants to view
    ...   Expected Results:
    ...   - The filtering results shall be displayed
    ...   - User be able to click on a specific report which they want to view in details
    ...   - After clicking, the Notification report will be displayed in details.
    [Tags]    BCP-PHY-PTDET-REPORTS-12    manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-13: Mark A Report As Reviewed Or Unreviewed on a specific patient details page
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Go to the Active patients page
    ...  - Select a specific patient details of care plan
    ...  - Click the Reports - Notification reports sub-tab
    ...  - Click on a specific report from the reports list
    ...  - On the report details, click Reviewed check box
    ...  - Click on Reviewed check box again
    ...  - Check the report log
    ...  Expected Output:
    ...  - The report will be marked as reviewed or unreviewed successfully based on the user action
    ...  - User's actions will be logged on this section.
    [Tags]    BCP-PHY-PTDET-REPORTS-13    manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-14: Mark A Report As Reviewed Or Unreviewed on a specific patient details page - outside the report details
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...  - Go to the Active patients page
    ...  - Select a specific patient details of care plan
    ...  - Click the Reports - Notification reports sub-tab
    ...  - Tick/untick the Reviewed check box from a specific report row
    ...  - Check the report log
    ...  Expected results:
    ...  - The report will be marked as reviewed or unreviewed successfully based on the user action
    ...  - User's actions will be logged on this section.
    [Tags]    BCP-PHY-PTDET-REPORTS-14      manual      [BCP-2.15]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-15: Filter successfully the Notification report list on the patient details page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to a patient details page
    ...   - Select Reports tab
    ...   - Select Notification reports sub-tab
    ...   - Click the Filter button on the left side of the page
    ...   - Select the Status as Sent/Unsent
    ...   - Select the Review as Reviewed/Unreviewed
    ...   - Click Apply button
    ...   - Observe the reports list
    ...   Expected results:
    ...   - The results of the filter shall list all the Notification reports that match with selected filter
    ...   - The Apply button is always enabled
    ...   - In case clicking outside the filter dropdown will close the filter dropdown and remain the previous filter
    ...   - The Clear button shall be enabled if user ticks on the Review section.
    [Tags]    BCP-PHY-PTDET-REPORTS-15     manual       [BCP-2.15]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-16: View Report log of a specific Notification report by accessing the patient details page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to the patient details page of a specific patient care plan
    ...   - Select Reports tab
    ...   - Select Notification reports subtab
    ...   - Select on a specific report from the list
    ...   - On the top right of the report details, click the Report log icon
    ...   Expected Result:
    ...   - User shall be able to view the action of themselve and also the other users if anyone takes any action on the report.
    [Tags]     BCP-PHY-PTDET-REPORTS-16    manual
    Manual Should Be Passed     ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-17: Download a Notification report
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Access to the Notification reports list
    ...   - Pick the one which user wants to view from the list
    ...   - At the bottom of the left, select the Download button
    ...   Expected Results:
    ...   - The report shall be downloaded successfully.
    [Tags]    BCP-PHY-PTDET-REPORTS-17    manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-18: Add Physician interpretation
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Access to the Notification reports list
    ...   - Pick the one which user wants to view from the list
    ...   - At the bottom of the left, select the Add comment icon
    ...   - Input data then click Add interpretation button
    ...   - Click Save button to save the data.
    ...   Expected results:
    ...   - The Physician interpretation shall be added to the report successfully.
    [Tags]    BCP-PHY-PTDET-REPORTS-18    manual
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-19: Save the changes made on the report
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Access to the Notification reports list
    ...   - Pick the one which user wants to view from the list
    ...   - At the bottom of the left, select the Save changes button
    ...   Expected Results:
    ...   - The changes was made will be saved successfully
    ...   - If user leaves the report without saving the change, a pop-up will be displayed to confirm if they want to save it or not.
    [Tags]    BCP-PHY-PTDET-REPORTS-19   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-20: Add signature
    [Documentation]    Author: Hoang Le
    ...   Test steps:
    ...   - Access to the Notification reports list
    ...   - Pick the one which user wants to view from the list
    ...   - At the bottom of the left, select Add signature button
    ...   - Sign the user signature on this field
    ...   - Tick/untick on the Remember signature check box
    ...   - Select Add signature button
    ...   Expected results:
    ...   - The Physician signature shall be added to the report
    ...   - The Physician signature shall be added and remembered for the following time if user clicks on it.
    [Tags]    BCP-PHY-PTDET-REPORTS-20     manual
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-21: View Monthly reports of a specific patient on the patient details page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to an Active patients tab by clicking Active button from the main navigation
    ...   - Select a specific patient row which user wants to view the Monthly reports
    ...   - On the patient details page, select the Reports sub-tab
    ...   - Then select Monthly reports sub-tab
    ...   - Filter the report Review by Reviewed/Unreviewed
    ...   - After a list of Monthly reports is displayed, select which one user wants to view
    ...   Expected Results:
    ...   - The filtering results shall be displayed
    ...   - User be able to click on a specific report which they want to view in details
    ...   - After clicking, the Monthly report will be displayed in details.
    [Tags]    BCP-PHY-PTDET-REPORTS-21    manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-22: Mark A Report As Reviewed Or Unreviewed on a specific patient details page
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Go to the Active patients page
    ...  - Select a specific patient details of care plan
    ...  - Click the Reports - Monthly reports sub-tab
    ...  - Click on a specific report from the reports list
    ...  - On the report details, click Reviewed check box
    ...  - Click on Reviewed check box again
    ...  - Check the report log
    ...  Expected Output:
    ...  - The report will be marked as reviewed or unreviewed successfully based on the user action
    ...  - User's actions will be logged on this section.
    [Tags]    BCP-PHY-PTDET-REPORTS-22    manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-23: Mark A Report As Reviewed Or Unreviewed on a specific patient details page - outside the report details
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...  - Go to the Active patients page
    ...  - Select a specific patient details of care plan
    ...  - Click the Reports - Monthly reports sub-tab
    ...  - Tick/untick the Reviewed check box from a specific report row
    ...  - Check the report log
    ...  Expected results:
    ...  - The report will be marked as reviewed or unreviewed successfully based on the user action
    ...  - User's actions will be logged on this section.
    [Tags]    BCP-PHY-PTDET-REPORTS-23      manual      [BCP-2.15]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-24: Filter successfully the Monthly report list on the patient details page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to a patient details page
    ...   - Select Reports tab
    ...   - Select Monthly reports sub-tab
    ...   - Click the Filter button on the left side of the page
    ...   - Select the Plan type as CCM/RPM
    ...   - Select the Review as Reviewed/Unreviewed
    ...   - Click Apply button
    ...   - Observe the reports list
    ...   Expected results:
    ...   - The results of the filter shall list all the Monthly reports that match with selected filter
    ...   - The Apply button is always enabled
    ...   - In case clicking outside the filter dropdown will close the filter dropdown and remain the previous filter
    ...   - The Clear button shall be enabled if user ticks on the Review section.
    [Tags]    BCP-PHY-PTDET-REPORTS-24     manual       [BCP-2.15]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-25: View Report log of a specific Monthly report by accessing the patient details page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to the patient details page of a specific patient care plan
    ...   - Select Reports tab
    ...   - Select Monthly reports subtab
    ...   - Select on a specific report from the list
    ...   - At the bottom of the left, select the Save change button
    ...   Expected Results:
    ...   - The changes was made will be saved successfully
    ...   - If user leaves the report without saving the change, a pop-up will be displayed to confirm if they want to save it or not.
    [Tags]    BCP-PHY-PTDET-REPORTS-25   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-26: Add signature
    [Documentation]    Author: Hoang Le
    ...   Test steps:
    ...   - Access to the Monthly reports list
    ...   - Pick the one which user wants to view from the list
    ...   - At the bottom of the left, select Add signature button
    ...   - Sign the user signature on this field
    ...   - Tick/untick on the Remember signature check box
    ...   - Select Add signature button
    ...   Expected results:
    ...   - The Physician signature shall be added to the report
    ...   - The Physician signature shall be added and remembered for the following time if user clicks on it.
      [Tags]  BCP-PHY-PTDET-REPORTS-26    manual
      Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-27: Collapse patient brief info for patient has linked care plan
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Scroll down the page
    ...  2. Click on ... box
    ...  3. Scroll up the page
    ...  Expected Output:
    ...  - The collapsed header includes the following information: Profile picture, First name and last name, Care plan ID, Date of birth & Age, Gender, Notes
    ...  - In step 2,
    ...   + For CCM or CCM&RPM plan type, it will display 3 fields: Switch to RPM, Schedule new appointment, Stop care plan.
    ...   + For RPM plan type, it will display 3 fields: Switch to CCM, Schedule new appointment, Stop care plan.
    ...  - In step 3, the brief info header will be expanded
    [Tags]    BCP-PHY-PTDET-REPORTS-27   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-28: Collapse patient brief info for patient has not linked care plan
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
    [Tags]    BCP-PHY-PTDET-REPORTS-28   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-29: Collapse patient brief info for patient which has missing info
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
    [Tags]    BCP-PHY-PTDET-REPORTS-29   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-30: Collapse patient brief info for patient which has deleted their account
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
    [Tags]    BCP-PHY-PTDET-REPORTS-30   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-31: Collapse patient brief info for patient which has missing info and has deleted their account
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
    [Tags]    BCP-PHY-PTDET-REPORTS-31   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-32: Add ILR reports with valid attachment
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Go to Active patients page
    ...  2. Select on a specific patient's row on the Active care plan list
    ...  3. On patient details page, select Reports tab
    ...  4. On Reports tab, select ILR reports subtab
    ...  5. On ILR reports subtab, click Add new report button
    ...  6. Fill out all the required fields with valid value (Attachment is PDF/PNG/JPG/JPEG format)
    ...  7. Click on Add button
    ...  Expected Output:
    ...  - The Add button should be disabled until all the required fields are filled.
    ...  - The ILR report will be added sucessfully
    ...  - It will navigate back to the ILR report list
    [Tags]    BCP-PHY-PTDET-REPORTS-32   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-33: Add ILR reports with invalid attachment
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Go to Active patients page
    ...  2. Select on a specific patient's row on the Active care plan list
    ...  3. On patient details page, select Reports tab
    ...  4. On Reports tab, select ILR reports subtab
    ...  5. On ILR reports subtab, click Add new report button
    ...  6. Fill out report name, date added, source fields with valid value
    ...  7. Pick any file not in PDF/PNG/JPG/JPEG foramt from user's computer to add attachment
    ...  8. Click on Add button
    ...  Expected Output:
    ...  - In step 7, error message is displayed
    ...  - The Add button is disabled
    [Tags]    BCP-PHY-PTDET-REPORTS-33   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-34: Add ILR report while clear Date added field
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Go to Active patients page
    ...  2. Select on a specific patient's row on the Active care plan list
    ...  3. On patient details page, select Reports tab
    ...  4. On Reports tab, select ILR reports subtab
    ...  5. On ILR reports subtab, click Add new report button
    ...  6. Fill out all the required fields with valid value (Attachment is PDF/PNG/JPG/JPEG format)
    ...  7. Clear Date added field
    ...  8. Click on Add button
    ...  Expected Output:
    ...  - In step 6, the Add button will be enabled
    ...  - In step 8, the Add button is disabled
    [Tags]    BCP-PHY-PTDET-REPORTS-34   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-35: Add ILR report while clear Report name
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Go to Active patients page
    ...  2. Select on a specific patient's row on the Active care plan list
    ...  3. On patient details page, select Reports tab
    ...  4. On Reports tab, select ILR reports subtab
    ...  5. On ILR reports subtab, click Add new report button
    ...  6. Fill out all the required fields with valid value (Attachment is PDF/PNG/JPG/JPEG format)
    ...  7. Clear Report name field
    ...  8. Click on Add button
    ...  Expected Output:
    ...  - In step 6, the Add button will be enabled
    ...  - In step 8, the Add button is disabled
    [Tags]    BCP-PHY-PTDET-REPORTS-35   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-36: Edit all fields in ILR report
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Go to Active patients page
    ...  2. Select on a specific patient's row on the Active care plan list
    ...  3. On patient details page, select Reports tab
    ...  4. On Reports tab, select ILR reports subtab
    ...  5. On ILR reports list, click on edit button
    ...  6. Edit all fields with valid value
    ...  7. Click on Save button
    ...  Expected Output:
    ...  - The information will be updated as user edits
    ...  - It navigates back to the report list.
    [Tags]    BCP-PHY-PTDET-REPORTS-36   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-37: Edit only Report name in ILR report
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Go to Active patients page
    ...  2. Select on a specific patient's row on the Active care plan list
    ...  3. On patient details page, select Reports tab
    ...  4. On Reports tab, select ILR reports subtab
    ...  5. On ILR reports list, click on edit button
    ...  6. Edit Report name field
    ...  7. Click on Save button
    ...  Expected Output:
    ...  - The Report name will be updated as user edits
    ...  - It navigates back to the report list.
    [Tags]    BCP-PHY-PTDET-REPORTS-37   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-38: Edit only Date added in ILR report
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Go to Active patients page
    ...  2. Select on a specific patient's row on the Active care plan list
    ...  3. On patient details page, select Reports tab
    ...  4. On Reports tab, select ILR reports subtab
    ...  5. On ILR reports list, click on edit button
    ...  6. Edit Date added field
    ...  7. Click on Save button
    ...  Expected Output:
    ...  - The Date added will be updated as user edits
    ...  - It navigates back to the report list.
    [Tags]    BCP-PHY-PTDET-REPORTS-38   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-39: Edit only Source in ILR report
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Go to Active patients page
    ...  2. Select on a specific patient's row on the Active care plan list
    ...  3. On patient details page, select Reports tab
    ...  4. On Reports tab, select ILR reports subtab
    ...  5. On ILR reports list, click on edit button
    ...  6. Edit Source field
    ...  7. Click on Save button
    ...  Expected Output:
    ...  - The Source will be updated as user edits
    ...  - It navigates back to the report list.
    [Tags]    BCP-PHY-PTDET-REPORTS-39   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-40: Edit only Attachment in ILR report
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Go to Active patients page
    ...  2. Select on a specific patient's row on the Active care plan list
    ...  3. On patient details page, select Reports tab
    ...  4. On Reports tab, select ILR reports subtab
    ...  5. On ILR reports list, click on edit button
    ...  6. Edit Attachment field with valid file
    ...  7. Click on Save button
    ...  Expected Output:
    ...  - The Attachment will be updated as user edits
    ...  - It navigates back to the report list.
    [Tags]    BCP-PHY-PTDET-REPORTS-40   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-41: Cancel edit ILR report proccess
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Go to Active patients page
    ...  2. Select on a specific patient's row on the Active care plan list
    ...  3. On patient details page, select Reports tab
    ...  4. On Reports tab, select INR reports subtab
    ...  5. On ILR reports list, click on edit button
    ...  6. Edit all fields with valid value
    ...  7. Click on Cancel button
    ...  Expected Output:
    ...  - The information will not be updated as user edits
    ...  - It navigates back to the report list.
    [Tags]    BCP-PHY-PTDET-REPORTS-41   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-42: View list of 1 ILR reports of a patient
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Go to Active patients page
    ...  2. Select on a specific patient's row on the Active care plan list
    ...  3. On patient details page, select Reports tab
    ...  4. On Reports tab, select ILR reports subtab
    ...  5. On ILR reports subtab, click Add new report button
    ...  6. Fill out all the required fields with valid value (Attachment is PDF/PNG/JPG/JPEG format)
    ...  7. Click on Add button
    ...  8. Observe the ILR report list
    ...  Expected Output:
    ...  - The list of ILR reports includes: Date added, Report name, Source, Link to report
    ...  - The added ILR report will be displayed on the list
    [Tags]    BCP-PHY-PTDET-REPORTS-42   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-43: View list of 11 ILR reports of a patient
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Go to Active patients page
    ...  2. Select on a specific patient's row on the Active care plan list
    ...  3. On patient details page, select Reports tab
    ...  4. On Reports tab, select ILR reports subtab
    ...  5. On ILR reports subtab, click Add new report button
    ...  6. Fill out all the required fields with valid value (Attachment is PDF/PNG/JPG/JPEG format)
    ...  7. Click on Add button
    ...  8. Continue to add 10 ILR reports
    ...  9. Observe the ILR report list
    ...  Expected Output:
    ...  - The list of ILR reports includes: Date added, Report name, Source, Link to report
    ...  - The added ILR report will be displayed on the list with 10 items on each page.
    [Tags]    BCP-PHY-PTDET-REPORTS-43   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-44: View the ILR report detail
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Go to Active patients page
    ...  2. Select on a specific patient's row on the Active care plan list
    ...  3. On patient details page, select Reports tab
    ...  4. On Reports tab, select ILR reports subtab
    ...  5. On ILR reports list, click on open report icon on specific report
    ...  Expected Output:
    ...  - The report detail page will be opened
    [Tags]    BCP-PHY-PTDET-REPORTS-44   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-45: Download the ILR report
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Go to Active patients page
    ...  2. Select on a specific patient's row on the Active care plan list
    ...  3. On patient details page, select Reports tab
    ...  4. On Reports tab, select ILR reports subtab
    ...  5. On ILR reports list, click on open report icon on specific report
    ...  6. Click on Download button
    ...  Expected Output:
    ...  - The report will be downloaded sucessfully
    [Tags]    BCP-PHY-PTDET-REPORTS-45   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-46: Print the ILR report
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Go to Active patients page
    ...  2. Select on a specific patient's row on the Active care plan list
    ...  3. On patient details page, select Reports tab
    ...  4. On Reports tab, select ILR reports subtab
    ...  5. On ILR reports list, click on open report icon on specific report
    ...  6. Click on Print icon
    ...  Expected Output:
    ...  - The ILR report except jpg,png format will not display Print icon for user to print it
    [Tags]    BCP-PHY-PTDET-REPORTS-46   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTDET-REPORTS-47: Delete the ILR report
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Go to Active patients page
    ...  2. Select on a specific patient's row on the Active care plan list
    ...  3. On patient details page, select Reports tab
    ...  4. On Reports tab, select ILR reports subtab
    ...  5. On ILR reports list, click on delete report icon on specific report
    ...  6. Click on Delete
    ...  Expected Output:
    ...  - In step 5, the delete pop up will be displayed
    ...  - In step 6, the report will be deleted sucessfully
    [Tags]    BCP-PHY-PTDET-REPORTS-47   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

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
