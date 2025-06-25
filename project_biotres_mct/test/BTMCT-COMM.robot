*** Settings ***
Documentation   Test Suite - Communication
Metadata        sid     BTMCT-COMM
Metadata        owner   Han Nguyen
Library         corelib/AssertionExtension.py
Library         corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}

Force Tags      BTMCT-COMM      device
Test Timeout    1h

*** Test Cases ***
BTMCT-COMM-01: Communications between Biotres device and server
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Communications between Biotres device and server are supported by a gateway via Bluetooth connection.
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device.
    ...     - 4. Press and hold the "Event" button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 5 minutes to ensure that the device has completed the study successfully.
    ...     - 2. Send the upload study command.
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the upload study command.
    ...          Verify there is a file with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ... 	- 4. In WinSCP, refresh the view. Within the device folder, verify there are 2 data files with the format:
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all--mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 5. Erase study by sending the erasestudy command.
    [Tags]      BTMCT-COMM-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-02: Device software shall be able to receive the following commands from the server
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Device software shall be able to receive the following commands from the server
    ...          Start Study
    ...          Stop Study.
    ...          Update Study
    ...          Upload Study Data.
    ...          Erase Study Data from the Biotres device.
    ...          Get ECG Record List
    ...          Get ECG Record (start time and stop time to be provided).
    ...          Get Device Log List
    ...          Get Device Log
    ...          Get Ann segment
    ...          Get Ann
    ...          Download Firmware Image
    ...          Validate Firmware Image
    ...          Clone Firmware Image
    ...          Update Firmware
    ...          Get hardware & firmware version
    ...          Abort study
    ...          Reboot device
    ...          Switch server
    ...          Unsupported command
    ...     Test Setup and Input:
    ...     Test Output:
    ...     - 1. Verify there are following files with format: startstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 2 of case TC_COMM_072_TC01)
    ...     - 2. Verify there are 2 files with the format: stopstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 2 of case TC_COMM_076_TC01)
    ...     - 3. Verify there are 1 file with the format: updatestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 5 of case TC_COMM_079_TC01)
    ...     - 4. Verify there is a file with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 14 of case TC_COMM_089_TC01)
    ...     - 5. Verify there is a file with the format: erasestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 6 of case TC_COMM_066_TC01)
    ...     - 6. Verify there are following files with format: listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 3 of case TC_COMM_082_TC01)
    ...     - 7. Verify there are following files with format (Refer to the result from step 3 of case TC_COMM_087_TC01)
    ...          getecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          data-get-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-get-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 8. Verify there are 1 file with the format: getloglist-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 4 of case TC_COMM_101_TC01)
    ...     - 9. Verify there are 1 file with the format: getlog-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 4 of case TC_COMM_102_TC01)
    ...     - 10. Verify there are 1 file with the format: getannsement-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 4 of case TC_COMM_133_TC01)
    ...     - 11. Verify there are 1 file with the format: getann-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 14 of case TC_COMM_132_TC01)
    ...     - 12. Verify there is a file with the format: downloadfile-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 8 of case TC_COMM_105_TC01)
    ...     - 13. Verify there is a file with the format: validatefile-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 4 of case TC_COMM_106_TC01)
    ...     - 14. Verify there is a file with the format: clonefw-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 6 of case TC_COMM_108_TC01)
    ...     - 15. Verify there is a file with the format: updatefw-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 5 of case TC_COMM_112_TC01)
    ...     - 16. Verify there is a file with the format: getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 2 of case TC_COMM_114_TC01)
    ...     - 17. Verify there is a file with the format: abortstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 2 of case TC_COMM_1114_TC01)
    ...     - 18. Verify there is a file with the format: reboot-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 4 of case TC_COMM_1115_TC01)
    ...     - 19. Verify there is a file with the format: switchserver-done-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 3 of case TC_COMM_1116_TC01)
    ...     - 20. Verify there is a file with the format: randomcmd-rejected-mm-dd-yy-hh-mm-ss+timezone.txt (Refer to the result from step 13 of case TC_COMM_1115_TC01)
    [Tags]      BTMCT-COMM-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-03: Upon receiving the server commands
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Upon receiving the server commands, device software shall respond to the server along with one of the following response status values: PROCESSING, DONE, ABORTED, REJECTED
    ...     - 2. Upon detecting that the format or data in the server command is not valid, the device software shall provide a response status of “REJECTED”
    ...          along with the rejection reason of “Invalid parameter(s)” to the server
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
    ...     - 1. Within the user folder, locate the device acknowledgement of the start study command. Verify there is a file with the format
    ...          startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 2. Press & hold “Event” and “Power” button to abort study.
    ...     - 3. In WinSCP, within the device folder, locate the device rejection of the start study command. Verify there is a file with the format
    ...          startstudy-aborted-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 4. Initiate the Start Study command with the parameters below:
    ...          PatientId=123456
    ...          PatientName=EMPTY – no data
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
    ...     - 6. Within the device folder, locate the device rejection of the start study command. Verify there is a file with the format
    ...          startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 7. Using WinSCP, to a local folder on the PC and open the file using a text editor. Verify the text “Invalid parameter(s)” is found.
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
    ...     - 9. Wait for at least 5 minutes for study to complete.
    ...     - 10. In WinSCP, within the device folder locate the device acknowledgement of the most recent startstudy command. Verify there is a file with the format
    ...          Startstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 11. Upload the study using the uploadstudy command.
    ...     - 12. Wait for the study to be uploaded, send getlog command.
    ...     - 13. Erase study by sending the erasestudy command.
    [Tags]      BTMCT-COMM-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-04: Once the power up sequence is completed
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Once the power up sequence is completed, device shall enter the waiting for study state.
    ...     Test Setup and Input:
    ...     - 1. Make sure the device was turned off after the last study; if not turn off the device by pressing and holding the Home button for 10 seconds.
    ...     - 2. Turn on the Biotres device by pressing and holding the Home Button for 3-5 seconds on the device
    ...     Test Output:
    ...     - 1. Visually inspect that the Biotres device under test is fully charged.
    ...     - 2. Connect the ECG cable to the Biotres device by firmly inserting the cable connector into the cable receptacle as shown in Instructions For Use (IFU) document.
    ...     - 3. Connect the other end of the patient ECG Cable snap to the electrodes on the ECG Simulator device.
    ...          Once the power-up sequence is complete in the device, the LED of device will emit green light with solid effect
    ...     - 4. Verify the “Waiting for study state” in the log saved by the device firmware.
    ...     - 5. Verify the device initialization on power on by uploading the device log using the getlog command.
    [Tags]      BTMCT-COMM-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-05: Device receives the “startstudy” command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives the “startstudy” command, the Device shall enter the study setup and provide a response status of “PROCESSING”.
    ...     - 2. When the authorized user finishes the study setup and chooses to start the study, the device shall begin an active study and provide a response of “DONE”
    ...     - 3. If the device is under active study and the “startstudy” command is received, the Device shall provide a response status of “REJECTED”
    ...          along with the rejection reason being “Study is in progress”
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
    ...     Test Output:
    ...     - 1. Within the user folder, locate the device acknowledgement of the start study command. Verify there is a file with the format
    ...          startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 2. Within the device folder, locate the device acknowledgement of the most recent startstudy command. Verify there is a file with the format
    ...          startstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 3. Using WinSCP, to a local folder on the PC and open in text editor. On the last line of the text file,
    ...          verify the text “StartTime=<exact study start date time in mm/dd/yyy hh:mm:ss with timezone>” is found on this line. Make a note of start datetime from startstudy-done.txt
    ...     - 4. Using a file navigation GUI tool, locate the startstudy.txt file.
    ...          Drag the startstudy.txt file from the file navigation GUI tool to the user folder in WinSCP.
    ...     - 5. In WinSCP, refresh the view. Within the device folder, locate the device rejection of the most recent start study command. Verify there is a file with the format
    ...          startstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 6. On the last line of the text file, verify the text “Study is in progress” is found.
    ...     - 7. Wait for the study to get completed.
    ...     - 8. Upload the study using the uploadstudy command.
    ...     - 9. Wait for the study to be uploaded, send getlog command.
    ...     - 10. Erase study by sending the erasestudy command.
    [Tags]      BTMCT-COMM-05    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-06: Device receives abort the study command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. When the authorized User chooses to abort the study, the device software shall provide a response status of “ABORTED”
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
    ...     - 1. In WinSCP, within the user folder, locate the device acknowledgement of the start study command. Verify there is a file with the format
    ...          startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 2. Press & hold “Event” and “Power” button to abort study.
    ...     - 3. In WinSCP, within the device folder, locate the device rejection of the start study command. Verify there is a file with the format
    ...          startstudy-aborted-mm-dd-yy-hh-mm-ss+timezone.txt
    [Tags]      BTMCT-COMM-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-07: Device receives the “stopstudy” command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the Device receives the “stopstudy” command during an active study, the device software shall end the current study and provide a response status of “DONE”.
    ...     - 2. If the Device receives the “stopstudy” command when not in an active study, the device software shall provide a response status of “REJECTED”
    ...          along with the rejection reason of “Already stopped”.
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
    ...     - 4. Press and hold the "Event" button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Send the stopstudy command using stopstudy.txt on WinSCP interface.
    ...     - 2. Within the device folder, locate the device acknowledgement of the stop study command. Verify there are 2 files with the format
    ...          stopstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          note- mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Using WinSCP, transfer the file stopstudy-done-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open with text editor.
    ...          On the last line of the text file, verify the text “StopTime=”<exact study stop datetime> <timezone>”” is found on this line.
    ...     - 4. Send the stopstudy command using stopstudy.txt on WinSCP interface.
    ...     - 5. In WinSCP, refresh the view. Within the device folder, locate the device rejection of the most recent stop study command. Verify there is a file with the format
    ...          stopstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 6. Open the file using the text editor. Verify the text “Already Stopped” is found on this line.
    ...     - 7. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 8. Erase study by sending the erasestudy command.
    [Tags]      BTMCT-COMM-07    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-08: Device receives the “stopstudy” command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the Device receives the “stopstudy” command during an active study, the device software shall end the current study and provide a response status of “DONE”.
    ...     - 2. If the Device receives the “stopstudy” command when not in an active study, the device software shall provide a response status of “REJECTED”
    ...          along with the rejection reason of “Already stopped”.
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
    ...     - 1. Once the study has started, locate and press the event button.
    ...     - 2. While the post trigger storage for manual event is still in progress, send the stopstudy command via WinSCP.
    ...     - 3. Wait for 2 minutes to complete the pre, post trigger recording.
    ...     - 4. Wait for additional 2 minutes for device to post the manual event data.
    ...     - 5. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the event button pressed action.
    ...          Verify there are files with the format below:
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.dat
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.ann
    ...     - 6. Within the device folder, locate the device acknowledgement of the stop study command. Verify there are 2 files with the format
    ...          stopstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          note- mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 7. Using WinSCP, transfer the file stopstudy-done-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open with text editor.
    ...          On the last line of the text file, verify the text “StopTime=”<exact study stop datetime> <timezone>”” is found on this line.
    ...     - 8. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 9. Erase study by sending the erasestudy command.
    [Tags]      BTMCT-COMM-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-09: Device receives "updatestudy" command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives "updatestudy" command during study with any of the parameters below, it shall update the requested study setup parameters.
    ...          The device shall send a response status as “DONE”
    ...     - 2. If "updatestudy" command was sent with non-study related parameter or invalid parameter value, the device shall send a response status
    ...          as “REJECTED” along with the rejection reason of “Invalid parameter(s)
    ...     - 3. If "updatestudy" command was sent when device was not in an active study, the device shall send a response status as “REJECTED” along
    ...          with the rejection reason of “Already stopped”.
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
    ...     - 1. Wait for 2 minutes after the study has started.
    ...     - 2. Send the update study command using updatestudy.txt to revise Duration to 10
    ...     - 3. Wait for 1 minute to have the study updated, verify that Duration is changed to 10.
    ...     - 4. Send the update study command using updatestudy.txt to revise PreEvent to 60.
    ...     - 5. Wait for 1 minute to have the study updated, verify that PreEvent is changed to 60.
    ...     - 6. Send the update study command using updatestudy.txt to revise PostEvent to 60.
    ...     - 7. Wait for 1 minute to have the study updated, verify that PostEvent is changed to 60.
    ...     - 8. Send the update study command using updatestudy.txt to revise BradyThresh to 40.
    ...     - 9. Wait for 1 minute to have the study updated, verify that BradyThresh is changed to 40.
    ...     - 10. Send the update study command using updatestudy.txt to revise TachyThresh to 160.
    ...     - 11. Wait for 1 minute to have the study updated, verify that TachyThresh is changed to 160.
    ...     - 12. Send the update study command using updatestudy.txt to revise PauseThresh to 3500.
    ...     - 13. Wait for 1 minute to have the study updated, verify that PauseThresh is changed to 3500.
    ...     - 14. Send the update study command using updatestudy.txt to revise PauseDetection to 0.
    ...     - 15. Wait for 1 minute to have the study updated, verify that PauseDetection is changed to 0.
    ...     - 16. Send the update study command using updatestudy.txt to revise AfibDetection to 0.
    ...     - 17. Wait for 1 minute to have the study updated, verify that AfibDetection is changed to 0.
    ...     - 18. Send the update study command using updatestudy.txt to revise AlgorithmLead to 2.
    ...     - 19. Wait for 1 minute to have the study updated, verify that AlgorithmLead is changed to 2.
    ...     - 20. Send the update study command using updatestudy.txt to revise NoiseTimeBradyTachy to 600
    ...     - 21. Wait for 1 minute to have the study updated, verify that NoiseTimeBradyTachy is changed to 600
    ...     - 22. Send the update study command using updatestudy.txt to revise NoiseTimeAfib to 600
    ...     - 23. Wait for 1 minute to have the study updated, verify that NoiseTimeAfib is changed to 600
    ...     - 24. Send the update study command using updatestudy.txt to revise NoiseTimePause to 120
    ...     - 25. Wait for 1 minute to have the study updated, verify that NoiseTimePause is changed to 120
    ...     - 26. Send the update study command using updatestudy.txt to revise Duration to 43201
    ...     - 27. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 28. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 29. Send the updatestudy.txt command using updatestudy.txt to revise PreEvent to 41.
    ...     - 30. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 31. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 32. Send the updatestudy.txt command using updatestudy.txt to revise PostEvent to 35.
    ...     - 33. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 34. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 35. Send the updatestudy.txt command using updatestudy.txt to revise BradyThresh to 400.
    ...     - 36. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 37. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 38. Send the updatestudy.txt command using updatestudy.txt to revise TachyThresh to 500.
    ...     - 39. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 40. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 41. Send the updatestudy.txt command using updatestudy.txt to revise PauseThresh to 75000.
    ...     - 42. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 43. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 44. Send the updatestudy.txt command using updatestudy.txt to revise PauseDetection to 3.
    ...     - 45. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 46. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 47. Send the updatestudy.txt command using updatestudy.txt to revise AfibDetection to 3.
    ...     - 48. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 49. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 50. Send the updatestudy.txt command using updatestudy.txt to revise AlgorithmLead to 4.
    ...     - 51. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 52. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 53. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeBradyTachy to 3601.
    ...     - 54. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 55. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 56. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeAfib to 3601.
    ...     - 57. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 58. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 59. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimePause to 3601
    ...     - 60. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 61. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 62. Wait a few minutes to study complete.
    ...     - 63. Send the update study command using updatestudy.txt to revise Duration to 10
    ...     - 64. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “updatestudy” command. Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 65. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 66. Send the updatestudy.txt command using updatestudy.txt to revise PreEvent to 60.
    ...     - 67. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 68. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 69. Send the updatestudy.txt command using updatestudy.txt to revise PostEvent to 60.
    ...     - 70. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 71. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 72. Send the updatestudy.txt command using updatestudy.txt to revise BradyThresh to 40.
    ...     - 73. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 74. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 75. Send the updatestudy.txt command using updatestudy.txt to revise TachyThresh to 180.
    ...     - 76. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 77. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 78. Send the updatestudy.txt command using updatestudy.txt to revise PauseThresh to 3500.
    ...     - 79. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 80. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 81. Send the updatestudy.txt command using updatestudy.txt to revise PauseDetection to 0.
    ...     - 82. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 83. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 84. Send the updatestudy.txt command using updatestudy.txt to revise AfibDetection to 0.
    ...     - 85. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 86. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 87. Send the updatestudy.txt command using updatestudy.txt to revise AlgorithmLead to 3.
    ...     - 88. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 89. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 90. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeBradyTachy to 3600.
    ...     - 91. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 92. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 93. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimeAfib to 3600.
    ...     - 94. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 95. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 96. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimePause to 3600
    ...     - 97. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format:
    ...           updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 98. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 99. Send the updatestudy.txt command using updatestudy.txt to revise NoiseTimePause to 3600
    ...     - 100. Within the device folder, locate the device rejection of the most recent updatestudy command. Verify there is a file with the format:
    ...            updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 101. Open the file updatestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already stopped” is found.
    ...     - 102. Using WinSCP, send the uploadstudy command.
    ...     - 103. Using WinSCP, send the erasestudy command.
    ...     - 104. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgment of the erase study command. Confirm there is a file with the format:
    ...            erasestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    [Tags]      BTMCT-COMM-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-10: Device receives "listecg" command
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device.
    ...     - 4. Press and hold the "Event" button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 1 minutes while the study is in progress.
    ...     - 2. Using WinSCP, send listecg command. Confirm the file has the following structure: Time Zone 0 (Should be local device time zone)
    ...     - 3. Within the device folder, locate the device acknowledgement of the listecg completed upload command. Verify there are following files with format:
    ...          listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt. Open “listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt” file and verify that there is only 1 record with following format:
    ...          <startTimeStrRecord1>,<stopTimeStrRecord1>
    ...          TimeZone=<timeZone>
    ...     - 4. Plug charger to the device and wait for 30 seconds. Then disconnect charger to the device and resume study
    ...     - 5. Wait for additional 4 minutes to complete the study.
    ...     - 6. Locate the listecg.txt file on the file system of the PC. Open the listecg.txt file in a text editor, configure to obtain a most recent 5 minutes ECG records and
    ...          send listecg command using WinSCP.
    ...     - 7. Within the device folder, locate the device acknowledgement of the listecg completed upload command. Verify there are following files with format:
    ...          listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt. Open “listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt” file and verify that there are 2 records with following format:
    ...          <startTimeStrRecord1>,<stopTimeStrRecord1>
    ...          <startTimeStrRecord2>,<stopTimeStrRecord2>
    ...          TimeZone=<timeZone>
    ...     - 8. Upload the study using the uploadstudy command.
    ...     - 9. Locate the listecg.txt file on the file system of the PC. Open the listecg.txt file in a text editor, configure to obtain a most recent 5 minutes ECG records
    ...          and send listecg command using WinSCP.
    ...     - 10. Within the device folder, locate the device acknowledgement of the listecg completed upload command. Verify there are following files with format:
    ...           listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt. Open “listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt” file and verify that there are 2 records with following format:
    ...          <startTimeStrRecord1>,<stopTimeStrRecord1>
    ...          <startTimeStrRecord2>,<stopTimeStrRecord2>
    ...          TimeZone=<timeZone>
    ...     - 11. Erase study by sending the erasestudy command.
    [Tags]      BTMCT-COMM-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-11: The device receives "listecg" command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives "listecg" command, it shall provide the list of ECG records ready to be uploaded for the duration asked in the command.
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
    ...     - 4. Press and hold the "Event" button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 1 minutes while the study is in progress.
    ...     - 2. Locate the listecg.txt file on the file system of the PC. Open the list ecg.txt file in a text editor, configure to obtain a most recent 1 minutes ECG records
    ...          and send listecg command using WinSCP. Confirm the file has the following structure:
    ...          Start Date of the record	“MM/DD/YYYY”
    ...          Start Time of the record	“HH:MM:SS (Time should be local device time)
    ...          Stop Date of the record	“MM/DD/YYYY”
    ...          Stop Time of the record	“HH:MM:SS (Time should be local device time)
    ...          Time Zone	0 (Should be local device time zone)
    ...     - 3. Within the device folder, locate the device acknowledgement of the listecg completed upload command. Verify there are following files with format:
    ...          listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt. Open “listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt” file and verify that there is only 1 record with following format:
    ...          <startTimeStrRecord1>,<stopTimeStrRecord1>
    ...          TimeZone=<timeZone>
    ...     - 4. Plug charger to the device and wait for 30 seconds. Then disconnect charger to the device and resume study
    ...     - 5. Wait for additional 4 minutes to complete the study.
    ...     - 6. Locate the listecg.txt file on the file system of the PC. Open the listecg.txt file in a text editor, configure to obtain a most recent 5 minutes ECG records
    ...          and send listecg command using WinSCP.
    ...     - 7. Within the device folder, locate the device acknowledgement of the listecg completed upload command. Verify there are following files with format:
    ...          listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          Open “listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt” file and verify that there are 2 records with following format:
    ...          <startTimeStrRecord1>,<stopTimeStrRecord1>
    ...          <startTimeStrRecord2>,<stopTimeStrRecord2>
    ...          TimeZone=<timeZone>
    ...     - 8. Upload the study using the uploadstudy command.
    ...     - 9. Locate the listecg.txt file on the file system of the PC. Open the listecg.txt file in a text editor, configure to obtain a most recent 5 minutes ECG records
    ...          and send listecg command using WinSCP.
    ...     - 10. Within the device folder, locate the device acknowledgement of the listecg completed upload command.
    ...           Verify there are following files with format: listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           Open “listecg-done-mm-dd-yy-hh-mm-ss+timezone.txt” file and verify that there are 2 records with following format:
    ...           <startTimeStrRecord1>,<stopTimeStrRecord1>
    ...           <startTimeStrRecord2>,<stopTimeStrRecord2>
    ...           TimeZone=<timeZone>
    ...     - 11. Erase study by sending the erasestudy command.
    [Tags]      BTMCT-COMM-11    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-12: The device receives "listecg" command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If start date time is newer than stop date time, the device shall send a response status as “REJECTED” along with the rejection reason of “Invalid parameter(s)”.
    ...     - 2. If the device receives "listecg" command; and if the requested duration is outside the study duration, the device shall send a response status as “REJECTED”
    ...          along with the rejection reason of “Invalid date/time”.
    ...     - 3. If the device receives the “listecg” command after the study has been erased, the device shall provide a status of “REJECTED”
    ...          along with the rejection reason of “Invalid date/time”.
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
    ...     Test Output:
    ...     - 1. Wait for 2 minutes while the study is in progress.
    ...     - 2. Open the listecg.txt file in a text editor, configure to obtain a most recent 2 minutes ECG records but make the StartTime newer over the StopTime and
    ...          send listecg command using WinSCP. Confirm the file has the following structure:
    ...          Start Date of the record	“MM/DD/YYYY
    ...          Start Time of the record	“HH:MM:SS” ” (Time should be local device time.)
    ...          Stop Date of the record	“MM/DD/YYYY”
    ...          Stop Time of the record	“HH:MM:SS” (Time should be local device time.)
    ...          Time Zone	0 (should be local device time zone)
    ...     - 3. Within the device folder, locate the device acknowledgement of the listecg completed upload command. Verify there are following files with format:
    ...          listecg-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 4. Open file listecg-rejected-mm-dd-yy-hh-mm-ss+timezone verify the text “Invalid parameter(s)” is found on this line.
    ...     - 5. Locate the listecg.txt file on the file system of the PC. Open the listecg.txt file in a text editor, configure to obtain a most recent 2 minutes
    ...          ECG records but make the StartTime and StopTime outside the study duration and send listecg command using WinSCP.
    ...     - 6. Within the device folder, locate the device acknowledgement of the listecg completed upload command. Verify there are following files with format:
    ...          listecg-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 7. Open file listecg-rejected-mm-dd-yy-hh-mm-ss+timezone verify the text “Invalid date/time” is found on this line.
    ...     - 8. Wait for a few minutes to let the study finish
    ...     - 9. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 10. Erase study by sending the erasestudy command.
    ...     - 11. Open the listecg.txt file in a text editor, configure to obtain a 2-minute ECG records but make the StartTime and StopTime inside the study duration
    ...           and send listecg command using WinSCP.
    ...     - 12. Within the device folder, verify there are following files with format: listecg-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 13. Open in text editor, verify the text “Invalid date/time” is found.
    ...     - 14. Using WinSCP, send getlog command
    [Tags]      BTMCT-COMM-12    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-13: Get ECG record
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Get ECG Record: The "getecg" command shall have the start date time and the stop date time of the requested ECG data
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
    ...     Test Output:
    ...     - 1. Wait for 2 minutes while the study is in progress.
    ...     - 2. Locate the getecg.txt file on the file system of the PC. Open the getecg.txt file in a text editor, configure to obtain a most recent 2-minutes segment of data
    ...          and send getecg command using WinSCP.
    ...          Confirm the file has the following structure:
    ...          Start Date of the record	“MM/DD/YYYY”
    ...          Start Time of the record	“HH:MM:SS” Time should be local device time.
    ...          Stop Date of the record	“MM/DD/YYYY”
    ...          Stop Time of the record	“HH:MM:SS” Time should be local device time.
    ...          Time Zone	0
    ...     - 3. Using WinSCP - Within the device folder, locate the device acknowledgement of the getecg completed upload command. Verify there are following files with format:
    ...          getecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          data-get-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-get-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 4. Wait for additional 3 minutes to complete the study.
    ...     - 5. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 6. Create an local "SD card" folder on the PC
    ...     - 7. Connect the device to the “Device Monitor” program
    ...     - 8. Switch the device to the “Mass Storage” mode
    ...     - 9. Copy the yyyymmdd-hhmmss.dat file in the “rec” folder to the “SD card” folder:
    ...     - 10. Create an local "Device" folder on the PC
    ...     - 11. Using WinSCP, transfer the following files to “Device” folder:
    ...           data-get-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           data-get-mm-dd-yy-hh-mm-ss+timezone.dat
    ...           data-all- mm-dd-yy-hh-mm-ss+timezone.hea
    ...           data-all- mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 12. Use “ECG Verification” program to verify the ecg data of two folder “SD card” and “Device” folder.
    ...     - 13. Make sure the program does not report any warning on the verification result.
    ...     - 14. Erase study by sending the erasestudy command.
    [Tags]      BTMCT-COMM-13    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-14: The device receives the “getecg” command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives the “getecg” command and the start/stop date times are within the device study period,
    ...          the device shall upload an ecgdata record with the data from the start date time to the end date time.
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
    ...     Test Output:
    ...     - 1. Wait for 2 minutes while the study is in progress.
    ...     - 2. Locate the getecg.txt file on the file system of the PC. Open the getecg.txt file in a text editor, configure to obtain a most recent 2-minutes
    ...          segment of data and send getecg command using WinSCP.
    ...          Confirm the file has the following structure:
    ...          Start Date of the record	“MM/DD/YYYY”
    ...          Start Time of the record	“HH:MM:SS” Time should be local device time.
    ...          Stop Date of the record	“MM/DD/YYYY”
    ...          Stop Time of the record	“HH:MM:SS” Time should be local device time.
    ...          Time Zone	0
    ...     - 3. Using WinSCP, locate the device acknowledgement of the getecg completed upload command. Verify there are following files with format:
    ...          getecg-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          data-get-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-get-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 4. Send the stopstudy command to stop the active study.
    ...     - 5. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 6. Erase study by sending the erasestudy command.
    [Tags]      BTMCT-COMM-14    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-15: The device shall provided status when send the getecg command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If start date time is newer than stop date time, the device shall send a response status as “REJECTED” along with the rejection reason of “Invalid parameter(s)”.
    ...     - 2. If the device receives the “getecg” command and the start/stop date times fall outside of the device study period, the device shall provide a status
    ...          of “REJECTED” along with the rejection reason of “Invalid date/time”.
    ...     - 3. If the device receives the “getecg” command after the study has been erased, the device shall provide a status of “REJECTED” along
    ...          with the rejection reason of “Invalid date/time”.
    ...     - 4. If the Device receives the “getecg” command while a manual is being processed, the device shall provide a status of “REJECTED” along with the rejection reason
    ...          of “MCT event is being processed”.
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
    ...     - 4. Press and hold the "Event" button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 2 minutes while the study is in progress.
    ...     - 2. While study is in progress, locate and press the event button.
    ...     - 3. While post trigger recording from the manual event is still in progress, send the getecg command for the most recent 2 minutes of study which is still in progress.
    ...          Start Date of the record	“MM/DD/YYYY”
    ...          Start Time of the record	“HH:MM:SS” Time should be local device time.
    ...          Stop Date of the record	“MM/DD/YYYY”
    ...          Stop Time of the record	“HH:MM:SS” Time should be local device time.
    ...          Time Zone	0
    ...     - 4. Within the device folder, locate the device rejection of the most recent getecg command. Verify there is a file with the format:
    ...          getecg-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 5. Open with text editor. Verify the text “MCT event is being processed” is found.
    ...     - 6. Locate the getecg.txt file on the file system of the PC. Open the getecg.txt file in a text editor, configure to obtain a most recent 2-minutes segment of data
    ...          but make the StartTime newer over the StopTime and send getecg command using WinSCP.
    ...     - 7. Using WinSCP, within the device folder, locate the device acknowledgement of the getecg completed upload command. Verify there are following files with format:
    ...          getecg-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 8. Open a file getecg-rejected-mm-dd-yy-hh-mm-ss+timezone in text editor. Verify the text “Invalid Parameters(s)” is found.
    ...     - 9. Open the getecg.txt file in a text editor, configure to obtain a 2-minutes segment of data but make the StartTime and StopTime outside the study period and send
    ...          getecg command using WinSCP.
    ...     - 10. Using WinSCP, locate the device acknowledgement of the getecg completed upload command. Verify there are following files with format:
    ...           getecg-rejected-mm-dd-yy-hh-mm-ss+timezone
    ...     - 11. Open a file getecg-rejected-mm-dd-yy-hh-mm-ss+timezone in text editor. Verify the text “Invalid date/time” is found.
    ...     - 12. Send the stopstudy command to stop the active study.
    ...     - 13. Upload the study using the uploadstudy command.
    ...     - 14. In WinSCP, within the device folder, verify there are 3 data files with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 15. Erase study by sending the erasestudy command.
    ...     - 16. Confirm there is a file with the format
    ...           erasestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 17. Locate the getecg.txt file on the file system of the PC. Open the getecg.txt file in a text editor, configure to obtain a 5-minutes segment of data during
    ...           when the study was ON and send getecg command using WinSCP.
    ...     - 18. Using WinSCP, locate the device acknowledgement of the getecg completed upload command. Verify there are following files with format:
    ...           getecg-rejected-mm-dd-yy-hh-mm-ss+timezone
    ...     - 19. Open a file getecg-rejected-mm-dd-yy-hh-mm-ss+timezone in text editor. Verify the text “Invalid date/time” is found.
    [Tags]      BTMCT-COMM-15    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-16: Device receives the “uploadstudy” command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives the “uploadstudy” command after a study has been completed and not erased, the device shall upload a study record
    ...          with all data recorded for the most recent study.
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
    ...     Test Output:
    ...     - 1. Wait for 5 minutes to ensure that the device has completed the study successfully.
    ...     - 2. Send the upload study command.
    ...     - 3. Wait for 10 minutes to finish the upload of the entire study.
    ...     - 4. In WinSCP, refresh the view. Verify there are 3 files with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all--mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 5. Create an local "Device" folder on the PC
    ...     - 6. Using WinSCP, transfer the following files to “Device” folder:
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 7. Create an local "SD card" folder on the PC
    ...     - 8. Connect the device to the “Device Monitor” program
    ...     - 9. Switch the device to the “Mass Storage” mode
    ...     - 10. Copy the yyyymmdd-hhmmss.dat file in the “rec” folder to the “SD card” folder
    ...     - 11. Use “ECG Verification” program to verify the ecg data of two folder “SD card” and “Device” folder.
    ...     - 12. Make sure the program does not report any warning on the verification result
    ...     - 13. Erase study by sending the erasestudy command.
    [Tags]      BTMCT-COMM-16    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-17: The device shall initiate upload of study data and provide status
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. While in communication with server via Biotres gateway, the device shall initiate upload of study data after the study is completed
    ...     - 2. If the device receives the “uploadstudy” command during an active study, the device shall provide a status of “REJECTED” along with the rejection
    ...          reason of “Study is in progress”.
    ...     - 3. If the device receives the “uploadstudy” command after the most recent study has been erased, the device shall provide a status of “REJECTED”
    ...          along with the rejection reason of “Already erased”.
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
    ...     Test Output:
    ...     - 1. While the study is in progress, locate and send the uploadstudy using uploadstudy.txt using WinSCP.
    ...     - 2. In WinSCP, refresh the view. Locate the device rejection of the most recent upload study command. Verify there is a file with the format
    ...          uploadstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Open in text editor. Verify the text “Study is in progress” is found.
    ...     - 4. After the study has completed, locate and send the uploadstudy using uploadstudy.txt using WinSCP.
    ...     - 5. In WinSCP, within the user folder for the given device, locate the device acknowledgement of the upload study command. Verify there is a file with the format:
    ...          uploadstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 6. Wait for at least 10 minutes. Within the device folder, locate the device acknowledgement of the upload study command. Verify there is a file with the format:
    ...          uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 7. In WinSCP, within the device folder, verify there are 2 data files with the format:
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 8. Locate erasestudy.txt and using WinSCP, send the erasestudy command.
    ...     - 9. In WinSCP, refresh the view. Locate the device folder. Within the device folder, locate the device acknowledgement of the erase study command.
    ...          Confirm there is a file with the format: erasestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 10. After the study has completed, locate and send the uploadstudy using uploadstudy.txt using WinSCP.
    ...     - 11. Within the device folder, locate the device rejection of the most recent upload study command. Verify there is a file with the format
    ...           uploadstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 12. Open with text editor. Verify the text “Already erased” is found.
    [Tags]      BTMCT-COMM-17    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-18: The device shall enable uploading of study data when the device is being charged during a study.
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. While in communication with Server via Biotres gateway, the device shall enable uploading of study data when the device is being charged during a study.
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
    ...     Test Output:
    ...     - 1. Wait for 5 minutes to ensure that the device has completed the study successfully.
    ...     - 2. Connect the device to the charger and wait for 30 seconds
    ...     - 3. Send the uploadstudy command.
    ...     - 4. Wait until to finish upload of the entire study.
    ...     - 5. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the upload study command.
    ...          Verify there is a file with the format
    ...          uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 6. In WinSCP, refresh the view. Within the device folder, verify there are 2 data files with the format
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.dat.
    ...     - 7. Erase study by sending the erasestudy command.
    [Tags]      BTMCT-COMM-18    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-19: Send the “erasestudy” command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives the “erasestudy” command when in an active study, the device shall provide a response status of “rejected” along with the
    ...          rejection reason of “Study has not completed”.
    ...     - 2. If the device receives the “erasestudy” command after a study has been completed and the study data has not been erased, the device shall erase study’s recorded data
    ...     - 3. If the device receives the “erasestudy” command and the study data has already been erased, the device shall provide a response status of “rejected”
    ...          along with the rejection reason of “Already erased”.
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
    ...     Test Output:
    ...     - 1. While the study is in progress, send Erase Study command.
    ...     - 2. In WinSCP, refresh the view, locate the device rejection of the most recent erase study command. Verify there is a file with the format
    ...          erasestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Open in text editor. Verify the text “Study has not completed” is found.
    ...     - 4. After the study has completed, locate and send the uploadstudy using uploadstudy.txt using WinSCP.
    ...     - 5. Within the device folder, locate the device acknowledgement of the upload study command. Verify there is a file with the format
    ...          uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 6. In WinSCP, within the device folder, verify there are 2 data files with the format:
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 7. Locate erasestudy.txt and using WinSCP, send the erasestudy command.
    ...     - 8. In WinSCP, refresh the view. Confirm there is a file with the format
    ...          erasestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 9. After the study has completed, locate and send the uploadstudy using uploadstudy.txt using WinSCP.
    ...     - 10. Within the device folder, locate the device rejection of the most recent upload study command. Verify there is a file with the format
    ...           uploadstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 11. Open with text editor, verify the text “Already erased” is found.
    ...     - 12. After the study has erased, locate and send the erasestudy using erasestudy.txt using WinSCP.
    ...     - 13. Within the device folder, locate the device rejection of the most recent erase study command. Verify there is a file with the format
    ...           erasestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 14. Open with text editor. Verify the text “Already erased” is found.
    [Tags]      BTMCT-COMM-19    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-20: device receives "getloglist" command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives "getloglist" command, it shall provide the list of all daily log files.
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
    ...     Test Output:
    ...     - 1. In WinSCP, send the getloglist command to retrieve the device activities log.
    ...     - 2. In WinSCP, refresh the view. Verify there is a file with the format: getloglist-processing-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Wait a few seconds for study to getloglist completed.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getloglist command. Verify there is a file with the format:
    ...          getloglist-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 5. Send stopstudy command to stop active of study.
    ...     - 6. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 7. Erase study by sending the erasestudy command.
    [Tags]      BTMCT-COMM-20    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-21: Device receives "getlog" command without the target daily log file being provided
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives "getlog" command without the target daily log file being provided, the device shall upload all available log files to the server.
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
    ...     Test Output:
    ...     - 1. In WinSCP, send the getlog command to retrieve the device activities log.
    ...     - 2. In WinSCP, refresh the view. Within the user folder, locate the device acknowledgement of the getlog command. Verify there is a file with the format:
    ...          getlog-processing-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Wait for 1 minute
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getlog command. Verify there are files with the following format:
    ...          getlog-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          log-daily-mm-dd-yyyy-hh-mm-ss+timezone.txt
    ...          log-data-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 5. Wait for until study complete
    ...     - 6. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 7. Erase study by sending the erasestudy command
    [Tags]      BTMCT-COMM-21    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-22: The device receives "getlog" command and the requested daily log file is available
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives "getlog" command and the requested daily log file is available, the device shall upload the requested daily log file to the server.
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
    ...     Test Output:
    ...     - 1. Open getlog.txt file and write two valid parameters "Date" and "Time"
    ...     - 2. In WinSCP, send the getlog command to retrieve the device activities log.
    ...     - 3. In WinSCP, refresh the view. Verify there is a file with the format: getlog-processing-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 4. Wait for 1 minute
    ...     - 5. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getlog command. Verify there are all file with the format:
    ...          log-data-daily-mm-dd-yyyy-hh-mm-ss+timezone.txt
    ...     - 6. Wait for until study complete
    ...     - 7. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 8. Erase study by sending erasestudy command.
    [Tags]      BTMCT-COMM-22    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-23: The device receives "getlog" command and the requested daily log file is not available
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives "getlog" command and the requested daily log file is not available, the device shall send a response status as “REJECTED”
    ...          along with the rejection reason of “Invalid parameter(s)”.
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
    ...     - 4. Press and hold the "Event" button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Open getlog.txt file and write invalid parameter "Date"
    ...     - 2. In WinSCP, send the getlog command to retrieve the device activities log.
    ...     - 3. Wait for 1 minute
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getlog command. Verify there are all file with the format:
    ...          getlog-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 5. Open the file getlog-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)“ is found.
    ...     - 6. Send stopstudy command to stop active of study.
    ...     - 7. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 8. Erase study by sending the erasestudy command.
    [Tags]      BTMCT-COMM-23    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-24: The device receives the "downloadfile" command and the target file path is valid
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives the "downloadfile" command and the target file path is valid, the device shall provide a response status of "PROCESSING" and begin
    ...          the downloading process.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Send file “Image firmware name.bin” to device folder
    ...     Test Output:
    ...     - 1. Open “downloadfile”.txt command and write this file with content following:
    ...          dir="fw"
    ...          file="Image firmware name.bin"
    ...     - 2. In WinSCP, send the “downloadfile” command to user folder
    ...     - 3. Turn off the device by pressing and holding the “Power” button for 5 seconds
    ...     - 4. Turn on the device by pressing and holding the “Power” Button for 3 seconds on the device.
    ...     - 5. Disable BLE on the phone
    ...     - 6. Enable BLE on the phone
    ...     - 7. Wait for the downloading process to complete
    ...     - 8. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command.
    ...          Verify there is a file with the format: downloadfile-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 9. Connect device to device monitor program and change device to USB mass storage mode
    ...     - 10. Verify the file “Image firmware name.bin” exits in “fw” folder device
    [Tags]      BTMCT-COMM-24    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-25: The device receives the "downloadfile" command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives the "downloadfile" command and the target file path is valid, the device shall provide a response status of "PROCESSING" and begin
    ...          the downloading process.
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
    ...     - 1. Send file “Image firmware name.bin” to device folder
    ...     - 2. Wait for 1 minute
    ...     - 3. Open “downloadfile”.txt command and write this file with content following:
    ...          dir="fw"
    ...          file=" Image firmware name.bin"
    ...     - 4. In WinSCP, send the “downloadfile” command to user folder
    ...     - 5. Turn off the device by pressing and holding the “Power” button for 5 seconds.
    ...     - 6. Turn on the device by pressing and holding the “Power” Button for 3 seconds on the device.
    ...     - 7. Disable BLE on the phone
    ...     - 8. Enable BLE on the phone
    ...     - 9. Waiting for download file complete
    ...     - 10. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command.
    ...           Verify there is a file with the format: downloadfile-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 11. Verify file “Image firmware name.bin” exits in “fw” folder of device
    ...     - 12. In WinSCP, send the stopstudy command to user folder. Wait for the study to finish
    ...     - 13. Upload the study using the uploadstudy command. Wait for the study to be uploaded
    ...     - 14. Erase study by sending the erasestudy command.
    [Tags]      BTMCT-COMM-25    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-26: When the downloading process finishes and the downloaded file is valid
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. When the downloading process finishes and the downloaded file is valid, the device shall provide a response of "DONE"
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Open validatefile.txt and write this file with content following: file="fw/“Image firmware name.bin"
    ...     - 2. In WinSCP, send the “validatefile” command to user folder
    ...     - 3. Waiting for validate file complete
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “validatefile” command.
    ...          Verify there is a file with the format: validatefile-done-mm-dd-yy-hh-mm-ss+timezone.txt
    [Tags]      BTMCT-COMM-26    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-27: If the device receives the "downloadfile" command and the target file path is invalid.
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives the "downloadfile" command and the target file path is invalid, the device shall provide a response status of "REJECTED".
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. In WinSCP, send the “downloadfile” command to user folder
    ...     - 2. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command.
    ...          Verify there are all file with the format: downloadfile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Open the file downloadfile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)“ is found
    [Tags]      BTMCT-COMM-27    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-28: If the device receives the "downloadfile" command and the target file path is invalid.
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives the "downloadfile" command and the target file path is invalid, the device shall provide a response status of "REJECTED".
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
    ...     Test Output:
    ...     - 1. Wait for 1 minute
    ...     - 2. In WinSCP, send the “downloadfile” command to user folder
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command.
    ...          Verify there are all file with the format: downloadfile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 4. Open the file downloadfile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)“ is found
    ...     - 5. In WinSCP, send the stopstudy command to user folder.
    ...     - 6. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 7. Erase study by sending the erasestudy command.
    [Tags]      BTMCT-COMM-28    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-29: The device receives the "clonefw" command and the target file path is valid
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives the "clonefw" command and the target file path is valid, the device shall clone the firmware image from the provided file
    ...          path to its external flash memory and provide a response of "DONE".
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Copy file “Image firmware name.bin” to SD card of device
    ...     Test Output:
    ...     - 1. Open “clonefw”.txt command and write this file with content following:
    ...          path="fw/ Image firmware name.bin"
    ...     - 2. In WinSCP, send the “clonefw” command to user folder
    ...     - 3. Disable BLE on the phone
    ...     - 4. Enable BLE on the phone
    ...     - 5. Waiting for clone firmware complete
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “clonefw” command. Verify there is a file with the format:
    ...          clonefw-done-mm-dd-yy-hh-mm-ss+timezone.txt
    [Tags]      BTMCT-COMM-29    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-30: The device receives the "clonefw" command and the target file path is valid
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives the "clonefw" command and the target file path is valid, the device shall clone the firmware image from the provided file
    ...          path to its external flash memory and provide a response of "DONE".
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
    ...     Test Output:
    ...     - 1. Open “clonefw”.txt command and write this file with content following: path="fw/ Image firmware name.bin"
    ...     - 2. In WinSCP, send the “clonefw” command to user folder
    ...     - 3. Disable BLE on the phone
    ...     - 4. Enable BLE on the phone
    ...     - 5. Waiting for clone firmware complete
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “clonefw” command.
    ...          Verify there is a file with the format: clonefw-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 7. In WinSCP, send the stopstudy command to user folder.
    ...     - 8. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 9. Erase study by sending the erasestudy command.
    ...     - 10. In WinSCP, send the “clonefw” command to user folder.
    [Tags]      BTMCT-COMM-30    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-31: The device receives the "clonefw" command and the target file path is invalid
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives the "clonefw" command and the target file path is invalid, the device shall provide a response of "REJECTED"
    ...          along with the rejection reason being "Invalid parameter(s)".
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Open clonefw.txt file and input a path that does not exist
    ...     - 2. In WinSCP, send the “clonefw” command to user folder
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “clonefw” command.
    ...          Verify there are all file with the format: clonefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 4. Open the file clonefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    [Tags]      BTMCT-COMM-31    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-32: The device receives the "clonefw" command with the valid file path and if the device fails to clone the image to its external flash memory
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives the "clonefw" command with the valid file path and if the device fails to clone the image to its external flash memory,
    ...          the device shall provide a response of "REJECTED" along with the rejection reason being "Clone failed".
    ...     Test Setup and Input:
    ...     - 1. Navigate to firmware project of Biotres device
    ...     - 2. Inspect the source file: app\dxh\src\app\firmware_update.c, line 128 – 145. If the device receives the "clonefw" command with the valid path
    ...          but fails to clone the image to its external flash memory, the firmware program will execute the code at the line of 138.
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
    ...     - 1. Inspect test case from the unit test suite: app\dxh\src\unit_test\src\group\app\test_firmware_update.c, line 192 – 212
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
    ...          should be set to "REJECTED" (line 210) with the reason of "Clone failed" (line 208)
    [Tags]      BTMCT-COMM-32    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-33: The device receives the "clonefw" command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives the "clonefw" command and if the firmware image from the provided file path is invalid, the device shall provide a response of "REJECTED"
    ...          along with the rejection reason being "Invalid FW image"
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Switch the device to mass storage mode and create the Image.txt file to the “fw” folder
    ...     - 2. Open clonefw.txt file and input valid path to the Image.txt file
    ...     - 3. In WinSCP, send the “clonefw” command to user folder
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “clonefw” command.
    ...          Verify there are all file with the format: clonefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 5. Open the file clonefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid FW image” is found.
    [Tags]      BTMCT-COMM-33    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-34: the device receives "updatefw" command and "getversion" command without study
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives "updatefw" command, it shall update its running firmware with the newer one in external flash memory and provide a response of "DONE".
    ...     - 2. If the device receives "getversion" command, it shall provide the information of its hardware & firmware version
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Copy file “Image firmware name.bin” to SD card of device
    ...     Test Output:
    ...     - 1. In WinSCP, send the “clonefw” command to user folder. Waiting for clone firmware complete
    ...     - 2. In WinSCP, send the “updatefw” command to user folder
    ...     - 3. The device turns off and then turns on again and the LED of the device emits pink light with solid effect about 2 seconds
    ...     - 4. Waiting for update firmware complete
    ...     - 5. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “updatefw” command.
    ...          Verify there is a file with the format: updatefw-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 6. In WinSCP, send the “getversion” command to user folder
    ...     - 7. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “getversion” command.
    ...          Verify there is a file with the format: getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 8. Open the file getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “New firmware’s name“ is found on this line.
    [Tags]      BTMCT-COMM-34    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-35: The device receives "updatefw" command and "getversion" command when sutdy in grogress
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives "updatefw" command, it shall update its running firmware with the newer one in external flash memory and provide a response of "DONE".
    ...     - 2. If the device receives "getversion" command, it shall provide the information of its hardware & firmware version
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Copy file “Image firmware name.bin” to SD card of device
    ...     - 3. Initiate the Start Study command with the parameters below:
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
    ...     - 4. Wait for 1 minute for study to get initiated on the device.
    ...     - 5. Press and hold the "Event" button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. In WinSCP, send the “clonefw” command to user folder. Waiting for validating file complete
    ...     - 2. In WinSCP, send the “updatefw” command to user folder
    ...     - 3. The device turns off then turns on again and the LED of the device emits pink light with solid effect about 2 seconds
    ...     - 4. Waiting for updating firmware complete
    ...     - 5. Once the power-up sequence is complete in the device, the device will show the status led in green light with pulse effect
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “updatefw” command.
    ...          Verify there is a file with the format: updatefw-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 7. In WinSCP, send the “getversion” command to user folder
    ...     - 8. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “getversion” command. Verify there is a file with the format:
    ...          getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt. Open the file getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...     - 9. On the last line of the text file, verify the text “New firmware’s name“ is found on this line.
    [Tags]      BTMCT-COMM-35    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-36: The device receives "updatefw" command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If the device receives "updatefw" command, and if there is no valid firmware is found on device's external flash memory,
    ...          the device shall provide a response of "REJECTED" along with the rejection reason being "Invalid operation".
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Copy file “Image firmware name.bin” to SD card of device
    ...     Test Output:
    ...     - 1. In WinSCP, send the “clonefw” command to user folder. Waiting for clone firmware complete
    ...     - 2. Invalidate off-chip firmware image SM+INVOFFCHIP
    ...     - 3. In WinSCP, send the “updatefw” command to user folder
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “updatefw” command.
    ...          Verify there is a file with the format: updatefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 5. Open with text editor. Verify the text “Invalid operation” is found.
    [Tags]      BTMCT-COMM-36    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-37: ECG Data
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. ECG data uploaded by the device shall be in MIT16 format.
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
    ...     Test Output:
    ...     - 1. Wait for 5 minutes to ensure that the device has completed the study successfully.
    ...     - 2. Send the upload study command.
    ...     - 3. Wait for 10 minutes to finish the upload of the entire study.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the upload study command.
    ...          Verify there is a file with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 5. In WinSCP, refresh the view. Within the device folder, verify there are 2 data files with the format:
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 6. Verify that the data output from step 5 is in MIT16 format by opening the files in the MATLAB with Waveform Database (WFDB) tools.
    ...     - 7. Erase study by sending the erasestudy command.
    [Tags]      BTMCT-COMM-37    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-38: Device Notifications
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. The device shall provide the current notification from the following list:
    ...          Battery Low
    ...          Battery Critical
    ...          Battery Charging
    ...          Lead Disconnected
    ...          Lead Reconnected
    ...          User Power On
    ...          User Power Down Request
    ...          Device Error
    ...          Power on Initialization Failure
    ...          CRC Checksum Failure
    ...          Manual Cardiac Event Storage Failure
    ...          Electrogram Data Upload Failure
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
    ...     - 5. Enable CRC checking feature. SM+CRC=1, <Original CRC>
    ...     - 6. Using Biotres Device Monitor software, issue the command below to read the value written at address 0x0800AA00. Record the value read here. SM+FLASH=0800AA00?
    ...     - 7. Using Biotres Device Monitor software, write a different value at address 0x0807FFF than read in the previous step. SM+FLASH=0800AA00,AA
    ...     - 8. Wait for “Device Health Check Frequency” time interval.
    ...     - 9. Verify that the LED of the device emits pink light with soid effect about 2 seconds
    ...     - 10. In WinSCP, send the getlog command to retrieve the device activities log.
    ...     - 11. Wait for 5 minutes and refresh the WinSCP view. Within the device folder, verify the file with the format:
    ...           log-data-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           log-daily-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 12. Open the log file in the text editor and verify Invalid CRC entry in the device log.
    [Tags]      BTMCT-COMM-38    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-39: Device Notifications
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. The device shall provide the current notification from the following list:
    ...          Battery Low
    ...          Battery Critical
    ...          Battery Charging
    ...          Lead Disconnected
    ...          Lead Reconnected
    ...          User Power On
    ...          User Power Down Request
    ...          Device Error
    ...          Power on Initialization Failure
    ...          CRC Checksum Failure
    ...          Manual Cardiac Event Storage Failure
    ...          Electrogram Data Upload Failure
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results" except the battery requirement to be 100% charged.
    ...          If battery charge is greater than 41%, go to next step.
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
    ...     - 4. Press and hold the "Event" button on device for 5 seconds to start study.
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
    [Tags]      BTMCT-COMM-39    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-40: Device Notifications
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Device software shall encrypt patient data information (PHI) during communications between the Biotres device and the server.
    ...     - 2. After uploading all study data by serving uploadstudy command to the server, the device shall maintain an internal flag to keep track of the successful study data
    ...          transfer to the server.
    ...     - 3. When device receives erasestudy command, the device software shall check an internal flag to make sure that the study data was transferred
    ...          to the server successfully before erasing the data from the device memory.
    ...     - 4. After erasing all study data as part of serving erasestudy command, the device software shall go to waiting for study
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Open WinSCP client (Open source SFTP client for Windows; used for file transfers between a host and a remote server) and set the following values:
    ...          Choose file transfer protocol as FTP.
    ...          Choose encryption as TLS\SSL Explicit Encryption.
    ...          SET Host equal to 52.8.168.226 and Port equal to 21.
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
    ...     - 5. Press and hold the "Event" button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Verify that encryption is set as “TLS\SSL Explicit Encryption” on the WinSCP login session screen.
    ...     - 2. Wait for 5 minutes to ensure that the device has completed the study successfully.
    ...     - 3. Using WinSCP, send the erasestudy command.
    ...     - 4. Within the device folder, locate the device rejection of the most recent erase study command. Verify there is a file with the format
    ...          erasestudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 5. Open with text editor. Verify the text “Study has not uploaded” is found.
    ...     - 6. Send the upload study command.
    ...     - 7. In WinSCP, refresh the view. Verify there is a file with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 8. In WinSCP, refresh the view. Within the device folder, verify there are 2 data files with the format:
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 9. In WinSCP, send the getlog command to retrieve the device log.
    ...     - 10. Wait for getlog done and refresh the WinSCP view. Within the device folder, verify the file with the format:
    ...           log-data-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           log-daily-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 11. Open Log-data-mm-dd-yy-hh-mm-ss+timezone.txt file with the text editor and verify the study set to “uploaded” status.
    ...     - 12. Erase study by sending the erasestudy command.
    ...     - 13. In WinSCP, refresh the view. Locate the device folder. Within the device folder, locate the device acknowledgement of the erase study command.
    ...          Confirm there is a file with the format: erasestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 14. Verify that the LED of the device changes from green light with flashing effect to green light with solid effect
    [Tags]      BTMCT-COMM-40    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-41: The study will be auto completed
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. The device shall enable starting the study without having to press and hold the “Event” button on the device
    ...          If device is in paused state & study reaches its stop limit time, the study will be auto completed
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
    ...     - 1. Verify study auto start.
    ...     - 2. Wait for 1 minute while the study is in progress
    ...     - 3. Plug charger to the device in 30 seconds
    ...     - 4. Make sure don't unplug charger from device and don’t press "Event" button on the device
    ...     - 5. Verify that the study will be auto completed by showing the status led in green light with flash effect at the 4th minutes
    ...     - 6. Send the upload study command.
    ...     - 7. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the upload study command.
    ...          Verify there is a file with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 8. Using WinSCP, send the erasestudy command
    ...     - 9. In WinSCP, refresh the view. Locate the device folder. Within the device folder, locate the device acknowledgement of the erase study command.
    ...          Confirm there is a file with the format: erasestudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 10. Verify that the device’s study status is changed from Study uploaded to Ready for new study in the Biotres gateway
    [Tags]      BTMCT-COMM-41    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-42: OTA firmware
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. The device upgrade successfully from old firmware
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Downgrade the device to old firmware version.
    ...     Test Output:
    ...     - 1. Send file “Image firmware name.bin” to device folder
    ...     - 2. Open “downloadfile”.txt command and write this file with content following:
    ...          dir="fw"
    ...          file="Image firmware name.bin"
    ...     - 3. In WinSCP, send the “downloadfile” command to user folder
    ...     - 4. In WinSCP, refresh the view. Within the user folder, locate the device acknowledgement of the “downloadfile” command.
    ...          Verify there is a file with the format: downloadfile-processing-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 5. Wait for the downloading process to complete
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command. Verify there is a file with the format:
    ...          downloadfile-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 7. Open “clonefw”.txt command and write this file with content following: path="fw/ Image firmware name.bin"
    ...     - 8. In WinSCP, send the “clonefw” command to user folder
    ...     - 9. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “clonefw” command.
    ...          Verify there is a file with the format: clonefw-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 10. In WinSCP, send the “updatefw” command to user folder
    ...     - 11. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “updatefw” command.
    ...           Verify there is a file with the format: updatefw-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 12. In WinSCP, send the “getversion” command to user folder
    ...     - 13. Within the device folder, locate the device acknowledgement of the stop study command. Verify there are 2 files with the format
    ...           stopstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           note- mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 14. Upload the device log by sending getlog command
    [Tags]      BTMCT-COMM-42    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-43: The device receives "getann" command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Upon receiving the server “getann” command while study has not completed, device software shall respond to the server along with status value as reject
    ...     - 2. Upon receiving the server “getann” command while study has not uploaded, device software shall respond to the server along with status value as reject
    ...     - 3. Device software shall respond to the server along with all of data when upon receiving the server “getann” commands with content of command as vaild parameter.
    ...     - 4. If the device receives the “getann” command after the study has been erased, the device shall provide a status of “REJECTED” along
    ...          with the rejection reason of “Already erased”.
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
    ...     Test Output:
    ...     - 1. Plug charger to the device and wait for 30 seconds.
    ...     - 1. In WinSCP, send the getann command to user folder
    ...     - 1. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getann command. Verify there is a file with the format: getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 1. Open the file getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Study has not completed“ is found
    ...     - 1. Disconnect charger to the device and wait for 30 seconds
    ...     - 1. In WinSCP, send the getann command to user folder
    ...     - 1. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getann command. Verify there is a file with the format: getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 1. Open the file getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Study has not completed” is found
    ...     - 9. Send stopstudy command to stop active study.
    ...     - 10. In WinSCP, send the getann command to user folder
    ...     - 11. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getann command.
    ...           Verify there is a file with the format: getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt Open the file getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...           Verify the text “Study has not uploaded” is found.
    ...     - 12. Upload the study using the uploadstudy command.
    ...     - 13. Wait for the study to be uploaded, send the getann command.
    ...     - 14. In WinSCP, refresh the view. Verify there is a file with the format
    ...           getann-processing-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 15. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getann command.
    ...     - 16. Verify there is a file with the format:
    ...           getann-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           ann-all-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           ann-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           ann-mm-dd-yy-hh-mm-ss+timezone.anb
    ...     - 17. Open the getann-done-mm-dd-yy-hh-mm-ss+timezone.txt file using text editor. Verify that data of ann file.
    ...     - 18. Erase study by sending erasestudy command.
    ...     - 19. In WinSCP, send the getann command to user folder
    ...     - 20. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getann command. Verify there is a file with the format: getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 21. Open the file getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Already erased” is found on this line.
    ...     - 22. Upload the device log by sending getlog command.
    [Tags]      BTMCT-COMM-43    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-44: Send getannsegment command.
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Upon receiving the server “getannsegment” command write segment from "startime" to "stoptime" equal 10 minutes,
    ...          device software shall respond to the server along with status value as “DONE”
    ...     - 2. Upon receiving the server “getannsegment” command and write segment from "startime" to "stoptime" is 10 minutes and 1 second,
    ...          the device shall provide a status of “REJECTED” along with the rejection reason of “Invalid date/time”.
    ...     - 3. Upon receiving the server “getannsegment” command and write valid parameter "StatTime" and invalid parameter "StopTime",
    ...          the device shall provide a status of “REJECTED” along with the rejection reason of “Invalid parameter(s)”.
    ...     - 4. Upon receiving the server “getannsegment” command and wtire invalid parameter "StartTime" and valid parameter "StopTime",
    ...          the device shall provide a status of “REJECTED” along with the rejection reason of “Invalid parameter(s)”.
    ...     - 5. Upon receiving the server “getannsegment” command and make the StartTime and StopTime outside the study period,
    ...          device software shall respond to the server along with status value as “DONE”.
    ...     - 6. Upon receiving the server “getannsegment” command and configure to the StartTime equal to the StopTime,
    ...          the device shall provide a status of “REJECTED” along with the rejection reason of “Invalid parameter(s)”.
    ...     - 7. Upon receiving the server “getannsegment” command and configure to obtain a most recent 5 minutes segment of data but make the StartTime newer over the StopTime,
    ...          the device shall provide a status of “REJECTED” along with the rejection reason of “Invalid parameter(s)”.
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
    ...     - 1. Wait for 10 minutes
    ...     - 2. Open getannsegment.txt file and write segment from "startime" to "stoptime" equal 10 minutes and send the getannsegment command to user folder.
    ...          Start Date of the record	“MM/DD/YYYY”
    ...          Start Time of the record	“HH:MM:SS” Time should be local device time.
    ...          Stop Date of the record	“MM/DD/YYYY”
    ...          Stop Time of the record	“HH:MM:SS” Time should be local device time.
    ...          Time Zone	0
    ...     - 3. In WinSCP, refresh the view. Within the user folder, locate the device acknowledgement of the getannsegment command. Verify there is a file with the format
    ...           getannsegment-processing-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command. Verify there is a file with the format
    ...           getannsegment-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           ann-get-yymmdd_hhmmss+timezone.txt
    ...     - 5. Open the ann-get-yymmdd_hhmmss+timezone file using text editor. Verify that data of ann file
    ...     - 6. Open getannsegment.txt file and write segment from "startime" to "stoptime" is 10 minutes and 1 second and send the getannsegment command to user folder
    ...     - 7. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command.
    ...           Verify there are all file with the format
    ...           getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 8. Open the file getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. On the last line of the text file, verify the text “Invalid date/time” is found on this line.
    ...     - 9. Open getannsegment.txt file and write valid parameter "StatTime" and invalid parameter "StopTime" and send the getannsegment command to user folder
    ...     - 10. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command.
    ...           Verify there are all file with the format
    ...           getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 11. Open the file getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. On the last line of the text file, verify the text “Invalid parameter(s)” is found on this line.
    ...     - 12. Open getannsegment.txt file and wtire invalid parameter "StartTime" and valid parameter "StopTime" and send the getannsegment command to user folder
    ...     - 13. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command.
    ...           Verify there is a file with the format
    ...           getannsegment -rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 14. Open the file getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. On the last line of the text file, verify the text “Invalid parameter(s)” is found on this line.
    ...     - 15. Locate the getannsegment.txt file on the file system of the PC.  Open the getannsegment.txt file in a text editor, configure to obtain 5 minutes segment of data but make the StartTime and StopTime outside the study period and send getannsegment command using WinSCP.
    ...     - 16. In WinSCP, refresh the view. Verify there are all file with the format
    ...           getannsegment-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...           ann-get-yymmdd_hhmmss+timezone.txt
    ...     - 17. Open the file ann-get-yymmdd_hhmmss+timezone.txt using a text editor. Verify the file is empty data.
    ...     - 18. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command.
    ...           Verify there are all file with the format
    ...           getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 19. Open the file getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)” is found.
    ...     - 20. Locate the getannsegment.txt file on the file system of the PC.  Open the getannsegment.txt file in a text editor, configure to obtain a most recent 5 minutes segment of data but make the StartTime newer over the StopTime and send getannsegment command using WinSCP.
    ...     - 21. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command.
    ...           Verify there is a file with the format
    ...           getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 22. Open the file getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor. Verify the text “Invalid parameter(s)“ is found on this line.
    ...     - 23. Send stopstudy command to stop active study.
    ...     - 24. Open getannsegment.txt file and write valid parameter
    ...     - 25. In WinSCP, send the getannsegment command to user folder
    ...     - 26. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command.
    ...           Verify there is a file with the format
    ...           getannsegment-done- mm-dd-yy-hh-mm-ss+timezone.txt
    ...           ann-get-yymmdd_hhmmss+timezone.txt
    ...     - 27. Open the ann-get-yymmdd_hhmmss+timezone file using text editor. Verify that data of ann file
    ...     - 28. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 29. In WinSCP, send the getannsegment command to user folder
    ...     - 30. Confirm again from step 25 to step 27.
    ...     - 31. Upload the device log by sending getlog command.
    ...     - 32. Erase study by sending erasestudy command.
    [Tags]      BTMCT-COMM-44    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-45: study status is "setting up"
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. If study status is "setting up" and upon receiving the server abortstudy command, device software shall respond to the server along with aborting successful
    ...     - 2. If study status is not "setting up" and upon receiving the server abortstudy command, device software shall respond to the server along with
    ...          the rejection reason of “No pending study”.
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
    ...     - 1. Using WinSCP, send abortstudy command to "user" directory
    ...     - 2. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the abortstudy command.
    ...          Verify there is a file with the format: abortstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Open the file abortstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt On the last line of the text file, verify the text “AbortedTime=<mm/dd/yyyy hh:mm:ss +timezone”
    ...          is found on this line.
    ...     - 4. Initiate the Start Study command with the parameters below:
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
    ...     - 5. Wait for 1 minute for study to get initiated on the device.
    ...     - 6. Press and hold the “Event” button on device for 5 seconds to start study
    ...     - 7. Using WinSCP, send abort study command to "user" directory
    ...     - 8. In WinSCP, refresh the view. Within the device folder, locate the device rejection of the abort study command.
    ...          Verify there is a file with the format: abortstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 9. Open the file abortstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt. On the last line of the text file,
    ...          verify the text “RejectedReason= “No pending study”” is found on this line.
    ...     - 10. Send the stop study command to stop the active study.
    ...     - 11. Using WinSCP, send abort study command to "user" directory
    ...     - 12. In WinSCP, refresh the view. Verify there is a file with the format
    ...          abortstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 13. Open in text editor abortstudy-rejected -mm-dd-yy-hh-mm-ss+timezone.txt. On the last line of the text file,
    ...           verify the text “RejectedReason= “No pending study”” is found on this line.
    ...     - 14. Upload the study using the uploadstudy command. Wait for the study to be uploaded
    ...     - 15. Using WinSCP, send abort study command to "user" directory
    ...     - 16. In WinSCP, refresh the view. Verify there is a file with the format
    ...           abortstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 17. Open in text editor abortstudy-rejected -mm-dd-yy-hh-mm-ss+timezone.txt. On the last line of the text file,
    ...           verify the text “RejectedReason= “No pending study”” is found on this line.
    ...     - 18. Erase study by sending the erasestudy command
    ...     - 19. Using WinSCP, send abort study command to "user" directory
    ...     - 20. In WinSCP, refresh the view. Verify there is a file with the format
    ...           abortstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 21. Open in text editor. Abortstudy-rejected-mm-dd-yy-hh-mm-ss+timezone.txt. On the last line of the text file,
    ...           verify the text "RejectedReason= "No pending study"" is found on this line.
    ...     - 22. Upload the device log by sending getlog command.
    [Tags]      BTMCT-COMM-45    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-46: Upon receiving reboot, randomcmd and getversion command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Upon receiving the server “reboot” command, device software shall reboot and respond to the server along with reboot successful.
    ...     - 2. Upon receiving the randomcmd command, device software shall respond to the server along with the rejection reason of "Unsupported command – <Command ID>".
    ...     - 3. Upon receiving the server getversion command, device software shall respond to the server with version info.
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
    ...     Test Output:
    ...     - 1. Using WinSCP, send reboot command to "user" directory
    ...     - 2. Verify biotres device is rebooted
    ...     - 3. Wait for the device to connect to the network successfully
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the reboot command.
    ...          Verify there is a file with the format: reboot-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 5. Send the stop study command to stop the active study.
    ...     - 6. Upload the study using the uploadstudy command.
    ...     - 7. Erase study by sending the erasestudy command.
    ...     - 8. Using WinSCP, send reboot command to "user" directory.
    ...     - 9. Verify bioflux device is rebooted
    ...     - 10. Wait for the device to connect to the network successfully
    ...     - 11. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the reboot command.
    ...           Verify there is a file with the format: reboot-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 11. Using WinSCP, send randomcmd command to "user" directory
    ...     - 12. In WinSCP, refresh the view. within the device folder, locate the device rejection of the abort study command.
    ...           Verify there is a file with the format: randomcmd-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 13. On the last line of the text file, verify the text “RejectedReason= "Unsupported command – RandomCommand" is found on this line.
    ...     - 14. Using WinSCP, send getversion command to "user" directory
    ...     - 15. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getversion command.
    ...     - 16. Verify there is a file with the format: getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 17. Verify the 4 lines with contents following:
    ...           “hw=<hwVersion”
    ...           “fw=<fwVersion>”
    ...           “bl=<blVersion>”
    ...           “cks=<fwCKs>”
    ...     - 18. Upload the device log by sending getlog command.
    [Tags]      BTMCT-COMM-46    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-COMM-47: Check the switchserver command
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Check the switchserver command
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Locate the switchserver.txt file on the file system of the PC. Open the switchserver.txt file in a text editor, configure the "save" parameter as 0:
    ...          ip="18.188.159.87"
    ...          port="81"
    ...          ka="60"
    ...          save="0"
    ...     - 2. Using WinSCP, send switchserver command to "user" directory.
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the switchserver command.
    ...          Verify there is a file with the format: switchserver-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 4. Connect the device to the Device Monitor Program. Use following SM command to reboot device: SM+REBOOT
    ...     - 5. Obser on Device Monitor Program Verify the device should not switch to new server (sever 18.188.159.87)
    ...     - 6. Locate the switchserver.txt file on the file system of the PC. Open the switchserver.txt file in a text editor, configure the "save" parameter as 1:
    ...          ip="18.188.159.87"
    ...          port="81"
    ...          ka="60"
    ...          save="1"
    ...     - 7. Using WinSCP, send switchserver command to "user" directory
    ...     - 8. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the switchserver command.
    ...          Verify there is a file with the format: switchserver-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 9. Connect the device to the Device Monitor program. Use following SM command to reboot device: SM+REBOOT
    ...     - 10. Obser on Device Monitor Program. Verify the device should switch to new server (sever 18.188.159.87)
    ...     - 11. Use following SM command to congig device to server V&V server again:
    ...           SM+TCPSERVER=52.8.168.226,8810,60
    ...           SM+MODEMREBOOT
    ...     - 12. Locate the switchserver.txt file on the file system of the PC. Open the switchserver.txt file in a text editor, delete one or more parameters:
    ...           ip="18.188.159.87"
    ...           ka="60"
    ...           save="1"
    ...     - 13. Using WinSCP, send switchserver command to "user" directory
    ...     - 14. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the switchserver command.
    ...           Verify there is a file with the format: switchserver-reject-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 15. Using WinSCP, transfer the file switchserver-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC
    ...           and open the file using a text editor. On the last line of the text file, verify the text “Invalid parameter(s)“ is found on this line.
    ...     - 16. Locate the switchserver.txt file on the file system of the PC. Open the switchserver.txt file in a text editor, configure the "ka" parameter as 0:
    ...           ip="18.188.159.87"
    ...           port="81"
    ...           ka="0"
    ...           save="0"
    ...     - 17. Using WinSCP, send switchserver command to "user" directory
    ...     - 18. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the switchserver command.
    ...           Verify there is a file with the format: switchserver-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 19. Locate the switchserver.txt file on the file system of the PC. Open the switchserver.txt file in a text editor, configure the "ka" parameter as 3600:
    ...           ip="18.188.159.87"
    ...           port="81"
    ...           ka="3600"
    ...           save="0"
    ...     - 20. Using WinSCP, send switchserver command to "user" directory
    ...     - 21. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the switchserver command.
    ...          Verify there is a file with the format: switchserver-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 22. Locate the switchserver.txt file on the file system of the PC. Open the switchserver.txt file in a text editor, config the “ka” parameter less than 0:
    ...           ip="18.188.159.87"
    ...           port="81"
    ...           ka="-1"
    ...           save="0"
    ...     - 23. Using WinSCP, send switchserver command to "user" directory
    ...     - 24. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the switchserver command.
    ...          Verify there is a file with the format: switchserver-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 25. Using WinSCP, transfer the file switchserver-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC
    ...           and open the file using a text editor. On the last line of the text file, verify the text “Invalid parameter(s)” is found on this line.
    ...     - 26. Locate the switchserver.txt file on the file system of the PC. Open the switchserver.txt file in a text editor, config the “ka” parameter greater than 3600:
    ...           ip="18.188.159.87"
    ...           port="81"
    ...           ka="3601"
    ...           save="0"
    ...     - 27. Using WinSCP, send switchserver command to "user" directory
    ...     - 28. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the switchserver command.
    ...           Verify there is a file with the format: switchserver-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 29. Using WinSCP, transfer the file switchserver-rejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC
    ...           and open the file using a text editor. On the last line of the text file, verify the text “Invalid parameter(s)” is found on this line.
    ...     - 30. Upload the device log by sending getlog command.
    [Tags]      BTMCT-COMM-47    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library      project_bioheart_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${URL}  Get Config Param    WEB_BASE_URL
    Open Page  ${URL}

SUITE TEARDOWN
    Quit Browser
