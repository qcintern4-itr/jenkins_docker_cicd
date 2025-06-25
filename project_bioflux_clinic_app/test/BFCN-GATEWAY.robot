
*** Settings ***
Documentation   Clinic-Authetication Test Suite
Metadata    sid     BFCN-GATEWAY
Metadata    owner   Phuong Tran
Library     corelib/AssertionExtension.py

Force Tags      BFCN-GATEWAY       mapp
Test Timeout    30m


*** Test Cases ***
BFCN-GATEWAY-BTGW-01: View Biotres gateway screen when have no device assigned to the user's facility
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: The Clinic user can view a list of all Biotres devices assigned to the user's facility
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway screen
    ...
    ...     Test steps:
    ...     - 1. Observe the screen
    ...
    ...     Expected Results:
    ...     - Display the empty screen with the "No devices to display" text
	... 	- Refer to design (https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=11478-146571&mode=design&t=VBs3a8BxoWinb428-4)

    [Tags]  BFCN-GATEWAY-BTGW-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-02: View Biotres gateway screen when the account is deactivated
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View the Dashboard when the app login account has been deactived.
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway screen
    ...     Test steps:
    ...     - 1. Admin Portal: Deactive account that is signing in the app.
    ...     - 2. Click the Okay button
    ...
    ...     Expected Results:
	... 	- Step 1 - There shall be a modal displayed: “Your account was deactivated. Please contact the Biotricity Support team via the following email cs@biotricity.com for further information. Thank you!” with Okay button
	...     - Step 2 - Clicking Okay button shall log the user out from the app
	... 	- Refer to design (https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=7799-78600&mode=design&t=3Muhgh0STkwSIeEX-4)

    [Tags]  BFCN-GATEWAY-BTGW-02   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-03: Deny location permission when Install app for the first time
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user deny location permission in case of Install app for the first time
    ...
    ...     Precondition:
    ...     - The user is on Welcome screen
    ...
	...		Test Steps:
	...		- 1. Intall app
	...     - 2. Open the app
	...     - 3. Enter the Clinic account
	...		- 4. Deny location permission
    ...     - 5. Observe the screen
    ...
    ...     Expected Results:
    ...     - Android: The user shall be naigated to the  Dashboard screen with the Allow Location access to continue text, the Request permission button
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10212-139011&mode=design&t=VBs3a8BxoWinb428-4

    [Tags]  BFCN-GATEWAY-BTGW-03   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-04: Deny Bluetooth access when Install app for the first time
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user deny Bluetooth access in case of Install app for the first time
    ...
    ...     Precondition:
    ...     - The user is on Welcome screen
    ...
	...		Test Steps:
	...		- 1. Intall app
	...     - 2. Open the app
	...     - 3. Enter the Clinic account
	...		- 4. Deny Bluetooth access
    ...     - 5. Observe the screen
    ...
    ...     Expected Results:
    ...     - Android: The user shall be naigated to the Biotres gateway creen with the Allow Location access to continue text, the Request permission button
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10068-131766&mode=design&t=VBs3a8BxoWinb428-4

    [Tags]  BFCN-GATEWAY-BTGW-04   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-05: View Biotres gateway when the clinic user add the new facility
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Biotres gateway when the clinic user add the new facility
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway screen
    ...
	...		Test Steps:
	...		- 1. Admin Portal: add new facility to that clinic user
	...     - 2. Click the Okay button
    ...     Expected Results:
    ...     - Step1: there shall be a modal displayed: “Your clinic assignment has just been changed. Please sign in again to view the change.” with Okay button.
    ...     - Step2: Clicking Okay button shall log the user out from the app

    [Tags]  BFCN-GATEWAY-BTGW-05   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-06: View Biotres gateway when the clinic user remove the facility
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Biotres gateway when the clinic user add the new facility
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway screen
    ...
	...		Test Steps:
	...		- 1. Admin Portal: remove the facility to that clinic user
	...     - 2. Click the Okay button
    ...     Expected Results:
    ...     - Step1: there shall be a modal displayed: “Your clinic assignment has just been changed. Please sign in again to view the change.” with Okay button.
    ...     - Step2: Clicking Okay button shall log the user out from the app

    [Tags]  BFCN-GATEWAY-BTGW-06   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-GATEWAY-BTGW-07: Refresh the devices list after removing new device in the any facility assigned to clinic user
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: Refresh the devices list after adding new device in the any facility assigned to clinic user
    ...
    ...     Precondition:
    ...     - The use is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Admin Portal - remove the device in the any facility assigned to clinic user
    ...     - 2. Refresh the device list
    ...
    ...     Expected Results:
    ...     - The removed device shall be removed in the device list

    [Tags]  BFCN-GATEWAY-BTGW-07   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-08: Refresh the devices list after adding new device in the any facility assigned to clinic user
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: Refresh the devices list after adding new device in the any facility assigned to clinic user
    ...
    ...     Precondition:
    ...     - The use is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Admin Portal - add the device in the any facility assigned to clinic user
    ...     - 2. Refresh the device list
    ...
    ...     Expected Results:
    ...     - The added device shall be removed in the device list

    [Tags]  BFCN-GATEWAY-BTGW-08   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-GATEWAY-BTGW-VIEW-01: View a list of all Biotres devices assigned to the user's facility
	[Documentation]     Author: Phuong Tran
	...
    ...     Description: The Clinic user can view a list of all Biotres devices assigned to the user's facility
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway screen
    ...
    ...     Test steps:
    ...     - 1. Observe the screen
    ...
    ...     Expected Results:
    ...     - The Biotres device of the facilities specified for that account shall be displayed.
    ...     - Refer to design (https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10068-131507&mode=design&t=VBs3a8BxoWinb428-4)
    ...
    [Tags]  BFCN-GATEWAY-BTGW-VIEW-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-VIEW-02: View the Renewal Device in the Biotres Gateway
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View the Renewal Device in the Biotres Gateway
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway screen
    ...
	...		Test Steps:
	...		- 1. View the Renewal Device in the Biotres Gateway
    ...     Expected Results:
    ...     - Step1: The Renewal Device is not display in the Biotres device list

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-02   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-VIEW-03: View a connected device - Device ID
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View the Device ID of a specific device card
    ...
    ...     Precondition:
    ...     - The use is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Observe the Device ID of the specific device card
    ...
    ...     Expectec Results:
    ...     - The Device ID of that device card shall be displayed.

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-03   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-VIEW-05: View a connected device - View Facility name when sign in the account has multiple facility
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Facility name of a specific device card when sign in the account has multiple facility
    ...
    ...     Precondition:
    ...     - The use is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Observe the Facility of the specific device card
    ...
    ...     Expected Results:
    ...     - The Facility name of that device card shall be displayed below the Device ID.

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-05   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-VIEW-06: View a connected device - View Facility name when sign in the account has multiple facility and filtering any facility in the User tab
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Facility name when sign in the account has multiple facility and filtering any facility in the User tab
    ...
    ...     Precondition:
    ...     - The use is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filtering any facility in the User tab
    ...     - 2. Observe the Facility of the specific device card
    ...
    ...     Expected Results:
    ...     - The Facility Name shall not be displayed.

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-06   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-VIEW-07: View a connected device - View Study status when device is connected to the app and study status is Ready for new study
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View Study status when device is connected to the app and study status is Ready for new study of a specific device card
	...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...     - The device is running study and study status is Ready for new study
    ...     Test Steps:
    ...     - 1. Connect with that device with Ready for new study status
    ...     - 2. View the connected device's status in the Biotres Gateway screen
    ...
    ...     Expected Result:
    ...     - The connected device shall be displayed with "Ready for new study" status
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10065-128663&mode=design&t=uJDSGPzAIbySWSkS-4

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-07   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-VIEW-08: View a connected device - View Study status when device is connected to the app and study status is Study created
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Study status when device is connected to the app and study status is Study created of a specific device card
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...     - Create a MCT, Cardiac, ...study with a device
    ...
    ...     Test Steps:
    ...     - 1. Connect with that device has Study created status
    ...     - 2. View the connected device's status in the Biotres Gateway screen
    ...
    ...     Expected Result:
    ...     - The connected device shall be displayed with "Study created" status.
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10065-128861&mode=design&t=uJDSGPzAIbySWSkS-4

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-08   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-VIEW-09: View a connected device - View Study status when device is connected to the app and study status is Setting up
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Study status when device is connected to the app and study status is Setting up of a specific device card
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...     - The device is running study and study status is Setting up
    ...
    ...     Test Steps:
    ...     - 1. Connect with that device has "Setting up" status.
    ...     - 2. View the connected device's status in the Biotres Gateway screen
    ...
    ...     Expected Result:
    ...     - The connected device shall be displayed with "Setting up" status.
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10065-128818&mode=design&t=uJDSGPzAIbySWSkS-4

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-09   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-VIEW-10: View a connected device - View Study status when device is connected to the app and study status is Study in-process
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Study status when device is connected to the app and study status is Study in-process of a specific device card
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...     - The device is running study and study status is Study in-process
    ...
    ...     Test Steps:
    ...     - 1. Connect with that device with "Study in-process" status
    ...     - 2. View the connected device's status in the Biotres Gateway screen
    ...
    ...     Expected Result:
    ...     - The connected device shall be displayed with "Study in-process" status and time remaining (0h 0m ), progress bar
    ...     - Refer to design:  https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10065-128951&mode=design&t=uJDSGPzAIbySWSkS-4
    [Tags]  BFCN-GATEWAY-BTGW-VIEW-10   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-VIEW-11: View a connected device - View Study status when device is connected to the app and study status is Study Completed
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Study status when device is connected to the app and study status is  Study Completed of a specific device card
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...     - The device is running study and study status is  Study Completed
    ...
    ...     Test Steps:
    ...     - 1. Connect with that device has " Study Completed" status.
    ...     - 2. View the connected device's status in the Biotres Gateway screen
    ...
    ...     Expected Result:
    ...     - That device shall be displayed with " Study Completed" status. and "Done" text, progress bar
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10212-138638&mode=design&t=uJDSGPzAIbySWSkS-4
    [Tags]  BFCN-GATEWAY-BTGW-VIEW-11   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-VIEW-12: View a connected device - View Study status when device is connected to the app and study status is Uploading study data /Study uploaded
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Study status when device is connected to the app and study status is Uploading study data /Study uploaded of a specific device card
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...     - The device is running study and study status is Uploading study data /Study uploaded
    ...
    ...     Test Steps:
    ...     - 1. Connect with that device has Uploading study data /Study uploaded status
    ...     - 2. View the connected device's status in the Biotres Gateway screen
    ...
    ...     Expected Result:
    ...     - That device shall be displayed with "Uploading study data /Study uploaded" status and "Uploading - number %t/ Uploaded" text or ,  progress bar
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10065-128994&mode=design&t=uJDSGPzAIbySWSkS-4
    ...     - https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10212-138681&mode=design&t=uJDSGPzAIbySWSkS-4
    [Tags]  BFCN-GATEWAY-BTGW-VIEW-12   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-VIEW-13: View a connected device - View Study status when device is connected to the app and study status is Study paused
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Study status when device is connected to the app and study status is Study paused of a specific device card
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...     - The device is running study
    ...
    ...     Test Steps:
    ...     - 1. Connect with that device
    ...     - 2. Turn off device/ Charge the device
    ...     - 3. View the connected device's status in the Biotres Gateway screen
    ...
    ...     Expected Result:
    ...     - That device shall be displayed with "Study paused" status and "Paused" text,  progress bar
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10065-128908&mode=design&t=uJDSGPzAIbySWSkS-4
    [Tags]  BFCN-GATEWAY-BTGW-VIEW-13   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-VIEW-14: View a connected device - Turn off Bluetooth and view BT connection status
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Bluettooth connection status of a specific device card when turn off Bluetooth
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn off Bluetooth
    ...
	... 	Expected Result:
	...		- The Bluetooth connection status icon will be filled with gray color
	... 	- There shall be:
	...		-	a. an error message displayed:
	... 	-		i. iOS: “Bluetooth is disabled. Please enable it!”
	...		-		ii. Android: “Bluetooth is disabled. Please enable it”
	...		-	b. All connected devices in the list will be disconnected, Paired status is displayed in each previously connected device row
	...		-	c. clearances of all other device information to “--”, except Device ID and Firmware version
	...     - Refer to design:  https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10214-140312&mode=design&t=67lS58R31EFCAfu1-4
	...     - https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10219-141832&mode=design&t=pQPDZqosMyNn56dz-4

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-14   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-VIEW-15: View a connected device - Turn on Bluetooth and view BT connection status
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Bluettooth connection status of a specific device card when turn on Bluetooth
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn on Bluetooth
    ...
	...		Expected Result:
	... 	- The Bluetooth connection status icon will be filled with green color
	...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10105-147610&mode=design&t=RfegBVH1SDHIv4xB-4

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-15   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-VIEW-16: View a connected device - Turn off Internet connection and view Server connection status
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Server connection status of a specific device card when turn off Internet connection
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn off Internet
    ...
	...		Expected Result:
	... 	- The Internet connection status icon will be filled with gray color
	... 	- There shall be a banner displayed: No Internet connection
	...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10125-142773&mode=design&t=RfegBVH1SDHIv4xB-4
    ...     -  https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10365-137889&mode=design&t=pQPDZqosMyNn56dz-4

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-16   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-VIEW-17: View a connected device - Turn on Internet connection and view Server connection status
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Server connection status of a specific device card when turn on Internet connection
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn on Internet
    ...
    ...     Expected Result:
    ...     - The Bluetooth connection status icon will be filled with green color
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10125-142790&mode=design&t=RfegBVH1SDHIv4xB-4

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-17   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-VIEW-18: View a connected device - View Electrodes connection when the device is connected to the app and all electrodes are connected
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Electrodes connection when the device is connected to the app and all electrodes are connected
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. All electrodes are connected
    ...     - 3. Observe
    ...
	...		Expected Result:
	... 	- The electrode connection status icon shall be displayed and filled with green color.
	...     - Refer to Design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10125-142813&mode=design&t=RfegBVH1SDHIv4xB-4

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-18   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-VIEW-19: View a connected device - View Electrodes connection when the device is connected to the app and there is an electrode disconnection
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:  View Electrodes connection when then the device is connected to the app and there is an electrode disconnection
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. There is an electrode disconnection
    ...
    ...     Expected Result:
    ...     - The electrode connection status shall be filled with gray color.
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10125-142809&mode=design&t=RfegBVH1SDHIv4xB-4

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-19  manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-VIEW-20: View a connected device - Not charged battery and view Battery level
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Battery level of a specific device card when it is not charged
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Observe the Battery level
    ...
    ...     Expected Result:
    ...     - The battery icon and battery level (%) shall be displayed and filled with green color
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10125-142716&mode=design&t=67lS58R31EFCAfu1-4

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-20   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-VIEW-21: View a connected device - Charged battery and view Battery level
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View Battery level of a specific device card when it is charged
	...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Charg that device
    ...     - 3. Observe the Battery level
    ...
    ...     Expected Result:
    ...     - The battery icon with charging icon and battery level (%) shall be displayed and filled with orange color
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10125-142646&mode=design&t=67lS58R31EFCAfu1-4

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-21   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-VIEW-22: View a connected device - View Battery level when the battery is Low (<10%)

	[Documentation]     Author: Phuong Tran
	...
	...     Description: View Battery level when the battery is Low (<10%)
	...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Observe the Battery level
    ...
    ...     Expected Result:
    ...     - The battery icon and battery level (%) shall be displayed and filled with red color.
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10125-142617&mode=design&t=67lS58R31EFCAfu1-4

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-22   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-VIEW-23: View a connected device - View the Device's current firmware version
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View Disconnect button of a specific device card when device is connected to the app
	...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Observe the Device's current firmware version
    ...
    ...     Expected Result:
    ...     - This shall be loaded from the server in advance, when the device is connected to the app, the app shall check for the current device firmware version ( if not display "--" )

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-23   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-VIEW-24: View a connected device - View Paired tag when device is being connected to the app but then loses its connection with the app (by turning off the device)
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View Paired tag of a specific device card when device is being connected to the app but then loses its connection with the app
	...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn off the device
    ...     - 3. Observe the Paired tag
    ...
    ...     Expected Result:
    ...     - There shall be a Paired tag displayed on the connected Biotres device row.

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-24   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-VIEW-25: View a connected device - View Paired tag when device is being connected to the app but then loses its connection with the app (by turning off the BT)
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View Paired tag when device is being connected to the app but then loses its connection with the app (by turning off the BT)
	...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn off the BT
    ...     - 3. Observe the Paired tag
    ...
    ...     Expected Result:
    ...     - There shall be a Paired tag displayed on the connected Biotres device row.

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-25   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-VIEW-26: View the devices paired or not connected to the app - Device ID
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View the Device ID of a specific device card
    ...
    ...     Precondition:
    ...     - The use is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Observe the Device ID of the specific device card
    ...
    ...     Expectec Results:
    ...     - The Device ID of that device card shall be displayed.

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-26   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-VIEW-27: View the devices paired or not connected to the app - View Facility name when sign in the account has multiple facility
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Facility name of a specific device card
    ...
    ...     Precondition:
    ...     - The use is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Observe the Facility of the specific device card
    ...
    ...     Expected Results:
    ...     - The Facility name of that device card shall be displayed below the Device ID.

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-27   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-VIEW-28: View the devices paired or not connected to the app - View Facility name when sign in the account has multiple facility and filtering any facility in the User tab
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Facility name when sign in the account has multiple facility and filtering any facility in the User tab
    ...
    ...     Precondition:
    ...     - The use is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filtering any facility in the User tab
    ...     - 2.
    ...
    ...     Expected Results:
    ...     - The Facility name of that device card shall not be displayed below the Device ID.

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-28   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-VIEW-29: View the devices paired or not connected to the app - View the Device's current firmware version
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View the Device's current firmware version
    ...
    ...     Precondition:
    ...     - The use is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filtering any facility in the User tab
    ...     - 2. Observe
    ...
    ...     Expected Results:
    ...     - The the Device's current firmware version shall be displayed below the Device ID. ( if not display "--" )


    [Tags]  BFCN-GATEWAY-BTGW-VIEW-29   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-GATEWAY-BTGW-VIEW-30: View icon noti in the FW information section when connecting a device whose firmware version is the latest
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View icon noti in the FW information section when connecting a device whose firmware version is the latest
	...
    ...     Precondition:
    ...     -The user is on the BTGW screen screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device when connecting a device whose firmware version is the latest
    ...     - 2. Observe
    ...
    ...     Expected Result:
    ...     - Refer to Design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10212-139412&mode=design&t=XNVUGUy671OXAu97-4

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-30   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-VIEW-31: View icon noti in the FW information section when connecting a device whose firmware version is not the latest
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View icon noti in the FW information section when connecting a device whose firmware version is not the latest
	...
    ...     Precondition:
    ...     -The user is on the BTGW screen screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device when connecting a device whose firmware version is not the latest
    ...     - 2. Observe
    ...
    ...     Expected Result:
    ...     - Refer to Design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10212-139412&mode=design&t=KkcFOPrWBUbpJQiC-4

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-31   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-GATEWAY-BTGW-VIEW-32: View icon noti in the FW information section when connecting a device whose firmware version is not the latest and is running the study
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View icon noti in the FW information section when connecting a device whose firmware version is not the latest and is running the study
	...
    ...     Precondition:
    ...     -The user is on the BTGW screen screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device when connecting a device whose firmware version is not the latest ad is running the study
    ...     - 2. Observe
    ...
    ...     Expected Result:
    ...     - Refer to Design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10212-139412&mode=design&t=KkcFOPrWBUbpJQiC-4

    [Tags]  BFCN-GATEWAY-BTGW-VIEW-32   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-01: Filter specific facility - View the sort order of the list after connected the device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description:  Filter specific facility - View the sort order of the list after connected the device
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect any device
    ...     - 3. View the sort order of the list
    ...
    ...     Expected Results:
    ...     - 1. The specific facility's device shall be displayed.
    ...     - The device shall be connected in the app.
    ...     - The connected device's location will be brought to the top of the device list.

    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-02: Filter specific facility- View the sort order of the list after turn off the connected device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Filter specific facility- View the sort order of the list after turn off the connected device
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect any device
    ...     - 3. Turn off that device
    ...
    ...     Expected Results:
    ...     - 1. The specific facility's device shall be displayed.
    ...     - 2. The device shall be connected successfully and The connected device's location will be brought to the top of the device list.
    ...     - 3. The Paired status is displayed in each previously connected device row and The connected device's location will be brought to the top of the device list.
    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-02   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-03: Filter specific facility- View the sort order of the list after turn off the BT
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description:Filter specific facility- View the sort order of the list after turn off the connected device
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect any device
    ...     - 3. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully.
    ...     - Step3: The Paired status is displayed in each previously connected device row and The connected device's location will be brought to the top of the device list.

    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-04: Filter specific facility - View the sort order of the list after the device is reconnected automatically by turning on the device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Filter specific facility - View the sort order of the list after the device is reconnected automatically by turning on the device
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect any device
    ...     - 3. Turn off device
    ...     - 4. Turn on device
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully.
    ...     - Step3: The Paired status is displayed in each previously connected device row and The connected device's location will be brought to the top of the device list.
    ...     - Step4: The device shall be reconnected automatically, the Paired tag shall be hiden and The connected device's location will be brought to the top of the device list.

    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-05: Filter specific facility - View the sort order of the list after the device is reconnected automatically by turning on the BT
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description:Filter specific facility - View the sort order of the list after the device is reconnected automatically by turning on the BT
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect any device
    ...     - 3. Turn off BT
    ...     - 4. Turn on BT
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully.
    ...     - Step3: The Paired status is displayed in each previously connected device row and The connected device's location will be brought to the top of the device list.
    ...     - Step4: The device shall be reconnected automatically, the Paired tag shall be hiden and The connected device's location will be brought to the top of the device list.

    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-05       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-06: Filter specific facility - View the connected device's status after reloading the device list
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: Filter specific facility - View the connected device's status after reloading the device list
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect any device
    ...     - 3. Reload the device list
    ...     - 4. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully.
    ...     - Step3: The device list shall be updated (if not)
    ...     - Step4: The connected device remains connected.

    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-07: Filter specific facility - View the connected device's status after kill app and re-open the app
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: Filter specific facility - View the connected device's status after kill app and re-open the app
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect any device
    ...     - 3. Kill the app
    ...     - 4. Re-open the app
    ...     - 5. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully.
    ...     - Step3: The app shall be closed.
    ...     - Step4: The app shall be re-opened.
    ...     - Step5: iOS: The Paired status is displayed in each previously connected device row and the app shall be reconnected after re-open the app
    ...     - Step5: Android: The connected device remains connected.

    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-07      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-08: Filter specific facility - View the connected device's status after go to Home and re-open the app
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: Filter specific facility - View the connected device's status after go to Home and re-open the app
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect any device
    ...     - 3. Go to the Home
    ...     - 4. Re-open the app
    ...     - 5. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully.
    ...     - Step3: The user shall be redirected the Home
    ...     - Step4: The app shall be re-opened.
    ...     - Step5: The connected device remains connected.

    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-09: Filter specific facility - View the connected device's status after multiple task and re-open the app
	[Documentation]     Author: Phuong Tran
    ...     Description: View the sort order of the list after turn off the connected device when having a specific facility filtered
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect any device
    ...     - 3. Multiple task
    ...     - 4. Re-open the app
    ...     - 5. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully.
    ...     - Step4: The app shall be re-opened.
    ...     - Step5: The connected device remains connected.

    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-09      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-10: Filter specific facility - View the connected device's status after turn off and turn on the phone's screen
    [Documentation]     Author: Phuong Tran
    ...     Description: View the sort order of the list after turn off the connected device when having a specific facility filtered
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect any device
    ...     - 3. Turn off phone's screen
    ...     - 4. Turn on phone's screen
    ...     - 5. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully.
    ...     - Step3: The phone's screen shall be turned off.
    ...     - Step4: The phone's screen shall be turned on.
    ...     - Step5: iOS: The Paired status is displayed in each previously connected device row and the app shall be reconnected after re-open the app
    ...     - Step5: Android: The connected device remains connected.
    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-10       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}




BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-11: No filter facility - View the sort order of the list after connected the device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: View the sort order of the list after connected the device
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. View the sort order of the list
    ...
    ...     Expected Results:
    ...     - The device shall be connected in the app.
    ...     - The connected device's location will be brought to the top of the device list.

    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-11   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-12: No filter facility - View the sort order of the list after turn off the connected device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: View the sort order of the list after turn off the connected device when having no facility filtered
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn off that device
    ...     - 3. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully and The connected device's location will be brought to the top of the device list.
    ...     - Step3: The Paired status is displayed in each previously connected device row and device's location will be brought to the top of the device list.
    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-12  manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-13: No filter facility- View the sort order of the list after turn off the BT
    [Documentation]     Author: Phuong Tran
    ...     Description: View the sort order of the list after turn off BT when having a specific facility filtered
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn off BT
    ...     - 3. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully.
    ...     - Step2: The phone's BT shall be turned off.
    ...     - Step3: The Paired status is displayed in each previously connected device row and device's location will be brought to the top of the device list.

    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-13       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-14:No filter facility - View the sort order of the list after the device is reconnected automatically by turning on the device
    [Documentation]     Author: Phuong Tran
    ...     Description: View the sort order of the list after turn off the connected device when having a specific facility filtered
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn off device
    ...     - 3. Turn on device

    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully.
    ...     - Step2: The Paired status is displayed in each previously connected device row and The connected device's location will be brought to the top of the device list.
    ...     - Step3: The device shall be reconnected automatically, the Paired tag shall be hiden and The connected device's location will be brought to the top of the device list.

    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-14       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-15: No filter facility - View the sort order of the list after the device is reconnected automatically by turning on the BT
    [Documentation]     Author: Phuong Tran
    ...     Description: No filter facility - View the sort order of the list after the device is reconnected automatically by turning on the BT
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn off BT
    ...     - 3. Turn on BT
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully.
    ...     - Step2: The Paired status is displayed in each previously connected device row and The connected device's location will be brought to the top of the device list.
    ...     - Step3: The device shall be reconnected automatically, the Paired tag shall be hiden and The connected device's location will be brought to the top of the device list.


    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-15      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-16: No filter facility - View the connected device's status after reloading the device list
    [Documentation]     Author: Phuong Tran
    ...     Description: No filter facility - View the connected device's status after reloading the device list
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Reload the device list
    ...     - 3. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully.
    ...     - Step2: The device list shall be updated (if not)
    ...     - Step3: The connected device remains connected.
        [Tags]  BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-16     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-17: No filter facility - View the connected device's status after kill app and re-open the app
    [Documentation]     Author: Phuong Tran
    ...     Description: No filter facility - View the connected device's status after kill app and re-open the app
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Kill the app
    ...     - 3. Re-open the app
    ...     - 4. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully.
    ...     - Step2: The app shall be closed.
    ...     - Step3: The app shall be re-opened.
    ...     - Step4: iOS: The Paired status is displayed in each previously connected device row and the app shall be reconnected after re-open the app
    ...     - Step4: Android: The connected device remains connected.
    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-17      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-18: No filter facility - View the connected device's status after go to Home and re-open the app
    [Documentation]     Author: Phuong Tran
    ...     Description: No filter facility - View the connected device's status after go to Home and re-open the app
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Go to the Home
    ...     - 3. Re-open the app
    ...     - 4. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully.
    ...     - Step2: The user shall be redirected the Home
    ...     - Step3: The app shall be re-opened.
    ...     - Step4: The connected device remains connected.

    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-18       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-19: No filter facility - View the connected device's status after Multiple task and re-open the app
    [Documentation]     Author: Phuong Tran
    ...     Description: No filter facility - View the connected device's status after Multiple task and re-open the app
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Multiple task
    ...     - 3. Re-open the app
    ...     - 4. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully.
    ...     - Step3: The app shall be re-opened.
    ...     - Step4: The connected device remains connected.

    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-19     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-20: No filter facility - View the connected device's status after turn off and turn on the phone's screen
    [Documentation]     Author: Phuong Tran
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn off phone's screen
    ...     - 3. Turn on phone's screen
    ...     - 4. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully.
    ...     - Step2: The phone's screen shall be turned off.
    ...     - Step3: The phone's screen shall be turned on.
    ...     - Step4: iOS: The Paired status is displayed in each previously connected device row and the app shall be reconnected after re-open the app
    ...     - Step4: Android: The connected device remains connected.
    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-SINGLE-DEVICE-20      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-01: Filter specific facility - View the sort order of the list after connected mutiple device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Filter specific facility - View the sort order of the list after connected mutiple device
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect the mutiple device
    ...     - 3. View the sort order of the list
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The the mutiple device shall be connected in the app.
    ...     - Step3: The connected device's location will be brought to the top of the device list.

    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-02: Filter specific facility- View the sort order of the list after turn off one of them or all devices
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Filter specific facility- View the sort order of the list after turn off one of them or all devices
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...     Test Steps:
     ...    - 1. In the User tab - Filter specific facility
    ...     - 2. Connect the multiple device
    ...     - 3. Turn off one of them or all devices
    ...
    ...     Expected Results:
     ...    - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The multiple device shall be connected successfully and The connected device's location will be brought to the top of the device list.
    ...     - Step3: The Paired status is displayed in each previously connected device row and The connected device's location will be brought to the top of the device list.
    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-02   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-03: Filter specific facility- View the sort order of the list after turn off the BT
    [Documentation]     Author: Phuong Tran
    ...     Description:  Filter specific facility- View the sort order of the list after turn off the BT
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect the multiple device
    ...     - 3. Turn off BT
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The multiple device shall be connected successfully.
    ...     - Step3: The Paired status is displayed in each previously connected device row and the app shall be reconnected when the device turn on

    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-04: Filter specific facility - View the sort order of the list after the device is reconnected automatically by turn on one of them or all devices
    [Documentation]     Author: Phuong Tran
    ...     Description: Filter specific facility - View the sort order of the list after the device is reconnected automatically by turn on one of them or all devices
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
     ...    - 1. In the User tab - Filter specific facility
    ...     - 2. Connect the multiple device
    ...     - 3. Turn off one of them or all devices
    ...     - 4. Turn on one of them or all device
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The multiple device shall be connected successfully.
    ...     - Step3: The Paired status is displayed in each previously connected device row and The connected device's location will be brought to the top of the device list.
    ...     - Step4: The multiple device shall be reconnected automatically, the Paired tag shall be hiden and The connected device's location will be brought to the top of the device list.

    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-05: Filter specific facility - View the sort order of the list after the device is reconnected automatically by turning on the BT
    [Documentation]     Author: Phuong Tran
    ...     Description: Filter specific facility - View the sort order of the list after the device is reconnected automatically by turning on the BT
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
     ...    - 1. In the User tab - Filter specific facility
    ...     - 2. Connect the multiple device
    ...     - 3. Turn off BT
    ...     - 4. Turn on BT
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The multiple device shall be connected successfully.
    ...     - Step3: The Paired status is displayed in each previously connected device row and The connected device's location will be brought to the top of the device list.
    ...     - Step4: The multiple device shall be reconnected automatically, the Paired tag shall be hiden and The connected device's location will be brought to the top of the device list.

    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-06: Filter specific facility - View the connected device's status after reloading the device list
    [Documentation]     Author: Phuong Tran
    ...     Description:  Filter specific facility - View the connected device's status after reloading the device list
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
     ...    - 1. In the User tab - Filter specific facility
    ...     - 2. Connect the multiple device
    ...     - 3. Reload the device list
    ...     - 4. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The multiple device shall be connected successfully.
    ...     - Step4: All previously connected devices will remain connected

    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-06       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-07: Filter specific facility - View the connected device's status after kill app and re-open the app
    [Documentation]     Author: Phuong Tran
    ...     Description: Filter specific facility - View the connected device's status after kill app and re-open the app
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect the multiple device
    ...     - 3. Kill the app
    ...     - 4. Re-open the app
    ...     - 5. Verify connection status
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The  multiple device shall be connected successfully.
    ...     - Step3: The app shall be closed.
    ...     - Step4: The app shall be re-opened.
    ...     - Step5: iOS: The Paired status is displayed in each previously connected device row and the app shall be reconnected after re-open the app
    ...     - Step5: Android: all previously connected devices will remain connected

    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-07       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-08: Filter specific facility - View the connected device's status after go to Home and re-open the app
    [Documentation]     Author: Phuong Tran
    ...     Description: Filter specific facility - View the connected device's status after go to Home and re-open the app
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect the multiple device
    ...     - 3. Go to the Home
    ...     - 4. Re-open the app
    ...     - 5. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The multiple device shall be connected successfully.
    ...     - Step3: The user shall be redirected the Home
    ...     - Step4: The app shall be re-opened.
    ...     - Step5: All previously connected devices will remain connected


    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-09: Filter specific facility - View the connected device's status after Multiple task and re-open the app
    [Documentation]     Author: Phuong Tran
    ...     Description: Filter specific facility - View the connected device's status after Multiple task and re-open the app
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect the multiple device
    ...     - 3. Multiple task
    ...     - 4. Re-open the app
    ...     - 5. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The mutiple device shall be connected successfully.
    ...     - Step4: The app shall be re-opened.
    ...     - Step5: All previously connected devices will remain connected
    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-09       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-10: Filter specific facility - View the connected device's status after turn off and turn the phone's screen
    [Documentation]     Author: Phuong Tran
    ...     Description: Filter specific facility - View the connected device's status after turn off and turn the phone's screen
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect the multiple device
    ...     - 3. Turn off phone's screen
    ...     - 4. Turn on phone's screen
    ...     - 5. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The multiple device shall be connected successfully.
    ...     - Step3: The phone's screen shall be turned off.
    ...     - Step4: The phone's screen shall be turned on.
    ...     - Step5: iOS: The Paired status is displayed in each previously connected device row and the app shall be reconnected after re-open the app
    ...     - Step5: Android:  ll previously connected devices will remain connected

    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-10       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-11: No filter facility - View the sort order of the list after connected multiple device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: No filter facility - View the sort order of the list after connected multiple device
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...     Test Steps:
    ...     - 1. Connect the multiple device
    ...     - 2. View the sort order of the list
    ...
    ...     Expected Results:
    ...     - The  multiple  device shall be connected in the app.
    ...     - The connected device's location will be brought to the top of the device list.

    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-11    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-12: No filter facility - View the sort order of the list after turn off one of them or all devices
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: No filter facility - View the sort order of the list after turn off one of them or all devices
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...     Test Steps:
    ...     - 1. Connect the multiple device
    ...     - 2. Turn off one of them or all devices
    ...
    ...     Expected Results:
    ...     - Step1: The multiple device shall be connected successfully and The connected device's location will be brought to the top of the device list.
    ...     - Step2: The Paired status is displayed in each previously connected device row and The connected device's location will be brought to the top of the device list.
    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-12   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-13: No filter facility- View the sort order of the list after turn off the BT
    [Documentation]     Author: Phuong Tran
    ...     Description:  No filter facility- View the sort order of the list after turn off the BT
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect the multiple device
    ...     - 2. Turn off BT
    ...     - 3. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully.
    ...     - Step2: The phone's BT shall be turned off.
    ...     - Step3: The Paired status is displayed in each previously connected device row and device's location will be brought to the top of the device list.


    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-13       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-14:No filter facility - View the sort order of the list after the device is reconnected automatically by turning on one of them or all devices
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: No filter facility - View the sort order of the list after the device is reconnected automatically by turning on one of them or all devices
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect the multiple device
    ...     - 2. Turn off one of them or all devices
    ...     - 3. Turn on one of them or all device
    ...
    ...     Expected Results:
    ...     - Step1: The multiple device shall be connected successfully.
    ...     - Step2: The Paired status is displayed in each previously connected device row and The connected device's location will be brought to the top of the device list.
    ...     - Step3: The multiple device shall be reconnected automatically, the Paired tag shall be hiden and The connected device's location will be brought to the top of the device list.


    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-14       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-15: No filter facility - View the sort order of the list after the device is reconnected automatically by turning on the BT
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: View the sort order of the list after turn off the connected device when having a specific facility filtered
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect the multiple device
    ...     - 2. Turn off BT
    ...     - 3. Turn on BT
    ...
    ...     Expected Results:
    ...     - Step1: The multiple device shall be connected successfully.
    ...     - Step2: The Paired status is displayed in each previously connected device row and The connected device's location will be brought to the top of the device list.
    ...     - Step3: The device shall be reconnected automatically, the Paired tag shall be hiden and The connected device's location will be brought to the top of the device list.

    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-15      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-16: No filter facility - View the connected device's status after reloading the device list

    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: No filter facility - View the connected device's status after reloading the device list
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect the multiple device
    ...     - 2. Reload the device list
    ...     - 3. Verify connection status
    ...
    ...
    ...     Expected Results:
    ...     - Step1: The multiple device shall be connected successfully.
    ...     - Step3: All previously connected devices will remain connected
    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-16      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-17: No filter facility - View the connected device's status after kill app and re-open the app
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: No filter facility - View the connected device's status after kill app and re-open the app
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect the multiple device
    ...     - 2. Kill the app
    ...     - 3. Re-open the app
    ...     - 4. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The  multiple device shall be connected successfully.
    ...     - Step2: The app shall be closed.
    ...     - Step3: The app shall be re-opened.
    ...     - Step4: iOS: The Paired status is displayed in each previously connected device row and the app shall be reconnected after re-open the app
    ...     - Step4: Android: all previously connected devices will remain connected

    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-17      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-18: No filter facility - View the connected device's status after go to Home and re-open the app
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: No filter facility - View the connected device's status after go to Home and re-open the app
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect the multiple device
    ...     - 2. Go to the Home
    ...     - 3. Re-open the app
    ...     - 4. Verify connection status
    ...
    ...
    ...     Expected Results:
    ...     - Step1: The multiple device shall be connected successfully.
    ...     - Step2: The user shall be redirected the Home
    ...     - Step3: The app shall be re-opened.
    ...     - Step4: All previously connected devices will remain connected
    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-18      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-19: No filter facility - View the connected device's status after Multiple task and re-open the app
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: No filter facility - View the connected device's status after Multiple tab and re-open the app
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect the multiple device
    ...     - 2. Multiple task
    ...     - 3. Re-open the app
    ...     - 4. Verify connection status
    ...
    ...
    ...     Expected Results:
    ...     - Step1: The mutiple device shall be connected successfully.
    ...     - Step3: The app shall be re-opened.
    ...     - Step4: All previously connected devices will remain connected
    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-19       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-20: No filter facility - View the connected device's status after turn off and turn the phone's screen
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: No filter facility - View the connected device's status after turn off and turn the phone's screen
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect the multiple device
    ...     - 2. Turn off phone's screen
    ...     - 3. Turn on phone's screen
    ...     - 4. Verify connection status
    ...
    ...
    ...     Expected Results:
    ...     - Step1: The multiple device shall be connected successfully.
    ...     - Step2: The phone's screen shall be turned off.
    ...     - Step3: The phone's screen shall be turned on.
    ...     - Step4: iOS: The Paired status is displayed in each previously connected device row and the app shall be reconnected after re-open the app
    ...     - Step4: Android:  ll previously connected devices will remain connected
    [Tags]  BFCN-GATEWAY-BTGW-CONNECT-MULTIPLE-DEVICE-20       manual

    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-BTGW-TAP-01: Tap any device
	[Documentation]     Author: Phuong Tran
	...
	...     Description: The tapped device's information shall be displayed
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen screen
    ...
    ...     Test Steps:
    ...     - 1. Tap any device
    ...     - 2. Observe
    ...
    ...     Expected Result:
    ...     - The user shall be redirected the Device's Information screen that device is tapped
    ...

    [Tags]  BFCN-GATEWAY-BTGW-TAP-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-01: View Biotres gateway screen when the account is deactivated
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View the Search screen when the app login account has been deactived.
    ...
    ...     Precondition:
    ...     - The user is on the Search screen screen
    ...     Test steps:
    ...     - 1. Admin Portal: Deactive account that is signing in the app.
    ...     - 2. Click the Okay button
    ...
    ...     Expected Results:
	... 	- Step 1 - There shall be a modal displayed: “Your account was deactivated. Please contact the Biotricity Support team via the following email cs@biotricity.com for further information. Thank you!” with Okay button
	...     - Step 2 - Clicking Okay button shall log the user out from the app
	... 	- Refer to design (https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=7799-78600&mode=design&t=3Muhgh0STkwSIeEX-4)

    [Tags]  BFCN-GATEWAY-SEARCH-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-02: Deny location permission when Install app for the first time
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user deny location permission in case of Install app for the first time
    ...
    ...     Precondition:
    ...     - The user is on Seaarch screen
    ...
	...		Test Steps:
	...		- 1. Intall app
	...     - 2. Open the app
	...     - 3. Enter the Clinic account
	...		- 4. Deny location permission
    ...     - 5. Observe the screen
    ...
    ...     Expected Results:
    ...     - Android: The user shall be naigated to the  Search screen with the Allow Location access to continue text, the Request permission button
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10212-139011&mode=design&t=VBs3a8BxoWinb428-4

    [Tags]  BFCN-GATEWAY-SEARCH-02  manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-03: Deny Bluetooth access when Install app for the first time
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user deny Bluetooth access in case of Install app for the first time
    ...
    ...     Precondition:
    ...     - The user is on Search screen
    ...
	...		Test Steps:
	...		- 1. Intall app
	...     - 2. Open the app
	...     - 3. Enter the Clinic account
	...		- 4. Deny Bluetooth access
    ...     - 5. Observe the screen
    ...
    ...     Expected Results:
    ...     - Android: The user shall be naigated to the Search creen with the Allow Location access to continue text, the Request permission button
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10068-131766&mode=design&t=VBs3a8BxoWinb428-4

    [Tags]  BFCN-GATEWAY-SEARCH-03   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-VIEW-01: View a connected device - Device ID
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View the Device ID of a specific device card
    ...
    ...     Precondition:
    ...     - The use is on the Search screen
    ...
    ...     Test Steps:
    ...     - 1. Search the connected device
    ...     - 2. Observe the Device ID of the specific device card
    ...
    ...     Expectec Results:
    ...     - Step1: The searched device shall be displayed
    ...     - Step2: Device ID of that device card shall be displayed.

    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-VIEW-02: View a connected device - View Facility name when sign in the account has multiple facility
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Facility name of a specific device card
    ...
    ...     Precondition:
    ...     - The use is on the Search screen
    ...
    ...     Test Steps:
     ...    - 1. Search the connected device
    ...     - 2. Observe the Facility of the specific device card
    ...
    ...     Expected Results:
    ...     - The searched device shall be displayed and the Facility name of that device card shall be displayed below the Device ID.

    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-02   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-VIEW-03: View a connected device - View Facility name when sign in the account has multiple facility and filtering any facility in the User tab
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Facility name when sign in the account has multiple facility and filtering any facility in the User tab
    ...
    ...     Precondition:
    ...     - The use is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filtering any facility in the User tab
    ...     - 2. Search the connected device
    ...
    ...     Expected Results:
    ...     - The searched device shall be displayed and the Facility name of that device card shall not be displayed below the Device ID.

    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-03   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-VIEW-04: View a connected device - View Study status when device is connected to the app and study status is Ready for new study
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View Study status when device is connected to the app and study status is Ready for new study of a specific device card
	...
    ...     Precondition:
    ...     - The user is on the Search screen
    ...     - The device is running study and study status is Ready for new study
    ...     Test Steps:
    ...     - 1. Connect with that device with Ready for new study status
    ...     - 2. View the connected device's status in the Search screen
    ...
    ...     Expected Result:
    ...     - The connected device shall be displayed with "Ready for new study" status
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10065-128663&mode=design&t=uJDSGPzAIbySWSkS-4

    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-04   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-VIEW-05: View a connected device - View Study status when device is connected to the app and study status is Study created
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Study status when device is connected to the app and study status is Study created of a specific device card
    ...
    ...     Precondition:
    ...     - The user is on the Search screen
    ...     - Create a MCT, Cardiac, ...study with a device
    ...
    ...     Test Steps:
    ...     - 1. Connect with that device has Study created status
    ...     - 2. View the connected device's status in the Search screen
    ...
    ...     Expected Result:
    ...     - The connected device shall be displayed with "Study created" status.
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10065-128861&mode=design&t=uJDSGPzAIbySWSkS-4

    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-05   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-VIEW-06: View a connected device - View Study status when device is connected to the app and study status is Setting up
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Study status when device is connected to the app and study status is Setting up of a specific device card
    ...
    ...     Precondition:
    ...     - The user is on the Search screen
    ...     - The device is running study and study status is Setting up
    ...
    ...     Test Steps:
    ...     - 1. Connect with that device has "Setting up" status.
    ...     - 2. View the connected device's status in the Search screen
    ...
    ...     Expected Result:
    ...     - The connected device shall be displayed with "Setting up" status.
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10065-128818&mode=design&t=uJDSGPzAIbySWSkS-4

    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-06   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-VIEW-07: View a connected device - View Study status when device is connected to the app and study status is Study in-process
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Study status when device is connected to the app and study status is Study in-process of a specific device card
    ...
    ...     Precondition:
    ...     - The user is on the Search screen
    ...     - The device is running study and study status is Study in-process
    ...
    ...     Test Steps:
    ...     - 1. Connect with that device with "Study in-process" status
    ...     - 2. View the connected device's status in the Search screen
    ...
    ...     Expected Result:
    ...     - The connected device shall be displayed with "Study in-process" status and time remaining (0h 0m ), progress bar
    ...     - Refer to design:  https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10065-128951&mode=design&t=uJDSGPzAIbySWSkS-4
    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-07   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-VIEW-08: View a connected device - View Study status when device is connected to the app and study status is Study Completed
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Study status when device is connected to the app and study status is  Study Completed of a specific device card
    ...
    ...     Precondition:
    ...     - The user is on the Search screen
    ...     - The device is running study and study status is Study Completed
    ...
    ...     Test Steps:
    ...     - 1. Connect with that device has " Study Completed" status.
    ...     - 2. View the connected device's status in the Search screen
    ...
    ...     Expected Result:
    ...     - That device shall be displayed with " Study Completed" status. and "Done" text, progress bar
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10212-138638&mode=design&t=uJDSGPzAIbySWSkS-4
    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-08   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-VIEW-09: View a connected device - View Study status when device is connected to the app and study status is Uploading study data /Study uploaded
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Study status when device is connected to the app and study status is Uploading study data /Study uploaded of a specific device card
    ...
    ...     Precondition:
    ...     - The user is on the Search screen
    ...     - The device is running study and study status is Uploading study data /Study uploaded
    ...
    ...     Test Steps:
    ...     - 1. Connect with that device has Uploading study data /Study uploaded status
    ...     - 2. View the connected device's status in the Search screen
    ...
    ...     Expected Result:
    ...     - That device shall be displayed with "Uploading study data /Study uploaded" status and "Uploading - number %t/ Uploaded" text or ,  progress bar
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10065-128994&mode=design&t=uJDSGPzAIbySWSkS-4
    ...     - https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10212-138681&mode=design&t=uJDSGPzAIbySWSkS-4
    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-09   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-VIEW-10: View a connected device - View Study status when device is connected to the app and study status is Study paused
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Study status when device is connected to the app and study status is Study paused of a specific device card
    ...
    ...     Precondition:
    ...     - The user is on the Search screen
    ...     - The device is running study
    ...
    ...     Test Steps:
    ...     - 1. Connect with that device
    ...     - 2. Turn off device/ Charge the device
    ...     - 3. View the connected device's status in the Search screen
    ...
    ...     Expected Result:
    ...     - That device shall be displayed with "Study paused" status and "Paused" text,  progress bar
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10065-128908&mode=design&t=uJDSGPzAIbySWSkS-4
    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-10   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-VIEW-11: View a connected device - Turn off Bluetooth and view BT connection status
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Bluettooth connection status of a specific device card when turn off Bluetooth
    ...
    ...     Precondition:
    ...     - The user is on the Search screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Search the connected device
    ...     - 3. Turn off Bluetooth
    ...
	... 	Expected Result:
	...		- The Bluetooth connection status icon will be filled with gray color
	... 	- There shall be:
	...		-	a. an error message displayed:
	... 	-		i. iOS: “Bluetooth is disabled. Please enable it!”
	...		-		ii. Android: “Bluetooth is disabled. Please enable it”
	...		-	b. All connected devices in the list will be disconnected, Paired status is displayed in each previously connected device row
	...		-	c. clearances of all other device information to “--”, except Device ID and Firmware version
	...     - Refer to design: (https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10219-141832&mode=design&t=LXYOozmiL3raNVZw-4);

    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-11   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-VIEW-12: View a connected device - Turn on Bluetooth and view BT connection status
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Bluettooth connection status of a specific device card when turn on Bluetooth
    ...
    ...     Precondition:
    ...     - The user is on the Search screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Search the connected device
    ...     - 3 Turn on Bluetooth
    ...
	...		Expected Result:
	... 	- The Bluetooth connection status icon will be filled with green color
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10105-147610&mode=design&t=RfegBVH1SDHIv4xB-4
    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-12   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-VIEW-13: View a connected device - Turn off Internet connection and view Server connection status
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Server connection status of a specific device card when turn off Internet connection
    ...
    ...     Precondition:
    ...     - The user is on the Search screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Search the connected device
    ...     - 3. Turn off Internet
    ...
	...		Expected Result:
	... 	- The Internet connection status icon will be filled with gray color
	... 	- There shall be a banner displayed: No Internet connection
	...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10365-137889&mode=design&t=LXYOozmiL3raNVZw-4
    ...     -  https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10125-142794&mode=design&t=pQPDZqosMyNn56dz-4
    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-13   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-VIEW-14: View a connected device - Turn on Internet connection and view Server connection status
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Server connection status of a specific device card when turn on Internet connection
    ...
    ...     Precondition:
    ...     - The user is on the Search screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Search the connected device
    ...     - 3. Turn on Internet
    ...
    ...     Expected Result:
    ...     - The Bluetooth connection status icon will be filled with green color
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10125-142790&mode=design&t=pQPDZqosMyNn56dz-4

    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-14   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-VIEW-15: Device status - View Electrodes connection when the device is connected to the app and all electrodes are connected
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Electrodes connection when the device is connected to the app and all electrodes are connected
    ...
    ...     Precondition:
    ...     - The user is on the Search screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device and it has all electrodes connected
    ...     - 2. Search the connected device
    ...
	...		Expected Result:
	... 	- The electrode connection status icon shall be displayed and filled with green color.
	...     - Refer to Design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10125-142813&mode=design&t=RfegBVH1SDHIv4xB-4

    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-15   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-VIEW-16: Device status - View Electrodes connection when the device is connected to the app and there is an electrode disconnection
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: When the device is connected to the app and there is an electrode disconnection
    ...
    ...     Precondition:
    ...     - The user is on the Search screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any devicea and There is an electrode disconnection
    ...     - 2. Search the connected device
    ...
    ...     Expected Result:
    ...     - The electrode connection status shall be filled with gray color.
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10125-142809&mode=design&t=RfegBVH1SDHIv4xB-4

    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-16   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-VIEW-17: View a connected device - Not charged battery and view Battery level
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Battery level of a specific device card when it is not charged
    ...
    ...     Precondition:
    ...     - The user is on the Search screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Search the connected device
    ...
    ...     Expected Result:
    ...     - The battery icon and battery level (%) shall be displayed and filled with green color
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10125-142716&mode=design&t=67lS58R31EFCAfu1-4

    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-17   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-VIEW-18: View a connected device - Charged battery and view Battery level
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View Battery level of a specific device card when it is charged
	...
    ...     Precondition:
    ...     - The user is on the Search screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Charg that device
    ...     - 3. Search the connected device
    ...
    ...     Expected Result:
    ...     - The battery icon with charging icon and battery level (%) shall be displayed and filled with orange color
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10125-142646&mode=design&t=67lS58R31EFCAfu1-4

    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-18   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-VIEW-19: View a connected device - View Battery level when the battery is Low (<10%)

	[Documentation]     Author: Phuong Tran
	...
	...     Description: View Battery level when the battery is Low (<10%)
	...
    ...     Precondition:
    ...     - The user is on the Search screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Search the connected device
    ...
    ...     Expected Result:
    ...     - The battery icon and battery level (%) shall be displayed and filled with red color.
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10125-142617&mode=design&t=67lS58R31EFCAfu1-4

    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-19   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}    Manual Should Be Passed

