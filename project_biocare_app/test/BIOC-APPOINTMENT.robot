*** Settings ***
Documentation   Biocare app Appointment test suite
Metadata    sid     BIOC-APPOINTMENT
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}
#
#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWNN
Force Tags      BIOC-APPOINTMENT  mapp
Test Timeout    1h

*** Test Cases ***
BIOC-APPOINTMENT-01: View Appointment card
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user has linked program
    ...
    ...     Test Steps:
    ...     1. Click on Services tab
    ...     2. Click on Appointment card
    ...
    ...     Expected Output:
    ...     1. Navigate user to Services tab:
    ...        - Appointment card: Booking
    ...        - Program card: CCM/RPM/CCM&RPM
    ...        - Medical card: Records
    ...     2. Navigate user to the Appointment screen:
    ...        - Upcoming tab (default)
    ...        - History tab
    [Tags]      BIOC-APPOINTMENT-01        BIOC-1.17.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-APPOINTMENT-02: View list of no upcoming appointment available
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user has linked program
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Click on Appointment card
    ...     2. Click on History card
    ...
    ...     Expected Output:
    ...     1. Navigate user to the Appointment screen:
    ...        - Upcoming tab (default): “No upcoming appointments”
    ...        - History tab
    ...     2. Calendar Month YYYY
    ...        - Text: No Apppointments
    [Tags]      BIOC-APPOINTMENT-02       BIOC-1.17.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-APPOINTMENT-03: View list of upcoming appointments
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user has linked program
    ...     - The user is in Services screen
    ...
    ...     Test Steps:
    ...     1. Click on Appointment card
    ...        - The patient has more than one appointment
    ...
    ...     Expected Output:
    ...     1. Display all the upcoming appointment of the next 7 days sorted by time nearest appointment to furthest.
    ...         - Display the explanation “Your appointments in the next 7 days”
    ...        The appointment time is in the future, it will be displayed in the Upcoming tab.
    ...        The appointment will be move to History tab when:
    ...         - The clinic user marks the appointment as finished/overdue
    ...         - The clinic cancels the appointment
    ...         - The appointment time finished
    ...       The user can view the following info:
    ...         - Time : <HH:MM> AM/PM (12-hour format)
    ...         - Date: <Day of week, Month Day of month>
    ...         - Appointment type: Virtual appointment or In-person appointment
    ...         - Repeat frequency (if available)
    ...             + Repeat daily
    ...             + Repeat weekly
    ...             + Repeat bi-weekly
    ...             + Repeat monthly
    ...             + Repeat bi-monthly
    ...             + Repeat every 3 months
    ...             + Repeat every 6 months
    ...             + Repeat yearly
    ...         - Reason for visit
    ...         - Attending caregivers: The profile picture, name, role of the attending caregivers
    [Tags]      BIOC-APPOINTMENT-03        BIOC-1.17.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-APPOINTMENT-04: View upcoming appointment reminder on the booking day
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user has linked program
    ...     - The user is in AppointmentS screen
    ...     - There is at least one appointment on the booking day
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     1. On the day of the appointment, there is a highlight card displaying in the Home tab
    ...        - The content: “Today” with the number appointments of that date
    ...        - Button
    ...          + [View more >]: Navigate the user to the Appointments tab in the Appointment book section (Services tab)
    ...          + If the program is started and the patient has not signed the CCM consent
    ...            - Tapping the “View more” button will navigate the user to the CCM consent screen on the Service tab.
    ...          + When the user signed the consent, navigate the user to the Services screen
    [Tags]      BIOC-APPOINTMENT-04        BIOC-1.16.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-APPOINTMENT-05: View appointment history
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user has linked program
    ...     - The user is in Appointment screen
    ...
    ...     Test Steps:
    ...     1. Press on History tab
    ...     2. Click on Calendar
    ...
    ...     Expected Output:
    ...     1. The appointments of the current month will be displayed in order from latest to oldest (Default)
    ...     2. Popup shall be displayed:
    ...         - Select a month to view the appointments (Can not pick the month in the future)
    ...         - Cancel button
    ...         - Done button
    ...        Each appointment contains the following information
    ...         - Time: HH:MM AM/PM (12-hour format)
    ...         - Date: <Day of week, Month Day of the month>
    ...         - Repeat frequency (if available)
    ...            + Repeat daily
    ...            + Repeat weekly
    ...            + Repeat bi-weekly
    ...            + Repeat monthly
    ...            + Repeat bi-monthly
    ...            + Repeat every 3 months
    ...            + Repeat every 6 months
    ...            + Repeat yearly
    ...         - Reason for visit
    ...         - Appointments type: Virtual appointment or In-person appointment
    ...         - Attendee(s)
    ...            + Attendee name
    ...            + Role: Physician/Nurse
    ...            + Profile picture
    ...         - Appointment status - it can be
    ...            + Done
    ...            + Overdue
    ...            + Canceled
    ...            + Virtual appointments (display as Done)
    ...            + In case the appointment is marked finished/overdue before the appointment starts, display it on the History tab at the start time of appointment
    [Tags]      BIOC-APPOINTMENT-05        BIOC-1.15.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-APPOINTMENT-06: Join a virtual appointment
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user has linked program
    ...     - The user is in Appointment screen
    ...     - There is an available for virtual appointment
    ...
    ...     Test Steps:
    ...     1. Wait for 15 minutes before the appointment begins
    ...     2. Click on Join now button
    ...     3. Finished
    ...
    ...     Expected Output:
    ...     1. The Join now button shall be displayed
    ...     2. Go to the video call
    ...     3. Modal displayed to notify the user of the appointment finished:
    ...        - Title: Appointment finished
    ...        - Content: This appointment has been finished. We hope you are satisfied with our service. Thank you for your time.
    ...        - Okay button
    ...        Status make Done on the History screen
    [Tags]      BIOC-APPOINTMENT-06       BIOC-1.15.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-APPOINTMENT-07: Nobody or one side join a virtual appointment
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user has linked program
    ...     - The user is in Appointment screen
    ...     - There is an available for virtual appointment
    ...
    ...     Test Steps:
    ...     1. Wait for after 30 minutes since the booking time
    ...     2. Click on Okay button
    ...
    ...     Expected Output:
    ...     1. The appointment status shall be changed to “Overdue” on the history screen
    ...        - There shall be a modal displayed to notify the user of the overdue appointment for the user who is in the video call
    ...          + Title: Appointment overdue
    ...          + Content: This appointment is overdue. Please contact your caregiver to book a new appointment
    ...          + Button: Okay
    ...     2. Popup shall be closed and go to Upcoming screen
    [Tags]      BIOC-APPOINTMENT-07       BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-APPOINTMENT-08: Clinic cancel a virtual appointment
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user has linked program
    ...     - The user is in Appointment screen
    ...     - There is an available for virtual appointment
    ...
    ...     Test Steps:
    ...     1. Clinic cancel a virtual appointment on the portal
    ...
    ...     Expected Output:
    ...     1. Push noti in-app
    ...        - In this time booked, the appointment status shall be changed to “Canceled” on the history screen
    [Tags]      BIOC-APPOINTMENT-08       BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-APPOINTMENT-09: View the Camera
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - The user is being in the appointment
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - Navigate to the camera screen with the following components:
    ...        + Camera button
    ...        + Microphone button
    ...        + Switch camera button
    ...        + End call video button
    [Tags]      BIOC-APPOINTMENT-09         BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-APPOINTMENT-10: Enable/disable microphone
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is being in the appointment
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - The microphone is ON by default
    ...     - To turn it off, the user can press the button with the microphone symbol
    ...     - To turn it on again, the user presses the "microphone" button again
    [Tags]      BIOC-APPOINTMENT-10         BIOC-1.22.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-APPOINTMENT-11: Enable/disable camera
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is being in the appointment
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - The camera is ON by default
    ...     - To turn it off, the user can press the button with the camera symbol
    ...     - To turn it on again, the user presses the "camera" button again
    [Tags]      BIOC-APPOINTMENT-11        BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-APPOINTMENT-12: Switch camera
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is being in the appointment
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - By default, the front camera will be used.
    ...     - To switch to the back camera, the user can press the button with the switching symbol.
    ...     - The user can press it again to switch to the front camera
    [Tags]      BIOC-APPOINTMENT-12        BIOC-1.16.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-APPOINTMENT-13: Leave an appointment
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is being in the appointment
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - To leave an appointment, the user can press the End button.
    ...     - Pressing this button will
    ...        + On the patient app: Close the calling screen
    ...     - The user will be able to rejoin the appointment if the join icon still displays.
    ...     - Leaving an appointment won’t end the appointment of the other attendees
    [Tags]      BIOC-APPOINTMENT-13         BIOC-1.16.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-APPOINTMENT-14: View appointment duration
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is being in the appointment
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - When the user joins in an appointment, the duration will start counting from 00:00.
    ...     - Each role will have their own duration counting.
    ...     - When the user leaves the appointment by tapping/clicking on the "Hang up" button or clicks the "Exit" button on the upper-right corner of the window or by any other means to exit the appointment and then joins in the appointment again, the duration will start counting again from 00:00
    [Tags]      BIOC-APPOINTMENT-14         BIOC-1.16.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-APPOINTMENT-15: View attendee's videos
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is being in the appointment
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - When the user joins the appointment within 15 minutes before the booking time, they will see a message:
    ...       + “Your appointment will start soon“ and a video of themselves if there is only one side in the appointment.
    ...     - If both the patient and clinic users join the appointment, the appointment will start even when the booking time has not come yet.
    ...     - When the user is the first person to join the appointment, the video will appear as the main video on the screen.
    ...     - If the user turns off their camera. Hide the video of themselves
    ...     - If the camera of another attendee is off
    [Tags]      BIOC-APPOINTMENT-15       BIOC-1.16.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-APPOINTMENT-16: Video call permission
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The patient has rejected camera and microphone permission and wants to join a virtual appointment.
    ...
    ...     Test Steps:
    ...     1. Press on Join now button
    ...
    ...     Expected Output:
    ...     1. Title: Camera and Microphone Access Required
    ...        - Content: Please enable Camera and Microphone permissions in App Settings.
    ...        - Cancel button
    ...        - Open settings button
    [Tags]      BIOC-APPOINTMENT-16        BIOC-1.16.0  manual  R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-APPOINTMENT-17: View attendee's videos
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is being in the appointment
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - When the virtual appointment is disconnected due to internet connection, a dialog display to show the re-connect status.
    ...     - The app will try to reconnect within 30 seconds. (Continuing counting the duration until the user is kicked out the appointment)
    ...         + If the internet is connected, the appointment will be continued.
    ...         + If the internet is not connected, the user will be navigated to the Appointment screen, they can re-join the virtual appointment if the Join button still displays.
    [Tags]      BIOC-APPOINTMENT-17       BIOC-1.15.0  manual  R3
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
