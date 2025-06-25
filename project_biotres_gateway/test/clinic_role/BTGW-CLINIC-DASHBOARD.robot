*** Settings ***
Documentation   Clinic-Dashboard Test Suite
Metadata    sid     BTGW-CLINIC-DASHBOARD
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Metadata    version     1.3.1
Metadata    browser     ${BROWSER.capitalize()}

Force Tags      BTGW-CLINIC-DASHBOARD    mapp
Test Timeout    30m
*** Test Cases ***
BTGW-CLINIC-DASHBOARD-VIEW-01: View a list of all Biotres devices assigned to the user's facility
	[Documentation]     Author: Phuong Tran
	...
    ...     Description: The Clinic user can view a list of all Biotres devices assigned to the user's facility
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...
    ...     Test steps:
    ...     - 1. Observe the screen
    ...
    ...     Expected Results:
    ...     - The Biotres device of the facilities specified for that account shall be displayed.
    ...     - Refer to design (https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=213%3A1983)
    ...
    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-02: View Dashboard screen when have no device assigned to the user's facility
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: The Clinic user can view a list of all Biotres devices assigned to the user's facility
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...
    ...     Test steps:
    ...     - 1. Observe the screen
    ...
    ...     Expected Results:
    ...     - Display the empty screen with the "No devices to display" text
	... 	- Refer to design (https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=1769%3A10092)

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-02   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-03: View Dashboard screen when the account is deactivated
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View the Dashboard when the app login account has been deactived.
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...     Test steps:
    ...     - 1. Admin Portal: Deactive account that is signing in the app.
    ...     - 2. Observe the screen
    ...
    ...     Expected Results:
	... 	- There shall be a modal displayed: “Your account was deactivated. Please contact the Biotricity Support team via the following email cs@biotricity.com for further information. Thank you!” with OK button. Clicking OK button shall log the user out from the app
	... 	- Refer to design (https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2012%3A10656)

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-03   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-CLINIC-DASHBOARD-VIEW-04: View Dashboard screen when the account is deactivated then account acctive and login back
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View the Dashboard when the app login account has been deactived then account acctive and login back
    ...
    ...     Precondition:
    ...     - The user is on the Welcome screen
    ...
    ...     Test steps:
    ...     - 1. Select Clinic option >>  Enter the clinic account >> Click the Sign in button
    ...     - 2. Admin Portal: Deactive account that is signing in the app.
    ...     - 3. Click the Ok button in the Deactive modal.
    ...     - 4. Select Clinic option >>  Enter the clinic account >> Click the Sign in button
    ...     - 5. Observe the screen
    ...
    ...     Expected Results:
	... 	- Step1: Sign in the app successfully and the user shall be navigated the Dashboard screen
	...     - Step2: There shall be a modal displayed: “Your account was deactivated. Please contact the Biotricity Support team via the following email cs@biotricity.com for further information. Thank you!” with OK button.
	...     - Step3: The user log out the app and is on the Welcome screen.
	... 	- Step4: Sign in the app successfully and the user shall be navigated the Dashboard screen

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-04   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-05: Deny location permission when Install app for the first time
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user deny location permissoion in case of Install app for the first time
    ...
    ...     Precondition:
    ...     - The user is on Welcome screen
    ...
	...		Test Steps:
	...		- 1. Intall app
	...     - 2. Open the app >> Select Clinic user
	...     - 3. Enter the Clinic account
	...		- 4. Deny location permission
    ...     - 5. Observe the screen
    ...
    ...     Expected Results:
    ...     - Android: The user shall be naigated to the Dashboard screen with the Allow Location access to continue text, the Request permission button
    ...     - Refer to design: https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=1766%3A10049&t=pq1tEkltsm0MkImK-4

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-05   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-06: Filter by a specific facility and verify the filtered result
	[Documentation]     Author: Phuong Tran
	...
    ...     Description: Verify the filtered result when the user filter by a specific facility in the Facility dropdown-list
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...
	...		Test Steps:
	...		- 1. Filter by a specific facility
	...		- 2. Observe the filtered result
    ...
    ...     Expected Results:
	... 	- Step1: The filtered facility shall be displayed in the Facility dropdown list
	... 	- Step2: The device list of that facility shall be displayed.

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-06   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-07: View a specific device card - Device ID
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View the Device ID of a specific device card
    ...
    ...     Precondition:
    ...     - The use is on the Dashboard screen
    ...
    ...     Test Steps:
    ...     - 1. Observe the Device ID of the specific device card
    ...
    ...     Expectec Results:
    ...     - The Device ID of that device card shall be displayed.

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-07   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-08: View a specific device card - Facility
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View the Facility of a specific device card
    ...
    ...     Precondition:
    ...     - The use is on the Dashboard screen
    ...
    ...     Test Steps:
    ...     - 1. Observe the Facility of the specific device card
    ...
    ...     Expected Results:
    ...     - The Facility name of that device card shall be displayed below the Device ID if the account

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-08   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-09: View a specific device card - Transmit and receive
	[Documentation]     Author: Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...     Test Steps:
    ...     - 1. Observe the Transmit and receive of the specific device card
    ...     Expected Results:
    ...     -   The transmit and receive of the specific device card shall be displayed: Rx and Tx

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-09   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-10: View a specific device card - View Study status when device is connected to the app and study status is Ready for new study
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View Study status when device is connected to the app and study status is Ready for new study of a specific device card
	...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...
    ...     Test Steps:
    ...     - 1. Connect with any device is not running study
    ...     - 2. Observe the screen
    ...
    ...     Expected Result:
    ...     - The connected device shall be displayed with "Ready for new study" status

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-10   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-11: View a specific device card - View Study status when device is connected to the app and study status is Setting up
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Study status when device is connected to the app and study status is Setting up of a specific device card
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...     - Create a study with any device
    ...
    ...     Test Steps:
    ...     - 1. Connect with that device
    ...     - 2. Observe the screen
    ...
    ...     Expected Result:
    ...     - The connected device shall be displayed with "Setting-up" status.

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-11   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-12: View a specific device card - View Study status when device is connected to the app and study status is In process
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Study status when device is connected to the app and study status is In process of a specific device card
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...     - Create a study with any device and that study is started.
    ...
    ...     Test Steps:
    ...     - 1. Connect with that device
    ...     - 2. Observe the screen
    ...
    ...     Expected Result:
    ...     - The connected device shall be displayed with "Study is in progress: 23h-59m left" status.

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-12   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-13: View a specific device card - View Study status when device is connected to the app and study status is Completed
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Study status when device is connected to the app and study status is Completed of a specific device card
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...     - Create a study with any device and that study has been started
    ...
    ...     Test Steps:
    ...     - 1. Connect with that device
    ...     - 2. Clinic Portal/ View details study on the App:  Stop that study
    ...     - 3. Observe the screen
    ...
    ...     Expected Result:
    ...     - That device shall be displayed with "Completed" status.

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-13   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-14: View a specific device card - View Study status when device is connected to the app and study status is Uploading/Uploaded
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Study status when device is connected to the app and study status is Uploading/Uploaded of a specific device card
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...     - Create a study with any device and that study has been started
    ...
    ...     Test Steps:
    ...     - 1. Connect with that device
    ...     - 2. Clinic Portal/ View details study on the App: Stop that study and wait for that Study Uploading/Uploaded data
    ...     - 3. Observe the screen
    ...
    ...     Expected Result:
    ...     - That device shall be displayed with " Uploading/Uploaded" status.

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-14   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-15: View a specific device card - Turn off Bluetooth and view BT connection status
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Bluettooth connection status of a specific device card when turn off Bluetooth
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
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
	...		-		ii. Android: “Bluetooth is disabled!” with Enable button. When clicked, Bluetooth on the phone will be enabled.
	...		-	b. All connected devices in the list will be disconnected, Paired status is displayed in each previously connected device row
	...		-	c. clearances of all other device information to “--”, except Device ID.
	...     - Refer to design: Android(https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=1766%3A9676&t=BOGuN4hFM60oVQqa-4); iOS(https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=574%3A6602&t=BOGuN4hFM60oVQqa-4)

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-15   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-16: View a specific device card - Turn on Bluetooth and view BT connection status
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Bluettooth connection status of a specific device card when turn on Bluetooth
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn on Bluetooth
    ...
	...		Expected Result:
	... 	- The Bluetooth connection status icon will be filled with green color

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-16   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-17: View a specific device card - Turn off Internet connection and view Server connection status
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Server connection status of a specific device card when turn off Internet connection
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn off Internet
    ...
	...		Expected Result:
	... 	- The Bluetooth connection status icon will be filled with gray color
	... 	- There shall be a banner displayed: Internet connection is lost!
	...     - Refer to design: https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=574%3A6661&t=BOGuN4hFM60oVQqa-4

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-17   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-18: View a specific device card - Turn on Internet connection and view Server connection status
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Server connection status of a specific device card when turn on Internet connection
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn on Internet
    ...
    ...     Expected Result:
    ...     - The Bluetooth connection status icon will be filled with green color

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-18   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-19: View a specific device card - Not charged battery and view Battery level
	[Documentation]     Author: Phuong Tran
    ...
    ...     Description: View Battery level of a specific device card when it is not charged
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Observe the Battery level
    ...
    ...     Expected Result:
    ...     - The device's battery level will be displayed

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-19   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-20: View a specific device card - Charged battery and view Battery level
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View Battery level of a specific device card when it is charged
	...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Charg that device
    ...     - 3. Observe the Battery level
    ...
    ...     Expected Result:
    ...     - The device's battery level will be displayed
    ...     - Refer to design: https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=1300%3A8777&t=BOGuN4hFM60oVQqa-4

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-20   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-21: View a specific device card - View Disconnect button when device is connected to the app
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View Disconnect button of a specific device card when device is connected to the app
	...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Observe the Disconnect button
    ...
    ...     Expected Result:
    ...     - There shall be a Disconnect button displayed on the connected Biotres device row.

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-21   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-22: View a specific device card - View Paired tag when device is being connected to the app but then loses its connection with the app (by turning off the device)
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View Paired tag of a specific device card when device is being connected to the app but then loses its connection with the app
	...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn off the device
    ...     - 3. Observe the Paired tag
    ...
    ...     Expected Result:
    ...     - There shall be a Paired tag displayed on the connected Biotres device row.

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-22   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-23: View the Study details button when study has Draft status
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View the Study details button when study has Draft status
	...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...     - The device running in a Study that has a draft status
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. View the Study details button
    ...
    ...     Expected Result:
    ...     - The Study details button shall not be displayed

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-23   manual      1.3.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-24: View the Study details button when study has Starting status
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View the Study details button when study has Starting status
	...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...     - The device running in a Study that has a Starting status
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. View the Study details button
    ...
    ...     Expected Result:
    ...     - The Study details button shall not be displayed

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-24   manual      1.3.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-CLINIC-DASHBOARD-VIEW-25: View the Study details button when study has Completed status
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View the Study details button when study has Completed status
	...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...     - The device running in a Study that has a Completed status
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. View the Study details button
    ...
    ...     Expected Result:
    ...     - The Study details button shall not be displayed

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-25  manual      1.3.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-26: View the Study details button when study has Uploading/Uploaded status
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View the Study details button when study has Uploading/ Uploaded status
	...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...     - The device running in a Study that has a Uploading/ Uploaded status
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. View the Study details button
    ...
    ...     Expected Result:
    ...     - The Study details button shall not be displayed

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-26  manual      1.3.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-27: View the Study details button when study has Paused status
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View the Study details button when study has Paused status
	...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...     - The device running in a Study that has a Paused status
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. View the Study details button
    ...
    ...     Expected Result:
    ...     - The Study details button shall not be displayed

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-27  manual      1.3.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-28: View the Study details button when study has Ongoing status in the Dashboard screen
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View the Study details button when study has Paused status
	...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...     - The device running in a Study that has a Paused status
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. View the Study details button in the Dashboard screen
    ...
    ...     Expected Result:
    ...     - There shall be a View Study Details button displayed next to the device ID

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-28  manual      1.3.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-29: View the Study details button when study has Ongoing status in the Search screen
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View the Study details button when study has Paused status
	...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...     - The device running in a Study that has a Paused status
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. View the Study details button in the Search screen
    ...
    ...     Expected Result:
    ...     - There shall be a View Study Details button displayed next to the device ID

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-29  manual      1.3.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-30: View the Study details when turn on Internet
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View the Study details when turn on Internet
	...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...     - The device running in a Study that has a Ongoing status
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Tunr on Internet
    ...     - 3. Clicks the View Study Details button
    ...     - 4. Observe
    ...
    ...     Expected Result:
    ...     - Step4: The user shall be naviagted to the Study Details page of that device

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-30  manual      1.3.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-VIEW-31: View the Study details when turn off Internet
	[Documentation]     Author: Phuong Tran
	...
	...     Description: View the Study details when turn on Internet
	...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...     - The device running in a Study that has a Ongoing status
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Tunr off Internet
    ...     - 3. Clicks the View Study Details button
    ...     - 4. Observe
    ...
    ...     Expected Result:
    ...     - Step4: Display the default page that failed to load

    [Tags]  BTGW-CLINIC-DASHBOARD-VIEW-31  manual      1.3.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



