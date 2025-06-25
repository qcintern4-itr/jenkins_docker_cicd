*** Settings ***
Documentation   Test Suite - Biocare Home page
Metadata    sid     BF-BIOCARE-HOME
Metadata    owner   Trinh Nguyen
Library    Collections
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py    ${ENV}
Library     project_biocare_portal/lib/web/Common.py

Suite Setup         SUITE SETUP
Suite Teardown      SUITE TEARDOWN
Force Tags          BF-BIOCARE-HOME   web
Test Timeout        5m

*** Test Cases ***
BF-BIOCARE-HOME-VIEW-01: View Biocare Portal home page
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
    ...     1. Clinic User can view their information:
    ...     - Avatar
    ...     - Fullname, Title: If there is no title, only the fullname will be displayed.
    ...     - Username
    ...     - Email
    ...     - Country
    ...     - Address
    ...     - Day phone number
    ...     - After hour phone number
    ...     - Fax number
    ...     - Role
    ...     2. Clinic User can view a list of clinics they work for
    ...     3. Clinic User can view a list of portals they are allowed to access. Including:
    ...     - Biocare Diagnostic Portal
    ...     - Disease Management
    ...
    ...     **Others
    ...     Update date: 5/27/2024 - Trinh Nguyen

    [Tags]      BF-BIOCARE-HOME-VIEW-01    manual     CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-HOME-NAVIGATE-01: Access Facility Admin Portal - Authorized Facility Admin
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that only users with the Facility Admin role and at least one active facility can access the Facility Admin portal.
    ...
    ...     Precondition:
    ...     - The user has logged into the Biocare Home portal
    ...     - The user account is active
    ...
    ...
    ...     Test Steps:
    ...     1. Log in to Biocare Home portal with a user who has Facility Admin role.
    ...     2. Ensure there is at least one active facility assigned to this user.
    ...     3. Click on the "Facility Admin" portal tile.
    ...
    ...
    ...     Expected Results:
    ...     - The system allows access to the Facility Admin portal.
    ...     - User is routed to the Facility Admin homepage successfully.
    ...
    ...
    ...     **Others
    ...     Update date: 6/16/2025 - Thanh Tieu

    [Tags]      BF-BIOCARE-HOME-NAVIGATE-01    manual     CP-2.31.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-HOME-NAVIGATE-02: Access Insurance and Billing portal - Authorized Billing user role
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that only users with the Billing user role and at least one active facility can access the Insurance and Billing portal .
    ...
    ...     Precondition:
    ...     - The user has logged into the Biocare Home portal
    ...     - The user account is active
    ...
    ...
    ...     Test Steps:
    ...     1. Log in to Biocare Home portal with a user who has Billing user role.
    ...     2. Ensure there is at least one active facility assigned to this user.
    ...     3. Click on the "Insurance and Billing portal" portal tile.
    ...
    ...
    ...     Expected Results:
    ...     - The system allows access to the Insurance and Billing portal.
    ...     - User is routed to the Insurance and Billing homepage successfully.
    ...
    ...
    ...     **Others
    ...     Update date: 6/17/2025 - Thanh Tieu

    [Tags]      BF-BIOCARE-HOME-NAVIGATE-02    manual     CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}




BF-BIOCARE-HOME-PROFILE-PICTURE-02: Can change profile picture
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

    [Tags]      BF-BIOCARE-HOME-PROFILE-PICTURE-02     auto
    Change Avatar    avatar_path=project_biocare_portal/test/data/avatar_01.png
    [Teardown]    Remove Avatar

BF-BIOCARE-HOME-PROFILE-PICTURE-03: Can remove profile picture
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

    [Tags]      BF-BIOCARE-HOME-PROFILE-PICTURE-03     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #done

