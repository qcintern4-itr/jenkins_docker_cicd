*** Settings ***
Documentation  Bioheart portal Settings test suite
Metadata    sid   BHP-SETTING
Metadata  owner   Linh Tran
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioheart_portal/lib/ConfigHandler.py   ${ENV}
Library     corelib/AssertionExtension.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags  BHP-SETTING     web
Test Timeout  1h

*** Test Cases ***
BHP-SETTING-VIEWSETTINGS-01: View setting
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Setting button on the right-sidebar
    ...    - 2. Check
    ...
    ...     Expected Output:
    ...    - 1. Settings screen is opened
    ...    - 2. There shall be components:
    ...     + Integration
    ...     + Notifications
    ...     + Account
    [Tags]  BHP-SETTING-VIEWSETTINGS-01     auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Settings
    ${components}  Get Components Settings Title
    ${components_expect}        Create List       Integration    Notifications     Account
    Run Keyword And Continue On Failure     Should Be Equal     ${components}     ${components_expect}
    Open Settings    is_open=${False}   is_close=${True}
    Sign Out Bioheart Portal

BHP-SETTING-VIEWSETTINGS-02: Close Setting screen
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Setting button on the right-sidebar
    ...    - 2. Click on X icon button or click outside
    ...
    ...     Expected Output:
    ...    - 1. Settings screen is opened
    ...    - 2.  Settings screen is closed
    [Tags]  BHP-SETTING-VIEWSETTINGS-02     auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Settings
    ${settings_screen}      Page Is On Screen
    Run Keyword And Continue On Failure     Should Be Equal     ${settings_screen}       settings
    Open Settings        is_open=${False}   is_close=${True}
    ${overview_screen}      Page Is On Screen
    Run Keyword And Continue On Failure     Should Be Equal     ${overview_screen}       overview
    Sign Out Bioheart Portal

BHP-SETTING-INTEGRATIONSETTINGS-01: The user has not registered for Biocare Cardiac care plan
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Setting button on the right-sidebar
    ...    - 2. Click on Learn more button
    ...
    ...     Expected Output:
    ...    - 1. Settings screen is opened and there shall be a message You are not registered for a Biocare Cardiac care plan
    ...    - 2. Navigate to the https://www.biotricity.com/ site with a new tab
    [Tags]  BHP-SETTING-INTEGRATIONSETTINGS-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SETTING-INTEGRATIONSETTINGS-02: There is no clinic integration
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Go to https://delta.cardiac.bioflux.io/ site
    ...    - 2. Create a care plan
    ...    - 3. Start this care plan
    ...    - 4. Go to https://biosphere.delta.bioheart.bioflux.io/ site
    ...    - 5. Click on Settings tab on the right-sidebar
    ...
    ...     Expected Output:
    ...    - 1. The site is opened
    ...    - 2. Care plan is created
    ...    - 3. Care plan is started
    ...    - 4. The site is opened
    ...    - 5. Setting screen is opened and there shall be a message No clinic integration
    [Tags]  BHP-SETTING-INTEGRATIONSETTINGS-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SETTING-INTEGRATIONSETTINGS-03: There is a clinic integration
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Go to https://delta.cardiac.bioflux.io/ site
    ...    - 2. Create a care plan
    ...    - 3. Start this care plan
    ...    - 4. Enable Bioheart monitor
    ...    - 5. Go to https://biosphere.delta.bioheart.bioflux.io/ site
    ...    - 6. Click on Settings tab on the right-sidebar
    ...
    ...     Expected Output:
    ...    - 1. The site is opened
    ...    - 2. Care plan is created
    ...    - 3. Care plan is started
    ...    - 4. Bioheart monitor is enabled
    ...    - 5. The site is opened
    ...    - 6. Setting screen is opened and there shall be a clinic with turn off toggle
    [Tags]  BHP-SETTING-INTEGRATIONSETTINGS-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SETTING-INTEGRATIONSETTINGS-04: There is a clinic integration
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Go to https://delta.cardiac.bioflux.io/ site
    ...    - 2. Create a care plan
    ...    - 3. Start this care plan
    ...    - 4. Enable Bioheart monitor
    ...    - 5. Go to https://biosphere.delta.bioheart.bioflux.io/ site
    ...    - 6. Click on Settings tab on the right-sidebar
    ...    - 7. Turn on Clinic integration toggle
    ...
    ...     Expected Output:
    ...    - 1. The site is opened
    ...    - 2. Care plan is created
    ...    - 3. Care plan is started
    ...    - 4. Bioheart monitor is enabled
    ...    - 5. The site is opened
    ...    - 6. Setting screen is opened and there shall be a clinic with turn off toggle
    ...    - 7. The toggle is on and Bioheart report started integration to Biocare Cardiac
    [Tags]  BHP-SETTING-INTEGRATIONSETTINGS-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SETTING-NOTIFICATIONSETTINGS-01: Set high heart rate notification
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...     - 1. Click on the Setting button on the right-sidebar
    ...     - 2. Click on the High Heart rate notification card
    ...     - 3. Select Heart rate value
    ...     - 4. Click on the High Heart rate notification card again
    ...
    ...     Expected Output:
    ...     - 1. Settings screen is opened
    ...     - 2. List of High Heart rate values is displayed
    ...     - 3. Selected Heart rate value displayed
    ...     - 4. List of High Heart rate values is hidden
    [Tags]  BHP-SETTING-NOTIFICATIONSETTINGS-01     auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Settings
    Set Heart Rate Notifications Settings     high_heart=140 bpm
    ${list_items}    Get Value Heart Rate Notifications
    ${high_hr}      Create List        Off    100 bpm    110 bpm   120 bpm   130 bpm    140 bpm    150 bpm
    Run Keyword And Continue On Failure     Should Be Equal     ${list_items}[high hr]       ${high_hr}
    ${hr_selected}   Get Value Heart Rate Notifications Selected
    Run Keyword And Continue On Failure     Should Be Equal     ${hr_selected}[high hr]       140 bpm
    Set Heart Rate Notifications Settings     close_high_hr=${True}
    ${expanded}     Notifications Settings Is Expanded
    Run Keyword And Continue On Failure     Should Be Equal     ${expanded}[high hr]       false
    Open Settings        is_open=${False}   is_close=${True}
    Sign Out Bioheart Portal

