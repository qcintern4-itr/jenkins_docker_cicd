*** Settings ***
Documentation  Biofux device arrhythmia detection verification test suite
Metadata    sid   BFDV-ARRHYTHMIA
Metadata  owner   Nang Phung
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py

Suite Setup     Log    SUITE SETUP
Suite Teardown  Log    SUITE TEARDOWN
Force Tags  BFDV-ARRHYTHMIA     device
Test Timeout  1h

*** Test Cases ***
BFDV-ARRHYTHMIA-01: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  
    ...     - 1. Device software shall integrate scientific algorithms (OTS) to detect non-life threating arrhythmia.
    ...     - 2. Device software shall be able to auto detect arrhythmia event using the detection algorithms.
    ...     - 3. Device software shall be able to transmit auto arrhythmia event detected using the detection algorithms to the server with pre-trigger duration equal to the programmed value of Arrhythmia Event Pre-Trigger Duration and post trigger duration equal to programmed value of Arrhythmia Event Post-Trigger Duration.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=20
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
    ...     - 5. Once the study has started, using an ECG simulation tool, generate a Bradycardia event by setting the BPM to 40.
    ...     Test Output:
    ...     - 1. Wait for 2 minutes to complete the pre, post trigger recording.. .
    ...     - 2. Verify the remaining study duration on the device screen.. .
    ...     - 3. Wait for additional 2 minutes for device to post the auto event data.. .
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event.
    ...          Verify there are files with the format below:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann. . Confirm for SRS request No.1 and No.2
    ...     - 5. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann. .
    ...     - 6. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Brady”.. .
    ...     - 7. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using MTLAB Waveform Database (WFDB) software package. Verify that the pre-trigger and post-trigger storage durations are 30 seconds each as programmed.
    ...     - MATLAB will plot the MIT16 file data in number of samples.  The sample rate for recording is fixed at 250 samples per second.  Verify the total number samples displayed by MATLAB plot is 250(sps)*(30s+30s)= 15000 samplesc. . Confirm for SRS request No.3
    ...     - 10. Upload the device log by sending getlog command.. .
    ...     - 11. Open log-data- mm-dd-yy-hh-mm-ss+timezone.txt file using text editor.
    ...     - Verify that the log contain a pair Triggered and MCTevent after auto event is created.. .
    [Tags]   BFDV-ARRHYTHMIA-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-ARRHYTHMIA-02: Confirm
    [Documentation]     Author: Nang Phung

    ...     Test Setup and Input:
    ...     - 1. Using an ECG simulation tool, generate a TachyCardia event by setting the BPM to 180.
    ...     Test Output:
    ...     - 1. Wait for 2 minutes to complete the pre, post trigger recording.. .
    ...     - 2. Wait for additional 2 minutes for device to post the auto event data.. .
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event.
    ...          Verify there are files with the format below:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann. . Confirm for SRS request No.1 and No.2
    ...     - 4. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann. .
    ...     - 5. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Tachy”.. .
    ...     - 6. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using MTLAB Waveform Database (WFDB) software package. Verify that the pre-trigger and post-trigger storage durations are 30 seconds each as programmed.
    ...     - MATLAB will plot the MIT16 file data in number of samples.  The sample rate for recording is fixed at 250 samples per second.  Verify the total number samples displayed by MATLAB plot is 250(sps)*(30s+30s)= 15000 samples.. . Confirm for SRS request No.3
    ...     - 7. Upload the device log by sending getlog command.. .
    ...     - 8. Open log-data- mm-dd-yy-hh-mm-ss+timezone.txt file using text editor.
    ...     - Verify that the log contain a pair Triggered and MCTevent after auto event is created..
    [Tags]  BFDV-ARRHYTHMIA-02  manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-ARRHYTHMIA-03: Confirm
    [Documentation]     Author: Nang Phung
    ...     Test Setup and Input:
    ...     - 1. Using an ECG simulation tool, generate an Atrial Fibrillation coarse event.
    ...     Test Output:
    ...     - 1. Wait for 2 minutes to complete the pre, post trigger recording.. .
    ...     - 2. Wait for additional 2 minutes for device to post the auto event data.. .
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event.
    ...          Verify there are files with the format below:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann. . Confirm for SRS request No.1 and No.2
    ...     - 4. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann. .
    ...     - 5. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Afib”.. .
    ...     - 6. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using MTLAB Waveform Database (WFDB) software package. Verify that the pre-trigger and post-trigger storage durations are 30 seconds each as programmed.
    ...     - MATLAB will plot the MIT16 file data in number of samples.  The sample rate for recording is fixed at 250 samples per second.  Verify the total number samples displayed by MATLAB plot is 250(sps)*(30s+30s)= 15000 samples.. . Confirm for SRS request No.3
    ...     - 7. Upload the device log by sending getlog command.. .
    ...     - 8. Open log-data- mm-dd-yy-hh-mm-ss+timezone.txt file using text editor.
    ...          Verify that the log contain a pair Triggered and MCTevent after auto event is created.. .
    [Tags]  BFDV-ARRHYTHMIA-03  manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-ARRHYTHMIA-04: Confirm
    [Documentation]     Author: Nang Phung

    ...     Test Setup and Input:
    ...     - 1. Once the study has started, using an ECG simulation tool, generate a Pause event.
    ...     Test Output:
    ...     - 1. Wait for 2 minutes to complete the pre, post trigger recording.. .
    ...     - 2. Wait for additional 2 minutes for device to post the auto event data.. .
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event.
    ...          Verify there are files with the format below:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann. . Confirm for SRS request No.1 and No.2
    ...     - 4. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann. .
    ...     - 5. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Pause”.. .
    ...     - 6. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using MTLAB Waveform Database (WFDB) software package. Verify that the pre-trigger and post-trigger storage durations are 30 seconds each as programmed.
    ...          MATLAB will plot the MIT16 file data in number of samples.  The sample rate for recording is fixed at 250 samples per second.  Verify the total number samples displayed by MATLAB plot is 250(sps)*(30s+30s)= 15000 samples.. . Confirm for SRS request No.3
    ...     - 7. Upload study data using the uploadstudy command.. .
    ...     - 8. Create an local "SD card" folder on the PC. .
    ...     - 9. Connect the device to the “Device Monitor” program. .
    ...     - 10. Switch the device to the “Mass Storage” mode. .
    ...     - 11. Copy the yyyymmdd-hhmmss.dat file in the “rec” folder to the “SD card” folder:. .
    ...     - 12. Create an local "Device" folder on the PC. .
    ...     - 13. Using WinSCP, transfer the following files to “Device” folder:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat. .
    ...     - 14. Use “ECG Verification” program to verify the ecg data of two folder “SD card” and “Device” folder.. .
    ...     - 15. Make sure the program does not report any warning on the verification result. .
    ...     - 16. Upload HES annotation file by sending getann.txt command.. .
    ...     - 17. Upload the device log by sending getlog command.. .
    ...     - 18. Open log-data- mm-dd-yy-hh-mm-ss+timezone.txt file using text editor.
    ...           Verify that the log contain a pair Triggered and MCTevent after auto event is created.. .
    ...     - 19. Erase study by sending erasestudy command.. .
    ...     - 20. Verify device silently reboots after erasing study data.. .
    [Tags]  BFDV-ARRHYTHMIA-04  manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-ARRHYTHMIA-05: Confirm
    [Documentation]     Author: Nang Phung

    ...     Description: Upon noise detection, skip all beats during noise and one beat after noise exit for other types of detection events.
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
    ...          AlgorithmLead=2
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60
    ...     - 3. Wait for 1 minute for study to get initiated on the device display.
    ...     - 4. Follow all the steps on the device display and then start the study.
    ...     - 5. Once the study has started, using an ECG simulation tool, generate a Bradycardia event by setting the BPM to 40.
    ...     Test Output:
    ...     - 1. Wait for 2 minutes to complete the pre, post trigger recording.. .
    ...     - 2. Verify the remaining study duration on the device screen.. .
    ...     - 3. Wait for additional 2 minutes for device to post the auto event data.. .
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event.
    ...          Verify there are files with the format below:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann. .
    ...     - 5. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann. .
    ...     - 6. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Brady”.. .
    ...     - 7. Disconnect LL electrode and wait for 2 minutes. .
    ...     - 8. Connect LL electrode and wait for 2 minutes. .
    ...     - 9. Stop study by sending stopstudy.txt. .
    ...     - 10. Upload study data using the uploadstudy.txt command.. .
    ...     - 11. Upload HES annotation file by sending getann.txt command.. .
    ...     - 12. Using WinSCP, transfer the following files to a local folder on the PC.
    ...           ann-all-mm-dd-yy-hh-mm-ss+timeone.txt. .
    ...     - 13. Open ann-all-mm-dd-yy-hh-mm-ss+timeone.txt file using text editor. Verify that annotation file contains this pattern in column 7 and 9 (HesEventStatus2 and HeartRate) in 4 continuous lines:
    ...     - HesEventStatus2 (column 7). HeartRate (column 9)
    ...     - 0x0000. 0
    ...     - 0x0000. 40
    ...     - 0x0000. 40
    ...     - 0x0002. 40
    ...     - 14. Upload device log using getlog.txt command.. .
    ...     - 15. Erase study by sending erasestudy command.. .
    [Tags]  BFDV-ARRHYTHMIA-05  manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-ARRHYTHMIA-06: Confirm
    [Documentation]     Author: Nang Phung

    ...     Description:
    ...          Device software shall be able to detect user commanded (manual) cardiac event record request.
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
    ...     - 1. Verify that the Bioflux device beeps once, vibrates and goes on the Event Button Screen.. .
    ...     - 2. On the Event Button Screen, press “Next”.. .
    ...     - 3. On the Symptom Screen, make sure no symptom is selected and then press “Send”.. .
    ...     - 4. Wait for 2 minutes to complete the pre, post trigger recording.. .
    ...     - 5. Wait for additional 2 minutes for device to post the manual event data.. .
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the event button pressed action.
    ...          Verify there are files with the format below:
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.ann. .
    ...     - 7. Within most recent device status output, verify that the battery charging is OFF.. .
    ...     - 8. Upload study data using the uploadstudy command.. .
    ...     - 9. Upload HES annotation file by sending getann command.. .
    ...     - 10. Upload the device log by sending getlog command.. .
    ...     - 11. Erase study by sending erasestudy command.. .
    ...     - 12. Verify device silently reboots after erasing study data.. .
    [Tags]  BFDV-ARRHYTHMIA-06  manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-ARRHYTHMIA-07: Confirm
    [Documentation]     Author: Nang Phung

    ...     Description:
    ...     - 1. The device software shall acknowledge the user commanded cardiac event storage request by sending user notifications.
    ...     - 2. Device software shall be able to transmit cardiac event data to the server upon user commanded cardiac event record request with pre-trigger duration equal to the programmed value of Arrhythmia Event Pre-Trigger Duration and post trigger duration equal to programmed value of Arrhythmia Event Post-Trigger Duration.
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
    ...     - 6. On the Event Button screen, select “Other” as symptom and then press “Send”.
    ...     Test Output:
    ...     - 1. Verify that the Bioflux device beeps once, vibrates and goes on the Event Button Screen.. .
    ...     - 2. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the manual detected event.
    ...          Verify there are files with the format below:
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.ann. . Confirm for SRS request No.1
    ...     - 3. Open the event-manual-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify the “Manual event” entry and “Other” entry under the title “Reason”.. .
    ...     - 4. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.ann. .
    ...     - 5. Open the event-manual-mm-dd-yy-hh-mm-ss+timezone.hea header file using MTLAB Waveform Database (WFDB) software package. Verify that the pre-trigger and post-trigger storage durations are 30 seconds each as programmed.
    ...     - MATLAB will plot the MIT16 file data in number of samples.  The sample rate for recording is fixed at 250 samples per second.  Verify the total number samples displayed by MATLAB plot is 250(sps)*(30s+30s)= 15000 samples.. . Confirm for SRS request No.2
    ...     - 6. Upload study data using the uploadstudy command.. .
    ...     - 7. Upload HES annotation file by sending getann command.. .
    ...     - 8. Upload the device log by sending getlog command.. .
    ...     - 9. Erase study by sending erasestudy command.. .
    ...     - 10. Verify device silently reboots after erasing study data.. .
    [Tags]  BFDV-ARRHYTHMIA-07  manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-ARRHYTHMIA-08: Confirm
    [Documentation]     Author: Nang Phung

    ...     Description: Once the button is pressed to store the manual event, the device shall provide the pre-selected list of symptoms for patient to select.
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
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     - 5. Once the study has started, locate and press the event button once on the device.
    ...     - 6. On the Event Button Screen, press “Next”.
    ...     Test Output:
    ...     - 1. Verify pressing the “Next” button while on the Event Button screen takes to the Symptoms screen.. .
    ...     - 2. On the Symptoms screen, confirm none of the options buttons are filled in.. .
    ...     - 3. Select the options from the symptom list:
    ...          Palpitations
    ...          Shortness of breath,
    ...          Dizziness
    ...          Chest Pain/ Pressure
    ...          Other
    ...          Press “Send” button.. .
    ...     - 4. Wait for 2 minutes to complete the pre, post trigger recording.. .
    ...     - 5. Wait for additional 2 minutes for device to post the manual event data.. .
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the event button pressed action.
    ...          Verify there are files with the format below:
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.ann. .
    ...     - 7. Using WinSCP, transfer the file event-manual-mm-dd-yy-hh-mm-ss+timezone.hea identified in previous step, to a local folder on the PC.. .
    ...     - 8. Verify that it is displaying all selected symptoms under Manual Event Reason.. .
    ...     - 9. Upload study data using the uploadstudy command.. .
    ...     - 10. Create an local "SD card" folder on the PC. .
    ...     - 11. Connect the device to the “Device Monitor” program. .
    ...     - 12. Switch the device to the “Mass Storage” mode. .
    ...     - 13. Copy the yyyymmdd-hhmmss.dat file in the “rec” folder to the “SD card” folder:. .
    ...     - 14. Create an local "Device" folder on the PC. .
    ...     - 15. Using WinSCP, transfer the following files to “Device” folder:
    ...           event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-manual-mm-dd-yy-hh-mm-ss+timezone.dat. .
    ...     - 16. Use “ECG Verification” program to verify the ecg data of two folder “SD card” and “Device” folder.. .
    ...     - 17. Make sure the program does not report any warning on the verification result. .
    ...     - 18. Upload HES annotation file by sending getann command.. .
    ...     - 19. Upload the device log by sending getlog command.. .
    ...     - 20. Open log-data- mm-dd-yy-hh-mm-ss+timezone.txt file using text editor.
    ...           Verify that the log contain a pair Triggered and MCTevent after auto event is created.. .
    ...     - 21. Erase study by sending erasestudy command.. .
    ...     - 22. Verify device silently reboots after erasing study data.. .
    [Tags]  BFDV-ARRHYTHMIA-08  manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-ARRHYTHMIA-09: Confirm
    [Documentation]     Author: Nang Phung

    ...     Description:
    ...     - 1. The device software shall reject new request to store the user commanded cardiac event storage while previous request is in progress.
    ...     - 2. The device software shall provide the user notification if the user commanded cardiac event storage fails.
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
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     - 5. Once the study has started, locate and press the event button on the device.
    ...     - 6. On the Event Button screen, press “Next” button. Then press “Send” button
    ...     - 7. While post trigger storage for the manual event is in progress from step 5, within 30 seconds press the event button on the device.
    ...     Test Output:
    ...     - 1. Verify that the Bioflux device does not go to the Event Button screen.. . Confirm for SRS request No.2
    ...     - 2. Wait for 1 minute to complete the pre, post trigger recording of the 1st manual event.. .
    ...     - 3. Wait for additional 2 minutes for device to post the manual event data for the 1st manual event.. .
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the 1st event button pressed action.
    ...          Verify there are files with the format below:
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.ann. .
    ...     - 5. Since the second event button was pressed while post trigger from the 1st event was in progress, the 2nd manual event will be ignored. Verify that following files are not created for the 2nd manual event press.
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.ann. .
    ...     - 6. Upload the device log by sending getlog.txt command.. .
    ...     - 7. Verify that the following error entry was created in the log file showing the rejection of storing the 2nd event press:
    ...          Event key pressed
    ...          Manual event is rejected: another manual event is pending. . Confirm for SRS request No.1
    ...     - 8. Upload study data using the uploadstudy command.. .
    ...     - 9. Upload HES annotation file by sending getann command.. .
    ...     - 10. Upload the device log by sending getlog command.. .
    ...     - 11. Erase study by sending erasestudy command.. .
    ...     - 12. Verify device silently reboots after erasing study data.. .
    [Tags]  BFDV-ARRHYTHMIA-09  manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-ARRHYTHMIA-10: Confirm
    [Documentation]     Author: Nang Phung

    ...     Description:
    ...          Device software shall be able to manual detect event when user start/resume study.
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
    ...     Test Output:
    ...     - 1. Wait for 1 minute.. .
    ...     - 2. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the manual event.
    ...          Verify there are files with the format below:
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.ann. .
    ...     - 3. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea. .
    ...     - 4. Open the event-manual-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Manual Event Reason is set to “Baseline”.. .
    ...     - 5. Plug charger to the device and wait for 30 seconds. Then disconnect charger to the device and resume study. . .
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the manual event.
    ...          Verify there are files with the format below:
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.ann. .
    ...     - 7. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea. .
    ...     - 8. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Manual Event Reason is set to “Resume”.. .
    ...     - 9. Wait for study completed. Upload study data using the uploadstudy command.. .
    ...     - 10. Create an local "SD card" folder on the PC. .
    ...     - 12. Connect the device to the “Device Monitor” program. .
    ...     - 13. Switch the device to the “Mass Storage” mode. .
    ...     - 14. Copy the yyyymmdd-hhmmss.dat file in the “rec” folder to the “SD card” folder:. .
    ...     - 15. Create an local "Device" folder on the PC. .
    ...     - 16. Using WinSCP, transfer the following files to “Device” folder:
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.dat. .
    ...     - 17. Use “ECG Verification” program to verify the ecg data of two folder “SD card” and “Device” folder.. .
    ...     - 18. Make sure the program does not report any warning on the verification result. .
    ...     - 19. Upload HES annotation file by sending getann command.. .
    ...     - 20. Upload the device log by sending getlog command.. .
    ...     - 21. Erase study by sending erasestudy command.. .
    ...     - 22. Verify device silently reboots after erasing study data.. .
    [Tags]  BFDV-ARRHYTHMIA-10  manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-ARRHYTHMIA-11: Confirm
    [Documentation]     Author: Nang Phung

    ...     Description:  Event ends by itself when study is complete
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=1
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
    ...     Test Output:
    ...     - 1. Wait for 40s. Then press the Event key on the device.. .
    ...     - 2. Press “Next” button. Select “Other” symptom and press “Send” button. .
    ...     - 3. Wait for study completed. .
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the manual event.
    ...          Verify there are files with the format below:
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.ann. .
    ...     - 5. Upload HES annotation file by sending getann command.. .
    ...     - 6. Upload the device log by sending getlog command.. .
    ...     - 7. Erase study by sending erasestudy command.. .
    ...     - 8s. Verify device silently reboots after erasing study data.. .
    [Tags]  BFDV-ARRHYTHMIA-11  manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-ARRHYTHMIA-12: Confirm
    [Documentation]     Author: Nang Phung

    ...     Description: If the device receives manual event after the study completion, the manual event shall be ignored.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId= 123456
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device..
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Wait for 5 minute for study to get completed.. .
    ...     - 2. Once the study has completed, locate and press the event button on the device.. .
    ...     - 3. In WinSCP, refresh the view. Verify that no test output files related to manual event are uploaded because the manual event outside the study duration shall be ignored.. .
    ...     - 4. Upload the study using the uploadstudy command. Wait for the study to be uploaded.. .
    ...     - 5. Upload HES annotation file by sending getann command.. .
    ...     - 6. Upload the device log by sending getlog command.. .
    ...     - 7. Erase study by sending erasestudy command.. .
    [Tags]  BFDV-ARRHYTHMIA-12  manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-ARRHYTHMIA-13: Confirm
    [Documentation]     Author: Nang Phung

    ...     Description:
    ...          Device software shall be able to auto detect arrhythmia event using the detection algorithms.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=0123456
    ...          PatientName=Ben Jones
    ...          Auto=0
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device display.
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Once the study has started, wait for 1 minute and then using an ECG simulation tool, generate an Ves-Tachycardia event.. .
    ...     - 2. Wait for 1 minute and then using an ECG simulation tool, generate an Ves-Bigeminy event.. .
    ...     - 3. Wait for 1 minute and then using an ECG simulation tool, generate an Ves-Trigeminy event.. .
    ...     - 4. Wait for 1 minute and then using an ECG simulation tool, generate an SVES event.. .
    ...     - 5. Wait for 1 minute and send stopstudy to stop active study.. .
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event.
    ...          Verify there are files with the format below:
    ...          report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          report-final-mm-dd-yy-hh-mm-ss+timezone.txt. .
    ...     - 7. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          report-final-mm-dd-yy-hh-mm-ss+timezone.txt. .
    ...     - 8. Open the report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt file using text editor. Verify that record of Ves-Tachycardia/ Ves-Bigeminy/ Ves-Trigeminy and  SVES event. .
    ...     - 9. Open the report-final-mm-dd-yy-hh-mm-ss+timezone.txt file using text editor. Verify that contents of Ves-Tachycardia event. .
    ...     - 10. Upload HES annotation file by sending getann.txt command.. .
    ...     - 11. Upload the device log by sending getlog command.. .
    ...     - 12. Erase study by sending erasestudy command.. .
    ...     - 13. Verify device silently reboots after erasing study data.. .
    [Tags]  BFDV-ARRHYTHMIA-13  manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-ARRHYTHMIA-14: Confirm
    [Documentation]     Author: Nang Phung

    ...     Description:
    ...          Device software can upload many event
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=0123456
    ...          PatientName=Ben Jones
    ...          Duration=20
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
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Connect the device to the Bioflux Device Monitor Software. Use following SM command to generate continuously 15 Afib event:
    ...          SM+T=CREATEMCT,<A>. .
    ...     - 2. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event.
    ...          Verify there are 15 auto event with the format below:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann. .
    ...     - 3. Wait for study completed.. .
    ...     - 4. Send the upload study command.. .
    ...     - 5. Create an local "SD card" folder on the PC.. .
    ...     - 6. Connect the device to the “Device Monitor” program.. .
    ...     - 7. Switch the device to the “Mass Storage” mode.. .
    ...     - 8. Copy the yyyymmdd-hhmmss.dat file in the “rec” folder to the “SD card” folder:. .
    ...     - 9. Create an local "Device" folder on the PC. .
    ...     - 10. Using WinSCP, transfer the following files to “Device” folder:
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann. .
    ...     - 11. Use “ECG Verification” program to verify the ecg data of two folder “SD card” and “Device” folder.. .
    ...     - 12. Make sure the program does not report any warning on the verification result. .
    ...     - 13. Upload HES annotation file by sending getann.txt command.. .
    ...     - 14. Upload the device log by sending getlog command.. .
    ...     - 15. Erase study by sending erasestudy command.. .
    ...     - 16. Verify device silently reboots after erasing study data.. .
    [Tags]  BFDV-ARRHYTHMIA-14  manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-ARRHYTHMIA-15: Confirm
    [Documentation]     Author: Nang Phung

    ...     Description: If Set Parameter command was sent with non-setup related parameter or invalid parameter value, the device shall send a response status as “REJECTED” along with the rejection reason of “Invalid parameter”.
    ...                  Note: Please perform the following steps before executing this case
    ...     - 1. Connect device to 52.221.128.239 and port 8900
    ...     - 2. Open “Hercules” program and choose tap “TCP client”
    ...     - 3. Set host equal to 52.221.128.239 and port equal to 8903. Then press “Connect”
    ...     - 4. Send the following command to login and link to the device: Login $0aLink <device ID>$0a
    ...     Test Setup and Input:
    ...     - 1.  As defined in Bioflux TCP protocol document, enter command: ParamSet {"par":"info", "val":"abc"}
    ...     Test Output:
    ...     - 1. Upload device log using getlog command.. .
    ...     - 2. Verify that the server replies with message: cmd="ParamSet", res="Rejected", rsn="Invalid parameter(s)"
    ...          Example log:
    ...          [200907:071350][md/tcp] New command: ParamSet (CFID=1)
    ...          [200907:071350][md/mgr] Send response = 1
    ...          cmd="ParamSet", res="Rejected", CFID=1
    ...          rsn="Invalid parameter(s)". .
    [Tags]  BFDV-ARRHYTHMIA-15  manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-ARRHYTHMIA-16: Confirm
    [Documentation]     Author: Nang Phung

    ...     Description: If the device receives List ECG command; and if device is uploading ECG data, the device shall send a response status as “REJECTED” along with the rejection reason of “Invalid operation”.
    ...                  Note: Please perform the following steps before executing this case
    ...     - 1. Connect device to 52.221.128.239 and port 8900
    ...     - 2. Open “Hercules” program and choose tap “TCP client”
    ...     - 3. Set host equal to 52.221.128.239 and port equal to 8903. Then press “Connect”
    ...     - 4. Send the following command to login and link to the device: Login $0aLink <device ID>$0a
    ...          Prerequisite: Study Completed
    ...     Test Setup and Input:
    ...     - 1. As defined in Bioflux TCP protocol document, enter command: startstudy {"dur":5}$0a
    ...     - 2. Follow all the steps on the device screen and then start the study.
    ...     - 3. Wait for study completed
    ...     - 4. As defined in Bioflux TCP protocol document, enter command: StartGetEcg {"info":"all"} to start uploading
    ...     - 5. Wait 2 seconds
    ...     - 6. As defined in Bioflux TCP protocol document, enter command: ListEcg
    ...     - 7. Wait until the device finishes uploading
    ...     Test Output:
    ...     - 1. Upload device log using getlog command.. .
    ...     - 2. Verify that the server replied with message: cmd="StartGetEcg", res="OK". .
    ...     - 3. Verify that the server replied with message: cmd="ListEcg", res="Rejected", rsn="Invalid operation"
    ...          Example log:
    ...          [200907:071854][md/tcp] New command: StartGetEcg (CFID=0)
    ...          Start=1970/01/01 00:00:00 (0)
    ...          Stop=1970/01/01 00:00:00 (0)
    ...          Urgent=False
    ...          Info=NA
    ...          [200907:071854][md/mgr] Send response = 1
    ...          cmd="StartGetEcg", res="OK", CFID=0
    ...          [200907:071854][md/tcp] Start uploading ECG data...
    ...          [200907:071854][md/mgr] Send response = 0
    ...          [200907:071854][md/tcp] Server KA
    ...          [200907:071854][md/tcp] New command: ListEcg (CFID=1)
    ...          Start=1970/01/01 00:00:00 (0)
    ...          Stop=1970/01/01 00:00:00 (0)
    ...          [200907:071854][md/mgr] Send response = 1
    ...          cmd="ListEcg", res="Rejected", CFID=1
    ...          rsn="Invalid operation". .
    [Tags]  BFDV-ARRHYTHMIA-16  manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library      project_bioheart_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${URL}  Get Config Param    WEB_BASE_URL
    Open Page  ${URL}

SUITE TEARDOWN
    Quit Browser