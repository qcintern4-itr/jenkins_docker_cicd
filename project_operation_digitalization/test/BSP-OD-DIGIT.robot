*** Settings ***
Documentation   Test Suite - Operation Digitalization
Metadata    sid     BSP-OD-DIGIT
Metadata    owner   Linh Phan
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_operation_digitalization/lib/ConfigHandler.py    ${ENV}
#Library     project_operation_digitalization/lib/web/Common.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BSP-OD-DIGIT       web
Test Timeout    1h

*** Test Cases ***
BSP-OD-DIGIT-LOGIN-01: Sign in with a valid username and valid password
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can sign in to the Operation Digitalization web app with a valid username and password
    ...     Precondition:
    ...     - The user is on the Login page of the Operation Digitalization web app
    ...
    ...     Test Steps:
    ...     - 1. Enter valid username into [Username] textbox
    ...     - 2. Enter valid password into [Password] textbox
    ...     - 3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     - 1. Sign in successfully
    ...     - 2. The full name will be displayed

    [Tags]  BSP-OD-DIGIT-LOGIN-01      FRS-065-01    FRS-065-01-SPF-1    manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Sign In Digitalization Portal  ${USER}[username]    ${USER}[password]
#    ${is_success}  Page Digitalization Sign In Successfully
#    Should Be True   ${is_success}
#    [Teardown]    Sign Out Digitalization Portal

BSP-OD-DIGIT-LOGIN-02: Sign in with a valid username and an invalid password
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can not Log in to the the Operation Digitalization web app with a valid username and an invalid password    ...    ...     Precondition:
    ...     - The user is on the Sign in page of the Operation Digitalization web app
    ...
    ...     Test Steps:
    ...     - 1. Enter valid username into [Username] textbox
    ...     - 2. Enter invalid password into [Password] textbox
    ...     - 3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     - 1. The user can not log in to Support portal
    ...     - 2. The user stays on Sign in page
    ...     - 3. The error message “Invalid username/password” shall be displayed
    [Tags]    BSP-OD-DIGIT-LOGIN-02      FRS-065-01    FRS-065-01-SPF-1    manual    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Sign In Digitalization Portal  ${USER}[username]    fakepw
#    ${is_success}  Page Digitalization Sign In Successfully
#    Should Not Be True   ${is_success}
#    ${message}  get_error_message
#    Should Be Equal  ${message}  Invalid username/password

BSP-OD-DIGIT-LOGIN-03: Sign in with an invalid username and a valid password
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can not sign in to the Operation Digitalization web app with an invalid username and a valid password    ...    ...     Precondition:
    ...     - The user is on the Login page of the Operation Digitalization web app
    ...
    ...     Test Steps:
    ...     - 1. Enter an invalid username into [Username] textbox
    ...     - 2. Enter a valid password into [Password] textbox
    ...     - 3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     - 1. The user can not log in to Support portal
    ...     - 2. The user stays on Sign in page
    ...     - 3. The erro message “Invalid username/password” shall be displayed
    [Tags]    BSP-OD-DIGIT-LOGIN-03     FRS-065-01    FRS-065-01-SPF-1    manual    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Sign In Digitalization Portal     ${USER}[username]user       ${USER}[password]
#    ${message}   Get Error Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${message}      Invalid username/password

BSP-OD-DIGIT-LOGIN-04: Sign in with an invalid username and an invalid password
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can not sign in to the Operation Digitalization web app with a valid username and an invalid password    ...    ...     Precondition:
    ...     - The user is on the Login page of the Operation Digitalization web app
    ...
    ...     Test Steps:
    ...     - 1. Enter invalid username into [Username] textbox
    ...     - 2. Enter invalid password into [Password] textbox
    ...     - 3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     - 1. The user can not log in to Support portal
    ...     - 2. The user is on Sign in page
    ...     - 3. The erro message “Invalid username/password” shall be displayed
    [Tags]    BSP-OD-DIGIT-LOGIN-04      FRS-065-01    FRS-065-01-SPF-1    manual    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Sign In Digitalization Portal     ${USER}[username]user       ${USER}[password]pass
#    ${message}   Get Error Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${message}      Invalid username/password

