*** Settings ***
Documentation  Bioheart portal Profile test suite
Metadata    sid   BHP-PROFILE
Metadata  owner   Linh Tran
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioheart_portal/lib/ConfigHandler.py   ${ENV}
Library     corelib/AssertionExtension.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags  BHP-PROFILE     web
Test Timeout  1h

*** Test Cases ***
BHP-PROFILE-VIEWPROFILE-01: View profile
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Profile button on the right-sidebar
    ...    - 2. Check
    ...
    ...     Expected Output:
    ...    - 1. Profile screen is opened
    ...    - 2. There shall be components:
    ...     + Profile picture
    ...     + Username
    ...     + Email
    ...     + Age
    ...     + Height
    ...     + Weight
    ...     + Biosphere + status (Free-Monthy-Annually-Cardiac plan)
    ...     + Edit profile button
    ...     + If the user account has subscription, display a yellow circle around the avatar and add an icon in the username
    [Tags]  BHP-PROFILE-VIEWPROFILE-01      auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Profile
    ${profiles}  Get Profile
    ${profile}   Create Dictionary  username=Doflamingo Donquixote     email=emailtest2@yopmail.com
    ...         Age=21   Height=165 cm    Weight=65 kg    Biosphere+=Free
    Run Keyword And Continue On Failure     Should Be Equal     ${profiles}     ${profile}
    Open Profile    is_open=${False}   is_close=${True}
    Sign Out Bioheart Portal

BHP-PROFILE-VIEWPROFILE-02: Navigate to the Edit profile screen
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Profile button on the right-sidebar
    ...    - 2. Click on Edit profile button
    ...
    ...     Expected Output:
    ...    - 1. Profile screen is opened
    ...    - 2. Navigate to the Edit profile screen
    [Tags]  BHP-PROFILE-VIEWPROFILE-02      auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Profile
    ${prof_screen}      Page Is On Screen
    Run Keyword And Continue On Failure     Should Be Equal     ${prof_screen}       profile
    Open Profile        is_open=${False}   is_close=${False}        open_edit_prof=${True}
    ${edit_prof_screen}   Page Is On Screen
    Run Keyword And Continue On Failure     Should Be Equal     ${edit_prof_screen}       edit profile
    Edit Profile    is_save=${False}        is_back=${True}
    Open Profile    is_open=${False}        is_close=${True}
    Sign Out Bioheart Portal

BHP-PROFILE-VIEWPROFILE-03: Close Profile screen
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Profile button on the right-sidebar
    ...    - 2. Click on X icon button or click outside
    ...
    ...     Expected Output:
    ...    - 1. Profile screen is opened
    ...    - 2. Profile screen is closed
    [Tags]  BHP-PROFILE-VIEWPROFILE-03      auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Profile
    ${prof_screen}      Page Is On Screen
    Run Keyword And Continue On Failure     Should Be Equal     ${prof_screen}       profile
    Open Profile        is_open=${False}   is_close=${True}
    ${overview_screen}  Page Is On Screen
    Run Keyword And Continue On Failure     Should Be Equal     ${overview_screen}       overview
    Sign Out Bioheart Portal

BHP-PROFILE-EDITPROFILE-01: Edit profile
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Profile button on the right-sidebar
    ...    - 2. Click on Edit profile button
    ...    - 3. Add new profile picture
    ...    - 4. Edit username
    ...    - 5. Edit DOB
    ...    - 6. Edit Gender
    ...    - 7. Edit measurements
    ...    - 8. Click on Save button
    ...
    ...     Expected Output:
    ...    - 1. Profile screen is opened
    ...    - 2. Profile picture modal is displayed
    ...    - 3. New profile picture is displayed, the Save button is enabled
    ...    - 4. Edit username successfully
    ...    - 5. New DOB displayed
    ...    - 6. New Gender displayed
    ...    - 7. New measurements displayed
    ...    - 8. Navigate to the Profile screen and new data is updated
    [Tags]  BHP-PROFILE-EDITPROFILE-01      auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Profile        open_edit_prof=${True}
    Upload Image      file_path=project_bioheart_portal/test/data/img_3.png
    ${avartar_uploaded}      Get Avatar Uploaded
    Edit Profile    first_name=Donquixote    last_name=Dellinger    date=08/11/2004     gender=Female
    ...             height=145 cm    weight=45 kg
    ${data_edited}    Get Profile
    ${avatar_prof}       Get Avatar Profile
    Open Profile    is_open=${False}        is_close=${True}
    ${data_expected}    Create Dictionary   username=Donquixote Dellinger     email=emailtest2@yopmail.com
    ...     Age=18   Height=145 cm    Weight=45 kg    Biosphere+=Free
    Run Keyword And Continue On Failure     Should Be Equal     ${avartar_uploaded}     ${avatar_prof}
    Run Keyword And Continue On Failure     Should Be Equal     ${data_edited}     ${data_expected}
    Sign Out Bioheart Portal

