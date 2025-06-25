*** Settings ***
Documentation  Biofux device stopstudy during pause and RTC protection verification test suite
Metadata    sid   BFDV-STOPSTUDY
Metadata  owner   Nang Phung
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py

Suite Setup     Log    SUITE SETUP
Suite Teardown  Log    SUITE TEARDOWN
Force Tags  BFDV-STOPSTUDY      device
Test Timeout  1h

*** Test Cases ***
BFDV-STOPSTUDY-01: Confirm
    [Documentation]     Author: Nang Phung
    ...
     ...     Description:  Upon receiving the server stopstudy commands while study pause, device software shall respond to the server and stop study successfully
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device..
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Wait for 1 minute
    ...     - 2. Plug the device in for charging.
    ...     - 3. Verify the “Battery Charging” screen on the device.
    ...     - 4. Waiting for 30 seconds and and unplug the device in for charging. Verify the “Study paused” screen on the device.
    ...     - 5. Refresh WinSCP view and verify “Study Paused” and “Battery Charging”notification.
    ...     - 6. In WinSCP, send the stop study command to user folder.
    ...     - 7. Within the device folder, locate the device acknowledgement of the stop study command.  Verify there are 2 files with the format
    ...          stopstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          note- mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 8. Using WinSCP, transfer the file stopstudy-done-mm-dd-yy-hh-mm- identified in previous step, to a local folder on the PC and open with text editor.
    ...          Open file stopstudy-done-mm-dd-yy-hh-mm-ss, verify the text “StopTime=”<exact study stop datetime> <timezone>”” is found on the last line.
    ...     - 9. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 10. Upload HES annotation file by sending getann command.
    ...     - 11. Upload the device log by sending getlog command.
    ...     - 12. Erase study by sending erasestudy command.
    ...     - 13. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-STOPSTUDY-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-STOPSTUDY-02: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:  Upon receiving the server stopstudy commands while device display “Resume study”, device software shall respond to the server and stop study successfully
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device..
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Wait for 1 minute
    ...     - 2. Long press both Power Key and Event Key for 3 seconds to quick power off.
    ...     - 3. Long press Power Key for 3 seconds to turn-on the device
    ...     - 4. Refresh WinSCP view and verify “Study Paused” notification .
    ...     - 5. In WinSCP, send the stop study command to user folder.
    ...     - 6. Within the device folder, locate the device acknowledgement of the stop study command.  Verify there is file with the format
    ...          stopstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 7. Using WinSCP, transfer the file stopstudy-done-mm-dd-yy-hh-mm-ss identified in previous step, to a local folder on the PC and open with text editor.
    ...          Open file stopstudy-done-mm-dd-yy-hh-mm-ss, verify the text “StopTime=”<exact study stop datetime> <timezone>”” is found on the last line.
    ...     - 8. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 9. Upload HES annotation file by sending getann command.
    ...     - 10. Upload the device log by sending getlog command.
    ...     - 11. Erase study by sending erasestudy command.
    ...     - 12. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-STOPSTUDY-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-STOPSTUDY-03: Confirm
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - Upon power loss (either complete depletion of the battery or battery removal), the device shall initialize RTS to the network time.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
    ...          PatientId=0120456
    ...          PatientName=Ben Jones
    ...          Duration=10
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
    ...          NoiseTimePause=60
    ...     - 3. Wait for 1 minute for study to get initiated on the device..
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Wait for 1 minute
    ...     - 2. Disable mobile network
    ...     - Set netmode = 2G (LE910C1-AP)
    ...     - Set netmode = 4G (HE910-NAG).
    ...     - 3. Long press both Power Key and Event Key for 5 seconds to quick power off.
    ...     - 4. Long press Power Key for 3 seconds to turn-on the device
    ...     - 5. Wait for 90 seconds.
    ...     - 6. Verify the device display “Resume” button on Resuming screen.
    ...     - 7. Resume study by press “Resume” button on Resuming screen.
    ...     - 8. Enable mobile network.
    ...     - 8. In WinSCP, send the stop study command to user folder.
    ...     - 9. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 10. Upload HES annotation file by sending getann command.
    ...     - 11. Upload the device log by sending getlog command.
    ...     - 12. Erase study by sending erasestudy command.
    ...     - 13. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-STOPSTUDY-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-STOPSTUDY-04: Confirm
    [Documentation]     Author: Nang Phung
    ...
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device..
    ...     - 4. Follow all the steps on the device screen and then start the study.
    ...     Test Output:
    ...     - 1. Wait for 1 minutes.
    ...     - 2. Disable mobile network
    ...     - Set netmode = 2G (LE910C1-AP)
    ...     - Set netmode = 4G (HE910-NAG).
    ...     - 3. Long press both Power Key and Event Key for 3 seconds to quick power off.
    ...     - 4. Remove the battery from the device and waiting for 3 minutes
    ...     - 5. Connect battery to device.
    ...     - 6. Long press Power Key for 3s to turn-on the device.
    ...     - 7. Wait for 5 minutes.
    ...     - 8. Verify the device is still in Resuming screen (no Resume button).
    ...     - 9. Enable mobile network.
    ...     - 10. Wait about 30-60 seconds.
    ...     - 11. Verify the device display “Resume” button on Resuming screen.
    ...     - 12. Resume study by press “Resume” button on Resuming screen.
    ...     - 13. In WinSCP, send the stop study command to user folder.
    ...     - 14. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 15. Upload HES annotation file by sending getann command.
    ...     - 16. Upload the device log by sending getlog command.
    ...     - 17. Erase study by sending erasestudy command.
    ...     - 18. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-STOPSTUDY-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library      project_bioheart_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${URL}  Get Config Param    WEB_BASE_URL
    Open Page  ${URL}

SUITE TEARDOWN
    Quit Browser