BSP-OD-DIGIT-LOGIN-05: Sign out
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can sign out
    ...
    ...     Precondition:
    ...     - The user has signed in to the Support Portal
    ...
    ...     Test Steps:
    ...     - 1. Click on the User's name
    ...     - 2. Click [Sign out] button
    ...
    ...     Expected Results:
    ...     - 1. The user can sign out successfully
    ...     - 2. The user is on Sign in page

    [Tags]    BSP-OD-DIGIT-LOGIN-05    manual    FRS-066-01-SPF-1    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-WELCOMEPAGE-01: View the Welcome page
    [Documentation]     Author: Linh Phan
    ...
    ...     Description: View the Welcome page
    ...
    ...     Precondition:
    ...     - 1. The OM or OS is on the Welcome page of the Operation Digitalization web app
    ...
    ...     Test Steps:
    ...     - 1. Observe the Welcome page
    ...
    ...     Expected Results:
    ...     - 1.The text: Welcome! To create a form, please select a form type and provide the device ID
    ...     - 2.There shall be a “Purpose” section:
    ...     - "Operation Form" option
    ...     - "Refurbished Device" option
    ...     - "RMA Service Traveler" option (default selected)
    ...     - 3. "Device ID" textbox
    ...     - 4. Scan code button
    ...     - 5. Next button

    [Tags]    BSP-OD-DIGIT-WELCOMEPAGE-01    manual    FRS-067-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-ENTER-01: Enter an invalid device ID (<10 digits)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter an invalid device ID (<10 digits)
    ...
    ...     Precondition:
    ...     - 1. The OM or OS is on the Welcome page of the Operation Digitalization web app
    ...
    ...     Test Steps:
    ...     - 1. The user selects Operation Form option
    ...     - 2. In the Device ID field, enter a number that is less than 10 digits
    ...     - 3. Then click the Next button
    ...
    ...     Expected Results:
    ...     - 1.The error message “Invalid device ID” shall be displayed under the Device ID field

    [Tags]    BSP-OD-DIGIT-OPERATION-ENTER-01    manual    FRS-067-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-ENTER-02: Enter an invalid device ID (>10 digits)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter an invalid device ID (>10 digits)
    ...
    ...     Precondition:
    ...     - 1. The OM or OS is on the Welcome page of the Operation Digitalization web app
    ...
    ...     Test Steps:
    ...     - 1. The user selects Operation Form option
    ...     - 2: In the Device ID field, enter a number that is greater than 10 digits
    ...     - 3. Then click the Next button
    ...
    ...     Expected Results:
    ...     - 1.The error message “Invalid device ID” shall be displayed under the Device ID field

    [Tags]    BSP-OD-DIGIT-OPERATION-ENTER-02    manual    FRS-067-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-ENTER-03: Enter a valid device ID (the starting numbers of the Device ID entered is 33)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a valid device ID (the starting numbers of the Device ID entered is 33)
    ...
    ...     Precondition:
    ...     - 1. The OM or OS is on the Welcome page of the Operation Digitalization web app
    ...
    ...     Test Steps:
    ...     - 1. The user selects Operation Form option
    ...     - 2. In the Device ID field, enter a device ID that does not exist in the system,
    ...     the starting numbers of the Device ID entered is 33
    ...     - 3. Then click the Next button
    ...
    ...     Expected Results:
    ...     - 1.There shall be a popup window that displays:
    ...     - The message “Adding device to Biotricity Production. Please select the device model below.”
    ...     - [Cancel] button
    ...     - [Ok] button
    ...     - Bioflux option is selected
    ...     - Biotres option

    [Tags]    BSP-OD-DIGIT-OPERATION-ENTER-03    manual    FRS-067-01-SPF-1    R1    FRS-068-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-ENTER-05: Enter a valid device ID (the starting numbers of the Device ID entered is 12)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a valid device ID (the starting numbers of the Device ID entered is 12)
    ...
    ...     Precondition:
    ...     - 1. The OM or OS is on the Welcome page of the Operation Digitalization web app
    ...
    ...     Test Steps:
    ...     - 1. The user selects Operation Form option
    ...     - 2: In the Device ID field, enter a device ID that does not exist in the system,
    ...     the starting numbers of the Device ID entered is 12
    ...     - 3. Then click the Next button
    ...
    ...     Expected Results:
    ...     - 1.There shall be a popup window that displays:
    ...     - The message “Adding device to Biotricity Production. Please select the device model below.”
    ...     - [Cancel] button
    ...     - [Ok] button
    ...     - Bioflux option
    ...     - Biotres option is selected

    [Tags]    BSP-OD-DIGIT-OPERATION-ENTER-05    manual    FRS-067-01-SPF-1    R1    FRS-068-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-ENTER-06: Enter a valid device ID (the starting numbers of the Device ID entered is 13)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a valid device ID (the starting numbers of the Device ID entered is 13)
    ...
    ...     Precondition:
    ...     - 1. The OM or OS is on the Welcome page of the Operation Digitalization web app
    ...
    ...     Test Steps:
    ...     - 1. The user selects Operation Form option
    ...     - 2: In the Device ID field, enter a device ID that does not exist in the system,
    ...     the starting numbers of the Device ID entered is 13
    ...     - 3. Then click the Next button
    ...
    ...     Expected Results:
    ...     - 1.There shall be a popup window that displays:
    ...     - The message “Adding device to Biotricity Production. Please select the device model below.”
    ...     - [Cancel] button
    ...     - [Ok] button
    ...     - Bioflux option
    ...     - Biotres option is selected

    [Tags]    BSP-OD-DIGIT-OPERATION-ENTER-06    manual    FRS-067-01-SPF-1    R1    FRS-068-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-ENTER-08: Enter device ID (the starting numbers does not follow the existing starting numbers logged on the app)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter device ID (the starting numbers does not follow the existing starting numbers logged on the app)
    ...
    ...     Precondition:
    ...     - 1. The OM or OS is on the Welcome page of the Operation Digitalization web app
    ...
    ...     Test Steps:
    ...     - 1. The user selects Operation Form option
    ...     - 2. In the Device ID field, enter a device ID that does not exist in the system,
    ...     the starting numbers of the Device ID entered does not follow the existing starting
    ...     numbers logged on the app
    ...     - 3. Then click the Next button
    ...
    ...     Expected Results:
    ...     - 1.Display error message "Invalid device ID"

    [Tags]    BSP-OD-DIGIT-OPERATION-ENTER-08    manual    FRS-067-01-SPF-1    R1    FRS-068-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-ENTER-10: Navigate to the Operation form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Navigate to the Operation form
    ...
    ...     Precondition:
    ...     - 1. The OM or OS is on the Operation Digitalization web app
    ...     - 2. The user enter a valid Device ID that does not exist in the system
    ...     - 2. The Biotres option is selected
    ...
    ...     Test Steps:
    ...     - 1. On the popup window, select the [OK] button
    ...
    ...     Expected Results:
    ...     - 1. The user shall be navigated to the Operation Forms (Form FT-1306-7).
    ...     - 2. This device shall be added to Biotricity Production

    [Tags]    BSP-OD-DIGIT-OPERATION-ENTER-10    manual    FRS-067-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-ENTER-11: Navigate to the Operation form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Navigate to the operation form
    ...
    ...     Precondition:
    ...     - 1. The OM or OS is on the Operation Digitalization web app
    ...     - 2. The user enter a valid Device ID that does not exist in the system
    ...     - 3. The Bioflux option is selected
    ...
    ...     Test Steps:
    ...     - 1. On the popup window, select the [OK] button
    ...
    ...     Expected Results:
    ...     - 1. The user shall be navigated to the Operation Forms (Form FT-1306-2).
    ...     - 2. This device shall be added to Biotricity Production

    [Tags]    BSP-OD-DIGIT-OPERATION-ENTER-11    manual     FRS-067-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-ENTER-12: Navigate to the Operation form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Navigate to the operation form
    ...
    ...     Precondition:
    ...     - 1. The OM or OS is on the Welcome page of the Operation Digitalization web app
    ...
    ...     Test Steps:
    ...     - 1. In the Device ID field, enter a Bioflux device that already existed in the system
    ...     - 2. Clicks on the "Next" button
    ...
    ...     Expected Results:
    ...     - 1. The user shall be navigated to the Operation Forms (Form FT-1306-2).

    [Tags]    BSP-OD-DIGIT-OPERATION-ENTER-12    manual     FRS-067-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-ENTER-13: Navigate to the Operation form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Navigate to the operation form
    ...
    ...     Precondition:
    ...     - 1. The OM or OS is on the Welcome page of the Operation Digitalization web app
    ...
    ...     Test Steps:
    ...     - 1. In the Device ID field, enter a Biotres device that already existed in the system
    ...     - 2. Clicks on the "Next" button
    ...
    ...     Expected Results:
    ...     - 1. The user shall be navigated to the Operation Forms (Form FT-1306-7).

    [Tags]    BSP-OD-DIGIT-OPERATION-ENTER-13     manual     FRS-067-01-SPF-1    R1     FRS-068-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-ENTER-14: Enter Device ID that already has a submitted Operation Form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter Device ID that already has a submitted Operation Form
    ...     (last action taken on the last form submitted)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS submitted an Operation form for the device
    ...
    ...     Test Steps:
    ...     - 1. Enter a device that already has an Operation Form that was submitted
    ...     (last action taken on the last form submitted)
    ...     - 2. Clicks on "Next" button
    ...
    ...     Expected Results:
    ...     - 1. There shall be the message "Device already has a submitted Operation Form"

    [Tags]    BSP-OD-DIGIT-OPERATION-ENTER-14     manual     FRS-067-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-ENTER-15: Enter Device ID that already has an approved Operation Form by OM
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter Device ID that already has an approved Operation Form
    ...     (last action taken on the last form submitted)
    ...
    ...     Precondition:
    ...     - 1.The OM is on the S&D portal and approve an Operation form for the device
    ...
    ...     Test Steps:
    ...     - 1.Enter a device that already has an Operation Form that was approved
    ...     (last action taken on the last form submitted)
    ...     - 2.Clicks on "Next" button
    ...
    ...     Expected Results:
    ...     - 1. There shall be the message "Device already has an approved Operation Form"

    [Tags]    BSP-OD-DIGIT-OPERATION-ENTER-15     manual     FRS-067-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-ENTER-16: Enter Device ID that already has an approved Operation Form by QMS
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter Device ID that already has an approved Operation Form
    ...     (last action taken on the last form submitted)
    ...
    ...     Precondition:
    ...     - 1.The QMS is on the QMS portal and approve an Operation form for the device
    ...
    ...     Test Steps:
    ...     - 1.Enter a device that already has an Operation Form that was approved by QMS
    ...     (last action taken on the last form submitted)
    ...     - 2.Clicks on "Next" button
    ...
    ...     Expected Results:
    ...     - 1. There shall be the message "Device already has an approved Operation Form"

    [Tags]    BSP-OD-DIGIT-OPERATION-ENTER-16     manual     FRS-067-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-ENTER-21: Navigate to the unfinished Operation form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Navigate to the unfinished operation form
    ...
    ...     Precondition:
    ...     - There is an unfinished operation form
    ...
    ...     Test Steps:
    ...     - 1. In the Device ID field, enter a device that already has an unfinished Operation Form
    ...     - 2. Clicks on the "Next" button
    ...
    ...     Expected Results:
    ...     - 1. The web app shall navigate the user back to the unfinished form

    [Tags]    BSP-OD-DIGIT-OPERATION-ENTER-21     manual     FRS-067-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-SCAN-01: Turn off the camera access, then click on the Scan code button
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Turn off the camera access, then click on the Scan code button
    ...
    ...     Precondition:
    ...     - 1. The OM or OS is on the Operation Digitalization page,
    ...     - 2. The Operation form option is selected
    ...
    ...     Test Steps:
    ...     - 1. The user turns off the the camera access,
    ...     - 2: Then click the Scan code button
    ...
    ...     Expected Results:
    ...     - 1.The web app cannot access the camera. There shall be an error message
    ...     “Unable to access the camera. Please check and try again”
    ...     displayed under the Scan code button

    [Tags]    BSP-OD-DIGIT-OPERATION-SCAN-01     manual      FRS-067-01-SPF-2     R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-SCAN-02: Scan for an invalid code
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Scan for an invalid code
    ...
    ...     Precondition:
    ...     - 1. The OM or OS is on The Operation Digitalization page,
    ...     - 2. The Operation form option is selected
    ...     - 3. Turn on the camera access
    ...
    ...     Test Steps:
    ...     - 1. Scan for an invalid code that does not belong to the Bioflux/Biotres device
    ...
    ...     Expected Results:
    ...     - 1.The data scanned from the code shall be entered in the Device ID textbox
    ...     - 2. There shall be an error message “The Code is not valid, please try another code!”
    ...     displayed under the Scan code button

    [Tags]    BSP-OD-DIGIT-OPERATION-SCAN-02     manual      FRS-067-01-SPF-2     R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-SCAN-03: Scan for a valid code
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Scan for a valid code
    ...
    ...     Precondition:
    ...     - 1. Turn on the camera access
    ...     - 2. Click on [Scan] button
    ...
    ...     Test Steps:
    ...     - 1. Scan for an invalid code that does not belong to the Bioflux/Biotres device
    ...
    ...     Expected Results:
    ...     - 1.The device ID shall be displayed in the textbox

    [Tags]    BSP-OD-DIGIT-OPERATION-SCAN-03     manual      FRS-067-01-SPF-2     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-REFURBISH-ENTER-01: Select Refurbished Device option
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Selects Refurbished Device option on the Welcome page
    ...
    ...     Precondition:
    ...     - 1. The OM/OS in on the Welcome page of the Operation Digitalization
    ...
    ...     Test Steps:
    ...     - 1. The user selects Refurbished Device option
    ...     - 2. Observe the Welcome page
    ...
    ...     Expected Results:
    ...     - 1.Text: Welcome! To create a form, please select a form
    ...     - 2. There shall be a “Purpose” section:
    ...     - Operation Form option
    ...     - Refurbished Device option is selected
    ...     - RMA Service Traveler option
    ...     - Old Device ID textbox and Scan code button
    ...     - New Device ID textbox and Scan code button
    ...     - Message “Please make sure device is turned on before proceeding”
    ...     - Next button

    [Tags]    BSP-OD-DIGIT-REFURBISH-ENTER-01     manual     FRS-067-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-REFURBISH-ENTER-02: Enter an invalid Old Device ID, and valid a New Device ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter an invalid Old Device ID, and valid a New Device ID
    ...
    ...     Precondition:
    ...     - 1. The OM/OS in on the Welcome page of the Operation Digitalization
    ...     - 2. The Refurbished Device option is selected
    ...
    ...     Test Steps:
    ...     - 1. Enter an invalid Old Device ID,
    ...     - 2. Enter a valid a New Device ID
    ...     - 3. Clicks on the [Next] button
    ...
    ...     Expected Results:
    ...     - 1.The error message “Invalid device ID” shall be displayed under the Old Device ID field

    [Tags]    BSP-OD-DIGIT-REFURBISH-ENTER-02     manual     FRS-067-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-REFURBISH-ENTER-03: Enter a valid Old Device ID but the device is not assigned to a “test” facility, enter a valid New Device ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a valid Old Device ID but the device is not assigned to a “test” facility,
    ...     enter a valid New Device ID, clicks on the [Next] button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS in on the Welcome page of the Operation Digitalization
    ...     - 2. The Refurbished Device option is selected
    ...
    ...     Test Steps:
    ...     - 1. Enter a valid Old Device ID but the device is not assigned to a “test” facility
    ...     - 2. enter a valid New Device ID
    ...     - 3. Cicks on the [Next] button
    ...
    ...     Expected Results:
    ...     - 1.The error message “Device is not assigned to a Test facility” shall be displayed under the Old Device ID field

    [Tags]    BSP-OD-DIGIT-REFURBISH-ENTER-03     manual     FRS-067-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-REFURBISH-ENTER-04: Enter a valid Old Device ID but the device is running a study and a valid New Device ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a valid Old Device ID but the device is running a study,
    ...     enter a valid New Device ID
    ...
    ...     Precondition:
    ...     - 1. The OM/OS in on the Welcome page of the Operation Digitalization
    ...     - 2. The Refurbished Device option is selected
    ...
    ...     Test Steps:
    ...     - 1. Enter a valid Old Device ID but the device is running a study
    ...     - 2. Enter a valid New Device ID
    ...     - 3. Cicks on the [Next] button
    ...
    ...     Expected Results:
    ...     - 1.The error message “Device <Device ID> currently has an working study!”
    ...     shall be displayed under the Old Device ID field

    [Tags]    BSP-OD-DIGIT-REFURBISH-ENTER-04     manual     FRS-067-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-REFURBISH-ENTER-05: Enter an invalid Old Device ID, an invalid New Device ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter an invalid Old Device ID, enter an invalid New Device ID
    ...
    ...     Precondition:
    ...     - 1. The OM/OS in on the Welcome page of the Operation Digitalization
    ...     - 2. The Refurbished Device option is selected
    ...
    ...     Test Steps:
    ...     - 1. Enter an invalid Old Device ID,
    ...     - 2. Enter an invalid New Device ID
    ...     - 3. Cicks on the [Next] button
    ...
    ...     Expected Results:
    ...     - 1.The error message “Invalid device ID” shall be displayed under the Old Device ID field

    [Tags]    BSP-OD-DIGIT-REFURBISH-ENTER-05     manual     FRS-067-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-REFURBISH-ENTER-06: Enter a valid Old Device ID and new device ID is the same as the old device ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a valid Old Device ID and new device ID is the same as the old device ID
    ...
    ...     Precondition:
    ...     - 1. The OM/OS in on the Welcome page of the Operation Digitalization
    ...     - 2. The Refurbished Device option is selected
    ...
    ...     Test Steps:
    ...     - 1. Enter a valid Old Device ID,
    ...     - 2. Enter new device ID is the same as the old device ID
    ...     - 3. Clicks on the [Next] button
    ...
    ...     Expected Results:
    ...     - 1.There shall be an error message “The new Device ID cannot be the same as the old Device ID.”

    [Tags]    BSP-OD-DIGIT-REFURBISH-ENTER-06     manual     FRS-067-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-REFURBISH-ENTER-07: Enter a valid Old Device ID, the new device ID is the same as an existing device ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a valid Old Device ID, the new device ID is the same as an existing device ID
    ...
    ...     Precondition:
    ...     - 1. The OM/OS in on the Welcome page of the Operation Digitalization
    ...     - 2. The Refurbished Device option is selected
    ...     - 3. The old device is online
    ...
    ...     Test Steps:
    ...     - 1. Enter a valid Old Device ID,
    ...     - 2. Enter the new device ID is the same as an existing device ID
    ...     - 3. Clicks on the [Next] button
    ...
    ...     Expected Results:
    ...     - 1.There shall be an error message “The entered Device ID already exists. Please input another Device ID.”

    [Tags]    BSP-OD-DIGIT-REFURBISH-ENTER-07     manual     FRS-067-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-REFURBISH-ENTER-08: Leave the New Device ID textbox blank
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Leave the New Device ID textbox blank
    ...
    ...     Precondition:
    ...     - 1. The OM/OS in on the Welcome page of the Operation Digitalization
    ...     - 2. The Refurbished Device option is selected
    ...
    ...     Test Steps:
    ...     - 1. Enter a valid Old Device ID,
    ...     - 2. Leave the New Device ID textbox blank
    ...     - 3. Observe the [Next] button
    ...
    ...     Expected Results:
    ...     - 1.The [Next] button shall be disabled

    [Tags]    BSP-OD-DIGIT-REFURBISH-ENTER-08     manual     FRS-067-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-REFURBISH-ENTER-09: Leave the Old Device ID textbox blank,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Leave the Old Device ID textbox blank,
    ...
    ...     Precondition:
    ...     - 1. The OM/OS in on the Welcome page of the Operation Digitalization
    ...     - 2. The Refurbished Device option is selected
    ...
    ...     Test Steps:
    ...     - 1. Enter a valid new Device ID,
    ...     - 2. Leave the Old Device ID textbox blank
    ...     - 3. Observe the [Next] button
    ...
    ...     Expected Results:
    ...     - 1.The [Next] button shall be disabled

    [Tags]    BSP-OD-DIGIT-REFURBISH-ENTER-09     manual     FRS-067-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-REFURBISH-ENTER-10: Valid Old Device ID and this device is not online
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Valid Old Device ID and this device is not online
    ...
    ...     Precondition:
    ...     - 1. The OM/OS in on the Welcome page of the Operation Digitalization
    ...     - 2. The Refurbished Device option is selected
    ...
    ...     Test Steps:
    ...     - 1. Enter a valid Old Device ID and this device is not online
    ...     - 2. Enter an invalid New Device ID
    ...     - 3. Click on [Next] button
    ...
    ...     Expected Results:
    ...     - 1.There shall be a modal with the message “Unable to proceed as the device is Offline.
    ...     Please turn on the device and try again.”, with a confirmation button to exit the modal

    [Tags]    BSP-OD-DIGIT-REFURBISH-ENTER-10     manual     FRS-067-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-REFURBISH-ENTER-11: Enter a valid old device ID and a valid new device ID (Biolfux device)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a valid old device ID and a valid new device ID (Bioflux device)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS in on the Welcome page of the Operation Digitalization
    ...     - 2. The Refurbished Device option is selected
    ...
    ...     Test Steps:
    ...     - 1. Enter an Old Device ID (Bioflux device) that meets all conditions
    ...     - 2. Enter a valid New Device ID that meets all condition
    ...     - 3. Click on [Next] button
    ...
    ...     Expected Results:
    ...     - 1.The device ID inputted in “Old Device ID” shall have its Device ID changed to the device ID inputted
    ...     in “New Device ID”, as well as reset the device lifetime on the Admin Portal
    ...     - 2. The old device ID shall be unusable and move to the “Retired” tab on the Admin Portal
    ...     - 3. The user shall be navigated to the Operation Forms (Form FT-1306-2).

    [Tags]    BSP-OD-DIGIT-REFURBISH-ENTER-11     manual     FRS-067-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-REFURBISH-ENTER-12: Enter a valid old device ID and a valid new device ID (Biotres device)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a valid old device ID and a valid new device ID (Biotres device)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS in on the Welcome page of the Operation Digitalization
    ...     - 2. The Refurbished Device option is selected
    ...
    ...     Test Steps:
    ...     - 1. Enter an Old Device ID (Biotres device) that meets all conditions
    ...     - 2. Enter a valid New Device ID that meets all condition
    ...     - 3. Click on [Next] button
    ...
    ...     Expected Results:
    ...     - 1.The device ID inputted in “Old Device ID” shall have its Device ID changed to the device ID inputted
    ...     in “New Device ID”, as well as reset the device lifetime on the Admin Portal
    ...     - 2. The old device ID shall be unusable and move to the “Retired” tab on the Admin Portal
    ...     - 3. The user shall be navigated to the Operation Forms (Form FT-1306-7).

    [Tags]    BSP-OD-DIGIT-REFURBISH-ENTER-12     manual     FRS-067-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-REFURBISH-SCAN-01: Turn off the camera access, then click on the Scan code button (Old device text box)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Turn off the camera access, then click on the Scan code button (Old device text box)
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is on the Welcome page
    ...     - 2. There are devices that contains the Data Matrix code
    ...
    ...     Test Steps:
    ...     - 1. The user turns off the the camera access,
    ...     - 2. Click on the Scan code button next to the Old device text box
    ...
    ...     Expected Results:
    ...     - 1.The web app cannot access the camera. There shall be an error message
    ...     “Unable to access the camera. Please check and try again”
    ...     displayed under the Scan code button

    [Tags]    BSP-OD-DIGIT-REFURBISH-SCAN-01     manual      FRS-067-01-SPF-2     R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-REFURBISH-SCAN-02: Turn off the camera access, then click on the Scan code button (New device text box)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Turn off the camera access, then click on the Scan code button (New device text box)
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is on the Welcome page
    ...     - 2. There are devices that contains the Data Matrix code
    ...
    ...     Test Steps:
    ...     - 1. The user turns off the the camera access,
    ...     - 2. Click the Scan code button next to the New device text box
    ...
    ...     Expected Results:
    ...     - 1.The web app cannot access the camera. There shall be an error message
    ...     “Unable to access the camera. Please check and try again”
    ...     displayed under the Scan code button

    [Tags]    BSP-OD-DIGIT-REFURBISH-SCAN-02     manual      FRS-067-01-SPF-2     R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-REFURBISH-SCAN-03: Unblock the camera access, then click the Scan code button next to Old device text box
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Unblock the camera access, then click the Scan code button next to Old device text box
    ...
    ...     Precondition:
    ...     - 1. Block the camera
    ...
    ...     Test Steps:
    ...     - 1. Unblock the camera access, then click the Scan code button next to Old device text box
    ...
    ...     Expected Results:
    ...     - 1.There shall be a camera opened and a [Close] button displayed

    [Tags]    BSP-OD-DIGIT-REFURBISH-SCAN-03     manual      FRS-067-01-SPF-2     R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-REFURBISH-SCAN-04: Turn on the camera access then close the camera
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Turn on the camera access then close the camera
    ...
    ...     Precondition:
    ...     - 1. Turn on the camera access
    ...
    ...     Test Steps:
    ...     - 1. Click the [Close] button
    ...
    ...     Expected Results:
    ...     - 1.The camera shall be turned off and bring back the Scan code button

    [Tags]    BSP-OD-DIGIT-REFURBISH-SCAN-04     manual      FRS-067-01-SPF-2     R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-REFURBISH-SCAN-05: Click on the Scan code button next to the "Old device" text box, scan for an invalid code that does not belong to the Bioflux/Biotres device
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click on the Scan code button next to the "Old device" text box,
    ...     scan for an invalid code that does not belong to the Bioflux/Biotres device
    ...
    ...     Precondition:
    ...     - 1. Turn on the camera access
    ...
    ...     Test Steps:
    ...     - 1. Click on the Scan code button next to Old device text box
    ...     - 2. Scan for an invalid code that does not belong to the Bioflux/Biotres device
    ...
    ...     Expected Results:
    ...     - 1.The data scanned from the code shall be entered in the Device ID text box
    ...     - 2.There shall be an error message “The Code is not valid,
    ...     please try another code!” displayed under the Scan code button

    [Tags]    BSP-OD-DIGIT-REFURBISH-SCAN-05     manual      FRS-067-01-SPF-2     R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-REFURBISH-SCAN-06: Click on the Scan code button next to the "New device" text box, scan for an invalid code that does not belong to the Bioflux/Biotres device
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click on the Scan code button next to the "New device" text box,
    ...     scan for an invalid code that does not belong to the Bioflux/Biotres device
    ...
    ...     Precondition:
    ...     - 1. Turn on the camera access
    ...
    ...     Test Steps:
    ...     - 1. Click on the Scan code button next to Old device text box
    ...     - 2. Scan for an invalid code that does not belong to the Bioflux/Biotres device
    ...
    ...     Expected Results:
    ...     - 1.The data scanned from the code shall be entered in the Device ID text box
    ...     - 2.There shall be an error message “The Code is not valid,
    ...     please try another code!” displayed under the Scan code button

    [Tags]    BSP-OD-DIGIT-REFURBISH-SCAN-06     manual      FRS-067-01-SPF-2     R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-REFURBISH-SCAN-07: Scan for an invalid Old Device ID and a valid a New Device ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Scan for an invalid Old Device ID and a valid a New Device ID
    ...
    ...     Precondition:
    ...     - 1. Turn on the camera access
    ...
    ...     Test Steps:
    ...     - 1. Scan for an invalid Old Device ID,
    ...     - 2. Scan for a valid a New Device ID,
    ...     - 3. Clicks on the [Next] button
    ...
    ...     Expected Results:
    ...     - 1.The error message “Invalid device ID” shall be displayed under the Old Device ID field

    [Tags]    BSP-OD-DIGIT-REFURBISH-SCAN-07     manual      FRS-067-01-SPF-2     R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-ENTER-01: Observe the Welcome page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Welcome page
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Welcome page
    ...
    ...     Test Steps:
    ...     - 1. Observe the Welcome pagen
    ...
    ...     Expected Results:
    ...     - 1. Text: Welcome! To create a form, please select a form.
    ...     - 2. There shall be a “Purpose” section:
    ...     - Operation Form option
    ...     - Refurbished Device option
    ...     - RMA Service Traveler option is selected
    ...     - 3. Device ID text box option
    ...     - 4. Scan code button
    ...     - 5. Next button: This button shall be disabled until data is entered in the Device ID text box

    [Tags]    BSP-OD-DIGIT-TRAVELER-ENTER-01     manual     FRS-067-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-ENTER-02: Enter a device ID that does not belong to any In-process” RMA ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a device ID that does not belong to any In-process” RMA ticket
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Welcome page
    ...
    ...     Test Steps:
    ...     - 1. Enter a device ID that does not belong to any In-process” RMA ticket
    ...     - 2. Click on [Next] button
    ...     - 3. The user clicks on the [Okay] button displayed in the pop-up
    ...
    ...     Expected Results:
    ...     - 1. There shall be a message to notify the user “The Device ID does not belong to any Processing RMA ticket,
    ...     please double-check with the list of devices on the RMA ticket or contact with the Operation Manager”
    ...     with a [Okay] button
    ...     - 2. The pop-up shall be closed

    [Tags]    BSP-OD-DIGIT-TRAVELER-ENTER-02     manual     FRS-067-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-ENTER-03: Enter a device ID that belongs to an In-process” RMA ticket, but that device is marked as received
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a device ID that belongs to an In-process” RMA ticket, but that device is marked as received
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Welcome page
    ...
    ...     Test Steps:
    ...     - 1. Enter a device ID that belongs to an In-process” RMA ticket,
    ...    but that device is marked as received
    ...     - 2. Click on [Next] button
    ...     - 3. The user clicks on the [Okay] button displayed in the pop-up
    ...
    ...     Expected Results:
    ...     - 1. There shall be a message to notify the user “The Device ID does not belong to any Processing RMA ticket,
    ...     - please double-check with the list of devices on the RMA ticket or contact with the Operation Manager”
    ...     - with a [Okay] button
    ...     - 2. The pop-up shall be closed

    [Tags]    BSP-OD-DIGIT-TRAVELER-ENTER-03     manual     FRS-067-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-ENTER-04: Enter a device ID that belongs to an “In-process” RMA ticket and isn’t marked as received,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a device ID that belongs to an “In-process” RMA ticket and isn’t marked as received,
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Welcome page
    ...
    ...     Test Steps:
    ...     - 1. Enter a device ID that belongs to an “In-process” RMA ticket, and isn’t marked as received,
    ...     - 2. Click on [Next] button
    ...
    ...     Expected Results:
    ...     - 1. The user shall be navigated to the RMA Traveler form

    [Tags]    BSP-OD-DIGIT-TRAVELER-ENTER-04     manual     FRS-067-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-ENTER-05: Enter an invalid device ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter an invalid device ID
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Welcome page
    ...
    ...     Test Steps:
    ...     - 1. Enter a device ID that has incorrect format
    ...     - 2. Click on [Next] button
    ...
    ...     Expected Results:
    ...     - 1.Error message "Invalid device ID"

    [Tags]    BSP-OD-DIGIT-TRAVELER-ENTER-05     manual     FRS-067-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-EDITBIOFLUX-01: Observe the Operation Form for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Operation Form for Bioflux device model
    ...
    ...     Precondition: The OS or OM is on the Operation Forms page of the Bioflux device model
    ...
    ...     Test Steps:
    ...     - 1. Observe the information displayed in the header of the Operation Forms page
    ...     - 2. Observe the information displayed in the form
    ...     - 3. Observe the bottom of the page
    ...
    ...     Expected Results:
    ...     - 1. The header section shall display the following information:
    ...     - Device ID: must be the device ID inputted in the welcome page
    ...     - [Close]/[Back] button
    ...     - 2. The form shall contain the following eight steps:
    ...     - Install SIM card | WI-1306-1
    ...     - Update Carrier Web Portal | WI-1306-1
    ...     - Install Firmware | WI-1306-2
    ...     - Set Device ID | WI-1306-3
    ...     - Check Cellular Signal | WI-1306-1
    ...     - Perform Functional Test | WI-1306-4
    ...     - Charge Battery | WI-1306-1
    ...     - Package Device | WI-1306-1
    ...     - 3. There shall be a Notes text box for the user to add additional notes to the form.

    [Tags]    BSP-OD-DIGIT-OPERATION-EDITBIOFLUX-01    manual     FRS-069-01-SPF-1     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-EDITBIOFLUX-02: Edit the operation form of the Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Operation Form of the Bioflux device model
    ...
    ...
    ...     Precondition:
    ...     - 1.The Operation Staff or Operation Manager is on the Operation Forms page of the Bioflux device model
    ...     - 2.The user has completed all steps of the form but has not submitted it
    ...
    ...     Test Steps:
    ...     - 1. Observe the fields where the user can edit the information
    ...
    ...     Expected Results:
    ...     - 1. There shall be an Edit button displayed in step 1 (Install SIM Card)
    ...     and step 6 (Perform Functional Test)

    [Tags]    BSP-OD-DIGIT-OPERATION-EDITBIOFLUX-02   FRS-069-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-EDITBIOFLUX-03: Observe the the information in step 1 (Bioflux device model)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the the information in step 1 (Bioflux device model)
    ...
    ...     Precondition:
    ...     - 1.The Operation Staff or Operation Manager is on the Operation Forms page of the Bioflux device model
    ...     - 2.The user has completed all steps of the form but has not submitted it
    ...
    ...     Test Steps:
    ...     - 1. Click the Edit button in step 1 (Install SIM Card)
    ...     - 2. Observe step 1

    ...     Expected Results:
    ...     - 1. The details of the step shall be displayed.
    ...     and the Update button shall be disabled until there are changes in any field

    [Tags]    BSP-OD-DIGIT-OPERATION-EDITBIOFLUX-03   FRS-069-01    manual      R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-EDITBIOFLUX-04: Edit step 1 (Bioflux device model)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit step 1
    ...
    ...     Precondition:
    ...     - 1.The Operation Staff or Operation Manager is on the Operation Forms page of the Bioflux device model
    ...     - 2.The user has completed all steps of the form but has not submitted it
    ...
    ...     Test Steps:
    ...     - 1. Click the Edit button in step 1 (Install SIM Card)
    ...     - 2. Edit the information in any field, then click the Update button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed, and the task completed log shall be updated
    ...     - 2. There shall be a message displaying “Task completed by <user’s full name>
    ...     on <date & time in MM/DD/YYYY at 24-hour format> instead

    [Tags]    BSP-OD-DIGIT-OPERATION-EDITBIOFLUX-04   FRS-069-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-EDITBIOFLUX-05: Observe the the information in step 6 (Bioflux device model)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the the information in step 6 (Bioflux device model)
    ...
    ...     Precondition:
    ...     - 1.The Operation Staff or Operation Manager is on the Operation Forms page of the Bioflux device model
    ...     - 2.The user has completed all steps of the form but has not submitted it
    ...
    ...     Test Steps:
    ...     - 1. Click the Edit button in step 6 (Perform Functional Test)
    ...     - 2. Observe step 6
    ...
    ...     Expected Results:
    ...     - 1.The details of the step shall be displayed.
    ...     and the Update button shall be disabled until there are changes in any field

    [Tags]    BSP-OD-DIGIT-OPERATION-EDITBIOFLUX-05   FRS-069-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-EDITBIOFLUX-06: Edit step 6 (Bioflux device model)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit step 6
    ...
    ...     Precondition:
    ...     - 1.The Operation Staff or Operation Manager is on the Operation Forms page of the Bioflux device model
    ...     - 2.The user has completed all steps of the form but has not submitted it
    ...
    ...     Test Steps:
    ...     - 1. Edit the information in any field, then click the Update button
    ...
    ...     Expected Results:
    ...     - 1.If the user enters an invalid Study ID, there shall be an error message “Invalid Study ID. Please check again.”
    ...     - 2.If the user enters with valid information, The step shall be automatically collapsed, and the task completed log shall be updated
    ...     - 3.There shall be a message displaying “Task completed by <user’s full name> > on <date & time in MM/DD/YYYY at 24-hour format> instead

    [Tags]    BSP-OD-DIGIT-OPERATION-EDITBIOFLUX-06   FRS-069-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-EDITBIOFLUX-07: Edit the note in the note textbox. (Bioflux device model)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the note in the note textbox.
    ...
    ...     Precondition:
    ...     - 1.The Operation Staff or Operation Manager is on the Operation Forms page of the Bioflux device model
    ...     - 2.The user has completed all steps of the form but has not submitted it
    ...
    ...     Test Steps:
    ...     - 1.In the Notes text box, edit note
    ...
    ...     Expected Results:
    ...     - 1.The text should be automatically updated when user clicks outside the text box

    [Tags]    BSP-OD-DIGIT-OPERATION-EDITBIOFLUX-07   FRS-069-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-CLOSEBIOFLUX-01: Close the operation form in the case all steps have been completed (Bioflux device model)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Close the operation form in the case all steps have been completed
    ...
    ...     Precondition:
    ...     - 1.The Operation Staff or Operation Manager has completed all steps on the Operation Form
    ...
    ...     Test Steps:
    ...     - 1.Click on the [Back] button
    ...
    ...     Expected Results:
    ...     - 1.Upon clicking this button, the user will be redirected to the Welcome page,
    ...     with the previously entered Device ID still maintained on the “Device ID” text field,
    ...     and none of the progress will be lost

    [Tags]    BSP-OD-DIGIT-OPERATION-CLOSEBIOFLUX-01   FRS-069-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-CLOSEBIOFLUX-02: Close the form in the case a step is being edited without selecting the Update button (Bioflux device model)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Close the form in the case a step is being edited without selecting the Update button
    ...
    ...     Precondition:
    ...     - 1.The step is being edited without selecting the Update button
    ...
    ...     Test Steps:
    ...     - 1.Click on the [Back] button
    ...     - 2. On the pop-up window, select the option Yes
    ...     - 3. On the pop-up window, select the option No

    ...     Expected Results:
    ...     - 1.There shall be a pop-up window with the message “You have unsaved changes.
    ...     Are you sure you want to close the form?” and 2 options (Yes, No)
    ...     - 2. The form will be closed without the changes
    ...     - 3. The pop-up window will close, and the user will not be redirected.
    ...     The unsaved section will be automatically expanded if it was previously collapsed

    [Tags]    BSP-OD-DIGIT-OPERATION-CLOSEBIOFLUX-02   FRS-069-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-EDITBIOTRES-01.1: Observe the Operation Form for Biotres device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Operation Form for Biotres device model
    ...
    ...     Precondition: The OS or OM is on the Operation Forms page of the Biotres device model
    ...
    ...     Test Steps:
    ...     - 1. Observe the information displayed in the header of the Operation Forms page
    ...     - 2. Observe the information displayed in the form
    ...     - 3. Observe the bottom of the page
    ...
    ...     Expected Results:
    ...     - 1. The header section shall display the following information:
    ...     - Device ID
    ...     - [Back] button
    ...     - 2. The form shall contain the following eight steps:
    ...     - Install Firmware | WI-1306-15
    ...     - Set Device ID | WI-1306-16
    ...     - Perform Functional Test | WI-1306-17
    ...     - Charge Battery | WI-1306-14
    ...     - Packages Device | WI-1306-14
    ...     - 3. There shall be a Notes text box for the user to add additional notes to the form.

    [Tags]    BSP-OD-DIGIT-OPERATION-EDITBIOTRES-01.1   FRS-069-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-EDITBIOTRES-01: Edit the operation form of the Biotres device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Operation Form of the Biotres device model
    ...
    ...     Precondition:
    ...     - 1.The Operation Staff or Operation Manager is on the Operation Forms page of the Biotres device model
    ...     - 2.The user has completed all steps of the form but has not submitted it
    ...
    ...     Test Steps:
    ...     - 1. Observe the fields where the user can edit the information
    ...
    ...     Expected Results:
    ...     - 1. In step 3, there should be an Edit button. (Perform Functional Test)

    [Tags]    BSP-OD-DIGIT-OPERATION-EDITBIOTRES-01   FRS-069-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-EDITBIOTRES-02: Observe the the information in step 3 (Biotres device model)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the the information in step 3 (Biotres device model)
    ...
    ...     Precondition:
    ...     - 1.The Operation Staff or Operation Manager is on the Operation Forms page of the Biotres device model
    ...     - 2.The user has completed all steps of the form but has not submitted it
    ...
    ...     Test Steps:
    ...     - 1. Click the Edit button in step 3 (Perform Functional Test)
    ...     - 2. Observe step 3
    ...
    ...     Expected Results:
    ...     - 1.The details of the step shall be displayed.
    ...     and the Update button shall be disabled until there are changes in any field

    [Tags]    BSP-OD-DIGIT-OPERATION-EDITBIOTRES-02   FRS-069-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-EDITBIOTRES-03: Edit step 3 (Biotres device model)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit step 3
    ...
    ...     Precondition:
    ...     - 1.The Operation Staff or Operation Manager is on the Operation Forms page of the Biotres device model
    ...     - 2.The user has completed all steps of the form but has not submitted it
    ...
    ...     Test Steps:
    ...     - 1. Edit the information in any field, then click the Update button
    ...
    ...     Expected Results:
    ...     - 1.If the user enters an invalid Study ID, there shall be an error message “Invalid Study ID. Please check again.”
    ...     - 2.If the user enters with valid information, The step shall be automatically collapsed, and the task completed log shall be updated
    ...     - 3.There shall be a message displaying “Task completed by <user’s full name> > on <date & time in MM/DD/YYYY at 24-hour format> instead

    [Tags]    BSP-OD-DIGIT-OPERATION-EDITBIOTRES-03   FRS-069-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-EDITBIOTRES-04: Edit the note in the note textbox. (Biotres device model)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the note in the note textbox.
    ...
    ...     Precondition:
    ...     - 1.The Operation Staff or Operation Manager is on the Operation Forms page of the Biotres device model
    ...     - 2.The user has completed all steps of the form but has not submitted it
    ...
    ...     Test Steps:
    ...     - 1.In the Notes text box, edit note
    ...
    ...     Expected Results:
    ...     - 1.TThe text should be automatically updated when user clicks outside the text box

    [Tags]    BSP-OD-DIGIT-OPERATION-EDITBIOTRES-04   FRS-069-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-EDITBIOTRES-05: Close the operation form in the case all steps have been completed (Bioflux device model)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Close the operation form in the case all steps have been completed
    ...
    ...     Precondition:
    ...     - 1.The Operation Staff or Operation Manager has completed all the steps on the Operation Form
    ...
    ...     Test Steps:
    ...     - 1.Click on the [Back] button
    ...
    ...     Expected Results:
    ...     - 1.Upon clicking this button, the user will be redirected to the Welcome page,
    ...     with the previously entered Device ID still maintained on the “Device ID” text field,
    ...     and none of the progress will be lost

    [Tags]    BSP-OD-DIGIT-OPERATION-EDITBIOTRES-05   FRS-069-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-EDITBIOTRES-06:Close the form in the case a step is being edited without selecting the Update button (Biotres device model)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Close the form in the case a step is being edited without selecting the Update button
    ...
    ...     Precondition:
    ...     - 1.The step is being edited without selecting the Update button
    ...
    ...     Test Steps:
    ...     - 1.Click on the [Back] button
    ...     - 2. On the pop-up window, select the option Yes
    ...     - 3. On the pop-up window, select the option No
    ...
    ...     Expected Results:
    ...     - 1.There shall be a pop-up window with the message “You have unsaved changes.
    ...     Are you sure you want to close the form?” and 2 options (Yes, No)
    ...     - 2. The form will be closed without saving changes
    ...     - 3. The pop-up window will close, and the user will not be redirected.
    ...     The unsaved section will be automatically expanded if it was previously collapsed

    [Tags]    BSP-OD-DIGIT-OPERATION-EDITBIOTRES-06   FRS-069-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-COMPLETE-01: Complete a Form in the case all steps have been completed (Biotflux device model)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Complete a Form in the case all steps have been completed
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager has completed all the steps
    ...     - 2. The device model is Biolfux
    ...
    ...     Test Steps:
    ...     - 1.Click on the Submit button
    ...
    ...     Expected Results:
    ...     - 1.The user shall be navigated to the Welcome page
    ...     - 2. There is a message at the bottom of the screen: “The form has been sent successfully”

    [Tags]    BSP-OD-DIGIT-OPERATION-COMPLETE-01    manual     FRS-070-01-SPF-2     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-COMPLETE-02: In the case a step is being edited without selecting the Update button (Bioflux device model)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case a step is being edited without selecting the Update button
    ...
    ...     Precondition:
   ...      - 1. The Operation Staff or Operation Manager is on the Operation Form
    ...     - 2. Device model is Biotres
    ...
    ...     Test Steps:
    ...     - 1.Edit the information in any field, then click the Submit button
    ...     - 2.On the pop-up window, select “Yes”
    ...     - 3.On the pop-up window, select “No”
    ...
    ...     Expected Results:
    ...     - 1.There shall be a pop-up window with the message “You have unsaved changes.
    ...     Are you sure you want to submit the form?” and 2 options (Yes, No)
    ...     - 2. The form will be submitted without the changes
    ...     - 3. The pop-up window will close, and the form will not be submitted.
    ...     The unsaved section will be automatically expanded if it was previously collapsed

    [Tags]    BSP-OD-DIGIT-OPERATION-COMPLETE-02    manual     FRS-070-01-SPF-1     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-COMPLETE-03: Complete a Form in the case all steps have been completed (Biotres device model)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Complete a Form in the case all steps have been completed
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager has completed all the steps
    ...     - 2. The device model is Biotres
    ...
    ...     Test Steps:
    ...     - 1.Click on the Submit button
    ...
    ...     Expected Results:
    ...     - 1.The user shall be navigated to the Welcome page
    ...     - 2. There is a message at the bottom of the screen: “The form has been sent successfully”

    [Tags]    BSP-OD-DIGIT-OPERATION-COMPLETE-03    manual     FRS-070-01-SPF-2     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-COMPLETE-04: In the case a step is being edited without selecting the Update button (Biotres device model)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the case a step is being edited without selecting the Update button
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is on the Operation Form
    ...     - 2. Device model is Biotres
    ...
    ...     Test Steps:
    ...     - 1.Edit the information in any field, then click the Submit button
    ...     - 2.On the pop-up window, select “Yes”
    ...     - 3.On the pop-up window, select “No”
    ...
    ...     Expected Results:
    ...     - 1.There shall be a pop-up window with the message “You have unsaved changes.
    ...     Are you sure you want to submit the form?” and 2 options (Yes, No)
    ...     - 2. The form will be submitted without the changes
    ...     - 3. The pop-up window will close, and the form will not be submitted.
    ...     The unsaved section will be automatically expanded if it was previously collapsed

    [Tags]    BSP-OD-DIGIT-OPERATION-COMPLETE-04    manual     FRS-070-01-SPF-1     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-01: Observe the information displayed in step 1, Form FT-1306-2 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the information displayed in step 1
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 1
    ...
    ...     Test Steps:
    ...     - 1.Observe the information displayed in step 1 (Install Sim Card | WI-1306-1)
    ...
    ...     Expected Results:
    ...     - 1.The following information shall be displayed:
    ...     - [Get info] button
    ...     - SIM card serial number text box
    ...     - SIM card carrier field
    ...     - Complete button

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-01   FRS-69-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-02: Click on [Get Infor] button in step 1, Form FT-1306-2 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: [Get Infor] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 1
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the [Get Infor] button
    ...
    ...     Expected Results:
    ...     - 1.The web app shall get the last SIM card information to display
    ...     - 2. If the carrier is not matched with the list above,
    ...     it shall display “Other” option with the text box that is automatically filled out the carrier’s name.
    ...     The text box cannot be empty.

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-02   FRS-69-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-03: Enters data in the SIM card serial number in step 1, Form FT-1306-2 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user enters data in the SIM card serial number
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 1
    ...
    ...     Test Steps:
    ...     - 1.In the case there is no sim card information displayed when clicks on the [Get Info] button.
    ...     The user enters data in the SIM card serial number
    ...
    ...     Expected Results:
    ...     - 1.The entered data shall be displayed

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-03   FRS-69-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-04: Select a option from the “Current SIM card carrier” drop down list
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select a option from the “Current SIM card carrier” drop down list
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 1
    ...
    ...     Test Steps:
    ...     - 1.In the case there is no sim card information displayed when clicks on the [Get Info] button.
    ...     The user clicks on the “Current SIM card carrier” field, observe the drop down list
    ...     - 2. The user selects an option from the list
    ...     - 3. The user selects “Other” option
    ...
    ...     Expected Results:
    ...     - 1.There shall be a drop-down list displayed:
    ...     - AT&T
    ...     - T-Mobile
    ...     - Kore
    ...     - ROGERS
    ...     - Movistar
    ...     - Other
    ...     - 2.The option shall be selected and displayed in the file
    ...     - 3. It shall display “Other” option with the text box that is automatically filled out the carrier’s name.
    ...     The text box cannot be empty

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-04   FRS-69-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-05: Complete step 1 in the Form FT-1306-2 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager fills out all required fields in step 1
    ...
    ...     Test Steps:
    ...     - 1.Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed, and the user shall be redirected to step 2 (Update Carrier Web Portal)
    ...     - 2. There shall be a task completed log with the message “Task completed by <user’s full name>
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step
    ...     The Complete button shall be replaced with the Edit button

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-05   FRS-69-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-06: Observe the information displayed in step 2, Form FT-1306-2 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the information displayed in step 2
    ...
    ...     Precondition: The Operation Staff or Operation Manager completed step 1
    ...
    ...     Test Steps:
    ...     - 1.Observe the information displayed in step 2 (Update Carrier Web Portal| WI-1306-1)
    ...
    ...     Expected Results:
    ...     - 1.The following information shall be displayed:
    ...     - Message “Confirm web portal is updated”
    ...     - Complete button: This button is always enabled

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-06   FRS-69-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-07: Complete step 2 in the Form FT-1306-2 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 2
    ...
    ...     Test Steps:
    ...     - 1.Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed, and the user shall be redirected to step 3 (Install Firmware)
    ...     - 2. There shall be a task completed log with the message “Task completed by <user’s full name>
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-07   FRS-69-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-08: Observe the information displayed in step 3, Form FT-1306-2 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the information displayed in step 3
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 3
    ...
    ...     Test Steps:
    ...     - 1.Observe the information displayed in step 3 (Install Firmware| WI-1306-2)
    ...     - 2.Check the latest version number
    ...
    ...     Expected Results:
    ...     - 1.The following information shall be displayed:
    ...     - Message “Confirm Version #: <latest version number> is installed”
    ...     - Complete button: this button is always enabled

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-08   FRS-69-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-09: Complete step 3 in the Form FT-1306-2 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 3
    ...
    ...     Test Steps:
    ...     - 1.Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed, and the user shall be redirected to step 4 (Set Device ID)
    ...     - 2. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-09   FRS-69-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-10: Observe the information displayed in step 4, Form FT-1306-2 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the information displayed in step 4
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 4
    ...
    ...     Test Steps:
    ...     - 1.Observe the information displayed in step 4 (Set Device ID| WI-1306-3)
    ...
    ...     Expected Results:
    ...     - 1.The following information shall be displayed:
    ...     - Message “Confirm Device ID is set”
    ...     - Complete button: This button is always enabled

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-10   FRS-69-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-11: Complete step 4 in the Form FT-1306-2 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 4
    ...
    ...     Test Steps:
    ...     - 1.Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed, and the user shall be redirected to step 5
    ...     - 2. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-11   FRS-69-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-12: Observe the information displayed in step 5, Form FT-1306-2 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the information displayed in step 5
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 5
    ...
    ...     Test Steps:
    ...     - 1.Observe the information displayed in step 5 (Check Cellular Signal| WI-1306-1)
    ...
    ...     Expected Results:
    ...     - 1.The following information shall be displayed:
    ...     - Message “Confirm network and signal strength is displayed”
    ...     - Complete button: This button is always enabled

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-12   FRS-69-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-13: Complete step 5 in the Form FT-1306-2 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 5
    ...
    ...     Test Steps:
    ...     - 1.Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed, and the user shall be redirected to step 6
    ...     - 2. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-13   FRS-69-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-14: Observe the information displayed in step 6, Form FT-1306-2 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the information displayed in step 6
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 6
    ...
    ...     Test Steps:
    ...     - 1.Observe the information displayed in step 6 (Perform Functional Test| WI-1306-4)
    ...
    ...     Expected Results:
    ...     - 1.The following information shall be displayed:
    ...     - Study ID (The most recently ran Study ID for the Device ID will be automatically inputted in this field)
    ...     - Simulator ID
    ...     - Test result
    ...     - Complete button: this button is disabled until all section is filled with valid information.

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-14   FRS-69-01    manual     FRS-069-01-SPF-3    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-15: Enter an invalid device ID in step 6, Form FT-1306-2 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter an invalid device ID
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 6
    ...
    ...     Test Steps:
    ...     - 1.In the Study ID field, enter an invalid study ID
    ...
    ...     Expected Results:
    ...     - 1.There shall be an error message “Invalid Study ID. Please check again.”

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-15   FRS-69-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-16: Input data in the Simulator ID in step 6, Form FT-1306-2 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the Simulator ID field, input data in the Simulator ID
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 6
    ...
    ...     Test Steps:
    ...     - 1.In the Simulator ID field, input data in the Simulator ID
    ...
    ...     Expected Results:
    ...     - 1.The entered text shall be displayed

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-16   FRS-69-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-17: Input the Simulator ID in step 6, Form FT-1306-2 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Input the Simulator ID
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 6
    ...
    ...     Test Steps:
    ...     - 1.In the Simulator ID field, input data in the Simulator ID
    ...
    ...     Expected Results:
    ...     - 1.The entered data shall be displayed

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-17   FRS-69-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-18: Select "Test result" in step 6, Form FT-1306-2 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select Test result
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 6
    ...
    ...     Test Steps:
    ...     - 1.In the Test result field, select one of 2 options (Pass, Fail)
    ...
    ...     Expected Results:
    ...     - 1.The selected option shall be displayed

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-18   FRS-69-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-19: Complete step 6 in the Form FT-1306-2 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 6
    ...     - 2. In the Study field, enter a valid study ID (Test Study with the ID must have a ‘Done’ status)
    ...
    ...     Test Steps:
    ...     - 1.Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed, and the user shall be redirected to step 6
    ...     - 2. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-19   FRS-69-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-20: Observe the information displayed in step 7, Form FT-1306-2 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the information displayed in step 7
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 7
    ...
    ...     Test Steps:
    ...     - 1.Observe the information displayed in step 7 (Charge Battery| WI-1306-1)
    ...
    ...     Expected Results:
    ...     - 1.The following information shall be displayed:
    ...     - -Message “Confirm battery is charged”
    ...     - Complete button: This button is always enabled

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-20   FRS-69-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-21: Complete step 7 in the Form FT-1306-2 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 7
    ...
    ...     Test Steps:
    ...     - 1.Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed, and the user shall be redirected to step 8
    ...     - 2. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-21   FRS-69-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-22: Observe the information displayed in step 8, Form FT-1306-2 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the information displayed in step 8
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 8
    ...
    ...     Test Steps:
    ...     - 1.Observe the information displayed in step 8 (Package Device| WI-1306-1)
    ...
    ...     Expected Results:
    ...     - 1.The following information shall be displayed:
    ...     - -Message “Confirm device is packaged per WI”
    ...     - Complete button: This button is always enabled

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-22   FRS-69-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-23: Complete step 8 in the Form FT-1306-2 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 8
    ...
    ...     Test Steps:
    ...     - 1.Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed
    ...     - 2. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-23   FRS-69-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-24: Input note in the Form FT-1306-2 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Input text into Notes text box
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Form FT-1306-2
    ...
    ...     Test Steps:
    ...     - 1.Input text into Notes text box
    ...
    ...     Expected Results:
    ...     - 1.The entered text should be displayed

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-24   FRS-69-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOFLUX-25: Mark as Faulty
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Mark as Faulty
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Form FT-1306-2
    ...
    ...     Test Steps:
    ...     - 1. Complete any step in form
    ...     - 2. Click on [Mark as Faulty] button
    ...     - 3. Click on [Confirm] button on the confirmation popup
    ...     - 4. Click on [Cancel] button on the confirmation popup
    ...
    ...     Expected Results:
    ...     - 2. Display confirmation popup contains 2 options [Confirm], [Cancel]
    ...     - 3. The form shall be submitted with the step after the last completed step is "This device is mark faulty"
    ...     - 4. The popup window will close

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOFLUX-25   RS-69-01    manual   SC-1.14.0    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOTRES-01: Observe step 1 in the Form FT-1306-7 for Bioflux device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the information displayed in step 1
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 1
    ...
    ...     Test Steps:
    ...     - 1.Observe the information displayed in step step 1 (Install Firmware)
    ...     - 2. Check the latest version number
    ...
    ...     Expected Results:
    ...     - 1.The following information shall be displayed:
    ...     - -Message “Confirm Version #: <latest version number> is installed”
    ...     - Complete button: This button is always enabled

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOTRES-01   FRS-69-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOTRES-02: Complete step 1 in the Form FT-1306-7 for Biotres device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 1
    ...
    ...     Test Steps:
    ...     - 1.Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed, and the user shall be redirected to step 2 (Set Device ID)
    ...     - 2. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOTRES-02   FRS-69-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOTRES-03: Observe step 2 in the Form FT-1306-7 for Biotres device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the information displayed in step 2
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 2
    ...
    ...     Test Steps:
    ...     - 1.Observe the information displayed in step step 2 (Set Device ID)
    ...
    ...     Expected Results:
    ...     - 1.The following information shall be displayed:
    ...     - -Message “Confirm Device ID is set”
    ...     - Complete button: This button is always enabled

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOTRES-03   FRS-69-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOTRES-04: Complete step 2 in the Form FT-1306-7 for Biotres device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 2
    ...
    ...     Test Steps:
    ...     - 1.Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed, and the user shall be redirected to step 3 (Perform Functional Test)
    ...     - 2. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOTRES-04   FRS-69-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOTRES-05: Observe step 3 in the Form FT-1306-7 for Biotres device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the information displayed in step 3
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 3
    ...
    ...     Test Steps:
    ...     - 1.Observe the information displayed in step 3 (Perform Functional Test| WI-1306-4)
    ...
    ...     Expected Results:
    ...     - 1.The following information shall be displayed:
    ...     - Study ID (The most recently ran Study ID for the Device ID will be automatically inputted in this field)
    ...     - Simulator ID
    ...     - Test result
    ...     - Complete button: this button is disabled until all section is filled with valid information.

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOTRES-05   FRS-69-01    manual     FRS-069-01-SPF-3    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOTRES-06: Enter an invalid Study ID step 3, Form FT-1306-7 for Biotres device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter an invalif Study ID step 3 in the Form FT-1306-7 for Biotres device model
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 3
    ...
    ...     Test Steps:
    ...     - 1.In the Study ID field, enter an invalid study ID
    ...
    ...     Expected Results:
    ...     - 1.There shall be an error message “Invalid Study ID. Please check again.”

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOTRES-06   FRS-69-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOTRES-07: Enter Simulator ID in step 3, Form FT-1306-7 for Biotres device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter Simulator ID in step 3, Form FT-1306-7 for Biotres device model
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 3
    ...
    ...     Test Steps:
    ...     - 1.In the Simulator ID field, input data in the Simulator ID
    ...
    ...     Expected Results:
    ...     - 1.The entered text shall be displayed

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOTRES-07   FRS-69-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOTRES-09: Select "Test result" option in step 3, Form FT-1306-7 for Biotres device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select "Test result" option in step 3, Form FT-1306-7 for Biotres device model
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 3
    ...
    ...     Test Steps:
    ...     - 1.In the Test result field, select one of 2 options (Pass, Fail)
    ...
    ...     Expected Results:
    ...     - 1.The selected option shall be displayed

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOTRES-09   FRS-69-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOTRES-10: Complete step 3 in the Form FT-1306-7 for Biotres device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 3
    ...     - 2. There is a valid study ID in the Study field (Test Study with the ID must have a ‘Done’ status)
    ...
    ...     Test Steps:
    ...     - 1.Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed, and the user shall be redirected to step 4
    ...     - 2. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOTRES-10   FRS-69-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOTRES-11: Observe step 4 in the Form FT-1306-7 for Biotres device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the information displayed in step 4
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 4
    ...
    ...     Test Steps:
    ...     - 1.Observe the information displayed in step step 4 (Charge Battery)
    ...
    ...     Expected Results:
    ...     - 1.The following information shall be displayed:
    ...     - -Message “Confirm battery is charged”
    ...     - Complete button: This button is always enabled

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOTRES-11   FRS-69-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOTRES-12: Complete step 4 in the Form FT-1306-7 for Biotres device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 4
    ...
    ...     Test Steps:
    ...     - 1.Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed, and the user shall be redirected to step 5
    ...     - 2. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOTRES-12   FRS-69-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOTRES-13: Observe step 5 in the Form FT-1306-7 for Biotres device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the information displayed in step 5
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 5
    ...
    ...     Test Steps:
    ...     - 1.Observe the information displayed in step step 5  (Packages Device)
    ...
    ...     Expected Results:
    ...     - 1.The following information shall be displayed:
    ...     - -Message “Confirm device is packaged per WI”
    ...     - Complete button: This button is always enabled

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOTRES-13   FRS-69-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOTRES-14: Complete step 5 in the Form FT-1306-7 for Biotres device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 5
    ...
    ...     Test Steps:
    ...     - 1.Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed
    ...     - 2. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOTRES-14   FRS-69-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOTRES-15: Input note in the Form FT-1306-7 for Biotres device model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Input text into Notes text box
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Form FT-1306-7
    ...
    ...     Test Steps:
    ...     - 1.Input text into Notes text box
    ...
    ...     Expected Results:
    ...     - 1.The entered text should be displayed

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOTRES-15   FRS-69-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-OPERATION-BIOTRES-16: Mark as Faulty
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Mark as Faulty
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Form FT-1306-7
    ...
    ...     Test Steps:
    ...     - 1. Complete any step in form
    ...     - 2. Click on [Mark as Faulty] button
    ...     - 3. Click on [Confirm] button on the confirmation popup
    ...     - 4. Click on [Cancel] button on the confirmation popup
    ...
    ...     Expected Results:
    ...     - 2. Display confirmation popup contains 2 options [Confirm], [Cancel]
    ...     - 3. The form shall be submitted with the step after the last completed step is "This device is mark faulty"
    ...     - 4. The popup window will close

    [Tags]    BSP-OD-DIGIT-OPERATION-BIOTRES-16   RS-69-01    manual   SC-1.14.0    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-01: Observe the Traveler information
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Traveler information
    ...
    ...     Precondition:
    ...     - 1. The user selected the option “RMA Service Traveler” and entered a valid device ID,
    ...     - 2. The device is belonging to an RMA ticket and isn’t not marked as received
    ...
    ...     Test Steps:
    ...     - 1.Observe the Traveler information
    ...     - 2. Observe the setion names
    ...
    ...     Expected Results:
    ...     - 1.The Traveler information shall display the following information:
    ...     - Device ID: must be the device ID that the user inputted in the Welcome page
    ...     - RMA ID: must be the ID of the RMA ticket that contains this Device ID in inbound
    ...     - Model: must be the model of the device
    ...     - Device Status
    ...     - Reason for RMA: same as the reason for RMA in the RMA ticket
    ...     - Date Received – input field. The default value will be the current date.
    ...     - 2. The form shall contain 4 sections
    ...     - Inspection and Cleaning: From step 1 to step 3
    ...     - RMA Troubleshooting: From step 4 to step 6
    ...     - Device Servicing: From step 7 to step 13
    ...     - Product Repacking: From step 14 to step 16

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-01   FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-02: View an RMA Traveler form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the steps of each section
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on an RMA Traveler form
    ...
    ...     Test Steps:
    ...     - 1.Observe the steps in the Inspection and Cleaning section
    ...     - 2.Observe the steps in the RMA Troubleshooting section
    ...     - 3.Observe the steps in the Device Servicing section
    ...     - 4.Observe the steps in the Product Repacking section
    ...
    ...     Expected Results:
    ...     - 1.The Inspection and Cleaning section
    ...     - Step 1: Sanitize with disinfectant
    ...     - Step 2: Inspect packaging and product
    ...     - Step 3: Verify an active study
    ...    2. The RMA Troubleshooting section
    ...     - Step 4: Report device malfunction
    ...     - Step 5: Perform troubleshooting
    ...     - Step 6: Verify device’s repairability
    ...    3. The Device Servicing section
    ...     - Step 7: Perform repair
    ...     - Step 8: Lock ECG cable | wi-1306-5
    ...     - Step 9: Install SIM card | WI-1306-1
    ...     - Step 10: Device firmware
    ...     - Step 11: RMA resolution
    ...     - Step 12: Perform functional test | WI-1306-4
    ...     - Step 13: RMA Billing Resolution
    ...    4. The Product Repacking section
    ...     - Step 14: Charge device
    ...     - Step 15: Device label
    ...     - Step 16: Package device

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-02   FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-03: Observe step 1 in the Form FT-1307-1
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Complete step 1 in the Form FT-1307-1
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the RMA Traveler form page
    ...
    ...     Test Steps:
    ...     - 1.Observe step 1, Inspection and Cleaning section,
    ...
    ...     Expected Results:
    ...     - 1.Message: "Sanitize with disinfectant all exposed parts of the product and any accessories."
    ...     - 2.Complete button: this button is always enabled

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-03   FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-04: Complete step 1 in the Form FT-1307-1
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 1
    ...
    ...     Test Steps:
    ...     - 1.Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed, and the user shall be redirected to step 2
    ...     - 2. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-04   FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-05: Observe step 2 in the Form FT-1307-1
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 2 in the Form FT-1307-1
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the RMA Traveler form page
    ...
    ...     Test Steps:
    ...     - 1.Observe step 2 (Inspect packaging and product)
    ...
    ...     Expected Results:
    ...     - 1.Message “Inspect packaging and product for damage or missing components, including product labels.”
    ...     - 2.Notes: there is a text box for user to input the notes (if any)
    ...     - 3.Complete button: This button is always enabled

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-05   FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-06: Input note in step 2, the Form FT-1307-1
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Input note in step 2 on the Form FT-1307-1
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the RMA Traveler form page
    ...
    ...     Test Steps:
    ...     - 1. Input note into the Note textbox
    ...
    ...     Expected Results:
    ...     - 1.The inputted note shall be displayed in the text box

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-06   FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-07: Complete step 2 in the Form FT-1307-1
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 2
    ...
    ...     Test Steps:
    ...     - 1.Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-07   FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-08: Observe step 3 in the Form FT-1307-1
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 3 (Verify an active study)
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the RMA Traveler form page
    ...
    ...     Test Steps:
    ...     - 1.Observe step 3 (Verify an active study)
    ...
    ...     Expected Results:
    ...     - 1.Message “Does an active study be in progress?”
    ...     - 2.Yes/No option, default is No
    ...     - 3.[Complete] button

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-08   FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-09: Selects ‘Yes’ option in step 3, Form FT-1307-1
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the message in the case the user selects ‘Yes’ option,
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 3 of the RMA Traveler form page
    ...
    ...     Test Steps:
    ...     - 1.The user selects ‘Yes’ option
    ...
    ...     Expected Results:
    ...     - 1.There shall be a message displayed “Please upload the study data then move device to the Production portal.”

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-09   FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-10: Complete step 3 in the Form FT-1307-1
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 3
    ...
    ...     Test Steps:
    ...     - 1.Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed, and the user shall be redirected to step 4
    ...     - 2.There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-10   FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-46: Observe the information displayed in step 4
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the information displayed in step 4
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 4
    ...
    ...     Test Steps:
    ...     - 1.observe the information displayed in step 4 (Report device malfunction)
    ...
    ...     Expected Results:
    ...     - 1.Message “Verify whether the reported device malfunction is recreated.
    ...     If so, record results in the Notes of RMA portal.”
    ...     - 2. Notes: there is a text box for user to input the notes (if any)
    ...     - 3. [Complete] button is enabled

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-46      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-47: Complete step 4
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 4
    ...
    ...     Test Steps:
    ...     - 1. The user inputs the notes (If any)
    ...     - 2. Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1. The inputted note shall be displayed in the text box (if any)
    ...     - 2. The step shall be automatically collapsed, and the user shall be redirected to step 5
    ...     - 3. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-47      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-48: Observe the information displayed in step 5
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the information displayed in step 5
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 5
    ...
    ...     Test Steps:
    ...     - 1.observe the information displayed in step 5 (Perform troubleshooting)
    ...
    ...     Expected Results:
    ...     - 1.Message “Perform troubleshooting or failure analysis to identify component fault”
    ...     - 2.[No issues found] option
    ...     - 3.Device issue list
    ...     - 4.Covered” checkbox: This checkbox is disabled
    ...     - 5. [Add] button: This button is disabled
    ...     - 6.[Complete] button: This button is disabled

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-48      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-49: The user selects [No issues found] option in step 5
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user selects [No issues found] option
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 5
    ...
    ...     Test Steps:
    ...     - 1.The user selects [No issues found] option in step 5
    ...
    ...     Expected Results:
    ...     - 1.The Device issue list shall be cleared and not be available to input
    ...     - 2.The [Complete] button is enabled

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-49      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-50: The user selects [No issues found] option in step 5
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user selects [No issues found] option
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 5
    ...
    ...     Test Steps:
    ...     - 1.The user selects [No issues found] option in step 5
    ...
    ...     Expected Results:
    ...     - 1.The Device issue list shall be cleared and not be available to input
    ...     - 2.The [Complete] button is enabled

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-50      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-51: Observe the Failure Analysis drop down list (Bioflux device)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Failure Analysis drop down list (Bioflux device)
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 6 of the RMA Traveler form page
    ...     - 2. The device model is Bioflux
    ...
    ...     Test Steps:
    ...     - 1. Observe the Failure Analysis drop down list
    ...
    ...     Expected Results:
    ...     - 1. There will be no “No issue found” option,
    ...     - 2. There shall be a Device issue list, which differs based on the model of the device ID,
    ...     the list of Bioflux device shall be:
    ...     - Charger Damage
    ...     - Charger Connector Damage
    ...     - Battery EOL
    ...     - Battery Defect
    ...     - Error Code 20600
    ...     - Error Code 20601
    ...     - Error Code 20400
    ...     - ECG Cable Damage
    ...     - ECG Cable Removed
    ...     - ECG Connector Damage
    ...     - Water Damage
    ...     - SD Card Damage
    ...     - Cellular Connection
    ...     - Damaged (describe)
    ...     - Other (describe)

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-51      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-52: Select "Damaged (describe) or "Other (describe)" option
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select "Damaged (describe) or "Other (describe)" option
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 5 of the RMA Traveler form page
    ...     - 2. Device model is Bioflux
    ...
    ...     Test Steps:
    ...     - 1. Select "Damaged (describe)" option
    ...     - 2. Select "Other (describe)" option
    ...     - 2. Observe the textbox
    ...
    ...     Expected Results:
    ...     - 1. There should be 2 text boxes for the user to enter the other reason.

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-52      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-53: Observe the Failure Analysis drop down list (Biotres device)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Failure Analysis drop down list (Biotres device)
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 5 of the RMA Traveler form page
    ...     - 2. The device model is Biotres
    ...
    ...     Test Steps:
    ...     - 1. Observe the Failure Analysis drop down list
    ...
    ...     Expected Results:
    ...     - 1. There will be no “No issue found” option,
    ...     - 2. There shall be a Device issue list, which differs based on the model of the device ID,
    ...     the list of Biotres device shall be:
    ...     - Charger Damage
    ...     - Charger Connector Damage
    ...     - Battery Defect
    ...     - Device Error Confirmed (describe)
    ...     - ECG Leads Damage Confirmed
    ...     - Water Damage
    ...     - Connection Issue Confirmed
    ...     - Damage Confirmed (describe)
    ...     - Other (describe)

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-53      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-54: Select "Device Error Confirmed (describe), "Damage Confirmed (describe)" or "Other" option
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select "Device Error Confirmed (describe), "Damage Confirmed (describe)" or "Other" option
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 5 of the RMA Traveler form page
    ...     - 2. Device model is Biotres
    ...
    ...     Test Steps:
    ...     - 1. Select "Device Error Confirmed (describe) option
    ...     - 2. Select  "Damage Confirmed (describe) option
    ...     - 2. Select "Other" option
    ...     - 2. Observe the textbox
    ...
    ...     Expected Results:
    ...     - 1. There should be 3 text boxes for the user to enter the other reason.

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-54      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-55: Select an option from the Failure Analysis drop down list
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select an option from the Failure Analysis drop down list
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 5 of the RMA Traveler form page
    ...
    ...     Test Steps:
    ...     - 1. Select an option from the Failure Analysis drop down list
    ...     - 2. Clicks on [Add] button
    ...     - 3. Check the "Covered" checkbox
    ...
    ...     Expected Results:
    ...     - 1. The selected option shall be displayed
    ...     - 2. There shall be a new row to add device issue
    ...     - 3. The “Covered” checkbox should be checked

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-55      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-56: Remove the added issue in the case there are more than 1 row
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select an option from the Failure Analysis drop down list
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 5 of the RMA Traveler form page
    ...     - 2. In the case there are more than 1 row in the table, Failure Analysis
    ...
    ...     Test Steps:
    ...     - 1. User could remove each row of issue by clicking on [X] button
    ...
    ...     Expected Results:
    ...     - 1.The issue shall be removed

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-56      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-57: Complete step 5
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 5
    ...
    ...     Test Steps:
    ...     - 1. The user selects an issue
    ...     - 2. Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1. The step shall be automatically collapsed, and the user shall be redirected to step 6
    ...     - 2. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-57      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-11: Observe step 6 in the Form FT-1307-1
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 6 (Verify device’s repairability)
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the RMA Traveler form page
    ...
    ...     Test Steps:
    ...     - 1.Observe step 6(Verify device’s repairability)
    ...
    ...     Expected Results:
    ...     - 1. Message “Select the device’s repairability status”
    ...     - 2. There are options for user to select
    ...     - Repairable is selected, by default
    ...     - Non-repairable
    ...     - Refurbished

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-11   FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-12: The user selects “Repairable” option and completes step 6
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user selects “Repairable” option, then clicks on [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the RMA Traveler form page
    ...
    ...     Test Steps:
    ...     - 1.The case the user selects “Repairable” option
    ...     - 2.Clicks on [Complete] button
    ...
    ...     Expected Results:
    ...     - 1. The step shall be automatically collapsed, and the user shall be redirected to step 7
    ...     - 2. TThere shall be a task completed log with the message “Task completed by <user’s full name>
    ...     at <date and time in 12-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-12       FRS-073-01    manual     SC-1.9.0    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-13: Observe step 6 in the case the user selects ‘Non-repairable’ Option,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 6 in the case the user selects ‘Non-repairable’ Option,
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 6 of the RMA Traveler form page
    ...
    ...     Test Steps:
    ...     - 1.The case the user selects ‘Non-repairable’ Option
    ...     - 2.Observe step 6
    ...
    ...     Expected Results:
    ...     - 1. The “RMA Resolution”, RMA Billing Resolution sections shall be displayed to fill out data
    ...     - 2. The [Complete] button is disabled

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-13      FRS-073-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-18: Observe the RMA Resolution drop down list
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the RMA Resolution drop down list
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 6 of the RMA Traveler form page
    ...
    ...     Test Steps:
    ...     - 1. The user selects ‘Non-repairable’ Option
    ...     - 2. Observe the RMA Resolution drop down list
    ...
    ...     Expected Results:
    ...     - 1. There shall be:
    ...     - Passed QC
    ...     - Firmware updated
    ...     - ECG connector broken
    ...     - Broken screen
    ...     - Screen replaced
    ...     - Battery not holding charge
    ...     - Battery replaced
    ...     - Charger replaced
    ...     - ECG cable replaced
    ...     - No Resolution
    ...     - Non-repairable
    ...     - SIM change
    ...     - Locked ECG cable
    ...     - Other

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-18      FRS-073-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-19: Select an option from the RMA Resolution drop down list
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select an option from the RMA Resolution drop down list
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 6 of the RMA Traveler form page
    ...     - 2. The user selects ‘Non-repairable’ Option
    ...
    ...     Test Steps:
    ...     - 1. The user selects an option from the RMA Resolution drop-down list
    ...     - 2. The user selects multiple options
    ...     - 3. The user clicks on [remove] button on each selected option
    ...
    ...     Expected Results:
    ...     - 1. The selected options shall be displayed
    ...     - 2. The “Non-repairable” is selected and cannot be edited
    ...         --- CHECK THIS OPTION ON SERVICE PORTAL
    ...         --- The user cannot remove this option, display hover message
    ...     - 3. The option shall be removed when the user clicks on the [remove] button on each option

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-19      FRS-073-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-20: Check quantity fields in the RMA Billing Resolution (Bioflux device)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check quantity fields in the RMA Billing Resolution (Bioflux device)
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 6 of the RMA Traveler form page
    ...     - 2. The device model is Bioflux
    ...
    ...     Test Steps:
    ...     - 1. The user selects ‘Non-repairable’ Option
    ...     - 2. Observe the RMA Billing Resolution drop down list
    ...     - 3. Select:
    ...     -- Carrying Pouch Replacement
    ...     -- ECG Cable Replacement
    ...     -- Charger Replacement
    ...     -- Carrying Case Replacement

    ...     Expected Results:
    ...     - 2. The list shall be:
    ...     - Unrepairable – Product Replacement
    ...     - Repair – Broken Screen
    ...     - Repair – Reboot
    ...     - Repair – Other (describe)
    ...     - Repair – Battery Replacement
    ...     - Carrying Pouch Replacement
    ...     - ECG Cable Replacement
    ...     - Charger Replacement
    ...     - Carrying Case Replacement
    ...     - Maintenance Device Replacement
    ...     - Other (describe)
    ...     - 3. There shall be quantity fields, default value: 1

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-20      FRS-073-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-21: Select an option from the RMA Billing Resolution drop down list (Bioflux device)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select an option from the RMA Billing Resolution drop down list
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 6 of the RMA Traveler form page
    ...     - 2. The Device model is Bioflux
    ...     - 3. The user selects ‘Non-repairable’ Option
    ...
    ...     Test Steps:
    ...     - 1. The user selects an option from the RMA Billing Resolution drop-down list
    ...     - 2. The user selects multiple options
    ...     - 3. The user selects “Repair-Other” option and Other” option
    ...     - 4. The user clicks on [remove] button on each selected option
    ...
    ...     Expected Results:
    ...     - 1. The selected options shall be displayed
    ...     - 2. There shall be a text box added when the user selects “Repair-Other” option or Other” option
    ...     - 3. The option shall be removed when the user clicks on the [remove] button on each option

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-21       FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-22: Check quantity fields in the RMA Billing Resolutions (Biotres device)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check quantity fields in the RMA Billing Resolutions (Biotres device)
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 6 of the RMA Traveler form page
    ...     - 2. The device model is Biotres
    ...
    ...     Test Steps:
    ...     - 1. The user selects ‘Non-repairable’ Option
    ...     - 2. Observe the RMA Billing Resolution drop down list
    ...      - 3. Select options:
    ...     -- Charger Replacement
    ...     -- Carrying Case Replacement
    ...
    ...     Expected Results:
    ...     - 2. There list shall be:
    ...     - Unrepairable – Product Replacement
    ...     - Repair – Other (describe)
    ...     - Repair – Battery Replacement
    ...     - Charger Replacement
    ...     - Carrying Case Replacement
    ...     - Other (describe)
    ...     - 3. There shall be quantity fields, default value: 1

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-22      FRS-073-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-23: Select an option from the RMA Billing Resolution drop down list (Biotres device)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select an option from the RMA Billing Resolution drop down list
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 6 of the RMA Traveler form page
    ...     - 2. The Device model is Biotres
    ...     - 3. The user selects ‘Non-repairable’ Option
    ...
    ...     Test Steps:
    ...     - 1. The user selects an option from the RMA Billing Resolution drop-down list
    ...     - 2. The user selects multiple options
    ...     - 3. The user selects “Repair-Other” option and Other” option
    ...     - 4. The user clicks on [remove] button on each selected option
    ...
    ...     Expected Results:
    ...     - 1. The selected options shall be displayed
    ...     - 2. There shall be a text box added when the user selects “Repair-Other” option or Other” option
    ...     - 3. The option shall be removed when the user clicks on the [remove] button on each option

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-23   FRS-073-01    manual  SC-1.9.0    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-24: Submit form when selects "non-repairable" option in step 6
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Submit form when selects "non-repairable" option in step 6
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 6 of the RMA Traveler form page
    ...     - 2. The user selects ‘Non-repairable’ Option
    ...
    ...     Test Steps:
    ...     - 1. Fill out all required fields,
    ...     - 2. Leave the “Repair-Other” and "Other" textbox blank (These fields are optional)
    ...     - 3. Click on the [Complete] button, observe the message and the [Submit] button
    ...     - 4. The user clicks on the [Submit] button
    ...
    ...     Expected Results:
    ...     - 3.There shall be a message “The RMA Service Traveler form will be submitted since the device is marked as non-repairable”
    ...     and the [Submit] button displayed
    ...     - 4.The Traveler form shall be submitted, the user shall be navigated back to Welcome page

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-24      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-25: Observe step 6 in the case the user selects ‘Refurbished’ Option,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 4 in the case the user selects ‘Refurbished’ Option,
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 6 of the RMA Traveler form page
    ...
    ...     Test Steps:
    ...     - 1.The case the user selects ‘Refurbished’ Option
    ...     - 2.Observe step 6
    ...
    ...     Expected Results:
    ...     - 1. The “RMA Resolution”, RMA Billing Resolution sections shall be displayed to fill out data
    ...     - 2. The [Complete] button is disabled

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-25      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-30: Observe the RMA Resolution drop down list
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the RMA Resolution drop down list
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 6 of the RMA Traveler form page
    ...    ...
    ...     Test Steps:
    ...     - 1. The user selects ‘Refurbished’ Option
    ...     - 2. Observe the RMA Resolution drop down list
    ...
    ...     Expected Results:
    ...     - 1. There shall be:
    ...     - Passed QC
    ...     - Firmware updated
    ...     - ECG connector broken
    ...     - Broken screen
    ...     - Screen replaced
    ...     - Battery not holding charge
    ...     - Battery replaced
    ...     - Charger replaced
    ...     - ECG cable replaced
    ...     - No Resolution
    ...     - Non-repairable
    ...     - SIM change
    ...     - Locked ECG cable
    ...     - Other

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-30      FRS-073-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-31: Select an option from the RMA Resolution drop down list
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select an option from the RMA Resolution drop down list

    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 6 of the RMA Traveler form page
    ...     - 2. The user selects ‘Refurbished’ Option
    ...
    ...     Test Steps:
    ...     - 1. The user selects an option from the RMA Resolution drop-down list
    ...     - 2. The user selects multiple options
    ...     - 3. The user clicks on [remove] button on each selected option
    ...
    ...     Expected Results:
    ...     - 1. The selected options shall be displayed
    ...     - 2. The “Non-repairable” isn't selected
    ...     - 3. The option shall be removed when the user clicks on the [remove] button on each option

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-31      FRS-073-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-32: Check quantity fields in the RMA Billing Resolution (Bioflux device)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check quantity fields in the RMA Billing Resolution (Bioflux device)
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 6 of the RMA Traveler form page
    ...     - 2. The device model is Bioflux
    ...
    ...     Test Steps:
    ...     - 1. The user selects ‘Refurbished’ Option
    ...     - 2. Observe the RMA Billing Resolution drop down list
    ...     - 3. Select:
    ...     -- Carrying Pouch Replacement
    ...     -- ECG Cable Replacement
    ...     -- Charger Replacement
    ...     -- Carrying Case Replacement

    ...     Expected Results:
    ...     - 2. The list shall be:
    ...     - Unrepairable – Product Replacement
    ...     - Repair – Broken Screen
    ...     - Repair – Reboot
    ...     - Repair – Other (describe)
    ...     - Repair – Battery Replacement
    ...     - Carrying Pouch Replacement
    ...     - ECG Cable Replacement
    ...     - Charger Replacement
    ...     - Carrying Case Replacement
    ...     - Maintenance Device Replacement
    ...     - Other (describe)
    ...     - 3. There shall be quantity fields, default value: 1

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-32       FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-33: Select an option from the RMA Billing Resolution drop down list (Bioflux device)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select an option from the RMA Billing Resolution drop down list
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 6 of the RMA Traveler form page
    ...     - 2. The Device model is Bioflux
    ...     - 3. The user selects ‘Refurbished’ Option
    ...
    ...     Test Steps:
    ...     - 1. The user selects an option from the RMA Billing Resolution drop-down list
    ...     - 2. The user selects multiple options
    ...     - 3. The user selects “Repair-Other” option and Other” option
    ...     - 4. The user clicks on [remove] button on each selected option
    ...
    ...     Expected Results:
    ...     - 1. The selected options shall be displayed
    ...     - 2. There shall be a text box added when the user selects “Repair-Other” option or Other” option
    ...     - 3. The option shall be removed when the user clicks on the [remove] button on each option

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-33      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-34: Check quantity fields in the RMA Billing Resolutions (Biotres device)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check quantity fields in the RMA Billing Resolutions (Biotres device)
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 6 of the RMA Traveler form page
    ...     - 2. The device model is Biotres
    ...
    ...     Test Steps:
    ...     - 1. The user selects ‘Refurbished’ Option
    ...     - 2. Observe the RMA Billing Resolution drop down list
    ...      - 3. Select options:
    ...     -- Charger Replacement
    ...     -- Carrying Case Replacement
    ...
    ...     Expected Results:
    ...     - 2. There list shall be:
    ...     - Unrepairable – Product Replacement
    ...     - Repair – Other (describe)
    ...     - Repair – Battery Replacement
    ...     - Charger Replacement
    ...     - Carrying Case Replacement
    ...     - Other (describe)
    ...     - 3. There shall be quantity fields, default value: 1

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-34      FRS-073-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-35: Select an option from the RMA Billing Resolution drop down list (Biotres device)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select an option from the RMA Billing Resolution drop down list
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 6 of the RMA Traveler form page
    ...     - 2. The Device model is Biotres
    ...     - 3. The user selects ‘Refurbished’ Option
    ...
    ...     Test Steps:
    ...     - 1. The user selects an option from the RMA Billing Resolution drop-down list
    ...     - 2. The user selects multiple options
    ...     - 3. The user selects “Repair-Other” option and Other” option
    ...     - 4. The user clicks on [remove] button on each selected option
    ...
    ...     Expected Results:
    ...     - 1. The selected options shall be displayed
    ...     - 2. There shall be a text box added when the user selects “Repair-Other” option or Other” option
    ...     - 3. The option shall be removed when the user clicks on the [remove] button on each option

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-35       FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-36: Complete step 6 when selects "Refurbished" option
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 6 of the RMA Traveler form page
    ...     - 2. The user selects ‘Refurbished’ Option
    ...
    ...     Test Steps:
    ...     - 1. Fill out all required fields,
    ...     - 2. Leave the “Repair-Other” and "Other" textbox blank (These fields are optional)
    ...     - 2. Click on the [Complete] button, observe the message
    ...
    ...     Expected Results:
    ...     - 1.Message: ‘Please note:The RMA Service Traveler form will be submitted and
    ...     Operation form will be created for new device ID. Make sure the device is turned on before proceeding.”
    ...     - 2. New Device ID textbox, Scan code button
    ...     - 3. [Submit & Go to Operation form] button

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-36      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-37: Inputs an invalid Device ID the New Device ID textbox,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Inputs an invalid Device ID into the New Device ID textbox,
    ...
    ...     Precondition:
    ...     - 1. The user selects ‘Refurbished’ Option and complete step 6
    ...
    ...     Test Steps:
    ...     - 1. The user inputs an invalid Device ID into the New Device ID textbox,
    ...     - 2. Then clicks on [Submit & Go to Operation form] button]
    ...
    ...     Expected Results:
    ...     - 1. An error message shall be displayed: “Invalid device ID”

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-37      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-38: Inputs a Device ID same as old device ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Inputs a Device ID same as old device ID
    ...
    ...     Precondition:
    ...     - 1. The user selects ‘Refurbished’ Option and complete step 6
    ...
    ...     Test Steps:
    ...     - 1. The user inputs a Device ID same as old device ID into the New Device ID textbox
    ...     - 2. Then clicks on [Submit & Go to Operation form] button]
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message “The new Device ID cannot be the same as the old Device ID.”

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-38      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-39: Inputs an existing device ID into the New Device ID textbox,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Inputs an existing device ID into the New Device ID textbox,
    ...
    ...     Precondition:
    ...     - 1. The user selects ‘Refurbished’ Option and complete step 6
    ...
    ...     Test Steps:
    ...     - 1. The user inputs an existing device ID into the New Device ID textbox,
    ...     - 2. Then clicks on [Submit & Go to Operation form] button]
    ...
    ...     Expected Results:
    ...     - 1. Message: The entered Device ID already exists. Please input another Device ID.”

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-39      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-40: Inputs a valid device ID and this device is not online
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Inputs a valid device ID and this device is not online
    ...
    ...     Precondition:
    ...     - 1. The user selects ‘Refurbished’ Option and complete step 6
    ...
    ...     Test Steps:
    ...     - 1. The user inputs a valid device ID and this device is not online, into the New Device ID textbox,
    ...     - 2. Then clicks on [Submit & Go to Operation form] button]

    ...     Expected Results:
    ...     - 1. “Unable to proceed as the device is Offline. Please check the device and try again.”,
    ...     with a confirmation button to exit the modal

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-40      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-40.1: Turn on the camera and click on Scan button
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click on Scan button next to the New Device ID textbox
    ...
    ...     Precondition:
    ...     - 1. The user selects ‘Refurbished’ Option and complete step 6
    ...     - 2. Turn on the camera
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on [Scan code] button
    ...
    ...     Expected Results:
    ...     - 1.The application shall access the camera and scan for a Data Matrix code in place of the button

    [Tags]   BSP-OD-DIGIT-TRAVELER-VIEW-40.1      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-41: Clicks on the [Close Camera] button
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Clicks on the [Close Camera] button
    ...
    ...     Precondition:
    ...     - 1. The user selects ‘Refurbished’ Option and complete step 6
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on [Scan code] button
    ...     - 2. Clicks on the [Close Camera] button
    ...
    ...     Expected Results:
    ...     - 1.Clicking on it will turn off the camera and bring back the [Scan code] button

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-41      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-42: Scan for a valid code
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Scan for a valid code
    ...
    ...     Precondition:
    ...     - 1. The user selects ‘Refurbished’ Option and complete step 6
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on [Scan code] button
    ...     - 2. Scan a valid code
    ...
    ...     Expected Results:
    ...     - 1.The code is successfully scanned, there shall be a success message
    ...     “Device ID <device ID> scanned successfully.” and the camera shall be closed
    ...     - 2.The Device ID data scanned from the code will be entered in the Device ID textbox
    ...     and will be promptly checked for its validity

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-42      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-43: Block the camera then clicks on [Scan] button
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Clicks on the [Close Camera] button
    ...
    ...     Precondition:
    ...     - 1. The user selects ‘Refurbished’ Option and complete step 6
    ...
    ...     Test Steps:
    ...     - 1. Block the camera
    ...     - 2. Clicks on [Scan] button
    ...
    ...     Expected Results:
    ...     - 1.There shall be an error message: “Unable to access the camera. Please check and try again.

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-43      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-44: Scan an invalid code
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Clicks on the [Close Camera] button
    ...
    ...     Precondition:
    ...     - 1. The user selects ‘Refurbished’ Option and complete step 6
    ...     - 2. Turn on the camera
    ...
    ...     Test Steps:
    ...     - 1. Clicks on [Scan] button
    ...     - 2. Scan an invalid code
    ...
    ...     Expected Results:
    ...     - 1.Upon encountering an invalid Data Matrix code, error message: The Code is not valid, please try another code!

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-44      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-45: Submit & Go to Operation form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Submit & Go to Operation form
    ...
    ...     Precondition:
    ...     - 1. The user selects ‘Refurbished’ Option and complete step 6
    ...     - 2. Turn on the camera
    ...
    ...     Test Steps:
    ...     - 1. Input/Scan a valid device ID and the device is online
    ...     - 2. The user clicks on [Submit & Go to Operation form] button
    ...
    ...     Expected Results:
    ...     - 1.The Traveler form shall be submitted
    ...     - 2. The old device ID changes to the device ID inputted in “New Device ID”
    ...     - 3. The device lifetime shall be reset on the Admin Portal
    ...     - 4. The old device ID shall be unusable and move to the “Retired” tab on the Admin Portal
    ...     - 5. A new Operation Form is created for the new device ID using the device model taken from the old Device ID
    ...     - 6. The user shall be navigated to the operation of the device model

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-45      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-58: Observe the information displayed in step 7
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the information displayed in step 7
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 7
    ...
    ...     Test Steps:
    ...     - 1.observe the information displayed in step 7 (Perform repair)
    ...
    ...     Expected Results:
    ...     - 1.Message “Is the device performed the repair?”
    ...     - 2.Yes/No option. “Yes” is selected
    ...     - 3.Notes text box
    ...     - 4.[Complete] button is enabled

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-58      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-59: Complete step 7
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 7
    ...
    ...     Test Steps:
    ...     - 1. The user inputs the notes (optional)
    ...     - 2. Selects an option (Yes/No)
    ...     - 2. Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1. The inputted note (if any) and selected option shall be displayed
    ...     - 2. The step shall be automatically collapsed, and the user shall be redirected to step 8
    ...     - 3. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-59      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-60: Observe the information displayed in step 8
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the information displayed in step 8
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 8
    ...
    ...     Test Steps:
    ...     - 1.observe the information displayed in step 8 (Lock ECG cable | wi-1306-5)
    ...
    ...     Expected Results:
    ...     - 1.Yes/No option. “No” is selected by default
    ...     - 2.[Complete] button is enabled

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-60      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-61: Complete step 8
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 8
    ...
    ...     Test Steps:
    ...     - 1. Selects an option (Yes/No)
    ...     - 2. Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1. The selected option shall be displayed
    ...     - 2. The step shall be automatically collapsed, and the user shall be redirected to step 9
    ...     - 3. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-61      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-62: Observe the information displayed in step 9
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the information displayed in step 9
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 9
    ...
    ...     Test Steps:
    ...     - 1.observe the information displayed in step 9 (Install sim card| WI 1306-1)
    ...
    ...     Expected Results:
    ...     - 1.“Install new sim” option
    ...     - 2.“Not applicable” option is selected
    ...     - 3. [Complete] button is enabled

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-62      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-63: Complete step 9 in the case “Not applicable” option is selected
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 9
    ...
    ...     Test Steps:
    ...     - 1. The “Not applicable” option is selected.
    ...     - 2. The user clicks on [Complete] button
    ...
    ...     Expected Results:
    ...     - 1. The selected option shall be displayed
    ...     - 2. The step shall be automatically collapsed, and the user shall be redirected to step 10
    ...     - 3. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-63      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-64: Observe step 9 when the user selects “Install new sim” option
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 9 when the user selects “Install new sim” option
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 9
    ...     - 2. The user selects “Install new sim” option
    ...
    ...     Test Steps:
    ...     - 1.Observe the information displayed in step 9 (Install sim card| WI 1306-1)
    ...
    ...     Expected Results:
    ...     - 1.The following information shall be displayed:
    ...     - Message “Once SIM card was replaced, program GPRS and press “Get Info” button
    ...     to get the SIM card information.”
    ...     - [Get info] button
    ...     - Current SIM card serial number text box
    ...     - Current SIM card carrier fields
    ...     - [Complete] button: This button is disabled

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-64      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-65: [Get Infor] button in step 9
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: [Get Infor] button in step 9
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 9
    ...     - 2. The user selects “Install new sim” option
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on the [Get Infor] button
    ...
    ...     Expected Results:
    ...     - 1.The web app shall get the last SIM card information to display
    ...     - 2. If the carrier is not matched with the list above,
    ...     it shall display “Other” option with the text box that is automatically filled out the carrier’s name.
    ...     The text box cannot be empty.

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-65      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-66: Enters data into the SIM card serial number fields
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user enters data in the SIM card serial number fields
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 9
    ...     - 2. The user selects “Install new sim” option
    ...
    ...     Test Steps:
    ...     - 1.In the case there is no sim card information displayed when clicks on the [Get Info] button.
    ...     The user enters data in the SIM card serial number
    ...
    ...     Expected Results:
    ...     - 1.The entered data shall be displayed

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-66      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-67: Select a option from the “Current SIM card carrier” drop down list
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select a option from the “Current SIM card carrier” drop down list
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 9
    ...     - 2. The user selects “Install new sim” option
    ...
    ...     Test Steps:
    ...     - 1.In the case there is no sim card information displayed when clicks on the [Get Info] button.
    ...     The user clicks on the “Current SIM card carrier” field, observe the drop down list
    ...     - 2. The user selects an option from the list
    ...     - 3. The user selects “Other” option
    ...
    ...     Expected Results:
    ...     - 1.There shall be a drop-down list displayed:
    ...     - AT&T
    ...     - T-Mobile
    ...     - Kore
    ...     - ROGERS
    ...     - Movistar
    ...     - Other
    ...     - 2.The option shall be selected and displayed in the file
    ...     - 3. It shall display “Other” option with the text box that is automatically filled out the carrier’s name.
    ...     The text box cannot be empty

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-67      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-68: Complete step 9 in the case the user selects “Install new sim” option
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Complete step 9
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 9
    ...     - 2. The user selects “Install new sim” option
    ...
    ...     Test Steps:
    ...     - 1. The user fills out all required fields
    ...     - 2. Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed, and the user shall be redirected to step 10
    ...     - 2. There shall be a task completed log with the message “Task completed by <user’s full name>
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step
    ...     The Complete button shall be replaced with the Edit button

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-68      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-69: Complete step 10
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Complete step 10
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 10 the RMA Traveler form page
    ...
    ...     Test Steps:
    ...     - 1.Observe step 10
    ...
    ...     Expected Results:
    ...     - 1.The current device’s firmware is displayed
    ...     - 2.[Complete] button is enabled

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-69      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-70: Complete step 10
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 10
    ...
    ...     Test Steps:
    ...     - 1.Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed, and the user shall be redirected to step 11
    ...     - 2. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-70      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-71: Observe step 11 in the case the user selects “Yes” option in step 8
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 11 in the case the user selects “Yes” option in step 8
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 11 the RMA Traveler form page
    ...     - 2. The user selects “Yes” option in step 8
    ...
    ...     Test Steps:
    ...     - 1.Observe step 11
    ...
    ...     Expected Results:
    ...     - 1.“Locked ECG cable” option is selected and cannot be removed
    ...     - 2. RMA resolution dropdown box
    ...     - 3. [Complete] button is disabled

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-71      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-72: Observe step 11 in the case the user selects “No” option in step 8
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 11
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 11 the RMA Traveler form page
    ...     - 2. The user selects “No” option in step 8
    ...
    ...     Test Steps:
    ...     - 1.Observe step 11
    ...
    ...     Expected Results:
    ...     - 1. RMA resolution dropdown box, there is no option selected
    ...     - 2. [Complete] button is disabled

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-72      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-73: Observe the RMA Resolution drop down list
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the RMA Resolution drop down list
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 11 of the RMA Traveler form page
    ...
    ...     Test Steps:
    ...     - 1. Observe the RMA Resolution drop down list
    ...
    ...     Expected Results:
    ...     - 1. There shall be:
    ...     - Passed QC
    ...     - Firmware updated
    ...     - ECG connector broken
    ...     - Broken screen
    ...     - Screen replaced
    ...     - Battery not holding charge
    ...     - Battery replaced
    ...     - Charger replaced
    ...     - ECG cable replaced
    ...     - No Resolution
    ...     - Non-repairable
    ...     - SIM change
    ...     - Locked ECG cable
    ...     - Other

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-73      FRS-073-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-74: The user selects “No Resolution” from the RMA Resolution drop down list
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user selects “No Resolution”
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 11 the RMA Traveler form page
    ...
    ...     Test Steps:
    ...     - 1. Selects “No Resolution”
    ...     - 2. Observe the list

    ...     Expected Results:
    ...     - 1. The user cannot select other options anymore and delete all the selected options before.
    ...     - 2. The web app will not show the list until the user deletes the “No resolution” options

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-74      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-75: The user selects “Sim change” option from the RMA Resolution drop down list
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user selects “Sim change”
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 11 the RMA Traveler form page
    ...
    ...     Test Steps:
    ...     - 1. Selects “Sim change”
    ...     - 2. Observe the added text box, observe the [Complete] button
    ...     - 3. The user inputs number into text box

    ...     Expected Results:
    ...     - 1. There shall be a text box for the user to enter the SIM number
    ...     - 2. The “Sim change” text box is required
    ...     - 3. The inputted number shall be displayed

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-75      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-76: The user selects “Other” option from the RMA Resolution drop down list
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user selects “Other” option,
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 11 the RMA Traveler form page
    ...
    ...     Test Steps:
    ...     - 1. Selects “Other” option,
    ...     - 2. Observe the added text box, observe the [Complete] button
    ...     - 3. The user inputs number into text box

    ...     Expected Results:
    ...     - 1. There shall be a text box for the user to enter the SIM number
    ...     - 2. The “Other” text box is optional
    ...     - 3. The inputted number shall be displayed

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-76      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-77: The user selects multiple options (exclude No Resolution option)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user selects multiple options (exclude No Resolution option)
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 11 the RMA Traveler form page
    ...
    ...     Test Steps:
    ...     - 1. Selects multiple options (exclude No Resolution option)
    ...
    ...     Expected Results:
    ...     - 1. The selected options shall be displayed

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-77      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-78: Complete step 11
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 11
    ...     - 2. Fill out all required fields
    ...
    ...     Test Steps:
    ...     - 1.Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed, and the user shall be redirected to step 12
    ...     - 2. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-78      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-79: Observe step 13
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 13
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 13 the RMA Traveler form page
    ...
    ...     Test Steps:
    ...     - 1.Observe step 13
    ...
    ...     Expected Results:
    ...     - 1. RMA Billing Resolution drop-down box
    ...     - 2. [Complete] button is disabled

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-79      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-80: Observe the RMA Billing Resolution drop down list (Bioflux device)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the RMA Billing Resolution drop down list (Bioflux device)
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 13 of the RMA Traveler form page
    ...     - 2. The device model is Bioflux
    ...
    ...     Test Steps:
    ...     - 1. Observe the RMA Billing Resolution drop down list
    ...
    ...     Expected Results:
    ...     - 1. The list shall be:
    ...     - Unrepairable – Product Replacement
    ...     - Repair – Broken Screen
    ...     - Repair – Reboot
    ...     - Repair – Other (describe)
    ...     - Repair – Battery Replacement
    ...     - Carrying Pouch Replacement
    ...     - ECG Cable Replacement
    ...     - Charger Replacement
    ...     - Carrying Case Replacement
    ...     - Maintenance Device Replacement
    ...     - Other (describe)

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-80      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-81: Select an option from the RMA Billing Resolution drop down list (Bioflux device)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select an option from the RMA Billing Resolution drop down list
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 13 of the RMA Traveler form page
    ...     - 2. The Device model is Bioflux
    ...
    ...     Test Steps:
    ...     - 1. The user selects an option from the RMA Billing Resolution drop-down list
    ...     - 2. The user selects multiple options
    ...     - 3. The user selects “Repair-Other” option and Other” option
    ...     - 4. The user clicks on [remove] button on each selected option
    ...
    ...     Expected Results:
    ...     - 1. The selected options shall be displayed
    ...     - 2. There shall be a text box added when the user selects “Repair-Other” option or Other” option
    ...     - 3. The option shall be removed when the user clicks on the [remove] button on each option

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-81      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-82: Observe the RMA Billing Resolution drop down list (Biotres device)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the RMA Billing Resolution drop down list (Biotres device)
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 13 of the RMA Traveler form page
    ...     - 2. The device model is Biotres
    ...
    ...     Test Steps:
    ...     - 1. Observe the RMA Billing Resolution drop down list
    ...
    ...     Expected Results:
    ...     - 1. There list shall be:
    ...     - Unrepairable – Product Replacement
    ...     - Repair – Other (describe)
    ...     - Repair – Battery Replacement
    ...     - Charger Replacement
    ...     - Carrying Case Replacement
    ...     - Other (describe)

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-82      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-83: Select an option from the RMA Billing Resolution drop down list (Biotres device)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select an option from the RMA Billing Resolution drop down list
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 13 of the RMA Traveler form page
    ...     - 2. The Device model is Biotres
    ...
    ...     Test Steps:
    ...     - 1. The user selects an option from the RMA Billing Resolution drop-down list
    ...     - 2. The user selects multiple options
    ...     - 3. The user selects “Repair-Other” option and Other” option
    ...     - 4. The user clicks on [remove] button on each selected option
    ...
    ...     Expected Results:
    ...     - 1. The selected options shall be displayed
    ...     - 2. There shall be a text box added when the user selects “Repair-Other” option or Other” option
    ...     - 3. The option shall be removed when the user clicks on the [remove] button on each option

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-83      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-84: Complete step 13
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 13
    ...     - 2. Fill out all required fields
    ...
    ...     Test Steps:
    ...     - 1.Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed, and the user shall be redirected to step 14
    ...     - 2. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-84      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-85: Observe step 13
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 13
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 13
    ...
    ...     Test Steps:
    ...     - 1.Observe the information displayed in step 13 (Perform Functional Test)
    ...
    ...     Expected Results:
    ...     - 1.The following information shall be displayed:
    ...     - Study ID
    ...     - Simulator ID
    ...     - Test result: "Pass","Fail" option
    ...     - [Complete] button: This button is disabled until all section is filled with valid information.

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-85      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-86: Enter an invalid device ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter an invalid device ID
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 13
    ...
    ...     Test Steps:
    ...     - 1. In the Study ID field, enter an invalid study ID
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message “Invalid Study ID. Please check again.”

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-86      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-87: Observe the study ID text box
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the study ID text box
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 13
    ...
    ...     Test Steps:
    ...     - 1. Observe the study ID text box in the case there is a test study that have “Done” status created for this device
    ...
    ...     Expected Results:
    ...     - 1. The most recently ran Study ID for the Device ID will be automatically inputted in this field

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-87      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-88: Input data in the Simulator ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In the Simulator ID field, input data in the Simulator ID
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 13
    ...
    ...     Test Steps:
    ...     - 1.In the Simulator ID field, input data in the Simulator ID
    ...
    ...     Expected Results:
    ...     - 1.The entered text shall be displayed

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-88      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-89: Select Test result
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select Test result
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 13
    ...
    ...     Test Steps:
    ...     - 1.In the Test result field, select an option (Pass or Fail)
    ...
    ...     Expected Results:
    ...     - 1.The selected option shall be displayed

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-89      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-90: Complete step 13
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is in step 13
    ...     - 2. In the Study field, enter a valid study ID (Test Study with the ID must have a ‘Done’ status)
    ...
    ...     Test Steps:
    ...     - 1.Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed, and the user shall be redirected to step 14
    ...     - 2. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-90      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-91: Observe step 14
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 14
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 14
    ...
    ...     Test Steps:
    ...     - 1.observe the information displayed in step 14
    ...
    ...     Expected Results:
    ...     - 1.Message “Confirm device is charged”
    ...     - 2.[Complete] button is enabled

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-91      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-92: Complete step 14
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 14
    ...
    ...     Test Steps:
    ...     - 1. Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1. The step shall be automatically collapsed, and the user shall be redirected to step 15
    ...     - 2. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-92      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-93: Observe step 15
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 15
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 15
    ...
    ...     Test Steps:
    ...     - 1.observe the information displayed in step 15
    ...
    ...     Expected Results:
    ...     - 1.“Device label is legible” is selected
    ...     - 2.“Replace label(s) or move to MRB for review and disposition” option
    ...     - 3.[Complete] button is enabled

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-93      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-94: Complete step 15
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 15
    ...
    ...     Test Steps:
    ...     - 1. Select an option
    ...     - 2. Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1. The selected option shall be displayed
    ...     - 2. The step shall be automatically collapsed, and the user shall be redirected to step 16
    ...     - 4. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-94      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-95: Observe step 16
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 14
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 16
    ...
    ...     Test Steps:
    ...     - 1.observe the information displayed in step 16
    ...
    ...     Expected Results:
    ...     - 1.Message “Package device per WI -1306-1(BF) or WI-1306-14(BT). Include all accessories and components,
    ...     as required. Ensure current version of printed materials are included
    ...     - 2.[Complete] button is enabled

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-95      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-96: Complete step 16
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click the [Complete] button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is in step 16
    ...
    ...     Test Steps:
    ...     - 1. Click the [Complete] button
    ...
    ...     Expected Results:
    ...     - 1. The step shall be automatically collapsed, and the user shall be redirected to step 16
    ...     - 2. There shall be a task completed log with the message “Task completed by <user’s full name> >
    ...     on <date & time in MM/DD/YYYY at 24-hour format>” displayed upon expanding this step
    ...     - 3. There shall be a [Submit] button displayed at the bottom of the page

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-96      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-97: The user inputs text into the text box
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user inputs text into the text box
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the RMA Traveler form
    ...
    ...     Test Steps:
    ...     - 1.Input text into Notes text box
    ...
    ...     Expected Results:
    ...     - 1.The entered text should be displayed

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-97      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-98: Check the order of completing the form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the order of completing the form
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the RMA Traveler form
    ...
    ...     Test Steps:
    ...     - 1.The user completes all steps of the form
    ...
    ...     Expected Results:
    ...     - 1.The user shall submit the task step by step.

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-98      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-99: Check the “Expand” button
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the “Expand” button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the RMA Traveler form
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on “Expand” button of any step
    ...
    ...     Expected Results:
    ...     - 1.The step shall be expanded

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-99      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-VIEW-100: Check the “Collapse” button
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the “Collapse” button
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the RMA Traveler form
    ...
    ...     Test Steps:
    ...     - 1.The user clicks on “Collapse” button of any step
    ...
    ...     Expected Results:
    ...     - 1.The step shall be collapsed

    [Tags]    BSP-OD-DIGIT-TRAVELER-VIEW-100      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-COMPLETE-01: Complete the form in the case all steps have been completed
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the “Collapse” button
    ...
    ...     Precondition: The Operation Staff or Operation Manager has completed all the steps on the RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1.Click on the [Submit] button
    ...
    ...     Expected Results:
    ...     - 1.The user shall be navigated to the Welcome page
    ...     - 2. Message at the bottom of the screen: “The form has been sent successfully”

    [Tags]    BSP-OD-DIGIT-TRAVELER-COMPLETE-01    FRS-70-01   manual     FRS-070-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-COMPLETE-02: Complete the form in the case a step is being edited without selecting the Update button
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Complete the form in the case a step is being edited without selecting the Update button
    ...
    ...     Precondition:
    ...     - 1. The Operation Staff or Operation Manager is on the RMA Traveler Form
    ...     - 2. The user edits the information in any field
    ...
    ...     Test Steps:
    ...     - 1. Click on the [Submit] button
    ...     - 2. On the pop-up window, select "Yes"
    ...     - 3. On the pop-up window, select "No"

    ...     Expected Results:
    ...     - 1.There shall be a pop-up window with the message “You have unsaved changes.
    ...     Are you sure you want to submit the form?” and 2 options (Yes, No)
    ...     - 2. "Yes": The form will be submitted without the changes
    ...     - 3. "No" The pop-up window will close, and the form will not be submitted.
    ...     The unsaved section will be automatically expanded if it was previously collapsed

    [Tags]    BSP-OD-DIGIT-TRAVELER-COMPLETE-02    FRS-70-01   manual     FRS-070-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-01: Observe the submitted form (In the case “non-repairable”, "Refurbish" is selected)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the submitted form
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...     - 2. The user selected “non-repairable” or "Refurbish" option at step 6
    ...
    ...     Test Steps:
    ...     - 1.Observe the detail of the form
    ...
    ...     Expected Results:
    ...     - 1.There are 6 steps displayed
    ...     - 2.There is no [Edit] button in step 1 and 6

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-01      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-02: Observe step 2 (Inspect packaging and product) (form has 6 steps)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit step 2
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...     - 2. The user selected “non-repairable” or "Refurbish" option at step 6
    ...
    ...     Test Steps:
    ...     - 1.Click the [Edit] button in step 2
    ...     - 2.Observe step 2
    ...
    ...     Expected Results:
    ...     - 1.The details of the step shall be displayed.
    ...     - 2.The [Update] button shall be disabled until there are changes in any field

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-02      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-03: Edit step 2 (Inspect packaging and product) (form has 6 steps)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user edits note, then click the [Update] button
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...     - 2. The user selected “non-repairable” or "Refurbish" option at step 6
    ...     - 3.Click the [Edit] button in step 2
    ...
    ...     Test Steps:
    ...     - 1.The user edits note,
    ...     - 2.Then click the [Update] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed,
    ...     - 2.And the task completed log shall be updated

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-03      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-04: Observe step 3 (Verify an active study) (form has 6 steps)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 3
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...     - 2. The user selected “non-repairable” or "Refurbish" option at step 6
    ...
    ...     Test Steps:
    ...     - 1.Click the [Edit] button in step 3
    ...     - 2. Observe step 3
    ...
    ...     Expected Results:
    ...     - 1.The details of the step shall be displayed.
    ...     - 2.The [Update] button shall be disabled until there are changes in any field

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-04      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-05: Edit step 3 (Verify an active study) (form has 6 steps)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user edits note, then click the [Update] button
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...     - 2. The user selected “non-repairable” or "Refurbish" option at step 6
    ...     - 3. Click the [Edit] button in step 3
    ...
    ...     Test Steps:
    ...     - 1.The user edits information,
    ...     - 2.Click the [Update] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed,
    ...     - 2.And the task completed log shall be updated

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-05      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-05.1: Observe step 4 (Reported device malfunction)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 4 (Reported device malfunction)
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...
    ...     Test Steps:
    ...     - 1.Click the [Edit] button in step 4
    ...
    ...     Expected Results:
    ...     - 1.The details of the step shall be displayed.
    ...     - 2.The [Update] button shall be disabled until there are changes in any field

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-05.1      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-05.2: Edit step 4 (Reported device malfunction)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user edits information, then click the [Update] button
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...     - 2.Click the [Edit] button in step 4
    ...
    ...     Test Steps:
    ...     - 1.The user edits information,
    ...     - 2.Click the [Update] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed,
    ...     - 2.And the task completed log shall be updated

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-05.2      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-05.6: Edit step 5 (Perform troubleshooting)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user edits information, then click the [Update] button
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...     - 2.Click the [Edit] button in step 5
    ...
    ...     Test Steps:
    ...     - 1.The user edits information,
    ...     - 2.Click the [Update] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed,
    ...    2.And the task completed log shall be updated

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-05.6      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-06: Observe the submitted form (form has 16 steps)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the submitted form
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...     - 2. The user completed 16 steps and submitted the form
    ...
    ...     Test Steps:
    ...     - 1.Observe the detail of the form
    ...
    ...     Expected Results:
    ...     - 1.There are all steps displayed in the form
    ...     - 2.There is no [Edit] button on:
    ...     - Step 1 (Sanitize with disinfectant)
    ...     - Step 6 (Verify device’s repairability)
    ...     - Step 10 (Device firmware)
    ...     - Step 14 (Charge device)
    ...     - Step 16 (Package device

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-06      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-07: Observe step 2 (Inspect packaging and product)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 2
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...
    ...     Test Steps:
    ...     - 1.Click the [Edit] button in step 2
    ...     - 2. Observe step 2
    ...
    ...     Expected Results:
    ...     - 1.The details of the step shall be displayed.
    ...     - 2.The [Update] button shall be disabled until there are changes in any field

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-07      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-08: Edit step 2 (Inspect packaging and product)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user edits information, then click the [Update] button
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...     - 2.Click the [Edit] button in step 2
    ...
    ...     Test Steps:
    ...     - 1.The user edits note,
    ...     - 2.Then click the [Update] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed,
    ...     - 2.And the task completed log shall be updated

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-08      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-09: Observe step 3 (Verify an active study)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 3
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...
    ...     Test Steps:
    ...     - 1.Click the [Edit] button in step 3
    ...
    ...     Expected Results:
    ...     - 1.The details of the step shall be displayed.
    ...     - 2.The [Update] button shall be disabled until there are changes in any field

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-09      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-10: Edit step 3 (Verify an active study)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user edits information, then click the [Update] button
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...     - 2.Click the [Edit] button in step 3
    ...
    ...     Test Steps:
    ...     - 1.The user edits information,
    ...     - 2.Click the [Update] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed,
    ...     - 2.And the task completed log shall be updated

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-10      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-11: Observe step 4 (Reported device malfunction)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 4 (Reported device malfunction)
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...
    ...     Test Steps:
    ...     - 1.Click the [Edit] button in step 4
    ...
    ...     Expected Results:
    ...     - 1.The details of the step shall be displayed.
    ...     - 2.The [Update] button shall be disabled until there are changes in any field

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-11      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-12: Edit step 4 (Reported device malfunction)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user edits information, then click the [Update] button
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...     - 2.Click the [Edit] button in step 4
    ...
    ...     Test Steps:
    ...     - 1.The user edits information,
    ...     - 2.Click the [Update] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed,
    ...     - 2.And the task completed log shall be updated

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-12      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-13: Observe step 5 (Verify an active study)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 5
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...
    ...     Test Steps:
    ...     - 1.Click the [Edit] button in step 5
    ...     - 2. Observe step 5
    ...
    ...     Expected Results:
    ...     - 1.The details of the step shall be displayed.
    ...     - 2.The [Update] button shall be disabled until there are changes in any field

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-13      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-14: Edit step 5 (Perform troubleshooting)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user edits information, then click the [Update] button
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...     - 2.Click the [Edit] button in step 5
    ...
    ...     Test Steps:
    ...     - 1.The user edits information,
    ...     - 2.Click the [Update] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed,
    ...    2.And the task completed log shall be updated

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-14      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-16: Edit step 5 (Perform troubleshooting)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user edits information, then click the [Update] button
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...     - 2.Click the [Edit] button in step 5
    ...
    ...     Test Steps:
    ...     - 1.The user edits information,
    ...     - 2.Click the [Update] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed,
    ...     - 2.And the task completed log shall be updated

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-16      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-15: Observe step 7 (Perform repair)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 7
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...
    ...     Test Steps:
    ...     - 1.Click the [Edit] button in step 7
    ...     - 2.Observe step 7
    ...
    ...     Expected Results:
    ...     - 1.The details of the step shall be displayed.
    ...     - 2.The [Update] button shall be disabled until there are changes in any field

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-15      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-17: Observe step 8 (Lock ECG cable | WI-1306-5)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 8
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...
    ...     Test Steps:step
    ...     - 1.Click the [Edit] button in 8
    ...
    ...     Expected Results:
    ...     - 1.The details of the step shall be displayed.
     ...    - 2.The [Update] button shall be disabled until there are changes in any field

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-17      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-18: Edit step 8 (Lock ECG cable | WI-1306-5)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user edits information, then click the [Update] button
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...     - 2.Click the [Edit] button in step 8
    ...
    ...     Test Steps:
    ...     - 1.The user edits information,
    ...     - 2.Click the [Update] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed,
    ...    - 2.And the task completed log shall be updated

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-18      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-19: Observe step 9 (Install sim card | WI-1306-1)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 9
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...
    ...     Test Steps:
    ...     - 1.Click the [Edit] button in step 9
    ...
    ...     Expected Results:
    ...     - 1.The details of the step shall be displayed.
    ...     - 2.The [Update] button shall be disabled until there are changes in any field

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-19      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-20: Edit step 9 (Install sim card | WI-1306-1)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user edits information, then click the [Update] button
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...     - 2.Click the [Edit] button in step 9
    ...
    ...     Test Steps:
    ...     - 1.The user edits information,
    ...     - 2.Click the [Update] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed,
    ...     - 2.And the task completed log shall be updated

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-20      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-21: Observe step 10 (Device firmware)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 10
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...
    ...     Test Steps:step
    ...     - 1.Click the [Edit] button in step 10
    ...     - 2.Observe step 10
    ...
    ...     Expected Results:
    ...     - 1.The details of the step shall be displayed.
    ...     - 2.The [Update] button shall be disabled until there are changes in any field

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-21      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-22: Edit step 10 (Device firmware)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user edits information, then click the [Update] button
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...     - 2.Click the [Edit] button in step 10
    ...
    ...     Test Steps:
    ...     - 1.The user edits information,
    ...     - 2.Click the [Update] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed,
    ...     - 2.And the task completed log shall be updated

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-22      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-23: Observe step 11 (RMA resolution)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 11
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...
    ...     Test Steps:
    ...     - 1. Click the [Edit] button in step 11
    ...     - 2. Observe step 11
    ...
    ...     Expected Results:
    ...     - 1.The details of the step shall be displayed.
    ...     - 2.The [Update] button shall be disabled until there are changes in any field

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-23      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-25: Edit step 11 (RMA resolution)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user edits information, then click the [Update] button
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...     - 2.Click the [Edit] button in step 11
    ...
    ...     Test Steps:
    ...     - 1.The user edits information,
    ...     - 2.Click the [Update] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed,
    ...     - 2.And the task completed log shall be updated

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-25      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-28: Observe step 12 (Perform functional Test | WI-1306-4)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 13
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...
    ...     Test Steps:
    ...     - 1.Click the [Edit] button in step 12
    ...     - 2.Observe step 13
    ...
    ...     Expected Results:
    ...     - 1.The details of the step shall be displayed.
    ...     - 2.The [Update] button shall be disabled until there are changes in any field

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-28      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-29: Edit step 12 (Perform functional Test | WI-1306-4)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user edits information, then click the [Update] button
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] buttonstep of the New/ Approved RMA Traveler form
    ...     - 2.Click the [Edit] button
    ...
    ...     Test Steps:
    ...     - 1.The user edits information,
    ...     - 2.Click the [Update] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed,
    ...     - 2.And the task completed log shall be updated

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-29      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-26: Observe step 13 (RMA Billing Resolution)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 13
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...
    ...     Test Steps:
    ...     - 1.Click the [Edit] button in step 13
    ...     - 2. Observe step 13
    ...
    ...     Expected Results:
    ...     - 1.The details of the step shall be displayed.
    ...     - 2.The [Update] button shall be disabled until there are changes in any field

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-26      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-27: Edit step 13 (RMA Billing Resolution)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user edits information, then click the [Update] button
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...     - 2.Click the [Edit] button in step 13
    ...
    ...     Test Steps:
    ...     - 1.The user edits information,
    ...     - 2.Click the [Update] button
    ...
    ...     Expected Results:
    ...     - 1.The step shall be automatically collapsed,
    ...     - 2.And the task completed log shall be updated

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-27      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-30: Observe step 15 (Device label)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe step 15
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...
    ...     Test Steps:
    ...     - 1.Click the [Edit] button in step 15
    ...
    ...     Expected Results:
    ...     - 1.The details of the step shall be displayed.
    ...     - 2.The [Update] button shall be disabled until there are changes in any field

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-30      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-31: Edit step 15 (Device label)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user edits information, then click the [Update] button
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...     - 2.Click the [Edit] button in step 15
    ...
    ...     Test Steps:
    ...     - 1.The user edits information,
    ...     - 2.Click the [Update] button
    ...
    ...     Expected Results:
    ...     - 1.A step shall be automatically collapsed.
    ...     - 2.And the task completed log shall be updated

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-31      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-32: Edit the note in the note textbox.
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the note in the note textbox.
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] button of the New/ Approved RMA Traveler form
    ...
    ...     Test Steps:
    ...     - 1.In the Notes text box, edit note
    ...
    ...     Expected Results:
    ...     - 1.The text should be automatically updated when user clicks outside the text box

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-32      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-33: Close the form in the case there is no step that is being edited
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Close the form in the case there is no step that is being edited
    ...
    ...
    ...     Precondition:
    ...     - 1.The Operation Staff or Operation Manager is on the RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1.Click on the [Back] button
    ...
    ...     Expected Results:
    ...     - 1.Upon clicking this button, the user will be redirected to the Welcome page,
    ...     with the previously entered Device ID still maintained on the “Device ID” text field,
    ...     and none of the progress will be lost

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-33      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-34: Close the form in the case a step is being edited without selecting the Update button
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Close the form in the case a step is being edited without selecting the Update button
    ...
    ...     Precondition:
    ...     - 1.The step is being edited without selecting the Update button
    ...
    ...     Test Steps:
    ...     - 1.Click on the [Back] button
    ...     - 2. On the pop-up window, select the option Yes
    ...     - 3. On the pop-up window, select the option No
    ...
    ...     Expected Results:
    ...     - 1.There shall be a pop-up window with the message “You have unsaved changes.
    ...     Are you sure you want to close the form?” and 2 options (Yes, No)
    ...     - 2. The form will be closed without saving changes,
    ...     - 3. The pop-up window will close, and the user will not be redirected.
    ...     The unsaved section will be automatically expanded if it was previously collapsed

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-34      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EDIT-35: Edit step 13, input an invalid study ID (Perform functional Test | WI-1306-4)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user edits information, then click the [Update] button
    ...
    ...     Precondition:
    ...     - 1. On S&D portal, RMA Traveler form tab, Form detail,
    ...     the user clicks on [Edit] buttonstep of the New/ Approved RMA Traveler form
    ...     - 2.Click the [Edit] button
    ...
    ...     Test Steps:
    ...     - 1.The user edits information, input an invalid study ID
    ...     - 2.Click the [Update] button
    ...
    ...     Expected Results:
    ...     - 1.There shall be a message "Invalid Study ID. Please check again.”

    [Tags]    BSP-OD-DIGIT-TRAVELER-EDIT-35      FRS-073-01    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EMAIL-35: Notification email for new RMA Traveler form (non-repairable)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Notification email for new RMA Traveler form (non-repairable)
    ...
    ...     Precondition:
    ...     - 1.The Operation Staff or Operation Manager selected "Non-repairable" in step 4, filled out all required fields
    ...
    ...     Test Steps:
    ...     - 1.The Operation Staff or Operation Manager submitted a new RMA Traveler Forms
    ...     - 2. Check the email send to OM
    ...
    ...     Expected Results:
    ...     - 1.The Operation Manager shall be received an email.
    ...     - 2.Subject: New RMA Traveler form of Device ID [Device ID] in RMA [RMA ID]
    ...     The RMA Traveler form of the Device ID [Device ID] in RMA [RMA ID] has been submitted successfully.
    ...     Please go to the portal and review it.

    [Tags]    BSP-OD-DIGIT-TRAVELER-EMAIL-35      FRS-074-01    manual     FRS-074-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EMAIL-36: Notification email for new RMA Traveler form (Refurbished)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Notification email for new RMA Traveler form (Refurbished)
    ...
    ...     Precondition:
    ...     - 1.The Operation Staff or Operation Manager selected "Refurbished" in step 4, filled out all required fields
    ...
    ...     Test Steps:
    ...     - 1.The Operation Staff or Operation Manager submitted a new RMA Traveler Forms
    ...     - 2. Check the email send to OM
    ...
    ...     Expected Results:
    ...     - 1.The Operation Manager shall be received an email.
    ...     - 2.Subject: New RMA Traveler form of Device ID [Device ID] in RMA [RMA ID]
    ...     The RMA Traveler form of the Device ID [Device ID] in RMA [RMA ID] has been submitted successfully.
    ...     Please go to the portal and review it.

    [Tags]    BSP-OD-DIGIT-TRAVELER-EMAIL-36      FRS-074-01    manual     FRS-074-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-TRAVELER-EMAIL-37: Notification email for new RMA Traveler form (16 steps)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Notification email for new RMA Traveler form (16 steps)
    ...
    ...     Precondition:
    ...     - 1.The Operation Staff or Operation Manager selected "repairable" in step 4, completed the form
    ...
    ...     Test Steps:
    ...     - 1.The Operation Staff or Operation Manager submitted a new RMA Traveler Forms
    ...     - 2. Check the email send to OM
    ...
    ...     Expected Results:
    ...     - 1.The Operation Manager shall be received an email.
    ...     - 2.Subject: New RMA Traveler form of Device ID [Device ID] in RMA [RMA ID]
    ...     The RMA Traveler form of the Device ID [Device ID] in RMA [RMA ID] has been submitted successfully.
    ...     Please go to the portal and review it.

    [Tags]    BSP-OD-DIGIT-TRAVELER-EMAIL-37      FRS-074-01    manual     FRS-074-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-BIOFT-01: Check that Cancel button must be displayed when edit information in Install SIM card step
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In the Operation Form, when editing information in the Insert SIM card step, the Cancel button must be displayed
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Operation form of Bioflux device
    ...
    ...     Test Steps:
    ...     - 1. At Install SIM card step, click [Edit] button
    ...     - 2. Observe the Edit form
    ...
    ...     Expected Results:
    ...     - Cancel button is displayed

    [Tags]       BSP-OD-DIGIT-BIOFT-01    RS-071    SC-1.11.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-BIOFT-02: Check that information is not changed when clicking Cancel button in Install SIM card step
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In the Operation Form, when clicking Cancel button in the Insert SIM card step, information is not changed
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Operation form of Bioflux device
    ...
    ...     Test Steps:
    ...     - 1. At Install SIM card step, click [Edit] button
    ...     - 2. Enter another SIM card serial number/SIM card carrier
    ...     - 3. Click [Cancel] button
    ...
    ...     Expected Results:
    ...     - 1. Information is not changed
    ...     - 2. Cancel editing mode

    [Tags]       BSP-OD-DIGIT-BIOFT-02    RS-071    SC-1.11.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-BIOFT-03: Check that Cancel button must be displayed when edit information in Perform Functional Test step
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In the Operation Form, when editing information in Perform Functional Test step, the Cancel button must be displayed
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Operation form of Bioflux device
    ...
    ...     Test Steps:
    ...     - 1. At Perform Functional Test step, click [Edit] button
    ...     - 2. Observe the Edit form
    ...
    ...     Expected Results:
    ...     - Cancel button is displayed

    [Tags]      BSP-OD-DIGIT-BIOFT-03     RS-071    SC-1.11.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-BIOFT-04: Check that information is not changed when clicking Cancel button in Perform Functional Test step
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In the Operation Form, when clicking Cancel button in the Perform Functional Test step, information is not changed
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Operation form of Bioflux device
    ...
    ...     Test Steps:
    ...     - 1. At Install SIM card step, click [Edit] button
    ...     - 2. Enter another Test result
    ...     - 3. Click [Cancel] button
    ...
    ...     Expected Results:
    ...     - 1. Information is not changed
    ...     - 2. Cancel editing mode

    [Tags]       BSP-OD-DIGIT-BIOFT-04     RS-071    SC-1.11.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}


