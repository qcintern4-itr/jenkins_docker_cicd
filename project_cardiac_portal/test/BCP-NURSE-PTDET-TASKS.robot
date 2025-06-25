*** Settings ***
Documentation   Cardiac Patient Details page > Daily Entry test suite
Metadata    sid     BCP-NURSE-PTDET-TASKS
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/PatientDetails.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-NURSE-PTDET-TASKS      web
Test Timeout    1h

*** Test Cases ***
BCP-NURSE-PTDET-TASKS-01: Clinic user filters the task list by "My tasks"
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The user is on the patient detail page --> Task tab

    ...  Test steps:
    ...  1. Go to the patient detail page --> Task tab
    ...  2. Select "My task" option

    ...  Expected result:
    ...  The clinic user shall be able to filter the task list by clicking "My tasks" option
    ...  The clinic user's task list shall be displayed.
    [Tags]    BCP-NURSE-PTDET-TASKS-01     manual      [BCP-2.20.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-02: Clinic user filters the task list by "All tasks"
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The user is on the patient detail page --> Task tab

    ...  Test steps:
    ...  1. Go to the patient detail page --> Task tab
    ...  2. Select "All task" option

    ...  Expected result:
    ...  The clinic user shall be able to filter the task list by clicking "My tasks" option
    ...  The clinic user's task list shall be displayed.
    [Tags]    BCP-NURSE-PTDET-TASKS-02     manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-03: Search tasks by "Task name"
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The user is on the patient detail page --> Task tab

    ...  Test steps:
    ...  1. Go to the patient detail page --> Task tab
    ...  2. Select "Task name" option
    ...  3. Enter data into Search bar

    ...  Expected result:
    ...  The clinic user shall be able to search patient's tasks list by task name successfully.
    [Tags]    BCP-NURSE-PTDET-TASKS-03     manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-04: Search tasks by "Patient name"
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The user is on the patient detail page --> Task tab

    ...  Test steps:
    ...  1. Go to the patient detail page --> Task tab
    ...  2. Select "Patient name" option
    ...  3. Enter data into Search bar

    ...  Expected result:
    ...  The clinic user shall be able to search patient's tasks list by Patient name successfully.
    [Tags]    BCP-NURSE-PTDET-TASKS-04     manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-05: Filter the task list by "Priority"
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The user is on the patient detail page --> Task tab

    ...  Test steps:
    ...  1. Go to the patient detail page --> Task tab
    ...  2. Select "All task"/"My task" option
    ...  3. Click on Filter button & select Priority option (such as: high, medium, low)
    ...  4. Click on Apply button

    ...  Expected result:
    ...  The clinic user shall be able to filter patient's tasks list by Priority successfully.
    [Tags]    BCP-NURSE-PTDET-TASKS-05     manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-06: Filter the task list by "Flag"
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The user is on the patient detail page --> Task tab

    ...  Test steps:
    ...  1. Go to the patient detail page --> Task tab
    ...  2. Select "All task"/"My task" option
    ...  3. Click on Filter button & select Flag option (such as: flag, non-flag)
    ...  4. Click on Apply button

    ...  Expected result:
    ...  The clinic user shall be able to filter patient's tasks list by Flag successfully.
    [Tags]    BCP-NURSE-PTDET-TASKS-06     manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-07: Filter the task list by "Status"
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The user is on the patient detail page --> Task tab

    ...  Test steps:
    ...  1. Go to the patient detail page --> Task tab
    ...  2. Select "All task"/"My task" option
    ...  3. Click on Filter button & select Status option (such as: to do, done)
    ...  4. Click on Apply button

    ...  Expected result:
    ...  The clinic user shall be able to filter patient's tasks list by Status successfully.
    [Tags]    BCP-NURSE-PTDET-TASKS-07     manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-08: Click on Flag button
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The user is on the patient detail page --> Task tab

    ...  Test steps:
    ...  1. Go to the patient detail page --> Task tab
    ...  2. Click on Flag button

    ...  Expected result:
    ...  The button is highlight.
    [Tags]    BCP-NURSE-PTDET-TASKS-08     manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-09: Click on UnFlag button
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The user is on the patient detail page --> Task tab

    ...  Test steps:
    ...  1. Go to the patient detail page --> Task tab
    ...  2. Click on UnFlag button

    ...  Expected result:
    ...  The button is not highlight.
    [Tags]    BCP-NURSE-PTDET-TASKS-09     manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-10: Click on Mark as done button
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The user is on the patient detail page --> Task tab

    ...  Test steps:
    ...  1. Go to the patient detail page --> Task tab
    ...  2. Click on Mark as done button

    ...  Expected result:
    ...  The clinic user shall be able to see tooltip text is Mark as done.
    ...  The button is highlight.
    ...  The task is moved to Done tab in Task page
    [Tags]    BCP-NURSE-PTDET-TASKS-10     manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-11: Click on Mark as undone button
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The user is on the patient detail page --> Task tab

    ...  Test steps:
    ...  1. Go to the patient detail page --> Task tab
    ...  2. Click on Mark as undone button

    ...  Expected result:
    ...  The clinic user shall be able to see tooltip text is Mark as undone.
    ...  The button is not highlight.
    ...  The task is moved to To do tab in Task page
    [Tags]    BCP-NURSE-PTDET-TASKS-11     manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-12: Check Tasks screen UI Update
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select Tasks menu
    ...  2. Check Tasks screen UI

    ...  Expected result:
    ...  Fully displays the field as shown, adding the Assigned to field
    [Tags]    BCP-NURSE-PTDET-TASKS-12     manual      BCCA-2.23.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-13: Check UI the change log of a task
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login portal > Select task menu
    ...  2. Display the task list screen > Select any task
    ...  3. At the above task > Re-assign has not been performed > Check data change log
    ...  4. Perform re-assignment to any user > Check UI format

    ...  Expected result:
    ...  3. Display empty data, with message: "There is no data to display"
    ...  4. The list should be sorted by the logged date in descending order.
    ...          Date-time stamp (Format: MM/DD/YYYY, Hh:Mm AM/PM)
    ...          Profile picture and username (Display “You” if the user is the person who made the change otherwise display the name of the medic)
    [Tags]    BCP-NURSE-PTDET-TASKS-13     manual      BCCA-2.23.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-14: Execute re-assign tasks
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login portal > Select task menu
    ...  2. Select the Done tab on the Tasks screen > Check icon button re-assign
    ...  3. At the To do tab on the Tasks screen > Click the Re-assign button icon
    ...  4. Re-assign to any clinic successfully > Check data
    ...  5. Re-assigning to any clinic fails > Check data

    ...  Expected result:
    ...  2. Do not display the Re-assign button icon on the Done tab
    ...  3. Display dropdown list shall display, which includes all the physician names (both nurse and physician) within the facility of the patient, except for the current assignee
    ...  4. Display the success message “Task has been re-assigned successfully!”. The assigned person shall receive a notification about this assignment.
    ...  5. Display failure message "Task is failed to be re-assigned!”
    [Tags]    BCP-NURSE-PTDET-TASKS-14     manual      BCCA-2.23.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-15: Check validate clinic user
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login portal > Select task menu
    ...  2. Select the Done tab on the Tasks screen > Click on the re-assign button icon

    ...  Expected result:
    ...  2. Full display of all active clinic Users in the same Facility
    [Tags]    BCP-NURSE-PTDET-TASKS-15     manual      BCCA-2.23.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-16: Check UI item Add a new comment on a task
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login User portal is not assigned task
    ...  2. In the Comments text box, without entering characters > Check UI
    ...  3. Click to enter characters > Check UI

    ...  Expected result:
    ...  2. Show hidden text "Add a comment"
    ...  3. Display the mouse cursor at the position where the character is entered, display the "Comment" and "Cancel" buttons
    [Tags]    BCP-NURSE-PTDET-TASKS-16     manual      BCCA-2.23.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-17: Check validate item Add a new comment on a task
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login portal > Select Tasks menu
    ...  2. Open any task in the To Do tab
    ...  3. In the Comment text box > Click but do not enter any characters > Check data
    ...  4. In the text box Comment > Enter max length > 200 characters > Check data
    ...  5. Re-enter max length <= 200 characters
    ...  6. Click the Comment button > Check data

    ...  Expected result:
    ...  3. Disable Comment button, enable Cancel button
    ...  4. Display error message "The maximum number of characters is 200", Comment button is disabled
    ...  5. Comment successful, full display of entered data
    [Tags]    BCP-NURSE-PTDET-TASKS-17     manual      BCCA-2.23.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-18: Check data when clicking the Cancel button
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login portal > Select Tasks menu
    ...  2. Open any task in the To Do tab
    ...  3. In the text box Comment > Enter max length
    ...  4. Click the Cancel button > Check data

    ...  Expected result:
    ...  4. Delete all entered characters, return to default screen
    [Tags]    BCP-NURSE-PTDET-TASKS-18     manual      BCCA-2.23.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-19: Check UI View comments on a task
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login portal > Select Tasks menu
    ...  2. Open any task in the To Do tab
    ...  3. In the text box Comment > Enter any character and validate
    ...  4. Select the Comment button > Check data
    ...  5. Check data format comments task
    ...  6. Check UI user comments
    ...  7. Edit comment > Check UI

    ...  Expected result:
    ...  4. The list of comments shall be sorted by the created date from newest to oldest
    ...  5. Date-time stamp: Display the last modified date.
    ...          Just now: when the latest modification is less than 1 minute
    ...          X minute(s) ago: < 60 minutes
    ...          X hour(s) ago: < 24 hours
    ...       <MM/DD/YYYY at Hh:Mm AM/PM>: > 24 hours
    ...  6. Profile picture and username, Content of the comment
    ...  7. If the comment has been edited, display “(edited)” next to the date-time stamp.
    [Tags]    BCP-NURSE-PTDET-TASKS-19     manual      BCCA-2.23.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-20: Execute Edit comment on a task
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Check UI comments of users other than yourself
    ...  2. Check your UI comments
    ...  3. Click on the Edit icon
    ...  4. Make edit max length > 200 characters
    ...  5. Perform edit max length <= 200 characters

    ...  Expected result:
    ...  1. Edit and Delete buttons are not displayed
    ...  2. Display Edit and Delete buttons
    ...  3. Displays text box and allows editing data, displays 2 buttons Save and Discard changes
    ...  4. Button Save is disabled, displaying the message: "The maximum number of characters is 200"
    ...  5. Button Save enabled, click Save, the system saves and fully displays the newly edited data
    [Tags]    BCP-NURSE-PTDET-TASKS-20     manual      BCCA-2.23.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-21: Execute Delete a comment on a task
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Delete another user's comment > Check data
    ...  2. Delete your comment > Check data
    ...  3. Click Cancle
    ...  4. Click Delete

    ...  Expected result:
    ...  1. Do not display the Delete button, do not allow Delete
    ...  2. Display popup message: "Delete this comment? This action cannot be undone. Are you sure you want to delete this comment"
    ...  3. The system keeps data unchanged
    ...  4. The system deletes all previous comments
    [Tags]    BCP-NURSE-PTDET-TASKS-21     manual      BCCA-2.23.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-22: Check notification user when receiving assignment
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login portal > Perform re-assign tasks for User A > Assign successfully
    ...  2. Login portal with user A > Check notification
    ...  3. Click notification is pressed > Check data

    ...  Expected result:
    ...  2. Display notification to notify assign task. Contains the following content:
    ...     • Title: Task assignment
    ...     • Content: <Name of the user who re-assigned> has assigned you to the task <Task name> of <Patient’s last name and first name>
    ...     • Notification time: <HH: MM - MM/DD/YYYY>
    ...  3. The user will be navigated to the Tasks page/To do tab/Task details side tab.
    [Tags]    BCP-NURSE-PTDET-TASKS-22     manual      BCCA-2.23.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-23: Check UI update Settings menu
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login portal > Select Settings menu
    ...  2. Check UI update Settings menu

    ...  Expected result:
    ...  2. Displayed as Figma file, with 2 tabs Patient Reminder and Monthly report format
    [Tags]    BCP-NURSE-PTDET-TASKS-23     manual      BCCA-2.23.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-24: Check notification user when receiving assignment
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Go to Settings menu
    ...  2. Select the Monthly report format tab
    ...  3. Have not performed any kneading operations > Select the Change log button > Check data
    ...  4. Make changes to the program type, from CCM&RPM > CCM
    ...  5. Check data change log

    ...  Expected result:
    ...  3. Do not display any data
    ...  5. Display change log screen with format :
    ...     Date (Format: MM/DD/YYYY, HH:MM (12-hour))
    ...     Profile picture and username (Display “You” if the user is the person who made the change otherwise display the name of the caregiver)
    ...     Category : Update Monthly report format settings < Program Type >
    [Tags]    BCP-NURSE-PTDET-TASKS-24     manual      BCCA-2.23.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-25: Check UI Settings Mothly report format with Program type = RPM of a facility
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select Settings menu
    ...  2. At the Settings screen > Select the Monthly report format tab > Check UI
    ...  3. Check UI RPM - Default settings

    ...  Expected result:
    ...  2. Displays Settings Monthly report screen format like figma file. Displays clinic user's facility dropdownlist. Displays 3 button options CCM, CCM&RPM and RPM
    ...  3. Fixed Section includes: EHRA score, Weight – BMI, Blood pressure, Oxygen saturation, Body temperature, Heart rate, Resting heart rate,
    ...     Heart rate variability, Heart rate during activity, Rhythm diary, Noteworthy snapshots, Notes
    ...          - Optional Section: Quality of life scores, task list
    ...          - Include a details table: Weight – BMI, Blood pressure, Body temperature, Heart rate
    [Tags]    BCP-NURSE-PTDET-TASKS-25     manual      BCCA-2.23.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-26: Check data monthly report while keeping the default Program type = RPM of a facility, without clicking Include a details table
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select Settings menu
    ...  2. At the Settings screen > Select the Monthly report format tab
    ...  3. Keep the default RPM program intact > Click Save
    ...  4. Select the Reports menu > Generate Monthly report > Check data

    ...  Expected result:
    ...  4. Display report with the following sections: EHRA score, Weight – BMI, Blood pressure, Oxygen saturation, Body temperature, Heart rate, Resting heart rate,
    ...     Heart rate variability, Heart rate during activity, Rhythm diary, Noteworthy snapshots, Notes
    ...     Not showing: QoL, tasks list and Details table
    [Tags]    BCP-NURSE-PTDET-TASKS-26     manual      BCCA-2.23.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-27: Check data monthly report when changing Section with Program type = RPM of a facility, do not click Include a details table
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select Settings menu
    ...  2. At the Settings screen > Select the Monthly report format tab
    ...  3. Click on the Quality of life scores and Tasks list buttons, click on all Include a details table, program type = RPM > Click Update
    ...  4. Select the Reports menu > Generate Monthly report > Check data

    ...  Expected result:
    ...  4. Display report with the following sections: EHRA score, Weight – BMI, Blood pressure, Oxygen saturation, Body temperature, Heart rate, Resting heart rate,
    ...     Heart rate variability, Heart rate during activity, Rhythm diary, Noteworthy snapshots, Notes, QoL, tasks list
    ...          Not showing: Details table
    [Tags]    BCP-NURSE-PTDET-TASKS-27     manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-28: Check data monthly report when changing Section with Program type = RPM of a facility, do not click Include a details table
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select Settings menu
    ...  2. At the Settings screen > Select the Monthly report format tab
    ...  3. Keep the default RPM program intact > Click Save
    ...  4. Select menu Patients > Select Report tab on Patient Detail screen
    ...  5. Select On-demand reports > Perform Create report > Check data

    ...  Expected result:
    ...  5. Display report with the following sections: EHRA score, Weight – BMI, Blood pressure, Oxygen saturation, Body temperature, Heart rate, Resting heart rate,
    ...     Heart rate variability, Heart rate during activity, Rhythm diary, Noteworthy snapshots, Notes
    ...          Not showing: QoL, tasks list and Details table
    [Tags]    BCP-NURSE-PTDET-TASKS-28     manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-29: Check data On-demand reports when changing Section with Program type = RPM of a facility, do not click Include a details table
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select Settings menu
    ...  2. At the Settings screen > Select the Monthly report format tab
    ...  3. Click on the button Quality of life scores and Tasks list, program type = RPM > Click Update
    ...  4. Select menu Patients > Select Report tab on Patient Detail screen
    ...  5. Select On-demand reports > Perform Create report > Check data

    ...  Expected result:
    ...  5. Display report with the following sections: EHRA score, Weight – BMI, Blood pressure, Oxygen saturation, Body temperature, Heart rate, Resting heart rate,
    ...     Heart rate variability, Heart rate during activity, Rhythm diary, Noteworthy snapshots, Notes, QoL, tasks list
    ...          Not showing: Details table
    [Tags]    BCP-NURSE-PTDET-TASKS-29     manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-30: Check data On-demand reports when changing Section with Program type = RPM of a facility, with Include a details table selected
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select Settings menu
    ...  2. At the Settings screen > Select the Monthly report format tab
    ...  3. Click on the Quality of life scores and Tasks list buttons, click on all Include a details table, program type = RPM > Click Update
    ...  4. Select menu Patients > Select Report tab on Patient Detail screen
    ...  5. Select On-demand reports > Perform Create report > Check data

    ...  Expected result:
    ...  5. Display report with the following sections: EHRA score, Weight – BMI, Blood pressure, Oxygen saturation, Body temperature, Heart rate, Resting heart rate,
    ...     Heart rate variability, Heart rate during activity, Rhythm diary, Noteworthy snapshots, Notes, QoL, tasks list
    ...           Not showing: Details table
    [Tags]    BCP-NURSE-PTDET-TASKS-30     manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-31: Check the UI of the Settings Mothly report format screen with Program type = CCM, CCM&RPM of a facility
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select Settings menu
    ...  2. At the Settings screen > Select the Monthly report format tab > Check UI
    ...  3. Check UI CCM, CCM&RPM - Default settings

    ...  Expected result:
    ...  2. Displays Settings Monthly report screen format like figma file. Displays clinic user's facility dropdownlist. Displays 3 button options CCM, CCM&RPM and RPM
    ...  3. Fixed Section includes: EHRA score, Weight – BMI, Blood pressure, Oxygen saturation, Body temperature, Heart rate, Resting heart rate,
    ...     Heart rate variability, Heart rate during activity, Rhythm diary, Noteworthy snapshots, Notes, Noteworthy schedules, Cardiac risk assessment, Medications adherence
    ...         Optional Section: Echocardiogram, Task list, Upcoming schedules, Test results
    ...                           Include a details table: Weight – BMI, Blood pressure, Body temperature, Heart rate
    [Tags]    BCP-NURSE-PTDET-TASKS-31     manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-32: Check data monthly report by keeping the default Program type = CCM, CCM&RPM of a facility, without clicking Include a details table
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select Settings menu
    ...  2. At the Settings screen > Select the Monthly report format tab > Check UI
    ...  3. Keep the default CCM program, CCM&RPM > Click Save
    ...  4. Select the Reports menu > Generate Monthly report

    ...  Expected result:
    ...  4. Display report with the following sections: EHRA score, Weight – BMI, Blood pressure, Oxygen saturation, Body temperature, Heart rate, Resting heart rate,
    ...  Heart rate variability, Heart rate during activity, Rhythm diary, Noteworthy snapshots, Notes, Noteworthy schedules, Cardiac risk assessment, Medications adherence
    ...     Not displayed: Echocardiogram, Task list, Upcoming schedules, Test results and Details table"
    [Tags]    BCP-NURSE-PTDET-TASKS-32     manual     BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-33: Check data monthly report when changing Section with Program type = CCM, CCM&RPM of a facility, do not click Include a details table
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select Settings menu
    ...  2. At the Settings screen > Select the Monthly report format tab > Check UI
    ...  3. Click on the button Quality of life scores and Tasks list, program type = CCM, CCM&RPM > Click Update
    ...  4. Select the Reports menu > Generate Monthly report > Check data

    ...  Expected result:
    ...  4. Display report with the following sections: EHRA score, Weight – BMI, Blood pressure, Oxygen saturation, Body temperature, Heart rate, Resting heart rate,
    ...         Heart rate variability, Heart rate during activity, Rhythm diary, Noteworthy snapshots, Notes, Noteworthy schedules, Cardiac risk assessment, Medications adherence,
    ...         Echocardiogram, Task list, Upcoming schedules, Test results
    ...         Not showing: Details table"
    [Tags]    BCP-NURSE-PTDET-TASKS-33     manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-34: Check data monthly report when changing Section with Program type = CCM, CCM&RPM of a facility, with Include a details table selected
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select Settings menu
    ...  2. At the Settings screen > Select the Monthly report format tab
    ...  3. Click on the button Quality of life scores and Tasks list, click on all Include a details table, program type =CCM, CCM&RPM > Click Update
    ...  4. Select the Reports menu > Generate Monthly report> Check data

    ...  Expected result:
    ...  4. Display report with the following sections: EHRA score, Weight – BMI, Blood pressure, Oxygen saturation, Body temperature, Heart rate, Resting heart rate,
    ...         Heart rate variability, Heart rate during activity, Rhythm diary, Noteworthy snapshots, Notes, Noteworthy schedules, Cardiac risk assessment, Medications adherence,
    ...         Echocardiogram, Task list, Upcoming schedules, Test results
    ...         Display: Details table according to selected sections"
    [Tags]    BCP-NURSE-PTDET-TASKS-34     manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-35: Check data On-demand reports by keeping the default Program type = CCM, CCM&RPM of a facility, without clicking Include a details table
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select Settings menu
    ...  2. At the Settings screen > Select the Monthly report format tab
    ...  3. Keep the default CCM program, CCM&RPM > Click Save
    ...  4. Select menu Patients > Select Report tab on Patient Detail screen
    ...  5. Select On-demand reports > Perform Create report > Check data

    ...  Expected result:
    ...  4. Display report with the following sections: EHRA score, Weight – BMI, Blood pressure, Oxygen saturation, Body temperature, Heart rate, Resting heart rate,
    ...         Heart rate variability, Heart rate during activity, Rhythm diary, Noteworthy snapshots, Notes, Noteworthy schedules, Cardiac risk assessment, Medications adherence
    ...         Not displayed: Echocardiogram, Task list, Upcoming schedules, Test results and Details table"
    [Tags]    BCP-NURSE-PTDET-TASKS-35     manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-36: Check data On-demand reports when changing Section with Program type = CCM, CCM&RPM of a facility, do not click Include a details table
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select Settings menu
    ...  2. At the Settings screen > Select the Monthly report format tab
    ...  3. Click on the button Quality of life scores and Tasks list, program type = CCM, CCM&RPM > Click Update
    ...  4. Select menu Patients > Select Report tab on Patient Detail screen
    ...  5. Select On-demand reports > Perform Create report > Check data

    ...  Expected result:
    ...  4. Display report with the following sections: EHRA score, Weight – BMI, Blood pressure, Oxygen saturation, Body temperature, Heart rate, Resting heart rate,
    ...         Heart rate variability, Heart rate during activity, Rhythm diary, Noteworthy snapshots, Notes, Noteworthy schedules, Cardiac risk assessment, Medications adherence,
    ...         Echocardiogram, Task list, Upcoming schedules, Test results
    ...         Not showing: Details table"
    [Tags]    BCP-NURSE-PTDET-TASKS-36     manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-37: Check data On-demand reports when changing Section with Program type = RPM of a facility, with Include a details table selected
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select Settings menu
    ...  2. At the Settings screen > Select the Monthly report format tab
    ...  3. Click on the Quality of life scores and Tasks list buttons, click on all Include a details table, program type = RPM > Click Update
    ...  4. Select menu Patients > Select Report tab on Patient Detail screen
    ...  5. Select On-demand reports > Perform Create report > Check data

    ...  Expected result:
    ...  5. Display report with the following sections: EHRA score, Weight – BMI, Blood pressure, Oxygen saturation, Body temperature, Heart rate, Resting heart rate,
    ...         Heart rate variability, Heart rate during activity, Rhythm diary, Noteworthy snapshots, Notes, Noteworthy schedules, Cardiac risk assessment, Medications adherence,
    ...         Echocardiogram, Task list, Upcoming schedules, Test results
    ...         Display: Details table according to selected sections"
    [Tags]    BCP-NURSE-PTDET-TASKS-37     manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-38: Check UI and validate DETAILS TABLE
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > At the facility there is Settings "Monthly report format" but do not click Include a details table (Applies to all 3 program types: CCM, CCM&RPM, RPM)
    ...  2. Implement generate monthly report and On-demand report
    ...  3. Check UI data

    ...  Expected result:
    ...  3. Displays all sections set up in Settings, does not display details table
    [Tags]    BCP-NURSE-PTDET-TASKS-38     manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-39: Check UI Monitored information task Sleep
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select menu Patients
    ...  2. Select Monitored data tab > Check UI Sleep tab

    ...  Expected result:
    ...  2. Displays 2 drop downlists: Daily sleep duration (hour) and Consecutive days (1-7 days)
    [Tags]    BCP-NURSE-PTDET-TASKS-39     manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-40: Make the Trigger Sleep setting exceed the threshold
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select menu Patients
    ...  2. Select the Monitored data tab > Edit the Sleep tab: Daily sleep duration < 7h, Consecutive days = 3
    ...  3. Login App > Perform Add slepp for the above patients with data: Day 19 sleep 4:30, Day 20 sleep 5:30, Day 21 sleep 6:59 > Add successfully
    ...  4. Login Portal on day 22 > Check data Task tab

    ...  Expected result:
    ...  2. Display task trigger Sleep duration alert
    [Tags]    BCP-NURSE-PTDET-TASKS-40    manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-41: Check data AVG HR on ECG strips
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login portal > Select patients menu
    ...  2. At patients using Bioheart deviced > Check data field ECG strips

    ...  Expected result:
    ...  2. Displays the chart uploaded from bioheart, including: Min heart rate, AVG heart rate, Max heart rate
    [Tags]    BCP-NURSE-PTDET-TASKS-41    manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-42: Check data AVG HR on ECG strips
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login App > Connect deviced bioheart on February 1, 2024 > Connect successfully
    ...  2. Login Portal > Check ECG strip data of patient just connected device
    ...  3. Check data monthly report

    ...  Expected result:
    ...  2. ECG strips won't be available for viewing on the same day they are recorded. Users can check ECG strips for 1/2/2024 on 1/3/2024 since they become accessible the following day.
    ...  3. The minimum, maximum, and average heart rate values are extracted from the generated report. following day.
    [Tags]    BCP-NURSE-PTDET-TASKS-42    manual      BCCA-2.25.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-43: Check data AVG HR on ECG strips
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select menu Patient
    ...  2. Select any patient > Select successfully, display patient detail screen
    ...  3. Select the Medical Records tab > Add a medication
    ...  4. Enter Medication name = A, Dosage = 1 (unit), Frequency = 1 time/day > Click Add
    ...  5. Login App = account patients above
    ...  6. Enter medication = 2 > Click taken
    ...  7. Expect: Enter successfully, check data task medication alert on portal
    ...  8. Login Portal > Check data Task when entering quantity larger than set up


    ...  Expected result:
    ...  4. Successfully saved the above Medication
    ...  8. Display status = Extra
    [Tags]    BCP-NURSE-PTDET-TASKS-43    manual      BCCA-2.26.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-44: Check improvement Turn off mic
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login portal > Select Calendar menu
    ...  2. Select New > Enter complete data on the Schedule New Appointment screen
    ...  3. Make a video call join
    ...  4. At the video call screen > Click on the microphone button icon

    ...  Expected result:
    ...  4. Display mute mic, on both clinic user and patient screens. No audio input is recorded
    [Tags]    BCP-NURSE-PTDET-TASKS-44    manual      BCCA-2.26.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-45: Perform select all tasks To do
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Chọn menu Tasks
    ...  2. Make selection Item per page = 10
    ...  3. Click to select the checkbox before Tasks
    ...  4. Check screen UI

    ...  Expected result:
    ...  3. The system automatically selects all tasks on the screen
    ...  4. Display number of selected Tasks = 10. Display 4 buttons "Mark a complete", "Flag", "Dismiss", "Add a comment"
    [Tags]    BCP-NURSE-PTDET-TASKS-45    manual      BCCA-2.26.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-46: Execute Flag All after Select all
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select Tasks menu
    ...  2. Perform Select all
    ...  3. Click on the "Flag" button
    ...  4. Return to To Do tab > Perform select all (10 Tasks)
    ...  5. Uncheck any 2 Tasks > Click Flag

    ...  Expected result:
    ...  3. All Selected tasks are moved to the Flagged tab, in the My tasks filter
    ...  4. The remaining 8 Tasks are moved to the Flagged tab. The 2 unchecked tasks are kept in the To do tab
    [Tags]    BCP-NURSE-PTDET-TASKS-46    manual      BCCA-2.26.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-47:Do "Mark as complete" after Select all
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select Tasks menu
    ...  2. Perform Select all
    ...  3. Click on the "Mark as Complete" button
    ...  4. Return to To Do tab > Perform select all (10 Tasks)
    ...  5. Uncheck any 2 Tasks > Click "Mark as Complete"

    ...  Expected result:
    ...  3. All Selected tasks move to the "Complete" tab
    ...  5. The remaining 8 Tasks are moved to the Complete tab. The 2 unchecked tasks are kept in the To do tab
    [Tags]    BCP-NURSE-PTDET-TASKS-47    manual      BCCA-2.26.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-48:Perform "Dismiss" after Select all
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select Tasks menu
    ...  2. Perform Select all
    ...  3. Click on the "Dismiss" button
    ...  4. Return to To Do tab > Perform select all (10 Tasks)
    ...  5. Uncheck any 2 Tasks > Click "Dismiss"


    ...  Expected result:
    ...  3. All Selected tasks move to the "Complete" tab
    ...  5. The remaining 8 Tasks are moved to the Complete tab. The 2 unchecked tasks are kept in the To do tab
    [Tags]    BCP-NURSE-PTDET-TASKS-48    manual      BCCA-2.26.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-49:Do "Add a comment" after Select all
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select Tasks menu
    ...  2. Perform Select all
    ...  3. Click on the "Add a comment" button
    ...  4. Enter comment > 200 characters > Click Comment
    ...  5. Enter comment <= 200 characters > Click Comment
    ...  6. Return to To Do tab > Perform select all (10 Tasks)
    ...  7. Uncheck any 2 Tasks > Click "Dismiss"

    ...  Expected result:
    ...  3. All selected tasks display a screen allowing Add comment
    ...  4. Not allowed to enter comments > 200 characters
    ...  5. Saved successfully, all selected tasks display full comments
    ...  6. The remaining 8 Tasks are moved to the Complete tab. The 2 unchecked tasks are kept in the To do tab
    [Tags]    BCP-NURSE-PTDET-TASKS-49    manual      BCCA-2.26.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-50:Do "Add a comment" after Select all
    [Documentation]    Author: Bao Van
    ...  Pre-condition:

    ...  Test steps:
    ...  1. Login Portal > Select Tasks menu
    ...  2. Select the Flagged tab
    ...  3. Click Select all
    ...  4. Click on the "Unflag" button
    ...  5. Return to the Flagged tab > Perform select all (10 Tasks)
    ...  6. Uncheck any 2 Tasks > Click "Unflag"

    ...  Expected result:
    ...  3. Display 4 buttons: "Unflag", "Mark as complete", "Dismiss", "Add a comment"
    ...  4. All selected tasks are moved to the "To do" tab
    ...  6. The remaining 8 Tasks are moved to the To do tab. The 2 unchecked tasks are kept in the Flagged tab
    [Tags]    BCP-NURSE-PTDET-TASKS-50    manual      BCCA-2.26.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-51: Send Email Function Available for All Task Statuses
    [Documentation]    Author: Bao Van
    ...  Pre-condition: The user is on the Task details side tab.

    ...  Test steps:
    ...  1. Open a task with To Do status.
    ...  2. Verify that the Send email button is available on the task details side tab.
    ...  3. Open a task with Flag status.
    ...  4. Verify that the Send email button is available on the task details side tab.
    ...  5. Open a task with Complete status.
    ...  6. Verify that the Send email button is available on the task details side tab.
    ...  7. Open a task with Dismissed status.
    ...  8. Verify that the Send email button is available on the task details side tab.

    ...  Expected result:
    ...  8. The "Send email" button should be visible and accessible for all task statuses.
    [Tags]    BCP-NURSE-PTDET-TASKS-51    manual      BCCA-2.32.0        R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-52: "Send Email" Button Opens Email Dialog
    [Documentation]    Author: Bao Van
    ...  Pre-condition: The user is on the Task details side tab.

    ...  Test steps:
    ...  1. Click the Send email button on a task in To Do status.
    ...  2. Verify that the email composing dialog opens.

    ...  Expected result:
    ...  2. The email composing dialog should open, allowing the user to compose an email.
    [Tags]    BCP-NURSE-PTDET-TASKS-52    manual      BCCA-2.32.0        R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-53: Pre-filled To Field with Care Team Members
    [Documentation]    Author: Bao Van
    ...  Pre-condition: The user is on the email composing dialog.

    ...  Test steps:
    ...  1. 1. Click the Send email button to open the email composing dialog.
    ...  2. Verify that the To field is pre-filled with the email addresses of the Nurse and Physician.

    ...  Expected result:
    ...  2. The To field should be pre-filled with the correct email addresses of the care team members.
    [Tags]    BCP-NURSE-PTDET-TASKS-53    manual      BCCA-2.32.0        R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-54: Editable To Field
    [Documentation]    Author: Bao Van
    ...  Pre-condition: The user is on the email composing dialog with the To field pre-filled.

    ...  Test steps:
    ...  1. Open the email composing dialog.
    ...  2. In the To field, delete the pre-filled email addresses.
    ...  3. Enter new email addresses separated by commas or spaces.
    ...  4. Verify that multiple email addresses can be added and the format is correct.

    ...  Expected result:
    ...  4. The user should be able to edit the To field and input multiple email addresses.
    [Tags]    BCP-NURSE-PTDET-TASKS-54    manual      BCCA-2.32.0        R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-55: Subject Field Pre-filled and Editable
    [Documentation]    Author: Bao Van
    ...  Pre-condition: The user is on the email composing dialog.

    ...  Test steps:
    ...  1. Open the email composing dialog.
    ...  2. Verify that the Subject field is pre-filled with "[Biocare DM] <Task name> - Program <Program ID>".
    ...  3. Edit the subject text to a custom value.

    ...  Expected result:
    ...  4. The Subject field should be pre-filled with the correct information and should be editable.
    [Tags]    BCP-NURSE-PTDET-TASKS-55    manual      BCCA-2.32.0        R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-56: Subject Field is Required
    [Documentation]    Author: Bao Van
    ...  Pre-condition: The user is on the email composing dialog.

    ...  Test steps:
    ...  1. Open the email composing dialog.
    ...  2. Delete the text in the Subject field.
    ...  3. Attempt to send the email.

    ...  Expected result:
    ...  4. The system should prevent the user from sending the email until the Subject field is populated.
    [Tags]    BCP-NURSE-PTDET-TASKS-56    manual      BCCA-2.32.0        R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-57: Email Content Field Optional and Pre-filled with Task Details
    [Documentation]    Author: Bao Van
    ...  Pre-condition: The user is on the email composing dialog.

    ...  Test steps:
    ...  1. Open the email composing dialog.
    ...  2. Verify that the Email content field is pre-filled with the corresponding task details.
    ...  3. Leave the Email content field empty and proceed to send the email.
    ...  4. Optionally, the user can edit the Email content using the text-editing toolbar.

    ...  Expected result:
    ...  4. The Email content field should be pre-filled with task details, and it is optional for the user to edit or leave it empty.
    [Tags]    BCP-NURSE-PTDET-TASKS-57    manual      BCCA-2.32.0        R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-58: Text-editing Toolbar for Email Content
    [Documentation]    Author: Bao Van
    ...  Pre-condition: The user is on the email composing dialog.

    ...  Test steps:
    ...  1. Open the email composing dialog.
    ...  2. Ensure the Email content field is available with the text-editing toolbar.
    ...  3. Edit the content using bold, italic, underline, and other available formatting options.

    ...  Expected result:
    ...  3. The user should be able to use the text-editing toolbar to format the content of the email.
    [Tags]    BCP-NURSE-PTDET-TASKS-58    manual      BCCA-2.32.0        R3
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-59: Send Button Always Enabled
    [Documentation]    Author: Bao Van
    ...  Pre-condition: User is on the email compose page.

    ...  Test steps:
    ...  1. Navigate to the email compose page.
    ...  2. Ensure that the “Send” button is enabled even before any fields are filled.

    ...  Expected result:
    ...  3. The “Send” button should always be enabled, regardless of whether fields are filled in or not.
    [Tags]    BCP-NURSE-PTDET-TASKS-59    manual      BCCA-2.32.0        R2
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-60: Validation Check Before Sending
    [Documentation]    Author: Bao Van
    ...  Pre-condition: User is on the email compose page with invalid or incomplete field data.

    ...  Test steps:
    ...  1. Navigate to the email compose page.
    ...  2. Leave required fields (such as To, Subject, or Email Content) blank or enter invalid data.
    ...  3. Click the “Send” button.

    ...  Expected result:
    ...  3. The system should perform validation. If any field is invalid, an error message should be displayed, detailing which field(s) need correction. The email should not be sent.
    [Tags]    BCP-NURSE-PTDET-TASKS-60    manual      BCCA-2.32.0        R2
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-61: Send Email Success Notification
    [Documentation]    Author: Bao Van
    ...  Pre-condition: User is on the email compose page with valid data.

    ...  Test steps:
    ...  1. Navigate to the email compose page.
    ...  2. Fill in all required fields correctly (e.g., To, Subject, and Email Content).
    ...  3. Click the “Send” button.

    ...  Expected result:
    ...  3. A snack bar should appear with the message: “Email was sent successfully!”
    [Tags]    BCP-NURSE-PTDET-TASKS-61    manual      BCCA-2.32.0        R2
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-62: Send Email Success Notification
    [Documentation]    Author: Bao Van
    ...  Pre-condition: User is on the email compose page with valid data, but the system has an issue sending the email (e.g., server down, invalid email addresses).

    ...  Test steps:
    ...  1. Navigate to the email compose page.
    ...  2. Fill in all required fields with valid data.
    ...  3. Click the “Send” button.
    ...  4. Simulate an email sending failure (e.g., disconnect the internet or use an invalid email).

    ...  Expected result:
    ...  3. A snack bar should appear with the message: “Email was failed to be sent!”
    [Tags]    BCP-NURSE-PTDET-TASKS-62    manual      BCCA-2.32.0        R2
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-63: Automatically Added Comment After Email Success
    [Documentation]    Author: Bao Van
    ...  Pre-condition: The email was successfully sent, and the user is on the related task.

    ...  Test steps:
    ...  1. Navigate to the email compose page.
    ...  2. Send a successful email (with valid data).
    ...  3. Check the task's comment section.

    ...  Expected result:
    ...  3. A new comment should appear.The comment should contain:
    ...          Owner: Avatar and full name of the user who sent the email.
    ...          Comment: “Email sent to <Facility name> at HH:MM <MM/DD/YYYY>.”
    ...          Date and Time: Timestamp when the email was sent.
    [Tags]    BCP-NURSE-PTDET-TASKS-63    manual      BCCA-2.32.0        R2
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-64: Comment Cannot Be Edited or Deleted
    [Documentation]    Author: Bao Van
    ...  Pre-condition: The email was successfully sent, and a comment has been added to the task.

    ...  Test steps:
    ...  1. Navigate to the task with the comment after a successful email.
    ...  2. Attempt to edit or delete the comment.

    ...  Expected result:
    ...  2. The user should not be able to edit or delete the comment.
    ...     The user should be able to mark the comment as included or excluded from the report.
    [Tags]    BCP-NURSE-PTDET-TASKS-64    manual      BCCA-2.32.0        R2
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-65: Comment Owner Displays Correct Avatar and Full Name
    [Documentation]    Author: Bao Van
    ...  Pre-condition: The email was successfully sent, and the comment has been added.

    ...  Test steps:
    ...  1. Navigate to the task with the comment.
    ...  2. Verify that the Owner section of the comment displays the correct avatar and full name of the user who sent the email.

    ...  Expected result:
    ...  2. The comment should display the avatar and full name of the user who sent the email.
    [Tags]    BCP-NURSE-PTDET-TASKS-65    manual      BCCA-2.32.0        R2
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-PTDET-TASKS-66: Correct Date and Time Stamp in Comment
    [Documentation]    Author: Bao Van
    ...  Pre-condition: The email was successfully sent, and the comment has been added.

    ...  Test steps:
    ...  1. Navigate to the task with the comment after email sending.
    ...  2. Verify that the Date and Time stamp in the comment is accurate (when the email was sent).

    ...  Expected result:
    ...  2.  The comment should display the correct date and time when the email was sent.
    [Tags]    BCP-NURSE-PTDET-TASKS-66    manual      BCCA-2.32.0        R2
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