#BTGW-CLINIC-DASHBOARD-FILTER-01:

BTGW-CLINIC-DASHBOARD-CONNECT-01: Connect device when having no facility filtered - Verify connection status (having Disconnect button)
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Verify connection status in case Connect device when having no facility filtered
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Verify connection status
    ...     Expected Results:
    ...     - The device shall be connected successfully and having Disconnect button
    ...
    [Tags]  BTGW-CLINIC-DASHBOARD-CONNECT-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-CONNECT-02: Connect device when having no facility filtered - View sort order of the list
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: View sort order of the list in case Connect device when having no facility filtered
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. View sort order of the list
    ...
    ...     Expected Results:
    ...     - The device shall be connected successfully and having Disconnect button
    ...     - The device's location will be brought to the top of the device list.

    [Tags]  BTGW-CLINIC-DASHBOARD-CONNECT-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-CONNECT-03: Connect device when having a specific facility filtered - Verify connection status (having Disconnect button)
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Verify connection status in case Connect device when having a specific facility filtered
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Filter any specific facility
    ...     - 2. Connect any device
    ...     - 3. Verify connection status
    ...
    ...     Expected Results:
    ...     - The specific facility shall be displayed in the Facility dropdown-list.
    ...     - The device shall be connected successfully and having Disconnect button

    [Tags]  BTGW-CLINIC-DASHBOARD-CONNECT-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-CONNECT-04: Connect device when having a specific facility filtered - View sort order of the list
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: View sort order of the list in case Connect device when having a specific facility filtered
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Filter any specific facility
    ...     - 2. Connect any device
    ...     - 3. View sort order of the list
    ...
    ...     Expected Results:
    ...     - The specific facility shall be displayed in the Facility dropdown-list.
    ...     - The device shall be connected successfully and the device's location will be brought to the top of the device list.

    [Tags]  BTGW-CLINIC-DASHBOARD-CONNECT-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-CLINIC-DASHBOARD-CONNECT-05: Connect device then turn off the device when having no facility filtered - Verify connection status (having Paired tag)
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: View sort order of the list in case Connect device when having a specific facility filtered
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn off the device
    ...     - 3. Verify connection status
    ...
    ...     Expected Results:
    ...     - The device shall be connected successfully
    ...     - The Paired status is displayed in each previously connected device row and the app shall be reconnected when the device turn on
    ...
    [Tags]  BTGW-CLINIC-DASHBOARD-CONNECT-05    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-CONNECT-06: Connect device then turn off the device when having no facility filtered - View sort order of the list
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: View sort order of the list in case Connect device then turn off the device when having no facility filtered
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Turn off that device
    ...     - 3. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The device shall be connected successfully and the device's location will be brought to the top of the device list.
    ...     - Step3: The Paired status is displayed in each previously connected device row and the app shall be reconnected when the device turn on
    [Tags]  BTGW-CLINIC-DASHBOARD-CONNECT-06   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BTGW-CLINIC-DASHBOARD-CONNECT-07: Connect device when having a specific facility filtered - View sort order of the list
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Verify connection status in case Connect device when having a specific facility filtered
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Filter any specific facility
    ...     - 2. Connect any device
    ...     - 3. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility shall be displayed in the Facility dropdown-list
    ...     - Step2: The device shall be connected successfully.
    ...     - Step3: The Paired status is displayed in each previously connected device row and the app shall be reconnected when the device turn on

    [Tags]  BTGW-CLINIC-DASHBOARD-CONNECT-07       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-CONNECT-08: Connect device when having a specific facility filtered - Verify connection status (having Paired tag)
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Verify connection status in case Connect device when having a specific facility filtered
    ...
    ...     Precondition:
    ...     -  The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Filter any specific facility
    ...     - 2. Connect any device
    ...     - 3. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility shall be displayed in the Facility dropdown-list
    ...     - Step2: The device shall be connected successfully and the device's location will be brought to the top of the device list.
    ...     - Step3: The Paired status is displayed in each previously connected device row and reconnect when the device turn on

    [Tags]  BTGW-CLINIC-DASHBOARD-CONNECT-08   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-CONNECT-09: Connect multiple device then disconnect one of them or all devices - Verify connection status
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Verify connection status in case Connect multiple device then disconnect one of them or all devices
    ...
    ...     Precondition:
    ...     -  The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Connect multiple device
    ...     - 2. Disconnect one of them or all devices
    ...     - 3. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The connected device shall be connected successfully and the device's location will be brought to the top of the device list.
    ...     - Step2: The disconnected device shall be disconnected from the app and the app shall not try to reconnect that device after that


    [Tags]  BTGW-CLINIC-DASHBOARD-CONNECT-09   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-CONNECT-10: Connect multiple device then disconnect one of them or all devices - View sort order of the list
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: View sort order of the list in case Connect device when having a specific facility filtered
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect multiple device
    ...     - 2. Disconnect one of them or all devices
    ...     - 2. View sort order of the list
    ...
    ...     Expected Results:
     ...     - Step1: The connected device shall be connected successfully and the device's location will be brought to the top of the device list.
    ...      - Step2: The disconnected device shall be disconnected from the app and the app shall not try to reconnect that device after that

    [Tags]  BTGW-CLINIC-DASHBOARD-CONNECT-10   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-CLINIC-DASHBOARD-CONNECT-11: Connect multiple device then Turn off one of them or all devices - Verify connection status
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Verify connection status in case Connect multiple device then disconnect one of them or all devices
    ...
    ...     Precondition:
    ...     -  The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Connect multiple device
    ...     - 2. Turn off one of them or all devices
    ...     - 3. Verify connection status
    ...
    ...     Expected Results:
    ...     - Step1: The connected device shall be connected successfully and the device's location will be brought to the top of the device list.
    ...     - Step2: The Paired status is displayed in each previously connected device row and the app shall be reconnected when the device turn on


    [Tags]  BTGW-CLINIC-DASHBOARD-CONNECT-11   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-CONNECT-12: Connect multiple device then Turn off one of them or all devices - View sort order of the list
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: View sort order of the list in case Connect device when having a specific facility filtered
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...
    ...     Test Steps:
    ...     - 1. Connect multiple device
    ...     - 2. Turn off one of them or all devices
    ...     - 3. View sort order of the list
    ...
    ...     Expected Results:
     ...     - Step1: The connected device shall be connected successfully and the device's location will be brought to the top of the device list.
    ...      - Step2: The Paired status is displayed in each previously connected device row and the device's location will be brought to the top of the device list.

    [Tags]  BTGW-CLINIC-DASHBOARD-CONNECT-12   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-CONNECT-13: Tunr on device and wait for device auto-reconnect, reload the screen after connect device on the Dashboard screen and turn off device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Tunr on device and wait for device auto-reconnect after connect device on the Dashboard screen and turn off device
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Connect devicde
    ...     - 2. Turn off that device
    ...     - 3. Turn on that device
    ...     - 4. Wait for that device auto-connect to the app
    ...     - 5. Reload the screen
    ...
    ...     Expected Results:
    ...     - Step1: The connected device shall be connected successfully
    ...     - Step2: The Paired status is displayed in each previously connected device row
    ...     - Step5: The connected device shall be connected successfully again.

    [Tags]  BTGW-CLINIC-DASHBOARD-CONNECT-13     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-CONNECT-14: Tunr on device and wait for device auto-reconnect, reload the screen after connect device on the Dashboard screen and turn off device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Tunr on device and wait for device auto-reconnect, reload the screen after connect device on the Dashboard screen and turn off device
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Connect devicde
    ...     - 2. Turn off that device
    ...     - 3. Turn on that device
    ...     - 4. Tap on device card to connect to the app while the process is auto-connecting
    ...     - 5. Reload the screen
    ...
    ...     Expected Results:
    ...     - Step1: The connected device shall be connected successfully
    ...     - Step2: The Paired status is displayed in each previously connected device row
    ...     - Step4: The connection pop-up shall be displayed.
    ...     - Step5: The connected device shall be connected successfully again.

    [Tags]  BTGW-CLINIC-DASHBOARD-CONNECT-14    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-CONNECT-15: Tunr on BT and wait for device auto-reconnect multiple device after connect multiple device on the Dashboard screen and turn off BT
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Tunr on device and wait for device auto-reconnect after connect device on the Dashboard screen and turn off device
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Connect multiple devicde
    ...     - 2. Turn off BT
    ...     - 3. Turn on BT
    ...     - 4.  Wait for all devices are auto-reconnected to the app

    ...
    ...     Expected Results:
    ...     - Step1: The connected multiple device shall be connected successfully
    ...     - Step2: The Paired status is displayed in each previously connected mutiple device row
    ...     - Step4: The connected multiple device shall be connected successfully again.

    [Tags]  BTGW-CLINIC-DASHBOARD-CONNECT-15     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-CONNECT-16: Turn off BT during connecting device.
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description:  Turn off BT during connecting device.
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Connecting device
    ...     - 2. Turn off BT
    ...     - 3. Observe the screen
    ...
    ...     Expected Results:
    ...     - Step3: The "Failed, please try again" modal shall be displayed.

    [Tags]  BTGW-CLINIC-DASHBOARD-CONNECT-16     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BTGW-CLINIC-DASHBOARD-DISCONNECT-01: Disconnect device when having no facility filtered - Verify connection status
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Verify connection status in case Disconnect device when having no facility filtered
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Clicks the Disconnect button
    ...
    ...     Expected Results:
    ...     - Step2: The device shall be disconnected from the app and the app shall not try to reconnect that device after that

    [Tags]  BTGW-CLINIC-DASHBOARD-DISCONNECT-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-DISCONNECT-02: Disconnect device when having no facility filtered - View sort order of the list
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: View sort order of the list in case Disconnect device when having no facility filtered
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Connect any device
    ...     - 2. Clicks the Disconnect button
    ...
    ...     Expected Results:
    ...     - Step2: The Device list shall be displayed as default initially

    [Tags]  BTGW-CLINIC-DASHBOARD-DISCONNECT-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-DISCONNECT-03: Disconnect device when having a specific facility filtered - Verify connection status
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: View sort order of the list in case Disconnect device when having no facility filtered
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...     Test Steps:
    ...     - 1. Filter any specific facility
    ...     - 2. Connect any device
    ...     - 3. Clicks the Disconnect button
    ...     Expected Results:
    ...     - Step1: The specific facility shall be displayed in the Facility dropdown-list
    ...     - Step2: The device shall be disconnected from the app and the app shall not try to reconnect that device after that
    [Tags]  BTGW-CLINIC-DASHBOARD-DISCONNECT-03     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-DISCONNECT-04: Disconnect device when having a specific facility filtered - View sort order of the list
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: View sort order of the list in case Disconnect device when having a specific facility filtered
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Filter any specific facility
    ...     - 2. Connect any device
    ...     - 3. Clicks the Disconnect button
    ...
    ...     Expected Results:
    ...     - Step1: The specific facility shall be displayed in the Facility dropdown-list
    ...     - Step2: The Device list shall be displayed as default initially

    [Tags]  BTGW-CLINIC-DASHBOARD-DISCONNECT-04     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-SEARCH-01:Search by entering a device ID that belongs to user's Facility (contains or not contains space characters)
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can search by entering a device Id that belongs to user's Facility
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
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

    [Tags]  BTGW-CLINIC-DASHBOARD-SEARCH-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-SEARCH-02: Search by entering a device ID that not belongs to user's Facility
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can search by entering a device Id that belongs to user's Facility
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Search button
    ...     - 2. Enter Device ID that not belongs to user's Facility.
    ...     - 3. Observe the screen
    ...
    ...     Expected Results:
    ...     - Step2: The screen shall be displayed the "No devies found" text.


    [Tags]  BTGW-CLINIC-DASHBOARD-SEARCH-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-SEARCH-03: Search by entering a device ID that not belongs to user's Facility
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can search by entering a device Id that belongs to user's Facility
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Search button
    ...     - 2. Enter Device ID that not belongs to user's Facility.
    ...     - 3. Observe the screen
    ...
    ...     Expected Results:
    ...     - Step2: The screen shall be displayed the "No devies found" text.


    [Tags]  BTGW-CLINIC-DASHBOARD-SEARCH-03     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-SEARCH-04: Deny carema access before scanning
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can search by entering a device Id that belongs to user's Facility
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Search button
    ...     - 2. Clicks the Scan button
    ...     - 3. Clicks the Don't allow button
    ...     - 4. Observe the screen
    ...
    ...     Expected Results:
    ...     - Step1: The user shall be navigated to the Search screen
    ...     - Step2: The user shall be navigated to the Scan matrix code screen
    ...     - Step3a: For iOS, it will display the screen instructing the user on how to turn on the Camera access
    ...     - Step3b: For Android OS, the user will be navigated to the Scan matrix code screen with a message “Allow Camera access to continue” and Request permission button displayed. The button when clicked will navigate the user to the app info.
    ...     - Refer to design: https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=1766%3A10049&t=FxoP84dnWh2wvqZX-4

    [Tags]  BTGW-CLINIC-DASHBOARD-SEARCH-04     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-SEARCH-05: Search by scanning matrix code of a device ID that belongs to user's facility
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can search by scanning matrix code of a device ID that belongs to user's facility
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
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

    [Tags]  BTGW-CLINIC-DASHBOARD-SEARCH-05     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-SEARCH-06: Search by scanning matrix code of a device ID that not belongs to user's facility
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cann't search by scanning matrix code of a device ID that not belongs to user's facility
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
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

    [Tags]  BTGW-CLINIC-DASHBOARD-SEARCH-06     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-SEARCH-07: On the search result, connect device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can connect device on the search result
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Search button
    ...     - 2. Enter or Scan any valid device ID
    ...     - 3. Tap that device row
    ...     - 4. Clicks the Yes button
    ...
    ...     Expected Results:
    ...     - Step1: The user shall be navigated to the Search screen
    ...     - Step2: The device ID is displayed in the search result (searching by typing the device ID or scanning for its ID)
    ...     - Step3: There shall be a confirmation diaglog displayed with content: Connect device <device ID>? and Buttons: Yes and No buttons
    ...     - Step4: The app is successfully connected to the device

    [Tags]  BTGW-CLINIC-DASHBOARD-SEARCH-07     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-SEARCH-08: On the search result, disconnect device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can disconnect device on the search result
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Search button
    ...     - 2. Enter or Scan any valid device ID
    ...     - 3. Tap that device row
    ...     - 4. Clicks the Yes button
    ...     - 5. Clicks the Disconnect button
    ...     - 6. Observe the screen
    ...
    ...     Expected Results:
    ...     - Step1: The user shall be navigated to the Search screen
    ...     - Step2: The device ID is displayed in the search result (searching by typing the device ID or scanning for its ID)
    ...     - Step3: There shall be a confirmation diaglog displayed with content: Connect device <device ID>? and Buttons: Yes and No buttons
    ...     - Step4: The app is successfully connected to the device
    ...     - Step5: The device shall be disconnected from the app and the app shall not try to reconnect that device after that.

    [Tags]  BTGW-CLINIC-DASHBOARD-SEARCH-08     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-SEARCH-09: On the search result, connect device then turn off device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Turn off device after connect device on the search result
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Search button
    ...     - 2. Enter or Scan any valid device ID
    ...     - 3. Tap that device row
    ...     - 4. Clicks the Yes button
    ...     - 5. Turn off device
    ...     - 6. Observe the screen
    ...
    ...     Expected Results:
    ...     - Step1: The user shall be navigated to the Search screen
    ...     - Step2: The device ID is displayed in the search result (searching by typing the device ID or scanning for its ID)
    ...     - Step3: There shall be a confirmation diaglog displayed with content: Connect device <device ID>? and Buttons: Yes and No buttons
    ...     - Step4: The app is successfully connected to the device
    ...     - Step5: There shall be a status displayed on that device row: “Paired”

    [Tags]  BTGW-CLINIC-DASHBOARD-SEARCH-09      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-SEARCH-10: Tunr on device and wait for device auto-reconnect after connect device on the search screen and turn off device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Turn off device after connect device on the search result
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Search button
    ...     - 2. Enter or Scan any valid device ID
    ...     - 3. Tap that device row
    ...     - 4. Clicks the Yes button
    ...     - 5. Turn off device
    ...     - 6. Turn on device
    ...     - 7. Observe the screen
    ...
    ...     Expected Results:
    ...     - Step1: The user shall be navigated to the Search screen
    ...     - Step2: The device ID is displayed in the search result (searching by typing the device ID or scanning for its ID)
    ...     - Step3: There shall be a confirmation diaglog displayed with content: Connect device <device ID>? and Buttons: Yes and No buttons
    ...     - Step4: The app is successfully connected to the device
    ...     - Step5: There shall be a status displayed on that device row: “Paired”
    ...     - Step6: That Device shall be auto-reconnected with the app.

    [Tags]  BTGW-CLINIC-DASHBOARD-SEARCH-10     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-SEARCH-11: Tunr on device and tap on device card to connect to the app while the process is auto-connecting after connect device on the search screen and turn off device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Turn off device after connect device on the search result
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Search button
    ...     - 2. Enter or Scan any valid device ID
    ...     - 3. Tap that device row
    ...     - 4. Clicks the Yes button
    ...     - 5. Turn off device
    ...     - 6. Turn on device
    ...     - 7. Tap on device card to connect to the app while the process is auto-connecting
    ...     - 8. Observe the screen
    ...
    ...     Expected Results:
    ...     - Step1: The user shall be navigated to the Search screen
    ...     - Step2: The device ID is displayed in the search result (searching by typing the device ID or scanning for its ID)
    ...     - Step3: There shall be a confirmation diaglog displayed with content: Connect device <device ID>? and Buttons: Yes and No buttons
    ...     - Step4: The app is successfully connected to the device
    ...     - Step5: There shall be a status displayed on that device row: “Paired”
    ...     - Step6: That Device shall be auto-reconnected with the app.
    ...     - Step7: There shall be a confirmation diaglog displayed with content: Connect device <device ID>? and Buttons: Yes and No buttons

    [Tags]  BTGW-CLINIC-DASHBOARD-SEARCH-11     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-SEARCH-12: On the search result,turn off BT
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Turn off Bluetooth after connect device on the search result
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Search button
    ...     - 2. Turn off Bluetooth
    ...     - 3. Observe the screen
    ...
    ...     Expected Results:
    ...     - Step1: The user shall be navigated to the Search screen
    ...     - Step2: There shall be an error message displayed: iOS: “Bluetooth is disabled. Please enable it!” / Android: “Bluetooth is disabled!” with Enable button. When clicked, Bluetooth on the phone will be enabled.

    [Tags]  BTGW-CLINIC-DASHBOARD-SEARCH-12     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-SEARCH-13: On the search result,turn off BT then turn on BT
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Turn off Bluetooth after connect device on the search result
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Search button
    ...     - 2. Turn off Bluetooth
    ...     - 3. Clicks the OK button
    ...     - 4. Observe the screen
    ...
    ...     Expected Results:
    ...     - Step1: The user shall be navigated to the Search screen
    ...     - Step2: There shall be an error message displayed: iOS: “Bluetooth is disabled. Please enable it!” / Android: “Bluetooth is disabled!” with Enable button. When clicked, Bluetooth on the phone will be enabled.
    ...     - Step3: Bluetooth on the phone shall be enabled.

    [Tags]  BTGW-CLINIC-DASHBOARD-SEARCH-13     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#
