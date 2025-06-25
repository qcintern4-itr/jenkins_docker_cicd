*** Settings ***
Documentation   Biocare app Data Definition test suite
Metadata    sid     BIOC-DATADEFINITION
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-DATADEFINITION   mapp
Test Timeout    1h

*** Test Cases ***
BIOC-DATADEFINITION-GENERAL-01: Data type
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - In general, if there are more than 1 data from different sources in the same minute, the priority level of data displaying will be:
    ...         + Data from BTCY device.
    ...         + Data sync from 3rd party app
    ...         + Data from add manual
    [Tags]      BIOC-DATADEFINITION-GENERAL-01       BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DATADEFINITION-GENERAL-02: Auto sync data
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Auto-sync Biocare chart data with Daily input:
    ...         + The system shall synchronize data from Biocare chart into Daily input. These data shall be affected:
    ...            * Heart rate.
    ...            * Blood oxygen.
    ...            * Blood Pressure.
    ...            * Temperature.
    ...            * Sleep: in case the sleep duration in daily input is over 24h the app shall auto-split the data into each day and sync it to daily input.
    ...            * Weight.
    ...            * Activities.
    ...         + The system shall perform auto sync only when the Daily input does not have that type of data. If there is already data, the system shall not perform auto-sync every time the user returns to add a measurement
    ...         + The system shall not display the "sync available data" option.
    ...         + The system shall sync the first data from Health app to daily input
    [Tags]      BIOC-DATADEFINITION-GENERAL-02       BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DATADEFINITION-HEARTRATE-01: Latest card
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Data on the card will be the latest heart rate recorded.
    ...     - If there are more than 1 data from different sources in the same minute, the priority level of data displaying will be:
    ...         + Data sync from 3rd party app
    ...             * Data from the device
    ...             * Data from add manual in 3rd party app
    ...         + Data from adding manual
    [Tags]      BIOC-DATADEFINITION-HEARTRATE-01       BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DATADEFINITION-HEARTRATE-02: In charts
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - On the chart, the data displayed will be the last. Meaning, that regardless of the data source in the same minute if there are more than 1 data value, the last inputted one will be displayed on the chart and all calculation will base on this data value.
    ...     - Data on the chart will be displayed on the
    [Tags]      BIOC-DATADEFINITION-HEARTRATE-02       BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DATADEFINITION-BLOODPRESSURE-01: Latest card
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - Data on the card will be the last data recorded, regardless of the data source
    [Tags]      BIOC-DATADEFINITION-BLOODPRESSURE-01       BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DATADEFINITION-BLOODOXYGEN-01: Latest card
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Data on the card will be the last data recorded, regardless of the data source
    [Tags]      BIOC-DATADEFINITION-BLOODOXYGEN-01       BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DATADEFINITION-TEMPERATURE-01: Latest card
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Data on the card will be the last data recorded, regardless of the data source
    [Tags]      BIOC-DATADEFINITION-TEMPERATURE-01       BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DATADEFINITION-WEIGHT-01: Latest card
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Data on the card will be the last data recorded, regardless of the data source
    [Tags]      BIOC-DATADEFINITION-WEIGHT-01       BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DATADEFINITION-SLEEP-01: Latest card
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Data on the card will be the total time in bed of the recording date.
    ...     - If there are more than 1 data from different sources in the same minute the time will be combined, the latest end time and the oldest start time, to calculate sleep time
    [Tags]      BIOC-DATADEFINITION-SLEEP-01       BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DATADEFINITION-STEPS-01: Latest card
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Data on the card will be the total steps since the last record of that day
    ...     - If there are more than 1 data from different sources in the same minute, the priority level of data displaying will be:
    ...         + Data sync from 3rd party app
    ...             * Data from the device
    ...             * Data from add manual in 3rd party app
    ...         + Data from adding manual
    [Tags]      BIOC-DATADEFINITION-STEPS-01       BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DATADEFINITION-WALKING-01: Latest card
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Data on the card will be the total distance/calories/time since the last record of that day
    ...     - If there are more than 1 data from different sources in the same minute, the priority level of data displaying will be:
    ...         + Data sync from 3rd party app
    ...             * Data from the device
    ...             * Data from add manual in 3rd party app
    ...         + Data from adding manual
    [Tags]      BIOC-DATADEFINITION-WALKING-01       BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DATADEFINITION-RUNNING-01: Latest card
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Data on the card will be the total distance/calories/time since the last record of that day
    ...     - If there are more than 1 data from different sources in the same minute, the priority level of data displaying will be:
    ...         + Data sync from 3rd party app
    ...             * Data from the device
    ...             * Data from add manual in 3rd party app
    ...         + Data from adding manual
    [Tags]      BIOC-DATADEFINITION-RUNNING-01       BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DATADEFINITION-ALERT-01: Blood Pressure Alert
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...     1. Add consecutive readings in the day exceed threshold (Max)
    ...     2. Add consecutive readings in the day exceed threshold (Min)
    ...
    ...     Expected Output:
    ...     1. Notification will be triggered:
    ...        - Blood pressure value
    ...        - Bell: Your blood pressure is above normal
    ...        - Text: Please take rest and re-measure in 10 minutes
    ...        - Got it button
    ...     2. Notification will be triggered:
    ...        - Blood pressure value
    ...        - Bell: Your blood pressure is below normal
    ...        - Text: Please take rest and re-measure in 10 minutes
    ...        - Got it button
    [Tags]      BIOC-DATADEFINITION-ALERT-01      BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DATADEFINITION-ALERT-02: Blood Oxygen Alert
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...     1. Add consecutive readings in the day exceed threshold (Min)
    ...
    ...     Expected Output:
    ...     1. Notification will be triggered:
    ...        - Blood Oxygen value
    ...        - Bell: Your blood oxygen is below normal
    ...        - Text: Please take rest and re-measure in 10 minutes
    ...        - Got it button
    [Tags]      BIOC-DATADEFINITION-ALERT-02      BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-DATADEFINITION-ALERT-03: Body Temperature Alert
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...     1. Add consecutive readings in the day exceed threshold (Max)
    ...     2. Add consecutive readings in the day exceed threshold (Min)
    ...
    ...     Expected Output:
    ...     1. Notification will be triggered:
    ...        - Body Temperature value
    ...        - Bell: Your body temperature is above normal
    ...        - Text: Please take rest and re-measure in 10 minutes
    ...        - Got it button
    ...     2. Notification will be triggered:
    ...        - Body Temperature value
    ...        - Bell: Your body temperature is below normal
    ...        - Text: Please take rest and re-measure in 10 minutes
    ...        - Got it button
    [Tags]      BIOC-DATADEFINITION-ALERT-03      BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${APP_NODE}     Get Device Node
    Import Library    project_biocare_app/lib/mapp/Common.py     ${APP_NODE}     ${ENV}
    Start Biocare App
    ${USER}     Get Config Param    USER
    Sign In Biocare App    email=${USER}[username]      password=${USER}[password]
    ${RELEASE_VERSION}     Get Release Version
    Set Suite Metadata     version     ${RELEASE_VERSION}

SUITE TEARDOWN
    Quit All
