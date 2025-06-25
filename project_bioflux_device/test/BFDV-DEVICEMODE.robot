*** Settings ***
Documentation  Biofux device modes verification test suite
Metadata    sid   BFDV-DEVICEMODE
Metadata  owner   Nang Phung
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py

Suite Setup     Log    SUITE SETUP
Suite Teardown  Log    SUITE TEARDOWN
Force Tags  BFDV-DEVICEMODE     device
Test Timeout  1h

*** Test Cases ***
BFDV-DEVICEMODE-01: Confirm all mode of device
    [Documentation]     Author: Tan Pham
    ...
    ...     Description:
    ...     - 1. The device shall have the following modes: Power Off, Waiting for Study, Starting Study, Running Study, End of Study, and Error conditions.
    ...     - 2. If the device is in the Waiting for Study state and the "startstudy" command is received from the Server, the device shall enter the Starting Study State.
    ...     - 3. End of Study State: If the device is in the Running Study State and the time from when the study was started plus the study duration time has passed, the device shall enter the End of Study State.
    ...     - 4. Device software shall send user notifications for the power-on initialization failure.
    ...     - 5. Error State: If the device has detected an unrecoverable error, the device shall send the notification to the user.
    ...
    ...     Test Steps:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results"
    ...
    ...     Expected Output:
    ...    - 1. Wait for the power up sequence completion upon which the device shows “Setup Device for MCT Study” screen.
    ...    - 2. Initiate the Start Study command with the parameters below:
    ...         + PatientId=123456
    ...         + PatientName=Ben Jones
    ...         + Duration=30
    ...         + PreEvent=30
    ...         + PostEvent=30
    ...         + BradyThresh=60
    ...         + TachyThresh=120
    ...         + PauseThresh=2500
    ...         + PauseDetection=1
    ...         + AfibDetection=1
    ...         + AlgorithmLead=1
    ...         + NoiseTimeBradyTachy=600
    ...         + NoiseTimeAfib=600
    ...         + NoiseTimePause=60
    ...    - 3. Wait for 1 minute for study to get initiated on the device display.
    ...    - 4. Within the user folder, locate the device acknowledgement of the start study command.  Verify there is a file with the format startstudy-processing-mm-dd-yy-hh-mm-ss-ss+timezone.txt
    ...    - 5. Follow all the steps on the device display and then start the study.
    ...    - 6. Verify that study has started by verifying Study Running screen (REMAINING TIME screen) on the device display showing the remaining study duration.
    ...    - 7. In WinSCP, within the device folder, locate the device acknowledgement of the most recent startstudy command.  Verify there is a file with the format startstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...    - 8. In WinSCP, stop the study via stopstudy command using stopstudy.txt in the test input folder.
    ...    - 9. Refresh WinSCP view and verify that Study Completed notification is sent showing the time when the study was ended.
    ...    - 10. Open the device notification associated with study completion in text editor and compare the study completion timestamp against study start timestamp in step 5 to make sure that the elapsed time is equal to the programmed study duration.
    ...    - 11. Verify the STUDY COMPLETED notification screen on the device display.
    ...    - 12. Upload study data using the uploadstudy command.
    ...    - 13. Wait for at least 10 minutes. Within the device folder, locate the device acknowledgement of the upload study command.
    ...          Verify there is a file with the format uploadstudy-done-mm-dd-yy-hh-mm-ss-ss+timezone.txt.
    ...    - 14. In WinSCP, within the device folder, verify there are 2 data files with the format:
    ...         + data-all-mm-dd-yy-hh-mm-ss-ss+timezone.hea
    ...         + data-all--mm-dd-yy-hh-mm-ss-ss+timezone.dat
    ...    - 15. Upload HES annotation file by sending getann command.
    ...    - 16. Erase study by sending erasestudy command.
    ...    - 17. Verify device silently reboots after erasing study data.
    ...    - 18. Power off the device by pressing and holding the Home button for 10 seconds.
    ...    - 19. Remove SD card from the device.
    ...    - 20. Power on the device by pressing and holding the Home button for 3-5 seconds.
    ...    - 21. On the device screen, verify the Error screen due to removal of the SD card.
    ...    - 22. Power off the device by pressing and holding the Home button for 10 seconds.
    ...    - 23. Put the SD card in to the device.
    ...    - 24. Power on the device by pressing and holding the Home button for 3-5 seconds.
    ...    - 25. In WinSCP, upload device log using getlog command using getlog.txt.
    ...    - 26. Verify the following details in the device log:
    ...         + Power Off,
    ...         + Power On,
    ...         + Started,
    ...         + Completed,
    ...         + Uploaded,
    ...         + Erased.
    [Tags]  BFDV-DEVICEMODE-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-DEVICEMODE-02: Confirm entering the mode corresponding to the mode the device
    [Documentation]     Author: Tan Pham
    ...
    ...     Description:
    ...     - 1. Once the power up sequence is completed, the device shall enter the mode corresponding to the mode the device was in when it was last powered down.
    ...     - 2. If the user powers up the device and device is in the Pause Study state, the device shall go back to the Running Study State if study duration time has not completed.

    ...     Test Steps:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...         + PatientId=123456
    ...         + PatientName=Ben Jones
    ...         + Duration=60
    ...         + PreEvent=30
    ...         + PostEvent=30
    ...         + BradyThresh=60
    ...         + TachyThresh=120
    ...         + PauseThresh=2500
    ...         + PauseDetection=1
    ...         + AfibDetection=1
    ...         + AlgorithmLead=1
    ...         + NoiseTimeBradyTachy=600
    ...         + NoiseTimeAfib=600
    ...         + NoiseTimePause=60
    ...     - 3. Wait for 1 minute for study to get initiated on the device display.
    ...     - 4. Follow all the steps on the device display and then start the study.
    ...
    ...     Expected Output:
    ...    - 1. Long press both Power Key and Event Key for 5s to quick power off
    ...    - 2. Wait for the device notification associated with device POWER DOWN.
    ...         In WinSCP, refresh the view. Within the device folder, locate the device notification from POWER DOWN action.
    ...    - 3. Open the device notification and verify the following:
    ...         + STUDY PAUSED along with timestamp.
    ...         + POWER DOWN.
    ...    - 4. Power On the device by pressing and holding the Home button for 3-5 seconds.
    ...    - 5. Once the power up sequence is complete, device shall display the RESUMING STUDY screen
    ...    - 6. Confirm resuming the study on the device display.
    ...    - 7. In WinSCP, issue getlog command to retrieve the device log using getlog.txt.
    ...    - 8. Wait for device log to be uploaded.
    ...         In WinSCP, refresh the view. Within the device folder, locate the device log and verify that the device was in study in progress state prior to powering down the device by looking for following in the device log. Go to Screen: STUDY PROGRESS
    ...    - 9. Also verify in the device log that device was powered on, and entered in to the mode it was prior to powering down the device by looking for the following in the device log:
    ...         + a. Power on with timestamp
    ...         + b. Go to Screen: STUDY RESUME SYNCING
    ...         + c. Go to Screen:  STUDY RESUME START
    ...    - 10. Send the stopstudy command to stop the ongoing MCT study.
    ...    - 11. Upload study data using the uploadstudy command.
    ...    - 12. Upload HES annotation file by sending getann command.
    ...    - 13. Upload the device log by sending getlog command.
    ...    - 14. Erase study by sending erasestudy command.
    ...    - 15. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-DEVICEMODE-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-DEVICEMODE-03: Confirm entering the Waiting for Study
    [Documentation]     Author: Tan Pham
    ...
    ...     Description:
    ...     - 1. If the device is in the Starting Study State and the user aborts the study, the device software shall abort the study, send notification to the server and enter the Waiting for Study state.

    ...     Test Steps:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...         + PatientId=123456
    ...         + PatientName=Ben Jones
    ...         + Duration=60
    ...         + PreEvent=30
    ...         + PostEvent=30
    ...         + BradyThresh=60
    ...         + TachyThresh=120
    ...         + PauseThresh=2500
    ...         + PauseDetection=1
    ...         + AfibDetection=1
    ...         + AlgorithmLead=1
    ...         + NoiseTimeBradyTachy=600
    ...         + NoiseTimeAfib=600
    ...         + NoiseTimePause=60
    ...     - 3. Using an ECG simulation tool, generate a Bradycardia event signal by setting the BPM to 40.
    ...     - 4. Wait for 1 minute for study to get initiated on the device display.
    ...     - 5. Follow all the steps on the device display and then start the study.
    ...
    ...     Expected Output:
    ...    - 1. Verify that study has started by verifying Study Running screen (REMAINING TIME screen) on the device display showing the remaining study duration.
    ...    - 2. In WinSCP, within the device folder, locate the device acknowledgement of the most recent startstudy command.  Verify there is a file with the format Startstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...    - 3. On WinSCP interface, send the stopstudy command using stopstudy.txt to abort the study.
    ...    - 4. Within the device folder, locate the device acknowledgement of the stop study command.  Verify there are 2 files with the format
    ...         + stopstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...         + note- mm-dd-yy-hh-mm-ss+timezone.txt
    ...    - 5. Using WinSCP, transfer the file stopstudy-done-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open with text editor.
    ...         On the last line of the text file, verify the text “StopTime=”<exact study stop datetime> <timezone>”” is found on this line.
    ...    - 6. Upload study data using the uploadstudy command.
    ...    - 7. Upload HES annotation file by sending getann command.
    ...    - 8. Upload the device log by sending getlog command.
    ...    - 9. Erase study by sending erasestudy command.
    ...    - 10. Verify device silently reboots after erasing study data.
    ...    - 11. Once all data has been erased, verify that the Home (SETUP DEVICE FOR MCT STUDY) screen is displayed on the device display.
    [Tags]  BFDV-DEVICEMODE-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-DEVICEMODE-04: Confirm analyzing the ECG data
    [Documentation]     Author: Tan Pham
    ...
    ...     Description:
    ...     - 1. If the device is in the Running Study State, the device shall continuously analyze the ECG data using the auto arrhythmia detection algorithms.

    ...     Test Steps:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...         + PatientId=123456
    ...         + PatientName=Ben Jones
    ...         + Duration=5
    ...         + PreEvent=30
    ...         + PostEvent=30
    ...         + BradyThresh=60
    ...         + TachyThresh=120
    ...         + PauseThresh=2500
    ...         + PauseDetection=1
    ...         + AfibDetection=1
    ...         + AlgorithmLead=1
    ...         + NoiseTimeBradyTachy=600
    ...         + NoiseTimeAfib=600
    ...         + NoiseTimePause=60
    ...     - 3. Wait for 1 minute for study to get initiated on the device display.
    ...     - 4. Follow all the steps on the device display and then start the study.
    ...
    ...     Expected Output:
    ...    - 1. Verify that study has started by verifying Study Running screen (REMAINING TIME screen) on the device display showing the remaining study duration.
    ...    - 2. In WinSCP, within the device folder, locate the device acknowledgement of the most recent startstudy command.  Verify there is a file with the format Startstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...    - 3. Wait for 2 minutes to complete the pre, post trigger recording.
    ...    - 4. Wait for additional 2 minutes for device to post the auto event data.
    ...    - 5. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event.
    ...         Verify there are files with the format below:
    ...         + event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...         + event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...         + event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...    - 6. Using WinSCP, transfer the following files to a local folder on the PC.
    ...         + event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...         + event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...         + event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...    - 7. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Brady”.
    ...    - 8. Wait till study is completed and upload study data using the uploadstudy command.
    ...    - 9. Upload HES annotation file by sending getann.txt command.
    ...    - 10. Upload the device log by sending getlog command.
    ...    - 11. Erase study by sending erasestudy command.
    ...    - 12. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-DEVICEMODE-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-DEVICEMODE-05: Confirm sending hourly report to the server every hour
    [Documentation]     Author: Tan Pham
    ...
    ...     Description:
    ...     - 1. Device software shall send hourly report to the server every hour with the details associated with arrhythmia detections, noise detections and heart rate summary.

    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - 1. In WinSCP, refresh the view. Within the device folder, verify the device send the hourly report file with format following:
    ...         + report-hourly- mm-dd-yy-hh-mm-ss+timezone.txt
    ...    - 2. Open the report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt file using text editor. Verify the details associated with arrhythmia detections, noise detections and heart rate summary
    ...    - 3. In WinSCP, refresh the view. Within the device folder, verify the device send the other hourly report file with format following:
    ...         + report-hourly- mm-dd-yy-hh-mm-ss+timezone.txt
    ...    - 4. Open the report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt file using text editor. Verify the details associated with arrhythmia detections, noise detections and heart rate summary
    [Tags]  BFDV-DEVICEMODE-05    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-DEVICEMODE-06: Confirm resuming automatically
    [Documentation]     Author: Tan Pham
    ...
    ...     Description:
    ...     - 1. Auto resume study while in PAUSE state, leads are connected and 15 minutes have elapsed.
    ...
    ...     Test Steps:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...         + PatientId=123456
    ...         + PatientName=Ben Jones
    ...         + Duration=60
    ...         + PreEvent=30
    ...         + PostEvent=30
    ...         + BradyThresh=60
    ...         + TachyThresh=120
    ...         + PauseThresh=2500
    ...         + PauseDetection=1
    ...         + AfibDetection=1
    ...         + AlgorithmLead=1
    ...         + NoiseTimeBradyTachy=600
    ...         + NoiseTimeAfib=600
    ...         + NoiseTimePause=60
    ...     - 3. Wait for 1 minute for study to get initiated on the device display.
    ...     - 4. Follow all the steps on the device display and then start the study.
    ...
    ...     Expected Output:
    ...    - 1. Verify that study has started by verifying Study Running screen (REMAINING TIME screen) on the device display showing the remaining study duration.
    ...    - 2. In WinSCP, within the device folder, locate the device acknowledgement of the most recent startstudy command.  Verify there is a file with the format
    ...         + startstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...    - 3. Connect the device for charging without powering off.
    ...    - 4. Wait for the device notification associated with device being placed in PAUSE state.
    ...         In WinSCP, refresh the view. Within the device folder, locate the device notification.
    ...    - 5. Open the device notification and verify the following:
    ...         + STUDY PAUSED along with timestamp.
    ...    - 6. Unplug the device from charging and connect the patient leads.
    ...    - 7. Wait for 15 minutes and make sure Resume button is not selected to resume the study.
    ...    - 8. Confirm resuming the study on the device display.
    ...    - 9. Connect the device for charging without powering off again.
    ...    - 10. Wait for the device notification associated with device being placed in PAUSE state.
    ...         In WinSCP, refresh the view. Within the device folder, locate the device notification.
    ...    - 11. Open the device notification and verify the following:
    ...         + STUDY PAUSED along with timestamp.
    ...    - 12. Unplug the device from charging
    ...    - 13. Create runtime exception by removing the SD card. Then quickly insert it back to the SD card slot and make sure connecting the patient leads.
    ...    - 14. Wait for 15 minutes and make sure YES button is not selected to resume the study.
    ...    - 15. Confirm resuming the study on the device display.
    ...    - 16. Once the study is complete, upload study data using the uploadstudy command.
    ...    - 17. Upload HES annotation file by sending getann command.
    ...    - 18. Upload the device log by sending getlog command.
    ...    - 19. Erase study by sending erasestudy command.
    ...    - 20. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-DEVICEMODE-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-DEVICEMODE-07: Confirm backuping the study setting and restoring pending study
    [Documentation]     Author: Tan Pham
    ...
    ...     Description:
    ...     - 1. When device is in the Waiting for Study state and after the “startstudy” command is received from the Server;
    ...          and if the user turns off the device, the device software shall backup the study setting and restore pending study when device is turned on the next time.
    ...
    ...     Test Steps:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...         + PatientId=123456
    ...         + PatientName=Ben Jones
    ...         + Duration=5
    ...         + PreEvent=30
    ...         + PostEvent=30
    ...         + BradyThresh=60
    ...         + TachyThresh=120
    ...         + PauseThresh=2500
    ...         + PauseDetection=1
    ...         + AfibDetection=1
    ...         + AlgorithmLead=1
    ...         + NoiseTimeBradyTachy=600
    ...         + NoiseTimeAfib=600
    ...         + NoiseTimePause=60
    ...     - 3. Wait for 1 minute for study to get initiated on the device display.
    ...
    ...     Expected Output:
    ...    - 1. Long press both Power Key and Event Key for 5s to quick power off
    ...    - 2. Turn on the device by pressing and holding the Home Button for 3 seconds on the device.
    ...    - 3. Verify study to get initiated  again and the device switch to “Study Details” screen
    ...    - 4. Long press both Power Key and Event Key for 5s to quick power off
    ...    - 5. Remove the battery from the device and waiting for 3 minutes
    ...    - 6. Connect battery to device
    ...    - 7. Turn on the device by pressing and holding the Home Button for 3 seconds on the device.
    ...    - 8. Wait for 5 minutes
    ...    - 9. Verify the device will wait at “Syncing Study Details” screen until the device can get network time
    ...    - 10. Wait about 30-60 seconds
    ...    - 11. Verify study to get initiated  again and the device switch to “Study Details” screen
    ...    - 12. Tap the “Abort” button to abort study.
    ...    - 13. Upload the device log by sending getlog command.
    [Tags]  BFDV-DEVICEMODE-07    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library      project_bioheart_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${URL}  Get Config Param    WEB_BASE_URL
    Open Page  ${URL}

SUITE TEARDOWN
    Quit Browser