BHP-PROFILE-EDITPROFILE-02: Edit profile failed
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Profile button on the right-sidebar
    ...    - 2. Click on Edit profile button
    ...    - 3. Add new profile picture
    ...    - 4. Edit username
    ...    - 5. Edit DOB
    ...    - 6. Edit Gender
    ...    - 7. Edit measurements
    ...    - 8. Click on Save button
    ...
    ...     Expected Output:
    ...    - 1. Profile screen is opened
    ...    - 2. Profile picture modal is displayed
    ...    - 3. New profile picture is displayed, the Save button is enabled
    ...    - 4. Edit username successfully
    ...    - 5. New DOB displayed
    ...    - 6. New Gender displayed
    ...    - 7. New measurements displayed
    ...    - 8. There shall be a message Something went wrong! Could not update your profile. Please try again.
    [Tags]  BHP-PROFILE-EDITPROFILE-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-PROFILE-EDITPROFILE-03: Update profile without edit profile picture
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Profile button on the right-sidebar
    ...    - 2. Click on Edit profile button
    ...    - 3. Don't update new profile picture
    ...    - 4. Edit username
    ...    - 5. Edit DOB
    ...    - 6. Edit Gender
    ...    - 7. Edit measurements
    ...    - 8. Click on Save button
    ...
    ...     Expected Output:
    ...    - 1. Profile screen is opened
    ...    - 2. Profile picture modal is displayed
    ...    - 3. Keep old profile picture
    ...    - 4. Edit username successfully
    ...    - 5. New DOB displayed
    ...    - 6. New Gender displayed
    ...    - 7. New measurements displayed
    ...    - 8. Navigate to the Profile screen and new data is updated
    [Tags]  BHP-PROFILE-EDITPROFILE-03      auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Profile        open_edit_prof=${True}
    Edit Profile    first_name=Donquixote    last_name=Rosinate    date=08/11/1992    height=193 cm    weight=65 kg
    ${data_edited}    Get Profile
    Open Profile    is_open=${False}        is_close=${True}
    ${data_expected}    Create Dictionary   username=Donquixote Rosinate     email=emailtest2@yopmail.com
    ...     Age=30   Height=193 cm    Weight=65 kg    Biosphere+=Free
    Run Keyword And Continue On Failure     Should Be Equal     ${data_edited}     ${data_expected}
    Sign Out Bioheart Portal

BHP-PROFILE-EDITPROFILE-04: Profile picture settings
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Profile button on the right-sidebar
    ...    - 2. Click on Edit profile button
    ...    - 3. Click on Edit profile picture button
    ...    - 4. Click on Upload image button
    ...    - 5. Select image
    ...    - 6. Click on Save button
    ...
    ...     Expected Output:
    ...    - 1. Profile screen is opened
    ...    - 2. Navigate to the Edit profile screen
    ...    - 3. Profile picture modal is displayed
    ...    - 4. Navigate to the image library
    ...    - 5. Selected image displayed
    ...    - 6. Profile picture modal is closed and new profile picture is updated
    [Tags]  BHP-PROFILE-EDITPROFILE-04      auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Profile
    ${old_avatar}      Get Avatar Profile
    Open Profile       is_open=${False}     open_edit_prof=${True}
    Upload Image      file_path=project_bioheart_portal/test/data/img_1.png
    Edit Profile
    ${new_avatar}      Get Avatar Profile
    Open Profile    is_open=${False}        is_close=${True}
    Run Keyword And Continue On Failure     Should Not Be Equal     ${old_avatar}     ${new_avatar}
    Sign Out Bioheart Portal

