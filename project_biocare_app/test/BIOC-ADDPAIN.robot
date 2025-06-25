*** Settings ***
Documentation   Biocare app Add Pain log test suite
Metadata    sid     BIOC-ADDPAIN
Metadata    owner   tU Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-ADDPAIN  mapp
Test Timeout    1h

*** Test Cases ***
BIOC-ADDPAIN-01: verify the calendar when the current date hasn't data log
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - The user has an active CCM or CCM&RPM program 
    ...     - The clinic sets up monitoring the pain log
    ...
    ...     Test Steps:
    ...     1. Tapping Pain log in the add manually bottom sheet
    ...     2.  Select date on the calendar
    ...     3. the user skip the pain log
    ...     4. Check the current date
    ...
    ...     Expected Output:
    ...     the current date hasn't data log, grey dot display under the date
    [Tags]      BIOC-ADDPAIN-01        BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-02: verify the calendar when the current date has data log
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - The user has an active CCM or CCM&RPM program
    ...     - The clinic sets up monitoring the pain log
    ...
    ...     Test Steps:
    ...     1. Tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. the users have answered at least one question in the pain log.
    ...     4. Check the current date
    ...
    ...     Expected Output:
    ...     the current date has the data log, the green dot display under the date
    ...
    [Tags]       BIOC-ADDPAIN-02        BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-03: Verify the Annotation icon after clicking
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - The user has an active CCM or CCM&RPM program
    ...     - The clinic sets up monitoring the pain log
    ...
    ...     Test Steps:
    ...     1. Tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Verify the pain log screen .
    ...
    ...     Expected Output:
    ...    The pain log screen show the messgae "Oops, something went wrong." and Try Again button
    ...
    [Tags]      BIOC-ADDPAIN-03      BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BIOC-ADDPAIN-04: Verify "Pain log " screen when there is an invalid error
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - The user has an active CCM or CCM&RPM program
    ...     - The clinic sets up monitoring the pain log
    ...
    ...     Test Steps:
    ...     1. Tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Verify the pain log screen .
    ...
    ...     Expected Output:
    ...    The pain log screen show the messgae "Oops, something went wrong." and Try Again button
    [Tags]      BIOC-ADDPAIN-04       BIOC-1.18.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-05: verify the message on the snac kbar when the device no internet
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...    - The device has no internet
    ...
    ...     Test Steps:
    ...     1. 1. tapping Pain log in the add manually bottom sheet
    ...
    ...     Expected Output:
    ...    If the device has no internet connection, the app shall show the snack bar with the content “No internet connection” with Settings button.
    [Tags]      BIOC-ADDPAIN-05       BIOC-1.18.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-06: verify the rate your pain after taping on the track or scrub back and forth on it to select the pain severity value
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...    - Navigate the Pain log screen
    ...
    ...     Test Steps:
    ...     1. Tap on the track or scrub back
    ...     2. Select date on the calendar
    ...     3. Verify the pain severity value
    ...
    ...     Expected Output:
    ...      The users can tap on the track or scrub back and forth to select the pain severity value
    ...         + Min: 1
    ...         + Max: 10
    ...         + Default: 5
    ...
    [Tags]      BIOC-ADDPAIN-06       BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-07: verify the body illustration after clicking "select pain areas" button on the section 2 " where is your pain"
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. Tap on the track or scrub back
    ...     2. Select date on the calendar
    ...     3. Navigation the section 2" Where is your pain"
    ...     4. Click " Select pain areas"
    ...
    ...     Expected Output:
    ...     the body illustration displays after clicking  "select pain areas" button on the section 2 " where is your pain"  
    [Tags]      BIOC-ADDPAIN-07       BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-08: Verify select the body part after tapping on the body illustrations
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. Tap on the track or scrub back
    ...     2. Select date on the calendar
    ...     3. Navigation the section 2" Where is your pain"
    ...     4. Click " Select pain areas"
    ...     5. Tapping the body part
    ...
    ...     Expected Output:
    ...    "After taping the body part, the app shall display the pain type bottom sheet with the following components: 
    ...      + Title: [Body part] 
    ...      + Annotation icon. Tapping this icon shall navigate the user to the Pain type information screen with the following components 
    ...      + Back icon button. Tapping this button shall navigate the user to the Select pain areas screen. "
    [Tags]    BIOC-ADDPAIN-08       BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-09: Verify the list of pain type after tapping the body part
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 2" Where is your pain"
    ...     4. Click " Select pain areas"
    ...     5. Tapping the body part
    ...     6. Verify the list of pain type
    ...
    ...     Expected Output:
    ...    "The list of pain types is sorted by alphabetical order 
    ...        + Aching: Dull hurting-type of soreness 
    ...        + Burning: Blistering sensation of severe heat 
    ...        + Cramping: Inability to move a joint or muscle 
    ...        + Numbness: Persistent prickling sensation 
    ...        + Radiating: Beating, pounding or pulsing pain 
    ...        + Shooting: Sudden or severe flash or pain 
    ...        + Stabbing: Sharp, tearing or lacerating pain 
    ...        + Tingling: Pins-and-needles pain
    [Tags]      BIOC-ADDPAIN-09       BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-10: Verify the list of pain type after tapping the body part
     [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 2" Where is your pain"
    ...     4. Click " Select pain areas"
    ...     5. Tapping the body part
    ...     6. Verify the list of pain type
    ...
    ...     Expected Output:
    ...    - "The list of pain types is sorted by alphabetical order 
    ...    Aching: Dull hurting-type of soreness 
    ...    Burning: Blistering sensation of severe heat 
    ...    Cramping: Inability to move a joint or muscle 
    ...    Numbness: Persistent prickling sensation 
    ...    Radiating: Beating, pounding or pulsing pain 
    ...    Shooting: Sudden or severe flash or pain 
    ...    Stabbing: Sharp, tearing or lacerating pain 
    ...    Tingling: Pins-and-needles pain "
    [Tags]      BIOC-ADDPAIN-10       BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-11: Verify the pain type after tapping the body part
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 2" Where is your pain"
    ...     4. Click " Select pain areas"
    ...     5. Tapping the body part
    ...     6. select the list of pain type
    ...
    ...     Expected Output:
    ...    - the pain type is highlighted after tapping the body part
    [Tags]      BIOC-ADDPAIN-11       BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BIOC-ADDPAIN-12: Verify the body part after taping the body part again 
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 2" Where is your pain"
    ...     4. Click " Select pain areas"
    ...     5. Tapping the body part
    ...     6. select the list of pain type
    ...     7. Tapping the body part again
    ...
    ...     Expected Output:een
    ...    - Tapping this body part again will unselect this pain area.
   [Tags]      BIOC-ADDPAIN-12       BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-13: Verify the pain type after tapping the pain type again
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 2" Where is your pain"
    ...     4. Click " Select pain areas"
    ...     5. Tapping the body part
    ...     6. select any pain type again
    ...     7. select any pain type again
    ...
    ...     Expected Output:een
    ...    - Tapping this pain type again will unselect this pain type
   [Tags]      BIOC-ADDPAIN-13       BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-14: Verify the section 3" How much does the pain affect your daily activities? " after clicking the "No pain disability" check box
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 3" How much does the pain affect your daily activities? "
    ...     4. Click the "No pain disability" check box
    ...
    ...     Expected Output:een
    ...     - This section shall only display the “No pain disability index” check box.
     [Tags]      BIOC-ADDPAIN-14       BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-15: Verify the section 3" How much does the pain affect your daily activities? " after don't click the "No pain disability" check box and click " select the pain disability"
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 3" How much does the pain affect your daily activities? "
    ...     4. Click " select the pain disability"
    ...
    ...     Expected Output:een
    ...    - This section shall display the list of pain disability indexes that have values.
    [Tags]      BIOC-ADDPAIN-15       BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BIOC-ADDPAIN-16: Verify the default value of each pain disability index after clicking the " select the pain disability" button
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 3" How much does the pain affect your daily activities? "
    ...     4. Click " select the pain disability"
    ...     5. Verify the default value of each pain disability index
    ...
    ...     Expected Output:
    ...     4. This section shall display the list of pain disability indexes that have values.
    ...     5. the default value of each pain disability index is 0
    [Tags]      BIOC-ADDPAIN-16      BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-17: verify the pain disability level after taping on the track or scrub back and forth on it
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 3" How much does the pain affect your daily activities? "
    ...     4. Click " select the pain disability"
    ...     5. Tap on the track or scrub back any the pain disability index
    ...     6. Verify the default value of each pain disability index
    ...
    ...     Expected Output:
    ...     - The pain disability level displays correctly  after taping on the track or scrub back and forth on it
    [Tags]      BIOC-ADDPAIN-17      BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-18: Verify the pain disability level after clicking save button
  [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 3" How much does the pain affect your daily activities? "
    ...     4. Click " select the pain disability"
    ...     5. Tap on the track or scrub back any the pain disability index
    ...     6. Click Save button
    ...
    ...     Expected Output:
    ...     - the pain disability level is saved and navigated the user to the Add log screen after cliking save button
    [Tags]      BIOC-ADDPAIN-18      BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-19: Verify the pain disability level after clicking X button
  [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 3" How much does the pain affect your daily activities? "
    ...     4. Click " select the pain disability"
    ...     5. Tap on the track or scrub back any the pain disability index
    ...     6. Clicking X button
    ...
    ...     Expected Output:
    ...     - the pain disability level isn't saved and navigated the user to the Add log screen after cliking save button
    [Tags]      BIOC-ADDPAIN-19      BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-20: Verify the section 4" What triggers your chronic pain? " after clicking the "No trigger" check box
  [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 4" What triggers your chronic pain? "
    ...     4. Click the "No trigger" check box
    ...
    ...     Expected Output:
    ...     - This section shall display the “No trigger” check box and " Add your trigger" button.
   [Tags]      BIOC-ADDPAIN-20      BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-21: Verify the section 4" What triggers your chronic pain? " after don't click the "No pain disability" check box and click " Add your trigger"
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 4" What triggers your chronic pain? "
    ...     4. Click the "Add your trigger
    ...
    ...     Expected Output:
    ...        this button shall navigate the user to the Add your triggers screen
    [Tags]      BIOC-ADDPAIN-21       BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-22: Verify the common trigger tag is displayed after clicking the Add your trigger
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 4" What triggers your chronic pain? "
    ...     4. Click the "Add your trigger"
    ...
    ...     Expected Output:
    ...        The Common triggers is displayed include Excessive cold, Extended sitting, Extended walking, Sickness, Poor Posture, Increased Physical Activity, Standing, and Stretching.
    [Tags]      BIOC-ADDPAIN-22       BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-23: Verify the pain trigger when input the name of pain trigger on the search bar and select the trigger
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 4" What triggers your chronic pain? "
    ...     4. Click the "Add your trigger"
    ...     5. input the valid name of pain trigger on the search
    ...     6. Select the name of pain trigger
    ...
    ...     Expected Output:
    ...     5. The drag-down list of suggestion is displayed
    ...     6. The suggestion is selected
    [Tags]      BIOC-ADDPAIN-23       BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-24: Verify the pain trigger when input the invalid name of pain trigger on the search bar
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation thesection 4" What triggers your chronic pain? "
    ...     4. Click the "Add your trigger"
    ...     5. input the valid name of pain trigger on the search
    ...
    ...     Expected Output:
    ...    - the app shall display “No result found” screen.
    [Tags]      BIOC-ADDPAIN-24      BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-25: Verify the selected pain trigger tag is removed after tapping the X icon
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 4" What triggers your chronic pain? "
    ...     4. Click the "Add your trigger"
    ...     5. input the valid name of pain trigger on the search
    ...     6. Select the name of pain trigger
    ...     7. Tapping the X icon
    ...
    ...     Expected Output:
    ...     - the selected pain trigger tag is removed
    [Tags]      BIOC-ADDPAIN-25      BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-26: Verify "Add your trigger " screen when there is an invalid error
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 4" What triggers your chronic pain? "
    ...     4. Click the "Add your trigger"
    ...
    ...     Expected Output:
    ...     The pain log screen show the messgae "Oops, something went wrong." and Try Again button.
    [Tags]      BIOC-ADDPAIN-26       BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-27: Verify the section 5" What are your primary symptoms " after clicking the "No trigger" check box
    [Documentation]     Author: Tu Nguyen
    ...
      ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 5" What are your primary symptoms "
    ...     4. Click the "No trigger" check box
    ...
    ...     Expected Output:
    ...     - This section shall display the “No trigger” check box and " Add your Symtoms" button. .
    [Tags]      BIOC-ADDPAIN-27     BIOC-1.21.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-28: Verify the section 5" What are your primary symptoms " after don't click the "No pain disability" check box and click " Add your trigger"
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 5" What are your primary symptoms "
    ...     4. Click the "Add your Symptom"
    ...
    ...     Expected Output:
    ...     - this button shall navigate the user to the Add your Symtoms screen
    [Tags]      BIOC-ADDPAIN-28      BIOC-1.18.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-29: Verify the pain trigger when input the name of pain trigger on the search bar and select the trigger
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 5" What are your primary symptoms "
    ...     4. Click the "Add your Symptom"
    ...     5. input the valid name of  symptoms on the search
    ...     6. Select the name of pain symptoms
    ...
    ...     Expected Output:
    ...     5. The drag-down list of suggestion is displayed
    ...     6. The drag-down list of suggestion is displayed
    [Tags]      BIOC-ADDPAIN-29      BIOC-1.18.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-30: Verify the pain trigger when input the invalid name of pain trigger on the search bar
    [Documentation]     Author: Tu Nguyen
    ...
  ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 5" What are your primary symptoms "
    ...     4. Click the "Add your Symptom"
    ...     5. input the valid name of  symptoms on the search
    ...
    ...     Expected Output:
    ...     the app shall display “No result found” screen.
    [Tags]      BIOC-ADDPAIN-30      BIOC-1.18.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-31: Verify the selected pain trigger tag is removed after tapping the X icon
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 5" What are your primary symptoms "
    ...     4. Click the "Add your Symptom"
    ...     5. input the valid name of  symptoms on the search
    ...     6. Select the name of pain symptoms
    ...     7. Tapping the X icon
    ...
    ...     Expected Output:
    ...     - the selected pain symtom tag is removed
    [Tags]      BIOC-ADDPAIN-31      BIOC-1.18.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-32: Verify the common symtoms tag is displayed after clicking the Add your trigger
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 5" What are your primary symptoms "
    ...     4. Click the "Add your Symptom"
    ...
    ...     Expected Output:
    ...     The Common symtoms is displayed include Excessive cold, Extended sitting, Extended walking, Sickness, Poor Posture, Increased Physical Activity, Standing, and Stretching.
    [Tags]      BIOC-ADDPAIN-32      BIOC-1.18.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BIOC-ADDPAIN-33: Verify "Add your symtoms " screen when there is an invalid error
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 5" What are your primary symptoms "
    ...     4. Click the "Add your Symptom"
    ...
    ...     Expected Output:
    ...     The pain log screen show the messgae "Oops, something went wrong." and Try Again button
    [Tags]      BIOC-ADDPAIN-33      BIOC-1.18.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-34: Verify the symtoms when input the invalid name of symtoms on the search bar
    [Documentation]     Author: Tu Nguyen
    ...
  ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 5" What are your primary symptoms "
    ...     4. Click the "Add your Symptom"
    ...     5. input the valid name of  symptoms on the search
    ...
    ...     Expected Output:
    ...     the app shall display “No result found” screen.
    [Tags]      BIOC-ADDPAIN-34      BIOC-1.18.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-35: Verify the section 6" What treatments did you use today? " after clicking the "No Treatment" check box
    [Documentation]     Author: Tu Nguyen
    ...
  ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3 Navigation section 6" What treatments did you use today?  "
    ...     4. Click the "No treatment" check box
    ...
    ...     Expected Output:
    ...     This section shall display the “No Treatment” check box and " Add your Treatment" button.
    [Tags]      BIOC-ADDPAIN-35      BIOC-1.18.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-36: Verify the section6" What treatments did you use today?" after don't click the "No pain disability" check box and click " Add your trigger"
    [Documentation]     Author: Tu Nguyen
    ...
  ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3 Navigation section 6" What treatments did you use today?  "
    ...     4. Click the "Add your Treatment"
    ...
    ...     Expected Output:
    ...     this button shall navigate the user to the Add your Treatment screen
    [Tags]      BIOC-ADDPAIN-36      BIOC-1.18.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-37: Verify the pain treatment when input the name of pain treament on the search bar and select the treatment
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3 Navigation section 6" What treatments did you use today?  "
    ...     4. Click the "Add your Treatment"
    ...     5. input the valid name of  treatments on the search
    ...     6. Select the name of pain treatment
    ...
    ...     Expected Output:
    ...     5. The drag-down list of suggestion is displayed
    ...     6. The suggestion is selected
    [Tags]      BIOC-ADDPAIN-37      BIOC-1.18.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-38: Verify the pain treatment when input the invalid name of pain treatment on the search bar
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3 Navigation section 6" What treatments did you use today?  "
    ...     4. Click the "Add your Treatment"
    ...     5. input the valid name of  treatments on the search
    ...
    ...     Expected Output:
    ...     the app shall display “No result found” screen.
    [Tags]      BIOC-ADDPAIN-38      BIOC-1.18.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-39: Verify the selected pain treatment tag is removed after tapping the X icon
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3 Navigation section 6" What treatments did you use today?  "
    ...     4. Click the "Add your Treatment"
    ...     5. input the valid name of  treatments on the search
    ...     6. Select the name of treatment
    ...     7. Tapping the X icon
    ...
    ...     Expected Output:
    ...     the selected pain treatment tag is removed
    [Tags]      BIOC-ADDPAIN-39     BIOC-1.18.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-40: Verify the common symtoms tag is displayed after clicking the Add your trigger
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3 Navigation section 6" What treatments did you use today?  "
    ...     4. Click the "Add your Treatment"
    ...
    ...     Expected Output:
    ...     The Common Treatment is displayed include Excessive cold, Extended sitting, Extended walking, Sickness, Poor Posture, Increased Physical Activity, Standing, and Stretching.
    [Tags]      BIOC-ADDPAIN-40      BIOC-1.18.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-41: Verify "Add your treatment" screen when there is an invalid error
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3 Navigation section 6" What treatments did you use today?  "
    ...     4. Click the "Add your Treatment"
    ...
    ...     Expected Output:
    ...     - The pain log screen show the messgae "Oops, something went wrong." and Try Again button
     [Tags]      BIOC-ADDPAIN-41      BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-42: Verify Treatments when update treatment on the free text field
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation section 6" What treatments did you use today?  "
    ...     4. Click the "Add your Treatment"
    ...     5. input treatment on the free text field
    ...     6. Click the Save button
    ...
    ...     Expected Output:
    ...     - The treatment is updated on the free text field
    [Tags]      BIOC-ADDPAIN-42      BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-43: Verify Symptoms when update symptoms on the free text field
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation section 5" What are your primary symptoms "
    ...     4. Click the "Add your Symptoms"
    ...     5. input symptoms on the free text field
    ...     6. Click the Save button
    ...
    ...     Expected Output:
    ...     - The symptoms is updated on the free text field
    [Tags]      BIOC-ADDPAIN-43      BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-44: Verify triggers when update trigger on the free text field
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation section 4" What triggers your chronic pain? "
    ...     4. Click the "Add your Trigger"
    ...     5. input treatment on the free text field
    ...     6. Click the Save button
    ...
    ...     Expected Output:
    ...     - The trigger is updated on the free text field
    [Tags]      BIOC-ADDPAIN-44      BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-45: Verify Treatments when update treatment on the free text field and add the other treatment
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation section 6" What treatments did you use today?  "
    ...     4. Click the "Add your Treatment"
    ...     5. input treatment on the free text field
    ...     6. Add the other treatment  
    ...     7. Click the Save button
    ...
    ...     Expected Output:
    ...     - The treatment is updated on the pain log
    [Tags]      BIOC-ADDPAIN-45      BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-46: Verify Symptoms when update treatment on the free text field
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation section 5" What are your primary symptoms "
    ...     4. Click the "Add your Symptoms"
    ...     5. input symptoms on the free text field
    ...     6. Add the other symptoms
    ...     7. Click the Save button
    ...
    ...     Expected Output:
    ...     - The symptoms is updated on the pain log
    [Tags]      BIOC-ADDPAIN-46      BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-47: Verify triggers when update treatment on the free text field
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation section 4" What triggers your chronic pain? "
    ...     4. Click the "Add your Trigger"
    ...     5. input trigger on the free text field
    ...     6. Add the other trigger
    ...     7. Click the Save button
    ...
    ...     Expected Output:
    ...     - The trigger is updated on the free text field
    [Tags]      BIOC-ADDPAIN-47      BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-48: Verify triggers when update treatment on the free text field
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation section 4" What triggers your chronic pain? "
    ...     4. Click the "Add your Trigger"
    ...     5. input trigger on the free text field
    ...     6. Add the other trigger
    ...     7. Click the Save button
    ...
    ...     Expected Output:
    ...     - The trigger is updated on the free text field
    [Tags]      BIOC-ADDPAIN-48      BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-49: Verify the last data when click the Pain log Today
    [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...     - input data the yesterday pain log
    ...     - Click Save button
    ...
    ...
    ...     Test Steps:
    ...     1. Click pain log Today
    ...     2. Check data pain log
    ...
    ...     Expected Output:
    ...     - The last pain log data is display when click the pain log today
    [Tags]      BIOC-ADDPAIN-49      BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BIOC-ADDPAIN-50: Verify the pain log when click " no pain" on the Daily heath log
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. click " Let's do" button on the daily heath log
    ...     2. Click "no pain"
    ...     3. Click save button
    ...     4. Click the "View my journal" button
    ...     5. Check the pain log
    ...
    ...     Expected Output:
    ...     - The pain displays " no pain"
    [Tags]      BIOC-ADDPAIN-50     BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-51: Verify the score pain disability when answer the question
    [Documentation]     Author: Tu Nguyen
    ...     Test Steps:
    ...    1. Log in the app portal
    ...    2. Click View My journal
    ...    3. Select date
    ...    4. Click add on the Pain Log
    ...    5. Click Add log button
    ...    6. Check the answer on the pain disability
    ...    7. Click Done button
    ...    8. Check the score
    ...
    ...
    ...     Expected Output:
    ...     - the score pain disability display correctly when answer the question
    [Tags]      BIOC-ADDPAIN-51     BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-52: Verify the score pain disability when not answering the question completely
    [Documentation]     Author: Tu Nguyen
    ...     Test step:
    ...    1. Log in the app portal
    ...    2. Click View My journal
    ...    3. Select date
    ...    4. Click add on the Pain Log
    ...    5. Click Add log button
    ...    6. Check the answer on the pain disability
    ...    7. Click Done button
    ...    8. Check the score
    ...
    ...
    ...     Expected Output:
    ...     - the score pain disability display correctly when answer the question
    [Tags]      BIOC-ADDPAIN-52     BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-53: Verify the level score pain disability when not answering the question completely
    [Documentation]     Author: Tu Nguyen
    ...     Test step:
    ...    1. Log in the app portal
    ...    2. Click View My journal
    ...    3. Select date
    ...    4. Click add on the Pain Log
    ...    5. Click Add log button
    ...    6. Check the answer on the pain disability
    ...    7. Click Done button
    ...    8. Check the level score
    ...
    ...
    ...     Expected Output:
    ...     - the score pain disability display correctly level:
    ...        + 0% to 20% Minimal
    ...        + 21% to 40% Moderate
    ...        + 41% to 60% Severe
    ...        + 61% to 80% Crippled
    ...        + 81% to 100% Disabled

    [Tags]      BIOC-ADDPAIN-53     BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-54: Verify the level score pain disability when not answering the question completely
    [Documentation]     Author: Tu Nguyen
    ...     Test step:
    ...    1. Log in the app portal
    ...    2. Click View My journal
    ...    3. Select date
    ...    4. Click add on the Pain Log
    ...    5. Click Add log button
    ...    6. Check the answer on the pain disability
    ...    7. Click Done button
    ...    8. Check the level score
    ...
    ...
    ...     Expected Output:
    ...     - the score pain disability display correctly level:
    ...        + 0% to 20% Minimal The patient can cope with most living activities. Usually no treatment is indicated apart from advice on lifting, sitting and exercise. 
    ...        + 21% to 40%  The patient experiences more pain and difficulty with sitting, lifting and standing. 
    ...         Travel and social life are more difficult, and they may be disabled from work. Personal care, sexual activity and sleeping are not grossly affected, and the patient can usually be managed by conservative mean
    ...        + 41% to 60% Severe Pain remains the main problem in this group, but activities of daily living are affected. These patients require a detailed investigation.
    ...        + 61% to 80% Crippled Pain impinges on all aspects of the patient’s life. Positive intervention is required
    ...        + 81% to 100% Disabled These patients are either bed-bound or exaggerating their symptoms.

    [Tags]      BIOC-ADDPAIN-54     BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-55: Verify the score pain disability when answer the question and kill app
    [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...    1. Log in the app portal
    ...    2. Click View My journal
    ...    3. Select date
    ...    4. Click add on the Pain Log
    ...    5. Click Add log button
    ...    6. Check the answer on the pain disability
    ...    7. Kill the app
    ...
    ...     Test Steps:
    ...    1. Open the app again
    ...    2. Click Pain Log
    ...    3. Select date
    ...    4. Click add on the Pain Log
    ...    5. Click Add log button
    ...    6. Check the answer on the pain disability
    ...
    ...     Expected Output:
    ...     - the answer pain disability can be saved after kill app
    [Tags]      BIOC-ADDPAIN-55     BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-56: Verify the pain log can't save after click delete button and add " No pain"
    [Documentation]     Author: Tu Nguyen
    ...     Pre-condition:
    ...    1. Log in the app portal
    ...    2. Click View My journal
    ...    3. Select date
    ...    4. Click add on the Pain Log
    ...    5. Click Add log button
    ...    6. Check the answer on the pain disability
    ...    7. Click Done button
    ...    8. Check the level score
    ...    9. Add the Pain, Trigger, Symptoms, Treatment, relief method
    ...    10. Click Done
    ...    11. Click Delete button
    ...    12. Click " No pain"
    ...    13. Click Done button
    ...
    ...     Test Steps:
    ...    1. Click Back button
    ...    2. Click Pain Log again
    ...    3.  Click " No pain" again
    ...    4. Click add log again
    ...
    ...     Expected Output:
    ...     - the pain log can't save after click delete button and add " No pain"
    [Tags]      BIOC-ADDPAIN-56     BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-57: Verify the section 6" What give you relief " after clicking the "No relief method" check box
    [Documentation]     Author: Tu Nguyen
    ...
      ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 7" What give you relief "
    ...     4. Click the "No relief method" check box
    ...
    ...     Expected Output:
    ...     - This section shall display the “No relief method” check box
    [Tags]      BIOC-ADDPAIN-57     BIOC-1.21.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-58: Verify the section 6" What give you relief " after don't click the "No relief method" check box and click " Add relief method"
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 7" What give you relief "
    ...     4. Click the "Add relief method"
    ...
    ...     Expected Output:
    ...     - this button shall navigate the user to the Add relief method screen
    [Tags]      BIOC-ADDPAIN-58      BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-59: Verify the pain trigger when input the name of relief method on the search bar and select the relief method
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation the section 7" What give you relief? "
    ...     4. Click the "Add  relief method"
    ...     5. input the valid name of   relief method on the search
    ...     6. Select the name of pain  relief method
    ...
    ...     Expected Output:
    ...     5. The drag-down list of suggestion is displayed
    ...     6. The drag-down list of suggestion is displayed
    [Tags]      BIOC-ADDPAIN-59      BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BIOC-ADDPAIN-60: Verify the relief method when input the invalid name of relief method on the search bar
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3 Navigation section 7 " What give you relief? ""
    ...     4. Click the "Add relief method"
    ...     5. input the valid name of  treatments on the search
    ...
    ...     Expected Output:
    ...     the app shall display “No result found” screen.
    [Tags]      BIOC-ADDPAIN-60      BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-61: Verify the selected relief method tag is removed after tapping the X icon
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3 Navigation section 7 " What give you relief? "
    ...     4. Click the "Add relief method"
    ...     5. input the valid name of  treatments on the search
    ...     6. Select the name of treatment
    ...     7. Tapping the X icon
    ...
    ...     Expected Output:
    ...     the selected relief method tag is removed
    [Tags]      BIOC-ADDPAIN-61     BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-62: Verify the relief method tag is displayed after clicking the Add your relief method
    [Documentation]     Author: Tu Nguyen
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3 Navigation section 7 " What give you relief? "
    ...     4. Click the "Add relief method"
    ...
    ...     Expected Output:
    ...     The Common Treatment is displayed include Heart/ice, Medications, Sitting down, Leaning forward, Lying down, Changing positions, Chiropractic care, Massage, Exercise, Physical therapy.
    [Tags]      BIOC-ADDPAIN-62      BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-63: Verify "Add relief method" screen when there is an invalid error
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3 Navigation section 7 " What give you relief? "
    ...     4. Click the "Add relief method"
    ...
    ...     Expected Output:
    ...     - The pain log screen show the messgae "Oops, something went wrong." and Try Again button
     [Tags]      BIOC-ADDPAIN-63      BIOC-1.21.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-ADDPAIN-64: Verify Treatments when update treatment on the free text field
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Test Steps:
    ...     1. tapping Pain log in the add manually bottom sheet
    ...     2. Select date on the calendar
    ...     3. Navigation section 7 " What give you relief? "
    ...     4. Click the "Add relief method"
    ...     5. input treatment on the free text field
    ...     6. Click the Save button
    ...
    ...     Expected Output:
    ...     - The treatment is updated on the free text field
    [Tags]      BIOC-ADDPAIN-64     BIOC-1.21.0    manual  R1
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
