*** Settings ***
Documentation   Biofux device communication verification test suite
Metadata        sid     BFDV-COMM
Metadata        owner   Nang Phung
Library         corelib/AssertionExtension.py
Library         corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library         project_bioflux_device/lib/ConfigHandler.py    ${ENV}

Force Tags      BFDV-COMM   device
Test Timeout    1h

*** Test Cases ***
BFDV-COMM-01: Confirm the ECG format/receiving Set Parameter command.
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. Communications between bioflux device and server are supported by using secure File Transfer Protocol over trimmed value of server IP Address.
    ...     - 2. ECG Data Format: ECG data uploaded by the device shall be in MIT16 format.
    ...     - 3. If the device receives Set Parameter command; it shall set the device setup related parameter; outside the study parameters such as Device Status Update Time.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Open WinSCP client (Open source SFTP client for Windows; used for file transfers between a host and a remote server) and set the following values:
    ...         - 2a. Choose file transfer protocol as FTP.
    ...         - 2b. Choose encryption as TLS\SSL Explicit Encryption.
    ...         - 2c. SET Host IP equal to 52.8.168.226 and Port equal to 21.
    ...         - 2d. Enter username and password to securely log in to the remote server.
    ...         - 2e. Once logged in successfully, create a new folder named as device id.
    ...         - 2f. Once device folder is created, create two subfolders names as “user” (i.e. from users) and “server” (from server).
    ...     - 3. Initiate the Start Study command with the parameters below:
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
    ...     - 4. Wait for 1 minute for study to get initiated on the device.
    ...     - 5. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Verify the remaining study duration on the device screen.
    ...     - 2. Wait for 5 minutes to ensure that the device has completed the study successfully.
    ...     - 3. Send the upload study command.
    ... 	- 4. Wait for 10 minutes to finish upload of the entire study.
    ... 	- 5. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the upload study command.
    ...          Verify there is a file with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ... 	- 6. In WinSCP, refresh the view. Within the device folder, verify there are 2 data files with the format:
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea and
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.dat.
    ...     - 7. Verify that the data output from step 6 is in MIT16 format by opening the files in the MATLAB with Waveform Database (WFDB) tools
    ...     - 8. Upload HES annotation file by sending getann command.
    ...     - 9. Upload the device log by sending getlog command.
    ...     - 10. Open log-data-mm-dd-yy-hh-mm-ss+timezone.txt file with the text editor and verify there is line “New command: ParamSet” in log file
    ...     - 11. Erase study by sending erasestudy command.
    ...     - 12. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-COMM-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-02: Confirm the status of the study.
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. Upon receiving the server commands, device software shall respond to the server along with one of the following response status values: PROCESSING, DONE, ABORTED, REJECTED
    ...     - 2. When the server command is rejected, the device software shall provide the rejection reason to the server.
    ...     - 3. Upon detecting that the format or data in the server command is not valid, the device software shall provide a response status of “REJECTED” along with the rejection reason of “Invalid parameter".
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
    ...     - 4. Wait for 1 minute for study to get initiated on the device.
    ...     Test Output:
    ...     - 1. Within the user folder, locate the device acknowledgement of the start study command.  Verify there is a file with the format
    ...        startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 2. Confirm the Bioflux Device is on the Study Details Screen.On the Study Details Screen, locate the Abort button. Tap the Abort button. Then press “Yes” button on “Confirm” screen.
    ...     - 3. In WinSCP, within the device folder, locate the device rejection of the start study command.  Verify there is a file with the format
    ...          startstudy-aborted-mm-dd-yy-hh-mm-ss+timezone.txt
    ... 	- 4. Using WinSCP, transfer the file startstudy-aborted-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC.
    ... 	- 5. Initiate the Start Study command with the parameters below:
    ...          PatientId=EMPTY – no data
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
    ...     - 6. Wait for 1 minute for study to get started.
    ...     - 7. Within the device folder, locate the device rejection of the start study command.  Verify there is a file with the format
    ...          startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 8. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open the file using a text editor.
    ...          On the last line of the text file, verify the text “Invalid parameter(s)“ is found on this line.
    ...     - 9. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseLevelDuration=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60
    ...     - 10. Follow all the steps on the device screen and then start the study.
    ...     - 11. In WinSCP, within the device folder, locate the device acknowledgement of the most recent startstudy command.  Verify there is a file with the format:
    ...           startstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 12. Wait for at least 5 minute for study to finish.
    ...     - 13. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 14. Upload HES annotation file by sending getann command.
    ...     - 15. Upload the device log by sending getlog command.
    ...     - 16. Erase study by sending erasestudy command.
    ...     - 17. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-COMM-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-03: Confirm the processing of "start/stop" commands for device.
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. Once the power up sequence is completed, device shall enter the waiting for study state.
    ...     - 2. Start Study:
    ...         - 2a. If the device receives the “startstudy” command, the Device shall enter the study setup and provide a response status of “PROCESSING”.
    ...         - 2b. When the authorized user finishes the study setup and chooses to start the study, the device shall begin an active study and provide a response of “DONE”.
    ...         - 2c. If the device is under active study and the “startstudy” command is received, the Device shall provide a response status of “REJECTED” along with the rejection reason being “Study is in progress”.
    ...         - 2d. If the device receives the “startstudy” command when study status as completed, the device software shall provide a response status of “REJECTED” along with the rejection reason of “Study has not uploaded”.
    ...         - 2e. If the device receives the “startstudy” command when study status as uploaded, the device software shall provide a response status of “REJECTED” along with the rejection reason of “Study has not erased”.
    ...     - 3. Stop Study:
    ...         - 3a. If the device receives the “stopstudy” command during an active study, the device software shall end the current study and provide a response status of “DONE”.
    ...         - 3b. If the device receives the “stopstudy” command when not in an active study, the device software shall provide a response status of “REJECTED” along with the rejection reason of “Already stopped”.
    ...     Test Setup and Input:
    ...     - 1. Make sure the device was turned off after the last study; if not turn off the device by pressing and holding the “Power” button for 3 seconds. Then press “Yes” button on “Confirm” screen.
    ...     - 2. Turn on the DXH device by pressing and holding the “Power” button for 3 seconds on the device.
    ...     Test Output:
    ...     - 1. Visually inspect that the DXH device under test is fully charged.
    ...     - 2. Visually inspect the cellular connectivity showing 3G\4G connection.
    ...     - 3. Connect the ECG cable to the DXH device by firmly inserting the cable connector into the cable receptacle as shown in Instructions For Use (IFU) document.
    ...     - 4. Connect the other end of the patient ECG Cable snap to the electrodes on the ECG Simulator device.
    ...          Once the power-up sequence is complete in the device, the device will show “Setup Device For MCT Study” screen.
    ...     - 5. Verify the “Waiting for study state” in the log saved by the device firmware.
    ...     - 6. Verify the device initialization on power on by uploading the device log using the getlog command.
    ...     - 7. Initiate the Start Study command with the parameters below:
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
    ...     - 8. Wait for 1 minute for study to get initiated on the device.
    ...     - 9. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...        startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 10. Follow all the steps on the device screen and then start the study.
    ...     - 11. Within the device folder, locate the device acknowledgement of the most recent startstudy command.  Verify there is a file with the format
    ...         startstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 12. Using WinSCP, transfer file startstudy-done-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...         On the last line of the text file, verify the text “StartTime=<exact study start date time in mm/dd/yyy hh:mm:ss with timezone>” is found on this line.
    ...         Make a note of start datetime from startstudy-done.txt
    ...     - 13. Using a file navigation GUI tool, locate the startstudy.txt file.
    ...         Drag the startstudy.txt file from the file navigation GUI tool to the user folder in WinSCP.
    ...     - 14. Within the device folder, locate the device rejection of the most recent startstudy command.   Verify there is a file with the format
    ...         startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...         15	Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step to a local folder on the PC and open the file in text editor.
    ...         On the last line of the text file, verify the text “Study is in progress” is found.
    ...         16	Plug charger to the device in 30 seconds. Then unplug charger from device
    ...     - 17. Using WinSCP, send the startstudy command.
    ...     - 18. Confirm again for the step 14 & 15
    ...     - 19. Send the stopstudy command using stopstudy.txt on WinSCP interface.
    ...     - 20. Within the device folder, locate the device acknowledgement of the stop study command.  Verify there are 2 files with the format
    ...           stopstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           note- mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 21. Using WinSCP, transfer the file stopstudy-done-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open with text editor.
    ...           On the last line of the text file, verify the text “StopTime=”<exact study stop datetime> <timezone>”” is found on this line.
    ...     - 22. Send the stopstudy command using stopstudy.txt on WinSCP interface.
    ...     - 23. In WinSCP, refresh the view.
    ...           Within the device folder, locate the device rejection of the most recent stop study command.  Verify there is a file with the format
    ...           stopstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 24. Using WinSCP, transfer the file stoptstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open the file using the text editor.
    ...         On the last line of the text file, verify the text “Already Stopped” is found on this line.
    ...     - 25. Using WinSCP, send the startstudy command.
    ...     - 26. Within the device folder, locate the device rejection of the most recent startstudy command.   Verify there is a file with the format
    ...         startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 27. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step to a local folder on the PC and open the file in text editor.
    ...         On the last line of the text file, verify the text “Study has not uploaded” is found.
    ...     - 28. Using WinSCP, send the upload study command and wait for device upload study completed.
    ...     - 29. Using WinSCP, send the startstudy command.
    ...     - 30. Within the device folder, locate the device rejection of the most recent startstudy command.   Verify there is a file with the format
    ...           startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 31. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step to a local folder on the PC and open the file in text editor.
    ...           On the last line of the text file, verify the text “Study has not erased” is found.
    ...     - 32. Using WinSCP, send the stopstudy command.
    ...     - 33. In WinSCP, refresh the view.
    ...           Within the device folder, locate the device rejection of the most recent stop study command.  Verify there is a file with the format
    ...           stopstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 34. Using WinSCP, transfer the file stoptstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open the file using the text editor.
    ...           On the last line of the text file, verify the text “Already Stopped” is found on this line.
    ...     - 35. Upload HES annotation file by sending getann command.
    ...     - 36. Erase study by sending erasestudy command.
    ...     - 37. Verify device silently reboots after erasing study data.
    ...     - 38. Using WinSCP, send the stopstudy command.
    ...     - 39. In WinSCP, refresh the view. Within the device folder, locate the device rejection of the most recent stop study command.
    ...           Verify there is a file with the format: stopstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 40. Using WinSCP, transfer the file stoptstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open the file using the text editor.
    ...           On the last line of the text file, verify the text “Already Stopped” is found on this line.
    ...     - 41. Upload the device log by sending getlog command.
    ...
    [Tags]  BFDV-COMM-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-04: Confirm the aborting a study.
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. If the user aborts a study during the study setup, the device software shall provide a response status of “ABORTED”.
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
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. In WinSCP, within the user folder, locate the device acknowledgement of the start study command.  Verify there is a file with the format
    ...          startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 2. Confirm the Bioflux Device is on the Study Details Screen.
    ...          On the Study Details Screen, locate the Abort button. Tap the Abort button.
    ...     - 3. In WinSCP, within the device folder, locate the device rejection of the start study command.  Verify there is a file with the format
    ...          startstudy-aborted-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 4. Upload the device log by sending getlog command.
    [Tags]  BFDV-COMM-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-05: Stop study while device is currently processing a manual or automatically event.
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. Stop Study: If the device receives the “stopstudy” command and the device software is currently processing a manual or automatically detected event, the device software shall complete manual or automatic detection event processing before stopping the study.
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
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...
    ...     Test Output:
    ...     - 1. Once the study has started, locate and press the “Event” button. Select any symptom and then press “Send” button on “Symptom” screen.
    ...     - 2. While the post trigger storage for manual event is still in progress, send the stopstudy command via WinSCP.
    ...     - 3. Wait for 4 minutes to complete the pre, post trigger recording.
    ...     - 4. Wait for additional 2 minutes for device to post the manual event data.
    ...     - 5. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the event button pressed action.
    ...          Verify there are files with the format below:
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 6. Within the device folder, locate the device acknowledgement of the stop study command.  Verify there are 2 files with the format
    ...          stopstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          note- mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 7. Using WinSCP, transfer the file stopstudy-done-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open with text editor.
    ...          On the last line of the text file, verify the text “StopTime=”<exact study stop datetime> <timezone>”” is found on this line.
    ...     - 8. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 9. Upload HES annotation file by sending getann command.
    ...     - 10. Upload the device log by sending getlog command.
    ...     - 11. Erase study by sending erasestudy command.
    ...     - 12. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-COMM-05    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-06: Confirm the processing of "getecg" command for device.
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     Get ECG Record:
    ...     - 1. The "getecg" command shall have the start date time and the stop date time of the requested ECG data.
    ...     - 2. If the Device receives the “getecg” command while a manual or automatic event is being processed, the device shall provide a status of “REJECTED” along with the rejection reason of “MCT event is being processed”.
    ...     - 3. If start date time is newer than stop date time, the device shall send a response status as “REJECTED” along with the rejection reason of “Invalid parameter(s)”.
    ...     - 4. If start date time equal with stop date time, the device shall send a response status as “REJECTED” along with the rejection reason of “Invalid date/time”
    ...     - 5. If the device receives the “getecg” command and the start/stop date times fall outside of the device study period, the device shall provide a status of “REJECTED” along with the rejection reason of “Invalid date/time”.
    ...     - 6. If the device receives the “getecg” command after the study has been uploaded, the device shall provide a status of “REJECTED” along with the rejection reason of “Invalid date/time”.
    ...     - 7. If the device receives the “getecg” command after the study has been erased, the device shall provide a status of “REJECTED” along with the rejection reason of “Invalid date/time”.
    ...     - 8. If the device receives the “getecg” command and the start/stop date times are within the device study period, the device shall upload an ecgdata record with the data from the start date time to the end date time.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...         PatientId=123456
    ...         PatientName=Ben Jones
    ...         Duration=30
    ...         PreEvent=30
    ...         PostEvent=30
    ...         BradyThresh=60
    ...         TachyThresh=120
    ...         PauseThresh=2500
    ...         PauseDetection=1
    ...         AfibDetection=1
    ...         AlgorithmLead=1
    ...         NoiseTimeBradyTachy=600
    ...         NoiseTimeAfib=600
    ...         NoiseTimePause=60
    ...     - 3. Wait for 1 minute for study to get initiated on the device.
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Wait for 6 minutes while the study is in progress.
    ...     - 2. Locate the getecg.txt file on the file system of the PC.  Open the getecg.txt file in a text editor, configure to obtain a most recent 5-minutes segment of data and send getecg command using WinSCP.
    ...         Confirm the file has the following structure:
    ...         File Line	                         Description Data
    ...         - 2a. Start Date of the record	    “MM/DD/YYYY”
    ...         - 2b. Start Time of the record	    “HH:MM:SS” (Time should be local device time).
    ...         - 2c. Stop Date of the record	    “MM/DD/YYYY”
    ...         - 2d. Stop Time of the record	    “HH:MM:SS” (Time should be local device time).
    ...         - 2e. Time Zone	                0
    ...     - 3. Using WinSCP - Within the device folder, locate the device acknowledgement of the getecg completed upload command.  Verify there are following files with format:
    ...          getecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          data-get-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-get-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 4. Locate and press the “Event” button. Press “Next” button and then press “Send” button on “Symptom” screen.
    ...     - 5. While post trigger recording from the manual event is still in progress, send the getecg command for the most recent 5 minutes of study which is still in progress.
    ...     - 6. Within the device folder, locate the device rejection of the most recent getecg command. Verify there is a file with the format:
    ...          getecg-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 7. Using WinSCP, transfer the file getecg-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open with text editor.
    ...          On the last line of the text file, verify the text “MCT event is being processed”.” is found.
    ...     - 8. Locate the getecg.txt file on the file system of the PC.  Open the getecg.txt file in a text editor, configure to obtain a most recent 5-minutes segment of data but make the StartTime newer over the StopTime and send getecg command using WinSCP.
    ...     - 9. Within the device folder, locate the device rejection of the most recent getecg command. Verify there is a file with the format:
    ...          getecg-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 10. Using WinSCP, transfer file getecgrejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...          On the last line of the text file, verify the text “Invalid Parameters(s)” is found on this line.
    ...     - 11. Locate the getecg.txt file on the file system of the PC.  Open the getecg.txt file in a text editor, configure to obtain a most recent 5-minutes segment of data but make the StartTime equal with the StopTime and send getecg command using WinSCP.
    ...     - 12. Within the device folder, locate the device rejection of the most recent getecg command. Verify there is a file with the format:
    ...           getecg-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 13. Using WinSCP, transfer file getecgrejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...         On the last line of the text file, verify the text “Invalid Parameters(s)” is found on this line.
    ...     - 14. Locate the getecg.txt file on the file system of the PC.  Open the getecg.txt file in a text editor, configure without the StopTime parameter send getecg command using WinSCP.
    ...     - 15. Within the device folder, locate the device rejection of the most recent getecg command. Verify there is a file with the format:
    ...         getecg-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 16. Using WinSCP, transfer file getecgrejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...         On the last line of the text file, verify the text “Invalid Parameters(s)” is found on this line.
    ...     - 17. Locate the getecg.txt file on the file system of the PC.  Open the getecg.txt file in a text editor, configure to obtain a 5-minutes segment of data but make the StartTime and StopTime outside the study period and send getecg command using WinSCP.
    ...     - 18. Within the device folder, locate the device rejection of the most recent getecg command. Verify there is a file with the format:
    ...         getecg-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 19. Using WinSCP, transfer file getecgrejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...         On the last line of the text file, verify the text “Invalid date/time” is found on this line.
    ...     - 20. Locate the getecg.txt file on the file system of the PC.  Open the getecg.txt file in a text editor, configure to obtain a 5-minutes segment of data but make the StartTime less than StartTime  of first record and send getecg command using WinSCP.
    ...     - 21. Within the device folder, locate the device rejection of the most recent getecg command. Verify there is a file with the format:
    ...         getecg-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 22. Using WinSCP, transfer file getecgrejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...         On the last line of the text file, verify the text “Invalid date/time” is found on this line.
    ...     - 23. Send the stopstudy command to stop the active study.
    ...     - 24. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 25. Locate the getecg.txt file on the file system of the PC.  Open the getecg.txt file in a text editor, configure to obtain a 5-minutes segment of data during when the study was ON and send getecg command using WinSCP.
    ...     - 26. Within the device folder, locate the device rejection of the most recent getecg command. Verify there is a file with the format:
    ...           getecg-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 27. Using WinSCP, transfer file getecgrejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already uploaded” is found on this line.
    ...     - 28. Erase study by sending erasestudy command.
    ...     - 29. Verify device silently reboots after erasing study data.
    ...     - 30. Locate the getecg.txt file on the file system of the PC.  Open the getecg.txt file in a text editor, configure to obtain a 5-minutes segment of data during when the study was ON and send getecg command using WinSCP.
    ...     - 31. Within the device folder, locate the device rejection of the most recent getecg command. Verify there is a file with the format:
    ...          getecg-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 32. Using WinSCP, transfer file getecgrejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid date/time” is found on this line.
    ...     - 33. Upload the device log by sending getlog command.
    [Tags]  BFDV-COMM-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-07: Confirm the processing of "uploadstudy" command for device.
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. Upload Study:
    ...         - 1a. If the device receives the “uploadstudy” command during an active study, the device shall provide a status of “REJECTED” along with the rejection reason of “Study is in progress”.1b. If the Device receives the “uploadstudy” command while a study paused, the device shall provide a status of “REJECTED” along with the rejection reason of “Study is in progress”.
    ...         - 1c. If the Device receives the “uploadstudy” command while a manual or automatic event is being processed, the device shall provide a status of “REJECTED” along with the rejection reason of “MCT event is being processed”.
    ...         - 1d. If the device receives the “uploadstudy” command after a study has been completed and not erased, the device shall upload a study record with all data recorded for the most recent study.
    ...         - 1e. If the device receives the “uploadstudy” command after the most recent study has been uploaded, the device shall provide a status of “REJECTED” along with the rejection reason of “Already uploaded”.
    ...         - 1f. If the device receives the “uploadstudy” command after the most recent study has been erased, the device shall provide a status of “REJECTED” along with the rejection reason of “Already erased”.
    ...     - 2. Device Notifications:
    ...         - 2a. After uploading all study data by serving uploadstudy command to the server, the device shall maintain an internal flag to keep track of the successful study data transfer to the server.
    ...
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
    ...     Test Output:
    ...     - 1. While the study is in progress, send the uploadstudy comand using WinSCP.
    ...     - 2. In WinSCP, refresh the view. Within the device folder, locate the device rejection of the most recent upload study command.
    ...          Verify there is a file with the format uploadstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Using WinSCP, transfer the file uploadtstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...          On the last line of the text file, verify the text “Study is in progress” is found.
    ...     - 4. Plug charger to the device and wait for 30 seconds. Then disconnect charger to the device.
    ...     - 5. Send the uploadstudy comand using WinSCP.
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device rejection of the most recent upload study command.
    ...          Verify there is a file with the format: uploadstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 7. Using WinSCP, transfer the file uploadtstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...          On the last line of the text file, verify the text “Study is in progress” is found.
    ...     - 8. Locate and press the “Event” button. Press “Next” button and then press “Send” button on “Symptom” screen.
    ...     - 9. While post trigger recording from the manual event is still in progress, send the uploadstudy comand using WinSCP.
    ...     - 10. In WinSCP, refresh the view. Within the device folder, locate the device rejection of the most recent upload study command.
    ...          Verify there is a file with the format: uploadstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 11. Using WinSCP, transfer the file uploadtstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...         On the last line of the text file, verify the text “MCT event is being processed” is found.
    ...     - 12. Wait to ensure that the device has completed the study successfully.
    ...     - 13. Send the upload study command.
    ...     - 14. Wait to finish the upload of the entire study.
    ...     - 15. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the upload study command.
    ...           Verify there is a file with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 16. In WinSCP, refresh the view. Within the device folder, verify there are 2 data files with the format
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.dat.
    ...     - 17. Upload the device log by sending getlog command.
    ...     - 18. Wait for 5 minutes and refresh the WinSCP view. Within the device folder, verify the file with the fomat:
    ...           log-data-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           log-daily-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 19. Open Log-data-mm-dd-yy-hh-mm-ss+timezone.txt file with the text editor and verify the study is set to “uploaded” status.
    ...     - 20. Upload HES annotation file by sending getann command.
    ...     - 21. Send the uploadstudy comand using WinSCP.
    ...     - 22. In WinSCP, refresh the view. Within the device folder, locate the device rejection of the most recent upload study command.
    ...           Verify there is a file with the format: uploadstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 23. Using WinSCP, transfer the file uploadtstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already uploaded” is found.
    ...     - 24. Erase study by sending erasestudy command.
    ...     - 25. Verify device silently reboots after erasing study data.
    ...     - 26. Send the uploadstudy using uploadstudy.txt using WinSCP.
    ...     - 27. Within the device folder, locate the device rejection of the most recent upload study command.  Verify there is a file with the format
    ...           uploadstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 28. Using WinSCP, transfer the file uploadtstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open with text editor.
    ...           On the last line of the text file, verify the text “Already erased” is found.
    ...     - 29. Upload the device log by sending getlog command.
    [Tags]  BFDV-COMM-07    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-08: Confirm the processing of "erasestudy" command for device.
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. Erase Study Data:
    ...        - 1a. If the device receives the “erasestudy” command the study data has already been erased, the device shall provide a response status of “rejected” along with the rejection reason of “Already erased”.
    ...        - 1b. If the device receives the “erasestudy” command when in an active study, the device shall provide a response status of “rejected” along with the rejection reason of “Study has not completed”.
    ...        - 1c. If the device receives the “erasestudy” command when study is paused, the device shall provide a response status of “rejected” along with the rejection reason of “Study has not completed”.
    ...        - 1d. If the device receives the “erasestudy” command after a study has been completed and the study data has not been erased, the device shall provide a response status of “rejected” along with the rejection reason of “Study has not uploaded”.
    ...        - 1e. If the device receives the “erasestudy” command after a study has been uploaded and the study data has not been erased, the device shall erase study’s recorded data.
    ...        - 1f. If the device receives the “erasestudy” command the study data has already been erased, the device shall provide a response status of “rejected” along with the rejection reason of “Already erased”.
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
    ...
    ...     Test Output:
    ...     - 1. Send erasestudy command using WinSCP
    ...     - 2. In WinSCP, refresh the view. Within the device folder, locate the device rejection of the most recent erase study command.
    ...          Verify there is a file with the format: erasestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Using WinSCP, transfer the file erasestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...          On the last line of the text file, verify the text “Already erased” is found.
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     - 5. Send erasestudy command using WinSCP
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device rejection of the most recent erase study command.
    ...          Verify there is a file with the format: erasestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 7. Using WinSCP, transfer the file erasestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...          On the last line of the text file, verify the text “Study has not completed” is found.
    ...     - 8. Plug charger to the device and wait for 30 seconds. Then disconnect charger to the device.
    ...     - 9. Send the erasestudy command using WinSCP.
    ...     - 10. In WinSCP, refresh the view. Within the device folder, locate the device rejection of the most recent upload study command.
    ...           Verify there is a file with the format: erasestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 11. Using WinSCP, transfer the file uploadtstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Study has not completed” is found.
    ...     - 12. Wait for 5 minutes for study to complete.
    ...     - 13. Send the erasestudy command using WinSCP.
    ...     - 14. In WinSCP, refresh the view. Within the device folder, locate the device rejection of the most recent upload study command.
    ...           Verify there is a file with the format: erasestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 15. Using WinSCP, transfer the file uploadtstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Study has not uploaded” is found.
    ...     - 16. After the study has completed, locate and send the uploadstudy using uploadstudy.txt using WinSCP.
    ...     - 17. In WinSCP, within the user folder for the given device, locate the device acknowledgement of the upload study command.
    ...           Verify there is a file with the format: uploadstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 18. Wait for at least 10 minutes. Within the device folder, locate the device acknowledgement of the upload study command.
    ...           Verify there is a file with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 19. In WinSCP, within the device folder, verify there are 2 data files with the format:
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 20. Locate erasestudy.txt and using WinSCP, send erasestudy command.
    ...     - 21. Verify device silently reboots after erasing study data.
    ...     - 22. In WinSCP, refresh the view. Locate the device folder.  Within the device folder, locate the device acknowledgement of the erase study command.  Confirm there is a file with the format
    ...           erasestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 23. After the study has erased, locate and send the erasestudy using erasestudy.txt using WinSCP.
    ...     - 24. Within the device folder, locate the device rejection of the most recent erase study command.
    ...           Verify there is a file with the format: erasestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 25. Using WinSCP, transfer the file erasestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open with text editor.
    ...           On the last line of the text file, verify the text “Already erased” is found.
    ...     - 26. Upload HES annotation file by sending getann command.
    ...     - 27. Upload the device log by sending getlog command.
    [Tags]  BFDV-COMM-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-09: Confirm the notification.
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     Device Notifications: The device shall provide the current notification from the following list:
    ...     - 1. User Power On
    ...     - 2. User Power Down Request
    ...     - 3. Device Error
    ...     - 4. Power on Initialization Failure
    ...     - 5. CRC Checksum Failure
    ...     - 6. Manual Cardiac Event Storage Failure
    ...     - 7. Electrogram Data Upload Failure
    ...
    ...     Test Setup and Input:
    ...     - 1. Power on the device.
    ...     - 2. Wait for few minute for power on initialization to finish including the power on initialization checks such as cellular connectivity, SD card health and CRC check.
    ...     - 3. Power down the device.
    ...     - 4. Wait for few minutes for power off to finish.
    ...     - 5. Remove the SD card from the Bioflux device.
    ...     - 6. Power on the device.
    ...     - 7. Wait for Power On initialization and look for the Error screen on the device display associated with SD card removal.
    ...     - 8. Power off the device by pressing and holding the Home button for 10 seconds.
    ...     - 9. Insert the SD card back in to the Bioflux device.
    ...     - 10. Power on the device by pressing and holding the Home button for 3-5 seconds.
    ...     - 11. Wait for few minute for power on initialization to finish including the power on initialization checks such as cellular connectivity, SD card health and CRC check.
    ...     Test Output:
    ...     - 1. In WinSCP, send the getlog command to retrieve the device activities log.
    ...     - 2. Wait for 5 minutes and refresh the WinSCP view. Within the device folder, verify the file with the fomat:
    ...          log-data-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          log-daily-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Within device log file, status files and notifications in the device folder, verify the following events:
    ...          User Power On
    ...          User Power Down
    ...          CRC Check
    ...     - 4. Connect the device to the Bioflux Device Monitor Software. Issue the following command which will return firmware version, actual firmware CRC. SM+VER?
    ...     - 5. Enable CRC checking feature.
    ...          SM+CRC=1,<CRC value>
    ...     - 6. Using Bioflux Device Monitor software, issue the command below to read the value written at address 0x0807FFF. Record the value read here.
    ...          SM+FLASH=0807FFFF?
    ...     - 7. Using Bioflux Device Monitor software, write a different value at address 0x0807FFF than read in the previous step.
    ...         SM+FLASH=0807FFFF,AA
    ...     - 8. Wait for “Device Health Check Frequency” time interval.
    ...     - 9. Observe Error screen on the device with code:11400
    ...     - 10. Return the device to manufacturing to re-program the code.
    ...     - 11. After re programming turn on the device and wait until device is on waiting for start study screen.
    ...     - 12. In WinSCP, send the getlog command to retrieve the device activities log.
    ...     - 13. Wait for 5 minutes and refresh the WinSCP view. Within the device folder, verify the file with the format:
    ...           log-data-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           log-daily-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 14. Open the log file in the text editor and find:
    ...           Firmware CRC: 03235F95
    ...           Invalid CRC. Expected 03235FEA.
    [Tags]  BFDV-COMM-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-10: Confirm the notification.
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     Device Notifications: The device shall provide the current notification from the following list:
    ...     - 1. Battery Low
    ...     - 2. Battery Critical
    ...     - 3. Battery Charging
    ...     - 4. Lead Disconnected
    ...     - 5. Lead Reconnected
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results" except the battery requirement to be 100% charged. As long as battery charge is greater than 41%, go to next step.
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=43200
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
    ...     - 5. Connect the ECG Simulator to feed in sinus signal at 80 BPM.
    ...     Test Output:
    ...     - 1. Disconnect the lead.
    ...     - 2. Wait for few minutes to finish sending the Lead off detection notification.
    ...     - 3. Reconnect the lead.
    ...     - 4. Wait for few minutes to finish sending the lead connection notification.
    ...     - 5. Wait for long enough to let the battery charge drop below 20%.
    ...     - 6. Verify that the Battery Low notification is sent.
    ...     - 7. Wait again to let the battery charge drop below 10%.
    ...     - 8. Verify that the Battery Critical notification is sent when the charger is plugged back in since device stops sending notification to the server when remaining battery threshold is <= 10% since modem gets turned off at 10% battery level.
    ...     - 9. Plug the device in for charging.
    ...     - 10. In WinSCP, send the getlog command to retrieve the device log.
    ...     - 11. Wait for 5 minutes and refresh the WinSCP view. Within the device folder, verify the file with the fomat:
    ...           log-data-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           log-daily-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 12. Within device log and device notifications, verify the notifications below:
    ...         Battery Critical
    ...         Battery Charging
    ...     - 13. Wait to let the battery charge to over 20%.
    ...     - 14. Unplug the device from charging and wait for 30 seconds.
    ...     - 15. Once the resume sequence is complete, device shall display the RESUMING STUDY screen.
    ...     - 16. Confirm resuming the study on the device display.
    ...     - 17. Send the stopstudy command to stop the active study.
    ...     - 18. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 19. Create an local "SD card" folder on the PC
    ...     - 20. Connect the device to the “Device Monitor” program
    ...     - 21. Switch the device to the “Mass Storage” mode
    ...     - 22. Copy the yyyymmdd-hhmmss.dat file in the “rec” folder to the “SD card” folder:
    ...     - 23. Create an local "Device" folder on the PC
    ...     - 24. Using WinSCP, transfer the following files to “Device” folder:
    ...          data-all- mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all- mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 25. Use “ECG Verification” program to verify the ecg data of two folder “SD card” and “Device” folder.
    ...     - 26. Make sure the program does not report any warning on the verification result
    ...     - 27. Upload HES annotation file by sending getann command.
    ...     - 28. Upload the device log by sending getlog command.
    ...     - 28. Erase study by sending erasestudy command.
    ...     - 29. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-COMM-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-11: Confirm the notification.
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. User Power On
    ...     - 2. User Power Down Request
    ...     - 3. Device Error
    ...     - 4. Power on Initialization Failure
    ...     - 5. CRC Checksum Failure
    ...     - 6. Manual Cardiac Event Storage Failure
    ...     - 7. Electrogram Data Upload Failure
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results" except the battery requirement to be 100% charged. As long as battery charge is greater than 41%, go to next step.
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=43200
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
    ...     - 5. Connect the ECG Simulator to feed in sinus signal at 80 BPM.
    ...     Test Output:
    ...     - 1. Disconnect the lead.
    ...     - 2. Wait for few minutes to finish sending the Lead off detection notification.
    ...     - 3. Reconnect the lead.
    ...     - 4. Wait for few minutes to finish sending the lead connection notification.
    ...     - 5. Wait for long enough to let the battery charge drop below 20%.
    ...     - 6. Verify that the Battery Low notification is sent.
    ...     - 7. Wait again to let the battery charge drop below 10%.
    ...     - 8. Verify that the Battery Critical notification is sent when the charger is plugged back in since device stops sending notification to the server when remaining battery threshold is <= 10% since modem gets turned off at 10% battery level.
    ...     - 9. Plug the device in for charging.
    ...     - 10. In WinSCP, send the getlog command to retrieve the device log.
    ...     - 11. Wait for 5 minutes and refresh the WinSCP view. Within the device folder, verify the file with the fomat:
    ...           log-data-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           log-daily-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 12. Within device log and device notifications, verify the notifications below:
    ...           Battery Critical
    ...           Battery Charging
    ...     - 13. Wait to let the battery charge to over 20%.
    ...     - 14. Unplug the device from charging and wait for 30 seconds.
    ...     - 15. Once the resume sequence is complete, device shall display the RESUMING STUDY screen.
    ...     - 16. Confirm resuming the study on the device display.
    ...     - 17. Send the stopstudy command to stop the active study.
    ...     - 18. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 19. Create an local "SD card" folder on the PC
    ...     - 20. Connect the device to the “Device Monitor” program
    ...     - 21. Switch the device to the “Mass Storage” mode
    ...     - 22. Copy the yyyymmdd-hhmmss.dat file in the “rec” folder to the “SD card” folder:
    ...     - 23. Create an local "Device" folder on the PC
    ...     - 24. Using WinSCP, transfer the following files to “Device” folder:
    ...           data-all- mm-dd-yy-hh-mm-ss+timezone.hea
    ...           data-all- mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 25. Use “ECG Verification” program to verify the ecg data of two folder “SD card” and “Device” folder.
    ...     - 26. Make sure the program does not report any warning on the verification result
    ...     - 27. Upload HES annotation file by sending getann command.
    ...     - 28. Upload the device log by sending getlog command.
    ...     - 28. Erase study by sending erasestudy command.
    ...     - 29. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-COMM-11    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-12: Confirm the device notification.
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: Device software shall support wireless communication over cellular network link
    ...     Test Setup and Input:
    ...     - 1. Power on the device and let it go through the power on initialization.
   ...      Test Output:
    ...     - 1. Visually inspect that the cellular connectivity is showing 3G\4G connection.
    ...     - 2. Send the getlog command by sending getlog.txt in WinSCP.
    ...     - 3. Wait for few minutes to have the device log uploaded.
    ...     - 4. Verify the cellular connectivity in the device log output.
    ...     - 5. Upload the device log by sending getlog command.
    [Tags]  BFDV-COMM-12    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-13: Confirm the device notification.
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: Device software shall notify the user with appropriate notifications if the communication between the bioflux device and the server can’t be established or fails.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Now ensure that the device is in no network zone for more than a minute.
    ...     Test Output:
    ...     - 1. Verify that the device displays “Low Cell Signal” screen.
    ...     - 2. Upload the device log by sending getlog command.
    [Tags]  BFDV-COMM-13    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-14: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: Device software shall encrypt patient data information (PHI) during communications between the bioflux device and the server
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Open WinSCP client (Open source SFTP client for Windows; used for file transfers between a host and a remote server) and set the following values:
    ...          1. Choose file transfer protocol as FTP.
    ...          2. Choose encryption as TLS\SSL Explicit Encryption.
    ...          3. SET Host equal to 52.8.168.226 and Port equal to 21.
    ...          4. Enter username and password to securely log in to the remote server.
    ...          5. Once logged in successfully, create a new folder named as device id.
    ...             Once device folder is created, create two subfolders names as “user” (i.e. from users) and “server” (from server).
    ...     Test Output:
    ...     - 1. Verify that encryption is set as “TLS\SSL Explicit Encryption” on the WinSCP login session screen.
    [Tags]  BFDV-COMM-14    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-15: Confirm the notification.
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1a. When device receives erasestudy command, the device software shall check an internal flag to make sure that the study data was transferred to the server successfully before erasing the data from the device memory.
    ...     - 1b. After erasing all study data as part of serving erasestudy command, the device software shall go to the Setup Device screen.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results" except the battery requirement to be 100% charged. As long as battery charge is greater than 41%, go to next step.
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=43200
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
    ...     Test Output:
    ...     - 1. Wait for 5 minutes to ensure that the device has completed the study successfully.
    ...     - 2. Send the upload study command.
    ...     - 3. Wait for 10 minutes to finish the upload of the entire study.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the upload study command.
    ...          Verify there is a file with the format
    ...          uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 5. In WinSCP, refresh the view. Within the device folder, verify there are 2 data files with the format
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.dat.
    ...     - 6. In WinSCP, send the getlog command to retrieve the device log.
    ...     - 7. Wait for 5 minutes and refresh the WinSCP view. Within the device folder, verify the file with the fomat:
    ...          log-data-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          log-daily-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 8. Open Log-data-mm-dd-yy-hh-mm-ss+timezone.txt file with the text editor and verify the study is set to “uploaded” status.
    ...     - 9. Upload HES annotation file by sending getann command.
    ...     - 10. Using WinSCP, send Erase Study command.
    ...     - 11. Upload the device log by sending getlog command.
    ...     - 12. In WinSCP, refresh the view. Locate the device folder.  Within the device folder, locate the device acknowledgement of the erase study command.  Confirm there is a file with the format
    ...           erasestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 13. Verify device silently reboots after erasing study data.
    ...     - 14. Verify that device screen changes from erasing screen to Home which is device setup screen.
    [Tags]  BFDV-COMM-15    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-16: Confirm starting the study without having to go through any screen interventions
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. The device shall enable starting the study without having to go through any screen interventions.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results" except the battery requirement to be 100% charged. As long as battery charge is greater than 41%, go to next step.
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          Auto=1
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
    ...     - 3. Wait for 2 minutes for study to get initiated on the device without having to go through any screen.
    ...     Test Output:
    ...     - 1. Wait for 5 minutes to ensure that the device has completed the study successfully.
    ...     - 2. Send the upload study command.
    ...     - 3. Wait for 10 minutes to finish the upload of the entire study.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the upload study command.
    ...          Verify there is a file with the format
    ...          uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 5. In WinSCP, refresh the view. Within the device folder, verify there are 2 data files with the format
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.dat.
    ...     - 6. Upload HES annotation file by sending getann command.
    ...     - 7. Using WinSCP, send erasestudy command.
    ...     - 8. In WinSCP, refresh the view. Locate the device folder.  Within the device folder, locate the device acknowledgement of the erase study command.  Confirm there is a file with the format
    ...          erasestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 9. Verify device silently reboots after erasing study data.
    ...     - 10. Upload the device log by sending getlog command.
    ...     - 11. Verify that device screen changes from erasing screen to Home which is device setup screen.
    [Tags]  BFDV-COMM-16    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BFDV-COMM-17: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - The device shall update and apply the study parameters upon receiving the Update Study command.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          Auto=0
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=60
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
    ...     - 3. Wait for 2 minutes for study to get initiated on the device.
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Wait for 2 minutes after study has started.
    ...     - 2. Connect the device to the Bioflux Device Monitor Software. Use following SM command to disable LOD
    ...     - SM+LOD=0 .
    ...     - 3. Connect only LA+ electrode and RA- electrode to ECG simulation.
    ...     - 4. Using an ECG simulation tool, generate a Bradycardia event by setting the BPM to 40.
    ...     - 5. Wait for additional 2 minutes for device to post the auto event data.
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event.
    ...          Verify there is a file with the format below:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann.
    ...     - 7. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Brady”.
    ...     - 8. Send the updatestudy.txt command using updatestudy.txt to revise AlgorithmLead to 2.
    ...     - 9. Wait for 1 minute to have the study updated.
    ...          Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...          updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 10. Using an ECG simulation tool, generate a Bradycardia event by setting the BPM to 40.
    ...     - 11. Auto event will be ignored. Verify that following files are not created event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann.
    ...     - 12. Connect only LL+ electrode and RA- electrode to ECG simulation.
    ...     - 13. Using an ECG simulation tool, generate a TachyCardia event by setting the BPM to 160.
    ...     - 14. Wait for additional 2 minutes for device to post the auto event data.
    ...     - 15. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event.
    ...           Verify there is a file with the format below:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann.
    ...     - 16. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Tachy”.
    ...     - 17. Send the updatestudy.txt command using updatestudy.txt to revise AlgorithmLead to 1.
    ...     - 18. Wait for 1 minute to have the study updated.
    ...     - 19. Using an ECG simulation tool, generate a TachyCardia event by setting the BPM to 160.
    ...     - 20. Auto event will be ignored. Verify that following files are not created event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann.
    ...     - 21. Upload the device log by sending getlog command. Keep the status of the study and continue to the case TC_COMM_131b_TC02
    [Tags]  BFDV-COMM-17    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
   
