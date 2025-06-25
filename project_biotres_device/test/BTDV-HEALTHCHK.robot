*** Settings ***
Documentation   Biotres device health check test suite
Metadata        sid     BTDV-HEALTHCHK
Metadata        owner   Nang Phung
Library         corelib/AssertionExtension.py
Library         corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}

Force Tags      BTDV-HEALTHCHK      device
Test Timeout    1h

*** Test Cases ***
BTDV-HEALTHCHK-01: Hardware modules
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: Device software shall initialize all the hardware modules on the device power up.
    ...     Test Setup and Input:
    ...     - 1. Turn off the device if not already.
    ...     - 2. Turn on the Biotres 1.0 device by pressing and holding the Home Button for 5 seconds on the device.
    ...     - 3. Wait for the power up sequence completion upon which the LED of device emits green light with solid effect.
    ...     Test Output:
    ...     - 1. Using WinSCP, send getlog command to retrieve device log.
    ...     - 2. Verify the initialization of the hardware modules below in the device log.
    ...          HW: Initializing hardware components
    ...          HW: Initializing WDT... OK
    ...          HW: Initializing IO... OK
    ...          HW: Initializing Battery... OK
    ...          HW: Battery status: level=<battery level (%)>, charge=<0/1>, valid=1
    ...          HW: Initializing RTC... OK
    ...          HW: Initializing USB... OK
    ...          HW: Turning on VCELL... OK
    ...          HW: Initializing Flash... OK
    ...          HW: Initializing LCD... OK
    ...          HW: Initializing SD card... OK
    ...          HW: SD card free space: <% free space>
    [Tags]  BTDV-HEALTHCHK-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-02: Provide battery measurement and leadoff connection health status
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: Device software shall provide battery measurement and lead off connection health status to the user.
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
    ...     - 4. Press and hold “Event” button on device for 5 seconds to start study.
    ...     - 5. Wait for “Device Health Check Frequency” time interval after the study has started.
    ...     Test Output:
    ...     - 1. Wait for few minutes for device to send the device status file.
    ...     - 2. In WinSCP, refresh the view and locate the device status text file. Open the device status file in the text editor and confirm that the device has provided Battery Level and LOD Status in it.
    ...     - 3. Send the stopstudy command to stop the ongoing MCT study.
    ...     - 4. Upload study data using the uploadstudy command.
    ...     - 5. Upload the device log by sending getlog command.
    ...     - 6. Erase study by sending the erasestudy command.
    [Tags]  BTDV-HEALTHCHK-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-03: User notifications
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: Device software shall send user notifications for the power-on initialization failure.
    ...     Test Setup and Input:
    ...     - 1. Long press the “Power” button for 5 seconds to power-off device.
    ...     - 2. Wait for few minutes for device to power off.
    ...     - 3. Remove SD card from the Biotres device.
    ...     - 4. Long press the “Power” button for 5 seconds to power-on device.
    ...     - 5. Wait for the power up sequence completion.
    ...     Test Output:
    ...     - 1. Verify that the device detects SD card removal by notifying the user with the LED of device emits yellow light with flash effect.
    ...     - 2. Long press the “Power” button for 5 seconds to power-off device  and put the SD card back in to the Biotres device.
    ...     - 3. Using WinSCP, send getlog command to retrieve device log.
    [Tags]  BTDV-HEALTHCHK-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-04: Device software shall implement hardware watch dog timer
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: Device software shall implement hardware watch dog timer to avoid system latch ups.
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
    ...     - 4. Press and hold “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Long press the “Power” button for 5 seconds to power-off device.
    ...     - 2. Wait for the device notification associated with device POWER DOWN. In WinSCP, refresh the view. Within the device folder, locate the device notification from POWER DOWN action.
    ...     - 3. Open the device notification and verify the following: STUDY PAUSED along with timestamp. POWER DOWN.
    ...     - 4. Long press the “Power” button for 5 seconds to power-on device.
    ...     - 5. Once the power up sequence is complete, the LED of device shall emits white light with flash effect.
    ...     - 6. Confirm resuming the study on the device.
    ...     - 7. Connect the device to the Biotres Device Monitor software and issue the command below: SM+WDT.
    ...     - 8. Wait for 30 seconds (watch dog timer timeout) for device to reset due to watch dog timer timeout.
    ...     - 9. Wait for next few actions comprising of device restart by itself post restart, device initialization, and resuming the device state prior to the reset which is resume study in this case.
    ...     - 10. Retrieve reset.log (detailed debug log) by putting the device to the Mass Storage mode. The reset.log is in the root folder of the SD card.
    ...     - 11. Locate the reset.log and verify that the device reset due to watch dog timer.
    ...     - 12. In WinSCP, issue the stopstudy command to stop the active study using stopstudy.txt command file in the test input directory.
    ...     - 13. In WinSCP, issue the uploadstudy command to upload the study using uploadstudy.txt command file in the test input directory.
    ...     - 14. Upload the device log by sending getlog command.
    ...     - 15. In WinSCP, issue the erasestudy command to erase the study using erasestudy.txt command file in the test input directory.
    [Tags]  BTDV-HEALTHCHK-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-05: Send health check status of the Biotres system
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The Biotres device software shall send health check status of the Biotres system to the server every Device Health Check Frequency interval if the Bluetooth gateway is available and online.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Wait for “Device Health Check Frequency” time.
    ...     Test Output:
    ...     - 1. Wait for few minutes for device to send the device status file.
    ...     - 2. In WinSCP, refresh the view and locate the device status text file. Open the device status file in the text editor and confirm that the device has provided Battery Level and LOD Status in it.
    ...     - 3. Using WinSCP, send getlog command to retrieve device log.
    [Tags]  BTDV-HEALTHCHK-05    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-06: The device software shall notify user to recharge the battery
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The device software shall notify user to recharge the battery when the remaining battery charge goes below the Battery Recharge Notification Threshold.
    ...     Test Setup and Input:
    ...     Test Output:
    ...     - 1. Wait for the remaining charge to drop below “Battery Recharge Notification Threshold”. (Refer to the result from case COMM_116_TC01)
    ...     - 2. Verify that Low Battery notification is sent on the Bluetooth gateway app.
    ...     - 3. Wait for “Device Health Check Frequency” time interval and verify that the battery level is below “Battery Recharge Notification Threshold” in the device status file.
    ...     - 5. Wait for device log to be uploaded to the server. Refresh view in WinSCP and verify the Battery Low notification in the device log.
    [Tags]  BTDV-HEALTHCHK-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-07: Cyclic redundancy check (CRC)
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The device software shall perform daily cyclic redundancy check (CRC) to detect the bit flips due to environmental factors.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Wait for “Device Health Check Frequency” time.
    ...     Test Output:
    ...     - 1. Wait for few minutes for device to send the device status file.
    ...     - 2. In WinSCP, refresh the view and locate the device status text file. Open the device status file in the text editor and confirm that the device firmware calculated CRC is reported in it.
    ...     - 3. In WinSCP, send the getlog command using getlog.txt
    ...     - 4. Wait for few minutes for device to send the device log data.
    ...     - 5. In WinSCP, refresh the view and locate the device log text file. Open the device log file in the text editor and confirm that the device firmware CRC comparison results are logged every “Device Health Check Frequency” time interval.
    [Tags]  BTDV-HEALTHCHK-07    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-08: Open code redundancy check (CRC) failure
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: Open code redundancy check (CRC) failure, the device software shall alert the user.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Connect the device to the Biotres Device Monitor Software. Issue the following command which will return firmware version, actual firmware CRC. SM+VER?
    ...     - 2. Enable CRC checking feature. SM+CRC=1,<Original CRC>
    ...     - 3. Using Biotres Device Monitor software, issue the command below to read the value written at address 0x0800AA00. Record the value read here. SM+FLASH=0800AA00?
    ...     - 4. Using Biotres Device Monitor software, write a different value at address 0x0800AA00 than read in the previous step. SM+FLASH=0800AA00,AA
    ...     - 5. Wait for “Device Health Check Frequency” time interval.
    ...     - 6. Verify the LED of device emits pink light with solid effect to recovery CRC failure.
    ...     - 7. In WinSCP, upload device log with getlog command using getlog.txt in the test input folder.
    ...     - 8. Wait for the device log to be uploaded. Verify Invalid CRC entry in the device log.
    [Tags]  BTDV-HEALTHCHK-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-09: Device software shall detect charging of the rechargeable battery
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. Device software shall detect charging of the rechargeable battery.
    ...     - 2. Upon charging of the rechargeable battery, the device shall notify server with the appropriate notifications.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Wait for “Device Health Check Frequency” time.
    ...     Test Output:
    ...     - 1. Verify that battery is not charging by looking at Battery Charge = 0 in the device status file.
    ...     - 2. Connect the charging cable to the charging port in the top of the device. Then plug the other end of the charger into a wall outlet (110 V).
    ...     - 3. Wait for “Device Health Check Frequency” time interval after the charging has started.
    ...     - 4. Verify that battery is charging by looking at Battery Charge = 1 in the device status file.
    ...     - 5. Verify that the device sends “Battery Charging” notification to the server.
    ...     - 6. Stop the battery charging by disconnecting the charging cable.
    ...     - 7. Verify that the device sends “Battery Discharging” notification to the server.
    [Tags]  BTDV-HEALTHCHK-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-10: The device shall power off itself
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The device shall power off itself when the remaining battery charge goes below (Battery Critical Notification Threshold – 1).
    ...     Test Setup and Input:
    ...     Test Output:
    ...     - 1. Unplug the device from charging. (Refer to the result from case COMM_116_TC01)
    ...     - 2. Wait for the battery level to drop below 10%.
    ...     - 3. Verify that the Battery Critical notification is sent when the charger is plugged back in since device stops sending notification to the server when remaining battery threshold is <= 5%. Then the device shall power off itself.
    [Tags]  BTDV-HEALTHCHK-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-11: Setup unique Device ID
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The device shall be setup unique Device ID during manufacturing.
    ...     Test Setup and Input:
    ...     - 1. Power on the device.
    ...     - 2. Wait for a few minutes for power on initialization to finish including the power on initialization checks such as cellular connectivity, SD card health and CRC check.
    ...     - 3. Connect the device to PC via USB cable.
    ...     - 4. Connect the device to the Biotres Device Monitor Software.
    ...     Test Output:
    ...     - 1. Using Biotres Device Monitor Software, issue this command to set the device ID to device (1200000001 is the example of device ID): SM+ID="5m1000Pr1vat3Key_M3Ga17em0",1200000001.
    ...     - 2. Wait for the device reboots.
    ...     - 3. Reconnect the device to the Biotres Device Monitor Software.
    ...     - 4. Issue this command to read back the device ID: SM+ID?
    ...     - 5. Verify the command response is as following: SM+ID=1200000001
    [Tags]  BTDV-HEALTHCHK-11    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-12: Verify the following details in the device log
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The device shall have the following modes: Power Off, Waiting for Study, Starting Study, Running Study, End of Study, and Error conditions.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Wait for the power up sequence completion upon which the LED of device emits green light with solid effect.
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
    ...     - 4. Within the user folder, locate the device acknowledgement of the start study command. Verify there is a file with the format: startstudy-processing-mm-dd-yy-hh-mm-ss-ss+timezone.txt
    ...     - 5. Press and hold “Event” button on device for 5 seconds to start study.
    ...     - 6. Verify that study has started by verifying  the LED of device emits green at pulse effect.
    ...     - 7. In WinSCP, within the device folder, locate the device acknowledgement of the most recent startstudy command. Verify there is a file with the format: startstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 8. In WinSCP, stop the study via stopstudy command using stopstudy.txt in the test input folder.
    ...     - 9. Refresh WinSCP view and verify that Study Completed notification is sent showing the time when the study was ended.
    ...     - 10. Upload study data using the uploadstudy command.
    ...     - 11. Within the device folder, locate the device acknowledgement of the upload study command. Verify there is a file with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss-ss+timezone.txt
    ...     - 12. In WinSCP, within the device folder, verify there are 2 data files with the format:
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...           data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 13. Erase study by sending the erasestudy command.
    ...     - 14. Long press the “Power” button for 5 seconds to power-off device.
    ...     - 15. Remove SD card from the device.
    ...     - 16. Long press the “Power” button for 5 seconds to power-on device.
    ...     - 17. Verify the LED of device emits yellow light with flashing effect due to removal of the SD card.
    ...     - 18. Long press the “Power” button for 5 seconds to power-off device.
    ...     - 19. Put the SD card into the device.
    ...     - 20. Long press the “Power” button for 5 seconds to power-on device.
    ...     - 21. In WinSCP, upload device log using getlog command using getlog.txt.
    ...     - 22. Verify the following details in the device log:
    ...           Power Off,
    ...           Power On,
    ...           Started,
    ...           Completed,
    ...           Uploaded,
    ...           Erased.
    [Tags]  BTDV-HEALTHCHK-12    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-13: The device shall perform the power on sequence
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: If the device is in the Power Off mode and the power button is pressed and held for 2-3 seconds, the device shall perform the power on sequence.
    ...     Test Setup and Input: While the device is on, long press the “Power” button for 5 seconds to power-off device.
    ...     Test Output:
    ...     - 1. Verify that notification with “Power Down” is sent to the server.
    ...     - 2. Long press the “Power” button for 5 seconds to power-on device.
    ...     - 3. Wait for the power up sequence completion upon which the LED of device emits green with solid effect.
    ...     - 4. Using WinSCP, send getlog command to retrieve device log.
    ...     - 5. Verify the power on initialization below in the device log.
    ...          HW: Initializing hardware components
    ...          HW: Initializing WDT... OK
    ...          HW: Initializing IO... OK
    ...          HW: Initializing Battery... OK
    ...          HW: Battery status: level=<battery level (%)>, charge=<0/1>, valid=1
    ...          HW: Initializing RTC... OK
    ...          HW: Initializing USB... OK
    ...          HW: Turning on VCELL... OK
    ...          HW: Initializing Flash... OK
    ...          HW: Initializing LCD... OK
    ...          HW: Initializing SD card... OK
    ...          HW: SD card free space: <% free space>
    [Tags]  BTDV-HEALTHCHK-13    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-14: The device shall enter the mode corresponding to the mode the device was in when it was last powered down
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: Once the power up sequence is completed, the device shall enter the mode corresponding to the mode the device was in when it was last powered down.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device.
    ...     - 4. Press and hold “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Long press the “Power” button for 5 seconds to power-off device.
    ...     - 2. Wait for the device notification associated with device POWER DOWN. In WinSCP, refresh the view. Within the device folder,
    ...          locate the device notification from POWER DOWN action.
    ...     - 3. Open the device notification and verify the following:
    ...          STUDY PAUSED along with timestamp.
    ...          POWER DOWN.
    ...     - 4. Long press the “Power” button for 5 seconds to power-on device.
    ...     - 5. Once the power up sequence is complete, the LED of device emits white light with flashing effect.
    ...     - 6. Wait for the device to resume the study.
    ...     - 7. Verify that the study is resumed by confirming the LED of the device emits green light with pulse effect.
    ...     - 8. In WinSCP, issue getlog command to retrieve the device log using getlog.txt
    ...     - 9. Send the stopstudy command to stop the ongoing MCT study.
    ...     - 10. Upload study data using the uploadstudy command.
    ...     - 11. Erase study by sending the erasestudy command.
    [Tags]  BTDV-HEALTHCHK-14    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-15: Device shall keep the Bluetooth on and connection alive
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: Device shall keep the Bluetooth on and connection alive to ensure quick response time.
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
    ...     - 4. Press and hold “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 5 minutes to ensure that the device has completed the study successfully.
    ...     - 2. Send the upload study command.
    ...     - 3. Wait for 10 minutes to finish upload of the entire study.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the upload study command. Verify there is a file with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 5. In WinSCP, refresh the view. Within the device folder, verify there are 2 data files with the format:
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          data-all-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 6. Erase study by sending the erasestudy command.
    ...     - 7. In WinSCP, send the getlog command to retrieve the device activities log.
    ...     - 8. Within the device folder, locate the device acknowledgement of the getlog command. Open getlog-done-mm-dd-yy-hh-mm-ss+timezone.txt in text editor.
    ...     - 9. Verify the device does not lose its Bluetooth connection from initialization study to study finish.
    [Tags]  BTDV-HEALTHCHK-15    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-16: The device shall enter the Waiting For Study state
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: When the device is powered on and the study is not in progress, the device shall enter the Waiting For Study state.
    ...     Test Setup and Input:
    ...     - 1. Make sure the device was turned off after the last study; Long press the “Power” button for 5 seconds to power-off device.
    ...     - 2. Long press the “Power” button for 5 seconds to power-on device.
    ...     Test Output:
    ...     - 1. Wait for the device connected to the server.
    ...     - 2. Verify the device initialization on power on by uploading the device log using the getlog command.
    ...     - 3. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getlog command. Open getlog-done-mm-dd-yy-hh-mm-ss+timezone.txt in text editor.
    ...     - 4. Verify the device shall enter the “Waiting for study state” by looking for the following study status in the device log: “Erased”.
    [Tags]  BTDV-HEALTHCHK-16    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-17: The device shall enter the Starting Study state
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: Once all parameters are verified after receiving the "startstudy" command from the server, the device shall enter the Starting Study state.
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
    ...     - 1. In WinSCP, within the device folder, locate the device acknowledgement of the most recent startstudy command. Verify there is a file with the format: startstudy-processing-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 2. Press and hold “Event” button on device for 5 seconds to start study.
    ...     - 3. Wait for study to complete and upload study data using the uploadstudy command.
    ...     - 4. In WinSCP, send the getlog command to retrieve the device activities log.
    ...     - 5. Erase study by sending the erasestudy command.
    [Tags]  BTDV-HEALTHCHK-17    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-18: The device shall send study started notification to the server and enter Running Study state
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: If User presses and holds Event button for at least 5 seconds, the device shall send study started notification to the server and enter Running Study state.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device.
    ...     - 4. Press and hold “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 1 minute for the device to send notification.
    ...     - 2. In WinSCP, send the getlog command to retrieve the device activities log.
    ...     - 3. Wait for some seconds.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the getlog command. Open log-daily-mm-dd-yy-hh-mm-ss+timezone.txt in text editor.
    ...     - 5. Verify the device shall enter the “Running Study state” by looking for the following study status in the device log: “started”.
    ...     - 6. In WinSCP, send stopstudy.txt command.
    ...     - 7. Wait for study to complete and upload study data using the uploadstudy command.
    ...     - 8. Erase study by sending the erasestudy command.
    [Tags]  BTDV-HEALTHCHK-18    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-19: The device software shall abort the study
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. If User presses and holds both Event and Power button for at least 5 seconds, the device software shall abort the study, send notification to the server and enter the Waiting for Study state.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Initiate the Start Study command with the parameters below:
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device.
    ...     - 4. Presses and holds both “Event” and “Power” button on the device for 5 seconds or more.
    ...     Test Output:
    ...     - 1. In WinSCP, within the device folder, verify device send study aborted notification to the server and enter the Waiting For Study State.
    [Tags]  BTDV-HEALTHCHK-19    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-20: The device shall be recording ECG data to the internal storage
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: If the device is in the Running Study State, the device shall be recording ECG data to the internal storage.
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
    ...     - 4. Press and hold “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Verify that study has started by verifying the LED of device emits green light with pulse effect.
    ...     - 2. In WinSCP, within the device folder, locate the device acknowledgement of the most recent startstudy command. Verify there is a file with the format: startstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Wait for study to complete and upload study data using the uploadstudy command.
    ...     - 4. Within the device folder, locate the device acknowledgement of the upload study command. Verify there is a file with the format: uploadstudy-done-mm-dd-yy-hh-mm-ss-ss+timezone.txt
    ...     - 5. In WinSCP, within the device folder, verify there are 2 data files with the format:
    ...          data-all-mm-dd-yy-hh-mm-ss-ss+timezone.hea
    ...          data-all-mm-dd-yy-hh-mm-ss-ss+timezone.dat
    ...     - 6. Open the data-all-mm-dd-yy-hh-mm-ss-ss+timezone.hea header file using MTLAB Waveform Database (WFDB) software package. Verify that the data storage on the SD card maps to the study duration.
    ...          MATLAB will plot the MIT16 file data in number of samples. The sample rate for recording is fixed at 250 samples per second. Verify the total number samples displayed by MATLAB plot is 250(sps)*(5*60 seconds) = 75,000 samples.
    ...     - 7. In WinSCP, send the getlog command to retrieve the device activities log.
    ...     - 8. Erase study by sending the erasestudy command.
    [Tags]  BTDV-HEALTHCHK-20    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-21: Hourly report
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: The device software shall send an empty hourly report to the server every hour.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Wait till the beginning of next hour (Refer to the result from case COMM_116_TC01).
    ...     - 2. In WinSCP, refresh the view. Within the device folder, verify the device send the empty hourly report file with format following: report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt.
    ...     - 3. Continue to wait till the beginning of the second next hour.
    ...     - 4. In WinSCP, refresh the view. Within the device folder, verify the device send the other hourly report file with format following: report-hourly-mm-dd-yy-hh-mm-ss+timezone.txt
    [Tags]  BTDV-HEALTHCHK-21    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-22: Pause Study
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: If the device is in the Running Study State and the user has requested powering down the device, the device shall enter the Power Off (Pause Study) state.
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
    ...     - 4. Press and hold “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Verify that study has started by verifying the LED of device emits green light with pulse effect.
    ...     - 2. In WinSCP, within the device folder, locate the device acknowledgement of the most recent startstudy command. Verify there is a file with the format: startstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Long press the “Power” button for 5 seconds to power-off device.
    ...     - 4. Wait for the device notification associated with device POWER DOWN. In WinSCP, refresh the view. Within the device folder, locate the device notification from POWER DOWN action.
    ...     - 5. Open the device notification and verify the following: STUDY PAUSED along with timestamp. POWER DOWN.
    ...     - 6. Long press the “Power” button for 5 seconds to power-on device.
    ...     - 7. Once the power up sequence is complete, the LED of device emits white light with flash effect then it emits white light with pulse effect.
    ...     - 8. Wait for 1 minute for the device to resume the study.
    ...     - 9. Verify that the LED of device emits green light with pulse effect.
    ...     - 10. Once the study is complete, upload study data using the uploadstudy command.
    ...     - 11. In WinSCP, send the getlog command to retrieve the device activities log.
    ...     - 12. Erase study by sending the erasestudy command.
    [Tags]  BTDV-HEALTHCHK-22    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-23: Study pause when charging device
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. When device is being charged, it will automatically enter the Pause Study State and study paused notification will be displayed on the Bluetooth gateway app until the device is removed from charging.
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
    ...     - 4. Press and hold “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Verify that study has started by verifying the LED of device emits green light with pulse effect.
    ...     - 2. In WinSCP, within the device folder, locate the device acknowledgement of the most recent startstudy command. Verify there is a file with the format:
    ...          startstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Connect the device to the charger without powering off.
    ...     - 4. Wait for the device notification associated with device being placed in PAUSE state. In WinSCP, refresh the view. Within the device folder, locate the device notification.
    ...     - 5. Open the device notification and verify the following: STUDY PAUSED along with timestamp.
    ...     - 6. Disconnect the device from the charger.
    ...     - 7. In WinSCP, refresh the view. Within the device folder, locate the device notification. Open the device notification and verify the following:
    ...          “Battery Discharging
    ...          BatteryLevel=<batterylevel>”
    ...     - 8. Once the resume sequence is complete, the LED of device emits green light with pulse effect.
    ...     - 9. Once the study is complete, upload study data using the uploadstudy command.
    ...     - 10. In WinSCP, send the getlog command to retrieve the device activities log.
    ...     - 11. Erase study by sending the erasestudy command.
    [Tags]  BTDV-HEALTHCHK-23    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-24: Resume Study
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: : If the user powers up the device and device is in the Pause Study state, not charging and lead on is detected, the device shall go back to the Running Study State if study duration time has not completed.
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
    ...     - 4. Press and hold “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Long press the “Power” button for 5 seconds to power-off device.
    ...     - 2. Wait for the device notification associated with device POWER DOWN. In WinSCP, refresh the view. Within the device folder, locate the device notification from POWER DOWN action.
    ...     - 3. Open the device notification and verify the following: STUDY PAUSED along with timestamp. POWER DOWN.
    ...     - 4. Long press the “Power” button for 5 seconds to power-on device.
    ...     - 5. Once the power up sequence is complete, the LED of device emits white light with flashing effect.
    ...     - 6. Wait for the device to resume the study.
    ...     - 7. Verify that the study is resumed by confirming the LED of the device emits green light with pulse effect.
    ...     - 8. Verify the remaining study duration on the Bluetooth gateway.
    ...     - 9. Upload study data using the uploadstudy command.
    ...     - 10. In WinSCP, send the getlog command to retrieve the device activities log
    ...     - 11. Erase study by sending the erasestudy command.
    [Tags]  BTDV-HEALTHCHK-24    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-25: End of Study State
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: If the device is in the Running Study State and the time from when the study was started plus the study duration time has ended, the device shall enter the End of Study State.
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
    ...     - 4. Press and hold “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Verify that study has started by verifying the LED of device emits green light with pulse effect.
    ...     - 2. In WinSCP, within the device folder, locate the device acknowledgement of the most recent startstudy command. Verify there is a file with the format: startstudy-done-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Wait for the remaining time to complete the study.
    ...     - 4. Refresh WinSCP view, within the device folder, locate the device notification associated with Study Completion.
    ...     - 5. Open the device notification associated with study completion in text editor and compare the study completion timestamp against study start timestamp in step 1
    ...          to make sure that the elapsed time is equal to the programmed study duration.
    ...     - 6. Verify the LED of device emits green light with flash effect.
    ...     - 7. Upload study data using the uploadstudy command.
    ...     - 8. In WinSCP, send the getlog command to retrieve the device activities log.
    ...     - 8. Erase study by sending the erasestudy command.
    [Tags]  BTDV-HEALTHCHK-25    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-26: Send getecg command
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: Once the study is completed, electrocardiogram recording shall not be performed.
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device
    ...     - 4. Press and hold “Event” button on device for 5 seconds to start study
    ...     Test Output:
    ...     - 1. Wait for 5 minutes for study to get completed.
    ...     - 2. Once the study has completed, locate getecg.txt and in WinSCP, request getecg command to grab 5 minutes of ECG data post completion of the Study duration.
    ...     - 3. Using WinSCP, within the device folder, locate the device acknowledgement of the getecg rejected upload command. Verify there is a file with the format: getecg-rejected-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 4. Using WinSCP, transfer the file getecgrejected-mm-dd-yy-hh-mm-ss+timezone identified in previous step, to a local folder on the PC and open it in the text editor.
    ...          On the last line of the text file, verify the text “Invalid date/time” is found on this line.
    ...     - 5. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 6. In WinSCP, send the getlog command to retrieve the device activities log.
    ...     - 7. Erase study by sending the erasestudy command.
    [Tags]  BTDV-HEALTHCHK-26    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-27: Press the event button when the study has completed
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: If the device receives User commanded event after the study completion, the User commanded event shall be ignored.
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
    ...     - 4. Press and hold “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 5 minutes for study to get completed.
    ...     - 2. Once the study has completed, locate and press the event button on the device.
    ...     - 3. In WinSCP, refresh the view. Verify that no test output files related to manual event are uploaded because the manual event outside the study duration shall be ignored.
    ...     - 4. Upload the study using the uploadstudy command. Wait for the study to be uploaded.
    ...     - 5. In WinSCP, send the getlog command to retrieve the device activities log.
    ...     - 5. Erase study by sending the erasestudy command.
    [Tags]  BTDV-HEALTHCHK-27    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-28: User notification
    [Documentation]     Author: Nang Phung
    ...
    ...     Description: If the device is at the End of Study State, it will send User notification and start uploading the study data if device is connected to the Bluetooth gateway.
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
    ...     - 4. Press and hold “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 5 minutes for study to get completed.
    ...     - 2. Refresh the WinSCP view. Within the device folder, verify there is a file with the format: note-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Using WinSCP, transfer the file note-mm-dd-yy-hh-mm-ss+timezone.txt identified in previous step, to a local folder on the PC and open in text editor.
    ...          On the last line of the text file, verify the text “Study completed” is found.
    ...     - 4. Connect the device to the Device Monitor Software.
    ...     - 5. Send the upload study command.
    ...     - 6. Wait for a few seconds. Verify the device start uploading the study data
    ...     - 7. Waiting to device finish uploading the study data.
    ...     - 8. Erase study by sending the erasestudy command.
    [Tags]  BTDV-HEALTHCHK-28    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-29: Error State
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. If the device has detected an unrecoverable error, the device shall send the notification to the server. If the error cannot be recovered after 3 self-recovery attempts by the device, the error will be reported to the User.
    ...     Test Setup and Input:
    ...     - 1. Long press the “Power” button for 5 seconds to power-off device.
    ...     - 2. Wait for few minutes for device to power off.
    ...     - 3. Remove SD card from the Biotres device.
    ...     - 4. Long press the “Power” button for 5 seconds to power-on device.
    ...     - 5. Wait for the power up sequence completion.
    ...     Test Output:
    ...     - 1. Verify that the device detects SD card removal by notifying the user with the LED of Device emits yellow light with flash effect. (Refer to the result from case HEALTHCHK_003_TC01)
    ...     - 2. Long press the “Power” button for 5 seconds to power-off device and put the SD card back in to the Biotres device.
    [Tags]  BTDV-HEALTHCHK-29    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTDV-HEALTHCHK-30: The Device shall go back to the Running Study State when User presses and holds the event button for 5 seconds
    [Documentation]     Author: Nang Phung
    ...
    ...     Description:
    ...     - 1. If the User presses and holds the event button for 5 seconds while the device is in Pause Study state, the Device shall go back to the Running Study State
    ...          if study duration time has not completed.
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
    ...     - 4. Press and hold “Event” button on device for 5 seconds to start study.
    ...     Test Output:
    ...     - 1. Wait for 1 minute while the study is in progress.
    ...     - 2. Connect the device to the charger without powering off.
    ...     - 3. Wait for the device notification associated with device being placed in PAUSE state. In WinSCP, refresh the view. Within the device folder, locate the device notification.
    ...     - 4. Open the device notification and verify the following: STUDY PAUSED along with timestamp.
    ...     - 5. Presses and holds the “Event” button for 5 seconds.
    ...     - 6. Verify that the device shall go back to the Running Study State.
    ...     - 7. Wait for the study to get finish.
    ...     - 8. Once the study is completed, upload study data using the uploadstudy command.
    ...     - 9. In WinSCP, send the getlog command to retrieve the device activities log.
    ...     - 10. Erase study by sending the erasestudy command.
    [Tags]  BTDV-HEALTHCHK-30    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library      project_bioheart_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${URL}  Get Config Param    WEB_BASE_URL
    Open Page  ${URL}

SUITE TEARDOWN
    Quit Browser