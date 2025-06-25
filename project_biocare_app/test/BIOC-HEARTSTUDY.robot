*** Settings ***
Documentation   Biocare app QoL Assessment test suite
Metadata    sid     BIOC-HEARTSTUDY
Metadata    owner   Tu Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}
#
#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-HEARTSTUDY   mapp
Test Timeout    1h

*** Test Cases ***
BIOC-HEARTSTUDY-01: Verify the banner display after input the device id 
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal 
    ...     2. start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Check the banner
    ...
    ...     Expected Output:
    ...     The banner display after input the device id
    [Tags]      BIOC-HEARTSTUDY-01      BIOC-2.0.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-02: Verify the onboarding screen after click " Get Started" on the banner
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...
    ...     Expected Output:
    ...     The onboarding screen display after click " Get Started" on the banner
    [Tags]      BIOC-HEARTSTUDY-02      BIOC-2.0.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-03: Verify the banner display after clicking back button
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Click Back button
    ...
    ...     Expected Output:
    ...     The banner displayed display " Resume Setup" button after click " Back" button on the onboarding
    [Tags]      BIOC-HEARTSTUDY-03      BIOC-2.0.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-04: Verify the onboarding screen when clicking " Next" button
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Click Next button
    ...
    ...     Expected Output:
    ...    The onboarding screen switch the next screen when clicking " Next" button
    [Tags]      BIOC-HEARTSTUDY-04     BIOC-2.0.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-05: Verify the screen when charging device 
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Click Next button
    ...     8. Go though the onboarding
    ...     9. Charging the device
    ...
    ...     Expected Output:
    ...    The screen dislay  switch the next screen when clicking " Next" button
    [Tags]      BIOC-HEARTSTUDY-05     BIOC-2.0.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-06: Verify the screen when pair device unsuccessfully
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Click Next button
    ...     8. on the step pair device, turn off device
    ...     9. Check the screen when pair device unsuccessfully
    ...
    ...     Expected Output:
    ...    The screen dislay " Could not find your biocore"
    [Tags]      BIOC-HEARTSTUDY-06     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-07: verify the screen when click the trigger
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Click Next button
    ...     8. Go though the onboarding
    ...     9. Click the trigger on the device
    ...
    ...     Expected Output:
    ...    The screen dislay the  Mark Symptom bottom sheet
    [Tags]      BIOC-HEARTSTUDY-07     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-08: Verify the instruction video when onboarding
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. On the step 2 and 3, check the instruction video
    ...
    ...     Expected Output:
    ...    The screen dislays the instruction video correctly
    [Tags]      BIOC-HEARTSTUDY-08     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-09: Verify the instruction video when on the guide
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Click guide button, check the instruction video
    ...
    ...     Expected Output:
    ...    The screen dislays the instruction video
    [Tags]      BIOC-HEARTSTUDY-09     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-10: Verify the message when device disconnect
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Turn off the device
    ...
    ...     Expected Output:
    ...    The message dislays " Device is not connected .
    ...    Please ensure Biocore is powered on and close to your phone to reconnect. "
    [Tags]      BIOC-HEARTSTUDY-10     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-11: verify the message when turn off the bluetooth
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Turn off the bluetooth
    ...
    ...     Expected Output:
    ...    The message dislays " Bluetooth is off Please turn on your Bluetooth to connect with the device."
    [Tags]      BIOC-HEARTSTUDY-11     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-12: verify the message when device starting study more day
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Wear the device
    ...     9. Wait more day, open app again, check message
    ...
    ...     Expected Output:
    ...    The message dislays " You’re doing great! Mark your symptom whenever you feel a fast heartbeat, chest pain, or discomfort. View the guide here."
    [Tags]      BIOC-HEARTSTUDY-12     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-13: verify the message when device starting study first day
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Wear the device
    ...     9. Wait the first day, open app again, check message
    ...
    ...     Expected Output:
    ...    The message dislays " Hi there! Please wear your device as much as you can. It might feel a bit strange with the electrodes at first, but don’t worry – it’ll get better over time!"
    [Tags]      BIOC-HEARTSTUDY-13    BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-14: verify the message when device starting study first day
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Wear the device
    ...     9. Wait the first day, open app again, check message
    ...
    ...     Expected Output:
    ...    The message dislays " Hi there! Please wear your device as much as you can. It might feel a bit strange with the electrodes at first, but don’t worry – it’ll get better over time!"
    [Tags]      BIOC-HEARTSTUDY-14     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-15: verify the message when device starting study first day
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Wear the device
    ...     9. Wait the first day, open app again, check message
    ...
    ...     Expected Output:
    ...    The message dislays " Hi there! Please wear your device as much as you can. It might feel a bit strange with the electrodes at first, but don’t worry – it’ll get better over time!"
    [Tags]      BIOC-HEARTSTUDY-15     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-16: verify the message when device starting study first day
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Wear the device
    ...     9. Wait the first day, open app again, check message
    ...
    ...     Expected Output:
    ...    The message dislays " Hi there! Please wear your device as much as you can. It might feel a bit strange with the electrodes at first, but don’t worry – it’ll get better over time!"
    [Tags]      BIOC-HEARTSTUDY-16     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-17: verify the message when study left 1 day
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Wear the device
    ...     9. Wait the left 1 day, open app again, check message
    ...
    ...     Expected Output:
    ...    The message dislays " You’re almost there! Keep wearing the device until the end. Great job!"
    [Tags]      BIOC-HEARTSTUDY-17     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-18: Verify the symptoms on the list symptoms when choose options on the bottom sheet
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Click trigger on the device
    ...     9. Click the option on the bottom sheet
    ...     10. Click Symptoms diary
    ...     
    ...     Expected Output:
    ...    The Mark Symptoms options dislays on the Symptoms diary
    [Tags]      BIOC-HEARTSTUDY-18     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-19: Verify the symptoms on the list symptoms when choose options on the bottom sheet and turn off the internet
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Turn off the internet
    ...     9. Click trigger on the device
    ...     10. Click the option on the bottom sheet
    ...     11. Click Submit button
    ...
    ...     Expected Output:
    ...    The error message dislays when choose options on the bottom sheet and turn off the internet
    [Tags]      BIOC-HEARTSTUDY-19     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-20: Verify the symptom bottom sheet when click notification
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Quit the app, run background with app
    ...     9. Click trigger on the device
    ...     10. Click notification of the symptom
    ...
    ...     Expected Output:
    ...    The bottom sheet is display and navigative to home
    [Tags]      BIOC-HEARTSTUDY-20     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-21: the message when generate the report on first day
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. on the first day, generate the report
    ...     9. Check message on the study
    ...
    ...     Expected Output:
    ...    The message displays "You're on the Right Track! Keep wearing your device as often as you can."
    [Tags]      BIOC-HEARTSTUDY-21     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-22: verify the device disconnect message when the last battery level is low
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...     3. The device is low battery
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Turn off the device
    ...     9. Check the message on the study
    ...
    ...     Expected Output:
    ...     The message displays "Please charge your device Once it’s fully charged, make sure it’s turned on and keep it close to your phone to reconnect"
    [Tags]      BIOC-HEARTSTUDY-22     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-23: verify the device disconnect message when the last battery level isn't low Disconnect <2h
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. turn off the device < 2h
    ...     9. Check the message on the study
    ...
    ...     Expected Output:
    ...    The message displays " Device is not connected Please make sure it’s turned on and bring it close to the phone to reconnect"
    [Tags]      BIOC-HEARTSTUDY-23     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-24: Verify the device disconnect message when the last battery level isn't low Disconnect >=2h
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. turn off the device >= 2h
    ...     9. Check the message on the study
    ...
    ...     Expected Output:
    ...    The message displays " Steps to Reconnect Your Device
    ...    - Check the device battery, ensure it's well charged.
    ...    - Turn off your Bluetooth and then turn it back on."
    [Tags]      BIOC-HEARTSTUDY-24     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-25: Verify the device disconnect message when device Offline (bioflux)
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal with bioflux
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Turn off the device bioflux
    ...     9. Check message on the study
    ...
    ...     Expected Output:
    ...    The message displays " Low cellular coverage
    ...    Please check the battery occasionally and ensure it's on to reconnect automatically when the signal improves."
    [Tags]      BIOC-HEARTSTUDY-25     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-26: verify the message when the last battery level is lower than 10%
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. wait the device have the last battery level is lower than 10%
    ...     9. Check message on the study
    ...
    ...     Expected Output:
    ...    The message displays "Device battery is low!
    ...    Please remove and charge it without turning it off. Once it’s fully charged, you can wear it again."
    [Tags]      BIOC-HEARTSTUDY-26     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-27: erify the message when device charging when the study status is ongoing
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Charging the device
    ...
    ...     Expected Output:
    ...    The message displays " Device is charging
    ...    Fully charges in 3 hours and 24 minutes."
    [Tags]      BIOC-HEARTSTUDY-27     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-28: verify the message when device charging when the study status is end
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Charging the device
    ...     9. Stop the study
    ...     10. check the message on the study
    ...
    ...     Expected Output:
    ...   No message display
    [Tags]      BIOC-HEARTSTUDY-28     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-29: the lead connection when wearing losely or not wearing
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Don't wear device
    ...
    ...     Expected Output:
    ...    The message displays " Keep Your Device Working at Its Best!
    ...    When the electrode becomes loose, gently massage it for 3-5 minutes to help secure it in place."
    [Tags]      BIOC-HEARTSTUDY-29     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-30: verify the message when the first follow on study ends and start uploading data
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic folow-on study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Turn off the device bioflux
    ...     9. Check message on the study
    ...
    ...     Expected Output:
    ...    The message displays " Stay Connected! 
    ...    Your device is working perfectly—keep it up! 
    ...    Tips to Maximize Your Results
    ...    Ensure a smooth connection between your device and phone by always keeping Bluetooth on and keeping the device close to your phone."
    [Tags]      BIOC-HEARTSTUDY-30     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-31: Verify the modal display when aborting the study
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Click abort study on the Call center
    ...
    ...     Expected Output:
    ...    The modal display when aborting the study
    [Tags]      BIOC-HEARTSTUDY-31     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-32: Verify the modal display on the onboarding when aborting the study
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. after pair device with app, don't start study
    ...     8. On the portal, click abort study
    ...
    ...     Expected Output:
    ...    The modal display on the onboarding when aborting the study
    [Tags]      BIOC-HEARTSTUDY-32     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-33: Verify the onboarding when aborting the study
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. after pair device with app, don't start study
    ...     8. On the portal, click abort study
    ...
    ...     Expected Output:
    ...    The onboarding disappear when aborting the study
    [Tags]      BIOC-HEARTSTUDY-33     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-34: Verify the study when aborting the study and after clicking the " Okay" button
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Click abort study on the Call center
    ...     9. Click the " OKay" button
    ...
    ...     Expected Output:
    ...    The study disappear when aborting the study and after clicking the " Okay" button
    [Tags]      BIOC-HEARTSTUDY-34     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-35: Verify the disconnect modal when the device is disconnect on the onboarding
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. after pair device with app, turn off the device
    ...
    ...     Expected Output:
    ...    The disconnect modal display when the device is disconnect on the onboarding
    [Tags]      BIOC-HEARTSTUDY-35     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-36: Verify the disconnect modal when the device is disconnect on the onboarding
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. after pair device with app, turn off the device
    ...
    ...     Expected Output:
    ...    The disconnect modal display when the device is disconnect on the onboarding
    [Tags]      BIOC-HEARTSTUDY-36     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-37: Verify the onboarding when turn off the internet
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Turn off the internet
    ...     6. Click " Get Started" on the banner
    ...
    ...     Expected Output:
    ...    The onboarding displays when turn off the internet
    [Tags]      BIOC-HEARTSTUDY-37    BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-38: Verify the banner when create outbond/inbound for biodirect study
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the biodirect study on the Diagnostics portal
    ...     2. Create the outbond/ inbound for biodirect study
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click " Get Started" on the banner
    ...     6. Click Back button
    ...     7. Check the banner
    ...
    ...     Expected Output:
    ...    The  banner on the way display when when create outbond/inbound for biodirect study
    [Tags]      BIOC-HEARTSTUDY-38     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-39: Verify the auto populate modal when create study have the LN, FN, DoB same with app
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the biodirect study have the LN, FN, DoB same with app on the Diagnostics portal
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Check the onboarding modal
    ...
    ...     Expected Output:
    ...    The  auto populate modal displays
    [Tags]      BIOC-HEARTSTUDY-39     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-40: Verify The onboarding display when outbound shipping status is "Delivered"
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the biodirect study on the Diagnostics portal
    ...     2. start on the study
    ...
    ...    Test Steps:
    ...     1. Change the tracking order status of this device is still delivered
    ...     2. Log in the app
    ...
    ...     Expected Output:
    ...    The onboarding display when outbound shipping status is "Delivered"
    [Tags]      BIOC-HEARTSTUDY-40     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-41: Verify the pop up when turn off the internet and disonnect device
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click " Get Started" on the banner
    ...     6. Turn off the device
    ...     7. Disconnect the device
    ...
    ...     Expected Output:
    ...    The pop up displays " Coul not leave. To leave this Heart study a networkk connection is required."  when turn off the internet
    [Tags]      BIOC-HEARTSTUDY-41    BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-42: Verify the onboarding when clicking the disconnected device and reconnect device with the other mobile ( log in the same account)
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click " Get Started" on the banner
    ...     6. Disconnect the device
    ...     7. Log in the other mobile, with the same account
    ...     8. Click the Device tab
    ...     9. Click Scan the device id
    ...     10. Input the the device id
    ...
    ...     Expected Output:
    ...    The onboarding when clicking the disconnected device and reconnect device with the other mobile ( log in the same account)
    [Tags]      BIOC-HEARTSTUDY-42    BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-43: Verify the onboarding when clicking the disconnected device and reconnect device
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click " Get Started" on the banner
    ...     6. Disconnect the device
    ...
    ...     Expected Output:
    ...    The onboarding auto display when clicking the disconnected device and reconnect device
    [Tags]      BIOC-HEARTSTUDY-43    BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-44: Verify the onboarding when uploading data, clicking the disconnected device and reconnect device
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click " Get Started" on the banner
    ...     6. Complete the study
    ...     7. Click disconnect the deivice
    ...
    ...     Expected Output:
    ...    The onboarding can't display when uploading data, clicking the disconnected device and reconnect device
    [Tags]      BIOC-HEARTSTUDY-44    BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-45: verify the message when the first follow on study ends, start uploading data and turn off device
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal with biocore device
    ...     2. Don't start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Stop the the first study, uploading data
    ...     8. Turn off the device
    ...
    ...     Expected Output:
    ...    The message displays " Device is not connected
    ...   Please ensure Biocore is powered on and close to your phone to reconnect."
    [Tags]      BIOC-HEARTSTUDY-45     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-46: Verify the onboarding when clicking the disconnected device and reconnect device with the other mobile ( log in the other account)
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click " Get Started" on the banner
    ...     6. Disconnect the device
    ...     7. Log in the other mobile, with the other account
    ...     8. Click the Device tab
    ...     9. Click Scan the device id
    ...     10. Input the the device id
    ...
    ...     Expected Output:
    ...    The onboarding when clicking the disconnected device and reconnect device with the other mobile ( log in the other account)
    [Tags]      BIOC-HEARTSTUDY-46    BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-47: verify the uploading screen displays when stop study
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic folow-on study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Stop the study
    ...
    ...     Expected Output:
    ...    The uploading screen displays when stop study
    [Tags]      BIOC-HEARTSTUDY-47     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-48: Verify the onboarding when uploading data, clicking the disconnected device and reconnect device with the other mobile( log in the same account)
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click " Get Started" on the banner
    ...     6. Stop the study
    ...     7. Click disconnect the device
    ...     8. Log in the other mobile, with the same account
    ...     9. Click the Device tab
    ...     10. Click Scan the device id
    ...     11. Input the the device id
    ...
    ...     Expected Output:
    ...   The onboarding when uploading data, clicking the disconnected device and reconnect device with the other mobile( log in the same account)
    [Tags]      BIOC-HEARTSTUDY-48    BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-49: Verify the onboarding when uploading data, clicking the disconnected device and reconnect device with the other mobile( log in the other account)
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click " Get Started" on the banner
    ...     6. Stop the study
    ...     7. Click disconnect the device
    ...     8. Log in the other mobile, with the other account
    ...     9. Click the Device tab
    ...     10. Click Scan the device id
    ...     11. Input the the device id
    ...
    ...     Expected Output:
    ...    The onboarding when uploading data, clicking the disconnected device and reconnect device with the other mobile( log in the other account)
    [Tags]      BIOC-HEARTSTUDY-49    BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BIOC-HEARTSTUDY-50: Verify the screen when pair device successfully
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Click Next button
    ...     8. on the step pair device,  vheck the screen when pair device successfully
    ...
    ...     Expected Output:
    ...    The screen dislay " Connected Successfully"
    [Tags]      BIOC-HEARTSTUDY-50     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-51: Verify the disconnect modal after successfully pairing the device and turning off bluetooth
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal bioflux device
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Pair device with app
    ...     9. Turn off the Bluetooth
    ...
    ...     Expected Output:
    ...    The disconnect modal display after successfully pairing the device and turning off bluetooth
    [Tags]      BIOC-HEARTSTUDY-51    BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-52: Verify the onboarding process after turning off internet
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal bioflux device
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Turn off internet
    ...     8. Go though the onboarding
    ...     9. Pair device with app
    ...
    ...     Expected Output:
    ...    The onboarding process still display after turning off internet
    [Tags]      BIOC-HEARTSTUDY-52    BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-53: Verify the study after turning off internet
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal bioflux device
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     8. Go though the onboarding
    ...     9. Pair device with app
    ...     10. Turn off the internet
    ...     11. On the Home tab, Check the study
    ...
    ...     Expected Output:
    ...    The study display after turning off internet
    [Tags]      BIOC-HEARTSTUDY-53    BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-54: Verify the onboarding process when connected the device before and created a study on the portal
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. log in the app, click Device tab
    ...     2. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Log in the Diagnostics portal, create the Clinic study
    ...     3. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click " Get Started" on the banner
    ...     3. Go though the onboarding
    ...
    ...
    ...     Expected Output:
    ...    The onboarding process when connected the device before and created a study on the portal
    [Tags]      BIOC-HEARTSTUDY-54    BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-55: Verify the onboarding process after clicking " Resume Setup" button
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Click Back button
    ...     8. Click " Resume Setup" button
    ...
    ...     Expected Output:
    ...     The onboarding process still continue step after clicking " Resume Setup" button
    [Tags]      BIOC-HEARTSTUDY-55      BIOC-2.0.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-56: Verify the device connect with app after create 2 studies have the same LN, FN, DoB, input correct ref code and input FirstName, LastName and DateofBirth   
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create 2 biodirect studies have the LN, FN, DoB same with app on the Diagnostics portal
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Enter Reference Code
    ...     4. Input correct ref code
    ...     5. Input FirstName, LastName and DateofBirth
    ...     6. Click Check button
    ...
    ...     Expected Output:
    ...    The device connect with app sucessfully and the onboarding process display after create 2 studies have the same LN, FN, DoB, input correct ref code and input FirstName, LastName and DateofBirth
    [Tags]      BIOC-HEARTSTUDY-56     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-57: Verify the device connect with app after create 2 studies have the same LN, FN, DoB, input wrong ref code and input FirstName, LastName and DateofBirth   
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create 2 biodirect studies have the LN, FN, DoB same with app on the Diagnostics portal
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Enter Reference Code
    ...     4. Input wrong ref code
    ...     5. Input FirstName, LastName and DateofBirth
    ...     6. Click Check button
    ...
    ...     Expected Output:
    ...    The device connect with app sucessfully and the onboarding process display after create 2 studies have the same LN, FN, DoB, input wrong ref code and input FirstName, LastName and DateofBirth
    [Tags]      BIOC-HEARTSTUDY-57     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}     

