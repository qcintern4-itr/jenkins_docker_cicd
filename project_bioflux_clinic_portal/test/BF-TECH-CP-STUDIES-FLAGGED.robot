*** Settings ***
Documentation   Test Suite - Clinic Portal - Flagged studies page
Metadata    sid     BF-TECH-CP-STUDIES-FLAGGED
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py    ${ENV}

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BF-TECH-CP-STUDIES-FLAGGED      web
Test Timeout    1h

*** Test Cases ***
BF-TECH-CP-STUDIES-FLAGGED-VIEW-01: View a list of Flagged studies
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The user can view a list of Flagged studies
    ...
    ...
    ...     Precondition:
    ...     - The Flagged studies checkbox was pre-selected by the admin user during the processing of
    ...     creating/editing a facility
    ...     + Studies having the artifact percentage of the last 6 hours greater than 70% shall be added to the
    ...     Flagged studies tab
    ...
    ...     Test Steps:
    ...     1. Click the Flagged studies tab of the STUDIES page
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. The total number of flagged studies shall be displayed on the Flagged studies tab
    ...     2. There shall be a search bar. The user shall search a study by either Study ID, Patient Name,
    ...     Patient ID, or Device ID
    ...     3. There shall be a “New Study” button for the user to create a new study
    ...     4. Each component of the study running in the Flagged study list shall have the following components:
    ...     - Device ID
    ...     - Study ID
    ...     - Patient Name
    ...     - Facility Name: Only available when facility filter is All facilities
    ...     - Resolve checkbox: There shall be a resolve checkbox. Selecting this checkbox shall not remove the flagged
    ...     study from the study list
    ...     - ECG strip window
    ...     + “There is no strip to display” - a displayed message on the ECG strip window if there’s no strip to display
    ...     - Issues found last 6 hours
    ...     - Common issue found in the study
    ...     - View solutions: There shall be a “View solutions” hyperlink displayed on the study card
    ...     + Once the “View solutions” hyperlink is clicked, detailed instructions on how to resolve a specific issue
    ...     shall be displayed for the clinician to follow
    ...     + The instruction shall include information such as what is the current issue and the steps to resolve the issue
    ...     - Total artifact percentage: calculated based on the number of evaluation strips with bad signals and the
    ...     duration of the study
    ...     - Studies having total artifact percentage greater than or equal 50% shall have an orange label
    ...     “*Need attention*” displayed
    ...     - Studies having total artifact percentage greater than or equal 70% shall have a red label “*Potentially
    ...     lost*” displayed
    ...     - Progress of the study and study remaining time (shall only be displayed after the ordered Biolfux Direct
    ...     device has been started in the study)
    ...     - A [Stop] button for the user to stop the study (this feature is available for users with Clinic Technician roles)
    ...     + The button shall be (Disabled) until the study starts on the device
    ...     - A [Get ECG] button for the user to get an Evaluation strip of the study
    ...     + The button shall be (Disabled) until the study starts on the device
    ...     - In the case the user selects the Resolve checkbox, a green label with the message stating: “*Action was
    ...     taken +[the time the last action was taken by a clinician user] + ago*” shall be displayed
    ...     - There shall also be a floating action button in the right bottom corner of the page. A tooltip with the
    ...     following instruction message shall be displayed: Click here to view what is “*Flagged studies*”.
    ...     The user can choose “Got it” to close the message temporarily or select the checkbox “Do not show this
    ...     again” to permanently close the message
    ...     + When it is clicked, a side panel shall move in and display the common “Flagged Studies”
    ...     questions & answers to the clinic user
    ...     5. The flagged study list is sorted by studies that are not resolved first, then the total artifact
    ...     percentage of the study  in descending order
    ...     6. By default, the list loads a maximum of 10 studies. The user can scroll down to load more studies

    [Tags]  BF-TECH-CP-STUDIES-FLAGGED-VIEW-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-FLAGGED-VIEW-02: Quick access Device ID information
    [Documentation]  Author: Trinh Nguyen
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
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-FLAGGED-VIEW-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-FLAGGED-VIEW-03: Quick access Study ID information
    [Documentation]  Author: Trinh Nguyen
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
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-FLAGGED-VIEW-03     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-FLAGGED-VIEW-04: Quick access Patient Name information
    [Documentation]  Author: Trinh Nguyen
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
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-FLAGGED-VIEW-04     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-FLAGGED-VIEW-05: Check resolve checkbox is working properly
    [Documentation]  Author: Trinh Nguyen
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
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-FLAGGED-VIEW-05     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-FLAGGED-VIEW-06: Check a message shall displayed if there's no strip to display
    [Documentation]  Author: Trinh Nguyen
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
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-FLAGGED-VIEW-06     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-FLAGGED-VIEW-07: Check the user can view detailed instruction on how to resolve a specific issue
    [Documentation]  Author: Trinh Nguyen
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
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-FLAGGED-VIEW-07     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-FLAGGED-VIEW-08: User can stop the study
    [Documentation]  Author: Trinh Nguyen
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
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-FLAGGED-VIEW-08     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-FLAGGED-VIEW-09: Can Get an Evaluation strip of study
    [Documentation]  Author: Trinh Nguyen
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
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-FLAGGED-VIEW-09     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-FLAGGED-VIEW-10: Check the What is flagged studies button is working properly
    [Documentation]  Author: Trinh Nguyen
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
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-FLAGGED-VIEW-10     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-FLAGGED-VIEW-11: Check Do not show this again checkbox is working properly
    [Documentation]  Author: Trinh Nguyen
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
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-FLAGGED-VIEW-11     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-FLAGGED-VIEW-12: Check close button is working properly
    [Documentation]  Author: Trinh Nguyen
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
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-FLAGGED-VIEW-12     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-FLAGGED-VIEW-13: Check case the Flagged studies tab shall not be displayed if the Admin portal disabled it
    [Documentation]  Author: Trinh Nguyen
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
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-TECH-CP-STUDIES-FLAGGED-VIEW-13     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-FLAGGED-FILTER-FACILITY-01: View the name of the facility in case the user only associates with one facility
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user has loggin in to Clinic portal
    ...
    ...     Test Steps:
    ...     1. Click the Flagged studies tab of the STUDIES page
    ...     2. Observe the header of STUDIES page
    ...
    ...     Expected Results:
    ...     1. The facility name is displayed on the header of the STUDIES page
    ...     2. All the data associated with that facility shall be displayed

    [Tags]  BF-TECH-CP-STUDIES-FLAGGED-FILTER-FACILITY-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-FLAGGED-FILTER-FACILITY-02: Select a specific facility in case the user associates with multiples facility
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can select a specific facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...     - The Admin portal has associated the account with multiples facilities
    ...     Test Steps:
    ...     1. Click the Flagged studies tab of the STUDIES page
    ...     2. Click on the drop-down list on the header of the STUDIES page
    ...     3. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the STUDIES page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly

    [Tags]  BF-TECH-CP-STUDIES-FLAGGED-FILTER-FACILITY-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-FLAGGED-SEARCH-01: View all search attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can view all search attributes on the STUDIES page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Flagged studies tab of the STUDIES page
    ...     2. Click the search option icon
    ...
    ...     Expected Results:
    ...     1. The search attributes shall be displayed:
    ...     - Patient Name
    ...     - Study ID
    ...     - Patient ID
    ...     - Device ID
    ...     2. The default search option should be Patient Name

    [Tags]  BF-TECH-CP-STUDIES-FLAGGED-SEARCH-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-FLAGGED-SEARCH-02: Search by Patient Name attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Patient attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Flagged studies tab of the STUDIES page
    ...     2. Click the search option icon
    ...     3. Select the Patient Name option
    ...     4. Enter the search input in the search field
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The user will also be able to clear the entered text in the Search by clicking on the remove icon (X)
    ...     2. When the user completes a search on the page, the search value and the return output shall be applied
    ...     and reflected on all the tabs of the page
    ...     3. When the user switches the tabs on the page or to different pages the search value and its result should
    ...     remain until it is cleared out

     [Tags]  BF-TECH-CP-STUDIES-FLAGGED-SEARCH-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-FLAGGED-SEARCH-03: Search by Study ID attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Study ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Flagged studies tab of the STUDIES page
    ...     2. Click the search option icon
    ...     3. Select the Study ID option
    ...     4. Enter the search input in the search field
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The user will also be able to clear the entered text in the Search by clicking on the remove icon (X)
    ...     2. When the user completes a search on the page, the search value and the return output shall be applied
    ...     and reflected on all the tabs of the page
    ...     3. When the user switches the tabs on the page or to different pages the search value and its result should
    ...     remain until it is cleared out

    [Tags]  BF-TECH-CP-STUDIES-FLAGGED-SEARCH-03     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-FLAGGED-SEARCH-04: Search by Patient ID attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Patient ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Flagged studies tab of the STUDIES page
    ...     2. Click the search option icon
    ...     3. Select the Patient ID option
    ...     4. Enter the search input in the search field
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The user will also be able to clear the entered text in the Search by clicking on the remove icon (X)
    ...     2. When the user completes a search on the page, the search value and the return output shall be applied
    ...     and reflected on all the tabs of the page
    ...     3. When the user switches the tabs on the page or to different pages the search value and its result should
    ...     remain until it is cleared out

    [Tags]  BF-TECH-CP-STUDIES-FLAGGED-SEARCH-04     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-FLAGGED-SEARCH-05: Search by Device ID attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Device ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Flagged studies tab of the STUDIES page
    ...     2. Click the search option icon
    ...     3. Select the Device ID option
    ...     4. Enter the search input in the search field
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The user will also be able to clear the entered text in the Search by clicking on the remove icon (X)
    ...     2. When the user completes a search on the page, the search value and the return output shall be applied
    ...     and reflected on all the tabs of the page
    ...     3. When the user switches the tabs on the page or to different pages the search value and its result should
    ...     remain until it is cleared out

    [Tags]  BF-TECH-CP-STUDIES-FLAGGED-SEARCH-05     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#BF-TECH-CP-STUDIES-FLAGGED-STOP-01:
