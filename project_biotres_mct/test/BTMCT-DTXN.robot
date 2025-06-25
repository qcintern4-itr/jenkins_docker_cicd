*** Settings ***
Documentation   Test Suite - Communication
Metadata        sid     BTMCT-DTXN
Metadata        owner   Han Nguyen
Library         corelib/AssertionExtension.py
Library         corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}

Force Tags      BTMCT-DTXN      device
Test Timeout    1h

*** Test Cases ***
BTMCT-DTXN-01: Detect event manual and acknowledge the user commanded cardiac event storage request
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Device software shall be able to detect user commanded (manual) cardiac event record request.
    ...     - 2. The device software shall acknowledge the user commanded cardiac event storage request by sending user notifications.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=10
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device.
    ...     - 4. Press and hold the "Event" button on device for 5 seconds to start study.
    ...     - 5. Once the study has started, locate and press the event button once on the device.
    ...     - 6. Make sure no symptom is selected and then press “Send”.
    ...     Test Output:
    ...     - 1. Wait for 1 minutes to complete the pre, post trigger recording.
    ...     - 2. Wait for additional 1 minutes for device to post the manual event data.
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the event button pressed action.
    ...          Verify there are files with the format below:
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.ann
    ... 	- 4. Within most recent device status output, verify that the battery charging is OFF
    ... 	- 5. Locate and press the event button once on the device.
    ... 	- 6. On the symptoms screen of Biotres gateway, select “Other” as symptom and then press “Send”.
    ...     - 7. Wait for additional 1 minutes for device to post the manual event data.
    ... 	- 8. In WinSCP, refresh the view. Verify there are files with the format below:
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.ann
    ... 	- 9. Open the event-manual-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify the “Manual event” entry and “Other” entry under the title “Reason”.
    ... 	- 10. Wait study complete. Upload study data using the uploadstudy command.
    ... 	- 11. Upload the device log by sending getlog command.
    ...     - 12. Erase study by sending the erasestudy command.
    [Tags]      BTMCT-DTXN-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-DTXN-02: Ignore new request while previous request is in progress provide the user notification.
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. The device software shall ignore new request to store the user commanded cardiac event storage while previous request is in progress.
    ...     - 2. The device software shall provide the user notification if the user commanded cardiac event storage fails.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=10
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device.
    ...     - 4. Press and hold the "Event" button on device for 5 seconds to start study.
    ...     - 5. Once the study has started, locate and press the event button on the device.
    ...     - 6. On the symptoms screen of the Biotres gateway, press “Send”.
    ...     - 7. While post trigger storage for the manual event is in progress from step 5, within 30 seconds press the event button on the device.
    ...     Test Output:
    ...     - 1. Verify that the Biotres Biotres gateway does not display symptoms screen.
    ...     - 2. Wait for 1 minute to complete the pre, post trigger recording of the 1st manual event.
    ...     - 3. Wait for additional 2 minutes for device to post the manual event data for the 1st manual event.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the event button pressed action.
    ...          Verify there are files with the format below:
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 5. Since the second event button was pressed while post trigger from the 1st event was in progress, the 2nd manual event will be ignored.
    ...          Verify that following files are not created for the 2nd manual event press.
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 6. Upload the device log by sending the getlog.txt command.
    ...     - 7. Verify that the following error entry was created in the log file showing the rejection of storing the 2nd event press: Event key pressed
    ...          Manual event is rejected: another manual event is pending
    ...     - 8. Upload study data using the uploadstudy command.
    ...     - 9. Upload the device log by sending getlog command.
    ...     - 10. Erase study by sending the erasestudy command.
    [Tags]      BTMCT-DTXN-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-DTXN-03: Cardiac event record equal to the programmed value
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Device software shall be able to transmit cardiac event data to the server upon user commanded cardiac event record request
    ...          with pre-trigger duration equal to the programmed value of Arrhythmia Event Pre-Trigger Duration and post trigger duration
    ...          equal to programmed value of Arrhythmia Event Post-Trigger Duration.
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device.
    ...     - 4. Press and hold the "Event" button on device for 5 seconds to start study.
    ...     - 5. Once the study has started wait for 1 minute for the pre-trigger recording.
    ...     - 6. Locate and press the event button once on the device.
    ...     - 7. On the symptoms screen of the Biotres gateway, select “Other” and press “Send”.
    ...     Test Output:
    ...     - 1. Wait for 2 minutes to complete the pre, post trigger recording.
    ...     - 2. Wait for additional 2 minutes for device to post the manual event data.
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the event button pressed action.
    ...          Verify there are files with the format below:
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 4. Open the event-manual-mm-dd-yy-hh-mm-ss+timezone.hea header file using MTLAB Waveform Database (WFDB) software package.
    ...          Verify that the pre-trigger and post-trigger storage durations are 30 seconds each as programmed. MATLAB will plot the MIT16 file data in number of samples.
    ...          The sample rate for recording is fixed at 250 samples per second. Verify the total number samples displayed by MATLAB plot is 250(sps)*(30s+30s)= 15000 samples.
    ...     - 5. Save and copy MATLAB plot to the output folder.
    ...     - 6. Upload study data using the uploadstudy command.
    ...     - 7. Upload the device log by sending getlog command
    ...     - 8. Erase study by sending the erasestudy command.
    [Tags]      BTMCT-DTXN-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-DTXN-04: The device software shall be able to add symptom information.
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. The device software shall be able to add symptom information, which is queried via the Biotres gateway GUI, to the User commanded cardiac event.
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device.
    ...     - 4. Press and hold the "Event" button on device for 5 seconds to start study.
    ...     - 5. Once the study has started, locate and press the event button once on the device.
    ...     Test Output:
    ...     - 1. Verify pressing the “Event” button on the device, symptoms screen is displayed on the Biotres gateway
    ...     - 2. On the Symptoms screen, confirm none of the options buttons are filled in
    ...     - 3. Select the options from the symptom list:
    ...          Palpitations
    ...          Shortness of breath,
    ...          Dizziness
    ...          Chest Pain/ Pressure
    ...          Other
    ...          Press “Send” button.
    ...     - 4. Wait for 1 minutes to complete the pre, post trigger recording.
    ...     - 5. Wait for additional 1 minutes for device to post the manual event data.
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the event button pressed action.
    ...          Verify there are files with the format below:
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 7. Verify that it is displaying all selected symptoms under Manual Event Reason.
    ...     - 8. Upload study data using the uploadstudy command.
    ...     - 9. Create an local "SD card" folder on the PC
    ...     - 10. Connect the device to the “Device Monitor” program
    ...     - 11. Switch the device to the “Mass Storage” mode
    ...     - 12. Copy the “rec” folder to the “SD card” folder
    ...     - 13. Create an local "Device" folder on the PC
    ...     - 14. Using WinSCP, transfer the following files to “Device” folder:
    ...           event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-manual-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-manual-mm-dd-yy-hh-mm-ss+timezone.ann
    ...           data-all- mm-dd-yy-hh-mm-ss+timezone.hea
    ...           data-all- mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 15. Use “ECG Verification” program to verify the ecg data of two folder “SD card” and “Device” folder.
    ...     - 16. Make sure the program does not report any warning on the verification result
    ...     - 17. Upload the device log by sending getlog command
    ...     - 18. Erase study by sending the erasestudy command
    [Tags]      BTMCT-DTXN-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-DTXN-05: Detect Bradycardia
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Device software shall be able to auto detect bradycardia event using the detection algorithms.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=45
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device.
    ...     - 4. Follow all the steps on the device display and then start the study.
    ...     - 5. Once the study has started, using an ECG simulation tool, generate a Bradycardia event by setting the BPM to 40.
    ...     Test Output:
    ...     - 1. Wait for 1 minutes to complete the pre, post trigger recording.
    ...     - 2. Verify the remaining study duration on the device screen.
    ...     - 3. Wait for additional 1 minutes for device to post the auto event data.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event.
    ...          Verify there are files with the format below:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 5. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Brady”.
    ...     - 6. Open the event-manual-mm-dd-yy-hh-mm-ss+timezone.hea header file using MTLAB Waveform Database (WFDB) software package.
    ...          Verify that the pre-trigger and post-trigger storage durations are 30 seconds each as programmed. MATLAB will plot the MIT16 file data in number of samples.
    ...          The sample rate for recording is fixed at 250 samples per second. Verify the total number samples displayed by MATLAB plot is 250(sps)*(30s+30s)= 15000 samples.
    [Tags]      BTMCT-DTXN-05    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-DTXN-06: Detect Tachycardia
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Device software shall be able to auto detect tachycardia event using the detection algorithms.
    ...     Test Setup and Input:
    ...     - 1. Once the study has started, using an ECG simulation tool, generate a TachyCardia event by setting the BPM to 180.
    ...     Test Output:
    ...     - 1. Wait for 2 minutes to complete the pre, post trigger recording.
    ...     - 2. Wait for additional 1 minutes for device to post the auto event data.
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event.
    ...          Verify there are files with the format below:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 4. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Tachy”.
    ...     - 5. Open the event-manual-mm-dd-yy-hh-mm-ss+timezone.hea header file using MTLAB Waveform Database (WFDB) software package.
    ...          Verify that the pre-trigger and post-trigger storage durations are 30 seconds each as programmed. MATLAB will plot the MIT16 file data in number of samples.
    ...          The sample rate for recording is fixed at 250 samples per second. Verify the total number samples displayed by MATLAB plot is 250(sps)*(30s+30s)= 15000 samples.
    [Tags]      BTMCT-DTXN-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-DTXN-07: Detect Atrial Fibrillation
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Device software shall be able to auto detect atrial fibrillation event using the detection algorithms.
    ...     Test Setup and Input:
    ...     - 1. Once the study has started, wait for 1 minute and then using an ECG simulation tool, generate an Atrial Fibrillation coarse event.
    ...     Test Output:
    ...     - 1. Wait for 2 minutes to complete the pre, post trigger recording.
    ...     - 2. Wait for additional 1 minutes for device to post the auto event data.
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event.
    ...          Verify there are files with the format below:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 4. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Afib”.
    ...     - 5. Open the event-manual-mm-dd-yy-hh-mm-ss+timezone.hea header file using MTLAB Waveform Database (WFDB) software package.
    ...          Verify that the pre-trigger and post-trigger storage durations are 30 seconds each as programmed. MATLAB will plot the MIT16 file data in number of samples.
    ...          The sample rate for recording is fixed at 250 samples per second. Verify the total number samples displayed by MATLAB plot is 250(sps)*(30s+30s)= 15000 samples.
    [Tags]      BTMCT-DTXN-07    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-DTXN-08: Detect Pause
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Device software shall be able to auto detect pause event using the detection algorithms.
    ...     Test Setup and Input:
    ...     - 1. Once the study has started, using an ECG simulation tool, generate a Pause event.
    ...     Test Output:
    ...     - 1. Wait for 2 minutes to complete the pre, post trigger recording.
    ...     - 2. Wait for additional 1 minutes for device to post the auto event data.
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event.
    ...          Verify there are files with the format below:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 4. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Pause”.
    ...     - 5. Open the event-manual-mm-dd-yy-hh-mm-ss+timezone.hea header file using MTLAB Waveform Database (WFDB) software package.
    ...          Verify that the pre-trigger and post-trigger storage durations are 30 seconds each as programmed. MATLAB will plot the MIT16 file data in number of samples.
    ...          The sample rate for recording is fixed at 250 samples per second. Verify the total number samples displayed by MATLAB plot is 250(sps)*(30s+30s)= 15000 samples.
    ...     - 6. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 7. Create an local "SD card" folder on the PC
    ...     - 8. Connect the device to the “Device Monitor” program
    ...     - 9. Switch the device to the “Mass Storage” mode
    ...     - 10. Copy the “rec” folder to the “SD card” folder.
    ...     - 11. Create an local "Device" folder on the PC
    ...     - 12. Use “ECG Verification” program to verify the ecg data of two folder “SD card” and “Device” folder.
    ...     - 13. Make sure the program does not report any warning on the verification result
    ...     - 14. Upload the device log by sending getlog command.
    ...     - 15. Erase study by sending erasestudy command.
    [Tags]      BTMCT-DTXN-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-DTXN-09: Detect Ves-Tachycardia
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Device software shall be able to auto detect Ves-Tachycardia event using the detection algorithms.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Auto=0
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device.
    ...     - 4. Follow all the steps on the device display and then start the study.
    ...     - 5. Once the study has started, using an ECG simulation tool, generate an Ves-Tachycardia event.
    ...     Test Output:
    ...     - 1. Verify the remaining study duration on the device screen.
    ...     - 2. Wait for 5 minutes for study to get completed.
    ...     - 3. In WinSCP, refresh the view. Verify there are files with the format below:
    ...          report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          report-final-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 4. Open the report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt file using text editor. Verify that record of Ves-Tachycardia event
    ...     - 5. Open the report-final-mm-dd-yy-hh-mm-ss+timezone.txt file using text editor. Verify that contents of Ves-Tachycardia event
    ...     - 6. Upload the device log by sending getlog command.
    ...     - 7. Erase study by sending erasestudy command.
    ...     - 8. Verify device silently reboots after erasing study data.
    [Tags]      BTMCT-DTXN-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-DTXN-10: Detect Ves-Bigeminy
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Device software shall be able to auto detect Ves-Bigeminy event using the detection algorithms.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Auto=0
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device.
    ...     - 4. Follow all the steps on the device display and then start the study.
    ...     - 5. Once the study has started, using an ECG simulation tool, generate an Ves-Bigeminy event.
    ...     Test Output:
    ...     - 1. Verify the remaining study duration on the device screen.
    ...     - 2. Wait for 5 minutes for study to get completed.
    ...     - 3. In WinSCP, refresh the view. Verify there are files with the format below:
    ...          report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          report-final-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 4. Open the report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt file using text editor. Verify that record of Ves-Bigeminy event
    ...     - 5. Open the report-final-mm-dd-yy-hh-mm-ss+timezone.txt file using text editor. Verify that contents of Ves-Bigeminy event
    ...     - 6. Upload the device log by sending getlog command.
    ...     - 7. Erase study by sending erasestudy command.
    ...     - 8. Verify device silently reboots after erasing study data.
    [Tags]      BTMCT-DTXN-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-DTXN-11: Detect Ves-Trigeminy
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Device software shall be able to auto detect Ves-Trigeminy event using the detection algorithms.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Auto=0
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device.
    ...     - 4. Follow all the steps on the device display and then start the study.
    ...     - 5. Once the study has started, using an ECG simulation tool, generate an Ves-Trigeminy event.
    ...     Test Output:
    ...     - 1. Verify the remaining study duration on the device screen.
    ...     - 2. Wait for 5 minutes for study to get completed.
    ...     - 3. In WinSCP, refresh the view. Verify there are files with the format below:
    ...          report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          report-final-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 4. Open the report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt file using text editor. Verify that record of Ves-Trigeminy event
    ...     - 5. Open the report-final-mm-dd-yy-hh-mm-ss+timezone.txt file using text editor. Verify that contents of Ves-Trigeminy event
    ...     - 6. Upload the device log by sending getlog command.
    ...     - 7. Erase study by sending erasestudy command.
    ...     - 8. Verify device silently reboots after erasing study data.
    [Tags]      BTMCT-DTXN-11    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-DTXN-12: Detect SVES
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Device software shall be able to auto detect SVES event using the detection algorithms.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Auto=0
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device.
    ...     - 4. Follow all the steps on the device display and then start the study.
    ...     - 5. Once the study has started, using an ECG simulation tool, generate an SVES event.
    ...     Test Output:
    ...     - 1. Verify the remaining study duration on the device screen.
    ...     - 2. Wait for 5 minutes for study to get completed.
    ...     - 3. In WinSCP, refresh the view. Verify there are files with the format below:
    ...          report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          report-final-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 4. Open the report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt file using text editor. Verify that record of SVES event
    ...     - 5. Open the report-final-mm-dd-yy-hh-mm-ss+timezone.txt file using text editor. Verify that contents of SVES event
    ...     - 6. Upload the device log by sending getlog command.
    ...     - 7. Erase study by sending erasestudy command.
    [Tags]      BTMCT-DTXN-12    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library      project_bioheart_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${URL}  Get Config Param    WEB_BASE_URL
    Open Page  ${URL}

SUITE TEARDOWN
    Quit Browser