BFCN-GATEWAY-SEARCH-VIEW-20: View a connected device - View the Device's current firmware version
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View Disconnect button of a specific device card when device is connected to the app
	...
    ...     Precondition:
    ...     - The user is on the Search screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Search the connected device
    ...     - 3. Observe the Device's current firmware version
    ...
    ...     Expected Result:
    ...     - This shall be loaded from the server in advance, when the device is connected to the app, the app shall check for the current device firmware version ( if not display "--" )

    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-20   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-VIEW-21: View a connected device - View Paired tag when device is being connected to the app but then loses its connection with the app (by turning off the device)
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View Paired tag of a specific device card when device is being connected to the app but then loses its connection with the app
	...
    ...     Precondition:
    ...     - The user is on the Search screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn off the device
    ...     - 3. Search the connected device
    ...     - 4. Observe the Paired tag
    ...
    ...     Expected Result:
    ...     - There shall be a Paired tag displayed on the connected Biotres device row.

    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-21   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-VIEW-22: View the devices paired or not connected to the app - Device ID
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View the Device ID of a specific device card
    ...
    ...     Precondition:
    ...     - The use is on the Search screen
    ...
    ...     Test Steps:
    ...     - 1. Search any device
    ...     - 2. Observe the Device ID of the specific device card
    ...
    ...     Expectec Results:
    ...     - The Device ID of that device card shall be displayed.

    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-22   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-VIEW-23: View the devices paired or not connected to the app - View Facility name when sign in the account has multiple facility
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Facility name of a specific device card
    ...
    ...     Precondition:
    ...     - The use is on the Search screen
    ...
    ...     Test Steps:
    ...     - 1. Search any device
    ...     - 2. Observe the Facility of the specific device card
    ...
    ...     Expected Results:
    ...     - The Facility name of that device card shall be displayed below the Device ID.

    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-23   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BFCN-GATEWAY-SEARCH-VIEW-24: View the devices paired or not connected to the app - View Facility name when sign in the account has multiple facility and filtering any facility in the User tab
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Facility name when sign in the account has multiple facility and filtering any facility in the User tab
    ...
    ...     Precondition:
    ...     - The use is on the Search screen
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filtering any facility in the User tab
    ...     - 2. Search any device
    ...     - 3. Observe the Facility of the specific device card
    ...     Expected Results:
    ...     - The Facility name of that device card shall not be displayed below the Device ID.

    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-24   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-VIEW-25: View the devices paired or not connected to the app - View the Device's current firmware version
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View the Device's current firmware version
    ...
    ...     Precondition:
    ...     - The use is on the Search screen
    ...
    ...     Test Steps:
    ...     - 1. Search any device
    ...     - 2. View the Device's current firmware version
    ...
    ...     Expected Results:
    ...     - The the Device's current firmware version shall be displayed below the Device ID ( if not display "--" )

    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-25   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-VIEW-26: View icon noti in the FW information section when connecting a device whose firmware version is the latest
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View icon noti in the FW information section when connecting a device whose firmware version is the latest
	...
    ...     Precondition:
    ...     -The user is on the Search screen
    ...
    ...     Test Steps:
    ...     - 1. Search the device whose firmware version is the latest

    ...
    ...     Expected Result:
    ...     - Refer to Design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10212-139412&mode=design&t=XNVUGUy671OXAu97-4

    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-26   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-VIEW-27: View icon noti in the FW information section when connecting a device whose firmware version is not the latest
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View icon noti in the FW information section when connecting a device whose firmware version is not the latest
	...
    ...     Precondition:
    ...     -The user is on the Search screen
    ...
    ...     Test Steps:
    ...     - 1. Search a device whose firmware version is not the latest
    ...
    ...     Expected Result:
    ...     - Refer to Design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10212-139412&mode=design&t=KkcFOPrWBUbpJQiC-4

    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-27   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-GATEWAY-SEARCH-VIEW-28: View icon noti in the FW information section when connecting a device whose firmware version is not the latest and is running the study
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View icon noti in the FW information section when connecting a device whose firmware version is not the latest and is running the study
	...
    ...     Precondition:
    ...     -The user is on the Search screen
    ...
    ...     Test Steps:
    ...     - 1.Search a device whose firmware version is not the latest and is running the study
    ...
    ...     Expected Result:
    ...     - Refer to Design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10212-139412&mode=design&t=KkcFOPrWBUbpJQiC-4

    [Tags]  BFCN-GATEWAY-SEARCH-VIEW-28   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-GATEWAY-SEARCH-TAP-01: Tap any device
	[Documentation]     Author: Phuong Tran
	...
	...     Description: The tapped device's information shall be displayed
    ...
    ...     Precondition:
    ...     -The user is on the Search screen
    ...
    ...     Test Steps:
    ...     - 1. Search and tap any device
    ...     - 2. Observe
    ...
    ...     Expected Result:
    ...     - The user shall be redirected the Device's Information screen that device is tapped
    ...

    [Tags]  BFCN-GATEWAY-SEARCH-TAP-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-GATEWAY-SEARCH-SEARCH-01:Search by entering a device ID that belongs to user's Facility (contains or not contains space characters)
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can search by entering a device Id that belongs to user's Facility
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Search button
    ...     - 2. Enter Device ID containing the space characters
    ...     - 3. Enter Device ID that not contains space characters
    ...     - 4. Observe the screen
    ...
    ...     Expected Results:
    ...     - Step1: The user shall be navigated to the Search screen.
    ...     - Step2: The screen shall be displayed the "No devies found" text.
    ...     - Step3: The entered Device ID shall be displayed.

    [Tags]  BFCN-GATEWAY-SEARCH-SEARCH-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-SEARCH-02: Search by entering a device ID that not belongs to user's Facility
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can search by entering a device Id that belongs to user's Facility
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Search button
    ...     - 2. Enter Device ID that not belongs to user's Facility.
    ...     - 3. Observe the screen
    ...
    ...     Expected Results:
    ...     - Step2: The screen shall be displayed the "No devies found" text.


    [Tags]  BFCN-GATEWAY-SEARCH-SEARCH-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-SEARCH-03: Search by entering a device ID that not belongs to user's Facility
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can search by entering a device Id that belongs to user's Facility
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Search button
    ...     - 2. Enter Device ID that not belongs to user's Facility.
    ...     - 3. Observe the screen
    ...
    ...     Expected Results:
    ...     - Step2: The screen shall be displayed the "No devies found" text.


    [Tags]  BFCN-GATEWAY-SEARCH-SEARCH-03     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-SEARCH-04: Search by scanning matrix code of a device ID that belongs to user's facility
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can search by scanning matrix code of a device ID that belongs to user's facility
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Search button
    ...     - 2. Clicks the Scan button
    ...     - 3. Scanning matrix code of a device ID that belongs to user's facility
    ...     - 4. Observe the screen
    ...
    ...     Expected Results:
    ...     - Step1: The user shall be navigated to the Search screen
    ...     - Step2: The user shall be navigated to the Scan matrix code screen
    ...     - Step3: The device id that belongs to user's facility shall be displayed

    [Tags]  BFCN-GATEWAY-SEARCH-SEARCH-04     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-SEARCH-05: Search by scanning matrix code of a device ID that not belongs to user's facility
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cann't search by scanning matrix code of a device ID that not belongs to user's facility
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Search button
    ...     - 2. Clicks the Scan button
    ...     - 3. scanning matrix code of a device ID that not belongs to user's facility
    ...     - 4. Observe the screen
    ...
    ...     Expected Results:
    ...     - Step1: The user shall be navigated to the Search screen
    ...     - Step2: The user shall be navigated to the Scan matrix code screen
    ...     - Step3: The search result shall be empty and there shall be a message displayed: “No results found”

    [Tags]  BFCN-GATEWAY-SEARCH-SEARCH-05     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-01: Filter specific facility - View the sort order of the list after connected the device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description:Filter specific facility - View the sort order of the list after connected the device
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect any device
    ...     - 3. Search the connected device

    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected in the app.
    ...     - Step3: The connected device's location will be brought to the top of the device list.

    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-02: Filter specific facility- View the sort order of the list after turn off the connected device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Filter specific facility- View the sort order of the list after turn off the connected device
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect any device
    ...     - 3. Turn off that device
    ...     - 4. Search the connected device
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully and The connected device's location will be brought to the top of the device list.
    ...     - Step4: The Paired status is displayed in each previously connected device row and the connected device's location will be brought to the top of the device list.
       [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-03: Filter specific facility- View the sort order of the list after turn off the BT
    [Documentation]     Author: Phuong Tran
    ...     Description: Filter specific facility- View the sort order of the list after turn off the BT
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect any device
    ...     - 3. Turn off the phone's BT
    ...     - 4. Search the connected device
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully and The connected device's location will be brought to the top of the device list.
    ...     - Step4: The Paired status is displayed in each previously connected device row and the connected device's location will be brought to the top of the device list.
    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-04: Filter specific facility - View the sort order of the list after the device is reconnected automatically by turning on the device
    [Documentation]     Author: Phuong Tran
    ...     Description:  Filter specific facility - View the sort order of the list after the device is reconnected automatically by turning on the device
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect any device
    ...     - 3. Turn off that device
    ...     - 4. Search the connected device
    ...     - 5. Turn on that device
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully and The connected device's location will be brought to the top of the device list.
    ...     - Step4: The Paired status is displayed in each previously connected device row and the connected device's location will be brought to the top of the device list.
   ...      - Step5: The device shall be reconnected automatically, the Paired tag shall be hiden and The connected device's location will be brought to the top of the device list.
    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-05: Filter specific facility - View the sort order of the list after the device is reconnected automatically by turning on the BT
    [Documentation]     Author: Phuong Tran
    ...     Description: Filter specific facility - View the sort order of the list after the device is reconnected automatically by turning on the BT
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect any device
    ...     - 3. Turn off the phone's BT
    ...     - 4. Search the connected device
    ...     - 5. Turn on the phone's BT
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully.
    ...     - Step4: The Paired status is displayed in each previously connected device row and the app shall be reconnected when the device turn on
    ...     - Step5: The device shall be reconnected automatically, the Paired tag shall be hiden and The connected device's location will be brought to the top of the device list.
    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-05       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-06: Filter specific facility - View the connected device's status after go to Home and re-open the app
    [Documentation]     Author: Phuong Tran
    ...     Description: Filter specific facility - View the connected device's status after go to Home and re-open the app
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect the device
    ...     - 3. Search the connected device
    ...     - 4. Go to the Home
    ...     - 5. Re-open the app

    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully.
    ...     - Step4: The user shall be redirected the Home
    ...     - Step5: The app shall be re-opened and the connected devices will remain connected
    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-06       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-07: Filter specific facility - View the connected device's status after Multiple task and re-open the app
    [Documentation]     Author: Phuong Tran
    ...     Description: Filter specific facility - View the connected device's status after Multiple task and re-open the app
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect the device
    ...     - 3. Search the connected device
    ...     - 4. Multiple task
    ...     - 5. Re-open the app
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully.
    ...     - Step3: The searched device shall be displayed.
    ...     - Step5: The app shall be re-opened and the connected devices will remain connected
    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-07       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-08: Filter specific facility - View the connected device's status after turn off and turn the phone's screen
    [Documentation]     Author: Phuong Tran
    ...     Description: Filter specific facility - View the connected device's status after turn off and turn the phone's screen
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect the device
    ...     - 3. Search the connected device
    ...     - 4. Turn off phone's screen
    ...     - 5. Turn on phone's screen
    ...     - 6. Verify connection status
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully.
    ...     - Step4: The phone's screen shall be turned off.
    ...     - Step5: The phone's screen shall be turned on.
    ...     - Step6: iOS: The Paired status is displayed in each previously connected device row and the connected device's location will be brought to the top of the device list.
    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}




BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-09: No filter facility - View the sort order of the list after connected the device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: No filter facility - View the sort order of the list after connected the device
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Search the connected device
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected in the app.
    ...     - Step2: The searched device shall be displaye and the connected device's location will be brought to the top of the device list.

    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-10: No filter facility - View the sort order of the list after turn off the connected device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: No filter facility - View the sort order of the list after turn off the connected device
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Search the connected device
    ...     - 3. Turn off that device
    ...     - 4. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully and The connected device's location will be brought to the top of the device list
    ...     - Step2: The searched device shall be displayed.
    ...     - Step4: The Paired status is displayed in each previously connected device row and device's location will be brought to the top of the device list.
    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-10   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-11: No filter facility- View the sort order of the list after turn off the BT
    [Documentation]     Author: Phuong Tran
    ...     Description: No filter facility- View the sort order of the list after turn off the BT
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn off the phone's BT
    ...     - 3. Search the connected device
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully and The connected device's location will be brought to the top of the device list.
    ...     - Step4: The searched shall be displayed, the Paired status is displayed in each previously connected device row and the connected device's location will be brought to the top of the device list.
    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-11       manual

    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-12:No filter facility - View the sort order of the list after the device is reconnected automatically by turning on the device
    [Documentation]     Author: Phuong Tran
    ...     Description: View the sort order of the list after turn off the connected device when having a specific facility filtered
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn off the device
    ...     - 3. Search the connected device
    ...     - 4. Turn on the device
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully.
    ...     - Step3: The searched device shall be display, the Paired status is displayed in each previously connected device row and the app shall be reconnected when the device turn on
    ...     - Step4: The device shall be reconnected automatically, the Paired tag shall be hiden and The connected device's location will be brought to the top of the device list.
    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-12       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-13: No filter facility - View the sort order of the list after the device is reconnected automatically by turning on the BT
    [Documentation]     Author: Phuong Tran
    ...     Description: No filter facility - View the sort order of the list after the device is reconnected automatically by turning on the BT
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 2. Connect any device
    ...     - 3. Turn off the phone's BT
    ...     - 4. Search the connected device
    ...     - 5. Turn on the phone's BT
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully.
    ...     - Step3: The searched device shall be display, the Paired status is displayed in each previously connected device row and the app shall be reconnected when the device turn on
    ...     - Step4: The device shall be reconnected automatically, the Paired tag shall be hiden and The connected device's location will be brought to the top of the device list.
    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-13       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-14: No filter facility - View the connected device's status after go to Home and re-open the app
    [Documentation]     Author: Phuong Tran
    ...     Description: No filter facility - View the connected device's status after go to Home and re-open the app
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect the device
    ...     - 2. Search the connected device
    ...     - 3. Go to the Home
    ...     - 4. Re-open the app
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully.
    ...     - Step2: The user shall be redirected the Home
    ...     - Step3: The app shall be re-opened and the connected devices will remain connected

    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-14       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-15: No filter facility - View the connected device's status after Multiple task and re-open the app
    [Documentation]     Author: Phuong Tran
    ...     Description:  No filter facility - View the connected device's status after Multiple task and re-open the app
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect the device
    ...     - 2. Search the connected device
    ...     - 3. Multiple task
    ...     - 4. Re-open the app
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully.
    ...     - Step2: The searched device shall be displayed.
    ...     - Step4: The app shall be re-opened and the connected devices will remain connected

    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-15       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-16: No filter facility - View the connected device's status after turn off and turn the phone's screen
    [Documentation]     Author: Phuong Tran
    ...     Description: No filter facility - View the connected device's status after turn off and turn the phone's screen
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect the device
    ...     - 2. Search the connected device
    ...     - 3. Turn off phone's screen
    ...     - 4. Turn on phone's screen
    ...     - 5. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully.
    ...     - Step2: The searched device shall be displayed.
    ...     - Step3: The phone's screen shall be turned off.
    ...     - Step4: The phone's screen shall be turned on.
    ...     - Step5: iOS: The Paired status is displayed in each previously connected device row and the connected device's location will be brought to the top of the device list.
    ...     - Step5: Android:  ll previously connected devices will remain connected
    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-16       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}





BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-17: Filter specific facility - View the sort order of the list after connected the mutiple device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Filter specific facility - View the sort order of the list after connected the mutiple device
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect the multiple device
    ...     - 3. Search the connected device

    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The multiple device shall be connected in the app.
    ...     - Step3: The connected device's location will be brought to the top of the device list.

    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-SINGLE-DEVICE-17    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-01: Filter specific facility- View the sort order of the list after turn off one of them or all connected devices
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Filter specific facility- View the sort order of the list after turn off one of them or all connected devices
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect any device
    ...     - 3. Turn off one of them or all connected devices
    ...     - 4. Search the connected device
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully and The connected device's location will be brought to the top of the device list.
    ...     - Step4: The searched device shall be displayed, the Paired status is displayed in each previously connected device row and the connected device's location will be brought to the top of the device list.
    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-02: Filter specific facility- View the sort order of the list after turn off the BT
    [Documentation]     Author: Phuong Tran
    ...     Description: Filter specific facility- View the sort order of the list after turn off the BT
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect the multiple device
    ...     - 3. Turn off the phone's BT
    ...     - 4. Search the connected device
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully and The connected device's location will be brought to the top of the device list.
    ...     - Step4: The searched device shall be displayed, the Paired status is displayed in each previously connected device row and the connected device's location will be brought to the top of the device list.
    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-03: Filter specific facility - View the sort order of the list after the device is reconnected automatically by turn on one of them or all connected devices
    [Documentation]     Author: Phuong Tran
    ...     Description: Filter specific facility - View the sort order of the list after the device is reconnected automatically by turn on one of them or all connected devices
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect the multiple device
    ...     - 3. Turn off one of them or all connected devices
    ...     - 4. Search the connected device
    ...     - 5. Turn on one of them or all connected devices
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: That device shall be connected successfully and The connected device's location will be brought to the top of the device list.
    ...     - Step4: The Paired status is displayed in each previously connected device row and the connected device's location will be brought to the top of the device list.
   ...      - Step5: The device shall be reconnected automatically, the Paired tag shall be hiden and The connected device's location will be brought to the top of the device list.
    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-04: Filter specific facility - View the sort order of the list after the device is reconnected automatically by turning on the BT
    [Documentation]     Author: Phuong Tran
    ...     Description: Filter specific facility - View the sort order of the list after the device is reconnected automatically by turning on the BT
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect the multiple device
    ...     - 3. Turn off the phone's BT
    ...     - 4. Search the connected device
    ...     - 5. Turn on the phone's BT
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully.
    ...     - Step4: The Paired status is displayed in each previously connected device row and the app shall be reconnected when the device turn on
    ...     - Step5: The device shall be reconnected automatically, the Paired tag shall be hiden and The connected device's location will be brought to the top of the device list.
    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-05: Filter specific facility - View the connected device's status after go to Home and re-open the app
    [Documentation]     Author: Phuong Tran
    ...     Description: Filter specific facility - View the connected device's status after go to Home and re-open the app
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect the multiple device
    ...     - 3. Search the connected device
    ...     - 4. Go to the Home
    ...     - 5. Re-open the app

    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully.
    ...     - Step4: The user shall be redirected the Home
    ...     - Step5: The app shall be re-opened and the connected devices will remain connected
    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-06: Filter specific facility - View the connected device's status after Multiple task and re-open the app
    [Documentation]     Author: Phuong Tran
    ...     Description: Filter specific facility - View the connected device's status after Multiple task and re-open the app
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect the multiple device
    ...     - 3. Search the connected device
    ...     - 4. Multiple task
    ...     - 5. Re-open the app
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully.
    ...     - Step3: The searched device shall be displayed.
    ...     - Step5: The app shall be re-opened and the connected devices will remain connected
    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-06       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-07: Filter specific facility - View the connected device's status after turn off and turn the phone's screen
    [Documentation]     Author: Phuong Tran
    ...     Description: Filter specific facility - View the connected device's status after turn off and turn the phone's screen
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. In the User tab - Filter specific facility
    ...     - 2. Connect the multiple device
    ...     - 3. Search the connected device
    ...     - 4. Turn off phone's screen
    ...     - 5. Turn on phone's screen
    ...     - 6. Verify connection status
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully.
    ...     - Step4: The phone's screen shall be turned off.
    ...     - Step5: The phone's screen shall be turned on.
    ...     - Step6: iOS: The Paired status is displayed in each previously connected device row and the connected device's location will be brought to the top of the device list.
    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-07       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}




BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-08: No filter facility - View the sort order of the list after connected the device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: No filter facility - View the sort order of the list after connected the device
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...     Test Steps:
    ...     - 1. Connect the multiple device
    ...     - 2. Search the connected device
    ...
    ...     Expected Results:
    ...     - Step1: The multiple device shall be connected in the app.
    ...     - Step2: The searched device shall be displaye and the connected device's location will be brought to the top of the device list.

    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-09: No filter facility - View the sort order of the list after turn off the connected one of them or all connected devices
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: No filter facility - View the sort order of the list after turn off the connected one of them or all connected devices
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...     Test Steps:
    ...     - 1. Connect the multiple device
    ...     - 2. Search the connected device
    ...     - 3. Turn off one or all device
    ...     - 4. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully and The connected device's location will be brought to the top of the device list
    ...     - Step2: The searched device shall be displayed.
    ...     - Step4: The Paired status is displayed in each previously connected device row and device's location will be brought to the top of the device list.
    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-09   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-10: No filter facility- View the sort order of the list after turn off the BT
    [Documentation]     Author: Phuong Tran
    ...     Description: No filter facility- View the sort order of the list after turn off the BT
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect the multiple device
    ...     - 2. Turn off the phone's BT
    ...     - 3. Search the connected device
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully and The connected device's location will be brought to the top of the device list.
    ...     - Step4: The searched shall be displayed, the Paired status is displayed in each previously connected device row and the connected device's location will be brought to the top of the device list.
    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-10      manual

    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-11:No filter facility - View the sort order of the list after the device is reconnected automatically by turning on the device
    [Documentation]     Author: Phuong Tran
    ...     Description: No filter facility - View the sort order of the list after the device is reconnected automatically by turning on the device
    ...
    ...     Precondition:
    ...     -The user is on the Search screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect the multiple device
    ...     - 2. Turn off the device
    ...     - 3. Search the connected device
    ...     - 4. Turn on the device
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully.
    ...     - Step3: The searched device shall be display, the Paired status is displayed in each previously connected device row and the app shall be reconnected when the device turn on
    ...     - Step4: The device shall be reconnected automatically, the Paired tag shall be hiden and The connected device's location will be brought to the top of the device list.
    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-11      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-12: No filter facility - View the sort order of the list after the device is reconnected automatically by turning on the BT
    [Documentation]     Author: Phuong Tran
    ...     Description: No filter facility - View the sort order of the list after the device is reconnected automatically by turning on the BT
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 2. Connect the multiple device
    ...     - 3. Turn off the phone's BT
    ...     - 4. Search the connected device
    ...     - 5. Turn on the phone's BT
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully.
    ...     - Step3: The searched device shall be display, the Paired status is displayed in each previously connected device row and the app shall be reconnected when the device turn on
    ...     - Step4: The device shall be reconnected automatically, the Paired tag shall be hiden and The connected device's location will be brought to the top of the device list.
    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-12       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-13: No filter facility - View the connected device's status after go to Home and re-open the app
    [Documentation]     Author: Phuong Tran
    ...     Description: No filter facility - View the connected device's status after go to Home and re-open the app
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect the multiple device
    ...     - 2. Search the connected device
    ...     - 3. Go to the Home
    ...     - 4. Re-open the app
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully.
    ...     - Step2: The user shall be redirected the Home
    ...     - Step3: The app shall be re-opened and the connected devices will remain connected

    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-13       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-14: No filter facility - View the connected device's status after Multiple task and re-open the app
    [Documentation]     Author: Phuong Tran
    ...     Description:  No filter facility - View the connected device's status after Multiple task and re-open the app
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect the multiple device
    ...     - 2. Search the connected device
    ...     - 3. Multiple task
    ...     - 4. Re-open the app
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully.
    ...     - Step2: The searched device shall be displayed.
    ...     - Step4: The app shall be re-opened and the connected devices will remain connected

    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-14       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-15: No filter facility - View the connected device's status after turn off and turn the phone's screen
    [Documentation]     Author: Phuong Tran
    ...     Description: No filter facility - View the connected device's status after turn off and turn the phone's screen
    ...
    ...     Precondition:
    ...     -The user is on the BTGW screen.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect the multiple device
    ...     - 2. Search the connected device
    ...     - 3. Turn off phone's screen
    ...     - 4. Turn on phone's screen
    ...     - 5. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully.
    ...     - Step2: The searched device shall be displayed.
    ...     - Step3: The phone's screen shall be turned off.
    ...     - Step4: The phone's screen shall be turned on.
    ...     - Step5: iOS: The Paired status is displayed in each previously connected device row and the connected device's location will be brought to the top of the device list.
    ...     - Step5: Android:  ll previously connected devices will remain connected
    [Tags]  BFCN-GATEWAY-SEARCH-CONNECT-MULTIPLE-DEVICE-15     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-VIEW-01: View device information when the device is not connected.
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View device information when the device is not connected.
    ...
    ...     Precondition:
    ...     -The user is on device information screen
    ...
    ...     Test Steps:
    ...     - 1. Tap any device
    ...     - 2. Observe
    ...
    ...     Expected Result:
    ...     - The Device Information shall be displayed:
    ...     + Device ID
    ...     + Facility name
    ...     + Connect device button
    ...     + Firmware information ( Current version )
    ...

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-GATEWAY-DEVICE-INFOR-VIEW-02: View device information when the device has Paired tag
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View device information when the device has Paired tag
    ...
    ...     Precondition:
    ...     -The user is on the device information screen
    ...
    ...     Test Steps:
    ...     - 1. Tap any device
    ...     - 2. Connect button
    ...     - 3. Turn off the device or turn off the BT
    ...
    ...     Expected Result:
    ...     - The Device Information shall be displayed:
    ...     + Device ID
    ...     + Facility name
    ...     + Connect device button
    ...     = Firmware information ( Current version )
    ...

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-02   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-VIEW-03: View the Facility name when the device is connected/ not connected to the app
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View the Facility name
    ...
    ...     Precondition:
    ...     -The user is on the device information screen
    ...
    ...     Test Steps:
    ...     - 1. View Facility name
    ...
    ...     Expected Result:
    ...     - The Facility name shall be displayed below the device id

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-03   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-GATEWAY-DEVICE-INFOR-VIEW-04: View the Connect device button when the device is not connected to the app
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View the Connect device button when the device is not connected to the app
    ...
    ...     Precondition:
    ...     -The user is on the device information screen
    ...
    ...     Test Steps:
    ...     - 1. View Connect device button
    ...
    ...     Expected Result:
    ...     - The Connect button shall be displayed in the Device Information screen.

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-04   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-VIEW-05: View the Firmware information when the device is not connected to the app
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View the Firmware information when the device is not connected to the app
    ...
    ...     Precondition:
    ...     -The user is on the device information screen
    ...
    ...     Test Steps:
    ...     - 1. View the Firmware information when the device is not connected to the app
    ...
    ...     Expected Result:
    ...     - The device's current version shall be displayed (if not display "--" )

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-05   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}




BFCN-GATEWAY-DEVICE-INFOR-VIEW-06: View the toast if the connecting process is successful
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View the Firmware information
    ...
    ...     Precondition:
    ...     -The user is on the device information screen
    ...
    ...     Test Steps:
    ...     - 1. Tap the Connect device button
    ...
    ...     Expected Result:
    ...     - There is a toast "Device connected!" is displayed.
    ...     - The device information shall be displayed:
    ...     - Device ID
    ...     - Rx, Tx rate
    ...     - Facility name
    ...     - Disconnect button
    ...     - Device status ( Battery, Connection type, Server connection, Electrodes connection)
    ...     - Study Status ( Ready for new study - Create new study button, other status - View study button)
    ...     - Firmware information ( Current version)

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-06   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-VIEW-07: View the toast if it fails to connect the device to the app
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View the Firmware information
    ...
    ...     Precondition:
    ...     -The user is on the device information screen
    ...
    ...     Test Steps:
    ...     - 1. Tap the Connect device button
    ...
    ...
    ...     Expected Result:
    ...     - There is a toast "Failed to connect device, please try again!" is displayed.
    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-07    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-VIEW-08: Tapping the Connect device button when turn off BT
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View the Firmware information
    ...
    ...     Precondition:
    ...     -The user is on the device information screen
    ...
    ...     Test Steps:
    ...     - 1. Turn off BT
    ...     - 2. Tapping the Connect device button
    ...     - 3. Tapping the Okay button
    ...
    ...
    ...     Expected Result:
    ...     - There is a  display a modal:
    ...     i. Title: Bluetooth Disabled
    ...     ii. Content: Bluetooth is disabled. Please turn it on to continue.
    ...     iii. Button: Okay. Tapping the button shall dismiss the modal

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-08   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-VIEW-09: View the Device Information when tapping the Disconnect device button
    [Documentation]     Author: Phuong Tran
	...     Description: View the Firmware information
    ...
    ...     Precondition:
    ...     -The user is on the device information screen
    ...
    ...     Test Steps:
    ...     - 1. Tap the Connect device button
    ...     - 2. Tap the Disconnect device button
    ...
    ...
    ...     Expected Result:
    ...     - The Device Information shall be displayed:
    ...     + Device ID
    ...     + Facility name
    ...     + Connect device button
    ...     + Firmware information ( Current version )
    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-VIEW-10: Device status - View the device's battery when the device is not charged battery and view battery level
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View the device's battery when the device is not charged battery and view battery level
    ...
    ...     Precondition:
    ...     - The user is on the device information screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Observe the Battery level
    ...
    ...     Expected Result:
    ...     - The battery icon and battery level (%) shall be displayed and filled with green color
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10125-142716&mode=design&t=67lS58R31EFCAfu1-4


    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-10   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-VIEW-11: Device status - View the device's battery when the device is charged battery and view Battery level
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View the device's battery when the device is charged battery and view Battery level
	...
    ...     Precondition:
    ...     - The user is on the device information screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Charg that device
    ...     - 3. Observe the Battery level
    ...
    ...     Expected Result:
    ...     - The battery icon with charging icon and battery level (%) shall be displayed and filled with orange color
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10125-142652&mode=design&t=RfegBVH1SDHIv4xB-4

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-11   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-VIEW-12: Device status - View the device's battery when the device's 'battery is Low (<10%)

	[Documentation]     Author: Phuong Tran
	...
	...     Description: View the device's battery when the device's 'battery is Low (<10%)
	...
    ...     Precondition:
    ...     - The user is on the device information screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Observe the Battery level
    ...
    ...     Expected Result:
    ...     -  The battery icon and battery level (%) shall be displayed and filled with red color.
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10125-142611&mode=design&t=RfegBVH1SDHIv4xB-4

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-12   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-VIEW-13: Device status - View Connection type when turn off Bluetooth
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Connection type when turn off Bluetooth
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn off Bluetooth
    ...
	... 	Expected Result:
	...		- The Bluetooth connection status icon will be filled with gray color
	... 	- There shall be:
	...		-	a. an error message displayed:
	... 	-		i. iOS: “Bluetooth is disabled. Please enable it!”
	...		-		ii. Android: “Bluetooth is disabled. Please enable it”
	...		-	b. All connected devices in the list will be disconnected, Paired status is displayed in each previously connected device row
	...		-	c. clearances of all other device information to “--”, except Device ID.
	...     - Refer to design: (https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10219-141832&mode=design&t=LXYOozmiL3raNVZw-4);
    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-13   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-VIEW-14: Device status - View Connection type when turn on Bluetooth
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Connection type when turn on Bluetooth
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn on Bluetooth
    ...
	...		Expected Result:
	... 	- The Bluetooth connection status icon will be filled with green color
	...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10105-147610&mode=design&t=RfegBVH1SDHIv4xB-4

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-14   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-VIEW-15: Device status - View Server connection when turn off Internet
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Server connection when turn off Internet
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn off Internet
    ...
	...		Expected Result:
	... 	- The Internet connection status icon will be filled with gray color
	... 	- There shall be a banner displayed: No Internet connection
	...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10125-142773&mode=design&t=RfegBVH1SDHIv4xB-4
    ...     -  https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10365-138143&mode=design&t=pQPDZqosMyNn56dz-4
    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-15   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-VIEW-16: Device status - View Server connection when turn on Internet
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Server connection when turn on Internet
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn on Internet
    ...
    ...     Expected Result:
    ...     - The Bluetooth connection status icon will be filled with green color
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10125-142790&mode=design&t=RfegBVH1SDHIv4xB-4

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-16   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-VIEW-17: Device status - View Electrodes connection when the device is connected to the app and all electrodes are connected
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Electrodes connection when the device is connected to the app and all electrodes are connected
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. All electrodes are connected
    ...     - 3. Observe
    ...
	...		Expected Result:
	... 	- The electrode connection status icon shall be displayed and filled with green color.
	...     - Refer to Design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10125-142813&mode=design&t=RfegBVH1SDHIv4xB-4

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-17   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-VIEW-18: Device status - View Electrodes connection when the device is connected to the app and there is an electrode disconnection
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: When the device is connected to the app and there is an electrode disconnection
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. There is an electrode disconnection
    ...
    ...     Expected Result:
    ...     - The electrode connection status shall be filled with gray color.
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10125-142809&mode=design&t=RfegBVH1SDHIv4xB-4

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-18   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-VIEW-19: View Create new study button when device is connected to the app and study status is Ready for new study
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View Study status when device is connected to the app and study status is Ready for new study of a specific device card
	...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...     - The device is running study and study status is Ready for new study
    ...     Test Steps:
    ...     - 1. Connect with that device
    ...     - 2. Observe the screen
    ...
    ...     Expected Result:
    ...     - The Create new study button shall be displayed in the Study status section
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10082-155740&mode=design&t=67lS58R31EFCAfu1-4

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-19   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-VIEW-20: View View study button when device is connected to the app and study status is Study created
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View View study button when device is connected to the app and study status is Study created
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...     - Create a MCT, Cardiac, ...study with a device
    ...
    ...     Test Steps:
    ...     - 1. Connect with that device
    ...     - 2. Observe the screen
    ...
    ...     Expected Result:
    ...     - The View study button shall be displayed in the Study status section
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10082-155801&mode=design&t=67lS58R31EFCAfu1-4

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-20   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-VIEW-21: View View study button when device is connected to the app and study status is Setting up
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View View study button when device is connected to the app and study status is Setting up
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...     - The device is running study and study status is Setting up
    ...
    ...     Test Steps:
    ...     - 1. Connect with that device
    ...     - 2. Observe the screen
    ...
    ...     Expected Result:
    ...     - The View study button shall be displayed in the Study status section
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10082-155681&mode=design&t=67lS58R31EFCAfu1-4


    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-21   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-VIEW-22: View View study button when device is connected to the app and study status is Study in-process
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View View study button when device is connected to the app and study status is Study in-process
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...     - The device is running study and study status is Study in-process
    ...
    ...     Test Steps:
    ...     - 1. Connect with that device
    ...     - 2. Observe the screen
    ...
    ...     Expected Result:
    ...     - The connected device shall be displayed with "Study in-process" status and time remaining (0h 0m )
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10082-155992&mode=design&t=67lS58R31EFCAfu1-4

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-22   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-GATEWAY-DEVICE-INFOR-VIEW-23 : View View study button when device is connected to the app and study status is Uploading study data /Study uploaded
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:  View View study button when device is connected to the app and study status is Uploading study data /Study uploaded
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...     - The device is running study and study status is Uploading study data /Study uploaded
    ...
    ...     Test Steps:
    ...     - 1. Connect with that device
    ...     - 2. Clinic Portal/ View details study on the App: Stop that study and wait for that Uploading study data /Study uploaded data
    ...     - 3. Observe the screen
    ...
    ...     Expected Result:
    ...     - That device shall be displayed with "Uploading study data /Study uploaded" status.
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10082-155923&mode=design&t=67lS58R31EFCAfu1-4
    ...     - https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10212-140079&mode=design&t=67lS58R31EFCAfu1-4

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-23    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-VIEW-24: View View study button when device is connected to the app and study status is Study paused
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Study status when device is connected to the app and study status is Study paused of a specific device card
    ...
    ...     Precondition:
    ...     - The user is on the Biotres gateway
    ...     - The device is running study
    ...
    ...     Test Steps:
    ...     - 1. Connect with that device
    ...     - 2. Turn off device/ Charge the device
    ...     - 3. Observe the screen
    ...
    ...     Expected Result:
    ...     - That device shall be displayed with "Study paused" status.
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10082-155862&mode=design&t=67lS58R31EFCAfu1-4

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-24   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-VIEW-25: Click the Create new study button when device is connected to the app and study status is Ready for new study
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View Study status when device is connected to the app and study status is Ready for new study of a specific device card
	...
    ...     Precondition:
    ...     - The user is on the Device Information screen
    ...     - The device is running study and study status is Ready for new study
    ...     Test Steps:
    ...     - 1. Connect with that device
    ...     - 2. Click the Create new study
    ...     - 3. In the Step 3:  View the Facility name and the Device ID, Device type
    ...     - 4. Fill in all required fields
    ...     - 5. Click the Done button in the Create Study screen
    ...
    ...     Expected Result:
    ...     - 1. That device shall be connected
    ...     - 2. The Create new study screen shall be displayed
    ...     - 3. The facility name and device id, device type will be filled in automatically
    ...     - 4. The user shall be redirected the Device information screen

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-25   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-VIEW-26: Click the View study button when device is connected to the app and study status is different from the Ready for new study status
	[Documentation]     Author: Phuong Tran
	...
	...     Description: Click the View study button when device is connected to the app and study status is different from the Ready for new study status
	...
    ...     Precondition:
    ...     - The user is on the Device Information screen
    ...     - The device is running study and study status is Ready for new study
    ...     Test Steps:
    ...     - 1. Connect with that device
    ...     - 2. Click the View study button
    ...     - 3.Click the Back button in the Study Information screen
    ...
    ...     Expected Result:
    ...     - 1. That device shall be connected.
    ...     - 2. The Study Infomation screen shall be displayed.
    ...     - 4. The user shall be redirected the Device information screen

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-26   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-VIEW-27: View icon noti in the FW information section when connecting a device whose firmware version is not the latest
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View icon noti in the FW information section when connecting a device whose firmware version is not the latest
	...
    ...     Precondition:
    ...     - The user is on the Device Information screen
    ...     Test Steps:
    ...     - 1. Connect a device whose firmware version is not the latest
    ...     - 2. Obsserve
    ...
    ...     Expected Result:
    ...     - 1. That device shall be connected.
    ...     - 2. The coneccted device row shall be displayed the "!" icon
    ...     - Refer to Design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10212-139412&mode=design&t=KkcFOPrWBUbpJQiC-4


    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-27  manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-VIEW-28: View icon noti in the FW information section when connecting a device whose firmware version is the latest
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View icon noti in the FW information section when connecting a device whose firmware version is the latest
	...
    ...     Precondition:
    ...     - The user is on the Device Information screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device when connecting a device whose firmware version is the latest
    ...     - 2. Observe
    ...
    ...     Expected Result:
    ...     - Refer to Design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10212-139412&mode=design&t=XNVUGUy671OXAu97-4

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-28   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-GATEWAY-DEVICE-INFOR-VIEW-29: View icon noti in the FW information section when connecting a device whose firmware version is not the latest and is running the study
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View icon noti in the FW information section when connecting a device whose firmware version is not the latest and is running the study
	...
    ...     Precondition:
    ...     - The user is on the Device Information screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device when connecting a device whose firmware version is not the latest ad is running the study
    ...     - 2. Observe
    ...
    ...     Expected Result:
    ...     - Refer to Design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10212-139412&mode=design&t=KkcFOPrWBUbpJQiC-4

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-VIEW-29   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}