BHP-SETTING-NOTIFICATIONSETTINGS-02: Set low heart rate notification
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...     - 1. Click on the Setting button on the right-sidebar
    ...     - 2. Click on the Low Heart rate notification card
    ...     - 3. Select Heart rate value
    ...     - 4. Click on the Low Heart rate notification card again
    ...
    ...     Expected Output:
    ...     - 1. Settings screen is opened
    ...     - 2. List of Low Heart rate values is displayed
    ...     - 3. Selected Heart rate value displayed
    ...     - 4. List of Low Heart rate values is hidden
    [Tags]  BHP-SETTING-NOTIFICATIONSETTINGS-02     auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Settings
    Set Heart Rate Notifications Settings     low_heart=40 bpm
    ${list_items}    Get Value Heart Rate Notifications
    ${low_hr}      Create List        Off    40 bpm    45 bpm   50 bpm
    Run Keyword And Continue On Failure     Should Be Equal     ${list_items}[low hr]       ${low_hr}
    ${hr_selected}   Get Value Heart Rate Notifications Selected
    Run Keyword And Continue On Failure     Should Be Equal     ${hr_selected}[low hr]       40 bpm
    Set Heart Rate Notifications Settings     close_low_hr=${True}
    ${expanded}     Notifications Settings Is Expanded
    Run Keyword And Continue On Failure     Should Be Equal     ${expanded}[low hr]       false
    Open Settings        is_open=${False}   is_close=${True}
    Sign Out Bioheart Portal

