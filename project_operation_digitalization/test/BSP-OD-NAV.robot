*** Settings ***
Documentation   Test Suite - Operation Digitalization Portal - Authentication
Metadata    sid     BSP-OD-NAV
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_operation_digitalization/lib/ConfigHandler.py    ${ENV}
#Library     project_operation_digitalization/lib/web/Common.py

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BSP-OD-NAV    web
Test Timeout    1h

*** Test Cases ***
BSP-OD-NAV-AUDIT-OPDIGIT-01: View the list of 'Export Audit Trail' on Operation Digitalization portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can view the list of 'Export Audit Trail' option on Operation Digitalization portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to Operation Digitalization portal
    ...
    ...     Test Steps:
    ...     - 1. Click on Profile and select "Export Audit Trail" option
    ...
    ...     Expected Results:
    ...     - 1. There are an “Export Audit Trail” modal with the following options:
    ...     -   RMA Traveler
    ...     -   Operation form
    ...     - 2. There shall be an ID input box for each selection with 2 buttons "Cancel" and "Export"
    ...
    [Tags]     BSP-OD-NAV-AUDIT-OPDIGIT-01      BSP-SRS-007-RS-91-01     R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-NAV-AUDIT-OPDIGIT-02: Cannot export an Audit trail for an invalid RMA Traveler on Operation Digitalization portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM cannot export an Audit trail for an invalid RMA Traveler on Operation Digitalization portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to Operation Digitalization portal
    ...     - Click on Profile and select "Export Audit Trail" option
    ...
    ...     Test Steps:
    ...     - 1. On "Export Audit Trail" modal, select "RMA Traveler" option
    ...     - 2. Enter an invalid Form ID that not existing in the system
    ...     - 3. Click "Export" button
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message "Invalid form ID" and the user cannot export file
    ...
    [Tags]     BSP-OD-NAV-AUDIT-OPDIGIT-02      BSP-SRS-007-RS-91-01     R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-NAV-AUDIT-OPDIGIT-03: Export an Audit trail for an approved RMA traveler on Operation Digitalization portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can export an Audit trail for an approved Operation form on Operation Digitalization portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to Operation Digitalization portal
    ...     - Click on Profile and select "Export Audit Trail" option
    ...
    ...     Test Steps:
    ...     - 1. On "Export Audit Trail" modal, select "RMA traveler" option
    ...     - 2. Enter a valid Form ID that has approved status
    ...     - 3. Click "Export" button
    ...
    ...     Expected Results:
    ...     - 1. An excel file shall be downloaded to your PC with filename format [Audit]traveler_travelerID
    ...
    [Tags]     BSP-OD-NAV-AUDIT-OPDIGIT-03      BSP-SRS-007-RS-91-01     R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-NAV-AUDIT-OPDIGIT-04: View Audit data of an approved RMA traveler on Operation Digitalization portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can view Audit data of an approved RMA traveler on Operation Digitalization portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to Operation Digitalization portal
    ...     - The user has exported Audit trail for an approved RMA traveler
    ...
    ...     Test Steps:
    ...     - 1. Open the exported Excel file and view the information
    ...
    ...     Expected Results:
    ...     - 1. There shall be a header that displays the Device IDs related to the ticket. If there are multiple device IDs, each of them shall be on a new line
    ...     - 2. The audit data shall have 4 main attributes:
    ...     - Date time: Displayed relative to PST/PDT
    ...     - Action: Displayed with the following actions:
    ...     - + Created RMA Traveler <FormID>
    ...     - + Completed Traveler <FormID> - Step <Step Description>
    ...     - + Submitted Traveler Form <FormID>
    ...     - + Approved RMA Traveler <FormID>
    ...     - Operator: Displays the full name of the operator
    ...     - IP Address
    ...
    [Tags]     BSP-OD-NAV-AUDIT-OPDIGIT-04     BSP-SRS-007-RS-91-02     R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-NAV-AUDIT-OPDIGIT-05: Export an Audit trail for a rejected RMA traveler on Operation Digitalization portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can export an Audit trail for a rejected RMA traveler on Operation Digitalization portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to Operation Digitalization portal
    ...     - Click on Profile and select "Export Audit Trail" option
    ...
    ...     Test Steps:
    ...     - 1. On "Export Audit Trail" modal, select "RMA traveler" option
    ...     - 2. Enter a valid Form ID that has rejected status
    ...     - 3. Click "Export" button
    ...
    ...     Expected Results:
    ...     - 1. An excel file shall be downloaded to your PC with filename format [Audit]traveler_travelerID
    ...
    [Tags]     BSP-OD-NAV-AUDIT-OPDIGIT-05     BSP-SRS-007-RS-91-01     R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-NAV-AUDIT-OPDIGIT-06: View Audit data of a rejected RMA traveler on Operation Digitalization portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can view Audit data of a rejected RMA traveler on Operation Digitalization portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to Operation Digitalization portal
    ...     - The user has exported Audit trail for a rejected RMA traveler
    ...
    ...     Test Steps:
    ...     - 1. Open the exported Excel file and view the information
    ...
    ...     Expected Results:
    ...     - 1. There shall be a header that displays the Device IDs related to the ticket. If there are multiple device IDs, each of them shall be on a new line
    ...     - 2. The audit data shall have 4 main attributes:
    ...     - Date time: Displayed relative to PST/PDT
    ...     - Action: Displayed with the following actions:
    ...     - + Created RMA Traveler <FormID>
    ...     - + Completed Traveler <FormID> - Step <Step Description>
    ...     - + Submitted Traveler Form <FormID>
    ...     - + Approved RMA Traveler <FormID>
    ...     - + Rejected RMA Traveler <FormID>
    ...     - Operator: Displays the full name of the operator
    ...     - IP Address
    ...
    [Tags]     BSP-OD-NAV-AUDIT-OPDIGIT-06     BSP-SRS-007-RS-91-02     R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-NAV-AUDIT-OPDIGIT-07: Cannot export an Audit trail for an invalid Operation form on Operation Digitalization portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM cannot export an Audit trail for an invalid Operation form on Operation Digitalization portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to Operation Digitalization portal
    ...     - Click on Profile and select "Export Audit Trail" option
    ...
    ...     Test Steps:
    ...     - 1. On "Export Audit Trail" modal, select "Operation form" option
    ...     - 2. Enter an invalid Form ID that not existing in the system
    ...     - 3. Click "Export" button
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message "Invalid form ID" and the user cannot export file
    ...
    [Tags]     BSP-OD-NAV-AUDIT-OPDIGIT-07      BSP-SRS-007-RS-91-01     R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-NAV-AUDIT-OPDIGIT-08: Export an Audit trail for an approved Operation form on Operation Digitalization portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can export an Audit trail for an approved Operation form on Operation Digitalization portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to Operation Digitalization portal
    ...     - Click on Profile and select "Export Audit Trail" option
    ...
    ...     Test Steps:
    ...     - 1. On "Export Audit Trail" modal, select "Operation form" option
    ...     - 2. Enter a valid Form ID that has approved status
    ...     - 3. Click "Export" button
    ...
    ...     Expected Results:
    ...     - 1. An excel file shall be downloaded to your PC with filename format [Audit]opform_opformID
    ...
    [Tags]     BSP-OD-NAV-AUDIT-OPDIGIT-08      BSP-SRS-007-RS-91-01     R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-NAV-AUDIT-OPDIGIT-09: View Audit data of an approved Operation form on Operation Digitalization portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can view Audit data of an approved Operation form on Operation Digitalization portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to Operation Digitalization portal
    ...     - The user has exported Audit trail for an approved Operation form
    ...
    ...     Test Steps:
    ...     - 1. Open the exported Excel file and view the information
    ...
    ...     Expected Results:
    ...     - 1. There shall be a header that displays the Device IDs related to the ticket. If there are multiple device IDs, each of them shall be on a new line
    ...     - 2. The audit data shall have 4 main attributes:
    ...     - Date time: Displayed relative to PST/PDT
    ...     - Action: Displayed with the following actions:
    ...     - + Created Operation Form <FormID>
    ...     - + Completed Operation Form <FormID> - Step <Step description>
    ...     - + Submitted Operation Form <FormID>
    ...     - + Approved Operation Form <FormID>
    ...     - Operator: Displays the full name of the operator
    ...     - IP Address
    ...
    [Tags]     BSP-OD-NAV-AUDIT-OPDIGIT-09     BSP-SRS-007-RS-91-02     R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-NAV-AUDIT-OPDIGIT-10: Export an Audit trail for a rejected Operation form on Operation Digitalization portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can export an Audit trail for a rejected Operation form on Operation Digitalization portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to Operation Digitalization portal
    ...     - Click on Profile and select "Export Audit Trail" option
    ...
    ...     Test Steps:
    ...     - 1. On "Export Audit Trail" modal, select "Operation form" option
    ...     - 2. Enter a valid Form ID that has rejected status
    ...     - 3. Click "Export" button
    ...
    ...     Expected Results:
    ...     - 1. An excel file shall be downloaded to your PC with filename format [Audit]opform_opformID
    ...
    [Tags]     BSP-OD-NAV-AUDIT-OPDIGIT-10      BSP-SRS-007-RS-91-01     R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-NAV-AUDIT-OPDIGIT-11: View Audit data of a rejected Operation form on Operation Digitalization portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can view Audit data of a rejected Operation form on Operation Digitalization portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to Operation Digitalization portal
    ...     - The user has exported Audit trail for a rejected Operation form
    ...
    ...     Test Steps:
    ...     - 1. Open the exported Excel file and view the information
    ...
    ...     Expected Results:
    ...     - 1. There shall be a header that displays the Device IDs related to the ticket. If there are multiple device IDs, each of them shall be on a new line
    ...     - 2. The audit data shall have 4 main attributes:
    ...     - Date time: Displayed relative to PST/PDT
    ...     - Action: Displayed with the following actions:
    ...     - + Created Operation Form <FormID>
    ...     - + Completed Operation Form <FormID> - Step <Step description>
    ...     - + Submitted Operation Form <FormID>
    ...     - + Approved Operation Form <FormID> (if any)
    ...     - + Rejected Operation Form <FormID>
    ...     - Operator: Displays the full name of the operator
    ...     - IP Address
    ...
    [Tags]     BSP-OD-NAV-AUDIT-OPDIGIT-11    BSP-SRS-007-RS-91-02     R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-NAV-AUDIT-OPDIGIT-12: Export an Audit trail for a draft Operation form on Operation Digitalization portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can export an Audit trail for a draft Operation form on Operation Digitalization portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to Operation Digitalization portal
    ...     - Click on Profile and select "Export Audit Trail" option
    ...
    ...     Test Steps:
    ...     - 1. On "Export Audit Trail" modal, select "Operation form" option
    ...     - 2. Enter a valid Form ID that has draft status (has not been submitted yet)
    ...     - 3. Click "Export" button
    ...
    ...     Expected Results:
    ...     - 1. An excel file shall be downloaded to your PC with filename format [Audit]opform_opformID
    ...
    [Tags]     BSP-OD-NAV-AUDIT-OPDIGIT-12      BSP-SRS-007-RS-91-01     R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-NAV-AUDIT-OPDIGIT-13: View Audit data of a draft Operation form on Operation Digitalization portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can view Audit data of a draft Operation form on Operation Digitalization portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to Operation Digitalization portal
    ...     - The user has exported Audit trail for a draft Operation form
    ...
    ...     Test Steps:
    ...     - 1. Open the exported Excel file and view the information
    ...
    ...     Expected Results:
    ...     - 1. There shall be a header that displays the Device IDs related to the ticket. If there are multiple device IDs, each of them shall be on a new line
    ...     - 2. The audit data shall have 4 main attributes:
    ...     - Date time: Displayed relative to PST/PDT
    ...     - Action: Displayed with the following actions:
    ...     - + Created Operation Form <FormID>
    ...     - + Completed Operation Form <FormID> - Step <Step description>
    ...     - Operator: Displays the full name of the operator
    ...     - IP Address
    ...
    [Tags]     BSP-OD-NAV-AUDIT-OPDIGIT-13    BSP-SRS-007-RS-91-02     R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_operation_digitalization/lib/web/Common.py     ${BROWSER_NODE}       ${ENV}
    ${VERSION}           Navigate To Operation Digitalization Portal
    Set Suite Metadata   version    ${VERSION}
    Set Suite Metadata   browser    ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser
