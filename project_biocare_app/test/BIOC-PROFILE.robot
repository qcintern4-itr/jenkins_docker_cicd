*** Settings ***
Documentation   Biocare app Profile test suite
Metadata    sid     BIOC-PROFILE
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-PROFILE    mapp
Test Timeout    1h

*** Test Cases ***
BIOC-PROFILE-01: View Profile screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...
    ...     Test Steps:
    ...     1. Press on Profile tab
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Profile screen:
    ...        - User profile
    ...          + User name
    ...          + Email
    ...          + Age
    ...          + Height and Weight
    ...          + Edit profile button
    ...        - Payment information card
    ...        - Medical information card
    ...        - About Biocare Health button
    ...        - Settings button
    ...        - Refer friends section
    ...          + Text: Invite a friend to join Biocare!
    ...          + Share button
    ...        - Sync with other applications section
    ...        - Sign out button
    [Tags]      BIOC-PROFILE-01        BIOC-SRS-06-FRS-01-001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-EDITPROFILE-01: View Edit profile screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Test Steps:
    ...     1. Press on Edit profile button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Edit profile Tab:
    ...        - Avatar section
    ...        - Basic info tab (defalt)
    ...        - Contact info tab
    ...        - Save button
    ...        - Back button
    [Tags]      BIOC-PROFILE-EDITPROFILE-01     BIOC-SRS-06-FRS-02-001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-EDITPROFILE-02: Edit Profile picture
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Edit profile screen
    ...
    ...     Test Steps:
    ...     1. Press on Edit profile picture button
    ...     2. Select option to update profile picture or cancel
    ...     3. Press on Cancel button
    ...     4. Press on Edit profile picture button
    ...     5. Press on Take a photo button
    ...     6. Press on Choose from library button
    ...     7. Remove current photo button
    ...
    ...     Expected Output:
    ...     1. The modal "Edit profile picture" shall be display:
    ...        - Take a photo button
    ...        - Choose from library button
    ...        - Remove current photo button (only display if the user has set avatar earlier)
    ...        - Cancel button
    ...     3. The modal "Edit profile picture" shall be closed
    ...     5. Take a new photo to be the avatar
    ...     6. Choose a photo from your phone to be avatar
    ...     7. Remove the current photo and close the modal
    [Tags]      BIOC-PROFILE-EDITPROFILE-02     BIOC-SRS-06-FRS-02-001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-EDITPROFILE-03: View Basic info tab
    [Documentation]     Author: Han Nguyen
    ...
    ...     Test Steps:
    ...     1. Viasully the Basic info tab
    ...
    ...     Expected Output:
    ...     1. - First name
    ...        - Last name
    ...        - Email (Disable)
    ...        - Date of birth
    ...        - Gender: Female and Male
    ...        - Body mearurement:
    ...          + Imperial (ft, lb) or Metric (cm, kg)
    [Tags]      BIOC-PROFILE-EDITPROFILE-03     BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-EDITPROFILE-04: Update Basic info tab
    [Documentation]     Author: Han Nguyen
    ...
    ...     Test Steps:
    ...     1. Update username (First name and Last name)
    ...     2. Press on Save button
    ...     3. Press on Edit profile button
    ...     4. Update username (First name and Last name)
    ...     5. Press on Back button
    ...     6. Press on Cancel button
    ...     7. Press on Edit profile button
    ...     8. Update username (First name and Last name)
    ...     9. Press on Back button
    ...     10. Press on Save changes button
    ...
    ...     Expected Output:
    ...     2. Basic info is saved and navigate to the Profile screen
    ...     3. Navigate to the Profile screen
    ...     5. Popup "Unsaved changes" shall be display
    ...        - Text: Do you want to save all changes before leaving?
    ...        - Save changes button
    ...        - Cancel button
    ...     6. The popup shall be closed without saving
    ...     10. Basic info is saved and navigate to the Profile screen
    [Tags]      BIOC-PROFILE-EDITPROFILE-04     BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-EDITPROFILE-05: Update Edit profile (No change)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Test Steps:
    ...     1. Press on Save button
    ...     2. Press on Edit profile button
    ...     3. Press on Back button
    ...
    ...     Expected Output:
    ...     1. Back to the Profile screen
    ...     3. Back to the Profile screen
    [Tags]      BIOC-PROFILE-EDITPROFILE-05     BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-EDITPROFILE-06: Update Edit profile when no internet
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Turn off internet
    ...
    ...     Test Steps:
    ...     1. Update username (First name and Last name)
    ...     2. Press on Save button
    ...
    ...     Expected Output:
    ...     2. The user is updated successfully
    [Tags]      BIOC-PROFILE-EDITPROFILE-06     BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-EDITPROFILE-07: Leave blank username fields
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Edit profile screen
    ...
    ...     Test Steps:
    ...     1. Delete username field (First name or Last name)
    ...     2. Press on Save button
    ...     3. Press on Back button
    ...     4. Press on Save changes button
    ...     5. Press on Cancel button
    ...
    ...     Expected Output:
    ...     2. Message "All fields are required" will display and cannot save basic info
    ...     3. Popup "Unsaved changes" shall be display
    ...        - Text: Do you want to save all changes before leaving?
    ...        - Save changes button
    ...        - Cancel button
    ...     4. Message "All fields are required" will display and cannot save basic info
    ...     5. Updated basic info is not saved and navigate to the Profile screen
    [Tags]      BIOC-PROFILE-EDITPROFILE-07     BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-EDITPROFILE-08: View Contact info tab
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Edit profile screen
    ...
    ...     Test Steps:
    ...     1. Press on Contact info tab
    ...
    ...     Expected Output:
    ...     1. - Country
    ...        - Phone number (requied)
    ...        - Address
    ...        - City
    ...        - State
    ...        - Zip code
    ...        - Save button
    ...        - Back button
    [Tags]      BIOC-PROFILE-EDITPROFILE-08     BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-EDITPROFILE-09: Update Contact info
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Edit profile tab
    ...
    ...     Test Steps:
    ...     1. Press on Contact info tab
    ...     2. Update Country
    ...     3. Press on Save button
    ...     4. Press on Edit profile tab
    ...     5. Press on Contact info tab
    ...     6. Update Country
    ...     7. Press on Back button
    ...     8. Press on Cancel button
    ...     9. Press on Edit profile button
    ...     10. Press on Contact info tab
    ...     11. Update Country
    ...     12. Press on Back button
    ...     13. Press on Save changes button
    ...
    ...     Expected Output:
    ...     3. Contact info is saved and navigate to the Profile screen
    ...     4. Navigate to the Profile screen
    ...     7. Popup "Unsaved changes" shall be display
    ...        - Text: Do you want to save all changes before leaving?
    ...        - Save changes button
    ...        - Cancel button
    ...     8. The popup shall be closed without saving
    ...     13. Contact info is saved and navigate to the Profile screen
    [Tags]      BIOC-PROFILE-EDITPROFILE-09     BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-EDITPROFILE-10: Edit phone number field
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Edit profile screen
    ...
    ...     Test Steps:
    ...     1. Press on Contact info tab
    ...     2. Leave blank phone number field
    ...     3. Press on Save button
    ...     4. Press on Back button
    ...     5. Press on Save changes button
    ...     6. Press on Cancel button
    ...     7. Press on Edit profile button
    ...     8. Press on Contact info tab
    ...     9. Input 16 numbers in the box
    ...
    ...     Expected Output:
    ...     3. Message "The field is required" will display and cannot save Contact info
    ...     4. Popup "Unsaved changes" shall be display
    ...        - Text: Do you want to save all changes before leaving?
    ...        - Save changes button
    ...        - Cancel button
    ...     5. Message "The field is required" will display and cannot save basic info
    ...     6. Updated basic info is not saved and navigate to the Profile screen
    ...     9. Can not enter number 16th
    [Tags]      BIOC-PROFILE-EDITPROFILE-10     BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-EDITPROFILE-11: Update user info (Basic info and Contact info)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Edit profile screen
    ...
    ...     Test Steps:
    ...     1. Update username (First name and Last name)
    ...     2. Press on Contact info tab
    ...     3. Press on Save button
    ...     4. Press back button
    ...     5. Press Cancel button
    ...     6. Press Edit profile button
    ...     7. Press on Contact info tab
    ...     8. Delete phone number
    ...     9. Press on Basic info tab
    ...     10. Press on Save button
    ...     11. Press Edit profile button
    ...     12. Update username (First name and Last name)
    ...     13. Update Country
    ...     14. Press on Save button
    ...
    ...     Expected Output:
    ...     3. Back to the Basic info tab and show "All field is required"
    ...     10. Back to the Contact info tab and show "The field is required"
    ...     14. Basic info and Contact info are saved and navigate to the Profile screen
    [Tags]      BIOC-PROFILE-EDITPROFILE-11     BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-EDITPROFILE-12: Update avatar user info (no internet)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - The device has no internet
    ...     - The user is in Edit profile screen
    ...     Test Steps:
    ...     1. Update Avatar
    ...
    ...     Expected Output:
    ...     1. The user will be able to edit their profile without an internet connection (Not including “Update avatar” section). When the user taps Edit icon button on the Avatar, the app shall show the snack bar with the content: “No internet connection” and Settings button. 
    ...    Tapping this button, the app shall navigate the user to the phone’s settings screen. 
    [Tags]      BIOC-PROFILE-EDITPROFILE-12     BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-PAYMENT-01: View Payment information (No data)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...     1. Press on Payment information card
    ...     2. Press on Back button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Payment information screen
    ...        - Message: No information
    ...        - Add payment type button
    ...        - Back button
    ...     2. Back to previous screen
    [Tags]      BIOC-PROFILE-PAYMENT-01       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-PAYMENT-02: Add Payment information (Cash/Credit card paying type)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Payment information screen
    ...
    ...     Test Steps:
    ...     1. Press on Add payment type button
    ...     2. Select Cash/Credit card paying type
    ...     3. Press on Back button
    ...     4. Press on Add payment type button
    ...     5. Select Cash/Credit card paying type
    ...     6. Press on Save button
    ...     7. Press on Back button
    ...
    ...     Expected Output:
    ...     2. Save button will appear
    ...     3. Back to the previous screen
    ...     6. Back to the previous screen and Snack bar "Information has been updated successfully" will be displayed:
    ...        - Title: Payment type
    ...        - Cash/Credit card paying
    ...        - Edit button
    ...     7. Navigate to the Profile screen
    [Tags]      BIOC-PROFILE-PAYMENT-02       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-PAYMENT-03: Add Payment information (Insurance type)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Payment information screen
    ...
    ...     Test Steps:
    ...     1. Press on Add payment type button
    ...     2. Select insurance type
    ...     3. Input Insurance name
    ...     4. Press on Back button
    ...     5. Press on Add payment type button
    ...     6. Select insurance type
    ...     7. Input Insurance name
    ...     8. Press on Save button
    ...     9. Press on Back button
    ...
    ...     Expected Output:
    ...     2. The screen shall display more fields:
    ...        - Insurance name (This field is required)
    ...        - Provincial billing
    ...        - Expiration date
    ...        - Save button
    ...     4. Back to the previous screen
    ...     8. Back to the previous screen
    ...        Insurance is saved and display in the Insurance information screen
    ...        - Title: Payment type
    ...        - Insurance name: [Name]
    ...        - Provincial billing
    ...        - Expiration date
    ...        - Edit button
    ...     9. Navigate to the Profile screen
    [Tags]      BIOC-PROFILE-PAYMENT-03       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BIOC-PROFILE-PAYMENT-04: Add Payment information (Cash/Credit card paying type, no internet)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - The device has no internet
    ...     - The user is in Payment information screen
    ...
    ...     Test Steps:
    ...     1. Press on Add payment type button
    ...     2. Select Cash/Credit card paying type
    ...     3. Press on Back button
    ...     4. Press on Add payment type button gain
    ...     5. Select Cash/Credit card paying type
    ...     6. Press on Save button
    ...
    ...     Expected Output:
    ...     2. Save button will appear
    ...     3. Back to the previous screen
    ...     6. The user will be able to add their profile without an internet connection.
    [Tags]      BIOC-PROFILE-PAYMENT-04      BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-PAYMENT-05: Add Payment information (Insurance type, no internet)
   [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - The device has no internet
    ...     - The user is in Payment information screen
    ...
    ...     Test Steps:
    ...     1. Press on Add payment type button
    ...     2. Select insurance type
    ...     3. Input Insurance name
    ...     6. Select Expiration date
    ...     7. Input Provincial Billing  name
    ...     8. Press on Save button
    ...
    ...     Expected Output:
    ...     8. The user will be able to add their profile without an internet connection.
    [Tags]      BIOC-PROFILE-PAYMENT-05       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-PAYMENT-06: Leave blank Payment name when add payment type
    [Documentation]     Author: Han Nguyen
    ...
    ...     Test Steps:
    ...     1. Press on Add payment type button
    ...     2. Select insurance type
    ...     3. Leave blank insurance name
    ...     4. Press on Save button
    ...
    ...     Expected Output:
    ...     4. Message "This field is required" shall be displayed
    [Tags]      BIOC-PROFILE-PAYMENT-06       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-PAYMENT-07: Edit Payment type
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Payment information screen
    ...     - Insurance has added
    ...
    ...     Test Steps:
    ...     1. Press on Edit button
    ...     2. Update payment type
    ...     3. Press on Save button
    ...     4. Press on Edit button
    ...     5. Update payment type
    ...     6. Press on Back button
    ...
    ...     Expected Output:
    ...     3. New payment type is saved and display in the Payment information screen
    ...     6. New payment type is not saved and back to the Payment information screen
    [Tags]      BIOC-PROFILE-PAYMENT-07       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BIOC-PROFILE-PAYMENT-08: Edit Payment type (no internet)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The device has no internet
    ...     - The user is in Payment information screen
    ...     - Insurance has added
    ...
    ...     Test Steps:
    ...     1. Press on Edit button
    ...     2. Update payment type
    ...     3. Press on Save button
    ...     4. Press on Edit button
    ...     5. Update payment type
    ...     6. Press on Back button
    ...
    ...     Expected Output:
    ...     3. New payment type is saved and display in the Payment information screen
    ...     6. New payment type is not saved and back to the Payment information screen
    [Tags]      BIOC-PROFILE-PAYMENT-08       BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-MEDICAL-01: View Medical information (No info)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...     1. Press on Medical information card
    ...     2. Press on Back button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Medical conditions screen
    ...        - Message: No information
    ...        - Add your medical conditions button
    ...        - Back button
    ...     2. Back to the Profile screen
    [Tags]      BIOC-PROFILE-MEDICAL-01     BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-MEDICAL-02: Add Medical conditions
    [Documentation]     Author: Linh Tran
    ...
    ...     Test Steps:
    ...     1. Press on Add your medical conditions button
    ...     2. Add medical conditions
    ...     3. Enter your allergies
    ...     4. Press on Back button
    ...     5. Press on Add your medical conditions button
    ...     6. Add medical conditions
    ...     7. Enter your allergies
    ...     8. Press on Save button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Add medical conditions screen:
    ...        - Text: Provide more information about your conditions. This step is optional.
    ...        - Text: Search and select your medical conditions
    ...        - Add medical conditions button
    ...        - Text: Is there anything you’re allergic to?
    ...        - Text: Allergies
    ...        - Textbox: Enter your allergies
    ...     2. Save button will be displayed
    ...     4. Medical is not saved and navigate to the previous screen
    ...     8. Medical is saved and display in the Medical conditions screen
    [Tags]      BIOC-PROFILE-MEDICAL-02     BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-MEDICAL-03: Edit Medical conditions
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Medical has added
    ...
    ...     Test Steps:
    ...     1. Press on Edit button
    ...     2. Update your medical conditions
    ...     3. Press on Back button
    ...     4. Press on Edit button
    ...     5. Update your medical conditions
    ...     6. Press on Save button
    ...
    ...     Expected Output:
    ...     3. New Medical is not saved and navigate to the previous screen
    ...     6. New Medical is saved and back to the Medical conditions screen
    [Tags]      BIOC-PROFILE-MEDICAL-03     BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-ABOUTBIOC-01: View about Biocare Health screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...     1. Press on About Biocare Health card
    ...     2. Press on Back button
    ...
    ...     Expected Output:
    ...     1. Navigate to the About Biocare Health screen:
    ...        - Logo app
    ...        - Name: Biocare Health
    ...        - App version
    ...        - Privacy policy card
    ...        - Terms and conditions card
    ...        - Rate Biocare app card
    ...        - Send feedback card
    ...        - Back button
    ...      2. Back to the Profile screen
    [Tags]      BIOC-PROFILE-ABOUTBIOC-01       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-ABOUTBIOC-02: View Privacy policy card
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in About Biocare Health screen
    ...
    ...     Test Steps:
    ...     1. Press on About Privacy policy card
    ...     2. Click on link: www.biotricity.com
    ...     3. Click on link: www.bioheart.com
    ...     4. Press on close or Understood button
    ...
    ...     Expected Output:
    ...     1. Naviagte to Privacy policy screen
    ...        - Content: follow design
    ...        - Close button
    ...        - Understood button
    ...     2,3. Navigate to the corresponding screen
    ...     4. Privacy policy is closed
    [Tags]      BIOC-PROFILE-ABOUTBIOC-02     BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-ABOUTBIOC-03: View Terms and conditions card
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in About Biocare Health screen
    ...
    ...     Test Steps:
    ...     1. Press on Terms and conditions card
    ...     2. Press on link email
    ...     3. Press on Understood button
    ...
    ...     Expected Output:
    ...     1. Naviagte to Terms and conditions screen
    ...        - Content: follow design
    ...        - Close button
    ...        - Understood button
    ...     2. Show options for user send email
    ...     3. The modal Terms and conditions will be closed
    [Tags]      BIOC-PROFILE-ABOUTBIOC-03      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-ABOUTBIOC-04: View Electronic Communication Consent card
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in About Biocare Health screen
    ...
    ...     Test Steps:
    ...     1. Press on Electronic Communication Consent card
    ...     2. Press on Understood button
    ...
    ...     Expected Output:
    ...     1. Naviagte to Electronic Communication Consent screen
    ...        - Content: follow design
    ...        - Close button
    ...        - Understood button
    ...     2. The modal Electronic Communication Consent will be closed
    [Tags]      BIOC-PROFILE-ABOUTBIOC-04      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-ABOUTBIOC-05: View Rate Biocare App card
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in About Biocare Health screen
    ...
    ...     Test Steps:
    ...     1. Press on Rate Biocare App
    ...
    ...     Expected Output:
    ...     1. An Apple store/Google play rating modal shall open and let the user rate the Biocare app
    [Tags]      BIOC-PROFILE-ABOUTBIOC-05       BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-ABOUTBIOC-06: Send feedback with default email
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in About Biocare Health screen
    ...
    ...     Test Steps:
    ...     1. Press on Send feedback card
    ...     2. Enter description and add image
    ...     3. Press on Close button
    ...     4. Press on Send feedback card
    ...     5. Enter description and add image
    ...     6. Press on Send button
    ...     7. Press on Close button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Send us your feedback:
    ...        - Text: We would like to hear from you. Your feedback helps us improve the app and continue building a better experience.
    ...        - Your email field
    ...        - Description field
    ...        - Add image button
    ...        - Send button
    ...        - Close button
    ...     3. The modal shall be closed and cancel to send feedback
    ...     6. Popup send feedback successfully will be displayed
    ...        - Title: Feedback sent!
    ...        - Text: Your request has been submitted successfully. Thank you for your feedback.
    ...        - Close button
    ...     7. Back to the About Biocare Health screen
    [Tags]      BIOC-PROFILE-ABOUTBIOC-06        BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-ABOUTBIOC-07: Send feedback with optional email
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in About Biocare Health screen
    ...
    ...     Test Steps:
    ...     1. Press on Send feedback tab
    ...     2. Change Your email
    ...     3. Enter description
    ...     4. Add image
    ...     5. Press on Send button
    ...
    ...     Expected Output:
    ...     5. Popup send feedback successfully will be displayed
    ...        - Title: Feedback sent!
    ...        - Text: Your request has been submitted successfully. Thank you for your feedback.
    ...        - Close button
    [Tags]      BIOC-PROFILE-ABOUTBIOC-07        BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-ABOUTBIOC-08: Send feedback without Internet connection
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in About Biocare Health screen
    ...     - The Internet is disconnected
    ...
    ...     Test Steps:
    ...     1. Press on Send feedback tab
    ...     2. Enter description
    ...     3. Press on Send button
    ...
    ...     Expected Output:
    ...     3. There is a message "No Internet connection. Please try again" and send feedback fail
    [Tags]      BIOC-PROFILE-ABOUTBIOC-08        BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-ABOUTBIOC-09: Leave blank Your email and Description
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in About Biocare Health screen
    ...
    ...     Test Steps:
    ...     1. Press on Send feedback tab
    ...     2. No entering description
    ...     3. Press on send button
    ...     4. Delete email and no entering description or delete email and entering description
    ...     5. Press on Send button
    ...
    ...     Expected Output:
    ...     3. Message "This field cannot be empty" will be displayed
    ...     5. Message "This field cannot be empty" will be displayed
    [Tags]      BIOC-PROFILE-ABOUTBIOC-09        BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-ABOUTBIOC-10: Email content
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Feedback sent to biocaresupport@biotricity.com
    ...
    ...     Test Steps:
    ...     1. Check mail
    ...
    ...     Expected Output:
    ...     1. Email title: Customer Feedback
    ...        Dear Biocare support team,
    ...        Username: [User’s name]
    ...        Email: [User’s email address]
    ...        Phone number: [User’s phone number]
    ...        [User name] has sent a feedback below:
    ...        [Feedback content]
    ...        Warm regards,
    ...        Biocare team
    [Tags]      BIOC-PROFILE-ABOUTBIOC-10        BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BIOC-PROFILE-ABOUTBIOC-11: View Privacy policy card (no internet)
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - The user view the Privacy Policy
    ...     - The user turn off the internet
    ...     Test Steps:
    ...     1. Press on About Privacy policy card
    ...     2. Click on link: www.biotricity.com
    ...     3. Click on link: www.bioheart.com
    ...     4. Press on close or Understood button
    ...
    ...     Expected Output:
    ...     1. The users can view the Privacy Policy if they have opened them before losing the internet connection.
    ...     2,3.Can't Navigate to the corresponding screen
    ...     4. Privacy policy is closed
    [Tags]      BIOC-PROFILE-ABOUTBIOC-11    BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-ABOUTBIOC-12: View Terms and conditions card (no internet)
    [Documentation]     Author: Tu Nguyen
    ...
     ...     Pre-condition:
    ...     - The user view the Privacy Policy
    ...     - The user turn off the internet
    ...
    ...     Test Steps:
    ...     1. Press on Terms and conditions card
    ...     2. Press on link email
    ...     3. Press on Understood button
    ...
    ...     Expected Output:
    ...     1. The users can view the  Terms and conditions if they have opened them before losing the internet connection.
    ...     2. Show options for user send email
    ...     3. The modal Terms and conditions will be closed
    [Tags]      BIOC-PROFILE-ABOUTBIOC-12      BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-ABOUTBIOC-13: View Electronic Communication Consent card
    [Documentation]     Author: Han Nguyen
    ...
    ...  Pre-condition:
    ...     - The user view the Privacy Policy
    ...     - The user turn off the internet
    ...
    ...     Test Steps:
    ...     1. Press on Electronic Communication Consent card
    ...     2. Press on Understood button
    ...
    ...     Expected Output:
    ...     1. the users can view the Electronic Communication Consent if they have opened them before losing the internet connection.
    ...     2. The modal Electronic Communication Consent will be closed
    [Tags]      BIOC-PROFILE-ABOUTBIOC-13      BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-SETTINGS-01: View Settings screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...     1. Press on Settings tab
    ...
    ...     Expected Output:
    ...     1. Navigate to Settings screen:
    ...        - Units
    ...           + Body measurement: lb|ft (default) / kg|cm
    ...           + Temperature: oF (default) / oC
    ...           + Distance: mile (default) / km
    ...        - Notification
    ...           + Medication reminder
    ...           + Message notifications
    ...           + Daily health log reminder
    ...           + Receive reminder time: 7:00 PM (User can Edit)
    ...           + "Receive a notification when the Bioheart device detects heart rate that rises above falls below pre-selected thresholds for 10 minutes."
    ...             ~ High heart rate notification: Off
    ...             ~ Low heart rate notification: Off
    ...        - Account
    ...          + Language: English (default) or Espanol
    ...          + Change password
    ...          + Delete account
    [Tags]      BIOC-PROFILE-SETTINGS-01      BIOC-1.22.0  manual  R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-SETTINGS-PASSW-01: Change password
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Settings screen
    ...
    ...     Test Steps:
    ...     1. Press on Change password tab
    ...     2. Enter current password, password and confirm password
    ...     3. Press on eye icon
    ...     4. Press on Back icon button
    ...     5. Press on Change password tab
    ...     6. Enter current password, password and confirm password
    ...     7. Press on Update button
    ...     8. Press on Sign in Now button
    ...
    ...     Expected Output:
    ...     1. Navigate to Change password screen
    ...        - Current password textbox: Enter your password
    ...        - Password textbox: Enter your password
    ...        - Confirm password textbox: Re-enter your password
    ...     2. The passwords are hidden
    ...     3. The passwords are showed
    ...     4. The password is not updated and navigate to the previous screen
    ...     7. The password is updated and navigate to the Pasword updated screen
    ...        - Text: Please sign in again with the new password.
    ...        - Sign in now button
    ...     8. Navigate to the Sign in screen
    [Tags]      BIOC-PROFILE-SETTINGS-PASSW-01     BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-SETTINGS-PASSW-02: Leave blank all fields or any field to change password
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Change password screen
    ...
    ...     Test Steps:
    ...     1. Leave blank all fields or any field
    ...     2. Press on Update button
    ...
    ...     Expected Output:
    ...     2. Message "All fields are required" and empty fields text bar's outline will change to red
    [Tags]      BIOC-PROFILE-SETTINGS-PASSW-02     BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-SETTINGS-PASSW-03: Enter password less than 8 characters
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Change password screen
    ...
    ...     Test Steps:
    ...     1. Enter current password
    ...     2. Enter password less than 8 characters
    ...     3. Enter confirm password
    ...     4. Press on Update button
    ...
    ...     Expected Output:
    ...     4. Message "Passwords must be at least 8 characters" shall be displayed and password text bar's outline will change to red
    [Tags]      BIOC-PROFILE-SETTINGS-PASSW-03     BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}'

BIOC-PROFILE-SETTINGS-PASSW-04: Enter wrong current password
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Change password screen
    ...
    ...     Test Steps:
    ...     1. Enter wrong current password
    ...     2. Enter password and confirm password
    ...     3. Press on Update button
    ...     4. Enter wrong password more than 10 times
    ...
    ...     Expected Output:
    ...     3. Message "Wrong password. Plase type again" shall be displayed and password text bar's outline will change to red
    ...     4. Message "Too many failed attempts. Please try later" and user cannot change password now
    [Tags]      BIOC-PROFILE-SETTINGS-PASSW-04     BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-SETTINGS-PASSW-05: Passwords don't match
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Change password screen
    ...
    ...     Test Steps:
    ...     1. Enter current password
    ...     2. Enter password
    ...     3. Enter confirm password different password
    ...     4. Press on Update button
    ...
    ...     Expected Output:
    ...     4. Message "Your password don't match" and password text bar's outline will change to red
    [Tags]      BIOC-PROFILE-SETTINGS-PASSW-05     BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-SETTINGS-PASSW-06: Delete account
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Settings screen
    ...
    ...     Test Steps:
    ...     1. Press on Delete account tab
    ...     2. Prees on Delete my account button
    ...     3. Press on Cancel button
    ...     4. Prees on Delete my account button
    ...     5. Press on Delete button
    ...     6. Press on Got it button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Delete account screen:
    ...        - Message: Are you sure you want to delete?
    ...        - Text: "Please read this carefully before you deactivate and delete your account as your jandoe@domain.com might be linked to various Biotricity services.
    ...                We will only retain your user data for 30 days and then it will be permanently deleted. You can recover your account at any point within 30 days of deactivation
    ...                by logging back in and follow recover account process. The following are the list of all the Biotricity services that will be affected by your deletion."
    ...        - Delete my account button
    ...     2. Popup Delete account will displayed:
    ...        - Title: Delete account
    ...        - Text "Are you sure you want to delete your account?"
    ...        - Delete button
    ...        - Cancel button
    ...     3. Close the popup
    ...     5. Popup We're sorry will displayed
    ...        - Title: We're sorry to see you leave!
    ...        - Text: Your account and all your data have been deleted. You will have 30 days to recover your account in case you change your mind.
    ...                You’re always welcomed to join us again
    ...                Thank you for using Biocare Health
    ...        - Got it button
    ...     6. Back to Sign in Screen
    [Tags]      BIOC-PROFILE-SETTINGS-PASSW-06        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-INVITE-01: Refer friends screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...     1. Press on Share button
    ...     2. Press on More button
    ...     3. Press on Message button
    ...     4. Press on Email button
    ...
    ...     Expected Output:
    ...     1. Popup Share link via will displayed:
    ...        - Contact list
    ...        - Email
    ...        - Message
    ...        - More
    ...     2. The app shall display sharing options (depending on the OS of the phone)
    ...     3. Navigate the user to the message composing screen:
    ...        - Content: “I've been using Biocare to monitor my health, and I thought you might find it useful too: [link to download app]”
    ...     4. Navigate the user to the email composing screen:
    ...        - Content: “I've been using Biocare to monitor my health, and I thought you might find it useful too: [link to download app]”
    [Tags]      BIOC-PROFILE-INVITE-01    BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-INVITE-02: Contact list
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Share link via screen
    ...
    ...     Test Steps:
    ...     1. Press on Contact list
    ...     2. Press on Open settings button
    ...     3. Press on Cancel button
    ...
    ...     Expected Output:
    ...     1. Allow Contact Permission modal displayed:
    ...        - Title: “Biocare Health” would like to access your Contacts
    ...        - Content: Allow access so you can share your itineraries, send invites, and refer friends
    ...        - Open settings button
    ...        - Cancel button
    ...     2. Navigate the user to the phone’s settings
    ...     3. Close the modal and not allow the app access to the phone contact
    [Tags]      BIOC-PROFILE-INVITE-02    BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-BIOSPHERE-01: View Free plan
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...     - The user is Biosphere plan
    ...
    ...     Test Steps:
    ...     1. Press on Biosphere plan overview tab
    ...
    ...     Expected Output:
    ...     1. Navigate to Plan overview screen
    ...        - A statement that shows advertisement details of Biosphere+:
    ...          + Name “Biosphere+”
    ...          + The statement “Get the most out of Bioheart device, view full historical data”
    ...          + The statement “✔ Unlimited rhythm snapshots creation”
    ...          + The statement “✔ Unlimited historical heart rhythm view”
    ...       - Record continuously 24/7
    ...       - Heart rate
    ...       - View and save data: 30days
    ...       - Snapshot: 50
    ...       - User can navigate back by pressing on back button
    [Tags]      BIOC-PROFILE-BIOSPHERE-01    BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-BIOSPHERE-02: View Premium plan
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...     - The user is Biosphere premium plan
    ...
    ...     Test Steps:
    ...     1. Press on Biosphere plan overview tab
    ...
    ...     Expected Output:
    ...     1. Navigate to Plan overview screen
    ...        - A small statement at the right end of Account Status describes the type of plan that the user registered: either “Monthly Plan”, “Annual Plan”, "Enrolled" (program) or “Lifetime Plan”.
    ...        - The statement “Your plan will automatically renew on [Next Purchase Date]. You will be charged [Expected Purchased Amount]”
    ...        - A list of statements that describes the benefits the user would have with the Premium Plan, with one ✔ at the beginning of each statement
    ...          + Main Statement “Plan includes”
    ...             * The statement “24/7 heart rhythm recording”
    ...             * The statement “Create and share health reports”
    ...             * The statement “Unlimited rhythm snapshots creation”
    ...             * The statement “Unlimited historical heart rhythm view”
    ...        - User can navigate back by pressing on back button
    [Tags]      BIOC-PROFILE-BIOSPHERE-02    BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-ACTIVATE-01: View Sync with other applications
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...     1. Viasully the Sync with other applications secction
    ...
    ...     Expected Output:
    ...     1. Apple health (IOS) or Google Fit (Android)
    ...        - If user has not activated with third party, there is no green tick icon next to app name
    ...          + User can activate by pressing on app name
    ...        - If user has activated with third party, there is a green tick icon next to app name
    ...          + User can deactivate by pressing on app name
    [Tags]      BIOC-PROFILE-ACTIVATE-01        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-ACTIVATE-02: View Activate with third party (Android)
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is in Profile screen
    ...     - The user is not activated with third party when completing sefl-tracking
    ...
    ...     Test Steps:
    ...     1. Press on Activate button
    ...     2. Press on Not now button
    ...
    ...     Expected Output:
    ...     1. Navigate to Activate screen:
    ...        - Message: Activate your Google Fit app to anable importing and exporting all data of your health and lifestyle activity.
    ...        - Message below: This will allow Biocare to fully analyze your health and lìfestyle data.
    ...        - Not now button
    ...        - Activate button
    ...     2. Back to the Home screen
    [Tags]      BIOC-PROFILE-ACTIVATE-02       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-ACTIVATE-03: Activate with third party (Android)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is in Profile screen
    ...     - The user is not activated with third party when completing sefl-tracking
    ...
    ...     Test Steps:
    ...     1. Press on Activate button
    ...     2. Press on Activate button
    ...
    ...     Expected Output:
    ...     1. Navigate to Activate screen:
    ...        - Message: Activate your Google Fit app to anable importing and exporting all data of your health and lifestyle activity.
    ...        - Message below: This will allow Biocare to fully analyze your health and lìfestyle data.
    ...        - Not now button
    ...        - Activate button
    ...     2. Activate card is disappeared and in Sync with other applications, at Profile tab will display green ick icon next third party app name.
    [Tags]      BIOC-PROFILE-ACTIVATE-03       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-ACTIVATE-04: Activate with third party after sign in app again (Android)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The app is activated with third party
    ...
    ...     Test Steps:
    ...     1. Sign out and sign in again
    ...     2. Activate with third party again
    ...
    ...     Expected Output:
    ...     2. Activate process can skip permission steps
    [Tags]      BIOC-PROFILE-ACTIVATE-04         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-ACTIVATE-05: The user hasn't downloaded Google fit
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The app is not activated with third party
    ...     - The Google fit app has not installed on the phone
    ...
    ...     Test Steps:
    ...     1. Press on Profile screen
    ...     2. Press on Google fit button
    ...
    ...     Expected Output:
    ...     2. Navigate to Activate screen:
    ...        - Message: Activate your Google Fit app to anable importing and exporting all data of your health and lifestyle activity.
    ...        - Message below: This will allow Biocare to fully analyze your health and lìfestyle data.
    ...        - Not now button
    ...        - Download button
    [Tags]      BIOC-PROFILE-ACTIVATE-05       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-ACTIVATE-06: Activate with third party (IOS)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is in Profile screen
    ...     - The user is not activated with third party when completing sefl-tracking
    ...
    ...     Test Steps:
    ...     1. Press on Activate button
    ...     2. Press on Not now button
    ...     3. Press on Activate button
    ...     4. Press on Activate button
    ...     5. Press on Continue button
    ...
    ...     Expected Output:
    ...     1. Navigate to Activate screen:
    ...        - Message: Activate Apple Health for seamless import and export of real-time health data, streamlining health consultations.
    ...        - Message below: This will allow Biocare to fully analyze your health and lìfestyle data.
    ...        - Not now button
    ...        - Activate button
    ...     2. Back to the home screen
    ...     3. Navigate to the Activate screen
    ...     4. Activate card is disappeared and in Sync with other applications, at Profile tab will display green ick icon next third party app name.
    ...        - Message: On the next screen, please tap “Turn All Categories On” then “Allow”.
    ...        - Message below: All your data will be stored securely & privately.
    ...        - Continue button
    ...     5. Navigate user to the Health Access screen
    [Tags]      BIOC-PROFILE-ACTIVATE-06       BIOC-1.22.0  manual  R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-ACTIVATE-07: Activate with third party after sign in app again (IOS)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The app is activated with third party
    ...
    ...     Test Steps:
    ...     1. Sign out and sign in again
    ...     2. Activate with third party again
    ...
    ...     Expected Output:
    ...     2. Activate process can skip permission steps
    [Tags]      BIOC-PROFILE-ACTIVATE-07         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-SIGNOUT-01: Sign out
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...     1. Press on Sign out button
    ...     2. Press on Cancel button
    ...     3. Press on Sign out button
    ...     4. Press on Sign out button
    ...
    ...     Expected Output:
    ...     1. Popup Sign out will be displayed
    ...        - Title: Are you sure you wish to sign out?
    ...        - Sign out button
    ...        - Cancel button
    ...     2. The popup is closed
    ...     4. User shall sign out from app
    [Tags]      BIOC-PROFILE-SIGNOUT-01     BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-BIOTRES-BIOTRICITY-01: Locked Biotres device by scan QR code
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Account Biotricity
    ...     - The user is in Profile screen
    ...
    ...     Test Data:
    ...     Acc: hubdevice0004@biotricity.com
    ...     Pass: Biotricitypt1234!
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Output:
    ...     1.
    [Tags]     BIOC-PROFILE-BIOTRES-BIOTRICITY-01        BIOC-1.15.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-BIOTRES-BIOTRICITY-02: Locked Biotres device by Enter deivce ID
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Account Biotricity
    ...     - The user is in Profile screen
    ...
    ...     Test Data:
    ...     Acc: hubdevice0004@biotricity.com
    ...     Pass: Biotricitypt1234!
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Output:
    ...     1.
    [Tags]     BIOC-PROFILE-BIOTRES-BIOTRICITY-02        BIOC-1.15.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-BIOTRES-BIOTRICITY-03: Locked Biotres device by Enter Refer Code
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Account Biotricity
    ...     - The user is in Profile screen
    ...
    ...     Test Data:
    ...     Acc: hubdevice0004@biotricity.com
    ...     Pass: Biotricitypt1234!
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Output:
    ...     1.
    [Tags]     BIOC-PROFILE-BIOTRES-BIOTRICITY-03        BIOC-1.15.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-BIOTRES-BIOTRICITY-04: Locked Biotres device with status Ready for new study
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Account Biotricity
    ...     - The user is in Profile screen
    ...
    ...     Test Data:
    ...     Acc: hubdevice0004@biotricity.com
    ...     Pass: Biotricitypt1234!
    ...
    ...     Test Steps:
    ...     1.
    ...     2. Sign out app and sign in
    ...
    ...     Expected Output:
    ...     1.
    ...     2. Device Unlocked
    [Tags]     BIOC-PROFILE-BIOTRES-BIOTRICITY-04        BIOC-1.15.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-BIOTRES-BIOTRICITY-05: Locked Biotres device with status Setting up
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Account Biotricity
    ...     - The user is in Profile screen
    ...
    ...     Test Data:
    ...     Acc: hubdevice0004@biotricity.com
    ...     Pass: Biotricitypt1234!
    ...
    ...     Test Steps:
    ...     1.
    ...     2. Sign out app and sign in
    ...
    ...     Expected Output:
    ...     1.
    ...     2. Device Unlocked
    [Tags]     BIOC-PROFILE-BIOTRES-BIOTRICITY-05        BIOC-1.15.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-BIOTRES-BIOTRICITY-06: Locked Biotres device with status Started
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Account Biotricity
    ...     - The user is in Profile screen
    ...
    ...     Test Data:
    ...     Acc: hubdevice0004@biotricity.com
    ...     Pass: Biotricitypt1234!
    ...
    ...     Test Steps:
    ...     1.
    ...     2. Sign out app and sign in
    ...
    ...     Expected Output:
    ...     1.
    ...     2. Device Unlocked
    [Tags]     BIOC-PROFILE-BIOTRES-BIOTRICITY-06        BIOC-1.15.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-BIOTRES-BIOTRICITY-07: Locked Biotres device with status Uploading and study completed
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Account Biotricity
    ...     - The user is in Profile screen
    ...
    ...     Test Data:
    ...     Acc: hubdevice0004@biotricity.com
    ...     Pass: Biotricitypt1234!
    ...
    ...     Test Steps:
    ...     1.
    ...     2. Sign out and and sign app
    ...     3. Locked device again
    ...     4. Wait for study complete press Okey button
    ...
    ...     Expected Output:
    ...     1.
    ...     2. Device Unlocked
    ...     3. Device Locked
    ...     4. Device still connect with app after study completed
    [Tags]     BIOC-PROFILE-BIOTRES-BIOTRICITY-07        BIOC-1.15.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-BIOTRES-BIOTRICITY-08: Remove device
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Account Biotricity
    ...     - Locked Biotres device: Ready for new study
    ...
    ...     Test Data:
    ...     Acc: hubdevice0004@biotricity.com
    ...     Pass: Biotricitypt1234!
    ...
    ...     Test Steps:
    ...     1. Press on Leave monitoring button on the Biotres study screen
    ...     2. Press Remove button on the Device tabs
    ...     3. Press on Unlock device on the Profile tabs
    ...
    ...     Expected Output:
    ...     1. Device Unlocked
    ...     2. Device Unlocked
    [Tags]     BIOC-PROFILE-BIOTRES-BIOTRICITY-08        BIOC-1.15.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-PROFILE-BIOTRES-BIOTRICITY-09: Lock device when turn off internet
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Account Biotricity
    ...     - Locked Biotres device
    ...
    ...     Test Data:
    ...     Acc: hubdevice0004@biotricity.com
    ...     Pass: Biotricitypt1234!
    ...
    ...     Test Steps:
    ...     1. Turn off Biotres device
    ...
    ...     Expected Output:
    ...     1. Device Unlocked
    ...     2. Device Unlocked
    [Tags]     BIOC-PROFILE-BIOTRES-BIOTRICITY-09        BIOC-1.15.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${APP_NODE}     Get Device Node
    Import Library    project_biocare_app/lib/mapp/Common.py     ${APP_NODE}     ${ENV}
    Start Biocare App
    ${USER}     Get Config Param    USER
    Sign In Biocare App    email=${USER}[username]      password=${USER}[password]
    ${RELEASE_VERSION}     Get Release Version
    Set Suite Metadata     version     ${RELEASE_VERSION}

SUITE TEARDOWN
    Quit All
