*** Settings ***
Documentation   Biocare app Services tab test suite
Metadata    sid     BIOC-SERVICES
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-SERVICES   mapp
Test Timeout    5h

*** Test Cases ***
BIOC-SERVICES-01: View Services screen (The user has not started the program + no study)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services tab
    ...
    ...     Expected Output:
    ...     1. Services screen shall display the following components:
    ...        - Title: Services
    ...        - Text: Enter reference code here
    ...        - Study code card
    ...          + Code input bar
    ...          + Text: You didn’t receive the code?
    ...          + Resend code button
    ...        - Start monitoring button
    ...        - Discovery services section with the Heart study card and Healthcare program card
    ...          + Heart study
    ...            Text: Monitor your heart data and track your study status.
    ...            Learn more button: Home - Biotricity
    ...          + Healthcare program
    ...            Text: Keep track of your health by following your healthcare program.
    ...            Learn more button: Clinics - Biotricity
    [Tags]      BIOC-SERVICES-01        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-02: View Services screen (Monitor BT or BF study) and Reference code screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services tab
    ...
    ...     Test Steps:
    ...     1. Viasully the Services tab
    ...     2. Press on Enter Reference Code button
    ...
    ...     Expected Output:
    ...     1. - Title: Heart study – [study ID]
    ...          + Bioflux or Biotres
    ...          + Online icon
    ...          + Battery level
    ...            Format: [number] %
    ...            Format: Charging ([number] %)
    ...          + Contact status
    ...            Good contact
    ...            Partial contact
    ...          + Progress status
    ...            Study time left – [number]d [number]h [number]m
    ...            Study paused - [number]d [number]h [number]m
    ...          + View study button
    ...        - Other services section
    ...          + Text: Do you have any other services?
    ...          + Enter Reference Code button
    ...     2. Navigate user to Reference code screen:
    ...        - Text: "Enter reference code here"
    ...        - Reference code input bar: 6 characters
    ...        - Text: "You didn't receive the code?" Resend code button
    ...        - Start monitoring button
    [Tags]      BIOC-SERVICES-02        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-03: Started program but not monitor BT or BF study
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services tab
    ...     - The reference code consists of 6 digits.
    ...       Program code will have the format: 8XXXXX
    ...       Study code will have the format: 1XXXXX
    ...
    ...     Test Steps:
    ...     1. Viasully the Services tab
    ...     2. Press on Enter Reference Code button
    ...     3. Enter study code and press Start monitoring button
    ...
    ...     Expected Output:
    ...     1. - Healthcare program card
    ...          Title: Healthcare program
    ...          + Message button
    ...          + [Type of program] - [Program ID]
    ...          + Facility - [Facility name]
    ...          + Appointment booking - [number]
    ...          + View healthcare program button
    ...        - Other services section
    ...          + Text: Do you have any other services?
    ...          + Enter Reference Code button
    ...     2. Monitor study screen shall be displayed
    ...     3. Can connect with device
    [Tags]      BIOC-SERVICES-03        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-REFCODE-01: View Reference code screen. Case - On study processing enter other study code
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services tab
    ...     - The user has not linked care plan
    ...     - Monitoring Biotres/Bioflux study
    ...     - The reference code consists of 6 digits.
    ...       Program code will have the format: 8XXXXX
    ...       Study code will have the format: 1XXXXX
    ...
    ...     Test Steps:
    ...     1. Press on Enter Reference Code button
    ...     2. Enter study code Bioflux if monitoring Biotres study
    ...     3. Enter study code Bioflux when monitoring Bioflux study
    ...     4. Enter study code Biotres if monitoring Bioflux study
    ...     5. Enter study code Biotres when monitoring Biotres study
    ...     6. Press on Go to current study button
    ...
    ...     Expected Output:
    ...     2,3,4,5.
    ...        Popup Could not start monitoring
    ...        - Message: You are currently following a study. To start monitoring another study, you need to leave monitoring this one.
    ...        - Go to current study button
    ...        - Cancel button
    ...     6. Navigate to the Biotres or Bioflux study
    [Tags]      BIOC-SERVICES-REFCODE-01        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-REFCODE-02: Case - setup Biotres & enter other study code
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Reference Code screen
    ...     - The user has not linked care plan
    ...     - Connect with Biotres device: Ready for new study
    ...
    ...     Test Steps:
    ...     1. Enter other study code (Biotres or Bioflux)
    ...     2. Press on Remove button
    ...
    ...     Expected Output:
    ...     1. Popup Could not start monitoring
    ...          - Message: The clinic is setting up a new study with Biotres. To start monitoring another study, you need to remove the connecting Biotres. Would you like to proceed with this action now?
    ...          - Remove button
    ...          - Cancel button
    ...     3. Disconnect Bitres device and show banner successfully
    [Tags]      BIOC-SERVICES-REFCODE-02        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-REFCODE-03: Case - On program processing enter other program code
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Reference Code screen
    ...     - The user has linked care plan
    ...
    ...     Test Steps:
    ...     1. Enter other program code and press Start monitoring button
    ...     2. Press on Okay button
    ...
    ...     Expected Output:
    ...     1. Popup Could not start monitoring
    ...        - Message: You are currently following a program. To start monitoring another program, please contact your clinic for further information.
    ...        - Okay button
    ...     3. Back to the previuos screen
    [Tags]      BIOC-SERVICES-REFCODE-03        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-REFCODE-04: Agree EC processing + Enter other program code
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Reference Code screen
    ...     - Agree EC consent screen (Input refcode 1)
    ...
    ...     Test Steps:
    ...     1. Enter ref code 2 and press Start monitoring button
    ...
    ...     Expected Output:
    ...     1. Switch to program of ref code 2 and back to the services screen
    [Tags]      BIOC-SERVICES-REFCODE-04        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-REFCODE-05: Agree & Sign CCM/RPM/CCM&RPM consent + Enter other program code
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Reference Code screen
    ...     - Agree & Sign CCM/RPM/CCM&RPM consent screen
    ...
    ...     Test Steps:
    ...     1. Enter ref code 2 and press Start monitoring button
    ...     2. Press on Okay button
    ...
    ...     Expected Output:
    ...     1. Popup Could not start monitoring
    ...        - Message: You are currently following a program. To start monitoring another program, please contact your clinic for further information.
    ...        - Okay button
    ...     3. Back to the previous screen
    [Tags]      BIOC-SERVICES-REFCODE-05        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-REFCODE-06: Enter ref code less then 6 characters or no entering ref code
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Reference Code screen
    ...
    ...     Test Steps:
    ...     1. No entering ref code and press on start monitoring button
    ...     2. Enter ref code less then 6 characters
    ...     2. Press on Start monitoring button
    ...
    ...     Expected Output:
    ...     1. Message “This field is required.” and cannot navigate to services detail screen
    ...     2. Message "6-character code is required." and cannot navigate to services detail screen
    [Tags]      BIOC-SERVICES-REFCODE-06        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-REFCODE-07: Enter invalid ref code
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Reference Code screen
    ...
    ...     Test Steps:
    ...     1. Enter invalid ref code
    ...     2. Press on Start monitoring button
    ...     3. Press on Contact support button
    ...     4. Enter description and send
    ...
    ...     Expected Output:
    ...     2. Popup No service found
    ...        - Message: There is no service that matches the entered reference code.
    ...        - Contact support button
    ...        - Try another way button
    ...     3. Navigate user to the Send us your feedback screen
    ...     4. Popup Feedback sent!
    ...        - Message: Your request has been submitted successfully. Thank you for your feedback
    ...        - Contact support button
    [Tags]      BIOC-SERVICES-REFCODE-07        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-REFCODE-08: Try another way + have study match info
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Reference Code screen
    ...     - Study setting up
    ...
    ...     Test Steps:
    ...     1. Enter invalid ref code
    ...     2. Press on Start monitoring button
    ...     3. Press on Try another way button
    ...     4. Press on Verify button
    ...
    ...     Expected Output:
    ...     2. Popup No service found
    ...        - Message: There is no service that matches the entered reference code.
    ...        - Contact support button
    ...        - Try another way button
    ...     3. Navigate user to the Extra verification screen
    ...     4. Check info and navigate to the study
    ...       * If study setting uo, popup This study has not been started display
    [Tags]      BIOC-SERVICES-REFCODE-08        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-REFCODE-09: Enter ref code without Internet
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Program code screen
    ...     - The Internet is disconnected
    ...
    ...     Test Steps:
    ...     1. Enter ref code
    ...     2. Press on Start registering button
    ...
    ...     Expected Output:
    ...     2. Message "No internet connection. Please try again" and cannot navigate to services detail screen
    [Tags]      BIOC-SERVICES-REFCODE-09       BIOC-1.14.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-REFCODE-10: linked code -> Enter another refcode (linked another program) -> No service found
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...     - Linked Program
    ...
    ...     Test Steps:
    ...     1. Press on Enter Reference Code button
    ...     2. Enter another refcode (linked another program)
    ...
    ...     Expected Output:
    ...     2. Popup "No Service Found"
    [Tags]      BIOC-SERVICES-REFCODE-10         BIOC-1.15.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-REFCODE-11: Linked Code -> Enter another refcode (Not link) -> Could not start monitoring
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...     - Linked Program
    ...
    ...     Test Steps:
    ...     1. Press on Enter Reference Code button
    ...     2. Enter another refcode (Not link)
    ...
    ...     Expected Output:
    ...     2. Popup "Could not start monitoring"
    [Tags]      BIOC-SERVICES-REFCODE-11         BIOC-1.15.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-REFCODE-12: Đã link code -> nhập lại code cũ -> No service found
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Press on View your Biocare Health history button
    ...
    ...     Expected Output:
    ...     1.
    [Tags]      BIOC-SERVICES-REFCODE-12         BIOC-1.15.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-REFCODE-13: Đã link code -> nhập code sai -> No service found
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Press on View your Biocare Health history button
    ...
    ...     Expected Output:
    ...     1.
    [Tags]      BIOC-SERVICES-REFCODE-13         BIOC-1.15.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-REFCODE-14: Đã link code -> monitor bt -> nhập code BF-> could not start
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Press on View your Biocare Health history button
    ...
    ...     Expected Output:
    ...     1.
    [Tags]      BIOC-SERVICES-REFCODE-14         manual       1.15.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-CAREPLAN-MANUALLY-01: Start program (Enter manually)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is added in the portal (Enter manually)
    ...     - The user is in Services screen
    ...     - Unlinked program
    ...
    ...     Test Steps:
    ...     1. Enter program code
    ...     2. Press on Start monitoring
    ...     3. Click on Name consent
    ...     4. Click on Close button
    ...
    ...     Expected Output:
    ...     2. Navigate user to Services screen:
    ...        - Healthcare program card
    ...        - Name consent: Consent To Use Electronic Communication
    ...        - Text: Please read before proceeding
    ...        - Agree button
    ...     3. Navigate the user to the Electronic Consent screen:
    ...        - Agree button
    ...        - Close button
    ...     4. Back to Services screen
    [Tags]      BIOC-SERVICES-CAREPLAN-MANUALLY-01       BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-CAREPLAN-01: Agree Electronic consent
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user to the Services screen
    ...
    ...     Test Steps:
    ...     1. Press on Agree button
    ...
    ...     Expected Output:
    ...     1. Switch user to the CCM-RPM-CCM&RPM screen:
    ...        - Name consent: CCM-RPM-CCM&RPM Consent From
    ...        - Text: Please read before proceeding
    ...        - Agree and Sign button
    [Tags]      BIOC-SERVICES-CAREPLAN-01      BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-CAREPLAN-02: Agree and Sign consent
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user to the CCM-RPM-CCM&RPM Consent screen
    ...
    ...     Test Steps:
    ...     1. Press on Agree and Sign button
    ...     2. Delete First name and Last name
    ...     3. Press on Next button
    ...     4. First name is empty
    ...     5. Press on Next button
    ...     6. Last name is empty
    ...     7. Press on Next button
    ...     8. Press on Back button
    ...     9. Press on Agree and Sign button
    ...     10. Press on Next button
    ...
    ...     Expected Output:
    ...     1. Navigate the user to the Your information screen (The information is taken from the demographic info of the program):
    ...        - Text: Please review your information and make any necessary changes before proceeding.
    ...        - Noti: Please note that updating this will not affect your program registration information.
    ...        - First name
    ...        - Lats name
    ...        - Phone number
    ...        - Next button
    ...        - Back icon
    ...     3. Error message: This field is required
    ...     5. Error message: This field is required
    ...     7. Error message: This field is required
    ...     8. Navigate the user back to the previous screen
    ...     10. Navigate the user to a screen where the user can draw their signature
    [Tags]      BIOC-SERVICES-CAREPLAN-02      BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-CAREPLAN-03: Your Signature screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...     - The user to the Your Signature screen
    ...
    ...     Test Steps:
    ...     1. Visually the Your Signature screen
    ...     2. Draw your signature
    ...     3. Press on Clear button
    ...     4. Draw your signature again
    ...     5. Press on Agree button
    ...     6. Press on Okay button
    ...
    ...     Expected Output:
    ...     1. The user can draw their signature
    ...        - Clear button
    ...        - Agree button (disable)
    ...        - Back button
    ...     2. Agree button will enable
    ...     3. Agree button will disable
    ...     4. Agree button will enable
    ...     5. Navigate the user to the Awesome screen
    ...        - Title: Awesome!
    ...        - The consent has been successfully submitted.
    ...        - Okay button
    ...     6. Navigate the user to the Add favorites screen
    [Tags]      BIOC-SERVICES-CAREPLAN-03      BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-CAREPLAN-04: Full flow start program while no internet
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...     - The user to the Electronic Consent screen
    ...
    ...     Test Steps:
    ...     1. Click on Agree button
    ...     2. Click on Agree and Sign button
    ...
    ...     Expected Output:
    ...     - No internet conection. Please try again
    [Tags]      BIOC-SERVICES-CAREPLAN-04      BIOC-1.14.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-CAREPLAN-05: Full flow start program by use User navigation modal
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user has currently not had any studies or programs and has not connected to the Bioheart device
    ...
    ...     Test Steps:
    ...     1. Log in acc and wait for User navigate modal display
    ...     2. Press on Start now button
    ...     3. Press on Start registering button
    ...
    ...     Expected Output:
    ...     2. Navigate to the Program code screen
    ...     3. Navigate user to Services screen:
    ...        - Healthcare program card
    ...        - Name consent: Consent To Use Electronic Communication
    ...        - Text: Please read before proceeding
    ...        - Agree button
    ...     2. Agree and start full flow create new program
    [Tags]      BIOC-SERVICES-CAREPLAN-05      BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-CAREPLAN-MANUALLY-02: Stop program when user Unlinked program
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - There is an activated program
    ...
    ...     Test Steps:
    ...     1. Click Stop grogram on the portal
    ...
    ...     Expected Output:
    ...     1. The reference code will be invalid
    [Tags]      BIOC-SERVICES-CAREPLAN-MANUALLY-02       BIOC-1.22.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-CAREPLAN-06: Stop program when user linked program
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - There is an activated program
    ...     - The user is in Home screen
    ...
    ...     Test Steps:
    ...     1. Click Stop grogram on the portal
    ...     2. Press on View details button
    ...
    ...     Expected Output:
    ...     1. Popup "Health care program completed" shall be displayed
    ...        - Title: Health care program completed
    ...        - Text: Your health care program has been completed. Thank you for choosing our services!
    ...        - View details button
    ...        - Dismiss button
    ...     2. Navigate to the Services tab
    ...        - The stopped program will display the Biocare Health history screen
    [Tags]      BIOC-SERVICES-CAREPLAN-06       BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-CAREPLAN-07: Stop program when user linked program (don't open the app)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - There is an activated program
    ...     - The user is in Home's phone and don't open the app
    ...
    ...     Test Steps:
    ...     1. Click Stop grogram on the portal
    ...     2. Press on Notification in app
    ...
    ...     Expected Output:
    ...     1. Navigated to the Services tab
    ...        - The stopped program will display the Biocare Health history screen
    [Tags]      BIOC-SERVICES-CAREPLAN-07       BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-CAREPLAN-08: Stop program when user linked program
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - There is an activated program
    ...     - The user is in Home screen
    ...
    ...     Test Steps:
    ...     1. Click Stop grogram on the portal
    ...     2. Press on Dismiss button
    ...
    ...     Expected Output:
    ...     1. Popup "Health care program completed" shall be displayed
    ...        - Title: Health care program completed
    ...        - Text: Your health care program has been completed. Thank you for choosing our services!
    ...        - View details button
    ...        - Dismiss button
    ...     2. User still stay at present screen
    [Tags]      BIOC-SERVICES-CAREPLAN-08       BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-04: Healthcare programs tab on Biocare Health history screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Healthcare Health history
    ...     - The user has stopped the program
    ...
    ...     Test Steps:
    ...     1. Press on Healthcare programs tab
    ...     2. Press on one card
    ...     3. Press on Medical records card
    ...     4. Press on Program information card
    ...     5. Press on Caregivers card
    ...     6. Press on Message card
    ...     7. Press on back icon button
    ...
    ...     Expected Output:
    ...     1. Swipe to the Healthcare programs tab:
    ...        - Each card in the list displays 1 program information containing:
    ...           + Program ID: Program type and 5 number (ex: CCM - 00001). This will display the latest Program type before the Program was stopped.
    ...           + Start date: Format (mm/dd/yyyy) - Stop date: Format (mm/dd/yyyy)
    ...        - The program list will be sorted by start date from the latest to the oldest
    ...     2. The user shall be able to show more sections:
    ...        - Medical records
    ...        - Prescribed medications (This section shall not display if the program is RPM)
    ...        - Program information
    ...        - Caregivers
    ...        - Message (This section shall not display if Chat feature has never been enabled in that program)
    ...     3. Section will open that section’s screen and close button
    ...     4. Section will open that section’s screen and close button
    ...     5. Section will open that section’s screen and close button
    ...     6. If the members of that program are the same as those of the current program, the app shall navigate the user to the conversation of the current program.
    ...        If the members of that program are different from those of the current program, the app shall navigate the user to the conversation of that program.
    ...     7. User can back to the Services screen
    [Tags]      BIOC-SERVICES-04        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-CAREPLAN-MANUALLY-03: Reactivated program when user unlinked program
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - There is a stopped program
    ...
    ...     Test Steps:
    ...     1. Reactive from portal
    ...
    ...     Expected Output:
    ...     1. The previous code will be valid
    ...        - The user can sign in and input the ref code to link the program
    [Tags]      BIOC-SERVICES-CAREPLAN-MANUALLY-03       BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-CAREPLAN-09: Reactivated program when user linked program
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - There is a stopped program
    ...     - Linked program
    ...
    ...     Test Steps:
    ...     1. Reactive from the portal
    ...
    ...     Expected Output:
    ...     1. The reactivated program will not display in the Healthcare programs list
    [Tags]      BIOC-SERVICES-CAREPLAN-09        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-CAREPLAN-10: Switch CCM to RPM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The current CP type is CCM
    ...     - The user has signed the CCM consent
    ...
    ...     Test Steps:
    ...     1. Go to cardiac portal and swith program
    ...     2. Press on Agree and sign button
    ...
    ...     Expected Output:
    ...     1. Healthcare program will change to RPM consent form
    ...     2. Navigate user to services screen
    ...        Program: RPM - ID
    ...        - Agreements will include EC consent form and RPM consent form
    [Tags]      BIOC-SERVICES-CAREPLAN-10        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-CAREPLAN-11: Switch RPM to CCM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The current CP type is RPM
    ...     - The user has signed the RPM consent
    ...
    ...     Test Steps:
    ...     1. Go to cardiac portal and swith program
    ...     2. Press on Agree and sign button
    ...
    ...     Expected Output:
    ...     1. Healthcare program will change to CCM consent form
    ...     2. Navigate user to services screen
    ...        Program: CCM - ID
    ...        - Agreements will include EC form and CCM consent form
    [Tags]      BIOC-SERVICES-CAREPLAN-11        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-CAREPLAN-12: Switch CCM to CCM&RPM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The current CP type is CCM
    ...     - The user has signed the CCM consent
    ...
    ...     Test Steps:
    ...     1. Go to cardiac portal and swith program
    ...     2. Press on Agree and sign button
    ...
    ...     Expected Output:
    ...     1. Healthcare program will change to RPM consent form
    ...     2. Navigate user to Services screen
    ...        Program: CCM&RPM - ID
    ...        - Agreements will include EC consent form, CCM consent form and RPM consent form
    [Tags]      BIOC-SERVICES-CAREPLAN-12        BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-CAREPLAN-13: Switch CCM&RPM to CCM or RPM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The current CP type is CCM&RPM
    ...     - The user has signed the CCM&RPM consent
    ...
    ...     Test Steps:
    ...     1. Go to cardiac portal and swith program
    ...     2. Press on Agree and sign button
    ...
    ...     Expected Output:
    ...     1. Healthcare program will change to CCM consent form
    ...     2. Navigate user to services screen
    ...        Program: CCM or RPM - ID
    ...        - Agreemrnts will include EC consent form and CCM or RPM consent form
    [Tags]      BIOC-SERVICES-CAREPLAN-13         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-CAREPLAN-14: Switch RPM to CCM&RPM
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The current CP type is RPM
    ...     - The user has signed the RPM consent
    ...
    ...     Test Steps:
    ...     1. Go to cardiac portal and swith program
    ...     2. Press on Agree and sign button
    ...
    ...     Expected Output:
    ...     1. Healthcare program will change to CCM consent form
    ...     2. Navigate user to services screen
    ...        Program: CCM & RPM - ID
    ...        - Agreemrnts will include EC consent form, CCM consent form and RPM consent form
    [Tags]      BIOC-SERVICES-CAREPLAN-14         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-CAREPLAN-15: Clinic users upload on the portal
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Clinic users upload on the portal
    ...
    ...     Expected Output:
    ...     1. Swipe to the Service screen without signing in the consent
    ...        - Agree EC consent
    [Tags]      BIOC-SERVICES-CAREPLAN-15         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-CAREPLAN-APPUSER-01: Start/Stop program
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is completed self-tracking
    ...     - Unlinked program
    ...
    ...     Test Steps:
    ...     1. Add new patient on portal
    ...     2. Open the Biocare health app
    ...     3. Press on Services tab
    ...     4. Press on Agree button
    ...     5. Press on Agree and Sign button
    ...     6. Click on Stop program on the portal
    ...
    ...     Expected Output:
    ...     1. Notification in app
    ...     3. Navigate user to Services screen:
    ...        - Healthcare program card
    ...         + Title: Consent To Use Electronic Communication
    ...         + Name consent: Please read before proceeding
    ...         + Agree button
    ...     4. Navigate user to the CCM-RPM-CCM&RPM Consent From screen:
    ...        - Name consent: CCM-RPM-CCM&RPM Consent From
    ...        - Text: Please read before proceeding
    ...        - Agree and Sign button
    ...     5. Continue fill information and start program
    ...     6. Navigated to the Services tab
    ...        - The stopped program will display the Biocare Health history screen
    [Tags]      BIOC-SERVICES-CAREPLAN-APPUSER-01        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HEALTHCARE-01: View Healthcare program screen
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...     - The user has linked care plan
    ...
    ...     Test Steps:
    ...     1. Press on View program button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Healthcare program
    ...        - Quality-of-life test card if the user has not done it
    ...          + Start test button
    ...        - Message button
    ...        - Appointment booking card
    ...        - Program information card
    ...        - Medical records card
    ...        - Goals card
    ...        - Medical card
    ...        - Quality of life assessment card
    ...        - Caregivers card
    ...        - Agreements card
    ...        - Previous programs card
    ...        - Education materials card
    ...        - Biokit instruction card
    [Tags]      BIOC-SERVICES-HEALTHCARE-01         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HEALTHCARE-02: View Appointment
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Healthcare program screen
    ...
    ...     Test Steps:
    ...     1. Press on Appointment card
    ...     2. Click on Back icon button
    ...
    ...     Expected Output:
    ...     1. Navigate to Appointment screen
    ...       - There are 2 sections: Upcoming and History appointment
    ...       - Back button
    ...     2. User can navigate to the previous screen
    [Tags]      BIOC-SERVICES-HEALTHCARE-02         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HEALTHCARE-03: View program information
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Healthcare program screen
    ...
    ...     Test Steps:
    ...     1. Press on Program card
    ...
    ...     Expected Output:
    ...     1. Navigate to Program information screen:
    ...        - Registered facility:
    ...          + Facility name
    ...          + Facility address: <street address>, <city>, <state code><zip code>
    ...            Ex: 5231 North Freeway, Houston, TX 77022
    ...          + Program ID: including plan type (CCM/RPM/CCM&RPM) and the id of Program (example: CCM-56393)
    ...        - Provided equipment: the value can be one or more of the following options. If the selected option is Biokit the app will not display the list of items contained in the biokit.
    ...          + Blood Pressure Monitor
    ...          + Pulse oximeter
    ...          + Weight scale
    ...          + Biokit
    ...          + Bioheart
    ...        - Schedule:
    ...          + Bloodwork: This section will not be displayed on the patient’s app if it is disabled.
    ...            * Frequency: [number of day] day(s)
    ...            * Next due on: <Mmm DD, YYYY>
    ...            * Test type: the value can be one or more of the following options:
    ...                CBC
    ...                INR
    ...                TSH
    ...                Creatinine
    ...                Liver function test
    ...                Blood glucose test
    ...                Lipid profile
    ...          + Stress test: This section will not be displayed on the patient’s app if it is disabled
    ...            * Frequency: [number of day] day(s)
    ...            * Next due on: <Mmm DD, YYYY>
    ...          + Follow up: the value can be one of the following options:
    ...            * Frequency: [number of day] day(s)
    ...            * Next due on: <Mmm DD, YYYY>
    [Tags]      BIOC-SERVICES-HEALTHCARE-03      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HEALTHCARE-04: View Goals card
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Healthcare program screen
    ...
    ...     Test Steps:
    ...     1. Press on Goals card
    ...     2. Tap on back button
    ...
    ...     Expected Output:
    ...     1. Navigate to Program goals screen:
    ...        - All goals tab
    ...        - Progress tab
    ...        - Back button
    ...     2. User can navigate to the Healthcare program screen
    [Tags]      BIOC-SERVICES-HEALTHCARE-04      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HEALTHCARE-05: View Medical card
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Healthcare program screen
    ...
    ...     Test Steps:
    ...     1. Press on Medical card
    ...     2. Tap on Back button
    ...
    ...     Expected Output:
    ...     1. Navigate to Medical records screen:
    ...        - Demographics info
    ...        - Health info
    ...        - Medical test results
    ...        - Back button
    ...     2. User can navigate to the previous screen
    [Tags]      BIOC-SERVICES-HEALTHCARE-05            BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HEALTHCARE-06: View Demographics info on the Medical records card
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Healthcare program screen
    ...
    ...     Test Steps:
    ...     1. Press on Medical card
    ...
    ...     Expected Output:
    ...     1. Navigate to Medical records screen
    ...        - Demographics information card:
    ...          + Basic information
    ...             * First name
    ...             * Last name
    ...             * Gender
    ...             * DOB, format mm/dd/yyyy
    ...             * Height
    ...             * Weight
    ...             * BMI
    ...          + Contact information
    ...             * Email
    ...             * Mobile phone number
    ...             * Emergency phone number
    ...             * Home phone number
    ...             * Address
    ...             * Country
    ...          + Payment type - display one between the two following types
    ...             * Cash/Credit card paying
    ...             * Insurance:
    ...                When this option is selected
    ...                 o If the patient’s nationality is not American, facility users shall be able to view the following information:
    ...                     Insurance name
    ...                     Provincial billing (display – if empty)
    ...                     Expiration date (display – if empty)
    ...                 o If the patient’s nationality is American, facility users shall be able to view the following information:
    ...                     Insurance name - it can be one of the following options:
    ...                       Private
    ...                       Medicare
    ...                       Medicaid
    ...                       United health
    ...                       Kaiser
    ...                       Anthem
    ...                       Humana
    ...                       Blue Cross
    ...                       Aetna
    ...                       Cigna
    ...                       CVS
    ...                       Molina
    ...                       Other insurance
    ...                 o Expiration date (display – if empty)
    [Tags]      BIOC-SERVICES-HEALTHCARE-06            BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HEALTHCARE-07: View Health info on the Medical records card
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Medical records screen
    ...
    ...     Test Steps:
    ...     1. Press on Health info card
    ...     2. Press on Back icon button
    ...
    ...     Expected Output:
    ...     1. This tab includes the following information:
    ...        - Diagnoses
    ...          + Display “--” if empty.
    ...          + This includes 3 sections: Monitored, Active, Historical (a section shall be hidden if it’s empty).
    ...          + Each section includes diagnoses. Each diagnosis includes
    ...            * ICD-10 code and condition name
    ...            * Acuity
    ...            * Onset date: DD/MM/YYYY
    ...            * Diagnosis date: DD/MM/YYYY
    ...            * Confirmed via
    ...            * Associated medications
    ...            * Notes
    ...            * At-risk tag
    ...        - Allergies (This section does not display if the Program type is RPM)
    ...          + Display “-” if empty
    ...        - Allergic medications (This section does not display if the Program type is RPM)
    ...          + Display “-” if empty
    ...          + This section includes the list of allergic medications that the clinic has set up on the portal
    ...        - Cardiac risk assessment (This section does not display if the Program type is RPM)
    ...          + Display “-” if empty.
    ...          + Each assessment includes 3 elements
    ...            * Assessment name: it could be the following names
    ...               o ChA2DS2-VASc
    ...               o HAS-BLED
    ...               o EHRA
    ...               o FRS
    ...            * Score
    ...            * Risk factor
    ...          + For the sore and content of result, please refer to facility portal: BCCA-SRS-18-FRS-01 Add Cardiac risk assessment
    ...     2. User can navigate to the previous screen
    [Tags]      BIOC-SERVICES-HEALTHCARE-07      BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HEALTHCARE-08: View Medical test Result in the Medical records card
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Healthcare program screen
    ...     - This section only displays if the program type is either CCM or CCM&RPM
    ...
    ...     Test Steps:
    ...     1. Press on Medical records card
    ...     2. Press on Medical test Result card
    ...
    ...     Expected Output:
    ...     1. Navigate to Medical test Result screen
    ...        - If there is no test result, the system shall display the message “No test results”
    ...        - The test results are grouped by months from latest to oldest. Each month includes test result that is sorted by date from latest to oldest.
    ...        - Each test result includes the following information:
    ...          + Test type
    ...          + Result date
    ...          + Summary
    ...        - Tap on each test result will navigate the user to the Details screen, where they can view
    ...          + Test type
    ...          + Result date
    ...          + Summary
    ...          + Attachment links
    ...            * Tap on this will download the file
    ...          + Details
    ...            * Analyte
    ...            * Result (Value and unit)
    ...            * Abnormal flag: Normal/High/Low
    [Tags]      BIOC-SERVICES-HEALTHCARE-08         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HEALTHCARE-09: View Caregivers
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Healthcare program screen
    ...
    ...     Test Steps:
    ...     1. Press on Caregivers card
    ...     2. Press on back icon button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Caregivers screen
    ...        - Caregiver information card includes the following information:
    ...          + Avatar: avatar of the caregiver
    ...          + Name: name of the caregiver
    ...          + Role:
    ...            * Physician
    ...            * Nurse
    ...     2. Navigate to the previous screen
    [Tags]      BIOC-SERVICES-HEALTHCARE-09         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HEALTHCARE-10: View Agreements
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Healthcare program screen
    ...
    ...     Test Steps:
    ...     1. Press on Agreements card
    ...     2. Press on View button
    ...     3. Press on X button
    ...     4. Press on Share button
    ...     5. Press on back icon button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Agreements screen
    ...        - The user shall be able to select the following consent:
    ...          + Electronic Communication Consent Form
    ...          + Chronic Care Management Consent Form
    ...          + Remote Patient Monitoring Consent Form
    ...     2. Navigate the user to the corresponding consent
    ...     3. Navigate the user back to the Agreements screen
    ...     4. The user is also able to share the consent:
    ...        - The filename of this file should be
    ...          + Consent To Use Electronic Communications: “EC consent - <Patient first name and last name>”
    ...          + Patient Consent Agreement for Chronic Care Management Services: “CCM consent - <Patient first name and last name>”
    ...          + Remote Patient Monitoring Services consent: “RPM consent - <Patient first name and last name>”
    ...     5. Navigate to the previous screen
    [Tags]      BIOC-SERVICES-HEALTHCARE-10         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HEALTHCARE-11: View Previous healthcare programs (No Previous programs)
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Healthcare program screen
    ...
    ...     Test Steps:
    ...     1. Press on Previous healthcare programs card
    ...     2. Press on back icon button
    ...
    ...     Expected Output:
    ...     1. Message: "No data to display"
    ...     2. Back to Healthcare program screen
    [Tags]      BIOC-SERVICES-HEALTHCARE-11          BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HEALTHCARE-12: View Previous healthcare programs
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Healthcare program screen
    ...
    ...     Test Steps:
    ...     1. Press on Previous healthcare programs card
    ...     2. Press on one card
    ...     3. Press on Medical records card
    ...     4. Press on Program information card
    ...     5. Press on Caregivers card
    ...     6. Press on Message card
    ...     7. Press on back icon button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Previous healthcare programs screen:
    ...        - Each card in the list displays 1 program information containing:
    ...           + Program ID: Program type and 5 number (ex: CCM - 00001). This will display the latest Program type before the Program was stopped.
    ...           + Start date: Format (mm/dd/yyyy)
    ...           + Stop date: Format (mm/dd/yyyy)
    ...        - The program list will be sorted by start date from the latest to the oldest
    ...     2. The user shall be able to show more sections:
    ...        - Medical records
    ...        - Prescribed medications (This section shall not display if the program is RPM)
    ...        - Program information
    ...        - Caregivers
    ...        - Message (This section shall not display if Chat feature has never been enabled in that program)
    ...     3. Section will open that section’s screen and close button
    ...     4. Section will open that section’s screen and close button
    ...     5. Section will open that section’s screen and close button
    ...     6. If the members of that program are the same as those of the current program, the app shall navigate the user to the conversation of the current program.
    ...        If the members of that program are different from those of the current program, the app shall navigate the user to the conversation of that program.
    ...     7. User can back to the Healthcare program screen.
    [Tags]      BIOC-SERVICES-HEALTHCARE-12        BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HEALTHCARE-13: View Biokit instructions
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Healthcare program screen
    ...     - This section will display when all the following requirements are met:
    ...       + Plan type is one of following: RPM and CCM&RPM
    ...       + Provided equipment checked one or more of the following
    ...           * Blood pressure monitor
    ...           * Pulse oximeter
    ...           * Weight scale
    ...           * Biokit
    ...
    ...     Test Steps:
    ...     1. Press on Biokit instructions card
    ...     2. View Instructions for use
    ...     3. View Quick guides
    ...     4. Press on back icon button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Biokit instructions screen, there shall be two sections:
    ...        - Instructions for use
    ...        - Quick guides
    ...     2. There shall be 3 cards each will have:
    ...          + Title: as the design
    ...          + The View button, tapping on this shall open the corresponding instruction file.
    ...          + The Download button, tapping on this shall download the instruction as a PDF file.
    ...     3. There shall be 3 cards:
    ...        - How to measure Blood pressure
    ...          + Tapping on this card will open the guide to measure.
    ...          + There shall be Back/Next buttons to move to the previous/next image (the first screen shall not have the Back button and the last shall not have the Next button).
    ...          + There shall be a Close button to close the guide.
    ...        - How to measure Heart rate & Blood oxygen
    ...          + Tapping on this card will open the guide to measure.
    ...          + There shall be Back/Next buttons to move to the previous/next image (the first screen shall not have the Back button and the last shall not have the Next button).
    ...          + There shall be a Close button to close the guide.
    ...        - How to measure Body temperature
    ...          + Tapping on this card will open the guide to measure.
    ...          + There shall be Back/Next buttons to move to the previous/next image (the first screen shall not have the Back button and the last shall not have the Next button).
    ...          + There shall be a Close button to close the guide.
    ...      4. Navigate to the Healthcare program screen
    [Tags]      BIOC-SERVICES-HEALTHCARE-13         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HEALTHCARE-14: View Education materials
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Healthcare program screen
    ...
    ...     Test Steps:
    ...     1. Press on Education materials card
    ...     2. Press on Back button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Education materials screen:
    ...        - What are direct-acting oral aticoagulants (DOACs)? (4 mins read)
    ...        - AFib: Partnering in your treatment (2 mins read)
    ...        - A patient's guide to living wwith AFib (48 mins read)
    ...        - You have AFib - Atrial Fibrillation (2 mins read)
    ...        - What are heart disease and stroke? (4) mins read)
    ...        - What is AFib - Atrial Fibrillation? (4 mins read)
    ...        - FAQs of AFib - Atrial Fibrillation (10 mins read)
    ...     2. User can navigate to the previous screen
    [Tags]      BIOC-SERVICES-HEALTHCARE-14          BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HEALTHCARE-15: View Bioheart pairing card
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The CP type is RPM or CCM&RPM
    ...     - The device selected contains bioheart
    ...
    ...     Test Steps:
    ...     1. Visually the Healthcare program screen
    ...     2. Press on Pair now button
    ...
    ...     Expected Output:
    ...     1. Pair Bioheart device card and Pair now button
    ...     2. Navigate user to the Pair device screen
    [Tags]      BIOC-SERVICES-HEALTHCARE-15         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HEARTSTUDY-01: Enter study code in Services screen if user don't link program
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...     - The study is started
    ...
    ...     Test Steps:
    ...     1. Enter valid study code
    ...     2. Press on Start Monitoring button
    ...
    ...     Expected Output:
    ...     2. If the Biotres: Connect by Ble and navigate study Biotres screen
    ...        If the Bioflux: User can monitor Bioflux study
    [Tags]      BIOC-SERVICES-HEARTSTUDY-01          BIOC-1.14.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HEARTSTUDY-02: View Heart study when connected device
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     1. Heart study - [Study-ID]
    ...        Biotres/Bioflux       Online/Offline
    ...        Batery %         Good contact/Partial contact
    ...        Study time left      DD HH MM
    [Tags]      BIOC-SERVICES-HEARTSTUDY-02          BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HEARTSTUDY-03: Bioflux device has been connected to your Biocare Health app
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Press on View study button
    ...
    ...     Expected Output:
    ...     1. Navigate to the View study information screen:
    ...        - If Bioflux is online, the card consists of the following components:
    ...          + Tittle: Bioflux
    ...          + Online icon + Online
    ...          + Battery level
    ...             * Format: [number] %
    ...             * Format: Charging ([number] %)
    ...          + Contact status
    ...             * Good contact
    ...             * Partial contact
    ...          + Progress bar
    ...        - If Bioflux is disconnected from the server due to low cell signal or powered off for more than 2 hours, the card consists of the following components:
    ...          + Tittle: Bioflux
    ...          + Offline icon + Offline
    ...          + Progress bar
    ...        - If Bioflux has been offline for less than 2 hours, the card consists of the following components:
    ...          + Tittle: Bioflux
    ...          + Grey icon
    ...          + Active <last connected time>
    ...             * The last connected time shall be displayed:
    ...                 o 0s < last connected time < 1h, display: “[number] m ago”
    ...                 o 1h <= last connected time <= 2h, display “[number] h [number]m ago”
    ...        - Progress bar
    [Tags]      BIOC-SERVICES-HEARTSTUDY-03          BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HEARTSTUDY-04: Attention alert above the Bioflux card
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Press on View study button
    ...
    ...     Expected Output:
    ...     1. Depending on the issue, they shall display with the different content:
    ...        - When contact status is partial
    ...          + Message: Attention! Partial contact
    ...          + Guide button. Tapping this button shall automatically open the video of Electrode Placement on Body. The user can then tap Play button in the Video player to view the instructions.
    ...        - When there are some common issues
    ...          + Message: Issue! The device has been offline for more than 12 hours (Issue! One or more electrodes have been disconnected / Issue! The study has been paused for more than 8 hours)
    ...          + Solution button. Tapping this button shall navigate the user to the Troubleshooting screen.
    ...        - When the battery of the device is low
    ...          + Message: Attention! Low battery
    ...          + Learn button. Tapping this button shall automatically open the video of Power ON and Charging. The user can then tap Play button in the Video player to view the instructions.
    [Tags]      BIOC-SERVICES-HEARTSTUDY-04          BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HEARTSTUDY-05: Attention alert above the Biotres card
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Press on View study button
    ...
    ...     Expected Output:
    ...     1. Depending on the issue, they shall display with the different content:
    ...        - When bluetooth is off
    ...          + Message: Bluetooth is turned off
    ...          + Settings button. Tapping this button shall navigate the user to the settings of the phone.
    ...        - When contact status is partial
    ...          + Message: Attention! Partial contact
    ...          + Guide button. Tapping this button shall automatically open the video of Electrode Placement on Body. The user can then tap Play button in the Video player to view the instructions.
    ...        - When there are some common issues
    ...          + Message: Issue! The device has been offline for more than 12 hours (Issue! One or more electrodes have been disconnected / Issue! The study has been paused for more than 8 hours)
    ...          + Solution button. Tapping this button shall navigate the user to the Troubleshooting screen.
    ...        - When the battery of the device is low
    ...          + Message: Attention! Low battery
    ...          + Learn button. Tapping this button shall automatically open the video of Power ON and Charging. The user can then tap Play button in the Video player to view the instructions.
    [Tags]      BIOC-SERVICES-HEARTSTUDY-05       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HISTORY-01: View your Biocare Health history
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...     - The user has stopped the program or study or both
    ...
    ...     Test Steps:
    ...     1. Press on View your Biocare Health history button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Studies tab and show list history
    [Tags]      BIOC-SERVICES-HISTORY-01       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HISTORY-02: The first Biotres study done
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...     - Biotres study completed
    ...
    ...     Test Steps:
    ...     1. Press on View your Biocare Health history button
    ...
    ...     Expected Output:
    ...     1. Navigate to the studies tab
    [Tags]      BIOC-SERVICES-HISTORY-02       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HISTORY-03: The first Bioflux study done
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...     - Bioflux study completed
    ...
    ...     Test Steps:
    ...     1. Press on View your Biocare Health history button
    ...     2. Kill app and reopen app
    ...
    ...     Expected Output:
    ...     1. No have View your Biocare Health history card
    ...     2. Card View your Biocare Health history will display
    ...        - Studies tab show Study ID
    ...        - Healthcare program tab show 'No data to display'
    [Tags]      BIOC-SERVICES-HISTORY-03       BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HISTORY-04: The first program done
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Press on View your Biocare Health history button
    ...
    ...     Expected Output:
    ...     1. Navigate to the Healthcare programs tab
    [Tags]      BIOC-SERVICES-HISTORY-04          BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-HISTORY-05: The second program done
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Press on View your Biocare Health history button
    ...
    ...     Expected Output:
    ...     1.
    [Tags]      BIOC-SERVICES-HISTORY-05          BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-TRYANOTHERWAY-NOCP-01: Matching information -> Link CP
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Extra Verification screen
    ...
    ...     Test Steps:
    ...     1. FN, LN, DOB match information
    ...
    ...     Expected Output:
    ...     1. Link CP -> Navigate to the Services screen
    [Tags]      BIOC-SERVICES-TRYANOTHERWAY-NOCP-01          BIOC-1.15.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-TRYANOTHERWAY-NOCP-02: Matching information + have study -> Link CP
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Extra Verification screen
    ...     - Monitoring BT or BF study
    ...
    ...     Test Steps:
    ...     1. FN, LN, DOB match information
    ...
    ...     Expected Output:
    ...     1. Link CP -> Navigate to the Services screen
    [Tags]      BIOC-SERVICES-TRYANOTHERWAY-NOCP-02          BIOC-1.15.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-TRYANOTHERWAY-NOCP-03: Matching information + Study Completed -> ignore study completed -> Link CP
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Extra Verification screen
    ...     - Have study completed
    ...
    ...     Test Steps:
    ...     1. Enter FN, LN, DOB match information
    ...
    ...     Expected Output:
    ...     1. Ignore Study completed and link CP -> Navigate to the Servives screen
    [Tags]      BIOC-SERVICES-TRYANOTHERWAY-NOCP-03          BIOC-1.15.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-TRYANOTHERWAY-NOCP-04: No match information -> No service found
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Extra Verification screen
    ...
    ...     Test Steps:
    ...     1. Enter FN, LN, DOB no matching with any information
    ...
    ...     Expected Output:
    ...     1. Popup "No service found'
    [Tags]      BIOC-SERVICES-TRYANOTHERWAY-NOCP-04          BIOC-1.15.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-TRYANOTHERWAY-NOCP-05: No match information + have study -> monitor study
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Extra Verification screen
    ...
    ...     Test Steps:
    ...     1. Enter FN, LN, DOB no matching with any information but match with study
    ...
    ...     Expected Output:
    ...     1. Navigate to the Study screen
    [Tags]      BIOC-SERVICES-TRYANOTHERWAY-NOCP-05          BIOC-1.15.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-TRYANOTHERWAY-NOCP-06: No match information + study completed -> No service found
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Extra Verification screen
    ...     - Study completed
    ...
    ...     Test Steps:
    ...     1. Enter FN, LN, DOB no matching with any information but match with study completed
    ...
    ...     Expected Output:
    ...     1. Pop up "No service found"
    [Tags]      BIOC-SERVICES-TRYANOTHERWAY-NOCP-06          BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-TRYANOTHERWAY-NOCP-07: No link program + setting up BT - Enter info BT study -> This study has not been started
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Extra Verification screen
    ...
    ...     Test Steps:
    ...     1. Enter info BT study
    ...
    ...     Expected Output:
    ...     1. Pop up "This study has not been started"
    [Tags]      BIOC-SERVICES-TRYANOTHERWAY-NOCP-07         manual       1.15.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-TRYANOTHERWAY-NOCP-08: No link program + Setting up BT - Enter info BF study -> Could not start
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Extra Verification screen
    ...
    ...     Test Steps:
    ...     1. Enter info BF study
    ...
    ...     Expected Output:
    ...     1. Popup "Could not start"
    [Tags]      BIOC-SERVICES-TRYANOTHERWAY-NOCP-08         manual       1.15.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-TRYANOTHERWAY-NOCP-09: No link program + Setting up BT - Enter anohter info BT study -> Could not start
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Extra Verification screen
    ...
    ...     Test Steps:
    ...     1. Enter anohter info BT study
    ...
    ...     Expected Output:
    ...     1. Popup "Could not start"
    [Tags]      BIOC-SERVICES-TRYANOTHERWAY-NOCP-09         manual       1.15.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-TRYANOTHERWAY-HAVECP-01: Linked program + have study - Enter information matching with program
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Extra Verification screen
    ...
    ...     Test Steps:
    ...     1. Enter information matching with program
    ...
    ...     Expected Output:
    ...     1. Navigate user to the Study details
    [Tags]      BIOC-SERVICES-TRYANOTHERWAY-HAVECP-01         manual       1.15.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-TRYANOTHERWAY-HAVECP-02: Linked program + no have study - Enter information matching with program
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Extra Verification screen
    ...
    ...     Test Steps:
    ...     1. Enter information matching with program
    ...
    ...     Expected Output:
    ...     1. Navigate user to the Services screen
    [Tags]      BIOC-SERVICES-TRYANOTHERWAY-HAVECP-02         manual       1.15.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-TRYANOTHERWAY-HAVECP-03: Linked program + Study completed - Enter info study competed
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Extra Verification screen
    ...
    ...     Test Steps:
    ...     1. Enter info study competed
    ...
    ...     Expected Output:
    ...     2. Popup "Study completed"
    [Tags]      BIOC-SERVICES-TRYANOTHERWAY-HAVECP-03         manual       1.15.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-TRYANOTHERWAY-HAVECP-04: Linked program + Connect BT device with status "Ready for new study" - Enter info BT study
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Extra Verification screen
    ...
    ...     Test Steps:
    ...     1. Enter info BT study
    ...
    ...     Expected Output:
    ...     1. Pop up "No service found"
    [Tags]      BIOC-SERVICES-TRYANOTHERWAY-HAVECP-04         manual       1.15.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-TRYANOTHERWAY-HAVECP-05: Linked program + Connect BT device with status "Ready for new study" - Enter info BF study
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Extra Verification screen
    ...
    ...     Test Steps:
    ...     1. Enter info BF study
    ...
    ...     Expected Output:
    ...     1. Pop up "Could not start"
    [Tags]      BIOC-SERVICES-TRYANOTHERWAY-HAVECP-05         manual       1.15.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-TRYANOTHERWAY-HAVECP-06: Linked program + Connect BT device with status "Ready for new study" - Enter info another BT study
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Extra Verification screen
    ...
    ...     Test Steps:
    ...     1. Enter info another BT study
    ...
    ...     Expected Output:
    ...     1. Popup "Could not start"
    [Tags]      BIOC-SERVICES-TRYANOTHERWAY-HAVECP-06         manual       1.15.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-TRYANOTHERWAY-HAVECP-07: Linked program + Setting up BT - Enter info BT study
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Extra Verification screen
    ...
    ...     Test Steps:
    ...     1. Enter info BT study
    ...
    ...     Expected Output:
    ...     1. Popup "This study has not been started"
    [Tags]      BIOC-SERVICES-TRYANOTHERWAY-HAVECP-07         manual       1.15.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-TRYANOTHERWAY-HAVECP-08: Linked program + Setting up BT - Enter info Study BF
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Extra Verification screen
    ...
    ...     Test Steps:
    ...     1. Enter info study BF
    ...
    ...     Expected Output:
    ...     1. Popup "Could not start"
    [Tags]      BIOC-SERVICES-TRYANOTHERWAY-HAVECP-08         manual       1.15.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-SERVICES-TRYANOTHERWAY-HAVECP-09: Linked program + Setting up BT - Enter another info study
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is in Extra Verification screen
    ...
    ...     Test Steps:
    ...     1. Enter another info study
    ...
    ...     Expected Output:
    ...     1. Popup "Could not start"
    [Tags]      BIOC-SERVICES-TRYANOTHERWAY-HAVECP-09         manual       1.15.0
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