BFDV-COMM-18: Confirm starting the study without having to go through any screen interventions
    [Documentation]     Author: Nang Phung
    ...
    ...     Test Setup and Input:
    ...     Test Output:
    ...     - 1. Send the updatestudy.txt command using updatestudy.txt to revise BradyThresh to 40.
    ...     - 2. Wait for 1 minute to have the study updated.
    ...          Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...          updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 3. Using an ECG simulation tool, generate a Bradycardia event by setting the BPM to 40.
    ...     - 4. Auto event will be ignored. Verify that following files are not created event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann.
    ...     - 5. Using an ECG simulation tool, generate a Bradycardia event by setting the BPM to 30.
    ...     - 6. Wait for additional 2 minutes for device to post the auto event data.
    ...     - 7. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event.
    ...          Verify there is a file with the format below:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann.
    ...     - 8. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Brady”.
    ...     - 9. Upload the device log by sending getlog command. Keep the status of the study and continue to the case TC_COMM_131b_TC03
    [Tags]  BFDV-COMM-18    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-19: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Test Setup and Input:
    ...     Test Output:
    ...     - 1. Send the updatestudy.txt command using updatestudy.txt to revise TachyThresh to 140.
    ...     - 2. Wait for 1 minute to have the study updated.
    ...          Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...          updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 3. Using an ECG simulation tool, generate a TachyCardia event by setting the BPM to 140.
    ...     - 4. Auto event will be ignored. Verify that following files are not created event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann.
    ...     - 5. Using an ECG simulation tool, generate a TachyCardia event by setting the BPM to 160.
    ...     - 6. Wait for additional 2 minutes for device to post the auto event data.
    ...     - 7. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event.
    ...          Verify there is a file with the format below:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann.
    ...     - 8. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Tachy”.
    ...     - 9. Upload the device log by sending getlog command. Keep the status of the study and continue to the case TC_COMM_131b_TC04
    [Tags]  BFDV-COMM-19    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-20: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Test Setup and Input:
    ...     Test Output:
    ...     - 1. Send the updatestudy.txt command using updatestudy.txt to revise PauseThresh to 5000.
    ...     - 2. Wait for 1 minute to have the study updated.
    ...          Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...          updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 3. Using an ECG simulation tool, generate a Pause event in 3 seconds.
    ...     - 4. Auto event will be ignored. Verify that following files are not created event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann.
    ...     - 5. Using an ECG simulation tool, generate a Pause event in 5 seconds.
    ...     - 6. Wait for additional 2 minutes for device to post the auto event data.
    ...     - 7. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event.
    ...          Verify there is a file with the format below:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann.
    ...     - 8. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Pause”.
    ...     - 9. Upload the device log by sending getlog command. Keep the status of the study and continue to the case TC_COMM_131b_TC05
    [Tags]  BFDV-COMM-20    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-21: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Test Setup and Input:
    ...     Test Output:
    ...     - 1. Send the updatestudy.txt command using updatestudy.txt to revise PreEvent to 60.
    ...     - 2. Wait for 1 minute to have the study updated.
    ...          Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...          updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 3. Using an ECG simulation tool, generate a TachyCardia event by setting the BPM to 16s0.
    ...     - 4. Wait for additional 2 minutes for device to post the auto event data.
    ...     - 5. Get the size of the file event-auto-mm-dd-yy-hh-mm-ss+timezone.dat. Then divide by 1500.
    ...     - 6. Verify the result of the above calculation is 90.
    ...     - 7. Upload the device log by sending getlog command. Keep the status of the study and continue to the case TC_COMM_131b_TC06
    [Tags]  BFDV-COMM-21    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-22: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Test Setup and Input:
    ...     Test Output:
    ...     - 1. Send the updatestudy.txt command using updatestudy.txt to revise PostEvent to 60.
    ...     - 2. Wait for 1 minute to have the study updated.
    ...          Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...          updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 3. Using an ECG simulation tool, generate a TachyCardia event by setting the BPM to 160.
    ...     - 4. Wait for additional 2 minutes for device to post the auto event data.
    ...     - 5. Get the size of the file event-auto-mm-dd-yy-hh-mm-ss+timezone.dat. Then divide by 1500.
    ...     - 6. Verify the result of the above calculation is 120
    ...     - 10. Upload the device log by sending getlog command. Keep the status of the study and continue to the case TC_COMM_131b_TC07
    [Tags]  BFDV-COMM-22    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-23: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Test Setup and Input:
    ...     Test Output:
    ...     - 1. Send the updatestudy.txt command using updatestudy.txt to revise PauseDetection to 0.
    ...     - 2. Wait for 1 minute to have the study updated.
    ...          Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...          updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 3. Using an ECG simulation tool, generate a Pause event in 5 seconds
    ...     - 4. Auto event will be ignored. Verify that following files are not created event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann.
    ...     - 5. Send the updatestudy.txt command using updatestudy.txt to revise PauseDetection to 1.
    ...     - 6. Wait for 1 minute to have the study updated.
    ...     - 7. Using an ECG simulation tool, generate a Pause event in 5 seconds.
    ...     - 8. Wait for additional 2 minutes for device to post the auto event data.
    ...     - 9. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event.
    ...          Verify there is a file with the format below:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann.
    ...     - 10. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Pause”.
    ...     - 11. Upload the device log by sending getlog command. Keep the status of the study and continue to the case TC_COMM_131b_TC08
    [Tags]  BFDV-COMM-23    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-24: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Test Setup and Input:
    ...     Test Output:
    ...     - 1. Send the updatestudy.txt command using updatestudy.txt to revise AfibDetection to 0.
    ...     - 2. Wait for 1 minute to have the study updated.
    ...          Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...          updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 3. Using an ECG simulation tool, generate an Atrial Fibrillation coarse event.
    ...     - 4. Afib event will be ignored. Verify that following files of Afib event are not create
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann.
    ...     - 5. Send the updatestudy.txt command using updatestudy.txt to revise AfibDetection to 1.
    ...     - 6. Wait for 1 minute to have the study updated.
    ...     - 7. Using an ECG simulation tool, generate a Afib event.
    ...     - 8. Wait for additional 2 minutes for device to post the auto event data.
    ...     - 9. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event.
    ...          Verify there is a file with the format below:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann.
    ...     - 10. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Afib”.
    ...     - 11. Using WinSCP, send stop study command to let the study finish.
    ...     - 12. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 13. Create an local "SD card" folder on the PC.
    ...     - 14. Connect the device to the “Device Monitor” program.
    ...     - 15. Switch the device to the “Mass Storage” mode.
    ...     - 16. Copy the yyyymmdd-hhmmss.dat file in the “rec” folder to the “SD card” folder:.
    ...     - 17. Create an local "Device" folder on the PC.
    ...     - 18. Using WinSCP, transfer the following files to “Device” folder:
    ...           data-all- mm-dd-yy-hh-mm-ss+timezone.hea
    ...           data-all- mm-dd-yy-hh-mm-ss+timezone.dat.
    ...     - 19. Use “ECG Verification” program to verify the ecg data of two folder “SD card” and “Device” folder.
    ...     - 20. Make sure the program does not report any warning on the verification result.
    ...     - 22. Upload HES annotation file by sending getann command.
    ...     - 23. Upload the device log by sending getlog command.
    ...     - 24. Erase study by sending erasestudy command.
    ...     - 25. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-COMM-24    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-25: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          Auto=0
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=120
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=300
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60
    ...     - 3. Wait for 2 minutes for study to get initiated on the device.
    ...     - 4. Connect the ECG Simulator to feed in signal at 80 BPM.
    ...     - 5. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Wait for 2 minutes after study has started.
    ...     - 2. Using WinSCP, send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeBradyTachy to 600.
    ...     - 3. Wait for 1 minute to have the study updated.
    ...     - In WinSCP, refresh the view. Within the device folder, verify that NoiseTimeBradyTachy is changed to 600 in notification file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 4. Change ECG Simulator BPM signal to 40 for Bradycardia event.
    ...     - 5. Waiting for 1 minute. In WinSCP, refresh the view. Within the device folder, verify a triggered Bradycardia event in event header file with format:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea.
    ...     - 6. Disconnect ECG cable.
    ...     - 7. Wait for 300 more seconds from disconnecting ECG cable moment.
    ...     - 8. Connect ECG cable to the device.
    ...     - 10. Wait for 1 minute after connecting ECG cable.
    ...     - In WinSCP, refresh the view. Within the device folder, verify that there are no recently triggered Brady event files with format:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea.
    ...     - 11. Change ECG Simulator BPM signal to 80.
    ...     - 12. Change ECG Simulator BPM signal to 40 for Bradycardia event.
    ...     - 13. Waiting for 1 minute.
    ...     - In WinSCP, refresh the view. Within the device folder, verify a triggered Bradycardia event in event header file with format:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea.
    ...     - 14. Disconnect ECG cable.
    ...     - 15. Wait for 600 more seconds from disconnecting ECG cable moment.
    ...     - 16. Connect ECG cable to the device.
    ...     - 17. Wait for 1 minute after connecting ECG cable.
    ...     - In WinSCP, refresh the view. Within the device folder, verify that there are recently triggered Brady event files with format:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea.
    ...     - 18. Using WinSCP, send stop study command to let the study finish.
    ...     - 19. Using WinSCP, send the upload study command.
    ...     - 20. Wait for 10 minutes to finish the upload of the entire study.
    ...     - 21. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the upload study command.
    ...           Verify there is a file with the format:
    ...           uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 22. In WinSCP, refresh the view. Within the device folder, verify there are 2 data files with the format:
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.dat.
    ...     - 23. Upload HES annotation file by sending getann command.
    ...     - 24. Upload the device log by sending getlog command.
    ...     - 25. Using WinSCP, send Erase Study command.
    ...     - 26. Verify device silently reboots after erasing study data.
    ...     - 27. In WinSCP, refresh the view. Locate the device folder.  Within the device folder, locate the device acknowledgement of the erase study command.  Confirm there is a file with the format:
    ...     - erasestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 28. Verify that device screen changes from erasing screen to Home which is device setup screen.
    [Tags]  BFDV-COMM-25    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-26: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          Auto=0
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=60
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=300
    ...          NoiseTimePause=60
    ...     - 3. Wait for 2 minutes for study to get initiated on the device.
    ...     - 4. Connect the ECG Simulator to feed in signal at 80 BPM.
    ...     - 5. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Wait for 2 minutes after study has started.
    ...     - 2. Using WinSCP, send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeAfib to 600.
    ...     - 3. Wait for 1 minute to have the study updated.
    ...          In WinSCP, refresh the view. Within the device folder, verify that NoiseTimeAfib is changed to 600 in notification file with the format:
    ...          updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 4. Change ECG Simulator output to Atrial FIB event (No.12 or No.13 in the event list).
    ...     - 5. Wait to verify a triggered Afib event in event header file with format:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea.
    ...     - 6. Disconnect ECG cable.
    ...     - 7. Wait for 600 more seconds from disconnecting ECG cable moment.
    ...     - 8. Change ECG Simulator output to Normal rhythm at 80 BPM.
    ...     - 9. Connect ECG cable to the device.
    ...     - 10. Connect the charger to the device.
    ...     - 11. Wait for 1 minute. In WinSCP, refresh the view. Within the device folder, collect the last 2 hourly reports with the format:
    ...           report-hourly- mm-dd-yy-hh-mm-ss+timezone.txt
    ...           Verify that the last Afib event in the hourly report stopped at the LEAD OFF end moment from the hourly report.
    ...     - 10. Disconnect the charger from the device.
    ...     - 11. Wait for the StartResume screen and then press the start button on the screen.
    ...     - 12. Wait for 2 minutes after study has resumed.
    ...     - 13. Change ECG Simulator output to Atrial FIB event (No.12 or No.13 in the event list).
    ...     - 14. In WinSCP, refresh the view. Within the device folder, wait to verify a triggered Afib event in event header file with format:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea.
    ...     - 15. Disconnect ECG cable.
    ...     - 16. Wait for 600 more seconds from disconnecting ECG cable moment.
    ...     - 17. Change ECG Simulator output to Normal rhythm at 80 BPM.
    ...     - 18. Connect ECG cable to the device.
    ...     - 19. Connect the charger to the device.
    ...     - 20. Wait for 1 minute. In WinSCP, refresh the view. Within the device folder, collect the last 2 hourly reports with the format:
    ...           report-hourly- mm-dd-yy-hh-mm-ss+timezone.txt
    ...           Verify that the last Afib event in the hourly report stopped at the LEAD OFF begin moment from the hourly report.
    ...     - 21. Disconnect the charger from the device.
    ...     - 22. Wait for the StartResume screen and then press the start button on the screen.
    ...     - 25. Using WinSCP, send stop study command to let the study finish.
    ...     - 26. Using WinSCP, send the upload study command.
    ...     - 27. Wait for 10 minutes to finish the upload of the entire study.
    ...     - 28. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the upload study command.
    ...           Verify there is a file with the format:
    ...           uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 29. In WinSCP, refresh the view. Within the device folder, verify there are 2 data files with the format:
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.dat.
    ...     - 30. Upload HES annotation file by sending getann command.
    ...     - 31. Upload the device log by sending getlog command.
    ...     - 32. Using WinSCP, send erasestudy command.
    ...     - 33. Verify device silently reboots after erasing study data.
    ...     - 34. In WinSCP, refresh the view. Locate the device folder.  Within the device folder, locate the device acknowledgement of the erase study command.  Confirm there is a file with the format:
    ...           erasestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 35. Verify that device screen changes from erasing screen to Home which is device setup screen.
    [Tags]  BFDV-COMM-26    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-27: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          Auto=0
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
    ...     - 3. Wait for 2 minutes for study to get initiated on the device.
    ...     - 4. Connect the ECG Simulator to feed in signal at 80 BPM.
    ...     - 5. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Wait for 2 minutes after study has started.
    ...     - 2. Using WinSCP, send the updatestudy.txt command using updatestudy.txt to revise NoiseTimePause to 120.
    ...     - 3. Wait for 1 minute to have the study updated.
    ...          In WinSCP, refresh the view. Within the device folder, verify that NoiseTimePause is changed to 120 in notification file with the format:
    ...          updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 4. Change ECG Simulator BPM output to 0 BPM. (No.2 in the event list).
    ...     - 5. Wait for 5 seconds after successfully changing the ECG Simulator output.
    ...          Disconnect ECG cable.
    ...     - 6. Wait for 60 more seconds from disconnecting ECG cable moment.
    ...          Note: In this period, in WinSCP, refresh the view. Within the device folder, turn back to step 4 if there are 3 triggered Paused event files with format:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea.
    ...     - 7. Connect ECG cable to the device.
    ...     - 8. Change ECG Simulator BPM output to 80 BPM. (No.2 in the event list).
    ...          Wait for 1 minute after connecting ECG cable.
    ...          In WinSCP, refresh the view. Within the device folder, verify that there are recently triggered Paused event files with format:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea.
    ...     - 9. Connect the charger to the device.
    ...     - 10. Wait for 1 minute. In WinSCP, refresh the view. Within the device folder, collect the last 2 hourly reports with the format:
    ...           report-hourly- mm-dd-yy-hh-mm-ss+timezone.txt
    ...           Verify that the last Paused event in the hourly report stopped after Noise off.
    ...     - 11. Disconnect the charger from the device.
    ...     - 12. Wait for the StartResume screen and then press the start button on the screen.
    ...     - 13. Wait for 2 minutes after study has resumed.
    ...     - 14. Change ECG Simulator BPM output to 0 BPM. (No.2 in the event list).
    ...     - 15. Wait for 5 seconds after successfully changing the ECG Simulator output.
    ...           Disconnect ECG cable.
    ...     - 16. Wait for 60 seconds from disconnecting ECG cable moment.
    ...          Note: In this period, in WinSCP, refresh the view. Within the device folder, turn back to step 14 if there are 3 triggered Paused event files with format:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea.
    ...     - 17. Wait for 120 more seconds from disconnecting ECG cable moment.
    ...          Note: In this period, in WinSCP, refresh the view. Within the device folder, verify that there are triggered Paused event files with format:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea.
    ...     - 18. Connect the charger to the device.
    ...     - 19. Wait for 1 minute. In WinSCP, refresh the view. Within the device folder, collect the last hourly report with the format:
    ...           report-hourly- mm-dd-yy-hh-mm-ss+timezone.txt
    ...           Verify that the last Paused event stopped after “Lead Off” moment in the hourly report.
    ...     - 20. Disconnect the charger from the device.
    ...     - 21. Wait for the StartResume screen and then press the start button on the screen.
    ...     - 22. Using WinSCP, send stop study command to let the study finish.
    ...     - 23. Using WinSCP, send the upload study command.
    ...     - 24. Wait for 10 minutes to finish the upload of the entire study.
    ...     - 25. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the upload study command.
    ...           Verify there is a file with the format
    ...           uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 26. In WinSCP, refresh the view. Within the device folder, verify there are 2 data files with the format
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.dat.
    ...     - 27. Upload HES annotation file by sending getann command.
    ...     - 28. Upload the device log by sending getlog command.
    ...     - 29. Using WinSCP, send Erase Study command.
    ...     - 30. Verify device silently reboots after erasing study data.
    ...     - 31. In WinSCP, refresh the view. Locate the device folder.  Within the device folder, locate the device acknowledgement of the erase study command.  Confirm there is a file with the format:
    ...           erasestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 32. Verify that device screen changes from erasing screen to Home which is device setup screen.
    [Tags]  BFDV-COMM-27    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-28: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          Auto=0
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
    ...     - 3. Wait for 1 minutes for study to get initiated on the device.
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Wait for 2 minutes after the study has started.
    ...     - 2. Send the updatestudy.txt command using updatestudy.txt to revise Duration to 30.
    ...     - 3. Wait for 1 minute to have the study updated.
    ...          Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...          updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 4. Verify that the remaining time on the “MCT Study in Progress” screen is 28 minutes.
    ...     - 5. Wait for remain time on the “MCT Study in progress” screen is 27 minutes.
    ...     - 6. Send the updatestudy.txt command using updatestudy.txt to revise Duration to 43200.
    ...     - 7. Wait for a few seconds to have the study updated.
    ...     - 8. Verify that the remaining time on the “MCT Study in Progress” screen is 29 day-23 hours-57 minutes
    ...     - 9. Wait for remain time on the “MCT Study in progress” screen is 29 day-23 hours-56 minutes.
    ...     - 10. Send the updatestudy.txt command using updatestudy.txt to revise Duration to 3 minutes.
    ...     - 11. Wait for a few seconds to have the study updated.
    ...     - 12. Verify that the device display “Study pause” screen. Then it switch to “Study complete” screen.
    ...     - 13. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 14. Upload HES annotation file by sending getann command.
    ...     - 15. Upload the device log by sending getlog command.
    ...     - 16. Erase study by sending erasestudy command.
    ...     - 17. Verify device silently reboots after erasing study data.
    ...     Description: The device shall update study parameters upon receiving the Update Study command but do not auto resume study if study is pausing.
    [Tags]  BFDV-COMM-28    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-29: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=15
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
    ...     - 3. Wait for 1 minutes for study to get initiated on the device.
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Wait for 1 minute after study has started.
    ...     - 2. Plug charger to the device in 30 seconds. Then unplug charger from device.
    ...     - 3. Confirm the device displays a “Pause” screen.
    ...     - 4. Disconnect the lead (So make sure the device doesn’t auto resume after 15 minutes).
    ...     - 5. Send the updatestudy.txt command using updatestudy.txt to revise Duration to 43200.
    ...     - 6. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...          updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 7. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 8. Send the updatestudy.txt command using updatestudy.txt to revise PreEvent to 30.
    ...     - 9. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...          updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 10. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 11. Send the updatestudy.txt command using updatestudy.txt to revise PreEvent to 60.
    ...     - 12. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 13. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 14. Send the updatestudy.txt command using updatestudy.txt to revise PreEvent to 90.
    ...     - 15. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 16. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 17. Send the updatestudy.txt command using updatestudy.txt to revise PreEvent to 120.
    ...     - 18. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 19. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 20. Send the updatestudy.txt command using updatestudy.txt to revise PreEvent to 150.
    ...     - 21. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 22. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 23. Send the updatestudy.txt command using updatestudy.txt to revise PreEvent to 180.
    ...     - 24. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 25. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 26. Send the updatestudy.txt command using updatestudy.txt to revise PostEvent to 30.
    ...     - 27. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 28. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 29. Send the updatestudy.txt command using updatestudy.txt to revise PostEvent to 60.
    ...     - 30. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 31. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 32. Send the updatestudy.txt command using updatestudy.txt to revise PostEvent to 90.
    ...     - 33. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 34. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 35. Send the updatestudy.txt command using updatestudy.txt to revise PostEvent to 120.
    ...     - 36. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 37. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 38. Send the updatestudy.txt command using updatestudy.txt to revise PostEvent to 150.
    ...     - 39. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 40. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 41. Send the updatestudy.txt command using updatestudy.txt to revise PostEvent to 180.
    ...     - 42. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 43. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 44. Send the updatestudy.txt command using updatestudy.txt to revise BradyThresh to 0.
    ...     - 45. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 46. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 47. Send the updatestudy.txt command using updatestudy.txt to revise BradyThresh to 300.
    ...     - 48. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 49. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 50. Send the updatestudy.txt command using updatestudy.txt to revise TachyThresh to 0.
    ...     - 51. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 52. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 53. Send the updatestudy.txt command using updatestudy.txt to revise TachyThresh to 300.
    ...     - 54. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 55. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 56. Send the updatestudy.txt command using updatestudy.txt to revise PauseThresh to 1.
    ...     - 57. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 58. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 59. Send the updatestudy.txt command using updatestudy.txt to revise PauseThresh to 60000.
    ...     - 60. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 61. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 62. Send the updatestudy.txt command using updatestudy.txt to revise PauseDetection to 0.
    ...     - 63. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 64. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 65. Send the updatestudy.txt command using updatestudy.txt to revise PauseDetection to 1.
    ...     - 66. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 67. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 68. Send the updatestudy.txt command using updatestudy.txt to revise AfibDetection to 0.
    ...     - 69. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 70. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 71. Send the updatestudy.txt command using updatestudy.txt to revise AfibDetection to 1.
    ...     - 72. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 73. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 74. Send the updatestudy.txt command using updatestudy.txt to revise AlgorithmLead to 1.
    ...     - 75. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 76. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 77. Send the updatestudy.txt command using updatestudy.txt to revise AlgorithmLead to 2.
    ...     - 78. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 79. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 80. Send the updatestudy.txt command using updatestudy.txt to revise AlgorithmLead to 3.
    ...     - 81. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 82. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 83. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeBradyTachy to 0.
    ...     - 84. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 85. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 86. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeBradyTachy to 3600.
    ...     - 87. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 88. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 89. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeAfib to 0.
    ...     - 90. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 91. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 92. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeAfib to 3600.
    ...     - 93. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 94. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 95. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimePause to 0.
    ...     - 96. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 97. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 98. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimePause to 3600.
    ...     - 99. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 100. Verify the device doesn’t auto resume. The device still displays a "Pause” screen.
    ...     - 101. Send the updatestudy.txt command using updatestudy.txt to revise Duration to 1.
    ...     - 102. Within the device folder, locate the device acknowledgement of the most recent updatestudy command. Verify there is a file with the format:
    ...            updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 103. In WinSCP, refresh the view. Verify not there are any manual events with the reason “Resume”.
    ...     - 104. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 105. Upload HES annotation file by sending getann command.
    ...     - 106. Upload the device log by sending getlog command.
    ...     - 107. Erase study by sending erasestudy command.
    ...     - 108. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-COMM-29    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-30: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The device shall reject update study parameters if received with invalid study parameters.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          Auto=0
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
    ...     - 3. Wait for 2 minutes for study to get initiated on the device.
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Wait for 1 minute after study has started.
    ...     - 2. Send the updatestudy.txt command using updatestudy.txt to revise Duration to 0.
    ...     - 3. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 4. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 5. Send the updatestudy.txt command using updatestudy.txt to revise Duration to 43201.
    ...     - 6. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 7. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 8. Send the updatestudy.txt command using updatestudy.txt to revise PreEvent to 29.
    ...     - 9. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 10. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 11. Send the updatestudy.txt command using updatestudy.txt to revise PreEvent to 181.
    ...     - 12. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 13. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 14. Send the updatestudy.txt command using updatestudy.txt to revise PostEvent to 29.
    ...     - 15. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 16. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 17. Send the updatestudy.txt command using updatestudy.txt to revise PostEvent to 181.
    ...     - 18. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 19. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 20. Send the updatestudy.txt command using updatestudy.txt to revise BradyThresh to -1.
    ...     - 21. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 22. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 23. Send the updatestudy.txt command using updatestudy.txt to revise BradyThresh to 301.
    ...     - 24. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 25. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 26. Send the updatestudy.txt command using updatestudy.txt to revise TachyThresh to -1.
    ...     - 27. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 28. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 29. Send the updatestudy.txt command using updatestudy.txt to revise TachyThresh to 301.
    ...     - 30. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 31. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 32. Send the updatestudy.txt command using updatestudy.txt to revise PauseThresh to 0.
    ...     - 33. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 34. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 35. Send the updatestudy.txt command using updatestudy.txt to revise PauseThresh to 60001.
    ...     - 36. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 37. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 38. Send the updatestudy.txt command using updatestudy.txt to revise PauseDetection to -1.
    ...     - 39. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 40. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 41. Send the updatestudy.txt command using updatestudy.txt to revise PauseDetection to 2.
    ...     - 42. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 43. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 44. Send the updatestudy.txt command using updatestudy.txt to revise AfibDetection to -1.
    ...     - 45. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 46. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 47. Send the updatestudy.txt command using updatestudy.txt to revise AfibDetection to 2.
    ...     - 48. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 49. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 50. Send the updatestudy.txt command using updatestudy.txt to revise AlgorithmLead to 0.
    ...     - 51. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 52. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 53. Send the updatestudy.txt command using updatestudy.txt to revise AlgorithmLead to 4.
    ...     - 54. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 55. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 56. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeBradyTachy to -1.
    ...     - 57. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 58. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 59. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeBradyTachy to 3601.
    ...     - 60. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 61. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 62. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeAfib to -1.
    ...     - 63. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 64. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 65. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeAfib to 3601.
    ...     - 66. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 67. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 68. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimePause to -1.
    ...     - 69. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 70. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 71. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimePause to 3601.
    ...     - 72. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 73. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 74. Send stopstudy command to stop active study.
    ...           Upload the device log by sending getlog command. Keep the status of the study and continue to the case TC_COMM_132_TC02
    [Tags]  BFDV-COMM-30    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-31: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  If the device receives the “updatestudy” command after the study has been completed, the device shall provide a status of “REJECTED” along with the rejection reason of “Already stopped”.
    ...     Test Setup and Input:
    ...     Test Output:
    ...     - 1. Send the updatestudy.txt command using updatestudy.txt to revise AlgorithmLead to 2.
    ...     - 2. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 3. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 4. Send the updatestudy.txt command using updatestudy.txt to revise BradyThresh to 40.
    ...     - 5. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 6. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 7. Send the updatestudy.txt command using updatestudy.txt to revise TachyThresh to 160.
    ...     - 8. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 9. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 10. Send the updatestudy.txt command using updatestudy.txt to revise PauseThresh to 3500.
    ...     - 11. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 12. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 13. Send the updatestudy.txt command using updatestudy.txt to revise PreEvent to 60.
    ...     - 14. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 15. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 16. Send the updatestudy.txt command using updatestudy.txt to revise PostEvent to 60.
    ...     - 17. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 18. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 19. Send the updatestudy.txt command using updatestudy.txt to revise PauseDetection to 0.
    ...     - 20. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 21. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 22. Send the updatestudy.txt command using updatestudy.txt to revise AfibDetection to 0.
    ...     - 23. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 24. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 25. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeBradyTachy to 3000.
    ...     - 26. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 27. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 28. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeAfib to 3000.
    ...     - 29. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 30. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 31. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimePause to 3000.
    ...     - 32. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 33. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 34. Send the updatestudy.txt command using updatestudy.txt to revise Duration to 400.
    ...     - 35. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 36. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 37. Send the uploadstudy command using WinSCP.
    ...     - 38. Wait to finish the upload of the entire study.
    ...     - 39. Upload the device log by sending getlog command. Keep the status of the study and continue to the case TC_COMM_132_TC03
    [Tags]  BFDV-COMM-31    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-32: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  If the device receives the “updatestudy” command after the study has been uploaded, the device shall provide a status of “REJECTED” along with the rejection reason of “Already stopped”.
    ...     Test Setup and Input:
    ...     Test Output:
    ...     - 1. Send the updatestudy.txt command using updatestudy.txt to revise AlgorithmLead to 2.
    ...     - 2. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 3. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...          On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 4. Send the updatestudy.txt command using updatestudy.txt to revise BradyThresh to 40.
    ...     - 5. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 6. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...          On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 7. Send the updatestudy.txt command using updatestudy.txt to revise TachyThresh to 160.
    ...     - 8. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 9. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 10. Send the updatestudy.txt command using updatestudy.txt to revise PauseThresh to 3500.
    ...     - 11. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 12. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 13. Send the updatestudy.txt command using updatestudy.txt to revise PreEvent to 60.
    ...     - 14. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 15. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 16. Send the updatestudy.txt command using updatestudy.txt to revise PostEvent to 60.
    ...     - 17. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 18. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 19. Send the updatestudy.txt command using updatestudy.txt to revise PauseDetection to 0.
    ...     - 20. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 21. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 22. Send the updatestudy.txt command using updatestudy.txt to revise AfibDetection to 0.
    ...     - 23. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 24. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 25. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeBradyTachy to 3000.
    ...     - 26. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...           Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 27. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 28. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeAfib to 3000.
    ...     - 29. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...           Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 30. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 31. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimePause to 3000.
    ...     - 32. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...           Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 33. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 34. Send the updatestudy.txt command using updatestudy.txt to revise Duration to 400.
    ...     - 35. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...           Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 36. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 37. Send erasestudy command using WinSCP.
    ...     - 38. Verify device silently reboots after erasing study data.
    ...     - 39. Upload the device log by sending getlog command. Keep the status of the study and continue to the case TC_COMM_132_TC04
    [Tags]  BFDV-COMM-32    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-33: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  If the device receives the “updatestudy” command after the study has been erased, the device shall provide a status of “REJECTED” along with the rejection reason of “Already stopped”.
    ...     Test Setup and Input:
    ...     Test Output:
    ...     - 1. Send the updatestudy.txt command using updatestudy.txt to revise AlgorithmLead to 2.
    ...     - 2. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 3. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 4. Send the updatestudy.txt command using updatestudy.txt to revise BradyThresh to 40.
    ...     - 5. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 6. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 7. Send the updatestudy.txt command using updatestudy.txt to revise TachyThresh to 160.
    ...     - 8. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...          Verify there is a file with the format:
    ...          updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 9. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 10. Send the updatestudy.txt command using updatestudy.txt to revise PauseThresh to 3500.
    ...     - 11. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...           Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 12. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 13. Send the updatestudy.txt command using updatestudy.txt to revise PreEvent to 60.
    ...     - 14. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...           Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 15. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 16. Send the updatestudy.txt command using updatestudy.txt to revise PostEvent to 60.
    ...     - 17. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...           Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 18. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 19. Send the updatestudy.txt command using updatestudy.txt to revise PauseDetection to 0.
    ...     - 20. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...           Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 21. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 22. Send the updatestudy.txt command using updatestudy.txt to revise AfibDetection to 0.
    ...     - 23. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...           Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 24. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 25. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeBradyTachy to 3000.
    ...     - 26. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...           Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 27. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 28. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeAfib to 3000.
    ...     - 29. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...           Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 30. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 31. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimePause to 3000.
    ...     - 32. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...           Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 33. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 34. Send the updatestudy.txt command using updatestudy.txt to revise Duration to 400.
    ...     - 35. Within the device folder, locate the device rejection of the most recent updatestudy command.
    ...           Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 36. Using WinSCP, transfer the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Already stopped” is found.
    ...     - 37. Upload HES annotation file by sending getann command.
    ...     - 38. Upload the device log by sending getlog command.
    [Tags]  BFDV-COMM-33    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-34: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. If the device receives List ECG command; it shall provide the list of ECG records ready to be uploaded for the duration from List ECG Start Time to List ECG Stop Time asked in the command.
    ...     - 2. If the device receives List ECG command without the parameters List ECG Start Time and List ECG Stop Time, it shall provide the list of all ECG records ready to be uploaded.
    ...     - 3. If the device receives List ECG command and if the values for the parameters List ECG Start Time or List ECG Stop Time requested is outside the study duration, the device shall send a response status as “REJECTED” along with the rejection reason of “Invalid date/time”.
    ...     - 4. If the device receives List ECG command and if the values for the parameters List ECG Start Time newer over List ECG Stop Time requested is outside the study duration, the device shall send a response status as “REJECTED” along with the rejection reason of “Invalid parameter(s)”.
    ...     - 5. If the device receives List ECG command; and if there is no running study on device, the device shall send a response status as “REJECTED” along with the rejection reason of “Invalid date/time”.
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
    ...     - 3. Wait for 2 minutes for study to get initiated on the device.
    ...     - 4. Follow all the steps on the device display and then start the study
    ...     Test Output:
    ...     - 1. Wait for 5 minutes while the study is in progress.
    ...     - 2. Locate the listecg.txt file on the file system of the PC. Open the list ecg.txt file in a text editor, configure to obtain a most recent 5 minutes ECG records and send listecg command using WinSCP.
    ...          Confirm the file has the following structure:
    ...          File Line. Description. Data
    ...     - 1. Start Date of the record. “MM/DD/YYYY”
    ...     - 2. Start Time of the record. “HH:MM:SS” Time should be local device time.
    ...     - 3. Stop Date of the record. “MM/DD/YYYY”
    ...     - 4. Stop Time of the record. “HH:MM:SS” Time should be local device time.
    ...     - 5. Time Zone. 0 (should be local device time zone)
    ...     - 3. Within the device folder, locate the device acknowledgement of the listecg completed upload command.  Verify there are following files with format:
    ...          listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          Open “listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt” file and verify that there is only 1 record, following this format:
    ...          <startTimeStrRecord1>,<stopTimeStrRecord1>
    ...          <startTimeStrRecord2>,<stopTimeStrRecord2>
    ...          <startTimeStrRecordN>,<stopTimeStrRecordN>
    ...          TimeZone=<timeZone>
    ...          Confirm for SRS request No.1
    ...     - 4. Plug charger to the device and wait for 30 seconds. Then disconnect charger to the device and resume study.
    ...     - 5. Wait for additional 1 minutes
    ...     - 6. Locate the listecg.txt file on the file system of the PC. Open the list ecg.txt file in a text editor, configure to obtain a most recent 8s minutes ECG records and send listecg command using WinSCP.
    ...     - 7. Within the device folder, locate the device acknowledgement of the listecg completed upload command.  Verify there are following files with format:
    ...          listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          Open “listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt” file and verify that there are 2 records, following this format:
    ...          <startTimeStrRecord1>,<stopTimeStrRecord1>
    ...          <startTimeStrRecord2>,<stopTimeStrRecord2>
    ...          <startTimeStrRecordN>,<stopTimeStrRecordN>
    ...          TimeZone=<timeZone>
    ...          Confirm for SRS request No.1
    ...     - 8. Locate the listecg.txt file on the file system of the PC. Open the list ecg.txt file in a text editor, config without StartDateTime and StopDateTime specified, and send listecg command using WinSCP.
    ...     - 9. Within the device folder, locate the device acknowledgement of the listecg completed upload command.  Verify there are following files with format:
    ...          listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          Open “listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt” file and verify that there are 2 records, following this format:
    ...          <startTimeStrRecord1>,<stopTimeStrRecord1>
    ...          <startTimeStrRecord2>,<stopTimeStrRecord2>
    ...          <startTimeStrRecordN>,<stopTimeStrRecordN>
    ...          TimeZone=<timeZone>
    ...          Confirm for SRS request No.2
    ...     - 10. Locate the listecg.txt file on the file system of the PC. Open the listecg.txt file in a text editor, configure to obtain a most recent 5 minutes ECG records but make the StartTime and StopTime outside the study period send listecg command using WinSCP.
    ...           Confirm the file has the following structure:
    ...           File Line. Description. Data
    ...     - 1. Start Date of the record. “MM/DD/YYYY”
    ...     - 2. Start Time of the record. “HH:MM:SS” Time should be local device time.
    ...     - 3. Stop Date of the record. “MM/DD/YYYY”
    ...     - 4. Stop Time of the record. “HH:MM:SS” Time should be local device time.
    ...     - 5. Time Zone. 0 (should be local device time zone)
    ...          Confirm for SRS request No.3
    ...     - 11. Using WinSCP, transfer file listecgrejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid date/time” is found on this line.
    ...     - 12. Open the listecg.txt file in a text editor, configure to obtain a most recent 5 minutes ECG records but make the StartTime newer over the StopTime and send listecg command using WinSCP.
    ...           Confirm the file has the following structure:
    ...           File Line. Description. Data
    ...     - 1. Start Date of the record. “MM/DD/YYYY”
    ...     - 2. Start Time of the record. “HH:MM:SS” Time should be local device time.
    ...     - 3. Stop Date of the record. “MM/DD/YYYY”
    ...     - 4. Stop Time of the record. “HH:MM:SS” Time should be local device time.
    ...     - 5. Time Zone. 0 (should be local device time zone)
    ...          Confirm for SRS request No.4
    ...     - 13. Using WinSCP, transfer file listecg-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found on this line.
    ...     - 14. Send the stopstudy command to stop the active study.
    ...     - 15. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 16. Locate the listecg.txt file on the file system of the PC. Open the list ecg.txt file in a text editor, configure to obtain a most recent 10 minutes ECG records and send listecg command using WinSCP.
    ...     - 17. Within the device folder, locate the device acknowledgement of the listecg completed upload command.  Verify there are following files with format:
    ...           listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           Open “listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt” file and verify that there are 2 records, following this format:
    ...           <startTimeStrRecord1>,<stopTimeStrRecord1>
    ...           <startTimeStrRecord2>,<stopTimeStrRecord2>
    ...           <startTimeStrRecordN>,<stopTimeStrRecordN>
    ...           TimeZone=<timeZone>
    ...           Confirm for SRS request No.1
    ...     - 18. Upload HES annotation file by sending getann command.
    ...     - 19. Erase study by sending erasestudy command.
    ...     - 20. Verify device silently reboots after erasing study data.
    ...     - 21. Open the listecg.txt file in a text editor, configure to obtain a 5 minutes ECG records but make the StartTime and StopTime inside the study duration send listecg command using WinSCP.
    ...     - 22. Using WinSCP, transfer file listecg-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid date/time” is found on this line. Confirm for SRS request No.5
    ...     - 23. Upload the device log by sending getlog command.
    [Tags]  BFDV-COMM-34    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-35: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...          The device shall support the study to be performed in the Holter Mode in which a device will turn the modem off to save power when running the Holter study.
    ...     Description: Modem enters Sleeping state when there is no outbound traffic after 5 minutes interval
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
    ...     - 4. Follow all the steps on the device display and then start the study.
    ...     Test Output:
    ...     - 1. Make sure no press “Event” button on the device for about 5 minutes. .
    ...     - 2. Verify that the modem of the device shall be a turn-off and enter to the holter mode.
    ...     - 2. Press the “event” button once on the device.
    ...     - 3. Verify that the modem of the device shall be turn-on again.
    ...     - 4. Make sure no press “Event” button on the device for about 5 minutes. Verify that the modem of the device shall be a turn-off and enter to the holter mode.
    ...     - 5. Wait for to the beginning of every hour.
    ...     - 5. Verify that the modem of the device shall be turn-on at the beginning of every hour.
    ...     - 6. Send the updatestudy.txt command using updatestudy.txt to revise BradyThresh=40
    ...          TachyThresh=120
    ...          PauseDetection=1
    ...          AfibDetection=1.
    ...     - 7. Verify that the modem of the device always turn-on.
    ...     - 8. Send the updatestudy.txt command using updatestudy.txt to revise BradyThresh=1
    ...          TachyThresh=300
    ...          PauseDetection=0
    ...          AfibDetection=0.
    ...     - 9. Make sure no press “Event” button on the device for about 5 minutes. Verify that the the modem of the device shall be a turn-off and enter to the holter mode.
    ...     - 10. Wait for 15 minutes. Verify the device does not display the “Low Cell Signal” screen.
    ...     - 11. Send the stopstudy command to stop the active study.
    ...     - 12. Upload study data using the uploadstudy command.
    ...     - 13. Upload HES annotation file by sending getann command.
    ...     - 14. Upload the device log by sending getlog command.
    ...     - 15. Erase study by sending erasestudy command.
    ...     - 16. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-COMM-35    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-36: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. Modem remains its current state if the period from when device enter the holter mode to next periodic wakeup time is equal or less than 2 minutes
    ...     - 2. When device enter to the holter mode, device shall send device status to the server when modem of device turn-on
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
    ...     - 4. Follow all the steps on the device display and then start the study.
    ...     Test Output:
    ...     - 1. Wait for 1 minute to study started.
    ...     - 2. Press the “Event” button once on the device.
    ...     - 3. Verify that the the device send the device status file to the server.
    ...     - 4. Waiting for 5 minutes or more, press the “Event” button once on the device.
    ...     - 5. Verify that the the device send the device status file to the server. Confirm for SRS request No.2
    ...     - 6. Waiting for 3 minutes, press the “Event” button once on the device.
    ...     - 7. Verify that the the device doesn’t send the device status file to the server. Confirm for SRS request No.2
    ...     - 8. If the period from the current time to the complete hour is 7 minutes, press “Event” button and send some symptom.
    ...     - 9. Wait for 5 minutes and make sure no press “Event” button on the device. Verify that the modem of the device shall not be turned off.
    ...     - 10. Wait till the beginning of next hour. Verify that the modem of the device keeps staying awake. Confirm for SRS request No.1
    ...     - 11. Wait for 5 minutes. Verify the device shall enter the holter mode.
    ...     - 12. Send the stopstudy command to stop the active study.
    ...     - 13. Upload study data using the uploadstudy command.
    ...     - 14. Upload HES annotation file by sending getann command.
    ...     - 15. Upload the device log by sending getlog command.
    ...     - 16. Erase study by sending erasestudy command.
    ...     - 17. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-COMM-36    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-37: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...          The users shall not be allowed to turn the device off while the study is still ongoing.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          Auto=0
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
    ...     - 3. Wait for 2 minutes for study to get initiated on the device.
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Wait for 2 minutes while the study is in progress.
    ...     - 2. Press and hold “Power” button in 3 seconds or more
    ...     - Verify that device does not show Power Off Confirmation screen.
    ...     - 3. Send the stopstudy command to stop the active study.
    ...     - 4. Press and hold “Power” button in 3 seconds or more
    ...          Verify that device does not show Power Off Confirmation screen.
    ...     - 5. Send the upload study command.
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the upload study command.
    ...          Verify there is a file with the format
    ...          uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 7. Press and hold “Power” button in 3 seconds or more
    ...          Verify that device does not show Power Off Confirmation screen.
    ...     - 8. Upload HES annotation file by sending getann command.
    ...     - 9. Upload the device log by sending getlog command.
    ...     - 10. Erase study by sending the erasestudy command.
    ...     - 12. Verify device silently reboots after erasing study data.
    ...     - 12. Press and hold “Power” button in 3 seconds or more
    ...          Verify that device shows Power Off Confirmation screen.
    [Tags]  BFDV-COMM-37    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFDV-COMM-38: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: If a device is in the Paused State & study reaches its completion time, the study will be auto completed
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          Auto=0
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
    ...     - 3. Wait for 2 minutes for study to get initiated on the device.
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Wait for 1 minute while the study is in progress
    ...     - 2. Long press both Power Key and Event Key for 5s to quick power off.
    ...     - 3. Wait for 4 minutes and turn the device on.
    ...     - 4. Verify that the device display “Study completed” screen after the power up sequence is completed.
    ...     - 5. Send the upload study command.
    ...     - 6. Upload HES annotation file by sending getann command.
    ...     - 7. Upload the device log by sending getlog command.
    ...     - 8. Erase study by sending the erasestudy command.
    ...     - 9. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-COMM-38    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-39: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          Auto=0
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
    ...     - 3. Wait for 2 minutes for study to get initiated on the device.
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Wait for 1 minute while the study is in progress
    ...     - 2. Plug charger to the device in 30 seconds. Then unplug charger from device.
    ...     - 3. Make sure don't press "Resume start" button on the device
    ...     - Verify that the device display “Study completed” screen at the 4th minutes.
    ...     - 4. Send the upload study command.
    ...     - 5. Upload HES annotation file by sending getann command.
    ...     - 60. Upload the device log by sending getlog command.
    ...     - 7. Erase study by sending the erasestudy command.
    ...     - 8. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-COMM-39    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-40: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...          The device shall clear its internal state and re-synchronize RTC time from network after erasing the study data.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          Auto=0
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
    ...     - 3. Wait for 2 minutes for study to get initiated on the device.
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Wait for 1 minute and send the stopstudy command to stop the active study
    ...     - 2. Using WinSCP, send the uploadstudy command.
    ...     - 3. Wait to finish the upload of the entire study.
    ...     - 4. Upload HES annotation file by sending getann command.
    ...     - 5. Upload the device log by sending getlog command.
    ...     - 6. Using WinSCP, send the erasestudy command.
    ...     - 7. Wait for a few seconds. Verify device auto reboot after erasing study.
    ...     - 8. When device auto reboot, the device does not display “Goodbye” screen ,not vibrate and not beep.
    ...     - 9. Verify that the device shall power-on again but does not display the “Power-on” screen and enter the waiting for study state.
    [Tags]  BFDV-COMM-40    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-41: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...          The device shall send device status file based on the device status update time setting
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Verify that the device sends the device-status.txt file to the server every five minutes.
    ...     - 2. Using Bioflux Device Monitor software. Issue the command below to set device status time for the device
    ...          SM+UPDATETIME=3.
    ...     - 3. Using Bioflux Device Monitor software. Issue the command below to reboot the device
    ...          SM+REBOOT.
    ...     - 4. Waiting for the device power-up sequence is completed.
    ...     - 5. Verify that the device send the device-status.txt file to the server every 3 minutes.
    [Tags]  BFDV-COMM-41    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-42: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. If study status is "setting up" and upon receiving the server abortstudy command, device software shall respond to the server along with aborting successful
    ...     - 2. If study status is not "setting up" and upon receiving the server abortstudy command, device software shall respond to the server along with the rejection reason of “No pending study”.
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
    ...     Test Output:
    ...     - 1. Using WinSCP, send abortstudy command to "user" directory.
    ...     - 2. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the abortstudy command.
    ...          Verify there is a file with the format
    ...          abortstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.1
    ...     - 3. Using WinSCP, transfer the following file to a local folder on the PC and open in text editor.
    ...          abortstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 4. On the last line of the text file, verify the text .
    ...          “AbortedTime=<mm/dd/yyyy hh:mm:ss +timezone”is found on this line.
    ...     - 5. Initiate the Start Study command with the parameters below:
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
    ...          NoiseTimePause=60.
    ...     - 6. Wait for 1 minute for study to get initiated on the device.
    ...     - 7. Follow all the steps on the device screen and then start the study.
    ...     - 8. Using WinSCP, send abort study command to "user" directory.
    ...     - 9. In WinSCP, refresh the view. Within the device folder, locate the device rejection of the abort study command.
    ...          Verify there is a file with the format
    ...          abortstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.2
    ...     - 10. Using WinSCP, transfer the following file to a local folder on the PC and open in text editor
    ...           abortstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           On the last line of the text file, verify the text “RejectedReason= “No pending study”” is found on this line.
    ...     - 11. Send the stop study command to stop the active study.
    ...     - 12. Using WinSCP, send abort study command to "user" directory.
    ...     - 13. In WinSCP, refresh the view. Within the device folder, locate the device rejection of the abort study command.
    ...           Verify there is a file with the format
    ...           abortstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.2
    ...     - 14. Using WinSCP, transfer the following file to a local folder on the PC and open in text editor
    ...     - abortstudy-rejected -mm-dd-yy-hh-mm-ss+timezone.txt
    ...           On the last line of the text file, verify the text “RejectedReason= “No pending study”” is found on this line.
    ...     - 15. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 16. Using WinSCP, send abort study command to "user" directory.
    ...     - 17. In WinSCP, refresh the view. Within the device folder, locate the device rejection of the abort study command.
    ...           Verify there is a file with the format
    ...           abortstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.2
    ...     - 18. Using WinSCP, transfer the following file to a local folder on the PC and open in text editor
    ...     - abortstudy-rejected -mm-dd-yy-hh-mm-ss+timezone.txt
    ...           On the last line of the text file, verify the text “RejectedReason= “No pending study”” is found on this line.
    ...     - 19. Erase study by sending the erasestudy command.
    ...     - 20. Verify device silently reboots after erasing study data.
    ...     - 21. Using WinSCP, send abort study command to "user" directory.
    ...     - 22. In WinSCP, refresh the view. Within the device folder, locate the device rejection of the abortstudy command.
    ...           Verify there is a file with the format
    ...           abortstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.2
    ...     - 23. Using WinSCP, transfer the following file to a local folder on the PC and open in text editor.
    ...           abortstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           On the last line of the text file, verify the text "RejectedReason= "No pending study"" is found on this line.
    ...     - 24. Upload the device log by sending getlog command.
    [Tags]  BFDV-COMM-42    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-43: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. Upon receiving the server “reboot” command, device software shall reboot and respond to the server along with reboot successful.
    ...     - 2. Upon receiving the randomcmd command, device software shall respond to the server along with the rejection reason of "Unsupported command – <Command ID>".
    ...     - 3. Upon receiving the server getversion command, device software shall respond to the server with version info.
    ...     - 4. Verify that after 5 minutes without successfully connecting to server, device shall reboot modem to reset network.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. PatientId=123456
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
    ...     Test Output:
    ...     - 1. Using WinSCP, send reboot command to "user" directory.
    ...     - 2. Verify bioflux device is rebooted.
    ...     - 3. Wait for the device to connect to the network successfully.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the reboot command.
    ...          Verify there is a file with the format
    ...          reboot-done-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.1
    ...     - 5. Send the stop study command to stop the active study.
    ...     - 6. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 7. Erase study by sending the erasestudy command.
    ...     - 8. Verify device silently reboots after erasing study data.
    ...     - 9. Using WinSCP, send reboot command to "user" directory.
    ...     - 10. Verify bioflux device is rebooted.
    ...     - 11. Wait for the device to connect to the network successfully.
    ...     - 12. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the reboot command.
    ...           Verify there is a file with the format
    ...           reboot-done-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.1
    ...     - 13. Using WinSCP, send randomcmd command to "user" directory.
    ...     - 14. In WinSCP, refresh the view. within the device folder, locate the device rejection of the abort study command.
    ...           Verify there is a file with the format
    ...           randomcmd-rejected-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.2
    ...     - 15. Using WinSCP, transfer the following file to a local folder on the PC and open in text editor.
    ...           randomcmd-rejected -mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 16. On the last line of the text file, verify the text “RejectedReason= "Unsupported command – RandomCommand" is found on this line.
    ...     - 17. Using WinSCP, send getversion command to "user" directory.
    ...     - 18. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getversion command.
    ...           Verify there is a file with the format
    ...           getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.3
    ...     - 19. Using WinSCP, transfer the following file to a local folder on the PC and open in text editor.
    ...           getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 20. Verify the 4 lines with contents following:
    ...           “hw=<hwVersion”
    ...           “fw=<fwVersion>”
    ...           “bl=<blVersion>”
    ...           “cks=<fwCKs>”.
    ...     - 21. Connect the device to the device monitor program. Then use the following SM command to the device can’t connected to server.
    ...           SM+SSL=0
    ...           SM+TCPSERVER=52.221.128.239,8804,120.
    ...     - 22. Wait 5 minutes.
    ...     - 23. Verify the device's modem is rebooted.
    ...     - 24. Using WinSCP, send getlog command to "user" directory.
    ...     - 25. Using WinSCP, transfer the following file to a local folder on the PC and open in text editor.
    ...     - log-daily-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.4
    ...     - 26. Verify the text " Generate a timeout event to reboot modem " is found.
    [Tags]  BFDV-COMM-43    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-44: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: Verify it is unable to power on device when battery level is below the Battery Critical Threshold.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. If the device's battery level is around 80% or lower. Please continue to step 2.
    ...     - 2. Connect the device to monitor program. Then use the following SM command to set Battery Low Threshold to current battery level +12%, and Battery Critical Threshold to current battery level + 2%,  for device:
    ...          SM+BATT=<current battery level +12%> , <current battery level + 2%>.
    ...     - 3. Disconnect the device to monitor program and wait until the device turns off completely.
    ...     - 4. Try power on the device by pressing and holding the Home button for 10 seconds.
    ...     - 5. Verify the device only vibrates but won't power on.
    ...     - 6. Connect the device for charging and power on the device.
    ...     - 7. Upload the device log by sending getlog command.
    [Tags]  BFDV-COMM-44    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-45: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: Verify that the device still generates reports hourly when the ECG signal is asystole.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=120
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
    ...     - 5. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Waiting until the start of the next hour.
    ...     - 2. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement.
    ...          Verify there is a file with the format
    ...     - report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 3. Send the stopstudy command to stop the active study.
    ...     - 4. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 5. Upload HES annotation file by sending getann command.
    ...     - 6. Upload the device log by sending getlog command.
    ...     - 7. Erase study by sending erasestudy command.
    ...     - 8. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-COMM-45    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-46: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: Verify value range of study parameters.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Send the startstudy.txt command with data of PatientId parameter as empty:
    ...          PatientId=EMPTY – no data
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
    ...          NoiseTimePause=60.
    ...     - 2. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...          Verify there is a file with the format:
    ...          starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 3. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 4. Send the startstudy.txt command with data of PatientId parameter as 32 charaters:
    ...          PatientId=01234567890123456789012345678901
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
    ...          NoiseTimePause=60.
    ...     - 5. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...          Verify there is a file with the format:
    ...          starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 6. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 7. Send the startstudy.txt command with data of PatientName parameter as empty:
    ...          PatientId=123456
    ...          PatientName=Empty- no data
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
    ...          NoiseTimePause=60.
    ...     - 8. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...          Verify there is a file with the format:
    ...          starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 9. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 10. Send the startstudy.txt command with data of PatientName parameter as 64 charaters:
    ...          PatientId=123456
    ...          PatientName= aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbb ccccccccc dddddddd eeee
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
    ...          NoiseTimePause=60.
    ...     - 11. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...           Verify there is a file with the format:
    ...           starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 12. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 13. Send the startstudy.txt command with data of Duration parameter as 0:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=0
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
    ...          NoiseTimePause=60.
    ...     - 14. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...          Verify there is a file with the format:
    ...          starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 15. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 16. Send the startstudy.txt command with data of Duration parameter as 43201:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=43201
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
    ...          NoiseTimePause=60.
    ...     - 17. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...          Verify there is a file with the format:
    ...          starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 18. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 19. Send the startstudy.txt command with data of PreEvent parameter as 29:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=29
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 20. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...          Verify there is a file with the format:
    ...          starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 21. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 22. Send the startstudy.txt command with data of PostEvent parameter as 29:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=29
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 23. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...          Verify there is a file with the format:
    ...          starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 24. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 25. Send the startstudy.txt command with data of BradyThresh parameter as -1:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=-1
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 26. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...          Verify there is a file with the format:
    ...          starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 27. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 28. Send the startstudy.txt command with data of BradyThresh parameter as 301:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=301
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 29. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...           Verify there is a file with the format:
    ...           starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 30. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 31. Send the startstudy.txt command with data of TachyThresh parameter as -1:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=-1
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 32. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...           Verify there is a file with the format:
    ...           starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 33. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 34. Send the startstudy.txt command with data of TachyThresh parameter as 301:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=301
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 35. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...           Verify there is a file with the format:
    ...           starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 36. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 37. Send the startstudy.txt command with data of PauseThresh parameter as 0:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=0
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 38. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...           Verify there is a file with the format:
    ...           starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 39. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 40. Send the startstudy.txt command with data of PauseThresh parameter as 60001:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=60001
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 41. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...           Verify there is a file with the format:
    ...           starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 42. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 43. Send the startstudy.txt command with data of PauseDetection parameter as -1:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=-1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 44. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...           Verify there is a file with the format:
    ...           starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 45. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 46. Send the startstudy.txt command with data of PauseDetection parameter as 2:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=2
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 47. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...           Verify there is a file with the format:
    ...           starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 48. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 49. Send the startstudy.txt command with data of AfibDetection parameter as -1:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=-1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 50. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...           Verify there is a file with the format:
    ...           starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 51. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 52. Send the startstudy.txt command with data of AfibDetection parameter as 2:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=2
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 53. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...           Verify there is a file with the format:
    ...           starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 54. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 55. Send the startstudy.txt command with data of AlgorithmLead parameter as 0:
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
    ...          AlgorithmLead=0
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 56. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...           Verify there is a file with the format:
    ...           starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 57. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 58. Send the startstudy.txt command with data of AlgorithmLead parameter as 4:
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
    ...          AlgorithmLead=4
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 59. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...           Verify there is a file with the format:
    ...           starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 60. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 61. Send the startstudy.txt command with data of NoiseTimeBradyTachy parameter as -1:
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
    ...          NoiseTimeBradyTachy=-1
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 62. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...           Verify there is a file with the format:
    ...           starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 63. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 64. Send the startstudy.txt command with data of NoiseTimeBradyTachy parameter as 3601:
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
    ...          NoiseTimeBradyTachy=3601
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 65. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...           Verify there is a file with the format:
    ...           starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 66. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 67. Send the startstudy.txt command with data of NoiseTimeAfib parameter as -1:
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
    ...          NoiseTimeAfib=-1
    ...          NoiseTimePause=60.
    ...     - 68. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...           Verify there is a file with the format:
    ...           starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 69. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 70. Send the startstudy.txt command with data of NoiseTimeAfib parameter as 3601:
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
    ...          NoiseTimeAfib=3601
    ...          NoiseTimePause=60.
    ...     - 71. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...           Verify there is a file with the format:
    ...           starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 72. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 73. Send the startstudy.txt command with data of NoiseTimePause parameter as -1:
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
    ...          NoiseTimePause=-1.
    ...     - 74. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...           Verify there is a file with the format:
    ...           starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 75. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 76. Send the startstudy.txt command with data of NoiseTimePause parameter as 3601:
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
    ...          NoiseTimePause=3601.
    ...     - 77. Within the device folder, locate the device rejection of the most recent startstudy command.
    ...           Verify there is a file with the format:
    ...           starstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 78. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid parameter(s)” is found.
    ...     - 79. Upload the device log by sending getlog command.
    [Tags]  BFDV-COMM-46    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-47: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Send the startstudy.txt command with data of PatientId parameter as 1 charater:
    ...          PatientId=1
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
    ...          NoiseTimePause=60.
    ...     - 2. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...          startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 3. On the Study Details Screen, locate the Abort button.
    ...          Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 4. Send the startstudy.txt command with data of PatientId parameter as 31 charaters:
    ...          PatientId=0123456789012345678901234567890
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
    ...          NoiseTimePause=60.
    ...     - 5. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...          startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 6. On the Study Details Screen, locate the Abort button.
    ...          Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 7. Send the startstudy.txt command with data of PatientName parameter as 1 charater:
    ...          PatientId=123456
    ...          PatientName=J
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
    ...          NoiseTimePause=60.
    ...     - 8. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...          startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 9. On the Study Details Screen, locate the Abort button.
    ...          Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 10. Send the startstudy.txt command with data of PatientName parameter as 63 charaters:
    ...          PatientId=123456
    ...          PatientName=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbb ccccccccc dd
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
    ...          NoiseTimePause=60.
    ...     - 11. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 12. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 13. Send the startstudy.txt command with data of Duration parameter as 1:
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
    ...          NoiseTimePause=60.
    ...     - 14. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 15. On the Study Details Screen, locate the Abort button.
    ...          Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 16. Send the startstudy.txt command with data of Duration parameter as 43200:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=43200
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
    ...          NoiseTimePause=60.
    ...     - 17. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 18. On the Study Details Screen, locate the Abort button.
    ...          Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 19. Send the startstudy.txt command with data of PreEvent parameter as 30:
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
    ...          NoiseTimePause=60.
    ...     - 20. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 21. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 22. Send the startstudy.txt command with data of PreEvent parameter as 60:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=60
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 23. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 24. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 25. Send the startstudy.txt command with data of PreEvent parameter as 90:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=90
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 26. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 27. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 28. Send the startstudy.txt command with data of PreEvent parameter as 120:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=120
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 29. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 30. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 31. Send the startstudy.txt command with data of PreEvent parameter as 150:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=150
    ...          PostEvent=30
    ...          BradyThresh=150
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 32. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 33. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 34. Send the startstudy.txt command with data of PreEvent parameter as 180:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=180
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 35. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 36. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 37. Send the startstudy.txt command with data of PostEvent parameter as 30:
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
    ...          NoiseTimePause=60.
    ...     - 38. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 39. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 40. Send the startstudy.txt command with data of PostEvent parameter as 60:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=60
    ...          PostEvent=60
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 41. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 42. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 43. Send the startstudy.txt command with data of PostEvent parameter as 90:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=90
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 44. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 45. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 46. Send the startstudy.txt command with data of PostEvent parameter as 120:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=120
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 47. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 48. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 49. Send the startstudy.txt command with data of PostEvent parameter as 150:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=150
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 50. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 51. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 52. Send the startstudy.txt command with data of PostEvent parameter as 180:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=180
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 53. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 54. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 55. Send the startstudy.txt command with data of BradyThresh parameter as 0:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=0
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 56. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 57. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 58. Send the startstudy.txt command with data of BradyThresh parameter as 300:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=300
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 59. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 60. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 61. Send the startstudy.txt command with data of TachyThresh parameter as 0:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=0
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 62. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 63. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 64. Send the startstudy.txt command with data of TachyThresh parameter as 300:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=300
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 65. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 66. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 67. Send the startstudy.txt command with data of PauseThresh parameter as 1:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=1
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 68. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 69. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 70. Send the startstudy.txt command with data of PauseThresh parameter as 60000:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=60000
    ...          PauseDetection=1
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 71. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 72. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 73. Send the startstudy.txt command with data of PauseDetection parameter as 0:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=0
    ...          AfibDetection=1
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 74. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 75. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 76. Send the startstudy.txt command with data of PauseDetection parameter as 1:
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
    ...          NoiseTimePause=60.
    ...     - 77. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 78. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 79. Send the startstudy.txt command with data of AfibDetection parameter as 0:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=5
    ...          PreEvent=30
    ...          PostEvent=30
    ...          BradyThresh=60
    ...          TachyThresh=120
    ...          PauseThresh=2500
    ...          PauseDetection=1
    ...          AfibDetection=0
    ...          AlgorithmLead=1
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 80. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 81. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 82. Send the startstudy.txt command with data of AfibDetection parameter as 1:
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
    ...          NoiseTimePause=60.
    ...     - 83. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 84. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 85. Send the startstudy.txt command with data of AlgorithmLead parameter as 1:
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
    ...          NoiseTimePause=60.
    ...     - 86. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 87. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 88. Send the startstudy.txt command with data of AlgorithmLead parameter as 2:
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
    ...          AlgorithmLead=2
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 89. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 90. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 91. Send the startstudy.txt command with data of AlgorithmLead parameter as 3:
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
    ...          AlgorithmLead=3
    ...          NoiseTimeBradyTachy=600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 92. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 93. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 94. Send the startstudy.txt command with data of NoiseTimeBradyTachy parameter as 0:
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
    ...          NoiseTimeBradyTachy=0
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 95. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 95. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 96. Send the startstudy.txt command with data of NoiseTimeBradyTachy parameter as 3600:
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
    ...          NoiseTimeBradyTachy=3600
    ...          NoiseTimeAfib=600
    ...          NoiseTimePause=60.
    ...     - 97. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 98. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 99. Send the startstudy.txt command with data of NoiseTimeAfib parameter as 0:
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
    ...          NoiseTimeAfib=0
    ...          NoiseTimePause=60.
    ...     - 100. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 101. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 102. Send the startstudy.txt command with data of NoiseTimeAfib parameter as 3600:
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
    ...          NoiseTimeAfib=3600
    ...          NoiseTimePause=60.
    ...     - 103. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...            startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 104. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 105. Send the startstudy.txt command with data of NoiseTimePause parameter as 0:
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
    ...          NoiseTimePause=0.
    ...     - 106. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 107. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 108. Send the startstudy.txt command with data of NoiseTimePause parameter as 3600:
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
    ...          NoiseTimePause=3600.
    ...     - 109. Within the user folder, locate the device acknowledgement of the startstudy command.  Verify there is a file with the format
    ...           startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 110. On the Study Details Screen, locate the Abort button.
    ...           Tap the Abort button. Then press “Yes” on “Confirm” screen.
    ...     - 111. Upload the device log by sending getlog command.
    [Tags]  BFDV-COMM-47    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-COMM-48: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Locate the switchserver.txt file on the file system of the PC.  Open the switchserver.txt file in a text editor, configure to switch to new server “save” parameter as 0.
    ...     - 2. Using WinSCP, send switchserver command to "user" directory.
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the switchserver command.
    ...          Verify there is a file with the format
    ...          switchserver-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 4. Use following SM command to reboot device:
    ...          SM+REBOOT.
    ...     - 5. Verify the device do not switch to new server.
    ...     - 6. Locate the switchserver.txt file on the file system of the PC.  Open the switchserver.txt file in a text editor, configure to switch to new server “save” parameter as 1.
    ...     - 7. Using WinSCP, send switchserver command to "user" directory.
    ...     - 8. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the switchserver command.
    ...          Verify there is a file with the format
    ...          switchserver-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 9. Use following SM command to reboot device:
    ...          SM+REBOOT.
    ...     - 10. Verify the device switch to new server.
    ...     - 11. Locate the switchserver.txt file on the file system of the PC.  Open the switchserver.txt file in a text editor, delete one or more parameter.
    ...     - 12. Using WinSCP, send switchserver command to "user" directory.
    ...     - 13. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the switchserver command.
    ...           Verify there is a file with the format
    ...           switchserver-reject-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 14. Locate the switchserver.txt file on the file system of the PC.  Open the switchserver.txt file in a text editor, config “port” parameter less than 0.
    ...     - 15. Using WinSCP, send switchserver command to "user" directory.
    ...     - 16. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the switchserver command.
    ...           Verify there is a file with the format
    ...           switchserver-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 17. Locate the switchserver.txt file on the file system of the PC.  Open the switchserver.txt file in a text editor, config “port” parameter greater than 65565.
    ...     - 18. Using WinSCP, send switchserver command to "user" directory.
    ...     - 19. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the switchserver command.
    ...           Verify there is a file with the format
    ...           switchserver-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 20. Locate the switchserver.txt file on the file system of the PC.  Open the switchserver.txt file in a text editor, config “ka” parameter less than 0.
    ...     - 21. Using WinSCP, send switchserver command to "user" directory.
    ...     - 22. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the switchserver command.
    ...           Verify there is a file with the format
    ...           switchserver-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 23. Locate the switchserver.txt file on the file system of the PC.  Open the switchserver.txt file in a text editor, config “ka”  parameter greater than 3600.
    ...     - 24. Using WinSCP, send switchserver command to "user" directory.
    ...     - 25. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the switchserver command.
    ...           Verify there is a file with the format
    ...           switchserver-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 26. Upload the device log by sending getlog command.
    [Tags]  BFDV-COMM-48    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library      project_bioheart_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${URL}  Get Config Param    WEB_BASE_URL
    Open Page  ${URL}

SUITE TEARDOWN
    Quit Browser