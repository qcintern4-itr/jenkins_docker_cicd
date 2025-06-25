*** Settings ***
Documentation   Cardiac Billing page test suite
Metadata    sid     BCP-PHY-BILLING
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/Billing.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-PHY-BILLING       web
Test Timeout    1h

*** Test Cases ***
BCP-PHY-BILLING-01: Add diagnosis with the valid Condition
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page of a specific program
    ...   2.Click Medical records tab
    ...   3.Click Add diagnosis button
    ...   4.Input a valid Condition on the Diagnosis side tab
    ...   5.Fill all the required fields
    ...   6.Click Add button
    ...   Expected result:
    ...   The diagnosis shall be added successfully on the Medical records tab
    ...   The Condition shall be displayed on Condition info.
    [Tags]    BCP-PHY-BILLING-01     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-02: Add diagnosis with the invalid Condition
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page of a specific program
    ...   2.Click Medical records tab
    ...   3.Click Add diagnosis button
    ...   4.Input a invalid Condition on the Diagnosis side tab
    ...   5.Fill all the required fields
    ...   6.Click Add button
    ...   Expected result:
    ...   The diagnosis shall be added successfully on the Medical records tab
    ...   The Condition shall be displayed on Condition info.
    [Tags]    BCP-PHY-BILLING-02     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-03: Add diagnosis with the custom Condition
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page of a specific program
    ...   2.Click Medical records tab
    ...   3.Click Add diagnosis button
    ...   4.Input a custom Condition on the Diagnosis side tab
    ...   5.Fill all the required fields
    ...   6.Click Add button
    ...   Expected result:
    ...   The diagnosis shall be added successfully on the Medical records tab
    ...   The Condition shall be displayed on Condition info.
    [Tags]    BCP-PHY-BILLING-03     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-04: Add diagnosis with the valid diagnosis code
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page of a specific program
    ...   2.Click Medical records tab
    ...   3.Click Add diagnosis button
    ...   4.Input a Condition on the Diagnosis side tab
    ...   5.Input a valid diagnosis code
    ...   6.Fill all the required fields
    ...   7.Click Add button
    ...   Expected result:
    ...   The diagnosis shall be added successfully on the Medical records tab
    ...   The diagnosis code shall be displayed on diagnosis code info.
    [Tags]    BCP-PHY-BILLING-04     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-05: Add diagnosis with no diagnosis code
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page of a specific program
    ...   2.Click Medical records tab
    ...   3.Click Add diagnosis button
    ...   4.Input a Condition on the Diagnosis side tab
    ...   5.Let the diagnosis code field empty
    ...   6.Fill all the required fields
    ...   7.Click Add button
    ...   Expected result:
    ...   The diagnosis shall be added successfully on the Medical records tab
    ...   The diagnosis code info shall be empty.
    [Tags]    BCP-PHY-BILLING-05     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-06: CCM or CCM & RPM - Add diagnosis with CCM service
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page of a specific program
    ...   2.Click Medical records tab
    ...   3.Click Add diagnosis button
    ...   4.Input a Condition on the Diagnosis side tab
    ...   5.Tick the CCM service check box
    ...   6.Fill all the required fields
    ...   7.Click Add button
    ...   Expected result:
    ...   The diagnosis shall be added successfully on the Medical records tab
    ...   The diagnosis shall be displayed on the CCM section.
    [Tags]    BCP-PHY-BILLING-06     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-07: RPM or CCM & RPM - Add diagnosis with RPM service
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page of a specific program
    ...   2.Click Medical records tab
    ...   3.Click Add diagnosis button
    ...   4.Input a Condition on the Diagnosis side tab
    ...   5.Tick the RPM service check box
    ...   6.Fill all the required fields
    ...   7.Click Add button
    ...   Expected result:
    ...   The diagnosis shall be added successfully on the Medical records tab
    ...   The diagnosis shall be displayed on the RPM section.
    [Tags]    BCP-PHY-BILLING-07     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-08: CCM & RPM - Add diagnosis with CCM & RPM service
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page of a specific program
    ...   2.Click Medical records tab
    ...   3.Click Add diagnosis button
    ...   4.Input a Condition on the Diagnosis side tab
    ...   5.Tick the CCM & RPM service check boxes
    ...   6.Fill all the required fields
    ...   7.Click Add button
    ...   Expected result:
    ...   The diagnosis shall be added successfully on the Medical records tab
    ...   The diagnosis shall be displayed on the CCM & RPM section.
    [Tags]    BCP-PHY-BILLING-08     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-09: All plan types - Add diagnosis with associated medication
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page of a specific program
    ...   2.Click Medical records tab
    ...   3.Click Add diagnosis button
    ...   4.Input a Condition on the Diagnosis side tab
    ...   5.Select associated medication from the dropdown list
    ...   6.Fill all the required fields
    ...   7.Click Add button
    ...   Expected result:
    ...   The diagnosis shall be added successfully on the Medical records tab
    ...   The medication shall be displayed on the associated medication info.
    [Tags]    BCP-PHY-BILLING-09     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-10: All plan types - Add diagnosis with NO associated medication
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page of a specific program
    ...   2.Click Medical records tab
    ...   3.Click Add diagnosis button
    ...   4.Input a Condition on the Diagnosis side tab
    ...   5.Select associated medication from the dropdown list
    ...   6.Fill all the required fields
    ...   7.Click Add button
    ...   Expected result:
    ...   The diagnosis shall be added successfully on the Medical records tab
    ...   The associated medication info shall be empty.
    [Tags]    BCP-PHY-BILLING-10     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-11: All plan types - Save and add another diagnosis
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page of a specific program
    ...   2.Click Medical records tab
    ...   3.Click Add diagnosis button
    ...   4.Input a Condition on the Diagnosis side tab
    ...   5.Fill all the required fields
    ...   6.Click Add button
    ...   Expected result:
    ...   The diagnosis shall be added successfully on the Medical records tab
    ...   The add diagnosis side tab shall be cleared out for another input.
    [Tags]    BCP-PHY-BILLING-11     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-12: All plan types - Add diagnosis with the At-risk tag
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page of a specific program
    ...   2.Click Medical records tab
    ...   3.Click Add diagnosis button
    ...   4.Input a Condition on the Diagnosis side tab
    ...   5.Fill all the required fields
    ...   6.Tick the At-risk check box
    ...   7.Click Add button
    ...   Expected result:
    ...   The diagnosis shall be added successfully on the Medical records tab with the At-risk tag.
    [Tags]    BCP-PHY-BILLING-12     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-13: All plan types - Add diagnosis with the Monitored status
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page of a specific program
    ...   2.Click Medical records tab
    ...   3.Click Add diagnosis button
    ...   4.Input a Condition on the Diagnosis side tab
    ...   5.Fill all the required fields
    ...   6.Tick the Monitored radio button
    ...   7.Click Add button
    ...   Expected result:
    ...   The diagnosis shall be added successfully on the Medical records tab
    ...   The diagnosis shall be displayed on the Monitored sub-tab.
    [Tags]    BCP-PHY-BILLING-13     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-14: All plan types - Add diagnosis with the Historical status
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page of a specific program
    ...   2.Click Medical records tab
    ...   3.Click Add diagnosis button
    ...   4.Input a Condition on the Diagnosis side tab
    ...   5.Fill all the required fields
    ...   6.Tick the Historical radio button
    ...   7.Click Add button
    ...   Expected result:
    ...   The diagnosis shall be added successfully on the Medical records tab
    ...   The diagnosis shall be displayed on the Historical sub-tab.
    [Tags]    BCP-PHY-BILLING-14     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-15: All plan types - Add diagnosis with the Monitored and Historical tab
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page of a specific program
    ...   2.Click Medical records tab
    ...   3.Click Add diagnosis button
    ...   4.Input a Condition on the Diagnosis side tab
    ...   5.Fill all the required fields
    ...   6.Tick the Both radio button
    ...   7.Click Add button
    ...   Expected result:
    ...   The diagnosis shall be added successfully on the Medical records tab
    ...   The diagnosis shall be displayed on the Monitored and Historical sub-tab.
    [Tags]    BCP-PHY-BILLING-15     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-16: Edit diagnosis's Condition
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page of a specific program
    ...   2.Click Medical records tab
    ...   3.Click Edit button on a diagnosis
    ...   4.Edit Condition to another one
    ...   5.Click Save button on a side tab
    ...   Expected result:
    ...   The Condition info shall be updated successfully.
    [Tags]    BCP-PHY-BILLING-16     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-17: Edit diagnosis code
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page of a specific program
    ...   2.Click Medical records tab
    ...   3.Click Edit button on a diagnosis
    ...   4.Edit diagnosis code to another one
    ...   5.Click Save button on a side tab
    ...   Expected result:
    ...   The diagnosis code info shall be updated successfully.
    [Tags]    BCP-PHY-BILLING-17     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-18: Remove diagnosis code of a Condition
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page of a specific program
    ...   2.Click Medical records tab
    ...   3.Click Edit button on a diagnosis
    ...   4.Remove a diagnosis code
    ...   5.Click Save button on a side tab
    ...   Expected result:
    ...   The diagnosis code info shall be removed successfully.
    [Tags]    BCP-PHY-BILLING-18     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-19: Edit service of a diagnosis
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page of a specific program
    ...   2.Click Medical records tab
    ...   3.Click Edit button on a diagnosis
    ...   4.Change the service type (CCM/RPM/both)
    ...   5.Click Save button on a side tab
    ...   Expected result:
    ...   The service type shall be updated successfully as user input.
    [Tags]    BCP-PHY-BILLING-19     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-20: Edit associated medication of a diagnosis
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page of a specific program
    ...   2.Click Medical records tab
    ...   3.Click Edit button on a diagnosis
    ...   4.Update the associated medication
    ...   5.Click Save button on a side tab
    ...   Expected result:
    ...   The associated medication shall be updated successfully as user input.
    [Tags]    BCP-PHY-BILLING-20     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-21: Remove associated medication of a diagnosis
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page of a specific program
    ...   2.Click Medical records tab
    ...   3.Click Edit button on a diagnosis
    ...   4.Remove associated medication
    ...   5.Click Save button on a side tab
    ...   Expected result:
    ...   The associated medication shall be removed successfully.
    [Tags]    BCP-PHY-BILLING-21     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-22: Edit status of a diagnosis
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page of a specific program
    ...   2.Click Medical records tab
    ...   3.Click Edit button on a diagnosis
    ...   4.Change the status (Monitored/Historical/both)
    ...   5.Click Save button on a side tab
    ...   Expected result:
    ...   The status shall be updated successfully as user input.
    [Tags]    BCP-PHY-BILLING-22     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-23: Add a CCM diagnosis code with Monitor status on Billing - In progress tab
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click Edit button on a specific Claim
    ...   3.Add a CCM diagnosis code with the Monitored status
    ...   Expected result:
    ...   The code shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-23     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-24: Add a CCM diagnosis code with Historical status on Billing - In progress tab
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click Edit button on a specific Claim
    ...   3.Add a CCM diagnosis code with the Historical status
    ...   Expected result:
    ...   The code shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-24     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-25: Add 2 CCM diagnosis codes with Monitored status on Billing - In progress tab
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click Edit button on a specific Claim
    ...   3.Add 2 CCM diagnosis codes with the Monitored status
    ...   Expected result:
    ...   The codes shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-25     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-26: Add 2 CCM diagnosis codes with Historical status on Billing - In progress tab
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click Edit button on a specific Claim
    ...   3.Add 2 CCM diagnosis codes with the Historical status
    ...   Expected result:
    ...   The codes shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-26     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-27: Add 2 CCM diagnosis codes with Monitored and Historical statuses on Billing - In progress tab
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click Edit button on a specific Claim
    ...   3.Add 2 CCM diagnosis codes with the Monitored and Historical statuses
    ...   Expected result:
    ...   The codes shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-27     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-28: Add more than 2 CCM diagnosis codes for a Claim on Billing - In progress tab
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click Edit button on a specific Claim
    ...   3.Add more than 2 CCM diagnosis codes for a Claim
    ...   Expected result:
    ...   The codes shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-28     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-29: Add a RPM diagnosis code with Monitored status on Billing - In progress tab
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click Edit button on a specific Claim
    ...   3.Add a RPM diagnosis code with the Monitored status
    ...   Expected result:
    ...   The code shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-29     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-30: Add a RPM diagnosis code with Historical status on Billing - In progress tab
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click Edit button on a specific Claim
    ...   3.Add a RPM diagnosis code with the Historical status
    ...   Expected result:
    ...   The code shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-30     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-31: Add 2 RPM diagnosis codes with Monitored status on Billing - In progress tab
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click Edit button on a specific Claim
    ...   3.Add 2 RPM diagnosis codes with Monitored status
    ...   Expected result:
    ...   The code shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-31     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-32: Add 2 RPM diagnosis codes with Historical status on Billing - In progress tab
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click Edit button on a specific Claim
    ...   3.Add 2 RPM diagnosis codes with Historical status
    ...   Expected result:
    ...   The code shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-32     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-33: Add 2 RPM diagnosis codes with Monitored and Historical statuses on Billing - In progress tab
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click Edit button on a specific Claim
    ...   3.Add 2 RPM diagnosis codes with Monitored and Historical statuses
    ...   Expected result:
    ...   The code shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-33     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-34: Add a CCM diagnosis code on Billing - Ready for biller
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Ready for biller tab
    ...   2.Click Edit button on a specific Claim
    ...   3.Add a CCM diagnosis code for a Claim
    ...   Expected result:
    ...   The code shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-34     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-BILLING-35: Add 2 CCM diagnosis codes on Billing - Ready for biller
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Ready for biller tab
    ...   2.Click Edit button on a specific Claim
    ...   3.Add 2 CCM diagnosis codes for a Claim
    ...   Expected result:
    ...   The codes shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-35     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-BILLING-36: Add more than 2 CCM diagnosis codes on Billing - Ready for biller
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Ready for biller tab
    ...   2.Click Edit button on a specific Claim
    ...   3.Add more than 2 CCM diagnosis codes for a Claim
    ...   Expected result:
    ...   The codes shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-36     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-BILLING-37: Add a RPM diagnosis code on Billing - Ready for biller
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Ready for biller tab
    ...   2.Click Edit button on a specific Claim
    ...   3.Add a RPM diagnosis code for a Claim
    ...   Expected result:
    ...   The code shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-37     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-BILLING-38: Add 2 RPM diagnosis codes on Billing - Ready for biller
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Ready for biller tab
    ...   2.Click Edit button on a specific Claim
    ...   3.Add 2 RPM diagnosis codes for a Claim
    ...   Expected result:
    ...   The codes shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-38     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-BILLING-39: Add a CCM diagnosis code on Billing - Completed
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Completed tab
    ...   2.Click Edit button on a specific Claim
    ...   3.Add a CCM diagnosis code for a Claim
    ...   Expected result:
    ...   The code shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-39     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-BILLING-40: Add 2 CCM diagnosis codes on Billing - Completed
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Completed tab
    ...   2.Click Edit button on a specific Claim
    ...   3.Add 2 CCM diagnosis codes for a Claim
    ...   Expected result:
    ...   The codes shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-40     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-BILLING-41: Add more than 2 CCM diagnosis codes on Billing - Completed
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Completed tab
    ...   2.Click Edit button on a specific Claim
    ...   3.Add more than 2 CCM diagnosis codes for a Claim
    ...   Expected result:
    ...   The codes shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-41     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-BILLING-42: Add a RPM diagnosis code on Billing - Completed
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Completed tab
    ...   2.Click Edit button on a specific Claim
    ...   3.Add a RPM diagnosis code for a Claim
    ...   Expected result:
    ...   The code shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-42     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-BILLING-43: Add 2 RPM diagnosis codes on Billing - Completed
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Completed tab
    ...   2.Click Edit button on a specific Claim
    ...   3.Add 2 RPM diagnosis codes for a Claim
    ...   Expected result:
    ...   The codes shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-43     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-BILLING-44: Add more than 2 CCM diagnosis codes on Patient details
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Patient details page - Time tracking subtab
    ...   2.Select the Billing section
    ...   3.Click Edit button on a specific Claim
    ...   4.Add more than 2 CCM diagnosis codes for a Claim
    ...   Expected result:
    ...   The codes shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-44     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-BILLING-45: Add a RPM diagnosis code on Patient details
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Patient details page - Time tracking subtab
    ...   2.Select the Billing section
    ...   3.Click Edit button on a specific Claim
    ...   4.Add a RPM diagnosis code for a Claim
    ...   Expected result:
    ...   The codes shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-45     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-BILLING-46: Add 2 RPM diagnosis codes on Patient details
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Patient details page - Time tracking subtab
    ...   2.Select the Billing section
    ...   3.Click Edit button on a specific Claim
    ...   4.Add 2 RPM diagnosis codes for a Claim
    ...   Expected result:
    ...   The codes shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-46     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-BILLING-47: Filter the In progress tab by current month
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the current month
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the bills of current month shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-47     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-48: Filter the In progress tab by the past month
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the past month
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the bills of past month shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-48     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-49: Filter the In progress tab by future month
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the future month
    ...   4.Click Apply button
    ...   Expected result:
    ...   The future month shall not be selected.
    [Tags]    BCP-PHY-BILLING-49     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-50: Filter the In progress tab by CCM & RPM plan type
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the Program type as CCM & RPM
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the bills as CCM & RPM plan type shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-50     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-51: Filter the In progress tab by CCM plan type
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the Program type as CCM
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the bills as CCM plan type shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-51     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-52: Filter the In progress tab by RPM plan type
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the Program type as RPM
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the bills as RPM plan type shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-52     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-53: Filter the In progress tab by all plan types
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the Program type as all plan types
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the bills of all plan types shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-53     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-54: Filter the In progress tab by billable status
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the billable status check box
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the bills as billable shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-54     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-55: Filter the In progress tab by unbillable status
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the unbillable status check box
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the bills as unbillable shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-55     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-56: Filter the In progress tab by all statuses
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select all statuses
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the bills in all statuses shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-56     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-57: Filter the In progress tab by month and Program type
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the month
    ...   4.Select the Program type
    ...   5.Click Apply button
    ...   Expected result:
    ...   All the bills of the selected month and Program type shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-57     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-58: Filter the In progress tab by month and bill status
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the month
    ...   4.Select the bill status
    ...   5.Click Apply button
    ...   Expected result:
    ...   All the bills of the selected month and bill status shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-58     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-59: Filter the In progress tab by Program type and bill status
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - In progress tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the Program type
    ...   4.Select the bill status
    ...   5.Click Apply button
    ...   Expected result:
    ...   All the bills of the selected month and bill status shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-59     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-60: Filter the Ready for biller tab by current month
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Ready for biller tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the current month
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the claims of current month shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-60     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-61: Filter the Ready for biller tab by the past month
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Ready for biller tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the past month
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the claims of past month shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-61     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-62: Filter the Ready for biller tab by future month
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Ready for biller tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the future month
    ...   4.Click Apply button
    ...   Expected result:
    ...   The future month shall not be selected.
    [Tags]    BCP-PHY-BILLING-62     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-63: Filter the Ready for biller tab by CCM & RPM plan type
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Ready for biller tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the Program type as CCM & RPM
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the claims as CCM & RPM plan type shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-63     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-64: Filter the Ready for biller tab by CCM plan type
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Ready for biller tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the Program type as CCM
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the claims as CCM plan type shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-64     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-65: Filter the Ready for biller tab by RPM plan type
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Ready for biller tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the Program type as RPM
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the claims as RPM plan type shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-65     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-66: Filter the Ready for biller tab by all plan types
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Ready for biller tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the Program type as all plan types
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the claims of all plan types shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-66     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-67: Filter the Ready for biller tab by month and Program type
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Ready for biller tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the month
    ...   4.Select the Program type
    ...   5.Click Apply button
    ...   Expected result:
    ...   All the claims of the selected month and Program type shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-67     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-68: Filter the Completed tab by current month
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Completed tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the current month
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the claims of current month shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-68     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-69: Filter the Completed tab by the past month
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Completed tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the past month
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the claims of past month shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-69     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-70: Filter the Completed tab by future month
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Completed tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the future month
    ...   4.Click Apply button
    ...   Expected result:
    ...   The future month shall not be selected.
    [Tags]    BCP-PHY-BILLING-70     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-71: Filter the Completed tab by CCM & RPM plan type
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Completed tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the Program type as CCM & RPM
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the claims as CCM & RPM plan type shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-71     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-72: Filter the Completed tab by CCM plan type
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Completed tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the Program type as CCM
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the claims as CCM plan type shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-72     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-73: Filter the Completed tab by RPM plan type
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Completed tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the Program type as RPM
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the claims as RPM plan type shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-73     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-74: Filter the Completed tab by all plan types
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Completed tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the Program type as all plan types
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the claims of all plan types shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-74     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-75: Filter the Completed tab by Submitted status
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Completed tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the Claim status as Submitted
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the claims with Submitted status shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-75     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-76: Filter the Completed tab by Denied status
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Completed tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the Claim status as Denied
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the claims with Denied status shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-76     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-77: Filter the Completed tab by all claim statuses
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Completed tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select all claim statuses
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the claims with all statuses shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-77     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-78: Filter the Completed tab by month and Program type
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Completed tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the month
    ...   4.Select the Program type
    ...   5.Click Apply button
    ...   Expected result:
    ...   All the claims of the selected month and Program type shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-78     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-79: Filter the Completed tab by month and claim status
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Completed tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the month
    ...   4.Select the claim status
    ...   5.Click Apply button
    ...   Expected result:
    ...   All the claims of the selected month and claim status shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-79     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-80: Filter the Completed tab by Program type and claim status
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Completed tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the claim status
    ...   4.Select the Program type
    ...   5.Click Apply button
    ...   Expected result:
    ...   All the claims of the selected claim status and Program type shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-80     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-81: Mark Claim status as Submitted on Billing page - Ready for biller
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Ready for biller tab
    ...   2.Select the Claim status as Submitted on the Status column
    ...   Expected result:
    ...   The Claim status will be 'Submitted'
    ...   The Claim shall be moved to the Completed tab.
    [Tags]    BCP-PHY-BILLING-81     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-82: Mark Claim status as Denied on Billing page - Ready for biller
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Ready for biller tab
    ...   2.Select the Claim status as Denied on the Status column
    ...   Expected result:
    ...   The Claim status will be 'Denied'
    ...   The Claim shall be moved to the Completed tab.
    [Tags]    BCP-PHY-BILLING-82     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-83: Mark all Claims status as Submitted on Billing page - Ready for biller
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Ready for biller tab
    ...   2.Select the Mark all submitted button
    ...   3.Select the Month on the date-picker
    ...   4.Click the Mark as submitted button
    ...   Expected result:
    ...   All the Claims status will be 'Submitted'
    ...   All the Claims shall be moved to the Completed tab.
    [Tags]    BCP-PHY-BILLING-83     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-84: Mark Claim status as Ready for biller on Billing page - Completed
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Completed tab
    ...   2.Select the Claim status as Ready for biller on the Status column
    ...   Expected result:
    ...   The Claim status will be 'Ready for biller'
    ...   The Claim shall be moved back to the Ready for biller tab.
    [Tags]    BCP-PHY-BILLING-84     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-85: Mark Claim status as Submitted on Billing page - Completed
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Completed tab
    ...   2.Select the Claim status as Submitted on the Status column
    ...   Expected result:
    ...   The Claim status will be 'Submitted'.
    [Tags]    BCP-PHY-BILLING-85     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-86: Mark Claim status as Reimbursed on Billing page - Completed
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Completed tab
    ...   2.Select the Claim status as Reimbursed on the Status column
    ...   Expected result:
    ...   The Claim status will be 'Reimbursed'.
    [Tags]    BCP-PHY-BILLING-86     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-87: Mark Claim status as Denied on Billing page - Completed
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Completed tab
    ...   2.Select the Claim status as Denied on the Status column
    ...   Expected result:
    ...   The Claim status will be 'Denied'.
    [Tags]    BCP-PHY-BILLING-87     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-88: Mark Claim status as Ready for biller on Patient details
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Patient details page
    ...   2.Select the Claim status as Ready for biller on the Status column
    ...   Expected result:
    ...   The Claim status will be 'Ready for biller'.
    [Tags]    BCP-PHY-BILLING-88     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-89: Mark Claim status as Submitted on Patient details
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Patient details page
    ...   2.Select the Claim status as Submitted on the Status column
    ...   Expected result:
    ...   The Claim status will be 'Submitted'.
    [Tags]    BCP-PHY-BILLING-89     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-90: Mark Claim status as Reimbursed on Patient details
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Patient details page
    ...   2.Select the Claim status as Reimbursed on the Status column
    ...   Expected result:
    ...   The Claim status will be 'Reimbursed'.
    [Tags]    BCP-PHY-BILLING-90     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-91: Mark Claim status as Denied on Patient details
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Patient details page
    ...   2.Select the Claim status as Denied on the Status column
    ...   Expected result:
    ...   The Claim status will be 'Denied'.
    [Tags]    BCP-PHY-BILLING-91     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-92: Add claim's insurance on patient details page - billing subtab
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to a specific patient details page
    ...   2.Select the Time-tracking tab
    ...   3.Select the Billing subtab
    ...   4.Add the Insurance paid
    ...   Expected result:
    ...   The Insurance paid shall be added successfully.
    [Tags]    BCP-PHY-BILLING-92     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-93: Add claim's insurance on billing page - Ready for biller tab
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page
    ...   2.Select the Ready for biller tab
    ...   3.Add the Insurance paid for a claim
    ...   Expected result:
    ...   The Insurance paid shall be added successfully.
    [Tags]    BCP-PHY-BILLING-93     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-94: Add claim's insurance on billing page - Completed tab
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page
    ...   2.Select the Completed tab
    ...   3.Add the Insurance paid for a claim
    ...   Expected result:
    ...   The Insurance paid shall be added successfully.
    [Tags]    BCP-PHY-BILLING-94     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-95: Edit claim's insurance on patient details page - billing subtab
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to a specific patient details page
    ...   2.Select the Time-tracking tab
    ...   3.Select the Billing subtab
    ...   4.Edit the Insurance paid
    ...   Expected result:
    ...   The Insurance paid shall be updated successfully.
    [Tags]    BCP-PHY-BILLING-95     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-96: Edit claim's insurance on billing page - Ready for biller tab
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page
    ...   2.Select the Ready for biller tab
    ...   3.Edit the Insurance paid for a claim
    ...   Expected result:
    ...   The Insurance paid shall be updated successfully.
    [Tags]    BCP-PHY-BILLING-96     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-97: Edit claim's insurance on billing page - Completed tab
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page
    ...   2.Select the Completed tab
    ...   3.Edit the Insurance paid for a claim
    ...   Expected result:
    ...   The Insurance paid shall be updated successfully.
    [Tags]    BCP-PHY-BILLING-97     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-98: Export the Claims on CSV format - Ready for biller
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page
    ...   2.Select the Ready for biller tab
    ...   3.Click Export to CSV button on the page
    ...   4.Select the month for exporting file
    ...   5.Click Export button
    ...   Expected result:
    ...   The excel file shall be exported and downloaded in the CSV format
    ...   The file shall include the selected month's claims info.
    [Tags]    BCP-PHY-BILLING-98     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-99: Export the Claims on CSV format - Completed
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page
    ...   2.Select the Completed tab
    ...   3.Click Export to CSV button on the page
    ...   4.Select the month for exporting file
    ...   5.Click Export button
    ...   Expected result:
    ...   The excel file shall be exported and downloaded in the CSV format
    ...   The file shall include the selected month's claims info.
    [Tags]    BCP-PHY-BILLING-99     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-100: Billing warning - Add all missing Patient info
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page
    ...   2.Click the Update now button on the billing warning of missing patient info
    ...   3.Add all info (patient gender/dob/address)
    ...   Expected result:
    ...   The patient info shall be updated successfully
    ...   The billing warning of missing patient info shall be dissapeared.
    [Tags]    BCP-PHY-BILLING-100     manual          [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-101: Billing warning - Add patient Gender
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page
    ...   2.Click the Update now button on the billing warning of missing patient info
    ...   3.Add only patient Gender
    ...   Expected result:
    ...   The patient info shall be updated successfully
    ...   The billing warning of missing patient info will still displayed.
    [Tags]    BCP-PHY-BILLING-101     manual          [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-102: Billing warning - Add patient DOB
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page
    ...   2.Click the Update now button on the billing warning of missing patient info
    ...   3.Add only patient DOB
    ...   Expected result:
    ...   The patient info shall be updated successfully
    ...   The billing warning of missing patient info will still displayed.
    [Tags]    BCP-PHY-BILLING-102     manual          [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-103: Billing warning - Add patient Address
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page
    ...   2.Click the Update now button on the billing warning of missing patient info
    ...   3.Add only patient Address
    ...   Expected result:
    ...   The patient info shall be updated successfully
    ...   The billing warning of missing patient info will still displayed.
    [Tags]    BCP-PHY-BILLING-103     manual          [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-104: Billing warning - Edit all patient info
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page
    ...   2.Select the Program tab
    ...   3.Edit all patient info
    ...   Expected result:
    ...   The patient info and the billing warning tag shall be updated successfully.
    [Tags]    BCP-PHY-BILLING-104     manual          [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-105: Billing warning - Edit patient Gender
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page
    ...   2.Select the Program tab
    ...   3.Edit only patient Gender
    ...   Expected result:
    ...   The patient info and the billing warning tag shall be updated successfully.
    [Tags]    BCP-PHY-BILLING-105     manual          [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-106: Billing warning - Edit patient DOB
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page
    ...   2.Select the Program tab
    ...   3.Edit only patient DOB
    ...   Expected result:
    ...   The patient info and the billing warning tag shall be updated successfully.
    [Tags]    BCP-PHY-BILLING-106     manual          [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-107: Billing warning - Edit patient Address
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page
    ...   2.Select the Program tab
    ...   3.Edit only patient Address
    ...   Expected result:
    ...   The patient info and the billing warning tag shall be updated successfully.
    [Tags]    BCP-PHY-BILLING-107     manual          [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-108: Billing warning - Sign CCM consent for CCM plan
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page
    ...   2.Click the Here button on the billing warning tag of consent(s) signed
    ...   3.Sign the consent from clinic user portal (or patient signs it on app)
    ...   Expected result:
    ...   The CCM consent shall be signed and uploaded successfully
    ...   The warning tag shall be dissapeared.
    [Tags]    BCP-PHY-BILLING-108     manual          [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-109: Billing warning - Sign RPM consent for RPM plan
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page
    ...   2.Click the Here button on the billing warning tag of consent(s) signed
    ...   3.Sign the consent from clinic user portal (or patient signs it on app)
    ...   Expected result:
    ...   The RPM consent shall be signed and uploaded successfully
    ...   The warning tag shall be dissapeared.
    [Tags]    BCP-PHY-BILLING-109     manual          [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-110: Billing warning - Sign CCM consent for CCM & RPM plan
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page
    ...   2.Click the Here button on the billing warning tag of consent(s) signed
    ...   3.Sign the consent from clinic user portal (or patient signs it on app)
    ...   Expected result:
    ...   The CCM consent shall be signed and uploaded successfully
    ...   The warning tag will still displayed.
    [Tags]    BCP-PHY-BILLING-110     manual          [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-111: Billing warning - Sign RPM consent for CCM & RPM plan
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page
    ...   2.Click the Here button on the billing warning tag of consent(s) signed
    ...   3.Sign the consent from clinic user portal (or patient signs it on app)
    ...   Expected result:
    ...   The RPM consent shall be signed and uploaded successfully
    ...   The warning tag will still displayed.
    [Tags]    BCP-PHY-BILLING-111     manual          [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-112: Billing warning - Sign both consents for CCM & RPM plan
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page
    ...   2.Click the Here button on the billing warning tag of consent(s) signed
    ...   3.Sign the consent from clinic user portal (or patient signs it on app)
    ...   Expected result:
    ...   The both consents shall be signed and uploaded successfully
    ...   The warning tag shall be dissapeared.
    [Tags]    BCP-PHY-BILLING-112     manual          [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-113: Billing warning - Update CCM consent for CCM plan
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page
    ...   2.Select the Program tab
    ...   3.Update the CCM consent from clinic user portal (or patient signs it on app)
    ...   Expected result:
    ...   The CCM consent shall be updated successfully.
    [Tags]    BCP-PHY-BILLING-113     manual          [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-114: Billing warning - Update RPM consent for RPM plan
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page
    ...   2.Select the Program tab
    ...   3.Update the RPM consent from clinic user portal (or patient signs it on app)
    ...   Expected result:
    ...   The RPM consent shall be updated successfully.
    [Tags]    BCP-PHY-BILLING-114     manual          [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-115: Billing warning - Update CCM consent for CCM & RPM plan
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page
    ...   2.Select the Program tab
    ...   3.Update the CCM consent from clinic user portal (or patient signs it on app)
    ...   Expected result:
    ...   The CCM consent shall be updated successfully.
    [Tags]    BCP-PHY-BILLING-115     manual          [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-116: Billing warning - Update RPM consent for CCM & RPM plan
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page
    ...   2.Select the Program tab
    ...   3.Update the RPM consent from clinic user portal (or patient signs it on app)
    ...   Expected result:
    ...   The RPM consent shall be updated successfully.
    [Tags]    BCP-PHY-BILLING-116     manual          [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-117: Billing warning - Update both consents for CCM & RPM plan
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the patient details page
    ...   2.Select the Program tab
    ...   3.Update the both consent from clinic user portal (or patient signs it on app)
    ...   Expected result:
    ...   The both consents shall be updated successfully.
    [Tags]    BCP-PHY-BILLING-117     manual          [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}


BCP-PHY-BILLING-118: Add a CCM diagnosis code on Patient details
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Patient details page - Time tracking subtab
    ...   2.Select the Billing section
    ...   3.Click Edit button on a specific Claim
    ...   4.Add a CCM diagnosis code for a Claim
    ...   Expected result:
    ...   The codes shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-118     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-BILLING-119: Add 2 CCM diagnosis codes on Patient details
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Patient details page - Time tracking subtab
    ...   2.Select the Billing section
    ...   3.Click Edit button on a specific Claim
    ...   4.Add 2 CCM diagnosis codes for a Claim
    ...   Expected result:
    ...   The codes shall be saved and displayed on the Claim.
    [Tags]    BCP-PHY-BILLING-119     manual           [BCP-2.16]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-BILLING-120: Filter the Completed tab by Reimbursed status
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Completed tab
    ...   2.Click the Filter button on the top right of the page
    ...   3.Select the Claim status as Reimbursed
    ...   4.Click Apply button
    ...   Expected result:
    ...   All the claims with Reimbursed status shall be filtered and displayed on the page.
    [Tags]    BCP-PHY-BILLING-120     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-121: Mark Claim status as Reimbursed on Billing page - Ready for biller
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to the Billing page - Ready for biller tab
    ...   2.Select the Claim status as Reimbursed on the Status column
    ...   Expected result:
    ...   The Claim status will be 'Reimbursed'
    ...   The Claim shall be moved to the Completed tab.
    [Tags]    BCP-PHY-BILLING-121     manual           [BCP-2.16]
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-BILLING-122: Column visibility - Hide/show column(s) on any tab(s) of the Billing page
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: user is on the Billing page
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to hide/show any column(s) on page by setting on Column visibility button.
    [Tags]    BCP-PHY-BILLING-122        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-BILLING-123: Download a superbill
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: user is on the Billing page or Time-tracking tab of the patient details
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to download a bill from the patient details - time tracking tab.
    [Tags]    BCP-PHY-BILLING-123        manual      [BCP-2.15]
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