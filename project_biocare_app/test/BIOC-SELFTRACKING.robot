*** Settings ***
Documentation   Biocare app Selftracking test suite
Metadata    sid     BIOC-SELFTRACKING
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-SELFTRACKING   mapp
Test Timeout    1h

*** Test Cases ***
BIOC-SELFTRACKING-01: View Self-tracking card on Home screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user has not previously registered for the CCM, RPM, or CCM&RPM services
    ...     - The user has not completed the process before
    ...
    ...     Test Steps:
    ...     1. Viasully Home screen
    ...
    ...     Expected Output:
    ...     1. Self-tracking card on the Home screen shall be displayed:
    ...        - Title: Self-tracking for Health
    ...        - Learn more button
    ...        - Content: “Dive into self-tracking – It’s your journey to a healthier life!”
    ...        - Trigger button. This button shall have 2 statuses:
    ...          + Get started: Show this button if the user has not finished any section of the Self tracking
    ...          + Continue: Show this button if the user has not finished the Self tracking
    [Tags]      BIOC-SELFTRACKING-01        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SELFTRACKING-02: Learn more
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user has not previously registered for the CCM, RPM, or CCM&RPM services
    ...     - The user has not completed the process before
    ...
    ...     Test Steps:
    ...     1. Press on Learn more button
    ...     2. Press on Info icon
    ...     3. Press on Next button
    ...     4. Press on Next button
    ...     5. Press on Next button
    ...     6. Press on Got it button
    ...
    ...     Expected Output:
    ...     1. The app shall open the Introduction modal
    ...        - Title: What's includes
    ...        - Message: Do Personal Health Survey
    ...        - Text: Taking the Quality of Life to get a comprehensive assessment of your overall well-being.
    ...        - Next button
    ...     2. Biocare is a free personal lifestyle tool to help individuals manage their condition, track medications and biometrics.
    ...        You can track your biometrics from your existing devices or purchase biometric devices.
    ...     3. - Title: What's includes
    ...        - Message: Input health data
    ...        - Text: You have the option to either manually input your data or seamlessly connect with Biokit devices.
    ...        - Next button
    ...     4. - Title: What's includes
    ...        - Message: Set heart rate alert
    ...        - Text: Setting alert heart rate thresholds to receive instant notifications for sustained increases or decreases over a 10-minute period.
    ...        - Next button
    ...     5. - Title: What's includes
    ...        - Message: Add medication reminders
    ...        - Text: Setting your medication reminder to take the dosage on time.
    ...        - Got it button
    ...     6. Close the modal and back to the Home screen
    [Tags]      BIOC-SELFTRACKING-02        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SELFTRACKING-03: View Self-tracking for health card
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user has not previously registered for the CCM, RPM, or CCM&RPM services
    ...     - The user has not completed the process before
    ...
    ...     Test Steps:
    ...     1. Press on Get started button
    ...     2. Press on ^ button
    ...     3. Press on Get started button
    ...     4. Press on Get started button
    ...
    ...     Expected Output:
    ...     1. Open the SF-12 Introduction modal
    ...        - Title: Elevate Your Life with the SF-12 Health Survey!
    ...        - Content: Ready to boost your well-being? Take a quick moment to complete the SF-12 Quality of Life Test
    ...        - Get started button
    ...        - ^ icon button
    ...     2. Close the modal immediately
    ...     4. Navigate the user to the Quality of life screen (SF-12)
    [Tags]      BIOC-SELFTRACKING-03        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SELFTRACKING-04: Close the Self-tracking for health card
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user taps Get started button or continue to enroll button
    ...
    ...     Test Steps:
    ...     1. Press on Get started button
    ...     2. Press on Close button
    ...
    ...     Expected Output:
    ...     1. Navigated to the Quality of Life (SF12) screen
    ...     2. Navigate the user to the Home screen without saving anything in this section
    [Tags]      BIOC-SELFTRACKING-04        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SELFTRACKING-05: Self-tracking for health
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user taps Get started button
    ...
    ...     Test Steps:
    ...     1. Press on Get started button
    ...     2. Click on Finish button
    ...     3. Press on Not now button
    ...
    ...     Expected Output:
    ...     1. Navigated to the Quality of Life (SF12) screen and completed test
    ...     2. Navigate the user to the Activate screen and save the results
    ...     3. Navigate the user to the Baseline measurements section
    [Tags]      BIOC-SELFTRACKING-05        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SELFTRACKING-06: Baseline measurements section
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - In Baseline measurements section
    ...
    ...     Test Steps:
    ...     1. Viasully Baseline measurements screen
    ...     2. Press on Close button
    ...     3. Press on Continue button
    ...     4. Press on Continue button
    ...
    ...     Expected Output:
    ...     1. The Baseline measurements screen shall include:
    ...        - Content: Tap Add button and select the method to take the measurement.
    ...        - List of measurements card:
    ...          + Blood pressure
    ...          + Heart rate
    ...          + Blood Oxygen
    ...          + Body temperature
    ...          + Weight
    ...        - Add button: Allows create a new record by taking a new measurement. Can add multiple records.
    ...        - Continue button
    ...        - Close button
    ...     2. Back to home screen with saving any changes in this section.
    ...     4. Navigate the user to the Alert settings section with saving any changes in this section
    [Tags]      BIOC-SELFTRACKING-06        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SELFTRACKING-07: Alert settings section
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - In Alert settings section
    ...
    ...     Test Steps:
    ...     1. Viasully Alert settings screen
    ...     2. Press on Close button
    ...     3. Press on Continue button
    ...     4. Press on Continue button
    ...
    ...     Expected Output:
    ...     1. The Alert settings screen shall include:
    ...        - Title: Alert settings
    ...        - Content: Set alert heart rate thresholds to receive a notification.
    ...        - Text: Receive a notification when the Bioheart device detecs heart rate that rises above or falls below pre-selected thresholds for 10 minutes.
    ...        - High heart rate notification: Off
    ...        - Low heart rate notification: Off
    ...        - Continue button
    ...        - Close button
    ...     2. Navigate the user to the Self tracking process screen without saving anything in this section.
    ...     4. Navigate the user to the Medication tracking section.
    [Tags]      BIOC-SELFTRACKING-07       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SELFTRACKING-08: Set high heart rate notification
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - In Alert settings section
    ...
    ...     Test Steps:
    ...     1. Click on High heart rate notification button
    ...     2. Chosse 100bpm
    ...     3. Chosse 150bpm
    ...     4. Click on Done button
    ...     4. Click Continue button
    ...
    ...     Expected Output:
    ...     1. Open the bottom sheet following options:
    ...        - OFF
    ...        - 100 bpm
    ...        - 110 bpm
    ...        - 120 bpm
    ...        - 130 bpm
    ...        - 140 bpm
    ...        - 150 bpm
    ...        - Text: Receive a notification when the Bioheart device detecs heart rate that rises above a pre-selected thresholds while you being inactive for more than 10 minutes.
    ...        - Done button
    ...     2. Text : Receive a notification when the Bioheart device detecs heart rate that rises above 100bpm while you being inactive for more than 10 minutes.
    ...     3. Text : Receive a notification when the Bioheart device detecs heart rate that rises above 150bpm while you being inactive for more than 10 minutes.
    ...     4. Close the bottom sheet
    [Tags]      BIOC-SELFTRACKING-08       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SELFTRACKING-09: Set low heart rate notification
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - In Alert settings section
    ...
    ...     Test Steps:
    ...     1. Click on Low heart rate notification button
    ...     2. Chosse 40bpm
    ...     3. Chosse 50bpm
    ...     4. Click on Done button
    ...     4. Click Continue button
    ...
    ...     Expected Output:
    ...     1. Open the bottom sheet following options:
    ...        - OFF
    ...        - 40 bpm
    ...        - 45 bpm
    ...        - 50 bpm
    ...        - Text: Receive a notification when the Bioheart device detecs heart rate that falls below a pre-selected thresholds for 10 minutes.
    ...        - Done button
    ...     2. Text: Receive a notification when the Bioheart device detecs heart rate that falls below 40bpm for 10 minutes.
    ...     3. Text: Receive a notification when the Bioheart device detecs heart rate that falls below 50bpm for 10 minutes.
    ...     4. Close the bottom sheet
    [Tags]      BIOC-SELFTRACKING-09       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SELFTRACKING-10: Medication tracking section
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - In Medication tracking section
    ...
    ...     Test Steps:
    ...     1. Viasully Medication tracking screen
    ...     2. Click on Close button
    ...     3. Click on Continue button
    ...     4. Click on Finish button
    ...     5. Click on Go to home button
    ...
    ...     Expected Output:
    ...     1. The Medication tracking screen shall include:
    ...        - Title: Medication tracking
    ...        - Content: “Tap Set up now button to start the medication tracking process.”
    ...        - Text: Set up medication
    ...          + Step 1: Add a medication
    ...          + Step 2: Set a schedule and turn on reminders
    ...        - Set up now button
    ...        - Finish button
    ...        - Close button
    ...     2. Navigate the user to the Self tracking process screen without saving anything in this section.
    ...     3. Navigate the user to continue the Medication tracking process screen
    ...     4. The Setup completed modal shall appear:
    ...        - Title: Setup completed!
    ...        - Content: “You're all set to begin Self-Tracking on Biocare Health App. Congratulations on this significant stride towards a healthier you”
    ...        - Go to Home button
    ...     5. Navigate the user to the Home screen
    [Tags]      BIOC-SELFTRACKING-10       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SELFTRACKING-11: Set up Medication
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - In Medication tracking section
    ...
    ...     Test Steps:
    ...     1. Click on Set up now button
    ...     2. Add any medication
    ...     3. Click on Continue to add button
    ...     4. Click on Back button
    ...     5. Click on Go to Home button
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Add Medication screen
    ...     2. Navigate the user to the Medication screen and popup Medication added successfully shall be displayed:
    ...        - Okay button
    ...        - Continue to add button
    ...     3. Back to the Medication screen
    ...     4. Navigate the user to the Setup completed screen.
    ...        - Title: Setup completed!
    ...        - Content: “You're all set to begin Self-Tracking on Biocare Health App. Congratulations on this significant stride towards a healthier you”
    ...        - Go to Home button
    ...     5. Navigate the user to the Home screen
    [Tags]      BIOC-SELFTRACKING-11       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SELFTRACKING-12: Completed Self-tracking for health
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - In Medication tracking section
    ...
    ...     Test Steps:
    ...     1. Click on Set up now button
    ...     2. Add any medication
    ...     3. Click on Okay button
    ...     4. Click on Go to Home button
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Add Medication screen
    ...     2. Navigate the user to the Medication screen and popup Medication added successfully shall be displayed
    ...     3. Navigate the user to the Setup completed screen
    ...     4. Navigate to the Home screen
    [Tags]      BIOC-SELFTRACKING-12       BIOC-1.22.0  manual  R1
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
