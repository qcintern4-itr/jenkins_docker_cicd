*** Settings ***
Documentation   Cardiac Patients - Patient details > medical records page test suite
Metadata    sid     BCP-PHY-PTDET-MEDICAL-RECORDS
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-PHY-PTDET-MEDICAL-RECORDS       web
Test Timeout    1h

*** Test Cases ***
BCP-PHY-PTDET-MEDICAL-RECORDS-01: Add general cardiac history
    [Documentation]    Author: Hoang Le
    ...
    ...  Test Steps:
    ...  1. Select yes/no for cardioversion questions
    ...  2. Select yes/no for electrical shock treatments questions
    ...  3. Add current symptoms
    ...  4. Add past medical history
    ...  5. Add medication(s)
    ...  6. Select yes/no for hospitalization questions
    ...  7. Click Add button
    ...  Expected results:
    ...  - The info shall be saved and displayed on Initial intake info section
    ...  - Past medical history shall be synced to Diagnosed conditions section from Baseline info for the first time only
    ...  - Added medication(s) shall be synced to Active medications from Care plan for the first time only
    [Tags]    BCP-PHY-PTDET-MEDICAL-RECORDS-01    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTDET-MEDICAL-RECORDS-02: Add conditions being monitored
    [Documentation]    Author: Hoang Le
    ...
    ...  Test Steps:
    ...  1. Search and select condition(s) for diagnosed conditions
    ...  2. Search and select condition(s) for at-risk conditions
    ...  3. Click Add
    ...  Expected results:
    ...  - The data shall be saved and displayed on Conditions info
    ...  - The data shall be synced to Diagnosed conditions list from Baseline
    [Tags]    BCP-PHY-PTDET-MEDICAL-RECORDS-02    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTDET-MEDICAL-RECORDS-03: Add conditions being monitored synced from Baseline
    [Documentation]    Author: Hoang Le
    ...
    ...  Test Steps:
    ...  1. Search and select condition(s) sycned from Baseline for diagnosed conditions
    ...  2. Search and select condition(s) sycned from Baseline for at-risk conditions
    ...  3. Click Add
    ...  Expected results:
    ...  - The data shall be saved and displayed on Conditions info
    ...  - Any updates in this section shall be sycned back to Baseline info
    [Tags]    BCP-PHY-PTDET-MEDICAL-RECORDS-03    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTDET-MEDICAL-RECORDS-04: Check Add new medication manually
    [Documentation]    Author: Bao Van
    ...
    ...  Test Steps:
    ...  1. Login portal > Select patient details
    ...  2. Select the Medical records tab > Select Medications
    ...  3. Add Quantity medication = 0.3, 0.7 > Click Save
    ...  Expected results:
    ...  - Saved successfully, automatically rounding them to the nearest 0.5 increment for accurate dosage.
    [Tags]    BCP-PHY-PTDET-MEDICAL-RECORDS-04    manual      BCCA-2.28.0    R1
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTDET-MEDICAL-RECORDS-05: Check Add new medication manually
    [Documentation]    Author: Bao Van
    ...
    ...  Test Steps:
    ...  1. Login portal > Select patient details
    ...  2. Select the Medical records tab > Select Medications
    ...  3. Add Quantity medication = 0.3, 0.7 > Click Save
    ...  Expected results:
    ...  - Saved successfully, automatically rounding them to the nearest 0.5 increment for accurate dosage.
    [Tags]    BCP-PHY-PTDET-MEDICAL-RECORDS-05    manual      BCCA-2.28.0    R1
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTDET-MEDICAL-RECORDS-06: Check Add new medication manually
    [Documentation]    Author: Bao Van
    ...
    ...  Test Steps:
    ...  1. Login portal > Select patient details
    ...  2. Select the Medical records tab > Select Medications
    ...  3. Edit Quantity medication from 0.5 to 0.8 > Click Save
    ...  Expected results:
    ...  Successfully saved, the system automatically changes to 1
    [Tags]    BCP-PHY-PTDET-MEDICAL-RECORDS-06    manual      BCCA-2.28.0    R1
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTDET-MEDICAL-RECORDS-07: Perform import list medication
    [Documentation]    Author: Bao Van
    ...
    ...  Test Steps:
    ...  1. Login portal > Select menu Patients
    ...  2. Select the Medical records tab > Select Medications
    ...  3. Click the Add medications button > Select the Bulk import button
    ...  4. Click on the textlink "download the template file here"
    ...  5. Perform import list medication properly and validate
    ...  6. Click Cancel
    ...  7. Click Save
    ...  Expected results:
    ...  3. Displays the data import screen
    ...  4. The export template system is available on the portal
    ...  5. Import successful, enable 2 buttons Save and Cancel
    ...  6. Do not save medication information above
    ...  7. Successfully saved the above medication list
    [Tags]    BCP-PHY-PTDET-MEDICAL-RECORDS-07    manual      BCCA-2.28.0    R1
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTDET-MEDICAL-RECORDS-08: Check validate data import medication
    [Documentation]    Author: Bao Van
    ...
    ...  Test Steps:
    ...  1. Login portal > Select menu Patients
    ...  2. Select the Medical Records tab > Select medications
    ...  3. Click the Add medications button > Select the Bulk import button
    ...  4. Import files other than .csv or .xlsx format
    ...  5. Perform an import of files with data greater than 100 medications
    ...  6. Perform an empty data import
    ...  7. If the information of each imported medication is invalid (Missing required field, wrong format,...) => The medication shall be highlighted, requiring the user to correct it.

    ...  Expected results:
    ...  4. the system reports an error. Message shall be displayed: “This file type is not supported.”
    ...  5. system error, message shall be displayed: “The selected file exceeds 100 medications.”
    ...  6. In case the file is empty, an error message shall also be displayed: “This file type is not supported.”
    ...  7. If the user imports a new file during this reviewing process, that new file will replace the current one.
    [Tags]    BCP-PHY-PTDET-MEDICAL-RECORDS-08    manual      BCCA-2.28.0    R1
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
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
