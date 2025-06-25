*** Settings ***
Documentation  Biofux device electrocardiogram recording verification test suite
Metadata    sid   BFDV-ELECTROREC
Metadata  owner   Nang Phung
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py

Suite Setup     Log    SUITE SETUP
Suite Teardown  Log    SUITE TEARDOWN
Force Tags  BFDV-ELECTROREC     device
Test Timeout  1h

*** Test Cases ***
BFDV-ELECTROREC-01: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. Device software shall acquire real-time electrocardiogram (ECG) signals.
    ...     - 2. Device software shall display real-time electrocardiogram (ECG) signals on the local liquid crystal display (LCD) display of the bioflux device.
    ...     - 3. Device software shall store electrocardiogram (ECG) signals on the internal mass storage.
    ...     - 4. Device software shall provide notifications to the user after the study period has reached Study Duration time.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Initiate the Start Study command with the parameters below:
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
    ...          NoiseTimePause=60. .
    ...     - 2. Wait for 1 minute for study to get initiated on the device.
    ...     - 3. Once the study has started, using an ECG Simulation tool, generate 80 BPM normal sinus signal.
    ...     - 4. Once the study has been configured correctly on the server and synced, and proper lead connection is detected, the ECG View Screen will appear. Confirm for SRS request No.1 and No.2
    ...     - 5. Verify the real-time electrocardiogram (ECG) data on the ECG View screen.
    ...     - 6. Start the study after pressing NEXT on the ECG View and pressing play button on the Start Study screen.
    ...     - 7. Wait for 5 minutes for study to complete.
    ...     - 8. Within the device folder, locate the device notification associated with study completion.  Verify there is a file with the format
    ...          note- mm-dd-yy-hh-mm-ss+timezone.txt. . Confirm for SRS request No.4
    ...     - 9. Using WinSCP, transfer the file note- mm-dd-yy-hh-mm-ss+timezone.txt identified in previous step, to a local folder on the PC and open with text editor.
    ...          Verify the notification file indicates Study Completed along with the time stamp when the study was completed.
    ...     - 10. Visually verify that Study Completed screen is displayed on the device LCD at the end of the study duration.
    ...     - 11. Upload study data using the uploadstudy command.
    ...     - 12. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all-mm-dd-yy- hh-mm-ss+timezone.dat . . Confirm for SRS request No.3
    ...     - 13. Read data-all-mm-dd-yy-hh-mm-ss+timezone header and data files in MATLAB with WFDB toolkit.
    ...     - 14. Plot the signal and verify the 80 BMP ECG signals. Copy the plots in the output folder. .
    ...     - 15. Upload HES annotation file by sending getann.txt command.
    ...     - 16. Upload the device log by sending getlog command.
    ...     - 17. Erase study by sending erasestudy command.
    ...     - 18. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-ELECTROREC-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-ELECTROREC-02: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...          Device software shall support wireless upload of the recorded electrocardiogram (ECG).
    ...     Test Output:
    ...     - 3. After at least 10 minutes – Using WinSCP - Within the device folder, locate the device acknowledgement of the getecg completed upload command.  Verify there are following files with format:
    ...          getecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          data-get-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-get-mm-dd-yy-hh-mm-ss+timezone.dat. . Refer to the results from test case TC_COMM_083_TC01
    ...     Description: Upon ECG data upload failure, device software shall notify the user about the failure.
    ...     Test Output:
    ...     - 1. Within the device folder, locate the device rejection of the most recent upload study command.  Verify there is a file with the format
    ...          uploadstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt. Refer to the results from the test case TC_COMM_089_TC01
    ...     - 2. Using WinSCP, transfer the file uploadtstudy-rejected-mm-dd-yy-hh-mm-ss identified in previous step, to a local folder on the PC and open with text editor.
    ...          On the last line of the text file, verify the text “Already erased” is found. Refer to the results from the test case TC_COMM_089_TC01
    ...     Description:
    ...          Device software shall check the integrity of the ECG data during upload from the bioflux device to the server.
    ...     Test Output:
    ...     - 1. Verify there are following files with format:
    ...          getecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          data-get-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-get-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          Due to file transfer protocol used being FTP, it confirms the integrity of the getecg response data from the Bioflux device to the server. . . Refer to the results from test case TC_COMM_083_TC01
    ...     - 2. In WinSCP, within the device folder, verify there are 2 data files with the format
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          Due to file transfer protocol used being FTP, it confirms the integrity of the uploadstudy response data from the Bioflux device to the server. Refer to the results from test case TC_ ECGREC_045_TC01
    [Tags]  BFDV-ELECTROREC-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-ELECTROREC-03: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...          Once the study is completed, electrocardiogram recording and ECG analysis algorithms shall not be performed.
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
    ...     - 1. Wait for 5 minute for study to get completed.
    ...     - 2. Once the study has completed, locate getecg.txt and in WinSCP, request getecg command to grab 5 minutes of ECG data post completion of the Study duration.
    ...     - 3. Using WinSCP - Within the device folder, locate the device acknowledgement of the getecg rejected upload command.  Verify there is a file with the format
    ...          getecg-rejected-mm-dd-yy-hh-mm-ss+timezone.txt. .
    ...     - 4. Using WinSCP, transfer the file getecgrejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open it in the text editor.
    ...          On the last line of the text file, verify the text “Invalid date/time” is found on this line.
    ...     - 5. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 5. Upload HES annotation file by sending getann command.
    ...     - 6. Upload the device log by sending getlog command.
    ...     - 7. Erase study by sending erasestudy command.
    ...     - 8. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-ELECTROREC-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-ELECTROREC-04: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. The device software shall be able to detect the patient cable connection.
    ...     - 2. Lead off detection.
    ...     - 3. Lead on detection.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Using Device Monitor program. Issue the SM command below to enable vibration for device:
    ...          SM+VIBRATE=1
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
    ...     - 5. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Disconnect the lead.
    ...     - 2. Wait for at least 3 seconds, and verify that the device shows the lead off alert notification on the screen. Confirm for SRS request No.1 and No.2
    ...     - 3. Wait for 30 seconds and verify that:
    ...          A. Device vibrates, and
    ...          B. Device detects initial lead-off detection.
    ...     - 4. Verify that device vibrates every “Lead off detection alert repeat duration” until leads are connected back to the device.
    ...     - 5. Reconnect the lead. Confirm for SRS request No.1 and No.3
    ...     - 6. Wait for 3 minutes to finish sending the lead connection device notification.
    ...     - 7. Refresh WinSCP view and locate the following device notifications:
    ...     - Lead Disconnected
    ...     - Lead Reconnected. .
    ...     - 8. Send the stopstudy command to stop the active study.
    ...     - 9. Using Device Monitor program. Issue the command below to disable vibration for device:
    ...          SM+VIBRATE=0. .
    ...     - 10. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 11. Upload HES annotation file by sending getann command.
    ...     - 12. Upload the device log by sending getlog command.
    ...     - 13. Erase study by sending erasestudy command.
    ...     - 14. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-ELECTROREC-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-ELECTROREC-05: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...          Device software shall apply the compression while storing electrocardiogram (ECG) signals into storage.
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
    ...     - 4. Make sure the device connted to the simulator
    ...     - 5. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Wait for 5 minutes for study to complete.
    ...     - 2. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 3. Using WinSCP, transfer the file data-all-mm-dd-yy-hh-mm-ss+timezone.dat to a local folder on the PC. .
    ...     - 4. Connect the device to Device Monitor Program. .
    ...     - 5. Switch the device to the “Mass Storage” mode. .
    ...     - 6. Copy the yyyymmdd-hhmmss.dat file in the “rec” folder to folder on the PC. .
    ...     - 7. Verify size of the yyyymmdd-hhmmss.dat file is less than data-all-mm-dd-yy-hh-mm-ss+timezone.dat file. .
    ...     - 8. Upload HES annotation file by sending getann command.
    ...     - 9. Upload the device log by sending getlog command.
    ...     - 10. Erase study by sending erasestudy command.
    ...     - 11. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-ELECTROREC-05    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-ELECTROREC-06: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: ECG analysis calibration is failed by no detecting beat in the 1st minute
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
    ...     - 3. Wait 1 minute for study to get initiated on the device.
    ...     - 4. Make sure the device is connected to the simulator and adjust ECG signal to asystole
    ...     - 5. Connect the device to the device monitor program
    ...     - 6. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Then observe the log showing the device monitor program.
    ...          Verify the following contents are found:
    ...          [220607:081702][app/ui] Go to Screen: STUDY START
    ...          ……………………………………………………………
    ...          [220607:081704][app/ui] Go to Screen: STUDY START SUCCESS
    ...          [220607:081704][ECGA] Started . .
    ...     - 2. Wait 1 minute. .
    ...     - 3. Then observe the log showing the device monitor program.
    ...          Verify the following contents is found:
    ...          [220607:081804][ECGA] Restarted (0 beats) . .
    ...     - 4. Send the stopstudy command to stop the active study.
    ...     - 5. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 6. Upload HES annotation file by sending getann command.
    ...     - 7. Upload the device log by sending getlog command.
    ...     - 8. Erase study by sending erasestudy command.
    ...     - 9. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-ELECTROREC-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-ELECTROREC-07: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: ECG analysis calibration is failed by no detecting enough 19 beats from the 1st beat
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
    ...     - 3. Wait 1 minute for study to get initiated on the device.
    ...     - 4. Make sure the device is connected to the simulator and adjust ECG signal to 80bpm
    ...     - 5. Connect the device to the device monitor program
    ...     - 6. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Then observe the log showing the device monitor program.
    ...          Verify the following contents are found:
    ...          [220607:081702][app/ui] Go to Screen: STUDY START……………………………………………………………
    ...          [220607:081704][app/ui] Go to Screen: STUDY START SUCCESS
    ...          [220607:081704][ECGA] Started . .
    ...     - 2. Wait for 30 seconds and adjust ECG signal to asystole. .
    ...     - 3. Continue to wait 1 minute 30 seconds. .
    ...     - 4. Then observe the log showing the device monitor program.
    ...          Verify the following contents is found:
    ...          [220607:081804][ECGA] Restarted (n beats)  (with 1<=n<20). .
    ...     - 5. Send the stopstudy command to stop the active study.
    ...     - 6. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 7. Upload HES annotation file by sending getann command.
    ...     - 8. Upload the device log by sending getlog command.
    ...     - 9. Erase study by sending erasestudy command.
    ...     - 10. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-ELECTROREC-07    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-ELECTROREC-08: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: ECG analysis calibration is OK by detecting the 1st beat and enough 19 beats from the 1st beat in specified time
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
    ...     - 4. Make sure the device is connected to the simulator and adjust ECG signal to 80bpm
    ...     - 5. Connect the device to the device monitor program
    ...     - 6. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Then observe the log showing the device monitor program.
    ...          Verify the following contents are found:
    ...          [220607:081702][app/ui] Go to Screen: STUDY START…………………………………………………………………
    ...          [220607:081704][app/ui] Go to Screen: STUDY START SUCCESS
    ...          [220607:081704][ECGA] Started . .
    ...     - 2. Wait 1 minute. .
    ...     - 3. Then observe the log showing the device monitor program.
    ...          Verify the following contents are found:
    ...          [220607:081855][ECGA] Calib OK . .
    ...     - 4. Send the stopstudy command to stop the active study.
    ...     - 5. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 6. Upload HES annotation file by sending getann command.
    ...     - 7. Upload the device log by sending getlog command.
    ...     - 8. Erase study by sending erasestudy command.
    ...     - 9. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-ELECTROREC-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-ELECTROREC-09: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: ECG analysis calibration is OK after failed
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
    ...     - 5. Connect the device to the device monitor program
    ...     - 6. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Then observe the log showing the device monitor program.
    ...          Verify the following contents are found:
    ...          [220607:081702][app/ui] Go to Screen: STUDY START……………………………………………………………
    ...          [220607:081704][app/ui] Go to Screen: STUDY START SUCCESS
    ...          [220607:081704][ECGA] Started . .
    ...     - 2. Wait 1 minute.
    ...     - 3. Then observe the log showing the device monitor program.
    ...          Verify the following contents is found:
    ...          [220607:081804][ECGA] Restarted (0 beats) . .
    ...     - 4. Adjust ECG signal to 80bpm. .
    ...     - 5. Continue to wait 1 minute. .
    ...     - 6. Then observe the log showing the device monitor program.
    ...          Verify the following contents is found:
    ...          [220607:081855][ECGA] Calib OK . .
    ...     - 7. Send the stopstudy command to stop the active study.
    ...     - 8. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 9. Upload HES annotation file by sending getann command.
    ...     - 10. Upload the device log by sending getlog command.
    ...     - 11. Erase study by sending erasestudy command.
    ...     - 12. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-ELECTROREC-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library      project_bioheart_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${URL}  Get Config Param    WEB_BASE_URL
    Open Page  ${URL}

SUITE TEARDOWN
    Quit Browser