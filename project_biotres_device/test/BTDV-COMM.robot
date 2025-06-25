*** Settings ***
Documentation   Biotres device communication verification test suite
Metadata        sid     BTDV-COMM
Metadata        owner   Nang Phung
Library         corelib/AssertionExtension.py
Library         corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}

Force Tags      BTDV-COMM       device
Test Timeout    1h

*** Test Cases ***
BTDV-COMM-01: Communications between Biotres device and server.
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: Communications between Biotres device and server are supported by a gateway via Bluetooth connection.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Open WinSCP client (Open source SFTP client for Windows; used for file transfers between a host and a remote server) and set the following values:
    ...          Choose file transfer protocol as FTP.
    ...          Choose encryption as TLS\SSL Explicit Encryption.
    ...          SET Host IP equal to 52.8.168.226 and Port equal to 21.
    ...          Enter username and password to securely log in to the remote server.
    ...          Once logged in successfully, create a new folder named as device id.
    ...          Once device folder is created, create two subfolders names as “user” (i.e. from users) and “server” (from server).
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
    ...     - 5. Press and hold the “Event” button on device for 5 seconds to start study
    ...     Test Output:
    ...     - 1. Wait for 5 minutes to ensure that the device has completed the study successfully.
    ...     - 2. Send the upload study command.
    ...     - 3. Wait for 10 minutes to finish upload of the entire study.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the upload study command.
    ...          Verify there is a file with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 5. In WinSCP, refresh the view. Within the device folder, verify there are 2 data files with the format:
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 6. Using WinSCP, send the getlog command.
    ...     - 7. Erase study by sending the erasestudy command.
    [Tags]  BTDV-COMM-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-02: Confirm result
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description: Device software shall be able to receive the following commands from the server:
    ...     - 1. Start Study.
    ...     - 2. Stop Study.
    ...     - 3. Upload Study Data.
    ...     - 4. Erase Study.
    ...     - 5. Abort Study.
    ...     - 6. Get ECG Record List.
    ...     - 7. Get ECG Record (start time and stop time to be provided).
    ...     - 8. Update Study.
    ...     - 9. Getloglist.
    ...     - 10. GetLog.
    ...     - 11. Reboot device.
    ...     - 12. Getannsegment.
    ...     - 13. Getann.
    ...     - 14. Download Firmware.
    ...     - 15. Validate Firmware.
    ...     - 16. Clone Firmware.
    ...     - 17. Update Firmware.
    ...     - 18. Getversion.
    ...     - 19. Unsupported command.
    ...     Test Setup and Input:
    ...     Test Output:
    ...     - 1. Verify there is a file with the format: startstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 3 of case TC_COMM_076_TC01)
    ...     - 2. Verify there is a file with the format: stopstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 5 of case TC_COMM_076_TC01)
    ...     - 3. Verify there is a file with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 7 of case TC_COMM_079_TC01)
    ...     - 4. Verify there is a file with the format: erasestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 13 of case TC_COMM_098_TC01)
    ...     - 5. Verify there are 2 files with the format: abortstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt, startstudy-aborted-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 4 of case TC_COMM_1318_TC01)
    ...     - 6. Verify there is a file with the format: listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 3 of case TC_COMM_082_TC01)
    ...     - 7. Verify there is a file with the format: getecg-done-mm-dd-yy-hh-mm-ss+timezone.txt	(Refer to the result from step 3 of case TC_COMM_087_TC01)
    ...     - 8. Verify there is a file with the format: updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 7 of case TC_COMM_079_TC01)
    ...     - 9. Verify there is a file with the format: getloglist-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 5 of case TC_COMM_101_TC01)
    ...     - 10. Verify there is a file with the format: getlog-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 6 of case TC_COMM_102_TC01)
    ...     - 11. Verify there is a file with the format: reboot-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 2 of case TC_COMM_1316_TC01)
    ...     - 12. Verify there is a file with the format: getannsement-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 4 of case TC_COMM_1320_TC01)
    ...     - 13. Verify there is a file with the format: getann-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 16 of case TC_COMM_1321_TC01)
    ...     - 14. Verify there is a file with the format: downloadfile-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 9 of case TC_COMM_105_TC01)
    ...     - 15. Verify there is a file with the format: validatefile-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 4 of case TC_COMM_106_TC01)
    ...     - 16. Verify there is a file with the format: clonefw-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 6 of case TC_COMM_108_TC01)
    ...     - 17. Verify there is a file with the format: updatefw-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 5 of case TC_COMM_112_TC01)
    ...     - 18. Verify there is a file with the format: getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 2 of case TC_COMM_114_TC01)
    ...     - 19. Verify there is a file with the format: randomcmd-rejected-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 13 of case TC_COMM_1317_TC01)

    [Tags]  BTDV-COMM-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-03: Verify status values when send start study command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. When the authorized User chooses to abort the study, the device software shall provide a response status of “ABORTED”.
    ...     - 2. Upon detecting that the format or data in the server command is not valid, the device software shall provide a response status of “REJECTED” along with the rejection reason of “Invalid parameter(s)”.
    ...     - 3. If the device receives the “startstudy” command, the Device shall enter the study setup and provide a response status of “PROCESSING”.
    ...     - 4. When the authorized user finishes the study setup and chooses to start the study, the device shall begin an active study and provide a response of “DONE”.
    ...     - 5. If the device is under active study and the “startstudy” command is received, the Device shall provide a response status of “REJECTED” along with the rejection reason being “Study is in progress”.
    ...     - 6. If the device is completed and the “startstudy” command is received, the Device shall provide a response status of “REJECTED” along with the rejection reason being “Study has not uploaded”.
    ...     - 7. If the device is uploaded and the “startstudy” command is received, the Device shall provide a response status of “REJECTED” along with the rejection reason being “Study has not erased”.
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
    ...     Test Output:
    ...     - 1. Within the user folder, locate the device acknowledgement of the start study command. Verify there is a file with the format: startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 2. Press & hold the “Event” and the “Power” button to abort study.
    ...     - 3. In WinSCP, within the device folder, locate the device rejection of the start study command. Verify there is 1 file with the format: startstudy-aborted-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 4. Initiate the Start Study command with the parameters below:
    ...          PatientId=EMPTY – no data
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
    ...     - 5. Wait for 1 minute for study to get started.
    ...     - 6. Within the device folder, locate the device rejection of the start study command. Verify there is a file with the format: startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 7. Using WinSCP, transfer the file startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt identified in previous step, to a local folder on the PC and open the file using a text editor.
    ...          On the last line of the text file, verify the text “Invalid parameter(s)“ is found on this line.
    ...     - 8. Initiate the Start Study command with the parameters below:
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
    ...     - 9. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     - 10. In WinSCP, locate the device acknowledgement of the most recent startstudy command. Verify there is a file with the format: startstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 11. Using WinSCP, transfer file startstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “StartTime=<exact study start date time in mm/dd/yyy hh:mm:ss with timezone>” is found on this line.
    ...           Make a note of start datetime from startstudy-done.txt
    ...     - 12. Once the study is started, send startstudy.txt command.
    ...     - 13. In WinSCP, refresh the view. Within the device folder, locate the device rejection of the most recent start study command.
    ...           Verify there is a file with the format: startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 14. Open the file in text editor. On the last line of the text file, verify the text “Study is in progress” is found.
    ...     - 15. Wait for study complete, send startstudy.txt command.
    ...     - 16. Within the device folder, locate the device rejection of the most recent start study command. Verify there is a file with the format: startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 17. Open the file in text editor. On the last line of the text file, verify the text “Study has not uploaded” is found.
    ...     - 18. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 19. Within the device folder, locate the device rejection of the most recent start study command. Verify there is a file with the format: startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 20. Open the file in text editor. On the last line of the text file, verify the text “Study has not erased” is found.
    ...     - 21. Using WinSCP, send getlog command.
    ...     - 22. Erase study by sending the erasestudy command.
    [Tags]  BTDV-COMM-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-04: Device shall enter the waiting for study state
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: Once the power up sequence is completed, device shall enter the waiting for study state.
    ...     Test Setup and Input:
    ...     - 1. Make sure the device was turned off after the last study. If not turn off the device by pressing and holding the Home button for 10 seconds.
    ...     - 2. Turn on the Biotres device by pressing and holding the Home Button for 3-5 seconds on the device.
    ...     Test Output:
    ...     - 1. Visually inspect that the Biotres device under test is fully charged.
    ...     - 2. Connect the ECG cable to the Biotres device by firmly inserting the cable connector into the cable receptacle as shown in Instructions For Use (IFU) document.
    ...     - 3. Connect the other end of the patient ECG Cable snap to the electrodes on the ECG Simulator device.
    ...          Once the power-up sequence is complete in the device, the LED of device will emit green light with solid effect.
    ...     - 4. Verify the “Waiting for study state” in the log saved by the device firmware.
    ...     - 5. Verify the device initialization on power on by uploading the device log using the getlog command.
    [Tags]  BTDV-COMM-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-05: The Device receives the “stopstudy” command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the Device receives the “stopstudy” command during an active study, the device software shall end the current study and provide a response status of “DONE”.
    ...     - 2. If the Device receives the “stopstudy” command when not in an active study, the device software shall provide a response status of “REJECTED” along with the rejection reason of “Already stopped”.
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device.
    ...     Test Output:
    ...     - 1. In WinSCP, within the user folder, locate the device acknowledgement of the start study command. Verify there is a file with the format: startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 2. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     - 3. Within the device folder, locate the device rejection of the start study command. Verify there is a file with the format: startstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 4. Using WinSCP, send the stopstudy command.
    ...     - 5. Within the device folder, locate the device acknowledgement of the stop study command. Verify there is a file with the format: stopstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 6. Open with text editor. On the last line of the text file, verify the text “StopTime=”<exact study stop datetime> <timezone>”” is found on this line.
    ...     - 7. Using WinSCP, send the stopstudy command.
    ...     - 8. Within the device folder, locate the device rejection of the most recent stop study command. Verify there is a file with the format: stopstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 9. Using WinSCP, a local folder on the PC and open the file using the text editor. On the last line of the text file, verify the text “Already Stopped” is found on this line.
    ...     - 10. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 11. Send the stopstudy command.
    ...     - 12. Within the device folder, locate the device rejection of the most recent stop study command. Verify there is a file with the format: stopstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 13. On the last line of the text file, verify the text “Already Stopped” is found on this line.
    ...     - 14. Using WinSCP, send getlog command.
    ...     - 15. Erase study by sending the erasestudy command.
    ...     - 16. Send the stopstudy command.
    ...     - 17. Within the device folder, locate the device rejection of the most recent stop study command. Verify there is a file with the format: stopstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 18. On the last line of the text file, verify the text “Already Stopped” is found on this line.
    [Tags]  BTDV-COMM-05    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-06: The device receives the “stopstudy” command
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. If the device receives the “stopstudy” command and the device software is currently processing a manual,
    ...          the device software shall complete manual processing before stopping the study.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=30
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
    ...          NoiseTimePause=60
    ...     - 3. Wait for 1 minute for study to get initiated on the device.
    ...     - 4. Press and hold the “Event” button on device for 5 seconds to start study
    ...     Test Output:
    ...     - 1. Once the study has started, locate and press the event button.
    ...     - 2. While the post trigger storage for manual event is still in progress, send the stopstudy command via WinSCP.
    ...     - 3. Wait for a few minutes to complete the pre, post trigger recording.
    ...     - 4. Wait for additional 2 minutes for device to post the manual event data.
    ...     - 5. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the event button pressed action. Verify there are files with the format below:
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 6. Within the device folder, locate the device acknowledgement of the stop study command. Verify there are 2 files with the format:
    ...          stopstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          note-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 7. Using WinSCP, transfer the file stopstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt identified in previous step, to a local folder on the PC and open with text editor.
    ...          On the last line of the text file, verify the text “StopTime=”<exact study stop datetime> <timezone>”” is found on this line.
    ...     - 8. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 9. Send getlog command.
    ...     - 10. Erase study by sending the erasestudy command.
    [Tags]  BTDV-COMM-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-07: The device receives "updatestudy" command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives "updatestudy" command during study with any of the parameters below, it shall update the requested study setup parameters. The device shall send a response status as “DONE”.
    ...     - 2. If "updatestudy" command was sent with non-study related parameter or invalid parameter value, the device shall send a response status as “REJECTED” along with the rejection reason of “Invalid parameter(s)”
    ...     - 3. If "updatestudy" command was sent when device was not in an active study, the device shall send a response status as “REJECTED” along with the rejection reason of “Already stopped”.
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
    ...     - 4. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 2 minutes after the study has started.
    ...     - 2. Send the update study command using updatestudy.txt to revise Duration to 30.
    ...     - 3. Wait for 1 minute to have the study updated. Verify that Duration is changed to 30.
    ...     - 4. Within the device folder, verify there is file with the format: updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          Open with text editor. Verify the text “Duration=30”.
    ...     - 5. Send the update study command using updatestudy.txt to revise PreEvent to 60.
    ...     - 6. Wait for 1 minute to have the study updated, verify that PreEvent is changed to 60.
    ...     - 7. In WinSCP, refresh the view. Within the device folder, verify there is file with the format below: updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          Open with text editor Verify the text “PreEvent=60”.
    ...     - 8. Send the update study command using updatestudy.txt to revise PostEvent to 60.
    ...     - 9. Wait for 1 minute to have the study updated, verify that PostEvent is changed to 60.
    ...     - 10. In WinSCP, refresh the view. Within the device folder, verify there is file with the format: updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           Open with text editor. Verify the text “PostEvent=60”.
    ...     - 11. Send the update study command using updatestudy.txt to revise BradyThresh to 40.
    ...     - 12. Wait for 1 minute to have the study updated, verify that BradyThresh is changed to 40.
    ...     - 13. In WinSCP, refresh the view. Within the device folder, verify there is file with the format: updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           Open with text editor. Verify the text “BradyThresh =40”.
    ...     - 14. Send the update study command using updatestudy.txt to revise TachyThresh to 160.
    ...     - 15. Wait for 1 minute to have the study updated; verify that TachyThresh is changed to 160.
    ...     - 16. In WinSCP, refresh the view. Within the device folder, verify there is file with the format below: updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           Open with text editor. Verify the text “TachyThresh =160”.
    ...     - 17. Send the update study command using updatestudy.txt to revise PauseThresh to 3500.
    ...     - 18. Wait for 1 minute to have the study updated; verify that PauseThresh is changed to 3500.
    ...     - 19. In WinSCP, refresh the view. Within the device folder, verify there is file with the format below: updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           Open with text editor. Verify the text “PauseThresh =3500”.
    ...     - 20. Send the update study command using updatestudy.txt to revise PauseDetection to 0.
    ...     - 21. Wait for 1 minute to have the study updated; verify that PauseDetection is changed to 0.
    ...     - 22. In WinSCP, refresh the view. Within the device folder, verify there is file with the format below: updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           Open with text editor. Verify the text “PauseDetection =0”.
    ...     - 23. Send the update study command using updatestudy.txt to revise AfibDetection to 0.
    ...     - 24. Wait for 1 minute to have the study updated; verify that AfibDetection is changed to 0.
    ...     - 25. In WinSCP, refresh the view. Within the device folder, verify there is file with the format below: updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           Open with text editor. Verify the text “AfibDetection =0”.
    ...     - 26. Send the update study command using updatestudy.txt to revise AlgorithmLead to 2.
    ...     - 27. Wait for 1 minute to have the study updated; verify that AlgorithmLead is changed to 2.
    ...     - 28. In WinSCP, refresh the view. Within the device folder, verify there is file with the format below: updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           Open with text editor. Verify the text “AlgorithmLead =2”.
    ...     - 29. Send the update study command using updatestudy.txt to revise NoiseTimeBradyTachy to 600.
    ...     - 30. Wait for 1 minute to have the study updated; verify that NoiseTimeBradyTachy is changed to 600.
    ...     - 31. In WinSCP, refresh the view. Within the device folder, verify there is file with the format below: updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           Open with text editor. Verify the text “NoiseTimeBradyTachy =600”.
    ...     - 32. Send the update study command using updatestudy.txt to revise NoiseTimeAfib to 600.
    ...     - 33. Wait for 1 minute to have the study updated; verify that NoiseTimeAfib is changed to 600.
    ...     - 34. In WinSCP, refresh the view. Within the device folder, verify there is file with the format below: updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           Open with text editor. Verify the text “NoiseTimeAfib =600”.
    ...     - 35. Send the update study command using updatestudy.txt to revise NoiseTimePause to 120.
    ...     - 36. Wait for 1 minute to have the study updated; verify that NoiseTimePause is changed to 120.
    ...     - 37. In WinSCP, refresh the view. Within the device folder, verify there is file with the format below: updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           Open with text editor. Verify the text “NoiseTimePause =120”
    ...     - 38. Send the update study command using updatestudy.txt to revise Duration to 43201.
    ...     - 39. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 40. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 41. Send the updatestudy.txt command using updatestudy.txt to revise PreEvent to 41.
    ...     - 42. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 43. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 44. Send the updatestudy.txt command using updatestudy.txt to revise PostEvent to 35.
    ...     - 45. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 46. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 47. Send the updatestudy.txt command using updatestudy.txt to revise BradyThresh to 400.
    ...     - 48. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 49. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 50. Send the updatestudy.txt command using updatestudy.txt to revise TachyThresh to 500.
    ...     - 51. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 52. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 53. Send the updatestudy.txt command using updatestudy.txt to revise PauseThresh to 75000.
    ...     - 54. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 55. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 56. Send the updatestudy.txt command using updatestudy.txt to revise PauseDetection to 3.
    ...     - 57. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 58. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 59. Send the updatestudy.txt command using updatestudy.txt to revise AfibDetection to 3.
    ...     - 60. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 61. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 62. Send the updatestudy.txt command using updatestudy.txt to revise AlgorithmLead to 4.
    ...     - 63. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 64. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 65. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeBradyTachy to 3601.
    ...     - 66. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 67. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 68. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeAfib to 3601.
    ...     - 69. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 70. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 71. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimePause to 3601.
    ...     - 72. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 73. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 74. Wait a few minutes to study complete.
    ...     - 75. Send the update study command using updatestudy.txt to revise Duration to 10.
    ...     - 76. Within the device folder, locate the device acknowledgement of the “updatestudy” command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 77. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 78. Send the updatestudy.txt command using updatestudy.txt to revise PreEvent to 60.
    ...     - 79. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 80. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 81. Send the updatestudy.txt command using updatestudy.txt to revise PostEvent to 60.
    ...     - 82. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 83. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 84. Send the updatestudy.txt command using updatestudy.txt to revise BradyThresh to 40.
    ...     - 85. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 86. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 87. Send the updatestudy.txt command using updatestudy.txt to revise TachyThresh to 180.
    ...     - 88. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 89. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 90. Send the updatestudy.txt command using updatestudy.txt to revise PauseThresh to 3500.
    ...     - 91. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 92. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 93. Send the updatestudy.txt command using updatestudy.txt to revise PauseDetection to 0.
    ...     - 94. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 95. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 96. Send the updatestudy.txt command using updatestudy.txt to revise AfibDetection to 0.
    ...     - 97. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 98. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 99. Send the updatestudy.txt command using updatestudy.txt to revise AlgorithmLead to 3.
    ...     - 100. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 101. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 102. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeBradyTachy to 3600.
    ...     - 103. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 104. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 105. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeAfib to 3600.
    ...     - 106. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 107. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 108. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimePause to 3600.
    ...     - 109. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 110. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 111. Using WinSCP, send the uploadstudy command.
    ...     - 112. In WinSCP, refresh the view. Within the device folder, verify there are 2 data files with the format:
    ...            data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...            data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 113. Send the updatestudy.txt command using updatestudy.txt to revise Duration to 45.
    ...     - 114. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 115. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 116. Using WinSCP, send the erasestudy command.
    ...     - 117. In WinSCP, refresh the view. Confirm there is a file with the format: erasestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 118. Send the updatestudy.txt command using updatestudy.txt to revise Duration to 45.
    ...     - 119. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format: updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 120. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 121. Using WinSCP, send getlog command.
    [Tags]  BTDV-COMM-07    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-08: The device receives "listecg" command without requested duration
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives "listecg" command without requested duration, it shall provide the list of all ECG records ready to be uploaded.
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
    ...     - 3. Wait for 1 minutes for study to get initiated on the device.
    ...     - 4. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 1 minutes while the study is in progress.
    ...     - 2. Using WinSCP, send listecg command. Confirm the file has the following structure: Time Zone 0 (Should be local device time zone).
    ...     - 3. Within the device folder, locate the device acknowledgement of the listecg completed upload command. Verify there are following files with format: listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 4. Open “listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt” file and verify that there is only 1 record with following format:
    ...          <startTimeStrRecord1>,<stopTimeStrRecord1>
    ...          TimeZone=<timeZone>
    ...     - 5. Plug charger to the device and wait for 30 seconds. Then disconnect charger to the device and resume study.
    ...     - 6. Wait for additional 4 minutes to complete the study.
    ...     - 7. Using WinSCP, send listecg command.
    ...     - 8. Within the device folder, locate the device acknowledgement of the listecg completed upload command. Verify there are following files with format:
    ...          listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 9. Open “listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt” file and verify that there are 2 records with following format:
    ...          <startTimeStrRecord1>,<stopTimeStrRecord1>
    ...          <startTimeStrRecord2>,<stopTimeStrRecord2>
    ...          TimeZone=<timeZone>
    ...     - 10. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 11. Using WinSCP, send listecg command.
    ...     - 12. Within the device folder, locate the device acknowledgement of the listecg completed upload command. Verify there are following files with format: listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 13. Open “listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt” file and verify that there are 2 records with following format:
    ...           <startTimeStrRecord1>,<stopTimeStrRecord1>
    ...           <startTimeStrRecord2>,<stopTimeStrRecord2>
    ...           TimeZone=<timeZone>
    ...     - 14. Using WinSCP, send getlog command.
    ...     - 15. Erase study by sending the erasestudy command.
    [Tags]  BTDV-COMM-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-09: The device receives "listecg" command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description: If the device receives "listecg" command, it shall provide the list of ECG records ready to be uploaded for the duration asked in the command.
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
    ...     - 4. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 1 minutes while the study is in progress.
    ...     - 2. Locate the listecg.txt file on the file system of the PC. Open the list ecg.txt file in a text editor, configure to obtain a most recent 1 minute ECG records
    ...          and send listecg command using WinSCP. Confirm the file has the following structure:
    ...          Start Date of the record “MM/DD/YYYY”
    ...          Start Time of the record “HH:MM:SS (Time should be local device time)
    ...          Stop Date of the record “MM/DD/YYYY”
    ...          Stop Time of the record “HH:MM:SS (Time should be local device time)
    ...          Time Zone 0 (Should be local device time zone)
    ...     - 3. Within the device folder, locate the device acknowledgement of the listecg completed upload command. Verify there are following files with format: listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 4. Open “listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt” file and verify that there is only 1 record with following format:
    ...          <startTimeStrRecord1>,<stopTimeStrRecord1>
    ...          TimeZone=<timeZone>
    ...     - 5. Plug charger to the device and wait for 30 seconds. Then disconnect charger to the device and resume study.
    ...     - 6. Wait for additional 4 minutes to complete the study.
    ...     - 7. Locate the listecg.txt file on the file system of the PC. Open the listecg.txt file in a text editor, configure to obtain a most recent 5 minutes ECG records and send listecg command using WinSCP.
    ...     - 8. Within the device folder, locate the device acknowledgement of the listecg completed upload command. Verify there are following files with format: listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 9. Open “listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt” file and verify that there are 2 records with following format:
    ...          <startTimeStrRecord1>,<stopTimeStrRecord1>
    ...          <startTimeStrRecord2>,<stopTimeStrRecord2>
    ...          TimeZone=<timeZone>
    ...     - 10. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 11. Locate the listecg.txt file on the file system of the PC. Open the listecg.txt file in a text editor, configure to obtain a most recent 5 minutes ECG records and send listecg command using WinSCP.
    ...     - 12. Within the device folder, locate the device acknowledgement of the listecg completed upload command. Verify there are following files with format: listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 13. Open “listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt” file and verify that there are 2 records with following format:
    ...           <startTimeStrRecord1>,<stopTimeStrRecord1>
    ...           <startTimeStrRecord2>,<stopTimeStrRecord2>
    ...           TimeZone=<timeZone>
    ...     - 14. Using WinSCP, send getlog command.
    ...     - 15. Erase study by sending the erasestudy command.
    [Tags]  BTDV-COMM-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-10: The device receives "listecg" command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If start date time is newer than stop date time, the device shall send a response status as “REJECTED” along with the rejection reason of “Invalid parameter(s)”.
    ...     - 2. If the device receives "listecg" command; and if the requested duration is outside the study duration, the device shall send a response status as “REJECTED” along with the rejection reason of “Invalid date/time”.
    ...     - 3. If the device receives the “listecg” command after the study has been erased, the device shall provide a status of “REJECTED” along with the rejection reason of “Invalid date/time”.
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
    ...     - 4. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 2 minutes while the study is in progress. 
    ...     - 2. Open the listecg.txt file in a text editor, configure to obtain a most recent 2 minutes ECG records but make the StartTime newer over the StopTime and send listecg command using WinSCP. Confirm the file has the following structure:
    ...          Start Date of the record “MM/DD/YYYY”
    ...          Start Time of the record “HH:MM:SS”
    ...          Stop Date of the record “MM/DD/YYYY”
    ...          Stop Time of the record “HH:MM:SS”
    ...          Time Zone 0 (should be local device time zone)
    ...     - 3. Within the device folder, locate the device acknowledgement of the listecg completed upload command. Verify there are following files with format: listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 4. Open in text editor. Verify the text “Invalid parameter(s)” is found on this line.
    ...     - 5. Locate the listecg.txt file on the file system of the PC. Open the listecg.txt file in a text editor, configure to obtain a most recent 2 minutes ECG records
    ...          but make the StartTime and StopTime outside the study duration and send listecg command using WinSCP.
    ...     - 6. Open in text editor. On the last line of the text file, verify the text “Invalid date/time” is found on this line.
    ...     - 7. Wait for 3 more minutes to let the study finish.
    ...     - 8. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 9. Erase study by sending the erasestudy command.
    ...     - 10. Open the listecg.txt file in a text editor, configure to obtain a 2-minute ECG records but make the StartTime and StopTime inside the study duration and send listecg command using WinSCP.
    ...     - 11. Using WinSCP, transfer file listecg-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open in text editor. On the last line of the text file, verify the text “Invalid date/time” is found on this line.
    ...     - 12. Using WinSCP, send getlog command.
    [Tags]  BTDV-COMM-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-11: Get ECG Record
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description: The "getecg" command shall have the start date time and the stop date time of the requested ECG data.
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
    ...     - 4. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 5 minutes while the study is in progress.
    ...     - 2. Locate the getecg.txt file on the file system of the PC. Open the getecg.txt file in a text editor, configure to obtain a most recent 5-minutes segment of data and send getecg command using WinSCP. Confirm the file has the following structure:
    ...          Start Date of the record “MM/DD/YYYY”
    ...          Start Time of the record “HH:MM:SS” Time should be local device time.
    ...          Stop Date of the record “MM/DD/YYYY”
    ...          Stop Time of the record “HH:MM:SS” Time should be local device time.
    ...          Time Zone 0
    ...     - 3. Using WinSCP, within the device folder, locate the device acknowledgement of the getecg completed upload command. Verify there are following files with format:
    ...          getecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          data-get-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-get-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 4. Wait for additional 5 minutes to complete the study.
    ...     - 5. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 6. Create a local "SD card" folder on the PC.
    ...     - 7. Connect the device to the “Device Monitor” program.
    ...     - 8. Switch the device to the “Mass Storage” mode.
    ...     - 9. Copy the yyyymmdd-hhmmss.dat file in the “rec” folder to the “SD card” folder.
    ...     - 10. Create a local "Device" folder on the PC.
    ...     - 11. Using WinSCP, transfer the following files to “Device” folder:
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 12. Use “ECG Verification” program to verify the ecg data of two folder “SD card” and “Device” folder.
    ...     - 13. Make sure the program does not report any warning on the verification result.
    ...     - 14. Send getlog command.
    ...     - 15. Erase study by sending the erasestudy command.
    [Tags]  BTDV-COMM-11    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-12: Get ECG record
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description: 
    ...     - 1. If the device receives the “getecg” command and the start/stop date times are within the device study period, the device shall upload an ecgdata record with the data from the start date time to the end date time.
    ...     - 2. If start date time is newer than stop date time, the device shall send a response status as “REJECTED” along with the rejection reason of “Invalid parameter(s)”.
    ...     - 3. If the device receives the “getecg” command and the start/stop date times fall outside of the device study period, the device shall provide a status of “REJECTED” along with the rejection reason of “Invalid date/time”.
    ...     - 4. If the Device receives the “getecg” command while a manual is being processed, the device shall provide a status of “REJECTED” along with the rejection reason of “MCT event is being processed”.
    ...     - 5. If the device receives the “getecg” command after the study has been erased, the device shall provide a status of “REJECTED” along with the rejection reason of “Invalid date/time”.
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
    ...     - 4. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 5 minutes while the study is in progress. 
    ...     - 2. Locate the getecg.txt file on the file system of the PC. Open the getecg.txt file in a text editor, configure to obtain a most recent 5-minutes segment of data and send getecg command using WinSCP.
    ...          Confirm the file has the following structure:
    ...          Start Date of the record   “MM/DD/YYYY”
    ...          Start Time of the record   “HH:MM:SS” Time should be local device time.
    ...          Stop Date of the record    “MM/DD/YYYY”
    ...          Stop Time of the recor     “HH:MM:SS” Time should be local device time.
    ...          Time Zone                  0
    ...     - 3. Using WinSCP, within the device folder, locate the device acknowledgement of the getecg completed upload command. Verify there are following files with format:
    ...          getecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          data-get-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-get-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 4. Locate the getecg.txt file on the file system of the PC. Open the getecg.txt file in a text editor, configure to obtain a most recent 5-minutes segment of data
    ...          but make the StartTime newer over the StopTime and send getecg command using WinSCP. Confirm the file has the following structure:
    ...          Start Date of the record    “MM/DD/YYYY”
    ...          Start Time of the record    “HH:MM:SS” Time should be local device time.
    ...          Stop Date of the record     “MM/DD/YYYY”
    ...          Stop Time of the record     “HH:MM:SS” Time should be local device time.
    ...          Time Zone                   0
    ...     - 5. Refresh the view, within the device folder. Verify there are following files with format: listecg-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 6. Local folder on the PC and open in text editor. Verify the text “Invalid Parameters(s)” is found on this line.
    ...     - 7. Locate the getecg.txt file on the file system of the PC. Open the getecg.txt file in a text editor, configure to obtain a 5-minutes segment of data but make the StartTime and StopTime outside the study period and send getecg command using WinSCP.
    ...     - 8. Refresh the view, within the device folder. Verify there are following files with format: listecg-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 9. Local folder on the PC and open in text editor. Verify the text “Invalid date/time” is found on this line.
    ...     - 10. While study is in progress, locate and press the event button.
    ...     - 11. While post trigger recording from the manual event is still in progress, send the getecg command for the most recent 5 minutes of study which is still in progress. 
    ...     - 12. Within the device folder, locate the device rejection of the most recent getecg command. Verify there is a file with the format: getecg-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 13. Using WinSCP, a local folder on the PC and open with text editor. On the last line of the text file, verify the text “MCT event is being processed” is found.
    ...     - 14. Using WinSCP, send stopstudy command and wait study complete.
    ...     - 15. Locate the getecg.txt file on the file system of the PC. Open the getecg.txt file in a text editor, configure to obtain a most recent 5-minutes segment of data and send getecg command using WinSCP.
    ...     - 16. Refresh the view, within the device folder. Verify there are following files with format:
    ...           getecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           data-get-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           data-get-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 17. Send the uploadstudy command to upload full study data.
    ...     - 18. Within the device folder, locate the device acknowledgement of the upload study command. Verify there is a file with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 19. In WinSCP, within the device folder, verify there are 2 data files with the format:
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 20. Locate the getecg.txt file on the file system of the PC. Open the getecg.txt file in a text editor, configure to obtain a 5-minutes segment of data during when the study was ON and send getecg command using WinSCP.
    ...     - 21. Refresh the view, within the device folder. Verify there are following files with format: getecg-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 22. Using WinSCP, transfer file getecg-rejected-mm-dd-yy-hh-mm-ss+timezone.txt identified in previous step, to a local folder on the PC and open in text editor. On the last line of the text file, verify the text “Already uploaded” is found on this line.
    ...     - 23. Using WinSCP, send the erasestudy command.
    ...     - 24. In WinSCP, refresh the view. Locate the device folder, within the device folder, locate the device acknowledgement of the erase study command.
    ...           Confirm there is a file with the format: erasestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 25. Locate the getecg.txt file on the file system of the PC. Open the getecg.txt file in a text editor, configure to obtain a 5-minutes segment of data during when the study was ON and send getecg command using WinSCP.
    ...     - 26. Using WinSCP, transfer file getecg-rejected-mm-dd-yy-hh-mm-ss+timezone.txt identified in previous step, to a local folder on the PC and open in text editor.
    ...           On the last line of the text file, verify the text “Invalid date/time” is found on this line.
    ...     - 27. Using WinSCP, send getlog command.
    [Tags]  BTDV-COMM-12    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-13: The device receives the “uploadstudy” command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description: If the device receives the “uploadstudy” command after a study has been completed and not erased, the device shall upload a study record with all data recorded for the most recent study.
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
    ...     - 4. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 5 minutes to ensure that the device has completed the study successfully.
    ...     - 2. Send the upload study command.
    ...     - 3. Wait for 10 minutes to finish the upload of the entire study.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the upload study command.
    ...          Verify there is a file with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 5. In WinSCP, refresh the view. Within the device folder, verify there are 2 data files with the format:
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 6. Create a local "SD card" folder on the PC.
    ...     - 7. Connect the device to the “Device Monitor” program.
    ...     - 8. Switch the device to the “Mass Storage” mode.
    ...     - 9. Copy the yyyymmdd-hhmmss.dat file in the “rec” folder to the “SD card” folder.
    ...     - 10. Create an local "Device" folder on the PC.
    ...     - 11. Using WinSCP, transfer the following files to “Device” folder:
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 12. Use “ECG Verification” program to verify the ecg data of two folder “SD card” and “Device” folder.
    ...     - 13. Make sure the program does not report any warning on the verification result.
    ...     - 14. Using WinSCP, send getlog command.
    [Tags]  BTDV-COMM-13    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-14: The device receives the “uploadstudy” command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives the “uploadstudy” command during an active study, the device shall provide a status of “REJECTED” along with the rejection reason of “Study is in progress”.
    ...     - 2. If the device receives the “uploadstudy” command after the most recent study has been uploaded, the device shall provide a status of “REJECTED” along with the rejection reason of “Already uploaded”.
    ...     - 3. If the device receives the “uploadstudy” command after the most recent study has been erased, the device shall provide a status of “REJECTED” along with the rejection reason of “Already erased”.
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
    ...     - 4. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. While the study is in progress, locate and send the uploadstudy using uploadstudy.txt using WinSCP.
    ...     - 2. In WinSCP, refresh the view. Within the device folder, locate the device rejection of the most recent upload study command. Verify there is a file with the format: uploadstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Using WinSCP, local folder on the PC and open in text editor. On the last line of the text file, verify the text “Study is in progress” is found.
    ...     - 4. Wait a few minutes for study to complete.
    ...     - 5. After the study has completed, locate and send the uploadstudy using uploadstudy.txt using WinSCP.
    ...     - 6. In WinSCP, within the user folder for the given device, locate the device acknowledgement of the upload study command. Verify there is a file with the format: uploadstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 7. Within the device folder, locate the device acknowledgement of the upload study command. Verify there is a file with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 8. In WinSCP, within the device folder, verify there are 2 data files with the format:
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 9. After the study has UPLOADED, send the uploadstudy using uploadstudy.txt using WinSCP.
    ...     - 10. Within the device folder, locate the device rejection of the most recent upload study command. Verify there is a file with the format: uploadstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 11. Open file with text editor. On the last line of the text file, verify the text “Already uploaded” is found.
    ...     - 12. Locate erasestudy.txt and using WinSCP, send the erasestudy command.
    ...     - 13. In WinSCP, refresh the view. Locate the device folder. Within the device folder, locate the device acknowledgement of the erase study command.
    ...           Confirm there is a file with the format: erasestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 14. After the study has completed, locate and send the uploadstudy using uploadstudy.txt using WinSCP.
    ...     - 15. Within the device folder, locate the device rejection of the most recent upload study command. Verify there is a file with the format: uploadstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 16. Using WinSCP, transfer the file uploadtstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open with text editor.
    ...           On the last line of the text file, verify the text “Already erased” is found.
    ...     - 17. Using WinSCP, send getlog command.
    [Tags]  BTDV-COMM-14    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-15: The device shall initiate upload of study data after the study is completed
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description: While in communication with server via Biotres gateway, the device shall initiate upload of study data after the study is completed.
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
    ...     - 4. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 5 minutes to ensure that the device has completed the study successfully.
    ...     - 2. Send the upload study command.
    ...     - 3. Wait until to finish upload of the entire study.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the upload study command. Verify there is a file with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 5. In WinSCP, refresh the view. Within the device folder, verify there are 2 data files with the format:
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 6. Using WinSCP, send getlog command.
    ...     - 7. Erase study by sending the erasestudy command.
    [Tags]  BTDV-COMM-15    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-16: The device shall enable uploading of study data
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description: While in communication with Server via Biotres gateway, the device shall enable uploading of study data when the device is being charged during a study.
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
    ...     - 4. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 5 minutes to ensure that the device has completed the study successfully.
    ...     - 2. Connect the device to the charger and wait for 30 seconds.
    ...     - 3. Send the uploadstudy command.
    ...     - 4. Wait until to finish upload of the entire study.
    ...     - 5. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the upload study command. Verify there is a file with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 6. In WinSCP, refresh the view. Within the device folder, verify there are 2 data files with the format:
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 7. In WinSCP, send the getlog command to retrieve the device activities log.
    ...     - 8. Erase study by sending the erasestudy command.
    [Tags]  BTDV-COMM-16    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-17: Erase Study Data
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives the “erasestudy” command when in an active study, the device shall provide a response status of “rejected” along with the rejection reason of “Study has not completed”.
    ...     - 2. If the device receives the “erasestudy” command after a study has been completed, the device shall provide a response status of “rejected” along with the rejection reason of “Study has not uploaded”.
    ...     - 3. If the device receives the “erasestudy” command and the study data has already been erased, the device shall provide a response status of “rejected” along with the rejection reason of “Already erased”.
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
    ...     - 4. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Locate erasestudy.txt and using WinSCP, send Erase Study command.
    ...     - 2. In WinSCP, refresh the view.Within the device folder, locate the device rejection of the most recent erase study command. Verify there is a file with the format: erasestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Open in text editor. Verify the text “Study has not completed”.
    ...     - 4. Wait a few minutes for study to complete.
    ...     - 5. Locate erasestudy.txt and using WinSCP, send Erase Study command.
    ...     - 6. Within the device folder, locate the device rejection of the most recent erase study command. Verify there is a file with the format: erasestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 7. Open in text editor. Verify the text “Study has not uploaded”.
    ...     - 8. Using WinSCP, send the uploadstudy command.
    ...     - 9. In WinSCP, within the user folder for the given device, locate the device acknowledgement of the upload study command. Verify there is a file with the format:
    ...          uploadstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 10. Within the device folder, locate the device acknowledgement of the upload study command. Verify there is a file with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 11. In WinSCP, within the device folder, verify there are 2 data files with the format:
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 12. Locate erasestudy.txt and using WinSCP, send the erasestudy command.
    ...     - 13. In WinSCP, refresh the view. Locate the device folder. Within the device folder, locate the device acknowledgement of the erase study command. Confirm there is a file with the format:
    ...           erasestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 14. After the study has erased, send the erasestudy using erasestudy.txt using WinSCP.
    ...     - 15. Within the device folder, locate the device rejection of the most recent erase study command. Verify there is a file with the format: erasestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 16. Using WinSCP, local folder on the PC and open with text editor. On the last line of the text file, verify the text “Already erased” is found.
    ...     - 17. Using WinSCP, send getlog command.
    [Tags]  BTDV-COMM-17    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-18: The device receives "getloglist" command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description: If the device receives "getloglist" command, it shall provide the list of all daily log files.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=0120456
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
    ...     - 4. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. In WinSCP, send the getloglist command to retrieve the device activities log.
    ...     - 2. In WinSCP, refresh the view. Within the user folder, locate the device acknowledgement of the getlog command. Verify there is a file with the format: getloglist-processing-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Wait for study to getloglist completed.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getlog command. Verify there is a file with the format: getloglist-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 5. Open the getloglist-done-mm-dd-yy-hh-mm-ss+timezone.txt file using text editor. Verify that contents of loglist file: mm/dd/yyyy 00:00:00.
    ...     - 6. After the study has completed. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 7. Using WinSCP, send getlog command.
    ...     - 8. Erase study by sending the erasestudy command.
    [Tags]  BTDV-COMM-18    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-19: The device receives "getlog" command
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: 
    ...     - 1. If the device receives "getlog" command without the target daily log file being provided, the device shall upload all available log files to the server.
    ...     - 2. If the device receives "getlog" command and the requested daily log file is available, the device shall upload the requested daily log file to the server.
    ...     - 3. If the device receives "getlog" command and the requested daily log file is not available, the device shall send a response status as “REJECTED” along with the rejection reason of “Invalid parameter(s)”.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=0120456
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
    ...     - 4. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. In WinSCP, send the getlog command to retrieve the device activities log.
    ...     - 2. In WinSCP, refresh the view. Within the user folder, locate the device acknowledgement of the getlog command. Verify there is a file with the format: getlog-processing-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Within the device folder, locate the device acknowledgement of the getlog command. Verify there are files with the following format: log-daily-mm-dd-yyyy-hh-mm-ss+timezone.txt
    ...     - 4. Wait for 1 minute or more.
    ...     - 5. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getlog command. Verify there is a file with the format:
    ...          getlog-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          log-data-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 5. Wait for 1 minute.
    ...     - 6. Locate the getlog.txt file on the file system of the PC. Open the getlog.txt file and write two valid parameters "Date" and "Time" and send getlog command using WinSCP.
    ...          Confirm the file has the following structure:
    ...          Date of the record “MM/DD/YYYY”
    ...          Time of the record “HH:MM:SS”
    ...     - 7. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getlog command. Verify there are all file with the format: log-data-daily-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 8. Open getlog.txt file and write invalid parameter "Date". Send the getlog command to retrieve the device activities log.
    ...     - 9. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getlog command. Verify there are all file with the format: getlog-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 10. Open the file getlog-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)“.
    ...     - 11. Wait for until study complete.
    ...     - 12. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 13. Erase study by sending the erasestudy command.
    [Tags]  BTDV-COMM-19    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-20: The "downloadfile" command and the target file path is valid
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. If the device receives the "downloadfile" command and the target file path is valid, the device shall provide a response status of "PROCESSING" and begin the downloading process.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Send file “Image firmware name.bin” to device folder.
    ...     - 2. Open “downloadfile”.txt command and write this file with content following:
    ...          dir="fw"
    ...          file="Image firmware name.bin"
    ...     - 3. In WinSCP, send the “downloadfile” command to user folder.
    ...     - 4. Turn off the device by pressing and holding the “Power” button for 5 seconds.
    ...     - 5. Turn on the device by pressing and holding the “Power” Button for 3 seconds on the device.
    ...     - 6. Disable BLE on the phone.
    ...     - 7. Enable BLE on the phone.
    ...     - 8. Wait for the downloading process to complete.
    ...     - 9. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command. Verify there is a file with the format: downloadfile-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 10. Connect device to device monitor program and change device to USB mass storage mode.
    ...     - 11. Verify the file “Image firmware name.bin” exits in “fw” folder device.
    [Tags]  BTDV-COMM-20    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-21: If the device receives the "downloadfile" command
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. If the device receives the "downloadfile" command and the target file path is valid the device shall provide a response status of "PROCESSING" and begin the downloading process.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=0120456
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
    ...     - 4. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Send file “Image firmware name.bin” to device folder.
    ...     - 2. Wait for 1 minute.
    ...     - 3. Open “downloadfile”.txt command and write this file with content following:
    ...          dir="fw"
    ...          file=" Image firmware name.bin"
    ...     - 4. In WinSCP, send the “downloadfile” command to user folder.
    ...     - 5. Turn off the device by pressing and holding the “Power” button for 5 seconds.
    ...     - 6. Turn on the device by pressing and holding the “Power” Button for 3 seconds on the device.
    ...     - 7. Disable BLE on the phone.
    ...     - 8. Enable BLE on the phone.
    ...     - 9. Waiting for download file complete.
    ...     - 10. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command. Verify there is a file with the format: downloadfile-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 11. Connect device to device monitor program and change device to USB mass storage mode.
    ...     - 12. Verify file “Image firmware name.bin” exits in “fw” folder of device.
    ...     - 13. In WinSCP, send the stopstudy command to user folder. Wait for the study to finish.
    ...     - 14. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 15. Using WinSCP, send getlog command.
    ...     - 16. Erase study by sending the erasestudy command.
    [Tags]  BTDV-COMM-21    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-22: The device receives the "validatefile" command
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. If the device receives the "validatefile" command when the downloading process finishes and the downloaded file is valid, the device shall provide a response of "DONE".
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Open validatefile.txt command and write this file with content following: file="fw/Image firmware name.bin"
    ...     - 2. In WinSCP, send the “validatefile” command to user folder.
    ...     - 3. Waiting for validate file complete.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, Verify there is a file with the format: validatefile-done-mm-dd-yy-hh-mm-ss+timezone.txt
    [Tags]  BTDV-COMM-22    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-23: The device receives the "downloadfile" command
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: If the device receives the "downloadfile" command and the target file path is invalid, the device shall provide a response status of "REJECTED".
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=0120456
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
    ...     - 4. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 1 minute.
    ...     - 2. In WinSCP, send the “downloadfile” command to user folder.
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command. Verify there are all file with the format: downloadfile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 4. Open the file downloadfile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. On the last line of the text file, verify the text “Invalid parameter(s)“ is found on this line.
    ...     - 5. In WinSCP, send the stopstudy command to user folder. Wait for the study to stop.
    ...     - 6. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 7. Erase study by sending the erasestudy command.
    ...     - 8. After the study has erased. In WinSCP, send the “downloadfile” command to user folder.
    ...     - 9. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command. Verify there are all file with the format: downloadfile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 10. Open the file downloadfile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. On the last line of the text file, verify the text “Invalid parameter(s)“ is found on this line.
    [Tags]  BTDV-COMM-23    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-24: The device receives the "clonefw" command
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: If the device receives the "clonefw" command and the target file path is valid, the device shall clone the firmware image from the provided file path to its external flash memory and provide a response of "DONE".
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Copy file “Image firmware name.bin” to SD card of device.
    ...     - 3. Initiate the Start Study command with the parameters below:
    ...          PatientId=0120456
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
    ...     - 4. Wait for 1 minute for study to get initiated on the device.
    ...     - 5. Press and hold the “Event” button on device for 5 seconds to start study
    ...     Test Output:
    ...     - 1. Open “clonefw”.txt command and write this file with content following: path="fw/ Image firmware name.bin".
    ...     - 2. In WinSCP, send the “clonefw” command to user folder.
    ...     - 3. Disable BLE on the phone.
    ...     - 4. Enable BLE on the phone.
    ...     - 5. Waiting for clone firmware complete.
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “clonefw” command. Verify there is a file with the format: clonefw-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 7. In WinSCP, send the stopstudy command to user folder. Wait for the study to finish.
    ...     - 8. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 9. Erase study by sending the erasestudy command.
    ...     - 10. In WinSCP, send the “clonefw” command to user folder.
    ...     - 11. Disable BLE on the phone.
    ...     - 12. Enable BLE on the phone.
    ...     - 13. Waiting for clone firmware complete.
    ...     - 14. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “clonefw” command. Verify there is a file with the format: clonefw-done-mm-dd-yy-hh-mm-ss+timezone.txt
    [Tags]  BTDV-COMM-24    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-25: The device receives the "clonefw" command
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: If the device receives the "clonefw" command and the target file path is invalid, the device shall provide a response of "REJECTED" along with the rejection reason being "Invalid parameter(s)".
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Open clonefw.txt file and input a path that does not exist.
    ...     - 2. In WinSCP, send the “clonefw” command to user folder.
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “clonefw” command. Verify there are all file with the format: clonefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 4. Open the file clonefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. On the last line of the text file, verify the text “Invalid parameter(s)” is found on this line.
    [Tags]  BTDV-COMM-25    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-26: The device receives the "clonefw" command
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. If the device receives the "clonefw" command with the valid file path, and if the device fails to clone the image to its external flash memory, the device shall provide a response of "REJECTED" along with the rejection reason being "Clone failed".
    ...     Test Setup and Input:
    ...     - 1. Navigate to firmware project of Biotres device.
    ...     - 2. Inspect the source file: app\dxh\src\app\firmware_update.c, line 128 – 145.
    ...          If the device receives the "clonefw" command with the valid path but fails to clone the image to its external flash memory, the firmware program will execute the code at the line of 138.
    ...          128 if (FS_FILE == FS_Stat(g_DxhCmdParam.Info.CloneFw.Path, NULL))
    ...          129 {
    ...          130   XP_CALL(BL CloneSdToOffChip, g_DxhCmdParam.Info.CloneFw.Path, version, sizeof(version), &status);
    ...          131
    ...          132   if (status == BL_OK)
    ...          133   {
    ...          134     snprintf(g_DxhRespParam.Info.CloneFw.Version, sizeof(g_DxhRespParam.Info.CloneFw.Version), "%s", version);
    ...          135   }
    ...          136   else if (status == BL_CLONE_FAILED)
    ...          137   {
    ...          138     g_DxhRespParam.Info.RejectedReason = DXH_RSN_CLONE_FAILED;
    ...          139   }
    ...          140   else// BL_INVALID_FW
    ...          141   {
    ...          142     g_DxhRespParam.Info.RejectedReason = DXH_RSN_INV_FW_IMAGE;
    ...          143     FS_Delete (g_DxhCmd Param. Info.CloneFw.Path; // Delete FW file
    ...          144   }
    ...     Test Output:
    ...     - 1. Inspect test case from the unit test suite: app\dxh\src\unit_test\src\group\app\test_firmware_update.c, line 192 – 212.
    ...          192 //===================================================== {
    ...          193 // Branch: Clone failed
    ...          194 TestInit();
    ...          195 memset(&g_DxhRespParam, 0, sizeof(g_DxhRespParam));
    ...          196 g_Test_FS_Stat_Return = FS_NONE;
    ...          197 g_Test_BL_CloneSdToOffChip_status = BL_CLONE_FAILED;
    ...          198 strcpy(g_DxhCmdParam.Info.CloneFw.Path, "fw.bin");
    ...          199
    ...          200 FS Open(&fHandle, g_DxhCmdParam.Info.CloneFw.Path, FA_CREATE_ALWAYS);
    ...          201 FS_Close(&fHandle);
    ...          202
    ...          203 XP_CALL(FU_CloneFw, 1234);
    ...          204
    ...          205 TEST_ASSERT_EQUAL_STRING(g_DxhCmd Param.Info.CloneFw.Path, g_Test_BL_CloneSdToOffChip_filePath);
    ...          206 TEST_ASSERT_EQUAL(FS_FILE, FS_Stat(g_DxhCmdParam.Info.CloneFw.Path, NULL));
    ...          207
    ...          208 TEST_ASSERT_EQUAL(DXH_RSN_CLONE_FAILED, g_DxhRespParam.Info.RejectedReason);
    ...          209 TEST_ASSERT_EQUAL(DXH_CMD_CLONE_FW, g_Test_BG_Modem SendResponse_cmd);
    ...          210 TEST_ASSERT_EQUAL(DXH_RES_REJECTED, g_Test_BG_Modem_SendResponse_res);
    ...          211 TEST_ASSERT_EQUAL(1234, g_Test_BG_Modem_SendResponse_handShakeTime);
    ...          212 //==================================================== }
    ...          Verify that the if the status returned by BL_CloneSdToOffChip function is BL_CLONE_FAILED (line 197), the response of the "clonefw" command
    ...          should be set to "REJECTED" (line 210) with the reason of "Clone failed" (line 208).
    [Tags]  BTDV-COMM-26    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-27: The device receives the "clonefw" command
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. If the device receives the "clonefw" command and if the firmware image from the provided file path is invalid, the device shall provide a response of "REJECTED" along with the rejection reason being "Invalid FW image"
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Switch the device to mass storage mode and create the Image.txt file to the “fw” folder.
    ...     - 2. Open clonefw.txt file and input valid path to the Image.txt file.
    ...     - 3. In WinSCP, send the “clonefw” command to user folder.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “clonefw” command. Verify there are all file with the format: clonefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 5. Open the file clonefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. On the last line of the text file, verify the text “Invalid FW image” is found on this line.
    [Tags]  BTDV-COMM-27    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-28: The device receives "updatefw" command
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: If the device receives "updatefw" command, it shall update its running firmware with the newer one in external flash memory and provide a response of "DONE".
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Copy file “Image firmware name.bin” to SD card of device.
    ...     Test Output:
    ...     - 1. In WinSCP, send the “clonefw” command to user folder. Waiting for clone firmware complete.
    ...     - 2. In WinSCP, send the “updatefw” command to user folder.
    ...     - 3. The device turns off and then turns on again and the LED of the device emits pink light with solid effect about 2 seconds.
    ...     - 4. Waiting for update firmware complete.
    ...     - 5. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “updatefw” command. Verify there is a file with the format: updatefw-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 6. In WinSCP, send the “getversion” command to user folder.
    ...     - 7. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “getversion” command. Verify there is a file with the format: getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 8. Open the file getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. On the last line of the text file, verify the text “New firmware’s name“ is found on this line.
    [Tags]  BTDV-COMM-28    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-29: The device receives "updatefw" command
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: If the device receives "updatefw" command, it shall update its running firmware with the newer one in external flash memory and provide a response of "DONE".
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Copy file “Image firmware name.bin” to SD card of device.
    ...     - 3. Initiate the Start Study command with the parameters below:
    ...          PatientId=0120456
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
    ...     - 4. Wait for 1 minute for study to get initiated on the device.
    ...     - 5. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. In WinSCP, send the “clonefw” command to user folder. Waiting for validating file complete.
    ...     - 2. In WinSCP, send the “updatefw” command to user folder.
    ...     - 3. The device turns off then turns on again and the LED of the device emits pink light with solid effect about 2 seconds.
    ...     - 4. Waiting for updating firmware complete.
    ...     - 5. Once the power-up sequence is complete in the device, the device will show the status led in green light with pulse effect.
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “updatefw” command. Verify there is a file with the format: updatefw-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 7. Send the “getversion” command to user folder.
    ...     - 8. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “getversion” command. Verify there is a file with the format: getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 9. Open the file getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. On the last line of the text file, verify the text “New firmware’s name“ is found on this line.
    ...     - 10. After the study has completed. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 11. Using WinSCP, send getlog command.
    ...     - 12. Erase study by sending the erasestudy command.
    [Tags]  BTDV-COMM-29    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-30: The device receives "updatefw" command
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. If the device receives "updatefw" command, and if there is no valid firmware is found on device's external flash memory, the device shall provide a response of "REJECTED" along with the rejection reason being "Invalid operation".
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Copy file “Image firmware name.bin” to SD card of device inspect.
    ...     Test Output:
    ...     - 1. In WinSCP, send the “clonefw” command to user folder. Waiting for clone firmware complete.
    ...     - 2. Invalidate off-chip firmware image SM+INVOFFCHIP.
    ...     - 3. In WinSCP, send the “updatefw” command to user folder.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “updatefw” command. Verify there is a file with the format: updatefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 5. Using WinSCP, transfer the file updatefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt identified in previous step, to a local folder on the PC and open with text editor.
    ...          On the last line of the text file, verify the text “Invalid operation” is found.
    [Tags]  BTDV-COMM-30    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-31: The device receives "getversion" command
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: If the device receives "getversion" command, it shall provide the information of its hardware & firmware version, Bootloader version and FW checksum.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. In WinSCP, send the “getversion” command to user folder.
    ...     - 2. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “getversion” command. Verify there is a file with the format: getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Open the file getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. On the last line of the text file, verify the text:
    ...          hw=<hw version>
    ...          fw=<fw version>
    ...          bl=<Blootloader version>
    ...          cks=<fw checksum>
    ...     - 4. Connect the device to the Biotres Device Monitor Software. Issue the following command which will return firmware version, actual firmware CRC. SM+VER?. Verify text: [OK+VER=<hw>, <fw>,<fw >, <bl >]
    [Tags]  BTDV-COMM-31    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-32: ECG Data Format
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: ECG data uploaded by the device shall be in MIT16 format.
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
    ...     - 4. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 5 minutes to ensure that the device has completed the study successfully.
    ...     - 2. Send the upload study command.
    ...     - 3. Wait for 1 minutes to finish the upload of the entire study.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the upload study command. Verify there is a file with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 5. In WinSCP, refresh the view. Within the device folder, verify there are 2 data files with the format:
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 6. Verify that the data output from step 5 is in MIT16 format by opening the files in the MATLAB with Waveform Database (WFDB) tools.
    ...     - 7. Erase study by sending the erasestudy command.
    [Tags]  BTDV-COMM-32    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-33: Device notifications
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The device shall provide the current notification from the following list:
    ...     - 1. Battery Low
    ...     - 2. Battery Critical
    ...     - 3. Battery Charging
    ...     - 4. Lead Disconnected
    ...     - 5. Lead Reconnected
    ...     - 6. User Power On
    ...     - 7. User Power Down Request
    ...     - 8. Device Error
    ...     - 9. Power on Initialization Failure
    ...     - 10. CRC Checksum Failure
    ...     - 11. Manual Cardiac Event Storage Failure
    ...     - 12. Electrogram Data Upload Failure
    ...     Test Setup and Input:
    ...     - 1. Power on the device.
    ...     - 2. Wait for a few minutes for power on initialization to finish including the power on initialization checks such as cellular connectivity, SD card health and CRC check.
    ...     - 3. Power down the device.
    ...     - 4. Wait for a few minutes for power off to finish.
    ...     - 5. Remove the SD card from the Biotres device.
    ...     - 6. Power on the device.
    ...     - 7. Wait for Power On initialization and look for the LED of the device emits yellow light with flash effect associated with SD card removal.
    ...     - 8. Power off the device by pressing and holding the Home button for 10 seconds.
    ...     - 9. Insert the SD card back in to the Biotres device.
    ...     - 10. Power on the device by pressing and holding the Home button for 3-5 seconds.
    ...     - 11. Wait for a few minutes for power on initialization to finish including the power on initialization checks such as cellular connectivity, SD card health and CRC check.
    ...     Test Output:
    ...     - 1. In WinSCP, send the getlog command to retrieve the device activities log.
    ...     - 2. Wait for 5 minutes and refresh the WinSCP view. Within the device folder, verify the file with the format:
    ...          log-data-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          log-daily-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Within device log file, status files and notifications in the device folder, verify the following events:
    ...          User Power On
    ...          User Power Down
    ...          CRC Check
    ...     - 4. Connect the device to the Biotres Device Monitor Software. Issue the following command which will return firmware version, actual firmware CRC. SM+VER?
    ...     - 5. Enable CRC checking feature. SM+CRC=1, <Original CRC>.
    ...     - 6. Using Biotres Device Monitor software, issue the command below to read the value written at address 0x0800AA00. Record the value read here SM+FLASH=0800AA00?
    ...     - 7. Using Biotres Device Monitor software, write a different value at address 0x0807FFF than read in the previous step. SM+FLASH=0800AA00,AA.
    ...     - 8. Wait for “Device Health Check Frequency” time interval.
    ...     - 9. Verify that the LED of the device emits pink light with soid effect about 2 seconds.
    ...     - 10. In WinSCP, send the getlog command to retrieve the device activities log.
    ...     - 11. Wait for 5 minutes and refresh the WinSCP view. Within the device folder, verify the file with the format:
    ...           log-data-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           log-daily-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 12. Open the log file in the text editor and verify Invalid CRC entry in the device log.
    [Tags]  BTDV-COMM-33    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-34: Device battery notifications
    [Documentation]     Author: Nang Phung
    ...
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results" except the battery requirement to be 100% charged. If battery charge is greater than 41%, go to next step.
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=40320
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
    ...     - 4. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     - 5. Connect the ECG Simulator to feed in sinus signal at 80 BPM.
    ...     Test Output:
    ...     - 1. Disconnect the lead.
    ...     - 2. Wait for few minutes to finish sending the Lead off detection notification.
    ...     - 3. Reconnect the lead.
    ...     - 4. Wait for few minutes to finish sending the lead connection notification.
    ...     - 5. Wait for long enough to let the battery charge drop below 10%.
    ...     - 6. Verify that the Battery Low notification is sent.
    ...     - 7. Wait again to let the battery charge drop below 5%.
    ...     - 8. Verify that the Battery Critical notification is sent when the charger is plugged back in since device stops sending notification to the server
    ...          when remaining battery threshold is <= 10% since modem gets turned off at 10% battery level.
    ...     - 9. Plug the device in for charging.
    ...     - 10. In WinSCP, send the getlog command to retrieve the device log.
    ...     - 11. Wait for 5 minutes and refresh the WinSCP view. Within the device folder, verify the file with the format:
    ...           log-data-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           log-daily-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 12. Within device log and device notifications, verify the notifications below:
    ...           Battery Critical
    ...           Battery Charging
    ...     - 13. Send the stopstudy command to stop the active study.
    ...     - 14. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 15. Erase study by sending the erasestudy command.
    [Tags]  BTDV-COMM-34    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-35: line “Device KA” in log device
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The device shall send keep alive packet to the server every Device Keep Alive Frequency programmable interval to remain in session with the server.
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
    ...     - 4. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 5 minutes to ensure that the device has completed the study successfully.
    ...     - 2. In WinSCP, send the getlog command to retrieve the device log.
    ...     - 3. Wait for 5 minutes and refresh the WinSCP view. Open log-data-mm-dd-yy-hh-mm-ss+timezone.txt file with the text editor.
    ...     - 4. Verify the device send “keep alive packet” (line “Device KA” in log device) to the server once every minute.
    ...     - 5. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 6. Erase study by sending the erasestudy command.
    [Tags]  BTDV-COMM-35    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-36: Device Notifications
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. Device software shall encrypt patient data information (PHI) during communications between the Biotres device and the server.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Open WinSCP client (Open source SFTP client for Windows; used for file transfers between a host and a remote server) and set the following values:
    ...           Choose file transfer protocol as FTP.
    ...           Choose encryption as TLS\SSL Explicit Encryption.
    ...           SET Host equal to 52.8.168.226 and Port equal to 21.
    ...           Enter username and password to securely log in to the remote server.
    ...           Once logged in successfully, create a new folder named as device id.
    ...          Once device folder is created, create two subfolders names as “user” (i.e. from users) and “server” (from server).
    ...     Test Output:
    ...     - 1. Verify that encryption is set as “TLS\SSL Explicit Encryption” on the WinSCP login session screen.
    [Tags]  BTDV-COMM-36    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-37: Device Notifications
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. After uploading all study data by serving uploadstudy command to the server, the device shall maintain an internal flag to keep track of the successful study data transfer to the server.
    ...     - 2. When device receives erasestudy command, the device software shall check an internal flag to make sure that the study data was transferred to the server successfully before erasing the data from the device memory.
    ...     - 3. After erasing all study data as part of serving erasestudy command, the device software shall go to waiting for study.
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
    ...     - 4. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Upload the study using the uploadstudy command. Wait for the study to be uploaded. 
    ...     - 2. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the upload study command. Verify there is a file with the format: uploadstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Using WinSCP, transfer the file uploadstudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open with text editor.
    ...          On the last line of the text file, verify the text “Study in grogress” is found.
    ...     - 4. Wait for 5 minutes to ensure that the device has completed the study successfully.
    ...     - 5. Using WinSCP, send the erasestudy command.
    ...     - 6. Within the device folder, locate the device rejection of the most recent erase study command. Verify there is a file with the format: erasestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 7. Using WinSCP, transfer the file erasestudy-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open with text editor.
    ...          On the last line of the text file, verify the text “Study not uploaded” is found.
    ...     - 8. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 9. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the upload study command.
    ...          Verify there is a file with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 10. In WinSCP, refresh the view. Within the device folder, verify there are 2 data files with the format:
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 11. In WinSCP, send the getlog command to retrieve the device log.
    ...     - 12. Within the device folder, verify the file with the format:
    ...           log-data-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           log-daily-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 13. Open Log-data-mm-dd-yy-hh-mm-ss+timezone.txt file with the text editor and verify the study set to “uploaded”status.
    ...     - 14. Erase study by sending the erasestudy command.
    ...     - 15. In WinSCP, refresh the view. Locate the device folder. Within the device folder, locate the device acknowledgement of the erase study command.
    ...           Confirm there is a file with the format: erasestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 16. Verify that the LED of the device changes from green light with flashing effect to green light with solid effect.
    [Tags]  BTDV-COMM-37    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-38: Start study without having to press and hold the event button on device
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The device shall enable starting the study without having to press and hold the “Event” button on the device
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
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
    ...     - 3. Wait for 1 minute for the device to start study without having to press and hold the “Event” button.
    ...     Test Output:
    ...     - 1. Wait for 5 minutes to ensure that the device has completed the study successfully.
    ...     - 2. Send the upload study command.
    ...     - 3. Wait for 10 minutes to finish the upload of the entire study.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the upload study command. Verify there is a file with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 5. In WinSCP, refresh the view. Within the device folder, verify there are 2 data files with the format:
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 6. Using WinSCP, send the erasestudy command.
    ...     - 7. In WinSCP, refresh the view. Locate the device folder. Within the device folder, locate the device acknowledgement of the erase study command.
    ...          Confirm there is a file with the format: erasestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 8. Verify that the device’s study status is changed from Study uploaded to Ready for new study in the Biotres gateway.
    ...     - 9. Using WinSCP, send getlog command.
    [Tags]  BTDV-COMM-38    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-39: Study will be auto completed when plug charger
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: If device is in paused state & study reaches its stop limit time, the study will be auto completed.
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
    ...     - 1. Wait for 1 minute while the study is in progress.
    ...     - 2. Plug charger to the device in 30 seconds.
    ...     - 3. Make sure don't unplug charger from device and don’t press "Event" button on the device.
    ...     - 4. Verify that the study will be auto completed by showing the status led in green light with flash effect at the 4th minutes.
    ...     - 5. Send the upload study command.
    ...     - 6. Using WinSCP, send getlog command.
    ...     - 7. Erase study by sending the erasestudy command.
    [Tags]  BTDV-COMM-39    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-40: OTA Firmware
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The device upgrade successfully from old firmware.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Downgrade the device to old firmware version.
    ...     Test Output:
    ...     - 1. Send file “Image firmware name.bin” to device folder.
    ...     - 2. Open “downloadfile”.txt command and write this file with content following:
    ...          dir="fw"
    ...          file="Image firmware name.bin"
    ...     - 3. In WinSCP, send the “downloadfile” command to user folder.
    ...     - 4. In WinSCP, refresh the view. Within the user folder, locate the device acknowledgement of the “downloadfile” command. Verify there is a file with the format: downloadfile-processing-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 5. Wait for the downloading process to complete. 
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command. Verify there is a file with the format: downloadfile-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 7. Open “clonefw”.txt command and write this file with content following: path="fw/ Image firmware name.bin"
    ...     - 8. In WinSCP, send the “clonefw” command to user folder.
    ...     - 9. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “clonefw” command. Verify there is a file with the format: clonefw-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 10. In WinSCP, send the “updatefw” command to user folder.
    ...     - 11. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “updatefw” command. Verify there is a file with the format: updatefw-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 12. In WinSCP, send the “getversion” command to user folder.
    ...     - 13. Using WinSCP, send getlog command.
    [Tags]  BTDV-COMM-40    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-41: Set Device ID
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The device still works properly when a new ID is set.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Make sure put the 32G SD card to the device.
    ...     - 3. Connect the device to Device Monitor Program.
    ...     - 4. Issue the command below to set ID for the biotres device: SM+ID="5m1000Pr1vat3Key_M3Ga17em0",<device ID>
    ...     Test Output:
    ...     - 1. Verify the device power-off. Then the device power-on again and the LED of device emits green light with solid effect.
    ...     - 2. Verify new device ID has been set for device by issuing the command below to set ID for the biotres device: SM+ID?
    ...     - 3. In WinSCP, send the getlog command using getlog.txt
    [Tags]  BTDV-COMM-41    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-42: Don't allow user resume study
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description: Don't allow user resume study when system time is incorrect.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. PatientId=123456
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
    ...     - 1. Waiting for 1 minute and long press the “Power” button for 5 seconds to power-off device.
    ...     - 2. Remove battery from the device.
    ...     - 3. Remove the device from Biotres Gateway.
    ...     - 4. Put the battery back into the device.
    ...     - 5. Long press the “Power” button for 5 seconds to power-on device.
    ...     - 6. Press and hold “Event” button for 5 seconds or more.
    ...     - 7. Verify device is still in the state of pausing by confirmation that the of the device emits white light with flash effect.
    ...     - 8. Press and hold “Event” button for 5 seconds or more.
    ...     - 9. Verify user can resume study by confirming that the LED of the device emits white light with pulse effect for 10 seconds then emits green light with pulse effect.
    ...     - 10. Wait to that the device has completed the study successfully.
    ...     - 11. Send the upload study command.
    ...     - 12. Upload the device log by sending getlog command.
    ...     - 13. Erase study by sending the erasestudy command.
    [Tags]  BTDV-COMM-42    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-43: Verify device switch to the state of erased
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: Study state should synchronized to NVM when study aborted.
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
    ...     Test Output:
    ...     - 1. Press and hold “Event” and “Power” button to abort study.
    ...     - 2. Remove battery from the device.
    ...     - 3. Put the battery back into the device.
    ...     - 4. Long press the “Power” button for 5 seconds to power-on device.
    ...     - 5. Verify device switch to the state of erased by confirming that the LED of the device emits green light with solid effect.
    ...     - 6. Upload the device log by sending getlog command.
    [Tags]  BTDV-COMM-43    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-44: Verify device not auto resume
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The device shall not automatically resume when the device occurs runtime exception.
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
    ...     - 4. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Connect the device for charging without power-off device.
    ...     - 2. Wait for the device notification associated with device being placed in PAUSE state.nIn WinSCP, refresh the view. Within the device folder, locate the device notification.
    ...     - 3. Unplug the device from charging.
    ...     - 4. Create runtime exception by removing the SD card. Then quickly insert it back to the SD card slot and make sure not connecting the ECG cable.
    ...     - 5. After the device is turned on. Waiting for 30 seconds. Verify device not auto resume, it is still in the state of pausing by confirmation that the LED of the device emits white light with flash effect.
    ...     - 6. Send the stopstudy command using stopstudy.txt.
    ...     - 7. Send the upload study command.
    ...     - 8. In WinSCP, send the getlog command.
    ...     - 9. Erase study by sending the erasestudy command.
    [Tags]  BTDV-COMM-44    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-45: Verify device is still in the state of setting up
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: Study state should synchronized to NVM when the device unexpectedly reboot.
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
    ...     - 1. Connect the device to the “Device Monitor” program. Issue the following command: SM+REBOOT.
    ...     - 2. After the device is turned on. Waiting for 10 ~15 seconds. Verify device is still in the state of setting up by confirmation that the LED of the device emits white light with solid effect.
    ...     - 3. Press and hold “Event” and “Power” button to abort study.
    ...     - 4. In WinSCP, send the getlog command.
    [Tags]  BTDV-COMM-45    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-46: The device receives the “reboot” command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description: If the device receives the “reboot” command, the device shall support remote reboot request.
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
    ...     - 4. Press and hold the “Event” button on the device for 5s to start study.
    ...     Test Output:
    ...     - 1. In WinSCP, send the reboot command.
    ...     - 2. After the device is turned on. Waiting for 10 ~15 seconds. Verify device is still in the state of setting up by confirmation that the LED of the device emits white light with solid effect.
    ...     - 3. Within the device folder, verify the file with the format: reboot-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 4. Wait for study complete.
    ...     - 5. In WinSCP, send the reboot command.
    ...     - 6. After the device is turned on. Waiting for 10 ~15 seconds, verify device is still completed by confirmation that the LED of the device emits green light with flash effect.
    ...     - 7. Within the device folder, verify the file with the format: reboot-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 8. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 9. Erase study by sending the erasestudy command.
    ...     - 10. In WinSCP, send the reboot command.
    ...     - 11. After the device is turned on. Waiting for 10 ~15 seconds, verify device is still Ready for new study by confirmation that the LED of the device emits green light with solid effect.
    ...     - 12. In WinSCP, send the getlog command.
    [Tags]  BTDV-COMM-46    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-47: Randomcmd - Reject unsupported command
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: If the device receives the “Randomcmd” command, the device shall provide a status of “REJECTED” along with the rejection reason of "Unsupported command - RandomCmd"
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
    ...     - 4. Press and hold the “Event” button on the device for 5s to start study.
    ...     Test Output:
    ...     - 1. In WinSCP, send randomcmd command.
    ...     - 2. Within the device folder, locate the device acknowledgement of the randomcmd command. Verify the file with the format: randomcmd-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Open the file randomcmd-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text: RejectionReason="Unsupported command - RandomCmd".
    ...     - 4. Send the stopstudy command using stopstudy.txt on WinSCP interface.
    ...     - 5. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 6. Erase study by sending the erasestudy command.
    ...     - 7. In WinSCP, send randomcmd command.
    ...     - 8. Within the device folder, Verify the file with the format: randomcmd-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 9. Open the file and verify the text: RejectionReason="Unsupported command - RandomCmd"
    ...     - 10. In WinSCP, send the getlog command.
    [Tags]  BTDV-COMM-47    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-48: Abort study
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: Device shall allow aborting study remotely and Device shall report "Aborted" study status to Gateway App.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Verify the device is connected to the server via Biotres gateway when device is on.
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
    ...     Test Output:
    ...     - 1. Verify the Biotres gateway displays study status as “Setting up”.
    ...     - 2. In WinSCP, send the arbortstudy command.
    ...     - 3. Verify the Biotres gateway displays study status as “Aborted”.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “abortstudy” command. Verify there is a file with the format:
    ...          startstudy-aborted-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          abortstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
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
    ...          NoiseTimePause=60
    ...     - 6. Wait for 1 minute for study to get initiated on the device.
    ...     - 7. Press and hold “power” and “Event” button to abort study.
    ...     - 8. Verify the Biotres gateway displays study status as “Aborted”.
    ...     - 9. In WinSCP, send the getlog command.
    [Tags]  BTDV-COMM-48    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-49: Use Internet Bridge
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description: Upload/get ECG study by Internet Bridge (Device Monitor).
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Verify the device is connected to the Internet Bridge mode by Device Monitor.
    ...     - 3. Initiate the Start Study command with the parameters below:
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
    ...     - 4. Wait for 1 minute for study to get initiated on the device.
    ...     - 5. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 10 minutes while the study is in progress.
    ...     - 2. Locate the getecg.txt file on the file system of the PC. Open the getecg.txt file in a text editor, configure to obtain a most recent 10-minutes segment of data and send getecg command using WinSCP.
    ...          Confirm the file has the following structure:
    ...          File Line	Description	Data
    ...          Start Date of the record	“MM/DD/YYYY”
    ...          Start Time of the record	“HH:MM:SS” Time should be local device time.
    ...          Stop Date of the record	“MM/DD/YYYY”
    ...          Stop Time of the record	“HH:MM:SS” Time should be local device time.
    ...          Time Zone	0
    ...     - 3. Using WinSCP, within the device folder, locate the device acknowledgement of the getecg completed upload command. Verify there are 3 files with format:
    ...          getecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          data-get-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-get-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 4. Wait for study completed. Open the getecg.txt file in a text editor, configure to obtain a most recent 120-minutes segment of data and send getecg command using WinSCP.
    ...     - 5. Within the device folder, locate the device acknowledgement of the getecg completed upload command. Verify there are 3 files with format:
    ...          getecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          data-get-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-get-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 6. Using WinSCP, send the uploadstudy command to upload full study data.
    ...     - 7. Within the device folder, locate the device acknowledgement of the upload study command. Verify there is a file with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 8. Using WinSCP, send getlog command.
    ...     - 9. Open the file log-data-mm-dd-yy-hh-mm-ss+timezone.txt. Verify the text: MUPLOAD Stopped (110KBps - 130KBps)
    ...     - 10. Using WinSCP, send the erasestudy command.
    ...     - 11. In WinSCP, refresh the view. Locate the device folder, within the device folder, locate the device acknowledgement of the erase study command.  Confirm there is a file with the format:
    ...           erasestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    [Tags]  BTDV-COMM-49    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-50: Send Getannsegment command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Upon receiving the server “getannsegment” command write segment from "startime" to "stoptime" equal 10 minutes, device software shall respond to the server along with status value as “DONE”.
    ...     - 2. Upon receiving the server “getannsegment” command and write segment from "startime" to "stoptime" is 10 minutes and 1 second, the device shall provide a status of “REJECTED” along with the rejection reason of “Invalid date/time”.
    ...     - 3. Upon receiving the server “getannsegment” command and write valid parameter "StatTime" and invalid parameter "StopTime", the device shall provide a status of “REJECTED” along with the rejection reason of “Invalid parameter(s)”.
    ...     - 4. Upon receiving the server “getannsegment” command and wtire invalid parameter "StartTime" and valid parameter "StopTime", the device shall provide a status of “REJECTED” along with the rejection reason of “Invalid parameter(s)”.
    ...     - 5. Upon receiving the server “getannsegment” command and make the StartTime and StopTime outside the study period, device software shall respond to the server along with status value as “DONE”.
    ...     - 6. Upon receiving the server “getannsegment” command and configure to the StartTime equal to the StopTime, the device shall provide a status of “REJECTED” along with the rejection reason of “Invalid parameter(s)”.
    ...     - 7. Upon receiving the server “getannsegment” command and configure to obtain a most recent 5 minutes segment of data but make the StartTime newer over the StopTime, the device shall provide a status of “REJECTED” along with the rejection reason of “Invalid parameter(s)”.
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
    ...     - 4. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 10 minutes.
    ...     - 2. Open getannsegment.txt file and write segment from "startime" to "stoptime" equal 10 minutes and send the getannsegment command to user folder.
    ...          File Line	Description	Data
    ...          Start Date of the record	“MM/DD/YYYY”
    ...          Start Time of the record	“HH:MM:SS” Time should be local device time.
    ...          Stop Date of the record	“MM/DD/YYYY”
    ...          Stop Time of the record	“HH:MM:SS” Time should be local device time.
    ...          Time Zone	0
    ...     - 3. In WinSCP, refresh the view. Within the user folder, locate the device acknowledgement of the getannsegment command. Verify there is a file with the format: getannsegment-processing-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command. Verify there is a file with the format:
    ...          getannsegment-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          ann-get-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 5. Open the ann-get-mm-dd-yy-hh-mm-ss+timezone.txt file using text editor. Verify that data of ann file.
    ...     - 6. Open getannsegment.txt file and write segment from "startime" to "stoptime" is 10 minutes and 1 second and send the getannsegment command to user folder.
    ...     - 7. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command. Verify there are all file with the format: getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 8. Open the file getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. On the last line of the text file, verify the text “Invalid date/time” is found on this line.
    ...     - 9. Open getannsegment.txt file and write valid parameter "StatTime" and invalid parameter "StopTime" and send the getannsegment command to user folder
    ...     - 10. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command.
    ...           Verify there are all file with the format: getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 11. Open the file getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. On the last line of the text file, verify the text “Invalid parameter(s)” is found on this line.
    ...     - 12. Open getannsegment.txt file and wtire invalid parameter "StartTime" and valid parameter "StopTime" and send the getannsegment command to user folder.
    ...     - 13. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command.
    ...           Verify there is a file with the format: getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 14. Open the file getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. On the last line of the text file, verify the text “Invalid parameter(s)” is found on this line.
    ...     - 15. Locate the getannsegment.txt file on the file system of the PC. Open the getannsegment.txt file in a text editor, configure to obtain 5 minutes segment of data but make the StartTime and StopTime outside the study period and send getannsegment command using WinSCP.
    ...     - 16. In WinSCP, refresh the view. Verify there are all file with the format:
    ...           getannsegment-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           ann-get-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 17. Open the file ann-get-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the file is empty data.
    ...     - 18. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command.
    ...           Verify there are all file with the format: getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 19. Open the file getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 20. Locate the getannsegment.txt file on the file system of the PC. Open the getannsegment.txt file in a text editor, configure to obtain a most recent 5 minutes segment of data but make the StartTime newer over the StopTime and send getannsegment command using WinSCP.
    ...     - 21. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command.
    ...           Verify there is a file with the format: getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 22. Open the file getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found on this line.
    ...     - 23. Send stopstudy command to stop active study.
    ...     - 24. Open getannsegment.txt command file and write valid parameter.
    ...     - 25. In WinSCP, send the getannsegment command to user folder.
    ...     - 26. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command. Verify there is a file with the format:
    ...           getannsegment-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           ann-get-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 27. Open the ann-get-mm-dd-yy-hh-mm-ss+timezone file using text editor. Verify that data of ann file.
    ...     - 28. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 29. In WinSCP, send the getannsegment command to user folder.
    ...     - 30. Confirm again from step 25 to step 27.
    ...     - 31. Upload the device log by sending getlog command.
    ...     - 32. Erase study by sending erasestudy command.
    [Tags]  BTDV-COMM-50    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-51: Send getann command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Upon receiving the server “getann” command while study has not completed, device software shall respond to the server along with status value as reject.
    ...     - 2. Upon receiving the server “getann” command while study has not uploaded, device software shall respond to the server along with status value as reject.
    ...     - 3. Device software shall respond to the server along with all of data when upon receiving the server “getann” commands with content of command as vaild parameter.
    ...     - 4. If the device receives the “getann” command after the study has been erased, the device shall provide a status of “REJECTED” along with the rejection reason of “Already erased”.
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
    ...     - 4. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Plug charger to the device and wait for 30 seconds.
    ...     - 2. In WinSCP, send the getann command to user folder.
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getann command. Verify there is a file with the format: getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 4. Open the file getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Study has not completed” is found.
    ...     - 5. Disconnect charger to the device and wait for 30 seconds.
    ...     - 6. In WinSCP, send the getann command to user folder.
    ...     - 7. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getann command. Verify there is a file with the format: getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 8. Open the file getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Study has not completed” is found
    ...     - 9. Send stopstudy command to stop active study.
    ...     - 10. In WinSCP, send the getann command to user folder.
    ...     - 11. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getann command. Verify there is a file with the format: getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 12. Open the file getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Study has not uploaded” is found.
    ...     - 13. Upload the study using the uploadstudy command.
    ...     - 14. Wait for the study to be uploaded, send the getann command.
    ...     - 15. In WinSCP, refresh the view. Verify there is a file with the format: getann-processing-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 16. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getann command. Verify there are 4files with the format:
    ...           getann-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           ann-all-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           ann-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           ann-mm-dd-yy-hh-mm-ss+timezone.anb
    ...     - 17. Open the getann-done-mm-dd-yy-hh-mm-ss+timezone.txt file using text editor. Verify that data of ann file.
    ...     - 18. Erase study by sending erasestudy command.
    ...     - 19. In WinSCP, send the getann command to user folder.
    ...     - 20. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getann command. Verify there is a file with the format: getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 21. Open the file getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already erased” is found on this line.
    ...     - 22. Upload the device log by sending getlog command.
    [Tags]  BTDV-COMM-51    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-52: Holter Study mode
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description: When turn on holter mode, device have to don't detect auto event.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Verify the device is connected to the server via Biotres gateway when device is on.
    ...     - 3. Initiate the Start Study command with the parameters below:
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
    ...     - 4. Wait for 1 minute for study to get initiated on the device.
    ...     - 5. Make sure the device is connected to the simulator and adjust ECG signal to 80BPM.
    ...     - 6. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. In WinSCP, refresh the view. Verify there are files with the format below:
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 2. Open the event-manual-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Manual Event Reason is set to “Baseline”.
    ...     - 3. Wait for 1 minute.
    ...     - 4. Verify that the the device sends the device status file to the server.
    ...     - 5. Using an ECG simulation tool, generate a Bradycardia event by setting the BPM to 40.
    ...     - 6. Auto event will be not detected by device. Verify that following files are not created:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 7. Using an ECG simulation tool, generate a TachyCardia event by setting the BPM to 160.
    ...     - 8. Auto event will be not detected by device. Verify that following files are not created:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 9. Using an ECG simulation tool, generate a Pause event in 3 seconds.
    ...     - 10. Auto event will be not detected by device. Verify that following files are not created:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 11. Using an ECG simulation tool, generate an Atrial Fibrillation coarse event.
    ...     - 12. Auto event will be not detected by device. Verify that following files of Afib event are not created:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 13. Press the "event" button. Don’t select any symptoms.
    ...     - 14. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the manual detected event. Verify there are 3 files with the format below:
    ...           event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-manual-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-manual-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 15. Open the event-manual-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify the “Manual event” entry and “None” entry under the title “Reason”.
    ...     - 16. Wait for to the beginning of every hour.
    ...     - 17. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement. Verify there is a file with the format: report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 18. Open the file report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify in “Brady/Tachy/AFib/Pause/LOff:” part, no event.
    ...     - 19. Using WinSCP, send stop study command to let the study finish.
    ...     - 20. Within the device folder, locate the device acknowledgement of the stop study command. Verify that following files with the format:
    ...           stopstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           note-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           report-final-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 21. Open the file report-final-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify parameter's value of events = 0
    ...     - 22. Upload study data using the uploadstudy command.
    ...     - 23. Upload HES annotation file by sending getann command.
    ...     - 24. Open the getann-done-mm-dd-yy-hh-mm-ss+timezone.txt file using text editor. Verify that in received ann file, there is no beat.
    ...     - 25. Upload the device log by sending getlog command.
    ...     - 26. Erase study by sending erasestudy command.
    [Tags]  BTDV-COMM-52    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-53: Holter Study mode
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description: MCT study - Holter Mode - MCT Study
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Verify the device is connected to the server via Biotres gateway when device is on.
    ...     - 3. Initiate the Start Study command with the parameters below:
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
    ...     - 4. Wait for 1 minute for study to get initiated on the device.
    ...     - 5. Make sure the device is connected to the simulator and adjust ECG signal to 80BPM.
    ...     - 6. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 1 minute.
    ...     - 2. Using an ECG simulation tool, generate a Bradycardia event by setting the BPM to 40.
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event. Verify there are 3 files with the format below:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 4. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Brady”.
    ...     - 5. Using an ECG simulation tool, generate a TachyCardia event by setting the BPM to 160.
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event. Verify there are 3 files with the format below:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 7. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Tachy”.
    ...     - 8. Using an ECG simulation tool, generate an Atrial Fibrillation coarse event.
    ...     - 9. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event. Verify there are 3 files with the format below:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 10. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Afib”.
    ...     - 11. Using an ECG simulation tool, generate a Pause event in 3 seconds.
    ...     - 12. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event. Verify there are 3 files with the format below:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 13. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Pause”.
    ...     - 14. Send the updatestudy.txt command using updatestudy.txt to revise:
    ...           BradyThresh=1
    ...           TachyThresh=300
    ...           PauseDetection=0
    ...           AfibDetection=0
    ...     - 15. Within the device folder, locate the device acknowledgement of the updatestudy command. Verify there are 2 files with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 16. Open the file report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify that in report-hourly, there is created event information.
    ...     - 17. Verify that the the device sends the device status file to the server.
    ...     - 18. Using an ECG simulation tool, generate a Bradycardia event by setting the BPM to 40.
    ...     - 19. Auto event will be not detected by device. Verify that following files are not created:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 20. Using an ECG simulation tool, generate a TachyCardia event by setting the BPM to 160.
    ...     - 21. Auto event will be not detected by device. Verify that following files are not created:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 22. Using an ECG simulation tool, generate a Pause event in 3 seconds.
    ...     - 23. Auto event will be not detected by device. Verify that following files are not created:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 24. Using an ECG simulation tool, generate an Atrial Fibrillation coarse event.
    ...     - 25. Auto event will be not detected by device. Verify that following files of Afib event are not created:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 26. Wait for to the beginning of every hour. Verify there are following files with format: report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 27. Open the file report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify in “Brady/Tachy/AFib/Pause/LOff:” part, no event.
    ...     - 28. Send the updatestudy.txt command using updatestudy.txt to revise:
    ...           BradyThresh=60
    ...           TachyThresh=120
    ...           PauseDetection=1
    ...           AfibDetection=1
    ...     - 29. Within the device folder, locate the device acknowledgement of the updatestudy command. Verify there are 2 files with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 30. Open the file report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify in “Brady/Tachy/AFib/Pause/LOff:” part, no event.
    ...     - 31. Using an ECG simulation tool, generate a Bradycardia event by setting the BPM to 40.
    ...     - 32. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event. Verify there are 3 files with the format below:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 33. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Brady”.
    ...     - 34. Using an ECG simulation tool, generate a TachyCardia event by setting the BPM to 160.
    ...     - 35. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event. Verify there are 3 files with the format below:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 36. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Tachy”.
    ...     - 37. Using an ECG simulation tool, generate an Atrial Fibrillation coarse event.
    ...     - 38. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event. Verify there are 3 files with the format below:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 39. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Afib”.
    ...     - 40. Using an ECG simulation tool, generate a Pause event in 3 seconds.
    ...     - 41. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event. Verify there are 3 files with the format below:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 42. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Pause”.
    ...     - 43. Using WinSCP, send stop study command to let the study finish.
    ...     - 44. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement. Verify there is a file with the format:
    ...           report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           report-final-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 45. Open the file report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify that in report-hourly, there is created event information.
    ...     - 46. Open the file report-final-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify in final report, there is event info of all MCT records.
    ...     - 47. Upload study data using the uploadstudy command.
    ...     - 48. Upload the device log by sending getlog command.
    ...     - 49. Erase study by sending erasestudy command.
    [Tags]  BTDV-COMM-53    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-54: Holter Study mode
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description: Holter Mode - MCT Study - Holter Mode
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Verify the device is connected to the server via Biotres gateway when device is on.
    ...     - 3. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=Ben Jones
    ...          Duration=60
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
    ...     - 4. Wait for 1 minute for study to get initiated on the device.
    ...     - 5. Make sure the device is connected to the simulator and adjust ECG signal to 80BPM.
    ...     - 6. Press and hold the “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the event button pressed action. Verify there are 3 files with the format below:
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 2. Open the event-manual-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Manual Event Reason is set to “Baseline”.
    ...     - 3. Wait for 1 minute.
    ...     - 4. Verify that the the device sends the device status file to the server.
    ...     - 5. Using an ECG simulation tool, generate a Bradycardia event by setting the BPM to 40.
    ...     - 6. Auto event will be not detected by device. Verify that following files are not created:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 7. Using an ECG simulation tool, generate a TachyCardia event by setting the BPM to 160.
    ...     - 8. Auto event will be not detected by device. Verify that following files are not created:
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 9. Using an ECG simulation tool, generate a Pause event in 3 seconds.
    ...     - 10. Auto event will be not detected by device. Verify that following files are not created:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 11. Using an ECG simulation tool, generate an Atrial Fibrillation coarse event.
    ...     - 12. Auto event will be not detected by device. Verify that following files of Afib event are not created:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 13. Wait for to the beginning of every hour.
    ...     - 14. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement. Verify there is a file with the format: report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 15. Open the file report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify in “Brady/Tachy/AFib/Pause/LOff:” part, no event.
    ...     - 16. Send the updatestudy.txt command using updatestudy.txt to revise:
    ...           BradyThresh=60
    ...           TachyThresh=120
    ...           PauseDetection=1
    ...           AfibDetection=1
    ...     - 17. Within the device folder, locate the device acknowledgement of the updatestudy command. Verify there is a file with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 18. Open the file report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify in “Brady/Tachy/AFib/Pause/LOff:” part, no event.
    ...     - 19. Using an ECG simulation tool, generate a Bradycardia event by setting the BPM to 40.
    ...     - 20. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event. Verify there are 3 files with the format below:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 21. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Brady”.
    ...     - 22. Using an ECG simulation tool, generate a TachyCardia event by setting the BPM to 160.
    ...     - 23. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event. Verify there are 3 files with the format below:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 24. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Tachy”.
    ...     - 25. Using an ECG simulation tool, generate an Atrial Fibrillation coarse event.
    ...     - 26. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event. Verify there are 3 files with the format below:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 27. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Afib”.
    ...     - 28. Using an ECG simulation tool, generate a Pause event in 3 seconds.
    ...     - 29. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the auto detected event. Verify there are 3 files with the format below:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 30. Open the event-auto-mm-dd-yy-hh-mm-ss+timezone.hea header file using text editor. Verify that Auto Event Reason is set to “Pause”.
    ...     - 31. Send the updatestudy.txt command using updatestudy.txt to revise:
    ...           BradyThresh=1
    ...           TachyThresh=300
    ...           PauseDetection=0
    ...           AfibDetection=0
    ...     - 32. Within the device folder, locate the device acknowledgement of the updatestudy command. Verify there are 2 files with the format:
    ...           updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 33. Open the file report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify that in report-hourly, there is created event information.
    ...     - 34. Verify that the the device sends the device status file to the server.
    ...     - 35. Using an ECG simulation tool, generate a Bradycardia event by setting the BPM to 40.
    ...     - 36. Auto event will be not detected by device. Verify that following files are not created:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 37. Using an ECG simulation tool, generate a TachyCardia event by setting the BPM to 160.
    ...     - 38. Auto event will be not detected by device. Verify that following files are not created:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 39. Using an ECG simulation tool, generate a Pause event in 3 seconds.
    ...     - 40. Auto event will be not detected by device. Verify that following files are not created:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 41. Using an ECG simulation tool, generate an Atrial Fibrillation coarse event.
    ...     - 42. Auto event will be not detected by device. Verify that following files of Afib event are not created:
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           event-auto-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 43. Wait for to the beginning of every hour. Verify there are following files with format: report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 44. Open the file report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify in “Brady/Tachy/AFib/Pause/LOff:” part, no event.
    ...     - 45. Using WinSCP, send stop study command to let the study finish.
    ...     - 46. Within the device folder, locate the device acknowledgement of the stop study command. Verify that following 4 files with the format:
    ...           stopstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           note-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           report-final-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 47. Open the file report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify in “Brady/Tachy/AFib/Pause/LOff:” part, no event.
    ...     - 48. Open the file report-final-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify in final report, there is event info of all MCT records.
    ...     - 49. Upload study data using the uploadstudy command.
    ...     - 50. Upload the device log by sending getlog command.
    ...     - 51. Erase study by sending erasestudy command.
    [Tags]  BTDV-COMM-54    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-COMM-55: Abort study
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: If the Device receives the “abortstudy” command, the device software shall provide a response status of “REJECTED” along with the rejection reason of “No Pending Study”.
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
    ...     - 4. Press and hold the "Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. In WinSCP, send the abortstudy command.
    ...     - 2. Within the device folder, locate the device acknowledgement of the abortstudy command. Verify the file with the format: abortstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Open the file abortstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text: RejectionReason="No pending study"
    ...     - 4. Wait for study complete.
    ...     - 5. In WinSCP, send the arbortstudy command.
    ...     - 6. Within the device folder, locate the device acknowledgement of the abortstudy command. Verify the file with the format: abortstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 7. Open the file abortstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text: RejectionReason="No pending study"
    ...     - 8. Upload study data using the uploadstudy command.
    ...     - 9. In WinSCP, send the arbortstudy command.
    ...     - 10. Within the device folder, locate the device acknowledgement of the abortstudy command. Verify the file with the format: abortstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 11. Open the file abortstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text: RejectionReason="No pending study"
    ...     - 12. Erase study by sending erasestudy command.
    ...     - 13. In WinSCP, send the arbortstudy command.
    ...     - 14. Within the device folder, locate the device acknowledgement of the abortstudy command. Verify the file with the format: abortstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 15. Open the file abortstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text:RejectionReason="No pending study"
    ...     - 16. In WinSCP, send the getlog command.
    [Tags]  BTDV-COMM-55    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library      project_bioheart_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${URL}  Get Config Param    WEB_BASE_URL
    Open Page  ${URL}

SUITE TEARDOWN
    Quit Browser