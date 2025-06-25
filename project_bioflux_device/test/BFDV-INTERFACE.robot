*** Settings ***
Documentation  Biofux device interface verification test suite
Metadata    sid   BFDV-INTERFACE
Metadata  owner   Nang Phung
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py

Suite Setup     Log    SUITE SETUP
Suite Teardown  Log    SUITE TEARDOWN
Force Tags  BFDV-INTERFACE      device
Test Timeout  1h

*** Test Cases ***
BFDV-INTERFACE-01: Confirm the ECG format
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. Device software shall incorporate graphic user interface for the user interactions.
    ...     - 2. After pressing Start Study, a screen that will show a big check mark and have the text success in the center bottom of the screen.
    ...     - 3. Device software shall incorporate graphic user interface for the user notifications.
    ...     - 4. Device software shall support Audio output for audible user notifications.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60
    ...     Test Output:
    ...     - 1. Wait for 1 minute for study to get initiated on the device display. The device shall display Syncing Study screen.. . Confirm for SRS request No.1
    ...     - 2. Confirm the details on the STUDY DETAILS screen and press “NEXT”.. .
    ...     - 3. Verify device screen CONNECT ELECTRODES is displayed. Press “NEXT” once the ECG cable and electrodes are properly connected.. .
    ...     - 4. Verify the device shows ECG VIEW screen. Press “NEXT”.. .
    ...     - 5. Verify that START STUDY screen is displayed and press the Play button to start the study.. .
    ...     - 6. Verify the “Success” screen will be displayed in 5 seconds. . Confirm for SRS request No.2
    ...     - 7. Waiting for 30 seconds. Once the study has started, locate and press the event button once on the device.. .
    ...     - 8. Verify that EVENT BUTTON event screen is displayed. Press “NEXT”.. . Confirm for SRS request No.1
    ...     - 9. Verify that CURRENT SUMPTOMS screen is displayed. Select “Other” and press “SEND”.. .
    ...     - 10. Waiting for 30 seconds. Locate and press the event button once on the device.. .
    ...     - 11. Verify that the Bioflux device vibrates/beeps and displays EVENT BUTTON Screen.. . Confirm for SRS request No.3 and No.4
    ...     - 12. Press NEXT to continue and then press SEND on the SYMPTOMS screen.. .
    ...     - 13. Disconnect the ECG cable.. .
    ...     - 14. Verify that the Bioflux device vibrates/beeps and displays ALERT NOTIFICATION Screen associated with electrodes disconnection.. . Confirm for SRS request No.3 and No.4
    ...     - 16. Upload study data using the uploadstudy command.. .
    ...     - 17. Upload HES annotation file by sending getann command.. .
    ...     - 18. Upload the device log by sending getlog command.. .
    ...     - 19. Erase study by sending erasestudy command.. .
    ...     - 20. Verify device silently reboots after erasing study data.. .
    [Tags]  BFDV-INTERFACE-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-INTERFACE-02: Confirm the ECG format
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - While the display is turned-on on the device while study is in progress, the device shall display the remaining study time.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60
    ...     - 3. Wait for 1 minute for study to get initiated on the device display..
    ...     - 4. Follow all the steps on the device display and then start the study.
    ...     Test Output:
    ...     - 1. Wait for 2 minutes with no user interactions, the display shall power off to conserve battery.. .
    ...     - 2. Verify that Status LED shall slowly fade in and out to allow the user to know that the device is powered up, recording and no notifications are present.. .
    ...     - 3. Press the Home Button and the device shall display the Remaining Time screen showing remaining study duration in the MCT study.. .
    ...     - 4. Send the stopstudy command to stop the active study.. .
    ...     - 5. Upload study data using the uploadstudy command.. .
    ...     - 6. Upload HES annotation file by sending getann command.. .
    ...     - 7. Upload the device log by sending getlog command.. .
    ...     - 8. Erase study by sending erasestudy command.. .
    [Tags]  BFDV-INTERFACE-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-INTERFACE-03: Confirm the ECG format
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. When Event Button is pressed, the device shall provide the following notifications:
    ...     - 1. The Event Button Screen shall appear.
    ...     - 2. The device shall vibrate once.
    ...     - 3. The device shall beep once.
    ...     - 2. When the device is turned off by pressing and holding the Home Button, the device shall provide the following notifications:
    ...     - 1. The device shall display the confirmation prompt.
    ...     - 2. The device shall vibrate.
    ...     - 3. The device shall beep.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60
    ...     - 3. Wait for 1 minute for study to get initiated on the device display.
    ...     - 4. Follow all the steps on the device display and then start the study.
    ...     - 5. Once the study has started, locate and press the event button once on the device.
    ...     Test Output:
    ...     - 1. Verify that the Bioflux device beeps once, vibrates and displays EVENT BUTTON Screen.. . Confirm for SRS request No.1
    ...     - 2. Send the stopstudy command to stop the active study.. .
    ...     - 3. Upload study data using the uploadstudy command.. .
    ...     - 4. Upload HES annotation file by sending getann command.. .
    ...     - 5. Upload the device log by sending getlog command.. .
    ...     - 6. Erase study by sending erasestudy command.. .
    ...     - 7. Verify device silently reboots after erasing study data.. .
    ...     - 8. Long press Power Key for 3s.. .
    ...     - 9. Verify that the Bioflux device shall display the confirmation prompt screen.. .
    ...     - 10. Press "YES" in Power Off Confirmation screen, it beeps and vibrates once when YES is selected on the Power Off Confirmation screen. The display, LED and device shall turn off.. . Confirm for SRS request No.2
    [Tags]  BFDV-INTERFACE-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-INTERFACE-04: Confirm the ECG format
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...          By pressing NEXT on the Event Button Pressed screen, the device software shall display the Symptoms screen with pre-selected list of symptoms.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60
    ...     - 3. Wait for 1 minute for study to get initiated on the device display.
    ...     - 4. Follow all the steps on the device display and then start the study.
    ...     - 5. Once the study has started, locate and press the event button once on the device.
    ...     Test Output:
    ...     - 1. Verify that the Bioflux device beeps once, vibrates and displays EVENT BUTTON Screen.. .
    ...     - 2. Upon pressing “NEXT” on the EVENT BUTTON Screen, the device shall display the Symptoms screen with pre-selected list of symptoms.. .
    ...     - 3. Select “Other” and press “SEND” button.. .
    ...     - 4. Send the stopstudy command to stop the active study.. .
    ...     - 5. Upload study data using the uploadstudy command.. .
    ...     - 5. Upload HES annotation file by sending getann command.. .
    ...     - 6. Upload the device log by sending getlog command.. .
    ...     - 6. Erase study by sending erasestudy command.. .
    [Tags]  BFDV-INTERFACE-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-INTERFACE-05: Confirm the ECG format
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The device support to display the Spanish language
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Connect the device to the Bioflux Device Monitor Software. Issue the command below to “calibrate” screen
    ...     - SM+CALIBRATETS. .
    ...     - 2. The device shall power-off, then power-on, and display the “calibrate” screen.. .
    ...     - 3. Verify that the “calibrate 1” screen same as the “calibate_1” figure in"input" folder. .
    ...     - 4. Select the “Add” button to switch to next “calibrate” screen. .
    ...     - 5. Verify that the “calibrate 2” screen same as the “calibate_2” in"input" folder. .
    ...     - 6. Select the “Add” button to switch to next “calibrate” screen. .
    ...     - 7. Verify that the “calibrate 3” screen same as the “calibate_3” figure in "input" folder. .
    ...     - 8. Select the “Add” button to switch to the “verification” screen. .
    ...     - 9. Verify that the “verification 1” screen same as the “verification_1” figure in “input” folder. .
    ...     - 10. Select the “Add” button to switch to next “verification” screen. .
    ...     - 11. Verify that the “verification 2” screen same as the “verification _2” figure in “input” folder. .
    ...     - 12. Select the “Add” button to switch to the next “verification” screen. .
    ...     - 13. Verify that the “verification 3” screen same as the “verification_3” figure in “input” folder. .
    ...     - 14. Select the “Add” button to switch to “check touch” screen. .
    ...     - 16. Select “REALiZADO” button and waiting some seconds. .
    ...     - 17. Plug the device in for charging. .
    ...     - 18. Verify that the “charging” screen same as the “charging” figure in “input” folder. .
    ...     - 19. Wait until the battery is fully charged.. .
    ...     - 20. Verify that the “full charge” screen same as the “full charge” figure in “input” folder. .
    ...     - 21. Unplug the device in for charging. .
    ...     - 22. Connect the device to the Bioflux Device Monitor Software. Switch the device to mass storge mode. .
    ...     - 23. Verify that this screen the same as the “mass storaged mode” figure in “input” folder. .
    ...     - 24. Power-off the device and remove the SD card. .
    ...     - 25. Power on the device by pressing and holding the Home button for 3-5 seconds.. .
    ...     - 26. Verify that the “Device error” screen same as the “device error” figure in “input” folder. .
    ...     - 27. Insert the SD card back into the device. .
    ...     - 28. Power on the device by pressing and holding the Home button for 3-5 seconds.. .
    ...     - 29. Verify that the “Set up device for MCT study” screen same as the “set up device” figure in “input” folder. .
    ...     - 30. Press the “Power” button for 3-5 seconds.. .
    ...     - 31. Verify that the “confirm Power off” screen same as the “confirm Power off” figure in “input” folder. .
    ...     - 32. Select “YES” button on the device. .
    ...     - 33. Verify that the “Power-off device” screen same as the “power-off device” figure in “input” folder. .
    ...     - 34. Power on the device by pressing and holding the Home button for 3-5 seconds.. .
    ...     - 36. Verify that the “Low cell signal” screen same as the “low cell signal” figure in “input” folder. .
    ...     - 37. Wait for long enough to let the battery charge drop below 40%.. .
    ...     - 38. Verify that the “Low battery” screen same as the “low battery” figure in “input” folder. .
    ...     - 39. Upload the device log by sending getlog command.. .
    [Tags]  BFDV-INTERFACE-05    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-INTERFACE-06: Confirm the ECG format
    [Documentation]     Author: Nang Phung
    ...
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=120
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=1
    ...          TachyThresh=300
    ...          PauseThresh=2500
    ...          PauseDetection=0
    ...          AfibDetection=0
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60
    ...     - 3. Wait for 1 minute for the study to get initiated on the device display.
    ...     Test Output:
    ...     - 1. Verify that the “syncing” screen same as the “syncing study” figure in “input” folder. .
    ...     - 2. Select “Cancelar” button on the screen. .
    ...     - 3. Verify that the “Confirming abort study” screen same as the “confirming abort study” figure in “input” folder. .
    ...     - 4. Select the “No” button on the screen. .
    ...     - 5. Verify that the “Study Detail” screen same as the “study detail” figure in “input” folder. .
    ...     - 6. Select “Siguiente” button on the screen. .
    ...     - 7. Verify that the “Connect electrodes” screen same as the “connect electrodes” figure in “input” folder. .
    ...     - 8. Select “Siguiente” button on the screen. .
    ...     - 9. Verify that the “ECG View” screen same as the “ECG view” figure in “input” folder. .
    ...     - 10. Select “Siguiente” button on the screen. .
    ...     - 11. Verify that the “Start study” screen same as the “start study” figure in “input” folder. .
    ...     - 12. Select “Start study” button on the screen. .
    ...     - 13. Verify that the “Start study success” screen same as the “start study success” figure in “input” folder. .
    ...     - 14. Waiting some seconds. .
    ...     - 16. Disconnect ECG cable. .
    ...     - 17. Verify that the “Lead Off” screen same as the “lead Off” figure in “input” folder. .
    ...     - 18. Plug the device in for charging and waiting for 30 seconds. .
    ...     - 19. Verify that the “Study pause” screen same as the “study pause” figure in “input” folder. .
    ...     - 20. Press the “Event” button on the device. .
    ...     - 21. Unplug the device in for charging. .
    ...     - 22. Verify that the “Event button” screen same as the “event button” figure in “input” folder. .
    ...     - 23. Select the “Next” button on the screen. .
    ...     - 24. Verify that the “Symptoms” screen same as the “symptoms” figure in “input” folder. .
    ...     - 25. Press “Event” and “Power” button on the device for 5 seconds to force-shutdown device. .
    ...     - 26. Press the “Power” button for 3-5 seconds.. .
    ...     - 27. Verify that the “Wait to resume study” screen same as the “wait to resume study” figure in “input” folder. .
    ...     - 28. Waiting for 30 seconds. .
    ...     - 29. Verify that the “Resume study” screen same as the “resume study” figure in “input” folder. .
    ...     - 30. Select “Resume” to resume study. .
    ...     - 32. Verify that the the “Low cell signal” screen same as the “low cell signal” figure in “input” folder. .
    ...     - 33. Send the stop study command. .
    ...     - 34. Verify that the the “Study completed” screen same as the “study completed” figure in “input” folder. .
    ...     - 35. Send the upload study command.. .
    ...     - 36. Verify that the the “uploading data” screen same as the “uploading data” figure in “input” folder. .
    ...     - 37. Disconnect the device to the server. .
    ...     - 38. Verify that the the “Retry uploading data” screen same as the “retry uploading” figure in “input” folder. .
    ...     - 39. Connect the device to the server and waiting for the device uploading finish. .
    ...     - 40. Send the erase study command.. .
    ...     - 41. Verify that the the “Erase study” screen same as the “erase study” figure in “input” folder. .
    ...     - 42. Upload the device log by sending getlog command.. .
    [Tags]  BFDV-INTERFACE-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}