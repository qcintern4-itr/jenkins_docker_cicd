*** Settings ***
Documentation  Biofux device health check test suite
Metadata    sid   BFDV-HEALTHCHK
Metadata  owner   Nang Phung
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py

Suite Setup     Log    SUITE SETUP
Suite Teardown  Log    SUITE TEARDOWN
Force Tags  BFDV-HEALTHCHK      device
Test Timeout  1h

*** Test Cases ***
BFDV-HEALTHCHK-01: Health Check Frequency and check CRC
    [Documentation]     Author: Tan Pham
    ...
    ...     Description:
    ...     - 1. Device software shall initialize all the hardware modules on the device power up.
    ...     - 2. The device software shall send health check status of the bioflux system to the server every
    ...       Device Health Check Frequency interval.
    ...     - 3. If the device is in the Power Off mode and the power button is pressed and held for 3-5 seconds,
    ...       the device shall perform the power on sequence.
    ...     - 4. The device software shall perform daily cyclic redundancy check (CRC) to detect the bit flips
    ...       due to environmental factors.
    ...     - 5. Device software shall detect charging of the rechargeable battery.
    ...     - 6. Upon charging of the rechargeable battery, the device shall notify server with the appropriate notifications.
    ...
    ...     Test Steps:
    ...     - 1. Turn off the device if not already.
    ...     - 2. Turn on the Bioflux 1.0 device by pressing and holding the Home Button for 3-5 seconds on the device.
    ...     - 3. Wait for the power up sequence completion upon which the device shows “Setup Device for MCT Study” screen.
    ...
    ...     Expected Output:
    ...    - 1. Using WinSCP, send getlog command to retrieve device log.
    ...    - 2. Verify the initialization of the hardware modules below in the device log.
    ...         + Hardware initialization...
    ...         + Initialize WDT... OK
    ...         + Initialize IO... OK
    ...         + Initialize Battery... OK
    ...         + Initialize RTC... OK
    ...         + Initialize USB... OK
    ...         + Initialize Flash chip... OK
    ...         + Initialize LCD... OK
    ...         + Initialize SD card... OK
    ...         + Turn on modem
    ...         + Setup modem
    ...         + Device is ready to accept command via SMS (SIM readiness)
    ...    - 3. In WinSCP, refresh the view and locate the device log text file. Open the device log file in the text editor and confirm that the device firmware CRC comparison results are
    ...         logged every “Device Health Check Frequency” time interval.
    ...    - 4. Wait for few minutes for device to send the device status file.
    ...    - 5. In WinSCP, refresh the view and locate the device status text file. Open the device status file in the text editor and confirm that the device has provided Battery Level and LOD Status in it.
    ...    - 6. Verify that battery is not charging by looking at Battery Charge = 0 in the device status file.
    ...    - 7. Connect the charging cable to the charging port in the top of the device. Then plug the other end of the charger into a wall outlet (110 V).
    ...    - 8. Verify that Bioflux device is displaying a lightning bolt symbol next to the charge level.
    ...    - 9. Wait for “Device Health Check Frequency” time interval after the charging has started.
    ...    - 10. Verify that battery is charging by looking at Battery Charge = 1 in the device status file.
    [Tags]  BFDV-HEALTHCHK-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-HEALTHCHK-02: Provide battery measurement and recording ECG data
    [Documentation]     Author: Tan Pham
    ...
    ...     Description:
    ...     - 1. Device software shall provide battery measurement and leadoff connection health status to the server.
    ...     - 2. Once all parameters are verified after receiving the "startstudy" command and the user has selected to
    ...         start the study, the device shall enter the Running Study state.
    ...     - 3. If the device is in the Running Study State, the device shall poll the server every Device Server Poll
    ...         Frequency programmable interval to check for the new command requests.
    ...     - 4. If the device is in the Running Study State, the device shall be recording ECG data to the internal storage.
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
    ...     - 4. Follow all the steps on the device display and then start the study.
    ...     - 5. Wait for “Device Health Check Frequency” time interval after the study has started.
    ...
    ...     Expected Output:
    ...    - 1. Verify that study has started by verifying Study Running screen (REMAINING TIME screen) on the device display showing the remaining study duration.
    ...    - 2. In WinSCP, within the device folder, locate the device acknowledgement of the most recent startstudy command. Verify there is a file with the format startstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...    - 3. Wait for few minutes for device to send the device status file.
    ...    - 4. In WinSCP, refresh the view and locate the device status text file. Open the device status file in the text editor and confirm that the device has provided Battery Level and LOD Status in it.
    ...    - 5. Wait for study to complete
    ...    - 6. Upload study data using the uploadstudy command. Record the time of uploadstudy command request here.
    ...    - 7. Wait for at least 10 minutes. Within the device folder, locate the device acknowledgement of the upload study command.
    ...         Verify there is a file with the format uploadstudy-done-mm-dd-yy-hh-mm-ss-ss+timezone.txt.
    ...    - 8. In WinSCP, within the device folder, verify there are 2 data files with the format:
    ...         + data-all-mm-dd-yy-hh-mm-ss-ss+timezone.hea
    ...         + data-all-mm-dd-yy-hh-mm-ss-ss+timezone.dat
    ...    - 9. Open the data-all-mm-dd-yy-hh-mm-ss-ss+timezone.hea header file using MTLAB Waveform Database (WFDB) software package. Verify that the data storage on the SD card maps to the study duration.
    ...         MATLAB will plot the MIT16 file data in number of samples. The sample rate for recording is fixed at 250 samples per second. Verify the total number samples displayed by MATLAB plot is 250(sps)*(5*60 seconds)= 75,000 samples.
    ...    - 10. Upload HES annotation file by sending getann command.
    ...    - 11. Upload the device log by sending getlog command.
    ...    - 12. Erase study by sending erasestudy command.
    ...    - 13. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-HEALTHCHK-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-HEALTHCHK-03: Conffirm watch dog timer
    [Documentation]     Author: Tan Pham
    ...
    ...     Description:
    ...     - 1. Device software shall implement hardware watch dog timer to avoid system latch ups.
    ...
    ...     Test Steps:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device display.
    ...     - 4. Follow all the steps on the device display and then start the study.
    ...
    ...     Expected Output:
    ...    - 1. Long press both Power Key and Event Key for 5s to quick power off device
    ...    - 2. Wait for the device notification associated with device POWER DOWN. In WinSCP, refresh the view. Within the device folder, locate the device notification from POWER DOWN action.
    ...    - 3. Open the device notification and verify the following:
    ...         + STUDY PAUSED along with timestamp.
    ...         + POWER DOWN.
    ...    - 4. Power On the device by pressing and holding the Home button for 3-5 seconds.
    ...    - 5. Once the power up sequence is complete, device shall display the RESUMING STUDY screen.
    ...    - 6. Confirm resuming the study on the device display.
    ...    - 7. Connect the device to the Bioflux Device Monitor software and issue the command below:
    ...         + SM+WDT
    ...    - 8. Wait for 30 seconds (watch dog timer timeout) for device to reset due to watch dog timer timeout.
    ...    - 9. Wait for next few actions comprising of device restart by itself post restart; device initialization; and resuming the device state prior to the reset which is resume study in this case.
    ...    - 10. Retrieve reset.log (detailed debug log) by putting the device to the Mass Storage mode. The reset.log is in the root folder of the SD card.
    ...    - 11. Locate the reset.log and verify that the device reset due to watch dog timer.
    ...    - 12. In WinSCP, issue stopstudy command to stop the active study using stopstudy.txt command file in the test input directory.
    ...    - 13. In WinSCP, issue uploadstudy command to upload the study using uploadstudy.txt command file in the test input directory.
    ...    - 14. Upload HES annotation file by sending getann command.
    ...    - 15. Upload the device log by sending getlog command.
    ...    - 16. In WinSCP, issue erasestudy command to erase the study using erasestudy.txt command file in the test input directory.
    ...    - 17. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-HEALTHCHK-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-HEALTHCHK-04: Cofirm Battery Recharge Notification
    [Documentation]     Author: Tan Pham
    ...
    ...     Description:
    ...     - 1. The device software shall notify user to recharge the battery upon reaching Battery Recharge Notification Threshold percentage usage of the battery.
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - 1. Verify that Low Battery notification is sent on the device display.
    ...    - 2. Wait for device log to be uploaded to the server. Refresh view in WinSCP and verify the Battery Low notification in the device log.
    [Tags]  BFDV-HEALTHCHK-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-HEALTHCHK-05: Confirm (CRC) failure
    [Documentation]     Author: Tan Pham
    ...
    ...     Description:
    ...     - 1. Upon code redundancy check (CRC) failure, the device software shall alert the user with the appropriate notifications.
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - 1. Verify the device Error screen on the device display due to CRC failure with error code: 11400.
    [Tags]  BFDV-HEALTHCHK-05    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFDV-HEALTHCHK-06: Confirm terminating the battery charging/placing in PAUSE state
    [Documentation]     Author: Tan Pham
    ...
    ...     Description:
    ...     - 1. The device shall be able to terminate the battery charging.
    ...     - 2. When device is being charged, it shall be placed in PAUSE state.
    ...       Note: Charging is a hardware function. The device firmware will display charging whenever the valid charger is connected.
    ...
    ...     Test Steps:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below: :
    ...         + PatientId=123456
    ...         + PatientName=Ben Jones
    ...         + Duration=40320
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
    ...    - 1. Connect the charging cable to the charging port in the top of the device. Then plug the other end of the charger into a wall outlet (110 V).
    ...    - 2. Verify that Bioflux device is displaying a lightning bolt symbol next to the charge level.
    ...    - 3. Wait for the device notification associated with device being placed in PAUSE state.
    ...         In WinSCP, refresh the view. Within the device folder, locate the device notification.
    ...    - 4. Open the device notification and verify the following:
    ...         + STUDY PAUSED along with timestamp.
    ...    - 5. Unplug the device from charging. Connect the leads and select “RESUME” button to resume the study.
    ...    - 6. In WinSCP, refresh the view. Within the device folder, locate the device notification.
    ...         Open the device notification and verify the following:
    ...          + “Battery Discharging
    ...             BatteryLevel=<batterylevel>”
    ...    - 7. Connect the device for charging again.
    ...    - 8. Wait until battery is fully charged.
    ...    - 9. Send the stopstudy command to stop the ongoing MCT study.
    ...    - 10. Upload study data using the uploadstudy command.
    ...    - 11. Upload HES annotation file by sending getann command.
    ...    - 12. Upload the device log by sending getlog command.
    ...    - 13. Erase study by sending erasestudy command.
    ...    - 14. Verify device silently reboots after erasing study data.
    [Tags]  BFDV-HEALTHCHK-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library      project_bioheart_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${URL}  Get Config Param    WEB_BASE_URL
    Open Page  ${URL}

SUITE TEARDOWN
    Quit Browser
