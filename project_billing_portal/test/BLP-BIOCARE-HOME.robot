*** Settings ***
Documentation   Test Suite - Biocare Home page
Metadata    sid     BLP-BIOCARE-HOME
Metadata    owner   Trinh Nguyen
Library    Collections
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py    ${ENV}
Library     project_biocare_portal/lib/web/Common.py

Suite Setup         SUITE SETUP
Suite Teardown      SUITE TEARDOWN
Force Tags          BLP-BIOCARE-HOME   web
Test Timeout        5m

*** Test Cases ***
BLP-BIOCARE-HOME-VIEW-01: View Biocare Portal home page
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. User can view their information:
    ...     - Avatar
    ...     - Fullname, Title: If there is no title, only the fullname will be displayed.
    ...     - Username
    ...     - Email
    ...     - Country
    ...     - Address
    ...     - Day phone number
    ...     - After hout phone number
    ...     - Fax number
    ...     - Role
    ...     2. User can view a list of clinics they work for
    ...     3. User can view a list of portals they are allowed to access. Including:
    ...     - Insurance and Billing portal
    ...     - Pay Invoice link

    [Tags]      BLP-BIOCARE-HOME-VIEW-01    manual   CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-VIEW-02: Can navigate to Insurance and Billing portal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BLP-BIOCARE-HOME-VIEW-02    manual   CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-VIEW-03: Can navigate the user to the YayPay customer link
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BLP-BIOCARE-HOME-VIEW-03    manual   CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-VIEW-04: Check case user is on Biocare and Billing portal <same browser>, then Admin let the account to deactivate
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BLP-BIOCARE-HOME-VIEW-04    manual   CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-VIEW-05: Check case user is on Biocare and Billing portal <not same browser>, then Admin let the account to deactivate
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BLP-BIOCARE-HOME-VIEW-05    manual   CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-VIEW-06: Check case user is on Biocare and Billing portal <same browser>, then Admin let the facility to closed status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BLP-BIOCARE-HOME-VIEW-06    manual   CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-VIEW-07: Check case user is on Biocare and Billing portal <not same browser>, then Admin let the facility to closed status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BLP-BIOCARE-HOME-VIEW-07    manual   CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BLP-BIOCARE-HOME-PROFILE-PICTURE-01: Can change profile picture
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BLP-BIOCARE-HOME-PROFILE-PICTURE-01      manual   CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-PROFILE-PICTURE-02: Can remove profile picture
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BLP-BIOCARE-HOME-PROFILE-PICTURE-02     manual   CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-PROFILE-PICTURE-03: Can dismiss Change profile picture by clicking the X button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BLP-BIOCARE-HOME-PROFILE-PICTURE-03     manual   CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-PROFILE-PICTURE-04: Check zoom in button is working
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BLP-BIOCARE-HOME-PROFILE-PICTURE-04     manual   CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-PROFILE-PICTURE-05: Check zoom out button is working
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BLP-BIOCARE-HOME-PROFILE-PICTURE-05     manual   CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-EDIT-PROFILE-01: Can not edit profile if the user enters incomplete information
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Display an error message “Please complete all required fields.”

    [Tags]      BLP-BIOCARE-HOME-EDIT-PROFILE-01     manual   CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-EDIT-PROFILE-02: Can not edit profile if the state and zipcode are not compatible
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Display an error message “State and Zipcode are not compatible”

    [Tags]      BLP-BIOCARE-HOME-EDIT-PROFILE-02    manual   CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-EDIT-PROFILE-03: Can not edit profile if the user enters invalid Day phone number
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Display an error message “Invalid phone number”

    [Tags]      BLP-BIOCARE-HOME-EDIT-PROFILE-03    manual   CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-EDIT-PROFILE-04: Can not edit profile if the user enters invalid After hour phone number
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Display an error message “Invalid phone number”

    [Tags]      BLP-BIOCARE-HOME-EDIT-PROFILE-04     manual   CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-EDIT-PROFILE-05: Can not edit profile if the user enters invalid Fax number
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Display an error message “Invalid phone number”

    [Tags]      BLP-BIOCARE-HOME-EDIT-PROFILE-05     manual   CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-EDIT-PROFILE-06: Can edit profile information
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. When users click Save button, a successful profile information change message will be displayed with
    ...     content “Your profile information has been updated successfully.”

    [Tags]      BLP-BIOCARE-HOME-EDIT-PROFILE-06     manual   CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-EDIT-PROFILE-07: Cancel edit profile information
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. When users click Cancel button, the profile information will not change and the screen will return
    ...     to the Biocare portal home page

    [Tags]      BLP-BIOCARE-HOME-EDIT-PROFILE-07     manual   CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-UPDATE-EMAIL-01: Cannot change the email address if the user does not enter their email
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Display an error message “Invalid email”

    [Tags]      BLP-BIOCARE-HOME-UPDATE-EMAIL-01     manual   CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-UPDATE-EMAIL-02: Cannot change the email address if the user enters wrong format email
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Display an error message “Invalid email”

    [Tags]      BLP-BIOCARE-HOME-UPDATE-EMAIL-02     manual   CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-UPDATE-EMAIL-03: Cannot change the email address if the email used on another user
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. After clicking the Update button, display an error message "Email is already in use"

    [Tags]      BLP-BIOCARE-HOME-UPDATE-EMAIL-03     manual     CP-2.23.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-UPDATE-EMAIL-04: Change the email address with valid and unique email (not yet verified on another users)
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. The user perform verify code, the new email will be updated in the user's information after the proceed successfully

    [Tags]      BLP-BIOCARE-HOME-UPDATE-EMAIL-04     manual     CP-2.23.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-CHANGE-PW-01: Information on the Change your password modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Current password
    ...     2. New password
    ...     3. Confirm new password
    ...     4. There shall also be Password rules letting the user know what is required to create a valid password:
    ...     "A password must be at least 8 characters, must not contain the username and should be a mixture of uppercase and lowercase letters, numbers, and symbols."
    ...     5. There is a "eye" icon on each password field
    ...     6. A warning message: “You will be logged out from all sessions after changing password successfully!”
    ...     7. There are 2 butons: Cancel, Change

    [Tags]      BLP-BIOCARE-HOME-CHANGE-PW-01        manual      CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-CHANGE-PW-02: Change password unsuccessfully if the user enters the same password to both New password and Current password text inputs
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Display an error message: “New password and current password cannot be the same.”

    [Tags]      BLP-BIOCARE-HOME-CHANGE-PW-02        manual      CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-CHANGE-PW-03: Change password unsuccessfully if the current password entered is incorrect
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Display an error message: “Incorrect password. Please try again.”

    [Tags]      BLP-BIOCARE-HOME-CHANGE-PW-03        manual      CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-CHANGE-PW-04: Change password unsuccessfully if the password entered has less than 8 characters
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Display an error message: “Password must have at least 8 characters.”

    [Tags]      BLP-BIOCARE-HOME-CHANGE-PW-04        manual      CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-CHANGE-PW-05: Change password unsuccessfully if the password entered includes a blank space
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Display an error message: “Password cannot include blank spaces.”

    [Tags]      BLP-BIOCARE-HOME-CHANGE-PW-05        manual      CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-CHANGE-PW-06: Change password unsuccessfully if the confirmation of the new password does not match with the new password entered
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Display an error message: “The confirm password does not match.”

    [Tags]      BLP-BIOCARE-HOME-CHANGE-PW-06       manual      CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-CHANGE-PW-07: Change password unsuccessfully if the user enters incomplete information
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Display an error message: “Please complete all information”

    [Tags]      BLP-BIOCARE-HOME-CHANGE-PW-07        manual      CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-CHANGE-PW-08: Change password unsuccessfully if the password contain the username
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Display an error message: “The password must not contain the username.”

    [Tags]      BLP-BIOCARE-HOME-CHANGE-PW-08       manual      CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-CHANGE-PW-09: Change password successfully if the current password is correctly
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Display a toast message: “Your password has been updated successfully.”
    ...     2. Users will be logged out from all sessions after changing password successfully!

    [Tags]      BLP-BIOCARE-HOME-CHANGE-PW-09   manual       CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-CHANGE-PW-10: Cancel changing password
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. When users click Cancel button, profile will not change and the screen will return to the Biocare portal home page
    ...
    [Tags]      BLP-BIOCARE-HOME-CHANGE-PW-10    manual      CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-CHANGE-PW-11: Cancel change email address
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. When users click Cancel button, email will not change and the screen will return to the Biocare portal home page

    [Tags]      BLP-BIOCARE-HOME-CHANGE-PW-11     manual      CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-LINKS-01: Privacy Policy content is displayed when clicking "Privacy Policy" button at the bottom page
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Privacy Policy content is displayed when clicking "Privacy Policy" button at the bottom page
    ...
    ...     Precondition: The user is on the Biocare portal home page
    ...
    ...     Test Steps:
    ...     1. Click "Privacy Policy" button located at the bottom page
    ...
    ...     Expected Results:
    ...     1. Modal will be displayed with the content of the Privacy Policy
    ...     2. The content must match the content in https://itrvn.sharepoint.com/:w:/s/BiofluxPortal/EcOnc_fzevJClFWo2m_Iem0BRX_Z-Ef8oyinftqPTqJSTw?e=GL5XOB&clickparams=eyJBcHBOYW1lIjoiVGVhbXMtRGVza3RvcCIsIkFwcFZlcnNpb24iOiIyNy8yMzA2MDQwMTE2MSIsIkhhc0ZlZGVyYXRlZFVzZXIiOmZhbHNlfQ%3D%3D
    ...     3. The modal has [Close] button

    [Tags]      BLP-BIOCARE-HOME-LINKS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-LINKS-02: Terms of Use content is displayed when clicking "Terms of Use" button at the bottom page
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Terms of Use content is displayed when clicking "Terms of Use" button at the bottom page
    ...
    ...     Precondition: The user is on the Biocare portal home page
    ...
    ...     Test Steps:
    ...     1. Click "Terms of Use" button located at the bottom page
    ...
    ...     Expected Results:
    ...     1. Modal will be displayed with the content of the Terms of Use
    ...     2. The content must match the content in https://itrvn.sharepoint.com/:w:/s/BiofluxPortal/EWhgPBjsH1BPlOW5_fNZFrEBvih0jh_xhNji_8ZsyOT2cw?e=6ZSChM&clickparams=eyJBcHBOYW1lIjoiVGVhbXMtRGVza3RvcCIsIkFwcFZlcnNpb24iOiIyNy8yMzA2MDQwMTE2MSIsIkhhc0ZlZGVyYXRlZFVzZXIiOmZhbHNlfQ%3D%3D
    ...     3. The modal has [Close] button

    [Tags]      BLP-BIOCARE-HOME-LINKS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIOCARE-HOME-LINKS-03: Contact Support content is displayed when clicking "Contact Support" button at the bottom page
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Contact Support content is displayed when clicking "Contact Support" button at the bottom page
    ...
    ...     Precondition: The user is on the Biocare portal home page
    ...
    ...     Test Steps:
    ...     1. Click "Contact Support" button located at the bottom page
    ...
    ...     Expected Results:
    ...     1. Modal will be displayed with the contact support information
    ...     2. The content must match the content in
    ...     3. The modal has [Got It] button, when clicking this button the modal will be exited

    [Tags]      BLP-BIOCARE-HOME-LINKS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library      project_biocare_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${PHY_USERS}        Get Config Param       NEW_USER
    ${PHY_USER}         Set Variable        ${PHY_USERS}[clinic_physician]
    ${VERSION}          Navigate To Biocare Sign In Page
    Sign In Biocare Portal     username=${PHY_USER}[1][username]       password=${PHY_USER}[1][password]
    Wait Visibility Of All Element In Page
    Set Suite Metadata    version     ${VERSION}
    Set Suite Metadata    browser     ${BROWSER.capitalize()}
    Set Suite Variable    ${PHY_USER}

SUITE TEARDOWN
#    Sign Out Biocare Portal
    Quit Browser

Edit Profile Information
    Select Account Setting      Edit your profile
    Edit Profile    first_name=Test Auto     last_name=Phy 001      title=Auto      country=United States
    ...     address=444 West Lake Street      city=Chicago       state=Illinois      zip_code=60606
    ...     day_phone_number=4844578744     after_hour_phone_number=4844578755      fax=4844578766

Update Email Information
    Select Account Setting      Update your email
    Update Email        new_email=testautophy001@auto.com

Change Password Information
    Navigate To Biocare Sign In Page
    Sign In Biocare Portal     username=${PHY_USER}[1][username]       password=auto_001
#    Wait Visibility Of All Element In Page
    Select Account Setting      Change your password
    Change Password        current_password=auto_001        new_password=${PHY_USER}[1][password]
    ...     confirm_password=${PHY_USER}[1][password]