#BTGW-CLINIC-DASHBOARD-RUN-BACKGROUND-01:
BTGW-CLINIC-DASHBOARD-RUN-BACKGROUND-01: Kill app then re-open app during connecting device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Kill app then re-open app during connecting device
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Connecting device
    ...     - 2. Kill app
    ...     - 3. Re-open app
    ...     - 4. Observe the screen
    ...
    ...     Expected Results:
    ...     - Step3: The "Failed, please try again" modal shall be displayed.

    [Tags]  BTGW-CLINIC-DASHBOARD-RUN-BACKGROUND-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-RUN-BACKGROUND-02: View device status then connect device then kill app
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: View device status then connect device then kill app
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Connecting device
    ...     - 2. Kill app
    ...     - 3. Re-open app
    ...     - 4. Observe the screen
    ...
    ...     Expected Results:
    ...     - Step3: The "Failed, please try again" modal shall be displayed.

    [Tags]  BTGW-CLINIC-DASHBOARD-RUN-BACKGROUND-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-RUN-BACKGROUND-03: View device status when connect device then kill app
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: View device status then connect device then kill app
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Connect device
    ...     - 2. Kill app
    ...     - 3. Re-open app
    ...     - 4. View device status
    ...
    ...     Expected Results:
    ...     - Step4: iOS - The Paired status is displayed in each previously connected device row
    ...              Android - The app shall still run in background
    [Tags]  BTGW-CLINIC-DASHBOARD-RUN-BACKGROUND-03     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-RUN-BACKGROUND-04: Check device connection status when connect device then Go to homescreen
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: View device status then connect device then kill app
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Connect device
    ...     - 2. Go to homescreen
    ...     - 3. Re-open app
    ...     - 4. View device connection status
    ...
    ...     Expected Results:
    ...     - Step4: The app shall still run in background and device connection status is still displayed the same as before
    [Tags]  BTGW-CLINIC-DASHBOARD-RUN-BACKGROUND-04     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-RUN-BACKGROUND-05: Check device connection status when connect device then Turn off the screen
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: View device status then connect device then kill app
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard.
    ...
    ...     Test Steps:
    ...     - 1. Connect device
    ...     - 2. Turn off the screen
    ...     - 3. Re-open app
    ...     - 4. View device connection status
    ...
    ...     Expected Results:
    ...     - Step4: The app shall still run in background and device connection status is still displayed the same as before
    [Tags]  BTGW-CLINIC-DASHBOARD-RUN-BACKGROUND-05     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-CLINIC-DASHBOARD-CREATE-STUDY-01: Create Holter study with Biotres device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can create Holter Study with Biotres device
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...
    ...     Test Steps:
    ...     - 1. Connect the device
    ...     - 2. In the Navigation bar: Clicks the Create new study button
    ...     - 3. Filling in all study’s required information in the New Study screen
    ...     - 4.  Clicks the Done button on the Verify ECG signal screen
    ...     Expected Results:
    ...     - Step4: Close the Clinic portal web view and the user shall be navigated to the Dashboard screen with corresponding pop-up displayed Study created successfully pop-up
    [Tags]  BTGW-CLINIC-DASHBOARD-CREATE-STUDY-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-CREATE-STUDY-02: Create Extended Holter study with Biotres device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can create Extended Holter Study with Biotres device
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...
    ...     Test Steps:
    ...     - 1. Connect the device
    ...     - 2. In the Navigation bar: Clicks the Create new study button
    ...     - 3. Filling in all study’s required information in the New Study screen
    ...     - 4.  Clicks the Done button on the Verify ECG signal screen
    ...     Expected Results:
    ...     - Step4: Close the Clinic portal web view and the user shall be navigated to the Dashboard screen with corresponding pop-up displayed Study created successfully pop-up
    [Tags]  BTGW-CLINIC-DASHBOARD-CREATE-STUDY-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-CREATE-STUDY-03: Create Holter study with BiotresRT device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can create Holter Study with BiotresRT device
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...
    ...     Test Steps:
    ...     - 1. Connect the device
    ...     - 2. In the Navigation bar: Clicks the Create new study button
    ...     - 3. Filling in all study’s required information in the New Study screen
    ...     - 4.  Clicks the Done button on the Verify ECG signal screen
    ...     Expected Results:
    ...     - Step4: Close the Clinic portal web view and the user shall be navigated to the Dashboard screen with corresponding pop-up displayed Study created successfully pop-up
    [Tags]  BTGW-CLINIC-DASHBOARD-CREATE-STUDY-03     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-CREATE-STUDY-04: Create Extended Holter study with BiotresRT device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can create Extended Holter Study with BiotresRT device
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...
    ...     Test Steps:
    ...     - 1. Connect the device
    ...     - 2. In the Navigation bar: Clicks the Create new study button
    ...     - 3. Filling in all study’s required information in the New Study screen
    ...     - 4.  Clicks the Done button on the Verify ECG signal screen
    ...     Expected Results:
    ...     - Step4: Close the Clinic portal web view and the user shall be navigated to the Dashboard screen with corresponding pop-up displayed Study created successfully pop-up
    [Tags]  BTGW-CLINIC-DASHBOARD-CREATE-STUDY-04     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-CREATE-STUDY-05: Create MCT study with BiotresRT device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can create MCT Study with BiotresRT device
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...
    ...     Test Steps:
    ...     - 1. Connect the device
    ...     - 2. In the Navigation bar: Clicks the Create new study button
    ...     - 3. Filling in all study’s required information in the New Study screen
    ...     - 4.  Clicks the Done button on the Verify ECG signal screen
    ...     Expected Results:
    ...     - Step4: Close the Clinic portal web view and the user shall be navigated to the Dashboard screen with corresponding pop-up displayed Study created successfully, Content, Cancel & Disconnect button
    ...     - Refer to design: https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=5071%3A28021&t=9YZAj4g5xWMBkz0w-4
    [Tags]  BTGW-CLINIC-DASHBOARD-CREATE-STUDY-05    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-CLINIC-DASHBOARD-CREATE-STUDY-06: Create MCT PEEK study with BiotresRT device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can create MCT PEEK Study with BiotresRT device
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...
    ...     Test Steps:
    ...     - 1. Connect the device
    ...     - 2. In the Navigation bar: Clicks the Create new study button
    ...     - 3. Filling in all study’s required information in the New Study screen
    ...     - 4.  Clicks the Done button on the Verify ECG signal screen
    ...     Expected Results:
    ...     - Step4: Close the Clinic portal web view and the user shall be navigated to the Dashboard screen with corresponding pop-up displayed Study created successfully, Content, Cancel & Disconnect button
    ...     - Refer to design: https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=5071%3A28021&t=9YZAj4g5xWMBkz0w-4
    [Tags]  BTGW-CLINIC-DASHBOARD-CREATE-STUDY-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-CREATE-STUDY-07: Create CARDIAC EVENT study with BiotresRT device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can create CARDIAC EVENT Study with BiotresRT device
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...
    ...     Test Steps:
    ...     - 1. Connect the device
    ...     - 2. In the Navigation bar: Clicks the Create new study button
    ...     - 3. Filling in all study’s required information in the New Study screen
    ...     - 4.  Clicks the Done button on the Verify ECG signal screen
    ...     Expected Results:
    ...     - Step4: Close the Clinic portal web view and the user shall be navigated to the Dashboard screen with corresponding pop-up displayed Study created successfully, Content, Cancel & Disconnect button
    ...     - Refer to design: https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=5071%3A28021&t=9YZAj4g5xWMBkz0w-4
    [Tags]  BTGW-CLINIC-DASHBOARD-CREATE-STUDY-07    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-CREATE-STUDY-08: Create HOLTER FOLLOW-ON study with biotresRT device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can create HOLTER FOLLOW-ON Study with BiotresRT device
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...
    ...     Test Steps:
    ...     - 1. Connect the device
    ...     - 2. In the Navigation bar: Clicks the Create new study button
    ...     - 3. Filling in all study’s required information in the New Study screen
    ...     - 4.  Clicks the Done button on the Verify ECG signal screen
    ...     Expected Results:
    ...     - Step4: Close the Clinic portal web view and the user shall be navigated to the Dashboard screen with corresponding pop-up displayed Study created successfully, Content, Cancel & Disconnect button
    ...     - Refer to design: https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=5071%3A28021&t=9YZAj4g5xWMBkz0w-4
    [Tags]  BTGW-CLINIC-DASHBOARD-CREATE-STUDY-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-DASHBOARD-CREATE-STUDY-09: Study creation with Biotres device failed
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cann't create study with Biotres device
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...
    ...     Test Steps:
    ...     - 1. Connect the device
    ...     - 2. In the Navigation bar: Clicks the Create new study button
    ...     - 3. Filling in all study’s required information in the New Study screen
    ...     - 4.  Clicks the Done button on the Verify ECG signal screen
    ...     Expected Results:
    ...     - Step4: Close the Clinic portal web view and the user shall be navigated to the Dashboard screen with corresponding pop-up displayed Failed to create study pop-up
    [Tags]  BTGW-CLINIC-DASHBOARD-DASHBOARD-CREATE-STUDY-09     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-DASHBOARD-CREATE-STUDY-10: Study creation with BiotresRT device failed
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cann't create study with BiotresRT device
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen
    ...
    ...     Test Steps:
    ...     - 1. Connect the device
    ...     - 2. In the Navigation bar: Clicks the Create new study button
    ...     - 3. Filling in all study’s required information in the New Study screen
    ...     - 4.  Clicks the Done button on the Verify ECG signal screen
    ...     Expected Results:
    ...     - Step4: Close the Clinic portal web view and the user shall be navigated to the Dashboard screen with corresponding pop-up displayed Study created successfully, Content, Cancel & Disconnect button
    ...     - Refer to design: https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=5071%3A28227&t=9YZAj4g5xWMBkz0w-4
    [Tags]  BTGW-CLINIC-DASHBOARD-DASHBOARD-CREATE-STUDY-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-DASHBOARD-CREATE-STUDY-11: Tap the Cancel button in the Study created successfully pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can tap the Cancel button in the Study created successfully pop-up
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen and the screen is displaying the Study created successfully pop-up
    ...
    ...     Test Steps:
    ...     - 1. Tap the Cancel button
    ...     Expected Results:
    ...     - Step1: The Study created successfully pop-up shall dismiss
    ...
    [Tags]  BTGW-CLINIC-DASHBOARD-DASHBOARD-CREATE-STUDY-11    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-DASHBOARD-CREATE-STUDY-12: Tap the Disconnect button in the Dashboard after Tap the Cancel button in the Study created successfully pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can tap the Disconnect button in the Dashboard after Tap the Cancel button in the Study created successfully pop-up
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen and the screen is displaying the Study created successfully pop-up
    ...
    ...     Test Steps:
    ...     - 1. Tap the Cancel button
    ...     - 2. Tap the Disconnect button
    ...     Expected Results:
    ...     - Step1: The Study created successfully pop-up shall dismiss
    ...     - Step2: The BiotresRT device shall be disconnected from the app.
    [Tags]  BTGW-CLINIC-DASHBOARD-DASHBOARD-CREATE-STUDY-12    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-DASHBOARD-CREATE-STUDY-13: Tap the Disconnect button in the Study created successfully pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can tap the Disconnect button in the Study created successfully pop-up
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen and the screen is displaying the Study created successfully pop-up
    ...
    ...     Test Steps:
    ...     - 1. Tap the Disconnect button
    ...     Expected Results:
    ...     - Step1: The Study created successfully pop-up shall dismiss and the BiotresRT device shall be disconnected from the app.
    ...
    [Tags]  BTGW-CLINIC-DASHBOARD-DASHBOARD-CREATE-STUDY-13    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-DASHBOARD-CREATE-STUDY-14: Connect that device after tap the Disconnect button in the Study created successfully pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can Connect that device after tap the Disconnect button in the Study created successfully pop-up
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen and the screen is displaying the Study created successfully pop-up
    ...
    ...     Test Steps:
    ...     - 1. Tap the Disconnect button
    ...     - 2. Connect that device agian
    ...     Expected Results:
    ...     - Step1: That device shall be connected with the app and the study status shall be displayed "Study created"
    ...
    [Tags]  BTGW-CLINIC-DASHBOARD-DASHBOARD-CREATE-STUDY-14    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-01: View the Study ID in the Study Information
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description:
    ...     -  View the Study ID in the Study Information
    ...
    ...     Precondition:
    ...     - The user is on the Study Details page
    ...
    ...     Test Steps:
    ...     - 1. Observe the Study ID
    ...     Expected Results:
    ...     - Step1: The Study ID shall be displayed in the Study Information section
    ...
    [Tags]  BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-02: View the Status Study in the Study Information
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description:
    ...     -  View the Study ID in the Study Information
    ...
    ...     Precondition:
    ...     - The user is on the Study Details page
    ...
    ...     Test Steps:
    ...     - 1. Observe the Study Status
    ...     Expected Results:
    ...     - Step1: The Status Study shall be displayed in the Study Information section
    ...
    [Tags]  BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-03: View the Start time in the Study Information
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description:
    ...     -  View the Study ID in the Study Information
    ...
    ...     Precondition:
    ...     - The user is on the Study Details page
    ...
    ...     Test Steps:
    ...     - 1. Observe the Start time
    ...     Expected Results:
    ...     - Step1: The Start time shall be displayed in the Study Information section
    ...
    [Tags]  BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-04: View the End time: default ( Start time + Duration) in the Study Information
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description:
    ...     -  View the Study ID in the Study Information
    ...
    ...     Precondition:
    ...     - The user is on the Study Details page
    ...
    ...     Test Steps:
    ...     - 1. Observe the End time
    ...     Expected Results:
    ...     - Step1: The End time shall be displayed in the Study Information section
    ...
    [Tags]  BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-05: View the End time: (stop study) in the Study Information
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description:
    ...     -  View the Study ID in the Study Information
    ...
    ...     Precondition:
    ...     - The user is on the Study Details page
    ...
    ...     Test Steps:
    ...     - 1. Observe the End time
    ...     Expected Results:
    ...     - Step1: The End time shall be displayed in the Study Information section
    ...
    [Tags]  BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-05    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-06: View the Study Type in the Study Information
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description:
    ...     -  View the Study ID in the Study Information
    ...
    ...     Precondition:
    ...     - The user is on the Study Details page
    ...
    ...     Test Steps:
    ...     - 1. Observe the Study Type
    ...     Expected Results:
    ...     - Step1: The Study Typeshall be displayed in the Study Information section
    ...
    [Tags]  BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-07: View the Study Duration in the Study Information
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description:
    ...     -  View the Study ID in the Study Information
    ...
    ...     Precondition:
    ...     - The user is on the Study Details page
    ...
    ...     Test Steps:
    ...     - 1. Observe the Study Duration
    ...     Expected Results:
    ...     - Step1: The Study Duration shall be displayed in the Study Information section
    ...
    [Tags]  BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-07    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-08: View the Patient Return Visit in the Study Information
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description:
    ...     -  View the Study ID in the Study Information
    ...
    ...     Precondition:
    ...     - The user is on the Study Details page
    ...
    ...     Test Steps:
    ...     - 1. Observe the Patient Return Visit
    ...     Expected Results:
    ...     - Step1: The Patient Return Visit shall be displayed in the Study Information section
    ...
    [Tags]  BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-09: View the Device ID in the Study Information
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description:
    ...     -  View the Device ID in the Study Information
    ...
    ...     Precondition:
    ...     - The user is on the Study Details page
    ...
    ...     Test Steps:
    ...     - 1. Observe the Device ID
    ...     Expected Results:
    ...     - Step1: The Device ID shall be displayed in the Study Information section
    ...
    [Tags]  BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-10: View the Study Details button after changing interpreting physicia in the clinic web
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description:
    ...     -  View the Study Details button after changing interpreting physicia in the clinic web
    ...
    ...     Precondition:
    ...     - The user is on the Dashboard screen.
    ...
    ...     Test Steps:
    ...     - 1. Change other interpreting physician in the web
    ...     - 2. Reload the screen
    ...     - 1. Observe the Study Details button
    ...     Expected Results:
    ...     - Step1: The Study Details button shall not be displayed.
    ...
    [Tags]  BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-11: View the Stop button View the Stop Study button when device is disconnected with the app (turn off device)
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description:
    ...     -  View the Stop Study button when device is disconnected with the app (turn off device)
    ...
    ...     Precondition:
    ...     - The user is on the Study Details button.
    ...
    ...     Test Steps:
    ...     - 1. Turn off device
    ...     Expected Results:
    ...     - Step1: The Stop Study button shall be disabled.
    ...
    [Tags]  BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-11    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-12: View the Stop Study button when device is disconnected with the app (turn off BT)
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description:
    ...     -  View the Stop Study button when device is disconnected with the app (turn off BT)
    ...
    ...     Precondition:
    ...     - The user is on the Study Details button.
    ...
    ...     Test Steps:
    ...     - 1. Turn off  BT
    ...     Expected Results:
    ...     - Step1: The Stop Study button shall be disabled.
    ...
    [Tags]      BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-12    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-13: View the Stop Study button when device is reconnected with the app
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description:
    ...     -  View the Stop Study button when device is disconnected with the app (turn off BT)
    ...
    ...     Precondition:
    ...     - The user is on the Study Details button.
    ...
    ...     Test Steps:
    ...     - 1. Turn off  BT/ device
    ...     - 2. Turn on BT/ device
    ...     Expected Results:
    ...     - Step1: The Stop Study button shall be enabled.
    ...
    [Tags]      BTGW-CLINIC-DASHBOARD-STUDY-DETAILS-13    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}