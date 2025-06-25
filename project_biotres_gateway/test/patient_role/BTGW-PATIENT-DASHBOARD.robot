*** Settings ***
Documentation   Patient-Dashboard Test Suite
Metadata    sid     BTGW-PATIENT-DASHBOARD
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py

Force Tags      BTGW-PATIENT-DASHBOARD      mapp
Test Timeout    30m

*** Test Cases ***
BTGW-PATIENT-DASHBOARD-CODE-01: Enter an incorrect ref code
     [Documentation]     Author: Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the In Ref code screen
    ...
    ...
    ...     Test Steps:
    ...     1. Enter incorrect ref code
    ...		2. Click the Connect Biotres button
	... 	3. Click "OK" button in the modal
    ...
    ...     Expected Results:
    ...     2. Display a modal with content "Invalid code. Please try again!" and the "OK" button
	... 	3. The modal shall be closed.
    [Tags]  BTGW-PATIENT-DASHBOARD-CODE-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-CODE-02: Enter a ref code of study that is on Draft status
     [Documentation]     Author: Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the In Ref code screen
    ...
    ...
    ...     Test Steps:
    ...     1. Enter a ref code of study that is on Draft status
    ...		2. Click the Connect Biotres button
    ...		3. Click "OK" button in the modal
    ...
    ...     Expected Results:
    ...     2. Display a modal with content "Invalid code. Please try again!" and the "OK" button
	... 	3. The modal shall be closed.
    [Tags]  BTGW-PATIENT-DASHBOARD-CODE-02   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-CODE-03: Enter a ref code of study that is on Starting status
     [Documentation]     Author: Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the In Ref code screen
    ...
    ...
    ...     Test Steps:
    ...     1. Enter a ref code of study that is on Starting status
    ...		2. Click the Connect Biotres button
    ...		3. Click "OK" button in the modal
    ...
    ...     Expected Results:
    ...     2. Display a modal with content "Invalid code. Please try again!" and the "OK" button
	... 	3. The modal shall be closed.
   [Tags]  BTGW-PATIENT-DASHBOARD-CODE-03   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-PATIENT-DASHBOARD-CODE-04: Enter a ref code of study that is on Aborted status
      [Documentation]     Author: Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the In Ref code screen
    ...
    ...
    ...     Test Steps:
    ...     1. Enter a ref code of study that is on Aborted status
    ...		2. Click the Connect Biotres button
    ...		3. Click "OK" button in the modal
    ...
    ...     Expected Results:
    ...     2. Display a modal with content "Invalid code. Please try again!" and the "OK" button
	... 	3. The modal shall be closed.
    [Tags]  BTGW-PATIENT-DASHBOARD-CODE-04   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BTGW-PATIENT-DASHBOARD-CODE-05: Enter a ref code of study that is on Completed status
     [Documentation]     Author: Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the In Ref code screen
    ...
    ...
    ...     Test Steps:
    ...     1. Enter a ref code of study that is on Completed status
    ...		2. Click the Connect Biotres button
    ...		3. Click "OK" button in the modal
    ...     Expected Results:
    ...     2. Display a modal with content "Invalid code. Please try again!" and the "OK" button
	... 	3. The modal shall be closed.
    [Tags]  BTGW-PATIENT-DASHBOARD-CODE-05   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BTGW-PATIENT-DASHBOARD-CODE-06: Enter a ref code of study that is on Done status
     [Documentation]     Author: Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the In Ref code screen
    ...
    ...
    ...     Test Steps:
    ...     1. Enter a ref code of study that is on Done status
    ...		2. Click the Connect Biotres button
    ...		3. Click "OK" button in the modal
    ...     Expected Results:
    ...     2. Display a modal with content "Invalid code. Please try again!" and the "OK" button
	... 	3. The modal shall be closed.
    [Tags]  BTGW-PATIENT-DASHBOARD-CODE-06   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-CODE-07: Enter a ref code of study that is on Ongoing status
     [Documentation]     Author: Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the In Ref code screen
    ...
    ...
    ...     Test Steps:
    ...     1. Enter a ref code of study that is on Ongoing status
    ...		2. Click the Connect Biotres button
    ...
    ...     Expected Results:
    ...     2.The user shall be navigated to the screen of looking for Biotres device
    [Tags]  BTGW-PATIENT-DASHBOARD-CODE-07   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-CODE-08: Enter an incorrect ref code in 5 failed times - Wait for 10 minutes, enter again an incorrect ref code
     [Documentation]     Author: Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the In Ref code screen
    ...
    ...
    ...     Test Steps:
    ...     1. Enter an incorrect ref code in 5 failed times
    ... 	2. Click the Ok button in the modal
	... 	3. Wait for 10 minutes, enter again an incorrect ref code
    ...		4. Click the Connect Biotres button
    ...
    ...     Expected Results:
    ...     1. Display a modal with content "Too many attempts. Please try again in a few minutes!" and the "OK" button
	...  	2. The modal shall be closed.
	... 	4. Display a modal with content "Invalid code. Please try again!" and the "OK" button

    [Tags]  BTGW-PATIENT-DASHBOARD-CODE-08   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-CODE-09: Enter an incorrect ref code in 5 failed times - Wait for 10 minutes, enter again a correct ref code
     [Documentation]     Author: Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the In Ref code screen
    ...
    ...
    ...     Test Steps:
    ...     1. Enter an incorrect ref code in 5 failed times
	... 	2. Click the Ok button in the modal
	... 	3. Wait for 10 minutes, enter again a correct ref code
    ...		4. Click the Connect Biotres button
    ...
    ...     Expected Results:
    ...     1. Display a modal with content "Too many attempts. Please try again in a few minutes!" and the "OK" button
	...  	2. The modal shall be closed.
	... 	4. The user shall be navigated to the screen of looking for Biotres device
    [Tags]  BTGW-PATIENT-DASHBOARD-CODE-09   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-CODE-10: Enter an incorrect ref code in 4 failed times then Correct code in 5th attemp time
     [Documentation]     Author: Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the In Ref code screen
    ...
    ...
    ...     Test Steps:
    ...     1. Enter an incorrect ref code in 4 failed times
	... 	2. Click the OK button
	... 	3. Correct code in 5th attemp time
    ...		4. Click the Connect Biotres button
    ...
    ...     Expected Results:
    ...     1. Display a modal with content "Invalid code. Please try again!" and the "OK" button
	... 	2. The modal shall be closed.
	... 	4. The user shall be navigated to the screen of looking for Biotres device
    [Tags]  BTGW-PATIENT-DASHBOARD-CODE-10   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-CODE-11: Enter an incorrect ref code in 3 failed times >> Correct code in 4th attemp time >> Incorrect code in the next time
     [Documentation]     Author: Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the In Ref code screen
    ...
    ...
    ...     Test Steps:
    ...     1. Enter an incorrect ref code in 3 failed times >> Click the Connect Biotres button
	... 	2. Click the OK button
	... 	3. Correct code in 4th attemp time >> Click the Connect Biotres button
	... 	4. Incorrect code in the next time >> Click the Connect Biotres button
	... 	5. Click the Connect Biotres button
    ...
    ...     Expected Results:
    ...     1. Display a modal with content "Invalid code. Please try again!" and the "OK" button
	... 	2. The modal shall be closed.
	... 	3. The user shall be navigated to the screen of looking for Biotres device
	... 	4. Display a modal with content "Invalid code. Please try again!" and the "OK" button
    [Tags]  BTGW-PATIENT-DASHBOARD-CODE-11   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-PATIENT-DASHBOARD-CONNECT-01:Connect device successfully then enter code
    [Documentation]     Author: Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the In Ref code screen
    ...
    ...
    ...     Test Steps:
    ...     1. Enter code
	... 	2. Click the Connect Biotres button

    ...
    ...     Expected Results:
    ...     1. The user shall be navigated to the "Looking..." screen to start the search process, connect to the device Biotres provides.
    [Tags]  BTGW-PATIENT-DASHBOARD-CONNECT-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-CONNECT-02: Connect the device when turn off Bluetooth
    [Documentation]     Author: Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the In Ref code screen
    ...
    ...
    ...     Test Steps:
    ...     1. Turn off the Bluetooth
	... 	2. Enter code
	... 	3. Click the Connect Biotres button

    ...
    ...     Expected Results:
	... 	1. For iOS, there shall be a modal displayed: “Bluetooth is disabled. Please turn it on to continue…”. This modal shall be displayed until the user turns the Bluetooth on
	... 	2. For Android OS, there shall be a modal displayed: “Bluetooth is disabled. Please turn it on to continue!” with OK button. Pressing OK button shall enable Bluetooth on the phone.
    [Tags]  BTGW-PATIENT-DASHBOARD-CONNECT-02   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-CONNECT-03: Connect the device turn off wifi
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the In Ref code screen
    ...
    ...
    ...     Test Steps:
    ...     1. Turn off Wifi
	... 	2. Enter code
	... 	3. Click the Connect Biotres button

    ...
    ...     Expected Results:
	... 	2. There shall be a banner displayed: Internet connection is lost!
    [Tags]  BTGW-PATIENT-DASHBOARD-CONNECT-03   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-CONNECT-04: Go to homescreen when the user is on the Looking for device...
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the In Ref code screen
    ...
    ...
    ...     Test Steps:
	... 	1. Enter correct code
	... 	2. Click the Connect Biotres button
	... 	3. In the Looking for device... - go to homescreen

    ...
    ...     Expected Results:
	... 	3. The user shall be navigated to the In Ref code screen.
    [Tags]  BTGW-PATIENT-DASHBOARD-CONNECT-04   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-PATIENT-DASHBOARD-CONNECT-05: Turn off Bluetooth when the user is on the Looking for device...
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the In Ref code screen
    ...
    ...
    ...     Test Steps:
	... 	1. Enter correct code
	... 	2. Click the Connect Biotres button
	... 	3. In the Looking for device... - Turn off Bluetooth
    ...
    ...     Expected Results:
	...		3. iOS - Display a modal :" Bluetooth is disabled. Please turn it on to continue..."
	... 	Android - Display modal: "Bluetooth is disabled. Please turn it on to continue!" and OK button
    [Tags]  BTGW-PATIENT-DASHBOARD-CONNECT-05   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BTGW-PATIENT-DASHBOARD-CONNECT-06: Turn off Wifi when the user is on the Looking for device...
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the In Ref c ode screen
    ...
    ...
    ...     Test Steps:
	... 	1. Enter correct code
	... 	2. Click the Connect Biotres button
	... 	3. In the Looking for device... - Turn off Wifi
    ...
    ...     Expected Results:
	... 	3. Finding and connecting to the device Biotres provides is still working properly.
    [Tags]  BTGW-PATIENT-DASHBOARD-CONNECT-06   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BTGW-PATIENT-DASHBOARD-CONNECT-07: Turn off device when the user is on the Looking for device...
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the In Ref code screen
    ...
    ...
    ...     Test Steps:
	... 	1. Enter correct code
	... 	2. Click the Connect Biotres button
	... 	3. In the Looking for device... - Turn off device
	... 	4. Click the OK button in the modal
    ...
    ...     Expected Results:
	... 	3. Display a modal :"Biotres device not found!" and OK button
	... 	4. The user shall be navigated to the In Ref code screen
    [Tags]  BTGW-PATIENT-DASHBOARD-CONNECT-07   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-PATIENT-DASHBOARD-CONNECT-08: Looking for device...when Device is being connected to another app
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the In Ref code screen
    ...
    ...
    ...     Test Steps:
	... 	1. Device is being connected to another app
	... 	2. Enter correct code
	... 	3. Click the Connect Biotres button
	... 	4. In the Looking for device... - Observe
	... 	5. Click the OK button in the modal
    ...
    ...     Expected Results:
	... 	3. Display a modal :"Biotres device not found!" and OK button
	... 	4. The user shall be navigated to the In Ref code screen
    [Tags]  BTGW-PATIENT-DASHBOARD-CONNECT-08   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-PATIENT-DASHBOARD-CONNECT-09: Turn off device when Found device...
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the In Ref code screen
    ...
    ...
    ...     Test Steps:
	... 	1. Enter correct code
	... 	2. Click the Connect Biotres button
	... 	3. Found device... - Turn off device
    ...
    ...     Expected Results:
	... 	3. Display a modal :"Could not connect to Biotres device!" and OK button
	... 	4. The user shall be navigated to the In Ref code screen
	...
    [Tags]  BTGW-PATIENT-DASHBOARD-CONNECT-09   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-CONNECT-10: Turn off device then turn on device when Found device...
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the In Ref code screen
    ...
    ...
    ...     Test Steps:
	... 	1. Enter correct code
	... 	2. Click the Connect Biotres button
	... 	3. Found device... - Turn off device
	... 	4. Found device... - Turn on device
    ...
    ...     Expected Results:
	... 	1. Finding and connecting to the device Biotres provides is still working properly.
    [Tags]  BTGW-PATIENT-DASHBOARD-CONNECT-10       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BTGW-PATIENT-DASHBOARD-CONNECT-11: Turn off Bluetooth when Found device...
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the In Ref code screen
    ...
    ...
    ...     Test Steps:
	... 	1. Enter correct code
	... 	2. Click the Connect Biotres button
	... 	3. Found device... - Turn off Bluetooth
    ...
    ...     Expected Results:
	...		3. iOS - Display a modal :" Bluetooth is disabled. Please turn it on to continue..."
	... 	Android - Display modal: "Bluetooth is disabled. Please turn it on to continue!" and OK button
	...
    [Tags]  BTGW-PATIENT-DASHBOARD-CONNECT-11   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-CONNECT-12: Turn off wifi when Found device...
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the In Ref code screen
    ...
    ...
    ...     Test Steps:
	... 	1. Enter correct code
	... 	2. Click the Connect Biotres button
	... 	3. Found device... - Turn off wifi
    ...
    ...     Expected Results:
	... 	3. Finding and connecting to the device Biotres provides is still working properly.
    [Tags]  BTGW-PATIENT-DASHBOARD-CONNECT-12   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BTGW-PATIENT-DASHBOARD-VIEW-01: View battery status + Not charging + Time until next
    [Documentation]     Author:Phuong Tran
    ...
    ...     Precondition:
    ...     - The use is on the Dashboard screen
    ...     Expected Results:
	... 	1. refer to design (https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2363%3A21463)
    ...
    [Tags]  BTGW-PATIENT-DASHBOARD-VIEW-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-VIEW-02: View battery status + Charging + Time to full charge
    [Documentation]    Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the Dashboard screen

    ...     Expected Results:
	... 	1. refer to design (https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=501%3A6932)
	...
    [Tags]  BTGW-PATIENT-DASHBOARD-VIEW-02   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-VIEW-03: View battery is low
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the Dashboard screen
    ...
    ...     Expected Results:
	... 	There shall be a banner displayed at the bottom of the screen: “Battery is low, please connect your device to the charger!”
    [Tags]  BTGW-PATIENT-DASHBOARD-VIEW-03   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-VIEW-04: View Device ID
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the Dashboard screen
    ...
    ...     Expected Results:
	... 	Refer to design (https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2363%3A21463)
    [Tags]  BTGW-PATIENT-DASHBOARD-VIEW-04   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-VIEW-05: View device status - Turn off wifi
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the Dashboard screen
    ...
    ...
    ...     Expected Results:
	... 	Refer to design (https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=501%3A7358)
    [Tags]  BTGW-PATIENT-DASHBOARD-VIEW-05   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-VIEW-06: View device status - Turn on wifi
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the Dashboard screen
    ...

    ...
    ...     Expected Results
	... 	Refer to design (https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2363%3A21463)
    [Tags]  BTGW-PATIENT-DASHBOARD-VIEW-06   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-VIEW-07: View device connection - Turn off device then Turn on device
     [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the Dashboard screen
    ...
    ...
    ...     Test Steps:
	... 	1. Turn off device
    ...		2. Turn on device
    ...     Expected Results:
	... 	1. refer to design (https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=501%3A7217)
	... 	2. refer to design (https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2363%3A21463)
    [Tags]  BTGW-PATIENT-DASHBOARD-VIEW-07   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-VIEW-08: View device status - Turn off Bluetooth then turn on
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the Dashboard screen
    ...
    ...
    ...     Test Steps:
	... 	1. Turn off Bluetooth
	... 	2. Turn on Bluetooth
    ...
    ...     Expected Results:
	... 	1.  a. an error message displayed: “Bluetooth is disable. Please enable it!”
	...			b. a change in Bluetooth connection status, display “Device disconnected”
	... 		c. clearances of all other device information to “--”, except Device ID.
	... 	2. Refer to design (https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=2363%3A21463)
    [Tags]  BTGW-PATIENT-DASHBOARD-VIEW-08   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-VIEW-09: View electrode connection (On)
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the Dashboard screen
    ...
    ...     Expected Results:
	... 	the status shall be displayed as follow: “Electrodes connected properly” (refer to design: https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=501%3A7358)
    [Tags]  BTGW-PATIENT-DASHBOARD-VIEW-09   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-VIEW-10: View electrode connection (Off)
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the Dashboard screen
    ...
    ...     Expected Results:
	... 	The status shall be changed to: “One or more electrodes are disconnected” (refer to design: https://www.figma.com/file/msqh0tDVzP5Y8GREtj9ABu/Biotres-Gateway?node-id=501%3A7636_
    [Tags]  BTGW-PATIENT-DASHBOARD-VIEW-10   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-VIEW-11: View study status (Study is in progress, Completed, Done)
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the Dashboard screen
    ...
    ...
    ...     Test Steps:
	... 	1.View study status
    ...
    ...     Expected Results:
    ...     - Step1: The study status shall be displayed. (Study is in progress, Completed, Done)
    ...
	...
    [Tags]  BTGW-PATIENT-DASHBOARD-VIEW-11   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-VIEW-12: Stop Study in the Dashboard screen
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the Dashboard screen
    ...
    ...     Expected Results:
	... 	The app shall display the remaining duration of the study
    [Tags]  BTGW-PATIENT-DASHBOARD-VIEW-12   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-VIEW-13: Stop Study in the App in background then Open app
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the Dashboard screen
    ...
    ...     Expected Results:
	... 	There shall be a modal displayed to notify the user of the completed study: “Your study was completed!” with OK button. Clicking OK button will navigate the user to the Input reference code screen.
    [Tags]  BTGW-PATIENT-DASHBOARD-VIEW-13   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-VIEW-14: Stop Study in the App in background then Open app from the notification
     [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the Dashboard screen
    ...
    ...
    ...     Test Steps:
	... 	1.
    ...
    ...     Expected Results:
	...
    [Tags]  BTGW-PATIENT-DASHBOARD-VIEW-14   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-VIEW-15: Stop Study in the App in multiptask mode then re-open app
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the Dashboard screen
    ...
    ...
    ...     Test Steps:
	... 	1.
    ...
    ...     Expected Results:
	... 	There shall be a modal displayed to notify the user of the completed study: “Your study was completed!” with OK button. Clicking OK button will navigate the user to the Input reference code screen.
    [Tags]  BTGW-PATIENT-DASHBOARD-VIEW-15   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-VIEW-16: Press patient event key on the Dashboard screen
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the Dashboard screen
    ...
    ...
    ...     Test Steps:
	... 	1.
    ...
    ...     Expected Results:
	...
    [Tags]  BTGW-PATIENT-DASHBOARD-VIEW-16   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-VIEW-17: Press patient event key on the App in background screen
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the Dashboard screen
    ...
    ...
    ...     Test Steps:
	... 	1.
    ...
    ...     Expected Results:
	...
    [Tags]  BTGW-PATIENT-DASHBOARD-VIEW-17   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-VIEW-18: Press patient event key on the App in multiptask mode screen
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the Dashboard screen
    ...
    ...
    ...     Test Steps:
	... 	1.
    ...
    ...     Expected Results:
	...
    [Tags]  BTGW-PATIENT-DASHBOARD-VIEW-18   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BTGW-PATIENT-DASHBOARD-VIEW-19: Press patient event key when turn off device
    [Documentation]     Author:Phuong Tran
    ...
    ...
    ...     Precondition:
    ...     - The use is on the Dashboard screen
    ...
    ...
    ...     Test Steps:
	... 	1.
    ...
    ...     Expected Results:
	...
    [Tags]  BTGW-PATIENT-DASHBOARD-VIEW-19   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#BTGW-PATIENT-DASHBOARD-FORGOT-01:
#

