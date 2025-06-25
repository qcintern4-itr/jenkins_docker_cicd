*** Settings ***
Documentation   Clinic-User Test Suite
Metadata    sid     BFCN-USER
Metadata    owner   Linh Phan
Library     corelib/AssertionExtension.py

Force Tags      BFCN-USER   mapp
Test Timeout    30m

*** Test Cases ***

BFCN-USER-CHANGE-PROFILE-PICTURE-01: Update new profile picture
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description: Update new profile picture
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Biocare Portal, update new picture
    ...     - 2. View the profile picture (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The new picture shall be displayed

    [Tags]    BFCN-USER-CHANGE-PROFILE-PICTURE-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-CHANGE-PROFILE-PICTURE-02: Remove profile picture
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:Remove profile picture
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Biocare Portal, remove picture
    ...     - 2. View the profile picture (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The picture shall be removed.

    [Tags]    BFCN-USER-CHANGE-PROFILE-PICTURE-02   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-CHANGE-PROFILE-PICTURE-03: Add profile picture
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:Add profile picture
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Biocare Portal, add picture
    ...     - 2. View the profile picture (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The picture shall be added

    [Tags]    BFCN-USER-CHANGE-PROFILE-PICTURE-03   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-USER-UPDATE-EMAIL-01: In the Biocare Portal, Update new email
    [Documentation]  Author: Phuong Tran
    ...     Description:In the Biocare Portal, Update new email
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Biocare Portal, update new email
    ...     - 2. View the profile email (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The new email shall be displayed

    [Tags]    BFCN-USER-UPDATE-EMAIL-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-EMAIL-02: In the Biocare Portal, change email
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Biocare Portal, change email
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Biocare Portal, change email
    ...     - 2. View the profile email (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The new email shall be displayed.

    [Tags]    BFCN-USER-UPDATE-EMAIL-02   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-EMAIL-03: In the Biocare Portal, add new email
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Biocare Portal, add new email
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Biocare Portal, add picture
    ...     - 2. View the profile email (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The email shall be added.

    [Tags]    BFCN-USER-UPDATE-EMAIL-03   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-USER-UPDATE-EMAIL-04:In the Admin Portal, Update new email
    [Documentation]  Author: Phuong Tran    ...
    ...     Description:In the Admin Portal, Update new email
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Admin Portal, update new email
    ...     - 2. View the profile email (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The new email shall be displayed

    [Tags]    BFCN-USER-UPDATE-EMAIL-04   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-EMAIL-05: In the Admin Portal, change email
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Admin Portal, change email
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Admin Portal, change email
    ...     - 2. View the profile email (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The new email shall be displayed.

    [Tags]    BFCN-USER-UPDATE-EMAIL-05   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-EMAIL-06: In the Admin Portal, add new email
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Admin Portal, add new email
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Admin Portal, add picture
    ...     - 2. View the profile email (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The email shall be added.

    [Tags]    BFCN-USER-UPDATE-EMAIL-06   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-USER-UPDATE-PROFILE-01: In the Biocare Portal, change First/ Last name
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Biocare Portal, change First/ Last name
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Biocare Portal, change First/ Last name
    ...     - 2. View the profile First/ Last name (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The new First/ Last name shall be displayed.

    [Tags]    BFCN-USER-UPDATE-PROFILE-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-USER-UPDATE-PROFILE-02: In the Admin Portal, change First/ Last name
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Admin Portal, change First/ Last name
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Admin Portal, change First/ Last name
    ...     - 2. View the profile First/ Last name (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The new First/ Last name shall be displayed.

    [Tags]    BFCN-USER-UPDATE-PROFILE-02   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-PROFILE-03: In the Biocare Portal, Update new Title
    [Documentation]  Author: Phuong Tran
    ...     Description:In the Biocare Portal, Update new Title
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Biocare Portal, update new Title
    ...     - 2. View the profile Title (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The new Title shall be displayed

    [Tags]    BFCN-USER-UPDATE-PROFILE-03   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-PROFILE-04: In the Biocare Portal, remove Title
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Biocare Portal, remove Title
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Biocare Portal, change Title
    ...     - 2. View the profile Title (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The Title shall be removed.

    [Tags]    BFCN-USER-UPDATE-PROFILE-04   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-PROFILE-05: In the Biocare Portal, add new Title
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Biocare Portal, add new Title
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Biocare Portal, add Title
    ...     - 2. View the profile Title (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The Title shall be added.

    [Tags]    BFCN-USER-UPDATE-PROFILE-05   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-PROFILE-06: In the Admin Portal, Update new Title
    [Documentation]  Author: Phuong Tran
    ...     Description:In the Admin Portal, Update new Title
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Admin Portal, update new Title
    ...     - 2. View the profile Title (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The new Title shall be displayed

    [Tags]    BFCN-USER-UPDATE-PROFILE-06   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-PROFILE-07: In the Admin Portal, remove Title
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Admin Portal, remove Title
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Admin Portal, change Title
    ...     - 2. View the profile Title (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The remove shall be removed.

    [Tags]    BFCN-USER-UPDATE-PROFILE-07   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-PROFILE-08: In the Admin Portal, add new Title
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Admin Portal, add new Title
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Admin Portal, add Title
    ...     - 2. View the profile Title (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The Title shall be added.

    [Tags]    BFCN-USER-UPDATE-PROFILE-08   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-USER-UPDATE-PROFILE-09: In the Biocare Portal, Update new phone number
    [Documentation]  Author: Phuong Tran
    ...     Description:In the Biocare Portal, Update new phone number
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Biocare Portal, update new phone number
    ...     - 2. View the profile phone number (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The new phone number shall be displayed

    [Tags]    BFCN-USER-UPDATE-PROFILE-09   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-PROFILE-10: In the Biocare Portal, remove phone number
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Biocare Portal, remove phone number
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Biocare Portal, change phone number
    ...     - 2. View the profile phone number (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The phone number shall be removed.

    [Tags]    BFCN-USER-UPDATE-PROFILE-10   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-PROFILE-11: In the Biocare Portal, add new phone number
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Biocare Portal, add new phone number
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Biocare Portal, add phone number
    ...     - 2. View the profile phone number (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The phone number shall be added.

    [Tags]    BFCN-USER-UPDATE-PROFILE-11   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-PROFILE-13: In the Admin Portal, Update new phone number
    [Documentation]  Author: Phuong Tran
    ...     Description:In the Admin Portal, Update new phone number
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Admin Portal, update new phone number
    ...     - 2. View the profile phone number (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The new phone number shall be displayed

    [Tags]    BFCN-USER-UPDATE-PROFILE-13   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-PROFILE-14: In the Admin Portal, remove phone number
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Admin Portal, remove phone number
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Admin Portal, change Title
    ...     - 2. View the profile phone number (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The phone number shall be removed.

    [Tags]    BFCN-USER-UPDATE-PROFILE-14   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-PROFILE-15: In the Admin Portal, add new phone number
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Admin Portal, add new phone number
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Admin Portal, add Title
    ...     - 2. View the profile phone number (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The phone number shall be added.

    [Tags]    BFCN-USER-UPDATE-PROFILE-15   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-USER-UPDATE-PROFILE-16: In the Biocare Portal, Update after hour phone numberr
    [Documentation]  Author: Phuong Tran
    ...     Description:In the Biocare Portal, Update after hour phone number
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Biocare Portal, update new phone number
    ...     - 2. View the profile after hour phone number (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The newthe after hour phone number shall be displayed

    [Tags]    BFCN-USER-UPDATE-PROFILE-16   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-PROFILE-17: In the Biocare Portal, removethe after hour phone number
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Biocare Portal, removethe after hour phone number
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Biocare Portal, changethe after hour phone number
    ...     - 2. View the profilethe after hour phone number (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  Thethe after hour phone number shall be removed.

    [Tags]    BFCN-USER-UPDATE-PROFILE-17   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-PROFILE-18: In the Biocare Portal, add newthe after hour phone number
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Biocare Portal, add newthe after hour phone number
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Biocare Portal, addthe after hour phone number
    ...     - 2. View the profilethe after hour phone number (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  Thethe after hour phone number shall be added.

    [Tags]    BFCN-USER-UPDATE-PROFILE-18   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-PROFILE-19: In the Admin Portal, Update newthe after hour phone number
    [Documentation]  Author: Phuong Tran
    ...     Description:In the Admin Portal, Update newthe after hour phone number
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Admin Portal, update newthe after hour phone number
    ...     - 2. View the profilethe after hour phone number (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The newthe after hour phone number shall be displayed

    [Tags]    BFCN-USER-UPDATE-PROFILE-19   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-PROFILE-20: In the Admin Portal, removethe after hour phone number
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Admin Portal, removethe after hour phone number
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Admin Portal, change Title
    ...     - 2. View the profilethe after hour phone number (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  Thethe after hour phone number shall be removed.

    [Tags]    BFCN-USER-UPDATE-PROFILE-20   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-PROFILE-21: In the Admin Portal, add newthe after hour phone number
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Admin Portal, add newthe after hour phone number
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Admin Portal, add Title
    ...     - 2. View the profilethe after hour phone number (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  Thethe after hour phone number shall be added.

    [Tags]    BFCN-USER-UPDATE-PROFILE-21   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-USER-UPDATE-PROFILE-22: In the Biocare Portal, Update the fax number
    [Documentation]  Author: Phuong Tran
    ...     Description:In the Biocare Portal, Update after hour phone number
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Biocare Portal, update new phone number
    ...     - 2. View the profile after hour phone number (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The newthe after hour phone number shall be displayed

    [Tags]    BFCN-USER-UPDATE-PROFILE-22   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-PROFILE-23: In the Biocare Portal, removethe the fax number
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Biocare Portal, removethe the fax number
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Biocare Portal, changethe the fax number
    ...     - 2. View the profilethe the fax number (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  Thethe the fax number shall be removed.

    [Tags]    BFCN-USER-UPDATE-PROFILE-23   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-PROFILE-24: In the Biocare Portal, add newthe the fax number
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Biocare Portal, add newthe the fax number
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Biocare Portal, addthe the fax number
    ...     - 2. View the profilethe the fax number (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  Thethe the fax number shall be added.

    [Tags]    BFCN-USER-UPDATE-PROFILE-24   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-PROFILE-25: In the Admin Portal, Update newthe the fax number
    [Documentation]  Author: Phuong Tran
    ...     Description:In the Admin Portal, Update newthe the fax number
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Admin Portal, update newthe the fax number
    ...     - 2. View the profilethe the fax number (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  The newthe the fax number shall be displayed

    [Tags]    BFCN-USER-UPDATE-PROFILE-25   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-PROFILE-26: In the Admin Portal, removethe the fax number
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Admin Portal, removethe the fax number
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Admin Portal, change Title
    ...     - 2. View the profilethe the fax number (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  Thethe the fax number shall be removed.

    [Tags]    BFCN-USER-UPDATE-PROFILE-26   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-PROFILE-27: In the Admin Portal, add newthe the fax number
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Admin Portal, add newthe the fax number
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Admin Portal, add Title
    ...     - 2. View the profilethe the fax number (kill app >> reopen)
    ...
    ...     Expected Results:
    ...      -  Thethe the fax number shall be added.

    [Tags]    BFCN-USER-UPDATE-PROFILE-27   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-USER-UPDATE-FACILITY-01: In the Admin Portal, Add new Facility for the user
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Admin Portal, Add new Facility for the user
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Admin Portal, Add new Facility for the user
    ...
    ...     Expected Results:
    ...      -  Display the Facility List Updated pop-up
    ...      - Refer to design: https://www.figma.com/file/FfNxiJGQBp6Cs5KXTs9fO6/Biocare-Portal-(aka-Gateway-page)?type=design&node-id=1836-8979&mode=design&t=MgLEHKRHvzIlTdUe-4

    [Tags]    BFCN-USER-UPDATE-FACILITY-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-USER-UPDATE-FACILITY-02: In the Admin Portal, Remove the user's facility
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Admin Portal, Remove the user's facility
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Admin Portal, Remove the user's facility
    ...
    ...     Expected Results:
    ...      -  Display the Facility List Updated pop-up
    ...      - Refer to design: https://www.figma.com/file/FfNxiJGQBp6Cs5KXTs9fO6/Biocare-Portal-(aka-Gateway-page)?type=design&node-id=1836-8979&mode=design&t=MgLEHKRHvzIlTdUe-4

    [Tags]    BFCN-USER-UPDATE-FACILITY-02   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-USER-UPDATE-FACILITY-03: Close the user's facility when the user has assign to a facility
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Admin Portal, Close the user's facility
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Admin Portal, Close the user's facility
    ...
    ...     Expected Results:
    ...      -  Display the Account Deactived pop-up
    ...      - Refer to design: https://www.figma.com/file/FfNxiJGQBp6Cs5KXTs9fO6/Biocare-Portal-(aka-Gateway-page)?type=design&node-id=1269-6724&mode=design&t=MgLEHKRHvzIlTdUe-4

    [Tags]    BFCN-USER-UPDATE-FACILITY-03   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-USER-UPDATE-FACILITY-04: Close the user's facility when the user has assign to multiple facility
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Admin Portal, Close the user's facility when the user has assign to multiple facility
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Admin Portal, Close the user's facility when the user has assign to multiple facility
    ...
    ...     Expected Results:
    ...      -  Display the Facility List Updated pop-up
    ...      - Refer to design: https://www.figma.com/file/FfNxiJGQBp6Cs5KXTs9fO6/Biocare-Portal-(aka-Gateway-page)?type=design&node-id=1836-8979&mode=design&t=MgLEHKRHvzIlTdUe-4

    [Tags]    BFCN-USER-UPDATE-FACILITY-04  manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-UPDATE-FACILITY-05:Re-active the user's facility
    [Documentation]  Author: Phuong Tran
    ...
    ...     Description:In the Admin Portal, Re-active the user's facility
    ...
    ...     Precondition:
    ...     -  The user is on the Profile - User tab
    ...
    ...     Test Steps:
    ...     - 1.In the Admin Portal, Re-active the user's facility
    ...
    ...     Expected Results:
    ...      -  Display the Facility List Updated pop-up
    ...      - Refer to design: https://www.figma.com/file/FfNxiJGQBp6Cs5KXTs9fO6/Biocare-Portal-(aka-Gateway-page)?type=design&node-id=1836-8979&mode=design&t=MgLEHKRHvzIlTdUe-4

    [Tags]    BFCN-USER-UPDATE-FACILITY-05   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}









BFCN-USER-RMA-01: Check the RMA page in the case user is assigned for a facility only
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the RMA page in the case user is assigned for a facility only
    ...
    ...     Precondition:
    ...   - The Clinic technician, clinic Phycian is on Clinic app, User tab
    ...    - There is on 1 facility assigned for the user
    ...
    ...     Test Steps:
    ...     1.Click on "Support", then "Submit a request", then "RMA request"
    ...     2. Observe the RMA request page
    ...     3. Click on "Add" button in the Devcie information section
    ...     4. Check the list device ID
    ...
    ...     Expected Results:
    ...     2.There are no Facility field in the RMA page
    ...     4. The list device ID should only contain devices that belongs to the facility

    [Tags]    BFCN-USER-RMA-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-RMA-02: Check the RMA page in the case user is assigned for some facility
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the RMA page in the case user is assigned for is assigned for some facility
    ...
    ...     Precondition:
    ...   - The Clinic technician, clinic Phycian is on Clinic app, User tab
    ...    - There are some facilities assigned for the user
    ...
    ...     Test Steps:
    ...     1.Click on "Support", then "Submit a request", then "RMA request"
    ...     2.Observe the RMA request page
    ...     3. Check the list of Facility
    ...     4. Select a facility in the list, check list device ID
    ...
    ...     Expected Results:
    ...     2.There are Facility field in the RMA page
    ...     3.Display the list of assigned facility
    ...     4.The facility name displayed, list device ID belongs the the selected device ID

    [Tags]    BFCN-USER-RMA-02   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-RMA-03: Check the RMA limit message
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the RMA limit message
    ...
    ...     Precondition:
    ...   - The Clinic technician, clinic Phycian is on Clinic app is on RMA request page
    ...
    ...     Test Steps:
    ...     1. Observe the message in the RMA page
    ...
    ...     Expected Results:
    ...     1. There shall be a note displayed for the clinic user to know that they can only add a maximum of 5 devices per ticket
    ...     Note: The number of devices in an RMA ticket can be configured in the S&D portal.

    [Tags]    BFCN-USER-RMA-03   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-RMA-04: Add device to ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add device to ticket
    ...
    ...     Precondition:
    ...   - The Clinic technician, clinic Phycian is on Clinic app is on RMA request page
    ...   - In the Device information section, click on "Add" button
    ...
    ...     Test Steps:
    ...     1. Search for and select an active device ID
    ...     2. Search for a renewal device ID
    ...     3. Search for an RMA device ID
    ...     4. Search and select maintenance device
    ...     5. Check The UI of the "Device #..." page
    ...
    ...     Expected Results:
    ...     1. Display the device ID in the field
    ...     2. Device ID is non-selectable
    ...     3. Device ID is non-selectable
    ...     4. Pop-up "This device has been identified for maintenance. Please enter this device with a maintenance request on the Maintenance tab."
    ...     5. Warning Message "For issues related to ECG of the Bioflux device,
    ...     check the cable wiresnto make sure they are not loose prior to requestting an RMA for the device"
    ...     - There are: Device ID/Serial, Reason for RMA, Patient Impact, Date of event drop-downs

    [Tags]    BFCN-USER-RMA-04   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-RMA-05: Select reason for RMA for a Biolfux device
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select reason for RMA for a Biolfux device
    ...
    ...     Precondition:
    ...   - The Clinic technician, clinic Phycian is on Clinic app is on RMA request page
    ...   - In the Device information section, click on "Add" button
    ...
    ...     Test Steps:
    ...     1. Observe the Reason for RMA field
    ...     2. Select a device ID
    ...     3. Check the drop-down list
    ...     4. Select options on Device issue section
    ...     5. Select an option on Other section
    ...     6. Select "Device Errors", "Other",
    ...     7. Deselect the option
    ...
    ...     Expected Results:
    ...     1. This field is disabled by default
    ...     2. This field is enabled
    ...     3. The Device issues section:
    ...     - + Charging Issue
    ...     - + Device Errors (describe)
    ...     - + ECG Issue
    ...     - + No Cell Connection
    ...     - + Screen Issue
    ...     - + Broken Charger
    ...     - + Closed Account
    ...     - + Courtesy RMA
    ...     - + Other (describe)
    ...     The Other section:
    ...     - + Lost device
    ...     - + Return to stock
    ...     4. Can select multi options in Device issue section
    ...     5. The user can select one in the "Other" section and cannot combine with device issues
    ...     6. There shall be a text input displayed for the user to provide more infor
    ...     -- which is mandatory to submit the request.
    ...     7. The box shall be uncheck

    [Tags]    BFCN-USER-RMA-05   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-RMA-06: Select reason for RMA for a Biotres device
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select reason for RMA for a Biotres device
    ...
    ...     Precondition:
    ...   - The Clinic technician, clinic Phycian is on Clinic app is on RMA request page
    ...   - In the Device information section, click on "Add" button
    ...
    ...     Test Steps:
    ...     1. Observe the Reason for RMA field
    ...     2. Select a device ID
    ...     3. Check the drop-down list
    ...     4. Select options on Device issue section
    ...     5. Select an option on Other section
    ...     6. Select "Device Errors", "Other", "Damaged"
    ...     7. Deselect the option
    ...
    ...     Expected Results:
    ...     1. This field is disabled by default
    ...     2. This field is enabled
    ...     3. The Device issues section:
	...		- + Charging Issue
	...		- + Device Errors (describe)
	...		- + Device Dead on Arrival
	...		- + Connection Issue
	...		- + ECG Leads
	...		- + Damaged (describe)
	...		- + Closed Account
	...		- + Other (describe)
    ...     The Other section:
    ...     - + Lost device
    ...     - + Return to stock
    ...     4. Can select multi options in Device issue section
    ...     5. The user can select one in the "Other" section and cannot combine with device issues
    ...     6. There shall be a text input displayed for the user to provide more infor
    ...     -- which is mandatory to submit the request.
    ...     7. The box shall be unchecked

    [Tags]    BFCN-USER-RMA-06   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-RMA-07: Select Patient impact
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select Patient impact
    ...
    ...     Precondition:
    ...   - The Clinic technician, clinic Phycian is on Clinic app is on RMA request page
    ...   - In the Device information section, click on "Add" button
    ...
    ...     Test Steps:
    ...     1. Check the list options
    ...     2. Click on the "Help" icon
    ...     3. select an option
    ...
    ...     Expected Results:
    ...     1. Non, Medical Intervention, Patient death, Patient Injury, Unknown
    ...     3. The selected option shall be displayed

    [Tags]    BFCN-USER-RMA-07   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-RMA-08: Select Patient impact, Date of event
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select Patient impact, Date of event
    ...
    ...     Precondition:
    ...   - The Clinic technician, clinic Phycian is on Clinic app is on RMA request page
    ...   - In the Device information section, click on "Add" button
    ...
    ...     Test Steps:
    ...     1. Check the list of Patient impact
    ...     2. Click on the "Help" icon
    ...     3. Select a Patient impact option
    ...     4. Select date of event
    ...
    ...     Expected Results:
    ...     1. Non, Medical Intervention, Patient death, Patient Injury, Unknown
    ...     3. The selected option shall be displayed
    ...     4. The default value is the current date. The user can not select the future date.

    [Tags]    BFCN-USER-RMA-08   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-RMA-09: Add and delete device
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add and delete device
    ...
    ...     Precondition:
    ...   - The Clinic technician, clinic Phycian is on Clinic app is on RMA request page
    ...   - In the Device information section, click on "Add" button
    ...
    ...     Test Steps:
    ...     1. Fill out all information then click on "Add" button
    ...     2. Check the infor after adding in the device card
    ...     3. Click on "Delete" button on each device card
    ...     4. Add the deleted device again
    ...
    ...     Expected Results:
    ...     2. Display correct infor
    ...     3. The card shall be removed
    ...     4. The user can search and select the deleted device

    [Tags]    BFCN-USER-RMA-09   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-RMA-10: Edit the added device
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Edit the added device
    ...
    ...     Precondition:
    ...   - The Clinic technician, clinic Phycian is on Clinic app is on RMA request page
    ...   - There is a device card
    ...
    ...     Test Steps:
    ...     1. Multi tab, check the information on the card
    ...     2. Click on "Edit" button, check the selected infor,
    ...     3. Check the list device ID
    ...
    ...     Expected Results:
    ...     2. Display correct information (Device card, Selected facility)
    ...     3. Display correct information.
    ...     5. Display the device that belongs to the selected facility

    [Tags]    BFCN-USER-RMA-10   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-RMA-11: Input notification email
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Input notification email
    ...
    ...     Precondition:
    ...   - The Clinic technician, clinic Phycian is on Clinic app is on RMA request page
    ...
    ...     Test Steps:
    ...     1. Input an email, after entering an email, tap Enter/Go/Space/Comma on the keyboard or tap outside the field.
    ...     2. Click on "remove" button on each email
    ...
    ...     Expected Results:
    ...     1. If the email format is correct,
    ...     it should be moved below the Notification Emails field. The most recently entered email will always be displayed first.
    ...     -- .If it is invalid, an error message should be displayed: “Invalid email format. Please check again”.
    ...     -- After tapping Go/Enter/Space/Comma, the cursor should be still displayed in the field
    ...  and all the emails under it shall be displayed. Tapping outside the field will hide the 3rd and later emails.
    ...     2. The email shall be removed

    [Tags]    BFCN-USER-RMA-11   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-RMA-12: Check and edit the Shipping address
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Check and edit the Shipping address
    ...
    ...     Precondition:
    ...   - The Clinic technician, clinic Phycian is on Clinic app is on RMA request page
    ...
    ...     Test Steps:
    ...     1. Observe the Shipping address
    ...     2. Edit the Shipping address, search and select new Country, Address, Observe the City, State, Zipcode,
    ...
    ...     Expected Results:
    ...     1. This shall be auto filled with the clinic info from the Admin page
    ...     -  A message: “The shipping address is auto-filled from your clinic contact info.”
    ...     -- Country, Address
    ...     -- City, State, Zipcode, (auto filled)
    ...     -- Contact phone number, Facility email
    ...     2. The City, State, Zipcode, (auto filled)

    [Tags]    BFCN-USER-RMA-12   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-RMA-13: Input note
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Input note
    ...
    ...     Precondition:
    ...   - The Clinic technician, clinic Phycian is on Clinic app is on RMA request page
    ...
    ...     Test Steps:
    ...     1. Input note
    ...     2. Check on RMA ticket on Service and Support portal
    ...
    ...     Expected Results:
    ...     1. This field is optional
    ...     2. The note shall be display in the  "Clinic note" section

    [Tags]    BFCN-USER-RMA-13   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-USER-RMA-14: Submit a RMA request
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Submit a RMA request
    ...
    ...     Precondition:
    ...   - The Clinic technician, clinic Phycian is on Clinic app is on RMA request page
    ...
    ...     Test Steps:
    ...     1. Observe the submit button
    ...     2. For a Facility that did not apply the  "Protect + program"
    ...     3. The message after the ticket is submitted successfully
    ...
    ...     Expected Results:
    ...     1. The Submit request button shall be disabled until the user has filled in all the required information
    ...     2. “Please note, you may be charged for this RMA. With the Protect+ plan, service costs are kept to a minimum.
    ...     If you do not have the Protect+ plan, please contact your local sales representative for more information." shall be displayed.
    ...     3. When the request is sent to the Support/Service portal, the Shipping and Returning info shall have the Facility name of the user or the selected facility if the user has more than one.

    [Tags]    BFCN-USER-RMA-14   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