BHP-SETTING-NOTIFICATIONSETTINGS-03: Check setting sync to Bioheart app
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...     - 1. Click on the Setting button on the right-sidebar
    ...     - 2. Select High/Low Heart rate value
    ...     - 3. Check the value in the Bioheart app
    ...
    ...     Expected Output:
    ...     - 1. Settings screen is opened
    ...     - 2. Selected High/Low Heart rate value displayed
    ...     - 3. High/Low Heart rate setting is synced to the Bioheart app
    [Tags]  BHP-SETTING-NOTIFICATIONSETTINGS-03     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SETTING-CHANGEPASSWORD-01: Change password
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...     - 1. Click on the Setting button on the right-sidebar
    ...     - 2. Click on the Change password button
    ...     - 3. Enter a Current password
    ...     - 4. Enter a New password
    ...     - 5. Enter Confirm new password
    ...     - 6. Click on the Update button
    ...     - 7. Click on the Sign in Now button or reload the page
    ...
    ...     Expected Output:
    ...     - 1. Settings screen is opened
    ...     - 2. Navigate to the Change password screen
    ...     - 3. Enter the Current password successfully, the password is hidden
    ...     - 4. Enter a New password successfully, the password is hidden
    ...     - 5. Enter Confirm new password successfully, the password is hidden and the Update button is enabled
    ...     - 6. The password is updated successfully the user will be signed out and navigated to the Password updated screen
    ...     - 7. Navigate to the Welcome screen
    [Tags]  BHP-SETTING-CHANGEPASSWORD-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SETTING-CHANGEPASSWORD-02: Enter wrong current password
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...     - 1. Click on the Setting button on the right-sidebar
    ...     - 2. Click on the Change password button
    ...     - 3. Enter the wrong Current password
    ...     - 4. Enter a New password
    ...     - 5. Enter Confirm new password
    ...     - 6. Click on the Update button
    ...
    ...     Expected Output:
    ...     - 1. Settings screen is opened
    ...     - 2. Navigate to the Change password screen
    ...     - 3. Enter the Current password successfully, the password is hidden
    ...     - 4. Enter a New password successfully, the password is hidden
    ...     - 5. Enter Confirm new password successfully, the password is hidden and the Update button is enabled
    ...     - 6. There shall be a message You have entered the wrong.
    ...          Please type again the Current password's outline is changed to red and the Update button is disabled
    [Tags]  BHP-SETTING-CHANGEPASSWORD-02       auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Settings       open_change_pass=${True}
    ${wrong_pass}    Catenate   ${USER}[1][password]    abc
    ${new_pass}      Catenate   ${USER}[1][password]    123
    Change Password     current_pass=${wrong_pass}      new_pass=${new_pass}     confirm_new_pass=${new_pass}
    ${message}      Get Error Message
    Run Keyword And Continue On Failure     Should Be Equal     ${message}       You have entered the wrong password. Pleasy type again.
    Change Password      is_update=${False}         is_back=${True}
    Open Settings        is_open=${False}   is_close=${True}
    Sign Out Bioheart Portal

BHP-SETTING-CHANGEPASSWORD-03: Enter wrong current password more than 5 times
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...     - 1. Click on the Setting button on the right-sidebar
    ...     - 2. Click on the Change password button
    ...     - 3. Enter the wrong Current password the 1st time
    ...     - 4. Enter a New password
    ...     - 5. Enter Confirm new password
    ...     - 6. Click on the Update button
    ...     - 7. Repeat step 3 and 6 more than 5 times
    ...
    ...     Expected Output:
    ...     - 1. Settings screen is opened
    ...     - 2. Navigate to the Change password screen
    ...     - 3. Enter the Current password successfully, the password is hidden
    ...     - 4. Enter a New password successfully, the password is hidden
    ...     - 5. Enter Confirm new password successfully, the password is hidden and the Update button is enabled
    ...     - 6. There shall be a message You have entered the wrong.
    ...        - Please type again the Current password's outline is changed to red and the Update button is disabled
    ...     - 7. There shall be a message Too many failed attempts were recorded. You can't update your password now.
    ...          Please try again later. and this message will be displayed every time the user clicks on the Update button for 1 hour
    [Tags]  BHP-SETTING-CHANGEPASSWORD-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SETTING-CHANGEPASSWORD-04: Change password failed when there is no internet
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...     - 1. Click on the Setting button on the right-sidebar
    ...     - 2. Click on the Change password button
    ...     - 3. Enter a Current password
    ...     - 4. Enter a New password
    ...     - 5. Enter Confirm new password
    ...     - 6. Click on the Update button
    ...
    ...     Expected Output:
    ...     - 1. Settings screen is opened
    ...     - 2. Navigate to the Change password screen
    ...     - 3. Enter the Current password successfully, the password is hidden
    ...     - 4. Enter a New password successfully, the password is hidden
    ...     - 5. Enter Confirm new password successfully, the password is hidden and the Update button is enabled
    ...     - 6. There shall be a message No internet connection. Please check your connection and try again
    [Tags]  BHP-SETTING-CHANGEPASSWORD-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SETTING-CHANGEPASSWORD-05: Check passwords don't match
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...     - 1. Click on the Setting button on the right-sidebar
    ...     - 2. Click on the Change password button
    ...     - 3. Enter a Current password
    ...     - 4. Enter a New password
    ...     - 5. Enter Confirm new password doesn't match with New password
    ...     - 6. Click on the Update button
    ...
    ...     Expected Output:
    ...     - 1. Settings screen is opened
    ...     - 2. Navigate to the Change password screen
    ...     - 3. Enter the Current password successfully, the password is hidden
    ...     - 4. Enter a New password successfully, the password is hidden
    ...     - 5. Enter Confirm new password successfully, the password is hidden and the Update button is enabled
    ...     - 6. There shall be a message No internet connection. Please check your connection and try again
    [Tags]  BHP-SETTING-CHANGEPASSWORD-05       auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Settings           open_change_pass=${True}
    Change Password     current_pass=${USER}[1][password]      new_pass=${USER}[1][password]123     confirm_new_pass=${USER}[1][password]456    is_update=${False}
    ${message}      Get Error Message
    Run Keyword And Continue On Failure     Should Be Equal     ${message}       Your passwords don't match. Please check again.
    Change Password      is_update=${False}         is_back=${True}
    Open Settings        is_open=${False}   is_close=${True}
    Sign Out Bioheart Portal