BIOC-HEARTSTUDY-58: Verify the onboarding modal after connecting with the Biocore/ Biocore pro, delete app and log in app with the same account  
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal with the Biocore/ Biocore pro
    ...     2. start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding process
    ...     8. Delete the app
    ...     9. Dowload the app
    ...     10. Log in the app with the same account
    ...
    ...     Expected Output:
    ...    The onboarding modal display after connecting with the Biocore/ Biocore pro, delete app and log in app with the same account
    [Tags]      BIOC-HEARTSTUDY-58     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}  
     
BIOC-HEARTSTUDY-BIOFLUX-01: Verify the banner display after input the device id
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal bioflux device
    ...     2. start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Check the banner
    ...
    ...     Expected Output:
    ...     The banner display after input the device id
     [Tags]      BIOC-HEARTSTUDY-BIOFLUX-01     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-BIOFLUX-02: Verify the onboarding screen after click " Get Started" on the banner
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal with bioflux device
    ...     2. start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...
    ...     Expected Output:
    ...     The onboarding screen display after click " Get Started" on the banner
    [Tags]      BIOC-HEARTSTUDY-BIOFLUX-02      BIOC-2.0.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-BIOFLUX-03: Verify the banner display after clicking back button
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal bioflux device
    ...     2. start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Click Back button
    ...
    ...     Expected Output:
    ...     The banner displayed display " Resume Setup" button after click " Back" button on the onboarding
    [Tags]      BIOC-HEARTSTUDY-BIOFLUX-03      BIOC-2.0.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-BIOFLUX-04: Verify the onboarding screen when clicking " Next" button
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal bioflux device
    ...     2. start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Click Next button
    ...
    ...     Expected Output:
    ...    The onboarding screen switch the next screen when clicking " Next" button
    [Tags]      BIOC-HEARTSTUDY-BIOFLUX-04     BIOC-2.0.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-BIOFLUX-05: Verify the screen when charging device
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal bioflux device
    ...     2. start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Click Next button
    ...     8. Go though the onboarding
    ...     9. Charging the device
    ...
    ...     Expected Output:
    ...    The screen dislay  switch the next screen when clicking " Next" button
    [Tags]      BIOC-HEARTSTUDY-BIOFLUX-05     BIOC-2.0.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-BIOFLUX-06: Verify the screen when pair device successfully
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal bioflux device
    ...     2. start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Click Next button
    ...     8. on the step pair device,  vheck the screen when pair device successfully
    ...
    ...     Expected Output:
    ...    The screen dislay " Connected Successfully"
    [Tags]      BIOC-HEARTSTUDY-BIOFLUX-06     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-BIOFLUX-07: verify the screen when click the trigger
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal bioflux device
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Click Next button
    ...     8. Go though the onboarding
    ...     9. Click the trigger on the device
    ...
    ...     Expected Output:
    ...    The screen dislay the  Mark Symptom bottom sheet
    [Tags]      BIOC-HEARTSTUDY-BIOFLUX-07     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-BIOFLUX-08: Verify the instruction video when onboarding
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal bioflux device
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. On the step 2 and 3, check the instruction video
    ...
    ...     Expected Output:
    ...    The screen dislays the instruction video correctly
    [Tags]      BIOC-HEARTSTUDY-BIOFLUX-08     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-BIOFLUX-09: Verify the message when device disconnect
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal bioflux device
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Turn off the device
    ...
    ...     Expected Output:
    ...    The message dislays " Device is not connected ensure Bluetooth is on and the device is near your phone to reconnect.
    ...    You can try turning Bluetooth off and then back on; it may resolve the issue.Got it/Contact support"
    [Tags]      BIOC-HEARTSTUDY-BIOFLUX-09     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-BIOFLUX-10: verify the message when turn off the bluetooth
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal bioflux device
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Turn off the bluetooth
    ...
    ...     Expected Output:
    ...    The message dislays " Bluetooth is off Please turn on your Bluetooth to connect with the device."
    [Tags]      BIOC-HEARTSTUDY-BIOFLUX-10     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-BIOFLUX-11: verify the message when the last battery level is lower than 20%
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal bioflux device
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. wait the device have the last battery level is lower than 20%
    ...     9. Check message on the study
    ...
    ...     Expected Output:
    ...    The message displays "Device battery is low!
    ...    Please remove and charge it without turning it off. Once it’s fully charged, you can wear it again."
    [Tags]      BIOC-HEARTSTUDY-BIOFLUX-11     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-BIOFLUX-12: Verify the message when device charging when the study status is ongoing
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal bioflux device
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...     8. Charging the device
    ...
    ...     Expected Output:
    ...    The message displays " Device is charging
    ...    Fully charges in 3 hours and 24 minutes."
    [Tags]      BIOC-HEARTSTUDY-BIOFLUX-12     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-BIOFLUX-13: Verify the message when device don't start the study
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal bioflux device
    ...     2. Don't start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Go though the onboarding
    ...
    ...     Expected Output:
    ...    The message displays " Heart monitoring hasn’t started yet!
    ...    Please make sure you have the device and follow instructions to get started.
    ...    View instructions here"
    [Tags]      BIOC-HEARTSTUDY-BIOFLUX-13     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-BIOFLUX-14: Verify the message when device offline
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal bioflux device
    ...     2. Don't start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Turn off the device
    ...
    ...     Expected Output:
    ...    The message displays " Low cellular coverage
    ...    Please check the battery occasionally and ensure it's on to reconnect automatically when the signal improves."
    [Tags]      BIOC-HEARTSTUDY-BIOFLUX-14     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-BIOFLUX-15: Verify the message when uploading data and device offline
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal bioflux device
    ...     2. Don't start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Stop the study, uploading data
    ...     8. Turn off the device
    ...
    ...     Expected Output:
    ...    The message displays " Low cellular coverage
    ...    Please check the battery occasionally and ensure it's on to reconnect automatically when the signal improves."
    [Tags]      BIOC-HEARTSTUDY-BIOFLUX-15     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-BIOFLUX-17: verify the message when the first follow on study ends and start uploading data
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic folow-on study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click Check button
    ...     6. Click " Get Started" on the banner
    ...     7. Stop the the first study, uploading data
    ...     8. Turn off the device
    ...     9. Check message on the study
    ...
    ...     Expected Output:
    ...    The message displays " Stay Connected!
    ...    Your device is working perfectly—keep it up!
    ...    Tips to Maximize Your Results
    ...    Ensure a smooth connection between your device and phone by always keeping Bluetooth on and keeping the device close to your phone."
    [Tags]      BIOC-HEARTSTUDY-BIOFLUX-17     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-BIOFLUX-18: Verify the auto populate modal when create study have the LN, FN, DoB same with app
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the biodirect study have the LN, FN, DoB same with app on the Diagnostics portal with device bioflux
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Check the onboarding modal
    ...
    ...     Expected Output:
    ...    The auto populate modal displays
    [Tags]      BIOC-HEARTSTUDY-BIOFLUX-18     BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-BIOFLUX-19: Verify the onboarding when clicking the disconnected device and reconnect device
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal with bioflux device
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click " Get Started" on the banner
    ...     6. Disconnect the device
    ...
    ...     Expected Output:
    ...    The the onboarding auto display when clicking the disconnected device and reconnect device
    [Tags]      BIOC-HEARTSTUDY-BIOFLUX-19    BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-BIOFLUX-20: Verify the onboarding when uploading data, clicking the disconnected device and reconnect device
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal with biolfux device
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Click " Get Started" on the banner
    ...     6. Complete the study
    ...     7. Click disconnect the deivice
    ...
    ...     Expected Output:
    ...    The onboarding can't display when uploading data, clicking the disconnected device and reconnect device
    [Tags]      BIOC-HEARTSTUDY-BIOFLUX-20    BIOC-2.0.0  manual  R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-HEARTSECURE-01: Verify the banner display after creating study by Heartsercure
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Log in The Heartsecure portal
    ...     2. Fill in all information
    ...     3. Click Pay Now button
    ...     4. Fill in the card information
    ...     5. Click Pay button
    ...     6. Log in The Biodirect portal
    ...     7. Click Assign Device button
    ...     8. Assign device for study
    ...
    ...     Test Steps:
    ...     1. Log in the app with Heartsecure account
    ...     2. Click Home tab
    ...
    ...     Expected Output:
    ...     The onboarding pop-up auto display after input the device id
    [Tags]      BIOC-HEARTSTUDY-HEARTSECURE-01     BIOC-2.0.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-HEARTSECURE-02: Verify the "Device on the way" banner appears after creating the outbound and change the status of the outbound to Deliver on biodirect study
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     1. Log in The Heartsecure portal
    ...     2. Fill in all information
    ...     3. Click Pay Now button
    ...     4. Fill in the card information
    ...     5. Click Pay button
    ...     6. Log in The Biodirect portal
    ...     7. Click Assign Device button
    ...     8. Assign device for study
    ...     9. Click Create the Shipment order
    ...     10. Fill in all information
    ...     11. Click Preview button
    ...     12. Change status outbound to Deliver
    ...
    ...     Test Steps:
    ...     1. Log in the app with Heartsecure account
    ...     2. Click Home tab
    ...     3. Check the banner
    ...
    ...     Expected Output:
    ...    The "Device on the way" banner appears after creating the outbound and change the status of the outbound to Deliver on biodirect study
    [Tags]      BIOC-HEARTSTUDY-HEARTSECURE-02     BIOC-2.0.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-HEARTSTUDY-LINKSTUDY-01: Verify the study is linked to historical studies when the study match with the updated First Name, Last Name and Date of Birth
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Create the study on the diagnostic portal with phone number
    ...     - Input the email
    ...     - Stop the study
    ...
    ...    Test Steps:
    ...     1. Update the First Name, Last Name and Date of Birth with the existing patient account
    ...     2. Log in the app with the existing patient account
    ...     3. Click the Service tab
    ...     4. CLick the Historical studies
    ...     5. Check the study is updated First Name, Last Name and Date of Birth
    ...
    ...     Expected Output:
    ...     The study is linked to historical studies when the study match with the updated First Name, Last Name and Date of Birth
    [Tags]      BIOC-HEARTSTUDY-LINKSTUDY-01     BIOC-2.0.0  manual  R1
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
