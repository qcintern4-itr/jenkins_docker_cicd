*** Settings ***
Documentation   Biofux device OTA firmware update verification test suite
Metadata        sid     BFDV-OTA
Metadata        owner   Nang Phung
Library         corelib/AssertionExtension.py
Library         corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library         project_bioflux_device/lib/ConfigHandler.py    ${ENV}

Force Tags      BFDV-OTA     device
Test Timeout    1h

*** Test Cases ***
BFDV-OTA-01: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. Upon receiving the server "“downloadfile”" command while server don’t have firmware file, device software shall respond to the server along with status as rejected
    ...     - 2. Upon receiving the server "“validatefile”" command while SD card of device don’t have file, device software shall respond to the server along with status as rejected
    ...     - 3. Upon receiving the server "“clonefw”" command while SD card of device don’t have file, device software shall respond to the server along with status as rejected
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 8 "Verification Sequence & Expected Results".
    ...     - 2. Open WinSCP client (Open source SFTP client for Windows; used for file transfers between a host and a remote server) and set the following values:
    ...     - 1. Choose file transfer protocol as FTP.
    ...     - 2. Choose encryption as TLS\SSL Explicit Encryption.
    ...     - 3. SET Host IP equal to 52.8.168.226 and Port equal to 21.
    ...     - 4. Enter username and password to securely log in to the remote server.
    ...     - 5. Once logged in successfully, create a new folder named as device id.
    ...          Once device folder is created, create two subfolders names as “user” (i.e. from users) and “server” (from server).
    ...     - 3. Initiate the Start Study command with the parameters below:
    ...          PatientId=0120456
    ...          PatientName=Ben Jones
    ...          Auto=0
    ...          Duration=105
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
    ...     - 1. Wait for 1 minute.
    ...     - 2. In WinSCP, send the “downloadfile” command to user folder.
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command.
    ...          Verify there are all file with the format
    ...          downloadfile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.1
    ...     - 4. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          downloadfile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 5. Open the file downloadfile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid parameter(s)“ is found on this line. Confirm for SRS request No.1
    ...     - 6. In WinSCP, send the “validatefile” command to user folder.
    ...     - 7. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “validatefile” command.
    ...          Verify there are all file with the format
    ...          validatefile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.2
    ...     - 8. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          validatefile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 9. Open the file validatefile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid parameter(s)“  is found on this line. Confirm for SRS request No.2
    ...     - 10. In WinSCP, send the “clonefw” command to user folder.
    ...     - 11. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “clonefw” command.
    ...          Verify there are all file with the format
    ...          clonefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.3
    ...     - 12. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          clonefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 13. Open the file clonefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid parameter(s)“ is found on this line. Confirm for SRS request No.3
    ...     - 146. In WinSCP, send the stopstudy command to user folder. Wait for the study to be stoped.
    ...     - 157. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 168. Upload HES annotation file by sending getann.txt command.
    ...     - 179. Upload the device log by sending getlog command.
    ...     - 18. Erase study by sending erasestudy command.
    ...     - 19. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-OTA-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-OTA-02: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. Upon receiving the server "“downloadfile”" command while file’s name is valid, device software shall respond to the server along with status as done
    ...     - 2. Upon receiving the server "validatefile" command while file’s name is valid, device software shall respond to the server along with status as done
    ...     - 3. Upon receiving the server "clonefw" command while file’s name is valid, device software shall respond to the server along with status as done
    ...     - 4. Upon receiving the server "updatefw" command, device software shall respond to the server along with status as done.
    ...     - 5. Upon receiving the server "getversion" command, device software shall respond to the server along with status as done.
    ...     - 6. Upon receiving the server "updatefw" command while On-Chip flash và Off-chip flash have same firmware version, device software shall respond to the server along with status as done
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 8 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=0120456
    ...          PatientName=Ben Jones
    ...          Auto=0
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
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Send file DXH31_APP_4.0.013.0_OTA.bin to device folder.
    ...     - 2. Wait for 1 minute.
    ...     - 3. Open “downloadfile”.txt command and write this file with content following:
    ...          dir="fw"
    ...          file="DXH31_APP_4.0.013.0_OTA.bin".
    ...     - 4. In WinSCP, send the “downloadfile” command to user folder.
    ...     - 5. Wait for 2 minutes. Then turn-off device for 3 minutes.
    ...     - 6. Turn-on the device again.
    ...     - 95. Waiting for download file complete.
    ...     - 106. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command.
    ...          Verify there is a file with the format
    ...          downloadfile-done-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.1
    ...     - 117. Connect device to device monitor program and change device to USB mass storage mode.
    ...     - 128. Confirm file DXH31_APP_4.0.013.0_OTA.bin exits in “fw” folder of device.
    ...     - 13. Leave mass storage mode.
    ...     - 14. In WinSCP, send the “validatefile” command to user folder.
    ...     - 15. Waiting for validate file complete.
    ...     - 16. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “validatefile” command.
    ...          Verify there is a file with the format
    ...          validatefile-done-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.2
    ...     - 17. In WinSCP, send the “clonefw” command to user folder.
    ...     - 18. Waiting for clone firmware complete.
    ...     - 19. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “clonefw” command.
    ...          Verify there is a file with the format
    ...          clonefw-done-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.3
    ...     - 20. In WinSCP, send the “clonefw” command to user folder. Waiting for validating file complete.
    ...     - 21. In WinSCP, send the “updatefw” command to user folder.
    ...     - 22. Device turn-off and then display “System update” screen.
    ...     - 23. Waiting for updating firmware complete.
    ...     - 25. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command.
    ...          Verify there is a file with the format
    ...          updatefw-done-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.4
    ...     - 26. In WinSCP, send the “getversion” command to user folder.
    ...     - 27. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “getversion” command.
    ...          Verify there is a file with the format
    ...          getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.5
    ...     - 28. Open the file getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the second line of the text file, verify the text “4.0.013_OTA “ is found on this line.
    ...     - 29. In WinSCP, send the “updatefw” command to user folder.
    ...     - 30. Device don’t turn-off and don’t display “system Update” screen.
    ...     - 31. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “updatefw” command.
    ...          Verify there are all file with the format
    ...          updatefw-done-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.6
    ...     - 32. In WinSCP, send the “getversion” command to user folder.
    ...     - 33. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “getversion” command.
    ...          Verify there is a file with the format
    ...          getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 34. Open the file getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the second line of the text file, verify the text “4.0.013.0_OTA “ is found on this line.
    ...     - 3509. In WinSCP, send the stopstudy command to user folder. Wait for the study to be stoped.
    ...     - 3610. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 3711. Upload HES annotation file by sending getann.txt command.
    ...     - 3812. Upload the device log by sending getlog command.
    ...     - 39131. Erase study by sending erasestudy command.
    ...     - 40. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-OTA-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-OTA-03: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  Upon receiving the server "“downloadfile”" command while file’s name is valid, device software shall respond to the server along with status as done
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 8 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=0120456
    ...          PatientName=Ben Jones
    ...          Auto=0
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
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Send file DXH31_APP_4.0.013.0_OTA.bin to device folder.
    ...     - 2. Wait for 1 minute.
    ...     - 3. Open “downloadfile”.txt command and write this file with content following:
    ...          dir="fw"
    ...          file="DXH31_APP_4.0.013.0_OTA.bin".
    ...     - 4. In WinSCP, send the “downloadfile” command to user folder.
    ...     - 5. Disable mobile network for 3 minutes.
    ...     - 6. Enable mobile network.
    ...     - 7. Waiting for download file complete.
    ...     - 8. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command.
    ...          Verify there is a file with the format
    ...          downloadfile-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 9. Confirm file DXH31_APP_4.0.013.0_OTA.bin exits in “fw” folder of device.
    ...     - 10. In WinSCP, send the stopstudy command to user folder. Wait for the study to be stoped.
    ...     - 11. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 12. Upload HES annotation file by sending getann.txt command.
    ...     - 13. Upload the device log by sending getlog command.
    ...     - 142. Erase study by sending erasestudy command.
    [Tags]  BFDV-OTA-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-OTA-04: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  Upon receiving the server "“validatefile”" command while SD card of device don’t have file, device software shall respond to the server along with status as rejected
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 8 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=0120456
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
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Wait for some minutes.
    ...     - 2. In WinSCP, send the “validatefile” command to user folder.
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “validatefile” command.
    ...          Verify there are all file with the format
    ...          validatefile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 4. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          validatefile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 5. Open the file validatefile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid parameter(s)“  is found on this line.
    ...     - 6. In WinSCP, send the stopstudy command to user folder. Wait for the study to be stoped.
    ...     - 7. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 8. Upload HES annotation file by sending getann.txt command.
    ...     - 9. Upload the device log by sending getlog command.
    ...     - 108. Erase study by sending erasestudy command.
    [Tags]  BFDV-OTA-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-OTA-05: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  Upon receiving the server " “validatefile” " command while file’s name is valid, device software shall respond to the server along with status as done
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 8 "Verification Sequence & Expected Results".
    ...     - 2. Copy file DXH31_APP_4.0.013.0_OTA.binto SD card of device
    ...     - 3. Initiate the Start Study command with the parameters below:
    ...          PatientId=0120456
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
    ...     - 4. Wait for 1 minute for study to get initiated on the device.
    ...     - 5. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Open “validatefile”.txt command and write this file with content following:
    ...          dir="fw"
    ...          file="fw/DXH31_APP_4.0.013.0_OTA.bin".
    ...     - 2. In WinSCP, send the “validatefile” command to user folder.
    ...     - 3. Waiting for validate file complete.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “validatefile” command.
    ...          Verify there is a file with the format
    ...          validatefile-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 5. In WinSCP, send the stopstudy command to user folder. Wait for the study to be stoped.
    ...     - 6. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 7. Upload HES annotation file by sending getann.txt command.
    ...     - 8. Upload the device log by sending getlog command.
    ...     - 7. Erase study by sending erasestudy command.
    [Tags]  BFDV-OTA-05    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-OTA-06: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  Upon receiving the server "“clonefw”" command while SD card of device don’t have file, device software shall respond to the server along with status as rejected
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 8 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=0120456
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
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Wait for 1 minute.
    ...     - 2. In WinSCP, send the “clonefw” command to user folder.
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “clonefw” command.
    ...          Verify there are all file with the format
    ...          clonefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 4. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          clonefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 5. Open the file clonefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid parameter(s)“ is found on this line.
    ...     - 6. In WinSCP, send the stopstudy command to user folder. Wait for the study to be stoped.
    ...     - 7. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 8. Upload HES annotation file by sending getann.txt command.
    ...     - 9. Upload the device log by sending getlog command.
    ...     - 10. Erase study by sending erasestudy command.
    [Tags]  BFDV-OTA-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-OTA-07: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  Upon receiving the server "“clonefw”" command while file’s name is valid, device software shall respond to the server along with status as done
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 8 "Verification Sequence & Expected Results".
    ...     - 2. Copy file DXH31_APP_4.0.013.0_OTA.bin to SD card of device
    ...     - 3. Initiate the Start Study command with the parameters below:
    ...          PatientId=0120456
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
    ...     - 4. Wait for 1 minute for study to get initiated on the device.
    ...     - 5. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Open “clonefw”.txt command and write this file with content following:
    ...          file="fw/DXH31_APP_4.0.013.0_OTA.bin".
    ...     - 2. In WinSCP, send the “clonefw” command to user folder.
    ...     - 3. Waiting for clone firmware complete.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “clonefw” command.
    ...          Verify there is a file with the format
    ...          clonefw-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 5. In WinSCP, send the stopstudy command to user folder. Wait for the study to be stoped.
    ...     - 6. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 7. Upload HES annotation file by sending getann.txt command.
    ...     - 8. Upload the device log by sending getlog command.
    ...     - 97. Erase study by sending erasestudy command.
    [Tags]  BFDV-OTA-07    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-OTA-08: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  Upon receiving the server "“updatefw”" command, device software shall respond to the server along with status as done
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 8 "Verification Sequence & Expected Results".
    ...     - 2. Copy file DXH31_APP_4.0.013.0_OTA.binto SD card of device
    ...     - 3. Initiate the Start Study command with the parameters below:
    ...          PatientId=0120456
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
    ...     - 4. Wait for 1 minute for study to get initiated on the device.
    ...     - 5. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. In WinSCP, send the “clonefw” command to user folder. Waiting for validating file complete.
    ...     - 2. In WinSCP, send the “updatefw” command to user folder.
    ...     - 3. Device turn-off and then display “System update” screen.
    ...     - 4. Waiting for updating firmware complete.
    ...     - 5. Once the power-up sequence is complete in the device, the device will show “Setup Device For MCT Study” screen.
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command.
    ...          Verify there is a file with the format
    ...          updatefw-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 7. In WinSCP, send the “getversion” command to user folder.
    ...     - 8. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “getversion” command.
    ...          Verify there is a file with the format
    ...          getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 9. Open the file getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the secondlast line of the text file, verify the text “4.0.013.0_OTA “ is found on this line.
    ...     - 10. Upload HES annotation file by sending getann.txt command.
    ...     - 11. Upload the device log by sending getlog command.
    [Tags]  BFDV-OTA-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-OTA-09: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  Upon receiving the server "“updatefw”" command, device software shall respond to the server along with status as done
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 8 "Verification Sequence & Expected Results".
    ...     - 2. Copy file DXH31_APP_4.0.013.0_OTA.bin to SD card of device
    ...     - 3. Initiate the Start Study command with the parameters below:
    ...          PatientId=0120456
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
    ...     - 4. Wait for 1 minute for study to get initiated on the device.
    ...     - 5. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. In WinSCP, send the “clonefw” command to user folder. Waiting for validating file complete.
    ...     - 2. In WinSCP, send the “updatefw” command to user folder.
    ...     - 3. Device turn-off and then display “System update” screen.
    ...     - 4. Waiting for updating firmware complete.
    ...     - 5. Once the power-up sequence is complete in the device, the device will show “Setup Device For MCT Study” screen.
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command.
    ...          Verify there is a file with the format
    ...          updatefw-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 7. In WinSCP, send the “getversion” command to user folder.
    ...     - 8. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “getversion” command.
    ...          Verify there is a file with the format
    ...          getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 9. Open the file getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the secondlast line of the text file, verify the text “4.0.013.0_OTA “ is found on this line.
    ...     - 10. Upload HES annotation file by sending getann.txt command.
    ...     - 11. Upload the device log by sending getlog command.
    [Tags]  BFDV-OTA-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-OTA-10: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  Upon receiving the server "“updatefw”" command while On-Chip flash và Off-chip flash have same firmware version, device software shall respond to the server along with status as done
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 8 "Verification Sequence & Expected Results".
    ...     - 2. Copy file DXH31_APP_4.0.013.0_OTA.binto SD card of device
    ...     - 3. Initiate the Start Study command with the parameters below:
    ...          PatientId=0120456
    ...          PatientName=Ben Jones
    ...          Auto=0
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
    ...     - 4. Wait for 1 minute for study to get initiated on the device.
    ...     - 5. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Wait for 1 minute.
    ...     - 2. In WinSCP, send the “clonefw” command to user folder. Waiting for validating file complete.
    ...     - 3. In WinSCP, send the “updatefw” command to user folder.
    ...     - 4. Device turn-off and then display “system Update” screen.
    ...     - 5. Waiting for updating firmware complete.
    ...     - 6. Once the power-up sequence is complete in the device, the device will show “Setup Device For MCT Study” screen.
    ...     - 7. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “updatefw” command.
    ...          Verify there are all file with the format
    ...          updatefw-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 8. In WinSCP, send the “getversion” command to user folder.
    ...     - 9. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “getversion” command.
    ...          Verify there is a file with the format
    ...          getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 10. Open the file getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the secondlast line of the text file, verify the text “4.0.013.0_OTA “ is found on this line.
    ...     - 11. In WinSCP, send the “updatefw” command to user folder.
    ...     - 12. Device don’t turn-off and don’t display “system Update” screen.
    ...     - 13. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “updatefw” command.
    ...          Verify there are all file with the format
    ...          updatefw-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 14. In WinSCP, send the “getversion” command to user folder.
    ...     - 15. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “getversion” command.
    ...          Verify there is a file with the format
    ...          getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 16. Open the file getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the secondlast line of the text file, verify the text “4.0.013.0_OTA “ is found on this line.
    ...     - 17. Upload HES annotation file by sending getann.txt command.
    ...     - 18. Upload the device log by sending getlog command.
    [Tags]  BFDV-OTA-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-OTA-11: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. Upon receiving the server "“downloadfile”" command while server don’t have firmware file, device software shall respond to the server along with status as rejected
    ...     - 2. Upon receiving the server "“validatefile”" command while SD card of device don’t have file, device software shall respond to the server along with status as rejected
    ...     - 3. Upon receiving the server "“clonefw”" command while SD card of device don’t have file, device software shall respond to the server along with status as rejected
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 8 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. In WinSCP, send the “downloadfile” command to user folder.
    ...     - 2. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command.
    ...          Verify there are all file with the format
    ...          downloadfile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.1
    ...     - 3. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          downloadfile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 4. Open the file downloadfile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid parameter(s)“ is found on this line. Confirm for SRS request No.1
    ...     - 5. Open “downloadfile”.txt command and write this file with content following:
    ...          dir="dxh"
    ...          file="DXH31_APP_4.0.013.0_OTA.bin".
    ...     - 6. In WinSCP, send the “downloadfile” command to user folder.
    ...     - 7. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          downloadfile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 8. Open the file downloadfile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid parameter(s)“ is found on this line.
    ...     - 9. Send a FW image larger than 1MB to “device” folder.
    ...     - 10. Open “downloadfile”.txt command and write this file with content following:
    ...          dir="fw"
    ...          file="FW image name.bin"
    ...     - Send the “downloadfile” command to user folder.
    ...     - 11. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          downloadfile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 12. Open the file downloadfile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid parameter(s)“ is found on this line.
    ...     - 13. In WinSCP, send the “validatefile” command to user folder.
    ...     - 14. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “validatefile” command.
    ...          Verify there are all file with the format
    ...          validatefile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.2
    ...     - 15. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          validatefile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 16. Open the file validatefile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid parameter(s)” is found on this line. Confirm for SRS request No.2
    ...     - 17. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “clonefw” command.
    ...          Verify there are all file with the format
    ...          clonefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 18. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          clonefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 19. Open the file clonefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid parameter(s)” is found on this line.
    ...     - 20. Switch the device to Mass Storage mode and create the Image.txt file to the “fw” folder.
    ...     - 21. Open clonefw.txt file and input valid path to the Image.txt file.
    ...     - 22. In WinSCP, send the “clonefw” command to user folder.
    ...     - 23. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “clonefw” command.
    ...          Verify there are all file with the format
    ...          clonefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 24. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          clonefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - Open the file clonefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid FW image” is found on this line.
    ...     - 205. Upload HES annotation file by sending getann.txt command.
    ...     - 216. Upload the device log by sending getlog command.
    [Tags]  BFDV-OTA-11    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-OTA-12: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  Upon receiving the server "“downloadfile”" command while file’s name is valid, device software shall respond to the server along with status as done
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 8 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Send file DXH31_APP_4.0.013.0_OTA.bin to device folder.
    ...     - 2. Open “downloadfile”.txt command and write this file with content following:
    ...          dir="fw"
    ...          file="DXH31_APP_4.0.013.0_OTA.bin".
    ...     - 3. In WinSCP, send the “downloadfile” command to user folder.
    ...     - 4. Wait for 2 minutes. Then turn-off device for 3 minutes.
    ...     - 5. Turn-on the device again.
    ...     - 6. Wait for 2 minutes. Then disable mobile network for 3 minutes.
    ...     - 7. Enable mobile network.
    ...     - 84. Waiting for download file complete.
    ...     - 95. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command.
    ...          Verify there is a file with the format
    ...          downloadfile-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 10. In WinSCP, send the “validatefile” command to user folder.
    ...     - 11. Waiting for validate file complete.
    ...     - 12. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “validatefile” command.
    ...          Verify there is a file with the format
    ...          validatefile-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 13. Connect device to device monitor program and change device to USB mass storage mode.
    ...     - Confirm file DXH31_APP_4.0.013.0_OTA.bin exits in “fw” folder of device.
    ...     - 14. Open “downloadfile”.txt command and write this file with content following:
    ...          dir="dl"
    ...          file="DXH31_APP_4.0.013.0_OTA.bin".
    ...     - 15. In WinSCP, send the “downloadfile” command to user folder.
    ...     - 16. Waiting for download file complete.
    ...     - 17. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command.
    ...          Verify there is a file with the format
    ...          downloadfile-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 18. Connect device to device monitor program and change device to USB mass storage mode.
    ...     - Confirm file DXH31_APP_4.0.013.0_OTA.bin exits in “dl” folder of device.
    ...     - 6. Connect device to device monitor program and change device to USB mass storage mode.
    ...     - 7. Check file DXH31_APP_4.0.013.0_OTA.bin exits in “fw” folder of device.
    ...     - 198. Upload the device log by sending getlog command.
    [Tags]  BFDV-OTA-12    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-OTA-13: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  Upon receiving the server "“downloadfile”" command while file’s name is valid, device software shall respond to the server along with status as done
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 8 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Send file DXH31_APP_4.0.013.0_OTA.bin to device folder.
    ...     - 2. Open “downloadfile”.txt command and write this file with content following:
    ...          dir="fw"
    ...          file="DXH31_APP_4.0.013.0_OTA.bin".
    ...     - 3. In WinSCP, send the “downloadfile” command to user folder.
    ...     - 4. Disable mobile network for 3 minutes.
    ...     - 5. Enable mobile network.
    ...     - 6. Waiting for download file complete.
    ...     - 7. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command.
    ...          Verify there is a file with the format
    ...          downloadfile-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 8. Connect device to device monitor program and change device to USB mass storage mode.
    ...     - 9. Check file DXH31_APP_4.0.013.0_OTA.bin exits in “fw” folder device.
    ...     - 10. Upload the device log by sending getlog command.
    ...     Description:  Upon receiving the server "“validatefile”" command while SD card of device don’t have file, device software shall respond to the server along with status as rejected
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 8 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. In WinSCP, send the “validatefile” command to user folder.
    ...     - 2. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “validatefile” command.
    ...          Verify there are all file with the format
    ...          validatefile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 3. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          validatefile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 4. Open the file validatefile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid parameter(s)” is found on this line.
    ...     - 5. Upload the device log by sending getlog command.
    [Tags]  BFDV-OTA-13    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-OTA-14: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  Upon receiving the server " “validatefile” " command while file’s name is valid, device software shall respond to the server along with status as done
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 8 "Verification Sequence & Expected Results".
    ...     - 2. Copy file DXH31_APP_4.0.013.0_OTA.binto SD card of device
    ...     Test Output:
    ...     - 1. Open “validatefile”.txt command and write this file with content following:
    ...          dir="fw"
    ...          file="fw/DXH31_APP_4.0.013.0_OTA.bin".
    ...     - 2. In WinSCP, send the “validatefile” command to user folder.
    ...     - 3. Waiting for validate file complete.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “validatefile” command.
    ...          Verify there is a file with the format
    ...          validatefile-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 5. Upload the device log by sending getlog command.
    ...     Description:  Upon receiving the server "“clonefw”" command while SD card of device don’t have file, device software shall respond to the server along with status as rejected
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 8 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. In WinSCP, send the “clonefw” command to user folder.
    ...     - 2. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “clonefw” command.
    ...          Verify there are all file with the format
    ...          clonefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 3. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          clonefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 4. Open the file clonefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid parameter(s)” is found on this line.
    ...     - 5. Upload the device log by sending getlog command.
    [Tags]  BFDV-OTA-14    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-OTA-15: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  Upon receiving the server "“clonefw”" command while file’s name is valid, device software shall respond to the server along with status as done
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 8 "Verification Sequence & Expected Results".
    ...     - 2. Copy file DXH31_APP_4.0.013.0_OTA.binto SD card of device
    ...     Test Output:
    ...     - 1. Open “clonefw”.txt command and write this file with content following:
    ...          file="fw/DXH31_APP_4.0.013.0_OTA.bin".
    ...     - 2. In WinSCP, send the “clonefw” command to user folder.
    ...     - 3. Waiting for clone firmware complete.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “clonefw” command.
    ...          Verify there is a file with the format
    ...          clonefw-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 5. Upload the device log by sending getlog command.
    [Tags]  BFDV-OTA-15    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-OTA-16: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  Upon receiving the server "“updatefw”" command, device software shall respond to the server along with status as done
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 8 "Verification Sequence & Expected Results".
    ...     - 2. Copy file DXH31_APP_4.0.013.0_OTA.bin to SD card of device
    ...     Test Output:
    ...     - 1. In WinSCP, send the “clonefw” command to user folder. Waiting for clone firmware complete.
    ...     - 2. In WinSCP, send the “updatefw” command to user folder.
    ...     - 3. Device turn-off and then display “System Update” screen.
    ...     - 4. Waiting for update firmware complete.
    ...     - 5. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command.
    ...          Verify there is a file with the format
    ...          updatefw-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 6. In WinSCP, send the “getversion” command to user folder.
    ...     - 7. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “getversion” command.
    ...          Verify there is a file with the format
    ...          getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 8. Open the file getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the second line of the text file, verify the text “4.0.013.0_OTA “ is found on this line.
    ...     - 9. Upload the device log by sending getlog command.
    ...     Description:  Upon receiving the server "“updatefw”" command while On-Chip flash và Off-chip flash have same firmware version, device software shall respond to the server along with status as done
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 8 "Verification Sequence & Expected Results".
    ...     - 2. Copy file DXH31_APP_4.0.013.0_OTA.binto SD card of device
    ...     Test Output:
    ...     - 1. In WinSCP, send the “clonefw” command to user folder. Waiting for clone firmware complete.
    ...     - 2. In WinSCP, send the “updatefw” command to user folder.
    ...     - 3. Device turn-off and then display “system Update” screen.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “updatefw” command.
    ...          Verify there is a file with the format
    ...          updatefw-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 5. In WinSCP, send the “getversion” command to user folder.
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “getversion” command.
    ...          Verify there is a file with the format
    ...          getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 7. Open the file getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the secondlast line of the text file, verify the text “4.0.013.0_OTA “ is found on this line.
    ...     - 8. In WinSCP, send the “updatefw” command to user folder.
    ...     - 9. Device don’t turn-off and don’t display “system Update” screen.
    ...     - 10. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “clonefw” command.
    ...          Verify there are all file with the format
    ...          updatefw-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 11. In WinSCP, send the “getversion” command to user folder.
    ...     - 12. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “getversion” command.
    ...          Verify there is a file with the format
    ...          getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 13. Open the file getversion-done-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the second last line of the text file, verify the text “4.0.013.0_OTA “ is found on this line.
    ...     - 14. Upload the device log by sending getlog command.
    [Tags]  BFDV-OTA-16    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-OTA-17: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  Upon receiving the server "stopdownloadfile" command , device software shall respond to the server along with status as done or reject
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 8 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Send file DXH31_APP_4.0.013.0_OTA.bin to device folder.
    ...     - 2. In WinSCP, send the “downloadfile” command to user folder.
    ...     - 3. In WinSCP, send the “stopdownloadfile” command to user folder.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “stopdownloadfile” command.
    ...          Verify there is a file with the format
    ...          stopdownloadfile-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 5. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command.
    ...          Verify there is a file with the format
    ...          downloadfile-aborted-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 6. In WinSCP, send the “stopdownloadfile” command again to user folder.
    ...     - 7. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “stopdownloadfile” command.
    ...          Verify there are all file with the format
    ...          stopdownloadfile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 8. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          stopdownloadfile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 9. Open the file updatefw-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid operation” is found on this line.
    ...     - 10. Upload the device log by sending getlog command.
    [Tags]  BFDV-OTA-17    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-OTA-18: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  Upon receiving the server "stopdownloadfile" command , device software shall respond to the server along with status as done
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 8 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Send file DXH31_APP_4.0.013.0_OTA.bin to device folder.
    ...     - 2. In WinSCP, send the “downloadfile” command to user folder.
    ...     - 3. In WinSCP, send the “stopdownloadfile” command to user folder.
    ...     - 4. Waiting for  stoping download file complete.
    ...     - 5. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “stopdownloadfile” command.
    ...          Verify there is a file with the format
    ...          stopdownloadfile -done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command.
    ...          Verify there is a file with the format
    ...          downloadfile-aborted-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 7. Upload the device log by sending getlog command.
    [Tags]  BFDV-OTA-18    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-OTA-19: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  Upon receiving the server "stopdownloadfile" command , device software shall respond to the server along with status as done or reject
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 8 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=0120456
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device.
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Send file DXH31_APP_4.0.013.0_OTA.bin to device folder.
    ...     - 2. Waiting for 1 minute.
    ...     - 3. In WinSCP, send the “downloadfile” command to user folder.
    ...     - 4. In WinSCP, send the “stopdownloadfile” command to user folder.
    ...     - 5. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “stopdownloadfile” command.
    ...          Verify there is a file with the format
    ...          stopdownloadfile-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command.
    ...          Verify there is a file with the format
    ...          downloadfile-aborted-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 7. In WinSCP, send the “stopdownloadfile” command again to user folder.
    ...     - 8. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “stopdownloadfile” command.
    ...          Verify there are all file with the format
    ...          stopdownloadfile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 9. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          stopdownloadfile-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 10. Open the file stopdownloadfile -rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid operation” is found on this line.
    ...     - 11. In WinSCP, send the stopstudy command to user folder. Wait for the study to be stoped.
    ...     - 12. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 13. Upload the device log by sending getlog command.
    ...     - 143. Erase study by sending erasestudy command.
    ...     - 15. Verify device silently reboots after erasing study dat.
    [Tags]  BFDV-OTA-19    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-OTA-20: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  Upon receiving the server "stopdownloadfile" command , device software shall respond to the server along with status as done
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 8 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=0120456
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device.
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Send file DXH31_APP_4.0.013.0_OTA.bin to device folder.
    ...     - 2. In WinSCP, send the “downloadfile” command to user folder.
    ...     - 3. In WinSCP, send the “stopdownloadfile” command to user folder.
    ...     - 4. Waiting for  stoping download file complete.
    ...     - 5. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “stopdownloadfile” command.
    ...          Verify there is a file with the format
    ...          stopdownloadfile-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the “downloadfile” command.
    ...          Verify there is a file with the format
    ...          downloadfile-aborted-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 7. In WinSCP, send the stopstudy command to user folder. Wait for the study to be stoped.
    ...     - 8. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 9. Upload HES annotation file by sending getann.txt command.
    ...     - 10. Upload the device log by sending getlog command.
    ...     - 119. Erase study by sending erasestudy command.
    [Tags]  BFDV-OTA-20    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library      project_bioheart_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${URL}  Get Config Param    WEB_BASE_URL
    Open Page  ${URL}

SUITE TEARDOWN
    Quit Browser