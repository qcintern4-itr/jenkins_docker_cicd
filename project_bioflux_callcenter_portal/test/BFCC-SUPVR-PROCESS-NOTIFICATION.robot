*** Settings ***
Documentation   Test Suite - Call Center Supervisor Portal - Process Notification Reports
Metadata    sid     BFCC-SUPVR-PROCESS-NOTIFICATION
Metadata    owner   Trinh Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_callcenter_portal/lib/ConfigHandler.py    ${ENV}

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BFCC-SUPVR-PROCESS-NOTIFICATION   web
Test Timeout    1h

*** Test Cases ***
BFCC-SUPVR-PROCESS-NOTIFICATION-CREATE-01: Create an Notification report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-CREATE-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-01: View details of Report summary tab on the new Notification report editing page
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-02: View details of Strips Selection tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-03: View a list of events reports with "All events" option is selected on Strip selection tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-04: View a list of events reports with "Include in report" option is selected on Strip selection tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-05: View a list of events reports with "Exclude from report" option is selected on Strip selection tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-06: Can reload the events by using Refresh button on Strip selection tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-07: Can search by Event ID on Strip selection tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-07     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-08: Can sort the event lists on Strip selection tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-08     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-09: Can use filter button on Strip selection tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-09     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-10: Can navigate to the Event Editing page on Strip selection tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-10      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-11: Quick access to Event information on Strip selection tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-11      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-12: Check View strip button is working properly on Strip selection tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-12      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-13: Check the Include in report checkbox is working properly on Strip selection tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-13      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-14: Check the Include Strips checkbox is working properly on Strip selection tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-14      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-15: Check pagination tool works properly on Strip selection tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-15      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-16: View details of PDF report tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-16      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-17: Can edit the facility notes PDF report on PDF report tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-17      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-18: Can edit the Technician comments on PDF report tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-DETAILS-18      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-GENERATE-01: Can generate a PDF file report on PDF report tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-GENERATE-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-GENERATE-02: Can regenerate a PDF file report on PDF report tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-GENERATE-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-GENERATE-03: Can upload a PDF report from computer to a report on PDF report tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-GENERATE-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-01: Can set a report status to Ready
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-02: Can assign report to specific user
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-03: Can update report statuses (No call, Call required, Call Completed)
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-04: Send an NOTIFICATION report to Clinic Inbox
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-05: Email an NOTIFICATION report to clinic
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-06: Fax an NOTIFICATION report to clinic
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-06     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-07: Recall an NOTIFICATION report from Clinic inbox
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-07     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-08: Dismiss an NOTIFICATION report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-08     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-09: Reenable an NOTIFICATION report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-09     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-10: Download an NOTIFICATION report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-10     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-11: Can view report logs
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-11     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-12: View details and format for the “bioflux NOTIFICATION ECG REPORT ”
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-12     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-13: Can lock a summary report so that won’t be processed by more than one user at the same time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-PROCESS-NOTIFICATION-REPORT-13     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_callcenter_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    ${RELEASE_VERSION}   Navigate To Callcenter Sign In Page
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser
