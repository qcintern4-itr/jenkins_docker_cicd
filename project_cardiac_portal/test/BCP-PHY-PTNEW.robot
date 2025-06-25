*** Settings ***
Documentation   Cardiac Patients - New page test suite
Metadata    sid     BCP-PHY-PTNEW
Metadata    owner   Khang Nguyen
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/PatientsNew.py
#Library     project_cardiac_portal/lib/web/PatientDetails.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-PHY-PTNEW       web
Test Timeout    1h

*** Test Cases ***
BCP-PHY-PTNEW-01: Filter New patients by "My patients"
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to Patients-New patients page
    ...   - Select on New tab
    ...   - Filter patients list by "My patients"
    ...   - Search patient by Patient name or Care plan ID
    ...   - Click on a specific patient's care plan row which user wants to view the details
    ...   Expected Result:
    ...   - Patient's care plan details page shall be displayed.
    [Tags]      BCP-PHY-PTNEW-01    manual      inactive
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    [Template]    Filter Patients - New
#    My patients     Read            Care Plan ID
#    My patients     All statuses    Patient Name
##    My patients     Unread          Patient Name

BCP-PHY-PTNEW-02: Filter New patients by "All patients"
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to Patients-New patients page
    ...   - Select on New tab
    ...   - Filter patients list by "All patients"
    ...   - Search patient by Patient name or Care plan ID
    ...   - Click on a specific patient's care plan row which user wants to view the details
    ...   Expected Result:
    ...   - Patient's care plan details page shall be displayed.
    [Tags]      BCP-PHY-PTNEW-02     manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-03: Column visibility - Hide/show column(s) on page
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: user is on the New patient page
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to hide/show any column(s) on page by setting on Column visibility button.
    [Tags]    BCP-PHY-PTNEW-03        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-04: Add notes NOT included on the report for the program
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: user does not tick the Included on the Monthly report check box from the Notes side bar
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to add Notes successfully for a program
    [Tags]    BCP-PHY-PTNEW-04        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-05: Add notes included on the report for the program
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: user ticks the Included on the Monthly report check box from the Notes side bar
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to add Notes successfully for a program
    ...  The Notes shall be displayed on the Monthly report.
    [Tags]    BCP-PHY-PTNEW-05        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-06: Edit Notes of the program
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: there is a Note added to the program
    ...  Test steps:
    ...  Expected result:
    ...  The Notes shall be updated as the user inputs.
    [Tags]    BCP-PHY-PTNEW-06        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-07: Delete Notes of the program
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: there is a Note added to the program
    ...  Test steps:
    ...  Expected result:
    ...  The Notes shall be deleted from the program.
    [Tags]    BCP-PHY-PTNEW-07        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-08: Re-assign a caregiver who has never logged into the portal
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The caregiver who has never logged into the portal

    ...  Test steps:
    ...   1. Go to Patient detail page
    ...   2. Click on Edit button from the Caregivers section
    ...   3. Search a caregiver who has never logged into the portal
    ...  Expected result:
    ...  Can not search for caregiver to assign.
    [Tags]    BCP-PHY-PTNEW-08     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-09: Re-assign a caregiver who has logged in but not belongs to the registered facility
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The caregiver who has logged in but not belongs to the registered facility

    ...  Test steps:
    ...   1. Go to Patient detail page
    ...   2. Click on Edit button from the Caregivers section
    ...   3. Search a caregiver who has logged in but not belongs to the registered facility
    ...  Expected result:
    ...  Can not search for caregiver to assign.
    [Tags]    BCP-PHY-PTNEW-09     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-10: Re-assign a caregiver who has logged in & belongs to the registered facility
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The caregiver who has logged in but not belongs to the registered facility

    ...  Test steps:
    ...   1. Go to Patient detail page
    ...   2. Click on Edit button from the Caregivers section
    ...   3. Search a caregiver who has logged in & belongs to the registered facility
    ...   4. Click on Change button
    ...  Expected result:
    ...  Assign caregiver successfully.
    [Tags]    BCP-PHY-PTNEW-10    manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-11: Re-assign the deactivated caregiver account
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The caregiver who has logged in but not belongs to the registered facility

    ...  Test steps:
    ...   1. Go to Patient detail page
    ...   2. Click on Edit button from the Caregivers section
    ...   3. Search a caregiver who has deactivated account
    ...  Expected result:
    ...  Can not search for caregiver to assign.
    [Tags]    BCP-PHY-PTNEW-11     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-12: New patients - Add new patient by manual input consecutively
    [Documentation]    Author: Chi Tran
    ...
    ...  Test Steps:
    ...  1. Go to the New patients page from the main navigation
    ...  2. Click Add new patient button on the right side of the page
    ...  3. On the Patient information screen, select Facility
    ...  4. Input Personal details, such as (first name/last name/dob/gender/height/weight)
    ...  5. Input Address details, such as (country/state/address/city/zip code)
    ...  6. Input Contact details, such as (email/mobile number/emergency contact phone/home phone)
    ...  7. Input preferred contact method, such as (email/sms/both)
    ...  8. Input Insurance: payment type such as (cash/credit card paying/insurance)
    ...  9. Input Healthcare program details, such as (plan type/register clinic/nurse/physician/general cardiac template)
    ...  10. Select Save & add another patient button.
    ...  Expected Output:
    ...  The Save & add another patient button shall be enabled if all the required fields are filled out
    ...  The patient info shall be displayed on the Active tab in the Patients page
    ...  All the fields on the Add new patient page shall be cleared out for the next input.
    [Tags]    BCP-PHY-PTNEW-12    manual      [BCP-2.20.0]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-13: New patients - Add new patient by manual input (CCM/RPM/CCM&RPM)
    [Documentation]    Author: Chi Tran
    ...
    ...  Test steps:
    ...  1. Go to the New patients page from the main navigation
    ...  2. Click Add new patient button on the right side of the page
    ...  3. On the Patient information screen, select Facility
    ...  4. Input Personal details, such as (first name/last name/dob/gender/height/weight)
    ...  5. Input Address details, such as (country/state/address/city/zip code)
    ...  6. Input Contact details, such as (email/mobile number/emergency contact phone/home phone)
    ...  7. Input preferred contact method, such as (email/sms/both)
    ...  8. Input Insurance: payment type such as (cash/credit card paying/insurance)
    ...  9. Input Healthcare program details, such as (plan type/register clinic/nurse/physician/general cardiac template)
    ...  10. Select Add patient button
    ...  Expected results:
    ...  The Add patient button shall be enabled if all the required fields are filled out
    ...  User shall be navigated to the Active tab in the Patients page where patient info shall be displayed.
    [Tags]    BCP-PHY-PTNEW-13          manual        [BCP-2.20.0]
    Manual Should Be Passed     ${TEST NAME}        ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-14: Add new patient by Athena health (CCM/RPM/CCM&RPM)
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The Athena health option is selected
    ...  The selected facility must include the Ahthena patient

    ...  Test steps:
    ...  1. Go to the New patients page from the main navigation
    ...  2. Click Add new patient button on the right side of the page
    ...  3. Enter Patient name into Search bar
    ...  4. Enter Date of birth, select Gender (optional)
    ...  5. Click on Search button
    ...  6. Click on Add button
    ...  7. Edit patient information
    ...  8. Click on Add patient button
    ...  Expected result:
    ...  The user shall be able to search and add new patient by searching patient info on Add new patient page.
    [Tags]    BCP-PHY-PTNEW-14        manual      [BCP-2.20.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-15: Add new patient by Biocare users (CCM/RPM/CCM&RPM)
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The Biocare users option is selected
    ...  The user used to have a Bioflux/Biotres study
    ...  The selected facility must include the Biocare user
    ...  Test steps:
    ...  1. Go to the New patients page from the main navigation
    ...  2. Click Add new patient button on the right side of the page
    ...  3. Enter Patient name into Search bar
    ...  4. Enter Date of birth, select Gender (optional)
    ...  5. Click on Search button
    ...  6. Click on Add button
    ...  7. Edit patient information
    ...  8. Click on Add patient button
    ...  Expected result:
    ...  The user shall be able to search and add new patient by searching patient info on Add new patient page.
    [Tags]    BCP-PHY-PTNEW-15        manual      [BCP-2.20.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-16: Bulk import - Import not supported file format
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  Bulk import method is selected
    ...  The file is not in csv or xlsx format

    ...  Test steps:
    ...  1. Click on Add new patient button from New patients page
    ...  2. Select Bulk import button
    ...  3. Select Clinic information
    ...  4. Click on Import patient list button
    ...  5. Click or drag a valid file to upload the templates list
    ...  6. Click on Import patient list button

    ...  Expected result:
    ...  The error message shall be displayed to notify that the file format is not supported.
    [Tags]    BCP-PHY-PTNEW-16        manual      [BCP-2.20.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-17: Bulk import - Import 100 patients per file
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  Bulk import method is selected
    ...  The file is should be in csv or xlsx format with 100 patients per file

    ...  Test steps:
    ...  1. Click on Add new patient button from New patients page
    ...  2. Select Bulk import button
    ...  3. Select Clinic information
    ...  4. Click on Import patient list button
    ...  5. Click or drag a valid file to upload the templates list
    ...  6. Click on Import patient list button

    ...  Expected result:
    ...  All 100 patients on file shall be exported to the new patients list successfully.
    [Tags]    BCP-PHY-PTNEW-17        manual      [BCP-2.20.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-18: Bulk import - Import exceed 100 patients per file
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Bulk import method is selected
    ...  The file is should be in csv or xlsx format with exceed 100 patients per file

    ...  Test steps:
    ...  1. Click on Add new patient button from New patients page
    ...  2. Select Bulk import button
    ...  3. Select Clinic information
    ...  4. Click on Import patient list button
    ...  5. Click or drag a valid file to upload the templates list
    ...  6. Click on Import patient list button

    ...  Expected result:
    ...  The error message shall be displayed to notify that the file exceeds 100 patients.
    [Tags]    BCP-PHY-PTNEW-18        manual      [BCP-2.20.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-19: Bulk import - Import an empty file
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  Bulk import method is selected
    ...  The file is should be in csv or xlsx format with empty file

    ...  Test steps:
    ...  1. Click on Add new patient button from New patients page
    ...  2. Select Bulk import button
    ...  3. Select Clinic information
    ...  4. Click on Import patient list button
    ...  5. Click or drag a valid file to upload the templates list
    ...  6. Click on Import patient list button

    ...  Expected result:
    ...  The error message shall be displayed to notify that the file is empty and can not be added.
    [Tags]    BCP-PHY-PTNEW-19        manual      [BCP-2.20.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-20: Bulk import - Import the file with repeated patient info
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  Bulk import method is selected
    ...  The file is should be in csv or xlsx format with repeat patient info

    ...  Test steps:
    ...  1. Click on Add new patient button from New patients page
    ...  2. Select Bulk import button
    ...  3. Select Clinic information
    ...  4. Click on Import patient list button
    ...  5. Click or drag a valid file to upload the templates list
    ...  6. Click on Import patient list button

    ...  Expected result:
    ...  The file shall be added and the duplicated patient info shall be displayed once.
    [Tags]    BCP-PHY-PTNEW-20        manual      [BCP-2.20.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-21: Add New Patient By Bulk Import
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  Bulk import method is selected
    ...  The file is should be in csv or xlsx format with exceed 100 patients per file

    ...  Test Steps:
    ...  1. Click on Add new patient button from New patients page
    ...  2. Select Bulk import button
    ...  3. Select Clinic information
    ...  4. Click on Import patient list button
    ...  5. Click or drag a valid file to upload the templates list
    ...  6. Click on Import patient list button
    ...  7. Click on Add patient(s) button

    ...  Expected Output:
    ...  - The patients list will be added successfully
    ...  - The new patient's care plan will be added and displayed on the Active tab in the Patiens page
    [Tags]    BCP-PHY-PTNEW-21    manual      [BCP-2.20.0]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-22: Add new patient by Biocare users - Self-enroll patients
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The Biocare users option is selected
    ...  The Biocare self-enroll patients (without an on-going program)

    ...  Test steps:
    ...  1. Go to the New patients page from the main navigation
    ...  2. Click Add new patient button on the right side of the page
    ...  3. Enter Patient name into Search bar
    ...  4. Enter Date of birth, select Gender (optional)
    ...  5. Click on Search button
    ...  6. Click on Add button
    ...  7. Edit patient information
    ...  8. Click on Add patient button
    ...  Expected result:
    ...  The user shall be able to search and add new patient by searching patient info on Add new patient page.
    [Tags]    BCP-PHY-PTNEW-22        manual      [BCP-2.20.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-23: Create a program does not exceed the trigger
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1.Login App Biocare > Create a program with heart rate min = 60, max = 100
    ...  2.Perform heart rate creation for 10 minutes with values in the range of 60 =< x =< 100
    ...  3.Login Portal > Check data task screen
    ...
    ...  Expected result:
    ...  Do not display any triggers
    [Tags]    BCP-PHY-PTNEW-23        manual      [BCP-2.21.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-24: Check alert trigger when only 2 data continuously exceed the threshold
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1.Login App Biocare > Create a program with heart rate min = 60, max = 100
    ...  2.Perform heart rate creation in 10 minutes with the following values: 1': 40, 2': 59, 3': 60, 4': 62, 5': 101, 6': 104, 7': 99, 8' = 90, 9': 59, 10': 55
    ...  3.Login Portal > Check data task screen
    ...
    ...  Expected result:
    ...  Do not display any triggers
    [Tags]    BCP-PHY-PTNEW-24        manual      [BCP-2.21.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-25: Check alert trigger when only 3 data continuously exceed the threshold
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1.Login App Biocare > Create a program with heart rate min = 60, max = 100
    ...  2.Perform heart rate creation in 10 minutes with the following values: 1': 40, 2': 59, 3': 60, 4': 62, 5': 101, 6': 104, 7': 101, 8' = 90, 9': 59, 10': 55
    ...  3.Login Portal > Check data task screen
    ...
    ...  Expected result:
    ...  Displays the Heart rate alert trigger with details of 1': 40, 2': 59, 3': 60, 4': 62, 5': 101, 6': 104, 7': 101
    [Tags]    BCP-PHY-PTNEW-25        manual      [BCP-2.21.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-26: Check the Patient Details screen UI without Setup Program
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1.Login Portal > Add new patient
    ...  2.Enter all data correctly and validate > Click Save > Save successfully
    ...  3.Return to the Patients screen > Select the newly created User again > Check UI
    ...
    ...  Expected result:
    ...  Data displays correctly with attached files (figma), does not display items: Time logs, Transmissions, To do tasks, Upcoming, Notification
    [Tags]    BCP-PHY-PTNEW-26        manual      [BCP-2.21.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-27: Check validate the patient's phone field
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1.Login Portal > Select menu Patients
    ...  2.On the Patient screen > Select the Add new patient button
    ...  3.Enter fully validate the patient's fields > Enter any number (min = 1 and max = 10) in the Phone field > Click save
    ...
    ...  Expected result:
    ...  Successfully created new Patient
    [Tags]    BCP-PHY-PTNEW-27        manual      [BCP-2.21.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-28: Check UI and validate Goal & Barriers screen
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1.Login Portal > Select menu Patients
    ...  2.Enter and fully validate the patient's fields > Click Save
    ...  3.Check UI and validate the above screen
    ...
    ...  Expected result:
    ...  Goal Name (required): Free text, maximum 100 characters
    ...  Status: Select 'In Progress' or 'Inactive' (default: 'In Progress')
    ...  Tracking Interval: Select one from the following options: Daily, Weekly, monthly, Every 3 months, Every 6 months, yearly (default: weekly)
    ...  Description (optional): Add context or specific instructions, maximum 500 characters
    [Tags]    BCP-PHY-PTNEW-28        manual      [BCP-2.21.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-29: Perform Set a new goal when the program is inactive
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1.Login portal > Go to patient screen > Create new Patients > Create successfully
    ...  2.In the program with inactive status > Perform Set new Goal
    ...
    ...  Expected result:
    ...  Do not allow creating new goals when program is inactive
    [Tags]    BCP-PHY-PTNEW-29        manual      [BCP-2.21.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-30: Perform Set a new goal when the program is active
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1.Login portal > Go to patient screen > Create new Patients > Create successfully
    ...  2.In the program with active status > Execution Set new Goal has Tracking interval = Daily > Created successfully
    ...  3.Login Biocare app = User above > Check data
    ...
    ...  Expected result:
    ...  The system displays notifications and goals for the above user
    [Tags]    BCP-PHY-PTNEW-30        manual      [BCP-2.21.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-31: Perform Edit a Goal
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1.In Patient there is a Goal > Clicking the 'More' icon and selecting 'Edit' will open the 'Edit Goal' form > Perform editing
    ...
    ...  Expected result:
    ...  Successfully edited Goal. When a goal is updated, the patient will receive a notification about the new update.
    [Tags]    BCP-PHY-PTNEW-31        manual      [BCP-2.21.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-32: Execute Delete a Goal when the program has an is active status
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1.Login portal > Select menu Patient
    ...  2.Select the patient that has a Goal set up
    ...  3.Clicking the 'More' icon and choosing to delete a goal will open a pop-up to confirm.
    ...  4.Click Cancel > button to discard the action, the pop-up will be closed, and navigate the user back to the list of goals.
    ...  5.Click Delete > Check data
    ...
    ...  Expected result:
    ...  If the user confirms the goal deletion, it will be removed and will no longer be tracked in the mobile app from that time onwards if it has In progress status.
    ...  All associated data in the mobile app, including both tabs in the goal section, will be deleted.
    ...  When the goal is deleted, the patient will receive a notification about the deletion.
    ...  This action is logged in Change history.
    [Tags]    BCP-PHY-PTNEW-32        manual      [BCP-2.21.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-33: Calculate the goal progress daily
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1.Login portal > Create 5 Goals with daily tracking named: Goal 01, Goal 02, Goal 03, Goal 04, Goal 05 > Create Success
    ...  2.Login Biocare app > Perform the assessment of the above 5 Goals on January 11, 2023 with the order: 100%, 0%, 30%, 60%, 60% > Add successfully
    ...  3.Login Portal > Check data Goal on January 11, 2023
    ...  4.Login Biocare app > Perform the assessment of the above 5 Goals on February 11, 2023 with the order: 50%, 30%, 30%, 100%, 0% > Add successfully
    ...  5.Login Portal > Check data Goal February 11, 2023
    ...
    ...  Expected result:
    ...  3.For goals with a daily tracking interval, progress will be displayed daily, showing respectively Goal 1 = 100%, Goal 2= 0%, Goal 3= 30%, Goal 4 = 60%, Goal 5 = 60%
    ...  5.The user will score goal progress during each tracking interval in the range from 0%-100%.
    ...    Goal progress is calculated as follows: (percent of the 1st interval + percent of the 2nd interval + ... + percent of the Nth interval )/N. \
    ...    We calculate goal progress based on the days when the user progress inputs and disregard days when the user misses.
    ...    Display respectively Goal 1 = (100% + 50%) /2 = 75%, similar to Goal 2 = 15%, Goal 3 = 30%, Goal 4 = 80, Goal 5 = 30
    [Tags]    BCP-PHY-PTNEW-33        manual      [BCP-2.21.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-34: Add new barriers
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1.Login portal > Select patient > At patient detail, there are any program types, add new barriers > Create successfully
    ...  2.Input data larger than 500 characters > Click Save
    ...  3.Input data <= 500 characters > Click Save
    ...
    ...  Expected result:
    ...  2.Display error messages
    ...  3.Successfully saved the above barriers
    [Tags]    BCP-PHY-PTNEW-34        manual      [BCP-2.21.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-35: Edit Barriers
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1.Login portal > Select patient > In patient detail, there are Barriers > Perform editing
    ...  2.Edit Barriers with data larger than 500 characters > Click Save
    ...  3.Edit data <= 500 characters > Click Save
    ...  4.Return to the Patient detail screen > Click on the Change history icon > Check data

    ...  Expected result:
    ...  2.Display error messages
    ...  3.Successfully saved the above barriers.
    ...  4.This action is logged in Change history
    [Tags]    BCP-PHY-PTNEW-35        manual      [BCP-2.21.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-36: Create Bioheart Report
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1.Login Portal > Create new patients > Created successfully
    ...  2.Select the Monitored Data tab > Make sure to select Set monitored data
    ...  3.Active ECG From Bioheart > select Report frequency = 2 days > Click Save
    ...  4.Login App using User above > Make deviced connection to Bio Heart

    ...  Expected result:
    ...  Displays data for 2 consecutive days from the moment the bioheart device is connected
    [Tags]    BCP-PHY-PTNEW-36        manual      [BCP-2.21.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-37: Check data search by program ID Heart Monitor Notification
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1.Login Portal > Select Heart Monitor menu > Select Notification
    ...  2.At the text box search > Select Search by Program ID
    ...  3.Enter the Program ID to search > Click Search

    ...  Expected result:
    ...  Displays the correct Program ID to search for, does not display other data
    [Tags]    BCP-PHY-PTNEW-37        manual      [BCP-2.21.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-38: Perform Change status of goal
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1.Login Portal > Select menu Patient
    ...  2.At Patient, there is a Goal set > At filter status, change status Inprogress -> Achieved or vice versa

    ...  Expected result:
    ...  Change successfully.When a goal is changed from ‘Achieved’ to 'In progress, the goal will track progress immediately based on the tracking interval.
    ...  When a goal's status is changed, the patient will receive a notification about the new update.This action is logged in Change history.
    [Tags]    BCP-PHY-PTNEW-38        manual      [BCP-2.21.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-39: Update QoL for program type = RPM
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1.Login portal > Create new patients with program type = RPM
    ...  2.At condition listed under Monitored Diagnosis, select "Atrial fibrillation and flutter" > Check data

    ...  Expected result:
    ...  Display QoL on portal and App question: "How much were your daily activities limited by Atrial Fibrillation-related symptoms?"
    [Tags]    BCP-PHY-PTNEW-39        manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-40: [Updated] Add patient’s initial QoL test (CCM, RPM, CCM&RPM)
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1.Login portal > The user is in a patient details page
    ...  2. Available for all program types > The program is Active
    ...  3. The patient hasn't completed the initial test in the mobile app.
    ...  4. Login portal> Check data

    ...  Expected result:
    ...  Clinic users can complete the QOL test for patients by clicking the "Add patient’s quality of life" button.
    ...  This button will only be displayed in the month that the program starts.
    [Tags]    BCP-PHY-PTNEW-40        manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-41: Check the Patients screen UI
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1.Login App > Create Biocare User with name = Biocare1 > Create successfully, display send email popup
    ...  2. Email verification has not been performed
    ...  3. Login Portal > Select menu Patients > Check UI tab Diagnostic Users
    ...  4. Perform Biocare email verification 1
    ...  5. Login Portal > Select menu Patients > Check UI tab Diagnostic Users

    ...  Expected result:
    ...  3. Not displayed User Biocare 1
    ...  5. Displays User Biocare 1 with facility = Bioflux Facility
    [Tags]    BCP-PHY-PTNEW-41        manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-42: Check the patient display data of the Diagnostic User tab
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login Portal
    ...  2. Select the patients menu
    ...  3. Select the Diagnostic User tab
    ...  4. Check the display order of patients

    ...  Expected result:
    ...  The patient list is sorted based on completed profile date. In case there are multiple patients, they are arranged in a paginated format.
    [Tags]    BCP-PHY-PTNEW-42        manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-43: Check filter màn hình Diagnostic User
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login Portal > Select menu Patients
    ...  2. Select the Diagnostic User tab
    ...  3. Select the Filter button > Display 2 buttons Active and Inactive
    ...  4. Just click the Active button
    ...  5. Click to select both Active and Inactive buttons or do not select any button

    ...  Expected result:
    ...  4. The system only displays data of patients whose App Activity Status is Active, hiding all information of patients whose App Activity Status is Inactive
    ...  5. Displays all Patients whose App Activity Status is Inactive or Active
    [Tags]    BCP-PHY-PTNEW-43        manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-44: Perform a search for Patients by Patient Name
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login Portal > Select menu Patients
    ...  2. At the Diagnostic User tab > Perform a search text box Patient Name

    ...  Expected result:
    ...  Expect: Search by search like, display data according to search file
    [Tags]    BCP-PHY-PTNEW-44        manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-45: Check view Diagnostic user details page
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login Portal > Select menu Patients
    ...  2. Select the Diagnostic User tab > At any patient > Select "Detail"
    ...  3. Check data tab "Health Data"
    ...  4. Check data tab "Medication"
    ...  5. Check data tab "Report"
    ...  6. Check data tab "QoL"
    ...  7. Check data tab "Heart Monitor"

    ...  Expected result:
    ...  2. Displays the Patient details screen with the tabs "Health Data", "Medication", "Report", "Quality Of Life", "Heart Monitor"
    ...  3. The charts will display all the data recorded since the day the user first signed in.
    ...     The information to be displayed includes heart rate, heart rate variability, resting heart rate, blood pressure, SpO2, body temperature, ECG from Bioheart (if the user uses Bioheart), sleep data, weight, and active minutes.
    ...  4. Display the patient-added medications with two statuses: Active and Inactive, along with the following information:
    ...          Medication name
    ...          SIG (dosage and unit)
    ...          Frequency
    ...          Start date: The date the user entered the medication
    ...          Last modified: the date that the user last edited the medication.
    ...  5. Show all the monthly reports automatically generated in the Biocare Health app. Users can access to view the details of these reports and download the report.
    ...  6. Display all the patient's completed monthly Quality of Life tests.
    ...  7. This tab is the same as the care plan's 'Health Monitor' tab, where we display all the patient's study facility information (displaying regardless of the associated). It includes two tabs: 'Current Study' for ongoing studies and 'Previous Studies' for the patient's past studies. But the clinic user cannot prescribe or start a new study.
    [Tags]    BCP-PHY-PTNEW-45        manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-46: Check displays Patient information at the top of the page
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login Portal > Select menu Patients
    ...  2. Select the Diagnostic User tab
    ...  3. Check displays Patient information at the top of the page

    ...  Expected result:
    ...  3. Display patient information with the following information: Patient name, Date of birth, Height, Weight, BMI, Email, Phone number, Country, Address Active status: Active/Inactive
    [Tags]    BCP-PHY-PTNEW-46        manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-47: Perform Enroll a Diagnostic user to a program
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login Portal > Select menu Patients
    ...  2. Select the Diagnostic User tab
    ...  3. Select Detail > Select the Enroll in program button

    ...  Expected result:
    ...  Display the "Add new patient" screen with the same validation information. If there is no data available, the fields will be left empty.
    ...  The rules for this process are the same as when adding a new program manually
    [Tags]    BCP-PHY-PTNEW-47        manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-48: Perform adding a new program for Diagnostic users
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login Portal > Select menu Patients
    ...  2. Select the Diagnostic User tab
    ...  3. Select Detail > Select the Enroll in program button
    ...  4. Display the Add new patient screen > Perform add new program type (CCM, RPM, CCM&RPM)
    ...  5. Click Save > Check data

    ...  Expected result:
    ...  It will automatically commence and be visible in the 'Active' tab. This program will be seamlessly connected to the Biocare Health app without requiring a reference code input. When the program is linked successfully
    ...    The patient now must sign the consent form(s) based on the enrolled program type.
    ...    Sign the Electronic communication consent if they have not agreed before.
    [Tags]    BCP-PHY-PTNEW-48        manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-49: Check data entered after verifying their account
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login App > Perform input data including health data, quality of life tests, reports, medications, and study information
    ...  2. Login Portal > Verify patient's email above
    ...  3. Click Save > Check data

    ...  Expected result:
    ...  All patient data entered in the mobile app will sync with the program from the day the patient verifies their account, including health data, quality of life tests, reports, medications, and study information.
    [Tags]    BCP-PHY-PTNEW-49        manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-50: Check data What's new video when selecting View Later and Got it
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login Admin Portal > Select Contents menu
    ...  2. At the Biocare Disease Management tab > Attach the video link > Click Save
    ...  3. Login Portal with new User > Check data
    ...  4. Click the View late button > Click to refresh the page
    ...  5. Select the Got it button > Click to refresh the page

    ...  Expected result:
    ...  3. Displays the video link attached to the Biocare Disease Management page
    ...  4. Display the above video again
    ...  5. Do not display the above video again
    [Tags]    BCP-PHY-PTNEW-50        manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-51: Perform Add medicaiton
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login Portal > Select menu Patients
    ...  2. Select any Patient > Display Patient details
    ...  3. Select the Medical Records tab > Select Medications
    ...  4. Click Add medication > Add medication: Vitamin A, Vitamin B, Vitamin C
    ...  5. Click Save changes
    ...  6. Return to the Active medications screen > Click the Add medication button
    ...  7. Add medication again: Vitamin A, Vitamin C
    ...  8. Click Save changes

    ...  Expected result:
    ...  5. Successfully added new medications above
    ...  8. Display error message popup
    [Tags]    BCP-PHY-PTNEW-51        manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-52: Check data dropdown list search when medication is Allergic
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. At Patient A > There are 4 medications: Vitamin A, Vitamin B, Vitamin C, Vitamin D
    ...  2. At Vitamin A > Click the Flag as allergy button > Select Flag Only
    ...  3. Click Add medication > Search dropdown list > Enter Vitamin A
    ...  4. Check data

    ...  Expected result:
    ...  Display medication information, display additional Allergic symbolsp
    [Tags]    BCP-PHY-PTNEW-52        manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-53: Check data report when medication Allergic is available
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. In patients, there is an antibiotic attached
    ...  2. Check data report when medication Allergic is available

    ...  Expected result:
    ...  Displays the word Allergic in yellow
    [Tags]    BCP-PHY-PTNEW-53        manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-54: Check button live ECG streaming
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login Portal > Select Patients who have not enabled ECG from bioheart
    ...  2. Check button live ECG streaming
    ...  3. Login Portal > Select Patients who have enabled ECG from bioheart, not yet on the App > Check data
    ...  4. Login Portal > Select Patients who have enabled ECG from bioheart, execute onl App > Check data

    ...  Expected result:
    ...  2. Disable button live
    ...  3. Disable button live
    ...  4. Enable button live
    [Tags]    BCP-PHY-PTNEW-54        manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-55: Check live ECG data and time out
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login portal > Select Patient with ECG from bioheart enabled, execute onl App
    ...  2. Click the live ECG button
    ...  3. Check live ECG data
    ...  4. Hang up the device, select another tab within 2 minutes
    ...  5. Check Popup time out
    ...  6. Execute and select Try again
    ...  7. Select Try again, but the App is no longer connected

    ...  Expected result:
    ...  3. After about 10-15 seconds, displays the bio heart charts
    ...  5. Display time out popup, display Try again button
    ...  6. The system automatically reconnects to live, displaying the full bio heart record
    ...  7. Display connect failed
    [Tags]    BCP-PHY-PTNEW-55        manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-56: Check data and live ECG button when the App is connected but the screen is off
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login App to patients set up on ECG from Bioheart
    ...  2. Login portal > Select Patients above
    ...  3. Click to select live ECG streaming
    ...  4. Turn off the App screen but do not turn off the application
    ...  5. Check data portal

    ...  Expected result:
    ...  Live ECG streaming still works, displaying full records from Bioheart
    [Tags]    BCP-PHY-PTNEW-56        manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-57: Check UI patients details
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login portal > Choose any patietns
    ...  2. Check UI patients details
    ...  3. Click the Calendar tab > Check data

    ...  Expected result:
    ...  2. Show more Calendar tab
    ...  3. Displays 2 menus Appointments and Schedule. At Appointments, two text boxes are displayed: Upcoming and History
    [Tags]    BCP-PHY-PTNEW-57        manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-58: Check UI Upcoming button when there is an appointment
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login portal > Choose any patietns
    ...  2. Click the Calendar tab > Select the Upcoming button
    ...  3. Check appointment schedule UI

    ...  Expected result:
    ...  Displayed in format
    ...   • Time
    ...   • Date
    ...  • Repeat frequency (if available)
    ...  • Reason for visiting
    ...  • Appointment type
    ...  • Attending caregivers: The profile picture, name, role of the attending caregivers
    ...  • Quick action button (The rule is the same as on other pages):
    ...  o Virtual appointment: Join and Finish appointments
    ...  o In-person appointments: Mark as done and Mark as overdue
    [Tags]    BCP-PHY-PTNEW-58        manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-59: Create Appointments
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login Portal > At the calendar tab, select the New button
    ...  2. Perform full validation on the Schedule New Appointment screen
    ...  3. Click Save > Check data patients Calendar

    ...  Expected result:
    ...  Display Appointments in the Upcoming button with the correct format
    [Tags]    BCP-PHY-PTNEW-59        manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-60: Check UI displays when there are many Appointments
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login Portal > Create Appointments for User A on January 15, User B on January 16, User C on January 17, User D on January 18
    ...  2. Select the Calendar tab > Check UI

    ...  Expected result:
    ...  If the patient has more than one appointment, display all the upcoming appointments of the next 7 days sorted by time nearest appointment to furthest.
    ...  Display the explanation in the Upcoming tab. The appointments will be arranged in ascending order, from the most recent to the furthest in the future.
    [Tags]    BCP-PHY-PTNEW-60        manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-61: View list of historical appointments of a specific patient
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login Portal > At the Upcoming tab, the clinic user performs:
    ...       • The clinic user marks the appointment as finished/overdue
    ...       • The clinic cancels the appointment.
    ...       • The appointment time finished, overdue

    ...  Expected result:
    ...  The appointment will be moved to the History tab
    [Tags]    BCP-PHY-PTNEW-61      manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-62: Check UI data tab History
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login portal > Select patients with Appoinment setup
    ...  2. At patients details >Select the Calendar tab
    ...  3. Select the History tab > Check UI

    ...  Expected result:
    ...  By default, the appointments of the current month will be displayed in order from latest to oldest. The user can open the month picker to select a month to view the appointments of that month. (Can not pick the month in the future )
    ...     Each appointment contains the following information:
    ...     • Time
    ...     • Date
    ...     • Repeat frequency (if available)
    ...     • Reason for visiting
    ...     • Appointment type
    ...     • Attending caregivers: The profile picture, name, role of the attending caregivers
    ...     • Quick action button (The rule is the same as on other pages):
    ...     o In-person appointments: Mark as done and Mark as overdue
    [Tags]    BCP-PHY-PTNEW-62      manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-63: Check Appointment status History
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. At the Upcoming tab, select done
    ...  2. At the Upcoming tab, proceed to exceed the previously set time
    ...  3. At the Upcoming tab, select Cancel
    ...  4. In case the appointment is marked finished/overdue before the appointment starts, check status

    ...  Expected result:
    ...  1. Appointments above move to history tab with status = Done
    ...  2. Appointments above are moved to the history tab with status = Overdue
    ...  3. Appointments above are moved to the history tab with status = Canceled
    ...  4. Display it on the History tab at the start time of the appointment
    [Tags]    BCP-PHY-PTNEW-63      manual      [BCP-2.22.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-64: Check the Patients screen UI
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login Portal > Check UI screen

    ...  Expected result:
    ...  Change old UI, display 4 tabs: Active, New, Inactive, App Users and icon "?"
    [Tags]    BCP-PHY-PTNEW-64      manual      BCCA-2.26
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-65: Check UI New tab
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login Portal > Select menu Patients
    ...  2. Perform Create new patients
    ...  3. Display the new creation screen > Enter all valid fields correctly > Click Save
    ...  4. Return to the patient detail screen > Click on the New tab
    ...  5. Perform Set up program properly and validate > Click Save

    ...  Expected result:
    ...  3. Successfully created a new patient that has not yet been set up by the program
    ...  4. Displays the newly created patient, displays the "Set up program" button
    ...  5. Patient above is still in the new tab, displaying 2 more buttons "Set monitored data" and "Set patient reminder"
    [Tags]    BCP-PHY-PTNEW-65      manual      BCCA-2.26
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-66: Perform Active patient
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login Portal > Select menu Patients
    ...  2. Execute Create new patients with program type = CCM&RPM
    ...  3. Display the new creation screen > Enter all valid fields correctly > Click Save
    ...  4. The newly created Expect: Patient is displayed on the New tab
    ...  5. Perform Set up Program > Click Save
    ...  6. Continue to sign the RPM consent
    ...  7. Execute the program Code link > Click Save

    ...  Expected result:
    ...  5. Patient is still displayed in the New tab
    ...  6. Signed successfully, eligible for patient Active
    ...  7. Successfully linked program and patient from New tab to Active tab
    [Tags]    BCP-PHY-PTNEW-66      manual      BCCA-2.26
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-67: Perform Active patient
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login Portal > Select menu Patients
    ...  2. On the Patients screen > Perform hover and point to the "?" icon.
    ...  3. Click on the icon "?"

    ...  Expected result:
    ...  2. Display text " explanation for Tabs on the Patients Page"
    ...  3. Display condition notification popup to have status "Active", "New", "Inactive", "App Users"
    [Tags]    BCP-PHY-PTNEW-67      manual      BCCA-2.26
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTNEW-68: Check real time ref-code when resend on patient portal
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login portal > Create new patients
    ...  2. At patient detail > Button Code > Execute select "Resend"

    ...  Expected result:
    ...  2. Displays new code in real time
    [Tags]    BCP-PHY-PTNEW-68      manual      BCCA-2.26
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

Filter Patients - New
    [Arguments]     ${by_patient}     ${status}    ${search_by}
    Navigate To Patients New
    Filter New Patients     by_patient=${by_patient}    by_status=${status}    search_by=${search_by}
    ${new_patients}     Get New Patients
    ${text}     Set Variable    ${new_patients}[0][${search_by}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${new_patients}       No new patient found - ${search_by} without text string
    Filter New Patients     by_patient=${by_patient}    by_status=${status}    search_by=${search_by}      text_search=${text}
    ${new_patients}     Get New Patients
    Run Keyword And Continue On Failure    Should Not Be Empty    ${new_patients}       No new patient found - ${search_by} ${text}
    Run Keyword If    '${search_by}' == 'Patient Name'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}'.lower() in p['${search_by}'].lower() for p in ${new_patients})
    Run Keyword If    '${search_by}' == 'Care Plan ID'      Run Keywords
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}' == p['${search_by}'] for p in ${new_patients})
    ...  AND    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${text}       ${new_patients}[0][${search_by}]
    # Navigate to Patient details and verify
    View New Patient Details On    row=1
    ${patient_details}      Get Patient Details Common
    Run Keyword And Continue On Failure    Should Not Be Empty    ${patient_details}
    Run Keyword And Continue On Failure    Should Be True    ['${new_patients}[0][Patient Name]' in ${patient_details}[0].keys()]
    Run Keyword And Continue On Failure    Should Contain    ${patient_details}[0]      Care plan ID: ${new_patients}[0][Care Plan ID]
    Run Keyword And Continue On Failure    Should Contain    ${patient_details}[0][Registered clinic]    ${new_patients}[0][Clinic]

Filter New - Deleted Care Plans
    [Arguments]    ${by_patient}       ${search_by}
    Navigate To Patients New
    Filter Deleted Patients    by_patient=${by_patient}    search_by=${search_by}
    ${del_patients}     Get Deleted Patients
    ${text}     Set Variable    ${del_patients}[0][${search_by}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${del_patients}     No deleted patient found - ${search_by} without text string
    Filter Deleted Patients    by_patient=${by_patient}    search_by=${search_by}     text_search=${text}
    ${del_patients}     Get Deleted Patients    row=1
    Run Keyword And Continue On Failure    Should Not Be Empty    ${del_patients}     No deleted patient found - ${search_by} ${text}
    Run Keyword If    '${search_by}' == 'Patient Name'
    ...  Run Keyword And Continue On Failure    Should Contain      ${del_patients}[${search_by}]    ${text}
    Run Keyword If    '${search_by}' == 'Care Plan ID'      Run Keywords
    ...  Run Keyword And Continue On Failure    Should Be Equal    ${text}      ${del_patients}[${search_by}]
    ...  AND    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${text}       ${del_patients}[${search_by}]