BHP-PROFILE-EDITPROFILE-05: Profile picture settings
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Profile button on the right-sidebar
    ...    - 2. Click on Edit profile button
    ...    - 3. Click on Edit profile picture button
    ...    - 4. Click on Remove image button
    ...    - 5. Click on Save button
    ...     Expected Output:
    ...    - 1. Profile screen is opened
    ...    - 2. Navigate to the Edit profile screen
    ...    - 3. Profile picture modal is displayed
    ...    - 4. Remove image button and current profile picture are hidden
    ...    - 5. Profile picture modal is closed and profile picture is removed
    [Tags]  BHP-PROFILE-EDITPROFILE-05      auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Profile
    ${profile_infor}    Get Profile
    ${avatar}      Evaluate    ''.join(t[0] for t in '${profile_infor}[username]'.split())
    Open Profile       is_open=${False}      open_edit_prof=${True}
    Upload Image        remove_img=${True}
    Edit Profile
    ${infor_avatar}    Get Avatar Profile       is_remove=${True}
    Open Profile    is_open=${False}        is_close=${True}
    Run Keyword And Continue On Failure     Should Be Equal     ${infor_avatar}     ${avatar}
    Sign Out Bioheart Portal

BHP-PROFILE-EDITPROFILE-06: Profile picture settings
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Profile button on the right-sidebar
    ...    - 2. Click on Edit profile button
    ...    - 3. Click on Edit profile picture button
    ...    - 4. Click on Save button
    ...
    ...     Expected Output:
    ...    - 1. Profile screen is opened
    ...    - 2. Navigate to the Edit profile screen
    ...    - 3. Profile picture modal is displayed
    ...    - 4.  Profile picture modal is closed
    [Tags]  BHP-PROFILE-EDITPROFILE-06      auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Profile       open_edit_prof=${True}
    Upload Image        is_save=${False}
    ${prof_pic}      Profile Picture Modal Displayed    is_close=${True}
    Upload Image        remove_img=${True}
    Run Keyword And Continue On Failure     Should Be Equal     ${prof_pic}     ${True}
    Edit Profile        is_save=${False}       is_back=${True}
    ${prof_pic_close}      Profile Picture Modal Displayed
    Open Profile    is_open=${False}        is_close=${True}
    Run Keyword And Continue On Failure     Should Be Equal     ${prof_pic_close}     ${False}
    Sign Out Bioheart Portal

BHP-PROFILE-EDITPROFILE-07: Cancel to update profile picture
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Profile button on the right-sidebar
    ...    - 2. Click on Edit profile button
    ...    - 3. Click on Edit profile picture button
    ...    - 4. Click on Upload image button
    ...    - 5. Select image
    ...    - 6. Click on X icon button
    ...
    ...     Expected Output:
    ...    - 1. Profile screen is opened
    ...    - 2. Navigate to the Edit profile screen
    ...    - 3. Profile picture modal is displayed
    ...    - 4. Navigate to the image library
    ...    - 5. Selected image displayed
    ...    - 6. Profile picture modal is closed
    [Tags]  BHP-PROFILE-EDITPROFILE-07      auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Profile       open_edit_prof=${True}
    Upload Image        file_path=project_bioheart_portal/test/data/img_1.png   is_save=${False}
    Profile Picture Modal Displayed      is_close=${True}
    Edit Profile        is_save=${False}
    ${prof_pic_close}       Profile Picture Modal Displayed
    Run Keyword And Continue On Failure     Should Be Equal     ${prof_pic_close}     ${False}
    Edit Profile        is_save=${False}       is_back=${True}
    Open Profile    is_open=${False}        is_close=${True}
    Sign Out Bioheart Portal

BHP-PROFILE-EDITPROFILE-08: Upload profile picture with file bigger 1MB
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Profile button on the right-sidebar
    ...    - 2. Click on Edit profile button
    ...    - 3. Click on Edit profile picture button
    ...    - 4. Click on Upload image button
    ...    - 5. Select image
    ...    - 6. Click on Save button
    ...
    ...     Expected Output:
    ...    - 1. Profile screen is opened
    ...    - 2. Navigate to the Edit profile screen
    ...    - 3. Profile picture modal is displayed
    ...    - 4. Navigate to the image library
    ...    - 5. Selected image displayed
    ...    - 6. There shall be message Failed to upload as your image size is too big
    [Tags]  BHP-PROFILE-EDITPROFILE-08      auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Profile       open_edit_prof=${True}
    Upload Image       file_path=project_bioheart_portal/test/data/image.jpg
    ${notice_massage}   Get Notification Massage
    Run Keyword And Continue On Failure     Should Be Equal     ${notice_massage}     Failed to upload as your image size is too big.
    Profile Picture Modal Displayed    is_close=${True}
    Edit Profile        is_save=${False}       is_back=${True}
    Open Profile    is_open=${False}        is_close=${True}
    Sign Out Bioheart Portal

