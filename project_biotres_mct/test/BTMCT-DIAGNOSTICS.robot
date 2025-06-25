*** Settings ***
Documentation   Biotres device diagnostics verification test suite
Metadata        sid     BTMCT-DIAGNOSTICS
Metadata        owner   Han Nguyen
Library         corelib/AssertionExtension.py
Library         corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}

Force Tags      BTMCT-DIAGNOSTICS       device
Test Timeout    1h

*** Test Cases ***
BTMCT-DIAGNOSTICS-01: The device software shall maintain a log of the following software\system events
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. Power-up diagnostics for the hardware reliability check.
    ...     - 2. Communication errors between device and the server.
    ...     - 3. ECG upload errors.
    ...     - 4. Detectable hardware failures.
    ...     - 5. Faster battery depletion.
    ...     Test Setup and Input:
    ...     - 1. Power on the device.
    ...     - 2. Wait for a few minutes for power on initialization to finish including the power on initialization checks such as cellular connectivity, SD card health and CRC check.
    ...     - 3. Power down the device.
    ...     - 4. Wait for few minutes for power off to finish.
    ...     - 5. Remove the SD card from the Biotres device.
    ...     - 6. Power on the device.
    ...     - 7. Wait for Power On initialization and look for the LED of device emits yellow light with flash effect associated with SD card removal.
    ...     - 8. Power off the device by pressing and holding the Home button for 10 seconds.
    ...     - 9. Insert the SD card back in to the Biotres device.
    ...     - 10. Power on the device by pressing and holding the Home button for 3-5 seconds.
    ...     - 11. Wait for a few minutes for power on initialization to finish including the power on initialization checks such as cellular connectivity, SD card health and CRC check.
    ...     Test Output:
    ...     - 1. In WinSCP, send the getlog command to retrieve the device activities log. (Refer to the result from case TC_COMM_116_TC01)
    ...     - 2. Wait for 5 minutes and refresh the WinSCP view. Within the device folder, verify the file with the format:
    ...          log-data-mm-dd-yy-hh-mm-ss+timezone.txt
    ...          log-daily-mm-dd-yy-hh-mm-ss+timezone.txt
    ...     - 3. Within device log file, status files and notifications in the device folder, verify the following events:
    ...          Power On
    ...          Power Down
    ...          CRC Check.
    ...     - 4. Connect the device to the Biotres Device Monitor Software. Issue the following command which will return firmware version, actual firmware CRC. SM+VER?.
    ...     - 5. Enable CRC checking feature. SM+CRC=1,<Original CRC>.
    ...     - 6. Using Biotres Device Monitor software, issue the command below to read the value written at address 0800AA00. Record the value read here SM+FLASH=0800AA00?
    ...     - 7. Using Biotres Device Monitor software, write a different value at address 0800AA00 than read in the previous step SM+FLASH=0800AA00,AA
    ...     - 8. Wait for “Device Health Check Frequency” time interval.
    ...     - 9. Verify the LED of device emits pink light with solid effect to recovery CRC failure.
    ...     - 10. In WinSCP, upload device log with getlog command using getlog.txt in the test input folder.
    ...     - 11. Wait for the device log to be uploaded. Verify Invalid CRC entry in the device log.
    [Tags]  BTMCT-DIAGNOSTICS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTMCT-DIAGNOSTICS-02: The device software shall maintain battery measurement trending data in order
    [Documentation]     Author: Han Nguyen
    ...
    ...     Description:
    ...     - 1. The device software shall maintain battery measurement trending data in order to assess the remaining usage before the next charge.
    ...     Test Setup and Input:
    ...     - 1. Complete all the steps from Section 12 "Verification Sequence & Expected Results".
    ...     Test Output:
    ...     - 1. Disconnect the lead (Refer to the result from case TC_COMM_116_TC02)
    ...     - 2. Wait for few minutes to finish sending the Lead off detection notification.
    ...     - 3. Reconnect the lead.
    ...     - 4. Wait for few minutes to finish sending the lead connection notification.
    ...     - 5. Wait for long enough to let the battery charge drop below 10%.
    ...     - 6. Verify that the Battery Low notification is sent.
    ...     - 7. Wait again to let the battery charge drop below 5%.
    ...     - 8. Verify that the Battery Critical notification is sent when the charger is plugged back in since device stops sending notification to the server
    ...          when remaining battery threshold is <=5% since modem gets turned off at 5% battery level.
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
    ...     - 15. Upload the device log by sending getlog command.
    ...     - 16. Erase study by sending the erasestudy command.
    [Tags]  BTMCT-DIAGNOSTICS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library      project_bioheart_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${URL}  Get Config Param    WEB_BASE_URL
    Open Page  ${URL}

SUITE TEARDOWN
    Quit Browser