#    [Documentation]
#
#    [Tags]
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#
#BF-TECH-CP-STUDIES-FLAGGED-GET-ECG-01:
#    [Documentation]
#
#    [Tags]
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#
BF-TECH-CP-STUDIES-FLAGGED-DETAILS-STUDY-01: View the studies Flagged details of a study
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can view the studies Flagged details of a study
    ...
    ...     Precondition:
    ...     - There is at least a flagged studies on the notification center card or flagged studies tab
    ...
    ...     Test Steps:
    ...     1. Click on the study ID hyperlink
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. A new section called “Study’s Issue”has been added to the Study details tab for flagged studies.
    ...     The “Study’s Issue” section shall display the following information:
    ...     - Issue found last 6 hours - Resolved checkbox
    ...     + In the case there was an issue found in the last 6 hour:
    ...     . There shall be a “View solutions” hyperlink and the Resolved checkbox shall be enabled. Once the
    ...     “View solutions” hyperlink is clicked, detailed instructions on how to resolve a specific issue shall be
    ...     displayed for the clinician to follow. The instruction shall include information such as what is the current
    ...     issue and the steps to resolve the issue
    ...     + In the case there was an issue found in the last 6 hours and the user has resolved it, the Resolved
    ...     checkbox shall be checked and the message stating: Action taken+” “+ minutes/hours ago shall be displayed
    ...     + In the case there was no issue found in the last 6 hours, a message stating: “No issue found” shall be
    ...     displayed and the Resolved checkbox shall be hidden
    ...     + In the case the study' status is Done and Completed, the issue found in the last 6 hours field,
    ...     Resolved checkbox, and View solution hyperlink shall be hidden
    ...     - Common issue found in the study
    ...     - Total artifact percentage
    ...     - All the notifications shall be marked as read in the case the user clicks on the notification icon

    [Tags]  BF-TECH-CP-STUDIES-FLAGGED-DETAILS-STUDY-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#BF-TECH-CP-STUDIES-FLAGGED-DETAILS-PATIENT-01:
#    [Documentation]
#
#    [Tags]
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#
#BF-TECH-CP-STUDIES-FLAGGED-DETAILS-REPORT-01:
#    [Documentation]
#
#    [Tags]
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#
#BF-TECH-CP-STUDIES-FLAGGED-DETAILS-EVENT-01:
#    [Documentation]
#
#    [Tags]
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#
#BF-TECH-CP-STUDIES-FLAGGED-DETAILS-ECG-VIEWER-01:
#    [Documentation]
#
#    [Tags]
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#
#BF-TECH-CP-STUDIES-FLAGGED-DETAILS-INSTANT-01:
#    [Documentation]
#
#    [Tags]
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}       Start Browser
    Import Library        project_bioflux_clinic_portal/lib/web/Common.py    ${BROWSER_NODE}  ${ENV}
    ${TECH_USER}          Get Config Param       NEW_USER > clinic_technician
    Set Suite Variable    ${TECH_USER}
    Sign In Bioflux       username=${TECH_USER}[0][username]       password=${TECH_USER}[0][password]
    ${VERSION}            Get Release Version
    Set Suite Metadata    version     ${VERSION}
    Set Suite Metadata    browser     ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser
