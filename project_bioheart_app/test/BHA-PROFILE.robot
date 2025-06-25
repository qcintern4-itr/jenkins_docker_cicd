*** Settings ***
Documentation   Bioheart app Profile test suite
Metadata    sid     BHA-PROFILE
Metadata    owner   Linh Tran
Library     corelib/AssertionExtension.py

Force Tags      BHA-PROFILE     mapp
Test Timeout    1h

*** Test Cases ***
BHA-PROFILE-PROFILESCREEN-01: View profile screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...
    ...     Test Steps:
    ...    - Press on Profile tab
    ...
    ...     Expected Output:
    ...    - Navigate to Profile screen
    ...    - The Profile tab shall consist of the following components
    ...         + User account/ profile information
    ...             o Avatar
    ...             o Full Name
    ...             o Email
    ...             o Age
    ...             o Height
    ...             o Weight
    ...             o “Edit profile” button
    ...             o Biosphere plan overview (navigation button)
    ...             o Bioheart user guides (navigation button)
    ...             o Settings (navigation button)
    ...             o About Bioheart (navigation button)
    ...             o Send feedback (navigation button)
    ...             o “Sign out” button
    [Tags]      BHA-PROFILE-PROFILESCREEN-01    BIOH-SRS-06-FRS-01-001       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-PROFILESCREEN-02: Edit profile information
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...    - Press on Edit button
    ...
    ...     Expected Output:
    ...    - Navigate to Edit profile screen
    ...    - User can edit the following profile information
    ...         + Date of birth
    ...             * User is able to edit their date of birth with 2 options
    ...                 • User enters their date of birth in the format MM/DD/YY
    ...                 • User uses the “calendar” button to select a date
    ...         + Country
    ...             * User is able to select a country name in the scroll-down list
    ...         + Address
    ...             * User is able to enter a text in the input box, there shall be address suggestions from the system which the user can select and the address shall populate to address, city, state, and zip code fields.
    ...         + City
    ...             * City’s name is automatically input when user enters their address
    ...         + State
    ...             * State’s name is automatically input when user enters their address
    ...         + Zipcode
    ...             * User is able to enter a valid digit numbers in the input box
    [Tags]      BHA-PROFILE-PROFILESCREEN-02    BIOH-SRS-06-FRS-01-002       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-PROFILESCREEN-03: Sync the time zones in user profile once the user changes time zones on their phone
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - When the user opens the Bioheart App, the app checks the timezone information. If the app detects that the phone's timezone differs from the Profile timezone, it will update the timezone
    [Tags]      BHA-PROFILE-PROFILESCREEN-03    BIOH-SRS-06-FRS-01-004       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-BIOSPHERE-01: View Free plan
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...     - The user is Biosphere plan
    ...
    ...     Test Steps:
    ...    - Press on Biosphere plan overview tab
    ...
    ...     Expected Output:
    ...    - Navigate to Plan overview screen
    ...    - A statement that shows advertisement details of Biosphere+:
    ...         + Name “Biosphere+”
    ...         + The statement “Get the most out of Bioheart device, view full historical data”
    ...         + The statement “✔ Unlimited rhythm snapshots creation”
    ...         + The statement “✔ Unlimited historical heart rhythm view”
    ...    - Record continuously 24/7
    ...    - Heart rate
    ...    - View and save data: 30days
    ...    - Snapshot: 50
    ...    - User can navigate back by pressing on back button
    [Tags]      BHA-PROFILE-BIOSPHERE-01    BIOH-SRS-06-FRS-02-001       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-BIOSPHERE-02: View Premium plan
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...     - The user is Biosphere premium plan
    ...
    ...     Test Steps:
    ...    - Press on Biosphere plan overview tab
    ...
    ...     Expected Output:
    ...    - Navigate to Plan overview screen
    ...    - A small statement at the right end of Account Status describes the type of plan that the user registered: either “Monthly Plan”, “Annual Plan”, "Enrolled" (care plan) or “Lifetime Plan”.
    ...    - The statement “Your plan will automatically renew on [Next Purchase Date]. You will be charged [Expected Purchased Amount]”
    ...    - A list of statements that describes the benefits the user would have with the Premium Plan, with one ✔ at the beginning of each statement
    ...         + Main Statement “Plan includes”
    ...             * The statement “24/7 heart rhythm recording”
    ...             * The statement “Create and share health reports”
    ...             * The statement “Unlimited rhythm snapshots creation”
    ...             * The statement “Unlimited historical heart rhythm view”
    ...    - User can navigate back by pressing on back button
    [Tags]      BHA-PROFILE-BIOSPHERE-02    BIOH-SRS-06-FRS-02-002       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-USERGUIDE-01: View Bioheart user guide screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...    - Press on Bioheart user guides tab
    ...
    ...     Expected Output:
    ...    - Navigate to Bioheart user guides screen
    ...    - This screen is included components:
    ...         + Quick guides
    ...         + User manual
    ...         + How-to guide
    ...         + FAQs
    ...    - User can navigate back by pressing on back button
    [Tags]      BHA-PROFILE-USERGUIDE-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-USERGUIDE-02: View Quick guides
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Bioheart user guides screen
    ...
    ...     Test Steps:
    ...    - Press on Quick guides tab
    ...
    ...     Expected Output:
    ...    - Navigate to Quick guides screen
    ...    - User can scroll to view full content
    ...    - User can navigate back by pressing on back button
    [Tags]      BHA-PROFILE-USERGUIDE-02    BIOH-SRS-06-FRS-03-001       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-USERGUIDE-03: View User manual
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Bioheart user guides screen
    ...
    ...     Test Steps:
    ...    - Press on User manual tab
    ...
    ...     Expected Output:
    ...    - Navigate to User manual screen
    ...    - User can scroll to view full content
    ...    - User can navigate back by pressing on back button
    [Tags]      BHA-PROFILE-USERGUIDE-03    BIOH-SRS-06-FRS-03-002       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-USERGUIDE-04: View How-to guide
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Bioheart user guides screen
    ...
    ...     Test Steps:
    ...    - Press on How-to guide tab
    ...
    ...     Expected Output:
    ...    - List of How-to guides expanded
    ...    - When user presses on How-to guides tab, the list of How-to guides collapsed
    [Tags]      BHA-PROFILE-USERGUIDE-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-USERGUIDE-05: View How to pair Bioheart
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Bioheart user guides screen
    ...
    ...     Test Steps:
    ...    - Press on How-to guide tab
    ...    - Press on How to pair Bioheart section
    ...
    ...     Expected Output:
    ...    - There shall be 5 step-by-step screens displayed for the user to follow on “How to pair Bioheart”. The following details and components shall be displayed on each of the 5 screens
    ...         + Tutorial screen 1:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Open the Bioheart App on your device and click “_Pair”. Make sure the Bluetooth on your phone or tablet is ON”
    ...         + Tutorial screen 2:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Press and hold the power button for 3 sec. The green light will flash quickly indicating the device is turning ON”
    ...         + Tutorial screen 3:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “The status light will turn pink when the device is in the discovery mode”.
    ...         + Tutorial screen 4:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Select your Bioheart device in the scanned list on the Bioheart App”
    ...         + Tutorial screen 5:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “The status light will turn solid green when the device is paired
    ...    - There shall be page control buttons at the bottom of the tutorial figures on each tutorial screen. The user can swipe left and right to view the next or previous screens.
    ...    - There shall be page navigation arrows at the bottom of each screen to navigate to the next or previous screens.
    ...    - There shall be a “Back” button on each of the 5 step-by-step screens to navigate the user back to the previous “Tutorials” screen
    ...    - User can navigate to previous screen by pressing on back button
    [Tags]      BHA-PROFILE-USERGUIDE-05    BIOH-SRS-06-FRS-03-003       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-USERGUIDE-06: View How to wear Bioheart
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Bioheart user guides screen
    ...
    ...     Test Steps:
    ...    - Press on How-to guide tab
    ...    - Press on How to wear Bioheart section
    ...
    ...     Expected Output:
    ...    - There shall be 3 step-by-step screens displayed for the user to follow on “How to wear the Bioheart”. The following details and components shall be displayed on each of the 3 screens:
    ...         + Tutorial screen 1:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Snap-in the Bioheart device onto the strap”.
    ...         + Tutorial screen 2:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Strap-in one end of the strap with the other end”.
    ...         + Tutorial screen 3:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Adjust the strap and position the Bioheart device in the center, below your sternum”.
    ...    - There shall be page control buttons at the bottom of the tutorial figures on each tutorial screen. The user can swipe left and right to view the next or previous screens.
    ...    - There shall be page navigation arrows at the bottom of each screen to navigate to the next or previous screens.
    ...    - There shall be a “Back” button on each of the 3 step-by-step screens to navigate the user back to the previous “Tutorials” screen.
    ...    - User can navigate to previous screen by pressing on back button
    [Tags]      BHA-PROFILE-USERGUIDE-06    BIOH-SRS-06-FRS-03-004       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-USERGUIDE-07: View How to charge Bioheart
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Bioheart user guides screen
    ...
    ...     Test Steps:
    ...    - Press on How-to guide tab
    ...    - Press on How to charge Bioheart section
    ...
    ...     Expected Output:
    ...    - There shall be 3 step-by-step screens displayed for the user to follow on “How to charge the Bioheart”. The following details and components shall be displayed on each of the 3 screens:
    ...         + Tutorial Screen 1:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “When the battery is getting low, the status light will turn orange and start_ *flashing*”.
    ...         + Tutorial Screen 2:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “_The orange light will_ pulse when the device starts *charging*”.
    ...         + Tutorial Screen 3:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “_When the battery is getting full, the status light will turn and stay solid green_”.
    ...    - There shall be page control buttons at the bottom of the tutorial figures on each tutorial screen. The user can swipe left and right to view the next or previous screens.
    ...    - There shall be page navigation arrows at the bottom of each screen to navigate to the next or previous screens.
    ...    - There shall be a “Back” button on each of the 3 step-by-step screens to navigate the user back to the previous “Tutorials” screen
    ...    - User can navigate to previous screen by pressing on back button
    [Tags]      BHA-PROFILE-USERGUIDE-07    BIOH-SRS-06-FRS-03-005       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-USERGUIDE-08: View How to factory reset Bioheart
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Bioheart user guides screen
    ...
    ...     Test Steps:
    ...    - Press on How-to guide tab
    ...    - Press on How to factory reset Bioheart section
    ...
    ...     Expected Output:
    ...    - There shall be 3 step-by-step screens displayed for the user to follow on “How to factory reset the Bioheart”. The following details and components shall be displayed on each of the 3 screens:
    ...         + Tutorial Screen 1:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “_To start factory reset process, make sure the Bioheart device is turned_ OFF. To turn OFF _the device, hold the power button until the green light starts flashing_”
    ...         + Tutorial Screen 2:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “_Once the device is turned OFF, press and hold the power button again for 10 seconds _until the status light turns pink and start quickly flash_”
    ...         + Tutorial Screen 3:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “_When the status light turns_ OFF and green again the factory reset _is complete_”
    ...    -    There shall be page control buttons at the bottom of the tutorial figures on each tutorial screen. The user can swipe left and right to view the next or previous screens.
    ...    - There shall be page navigation arrows at the bottom of each screen to navigate to the next or previous screens.
    ...    - There shall be a “*Back*” button on each of the 3 step-by-step screens to navigate the user back to the previous “*Tutorials*” screen.
    ...    - User can navigate to previous screen by pressing on back button
    [Tags]      BHA-PROFILE-USERGUIDE-08    BIOH-SRS-06-FRS-03-006       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-USERGUIDE-09: View How to turn on/off Bioheart
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Bioheart user guides screen
    ...
    ...     Test Steps:
    ...    - Press on How-to guide tab
    ...    - Press on How to turn on/off Bioheart section
    ...
    ...     Expected Output:
    ...    - There shall be 2 step-by-step screens displayed for the user to follow on “How to turn on/pff the Bioheart”. The following details and components shall be displayed on each of the 2 screens:
    ...         + Tutorial Screen 1:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Press and hold the power button for 3 secs. The green light will flash quickly indicating the device is turning ON.”
    ...         + Tutorial Screen 2:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “To turn OFF the device, hold the power button until the green light starts flashing”
    ...    - There shall be page navigation arrows at the bottom of each screen to navigate to the next or previous screens.
    ...    - There shall be a “Back” button on each of the 2 step-by-step screens to navigate the user back to the previous “Tutorials” screen
    ...    - User can navigate to previous screen by pressing on back button
    [Tags]      BHA-PROFILE-USERGUIDE-09    BIOH-SRS-06-FRS-03-007       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-USERGUIDE-10: View How to record heart rhythm from Bioheart device
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Bioheart user guides screen
    ...
    ...     Test Steps:
    ...    - Press on How-to guide tab
    ...    - Press on How to record heart rhythm section
    ...
    ...     Expected Output:
    ...    - The following details and components shall be displayed on each of the 7 screens:
    ...         + Tutorial Screen 1:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Press the Event button to initiate a heart rhythm recording.”
    ...         + Tutorial Screen 2:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Select how long you want to record and tap Create to start the recording.”
    ...         + Tutorial Screen 3:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “You can add notes to your recording.”
    ...         + Tutorial Screen 4:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “The recording will happen on your Bioheart. It will be transferred to the app once completed.”
    ...         + Tutorial Screen 5:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Once the recording is completed, you can tap on the snapshot to view your heart rhythm.”
    ...         + Tutorial Screen 6:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “You can view your heart rhythm and share the rhythm in PDF format.”
    ...         + Tutorial Screen 7:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “You can delete a snapshot by swiping left on it and tap on the trash can icon.”
    ...    - There shall be page control buttons at the bottom of the tutorial figures on each tutorial screen. The user can swipe left and right to view the next or previous screens.
    ...    - There shall be page navigation arrows at the bottom of each screen to navigate to the next or previous screens.
    ...    - There shall be a “Back” button on each of the 3 step-by-step screens to navigate the user back to the previous “Tutorials” screen
    ...    - User can navigate to previous screen by pressing on back button
    [Tags]      BHA-PROFILE-USERGUIDE-10    BIOH-SRS-06-FRS-03-008       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-USERGUIDE-11: View How to record heart rhythm from the app
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Bioheart user guides screen
    ...
    ...     Test Steps:
    ...    - Press on How-to guide tab
    ...    - Press on How to record heart rhythm section
    ...
    ...     Expected Output:
    ...    - The following details and components shall be displayed on each of the 10 screens:
    ...         + Tutorial Screen 1:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Go to the heart rhythm live view screen.”
    ...         + Tutorial Screen 2:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Tap the START RECORDING button to initiate a recording.”
    ...         + Tutorial Screen 3:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Select how long you want to record and tap Create to start the recording.”
    ...         + Tutorial Screen 4:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “You can add notes to your recording.”
    ...         + Tutorial Screen 5:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “The recording will happen on your Bioheart.”
    ...         + Tutorial Screen 6:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “The recording will be transferred to the app once completed.”
    ...         + Tutorial Screen 7:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Once the recording is transferred to the app, you can view your heart rhythm.”
    ...         + Tutorial Screen 8:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “You can view your heart rhythm and share the rhythm in PDF format.”
    ...         + Tutorial Screen 9:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Once the recording is completed, you can tap on the snapshot to view your heart rhythm.”
    ...         + Tutorial Screen 10:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “You can delete a snapshot by swiping left on it and tap on the trash can icon.”
    ...    - There shall be page control buttons at the bottom of the tutorial figures on each tutorial screen. The user can swipe left and right to view the next or previous screens.
    ...    - There shall be page navigation arrows at the bottom of each screen to navigate to the next or previous screens.
    ...    - There shall be a “Back” button on each of the 3 step-by-step screens to navigate the user back to the previous “Tutorials” screen
    ...    - User can navigate to previous screen by pressing on back button
    [Tags]      BHA-PROFILE-USERGUIDE-11    BIOH-SRS-06-FRS-03-008       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-USERGUIDE-12: View How to create a rhythm snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Bioheart user guides screen
    ...
    ...     Test Steps:
    ...    - Press on How-to guide tab
    ...    - Press on How to record heart rhythm section
    ...
    ...     Expected Output:
    ...    - The following details and components shall be displayed on each of the 7 screens:
    ...         + Tutorial Screen 1:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “In Heart Rhythm screen, tap on the Add icon to create a retroactive snapshot.”
    ...         + Tutorial Screen 2:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Select the time of the day you want to create a snapshot, then select a duration for the snapshot.”
    ...         + Tutorial Screen 3:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “You can add notes to the snapshot.”
    ...         + Tutorial Screen 4:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “The heart rhythm of the snapshot will be retrieved from your Bioheart device.”
    ...         + Tutorial Screen 5:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Once the transmission is completed, you can tap on the snapshot to view your heart rhythm.”
    ...         + Tutorial Screen 6:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “You can view your heart rhythm and share the rhythm in PDF format.”
    ...         + Tutorial Screen 7:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “You can delete a snapshot by swiping left on it and tap on the trash can icon.”
    ...    - There shall be page control buttons at the bottom of the tutorial figures on each tutorial screen. The user can swipe left and right to view the next or previous screens.
    ...    - There shall be page navigation arrows at the bottom of each screen to navigate to the next or previous screens.
    ...    - There shall be a “Back” button on each of the 3 step-by-step screens to navigate the user back to the previous “Tutorials” screen.
    ...    - User can navigate to previous screen by pressing on back button
    [Tags]      BHA-PROFILE-USERGUIDE-12    BIOH-SRS-06-FRS-03-008       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-USERGUIDE-13: View How to update firmware
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Bioheart user guides screen
    ...
    ...     Test Steps:
    ...    - Press on How-to guide tab
    ...    - Press on How to update firmware
    ...
    ...     Expected Output:
    ...    - There shall be 6 step-by-step screens displayed for the user to follow on “How to update firmware”. The following details and components shall be displayed on each of the 6 screens:
    ...         + Tutorial Screen 1:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Your Bioheart device and your phone are needed to connect via Bluetooth.”
    ...         + Tutorial Screen 2:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “On the Device screen, you can find the Firmware Update card on the bottom of the screen.”
    ...         + Tutorial Screen 3:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Tap the Check for update button to check if your Bioheart is up-to-date with the latest version.”
    ...         + Tutorial Screen 4:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “If there's the newest firmware version available, tap on the Update now button or tap on the Later button to update at a later time.”
    ...         + Tutorial Screen 5:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “When the firmware update starts, please do not turn off your Bioheart App.”
    ...         + Tutorial Screen 6:
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Once the firmware update is completed, a success message will be displayed on the screen.”
    ...    - There shall be page navigation arrows at the bottom of each screen to navigate to the next or previous screens.
    ...    - There shall be a “Back” button on each of the 6 step-by-step screens to navigate the user back to the previous “Tutorials” screen
    ...    - User can navigate to previous screen by pressing on back button
    [Tags]      BHA-PROFILE-USERGUIDE-13    BIOH-SRS-06-FRS-03-009       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-USERGUIDE-14: View Status guide light
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Bioheart user guides screen
    ...
    ...     Test Steps:
    ...    - Press on How-to guide tab
    ...    - Press on Status guide light section
    ...
    ...     Expected Output:
    ...    - There shall be 4 colors displayed for the user to follow on the “Status light guide”.
    ...    - Green light:
    ...         + Screen 1: Solid Green
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Fully charged”.
    ...         + Screen 2: Slow Blinking Green
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Recording heart and activity”.
    ...         + Screen 3: Fast Blinking Green
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Powering ON or OFF”.
    ...    - Orange light:
    ...         + Screen 1: Solid Orange
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Internal error(s)”.
    ...         + Screen 2: Slow Blinking Orange
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Charging”.
    ...         + Screen 3: Blinking Orange
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Low battery”.
    ...    - Pink light:
    ...         + Screen 1: Blinking Pink
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Discovery mode. Ready for pairing with a new phone”.
    ...         + Screen 2: Fast Blinking Pink
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Factory reset is happening. All user data on the device will be deleted”.
    ...    - Blue light:
    ...         + Screen 1: Blinking Blue
    ...             * Tutorial figure (follow the design)
    ...             * Instructive message: “Bad strap contact or the device is not being worn”.
    ...    - There shall be page control buttons at the bottom of the tutorial figures on each tutorial screen. The user can swipe left and right to view the next or previous screens.
    ...    - There shall be page navigation arrows at the bottom of each screen to navigate to the next or previous screens.
    ...    - There shall be a “Back” button on each of the 2 step-by-step screens to navigate the user back to the previous “Tutorials” screen
    ...    - User can navigate to previous screen by pressing on back button
    [Tags]      BHA-PROFILE-USERGUIDE-14    BIOH-SRS-06-FRS-03-010       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-USERGUIDE-15: View FAQ
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Bioheart user guides screen
    ...
    ...     Test Steps:
    ...    - Press on FAQs tab
    ...
    ...     Expected Output:
    ...    - Navigate to Frequently asked questions screen
    ...    - There shall 5 tab: General, Warrranty, Return Policy, Cleaning and Handling and Factory resset
    ...    - When user selects any tab, this tab will be highlight
    ...    - When the user clicks on one of the tabs there shall be a FAQ with answers in the form of accordions that can be collapsed and expanded to view the content
    ...    - User can navigate back by pressing on back button
    [Tags]      BHA-PROFILE-USERGUIDE-15    BIOH-SRS-06-FRS-03-011       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-SETTINGS-01: View Settings screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...    - Press on Settings tab
    ...
    ...     Expected Output:
    ...    - Navigate to Settings screen
    ...    - There shall be 2 sections: Notification and Account
    ...    - User can navigate back by pressing on back button
    [Tags]      BHA-PROFILE-SETTINGS-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-SETTINGS-02: Set High heart rate notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Settings screen
    ...
    ...     Test Steps:
    ...    - Press on High Heart rate notification tab
    ...    - Select high heart rate value
    ...    - Press on Done button
    ...
    ...     Expected Output:
    ...    - High heart rate notificaion default is off
    ...    - After selected high heart rate value, it is applied and when heart rate is over value continue 10 minutes, there is pushing notification
    [Tags]      BHA-PROFILE-SETTINGS-02     BIOH-SRS-06-FRS-04-001       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-SETTINGS-03: Set Low heart rate notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Settings screen
    ...
    ...     Test Steps:
    ...    - Press on Low Heart rate notification tab
    ...    - Select low heart rate value
    ...    - Press on Done button
    ...
    ...     Expected Output:
    ...    - Low heart rate notificaion default is off
    ...    - After selected high heart rate value, it is applied and when heart rate is below value continue 10 minutes, there is pushing notification
    [Tags]      BHA-PROFILE-SETTINGS-03     BIOH-SRS-06-FRS-04-002       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-CHANGEPW-01: Change password
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Settings screen
    ...
    ...     Test Steps:
    ...    - Press on Change password tab
    ...    - Enter current password
    ...    - Enter password and confirm password
    ...    - Press on Update button or back icon button
    ...
    ...     Expected Output:
    ...    - Navigate to Change password screen
    ...    - When users enter current password, password and confirm password, the passwords are hidden and press on eye icon to show password
    ...    - When users press on password field, there is message "Passwords must be at least 8 characters"
    ...    - If users press on Update button, the password is updated and auto signout from ap
    ...         + Press on Sign in now button, navigate to the Sign in screen
    ...    - If users press on back icon button, the password is not updated and navigate to the previous screen
    [Tags]      BHA-PROFILE-CHANGEPW-01     BIOH-SRS-06-FRS-04-003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-CHANGEPW-02: Leave blank all fields or any field to change password
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Change password screen
    ...
    ...     Test Steps:
    ...    - Leave blank all fields or any field
    ...    - Press on Update button
    ...
    ...     Expected Output:
    ...    - There is message "All fields are required" and empty fields text bar's outline will change to red
    [Tags]      BHA-PROFILE-CHANGEPW-02     BIOH-SRS-06-FRS-04-003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-CHANGEPW-03: Enter password less than 8 characters
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Change password screen
    ...
    ...     Test Steps:
    ...    - Enter current password
    ...    - Enter password less than 8 characters
    ...    - Enter confirm password
    ...    - Press on Update button
    ...
    ...     Expected Output:
    ...    - There is message "Passwords must be at least 8 characters" and password text bar's outline will change to red
    [Tags]      BHA-PROFILE-CHANGEPW-03     BIOH-SRS-06-FRS-04-003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}'