BSP-OD-DIGIT-BIOT-01: Check that Cancel button must be displayed when edit information in Perform Functional Test step
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In the Operation Form, when editing information in Perform Functional Test step, the Cancel button must be displayed
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Operation form of Biotres device
    ...
    ...     Test Steps:
    ...     - 1. At Perform Functional Test step, click [Edit] button
    ...     - 2. Observe the Edit form
    ...
    ...     Expected Results:
    ...     - Cancel button is displayed

    [Tags]       BSP-OD-DIGIT-BIOT-01    RS-072    SC-1.11.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-BIOT-02: Check that information is not changed when clicking Cancel button in Perform Functional Test step
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In the Operation Form, when clicking Cancel button in the Perform Functional Test step, information is not changed
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Operation form of Biotres device
    ...
    ...     Test Steps:
    ...     - 1. At Install SIM card step, click [Edit] button
    ...     - 2. Enter another information
    ...     - 3. Click [Cancel] button
    ...
    ...     Expected Results:
    ...     - 1. Information is not changed
    ...     - 2. Cancel editing mode

    [Tags]      BSP-OD-DIGIT-BIOT-02     RS-072    SC-1.11.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-BIOFT-05: Check that order of steps must be correct
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In the Operation Form, when clicking Cancel button in the Perform Functional Test step, information is not changed
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Operation form of Bioflux device
    ...
    ...     Test Steps:
    ...     - Observe order of steps
    ...
    ...     Expected Results:
    ...     - The order of steps:
    ...     - 1. Sanitize with disinfectant
    ...     - 2. Inspect packaging and product
    ...     - 3. Verify an active study
    ...     - 4. Reported device malfunction
    ...     - 5. Perform troubleshooting
    ...     - 6. Verify device’s repairability
    ...     - 7. Perform repair
    ...     - 8. Lock ECG cable | WI-1306-5
    ...     - 9. Install SIM card | WI-1306-1
    ...     - 10. Device firmware
    ...     - 11. RMA resolution
    ...     - 12. Perform functional test | WI-1306-4
    ...     - 13. RMA Billing Resolution
    ...     - 14. Charge device
    ...     - 15. Device label
    ...     - 16. Package device

    [Tags]       BSP-OD-DIGIT-BIOFT-05    RS-073    SC-1.11.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-BIOFT-06: Check that Failure Analysis must not be displayed in Verify device’s repairability step
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In the Operation Form, when user select “Repairable” option, Failure Analysis field is not displayed
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Operation form of Bioflux device
    ...
    ...     Test Steps:
    ...     - 1. Go to Verify device’s repairability step.
    ...     - 2. Select Repairable option.
    ...     - 3. Observe the form
    ...
    ...     Expected Results:
    ...     - Do not display Failure Analysis field

    [Tags]       BSP-OD-DIGIT-BIOFT-06     RS-073    SC-1.11.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-BIOFT-07: In the Operation Form, when user select “Repairable” option, Failure Analysis field is not displayed
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In the Operation Form, when user select “Repairable” option, Failure Analysis field is not displayed
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Operation form of Bioflux device
    ...
    ...     Test Steps:
    ...     - 1. Go to Verify device’s repairability step.
    ...     - 2. Select Repairable option.
    ...     - 3. Observe the form
    ...
    ...     Expected Results:
    ...     - Do not display Failure Analysis field

    [Tags]       BSP-OD-DIGIT-BIOFT-07    RS-073    SC-1.11.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-BIOFT-08: Check that Cancel button must be displayed after submitting form
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In the Operation Form, after submitting form, the Cancel button must be displayed
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Operation form of Bioflux device
    ...
    ...     Test Steps:
    ...     - 1. After submitting form, click [Edit] button
    ...     - 2. Observe the Edit form
    ...
    ...     Expected Results:
    ...     - Cancel button is displayed

    [Tags]      BSP-OD-DIGIT-BIOFT-08     RS-073    SC-1.11.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-OD-DIGIT-BIOFT-09: Check that information is not changed when clicking Cancel button after submitting form
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In the Operation Form, when clicking Cancel button after submitting form, information is not changed
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Operation form of Bioflux device
    ...
    ...     Test Steps:
    ...     - 1. After submitting form, click [Edit] button
    ...     - 2. Edit information
    ...     - 3. Click [Save] button
    ...
    ...     Expected Results:
    ...     - 1. Information is not changed
    ...     - 2. Cancel editing mode

    [Tags]       BSP-OD-DIGIT-BIOFT-09    RS-071    SC-1.11.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library    project_operation_digitalization/lib/web/Common.py    ${BROWSER_NODE}   ${ENV}
    Set Suite Variable  ${BROWSER_NODE}
    ${USER}    Get Config Param    USER_DIGITALIZATION
    ${VERSION}      Navigate To Operation Digitalization Portal
    Set Suite Variable      ${USER}
    Set Suite Metadata    version   ${VERSION}
    Set Suite Metadata    browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser
