*** Settings ***
Documentation   Biotres device gateway communication verification test suite
Metadata        sid     BTMCT-GATEWAYCOMM
Metadata        owner   Han Nguyen
Library         corelib/AssertionExtension.py
Library         corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}

Force Tags      BTMCT-GATEWAYCOMM       device
Test Timeout    1h

*** Test Cases ***
BTMCT-GATEWAYCOMM-01: Device software shall support wireless communication over Bluetooth
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Device software shall support wireless communication over Bluetooth when authenticated Biotres gateway is present.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     - 2. Make sure the device was turned off after the last study, if not long press the “Power” button for 5 seconds to power-off device
    ...     Test Output:
    ...     - 1. Make sure the Biotres gateway is enabled.
    ...     - 2. Long press the “Power” button for 5 seconds to power-on device.
    ...     - 3. Verify the device is connected to the server via Biotres gateway when device is on.
    [Tags]  BTMCT-GATEWAYCOMM-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-GATEWAYCOMM-02: The device shall report its status to the Biotres gateway
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Study status
    ...     - 2. Lead-off status
    ...     - 3. Battery status
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
    ...     - 1. Verify the Biotres gateway displays study status as “Setting up”.
    ...     - 2. Press and hold the “Event” button on the device for 5s to start study.
    ...     - 3. Verify the Biotres gateway displays study status as “Study is in progress”.
    ...     - 4. Unplug ECG cable from the device.
    ...     - 5. Verify the Biotres gateway displays electrode connection as Lead-off.
    ...     - 6. Press and hold the "Power" button on the device in 5 seconds to power off the device.
    ...     - 7. Verify the Biotres gateway displays study status as “Study Paused”.
    ...     - 8. Power on the device.
    ...     - 9. In WINSCP, send the stopstudy command using stopstudy.txt
    ...     - 10. Verify the Biotres gateway displays study status as “Study completed”.
    ...     - 11. In WINSCP, send the uploadstudy command using uploadstudy.txt.
    ...     - 12. Verify the Biotres gateway displays study status as “Uploading Study data”. Then switch to "Study Uploaded"
    ...     - 13. Upload the device log by sending getlog command.
    ...     - 14. In WINSCP, send the erasestudy command using erasestudy.txt.
    ...     - 15. Verify the Biotres gateway displays study status as "Ready for new study".
    ...     - 16. Connect the charging cable to the device.
    ...     - 17. Verify the Biotres gateway displays battery status as charging.
    ...     - 18. Disconnect the charging cable from the device.
    ...     - 19. Verify the Biotres gateway displays battery status as discharging.
    [Tags]  BTMCT-GATEWAYCOMM-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-GATEWAYCOMM-03: Wireless communication over Bluetooth with the authenticated Biotres gateway shall be encrypted
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Wireless communication over Bluetooth with the authenticated Biotres gateway shall be encrypted.
    ...     Test Setup and Input:
    ...     - 1. Remove Biotres Device from device list of any connected Biotres Gateway application
    ...     - 2. Install Terminal IO Utility application from Google Play Store & launch the application
    ...     Test Output:
    ...     - 1. Connect the device to the Biotres Device Monitor Software. Issue the following command to disable Bluetooth communication encryption
    ...          SM+ENCRYPT=0
    ...          And disconnect the device from the monitor software..
    ...     - 2. Connect Biotres Device to a Biotres Gateway application, the process should be successful.
    ...     - 3. Remove the Biotres Device from Biotres Gateway application.
    ...     - 4. Download application Terminal IO Utility from Store (Android), open the application press the [Clear] button (if not grey-out).
    ...     - 5. Press the [Scan] button and wait until the scanning process finishes
    ...          The Biotres Device is displayed on the scan result as BTCY-BIOTRES-XXXXXXXXXX (with XXXXXXXXXX is ID of the Biotres Device)
    ...     - 6. Select the target Biotres Device by tapping on the device ID.
    ...     - 7. Press the [Connect] button to connect to Biotres Device
    ...     - 8. Observe the Receiving box, the received data contains ID of the Biotres Device because the first Handshake packet which contains the device ID is not encrypted.
    ...     - 9. Press the [Disconnect] button and press the "< TIO Sample x.y" button on the top left of the screen to back to home screen.
    ...     - 10. Connect the device to the Biotres Device Monitor Software. Issue the following command to enable Bluetooth communication encryption SM+ENCRYPT=1
    ...           And disconnect the device from the monitor software..
    ...     - 11. Repeat from step 2 to 7.
    ...     - 12. Observe the Receiving box, device ID cannot be obtained because data is encrypted
    ...     - 13. Repeat step 9 & close the application.
    [Tags]  BTMCT-GATEWAYCOMM-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library      project_bioheart_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${URL}  Get Config Param    WEB_BASE_URL
    Open Page  ${URL}

SUITE TEARDOWN
    Quit Browser