BHA-PROFILE-CHANGEPW-04: Enter wrong current password
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Change password screen
    ...
    ...     Test Steps:
    ...    - Enter wrong current password
    ...    - Enter password and confirm password
    ...    - Press on Update button
    ...
    ...     Expected Output:
    ...    - There is message "Wrong password. Plase type again" and cannot change password
    ...    - If users enter wrong password more than 10 times. There is message "Too many failed attempts. Please try later" and user cannot change password now
    [Tags]      BHA-PROFILE-CHANGEPW-04     BIOH-SRS-06-FRS-04-003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-CHANGEPW-05: Passwords don't match
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Change password screen
    ...
    ...     Test Steps:
    ...    - Enter current password
    ...    - Enter password
    ...    - Enter confirm password different password
    ...    - Press on Update button
    ...
    ...     Expected Output:
    ...    - There is message "Your password don't match" and confirm password text bar's outline will change to red
    [Tags]      BHA-PROFILE-CHANGEPW-05     BIOH-SRS-06-FRS-04-003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-DELETEACCOUNT-01: Delete account
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Settings screen
    ...
    ...     Test Steps:
    ...    - Press on Delete account tab
    ...    - Prees on Delete my account or back icon button
    ...
    ...     Expected Output:
    ...    - If users press on Delete my account button
    ...         + Press on Delete button, confirm to delete account and account is permanently deleted after 30 days
    ...         + Press on Cancel button, cancel to delete button and close the popup
    ...    - If users press in back icon button, cancel to delere account and navigate to previous screen
    [Tags]      BHA-PROFILE-DELETEACCOUNT-01        BIOH-SRS-06-FRS-04-005      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-DELETEACCOUNT-02: Recovery account (Sign in with deleted account is pending mode)
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Sign in screen
    ...     - The deleted account is pending mode
    ...
    ...     Test Steps:
    ...    - Enter email and password
    ...    - Press on Sign in button
    ...
    ...     Expected Output:
    ...    - Display Account recovery screen
    ...         + Press on Recovery button, the account is recovered and press on Continue to Home, navigate to Home screen
    ...         + Press on Cancel button, cancel to recover account
    [Tags]      BHA-PROFILE-DELETEACCOUNT-02        BIOH-SRS-06-FRS-04-005      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-DELETEACCOUNT-03: Register with the deleted account is pending mode
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Register screen
    ...     - The deleted account is pending mode
    ...
    ...     Test Steps:
    ...    - Register account with the deleted account is pending mode
    ...
    ...     Expected Output:
    ...    - There is message "Account already exist"
    [Tags]      BHA-PROFILE-DELETEACCOUNT-03        BIOH-SRS-06-FRS-04-005      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-DELETEACCOUNT-04: Get back password with the deleted account is pending mode
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Update password screen
    ...     - The deleted account is pending mode
    ...
    ...     Test Steps:
    ...    - Update password with the deleted account is pending mode
    ...
    ...     Expected Output:
    ...    - Update password successfully
    [Tags]      BHA-PROFILE-DELETEACCOUNT-04        BIOH-SRS-06-FRS-04-005      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-ABOUT-01: View about Bioheart screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...    - Press on About Bioheart tab
    ...
    ...     Expected Output:
    ...    - Navigate to About screen
    ...    - This screen includes components:
    ...         + App name
    ...         + App logo
    ...         + App version
    ...         + Limited warranty tab
    ...         + Privacy policy tab
    ...         + Terms of use tab
    ...         + Rate Bioheart
    ...    - User can navigate back to previous screen by pressing on back button
    [Tags]      BHA-PROFILE-ABOUT-01        BIOH-SRS-06-FRS-05        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-ABOUT-02: View Limited warranty
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in About screen
    ...
    ...     Test Steps:
    ...    - Press on Limited warranty tab
    ...
    ...     Expected Output:
    ...    - Navigate to Limited warranty screen
    ...    - User can scroll to view full content
    ...    - When user can press on email or site linkk
    ...    - User can navigate back to previous screen by pressing on back button
    [Tags]      BHA-PROFILE-ABOUT-02        BIOH-SRS-06-FRS-05-001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-ABOUT-03: View Privacy policy
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in About screen
    ...
    ...     Test Steps:
    ...    - Press on Privacy policy tab
    ...
    ...     Expected Output:
    ...    - Navigate to Privacy policy screen
    ...    - User can scroll to view full content
    ...    - When user can press on email or site linkk
    ...    - User can navigate back to previous screen by pressing on back button
    [Tags]      BHA-PROFILE-ABOUT-03        BIOH-SRS-06-FRS-05-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-ABOUT-04: View Terms of use
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in About screen
    ...
    ...     Test Steps:
    ...    - Press on Terms of use tab
    ...
    ...     Expected Output:
    ...    - Navigate to Terms of use screen
    ...    - User can scroll to view full content
    ...    - When user can press on email or site linkk
    ...    - User can navigate back to previous screen by pressing on back button
    [Tags]      BHA-PROFILE-ABOUT-04        BIOH-SRS-06-FRS-05-003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-ABOUT-05: Rate Bioheart app
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in About screen
    ...
    ...     Test Steps:
    ...    - Press on Rate Bioheart tab
    ...
    ...     Expected Output:
    ...    - Navigate to App store or Google store base on OS
    [Tags]      BHA-PROFILE-ABOUT-05        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-SENDFB-01: Send feedback with default email
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in About Biocare Health screen
    ...
    ...     Test Steps:
    ...    - Press on Send feedback tab
    ...    - Enter description
    ...    - Add image
    ...    - Press on Send or close icon button
    ...
    ...     Expected Output:
    ...    - If users press on Send button, send feedback successfully
    ...         + If sending fail,there is a message "Failed to send. Please try again"
    ...    - If users press on close icon button, cancel to send feedback
    ...    - In case, all attachment files are over 20MB, there is a message "The maximum allowed size of the attachments is 20 MB" and user cannot send feedback
    ...         + User can delete attachment file
    [Tags]      BHA-PROFILE-SENDFB-01        BIOH-SRS-06-FRS-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-SENDFB-02: Send feedback with optional email
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in About Biocare Health screen
    ...
    ...     Test Steps:
    ...    - Press on Send feedback tab
    ...    - Change Your email
    ...    - Enter description
    ...    - Add image
    ...    - Press on Send or close icon button
    ...
    ...     Expected Output:
    ...    - If users press on Send button, send feedback successfully
    ...         + If sending fail,there is a message "Failed to send. Please try again"
    ...    - If users press on close icon button, cancel to send feedback
    ...    - In case, all attachment files are over 20MB, there is a message "The maximum allowed size of the attachments is 20 MB" and user cannot send feedback
    ...         + User can delete attachment file
    [Tags]      BHA-PROFILE-SENDFB-02        BIOH-SRS-06-FRS-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-SENDFB-03: Send feedback without Internet
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in About Biocare Health screen
    ...     - The Internet is disconnected
    ...
    ...     Test Steps:
    ...    - Press on Send feedback tab
    ...    - Enter description
    ...    - Press on Send button
    ...
    ...     Expected Output:
    ...    - There is a message "No Internet connection. Please try again" and send feedback fail
    [Tags]      BHA-PROFILE-SENDFB-03        BIOH-SRS-06-FRS-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-SENDFB-04: Leave blank Your email and Description or Your email or Description when sending feedback
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in About Biocare Health screen
    ...
    ...     Test Steps:
    ...    - Press on Send feedback tab
    ...    - Delete email and no entering description or delete email and entering description or no entering description
    ...    - Press on Send button
    ...
    ...     Expected Output:
    ...    - There is a message "This field cannot be empty" and send feedback fail
    [Tags]      BHA-PROFILE-SENDFB-04        BIOH-SRS-06-FRS-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-SENDFB-05: Email content
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Feedback sent to biocaresupport@biotricity.com
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - Dear Bioheart support team,
    ...    - Username: first name and last name of the account
    ...    - Email: registered account
    ...    - [Username] has sent a feedback/ has requested a feature below:
    ...    - Message
    ...    - Additional information:
    ...         + Phone OS: <platform> <platform version>
    ...         + Phone model: <phone model>
    ...         + Bioheart app version: <app version>
    ...         + Bioheart FW version: <FW version>
    [Tags]      BHA-PROFILE-SENDFB-05        BIOH-SRS-06-FRS-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-SIGNOUT-01: Sign out from app
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...    - Press on Sign out button
    ...    - Press on Sign out or Cancel button
    ...
    ...     Expected Output:
    ...    - If users press on Sign out button, user shall sign out from app
    ...    - If users press on Cancel button, the popup is closed
    [Tags]      BHA-PROFILE-SIGNOUT-01     BIOH-SRS-06-FRS-07      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-HELPCENTER-01: View Center button support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on Center button item
    ...
    ...     Expected Output:
    ...    - Navigate to Center button guide
    ...    - User can navigate back to previous screen by pressed on back button
    ...    - User can move to next/previous step by swiping left/right on the screen
    [Tags]     BHA-PROFILE-HELPCENTER-01       BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-HELPCENTER-02: View View heart rhythm support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on Historical data item
    ...
    ...     Expected Output:
    ...    - Navigate to View heart rhythm guide
    [Tags]     BHA-PROFILE-HELPCENTER-02       BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-HELPCENTER-03: View Status guideline support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on Status lights item
    ...
    ...     Expected Output:
    ...    - Navigate to Status guideline guide
    [Tags]     BHA-PROFILE-HELPCENTER-03       BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-PROFILE-HELPCENTER-04: View FAQs support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Profile screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on FAQs item
    ...
    ...     Expected Output:
    ...    - Navigate to FAQs guide
    [Tags]     BHA-PROFILE-HELPCENTER-04       BIOH-SRS-03-FRS-12-001     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
