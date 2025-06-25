*** Settings ***
Documentation   Biocare app QoL Assessment test suite
Metadata    sid     BIOC-QUESTIONAIRE
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}
#
#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-QUESTIONAIRE   mapp
Test Timeout    1h

*** Test Cases ***
BIOC-QUESTIONAIRE-01: Verify the UI of the notification to start survey is similar to the UI in figma
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...
    ...     Expected Output:
    ...     the UI of the notification to start survey is similar to the UI in figma
    [Tags]      BIOC-QUESTIONAIRE-01      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-02: Verify 10 questions in Device Usability Questionnaire will display as UI in Figma
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey button
    ...
    ...     Expected Output:
    ...     10 questions in Device Usability Questionnaire will display as UI in Figma
    [Tags]      BIOC-QUESTIONAIRE-02      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-03: Verify The loading state UI of the Device Usability Questionnaire will display the same as the UI in Figma
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey button
    ...
    ...     Expected Output:
    ...     The loading state UI of the Device Usability Questionnaire will display the same as the UI in Figma
    [Tags]      BIOC-QUESTIONAIRE-03      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-04: Verify The Loaded Fail status UI of the Device Usability Questionnaire will now display the same UI as in Figma
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey button
    ...     6. The sever have issue, check the survey
    ...
    ...     Expected Output:
    ...     The Loaded Fail status UI of the Device Usability Questionnaire will now display the same UI as in Figma
    [Tags]      BIOC-QUESTIONAIRE-04      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-05: Verify the app will show a snack bar with the message "No internet connection" and Settings button when there is no internet
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Turn off the internet
    ...     6. Click Start survey button

    ...     Expected Output:
    ...     the app will show a snack bar with the message "No internet connection" and Settings button when there is no internet
    [Tags]      BIOC-QUESTIONAIRE-05      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-06: Verify the app will show a snack bar with the message "No internet connection" and Settings button when there is no internet
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Turn off the internet
    ...     6. Click Start survey button

    ...     Expected Output:
    ...     the app will show a snack bar with the message "No internet connection" and Settings button when there is no internet
    [Tags]      BIOC-QUESTIONAIRE-06      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-07: Verify the Device Usability Questionnaire is only displayed when the report is successfully unlocked
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report

    ...     Expected Output:
    ...     the Device Usability Questionnaire is only displayed when the report is successfully unlocked
    [Tags]      BIOC-QUESTIONAIRE-07      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-08: Verify the Device Usability Questionnaire is only visible with shared-report enabled study reports
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report

    ...     Expected Output:
    ...     the Device Usability Questionnaire is only visible with shared-report enabled study reports
    [Tags]      BIOC-QUESTIONAIRE-08      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-09: Verify the Device Usability Questionnaire not displayed with study report disabled shared-report
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Disable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report

    ...     Expected Output:
    ...     the Device Usability Questionnaire not displayed with study report disabled shared-report
    [Tags]      BIOC-QUESTIONAIRE-09      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-10: Verify the Device Usability Questionnaire will only be displayed the first time the user accesses the report after the user completes it, it will not be displayed again the next time the user accesses it.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Complete the survey
    ...    
    ...     Expected Output:
    ...     The device Usability Questionnaire will only be displayed the first time the user accesses the report after the user completes it, it will not be displayed again the next time the user accesses it
    [Tags]      BIOC-QUESTIONAIRE-10      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-11: Verify the question 1 can only select 1 option.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 or more options on the question 1
    ...
    ...     Expected Output:
    ...     the question 1 can only select 1 option
    [Tags]      BIOC-QUESTIONAIRE-11      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-12: Verify the question 1 automatically moves to the next question when the user selects an option.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...
    ...     Expected Output:
    ...     the question 1 automatically moves to the next question when the user selects an option.
    [Tags]      BIOC-QUESTIONAIRE-12      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-13: Verify the question 2 can only select 1 option.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose 1 or more options question 2
    ...
    ...     Expected Output:
    ...     the question 2 can only select 1 option
    [Tags]      BIOC-QUESTIONAIRE-13      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-14: Verify the question 2 automatically moves to the next question when the user choose " No " option.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose " No" option on the question 2
    ...
    ...     Expected Output:
    ...     the question 2 automatically moves to the next question when the user choose " No " option..
    [Tags]      BIOC-QUESTIONAIRE-14      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-15: Verify the question 2 display 4 options when the user choose " Yes " option.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose " Yes" option on the question 2
    ...
    ...     Expected Output:
    ...     the question 2 display 4 options when the user choose " Yes " option.
    ...     + Uncomfortable at times but usable 
    ...     + Uncomfortable and hard to wear 
    ...     + Had skin or physical issues 
    ...     + Other
    [Tags]      BIOC-QUESTIONAIRE-15      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-16: Verify the question 2 can select multiple options when the user choose " Yes " option.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose " Yes" option on the question 2
    ...     8. Select multiple options
    ...
    ...     Expected Output:
    ...     the question 2 can select multiple options when the user choose " Yes " option
    [Tags]      BIOC-QUESTIONAIRE-16      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-17: Verify the question 2 can select and unselect options when the user choose " Yes " option.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose " Yes" option on the question 2
    ...     8. Select any options
    ...     9. Unselect the option
    ...     Expected Output:
    ...     the question 2 can select and unselect options when the user choose " Yes " option
    [Tags]      BIOC-QUESTIONAIRE-17      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-18: Verify the Next button after choose option on the question 2.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose " Yes" option on the question 2
    ...     8. Select any options
    ...     9. Click Next button
    ...     Expected Output:
    ...     the Next button after choose option on the question 2
    [Tags]      BIOC-QUESTIONAIRE-18      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}    