BFCN-GATEWAY-DEVICE-INFOR-CONNECT-SINGLE-DEVICE-01: Filter specific facility - Turn off that device after connect the device
    [Documentation]     Author: Phuong Tran
    ...     Description: Filter specific facility - Turn off that device after connect the device
    ...
    ...     Precondition:
    ...     -The user is on the device information.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Filter any specific facility
    ...     - 2. Connect any device
    ...     - 3. Turn off that device
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully.
    ...     - Step3: The Paired status is displayed in each previously connected device row and the app shall be reconnected when the device turn on

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-CONNECT-SINGLE-DEVICE-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-CONNECT-SINGLE-DEVICE-02: Filter specific facility - Turn off the BT after connect the device
    [Documentation]     Author: Phuong Tran
    ...     Description: Filter specific facility - Turn off that BT after connect the device
    ...
    ...     Precondition:
    ...     -The user is on the device information.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Filter any specific facility
    ...     - 2. Connect any device
    ...     - 3. Turn off BT
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully.
    ...     - Step3: The Paired status is displayed in each previously connected device row and the app shall be reconnected when the device turn on

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-CONNECT-SINGLE-DEVICE-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-CONNECT-SINGLE-DEVICE-03: Filter specific facility - Turn off the Internet after connect the device
    [Documentation]     Author: Phuong Tran
    ...     Description: Filter specific facility - Turn off that BT after connect the device
    ...
    ...     Precondition:
    ...     -The user is on the device information.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Filter any specific facility
    ...     - 2. Connect any device
    ...     - 3. Turn off the Internet
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully.
    ...     - Step3: The Internet connection status icon will be filled with gray color
	... 	- There shall be a banner displayed: No Internet connection
	...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10125-142773&mode=design&t=RfegBVH1SDHIv4xB-4
    ...     -  https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10365-137889&mode=design&t=pQPDZqosMyNn56dz-4

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-CONNECT-SINGLE-DEVICE-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-CONNECT-SINGLE-DEVICE-04: Filter specific facility - Connect the device while it is connected to another mobile
    [Documentation]     Author: Phuong Tran
    ...     Description: View the sort order of the list after turn off the connected device when having a specific facility filtered
    ...
    ...     Precondition:
    ...     -The user is on the device information.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Filter any specific facility
    ...     - 2. Connect any device while it is connected to another mobil

    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: There is a toast "Failed to connect device, please try again!" is displayed.

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-CONNECT-SINGLE-DEVICE-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-CONNECT-SINGLE-DEVICE-05: Filter specific facility - Turn off the device while the device is connecting the app
    [Documentation]     Author: Phuong Tran
    ...     Description: Filter specific facility - Turn off the device while the device is connecting the app
    ...
    ...     Precondition:
    ...     -The user is on the device information.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Filter any specific facility
    ...     - 2. Turn off the device while the device is connecting the app
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step3: There is a toast "Failed to connect device, please try again!" is displayed.

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-CONNECT-SINGLE-DEVICE-05       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-CONNECT-SINGLE-DEVICE-06: Filter specific facility -Turn off the BT while the device is connecting the app
    [Documentation]     Author: Phuong Tran
    ...     Description: Filter specific facility - Turn off the device while the device is connecting the app
    ...
    ...     Precondition:
    ...     -The user is on the device information.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Filter any specific facility
    ...     - 2. Turn off the BT while the device is connecting the app
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step3: There is a toast "Failed to connect device, please try again!" is displayed.

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-CONNECT-SINGLE-DEVICE-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-CONNECT-SINGLE-DEVICE-07: Filter specific facility -Turn off the Internet while the device is connecting the app
    [Documentation]     Author: Phuong Tran
    ...     Description: Filter specific facility -Turn off the Internet while the device is connecting the app
    ...
    ...     Precondition:
    ...     -The user is on the device information.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Filter any specific facility
    ...     - 2. Turn off the BT while the device is connecting the app
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility's device shall be displayed.
    ...     - Step2: The device shall be connected successfully.

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-CONNECT-SINGLE-DEVICE-07       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-FW-01: View icon noti in the FW information section while connect the device has a fw version that is not latest
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: While downloading the new FW - View icon noti in the FW information section
    ...
    ...     Precondition:
    ...     - The user is on the Device Information screen
    ...     - The connected device has a firmware version that is not the latest
    ...
    ...
    ...     Test steps:
    ...     - 1. View icon noti in the FW information section
    ...
    ...     Expected Results:
    ...     - Refer to Design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10125-140984&mode=design&t=LpsfLbeXgWJuc3wn-4

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-FW-02: View icon noti in the FW information section while connect the device has a fw version that is latest
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: While downloading the new FW - View icon noti in the FW information section
    ...
    ...     Precondition:
    ...     - The user is on the Device Information screen
    ...     - The connected device has a firmware version that is the latest
    ...
    ...
    ...     Test steps:
    ...     - 1. View icon noti in the FW information section
    ...
    ...     Expected Results:
    ...     - Refer to Design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10105-148147&mode=design&t=LpsfLbeXgWJuc3wn-4

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-02   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-GATEWAY-DEVICE-INFOR-FW-03: While downloading the new FW - View the Update FW button in the FW information section
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: While downloading the new FW - View the Update FW button in the FW information section
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. View the Update FW button in the FW information section
    ...
    ...     Expected Results:
    ...     - Step1: The update FW button not display
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10105-148650&mode=design&t=u5oXH58JFard2gzp-4
    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-03   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-FW-04: While downloading the new FW - View the Update FW button after create a study with the device
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: While downloading the new FW - View the Update FW button after create a study with the device
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Create study while loading the latest FW
    ...
    ...     Expected Results:
    ...     - 1. Create study successfully and the latest FW download continues
    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-04   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-FW-05: While downloading the new FW - View the Update FW button after stop study running with the device
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: While downloading the new FW - View the Update FW button after create a study with the device
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Stop study while loading the latest FW
    ...
    ...     Expected Results:
    ...     - 1. Stop study successfully and the latest FW download continues (if the last FW is finished loading, it will show Update FW button)
    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-05   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-FW-06: While downloading the new FW - View the Update FW button after stop study running with the device
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: While downloading the new FW - View the Update FW button after stop study running with the device
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Stop study while loading the latest FW
    ...
    ...     Expected Results:
    ...     - 1. Stop study successfully and the latest FW download continues (if the last FW is finished loading, it will show Update FW button)

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-06  manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-FW-07: While downloading the new FW - Reload the devicce list
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: While  downloading the new FW - Reload the devicce list
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Reload the device list
    ...
    ...     Expected Results:
    ...     - 1. The latest FW download continues (if the last FW is finished loading, it will show Update FW button)

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-07   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-FW-08: While downloading the new FW - Reconnect after disconnect the device
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: While  downloading the new FW - Reconnect after disconnect the device
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Connect device
    ...     - 2. Disconnect that device
    ...     - 3. Re-connect that device
    ...
    ...     Expected Results:
    ...     - 1. The device is connected succesfully.
    ...     - 2. The device is disconnected.
    ...     - 3. The latest FW download continues (if the last FW is finished loading, it will show Update FW button)

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-08   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-FW-09: While downloading the new FW - Reconnect the device after kill app and reopen app
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: While  downloading the new FW - Reload the devicce list
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Connect device
    ...     - 2. Kill the app
    ...     - 3. Open the app
    ...
    ...     Expected Results:
    ...     - 1. The device is connected succesfully.
    ...     - 2. The app is closed.
    ...     - 3. The app is opened and the latest FW download continues (if the last FW is finished loading, it will show Update FW button)

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-09   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-FW-10: While downloading the new FW - Back to the Home
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: While  downloading the new FW - Back to the Home
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Connect device
    ...     - 2. Back to the Home
    ...     - 3. Open the app
    ...
    ...     Expected Results:
    ...     - 1. The device is connected succesfully.
    ...     - 2. The user shall be redirected the Home.
    ...     - 3. The app is opened and the latest FW download continues (if the last FW is finished loading, it will show Update FW button)

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-10   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-FW-11: While downloading the new FW - Multiple task
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: While downloading the new FW - Multiple task
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Connect device
    ...     - 2. Multiple task
    ...     - 3. Open the app
    ...
    ...     Expected Results:
    ...     - 1. The device is connected succesfully.
    ...     - 3. The app is opened and the latest FW download continues (if the last FW is finished loading, it will show Update FW button)

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-11   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-FW-12: While downloading the new FW - Turn off the Internet
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: While downloading the new FW - Turn off the Internet
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Connect device
    ...     - 2. Turn off the Internet
    ...
    ...     Expected Results:
    ...     - 1. The device is connected succesfully.
    ...     - 2. The latest FW download stops (if the last FW is finished loading, it will show Update FW button)

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-12   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-FW-13: While downloading the new FW - Turn off the BT
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: While downloading the new FW - Turn off the BT
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Connect device
    ...     - 2. Turn off the BT
    ...
    ...     Expected Results:
    ...     - 1. The device is connected succesfully.
    ...     - 2. The latest FW download stops and the Paired tag shall be displayed in the Device ID row (if the last FW is finished loading, it will show Update FW button)

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-13   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-FW-14: While downloaded the latest FW loaded - View the Update FW button after create a study with the device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: While downloaded the latest FW loaded - View the Update FW button after create a study with the device
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Create study while downloaded the latest FW loaded
    ...
    ...     Expected Results:
    ...     - 1. The Update FW button shall be hidden
    ...     - Refer to design:
    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-14   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-FW-15: While downloaded the latest FW loaded - View the Update FW button after stop study running with the device
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: While downloaded the latest FW loaded - View the Update FW button after stop study running with the device
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Stop study while loading the latest FW
    ...
    ...     Expected Results:
    ...     - 1.The last FW is finished loading, it will show Update FW button
    ...     - Refer to design: https://www.figma.com/file/k1814MuYjcrAjctJlol61o/Bioflux-Clinic-App----v2?type=design&node-id=10105-148269&mode=design&t=u5oXH58JFard2gzp-4
    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-15   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-FW-16: While downloaded the latest FW loaded - Reload the devicce list
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: While downloaded the latest FW loaded - Reload the devicce list
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Reload the device list
    ...
    ...     Expected Results:
    ...     - 1. The Update FW button is still displayed.

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-16   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-FW-17: While downloaded the latest FW loaded - Reconnect after disconnect the device
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: While downloaded the latest FW loaded - Reconnect after disconnect the device
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Connect device
    ...     - 2. Disconnect that device
    ...     - 3. Re-connect that device
    ...
    ...     Expected Results:
    ...     - 1. The device is connected succesfully.
    ...     - 2. The device is disconnected.
    ...     - 3. The Update FW button is still displayed

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-17   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-FW-18: While downloaded the latest FW loaded - Reconnect the device after kill app and reopen app
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: While downloaded the latest FW loaded - Reconnect the device after kill app and reopen app
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Connect device
    ...     - 2. Kill the app
    ...     - 3. Open the app
    ...
    ...     Expected Results:
    ...     - 1. The device is connected succesfully.
    ...     - 2. The app is closed.
    ...     - 3. The Update FW button is still displayed

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-18   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-FW-19: While downloaded the latest FW loaded - Back to the Home
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: While downloaded the latest FW loaded - Back to the Home
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Connect device
    ...     - 2. Back to the Home
    ...     - 3. Open the app
    ...
    ...     Expected Results:
    ...     - 1. The device is connected succesfully.
    ...     - 2. The user shall be redirected the Home.
    ...     - 3. The Update FW button is still displayed

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-19  manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-FW-20: While downloaded the latest FW loaded - Multiple task
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:  While downloaded the latest FW loaded - Multiple task
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Connect device
    ...     - 2. Multiple task
    ...     - 3. Open the app
    ...
    ...     Expected Results:
    ...     - 1. The device is connected succesfully.
    ...     - 3. The Update FW button is still displayed

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-20   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-FW-21: While downloaded the latest FW loaded - Turn off the Internet
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:  While downloaded the latest FW loaded - Turn off the Internet
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Connect device
    ...     - 2. Turn off the Internet
    ...
    ...     Expected Results:
    ...     - 1. The device is connected succesfully.
    ...     - 2.

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-21   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-FW-22: While downloaded the latest FW loaded - Turn off the BT
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:  While downloaded the latest FW loaded - Turn off the BT
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Connect device
    ...     - 2. Turn off the BT
    ...
    ...     Expected Results:
    ...     - 1. The device is connected succesfully.
    ...     - 2. The latest FW download stops and the Paired tag shall be displayed in the Device ID row (if the last FW is finished loading, it will show Update FW button)

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-22   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-GATEWAY-DEVICE-INFOR-FW-23: The Update FW process - Reload the devicce list
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: The Update FW process - Reload the devicce list
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Click the Update button
    ...     - 1. Reload the device list
    ...
    ...     Expected Results:
    ...     - 1.
    ...         + If the device firmware is updated successfully, after rebooting and connected to the app again, the Update firmware button on that device row shall be hidden.
    ...         + If the device firmware cannot be updated under any circumstances, there shall be a button Retry displayed with an error message: “Failed to update firmware.”. Tapping the Retry button shall:
    ...         + display a modal if the server receives a response from a device that the firmware downloaded cannot be updated.
    ...         + Content: You can update the firmware again when the downloading is completed!
    ...         + Button: OK. Tapping the button shall dismiss the modal. At this time the Downloading firmware process will be started again.
    ...         + Hide the button and the error message as the Updating firmware process will be started again.

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-23   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-FW-24: The Update FW process - Reconnect after disconnect the device
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: The Update FW process - Reconnect after disconnect the device
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Connect device
    ...     - 2. Click the Update button
    ...     - 3. Disconnect that device
    ...     - 4. Re-connect that device
    ...
    ...     Expected Results:
    ...     - 1.
    ...         + If the device firmware is updated successfully, after rebooting and connected to the app again, the Update firmware button on that device row shall be hidden.
    ...         + If the device firmware cannot be updated under any circumstances, there shall be a button Retry displayed with an error message: “Failed to update firmware.”. Tapping the Retry button shall:
    ...         + display a modal if the server receives a response from a device that the firmware downloaded cannot be updated.
    ...         + Content: You can update the firmware again when the downloading is completed!
    ...         + Button: OK. Tapping the button shall dismiss the modal. At this time the Downloading firmware process will be started again.
    ...         + Hide the button and the error message as the Updating firmware process will be started again.

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-24   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-FW-25: The Update FW process - Reconnect the device after kill app and reopen app
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: The Update FW process - Reconnect the device after kill app and reopen app
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Connect device
    ...     - 2. Click the Update button
    ...     - 3. Kill the app
    ...     - 4. Open the app
    ...
    ...     Expected Results:
    ...     - 1.
    ...         + If the device firmware is updated successfully, after rebooting and connected to the app again, the Update firmware button on that device row shall be hidden.
    ...         + If the device firmware cannot be updated under any circumstances, there shall be a button Retry displayed with an error message: “Failed to update firmware.”. Tapping the Retry button shall:
    ...         + display a modal if the server receives a response from a device that the firmware downloaded cannot be updated.
    ...         + Content: You can update the firmware again when the downloading is completed!
    ...         + Button: OK. Tapping the button shall dismiss the modal. At this time the Downloading firmware process will be started again.
    ...         + Hide the button and the error message as the Updating firmware process will be started again.

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-25   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-FW-26: The Update FW process - Back to the Home
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: While downloaded the latest FW loaded - Back to the Home
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Connect device
    ...     - 2. Click the Update FW button
    ...     - 3. Back to the Home
    ...     - 4. Open the app
    ...
    ...     Expected Results:
    ...     - 1.
    ...         + If the device firmware is updated successfully, after rebooting and connected to the app again, the Update firmware button on that device row shall be hidden.
    ...         + If the device firmware cannot be updated under any circumstances, there shall be a button Retry displayed with an error message: “Failed to update firmware.”. Tapping the Retry button shall:
    ...         + display a modal if the server receives a response from a device that the firmware downloaded cannot be updated.
    ...         + Content: You can update the firmware again when the downloading is completed!
    ...         + Button: OK. Tapping the button shall dismiss the modal. At this time the Downloading firmware process will be started again.
    ...         + Hide the button and the error message as the Updating firmware process will be started again.

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-26   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-GATEWAY-DEVICE-INFOR-FW-27: The Update FW process - Multiple task
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:  The Update FW process - Multiple task
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Connect device
    ...     - 2. Click the Update FW button
    ...     - 2. Multiple task
    ...     - 3. Open the app
    ...
    ...     Expected Results:
    ...     - 1.
    ...         + If the device firmware is updated successfully, after rebooting and connected to the app again, the Update firmware button on that device row shall be hidden.
    ...         + If the device firmware cannot be updated under any circumstances, there shall be a button Retry displayed with an error message: “Failed to update firmware.”. Tapping the Retry button shall:
    ...         + display a modal if the server receives a response from a device that the firmware downloaded cannot be updated.
    ...         + Content: You can update the firmware again when the downloading is completed!
    ...         + Button: OK. Tapping the button shall dismiss the modal. At this time the Downloading firmware process will be started again.
    ...         + Hide the button and the error message as the Updating firmware process will be started again.

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-27   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-FW-28: The Update FW process - Turn off and turn on the Internet
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:  The Update FW process - Turn off and turn on the Internet
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Connect device
    ...     - 2. Click the Update FW button
    ...     - 3. Turn off the Internet
    ...     - 4. Turn on the Internet
    ...
    ...     Expected Results:
    ...     - Step1:
    ...         + If the device firmware is updated successfully, after rebooting and connected to the app again, the Update firmware button on that device row shall be hidden.
    ...         + If the device firmware cannot be updated under any circumstances, there shall be a button Retry displayed with an error message: “Failed to update firmware.”. Tapping the Retry button shall:
    ...         + display a modal if the server receives a response from a device that the firmware downloaded cannot be updated.
    ...         + Content: You can update the firmware again when the downloading is completed!
    ...         + Button: OK. Tapping the button shall dismiss the modal. At this time the Downloading firmware process will be started again.
    ...         + Hide the button and the error message as the Updating firmware process will be started again.

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-28   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BFCN-GATEWAY-DEVICE-INFOR-FW-29: The Update FW process - Turn off and turn on the BT
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:  The Update FW process - Turn off and turn on the BT
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Connect device
    ...     - 2. Click the Update FW button
    ...     - 3. Turn off the BT
    ...     - 4. Turn on the BT
    ...
    ...     Expected Results:
    ...     - Step1:
    ...         + If the device firmware is updated successfully, after rebooting and connected to the app again, the Update firmware button on that device row shall be hidden.
    ...         + If the device firmware cannot be updated under any circumstances, there shall be a button Retry displayed with an error message: “Failed to update firmware.”. Tapping the Retry button shall:
    ...         + display a modal if the server receives a response from a device that the firmware downloaded cannot be updated.
    ...         + Content: You can update the firmware again when the downloading is completed!
    ...         + Button: OK. Tapping the button shall dismiss the modal. At this time the Downloading firmware process will be started again.
    ...         + Hide the button and the error message as the Updating firmware process will be started again.

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-29   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCN-GATEWAY-DEVICE-INFOR-FW-30: The Update FW process - Turn off and turn on the device
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:  The Update FW process - Turn off and turn on the device
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Connect device
    ...     - 2. Click the Update FW button
    ...     - 3. Turn off the device
    ...     - 4. Turn on the device
    ...
    ...     Expected Results:
    ...     - Step1:
    ...         + If the device firmware is updated successfully, after rebooting and connected to the app again, the Update firmware button on that device row shall be hidden.
    ...         + If the device firmware cannot be updated under any circumstances, there shall be a button Retry displayed with an error message: “Failed to update firmware.”. Tapping the Retry button shall:
    ...         + display a modal if the server receives a response from a device that the firmware downloaded cannot be updated.
    ...         + Content: You can update the firmware again when the downloading is completed!
    ...         + Button: OK. Tapping the button shall dismiss the modal. At this time the Downloading firmware process will be started again.
    ...         + Hide the button and the error message as the Updating firmware process will be started again.

    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-30   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-FW-31: The Update FW process - Turn off ( > 5 minutes) then turn on the Bluetooth and Internet
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:  The Update FW process - Turn off ( > 5 minutes) then turn on the Bluetooth and Internet
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Connect device
    ...     - 2. Click the Update FW button
    ...     - 3. Turn off ( > 5 minutes) Bluetooth and Internet
    ...     - 4. Turn on the Bluetooth and Internet
    ...     - 5. Click the Retry button
    ...
    ...     Expected Results:
    ...     - Step1:
    ...         + If the device firmware is updated successfully, after rebooting and connected to the app again, the Update firmware button on that device row shall be hidden.
    ...         + If the device firmware cannot be updated under any circumstances, there shall be a button Retry displayed with an error message: “Failed to update firmware.”. Tapping the Retry button shall:
    ...         + display a modal if the server receives a response from a device that the firmware downloaded cannot be updated.
    ...         + Content: You can update the firmware again when the downloading is completed!
    ...         + Button: OK. Tapping the button shall dismiss the modal. At this time the Downloading firmware process will be started again.
    ...         + Hide the button and the error message as the Updating firmware process will be started again.
    ....      - Step5: The device firmware is updated successfully, after rebooting and connected to the app again, the Update firmware button on that device row shall be hidden.
    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-31   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCN-GATEWAY-DEVICE-INFOR-FW-32: The Update FW process - Enter command in the Monitor tool after cloned FW (SM+INVOFFCHIP)
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description:  The Update FW process - Turn off ( > 5 minutes) then turn on the Bluetooth and Internet
    ...
    ...     Precondition: The user is on the Device Information screen
    ...
    ...
    ...     Test steps:
    ...     - 1. Connect device
    ...     - 2. Click the Update FW button
    ...     - 3. Turn off ( > 5 minutes) Bluetooth and Internet
    ...     - 4. Turn on the Bluetooth and Internet
    ...     - 5. Click the Retry button
    ...
    ...     Expected Results:
    ...     - Step1:
    ...         + If the device firmware is updated successfully, after rebooting and connected to the app again, the Update firmware button on that device row shall be hidden.
    ...         + If the device firmware cannot be updated under any circumstances, there shall be a button Retry displayed with an error message: “Failed to update firmware.”. Tapping the Retry button shall:
    ...         + display a modal if the server receives a response from a device that the firmware downloaded cannot be updated.
    ...         + Content: You can update the firmware again when the downloading is completed!
    ...         + Button: OK. Tapping the button shall dismiss the modal. At this time the Downloading firmware process will be started again.
    ...         + Hide the button and the error message as the Updating firmware process will be started again.
    ....      - Step5: Execute download latest FW agian
    [Tags]  BFCN-GATEWAY-DEVICE-INFOR-FW-32  manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}




