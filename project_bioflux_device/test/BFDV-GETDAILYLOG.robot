*** Settings ***
Documentation  Biofux device getDailyLog annSegment verification test suite
Metadata    sid   BFDV-GETDAILYLOG
Metadata  owner   Nang Phung
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py

Suite Setup     Log    SUITE SETUP
Suite Teardown  Log    SUITE TEARDOWN
Force Tags  BFDV-GETDAILYLOG        device
Test Timeout  1h

*** Test Cases ***
BFDV-GETDAILYLOG-01: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. Upon receiving the server getlog (contents is empty) commands, device software shall respond to the server along with all log-daily
    ...     - 2. Upon receiving the server getlog(contain some characters) commands, device software shall respond to the server along with status value as reject
    ...     - 3. Upon receiving the server getlog(valid Date and Time parameters) commands, device software shall respond to the server along with log-daily of one day
    ...     - 4. Upon receiving the server getlog(invalid Date or Time parameter) commands, device software shall respond to the server along with status value as reject
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Open WinSCP client (Open source SFTP client for Windows; used for file transfers between a host and a remote server) and set the following values:
    ...     - 1. Choose file transfer protocol as FTP.
    ...     - 2. Choose encryption as TLS\SSL Explicit Encryption.
    ...     - 3. SET Host IP equal to 52.8.168.226 and Port equal to 21.
    ...     - 4. Enter username and password to securely log in to the remote server.
    ...     - 5. Once logged in successfully, create a new folder named as device id.
    ...     - Once device folder is created, create two subfolders names as “user” (i.e. from users) and “server” (from server).
    ...     Test Output:
    ...     - 1. In WinSCP, send the getlog command to retrieve the device activities log..
    ...     - 2. In WinSCP, refresh the view. Within the user folder, locate the device acknowledgement of the getlog command.
    ...          Verify there is a file with the format
    ...          getlog-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 3. Wait for some seconds.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getlog command.
    ...          Verify there are all file with the format
    ...          log-daily-mm-dd-yyyy-hh-mm-ss+timezone.txt. Confirm for SRS request No.1
    ...     - 5. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          log-daily-mm-dd-yyyy-hh-mm-ss+timezone.txt.
    ...     - 6. Open the log-daily-mm-dd-yyyy-hh-mm-ss+timezone.txt file using text editor. Verify that contents of log file.
    ...     - 7. Wait for study to getlog completed..
    ...     - 8. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getlog command.
    ...          Verify there are following files with the format
    ...          getlog-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          log-data-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.1
    ...     - 9. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          log-data-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 10. Open the log-data-mm-dd-yy-hh-mm-ss+timezone.txt file using text editor. Verify that contents of log file.
    ...     - 11. Open getlog.txt file and write some characters to this file.
    ...     - 12. In WinSCP, send the getlog command to retrieve the device activities log..
    ...     - 13. Wait for some seconds.
    ...     - 14. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getlog command.
    ...           Verify there are all file with the format
    ...          getlog-rejected-mm-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.2
    ...     - 15. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          getlog-rejected-mm-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 16. Open the file getlog-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid parameter(s)“ is found on this line.. Confirm for SRS request No.2
    ...     - 17. Replace contents in getlog.txt file by an space character.
    ...     - 18. Send the getlog command to retrieve the device activities log..
    ...     - 19. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getlog command.
    ...          Verify there is a file with the format
    ...          getlog-rejected-mm-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.2
    ...     - 20. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          getlog-rejected-mm-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 21. Open the file getlog-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid parameter(s)“ is found on this line.. Confirm for SRS request No.2
    ...     - 22. Open getlog.txt file and wtire two valid parameters "Date" and "Time".
    ...     - 23. In WinSCP, send the getlog command to retrieve the device activities log..
    ...     - 24. In WinSCP, refresh the view. Within the user folder, locate the device acknowledgement of the getlog command.
    ...          Verify there is a file with the format
    ...          getlog-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 25. Wait for some seconds.
    ...     - 26. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getlog command.
    ...          Verify there are all file with the format
    ...          log-daily-mm-dd-yyyy-hh-mm-ss+timezone.txt. Confirm for SRS request No.3
    ...     - 27. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          log-daily-mm-dd-yyyy-hh-mm-ss+timezone.txt.
    ...     - 28. Open the log-daily-mm-dd-yyyy-hh-mm-ss+timezone.txt file using text editor. Verify that contents of log file.
    ...     - 29. Open getlog.txt file and wtire valid parameter "Date" and invalid parameter "Time".
    ...     - 30. In WinSCP, send the getlog command to retrieve the device activities log..
    ...     - 31. Wait for some seconds.
    ...     - 32. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getlog command.
    ...          Verify there are all file with the format
    ...          getlog-rejected-mm-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.4
    ...     - 33. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          getlog-rejected-mm-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 34. Open the file getlog-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid parameter(s)“ is found on this line.. Confirm for SRS request No.4
    ...     - 35. Open getlog.txt file and wtire invalid parameter "Date" and valid parameter "Time".
    ...     - 36. Send the getlog command to retrieve the device activities log..
    ...     - 37. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getlog command.
    ...          Verify there is a file with the format
    ...          getlog-rejected-mm-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.4
    ...     - 38. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          getlog-rejected-mm-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 39. Open the file getlog-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid parameter(s)“ is found on this line.. Confirm for SRS request No.4
    [Tags]  BFDV-GETDAILYLOG-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-GETDAILYLOG-02: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Create log files for 30 days. Then copy to the “dxh/log” folder.
    ...     Test Output:
    ...     - 1. In WinSCP, send the getlog command to retrieve the device activities log..
    ...     - 2. In WinSCP, refresh the view. Within the user folder, locate the device acknowledgement of the getlog command.
    ...          Verify there is a file with the format
    ...          getlog-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 3. Wait for the device to get the log completed..
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getlog command.
    ...          Verify there are 30 files with the format:
    ...          log-daily-mm-dd-yyyy-hh-mm-ss+timezone.txt.
    ...     - 8. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getlog command.
    ...          Verify there are following files with the format:
    ...          getlog-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          log-data-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 9. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          log-data-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 10. Verify the log-data-mm-dd-yy-hh-mm-ss+timezone.txt file contains the contents of 30 files log-daily-mm-dd-yyyy-hh-mm-ss+timezone.txt.
    [Tags]  BFDV-GETDAILYLOG-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-GETDAILYLOG-03: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  Upon receiving the server getloglist(contents is empty) commands, device software shall respond to the server along with a list of log file
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. In WinSCP, send the getloglist command to retrieve the device activities log..
    ...     - 2. In WinSCP, refresh the view. Within the user folder, locate the device acknowledgement of the getlog command.
    ...          Verify there is a file with the format
    ...     - getloglist-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 3. Wait for some seconds.
    ...     - 4. Wait for study to getloglist completed..
    ...     - 5. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getlog command.
    ...          Verify there is a file with the format
    ...          loglist-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 6. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          loglist-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 7. Open the loglist-done-mm-dd-yy-hh-mm-ss+timezone.txt file using text editor. Verify that contents of loglist file.
    [Tags]  BFDV-GETDAILYLOG-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-GETDAILYLOG-04: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  Device software shall respond to the server along with one of the response status values(processing or reject) when upon receiving the server commands
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=0120456
    ...          PatientName=Ben Jones
    ...          Auto=0
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device..
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Wait for 12 minutes.
    ...     - 2. Open getannsegment.txt file and write segment from "startime" to "stoptime" is 10 minutes.
    ...     - 3. In WinSCP, send the getannsegment command to user folder.
    ...     - 4. In WinSCP, refresh the view. Within the user folder, locate the device acknowledgement of the getannsegment command.
    ...          Verify there is a file with the format
    ...     - getannsegment-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 5. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command.
    ...          Verify there is a file with the format
    ...          getannsegment-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          ann-get-yymmdd_hhmmss+timezone.txt.
    ...     - 6. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          ann-get-yymmdd_hhmmss-yymmdd_hhmmss+timezone.txt.
    ...     - 7. Open the ann-get-yymmdd_hhmmss+timezone file using text editor. Verify that data of ann file.
    ...     - 8. Open getannsegment.txt file and write segment from "startime" to "stoptime" is 10 minutes and 1 second.
    ...     - 9. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command.
    ...          Verify there are all file with the format
    ...          getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 10. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 11. Open the file getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone..txt using a text editor.
    ...           On the last line of the text file, verify the text “Invalid date/time“ is found on this line..
    ...     - 12. Upload the device log by sending getlog command.. Keep the status of the study and continue to the case TC_COMM_008_TC01
    [Tags]  BFDV-GETDAILYLOG-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-GETDAILYLOG-05: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  Device software shall respond to the server along with status value is reject  when upon receiving the server commands with content of command as some characters
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 2. Open getannsegment.txt file and write some character to this file.
    ...     - 3. In WinSCP, send the getannsegment command to user folder.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command.
    ...          Verify there are all file with the format
    ...          getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 5. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 6. Open the file getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone..txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid parameter(s)“ is found on this line..
    ...     - 7. Replace contents in getannsegment.txt file by an space character.
    ...     - 8. Send the getannsegment command to user folder.
    ...     - 9. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getlog command.
    ...          Verify there is a file with the format
    ...          getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 10. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 11. Open the file getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid parameter(s)“ is found on this line..
    ...     - 12. Upload the device log by sending getlog command.. Keep the status of the study and continue to the case TC_COMM_009_TC01
    [Tags]  BFDV-GETDAILYLOG-05    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-GETDAILYLOG-06: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  Device software shall respond to the server along with status value is reject  when upon receiving the server commands with content of command as Invalid stattime and stoptime parameter
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Open getannsegment.txt file and write valid parameter "StatTime" and invalid parameter "StopTime".
    ...     - 2. In WinSCP, send the getannsegment command to user folder.
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command.
    ...          Verify there are all file with the format
    ...          getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 4. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 5. Open the file getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid parameter(s)“ is found on this line..
    ...     - 6. Open getannsegment.txt file and wtire invalid parameter "StartTime" and valid parameter "StopTime".
    ...     - 7. In WinSCP, send the getannsegment command to user folder.
    ...     - 8. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command.
    ...          Verify there is a file with the format
    ...          getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 9. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 10. Open the file getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid parameter(s)“ is found on this line..
    ...     - 11. Upload the device log by sending getlog command.. Keep the status of the study and continue to the case TC_COMM_010_TC01
    [Tags]  BFDV-GETDAILYLOG-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-GETDAILYLOG-07: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  Device software shall respond to the server along with status value is reject  when upon receiving the server commands with content of command as “StartTime” and “StopTime” outside the study period
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Locate the getannsegment.txt file on the file system of the PC.  Open the getannsegment.txt file in a text editor, configure to obtain 5 minutes segment of data but make the StartTime and StopTime outside the study period and send getannsegment command using WinSCP.
    ...     - Confirm the file has the following structure:
    ...     - File Line. Description. Data
    ...     - 1. Start Date of the record. “MM/DD/YYYY”
    ...     - 2. Start Time of the record. “HH:MM:SS” (outside the study period)
    ...     - 3. Stop Date of the record. “MM/DD/YYYY”
    ...     - 4. Stop Time of the record. “HH:MM:SS”( outside the study period)
    ...     - 5. Time Zone. 28
    ...     - 3. In WinSCP, send the getannsegment command to user folder.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command.
    ...          Verify there are all file with the format
    ...          getannsegment-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          ann-get-yymmdd_hhmmss+timezone.txt.
    ...     - 5. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          ann-get-yymmdd_hhmmss+timezone.txt.
    ...     - 6. Open the file ann-get-yymmdd_hhmmss+timezone.txt using a text editor.
    ...          Verify the file is empty data..
    ...     - 7. Upload the device log by sending getlog command.. Keep the status of the study and continue to the case TC_COMM_011_TC01
    [Tags]  BFDV-GETDAILYLOG-07    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-GETDAILYLOG-08: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. Device software shall respond to the server along with status value as reject  when upon receiving the server commands with content of command as “StartTime” equal or newer over the “StopTime”
    ...     - 2. Device software shall respond to the server along with a piece of data when upon receiving the server commands with content of command as vaild parameter
    ...     - 3. If the device receives the “getannsegment” command after the study has been erased, the device shall provide a status of “REJECTED” along with the rejection reason of “Invalid operation”.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Locate the getannsegment.txt file on the file system of the PC.  Open the getannsegment.txt file in a text editor, configure to the StartTime equal to the StopTime and send getannsegment command using WinSCP.
    ...     - Confirm the file has the following structure:
    ...     - File Line. Description. Data
    ...     - 1. Start Date of the record. “MM/DD/YYYY”
    ...     - 2. Start Time of the record. “HH:MM:SS” (make it equal to the StopTime)
    ...     - 3. Stop Date of the record. “MM/DD/YYYY”
    ...     - 4. Stop Time of the record. “HH:MM:SS” (make it equal to the StarTime)
    ...     - 5. Time Zone. 28
    ...     - 2. In WinSCP, send the getannsegment command to user folder.
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command.
    ...          Verify there are all file with the format
    ...          getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.1
    ...     - 4. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 5. Open the file getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid date/time“ is found on this line.. Confirm for SRS request No.1
    ...     - 6. Locate the getannsegment.txt file on the file system of the PC.  Open the getannsegment.txt file in a text editor, configure to obtain a most recent 5 minutes segment of data but make the StartTime newer over the StopTime and send getannsegment command using WinSCP.
    ...     - Confirm the file has the following structure:
    ...     - File Line. Description. Data
    ...     - 1. Start Date of the record. “MM/DD/YYYY”
    ...     - 2. Start Time of the record. “HH:MM:SS” (make it newer than StopDate)
    ...     - 3. Stop Date of the record. “MM/DD/YYYY”
    ...     - 4. Stop Time of the record. “HH:MM:SS”
    ...     - 5. Time Zone. 28
    ...     - 7. In WinSCP, send the getannsegment command to user folder.
    ...     - 8. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command.
    ...          Verify there is a file with the format
    ...          getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.1
    ...     - 9. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 10. Open the file getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid parameter(s)“ is found on this line.. Confirm for SRS request No.1
    ...     - 11. Send stopstudy command to stop active study..
    ...     - 12. Open getannsegment.txt file and write valid parameter.
    ...     - 13. In WinSCP, send the getannsegment command to user folder.
    ...     - 14. In WinSCP, refresh the view. Within the user folder, locate the device acknowledgement of the getannsegment command.
    ...          Verify there is a file with the format
    ...     - getannsegment-processing-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 15. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command.
    ...          Verify there is a file with the format
    ...          getannsegment-done- mm-dd-yy-hh-mm-ss+timezone.txt
    ...          ann-get-yymmdd_hhmmss+timezone.txt. Confirm for SRS request No.2
    ...     - 16. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          ann-get-yymmdd_hhmmss-yymmdd_hhmmss+timezone.txt.
    ...     - 17. Open the ann-get-yymmdd_hhmmss-yymmdd_hhmmss+timezone file using text editor. Verify that data of ann file.
    ...     - 18. Upload the study using the uploadstudy command. Wait for the study to be uploaded..
    ...     - 19. In WinSCP, send the getannsegment command to user folder.
    ...     - 20. Confirm again from step 14 to step 17. Confirm for SRS request No.2
    ...     - 21. Upload the device log by sending getlog command..
    ...     - 22. Erase study by sending erasestudy command..
    ...     - 23. Verify device silently reboots after erasing study data..
    ...     - 24. Locate the getannsegment.txt file on the file system of the PC.  Open the getannsegment.txt file in a text editor, configure to obtain 5 minutes segment of data and send getannsegment command using WinSCP..
    ...     - 25. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getannsegment command.
    ...          Verify there are all file with the format
    ...          getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.3
    ...     - 26. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - Open the file getannsegment-rejected-mm-dd-yy-hh-mm-ss+timezone..txt using a text editor.
    ...          On the last line of the text file, verify the text “Invalid operation “ is found on this line..
    [Tags]  BFDV-GETDAILYLOG-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-GETDAILYLOG-09: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. Upon receiving the server “getann” command while study has not completed, device software shall respond to the server along with status value as reject
    ...     - 2. Upon receiving the server “getann” command while study has not uploaded, device software shall respond to the server along with status value as reject
    ...     - 3. Device software shall respond to the server along with all of data when upon receiving the server “getann”commands with content of command as vaild parameter.
    ...     - 4. If the device receives the “getann” command after the study has been erased, the device shall provide a status of “REJECTED” along with the rejection reason of “Already erased”.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
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
    ...     - 1. Plug charger to the device and wait for 30 seconds. Then disconnect charger to the device..
    ...     - 2. In WinSCP, send the getann command to user folder.
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getann command.
    ...          Verify there is a file with the format
    ...          getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.1
    ...     - 4. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          Open the file getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Study has not completed“ is found on this line..
    ...     - 5. In WinSCP, send the getann command to user folder.
    ...     - 6. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getann command.
    ...          Verify there is a file with the format
    ...          getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 7. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.1
    ...     - 8. Open the file getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Study has not completed“ is found on this line..
    ...     - 9. Send the stopstudy command to stop the active study..
    ...     - 10. In WinSCP, send the getann command to user folder.
    ...     - 11. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getann command.
    ...          Verify there is a file with the format
    ...          getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 12. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.2
    ...     - 13. Open the file getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Study has not uploaded” is found on this line..
    ...     - 14. Upload the study using the uploadstudy command. Wait for the study to be uploaded..
    ...     - 15. In WinSCP, send the getann command to user folder.
    ...     - 16. In WinSCP, refresh the view. Within the user folder, locate the device acknowledgement of the getann command.
    ...          Verify there is a file with the format
    ...          getann-processing-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.3
    ...     - 17. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getann command.
    ...          Verify there is a file with the format
    ...          getann-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          ann-all-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          ann-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          ann-mm-dd-yy-hh-mm-ss+timezone.anb.
    ...     - 18. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          ann-all-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          ann-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          ann-mm-dd-yy-hh-mm-ss+timezone.anb.
    ...     - 19. Open the ann-get-yymmdd_hhmmss-yymmdd_hhmmss+timezone file using text editor. Verify that data of ann file.
    ...     - 20. Upload the device log by sending getlog command..
    ...     - 21. Erase study by sending erasestudy command..
    ...     - 22. Verify device silently reboots after erasing study data..
    ...     - 23. In WinSCP, send the getann command to user folder.
    ...     - 24. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getann command.
    ...          Verify there is a file with the format
    ...          getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt. Confirm for SRS request No.4
    ...     - 25. Using WinSCP, transfer the following files to a local folder on the PC.
    ...          getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - Open the file getann-rejected-mm-dd-yy-hh-mm-ss+timezone.txt using a text editor.
    ...          On the last line of the text file, verify the text “Already erased“ is found on this line..
    [Tags]  BFDV-GETDAILYLOG-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library      project_bioheart_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${URL}  Get Config Param    WEB_BASE_URL
    Open Page  ${URL}

SUITE TEARDOWN
    Quit Browser