*** Settings ***
Documentation   Biocare app Notification test suite
Metadata    sid     BIOC-NOTIFICATION
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-NOTIFICATION  mapp
Test Timeout    1h

*** Test Cases ***
BIOC-NOTIFICATION-01: View notification list
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - The user is in Home screen
    ...
    ...     Test Steps:
    ...    - Press on notification icon button (the bell icon)

    ...
    ...     Expected Output:
    ...    - Navigate to the Notifications center screen
    ...    - User can view detail notification by pressing on each item and then the green dot is disappeared
    ...    - User can delete any item by swiping left and delete it
    ...    - User can delete all notifications by pressing on delete icon and delete it
    ...    - Depending on the phone screen’s size, display the appropriate number of notifications. The user can scroll up to load more notifications
    ...    - The users can scroll down to view more notifications.
    ...    - If there is no notification, display “No notifications yet!”
    ...    - Notifications are sorted by received time (latest  oldest).
    ...    - The unread notifications include the following information: title, notification content, received time, and Green dot.
    ...    - The read notifications include the following information: title, notification content , and received time.
    ...    - Received will be displayed
    ...         + 0s < receive time < 1min, display: “Just now”.
    ...         + 1min <= receive time < 1h, display: “[number] minute(s) ago”.
    ...         + 1h <= receive time < 24h, display: “[number] hour(s) ago”.
    ...         + 24h <= receive time < 7 days, display: “[number] day(s) ago”.
    ...         + >=7 days, display: “mm/dd/yyyy”
    ...    - User can navigate back previous screen by pressing on back icon button
    ...    - Either tapping on the in-app or push notification will turn the in-app notification into a “read” one
    ...    - The push notification will be dismissed when the user opens the app
    [Tags]      BIOC-NOTIFICATION-01       BIOC-SRS-12-FRS-01-001      BIOC-SRS-12-FRS-01-002      BIOC-SRS-12-FRS-01-003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-02: View detail for each notification type
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Notifications center screen
    ...
    ...     Test Steps:
    ...    - Press on any notification
    ...
    ...     Expected Output:
    ...    - Navigate to the detail page corresponding to the notification type selected by the user
    ...    - The green dot is disappeared if this is the 1st time, users press on that notification
    [Tags]      BIOC-NOTIFICATION-02       BIOC-SRS-12-FRS-01-001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-03: Delete any notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Notifications center screen
    ...
    ...     Test Steps:
    ...    - Select any notification and swipe left
    ...    - Press on delete icon
    ...
    ...     Expected Output:
    ...    - The notification is deleted and appeared an Undo button
    ...    - If users press on Undo button, the notification is restored
    [Tags]      BIOC-NOTIFICATION-03       BIOC-SRS-12-FRS-01-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-04: Delete all notifications
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Notifications center screen
    ...
    ...     Test Steps:
    ...    - Press on Delete icon button
    ...    - Press on Delete all or Cancel button
    ...
    ...     Expected Output:
    ...    - If users press on Delete all button, all notifications are deleted and No notifications yet! screen is displayed
    ...    - If users press on Cancel button, cancle to delete all notification and close the popup
    [Tags]      BIOC-NOTIFICATION-04      BIOC-SRS-12-FRS-01-003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-APPOINTMENT-05: New appointment notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The patient has already signed in and linked their program
    ...
    ...     Test Steps:
    ...    - Go to Cardiac portal and create a new appointment
    ...
    ...     Expected Output:
    ...    - After the nurse creates an appointment, the patient will receive
    ...         + Push notification
    ...         + In-app notification
    ...    - Notification content
    ...         + Title: New appointment scheduled
    ...         + Content: Your <appointment type> appointment with <Facility name> at <appointment time>, <appointment date> has been scheduled.”
    ...             * Appointment type: can either be virtual or in-person.
    ...             * Facility name: Name of the program’s registered clinic.
    ...             * Appointment time: Hh:MM AM/PM. Ex: 02:00 PM
    ...             * Appointment date: MM/DD/YYYY. Ex: 09/02/2022
    ...    - Tapping on the notifications will navigate the user to the Appointments screen
    ...    - If the booking time is in the defined range of Upcoming appointments tab (Today and the next 7 days)
    ...         + Update the number of Appointment bookings in the Appointment section and add the new appointment information to the Upcoming appointment tab
    ...    - Update the number of Today appointments in the Home tab if the booking time is Today.
    ...    - Reload the Upcoming tab if the user is in it
    [Tags]      BIOC-NOTIFICATION-APPOINTMENT-05      BIOC-SRS-12-FRS-03-001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-APPOINTMENT-06: Update appointment notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The patient has already signed in and linked their program
    ...
    ...     Test Steps:
    ...    - Go to Cardiac portal and update a created appointment
    ...
    ...     Expected Output:
    ...    - After the nurse creates an appointment, the patient will receive
    ...         + Push notification
    ...         + In-app notification
    ...    - Notification content
    ...         + Title: Appointment information updated
    ...         + Content: "Your appointment at HH:MM AM/PM, <MM/DD/YYY> has been updated. Tap to view the updates
    ...             * If the date and time of the appointment are updated, the <MM/DD/YYY> at HH:MM AM/PM  will be the previous date-time of the appointment. For example: The appointment is on 06/09/2021 at 9:00 am => Update 9:00 to 10:00 => Update 10:00 to 17:00.
    ...                 o For the first update, the notification should be: “Your appointment at 9:00 A.M, 06/09/2021 has been updated. Tap to view the updates.”
    ...                 o For the second update, it should be: “Your appointment at 10:00 A.M, 06/09/2021 has been updated. Tap to view the updates.”
    ...    - Tapping on the notifications will navigate the user to the Upcoming tab.
    ...    - Reload the Upcoming tab and update the newly updated appointment information to the Appointment if it displays in the Upcoming appointments
    [Tags]      BIOC-NOTIFICATION-APPOINTMENT-06      BIOC-SRS-12-FRS-03-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-APPOINTMENT-07: Cancel appointment notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The patient has already signed in and linked their program
    ...
    ...     Test Steps:
    ...    - Go to Cardiac portal and cancel a created appointment
    ...
    ...     Expected Output:
    ...    - After the nurse creates an appointment, the patient will receive
    ...         + Push notification
    ...         + In-app notification
    ...    - Notification content
    ...         + Title: Appointment canceled
    ...         + Content: “Your appointment at HH:MM AM/PM, <MM/DD/YYYY> has been canceled. Please contact us if you have any questions.” with the at HH:MM AM/PM, <MM/DD/YYYY> is the date-time of the appointment
    ...    - Tapping on the notifications will navigate the user to the History tab in the month the appointment occurs
    ...    - If the booking time is in the defined range of the Upcoming appointments tab:
    ...         + Update the number of Appointment bookings in the Appointment section and move the appointment from the Upcoming appointment tab to the History tab in the month the appointment occurs with the status “Canceled”
    ...    - If the appointment is not in the defined range of the Upcoming appointments tab:
    ...         + Display the canceled appointment in the History tab in the month the appointment occurs with the status “Canceled”
    ...    - Update the number of Today appointments in the Home tab if the booking time is Today.
    ...    - Reload the Upcoming tab if the user is in it
    [Tags]      BIOC-NOTIFICATION-APPOINTMENT-07      BIOC-SRS-12-FRS-03-003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-APPOINTMENT-08: Finish appointment notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The patient has already signed in and linked their program
    ...     - Marked as done for only in-person appointment
    ...
    ...     Test Steps:
    ...    - Go to Cardiac portal mark as done for in-person appointment or wait for virtual appointment finish
    ...
    ...     Expected Output:
    ...    - After an appointment is finished (virtual appointment) or marked as done (in-person appointment)
    ...         + Push notification
    ...         + In-app notification
    ...    - Content:
    ...         + Title: Appointment finished
    ...         +Content: “Your appointment at HH:MM AM/PM, <MM/DD/YYYY> is finished. Please contact us if you have any questions.” with the at HH:MM AM/PM, <MM/DD/YYYY> is the date-time of the appointment.
    ...    - Tapping on the notifications will navigate the user to the History tab in the month the appointment occurred
    ...    - Update the number of Appointment bookings in the Appointment section and move the appointment from the Upcoming appointment tab to the History tab in the month appointment occurred with the status “Finished”.
    ...    - Update the number of Today appointments in the Home tab if the booking time is Today.
    ...    - Reload the Upcoming tab if the user is in it.
    [Tags]      BIOC-NOTIFICATION-APPOINTMENT-08      BIOC-SRS-12-FRS-03-004      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-APPOINTMENT-09: Overdue appointment notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The patient has already signed in and linked their program
    ...     - Marked as overdue for only in-person appointment
    ...
    ...     Test Steps:
    ...    - Go to Cardiac portal mark as overdue for in-person appointment or wait for virtual appointment overdue
    ...
    ...     Expected Output:
    ...    - After an appointment is overdue (virtual appointment) or marked as overdue (in-person appointment)
    ...         + Push notification
    ...         + In-app notification
    ...    - Content:
    ...         + Title: Appointment overdue
    ...         +Content: “Your appointment at HH:MM AM/PM, <MM/DD/YYYY> is overdue. Please contact us if you have any questions.” with the at HH:MM AM/PM, <MM/DD/YYYY> is the date-time of the appointment
    ...    - Tapping on the notifications will navigate the user to the History tab with the month the appointment occurred
    ...    - Update the number of Appointment bookings in the Appointment section and move the appointment from the Upcoming appointment tab to the History tab in the month the appointment occurs with the status “Overdue”.
    ...    - Update the number of Today appointments in the Home tab if the booking time is Today.
    ...    - Reload the Upcoming tab if the user is in it
    [Tags]      BIOC-NOTIFICATION-APPOINTMENT-09      BIOC-SRS-12-FRS-03-005      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-APPOINTMENT-10: Upcoming in-person appointment notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The patient has already signed in and linked their program
    ...
    ...     Test Steps:
    ...    - Go to Cardiac portal and create an in-person appointment
    ...
    ...     Expected Output:
    ...    - This notification will be sent to the user at 6 AM on the day of the booking time.
    ...    - If the appointment is booked at or after 6 am on the day of booking time, the notification won’t be sent.
    ...    - Notification content
    ...         + Title: Upcoming appointment reminder
    ...         + Content: This is a reminder of your appointment with our care team at <Facility name> today at <HH:MM AM/PM >. (12-hour format).
    ...    - Tap on this notification will navigate the user to the Appointment.
    [Tags]      BIOC-NOTIFICATION-APPOINTMENT-10      BIOC-SRS-12-FRS-03-006      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-APPOINTMENT-11: Upcoming virtual appointment notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The patient has already signed in and linked their program
    ...
    ...     Test Steps:
    ...    - Go to Cardiac portal and create a virtual appointment
    ...
    ...     Expected Output:
    ...    - This notification will be sent to the user 15 minutes before the booking time.
    ...    - If the appointment is booked 15 minutes or less than 15 minutes before booking time, the notification won’t be sent.
    ...    - Notification content:
    ...         + Title: Upcoming appointment reminder
    ...         + Content: This is a reminder of your virtual appointment with our care team today at <HH:MM>
    ...    - Tap on this notification will navigate the user to the Appointments tab
    [Tags]      BIOC-NOTIFICATION-APPOINTMENT-11      BIOC-SRS-12-FRS-03-006      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-DEMOGRAPHIC-12: Update demographic notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The patient has already signed in and linked their program
    ...     - The program is new/active
    ...
    ...     Test Steps:
    ...    - Go to Cardiac portal and update demographic information
    ...
    ...     Expected Output:
    ...    - After the clinic user updates the patient demographic, the patient will receive:
    ...         + Push notification
    ...         + In-app notification
    ...    - The content of the notifications shall be:
    ...         + Title: Demographic updated
    ...         + Content: Your demographic information has been updated. Tap to view details.
    ...    - Tap the notification will navigate the user to the Initial intake info tab in Medical records
    [Tags]      BIOC-NOTIFICATION-DEMOGRAPHIC-12      BIOC-SRS-12-FRS-05-001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-CAREPLANMANAFEMENT-13: Reminder to take medication
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The patient has already signed in and linked their program (optional condition)
    ...     - The device has an internet connection.
    ...     - The user set reminder for the medication
    ...
    ...     Test Steps:
    ...    - Go to Cardiac portal and prescrded medication or add other medication in Biocare Health app
    ...
    ...     Expected Output:
    ...    - The user shall be reminded to take medications through push notification.
    ...    - Content:
    ...         + Title: Medications reminder
    ...         + Content: Time to log your <Time> medications
    ...    - If the clinic users add a new prescription
    ...         + If the patient has not done the daily log for medication on that day yet, the reminder of the new medication will be sent to the user on that day.
    ...         + If the patient has done the daily input log for the medication on that day, the reminder of the new medications will be sent to the user the next day. The user still receives a reminder of the current medications for the rest of the da
    ...    - Tapping on the notifications will navigate the user the Schedule tab of the Medication and open the dialog corresponding to the reminder notification
    ...         + In case: The user taps on a yesterday notification the app shall open the yesterday Scheduled tab without opening any dialog.
    [Tags]      BIOC-NOTIFICATION-CAREPLANMANAFEMENT-13      BIOC-SRS-12-FRS-06-002-0001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-CAREPLANMANAFEMENT-14: Prescribed medication notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user has linked the program.
    ...     - The clinic users prescribe/edit the active medication on the portal.
    ...     - The clinic users prescribed an inactive medication in the Inactive tab of Medications.
    ...
    ...     Test Steps:
    ...    - Go to Cardiac portal and add or edit prescribed medication
    ...
    ...     Expected Output:
    ...    - When the clinic user clicks Save changes after editing the Active medications list or prescribed an inactive medication, the patient will receive:
    ...         + Push notification
    ...         + In-app notification
    ...    - Content:
    ...         + Title: “Prescription updated”
    ...         + Content: “Your prescription has been updated. Tap to view the details.”
    ...             * Date - time when the changes were made (in-app notification)
    ...    - Tapping on the notifications will navigate the user to the Categories tab of Medications
    [Tags]      BIOC-NOTIFICATION-CAREPLANMANAFEMENT-14      BIOC-SRS-12-FRS-06-002-0002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-CAREPLANMANAFEMENT-15: Quality of life notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The program has already been started.
    ...     - The user has already linked their account with the program.
    ...
    ...     Test Steps:
    ...    - Wait for 30 days after the date the program is started
    ...
    ...     Expected Output:
    ...    - Every 30 days since the date the program is started (called calendar month), the user has to complete the monthly QOL test.
    ...    - On the first day in each calendar month, at 6:00 AM (local time), the user will receive:
    ...         + Push notification
    ...    - This notification will only be displayed once.
    ...    - Content:
    ...         + Title: Your monthly assessment
    ...         + Content: It is time to fill out your monthly assessment. Please complete it within the next 30 days so that your caregivers can evaluate your progress!
    ...    - Tapping on these notifications will navigate the user to:
    ...         + The Quality of life test screen if the user has not completed it.
    ...         + The Quality of life assessment screen if the user was in-app and has already completed it.
    ...    - After successfully reactivating an inactive program, the notification for completing the Quality of life will start generating from the day the program is reactivated
    [Tags]      BIOC-NOTIFICATION-CAREPLANMANAFEMENT-15      BIOC-SRS-12-FRS-06-003-0001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-CAREPLANMANAFEMENT-16: Quality of life reminder dialog
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The program has already been started.
    ...     - The user has already linked their account with the program.
    ...
    ...     Test Steps:
    ...    - Wait for 30 days after the date the program is started
    ...
    ...     Expected Output:
    ...    - Along with the above notifications, a dialog will be displayed in the Home tab until the monthly assessment is completed.
    ...         + For the initial QoL test, this dialog will display from the linked program date
    ...    - Content:
    ...         + Title: Monthly assessment reminder
    ...         + Content: Take Quality of life assessment
    ...    - Tapping on the snack bar will navigate the user to the Quality of life test screen.
    ...    - If the user taps on the snack bar and then cancels the process at any step, this dialog should be kept displayed in the Home tab
    [Tags]      BIOC-NOTIFICATION-CAREPLANMANAFEMENT-16      BIOC-SRS-12-FRS-06-003-0002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-CAREPLANMANAFEMENT-17: Quality of life reminder dialog
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The program has already been started.
    ...     - The user has already linked their account with the program.
    ...
    ...     Test Steps:
    ...    - Wait for 30 days after the date the program is started
    ...
    ...     Expected Output:
    ...    - Along with the above notifications, a QoL Card will be displayed in the Service tab until the monthly assessment is completed.
    ...         + For the initial QoL test, this card will display from the linked program date.
    ...    - Tapping on the “Start now” button will navigate the user to the Quality of life test screen
    ...         + If the user taps on the ”Start now” and then cancels the process at any step, this card should be kept displayed in the Services tab
    [Tags]      BIOC-NOTIFICATION-CAREPLANMANAFEMENT-17      BIOC-SRS-12-FRS-06-003-0003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-CAREPLANMANAFEMENT-18: Daily input notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The program has already been started.
    ...     - The user has already linked their account with the program.
    ...     - The user has not completed daily input before reminder time
    ...
    ...     Test Steps:
    ...    - Not complete dialy input for the current date
    ...
    ...     Expected Output:
    ...    - The app shall display a push notification on the user’s lock screen to remind the user to input daily information if the user has not yet inputted information for the current date
    ...         + By default, the app will display a push notification and an in-app notification at 7:00 PM every day. The user can change the reminder time or disable the notification reminder function in the app settings.
    ...         + Content:
    ...             * Title: Daily information
    ...             * Content: Hi <Firstname> <Lastname>, remember to input your daily information so that your caregivers can keep track of your situation
    ...    - In case the CP type is CCM or CCM&RPM, tapping on the notification will navigate the user to the Home screen, then the push notification is dismissed.
    ...    - In case the CP type is RPM, tapping on the notification will navigate the user to the Measurement screen
    [Tags]      BIOC-NOTIFICATION-CAREPLANMANAFEMENT-18      BIOC-SRS-12-FRS-06-004-0001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-CAREPLANMANAFEMENT-19: Start program notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Patient has linked program
    ...
    ...     Test Steps:
    ...    - Go to Cardiac portal and start program
    ...
    ...     Expected Output:
    ...    - After the clinic user starts the program, the patient will receive:
    ...         + Push notification
    ...         + In-app notification
    ...    - Content:
    ...         + Title: “Health care program started”
    ...         + Content: “Hi <Firstname> <Lastname>, your health care program has been started. Please read our agreement before using services."
    ...    - Tap on the notification
    ...         + Tapping on the notification will navigate the user to the consent screen to read and sign the consent, then the notification is dismissed.
    ...         + If the patient is being in the app, the app shall be automatically updated (changing from the Service screen to the consent required one). However, the user can pull down the screen or kill the app to manually update it
    [Tags]      BIOC-NOTIFICATION-CAREPLANMANAFEMENT-19      BIOC-SRS-12-FRS-06-005-0001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-CAREPLANMANAFEMENT-20: Update program notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The patient has already signed in and linked their program
    ...
    ...     Test Steps:
    ...    - Go to Cardiac portal and update program
    ...
    ...     Expected Output:
    ...    - After the clinic user updates the program overview, the patient will receive:
    ...         + Push notification
    ...         + In-app notification
    ...    - Content:
    ...         + Title: “program updated”
    ...         + Content: “Your program has been updated. Please view the updates from your caregivers"
    ...    - Tap on the notification
    ...         + If program Overview or Conditions information is updated, navigate the user to the program information
    [Tags]      BIOC-NOTIFICATION-CAREPLANMANAFEMENT-20      BIOC-SRS-12-FRS-06-006-0001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-CAREPLANMANAFEMENT-21: Stop program notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The patient has already signed in and linked their program
    ...
    ...     Test Steps:
    ...    - Go to Cardiac portal and stop program
    ...
    ...     Expected Output:
    ...    - After the clinic user stops the program, the patient will receive
    ...         + Push notification
    ...    - Content:
    ...         + Title: “Health care program completed”
    ...         + Message: “Hi <Firstname> <Lastname>, your health care program has been completed. Thank you for choosing our services!”
    ...    - Tap the notification will navigate the user to the reference code screen
    [Tags]      BIOC-NOTIFICATION-CAREPLANMANAFEMENT-21      BIOC-SRS-12-FRS-06-007-0001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-CAREPLANMANAFEMENT-22: Confirmation dialog when stop program
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The patient is in the app
    ...
    ...     Test Steps:
    ...    - Go to Cardiac portal and stop program
    ...
    ...     Expected Output:
    ...    - A dialog will display:
    ...         + Title: “Health care program completed”
    ...         + Message: “Your health care program has been completed. Thank you for choosing our services!”
    ...         + Button:
    ...             * View details: Navigate the user to the Reference code screen
    ...             * Dismiss: Close the modal
    ...    - Tap the OK button will navigate the user to the reference code screen
    [Tags]      BIOC-NOTIFICATION-CAREPLANMANAFEMENT-22      BIOC-SRS-12-FRS-06-007-0002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-CAREPLANMANAFEMENT-23: Reactivate program notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The patient has already signed in and had a stopped program before
    ...
    ...     Test Steps:
    ...    - Go to Cardiac portal and reactivate program
    ...
    ...     Expected Output:
    ...    - After the clinic user reactivates the program, the patient will receive
    ...         + Push notification
    ...    - Content:
    ...          + Title: “Health care program reactivated”
    ...          + Content: “Hi <Firstname> <Lastname>, your health care program has been reactivated. Tap to view the details”
    ...    - Tap the notification will navigate the user to the Service screen
    [Tags]      BIOC-NOTIFICATION-CAREPLANMANAFEMENT-23      BIOC-SRS-12-FRS-06-008-0001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-CAREPLANMANAFEMENT-24: Delete program notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The patient has already signed in and has linked the program before
    ...
    ...     Test Steps:
    ...    - Go to Cardiac portal and delete program
    ...
    ...     Expected Output:
    ...    - After the clinic user deletes the program, the patient will receive
    ...         + Push notification
    ...         + Modal if the user is in app
    ...    - The content of the push notification and the modal:
    ...          + Title: Health care program cancellation
    ...          + Content: Your health care program registered at <Clinic name> has been canceled. Contact us if you have any questions!
    ...    - Tap the notification/modal will navigate the user to the reference code screen.
    [Tags]      BIOC-NOTIFICATION-CAREPLANMANAFEMENT-24      BIOC-SRS-12-FRS-06-009-0001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-CAREPLANMANAFEMENT-25: Confirmation dialog when the program is deleted
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The patient is in the app
    ...
    ...     Test Steps:
    ...    - Go to Cardiac portal and delete program
    ...
    ...     Expected Output:
    ...    - If the patient is in the app, a dialog will display:
    ...         + Title: “Health care program cancellation”
    ...         + Content: Your health care program registered at <Clinic name> has been canceled. Contact us if you have any questions!
    ...         + Button: Okay
    ...    - Tap the button will navigate the user to the reference code screen
    [Tags]      BIOC-NOTIFICATION-CAREPLANMANAFEMENT-25      BIOC-SRS-12-FRS-06-009-0002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-CAREPLANMANAFEMENT-26: Switch CCM to CCM&RPM program notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The program is actived
    ...     - A clinic user changes the plan type from CCM to CCM&RPM and the user has not signed the RPM consent
    ...
    ...     Test Steps:
    ...    - Go to Cardiac portal and switch program
    ...
    ...     Expected Output:
    ...    - After the clinic user switches the program CCM to CCM&RPM, the patient will receive:
    ...         + Push notification
    ...         + In-app notification
    ...    - Content of the notification:
    ...         + Title: RPM services registered
    ...         + Content: A new service has been added to your program. Please view the updates and read our agreement before using services.
    ...    - Navigation:
    ...         + If the user has not signed the CCM consent and didn’t sign the RPM consent before: tapping on the notification will keep the user on the same screen.
    ...             * In case the user is on the Consents screen, the RPM consent shall be added to the Consents screen.
    ...             * In case the user has signed the CCM consent, the RPM consent screen shall be displayed after that.
    ...                 o The workflow shall be the same as in View and sign the consents when the user taps on the Agree & Sign button.
    ...         + If the user has already signed the CCM consent but didn’t sign the RPM consent before: tapping on the notification will navigate the user to the Agreements screen. The user shall be able to tap on the View & Sign button to sign the RPM consent.
    [Tags]      BIOC-NOTIFICATION-CAREPLANMANAFEMENT-26      BIOC-SRS-12-FRS-06-011      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-CAREPLANMANAFEMENT-27: Update device in RPM program notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The program is actived and the plan type is RPM.
    ...     - A clinic user update device on the portal
    ...
    ...     Test Steps:
    ...    - Go to Cardiac portal and update device in RPM program
    ...
    ...     Expected Output:
    ...    - After the clinic user adds/edits/remove devices successfully (RPM only), the patient will receive:
    ...         + Push notification
    ...         + In-app notification
    ...    - Content:
    ...         + Title: “Device updated”
    ...         + Message: “Your device list has been updated. Please view the update from your caregivers.”
    ...    - Pressing on the notification will navigate the user to the Careplan information screen
    [Tags]      BIOC-NOTIFICATION-CAREPLANMANAFEMENT-27      BIOC-SRS-12-FRS-06-012      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-BIOFLUX-28: Receive notification when device has been offline more than 2 hours
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - During a study, if there is an issue found every 2 hours, there shall be a notification sent to the Notification center to notify the user that there is an issue with their study.
    ...    - It shall be the following issues that the user will be notified of
    ...         + Device has been offline for more than 2 hours.
    ...             * Title: Biocare
    ...             * Content: There is an issue with your study. Bioflux device has been offline for more than 2 hours.
    ...    - Tapping the notification shall navigate the user to the Study screen with the banner displayed if the issue has not been resolved yet
    ...    - Notes:
    ...         + One user signs in the same account on different mobile phones. After signing in and entering the Study screen successfully (by inputing valid reference code) on one mobile phone, the user shall receive notifications if there is any issue found. To receive notifications on other phones, they are required to enter the reference code on those.
    ...         + Different users sign in different accounts on different mobile phones and inputing the same reference code shall all receive the same notification if there is any issue found
    [Tags]      BIOC-NOTIFICATION-BIOFLUX-28      BIOC-SRS-12-FRS-08-001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-BIOFLUX-29: Receive notification when there has been an electrode disconnection for more than 2 hours
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Device is online
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - During a study, if there is an issue found every 2 hours, there shall be a notification sent to the Notification center to notify the user that there is an issue with their study.
    ...    - It shall be the following issues that the user will be notified of
    ...         + There has been an electrode disconnection for more than 2 hours (device is online)
    ...             * Title: Biocare
    ...             * Content: Content: There is an issue with your study. One or more cable wires have been disconnected for more than 2 hours.
    ...    - Tapping the notification shall navigate the user to the Study screen with the banner displayed if the issue has not been resolved yet
    ...    - Notes:
    ...         + One user signs in the same account on different mobile phones. After signing in and entering the Study screen successfully (by inputing valid reference code) on one mobile phone, the user shall receive notifications if there is any issue found. To receive notifications on other phones, they are required to enter the reference code on those.
    ...         + Different users sign in different accounts on different mobile phones and inputing the same reference code shall all receive the same notification if there is any issue found
    [Tags]      BIOC-NOTIFICATION-BIOFLUX-29      BIOC-SRS-12-FRS-08-001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-BIOFLUX-30: Receive notification when study has been paused for more than 8 hours (device is online)
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Device is online
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - During a study, if there is an issue found every 2 hours, there shall be a notification sent to the Notification center to notify the user that there is an issue with their study.
    ...    - It shall be the following issues that the user will be notified of
    ...         + Study has been paused for more than 8 hours (device is online)
    ...             * Title: Biocare
    ...             * Content: There is an issue with your study. It has been paused for more than 8 hours.
    ...    - Tapping the notification shall navigate the user to the Study screen with the banner displayed if the issue has not been resolved yet
    ...    - Notes:
    ...         + One user signs in the same account on different mobile phones. After signing in and entering the Study screen successfully (by inputing valid reference code) on one mobile phone, the user shall receive notifications if there is any issue found. To receive notifications on other phones, they are required to enter the reference code on those.
    ...         + Different users sign in different accounts on different mobile phones and inputing the same reference code shall all receive the same notification if there is any issue found
    [Tags]      BIOC-NOTIFICATION-BIOFLUX-30      BIOC-SRS-12-FRS-08-001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-BIOTRES-31: Manual event triggered notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The Biotres device is connected to the app via Bluetooth
    ...     - The app is closed
    ...
    ...     Test Steps:
    ...    - Press on Event button in Biotres device
    ...
    ...     Expected Output:
    ...    - There shall be a push notification sent to the user to notify them of selecting symptom(s) for the manual event
    ...         + Title: Biocare Health
    ...         + Content: Manual event triggered! Tap to select symptoms you are experiencing
    ...    - Tapping on the notification shall navigate the user to the Dashboard screen where the pop-up displayed (within the time out duration). For the content of the symptoms selection in Device screen, review the design. The pop-up shall be displayed until the time-out duration finishes or the user selects the symptom(s) and send it!
    ...    - The user shall be able to tap on Close button to close the bottom sheet. In that case, the device still sends the manual event with default symptom: non-specific.
    ...    - If the user taps on the notification after 15s since the notification pushed, there shall be a snack bar to let the user knows that the symptom selecting timeout has been expired: “Session is expired. The event was sent automatically.”
    ...    - For iOS, if the user swipes the app in the Multitasking screen, there shall be no notification of manual event triggered sent to the patient app
    [Tags]      BIOC-NOTIFICATION-BIOTRES-31      BIOC-SRS-18-FRS-04-001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-BIOTRES-32: Receive notification when device has been offline more than 2 hours
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - During a study, if there is an issue found every 2 hours, there shall be a notification sent to the Notification center to notify the user that there is an issue with their study.
    ...    - It shall be the following issues that the user will be notified of
    ...         + Device has been offline for more than 2 hours.
    ...             * Title: Biocare
    ...             * Content: There is an issue with your study. Bioflux device has been offline for more than 2 hours.
    ...    - Tapping the notification shall navigate the user to the Study screen with the banner displayed if the issue has not been resolved yet
    [Tags]      BIOC-NOTIFICATION-BIOTRES-32      BIOC-SRS-18-FRS-04-002     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-BIOTRES-33: Receive notification when there has been an electrode disconnection for more than 2 hours
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Device is online
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - During a study, if there is an issue found every 2 hours, there shall be a notification sent to the Notification center to notify the user that there is an issue with their study.
    ...    - It shall be the following issues that the user will be notified of
    ...         + There has been an electrode disconnection for more than 2 hours (device is online)
    ...             * Title: Biocare
    ...             * Content: Content: There is an issue with your study. One or more cable wires have been disconnected for more than 2 hours.
    ...    - Tapping the notification shall navigate the user to the Study screen with the banner displayed if the issue has not been resolved yet
    [Tags]      BIOC-NOTIFICATION-BIOTRES-33      BIOC-SRS-18-FRS-04-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-BIOTRES-34: Receive notification when study has been paused for more than 8 hours (device is online)
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Device is online
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - During a study, if there is an issue found every 2 hours, there shall be a notification sent to the Notification center to notify the user that there is an issue with their study.
    ...    - It shall be the following issues that the user will be notified of
    ...         + Study has been paused for more than 8 hours (device is online)
    ...             * Title: Biocare
    ...             * Content: There is an issue with your study. It has been paused for more than 8 hours.
    ...    - Tapping the notification shall navigate the user to the Study screen with the banner displayed if the issue has not been resolved yet
        [Tags]      BIOC-NOTIFICATION-BIOTRES-34      BIOC-SRS-18-FRS-04-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-BIOHEART-35: Bioheart recording trigger
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Device is connected with app
    ...
    ...     Test Steps:
    ...    - Press on Center button on Bioheart device
    ...
    ...     Expected Output:
    ...    - The user shall be informed when the recording is completed.
    ...    - The contents of the notifications:
    ...         + Title: Recording triggered from Bioheart
    ...         + Contents: Tap to confirm or dismiss the recording
    ...    - Tap on the notification shall open the take note screen
        [Tags]      BIOC-NOTIFICATION-BIOHEART-35      BIOC-SRS-12-FRS-09-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-BIOHEART-36: Access health report
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Device is connected with app
    ...     - The patient has already signed in and linked their program
    ...
    ...     Test Steps:
    ...    - Go to cardiac portal and add Bioheart device for program
    ...
    ...     Expected Output:
    ...    - Title: Bioheart report access request
    ...    - Message: A clinic wants to access your Bioheart reports during your Biocare cardiac program
        [Tags]      BIOC-NOTIFICATION-BIOHEART-36      BIOC-SRS-12-FRS-09-003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-BIOHEART-37: Disable health report
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Device is connected with app
    ...     - The patient has already signed in and linked their program
    ...
    ...     Test Steps:
    ...    - Go to cardiac portal and remove Bioheart device for program
    ...
    ...     Expected Output:
    ...    - Title: Bioheart report access canceled
    ...    - Message: A clinic has stopped accessing your Bioheart reports.
        [Tags]      BIOC-NOTIFICATION-BIOHEART-37      BIOC-1.18.0  manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-BIOHEART-38: verify the notification when the Bioheart battery is lower than 10%
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - -During the study
    ...     - The device is connecting the app.
    ...
    ...     Test Steps:
    ...    - Wai the bioheart battery is  lower than 10%
    ...    - wait the notification
    ...    - Click the notification
    ...
    ...     Expected Output:
    ...    - the notification " Hi there! Your Bioheart device battery is running low. Please charge it soon to ensure uninterrupted heart monitoring. Thank you for staying on top of your heart health!" appears
    ...    - Navigate the Biotres detail screen
    ...
        [Tags]      BIOC-NOTIFICATION-BIOHEART-38     BIOC-1.19.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-BIOHEART-39: verify the notification when the Bioheart battery is charging at lower than 10% and isn't charging at more than 10%
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - -During the study
    ...     - The device is connecting the app.
    ...
    ...     Test Steps:
    ...    - Wai the bioheart battery is  lower than 10%
    ...    - Charging the device 
    ...    - Don't charging when the bioheart is more than 10%
    ...    - Wait the bioheart battery is  lower than 10%
    ...    - Click the notification
    ...
    ...     Expected Output:
    ...    - the notification " Hi there! Your Bioheart device battery is running low. Please charge it soon to ensure uninterrupted heart monitoring. Thank you for staying on top of your heart health!" appears
    ...    - Navigate the Biotres detail screen
    ...
        [Tags]      BIOC-NOTIFICATION-BIOHEART-39     BIOC-1.19.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-BIOHEART-40: verify the notification appear at 8.00 AM and 9.00 PM when the Bioheart battery is lower than 10%
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - -During the study
    ...     - The device is connecting the app.
    ...
    ...     Test Steps:
    ...    - Wai the bioheart battery is  lower than 10%
    ...    - wait the notification at 9.00PM and 8.00AM
    ...    - Click the notification
    ...
    ...     Expected Output:
    ...    - the notification " Hi there! Your Bioheart device battery is running low. Please charge it soon to ensure uninterrupted heart monitoring. Thank you for staying on top of your heart health!" appears at 8:00 PM and 9:00 PM
    ...    - Navigate the Biotres detail screen
    ...
        [Tags]      BIOC-NOTIFICATION-BIOHEART-40      BIOC-1.19.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-BIOHEART-41: verify the notification doesn't appear when the Bioheart battery is lower than 10% and killing app
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - -During the study
    ...     - The device is connecting the app.
    ...
    ...     Test Steps:
    ...    - Wai the bioheart battery is  lower than 10%
    ...    - wait the notification
    ...    - Killing the app
    ...    - Open the app again
    ...
    ...     Expected Output:
    ...    - the notification doesn't appears
        ...
        [Tags]      BIOC-NOTIFICATION-BIOHEART-41     BIOC-1.19.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}       

