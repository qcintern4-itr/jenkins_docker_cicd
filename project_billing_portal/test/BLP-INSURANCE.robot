*** Settings ***
Documentation   Test Suite - Billing Portal - Insurance page
Metadata    sid     BLP-INSURANCE
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}    ${HEADLESS}
Library     project_billing_portal/lib/ConfigHandler.py     ${ENV}

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BLP-INSURANCE   web
Test Timeout    1h

*** Test Cases ***
BLP-INSURANCE-VIEW-01: View Insurance tab
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: The user can view Insurance tab
    ...
    ...     Precondition:
    ...     - The user has logged in to the Billing portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Insurance] button
    ...     - 2. Observe Insurance page
    ...
    ...     Expected Results:
    ...     - 1. The default tab is selected-Unbilled
    ...     - 2. There shall be 3 subtabs: Unbilled, Billed, Do Not Bill
    ...     - Each subtab in Insurance page displays a list of studies
    ...     - Display the Search field, allowing the user to search for the desired study
    ...     - Display a Download insurance report button

    [Tags]  BLP-INSURANCE-VIEW-01      BP-SRS-03-FBS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-VIEW-01: Check all the EOU reports sent to the clinic shall be displayed in the Unbilled subtab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: This subtab displays studies that have their EOU reports sent to the clinic
    ...
    ...     Precondition:
    ...     - 1. The user is on the Unbilled subtab of the Billing portal
    ...     - 2. There is an EOU report sent to clinic
    ...     - 3. There is an EOU report sent to clinic and then dismissed
    ...     - 4. There is an EOU report sent to clinic and then aborted
    ...     - 5. There is an EOU report sent to clinic and then deleted
    ...     - 6. There is an EOU report sent to clinic and then marked as artifact
    ...     Test Steps:
    ...     - 1. Check all the reports sent to clinic (the reports in the precondition) are displayed in the Unbilled subtab
    ...     Expected Results:
    ...     - 1. All report are displayed in the Unbilled subtab

    [Tags]  BLP-INSURANCE-UNBILLED-VIEW-01      BP-SRS-03-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-VIEW-02: Check icon and tooltip in the case the EOU report sent to clinic was marked as artifact
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the study’s EOU report was marked as artifact,
    ...     there shall be a tag displayed next to the Study ID and displayed tooltip "EOU report marked as artifact"
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There is the EOU report sent to clinic marked as artifact
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID that its EOU report was sent to clinic and was marked as artifact
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "EOU report marked as artifact” shall be displayed

    [Tags]  BLP-INSURANCE-UNBILLED-VIEW-02      BP-SRS-03-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-VIEW-03: Check icon and tooltip in the case the EOU report sent to clinic was dismissed
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the study’s EOU report was dismissed,
    ...     there shall be a tag displayed next to the Study ID and diplayed tooltip "EOU report dismissed"
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There is the EOU report sent to clinic and was dismissed
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID that its EOU report was sent to clinic and was dismissed
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "EOU report dismissed” shall be displayed

    [Tags]  BLP-INSURANCE-UNBILLED-VIEW-03      BP-SRS-03-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-VIEW-04: Check icon and tooltip in the case the EOU report sent to clinic and then deteted the study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the EOU report sent to clinic and then deleted the study,
    ...     there shall be a tag displayed next to the Study ID and diplayed tooltip "Study deleted"
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There is the EOU report sent to clinic and deleted the study
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID that its EOU report was sent to clinic and then the study was deleted
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "Study deleted” shall be displayed

    [Tags]  BLP-INSURANCE-UNBILLED-VIEW-04      BP-SRS-03-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-VIEW-05: Check icon and tooltip in the case the EOU report sent to clinic and then aborted the study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the EOU report sent to clinic and then aborted the study
    ...     there shall be a tag displayed next to the Study ID and diplayed tooltip "Study aborted"
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There is the EOU report sent to clinic and aborted the study
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "Study aborted” shall be displayed

    [Tags]  BLP-INSURANCE-UNBILLED-VIEW-05      BP-SRS-03-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-VIEW-06: When the EOU report was marked as artifact and deleted, should display deleted tootip
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the study’s EOU report was marked as artifact and the study was deleted
    ...     The “Study deleted” tooltip shall be prioritized to be displayed
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There is the EOU report sent to clinic then marked as artifact the report and then deleted the study
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "Study deleted” shall be displayed

    [Tags]  BLP-INSURANCE-UNBILLED-VIEW-06      BP-SRS-03-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-VIEW-07: When the report was marked as artifact and the study was aborted, should display aborted tooltip
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the study’s EOU report was marked as artifact and the study was aborted
    ...     The “Study aborted” tooltip shall be prioritized to be displayed
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There is the EOU report sent to clinic then marked as artifact the report and then aborted the study
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "Study aborted” shall be displayed

    [Tags]  BLP-INSURANCE-UNBILLED-VIEW-07      BP-SRS-03-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-VIEW-08: When the report was dismissed and the study was aborted, should display aborted tooltip
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the study’s EOU report was dismissed and the study was aborted
    ...     The “Study aborted” tooltip shall be prioritized to be displayed
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There is the EOU report sent to clinic then dismissed the report and then aborted the study
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "Study aborted” shall be displayed

    [Tags]  BLP-INSURANCE-UNBILLED-VIEW-08      BP-SRS-03-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-VIEW-09: When the report was dismissed and the study was deleted, should display deleted tooltip
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the study’s EOU report was dismissed and the study was deleted
    ...     The “Study deleted” tooltip shall be prioritized to be displayed
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There is the EOU report sent to clinic then dismissed the report and then deleted the study
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "Study deleted” shall be displayed

    [Tags]  BLP-INSURANCE-UNBILLED-VIEW-09      BP-SRS-03-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-VIEW-11: The facility column shall not be displayed when the user selects All facilities in the Facility filter
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the user selects All facilities in the Facility filter, the facility column shall not be displayed
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - The user works for some facilities (at least 2 facilities)
    ...
    ...     Test Steps:
    ...     - 1. The user selects All facilities option in the Facility filter
    ...     - 2. Observe the table
    ...
    ...     Expected Results:
    ...     - The facility column shall not be displayed

    [Tags]  BLP-INSURANCE-UNBILLED-VIEW-11      BP-SRS-03-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-VIEW-12: The facility column shall not be displayed when the user selects a facility in the Facility filter
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the user selects a facility in the Facility filter, the facility column shall not be displayed
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - The user works for some facilities (at least 2 facilities)
    ...
    ...     Test Steps:
    ...     - 1. The user selects a facility option in the Facility filter
    ...     - 2. Observe the table
    ...
    ...     Expected Results:
    ...     - The facility column shall not be displayed

    [Tags]  BLP-INSURANCE-UNBILLED-VIEW-12      BP-SRS-03-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-VIEW-13: The facility column shall not be displayed when the user works for 1 facility only
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the user works for 1 facility only, the facility column shall not be displayed
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - The user works for one facilitity only
    ...
    ...     Test Steps:
    ...     - 1. Observe the table
    ...
    ...     Expected Results:
    ...     - The facility column shall not be displayed

    [Tags]  BLP-INSURANCE-UNBILLED-VIEW-13      BP-SRS-03-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-VIEW-14: Check the CPT code of MCT study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check The CPT code of the MCT study is 93228-93229
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There is a EOU report of the MCT study sent to clinic
    ...
    ...     Test Steps:
    ...     - 1. Observe the CPT code of MCT study
    ...
    ...     Expected Results:
    ...     - The CPT code should be 93228-93229

    [Tags]  BLP-INSURANCE-UNBILLED-VIEW-14      BP-SRS-03-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-VIEW-15: Check the CPT code of MCT PEEK study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check The CPT code of the MCT PEEK study is 93228-93229
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There is a EOU report of the MCT PEEK study sent to clinic
    ...
    ...     Test Steps:
    ...    - 1. Observe the CPT code of MCT PEEK study
    ...
    ...     Expected Results:
    ...     - The CPT code should be 93228-93229

    [Tags]  BLP-INSURANCE-UNBILLED-VIEW-15      BP-SRS-03-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-VIEW-16: Check the CPT code of CARDIAC EVENT study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check The CPT code of the CARDIAC EVENT study is 93268-93272
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There is a EOU report of the CARDIAC EVENT study sent to clinic
    ...
    ...     Test Steps:
    ...     - 1. Observe the CPT code of CARDIAC EVENT study
    ...
    ...     Expected Results:
    ...     - The CPT code should be 93268-93272

    [Tags]  BLP-INSURANCE-UNBILLED-VIEW-16      BP-SRS-03-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-VIEW-17: Check the CPT code of HOLTER study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check The CPT code of the HOLTER study is 93224-93227
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There is a EOU report of the HOLTER study sent to clinic
    ...
    ...     Test Steps:
    ...     - 1. Observe the CPT code of HOLTER study
    ...
    ...     Expected Results:
    ...     - The CPT code should be 93224-93227

    [Tags]  BLP-INSURANCE-UNBILLED-VIEW-17      BP-SRS-03-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-VIEW-18: Check the CPT code of EXTENDED HOLTER study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check The CPT code of the EXTENDED HOLTER study is 93241-93247
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There is a EOU report of the EXTENDED HOLTER study sent to clinic
    ...
    ...     Test Steps:
    ...     - 1. Observe the CPT code of EXTENDED HOLTER study
    ...
    ...     Expected Results:
    ...     - The CPT code should be 93241-93247

    [Tags]  BLP-INSURANCE-UNBILLED-VIEW-18      BP-SRS-03-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-VIEW-19: Expand the study infomation section and check the information
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Expand the study infomation section and check the study information
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There is some study rows displayed in Unbilled tab
    ...
    ...     Test Steps:
    ...     - 1. Click on the Expand button of a study row
    ...     - 2. Observe the information of the study in the expanding section
    ...
    ...     Expected Results:
    ...     - 1. A study row shall be expanded, and the user shall be able to view the information of a study
    ...     - 2. The study information:
    ...     - a. Patient Information:
    ...     - Patient ID
    ...     - DOB
    ...     - Gender
    ...     - Address
    ...     - Primary Phone number
    ...     - Referring physician
    ...     - Interpreting physician
    ...     - Insurance
    ...     - Provider
    ...     - b. Study information
    ...     - Start date
    ...     - End date
    ...     - Primary Diagnosis Code
    ...     - Secondary Diagnosis Code

    [Tags]  BLP-INSURANCE-UNBILLED-VIEW-19      BP-SRS-03-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-VIEW-20: Collapse the study infomation section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Collapse the study infomation section
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There is expanding study row
    ...
    ...     Test Steps:
    ...     - 1. Click on the Expand button
    ...
    ...     Expected Results:
    ...     - The expanding section shall be collapsed

    [Tags]  BLP-INSURANCE-UNBILLED-VIEW-20      BP-SRS-03-FBS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-VIEW-21: Expand all the study infomation sections
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Expand all the study infomation sections by clicking on the Expand button of all studies
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There is some study rows displayed in Unbilled tab
    ...
    ...     Test Steps:
    ...     - 1. Click on the Expand button for all studies (The arrow button is on the header of the table)
    ...
    ...     Expected Results:
    ...     - All rows in a page shall be expanded, and the user shall be able to view the information of all studies

   [Tags]  BLP-INSURANCE-UNBILLED-VIEW-21       BP-SRS-03-FBS-02    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-VIEW-22: Check the order of the unbilled study list and switch the sorting order between ascending and descending
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the order of the unbilled study list
    ...     and switch the sorting order between ascending and descending
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There is some study rows displayed in Unbilled tab
    ...
    ...     Test Steps:
    ...     - 1. Observe the order of the list
    ...     - 2. The user selects the sort button next to study ID again
    ...
    ...     Expected Results:
    ...     - 1. The list is sorted by Study ID in descending order
    ...     - 2. The study list will switch the sorting order between ascending and descending of the respective attributes.

   [Tags]  BLP-INSURANCE-UNBILLED-VIEW-22       BP-SRS-03-FBS-02    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-VIEW-23: Pagination check
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can navigate to the desired page by clicking on the page number or ">,<" button
    ...     and can also choose the number of rows displayed in 1 page
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There is at least 51 study rows displayed in Unbilled tab
    ...
    ...     Test Steps:
    ...     - 1. Observe the pagination, click on > button
    ...     - 2. The user clicks on < button
    ...     - 3. The user clicks on page numbe
    ...     - 4. Click on the pagination drop-down, observe the list
    ...     - 5. The user selects “10 rows” from the drop-down box
    ...     - 6. The user selects “30 rows” from the drop-down box
    ...     - 7. The user selects “50 rows” from the drop-down box
    ...
    ...     Expected Results:
    ...     - 1. The user shall be navigated to the next page
    ...     - 2. The user shall be navigated to the previous page
    ...     - 3. The user shall be navigated to the chosen page
    ...     - 4. A list number of studies “10 rows, 30 rows, 50 rows” shall be displayed
    ...     - 5. The list with 10 studies shall be displayed on 1 page
    ...     - 6. The list with 30 studies shall be displayed on 1 page
    ...     - 7. The list with 50 studies shall be displayed on 1 page

   [Tags]  BLP-INSURANCE-UNBILLED-VIEW-23       BP-SRS-03-FBS-02    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-SEARCH-01: Search by study ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by study ID
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by study ID”, observe the search bar
    ...     - 3. Enter a study ID into the search bar
    ...
    ...     Expected Results:
    ...     - 1. There shall be a drop-down list displayed,
    ...     - Search by Study ID
    ...     - Search by Patient name
    ...     - Search by Device ID
    ...     - 2. The placeholder shall be “Search by study ID”
    ...     - 3. The list shall be filtered and displayed accordingly with the study ID entered.

   [Tags]  BLP-INSURANCE-UNBILLED-SEARCH-01     BP-SRS-03-FBS-02    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-SEARCH-02: The Search by option and values entered shall be applied to other subtabs.
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by study ID
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by study ID”, observe the search bar
    ...     - 3. Enter a study ID into the search bar
    ...     - 4. The user navigates to the Billed subtab
    ...     - 5. The user navigates to the Do Not Bill subtab
    ...
    ...     Expected Results:
    ...     - 1. Step 4-The Search by option and values entered shall be applied to the Billed subtab.
    ...     - 2. Step 5-The Search by option and values entered shall be applied to the Do Not Bill subtab.

   [Tags]  BLP-INSURANCE-UNBILLED-SEARCH-02     BP-SRS-03-FBS-02    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-SEARCH-03: The Search by option and values entered shall be applied to other tabs.
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by study ID
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by study ID”, observe the search bar
    ...     - 3. Enter a study ID into the search bar
    ...     - 4. The user navigates to the Invoices tab, then goes back to the Insurance tab
    ...     - 5. The user navigates to the Support tab, then goes back to the Insurance tab
    ...     - 6. The user navigates to the Bionomix tab, then goes back to the Insurance tab
    ...
    ...     Expected Results:
    ...     - 1. Step 4-The Search by option and values entered shall be kept
    ...     - 2. Step 5-The Search by option and values entered shall be kept
    ...     - 3. Step 6-The Search by option and values entered shall be kept

   [Tags]  BLP-INSURANCE-UNBILLED-SEARCH-03     BP-SRS-03-FBS-02    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-SEARCH-04: The user reloading page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: When the user reloads page, the Search by option shall be set to default, value entered shall be cleared
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by study ID”, observe the search bar
    ...     - 3. Enter a study ID into the search bar
    ...     - 4. The user reload page
    ...
    ...     Expected Results:
    ...     - The Search by option shall be set to default, value entered shall be cleared.

   [Tags]  BLP-INSURANCE-UNBILLED-SEARCH-04     BP-SRS-03-FBS-02    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BLP-INSURANCE-UNBILLED-SEARCH-05: Search by Patient Name
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by Patient Name
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by Patient Name”, observe the search bar
    ...     - 3. Enter a patient name into the search bar
    ...
    ...     Expected Results:
    ...     - 1. There shall be a drop-down list displayed,
    ...     - Search by Study ID
    ...     - Search by Patient name
    ...     - Search by Device ID
    ...     - 2. The placeholder shall be “Search by Patient Name”
    ...     - 3. The list shall be filtered and displayed accordingly with the Patient Name entered.

   [Tags]  BLP-INSURANCE-UNBILLED-SEARCH-05     BP-SRS-03-FBS-02    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-SEARCH-06: The Search by option and values entered shall be applied to other subtabs.
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by Patient Name
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by Patient Name", observe the search bar
    ...     - 3. Enter a Patient Name into the search bar
    ...     - 4. The user navigates to the Billed subtab
    ...     - 5. The user navigates to the Do Not Bill subtab
    ...
    ...     Expected Results:
    ...     - 1. Step 4-The Search by option and values entered shall be applied to the Billed subtab.
    ...     - 2. Step 5-The Search by option and values entered shall be applied to the Do Not Bill subtab.

   [Tags]  BLP-INSURANCE-UNBILLED-SEARCH-06     BP-SRS-03-FBS-02    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-SEARCH-07: The Search by option and values entered shall be applied to other tabs.
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by study ID
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by Patient Name”, observe the search bar
    ...     - 3. Enter a patient name into the search bar
    ...     - 4. The user navigates to the Invoices tab, then goes back to the Insurance tab
    ...     - 5. The user navigates to the Support tab, then goes back to the Insurance tab
    ...     - 6. The user navigates to the Bionomix tab, then goes back to the Insurance tab
    ...
    ...     Expected Results:
    ...     - 1. Step 4-The Search by option and values entered shall be kept
    ...     - 2. Step 5-The Search by option and values entered shall be kept
    ...     - 3. Step 6-The Search by option and values entered shall be kept

   [Tags]  BLP-INSURANCE-UNBILLED-SEARCH-07     BP-SRS-03-FBS-02    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-SEARCH-08: The user reloading page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: When the user reloads page, the Search by option shall be set to default, value entered shall be cleared
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by Patient Name”, observe the search bar
    ...     - 3. Enter a patient name into the search bar
    ...     - 4. The user reload page
    ...
    ...     Expected Results:
    ...     - The Search by option shall be set to default, value entered shall be cleared.

   [Tags]  BLP-INSURANCE-UNBILLED-SEARCH-08     BP-SRS-03-FBS-02    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-SEARCH-09: Search by Device ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by Device ID
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by Device ID”, observe the search bar
    ...     - 3. Enter a Device ID into the search bar
    ...
    ...     Expected Results:
    ...     - 1. There shall be a drop-down list displayed,
    ...     - Search by Study ID
    ...     - Search by Patient name
    ...     - Search by Device ID
    ...     - 2. The placeholder shall be “Search by Device ID”
    ...     - 3. The list shall be filtered and displayed accordingly with the Device ID entered.

   [Tags]  BLP-INSURANCE-UNBILLED-SEARCH-09     BP-SRS-03-FBS-02    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-SEARCH-10: The Search by option and values entered shall be applied to other subtabs.
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by Device ID
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by Device ID”, observe the search bar
    ...     - 3. Enter a Device ID into the search bar
    ...     - 4. The user navigates to the Billed subtab
    ...     - 5. The user navigates to the Do Not Bill subtab
    ...
    ...     Expected Results:
    ...     - 1. Step 4-The Search by option and values entered shall be applied to the Billed subtab.
    ...     - 2. Step 5-The Search by option and values entered shall be applied to the Do Not Bill subtab.

   [Tags]  BLP-INSURANCE-UNBILLED-SEARCH-10     BP-SRS-03-FBS-02    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-SEARCH-11: The Search by option and values entered shall be applied to other tabs.
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by Device ID
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by Device ID”, observe the search bar
    ...     - 3. Enter a Device ID into the search bar
    ...     - 4. The user navigates to the Invoices tab, then goes back to the Insurance tab
    ...     - 5. The user navigates to the Support tab, then goes back to the Insurance tab
    ...     - 6. The user navigates to the Bionomix tab, then goes back to the Insurance tab
    ...
    ...     Expected Results:
    ...     - 1. Step 4-The Search by option and values entered shall be kept
    ...     - 2. Step 5-The Search by option and values entered shall be kept
    ...     - 3. Step 6-The Search by option and values entered shall be kept

   [Tags]  BLP-INSURANCE-UNBILLED-SEARCH-11     BP-SRS-03-FBS-02    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-SEARCH-12: The user reloading page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: When the user reloads page, the Search by option shall be set to default, value entered shall be cleared
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by Device ID”, observe the search bar
    ...     - 3. Enter a Device ID into the search bar
    ...     - 4. The user reload page
    ...
    ...     Expected Results:
    ...     - The Search by option shall be set to default, value entered shall be cleared.

   [Tags]  BLP-INSURANCE-UNBILLED-SEARCH-12     BP-SRS-03-FBS-02    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-MARK-01: Mark as Billed a study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The study shall be moved to Billed subtab when the user clicks on “Mark as Billed” button
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There is at least 1 study row
    ...
    ...     Test Steps:
    ...     - 1. The user mouses over the study row
    ...     - 2. Mouse over each button
    ...     - 3. Click on “Mark as Billed” button
    ...
    ...     Expected Results:
    ...     - 1. There shall be two buttons displayed
    ...     - 2. Display a tooltip which is the name of that button. It can be "Mark as Billed" or "Mark as Do Not Bill"
    ...     - 3. The study shall be moved to Billed subtab

   [Tags]  BLP-INSURANCE-UNBILLED-MARK-01       BP-SRS-03-FBS-02    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-MARK-02: Mark as Do Not Bill a study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The study shall be moved to Do Not Bill subtab when the user clicks on “Mark as Do Not Bill” button
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There is at least 1 study row
    ...
    ...     Test Steps:
    ...     - 1. The user mouses over the study row
    ...     - 2. Mouse over each button
    ...     - 3. Click on “Mark as Do Not Bill” button
    ...
    ...     Expected Results:
    ...     - 1. There shall be two buttons displayed
    ...     - 2. Display a tooltip which is the name of that button. It can be 'Mark as Billed" or "Mark as Do Not Bill"
    ...     - 3. The study shall be moved to Do Not Bill subtab

   [Tags]  BLP-INSURANCE-UNBILLED-MARK-02       BP-SRS-03-FBS-02    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-MARK-03: Check the UI component displayed the number of selected study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: When the user selects at least one study by checking the checkbox, there is UI component
    ...     dislayed number of selected study and Mark as Billed, Mark as Do Not Bill button
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There is at least 1 study row
    ...
    ...     Test Steps:
    ...     - 1. The user selects one study by checking the checkbox
    ...     - 2. Observe the UI component appreared
    ...
    ...     Expected Results:
    ...     - 1. There shall be a UI component displayed on the top of the table
    ...     to let the user know the number of selected study
    ...     - 2. There shall be 2 buttons displayed next to the number of selected studies: Mark as Billed, Mark as Do Not Bill

   [Tags]  BLP-INSURANCE-UNBILLED-MARK-03       BP-SRS-03-FBS-02    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-MARK-04: Cancel the selection
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user cancels the selection by clicking on (x) button in the UI
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There is at least 1 study is selected
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on (x) button in the UI component
    ...
    ...     Expected Results:
    ...     - The selection shall be canceled

   [Tags]  BLP-INSURANCE-UNBILLED-MARK-04       BP-SRS-03-FBS-02    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-MARK-05: Mark multiple studies as Billed
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can mark multiple studies as Billed by checking the checkboxes and click on "Mark as Billed" button
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There are some study rows displayed in this subtab
    ...
    ...     Test Steps:
    ...     - 1. The user selects multiple studies by checking the checkboxes
    ...     - 2. Clicks on “Mark as Billed” button (which is to the right of the number of selected studies)
    ...
    ...     Expected Results:
    ...     - All selected studies shall be marked as Billed, displayed on Billed subtab

   [Tags]  BLP-INSURANCE-UNBILLED-MARK-05       BP-SRS-03-FBS-02    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-UNBILLED-MARK-06: Mark multiple studies as Do not Bill
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can mark multiple studies as Do Not Bill by checking the checkboxes and click on "Mark as Do Not Bill" button
    ...
    ...     Precondition:
    ...     - The user is on the Unbilled tab of Billing portal
    ...     - There are some study rows displayed in this subtab
    ...
    ...     Test Steps:
    ...     - 1. The user selects multiple studies by checking the checkboxes
    ...     - 2. Clicks on “Mark as Do Not Bill” button (which is to the right of the number of selected studies)
    ...
    ...     Expected Results:
    ...     - All selected studies shall be marked as Do Not Bill, displayed on Do Not Bill subtab

   [Tags]  BLP-INSURANCE-UNBILLED-MARK-06       BP-SRS-03-FBS-02    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-VIEW-02: Check icon and tooltip in the case the EOU report sent to clinic was marked as artifact
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the study’s EOU report was marked as artifact,
    ...     there shall be a tag displayed next to the Study ID and tooltip "EOU report marked as artifact"
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...     - There is the EOU report sent to clinic marked as artifact displayed in Billed tab (marked as billed)
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID that its EOU report was sent to clinic and was marked as artifact
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "EOU report marked as artifact” shall be displayed

    [Tags]  BLP-INSURANCE-BILLED-VIEW-02        BP-SRS-03-FBS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-VIEW-03: Check icon and tooltip in the case the EOU report sent to clinic was dismissed
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the study’s EOU report was dismissed,
    ...     there shall be a tag displayed next to the Study ID and tooltip "EOU report dismissed"
    ...
    ...     Precondition:
    ...     - The user is on the billed tab of Billing portal
    ...     - There is the EOU report sent to clinic and was dismissed displayed in the billed tab(marked the study as billed)
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID that its EOU report was sent to clinic and was dismissed
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "EOU report dismissed” shall be displayed

    [Tags]  BLP-INSURANCE-BILLED-VIEW-03        BP-SRS-03-FBS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-VIEW-04: Check icon and tooltip in the case the EOU report sent to clinic and then deteted the study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the EOU report sent to clinic and then deleted the study,
    ...     there shall be a tag displayed next to the Study ID and diplayed tooltip "Study deleted"
    ...
    ...     Precondition:
    ...     - The user is on the billed tab of Billing portal
    ...     - There is the EOU report sent to clinic and the study was deleted, displayed in billed tab
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID that its EOU report was sent to clinic and then the study was deleted
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "Study deleted” shall be displayed

    [Tags]  BLP-INSURANCE-BILLED-VIEW-04        BP-SRS-03-FBS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-VIEW-05: Check icon and tooltip in the case the EOU report sent to clinic and then aborted the study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the EOU report sent to clinic and then aborted the study
    ...     there shall be a tag displayed next to the Study ID and diplayed tooltip "Study aborted"
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...     - There is the EOU report sent to clinic and aborted the study,
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "Study aborted” shall be displayed

    [Tags]  BLP-INSURANCE-BILLED-VIEW-05        BP-SRS-03-FBS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-VIEW-06: When the EOU report was marked as artifact and deleted, should display deleted tooltip
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the study’s EOU report was marked as artifact and the study was deleted
    ...     The “Study deleted” tooltip shall be prioritized to be displayed
    ...
    ...     Precondition:
    ...     - The user is on the billed tab of Billing portal
    ...     - There is the EOU report sent to clinic then marked as artifact the report and then deleted the study
    ...     - That study is displayed in Billed tab (mark as billed)
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "Study deleted” shall be displayed

    [Tags]  BLP-INSURANCE-BILLED-VIEW-06        BP-SRS-03-FBS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-VIEW-07: When the report was marked as artifact and the study was aborted, should display aborted tooltip
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the study’s EOU report was marked as artifact and the study was aborted
    ...     The “Study aborted” tooltip shall be prioritized to be displayed
    ...
    ...     Precondition:
    ...     - The user is on the billed tab of Billing portal
    ...     - There is the EOU report sent to clinic then marked as artifact the report and then aborted the study
    ...     - The study is displayed in billed tab
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "Study aborted” shall be displayed

    [Tags]  BLP-INSURANCE-BILLED-VIEW-07        BP-SRS-03-FBS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-VIEW-08: When the report was dismissed and the study was aborted, should display aborted tooltip
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the study’s EOU report was dismissed and the study was aborted
    ...     The “Study aborted” tooltip shall be prioritized to be displayed
    ...
    ...     Precondition:
    ...     - The user is on the billed tab of Billing portal
    ...     - There is the EOU report sent to clinic then dismissed the report and then aborted the study
    ...     - That study is displayed in Billed tab
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "Study aborted” shall be displayed

    [Tags]  BLP-INSURANCE-BILLED-VIEW-08        BP-SRS-03-FBS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-VIEW-09: When the report was dismissed and the study was deleted, should display deleted tooltip
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the study’s EOU report was dismissed and the study was deleted
    ...     The “Study deleted” tooltip shall be prioritized to be displayed
    ...
    ...     Precondition:
    ...     - The user is on the billed tab of Billing portal
    ...     - There is the EOU report sent to clinic then dismissed the report and then deleted the study
    ...     - That study is displayed in billed tab
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "Study deleted” shall be displayed

    [Tags]  BLP-INSURANCE-BILLED-VIEW-09        BP-SRS-03-FBS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-VIEW-11: The facility column shall not be displayed when the user selects All facilities in the Facility filter
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the user selects All facilities in the Facility filter, the facility column shall not be displayed
    ...
    ...     Precondition:
    ...     - The user is on the billed tab of Billing portal
    ...     - The user works for some facilities (at least 2 facilities)
    ...
    ...     Test Steps:
    ...     - 1. The user selects All facilities option in the Facility filter
    ...     - 2. Observe the table
    ...
    ...     Expected Results:
    ...     - The facility column shall not be displayed

    [Tags]  BLP-INSURANCE-BILLED-VIEW-11    BP-SRS-03-FBS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-VIEW-12: The facility column shall not be displayed when the user selects a facility in the Facility filter
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the user selects a facility in the Facility filter, the facility column shall not be displayed
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...     - The user works for some facilities (at least 2 facilities)
    ...
    ...     Test Steps:
    ...     - 1. The user selects a facility option in the Facility filter
    ...     - 2. Observe the table
    ...
    ...     Expected Results:
    ...     - The facility column shall not be displayed

    [Tags]  BLP-INSURANCE-BILLED-VIEW-12    BP-SRS-03-FBS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-VIEW-13: The facility column shall not be displayed when the user works for 1 facility only
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the user works for 1 facility only, the facility column shall not be displayed
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...     - The user works for one facilitity only
    ...
    ...     Test Steps:
    ...     - 1. Observe the table
    ...
    ...     Expected Results:
    ...     - The facility column shall not be displayed

    [Tags]  BLP-INSURANCE-BILLED-VIEW-13    BP-SRS-03-FBS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-VIEW-14: Check the CPT code of MCT study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check The CPT code of the MCT study is 93228-93229
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...     - There is a EOU report of the MCT study sent to clinic
    ...
    ...     Test Steps:
    ...     - 1. Observe the CPT code of MCT study
    ...
    ...     Expected Results:
    ...     - The CPT code should be 93228-93229

    [Tags]  BLP-INSURANCE-BILLED-VIEW-14    BP-SRS-03-FBS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-VIEW-15: Check the CPT code of MCT PEEK study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check The CPT code of the MCT PEEK study is 93228-93229
    ...
    ...     Precondition:
    ...     - The user is on the billed tab of Billing portal
    ...     - There is a EOU report of the MCT PEEK study sent to clinic
    ...
    ...     Test Steps:
    ...     - 1. Observe the CPT code of MCT PEEK study
    ...
    ...     Expected Results:
    ...     - The CPT code should be 93228-93229

    [Tags]  BLP-INSURANCE-BILLED-VIEW-15    BP-SRS-03-FBS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-VIEW-16: Check the CPT code of CARDIAC EVENT study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check The CPT code of the CARDIAC EVENT study is 93268-93272
    ...
    ...     Precondition:
    ...     - The user is on the billed tab of Billing portal
    ...     - There is a EOU report of the CARDIAC EVENT study sent to clinic
    ...
    ...     Test Steps:
    ...     - 1. Observe the CPT code of CARDIAC EVENT study
    ...
    ...     Expected Results:
    ...     - The CPT code should be 93268-93272

    [Tags]  BLP-INSURANCE-BILLED-VIEW-16    BP-SRS-03-FBS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-VIEW-17: Check the CPT code of HOLTER study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check The CPT code of the HOLTER study is 93224-93227
    ...
    ...     Precondition:
    ...     - The user is on the billed tab of Billing portal
    ...     - There is a EOU report of the HOLTER study sent to clinic
    ...
    ...     Test Steps:
    ...     - 1. Observe the CPT code of HOLTER study
    ...
    ...     Expected Results:
    ...     - The CPT code should be 93224-93227

    [Tags]  BLP-INSURANCE-BILLED-VIEW-17    BP-SRS-03-FBS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-VIEW-18: Check the CPT code of EXTENDED HOLTER study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check The CPT code of the EXTENDED HOLTER study is 93241-93247
    ...
    ...     Precondition:
    ...     - The user is on the billed tab of Billing portal
    ...     - There is a EOU report of the EXTENDED HOLTER study sent to clinic
    ...
    ...     Test Steps:
    ...     - 1. Observe the CPT code of EXTENDED HOLTER study
    ...
    ...     Expected Results:
    ...     - The CPT code should be 93241-93247

    [Tags]  BLP-INSURANCE-BILLED-VIEW-18    BP-SRS-03-FBS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-VIEW-19: Expand the study infomation section and check the information
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Expand the study infomation section and check the study information
    ...
    ...     Precondition:
    ...     - The user is on the billed tab of Billing portal
    ...     - There is some study rows displayed in billed tab
    ...
    ...     Test Steps:
    ...     - 1. Click on the Expand button of a study row
    ...     - 2. Observe the information of the study in the expanding section
    ...
    ...     Expected Results:
    ...     - 1. A study row shall be expanded, and the user shall be able to view the information of a study
    ...     - 2. The study information:
    ...     - a. Patient Information:
    ...     - Patient ID
    ...     - DOB
    ...     - Gender
    ...     - Address
    ...     - Primiry Phone number
    ...     - Referring physician
    ...     - Interpreting physician
    ...     - Insurance
    ...     - Provider
    ...     - b. Study information
    ...     - Start date
    ...     - End date
    ...     - Primary Diagnosis Code
    ...     - Secondary Diagnosis Code

    [Tags]  BLP-INSURANCE-BILLED-VIEW-19    BP-SRS-03-FBS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-VIEW-20: Collapse the study infomation section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Collapse the study infomation section
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...     - There is expanding study row
    ...
    ...     Test Steps:
    ...     - 1. Click on the Expand button
    ...
    ...     Expected Results:
    ...     - The expanding section shall be collapsed

    [Tags]  BLP-INSURANCE-BILLED-VIEW-20    BP-SRS-03-FBS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-VIEW-21: Expand all the study infomation sections
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Expand all the study infomation sections by clicking on the Expand button of all studies
    ...
    ...     Precondition:
    ...     - The user is on the billed tab of Billing portal
    ...     - There is some study rows displayed in billed tab
    ...
    ...     Test Steps:
    ...     - 1. Click on the Expand button for all studies (The arrow button is on the header of the table)
    ...
    ...     Expected Results:
    ...     - All rows in a page shall be expanded, and the user shall be able to view the information of all studies

   [Tags]  BLP-INSURANCE-BILLED-VIEW-21     BP-SRS-03-FBS-03    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-VIEW-22: Check the order of the billed study list and switch the sorting order between ascending and descending
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the order of the billed study list
    ...     and switch the sorting order between ascending and descending
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...     - There is some study rows displayed in Unbilled tab
    ...
    ...     Test Steps:
    ...     - 1. Observe the order of the list
    ...     - 2. The user selects the sort button next to study ID again
    ...
    ...     Expected Results:
    ...     - 1. The list is sorted by Study ID in descending order
    ...     - 2. The deleted study shall be displayed at the end of the list
    ...     - 3. The study list will switch the sorting order between ascending and descending of the respective attributes.

   [Tags]  BLP-INSURANCE-BILLED-VIEW-22     BP-SRS-03-FBS-03    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-VIEW-23: Pagination check
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can navigate to the desired page by clicking on the page number or ">,<" button
    ...     and can also choose the number of rows displayed in 1 page
    ...
    ...     Precondition:
    ...     - The user is on the billed tab of Billing portal
    ...     - There is at least 51 study rows displayed in billed tab
    ...
    ...     Test Steps:
    ...     - 1. Observe the pagination, click on > button
    ...     - 2. The user clicks on < button
    ...     - 3. The user clicks on page number
    ...     - 4. Click on the pagination drop-down, observe the list
    ...     - 5. The user selects “10 rows” from the drop-down box
    ...     - 6. The user selects “30 rows” from the drop-down box
    ...     - 7. The user selects “50 rows” from the drop-down box
    ...
    ...     Expected Results:
    ...     - 1. The user shall be navigated to the next page
    ...     - 2. The user shall be navigated to the previous page
    ...     - 3. The user shall be navigated to the chosen page
    ...     - 4. A list number of studies “10 rows, 30 rows, 50 rows” shall be displayed
    ...     - 5. The list with 10 studies shall be displayed on 1 page
    ...     - 6. The list with 30 studies shall be displayed on 1 page
    ...     - 7. The list with 50 studies shall be displayed on 1 page

   [Tags]  BLP-INSURANCE-BILLED-VIEW-23     BP-SRS-03-FBS-03    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-SEARCH-01: Search by study ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by study ID
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by study ID”, observe the search bar
    ...     - 3. Enter a study ID into the search bar
    ...
    ...     Expected Results:
    ...     - 1. There shall be a drop-down list displayed,
    ...     - Search by Study ID
    ...     - Search by Patient name
    ...     - Search by Device ID
    ...     - 2. The placeholder shall be “Search by study ID”
    ...     - 3. The list shall be filtered and displayed accordingly with the study ID entered.

   [Tags]  BLP-INSURANCE-BILLED-SEARCH-01   BP-SRS-03-FBS-03    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-SEARCH-02: The Search by option and values entered shall be applied to other subtabs.
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by study ID
    ...
    ...     Precondition:
    ...     - The user is on the billed tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by study ID”, observe the search bar
    ...     - 3. Enter a study ID into the search bar
    ...     - 4. The user navigates to the Unbilled subtab
    ...     - 5. The user navigates to the Do Not Bill subtab
    ...
    ...     Expected Results:
    ...     - 1. Step 4-The Search by option and values entered shall be applied to the Unbilled subtab.
    ...     - 2. Step 5-The Search by option and values entered shall be applied to the Do Not Bill subtab.

   [Tags]  BLP-INSURANCE-BILLED-SEARCH-02   BP-SRS-03-FBS-03    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-SEARCH-03: The Search by option and values entered shall be applied to other tabs.
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by study ID
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by study ID”, observe the search bar
    ...     - 3. Enter a study ID into the search bar
    ...     - 4. The user navigates to the Invoices tab, then goes back to the Insurance tab
    ...     - 5. The user navigates to the Support tab, then goes back to the Insurance tab
    ...
    ...     Expected Results:
    ...     - 1. Step 4-The Search by option and values entered shall be kept
    ...     - 2. Step 5-The Search by option and values entered shall be kept

   [Tags]  BLP-INSURANCE-BILLED-SEARCH-03   BP-SRS-03-FBS-03    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-SEARCH-04: The user reloading page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: When the user reloads page, the Search by option shall be set to default, value entered shall be cleared
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by study ID”, observe the search bar
    ...     - 3. Enter a study ID into the search bar
    ...     - 4. The user reload page
    ...
    ...     Expected Results:
    ...     - The Search by option shall be set to default, value entered shall be cleared.

   [Tags]  BLP-INSURANCE-BILLED-SEARCH-04   BP-SRS-03-FBS-03    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-SEARCH-05: Search by Patient Name
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by Patient Name
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by Patient Name”, observe the search bar
    ...     - 3. Enter a patient name into the search bar
    ...
    ...     Expected Results:
    ...     - 1. There shall be a drop-down list displayed,
    ...     - Search by Study ID
    ...     - Search by Patient name
    ...     - Search by Device ID
    ...     - 2. The placeholder shall be “Search by Patient Name”
    ...     - 3. The list shall be filtered and displayed accordingly with the Patient Name entered.

   [Tags]  BLP-INSURANCE-BILLED-SEARCH-05   BP-SRS-03-FBS-03    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-SEARCH-06: The Search by option and values entered shall be applied to other subtabs.
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by Patient Name
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by Patient Name", observe the search bar
    ...     - 3. Enter a Patient Name into the search bar
    ...     - 4. The user navigates to the Unbilled subtab
    ...     - 5. The user navigates to the Do Not Bill subtab
    ...
    ...     Expected Results:
    ...     - 1. Step 4-The Search by option and values entered shall be applied to the Unbilled subtab.
    ...     - 2. Step 5-The Search by option and values entered shall be applied to the Do Not Bill subtab.

   [Tags]  BLP-INSURANCE-BILLED-SEARCH-06   BP-SRS-03-FBS-03    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-SEARCH-07: The Search by option and values entered shall be applied to other tabs.
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by study ID
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by Patient Name”, observe the search bar
    ...     - 3. Enter a patient name into the search bar
    ...     - 4. The user navigates to the Invoices tab, then goes back to the Insurance tab
    ...     - 5. The user navigates to the Support tab, then goes back to the Insurance tab
    ...
    ...     Expected Results:
    ...     - 1. Step 4-The Search by option and values entered shall be kept
    ...     - 2. Step 5-The Search by option and values entered shall be kept

   [Tags]  BLP-INSURANCE-BILLED-SEARCH-07   BP-SRS-03-FBS-03    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-SEARCH-08: The user reloading page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: When the user reloads page, the Search by option shall be set to default, value entered shall be cleared
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by Patient Name”, observe the search bar
    ...     - 3. Enter a patient name into the search bar
    ...     - 4. The user reload page
    ...
    ...     Expected Results:
    ...     - The Search by option shall be set to default, value entered shall be cleared.

   [Tags]  BLP-INSURANCE-BILLED-SEARCH-08   BP-SRS-03-FBS-03    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-SEARCH-09: Search by Device ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by Device ID
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by Device ID”, observe the search bar
    ...     - 3. Enter a Device ID into the search bar
    ...
    ...     Expected Results:
    ...     - 1. There shall be a drop-down list displayed,
    ...     - Search by Study ID
    ...     - Search by Patient name
    ...     - Search by Device ID
    ...     - 2. The placeholder shall be “Search by Device ID”
    ...     - 3. The list shall be filtered and displayed accordingly with the Device ID entered.

   [Tags]  BLP-INSURANCE-BILLED-SEARCH-09   BP-SRS-03-FBS-03    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-SEARCH-10: The Search by option and values entered shall be applied to other subtabs.
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by Device ID
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by Device ID”, observe the search bar
    ...     - 3. Enter a Device ID into the search bar
    ...     - 4. The user navigates to the Unbilled subtab
    ...     - 5. The user navigates to the Do Not Bill subtab
    ...
    ...     Expected Results:
    ...     - 1. Step 4-The Search by option and values entered shall be applied to the Unbilled subtab.
    ...     - 2. Step 5-The Search by option and values entered shall be applied to the Do Not Bill subtab.

   [Tags]  BLP-INSURANCE-BILLED-SEARCH-10   BP-SRS-03-FBS-03    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-SEARCH-11: The Search by option and values entered shall be applied to other tabs.
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by Device ID
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by Device ID”, observe the search bar
    ...     - 3. Enter a Device ID into the search bar
    ...     - 4. The user navigates to the Invoices tab, then goes back to the Insurance tab
    ...     - 5. The user navigates to the Support tab, then goes back to the Insurance tab
    ...     - 6. The user navigates to the Bionomix tab, then goes back to the Insurance tab
    ...
    ...     Expected Results:
    ...     - 1. Step 4-The Search by option and values entered shall be kept
    ...     - 2. Step 5-The Search by option and values entered shall be kept
    ...     - 3. Step 6-The Search by option and values entered shall be kept

   [Tags]  BLP-INSURANCE-BILLED-SEARCH-11   BP-SRS-03-FBS-03    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-SEARCH-12: The user reloading page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: When the user reloads page, the Search by option shall be set to default, value entered shall be cleared
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by Device ID”, observe the search bar
    ...     - 3. Enter a Device ID into the search bar
    ...     - 4. The user reload page
    ...
    ...     Expected Results:
    ...     - The Search by option shall be set to default, value entered shall be cleared.

   [Tags]  BLP-INSURANCE-BILLED-SEARCH-12   BP-SRS-03-FBS-03    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-MARK-01: Mark as Unbilled a study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The study shall be moved to Unbilled subtab when the user clicks on “Mark as Unbilled” button
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...     - There is at least 1 study row
    ...
    ...     Test Steps:
    ...     - 1. The user mouses over the study row
    ...     - 2. Mouse over each button
    ...     - 3. Click on “Mark as Unbilled” button
    ...
    ...     Expected Results:
    ...     - 1. There shall be two buttons displayed
    ...     - 2. Display a tooltip which is the name of that button. It can be "Mark as Unbilled" or "Mark as Do Not Bill"
    ...     - 3. The study shall be moved to Unbilled subtab

   [Tags]  BLP-INSURANCE-BILLED-MARK-01     BP-SRS-03-FBS-03    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-MARK-02: Mark as Do Not Bill a study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The study shall be moved to Do Not Billed subtab when the user clicks on “Mark as Do Not Bill” button
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...     - There is at least 1 study row
    ...
    ...     Test Steps:
    ...     - 1. The user mouses over the study row
    ...     - 2. Mouse over each button
    ...     - 3. Click on “Mark as Do Not Bill” button
    ...
    ...     Expected Results:
    ...     - 1. There shall be two buttons displayed
    ...     - 2. Display a tooltip which is the name of that button. It can be 'Mark as Unbilled" or "Mark as Do Not Bill"
    ...     - 3. The study shall be moved to Do Not Billed subtab

   [Tags]  BLP-INSURANCE-BILLED-MARK-02     BP-SRS-03-FBS-03    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-MARK-03: Check the UI component displayed the number of selected study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: When the user selects at least one study by checking the checkbox, there is UI component
    ...     dislayed number of selected study and Mark as Unbilled, Mark as Do Not Bill button
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...     - There is at least 1 study row
    ...
    ...     Test Steps:
    ...     - 1.The user selects one study by checking the checkbox
    ...     - 2.Observe the UI component appreared
    ...
    ...     Expected Results:
    ...     - 1. There shall be a UI component displayed on the top of the table
    ...     to let the user know the number of selected study
    ...     - 2. There shall be 2 buttons displayed next to the number of selected studies: Mark as Unbilled, Mark as Do Not Bill

   [Tags]  BLP-INSURANCE-BILLED-MARK-03     BP-SRS-03-FBS-03    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-MARK-04: Cancel the selection
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user cancels the selection by clicking on (x) button in the UI
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...     - There is at least 1 study is selected
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on (x) button in the UI component
    ...
    ...     Expected Results:
    ...     - The selection shall be canceled

   [Tags]  BLP-INSURANCE-BILLED-MARK-04     BP-SRS-03-FBS-03    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-MARK-05: Mark multiple studies as Unbilled
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can mark multiple studies as Unbilled by checking the checkboxes and click on "Mark as Unbilled" button
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...     - There are some study rows displayed in this subtab
    ...
    ...     Test Steps:
    ...     - 1. The user selects multiple studies by checking the checkboxes
    ...     - 2. Clicks on “Mark as Unbilled” button (which is to the right of the number of selected studies)
    ...
    ...     Expected Results:
    ...     - All selected studies shall be marked as Unbilled, displayed on Unbilled subtab

   [Tags]  BLP-INSURANCE-BILLED-MARK-05     BP-SRS-03-FBS-03    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-BILLED-MARK-06: Mark multiple studies as Do not Bill
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can mark multiple studies as Do Not Bill by checking the checkboxes and click on "Mark as Do Not Bill" button
    ...
    ...     Precondition:
    ...     - The user is on the Billed tab of Billing portal
    ...     - There are some study rows displayed in this subtab
    ...
    ...     Test Steps:
    ...     - 1. The user selects multiple studies by checking the checkboxes
    ...     - 2. Clicks on “Mark as Do Not Bill” button (which is to the right of the number of selected studies)
    ...
    ...     Expected Results:
    ...     - All selected studies shall be marked as Do Not Bill, displayed on Do Not Bill subtab

   [Tags]  BLP-INSURANCE-BILLED-MARK-06     BP-SRS-03-FBS-03    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-VIEW-02: Check icon and tooltip in the case the EOU report sent to clinic was marked as artifact
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the study’s EOU report was marked as artifact,
    ...     there shall be a tag displayed next to the Study ID and tooltip "EOU report marked as artifact"
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There is the EOU report sent to clinic marked as artifact displayed in the Do Not Bill tab (marked as Do Not Bill)
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID that its EOU report was sent to clinic and was marked as artifact
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "EOU report marked as artifact” shall be displayed

    [Tags]  BLP-INSURANCE-DONOTBILL-VIEW-02     BP-SRS-03-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-VIEW-03: Check icon and tooltip in the case the EOU report sent to clinic was dismissed
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the study’s EOU report was dismissed,
    ...     there shall be a tag displayed next to the Study ID and tooltip "EOU report dismissed"
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There is the EOU report sent to clinic and was dismissed displayed in the Do Not Bill tab(marked the study as Do Not Bill)
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID that its EOU report was sent to clinic and was dismissed
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "EOU report dismissed” shall be displayed

    [Tags]  BLP-INSURANCE-DONOTBILL-VIEW-03     BP-SRS-03-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-VIEW-04: Check icon and tooltip in the case the EOU report sent to clinic and then deteted the study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the EOU report sent to clinic and then deleted the study,
    ...     there shall be a tag displayed next to the Study ID and diplayed tooltip "Study deleted"
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There is the EOU report sent to clinic and the study was deleted, displayed in billed tab
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID that its EOU report was sent to clinic and then the study was deleted
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "Study deleted” shall be displayed

    [Tags]  BLP-INSURANCE-DONOTBILL-VIEW-04     BP-SRS-03-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-VIEW-05: Check icon and tooltip in the case the EOU report sent to clinic and then aborted the study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the EOU report sent to clinic and then aborted the study
    ...     there shall be a tag displayed next to the Study ID and diplayed tooltip "Study aborted"
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There is the EOU report sent to clinic and aborted the study,
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "Study aborted” shall be displayed

    [Tags]  BLP-INSURANCE-DONOTBILL-VIEW-05     BP-SRS-03-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-VIEW-06: When the EOU report was marked as artifact and deleted, should display deleted tooltip
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the study’s EOU report was marked as artifact and the study was deleted
    ...     The “Study deleted” tooltip shall be prioritized to be displayed
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There is the EOU report sent to clinic then marked as artifact the report and then deleted the study
    ...     - That study is displayed in Do Not Bill tab (mark as Do Not Bill)
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "Study deleted” shall be displayed

    [Tags]  BLP-INSURANCE-DONOTBILL-VIEW-06     BP-SRS-03-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-VIEW-07: When the report was marked as artifact and the study was aborted, should display aborted tooltip
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the study’s EOU report was marked as artifact and the study was aborted
    ...     The “Study aborted” tooltip shall be prioritized to be displayed
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There is the EOU report sent to clinic then marked as artifact the report and then aborted the study
    ...     - The study is displayed in Do Not Bill tab
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "Study aborted” shall be displayed

    [Tags]  BLP-INSURANCE-DONOTBILL-VIEW-07     BP-SRS-03-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-VIEW-08: When the report was dismissed and the study was aborted, should display aborted tooltip
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the study’s EOU report was dismissed and the study was aborted
    ...     The “Study aborted” tooltip shall be prioritized to be displayed
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There is the EOU report sent to clinic then dismissed the report and then aborted the study
    ...     - That study is displayed in Do Not Bill tab
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "Study aborted” shall be displayed

    [Tags]  BLP-INSURANCE-DONOTBILL-VIEW-08     BP-SRS-03-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-VIEW-09: When the report was dismissed and the study was deleted, should display deleted tooltip
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the study’s EOU report was dismissed and the study was deleted
    ...     The “Study deleted” tooltip shall be prioritized to be displayed
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There is the EOU report sent to clinic then dismissed the report and then deleted the study
    ...     - That study is displayed in the Do Not Bill tab
    ...
    ...     Test Steps:
    ...     - 1. The user observe the study ID
    ...     - 2. The user mouses over the tag
    ...
    ...     Expected Results:
    ...     - 1. There shall be a tag displayed next to the Study ID
    ...     - 2. When the user mouses over the tag, a tooltip "Study deleted” shall be displayed

    [Tags]  BLP-INSURANCE-DONOTBILL-VIEW-09     BP-SRS-03-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-VIEW-11: The facility column shall be displayed when the user selects a facility in the Facility filter
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the user selects a facility in the Facility filter, the facility column shall be displayed
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - The user works for some facilities (at least 2 facilities)
    ...
    ...     Test Steps:
    ...     - 1. The user selects a facility option in the Facility filter
    ...     - 2. Observe the table
    ...
    ...     Expected Results:
    ...     - The facility column shall not be displayed

    [Tags]  BLP-INSURANCE-DONOTBILL-VIEW-11     BP-SRS-03-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-VIEW-12: The facility column shall not be displayed when the user selects a facility in the Facility filter
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the user selects a facility in the Facility filter, the facility column shall not be displayed
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - The user works for some facilities (at least 2 facilities)
    ...
    ...     Test Steps:
    ...     - 1. The user selects a facility option in the Facility filter
    ...     - 2. Observe the table
    ...
    ...     Expected Results:
    ...     - The facility column shall not be displayed

    [Tags]  BLP-INSURANCE-DONOTBILL-VIEW-12     BP-SRS-03-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-VIEW-13: The facility column shall not be displayed when the user works for 1 facility only
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case the user works for 1 facility only, the facility column shall not be displayed
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - The user works for one facilitity only
    ...
    ...     Test Steps:
    ...     - 1. Observe the table
    ...
    ...     Expected Results:
    ...     - The facility column shall not be displayed

    [Tags]  BLP-INSURANCE-DONOTBILL-VIEW-13     BP-SRS-03-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-VIEW-14: Check the CPT code of MCT study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check The CPT code of the MCT study is 93228-93229
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There is a EOU report of the MCT study sent to clinic
    ...
    ...     Test Steps:
    ...     - 1. Observe the CPT code of MCT study
    ...
    ...     Expected Results:
    ...     - The CPT code should be 93228-93229

    [Tags]  BLP-INSURANCE-DONOTBILL-VIEW-14     BP-SRS-03-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-VIEW-15: Check the CPT code of MCT PEEK study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check The CPT code of the MCT PEEK study is 93228-93229
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There is a EOU report of the MCT PEEK study sent to clinic
    ...
    ...     Test Steps:
    ...     - 1. Observe the CPT code of MCT PEEK study
    ...
    ...     Expected Results:
    ...     - The CPT code should be 93228-93229

    [Tags]  BLP-INSURANCE-DONOTBILL-VIEW-15     BP-SRS-03-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-VIEW-16: Check the CPT code of CARDIAC EVENT study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check The CPT code of the CARDIAC EVENT study is 93268-93272
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There is a EOU report of the CARDIAC EVENT study sent to clinic
    ...
    ...     Test Steps:
    ...     - 1. Observe the CPT code of CARDIAC EVENT study
    ...
    ...     Expected Results:
    ...     - The CPT code should be 93268-93272

    [Tags]  BLP-INSURANCE-DONOTBILL-VIEW-16     BP-SRS-03-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-VIEW-17: Check the CPT code of HOLTER study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check The CPT code of the HOLTER study is 93224-93227
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There is a EOU report of the HOLTER study sent to clinic
    ...
    ...     Test Steps:
    ...     - 1. Observe the CPT code of HOLTER study
    ...
    ...     Expected Results:
    ...     - The CPT code should be 93224-93227

    [Tags]  BLP-INSURANCE-DONOTBILL-VIEW-17     BP-SRS-03-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-VIEW-18: Check the CPT code of EXTENDED HOLTER study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check The CPT code of the EXTENDED HOLTER study is 93241-93247
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There is a EOU report of the EXTENDED HOLTER study sent to clinic
    ...
    ...     Test Steps:
    ...     - 1. Observe the CPT code of EXTENDED HOLTER study
    ...
    ...     Expected Results:
    ...     - The CPT code should be 93241-93247

    [Tags]  BLP-INSURANCE-DONOTBILL-VIEW-18     BP-SRS-03-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-VIEW-19: Expand the study infomation section and check the information
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Expand the study infomation section and check the study information
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There is some study rows displayed in billed tab
    ...
    ...     Test Steps:
    ...     - 1. Click on the Expand button of a study row
    ...     - 2. Observe the information of the study in the expanding section
    ...
    ...     Expected Results:
    ...     - 1. A study row shall be expanded, and the user shall be able to view the information of a study
    ...     - 2. The study information:
    ...     - a. Patient Information:
    ...     - Patient ID
    ...     - DOB
    ...     - Gender
    ...     - Address
    ...     - Primiry Phone number
    ...     - Referring physician
    ...     - Interpreting physician
    ...     - Insurance
    ...     - Provider
    ...     - b. Study information
    ...     - Start date
    ...     - End date
    ...     - Primary Diagnosis Code
    ...     - Secondary Diagnosis Code

    [Tags]  BLP-INSURANCE-DONOTBILL-VIEW-19     BP-SRS-03-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-VIEW-20: Collapse the study infomation section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Collapse the study infomation section
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There is expanding study row
    ...
    ...     Test Steps:
    ...     - 1. Click on the Expand button
    ...
    ...     Expected Results:
    ...     - The expanding section shall be collapsed

    [Tags]  BLP-INSURANCE-DONOTBILL-VIEW-20     BP-SRS-03-FBS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-VIEW-21: Expand all the study infomation sections
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Expand all the study infomation sections by clicking on the Expand button of all studies
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There is some study rows displayed in billed tab
    ...
    ...     Test Steps:
    ...     - 1. Click on the Expand button for all studies (The arrow button is on the header of the table)
    ...
    ...     Expected Results:
    ...     - All rows in a page shall be expanded, and the user shall be able to view the information of all studies

   [Tags]  BLP-INSURANCE-DONOTBILL-VIEW-21      BP-SRS-03-FBS-04    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-VIEW-22: Check the order of the billed study list and switch the sorting order between ascending and descending
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the order of the billed study list
    ...     and switch the sorting order between ascending and descending
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There is some study rows displayed in Unbilled tab
    ...
    ...     Test Steps:
    ...     - 1. Observe the order of the list
    ...     - 2. The user selects the sort button next to study ID again
    ...
    ...     Expected Results:
    ...     - 1. The list is sorted by Study ID in descending order
    ...     - 2. The deleted study shall be displayed at the end of the list
    ...     - 3. The study list will switch the sorting order between ascending and descending of the respective attributes.

   [Tags]  BLP-INSURANCE-DONOTBILL-VIEW-22      BP-SRS-03-FBS-04    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-VIEW-23: Pagination check
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can navigate to the desired page by clicking on the page number or ">,<" button
    ...     and can also choose the number of rows displayed in 1 page
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There is at least 51 study rows displayed in billed tab
    ...
    ...     Test Steps:
    ...     - 1. Observe the pagination, click on > button
    ...     - 2. The user clicks on < button
    ...     - 3. The user clicks on page numbe
    ...     - 4. Click on the pagination drop-down, observe the list
    ...     - 5. The user selects “10 rows” from the drop-down box
    ...     - 6. The user selects “30 rows” from the drop-down box
    ...     - 7. The user selects “50 rows” from the drop-down box
    ...
    ...     Expected Results:
    ...     - 1. The user shall be navigated to the next page
    ...     - 2. The user shall be navigated to the previous page
    ...     - 3. The user shall be navigated to the chosen page
    ...     - 4. A list number of studies “10 rows, 30 rows, 50 rows” shall be displayed
    ...     - 5. The list with 10 studies shall be displayed on 1 page
    ...     - 6. The list with 30 studies shall be displayed on 1 page
    ...     - 7. The list with 50 studies shall be displayed on 1 page

   [Tags]  BLP-INSURANCE-DONOTBILL-VIEW-23      BP-SRS-03-FBS-04    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-SEARCH-01: Search by study ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by study ID
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by study ID”, observe the search bar
    ...     - 3. Enter a study ID into the search bar
    ...
    ...     Expected Results:
    ...     - 1. There shall be a drop-down list displayed,
    ...     - Search by Study ID
    ...     - Search by Patient name
    ...     - Search by Device ID
    ...     - 2. The placeholder shall be “Search by study ID”
    ...     - 3. The list shall be filtered and displayed accordingly with the study ID entered.

   [Tags]  BLP-INSURANCE-DONOTBILL-SEARCH-01     BP-SRS-03-FBS-04    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-SEARCH-02: The Search by option and values entered shall be applied to other subtabs.
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by study ID
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by study ID”, observe the search bar
    ...     - 3. Enter a study ID into the search bar
    ...     - 4. The user navigates to the Unbilled subtab
    ...     - 5. The user navigates to the Billed subtab
    ...
    ...     Expected Results:
    ...     - 1. Step 4-The Search by option and values entered shall be applied to the Unbilled subtab.
    ...     - 2. Step 5-The Search by option and values entered shall be applied to the Billed subtab.

   [Tags]  BLP-INSURANCE-DONOTBILL-SEARCH-02    BP-SRS-03-FBS-04    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-SEARCH-03: The Search by option and values entered shall be applied to other tabs.
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by study ID
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on the Search option button
    ...     - 2. The user selects “Search by study ID”, observe the search bar
    ...     - 3. Enter a study ID into the search bar
    ...     - 4. The user navigates to the Invoices tab, then goes back to the Insurance tab
    ...     - 5. The user navigates to the Support tab, then goes back to the Insurance tab
    ...     - 6. The user navigates to the Bionomix tab, then goes back to the Insurance tab
    ...
    ...     Expected Results:
    ...     - 1. Step 4-The Search by option and values entered shall be kept
    ...     - 2. Step 5-The Search by option and values entered shall be kept
    ...     - 3. Step 6-The Search by option and values entered shall be kept

   [Tags]  BLP-INSURANCE-DONOTBILL-SEARCH-03    BP-SRS-03-FBS-04    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-SEARCH-04: The user reloading page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: When the user reloads page, the Search by option shall be set to default, value entered shall be cleared
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on the Search option button
    ...     - 2. The user selects “Search by study ID”, observe the search bar
    ...     - 3. Enter a study ID into the search bar
    ...     - 4. The user reload page
    ...
    ...     Expected Results:
    ...     - The Search by option shall be set to default, value entered shall be cleared.

   [Tags]  BLP-INSURANCE-DONOTBILL-SEARCH-04    BP-SRS-03-FBS-04    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-SEARCH-05: Search by Patient Name
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by Patient Name
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by Patient Name”, observe the search bar
    ...     - 3. Enter a patient name into the search bar
    ...
    ...     Expected Results:
    ...     - 1. There shall be a drop-down list displayed,
    ...     - Search by Study ID
    ...     - Search by Patient name
    ...     - Search by Device ID
    ...     - 2. The placeholder shall be “Search by Patient Name”
    ...     - 3. The list shall be filtered and displayed accordingly with the Patient Name entered.

   [Tags]  BLP-INSURANCE-DONOTBILL-SEARCH-05    BP-SRS-03-FBS-04    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-SEARCH-06: The Search by option and values entered shall be applied to other subtabs.
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by Patient Name
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on the Search option button
    ...     - 2. The user selects “Search by Patient Name", observe the search bar
    ...     - 3. Enter a Patient Name into the search bar
    ...     - 4. The user navigates to the Unbilled subtab
    ...     - 5. The user navigates to the Billed subtab
    ...
    ...     Expected Results:
    ...     - 1. Step 4-The Search by option and values entered shall be applied to the Unbilled subtab.
    ...     - 2. Step 5-The Search by option and values entered shall be applied to the Billed subtab.

   [Tags]  BLP-INSURANCE-DONOTBILL-SEARCH-06    BP-SRS-03-FBS-04    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-SEARCH-07: The Search by option and values entered shall be applied to other tabs.
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by study ID
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on the Search option button
    ...     - 2. The user selects “Search by Patient Name”, observe the search bar
    ...     - 3. Enter a patient name into the search bar
    ...     - 4. The user navigates to the Invoices tab, then goes back to the Insurance tab
    ...     - 5. The user navigates to the Support tab, then goes back to the Insurance tab
    ...
    ...     Expected Results:
    ...     - 1. Step 4-The Search by option and values entered shall be kept
    ...     - 2. Step 5-The Search by option and values entered shall be kept

   [Tags]  BLP-INSURANCE-DONOTBILL-SEARCH-07    BP-SRS-03-FBS-04    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-SEARCH-08: The user reloading page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: When the user reloads page, the Search by option shall be set to default, value entered shall be cleared
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on the Search option button
    ...     - 2. The user selects “Search by Patient Name”, observe the search bar
    ...     - 3. Enter a patient name into the search bar
    ...     - 4. The user reload page
    ...
    ...     Expected Results:
    ...     - The Search by option shall be set to default, value entered shall be cleared.

   [Tags]  BLP-INSURANCE-DONOTBILL-SEARCH-08    BP-SRS-03-FBS-04    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-SEARCH-09: Search by Device ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by Device ID
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by Device ID”, observe the search bar
    ...     - 3. Enter a Device ID into the search bar
    ...
    ...     Expected Results:
    ...     - 1. There shall be a drop-down list displayed,
    ...     - Search by Study ID
    ...     - Search by Patient name
    ...     - Search by Device ID
    ...     - 2. The placeholder shall be “Search by Device ID”
    ...     - 3. The list shall be filtered and displayed accordingly with the Device ID entered.

   [Tags]  BLP-INSURANCE-DONOTBILL-SEARCH-09    BP-SRS-03-FBS-04    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-SEARCH-10: The Search by option and values entered shall be applied to other subtabs.
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by Device ID
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on the Search option button
    ...     - 2. The user selects “Search by Device ID”, observe the search bar
    ...     - 3. Enter a Device ID into the search bar
    ...     - 4. The user navigates to the Unbilled subtab
    ...     - 5. The user navigates to the Do Not Bill subtab
    ...
    ...     Expected Results:
    ...     - 1. Step 4-The Search by option and values entered shall be applied to the Unbilled subtab.
    ...     - 2. Step 5-The Search by option and values entered shall be applied to the Billed subtab.

   [Tags]  BLP-INSURANCE-DONOTBILL-SEARCH-10    BP-SRS-03-FBS-04    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-SEARCH-11: The Search by option and values entered shall be applied to other tabs.
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user searchs by Device ID
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the Search option button
    ...     - 2. The user selects “Search by Device ID”, observe the search bar
    ...     - 3. Enter a Device ID into the search bar
    ...     - 4. The user navigates to the Invoices tab, then goes back to the Insurance tab
    ...     - 5. The user navigates to the Support tab, then goes back to the Insurance tab
    ...
    ...     Expected Results:
    ...     - 1. Step 4-The Search by option and values entered shall be kept
    ...     - 2. Step 5-The Search by option and values entered shall be kept

   [Tags]  BLP-INSURANCE-DONOTBILL-SEARCH-11    BP-SRS-03-FBS-04    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-SEARCH-12: The user reloading page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: When the user reloads page, the Search by option shall be set to default, value entered shall be cleared
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on the Search option button
    ...     - 2. The user selects “Search by Device ID”, observe the search bar
    ...     - 3. Enter a Device ID into the search bar
    ...     - 4. The user reload page
    ...
    ...     Expected Results:
    ...     - The Search by option shall be set to default, value entered shall be cleared.

   [Tags]  BLP-INSURANCE-DONOTBILL-SEARCH-12    BP-SRS-03-FBS-04    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-MARK-01: Mark as Unbilled a study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The study shall be moved to Unbilled subtab when the user clicks on “Mark as Unbilled” button
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There is at least 1 study row
    ...
    ...     Test Steps:
    ...     - 1. The user mouses over the study row
    ...     - 2. Mouse over each button
    ...     - 3. Click on “Mark as Unbilled” button
    ...
    ...     Expected Results:
    ...     - 1. There shall be two buttons displayed
    ...     - 2. Display a tooltip which is the name of that button. It can be "Mark as Unbilled" or "Mark as Billed"
    ...     - 3. The study shall be moved to Unbilled subtab

   [Tags]  BLP-INSURANCE-DONOTBILL-MARK-01      BP-SRS-03-FBS-04    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-MARK-02: Mark as Billed a study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The study shall be moved to Billed subtab when the user clicks on “Mark as Billed” button
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There is at least 1 study row
    ...
    ...     Test Steps:
    ...     - 1. The user mouses over the study row
    ...     - 2. Mouse over each button
    ...     - 3. Click on “Mark as Billed” button
    ...
    ...     Expected Results:
    ...     - 1. There shall be two buttons displayed
    ...     - 2. Display a tooltip which is the name of that button. It can be 'Mark as Unbilled" or "Mark as Billed"
    ...     - 3. The study shall be moved to Billed subtab

   [Tags]  BLP-INSURANCE-DONOTBILL-MARK-02      BP-SRS-03-FBS-04    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-MARK-03: Check the UI component displayed the number of selected study
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: When the user selects at least one study by checking the checkbox, there is UI component
    ...     dislayed number of selected study and Mark as Unbilled, Mark as Billed button
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There is at least 1 study row
    ...
    ...     Test Steps:
    ...     - 1. The user selects one study by checking the checkbox
    ...     - 2. Observe the UI component appreared
    ...
    ...     Expected Results:
    ...     - 1. There shall be a UI component displayed on the top of the table
    ...     to let the user know the number of selected study
    ...     - 2. There shall be 2 buttons displayed next to the number of selected studies: Mark as Unbilled, Mark as Billed

   [Tags]  BLP-INSURANCE-DONOTBILL-MARK-03      BP-SRS-03-FBS-04    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-MARK-04: Cancel the selection
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user cancels the selection by clicking on (x) button in the UI
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There is at least 1 study is selected
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on (x) button in the UI component
    ...
    ...     Expected Results:
    ...     - The selection shall be canceled

   [Tags]  BLP-INSURANCE-DONOTBILL-MARK-04      BP-SRS-03-FBS-04    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-MARK-05: Mark multiple studies as Unbilled
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can mark multiple studies as Unbilled by checking the checkboxes and click on "Mark as Unbilled" button
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There are some study rows displayed in this subtab
    ...
    ...     Test Steps:
    ...     - 1. The user selects multiple studies by checking the checkboxes
    ...     - 2. Clicks on “Mark as Unbilled” button (which is to the right of the number of selected studies)
    ...
    ...     Expected Results:
    ...     - All selected studies shall be marked as Unbilled, displayed on Unbilled subtab

   [Tags]  BLP-INSURANCE-DONOTBILL-MARK-05      BP-SRS-03-FBS-04    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INSURANCE-DONOTBILL-MARK-06: Mark multiple studies as Billed
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can mark multiple studies as Billed by checking the checkboxes and click on "Mark as Billed" button
    ...
    ...     Precondition:
    ...     - The user is on the Do Not Bill tab of Billing portal
    ...     - There are some study rows displayed in this subtab
    ...
    ...     Test Steps:
    ...     - 1. The user selects multiple studies by checking the checkboxes
    ...     - 2. Clicks on “Mark as Do Not Bill” button (which is to the right of the number of selected studies)
    ...
    ...     Expected Results:
    ...     - All selected studies shall be marked as Billed, displayed on Billed subtab

   [Tags]  BLP-INSURANCE-DONOTBILL-MARK-06      BP-SRS-03-FBS-04    manual
   Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_billing_portal/lib/web/Common.py      ${BROWSER_NODE}      ${ENV}
    ${VERSION}           Navigate To Sign In Page
    Set Suite Metadata    browser       ${BROWSER.capitalize()}
    Set Suite Metadata    version       ${VERSION}

SUITE TEARDOWN
    Quit Browser
