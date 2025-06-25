*** Settings ***
Documentation   Biotres device UI and user notifications verification test suite
Metadata        sid     BTMCT-DEVICEUI
Metadata        owner   Han Nguyen
Library         corelib/AssertionExtension.py
Library         corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}

Force Tags      BTMCT-DEVICEUI      device
Test Timeout    1h

*** Test Cases ***
BTMCT-DEVICEUI-01: Confirm
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. The device software shall incorporate LED interface for the User notifications.
    ...     - 2. When the device is turned off by pressing and holding the Home Button, the device shall provide User an LED-based notification.
    ...     Test Setup and Input:
    ...     - 1. Turn on the device if not already.
    ...     Test Output:
    ...     - 1. Press and hold “Power” button on the device in 5 seconds.
    ...     - 2. Verify that the LED of the device emits blue light with fast flash effect.
    ...     - 3. Verify that the device is turned off shortly afterwards.
    ...     - 4. Press and hold the “Power” button on the device for 3 seconds.
    ...     - 5. Verify that the LED of the device emits blue light with fast flashing effect about 2 seconds.
    ...     - 6. Connect the device to the device monitor program.
    ...     - 7. Switch the device to mass storage mode.
    ...     - 8. Verify that the LED of the device emits cyan light with pulse effect.
    ...     - 9. Press and hold the “Event” button on the device for 5 seconds.
    ...     - 10. Verify that the LED of the device emits blue light with fast flashing effect about 2 seconds.
    ...     - 11. Using the Device Monitor program Enable CRC checking feature. SM+CRC=1,< Original CRC>.
    ...     - 12. Issue the command below to read the value written at address 0x 0800AA00, Record the value read here SM+FLASH=0800AA00?
    ...     - 13. Using Device Monitor program, write a different value at address 0x0807FFF than read in the previous step SM+FLASH=0800AA00,AA.
    ...     - 14. Wait for “Device Health Check Frequency” time interval.
    ...     - 15. Verify that the LED of the device emits pink light with solid effect about 2 seconds.
    ...     - 17. Connect the device to the PC.
    ...     - 18. Switch the device to DFU mode.
    ...     - 19. Verify that the LED of the device emits cyan light with solid effect.
    ...     - 20. Load new firmware for the device.
    ...     - 21. Power-on the device.
    ...     - 22. Verify that the LED of the device emits pink light with solid effect about 2 seconds.
    ...     - 23. Remove the SD card from the Biotres device.
    ...     - 24. Power on the device.
    ...     - 25. Verify that the LED of the device emits yellow light with flash effect.
    ...     - 26. Power off the device by pressing and holding the “Event” and “Power” button about 10 seconds.
    ...     - 27. Insert the SD card back in to the Biotres device.
    ...     - 28. Power on the device by pressing and holding the “Power” button for 3 seconds.
    [Tags]  BTMCT-DEVICEUI-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-DEVICEUI-02: Verify that the LED of the device
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. The device software shall incorporate LED interface for the User notifications.
    ...     - 2. When the device is turned off by pressing and holding the Home Button, the device shall provide User an LED-based notification.
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
    ...     - 3. Wait for 1 minute for study to get initiated on the device
    ...     Test Output:
    ...     - 1. Verify that the LED of the device emits white light with solid effect.
    ...     - 2. Press and hold “Event” button on device for 5 seconds to start study.
    ...     - 3. Verify that the LED of the device emits green light with pulse effect.
    ...     - 4. Connect the charging cable to the charging port of the device.
    ...     - 5. Verify that the LED of the device emits blue light with pulse effect.
    ...     - 6. Wait for 30 seconds and then unplug the charging cable.
    ...     - 7. Verify that the LED of the device emits white light with flash effect.
    ...     - 8. Waiting for 30 seconds.
    ...     - 9. Verify that the LED of the device emits white light with pulse effect for 10 seconds then emits green light with pulse effect.
    ...     - 10. Disconnect the ECG cable.
    ...     - 11. Verify that the LED of the device emits white light with flash effect.
    ...     - 12. Connect the ECG cable again.
    ...     - 13. Press “Event” button, then send some symptoms.
    ...     - 14. Verify that the LED of the device emits white light with pulse effect.
    ...     - 15. In WinSCP, stop the study using the stopstudy command.
    ...     - 16. Verify that the LED of the device emits green light with fast flash effect.
    ...     - 17. Using WinSCP, send the uploadstudy command to upload the study.
    ...     - 18. Verify that the LED of the device emits green light with flash effect.
    ...     - 19. Using WinSCP, send the erasestudy command to erase the study.
    ...     - 20. Verify that the LED of the device emits green light with solid effect.
    ...     - 21. Wait for long enough to let the battery charge drop below 10%.
    ...     - 22. Verify that the LED of the device emits blue light with flash effect.
    ...     - 23. Connect the charging cable to the charging port of the device and wait until battery is fully charged.
    ...     - 24. Verify that the LED of the device emits blue light with solid effect.
    [Tags]  BTMCT-DEVICEUI-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-DEVICEUI-03: Upon accepting the User commanded cardiac event
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Upon accepting the User commanded cardiac event, the device shall request the Biotres gateway to display a Symptoms screen
    ...          with pre-selected list of symptoms and store the returned symptom which is chosen by the User.
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
    ...     - 4. Press and hold “Event” button on device for 5 seconds to start study
    ...     Test Output:
    ...     - 1. While the study is in progress, locate and press the “Event” button.
    ...     - 2. Verify the Biotres gateway displays a Symptoms screen with a list of symptoms.
    ...     - 3. Select all options from the list of symptoms then press “Send” button.
    ...     - 4. Wait for device to post the manual event data.
    ...     - 5. In WinSCP, refresh the view. Within the device folder, locate the device acknowledgement of the event button pressed action. Verify there are files with the format below:
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.hea
    ...          event-manual-mm-dd-yy-hh-mm-ss+timezone.dat
    ...     - 6. Using WinSCP, transfer the file event-manual-mm-dd-yy-hh-mm-ss+timezone.hea identified in previous step, to a local folder on the PC.
    ...     - 7. Verify that it is displaying all selected symptoms under Manual Event Reason.
    ...     - 8. Upload study data using the uploadstudy command.
    ...     - 9. Upload the device log by sending getlog command
    ...     - 10. Erase study by sending the erasestudy command.
    [Tags]  BTMCT-DEVICEUI-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library      project_bioheart_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${URL}  Get Config Param    WEB_BASE_URL
    Open Page  ${URL}

SUITE TEARDOWN
    Quit Browser
