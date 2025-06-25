*** Settings ***
Documentation   Test Suite - Communication
Metadata        sid     BTMCT-ECGREC
Metadata        owner   Han Nguyen
Library         corelib/AssertionExtension.py
Library         corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}

Force Tags      BTMCT-ECGREC     device
Test Timeout    1h

*** Test Cases ***
BTMCT-ECGREC-01: Acquire real-time electrocardiogram (ECG) signals and store electrocardiogram (ECG) signals on the internal mass storage.
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. The device software shall acquire real-time electrocardiogram (ECG) signals.
    ...     - 2. The device software shall store electrocardiogram (ECG) signals on the internal mass storage.
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
    ...     - 5. Once the study has started, using an ECG Simulation tool, generate 80 BPM normal sinus signal.
    ...     Test Output:
    ...     - 1. Wait for 5 minutes for study to complete.
    ...     - 2. Upload study data using the uploadstudy command.
    ...     - 3. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ... 	- 4. Read data-all-mm-dd-yy-hh-mm-ss+timezone header and data files in MATLAB with WFDB toolkit.
    ... 	- 5. Plot the signal and verify the 80 BMP ECG signals. Copy the plots in the output folder.
    ... 	- 6. Upload the device log by sending getlog command.
    ...     - 7. Erase study by sending the erasestudy command.
    [Tags]      BTMCT-ECGREC-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-ECGREC-02: Apply the compression while storing electrocardiogram (ECG) signals into storage
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. The device software shall apply the compression while storing electrocardiogram (ECG) signals into storage
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
    ...     - 5. Once the study has started, using an ECG Simulation tool, generate 80 BPM normal sinus signal.
    ...     Test Output:
    ...     - 1. Wait for 5 minutes for study to complete.
    ...     - 2. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ... 	- 3. Connect the device to device monitor program.
    ... 	- 4. Switch the device to the “mass storage” mode.
    ... 	- 5. Copy the yyyymmdd-hhmmss.dat file in the “rec” folder to folder on the PC.
    ...     - 6. Verify size of the yyyymmdd-hhmmss.dat file is less than data-all-mm-dd-yy-hh-mm-ss+timezone.dat file.
    ...     - 7. Upload the device log by sending getlog command.
    ...     - 8. Erase study by sending the erasestudy command.
    [Tags]      BTMCT-ECGREC-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-ECGREC-03: Support wireless upload of the recorded electrocardiogram (ECG) to the server and check the integrity of the ECG data.
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. The device software shall support wireless upload of the recorded electrocardiogram (ECG) to the server via Biotres gateway
    ...     - 2. The device software shall check the integrity of the ECG data during upload from the Biotres device to the server.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Open WinSCP client (Open source SFTP client for Windows; used for file transfers between a host and a remote server) and set the following values:
    ...          - Choose file transfer protocol as FTP.
    ...          - Choose encryption as TLS\SSL Explicit Encryption.
    ...          - SET Host IP equal to 52.8.168.226 and Port equal to 21.
    ...          - Enter username and password to securely log in to the remote server.
    ...          - Once logged in successfully, create a new folder named as device id.
    ...          Once device folder is created, create two subfolders names as “user” (i.e. from users) and “server” (from server).
    ...     - 3. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=30
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
    ...     - 4. Wait for 1 minute for study to get initiated on the device.
    ...     - 5. Press and hold the "Event" button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 5 minutes while the study is in progress.
    ...     - 2. Locate the getecg.txt file in the test case input folder. Open the getecg.txt file in a text editor,
    ...          configure to obtain a most recent 5-minutes segment of data and send getecg command using WinSCP.
    ...          Confirm the file has the following structure:
    ...             Start Date of the record   “MM/DD/YYYY”
    ...             Start Time of the record   “HH:MM:SS” Time should be local device time.
    ...             Stop Date of the record    “MM/DD/YYYY”
    ...             Stop Time of the record    “HH:MM:SS” Time should be local time.
    ...             Time Zone	0
    ...     - 3. Using WinSCP, within the device folder, locate the device acknowledgement of the getecg completed upload command.
    ...          Verify there are following files with format:
    ...          getecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          data-get-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-get-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 4. As mentioned in Input step 2, due to file transfer protocol used being FTP, it confirms the integrity of the getecg response data from the Biotres device to the server.
    ... 	- 5. Send the stopstudy command using stopstudy.txt on WinSCP interface.
    ... 	- 6. Within the device folder, locate the device acknowledgement of the stop study command. Verify there are 2 files with the format
    ...          stopstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          note-mm-dd-yy-hh-mm-ss+timezone+timezone.txt
    ... 	- 7. After the study has stopped, locate and send the uploadstudy using uploadstudy.txt using WinSCP.
    ...     - 8. In WinSCP, within the user folder for the given device, locate the device acknowledgement of the upload study command. Verify there is a file with the format
    ...          uploadstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 9. Within the device folder, locate the device acknowledgement of the upload study command. Verify there are 3 files with the format
    ...          uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 10. As mentioned in Input step 2, due to file transfer protocol used being FTP, it confirms the integrity of the getecg response data from the Biotres device to the server.
    ...     - 11. Upload the device log by sending getlog command.
    ...     - 12. Locate erasestudy.txt and using WinSCP, send the erasestudy command.
    [Tags]      BTMCT-ECGREC-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-ECGREC-04: User notifications shall be provided when start study done.
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. The device software shall provide User notifications after the study period has reached Study Duration time
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
    ...     - 5. Once the study has started, using an ECG Simulation tool, generate 80 BPM normal sinus signal.
    ...     Test Output:
    ...     - 1. Wait for 5 minutes while the study is in progress.
    ...     - 2. Within the device folder, locate the device notification associated with study completion. Verify there is a file with the format
    ...          note-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Local folder on the PC and open with text editor. Verify the notification file indicates Study Completed along with the time stamp when the study was completed.
    ... 	- 4. Visually verify that the LED of device emits green light with flash effect
    ... 	- 5. After the study has completed, locate and send the uploadstudy using uploadstudy.txt using WinSCP.
    ...     - 6. In WinSCP, within the user folder for the given device, locate the device acknowledgement of the upload study command. Verify there is a file with the format:
    ...          uploadstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 7. Reshesh the view, within the device folder locate the device acknowledgement of the upload study command. Verify there are 3 files with the format:
    ...          uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 8. Upload the device log by sending getlog command.
    ...     - 9. Locate erasestudy.txt and using WinSCP, send the erasestudy command.
    ...     - 10. In WinSCP, refresh the view. Locate the device folder. Within the device folder, locate the device acknowledgement of the erase study command.
    ...           Confirm there is a file with the format: erasestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    [Tags]      BTMCT-ECGREC-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-ECGREC-05: Detect the patient's cable connection and disconnected
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. The device software shall be able to detect the patient’s cable connection and disconnected
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=30
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
    ...     Test Output:
    ...     - 1. Disconnect the lead.
    ...     - 2. Wait for 3 minutes to finish sending the Lead off detection device notification.
    ...     - 3. Reconnect the lead.
    ... 	- 4. Wait for 3 minutes to finish sending the lead connection device notification.
    ... 	- 5. Refresh WinSCP view and locate the following device notifications: Lead Disconnected, Lead Reconnected
    ...     - 6. Send the stopstudy command to stop the active study.
    ...     - 7. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 8. Upload the device log by sending getlog command.
    ...     - 9. Erase study by sending the erasestudy command.
    [Tags]      BTMCT-ECGREC-05    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-ECGREC-06: Detected lead off when disconnect and reconnect
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. The device shall show the lead off alert notification to the User 3 seconds after lead is disconnected.
    ...     - 2. The device software shall report initial lead off detection to server if the patient leads are disconnected for at least 30 seconds.
    ...     - 3. The device shall show the lead on alert notification to the User 3 seconds after leads are connected.
    ...     - 4. The device software shall report initial lead on detection to server if the patient leads are connected for at least 30 seconds
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=30
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
    ...     Test Output:
    ...     - 1. Disconnect the lead.
    ...     - 2. Wait for at least 3 seconds, and verify that the LED of device emits white light with flash effect
    ...     - 3. Wait for 30 seconds and verify Device detects initial lead-off detection.
    ... 	- 4. Wait for 1 minute to finish sending the lead disconnect device notification
    ... 	- 5. Refresh WinSCP view and locate the following device notifications: Lead Disconnected
    ...     - 6. Connect the leads back to the device
    ...     - 7. Wait for at least 3 seconds and verify the status led of device in green at flash mode
    ...     - 8. Wait for 30 seconds and verify that Leads Connected notification is sent.
    ...     - 9. Refresh WinSCP view and locate the following device notifications: Lead Reconnected
    ...     - 10. Send the stopstudy command to stop the active study.
    ...     - 11. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 12. Upload the device log by sending getlog command
    ...     - 13. Erase study by sending the erasestudy command.
    [Tags]      BTMCT-ECGREC-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-ECGREC-07: ECG analysis calibration is failed
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1.ECG analysis calibration is failed by no detecting enough 19 beats from the 1st beat
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
    ...     - 4. Make sure the device is connected to the simulator and adjust ECG signal to 80bpm.
    ...     - 5. Connect the device to the device monitor program.
    ...     - 6. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Then observe the log showing the device monitor program. Verify the following contents are found:
    ...          221209:040939 UI   Display LED: STUDY_SETTING_UP
    ...          221209:041144 UI   Display LED: STUDY_ONGOING
    ...     - 2. Wait for 30 seconds and adjust ECG signal to asystole
    ...     - 3. Continue to wait 1 minute 30 seconds
    ...     - 4. Then observe the log showing the device monitor program. Verify the following contents is found:
    ...          221209:041214	ECGA	Restarted (n beat) (with 1<=n<20)
    ...     - 5. Send the stopstudy command to stop the active study.
    ...     - 6. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 7. Upload HES annotation file by sending getann command.
    ...     - 8. Upload the device log by sending getlog command.
    ...     - 9. Erase study by sending erasestudy command.
    ...     - 10. Verify device silently reboots after erasing study data.
    [Tags]      BTMCT-ECGREC-07    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-ECGREC-08: ECG analysis calibration is OK
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. ECG analysis calibration is OK by detecting the 1st beat and enough 19 beats from the 1st beat in specified time
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
    ...     - 4. Make sure the device is connected to the simulator and adjust ECG signal to 80bpm.
    ...     - 5. Connect the device to the device monitor program.
    ...     - 6. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Then observe the log showing the device monitor program. Verify the following contents are found:
    ...          221209:040939 UI   Display LED: STUDY_SETTING_UP
    ...          221209:041144 UI   Display LED: STUDY_ONGOING
    ...     - 2. Wait 1 minute
    ...     - 3. Then observe the log showing the device monitor program. Verify the following contents is found:
    ...          221209:041214 ECGA Calib OK
    ... 	- 4. Send the stopstudy command to stop the active study.
    ... 	- 5. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 6. Upload HES annotation file by sending getann command.
    ...     - 7. Upload the device log by sending getlog command.
    ...     - 8. Erase study by sending erasestudy command.
    ...     - 9. Verify device silently reboots after erasing study data.
    [Tags]      BTMCT-ECGREC-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-ECGREC-09: ECG analysis calibration is failed and OK after failed
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. ECG analysis calibration is failed by no detecting beat in the 1st minute
    ...     - 2. ECG analysis calibration is OK after failed
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
    ...     - 4. Make sure the device is connected to the simulator and adjust ECG signal to asystole
    ...     - 5. Connect the device to the device monitor program.
    ...     - 6. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Then observe the log showing the device monitor program. Verify the following contents are found:
    ...          221209:040939 UI   Display LED: STUDY_SETTING_UP
    ...          221209:041144 UI   Display LED: STUDY_ONGOING
    ...     - 2. Wait 1 minute
    ...     - 3. Then observe the log showing the device monitor program. Verify the following contents is found:
    ...          221209:041214 ECGA Restarted (0 beat)
    ...     - 4. Adjust ECG signal to 80bpm
    ...     - 5. Continue to wait 1 minute
    ...     - 6. Then observe the log showing the device monitor program. Verify the following contents is found:
    ...          221209:041214 ECGA  Calib OK
    ... 	- 7. Send the stopstudy command to stop the active study.
    ... 	- 8. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 9. Upload HES annotation file by sending getann command.
    ...     - 10. Upload the device log by sending getlog command.
    ...     - 11. Erase study by sending erasestudy command.
    ...     - 12. Verify device silently reboots after erasing study data.
    [Tags]      BTMCT-ECGREC-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library      project_bioheart_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${URL}  Get Config Param    WEB_BASE_URL
    Open Page  ${URL}

SUITE TEARDOWN
    Quit Browser