BHP-PROFILE-EDITPROFILE-09: Check back icon button
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Profile button on the right-sidebar
    ...    - 2. Click on Edit profile button
    ...    - 3. Add new profile picture
    ...    - 4. Edit username
    ...    - 5. Edit DOB
    ...    - 6. Edit Gender
    ...    - 7. Edit measurements
    ...    - 8. Click on back button
    ...
    ...     Expected Output:
    ...    - 1. Profile screen is opened
    ...    - 2. Profile picture modal is displayed
    ...    - 3. New profile picture is displayed, the Save button is enabled
    ...    - 4. Edit username successfully
    ...    - 5. New DOB displayed
    ...    - 6. New Gender displayed
    ...    - 7. New measurements displayed
    ...    - 8. Navigate back to the Profile screen and new profile is not updated
    [Tags]  BHP-PROFILE-EDITPROFILE-09      auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Profile
    ${profile}      Get Profile
    Open Profile       is_open=${False}     open_edit_prof=${True}
    Upload Image      file_path=project_bioheart_portal/test/data/img_1.png
    ${new_avatar}      Get Avatar Uploaded
    Edit Profile    first_name=Donquixote    last_name=Sugar    date=08/11/2009     gender=Male
    ...             height=165 cm    weight=85 kg       is_save=${False}    is_back=${True}
    ${profile_back}      Get Profile
    Run Keyword And Continue On Failure     Should Be Equal     ${profile}     ${profile_back}
    ${old_avatar}      Get Avatar Profile       is_remove=${True}
    Run Keyword And Continue On Failure     Should Not Be Equal     ${new_avatar}     ${old_avatar}
    Open Profile    is_open=${False}        is_close=${True}
    Sign Out Bioheart Portal

BHP-PROFILE-EDITPROFILE-10: Check back icon button
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Profile button on the right-sidebar
    ...   -  2. Click on Edit profile button
    ...   -  3. Click on back button
    ...
    ...     Expected Output:
    ...    - 1. Profile screen is opened
    ...    - 2. Navigate to the Edit profile screen
    ...    - 3.  Navigate back to the Profile screen and keep old profile
    [Tags]  BHP-PROFILE-EDITPROFILE-10      auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Profile       open_edit_prof=${True}
    ${profile}      Get Profile
    Edit Profile    is_save=${False}    is_back=${True}
    ${profile_back}      Get Profile
    Run Keyword And Continue On Failure     Should Be Equal     ${profile}     ${profile_back}
    Open Profile    is_open=${False}        is_close=${True}
    Sign Out Bioheart Portal

BHP-PROFILE-EDITPROFILE-11: Check Height max-min value with Imperial
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Profile button on the right-sidebar
    ...    - 2. Click on Edit profile button
    ...    - 3. Enter min value (0ft-0inch)
    ...    - 4. Enter max value (8ft-11inch)
    ...
    ...     Expected Output:
    ...    - 1. Profile screen is opened
    ...    - 2. Navigate to the Edit profile screen
    ...    - 3. Enter min value successfully
    ...    - 4. Enter max value successfully
    [Tags]  BHP-PROFILE-EDITPROFILE-11      auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Profile        open_edit_prof=${True}
    Edit Profile        height=0 ft 0 in
    ${min_height}    Get Profile
    Run Keyword And Continue On Failure     Should Be Equal     ${min_height}[Height]     0 ft 0 in
    Open Profile    is_open=${False}        open_edit_prof=${True}
    Edit Profile        height=8 ft 11 in
    ${max_height}    Get Profile
    Run Keyword And Continue On Failure     Should Be Equal     ${max_height}[Height]     8 ft 11 in
    Open Profile    is_open=${False}        is_close=${True}
    Sign Out Bioheart Portal