BIOC-QUESTIONAIRE-19: Verify the text field display after choose " OtherS" option on the question 2.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose " Yes" option on the question 2
    ...     8. Select " OtherS" options
    ...     
    ...     Expected Output:
    ...     the Next button after choose option on the question 2
    [Tags]      BIOC-QUESTIONAIRE-19      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}       

BIOC-QUESTIONAIRE-20: Verify the text field display " Please specify" after choose " OtherS" option on the question 2.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose " Yes" option on the question 2
    ...     8. Select " OtherS" options
    ...
    ...     Expected Output:
    ...     the text field display " Please specify" after choose " OtherS" option on the question 2.
    [Tags]      BIOC-QUESTIONAIRE-20      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-21: Verify the " Please specify your response" dipslay when don't input the text field and click Next button.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose " Yes" option on the question 2
    ...     8. Select " OtherS" options
    ...     9. Don't input on the text field
    ...
    ...     Expected Output:
    ...    the " Please specify your response" dipslay when don't input the text field and click Next button.
    [Tags]      BIOC-QUESTIONAIRE-21      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-22: Verify the text field can accept unlimited characters and automatically moves to the next sentence when click Next button
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose " Yes" option on the question 2
    ...     8. Select " OtherS" options
    ...     9. Input 1000 or more characters on the text field
    ...     10. Click Next button
    ...
    ...     Expected Output:
    ...    the text field can accept unlimited characters and automatically moves to the next sentence when click Next button.
    [Tags]      BIOC-QUESTIONAIRE-22      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-23: Verify the question 3 can only select 1 option.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose options question 2
    ...     8. Choose 1 or more options on the question 3
    ...
    ...     Expected Output:
    ...     the question 3 can only select 1 option
    [Tags]      BIOC-QUESTIONAIRE-23      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-24: Verify the question 3 automatically moves to the next question when the user choose " No " option.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose options question 2
    ...     8. Choose " No" options on the question 3
    ...
    ...     Expected Output:
    ...     the question 2 automatically moves to the next question when the user choose " No " option.
    [Tags]      BIOC-QUESTIONAIRE-24      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-25: Verify the question 3 display 8 options when the user choose " Yes " option.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose options question 2
    ...     8. Choose " Yes" option on the question 3
    ...
    ...     Expected Output:
    ...     the question 3 display 8 options when the user choose " Yes " option.
    ...     + Setting up the device
    ...     + Connecting the device to the app
    ...     + Navigating through the app’s features
    ...     + Status lights indicator
    ...     + In-app notification
    ...     + Battery or charging issues
    ...     + Technical issues
    ...     + Other
    [Tags]      BIOC-QUESTIONAIRE-25      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-26: Verify the question 3 can select multiple options when the user choose " Yes " option.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose options question 2
    ...     8. Choose " Yes" option on the question 3
    ...     9. Select multiple options
    ...
    ...     Expected Output:
    ...     the question 3 can select multiple options when the user choose " Yes " option
    [Tags]      BIOC-QUESTIONAIRE-26      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-27: Verify the question 3 can select and unselect options when the user choose " Yes " option.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose options question 2
    ...     8. Choose " Yes" option on the question 3
    ...     9. Select any options
    ...     10. Unselect the option
    ...     Expected Output:
    ...     the question 3 can select and unselect options when the user choose " Yes " option
    [Tags]      BIOC-QUESTIONAIRE-27      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-28: Verify the Next button after choose option on the question 3.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose options question 2
    ...     8. Choose " Yes" option on the question 2
    ...     9. Select any options
    ...     10. Click Next button
    ...     Expected Output:
    ...     the Next button after choose option on the question 3
    [Tags]      BIOC-QUESTIONAIRE-28      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}    