BF-BIOCARE-HOME-EDIT-PROFILE-04: Can not edit profile if the user enters incomplete information
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

    [Tags]      BF-BIOCARE-HOME-EDIT-PROFILE-04    auto
    Select Account Setting      Edit your profile
    ${clear_fields}     Set Variable        First name, Last name, Title, Address, City, State, Zip code, Phone number, After hour phone number, Fax number
    Edit Profile    clear_fields=${clear_fields}
    ${error_msg}        Get Error Message
    Edit Profile    is_saved=False      is_closed=True
    Run Keyword And Continue On Failure    List Should Contain Value    ${error_msg}        Invalid First name
    Run Keyword And Continue On Failure    List Should Contain Value    ${error_msg}        Invalid Last name
    Run Keyword And Continue On Failure    List Should Contain Value    ${error_msg}        Invalid Address
    Run Keyword And Continue On Failure    List Should Contain Value    ${error_msg}        Invalid City
    Run Keyword And Continue On Failure    List Should Contain Value    ${error_msg}        Invalid State
    Run Keyword And Continue On Failure    List Should Contain Value    ${error_msg}        Invalid Zip code
    Run Keyword And Continue On Failure    List Should Contain Value    ${error_msg}        Please complete all required fields.

BF-BIOCARE-HOME-EDIT-PROFILE-05: Can not edit profile if the state and zipcode are not compatible
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

    [Tags]      BF-BIOCARE-HOME-EDIT-PROFILE-05    auto
    Select Account Setting      Edit your profile
    Edit Profile    state=Texas      zip_code=00000
    ${error_msg}        Get Error Message
    Edit Profile    is_saved=False      is_closed=True
    Run Keyword And Continue On Failure    Should Contain    ${error_msg}      State and Zip code are not compatible.

BF-BIOCARE-HOME-EDIT-PROFILE-06: Can not edit profile if the user enters invalid Day phone number
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

    [Tags]      BF-BIOCARE-HOME-EDIT-PROFILE-06    auto
    Select Account Setting      Edit your profile
    Edit Profile    day_phone_number=0000000000
    ${error_msg}        Get Error Message
    Edit Profile    is_saved=False      is_closed=True
    Run Keyword And Continue On Failure    Should Contain    ${error_msg}      Invalid phone number

BF-BIOCARE-HOME-EDIT-PROFILE-07: Can not edit profile if the user enters invalid After hour phone number
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

    [Tags]      BF-BIOCARE-HOME-EDIT-PROFILE-07        auto
    Select Account Setting      Edit your profile
    Edit Profile    after_hour_phone_number=0000000000
    ${error_msg}        Get Error Message
    Edit Profile    is_saved=False      is_closed=True
    Run Keyword And Continue On Failure    Should Contain    ${error_msg}      Invalid phone number

BF-BIOCARE-HOME-EDIT-PROFILE-08: Can not edit profile if the user enters invalid Fax number
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

    [Tags]      BF-BIOCARE-HOME-EDIT-PROFILE-08    auto
    Select Account Setting      Edit your profile
    Edit Profile    fax=0000000000
    ${error_msg}        Get Error Message
    Edit Profile    is_saved=False      is_closed=True
    Run Keyword And Continue On Failure    Should Contain    ${error_msg}      Invalid Fax number

BF-BIOCARE-HOME-EDIT-PROFILE-09: Can edit profile information
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

    [Tags]      BF-BIOCARE-HOME-EDIT-PROFILE-09    auto
    Select Account Setting      Edit your profile
    ${clear_fields}     Set Variable        First name, Last name, Title, Address, City, State, Zip code, Phone number, After hour phone number, Fax number

    Edit Profile        first_name=Test Auto1     last_name=Phy 0011      title=Auto1      country=United States
    ...     address=444 Niu Street      city=Honolulu       state=Hawaii      zip_code=96815        day_phone_number=610-234-1111
    ...     after_hour_phone_number=610-234-2222      fax=610-234-3333    clear_fields=${clear_fields}

    ${acc_info}     Get Account Information
    Run Keyword And Continue On Failure     Should Be Equal    ${acc_info}[name]      Test Auto1 Phy 0011
    Run Keyword And Continue On Failure     Should Be Equal    ${acc_info}[title]      Auto1
    Run Keyword And Continue On Failure     Should Be Equal    ${acc_info}[country]      United States
    Run Keyword And Continue On Failure     Should Be Equal    ${acc_info}[address]      444 Niu Street
    Run Keyword And Continue On Failure     Should Be Equal    ${acc_info}[city]      Honolulu
    Run Keyword And Continue On Failure     Should Be Equal    ${acc_info}[state]      Hawaii
    Run Keyword And Continue On Failure     Should Be Equal    ${acc_info}[zip_code]      96815
    Run Keyword And Continue On Failure     Should Be Equal    ${acc_info}[day_phone_number]      (+1) 610-234-1111
    Run Keyword And Continue On Failure     Should Be Equal    ${acc_info}[after_hour_phone_number]      (+1) 610-234-2222
    Run Keyword And Continue On Failure     Should Be Equal    ${acc_info}[fax_number]      (+1) 610-234-3333
    [Teardown]      Edit Profile Information

