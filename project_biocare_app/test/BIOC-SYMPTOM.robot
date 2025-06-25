*** Settings ***
Documentation   Biocare app Authen test suite
Metadata    sid     BIOC-SYMPTOM
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-SYMPTOM   mapp
Test Timeout    1h

*** Test Cases ***
BIOC-SYMPTOM-EDIT-01: Verify The "Edit symptom(s)" bottomsheet can display When click " Edit Symptom" button
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal 
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Edit the Symptom
    ...
    ...     Expected Output:
    ...    The "Edit symptom(s)" bottomsheet can display When click " Edit Symptom" button
    [Tags]      BIOC-SYMPTOM-EDIT-01       BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-EDIT-02: Verify the data displayed in the "Edit symptoms" bottom sheet is the latest data.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Edit the Symptom
    ...     9. Click Submit button
    ...
    ...     Expected Output:
    ...    The data displayed in the "Edit symptoms" bottom sheet is the latest data
    [Tags]      BIOC-SYMPTOM-EDIT-02       BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-EDIT-03: Verify the UI in "Edit symptom(s)" bottomsheet before editing symptom is similar to design on figma.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Edit the Symptom
    ...
    ...     Expected Output:
    ...    The UI in "Edit symptom(s)" bottomsheet before editing symptom is similar to design on figma.
    [Tags]      BIOC-SYMPTOM-EDIT-03       BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-EDIT-04: Verify the UI in "Edit symptom(s)" bottomsheet after editing symptom is similar to design on figma.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Edit the Symptom
    ...     9. Click Submit button
    ...
    ...     Expected Output:
    ...    The UI in "Edit symptom(s)" bottomsheet after editing symptom is similar to design on figma.
    [Tags]      BIOC-SYMPTOM-EDIT-04       BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-EDIT-05: Verify the default list of symptoms displayed as ( Palpiations, Shortness of breath, Dizziness, Chest pain or pressure, Other symptoms (Describe)).
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Edit the Symptom
    ...
    ...     Expected Output:
    ...    The default list of symptoms displayed as ( Palpiations, Shortness of breath, Dizziness, Chest pain or pressure, Other symptoms (Describe))..
    [Tags]      BIOC-SYMPTOM-EDIT-05       BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-EDIT-06: Verify the sympton can select 1 or more at the same time when editing the symptom.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Edit the Symptom
    ...     9. Choose the 1 or more symptom
    ...
    ...     Expected Output:
    ...    The sympton can select 1 or more at the same time when editing the symptom.
    [Tags]      BIOC-SYMPTOM-EDIT-06       BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-EDIT-07: Verify the sympton can deselect 1 or more at once when editing the symptom.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add 1 or more the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Edit the Symptom
    ...     9. Deselect the 1 or more symptom
    ...
    ...     Expected Output:
    ...    The sympton can deselect 1 or more at once when editing the symptom.
    [Tags]      BIOC-SYMPTOM-EDIT-07       BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-EDIT-08: Verify the text field will appear below and the user can input text successfully when tapping on the "Other symptoms (Describe)" option.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Edit the Symptom
    ...     9. Choose the " Other symptoms (Describe)" option
    ...
    ...     Expected Output:
    ...    The text field will appear below and the user can input text successfully when tapping on the "Other symptoms (Describe)" option.
    [Tags]      BIOC-SYMPTOM-EDIT-08       BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-EDIT-09: Verify The app will automatically scroll down to the text field so that the user can see this input section when tapping on the "Other symptoms (Describe)" option.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Edit the Symptom
    ...     9. Choose the " Other symptoms (Describe)" option
    ...
    ...     Expected Output:
    ...    The app will automatically scroll down to the text field so that the user can see this input section when tapping on the "Other symptoms (Describe)" option.
    [Tags]      BIOC-SYMPTOM-EDIT-09       BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-EDIT-10: Verify the Text field input up to 100 characters when ipnut text on the "Other symptoms (Describe)".
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Edit the Symptom
    ...     9. Choose the " Other symptoms (Describe)" option
    ...     10. Input up to 100 characters
    ...
    ...     Expected Output:
    ...    the Text field input up to 100 characters when ipnut text on the "Other symptoms (Describe)".
    [Tags]      BIOC-SYMPTOM-EDIT-10       BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-EDIT-11: Verify the Text field can't input more than 100 characters when input text on the "Other symptoms (Describe)".
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Edit the Symptom
    ...     9. Choose the " Other symptoms (Describe)" option
    ...     10. Input more than 100 characters
    ...
    ...     Expected Output:
    ...    the Text field can't input more than 100 characters when input text on the "Other symptoms (Describe)".
    [Tags]      BIOC-SYMPTOM-EDIT-11       BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-EDIT-12: Verify the symptom can save successfully with 0 characters when input text on the "Other symptoms (Describe)".
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Edit the Symptom
    ...     9. Choose the " Other symptoms (Describe)" option
    ...     10. Don't input characters
    ...
    ...     Expected Output:
    ...     the symptom can save successfully with 0 characters when input text on the "Other symptoms (Describe)".
    [Tags]      BIOC-SYMPTOM-EDIT-12       BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-EDIT-13: Verify the symptom can save successfully with 1 characters when input text on the "Other symptoms (Describe)".
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Edit the Symptom
    ...     9. Choose the " Other symptoms (Describe)" option
    ...     10. Input one character
    ...
    ...     Expected Output:
    ...     the symptom can save successfully with 1 characters when input text on the "Other symptoms (Describe)".
    [Tags]      BIOC-SYMPTOM-EDIT-13       BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-EDIT-14: Verify the symptom can save successfully with 100 characters when input text on the "Other symptoms (Describe)".
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Edit the Symptom
    ...     9. Choose the " Other symptoms (Describe)" option
    ...     10. Input 100 characters
    ...
    ...     Expected Output:
    ...     the symptom can save successfully with 100 characters when input text on the "Other symptoms (Describe)".
    [Tags]      BIOC-SYMPTOM-EDIT-14       BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-EDIT-15: Verify The Symptom can save successfully when selecting multiple symptoms.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Edit the Symptom
    ...     9. Choose the multiple symptoms
    ...     10. Click Submit button
    ...
    ...     Expected Output:
    ...     The Symptom can save successfully when selecting multiple symptoms.
    [Tags]      BIOC-SYMPTOM-EDIT-15       BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-EDIT-16: Verify the "A symptom has been updated" snack bar will be displayed if the symptom was submitted successfully
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Edit the Symptom
    ...     9. Choose the multiple symptoms
    ...     10. Click Submit button
    ...
    ...     Expected Output:
    ...     The "A symptom has been updated" snack bar will be displayed if the symptom was submitted successfully.
    [Tags]      BIOC-SYMPTOM-EDIT-16       BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-EDIT-17: Verify the "Edit symptom(s)" bottomsheet will be closed and returned to the Symptom diary interface when click Submit button.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Edit the Symptom
    ...     9. Choose the multiple symptoms
    ...     10. Click Submit button
    ...
    ...     Expected Output:
    ...     The "Edit symptom(s)" bottomsheet will be closed and returned to the Symptom diary interface when when click Submit button.
    [Tags]      BIOC-SYMPTOM-EDIT-17       BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-EDIT-18: Verify the "Edit symptom(s)" bottomsheet will be closed and returned to the Symptom diary interface when when click Close button
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Edit the Symptom
    ...     9. Choose the multiple symptoms
    ...     10. Click Submit button
    ...
    ...     Expected Output:
    ...     The "Edit symptom(s)" bottomsheet will be closed and returned to the Symptom diary interface when click Close button.
    [Tags]      BIOC-SYMPTOM-EDIT-18       BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-EDIT-19: Verify the symptom Diary still shows the number of symptoms added correctly after editing
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Edit the Symptom
    ...     9. Choose the multiple symptoms
    ...     10. Click Submit button
    ...     11. Check the number of symptoms on the symptom Diary
    ...
    ...     Expected Output:
    ...     The symptom Diary still shows the number of symptoms added correctly after editing.
    [Tags]      BIOC-SYMPTOM-EDIT-19       BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-EDIT-20: Verify the latest edited Symptom data will be displayed correctly on Symptom Diary
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Edit the Symptom
    ...     9. Choose the multiple symptoms
    ...     10. Click Submit button
    ...
    ...     Expected Output:
    ...     The latest edited Symptom data will be displayed correctly on Symptom Diary.
    [Tags]      BIOC-SYMPTOM-EDIT-20       BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BIOC-SYMPTOM-EDIT-21: Verify the Heart Studies section displays the correct number of symptoms added after editing
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Edit the Symptom
    ...     9. Choose the multiple symptoms
    ...     10. Click Submit button
    ...     11. Click Back button
    ...
    ...     Expected Output:
    ...     The Heart Studies section displays the correct number of symptoms added after editing.
    [Tags]      BIOC-SYMPTOM-EDIT-21       BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-EDIT-22: Verify the "No internet"" snack bar display if app has no network when editing symptom
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. The app have issue about API
    ...     9. Edit the Symptom
    ...     10. Choose the multiple symptoms
    ...     11. Click Submit button
    ...
    ...     Expected Output:
    ...    the "No internet"" snack bar display if app has no network when editing symptom
    [Tags]      BIOC-SYMPTOM-EDIT-22      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-EDIT-23: Verify the "Something went wrong. Please try again" snack bar will be displayed if the app has any unknown error when editing symptom
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. The app have issue about API
    ...     9. Edit the Symptom
    ...     10. Choose the multiple symptoms
    ...     11. Click Submit button
    ...
    ...     Expected Output:
    ...     the "Something went wrong. Please try again" snack bar will be displayed if the app has any unknown error when editing symptom
    [Tags]      BIOC-SYMPTOM-EDIT-23      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BIOC-SYMPTOM-DELETE-01: Verify the red Delete icon button will appear when selecting a symptom and swiping left.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Swiping left
    ...
    ...     Expected Output:
    ...    the red Delete icon button will appear when selecting a symptom and swiping left
    [Tags]      BIOC-SYMPTOM-DELETE-01      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-DELETE-02: Verify the "Delete symptom" modal will be displayed when clicking on Delete icon button.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Swiping left
    ...     9. Click Delete icon
    ...
    ...     Expected Output:
    ...    the "Delete symptom" modal will be displayed when clicking on Delete icon button.
    [Tags]      BIOC-SYMPTOM-DELETE-02      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-DELETE-03: Verify the "Delete symptom" modal is similar to the design on figma.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Swiping left
    ...     9. Click Delete icon
    ...
    ...     Expected Output:
    ...   the "Delete symptom" modal is similar to the design on figma.
    [Tags]      BIOC-SYMPTOM-DELETE-03      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-DELETE-04: Verify the symptom can be deleted if you click the Delete button in the modal.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Swiping left
    ...     9. Click Delete icon
    ...     10. Click Delete button
    ...
    ...     Expected Output:
    ...   the symptom can be deleted if you click the Delete button in the modal
    [Tags]      BIOC-SYMPTOM-DELETE-04      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-DELETE-05: Verify the "Symptom has been deleted successfully" snack bar will show if symptom was deleted successfully.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Swiping left
    ...     9. Click Delete icon
    ...     10. Click Delete button
    ...
    ...     Expected Output:
    ...   the "Symptom has been deleted successfully" snack bar will show if symptom was deleted successfully
    [Tags]      BIOC-SYMPTOM-DELETE-05      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-DELETE-06: Verify the modal will close and return to the Symptom Diary interface when clicking the Cancel button on the modal.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Swiping left
    ...     9. Click Delete icon
    ...     10. Click Delete button
    ...
    ...     Expected Output:
    ...   The modal will close and return to the Symptom Diary interface when clicking the Cancel button on the modal.
    [Tags]      BIOC-SYMPTOM-DELETE-06      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-DELETE-07: Verify the symptom Diary displays symptoms number after deletion correctly
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Swiping left
    ...     9. Click Delete icon
    ...     10. Click Delete button
    ...     11. Check the symptom number on the symptom Diary
    ...
    ...     Expected Output:
    ...   the symptom Diary displays symptoms number after deletion correctly
    [Tags]      BIOC-SYMPTOM-DELETE-07      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-DELETE-08: Verify the red Delete icon button will hide when swiping back to the right.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Swiping left
    ...     9. Swipping Right
    ...
    ...     Expected Output:
    ...   the red Delete icon button will hide when swiping back to the right.
    [Tags]      BIOC-SYMPTOM-DELETE-08      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BIOC-SYMPTOM-DELETE-09: Verify the "No internet" snack bar will show if app has no internet when delete symptom.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Swiping left
    ...     9. Turn off the internet
    ...     10. Click Delete icon
    ...     11. Click Delete button
    ...
    ...     Expected Output:
    ...   The "No internet" snack bar will show if app has no internet when delete symptom.
    [Tags]      BIOC-SYMPTOM-DELETE-09      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-DELETE-10: Verify the "Something went wrong. Please try again" snack bar will be displayed if the app has any unknown error when deleting symptom
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Swiping left
    ...     9. The app have issue
    ...     10. Click Delete icon
    ...     11. Click Delete button
    ...
    ...     Expected Output:
    ...   the "Something went wrong. Please try again" snack bar will be displayed if the app has any unknown error when deleting symptom.
    [Tags]      BIOC-SYMPTOM-DELETE-10      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-OFFLINE-01: Verify the user can edit symptom when device status is offline
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Turn off the internet
    ...     9. Edit the Symptom
    ...     10. Choose the multiple symptoms
    ...     11. Click Submit button
    ...
    ...     Expected Output:
    ...   the user can edit symptom when device status is offline.
    [Tags]      BIOC-SYMPTOM-OFFLINE-01      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-OFFLINE-02: Verify the user can see the newly edited symptom with device status as offline
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Turn off the internet
    ...     9. Edit the Symptom
    ...     10. Choose the multiple symptoms
    ...     11. Click Submit button
    ...
    ...     Expected Output:
    ...   the user can see the newly edited symptom with device status as offline
    [Tags]      BIOC-SYMPTOM-OFFLINE-02      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-OFFLINE-03: Verify the user can delete symptom when device status is offline
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Swiping left
    ...     9. Turn off the internet
    ...     10. Click Delete icon
    ...     11. Click Delete button
    ...
    ...     Expected Output:
    ...   the user can seen symptom when device status is offline
    [Tags]      BIOC-SYMPTOM-OFFLINE-03      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-OFFLINE-04: Verify the user can see the symptoms list just deleted with device status offline
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Swiping left
    ...     9. Turn off the internet
    ...     10. Click Delete icon
    ...     11. Click Delete button
    ...
    ...     Expected Output:
    ...   the user can seen symptom when device status is offline
    [Tags]      BIOC-SYMPTOM-OFFLINE-04      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-OFFLINE-05: Verify the Snackbar will automatically disappear after 3s
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Choose the symptom
    ...     8. Swiping left
    ...     9. Turn off the internet
    ...     10. Click Delete icon
    ...     11. Click Delete button
    ...
    ...     Expected Output:
    ...   the Snackbar will automatically disappear after 3s
    [Tags]      BIOC-SYMPTOM-OFFLINE-05      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-OFFLINE-06: Verify the symptom can still be edited successfully when accessing the Symptom Diary using the link in the "How to mark a symptom" guide.
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...     1. Click the Symptom Diary
    ...     2. Click " Add Symptom (s)" button
    ...     3. Choose the time
    ...     4. Add the symptoms
    ...     5. Click Add Event button
    ...     6. Click Done button
    ...     7. Click the "How to mark a symptom" guide
    ...     9. Click the link Symptom Diary in the "How to mark a symptom" guide.
    ...     7. Choose the symptom
    ...     9. Edit the Symptom
    ...     10. Choose the multiple symptoms
    ...     11. Click Submit button
    ...
    ...     Expected Output:
    ...   the symptom can still be edited successfully when accessing the Symptom Diary using the link in the "How to mark a symptom" guide..
    [Tags]      BIOC-SYMPTOM-OFFLINE-06      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-01: Verify the "Add symptom" button when clicking on "Symptom diary" on Heart Studies.
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...         1. Go to the Heart Studies page.
    ...         2. Find and click on "Symptom diary".
    ...         3. Observe the screen after clicking.
    ...
    ...     Expected Output:
    ...   After clicking on "Symptom diary", the "Add symptom" button appears clearly on the interface..
    [Tags]      BIOC-SYMPTOM-ADD-01      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-02: Verify the "Add symptom(s)" bottom sheet display when clicking "Add a symptom" button.
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...         1. Go to the Heart Studies page.
    ...         2. Find and click on "Symptom diary".
    ...         3. Observe the screen after clicking.
    ...         4. click the "Add a symptom" button
    ...
    ...     Expected Output:
    ...  the "Add symptom(s)" bottom sheet display when clicking "Add a symptom" button.
    [Tags]      BIOC-SYMPTOM-ADD-02      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-03: Verify the UI of "Symptom diary" before adding symptoms according to Figma design.
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...         1. Open the "Symptom diary" interface..
    ...         2. Compare the UI elements including: title, sharing section, symptom list, color, font, size, icon, layout, button, and other elements.
    ...         3. Evaluate the level of conformity with the design on Figma (can use checklist or direct comparison).
    ...
    ...     Expected Output:
    ...  The "Symptom diary" interface displays exactly according to Figma design, including appropriate UI elements, layout, color, size. There are no significant deviations in form or function from the design..
    [Tags]      BIOC-SYMPTOM-ADD-03      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-04: Verify the UI of "Symptom diary" after adding symptoms according to Figma design.
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...         1. Add new symptoms to "Symptom diary".
    ...         2. After the operation is completed, observe the interface displaying the symptom list.
    ...         3. Compare the UI elements such as title, color, font, list layout, icon, layout, and other elements with the design on Figma.
    ...
    ...     Expected Output:
    ...  The new or updated symptom list interface displays correctly according to the Figma design.
    ...  UI elements such as color, font, spacing, icon, size, and layout are consistent and consistent with the original design.
    ...  There are no display errors or visual deviations from the design.
    [Tags]      BIOC-SYMPTOM-ADD-04      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-05: Verify the calendar picker display when clicking on "Date" field.
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...         1. Go to the page containing the "Date" field in the "Check the Date & Time Sections" section.
    ...         2. Click or tap on the "Date" field (or date selection section).
    ...         3. See if the calendar picker appears..
    ...
    ...     Expected Output:
    ...   After clicking on the "Date" field, a calendar picker will appear clearly, allowing you to move through months, years, and select dates.
    ...   The days of the month are displayed correctly, and you can select any date in the calendar.
    ...    The calendar picker is not buggy or obscuring other interface elements
    [Tags]      BIOC-SYMPTOM-ADD-05      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-06: Verify the navigate between months using the arrow icon in the calendar picker.
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...         1. Open the "Check the Date & Time Sections" section and click on the "Date" field to display the calendar picker.
    ...         2. Click the right arrow icon (→) to move to the next month.
    ...         3. Confirm that the calendar displays the correct next month.
    ...         4. Go back and click the left arrow icon (←) to move to the previous month.
    ...         5. Confirm that the calendar displays the correct previous month.
    ...         6. Repeat several times to check that the calendar switches back and forth to consecutive months.
    ...
    ...     Expected Output:
    ...  When the right arrow icon is pressed, the calendar moves to the correct next month.
    ...  When the left arrow icon is pressed, the calendar returns to the previous month as expected.
    ...  The calendar updates the month and year accurately according to user actions without errors or discrepancies.
    [Tags]      BIOC-SYMPTOM-ADD-06      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-07: Select a start study date.
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...         1. Login portal > Start study.
    ...         2. Navigate to "Start Date" or "Start Date".
    ...         3. Click on the "Start Date" field to open the calendar picker.
    ...         4. Use the calendar picker to select the desired date (e.g. today or another specific date).
    ...         5. Confirm the selection and save the study information.
    ...
    ...     Expected Output:
    ...  The calendar picker opens when clicking on "Start Date".
    ...  The user can select any date from the calendar or enter the date in the appropriate format (if supported).
    ...  The selected date is clearly displayed in the "Start Date" field after selection.
    ...  The start date information is saved accurately, matching the selected date.
    [Tags]      BIOC-SYMPTOM-ADD-07      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-08: Select a date between the study start date and the current date
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...        1. Go to the study settings or edit section.
    ...        2. Click on the "Start Date" field to open the calendar picker.
    ...        3. In the calendar, navigate to the appropriate month and day between the study start date and the current date (or enter the date directly if supported).
    ...        4. Select the appropriate date and confirm.
    ...        5. Save the study information and check that the selected date is displayed correctly in the field.
    ...
    ...     Expected Output:
    ...  The user can select any date between the study start date and the current date without any errors or restrictions.
    ...  The selected date is displayed correctly in the "Start Date" field.
    ...  When saving, the system saves the selected date within this range.
    [Tags]      BIOC-SYMPTOM-ADD-08      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-09: Verify the Future date selection not allowed in calendar picker.
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...         1. Click on the "Date" or "Start Date" field to open the calendar picker.
    ...         2. Use the navigation function in the calendar to select a date that is after today (future).
    ...         3. Or manually enter the date in a supported format, try to enter a date that is after the current date.
    ...         4. Try to confirm or save the change..
    ...
    ...     Expected Output:
    ...    the Future date selection not allowed in calendar picker.
    [Tags]      BIOC-SYMPTOM-ADD-09      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-10: Verify the calendar picker close when clicking on another section.
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...         1. Open calendar picker by clicking on "Date".
    ...         2. Click on a section or area other than calendar picker (e.g. another content section, button, or header).
    ...         3. Observe whether calendar picker closes.
    ...
    ...     Expected Output:
    ...  the Calendar picker closes automatically when user clicks on another section.
    [Tags]      BIOC-SYMPTOM-ADD-10      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-11: Verify the calendar picker close when clicking on same section.
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...         1. Open calendar picker by clicking on "Date".
    ...         2. Click on "Date" again or on same section containing calendar.
    ...         3. Observe whether calendar closes or toggles (open/close).
    ...
    ...     Expected Output:
    ...  the calendar picker close when clicking on same section
    [Tags]      BIOC-SYMPTOM-ADD-11      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-12: Verify the scroll-time picker display and select current time when clicking "Start Time".
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...        1. Click or tap the "Start Time" field.
    ...        2. Check if the scroll-time picker is clearly displayed.
    ...        3. Check the time displayed in the scroll-time picker.
    ...        4. Compare the displayed time with the current time.
    ...
    ...     Expected Output:
    ...  the scroll-time picker display and select current time when clicking "Start Time".
    [Tags]      BIOC-SYMPTOM-ADD-12      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-13: Verify the symptoms list as checkboxes displays.
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...        1. Go to the "Describe Symptoms" section or the section displaying the symptoms list.
    ...        2. Observe the symptoms list displayed on the screen.
    ...        3. Check if the following items appear as checkboxes:
    ...            Palpitations
    ...            Shortness of breath
    ...            Dizziness
    ...            Chest pain or pressure
    ...            .Other symptoms (Describe)
    ...         4. Check the checkbox feature: each item can be checked/unchecked.
    ...
    ...     Expected Output:
    ...       The symptoms list including the above items is clearly displayed as separate checkboxes.
    ...       The checkboxes can be checked or unchecked independently.
    ...       The items are exactly as required, not missing or redundant.
    [Tags]      BIOC-SYMPTOM-ADD-13      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-14: Select multiple symptoms in a row.
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...        1. Open the symptoms list.
    ...        2. Select symptom 1.
    ...        3. Hold down Ctrl or Shift (depending on the system) and select symptom 2, symptom 3, ....
    ...
    ...     Expected Output:
    ...  All selected symptoms are displayed clearly, without losing previous selection.
    [Tags]      BIOC-SYMPTOM-ADD-14      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-15: Deselect selected symptom.
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...       1. Multiple symptoms are selected.
    ...       2. Click again on one of the selected symptoms to deselect.
    ...
    ...     Expected Output:
    ...   The symptom is deselect, the list only has the symptoms that are still selected.
    [Tags]      BIOC-SYMPTOM-ADD-15      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-16: Select all symptoms
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...       1. Use the "Select all" function (if available), or select all symptoms.
    ...
    ...     Expected Output:
    ...   All symptoms are selected.
    [Tags]      BIOC-SYMPTOM-ADD-16      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-17: The interface responds correctly when selecting multiple symptoms.
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...       1. Perform the steps to select multiple symptoms.
    ...       2. Observe the interface.
    ...
    ...     Expected Output:
    ...   The symptoms are clearly selected, the selection status is correct, and there is no confusion.
    [Tags]      BIOC-SYMPTOM-ADD-17      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-18: Verify the interface automatically scrolls down to the text input section so that the user can easily enter a symptom description when the user taps on "Other symptoms (Describe)".
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...       1. Open the symptoms selection interface.
    ...       2. Click on the "Other symptoms (Describe)" option..
    ...
    ...     Expected Output:
    ...  the interface automatically scrolls down to the text input section so that the user can easily enter a symptom description when the user taps on "Other symptoms (Describe)".
    [Tags]      BIOC-SYMPTOM-ADD-18      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-19: Enter up to 100 characters in the input field.
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...        1. Open the symptom description entry section.
    ...        2. Enter exactly 100 characters (can be a random or standard string of characters)..
    ...
    ...     Expected Output:
    ...   The system accepts the data, does not limit the number of characters exceeding 100, or displays an error message if there is a limit.
    [Tags]      BIOC-SYMPTOM-ADD-19      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-20: Enter more than 100 characters
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...    1. Enter more than 100 characters in the input box.
    ...
    ...     Expected Output:
    ...   The system limits the number of characters to 100 or displays a warning, only 100 characters can be saved.
    [Tags]      BIOC-SYMPTOM-ADD-20      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-21: Save symptom with 0 characters
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...       1. Enter nothing in the input field.
    ...       2. Press the save button..
    ...
    ...     Expected Output:
    ...   The system allows saving indicating that the symptom description can be left blank or display a warning for user input..
    [Tags]      BIOC-SYMPTOM-ADD-21      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-22: Save symptom with 100 characters.
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...       1. Enter exactly 100 characters.
    ...       2. Click save button..
    ...
    ...     Expected Output:
    ...   Successful save message, data is saved correctly with entered content..
    [Tags]      BIOC-SYMPTOM-ADD-22     BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-23: Added symptom successfully and bottom sheet automatically closes.
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...      1. Open bottom sheet to add new symptom.
    ...      2. Enter all required information.
    ...      3. Click "Save" or "Add" button..
    ...
    ...     Expected Output:
    ...  New symptom is successfully added to the list.
    ...  Bottom sheet automatically closes.
    ...  The interface returns to the main page of "Symptom diary".
    [Tags]      BIOC-SYMPTOM-ADD-23      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-24: Show the correct snackbar when adding a new symptom successfully.
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...        1. Open the add new symptom interface.
    ...        2. Enter valid data and click "Save".
    ...
    ...     Expected Output:
    ...   After the operation is successful, the snackbar "A new symptom has been added" will be clearly displayed on the screen for a few seconds.
    [Tags]      BIOC-SYMPTOM-ADD-24      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-25: Press "X" to close the bottom sheet
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...    1. Open the "Add symptom(s)" bottom sheet to enter data.
    ...    2. Click the "X" (close) button in the appropriate corner or position of the bottom sheet.
    ...     Expected Output:
    ...   The bottom sheet closes immediately.
    ...   The interface automatically switches to the main screen of "Symptom diary."
    [Tags]      BIOC-SYMPTOM-ADD-25      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-26: Make sure not to save data when pressing "X"
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...       1. Enter data into the form.
    ...       2. Press the "X" button.
    ...
    ...     Expected Output:
    ...   Bottom sheet closes.
    ...   Unsaved data is lost.
    ...   No save message or confirmation if the action is to close skip.
    [Tags]      BIOC-SYMPTOM-ADD-26      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-27: Make sure not to close when the operation is not complete
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...       1. Open the bottom sheet.
    ...       2. Do not press "X", instead try other operations (e.g., press out).
    ...
    ...     Expected Output:
    ...   If there is a "drop to close" feature, the bottom sheet will also close correctly.
    ...   If not, the "X" must be pressed correctly to close and return.
    [Tags]      BIOC-SYMPTOM-ADD-27     BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-28: Correctly Count Symptoms After Adding New.
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...      1. Successfully add new symptoms to Heart Studies.
    ...      2. Return to "Heart Studies" interface.
    ...
    ...     Expected Output:
    ...  The number of symptoms displayed on "Heart Studies" is exactly equal to the number added..
    [Tags]      BIOC-SYMPTOM-ADD-28      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-29: Show the correct snackbar when adding a new symptom successfully.
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...        1. Open the add new symptom interface.
    ...        2. Enter valid data and click "Save".
    ...
    ...     Expected Output:
    ...   After the operation is successful, the snackbar "A new symptom has been added" will be clearly displayed on the screen for a few seconds.
    [Tags]      BIOC-SYMPTOM-ADD-29      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-30: Edit or Delete Symptoms and Test
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...        1. Edit or delete the symptoms.
    ...        2. Return to the "Heart Studies" screen.
    ...     Expected Output:
    ...   The symptom number is displayed correctly, accurately reflecting the changes.
    [Tags]      BIOC-SYMPTOM-ADD-30      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-31: Show modal when adding symptom in the transition phase of Follow-on study
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...       1. Perform the operation to open the add symptom section.
    ...       2. Add new symptom.
    ...       3. Operation in the transition phase between Study 1 and Study 2.
    ...     Expected Output:
    ...   Failed to add symptom(s) modal appears immediately, warning that the symptom cannot be added at that time..
    [Tags]      BIOC-SYMPTOM-ADD-31      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-32: Do not show modal in other states
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...       1. Add symptom when not in the transition phase or not in the follow-on study.
    ...
    ...     Expected Output:
    ...   Failed to add symptom(s) modal does not appear, the adding process is normal.
    [Tags]      BIOC-SYMPTOM-ADD-32     BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-33: Correctly display the modal interface.
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...      1. Induce the modal display (e.g. add a symptom during the Study follow-on transition).
    ...      2. Observe the modal appear.
    ...
    ...     Expected Output:
    ...  The modal interface is identical to the Figma illustration in terms of color, size, font, button shape, and element placement.
    [Tags]      BIOC-SYMPTOM-ADD-33      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-34: Replace the existing symptom with the new one
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...        1. Open the symptom editor or select an existing symptom.
    ...        2. Enter or edit the new information.
    ...        3. Click the "Update" button in the modal.
    ...
    ...     Expected Output:
    ...   The information for that symptom is updated correctly with the new data.
    ...   Completely replace the old information in the symptom list.
    [Tags]      BIOC-SYMPTOM-ADD-34      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-35: Check that the data has been replaced correctly
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...        1. Perform the operation in the Test Case above
    ...        2. Return to the symptom list.
    ...     Expected Output:
    ...   The symptom data has been updated correctly, no old data is left.
    [Tags]      BIOC-SYMPTOM-ADD-35      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-36: Update operation without changing data
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...      1. The symptom is available.
    ...      2. Click "Update" without changing the content.
    ...     Expected Output:
    ...   The information remains the same, no errors or data loss.
    ...   The system may display a message or confirm that the update was successful.
    [Tags]      BIOC-SYMPTOM-ADD-36      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-37: Click "Cancel" on the modal
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...       1. Open the "Failed to add symptom(s)" modal or confirmation modal.
    ...       2. Click the "Cancel" button or located in the appropriate location of the modal.
    ...
    ...     Expected Output:
    ...   Modal closes immediately.
    ...   The interface returns to the "Add Symptom(s)" bottom sheet.
    [Tags]      BIOC-SYMPTOM-ADD-37     BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-38: Make sure no data is lost when clicking "Cancel"
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...         1. Enter information in the "Add Symptom(s)" bottom sheet.
    ...         2. Open the confirmation or error modal.
    ...         3. Click "Cancel" in the modal.
    ...
    ...     Expected Output:
    ...  Modal closes. The interface returns to the "Add Symptom(s)" bottom sheet without losing the entered data.
    [Tags]      BIOC-SYMPTOM-ADD-38      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-39: Clicking outside the modal does not close the modal
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...        1. Opens the "Failed to add symptom(s)" modal or confirmation modal.
    ...        2. Clicks outside the modal (area without modal content)..
    ...
    ...     Expected Output:
    ...    The modal remains intact and does not close.
    ...    No response or action to close the modal when clicking outside..
    [Tags]      BIOC-SYMPTOM-ADD-39      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-40: Snackbar appears when network connection is lost
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...        1. Device network is turned off or Wi-Fi/3G/4G is disconnected.
    ...        2. Performs an action that requires internet connection such as opening a page, downloading data, or refreshing.
    ...     Expected Output:
    ...   The "No internet" snackbar appears clearly on the screen immediately.
    ...   The snackbar is displayed long enough for the user to notice.
    [Tags]      BIOC-SYMPTOM-ADD-40      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-41: Show snackbar when unknown error occurs
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...      1. Simulate or cause an unknown error (e.g., server error, data error, error without clear warning).
    ...      2. Perform the action that triggered the error (e.g., open, load, save, or send information).
    ...     Expected Output:
    ...   The "Something went wrong. Please try again" snackbar appears clearly on the screen for a few seconds.
    [Tags]      BIOC-SYMPTOM-ADD-41      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-42: Add symptom when device is online
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...      1. Make sure the device is connected to the internet (wifi or mobile data).
    ...      2. Open the symptom add section.
    ...      3. Enter the required information and press "Save" or "Add".
    ...
    ...     Expected Output:
    ...   The symptom is added successfully.
    ...   No connection errors or warnings.
    ...   The new data is displayed correctly on the interface.
    [Tags]      BIOC-SYMPTOM-ADD-42     BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-43: View newly added symptoms when the device is online
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...        1. Make sure the device is online.
    ...        2. Add a new symptom via the input field.
    ...        3. Return to the main screen or symptom list.
    ...
    ...     Expected Output:
    ...  The new symptom appears in the list or symptom display.
    ...  The symptom information is correct and clearly displayed as entered.
    [Tags]      BIOC-SYMPTOM-ADD-43      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-44: View newly added symptoms when the device is offline
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...      1. The symptom is successfully added when the device is online.
    ...      2. Disconnect from the internet (offline).
    ...      3. Open the symptom list to view.
    ...
    ...     Expected Output:
    ...    The newly added symptom is still fully displayed in the list.
    ...    No errors or missing data.
    [Tags]      BIOC-SYMPTOM-ADD-44      BIOC-2.2.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SYMPTOM-ADD-45: Snackbar disappears after 3 seconds
    [Documentation]     Author: Bao Van
    ...
    ...     Pre-condition:
    ...     - Create the study on the Diagnostics portal
    ...     - Connect device have study with app
    ...     - Go through the onboarding
    ...
    ...     Test Steps:
    ...       1. Cause an action to trigger the snackbar display (e.g. successful symptom addition or network error).
    ...       2. Observe the snackbar display time.
    ...     Expected Output:
    ...   The snackbar appears clearly as soon as the event occurs.
    ...   After 3 seconds, the snackbar automatically disappears from the screen without any user action.
    [Tags]      BIOC-SYMPTOM-ADD-45      BIOC-2.2.0    manual  R1
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