BIOC-QUESTIONAIRE-29: Verify the text field display after choose " OtherS" option on the question 3.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose options question 2
    ...     8. Choose " Yes" option on the question 3
    ...     9. Select " OtherS" options
    ...     
    ...     Expected Output:
    ...     the Next button after choose option on the question 3
    [Tags]      BIOC-QUESTIONAIRE-29      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}       

BIOC-QUESTIONAIRE-30: Verify the text field display " Please specify" after choose " OtherS" option on the question 3.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose options question 2
    ...     8. Choose " Yes" option on the question 3
    ...     9. Select " OtherS" options
    ...
    ...     Expected Output:
    ...     the text field display " Please specify" after choose " OtherS" option on the question 3.
    [Tags]      BIOC-QUESTIONAIRE-30      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-31: Verify the " Please specify your response" dipslay when don't input the text field and click Next button.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose options question 2
    ...     8. Choose " Yes" option on the question 3
    ...     9. Select " OtherS" options
    ...     10. Don't input on the text field
    ...
    ...     Expected Output:
    ...    the " Please specify your response" dipslay when don't input the text field and click Next button.
    [Tags]      BIOC-QUESTIONAIRE-31      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-32: Verify the text field can accept unlimited characters and automatically moves to the next sentence when click Next button
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose options question 2
    ...     8. Choose " Yes" option on the question 3
    ...     9. Select " OtherS" options
    ...     10. Input 1000 or more characters on the text field
    ...     11. Click Next button
    ...
    ...     Expected Output:
    ...    the text field can accept unlimited characters and automatically moves to the next sentence when click Next button.
    [Tags]      BIOC-QUESTIONAIRE-32      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}    

