*** Settings ***
Documentation   Cardiac Time Tracking page test suite
Metadata    sid     BCP-PHY-PTDET-TTK
Metadata    owner   Khang Nguyen
Library     DateTime
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/PatientsNew.py
#Library     project_cardiac_portal/lib/web/TimeTracking.py
#Library     project_cardiac_portal/lib/web/PatientDetails.py
#Library     project_cardiac_portal/lib/web/PatientsActive.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-PHY-PTDET-TTK       web
Test Timeout    1h

*** Test Cases ***
BCP-PHY-PTDET-TTK-01: Add new time log in the Time tracking tab of a specific patient
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  - Go to Time tracking tab in Patient details page of specific patient
    ...  - Click on Add new time log button
    ...  - Fill out information for all the required fields (date in the current month)
    ...  - Click Add button
    ...  Expected Output:
    ...  - The time log will be saved and displayed on the time log list
    [Tags]   BCP-PHY-PTDET-TTK-01     manual     BCP-2.16
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-TTK-02: Add new time log in the details page of a specific current calendar month
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  - Go to Time tracking tab in Patient details page of specific patient
    ...  - Click on current calendar month
    ...  - Click on Add new time log button
    ...  - Fill out information for all the required fields (date in the current month)
    ...  - Click Add button
    ...  Expected Output:
    ...  - The time log will be saved and displayed on the time log list
    [Tags]   BCP-PHY-PTDET-TTK-02     manual     BCP-2.16
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-TTK-03: Filter Billable status of the calendar month
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  - Go to Time tracking tab in Patient details page of specific patient
    ...  - Choose Billable option on the "All status" dropdown
    ...  - Observe the calendar month list
    ...  Expected Output:
    ...  - The calendar month which has Billable status will display on the list
    [Tags]   BCP-PHY-PTDET-TTK-03     manual     BCP-2.16
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-TTK-04: Filter Unbillable status of the calendar month
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  - Go to Time tracking tab in Patient details page of specific patient
    ...  - Choose Unbillable option on the "All status" dropdown
    ...  - Observe the calendar month list
    ...  Expected Output:
    ...  - The calendar month which has Unbillable status will display on the list
    [Tags]   BCP-PHY-PTDET-TTK-04     manual     BCP-2.16
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-TTK-05: Edit all required fields of the auto time log in the current calendar month
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  - Go to Time tracking tab in Patient details page of specific patient
    ...  - Click on current calendar month
    ...  - Click on specific auto time log which has logged by the participant is the user
    ...  - Click on Edit button
    ...  - Edit all the required fields on the side tab
    ...  - Click on Save button
    ...  Expected Output:
    ...  - The time log will be saved as user edits
    [Tags]   BCP-PHY-PTDET-TTK-05     manual     BCP-2.16
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-TTK-06: Edit random field of the auto time log in the current calendar month
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  - Go to Time tracking tab in Patient details page of specific patient
    ...  - Click on current calendar month
    ...  - Click on specific auto time log which has logged by the participant is the user
    ...  - Click on Edit button
    ...  - Edit random fields on the side tab
    ...  - Click on Save button
    ...  Expected Output:
    ...  - The time log will be saved as user edits
    [Tags]   BCP-PHY-PTDET-TTK-06     manual     BCP-2.16
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-TTK-07: Edit all required fields of the manual time log in the current calendar month
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  - Go to Time tracking tab in Patient details page of specific patient
    ...  - Click on current calendar month
    ...  - Click on specific manual time log which has logged by the participant is the user
    ...  - Click on Edit button
    ...  - Edit random fields on the side tab
    ...  - Click on Save button
    ...  Expected Output:
    ...  - The time log will be saved as user edits
    [Tags]   BCP-PHY-PTDET-TTK-07     manual     BCP-2.16
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-TTK-08: Edit random field of the manual time log in the current calendar month
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  - Go to Time tracking tab in Patient details page of specific patient
    ...  - Click on current calendar month
    ...  - Click on specific manual time log which has logged by the participant is the user
    ...  - Click on Edit button
    ...  - Edit random fields on the side tab
    ...  - Click on Save button
    ...  Expected Output:
    ...  - The time log will be saved as user edits
    [Tags]   BCP-PHY-PTDET-TTK-08     manual     BCP-2.16
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-TTK-09: Delete auto time log in the current calendar month
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  - Go to Time tracking tab in Patient details page of specific patient
    ...  - Click on current calendar month
    ...  - Click on specific auto time log which has logged by the participant is the user
    ...  - Click on Delete button on the side tab
    ...  - Click on Yes button on the pop up
    ...  Expected Output:
    ...  - The time log will be deleted successfully with a toast displayed
    [Tags]    BCP-PHY-PTDET-TTK-09        manual     BCP-2.16
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-TTK-10: Delete manual time log in the current calendar month
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  - Go to Time tracking tab in Patient details page of specific patient
    ...  - Click on current calendar month
    ...  - Click on specific manual time log which has logged by the participant is the user
    ...  - Click on Delete button on the side tab
    ...  - Click on Yes button on the pop up
    ...  Expected Output:
    ...  - The time log will be deleted successfully with a toast displayed
    [Tags]    BCP-PHY-PTDET-TTK-10        manual     BCP-2.16
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-TTK-11: Display pop up Time out after 2 minutes of inactivity on the patient details page
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Go to Patient details page of specific patient
    ...  2. Let the page without any action in 2 minutes
    ...  3. Click on "Yes, I'm still working" button in pop up Time out
    ...  4. Click on the Timer tab at the right corner of the page
    ...  Expected Output:
    ...  - The pop-up will close and the auto-time tracking will continue.
    [Tags]   BCP-PHY-PTDET-TTK-11     manual     BCP-2.16
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-TTK-12: Reappear pop up Time out after another 2 minutes of inactivity on the patient details page
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Go to Patient details page of specific patient
    ...  2. Let the page without any action in 2 minutes
    ...  3. Observe the pop up Time out
    ...  4. Click on "Yes, I'm still working" button
    ...  5. Continue to let the page inactivity in another 2 minutes
    ...  6. Click on "Yes, I'm still working" button in the pop up
    ...  7. Click on the Timer tab at the right corner of the page
    ...  Expected Output:
    ...  - The pop-up will appear in step 2,5
    ...  - In step 4,6, the pop-up will close and the auto-time tracking will continue
    [Tags]   BCP-PHY-PTDET-TTK-12     manual     BCP-2.16
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-TTK-13: Not response pop up Time out within 30s after 2 minutes of inactivity
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Go to Patient details page of specific patient
    ...  2. Let the page without any action in 2 minutes
    ...  3. Does not response pop up within 30s
    ...  4. Observe the screen
    ...  5. Click on "Yes, I'm still working" button in the pop up
    ...  Expected Output:
    ...  - The auto time tracking will stop at 2m30s
    ...  - The auto time tracking will restart and the pop-up will close.
    [Tags]   BCP-PHY-PTDET-TTK-13     manual     BCP-2.16
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-TTK-14: Responds to the pop-up after 30s appear pop-up Time out
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Go to Patient details page of specific patient
    ...  2. Let the page without any action in 2 minutes
    ...  3. Does not response pop up within 30s
    ...  4. Click on "Yes, I'm still working" button in the pop-up
    ...  5. Click on the Timer tab at the right corner of the page
    ...  Expected Output:
    ...  - The auto time tracking will restart and the pop-up will close.
    ...  - The auto time tracking will log in the time log list of the current month
    [Tags]   BCP-PHY-PTDET-TTK-14     manual     BCP-2.16
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-TTK-15: Display pop up Time out after 1 minutes of hiding web Browser window
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Go to Patient details page of specific patient
    ...  2. Click the right top of the Browser to hide web Browser window
    ...  3. Wait over 1 minute
    ...  4. Open back the Browser window
    ...  5. Click on "Yes, I'm still working" button in the pop-up
    ...  Expected Output:
    ...  - In step 4, the Time out pop up will display
    ...  - In step 5, the auto-time tracking will continue
    [Tags]   BCP-PHY-PTDET-TTK-15     manual     BCP-2.16
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-TTK-16: Not response pop up Time out within 30s after 1 minutes of hiding web Browser window
    [Documentation]    Author: Xuan Trinh
    ...
    ...  Test Steps:
    ...  1. Go to Patient details page of specific patient
    ...  2. Click the right top of the Browser to hide web Browser window
    ...  3. Wait over 1:30m
    ...  4. Open back the Browser window
    ...  5. Click on "Yes, I'm still working" button in the pop-up
    ...  Expected Output:
    ...  - The auto time tracking will stop at 1m30s
    ...  - The auto time tracking will restart and the pop-up will close.
    [Tags]   BCP-PHY-PTDET-TTK-16     manual     BCP-2.16
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-TTK-17: Add An Auto Time Log Via Timer For Active - Unlinked Patient
    [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1.Log in to the portal as a Clinic user
    ...   2.Go to Patient details page of specific Unlinked patient in Active tab
    ...   3.Click on a Timer icon from the right corner of the page
    ...   4.Select an Activity from the dropdown list
    ...   5.Add the Notes (if any)
    ...   6.Add more participant(s) if wanted (beside the required one is the user)
    ...   7.Click on another tab to log that time log
    ...   Expected Output:
    ...   - At step 3, the Timer will start counting an Activity's duration
    ...   - At step 4, user can choose Activity which base on RPM/CCM/CCM&RPM plan type
    ...   - At step 7, the Activity's duration will be logged to the Time-tracking of the current month
    [Tags]    BCP-PHY-PTDET-TTK-17     manual     BCP-2.16
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTDET-TTK-18: Add An Auto Time Log Via Timer For Active - Linked Patient
    [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1.Log in to the portal as a Clinic user
    ...   2.Go to Patient details page of specific Linked patient in Active tab
    ...   3.Click on a Timer icon from the right corner of the page
    ...   4.Select an Activity from the dropdown list
    ...   5.Add the Notes (if any)
    ...   6.Add more participant(s) if wanted (beside the required one is the user)
    ...   7.Click on another tab to log that time log
    ...   Expected Output:
    ...   - At step 3, the Timer will start counting an Activity's duration
    ...   - At step 4, user can choose Activity which base on RPM/CCM/CCM&RPM plan type
    ...   - At step 7, the Activity's duration will be logged to the Time-tracking of the current month
    [Tags]    BCP-PHY-PTDET-TTK-18     manual     BCP-2.16
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTDET-TTK-19: Add A Manual Time Log Via Timer For Active - Unlinked Patient
    [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1.Log in to the portal as a Clinic user
    ...   2.Go to Patient details page of specific Unlinked patient in Active tab
    ...   3.Click on a Timer icon from the right corner of the page
    ...   4.CLick on Manual option
    ...   5.Select an Activity from the dropdown list
    ...   6.Set the Time manually as user wanted
    ...   7.Add the Notes (if any)
    ...   8.Add more participant(s) if wanted (beside the required one is the user)
    ...   9.Click on Add log button
    ...   Expected Output:
    ...   - At step 5, user can choose Activity which base on RPM/CCM/CCM&RPM plan type
    ...   - At step 9, the Activity will be logged to the Time-tracking of the current month
    [Tags]    BCP-PHY-PTDET-TTK-19     manual     BCP-2.16
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTDET-TTK-20: Add A Manual Time Log Via Timer For Active - Linked Patient
    [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1.Log in to the portal as a Clinic user
    ...   2.Go to Patient details page of specific Linked patient in Active tab
    ...   3.Click on a Timer icon from the right corner of the page
    ...   4.CLick on Manual option
    ...   5.Select an Activity from the dropdown list
    ...   6.Set the Time manually as user wanted
    ...   7.Add the Notes (if any)
    ...   8.Add more participant(s) if wanted (beside the required one is the user)
    ...   9.Click on Add log button
    ...   Expected Output:
    ...   - At step 5, user can choose Activity which base on RPM/CCM/CCM&RPM plan type
    ...   - At step 9, the Activity will be logged to the Time-tracking of the current month
    [Tags]    BCP-PHY-PTDET-TTK-20     manual     BCP-2.16
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTDET-TTK-21: Discard Data On The Timer
    [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1.Log in to the portal as a Clinic user
    ...   2.Go to Patient details page of specific patient in Active tab
    ...   3.Click on a Timer icon from the right corner of the page
    ...   4.CLick on Manual option
    ...   5.Input data for the timer
    ...   6.Click the Discard button
    ...   Expected Output:
    ...   - All the information on the timer will be discarded and user must input all over again.
    [Tags]    BCP-PHY-PTDET-TTK-21     manual     BCP-2.16
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTDET-TTK-22: See auto time log reporting in Time tracking list
    [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1.Log in to the portal as a Clinic user
    ...   2.Go to Patient details page of specific patient in Active tab
    ...   3.Click on a Timer icon from the right corner of the page
    ...   4.Input data for the auto timer
    ...   5.Click the arrow to see reporting in Time tracking list
    ...   Expected Output:
    ...   -It will navigate to Time tracking details page of a specific current calendar month
    ...   -The Activity will be logged to the Time-tracking list of the current month
    [Tags]    BCP-PHY-PTDET-TTK-22     manual     BCP-2.16
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTDET-TTK-23: See manual time log reporting in Time tracking list
    [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1.Log in to the portal as a Clinic user
    ...   2.Go to Patient details page of specific patient in Active tab
    ...   3.Click on a Timer icon from the right corner of the page
    ...   4.CLick on Manual option
    ...   5.Input data for the auto timer
    ...   6.Click the arrow to see reporting in Time tracking list
    ...   Expected Output:
    ...   -It will navigate to Time tracking details page of a specific current calendar month
    ...   -The Activity will be logged to the Time-tracking list of the current month
    [Tags]    BCP-PHY-PTDET-TTK-23     manual     BCP-2.16
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTDET-TTK-24: Change the Auto timer to Manual
    [Documentation]    Author: Xuan Trinh
    ...
    ...   Test Steps:
    ...   1.Log in to the portal as a Clinic user
    ...   2.Go to Patient details page of specific patient in Active tab
    ...   3.Wait for 10s
    ...   4.Click on a Timer icon from the right corner of the page
    ...   5.CLick on Manual option
    ...   6.Click on Time tracking tab
    ...   7.Click on current calendar month
    ...   8.Observe the activity time log list
    ...   Expected Output:
    ...   -In step 3, a snack bar notification “the timer has started” will appear
    ...   -In step 8, the activity "Daily monitoring and analyzing patient’s readings" will be logged in the list
    [Tags]    BCP-PHY-PTDET-TTK-24     manual     BCP-2.16
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTDET-TTK-25: Create Super Bill
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - On the Time tracking tab of a specific patient details, click Create superbill
    ...  - Add diagnoses
    ...  - Add services
    ...  - Input amount paid
    ...  - Select bill type
    ...  - Click Save button
    ...  Expected Output:
    ...  - A superbill will be saved and displayed along with time log list of that specific patient
    [Tags]    BCP-PHY-PTDET-TTK-25    manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-TTK-26: Edit Super Bill
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Click Edit button on a specific superbill
    ...  - Edit information which user wants to
    ...  - Click Save
    ...  Expected Output:
    ...  - The changes will be saved and displayed
    [Tags]    BCP-PHY-PTDET-TTK-26     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-TTK-27: Create Master Bill
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Select on Create master bill button
    ...  - Check on at least an item from the Time tracking list
    ...  - Click Generate button
    ...  Expected Output:
    ...  - Summary bill will be displayed in pdf format for user to view and print (if needed)
    [Tags]    BCP-PHY-PTDET-TTK-27    manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

#    Navigate To Time Tracking
#    Filter Time Tracking     by_patient=All patients    by_status=Ready for biller     by_duration_status=Ready for biller    search_by=Patient name     text_search=${PATIENTS}[17]
#    TimeTracking.View Time Tracking Details On    row=1
#    Navigate To Patient Details Tab    Time tracking
#    PatientDetails.View Time Tracking Details On      row=1
#    ${tlog_details}      Get Patient Details Time Tracking Details
#    # Navigate to time tracking + create master bill Using existing patient (Patient Qa 18)
#    Navigate To Time Tracking
#    Filter Time Tracking    by_patient=All patients    by_status=Ready for biller     by_duration_status=Billable    search_by=Patient name     text_search=${PATIENTS}[17]
#    ${ttk}      Get Time Tracking
#    Create Master Bill On   row=1
#    ${masterbill}    Get Master Bill
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${masterbill}     No masterbill found on Patient ${PATIENTS}[17]
#    # time tracking >< masterbill
#    Run Keyword And Continue On Failure    Should Be Equal    ${masterbill}[Facility]                  ${ttk}[0][Clinic]
#    Run Keyword And Continue On Failure    Should Be Equal    ${masterbill}[Care plan ID]              ${ttk}[0][Care plan ID]
#    Run Keyword And Continue On Failure    Should Be Equal    ${masterbill}[Patient name]              ${ttk}[0][Patient name]
#    Run Keyword And Continue On Failure    Should Contain     ${masterbill}[Superbill information]     ${ttk}[0][Date of service]
#    # masterbill >< superbill
#    Run Keyword And Continue On Failure    Should Contain     ${tlog_details}[0][Superbill]            ${masterbill}[Bill ID]

BCP-PHY-PTDET-TTK-28: Print Bill
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Click Print icon on Create and Edit superbill screens
    ...  - Click Print icon at the top of Summary bill (for master bill)
    ...  Expected Output:
    ...  - A superbill in pdf format will be displayed for user to view and print it
    ...  - A masterbill in pdf format will be displayed for user to view and print it
    [Tags]    BCP-PHY-PTDET-TTK-28     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-TTK-29: Collapse patient brief info for patient has linked care plan
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
    [Tags]    BCP-PHY-PTDET-TTK-29    manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-TTK-30: Collapse patient brief info for patient has not linked care plan
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
    [Tags]    BCP-PHY-PTDET-TTK-30    manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-TTK-31: Collapse patient brief info for patient which has missing info
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
    [Tags]    BCP-PHY-PTDET-TTK-31    manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-TTK-32: Collapse patient brief info for patient which has deleted their account
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
    [Tags]    BCP-PHY-PTDET-TTK-32    manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-PHY-PTDET-TTK-33: Collapse patient brief info for patient which has missing info and has deleted their account
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
    [Tags]    BCP-PHY-PTDET-TTK-33     manual
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

Delete The Time Log
    [Arguments]    ${ttk_patient}
    Navigate To Time Tracking
    Filter Time Tracking    by_patient=All patients     by_status=All statuses      by_duration_status=Duration statuses        search_by=Patient name      text_search=${ttk_patient}
    ${ttk}      Get Time Tracking
    Run Keyword If    ${ttk} != None and '${ttk}[0][Duration (minutes)]' != '00:00'    Run Keywords
    ...  TimeTracking.View Time Tracking Details On    row=1
    ...  AND    PatientDetails.View Time Log Information On    row=1
    ...  AND    PatientDetails.Delete Time Log
