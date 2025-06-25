*** Settings ***
Documentation   Cardiac Task management page test suite
Metadata    sid     BCP-NURSE-TASKMNG
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library      project_cardiac_portal/lib/web/Common.py
#Library      project_cardiac_portal/lib/web/Support.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-NURSE-TASKMNG       web
Test Timeout    1h

*** Test Cases ***
BCP-NURSE-TASKMNG-01: Clinic user filters the task list by "My tasks" on Todo/Done tab
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The user is on the Task page

    ...  Test steps:
    ...  1. Go to the Tasks page from the main navigation
    ...  2. Click on To do/Done tab
    ...  3. Select "My task" option

    ...  Expected result:
    ...  The clinic user shall be able to filter the task list by clicking "My tasks" option
    ...  The clinic user's task list shall be displayed.
    [Tags]    BCP-NURSE-TASKMNG-01     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-TASKMNG-02: Clinic user filters the task list by "All tasks" on Todo/Done tab
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The user is on the Task page

    ...  Test steps:
    ...  1. Go to the Tasks page from the main navigation
    ...  2. Click on To do/Done tab
    ...  3. Select "All task" option

    ...  Expected result:
    ...  The clinic user shall be able to filter the task list of all clinic users on the facility by clicking "All tasks" option
    ...  All tasks of all clinic users on the facility shall be displayed.
    [Tags]    BCP-NURSE-TASKMNG-02     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-TASKMNG-03: Search tasks by "Task name" on Todo/Done tab
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The user is on the Task page

    ...  Test steps:
    ...  1. Go to the Tasks page from the main navigation
    ...  2. Click on To do/Done tab
    ...  3. Select "Task name" option
    ...  4. Enter data into Search bar

    ...  Expected result:
    ...  The clinic user shall be able to search patient's tasks list by task name successfully.
    [Tags]    BCP-NURSE-TASKMNG-03     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-TASKMNG-04: Search tasks by "Patient name" on Todo/Done tab
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The user is on the Task page

    ...  Test steps:
    ...  1. Go to the Tasks page from the main navigation
    ...  2. Click on To do/Done tab
    ...  3. Select "Patient name" option
    ...  4. Enter data into Search bar

    ...  Expected result:
    ...  The clinic user shall be able to search patient's tasks list by patient name successfully.
    [Tags]    BCP-NURSE-TASKMNG-04     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-TASKMNG-05: Filter the task list by "Priority" on Todo/Done tab
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The user is on the Task page

    ...  Test steps:
    ...  1. Go to the Tasks page from the main navigation
    ...  2. Click on To do/Done tab
    ...  3. Select "All task"/"My task" option
    ...  4. Click on Filter button & select Priority option (such as: high, medium, low)
    ...  5. Click on Apply button
    ...  Expected result:
    ...  The clinic user shall be able to filter patient's tasks list by Priority successfully.
    [Tags]    BCP-NURSE-TASKMNG-05     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-TASKMNG-06: Filter the task list by "Flag" on Todo/Done tab
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The user is on the Task page

    ...  Test steps:
    ...  1. Go to the Tasks page from the main navigation
    ...  2. Click on To do/Done tab
    ...  3. Select "All task"/"My task" option
    ...  4. Click on Filter button & select Flag option (such as: flag, non-flag)
    ...  5. Click on Apply button
    ...  Expected result:
    ...  The clinic user shall be able to filter patient's tasks list by Flag successfully.
    [Tags]    BCP-NURSE-TASKMNG-06     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-TASKMNG-07: Sort the Due date on Todo tab from oldest to lastest
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The user is on the Task page

    ...  Test steps:
    ...  1. Go to the Tasks page from the main navigation
    ...  2. Click on To do tab
    ...  3. Select "All task"/"My task" option
    ...  4. Click on the Due date column name

    ...  Expected result:
    ...  The clinic user shall be able to sort the Due date from oldest to lastest successfully.
    [Tags]    BCP-NURSE-TASKMNG-07     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-TASKMNG-08: Sort the Due date on Todo tab from lastest to oldest
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The user is on the Task page

    ...  Test steps:
    ...  1. Go to the Tasks page from the main navigation
    ...  2. Click on To do tab
    ...  3. Select "All task"/"My task" option
    ...  4. Click on the Due date column name
    ...  5. Click on the Due date column name again
    ...  Expected result:
    ...  The clinic user shall be able to sort the Due date from lastest to oldest successfully.
    [Tags]    BCP-NURSE-TASKMNG-08     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-TASKMNG-09: Sort the Completed date on Done tab from oldest to lastest
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The user is on the Task page

    ...  Test steps:
    ...  1. Go to the Tasks page from the main navigation
    ...  2. Click on Done tab
    ...  3. Select "All task"/"My task" option
    ...  4. Click on the Completed date column name
    ...  Expected result:
    ...  The clinic user shall be able to sort the Completed date from lastest to oldest successfully.
    [Tags]    BCP-NURSE-TASKMNG-09     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-TASKMNG-10: Sort the Completed date on Done tab from lastest to oldest
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The user is on the Task page

    ...  Test steps:
    ...  1. Go to the Tasks page from the main navigation
    ...  2. Click on To do tab
    ...  3. Select "All task"/"My task" option
    ...  4. Click on the Completed date column name
    ...  5. Click on the Completed date column name again
    ...  Expected result:
    ...  The clinic user shall be able to sort the Completed date from oldest to lastest successfully.
    [Tags]    BCP-NURSE-TASKMNG-10     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-TASKMNG-11: Click on Flag button
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The user is on the Task page

    ...  Test steps:
    ...  1. Go to the Tasks page from the main navigation / Task detail page
    ...  2. Click on To do/Done tab
    ...  3. Click on Flag button
    ...  Expected result:
    ...  The button is highlight.
    [Tags]    BCP-NURSE-TASKMNG-11     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-TASKMNG-12: Click on UnFlag button
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The user is on the Task page

    ...  Test steps:
    ...  1. Go to the Tasks page from the main navigation / Task detail page
    ...  2. Click on To do/Done tab
    ...  3. Click on UnFlag button
    ...  Expected result:
    ...  The button is not highlight.
    [Tags]    BCP-NURSE-TASKMNG-12     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-TASKMNG-13: Click on Mark as done button
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The user is on the Task page > To do tab

    ...  Test steps:
    ...  1. Go to the Tasks page from the main navigation / Task detail page
    ...  2. Click on To do tab
    ...  3. Click on Mark as done button
    ...  Expected result:
    ...  The clinic user shall be able to see tooltip text is Mark as done.
    ...  The button is highlight.
    ...  The task is moved to Done tab
    [Tags]    BCP-NURSE-TASKMNG-13     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-TASKMNG-14: Click on Mark as undone button
    [Documentation]    Author: Chi Tran
    ...  Pre-condition:
    ...  The user is on the Task page > Done tab

    ...  Test steps:
    ...  1. Go to the Tasks page from the main navigation / Task detail page
    ...  2. Click on Done tab
    ...  3. Click on Mark as undone button
    ...  Expected result:
    ...  The clinic user shall be able to see tooltip text is Mark as undone.
    ...  The button is not highlight.
    ...  The task is moved to To do tab
    [Tags]    BCP-NURSE-TASKMNG-14     manual      [BCP-2.19.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