BIOC-QUESTIONAIRE-33: Verify the question 4 can only select 1 option.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose options question 2
    ...     8. Choose options question 3
    ...     9. Choose 1 or more options on the question 4
    ...
    ...     Expected Output:
    ...     the question 4 can only select 1 option
    [Tags]      BIOC-QUESTIONAIRE-33      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-34: Verify the system automatically moves to the next question if choose one of the following options: Very comfortable, Somewhat comfortable, Neutral.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose options question 2
    ...     8. Choose options question 3
    ...     9. Choose 1 of 3 options (Very comfortable, Somewhat comfortable, Neutral) on the question 4
    ...
    ...     Expected Output:
    ...     the system automatically moves to the next sentence, if you choose one of the following options: Very comfortable, Somewhat comfortable, Neutral.
    [Tags]      BIOC-QUESTIONAIRE-34      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-35: Verify the Addtional section display if choose one of the following options: Very uncomfortable, Somewhat uncomfortable.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose options question 2
    ...     8. Choose options question 3
    ...     9. Choose 1 of 2 options (Very comfortable, Somewhat comfortable) on the question 4
    ...
    ...     Expected Output:
    ...     the Addtional section display if choose one of the following options: Very comfortable, Somewhat comfortable.
    [Tags]      BIOC-QUESTIONAIRE-35      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-36: Verify the Addtional section display 4 options: Skin irritation or discomfort over time, Too bulky or heavy during activity, Too bulky or heavy during sleep, Other. If choose one of the following options: Very uncomfortable, Somewhat uncomfortable.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose options question 2
    ...     8. Choose options question 3
    ...     9. Choose 1 of 2 options (Very uncomfortable, Somewhat uncomfortable) on the question 4
    ...
    ...     Expected Output:
    ...     the Addtional section display 4 options: Skin irritation or discomfort over time, Too bulky or heavy during activity, Too bulky or heavy during sleep, Other. If choose one of the following options: Very uncomfortable, Somewhat uncomfortable..
    [Tags]      BIOC-QUESTIONAIRE-36      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-37: Verify the options can select multiples on the Addtional section
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose options question 2
    ...     8. Choose options question 3
    ...     9. Choose 1 of 2 options (Very uncomfortable, Somewhat uncomfortable) on the question 4
    ...     10. Select multiple options
    ...
    ...     Expected Output:
    ...    the options can select multiples on the Addtional section
    [Tags]      BIOC-QUESTIONAIRE-37      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-38: Verify the question 4 can select and unselect options on the Addtional section.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose options question 2
    ...     8. Choose options question 3
    ...     9. Choose 1 of 2 options (Very uncomfortable, Somewhat uncomfortable) on the question 4
    ...     10. Select any options
    ...     11. Unselect the option
    ...     Expected Output:
    ...     Verify the question 4 can select and unselect options on the Addtional section.
    [Tags]      BIOC-QUESTIONAIRE-38      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-39: Verify the Next button after choose option on the Addtional section.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose options question 2
    ...     8. Choose options question 3
    ...     9. Choose 1 of 2 options (Very uncomfortable, Somewhat uncomfortable) on the question 4
    ...     10. Select any options
    ...     11. Click Next button
    ...     Expected Output:
    ...     the Next button after choose option on the Addtional section
    [Tags]      BIOC-QUESTIONAIRE-39      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-40: Verify the text field display after choose " OtherS" option on the Addtional section.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose options question 2
    ...     8. Choose options question 3
    ...     9. Choose 1 of 2 options (Very uncomfortable, Somewhat uncomfortable) on the Addtional section
    ...     10. Select " OtherS" options
    ...
    ...     Expected Output:
    ...     the Next button after choose option on the question 43
    [Tags]      BIOC-QUESTIONAIRE-40      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-41: Verify the text field display " Please specify" after choose " OtherS" on the Addtional section.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose options question 2
    ...     8. Choose options question 3
    ...     9. Choose 1 of 2 options (Very uncomfortable, Somewhat uncomfortable) on the Addtional section
    ...     10. Select " OtherS" options
    ...
    ...     Expected Output:
    ...     the text field display " Please specify" after choose " OtherS" option on the Addtional section.
    [Tags]      BIOC-QUESTIONAIRE-41      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-42: Verify the text field can accept unlimited characters and automatically moves to the next question 5 when click Next button
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Choose options question 2
    ...     8. Choose options question 3
    ...     9. Choose 1 of 2 options (Very uncomfortable, Somewhat uncomfortable) on the Addtional section
    ...     10. Select " OtherS" options
    ...     11. Input 1000 or more characters on the text field
    ...     12. Click Next button
    ...
    ...     Expected Output:
    ...    the text field can accept unlimited characters and automatically moves to the question 5 when click Next button.
    [Tags]      BIOC-QUESTIONAIRE-42      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-43: Verify the question 5 can only select 1 option.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4
    ...     7. Choose 1 or more options on the question 5
    ...
    ...     Expected Output:
    ...     the question 5 can only select 1 option
    [Tags]      BIOC-QUESTIONAIRE-43      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-44: Verify the system automatically moves to the next question if choose one of the following options: Not at all, Hardly noticed.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4
    ...     7. Choose 1 of 2 options (Not at all, Hardly noticed.) on the question 5
    ...
    ...     Expected Output:
    ...    the system automatically moves to the next question if choose one of the following options: Not at all, Hardly noticed.
    [Tags]      BIOC-QUESTIONAIRE-44      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-45: Verify the Addtional section display if choose one of the following options: Occasionally, Frequently.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4
    ...     7. Choose 1 of 2 options (Occasionally, Frequently) on the question 5
    ...
    ...     Expected Output:
    ...    the Addtional section display if choose one of the following options: Occasionally, Frequently..
    [Tags]      BIOC-QUESTIONAIRE-45      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-46: Verify the Addtional section display 4 options: Skin irritation or discomfort over time, Too bulky or heavy during activity, Too bulky or heavy during sleep, Other. If choose one of the following options: Very uncomfortable, Somewhat uncomfortable.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4
    ...     7. Choose 1 of 2 options (Occasionally, Frequently) on the question 5
    ...
    ...     Expected Output:
    ...     the Addtional section display 4 options: Skin irritation or discomfort over time, Too bulky or heavy during activity, Too bulky or heavy during sleep, Other. If choose one of the following options: Very uncomfortable, Somewhat uncomfortable..
    [Tags]      BIOC-QUESTIONAIRE-46      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-47: Verify the options can select multiples on the Addtional section
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4
    ...     7. Choose 1 of 2 options (Occasionally, Frequently) on the question 5
    ...     8. Select multiple options
    ...
    ...     Expected Output:
    ...    the options can select multiples on the Addtional section
    [Tags]      BIOC-QUESTIONAIRE-47      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-48: Verify the question 5 can select and unselect options on the Addtional section.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4
    ...     7. Choose 1 of 2 options (Occasionally, Frequently) on the question 5
    ...     8. Select any options
    ...     9. Unselect the option
    ...     Expected Output:
    ...     Verify the question 5 can select and unselect options on the Addtional section.
    [Tags]      BIOC-QUESTIONAIRE-48      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-49: Verify the text field can accept unlimited characters and automatically moves to the next question 6 when click Next button
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4
    ...     7. Choose 1 of 2 options (Occasionally, Frequently) on the question 5
    ...     10. Select " OtherS" options
    ...     11. Input 1000 or more characters on the text field
    ...     12. Click Next button
    ...
    ...     Expected Output:
    ...    the text field can accept unlimited characters and automatically moves to the question 6 when click Next button.
    [Tags]      BIOC-QUESTIONAIRE-49      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-50: Verify the question 6 can only select 1 option.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4, 5
    ...     7. Choose 1 or more options on the question 6
    ...
    ...     Expected Output:
    ...     the question 6 can only select 1 option
    [Tags]      BIOC-QUESTIONAIRE-50      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-51: Verify the system automatically moves to the next question if choose one of the 3 options
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4
    ...     7. Choose 1 of 3 options on the question 5
    ...
    ...     Expected Output:
    ...    the system automatically moves to the next question if choose one of the 3 options.
    [Tags]      BIOC-QUESTIONAIRE-51      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-52: Verify the question 7 can only select 1 option.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4, 5, 6
    ...     7. Choose 1 or more options on the question 7
    ...
    ...     Expected Output:
    ...     the question 7 can only select 1 option
    [Tags]      BIOC-QUESTIONAIRE-52      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-53: Verify the system automatically moves to the next question if choose " No" options
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4, 5, 6
    ...     7. Choose " No" options on the question 7
    ...
    ...     Expected Output:
    ...    the system automatically moves to the next question if choose " No" options.
    [Tags]      BIOC-QUESTIONAIRE-53      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-54: Verify the Addtional section display if choose one of the " Yes" options.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4, 5, 6
    ...     7. Choose " Yes" options on the question 7
    ...
    ...     Expected Output:
    ...   the 6 options display: Setup or initial connection, Wearing the device correctly, Navigating the app or interface, Device functionality (e.g., turning on/off, charging), Technical issues (e.g., connectivity problems), Other  if choose one of the " Yes" options.
    [Tags]      BIOC-QUESTIONAIRE-54      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-55: Verify the options can select multiples
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4, 5, 6
    ...     7. Choose " Yes" options on the question 7
    ...     8. Select multiple options
    ...
    ...     Expected Output:
    ...    the options can select multiples
    [Tags]      BIOC-QUESTIONAIRE-55      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-56: Verify the question 7 can select and unselect options.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4
    ...     7. Choose " Yes" options on the question 7
    ...     8. Select any options
    ...     9. Unselect the option
    ...     Expected Output:
    ...     Verify the question 7 can select and unselect options.
    [Tags]      BIOC-QUESTIONAIRE-56      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-57: Verify the text field can accept unlimited characters and automatically moves to the next question 8 when click Next button
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4, 5, 6
    ...     7. Choose " Yes" options on the question 7
    ...     10. Select " OtherS" options
    ...     11. Input 1000 or more characters on the text field
    ...     12. Click Next button
    ...
    ...     Expected Output:
    ...    the text field can accept unlimited characters and automatically moves to the question 8 when click Next button.
    [Tags]      BIOC-QUESTIONAIRE-57      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-58: Verify the question 8 can only select 1 option.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4, 5, 6,, 7, 8
    ...     7. Choose 1 or more options on the question 8
    ...
    ...     Expected Output:
    ...     the question 8 can only select 1 option
    [Tags]      BIOC-QUESTIONAIRE-58      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-59: Verify the system automatically moves to the next question if choose " No" options
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4, 5, 6, 7
    ...     7. Choose " No" options on the question 8
    ...
    ...     Expected Output:
    ...    the system automatically moves to the next question if choose " No" options.
    [Tags]      BIOC-QUESTIONAIRE-59      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-60: Verify the text field display after choose " Yes" option on the question 8.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4, 5, 6, 7
    ...     7. Choose " Yes" options on the question 8
    ...
    ...     Expected Output:
    ...     the Next button after choose option on the question 8
    [Tags]      BIOC-QUESTIONAIRE-60      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-61: Verify the text field can accept unlimited characters and automatically moves to the next question 9 when click Next button
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4, 5, 6, 7
    ...     7. Choose " No" options on the question 8
    ...     8. Input 1000 or more characters on the text field
    ...     9. Click Next button
    ...
    ...     Expected Output:
    ...    the text field can accept unlimited characters and automatically moves to the question 9 when click Next button.
    [Tags]      BIOC-QUESTIONAIRE-61      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-62: Verify the question 9 can only select 1 option.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4, 5, 6, 7, 8
    ...     7. Choose 1 or more options on the question 9
    ...
    ...     Expected Output:
    ...     the question 9 can only select 1 option
    [Tags]      BIOC-QUESTIONAIRE-62      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-63: Verify the system automatically moves to the next question if choose " No" options
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4, 5, 6, 7, 8
    ...     7. Choose " No" options on the question 9
    ...
    ...     Expected Output:
    ...    the system automatically moves to the next question if choose " No" options.
    [Tags]      BIOC-QUESTIONAIRE-63      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-64: Verify the 5 options display if choose one of the " Yes" options.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4, 5, 6, 7, 8
    ...     7. Choose " Yes" options on the question 9
    ...
    ...     Expected Output:
    ...   the 5 options display: Redness or itching, Rash or blistering, Sensitivity or irritation after removal, Discomfort from adhesive or material, Other if choose one of the " Yes" options.
    [Tags]      BIOC-QUESTIONAIRE-64      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-65: Verify the options can select multiples
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4, 5, 6, 7, 8
    ...     7. Choose " Yes" options on the question 9
    ...     8. Select multiple options
    ...
    ...     Expected Output:
    ...    the options can select multiples
    [Tags]      BIOC-QUESTIONAIRE-65      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-66: Verify the question 9 can select and unselect options.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4, 5, 6, 7, 8
    ...     7. Choose " Yes" options on the question 9
    ...     8. Select any options
    ...     9. Unselect the option
    ...     Expected Output:
    ...     Verify the question 9 can select and unselect options.
    [Tags]      BIOC-QUESTIONAIRE-66      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-67: Verify the text field can accept unlimited characters and automatically moves to the next question 10 when click Next button
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4, 5, 6, 7, 8
    ...     7. Choose " Yes" options on the question 9
    ...     10. Select " OtherS" options
    ...     11. Input 1000 or more characters on the text field
    ...     12. Click Next button
    ...
    ...     Expected Output:
    ...    the text field can accept unlimited characters and automatically moves to the question 10 when click Next button.
    [Tags]      BIOC-QUESTIONAIRE-67      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-68: Verify the question 10 can only select 1 option.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4, 5, 6, 7, 8, 9
    ...     7. Choose 1 or more options on the question 10
    ...
    ...     Expected Output:
    ...     the question 10 can only select 1 option
    [Tags]      BIOC-QUESTIONAIRE-68      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-69: Verify the system automatically moves to the next question if choose " No" options
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4, 5, 6, 7, 8, 9
    ...     7. Choose " No" options on the question 10
    ...
    ...     Expected Output:
    ...    the system automatically moves to the next question if choose " No" options.
    [Tags]      BIOC-QUESTIONAIRE-69     BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-70: Verify the 9 options display if choose one of the " Yes" options.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4, 5, 6, 7, 8, 9
    ...     7. Choose " No" options on the question 10
    ...
    ...     Expected Output:
    ...   the 9 options display if choose one of the " Yes" options.
    [Tags]      BIOC-QUESTIONAIRE-70      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-71: Verify the options can select multiples
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4, 5, 6, 7, 8, 9
    ...     7. Choose " No" options on the question 10
    ...     8. Select multiple options
    ...
    ...     Expected Output:
    ...    the options can select multiples
    [Tags]      BIOC-QUESTIONAIRE-71      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-72: Verify the question 10 can select and unselect options.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4, 5, 6, 7, 8, 9
    ...     7. Choose " No" options on the question 10
    ...     8. Select any options
    ...     9. Unselect the option
    ...     Expected Output:
    ...     Verify the question 10 can select and unselect options.
    [Tags]      BIOC-QUESTIONAIRE-72     BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-73: Verify the text field can accept unlimited characters and automatically moves to the next question when click Next button
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose options question 1, 2, 3, 4, 5, 6, 7, 8
    ...     7. Choose " Yes" options on the question 9
    ...     10. Select " OtherS" options
    ...     11. Input 1000 or more characters on the text field
    ...     12. Click Next button
    ...
    ...     Expected Output:
    ...    the text field can accept unlimited characters and automatically moves to the question when click Next button.
    [Tags]      BIOC-QUESTIONAIRE-73      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-74: Verify the Back button will be displayed from question 2
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Check the Back button on the question 2
    ...
    ...     Expected Output:
    ...    the Back button will be displayed from question 2.
    [Tags]      BIOC-QUESTIONAIRE-74      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-75: Verify the app will take the user back to the previous question, When clicking the Back button
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Click the Back button on the question 2
    ...
    ...     Expected Output:
    ...    the app will take the user back to the previous question, When clicking the Back button.
    [Tags]      BIOC-QUESTIONAIRE-75      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-76: Verify the Next button will be displayed in question 1 if user clicks Back button in question 2
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Click the Back button on the question 2
    ...
    ...     Expected Output:
    ...    the Next button will be displayed in question 1 if user clicks Back button in question 2.
    [Tags]      BIOC-QUESTIONAIRE-76      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-77: Verify the app will display the loading frame and then the "Thank you" screen, When you click the Next button in the last question
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the last question
    ...
    ...     Expected Output:
    ...    the app will display the loading frame and then the "Thank you" screen, When you click the Next button in the last question.
    [Tags]      BIOC-QUESTIONAIRE-77      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-78: Verify the Next button will be displayed in question 1 if user clicks Back button in question 2
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Click the Back button on the question 2
    ...
    ...     Expected Output:
    ...    the Next button will be displayed in question 1 if user clicks Back button in question 2.
    [Tags]      BIOC-QUESTIONAIRE-78      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-79: Verify The UI of the loading frame is similar to the UI on figma
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the last question
    ...
    ...     Expected Output:
    ...    The UI of the loading frame is similar to the UI on figma
    [Tags]      BIOC-QUESTIONAIRE-79      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-80: Verify the "Thank you" screen similar to UI on figma
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the last question
    ...
    ...     Expected Output:
    ...    the "Thank you" screen similar to UI on figma.
    [Tags]      BIOC-QUESTIONAIRE-80      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-81: Verify the X button will display from question 1.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...
    ...     Expected Output:
    ...    the X button will display from question 1
    [Tags]      BIOC-QUESTIONAIRE-81      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-82: Verify The app will display a notification modal when clicking the X button.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Click X button
    ...
    ...     Expected Output:
    ...    The app will display a notification modal when clicking the X button.
    [Tags]      BIOC-QUESTIONAIRE-82      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-83: Verify The UI of the notification modal is the same as the UI on figma.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Click X button
    ...
    ...     Expected Output:
    ...    The UI of the notification modal is the same as the UI on figma.
    [Tags]      BIOC-QUESTIONAIRE-83      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-84: Verify the user will return to the current question when clicking the "Continue Survey" button.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Click the X button on the question 2
    ...     8. Click the " Continue Survey" button
    ...
    ...     Expected Output:
    ...    The user will return to the current question when clicking the "Continue Survey" button.
    [Tags]      BIOC-QUESTIONAIRE-84      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-85: Verify the user will be returned to the page before starting survey when clicking on "Leave Anyway" button.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     7. Click the X button on the question 2
    ...     8. Click the " Leave Anyway" button
    ...
    ...     Expected Output:
    ...    The user will return to the current question when clicking the "Leave Anyway" button.
    [Tags]      BIOC-QUESTIONAIRE-85      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-86: Verify the rate app pop-up will appear asking users to rate the app upon completing the survey.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Complete the survey
    ...
    ...     Expected Output:
    ...    The user will return to the current question when clicking the "Continue Survey" button.
    [Tags]      BIOC-QUESTIONAIRE-86      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-QUESTIONAIRE-87: Verify the UI of the rate app pop-up is similar to the UI on figma.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Enable share Report on the Admin portal
    ...     - Create the study on the Diagnostic portal
    ...     - Stop the study
    ...     - Create the report
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Service tab
    ...     3. CLick the report study
    ...     4. Unlock the report
    ...     5. Click Start survey
    ...     6. Choose 1 option on the question 1
    ...     5. Click Start survey
    ...     6. Complete the survey
    ...
    ...     Expected Output:
    ...    The UI of the rate app pop-up is similar to the UI on figma..
    [Tags]      BIOC-QUESTIONAIRE-87      BIOC-2.3.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
*** Keywords ***
SUITE SETUP
    ${APP_NODE}       Get Device Node
    Import Library    project_biocare_app/lib/mapp/Common.py     ${APP_NODE}     ${ENV}
    Start Biocare App
    ${USER}     Get Config Param    USER
    Sign In Biocare App    email=${USER}[username]      password=${USER}[password]
    ${RELEASE_VERSION}     Get Release Version
    Set Suite Metadata     version     ${RELEASE_VERSION}

SUITE TEARDOWN
    Quit All