BHP-SETTING-CHANGEPASSWORD-06: Check eye icon
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...     - 1. Click on the Setting button on the right-sidebar
    ...     - 2. Click on the Change password button
    ...     - 3. Enter a Current password
    ...     - 4. Enter a New password
    ...     - 5. Enter Confirm new password
    ...     - 6. Click on the eye icon
    ...     - 7. Click on the eye icon again
    ...
    ...     Expected Output:
    ...     - 1. Settings screen is opened
    ...     - 2. Navigate to the Change password screen
    ...     - 3. Enter the Current password successfully, the password is hidden
    ...     - 4. Enter a New password successfully, the password is hidden
    ...     - 5. Enter Confirm new password successfully, the password is hidden
    ...     - 6. The passwords are displayed
    ...     - 7. The passwords are hidden
    [Tags]  BHP-SETTING-CHANGEPASSWORD-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SETTING-CHANGEPASSWORD-07: Check back icon button
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...     - 1. Click on the Setting button on the right-sidebar
    ...     - 2. Click on the Change password button
    ...     - 3. Enter a Current password
    ...     - 4. Enter a New password
    ...     - 5. Enter Confirm new password
    ...     - 6. Click on the back icon button
    ...     - 7. Click on the Change password button again
    ...
    ...     Expected Output:
    ...     - 1. Settings screen is opened
    ...     - 2. Navigate to the Change password screen
    ...     - 3. Enter the Current password successfully, the password is hidden
    ...     - 4. Enter a New password successfully, the password is hidden
    ...     - 5. Enter Confirm new password successfully, the password is hidden and the Update button is enabled
    ...     - 6. Navigate to the Settings screen
    ...     - 7. Navigate to the Change password screen, the entered data is cleared
    [Tags]  BHP-SETTING-CHANGEPASSWORD-07      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SETTING-CHANGEPASSWORD-08: Check back icon button
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...     - 1. Click on the Setting button on the right-sidebar
    ...     - 2. Click on the Change password button
    ...     - 3. Leave blank all fields
    ...     - 4. Click on the back icon button
    ...
    ...     Expected Output:
    ...     - 1. Settings screen is opened
    ...     - 2. Navigate to the Change password screen
    ...     - 3. All fields are empty
    ...     - 4. Navigate to the Change password screen
    [Tags]  BHP-SETTING-CHANGEPASSWORD-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library    project_bioheart_portal/lib/web/Common.py    ${BROWSER_NODE}  ${ENV}
    Import Library    project_bioheart_portal/lib/web/Profile.py    ${BROWSER_NODE}  ${ENV}
    Import Library    project_bioheart_portal/lib/web/Setting.py    ${BROWSER_NODE}  ${ENV}
    Set Suite Variable  ${BROWSER_NODE}
    ${USER}    Get Config Param    USER
    Set Suite Variable      ${USER}
    ${VERSION}      Navigate To Bioheart Sign In Page
    Set Suite Metadata    version   ${VERSION}
    Set Suite Metadata    browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Settings
    Set Heart Rate Notifications Settings     high_heart=Off       low_heart=Off
    Open Settings        is_open=${False}   is_close=${True}
    Quit Browser