BHP-PROFILE-EDITPROFILE-12: Check Height max-min value with Metric
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Profile button on the right-sidebar
    ...    - 2. Click on Edit profile button
    ...    - 3. Enter min value (0.0cm)
    ...    - 4. Enter max value (271.9cm)
    ...
    ...     Expected Output:
    ...    - 1. Profile screen is opened
    ...    - 2. Navigate to the Edit profile screen
    ...    - 3. Enter min value successfully
    ...    - 4. Enter max value successfully
    [Tags]  BHP-PROFILE-EDITPROFILE-12      auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Profile        open_edit_prof=${True}
    Edit Profile        height=0.0 cm
    ${min_height}    Get Profile
    Run Keyword And Continue On Failure     Should Be Equal     ${min_height}[Height]     0 cm
    Open Profile    is_open=${False}        open_edit_prof=${True}
    Edit Profile        height=271.9 cm
    ${max_height}    Get Profile
    Run Keyword And Continue On Failure     Should Be Equal     ${max_height}[Height]     271.9 cm
    Open Profile    is_open=${False}        is_close=${True}
    Sign Out Bioheart Portal

BHP-PROFILE-EDITPROFILE-13: Check Weight max-min value with Imperial
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Profile button on the right-sidebar
    ...    - 2. Click on Edit profile button
    ...    - 3. Enter min value (0.0Ib)
    ...    - 4. Enter max value (881.7Ibs)
    ...
    ...     Expected Output:
    ...    - 1. Profile screen is opened
    ...    - 2. Navigate to the Edit profile screen
    ...    - 3. Enter min value successfully
    ...    - 4. Enter max value successfully
    [Tags]  BHP-PROFILE-EDITPROFILE-13      auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Profile        open_edit_prof=${True}
    Edit Profile        weight=0.0 ibs
    ${min_weight}    Get Profile
    Run Keyword And Continue On Failure     Should Be Equal     ${min_weight}[Weight]     0 lbs
    Open Profile    is_open=${False}        open_edit_prof=${True}
    Edit Profile        weight=881.7 ibs
    ${max_weight}    Get Profile
    Run Keyword And Continue On Failure     Should Be Equal     ${max_weight}[Weight]     881.7 lbs
    Open Profile    is_open=${False}        is_close=${True}
    Sign Out Bioheart Portal

BHP-PROFILE-EDITPROFILE-14: Check Weight max-min value with Metric
    [Documentation]     Author:Linh Tran
    ...
   ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Profile button on the right-sidebar
    ...    - 2. Click on Edit profile button
    ...    - 3. Enter min value (0.0kg)
    ...    - 4. Enter max value (399.9kg)
    ...
    ...     Expected Output:
    ...    - 1. Profile screen is opened
    ...    - 2. Profile picture modal is displayed
    ...    - 3. Enter min value successfully
    ...    - 4. Enter max value successfully
    [Tags]  BHP-PROFILE-EDITPROFILE-14      auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Profile        open_edit_prof=${True}
    Edit Profile        weight=0.0 kg
    ${min_weight}    Get Profile
    Run Keyword And Continue On Failure     Should Be Equal     ${min_weight}[Weight]     0 kg
    Open Profile    is_open=${False}        open_edit_prof=${True}
    Edit Profile        weight=399.9 kg
    ${max_weight}    Get Profile
    Run Keyword And Continue On Failure     Should Be Equal     ${max_weight}[Weight]     399.9 kg
    Open Profile    is_open=${False}        is_close=${True}
    Sign Out Bioheart Portal

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library    project_bioheart_portal/lib/web/Common.py    ${BROWSER_NODE}  ${ENV}
    Import Library    project_bioheart_portal/lib/web/Profile.py    ${BROWSER_NODE}  ${ENV}
    Set Suite Variable  ${BROWSER_NODE}
    ${USER}    Get Config Param    USER
    Set Suite Variable      ${USER}
    ${VERSION}      Navigate To Bioheart Sign In Page
    Set Suite Metadata    version   ${VERSION}
    Set Suite Metadata    browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Profile       open_edit_prof=${True}
    Upload Image      file_path=project_bioheart_portal/test/data/img_2.jpeg
    Edit Profile        first_name=Doflamingo   last_name=Donquixote    date=08/11/2001     height=165 cm    weight=65 kg
    Quit Browser