BIOC-NOTIFICATION-BIOCORE-1: Verify the notification " Your study is complete. Please pack the device and return it using the shipping label provided." when don't pack the device and return it using the shipping label provided
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Biodirect study and user's study from the Biotricity shop
    ...     - Study Facility is active
    ...
    ...     Test Steps:
    ...    - Set up the status study is " Done"
    ...    - Set up the pre-transit
    ...    - wait the notification
    ...    - Click the notification
    ...
    ...     Expected Output:
    ...    -  he Biodirect study is in "Completed" tab
    ...    - "This notification will continue to be sent every 12 hours if the tracking order status of this device is still pre-transit after the first notification. This notification will be sent a maximum of 4 times.
    ...    The server will reload the checking process to send a notification every 30 minutes, so the notification may be delayed by 1-30 minutes."
    ...    - The app is opened
        [Tags]      BIOC-NOTIFICATION-BIOCORE-1      BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-BIOCORE-2: Verify the notification " Please turn on your device and plug into a charger for charging so all your data is available." when don't upload data
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Biodirect study and user's study from the Biotricity shop
    ...     - Study Facility is active
    ...
    ...     Test Steps:
    ...    - Set up the status study is " Done"
    ...    - Stop the study
    ...    - turn off the bluetooth
    ...    - wait the notification
    ...    - Click the notification
    ...
    ...     Expected Output:
    ...    -  The study is uploading
    ...    - "the study is paused when the study is uploading and The study status is still "Completed"
    ...    - "This notification will continue to be sent every 12 hours if the study status is still completed after the first notification. This notification will be sent a maximum of 4 times.
    ...    The server will reload the checking process to send a notification every 30 minutes, so the notification may be delayed by 1-30 minutes."
    ...    - the service tab is opened
        [Tags]      BIOC-NOTIFICATION-BIOCORE-2      BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-BIOCORE-3: verify the notification " Your clinic has sent a new consent form for you to sign!" is displayed after sign new conset
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - The patient has already signed in and linked their program
    ...     - The service consent has been signed by patient or uploaded/updated before by clinic.
    ...
    ...     Test Steps:
    ...    - Click Request Signature button on the portal
    ...    - wait the notification
    ...    - Click the notification
    ...    - Sign the consent
    ...
    ...     Expected Output:
    ...    - the notification " Your clinic has sent a new consent form for you to sign!" is displayed after sign new conset
    ...    - Service screen with Service consent that is requested to sign new one
    ...    - The consent is signed successfully
    ...
        [Tags]      BIOC-NOTIFICATION-BIOCORE-3      BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-BIOCORE-4: verify the notification when the Biocore/ Biocore pro battery is at or lower than 10%
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - -During the study
    ...     - The device is connecting the app.
    ...
    ...     Test Steps:
    ...    - Wai the Biocore/ Biocore pro battery is at or lower than 10%
    ...    - wait the notification
    ...    - Click the notification
    ...
    ...     Expected Output:
    ...    - the notification " Hello! Your Biocore device battery is low. Please charge it fully to maintain optimal performance for your study. We appreciate your commitment to accurate monitoring!" appears
    ...    - Navigate the Biotres detail screen
    ...
        [Tags]      BIOC-NOTIFICATION-BIOCORE-4      BIOC-1.19.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BIOC-NOTIFICATION-BIOCORE-5: verify the notification when the Biocore/ Biocore battery is charging at lower than 10% and isn't charging at more than 10%
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - -During the study
    ...     - The device is connecting the app.
    ...
    ...     Test Steps:
    ...    - Wai the Biocore/ Biocore battery is  lower than 10%
    ...    - Charging the device
    ...    - Don't charging when the Biocore/ Biocore is more than 10%
    ...    - Wait the Biocore/ Biocore battery is  lower than 10%
    ...    - Click the notification
    ...
    ...     Expected Output:
    ...    - the notification " Hello! Your Biocore device battery is low. Please charge it fully to maintain optimal performance for your study. We appreciate your commitment to accurate monitoring!" appears
    ...    - Navigate the Biotres detail screen
    ...
        [Tags]      BIOC-NOTIFICATION-BIOCORE-5     BIOC-1.19.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-BIOCORE-6: verify the notification appear at 8.00 AM and 9.00 PM when the Biocore/ Biocore battery is lower than 10%
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - -During the study
    ...     - The device is connecting the app.
    ...
    ...     Test Steps:
    ...    - Wai the Biocore/ Biocore battery is  lower than 10%
    ...    - wait the notification at 9.00PM and 8.00AM
    ...    - Click the notification
    ...
    ...     Expected Output:
    ...    - the notification " Hi there! Your Biocore/ Biocore device battery is running low. Please charge it soon to ensure uninterrupted heart monitoring. Thank you for staying on top of your heart health!" appears at 8:00 PM and 9:00 PM
    ...    - Navigate the Biocore/ Biocore detail screen
    ...
        [Tags]      BIOC-NOTIFICATION-BIOCORE-6      BIOC-1.19.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-BIOFLUX-1: verify the notification doesn't appear when the Bioflux battery is lower than 10% and killing app
      [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - -During the study
    ...     - The device is connecting the app.
    ...
    ...     Test Steps:
    ...    - Wai the Bioflux battery is  lower than 10%
    ...    - wait the notification
    ...    - Killing the app
    ...    - Open the app again
    ...
    ...     Expected Output:
    ...    - the notification doesn't appears
        ...
        [Tags]      BIOC-NOTIFICATION-BIOFLUX-1     BIOC-1.19.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-BIOFLUX-2: verify the notification appear at 8.00 AM and 9.00 PM when the Bioflux battery is lower than 10%
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - -During the study
    ...     - The device is connecting the app.
    ...
    ...     Test Steps:
    ...    - Wai the Bioflux battery is  lower than 10%
    ...    - wait the notification at 9.00PM and 8.00AM
    ...    - Click the notification
    ...
    ...     Expected Output:
    ...    - the notification " Hello! Your Bioflux device battery is low. Please charge it fully to maintain optimal performance for your study. We appreciate your commitment to accurate monitoring!" appears at 8:00 PM and 9:00 PM
    ...    - Navigate the Biocore/ Biocore detail screen
    ...
        [Tags]      BIOC-NOTIFICATION-BIOFLUX-2      BIOC-1.19.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BIOC-NOTIFICATION-SELF-TRACKING-1: Verify the notification "Keep track of your health by setting up the Self-tracking program. Do it now!." when don't start the Self tracking process
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     -The user has not had any program before
    ...    - The user has not completed the Self tracking process
    ...
    ...     Test Steps:
    ...    - log in the app
    ...    - Wait the notification
    ...    - Click the notification
    ...
    ...     Expected Output:
    ...    - The app shall navigate the Home screen
        [Tags]      BIOC-NOTIFICATION-SELF-TRACKING-1      BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-SELF-TRACKING-2: Verify the notification " You have a few steps left to complete the Self-tracking process. Continue now!" when don't complete the Self tracking"
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     -The user has not had any program before
    ...    - The user has not completed the Self tracking process
    ...
    ...     Test Steps:
    ...    - log in the app
    ...    - Wait the notification
    ...    - Click the notification
    ...
    ...     Expected Output:
    ...    -   - The app shall navigate the Home screen
        [Tags]      BIOC-NOTIFICATION-SELF-TRACKING-2      BIOC-1.18.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-SMS/EMAIL-1: Verify the email is sent when the report status is " complete"/ " Signed" and the study is unpaired 
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...    - The user has started study 
    ...    - The user completed study
    ...    - The user generated report
    ...    - the user send report
    ...
    ...     Test Steps:
    ...    - Edit the status report is " signed"/ " completed"
    ...    - Check the email report is sent
    ...
    ...     Expected Output:
    ...    - the email notify patients to download the app to view study report
        [Tags]      BIOC-NOTIFICATION-SMS/EMAIL-1     BIOC-1.19.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-SMS/EMAIL-2: Verify the email is sent when the report status is " Reviewed"/ " Interpreted" and the study is unpaired
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...    - The user has started study
    ...    - The user completed study
    ...    - The user generated report
    ...    - the user send report
    ...
    ...     Test Steps:
    ...    - Edit the status report is  " Reviewed"/ " Interpreted"
    ...    - Wait the 14 days Check the email report is sent
    ...
    ...     Expected Output:
    ...    - the email notify patients to download the app to view study report
        [Tags]      BIOC-NOTIFICATION-SMS/EMAIL-2      BIOC-1.19.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BIOC-NOTIFICATION-SMS/EMAIL-3: Verify the email isn't sent when the report status is " complete"/ " Signed" and the study is paired
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...    - The user has started study
    ...    - Log in the app with account has the same patient name, date of birth
    ...    - the study is paired
    ...    - The user completed study
    ...    - The user generated report
    ...    - the user send report
    ...
    ...     Test Steps:
    ...    - Edit the status report is " signed"/ " completed"
    ...    - Check the email report
    ...
    ...     Expected Output:
    ...    - the email isn't sent when the report status is " complete"/ " Signed" and the study is paired
        [Tags]      BIOC-NOTIFICATION-SMS/EMAIL-3      BIOC-1.19.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-REPORT-01: Verify the update report notification when changes the report status to "Signed" from one of the following status: "New", "Downloaded", "Reviewed", "Interpreted" , "Completed"
    [Documentation]     Author: Tu Nguyen
    ...
 ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Go through onboarding
    ...     6. Start the study
    ...     7. Complete study
    ...     8. Change the report status to "Signed" from one of the following status: "New", "Downloaded", "Reviewed", "Interpreted" , "Completed"
    ...
    ...     Expected Output:
    ...    - the content notification displays with " The physician has reviewed and updated your result. Open the app to check it now."
        [Tags]      BIOC-NOTIFICATION-REPORT-01      BIOC-2.0.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-REPORT-02: Verify the new notification when one or more electrodes are disconnected
    [Documentation]     Author: Tu Nguyen
    ...
 ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Go through onboarding
    ...     6. Start the study
    ...     7. During the study, turn off the device
    ...     8. Check the new notification
    ...
    ...     Expected Output:
    ...    - the content notification displays with " Are you still wearing your device? Please ensure the electrode is securely attached for accurate tracking.
    ...    Don’t forget to open the app regularly to stay up to date and get any support you may need!"
        [Tags]      BIOC-NOTIFICATION-REPORT-02      BIOC-2.0.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-REPORT-03: Verify the Specify Your Symptom notification when click Trigger on the device
    [Documentation]     Author: Tu Nguyen
    ...
 ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Go through onboarding
    ...     6. Start the study
    ...     7. Click Trigger on the device
    ...
    ...     Expected Output:
    ...    - the content notification displays with " Please open the app now and specify which symptom you're experiencing"
        [Tags]      BIOC-NOTIFICATION-REPORT-03      BIOC-2.0.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-REPORT-04: Verify the new notification when there is an issue found
    [Documentation]     Author: Tu Nguyen
    ...
 ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Go through onboarding
    ...     6. Start the study
    ...     7. During the study, pause off device more than 8 hours
    ...     8. Check the new notification
    ...
    ...     Expected Output:
    ...    - the content notification displays with " Every moment counts.
    ...    Keep wearing your device for continuous monitoring. Don’t forget to open the app regularly to stay up to date and get any support you may need!"
        [Tags]      BIOC-NOTIFICATION-REPORT-04      BIOC-2.0.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-REPORT-05: Verify the notification when The study status is still "Completed"(or means 'Study duration ended') after 12 hours
    [Documentation]     Author: Tu Nguyen
    ...
 ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Go through onboarding
    ...     6. Start the study
    ...     7. Complete study
    ...     8. Wait to 12 hours, check notification
    ...
    ...     Expected Output:
    ...    - the content notification displays with " Please remove the device from your body and charge your device to ensure a smooth upload."
        [Tags]      BIOC-NOTIFICATION-REPORT-05      BIOC-2.0.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-REPORT-06: Verify the notification when The study report 14 days after it has been in the "new'/"downloaded"/ "reviewed"/"interpreted" status, even if it hasn't been signed
    [Documentation]     Author: Tu Nguyen
    ...
 ...     Pre-condition:
    ...     1. Create the Clinic study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Go through onboarding
    ...     6. Start the study
    ...     7. Complete study
    ...     8. Wait to 14 days, The study report has been in the "new'/"downloaded"/ "reviewed"/"interpreted" status
    ...     9. Don't signed the study report
    ...
    ...     Expected Output:
    ...    - the content notification displays with " Your physician has shared your monitoring result. Open the Biocare Health app to check it."
        [Tags]      BIOC-NOTIFICATION-REPORT-06      BIOC-2.0.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-REPORT-07: Verify the notification after the study status is "Done", the tracking order status of this device is still pre-transit and the Biodirect study is in "Completed" tab
    [Documentation]     Author: Tu Nguyen
    ...
 ...     Pre-condition:
    ...     1. Create the biodirect study on the Diagnostics portal
    ...     2. Create the outbound
    ...     2. start on the study
    ...
    ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Go through onboarding
    ...     6. Start the study
    ...     7. Log in the biodirect portal, change the tracking order status of this device is still pre-transit
    ...     8. Stop study on the biodirect portal
    ...     9. Click " Complete Follow- up" button
    ...     10.In the complete tab, check the study
    ...     11. Wait to 12 hours, check notification
    ...
    ...     Expected Output:
    ...    - the content notification displays with " Please pack the device carefully and use the provided shipping label to return it.." after the study status is "Done", the tracking order status of this device is still pre-transit and the Biodirect study is in "Completed" tab
        [Tags]      BIOC-NOTIFICATION-REPORT-07      BIOC-2.0.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-REPORT-08: Verify the notification when the device is low battery
    [Documentation]     Author: Tu Nguyen
    ...
 ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Go through onboarding
    ...     6. Start the study
    ...     7. Wait the device low battery
    ...
    ...     Expected Output:
    ...    - the content notification displays with " Please charge it without turning it off."
        [Tags]      BIOC-NOTIFICATION-REPORT-08      BIOC-2.0.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-REPORT-09: Verify the notification when marks study report as artifact
    [Documentation]     Author: Tu Nguyen
    ...
 ...     Pre-condition:
    ...     1. Create the study on the Diagnostics portal
    ...     2. start on the study
    ...
      ...     Test Steps:
    ...     1. Log in the app
    ...     2. Click the Device tab
    ...     3. Click Scan the device id
    ...     4. Input the the device id
    ...     5. Go through onboarding
    ...     6. Complete the study
    ...     7. Wait the study report, marks study report as artifact
    ...
    ...     Expected Output:
    ...    - the content notification displays with " Heart Monitoring Unsuccessful!.
    ...       The quality of your ECG signal did not meet the required standards for an accurate diagnosis. Open the app for more details. "
        [Tags]      BIOC-NOTIFICATION-REPORT-09      BIOC-2.0.0  manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-NOTIFICATION-REPORT-10: Verify The notification is sent when the study match with the updated First Name, Last Name and Date of Birth
    [Documentation]     Author: Tu Nguyen
    ...
   ...     Pre-condition:
    ...     - Create the study on the diagnostic portal with phone number
    ...     - Input the email
    ...     - Stop the study
    ...
    ...    Test Steps:
    ...     1. Log in the app
    ...     2. Update the First Name, Last Name and Date of Birth with the existing patient account
    ...
    ...     Expected Output:
    ...   The notification is sent with the content: "Your cardiac study is now available in the Biocare Health app. Tap to view details." and Title: "Your Study Available".
    [Tags]      BIOC-NOTIFICATION-REPORT-10       BIOC-2.3.1  manual  R1
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