BF-BIOCARE-HOME-EDIT-PROFILE-10: Cancel edit profile information
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

    [Tags]      BF-BIOCARE-HOME-EDIT-PROFILE-10    auto
    Select Account Setting      Edit your profile
    ${clear_fields}     Set Variable        First name, Last name, Title, Address, City, State, Zip code, Phone number, After hour phone number, Fax number
    ${is_modal_exited}     Edit Profile        first_name=Test Auto1     last_name=Phy 0011      title=Auto1      country=United States
    ...     address=444 Niu Street      city=Honolulu       state=Hawaii      zip_code=96815        day_phone_number=6102341111
    ...     after_hour_phone_number=6102342222      fax=6102343333      is_saved=False      is_closed=True    clear_fields=${clear_fields}
    Run Keyword And Continue On Failure    Should Be Equal    ${is_modal_exited}        ${True}
    ${acc_info}     Get Account Information
    Run Keyword And Continue On Failure     Should Be Equal    ${acc_info}[name]      Test Auto Phy 001
    Run Keyword And Continue On Failure     Should Be Equal    ${acc_info}[title]      Auto
    Run Keyword And Continue On Failure     Should Be Equal    ${acc_info}[country]      United States
    Run Keyword And Continue On Failure     Should Be Equal    ${acc_info}[address]      444 West Lake Street
    Run Keyword And Continue On Failure     Should Be Equal    ${acc_info}[city]      Chicago
    Run Keyword And Continue On Failure     Should Be Equal    ${acc_info}[state]      Illinois
    Run Keyword And Continue On Failure     Should Be Equal    ${acc_info}[zip_code]      60606
    Run Keyword And Continue On Failure     Should Be Equal    ${acc_info}[day_phone_number]      (+1) 484-457-8744
    Run Keyword And Continue On Failure     Should Be Equal    ${acc_info}[after_hour_phone_number]      (+1) 484-457-8755
    Run Keyword And Continue On Failure     Should Be Equal    ${acc_info}[fax_number]      (+1) 484-457-8766

BF-BIOCARE-HOME-EDIT-PROFILE-11: Cannot change the email address if the user does not enter their email
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

    [Tags]      BF-BIOCARE-HOME-EDIT-PROFILE-11    auto
    Select Account Setting      Update your email
    Update Email
    ${error_msg}        Get Error Message
    Update Email    is_saved=False      is_closed=True
    Run Keyword And Continue On Failure    Should Contain       ${error_msg}        Invalid email

BF-BIOCARE-HOME-EDIT-PROFILE-12: Cannot change the email address if the user enters wrong format email
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

    [Tags]      BF-BIOCARE-HOME-EDIT-PROFILE-12    auto
    Select Account Setting      Update your email
    Update Email        new_email=wrongformatemail@com
    ${error_msg}        Get Error Message
    Update Email    is_saved=False      is_closed=True
    Run Keyword And Continue On Failure    Should Contain       ${error_msg}        Invalid email

BF-BIOCARE-HOME-EDIT-PROFILE-13-CP2.20.0: Cannot change the email address if the email used on another user
    [Documentation]     Author: Nhan Nguyen
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

    [Tags]      BF-BIOCARE-HOME-EDIT-PROFILE-13-CP2.20.0     manual     CP-2.20.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-HOME-EDIT-PROFILE-14-CP2.20.0: Change the email address with valid and unique email (not yet verified on another users)
    [Documentation]     Author: Nhan Nguyen
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

    [Tags]      BF-BIOCARE-HOME-EDIT-PROFILE-14-CP2.20.0     manual     CP-2.20.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-HOME-AUTH-CHANGE-PW-01: Information on the Change your password modal
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
    ...     1. Current password
    ...     2. New password
    ...     3. Confirm new password
    ...     4. There shall also be Password rules letting the user know what is required to create a valid password:
    ...     "A password must be at least 8 characters, must not contain the username and should be a mixture of uppercase and lowercase letters, numbers, and symbols."
    ...     5. There is a "eye" icon on each password field
    ...     6. A warning message: “You will be logged out from all sessions after changing password successfully!”
    ...     7. There are 2 butons: Cancel, Change

    [Tags]      BF-BIOCARE-HOME-AUTH-CHANGE-PW-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-HOME-AUTH-CHANGE-PW-02: Change password unsuccessfully if the user enters the same password to both New password and Current password text inputs
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

    [Tags]      BF-BIOCARE-HOME-AUTH-CHANGE-PW-02    auto
    Select Account Setting      Change your password
    Change Password        current_password=${PHY_USER}[1][password]        new_password=${PHY_USER}[1][password]
    ...     confirm_password=${PHY_USER}[1][password]
    ${error_msg}        Get Error Message
    Change Password    is_saved=False      is_closed=True
    Run Keyword And Continue On Failure    Should Contain       ${error_msg}        New password and current password cannot be the same.

BF-BIOCARE-HOME-AUTH-CHANGE-PW-03: Change password unsuccessfully if the current password entered is incorrect
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

    [Tags]      BF-BIOCARE-HOME-AUTH-CHANGE-PW-03    auto
    Select Account Setting      Change your password
    Change Password        current_password=wrong_pass        new_password=${PHY_USER}[1][password]
    ...     confirm_password=${PHY_USER}[1][password]
    ${error_msg}        Get Error Message
    Change Password    is_saved=False      is_closed=True
    Run Keyword And Continue On Failure    Should Contain       ${error_msg}        Incorrect password. Please try again.

BF-BIOCARE-HOME-AUTH-CHANGE-PW-04: Change password unsuccessfully if the password entered has less than 8 characters
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

    [Tags]      BF-BIOCARE-HOME-AUTH-CHANGE-PW-04    auto
    Select Account Setting      Change your password
    Change Password        current_password=${PHY_USER}[1][password]        new_password=pass@
    ...     confirm_password=pass@
    ${error_msg}        Get Error Message
    Change Password    is_saved=False      is_closed=True
    Run Keyword And Continue On Failure    Should Contain       ${error_msg}        Password must have at least 8 characters.

BF-BIOCARE-HOME-AUTH-CHANGE-PW-05: Change password unsuccessfully if the password entered includes a blank space
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

    [Tags]      BF-BIOCARE-HOME-AUTH-CHANGE-PW-05    auto
    Select Account Setting      Change your password
    Change Password        current_password=${PHY_USER}[1][password]        new_password=test_new_pass${SPACE}@
    ...     confirm_password=test_new_pass${SPACE}@
    ${error_msg}        Get Error Message
    Change Password    is_saved=False      is_closed=True
    Run Keyword And Continue On Failure    Should Contain       ${error_msg}        Password cannot include blank spaces.

BF-BIOCARE-HOME-AUTH-CHANGE-PW-06: Change password unsuccessfully if the confirmation of the new password does not match with the new password entered
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

    [Tags]      BF-BIOCARE-HOME-AUTH-CHANGE-PW-06    auto
    Select Account Setting      Change your password
    Change Password        current_password=${PHY_USER}[1][password]        new_password=test_changepass@@
    ...     confirm_password=test_changepass@@123
    ${error_msg}        Get Error Message
    Change Password    is_saved=False      is_closed=True
    Run Keyword And Continue On Failure    Should Contain       ${error_msg}        The confirm password does not match.

BF-BIOCARE-HOME-AUTH-CHANGE-PW-07: Change password unsuccessfully if the user enters incomplete information
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

    [Tags]      BF-BIOCARE-HOME-AUTH-CHANGE-PW-07    auto
    Select Account Setting      Change your password
    Change Password
    ${error_msg}        Get Error Message
    Change Password    is_saved=False      is_closed=True
    Run Keyword And Continue On Failure    Should Contain       ${error_msg}        Please complete all information

BF-BIOCARE-HOME-AUTH-CHANGE-PW-08: Change password unsuccessfully if the Admin user set the account status to deactivated
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     1. The user is on the Set up new password screen
    ...
    ...     Test Steps:
    ...     1. The user is on the Set up new password screen and has been filled all required field
    ...     2. The Admin set account status to deactivated
    ...     3. Click Set new password button
    ...
    ...     Expected Results:
    ...     1. Displayed Deactivated modal after clicking Set up new password button

    [Tags]      BF-BIOCARE-HOME-AUTH-CHANGE-PW-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-HOME-AUTH-CHANGE-PW-09: Change password unsuccessfully if the Admin user set facility status to closed
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     1. The user is on the Set up new password screen
    ...
    ...     Test Steps:
    ...     1. The user is on the Set up new password screen and has been filled all required field
    ...     2. The Admin set facility status to closed
    ...     3. Click Set new password button
    ...
    ...     Expected Results:
    ...     1. After clicking the Set up new password button, user shall redirect to "Your clinic was closed!" page
    ...
    [Tags]      BF-BIOCARE-HOME-AUTH-CHANGE-PW-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-HOME-AUTH-CHANGE-PW-10: Change password unsuccessfully if the password contain the username
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

    [Tags]      BF-BIOCARE-HOME-AUTH-CHANGE-PW-10    auto
    Select Account Setting      Change your password
    Change Password        current_password=${PHY_USER}[1][password]        new_password=physician_qa_team_02@@
    ...     confirm_password=physician_qa_team_02@@
    ${error_msg}        Get Error Message
    Change Password    is_saved=False      is_closed=True
    Run Keyword And Continue On Failure    Should Contain       ${error_msg}        The password must not contain the username.

BF-BIOCARE-HOME-AUTH-CHANGE-PW-11: Change password successfully if the current password is correctly
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

    [Tags]      BF-BIOCARE-HOME-AUTH-CHANGE-PW-11   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Select Account Setting      Change your password
#    Change Password        current_password=${PHY_USER}[1][password]        new_password=auto_001
#    ...     confirm_password=auto_001
#    ${msg}        Get Success Message
#    Run Keyword And Continue On Failure    Should Contain       ${msg}        Your password has been updated successfully
#    ${is_logged_out}     Wait Url Contains    text=sign-in
#    Run Keyword And Continue On Failure    Should Be Equal    ${is_logged_out}      ${True}
#    Change Password Information

BF-BIOCARE-HOME-AUTH-CHANGE-PW-14: Cancel changing password
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
    [Tags]      BF-BIOCARE-HOME-AUTH-CHANGE-PW-14    auto
    Select Account Setting      Change your password
    ${is_modal_closed}    Change Password        current_password=${PHY_USER}[1][password]        new_password=auto_001
    ...     confirm_password=auto_001       is_saved=False      is_closed=True
    Run Keyword And Continue On Failure    Should Be Equal    ${is_modal_closed}      ${True}

BF-BIOCARE-HOME-EDIT-PROFILE-14: Cancel change email address
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

    [Tags]      BF-BIOCARE-HOME-EDIT-PROFILE-14    auto
    Select Account Setting      Update your email
    ${is_modal_closed}    Update Email        new_email=testautophy001@auto.com       is_saved=False      is_closed=True
    Run Keyword And Continue On Failure    Should Be Equal    ${is_modal_closed}      ${True}

BF-BIOCARE-HOME-LINKS-01: Privacy Policy content is displayed when clicking "Privacy Policy" button at the bottom page
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

    [Tags]      BF-BIOCARE-HOME-LINKS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-HOME-LINKS-02: Terms of Use content is displayed when clicking "Terms of Use" button at the bottom page
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

    [Tags]      BF-BIOCARE-HOME-LINKS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-BIOCARE-HOME-LINKS-03: Contact Support content is displayed when clicking "Contact Support" button at the bottom page
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

    [Tags]      BF-BIOCARE-HOME-LINKS-03    manual
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
    ${clear_fields}     Set Variable        First name, Last name, Title, Address, City, State, Zip code, Phone number, After hour phone number, Fax number
    Edit Profile    first_name=Test Auto     last_name=Phy 001      title=Auto      country=United States
    ...     address=444 West Lake Street      city=Chicago       state=Illinois      zip_code=60606
    ...     day_phone_number=4844578744     after_hour_phone_number=4844578755      fax=4844578766
    ...     clear_fields=${clear_fields}

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
