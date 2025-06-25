*** Settings ***
Documentation   Motion Audio Authen test suite
Metadata    sid     MOAU-AUDIO-MGMT
Metadata    owner   Nang Phung
Library     corelib/AssertionExtension.py
#Library     corelib/MobileMOAUpHandler.py                ${DESIRED_CMOAUS}
#Library     project_motion_audio/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      MOAU-AUDIO-MGMT   mapp
Test Timeout    1h

*** Test Cases ***
MOAU-AUDIO-MGMT-01: "Audio Manager" screen opens successfully
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the Audio Manager screen opens when the user taps the "Audio Manager" button.
    ...
    ...    Precondition:
    ...    - The Motion Audio device is connected to Wi-Fi and added to the app.
    ...    - The user is on the "Device Details" screen.
    ...
    ...    Steps:
    ...    1. Tap on the "Audio Manager" button on the "Device Details" screen.
    ...
    ...    Expected Results:
    ...    1. The Audio Manager screen opens successfully.
    [Tags]    MOAU-AUDIO-MGMT-01   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-02: "File Too Large" pop-up displays for files >100MB
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the "File Too Large" pop-up appears when attempting to upload files over 100MB.
    ...
    ...    Precondition:
    ...    - The user is on the "Audio Manager" screen.
    ...
    ...    Steps:
    ...    1. Tap on the "Add Audio From Phone" button
    ...    2. Select an audio file greater than 100MB for upload.
    ...    3. Tap on the "Upload to Device" button
    ...    4. Wait for the system to check the file size.
    ...    5. Observe the pop-up displayed.
    ...    6. Tap on the "Select another file" button
    ...    7. Repeat from step 1 to step 2
    ...    8. Tap on the "Cancel" button
    ...
    ...    Expected Results:
    ...    4. A "File Too Large" pop-up appears.
    ...    5. The pop-up contains the "Select another file" and "Cancel" button.
    ...    6. The pop-up and navigate the user back to the file browser screen to select another audio file
    ...    7. A "File Too Large" pop-up appears.
    ...    8. The uploading process should be terminated and the user should be navigated back to the "Manage Audio" screen.
    [Tags]    MOAU-AUDIO-MGMT-02   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-03: "Device Storage Full" pop-up displays for insufficient storage
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the "Device Storage Full" pop-up appears when uploading a file that exceeds available storage.
    ...
    ...    Precondition:
    ...    - The user is on the "Audio Manager" screen.
    ...
    ...    Steps:
    ...    1. Tap on the "Add Audio From Phone" button
    ...    2. Select an audio file for upload that exceeds available storage.
    ...    3. Tap on the "Upload to Device" button
    ...    4. Wait for the system to check the available storage.
    ...    5. Observe the pop-up displayed.
    ...    6. Press on "Manage device storage" button
    ...    7. Repeat from step 1 to step 2
    ...    8. Press on "Cancel" button
    ...
    ...    Expected Results:
    ...    4. The "Device Storage Full" pop-up displayed.
    ...    5. The pop-up contains the "Manage device storage" and "Cancel uploading" button.
    ...    6. Close the pop-up and redirect the user to the “Manage Audio files" screen.
    ...    7. The "Device Storage Full" pop-up appears.
    ...    8. Close the pop-up and redirect the user to the "Audio Manager" screen.
    [Tags]    MOAU-AUDIO-MGMT-03   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-04: Error message displays if storage is insufficient
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that an error message displays when there is insufficient storage for the audio file.
    ...
    ...    Precondition:
    ...    - The user is on the Audio Manager screen with insufficient storage.
    ...
    ...    Steps:
    ...    1. Tap on "Add Audio From Phone" button.
    ...    2. Select an audio file that exceeds the available storage.
    ...    3. Tap on the "Upload to Device" button
    ...
    ...    Expected Results:
    ...    3.1 The "Device Storage Full" pop-up displayed.
    ...    3.2 The file is not uploaded.
    [Tags]    MOAU-AUDIO-MGMT-04   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-05: Audio file is converted to 192 kbps if bit rate is >192 kbps
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that audio files with bit rates >192 kbps are converted to 192 kbps before uploading.
    ...
    ...    Precondition:
    ...    - The user is on the Audio Manager screen.
    ...
    ...    Steps:
    ...    1. Tap on the "Add Audio From Phone" button
    ...    2. Select an audio file with a bit rate greater than 192 kbps.
    ...    3. Tap on the "Upload to Device" button
    ...    4. Wait for the system to convert the bit rate.
    ...
    ...    Expected Results:
    ...    3. A "Converting audio..." pop-up is displayed.
    ...    4. The bit rate is converted to 192 kbps before upload.
    [Tags]    MOAU-AUDIO-MGMT-05   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-06: Audio file is converted to 44.1 kHz if sample rate is < 44.1 kHz
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that audio files with sample rates below 44.1 kHz are converted to 44.1 kHz before uploading.
    ...
    ...    Precondition:
    ...    - The user is on the Audio Manager screen.
    ...
    ...    Steps:
    ...    1. Tap on the "Add Audio From Phone" button
    ...    2. Select an audio file with a sample rate lower than 44.1 kHz.
    ...    3. Tap on the "Upload to Device" button
    ...    4. Wait for the system to convert the sample rate.
    ...
    ...    Expected Results:
    ...    3. A "Converting audio..." pop-up is displayed.
    ...    4. The sample rate is converted to 44.1 kHz before upload.
    [Tags]    MOAU-AUDIO-MGMT-06   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-07: Non-MP3 audio file is converted to MP3
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that non-MP3 audio files are converted to MP3 format before uploading.
    ...
    ...    Precondition:
    ...    - The user is on the Audio Manager screen.
    ...
    ...    Steps:
    ...    1. Tap on the "Add Audio From Phone" button
    ...    2. Select a non-MP3 audio file for upload.
    ...    3. Tap on the "Upload to Device" button
    ...    4. Wait for the system to convert the file to MP3.
    ...
    ...    Expected Results:
    ...    3. A "Converting audio..." pop-up is displayed.
    ...    4. The non-MP3 audio file is converted to MP3 before upload.
    [Tags]    MOAU-AUDIO-MGMT-07   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-08: User can select an audio file from the media library
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the user can select an audio file from the media library.
    ...
    ...    Precondition:
    ...    - The user is on the "Audio Manager" screen.
    ...    - The app has permission to access media files.
    ...
    ...    Steps:
    ...    1. Tap on "Add Audio From Phone" button.
    ...    2. Wait for the media library to open.
    ...    3. Select an audio file from the media library.
    ...
    ...    Expected Results:
    ...    1. The media library opens successfully.
    ...    3. The user can choose an audio file for upload.
    [Tags]    MOAU-AUDIO-MGMT-08   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-09: Audio file uploads successfully if storage is sufficient
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the audio file uploads successfully when there is sufficient storage.
    ...
    ...    Precondition:
    ...    - The user is on the "Audio Manager" screen with sufficient storage.
    ...
    ...    Steps:
    ...    1. Tap on "Add Audio From Phone" button.
    ...    2. Select an audio file for upload within the storage is 10 MB.
    ...    3. Tap on the "Upload to Device" button
    ...    4. Observe if the upload starts.
    ...    5. Wait for the upload to complete.
    ...    6. Tap on the "Manage" button on the audio list
    ...
    ...    Expected Results:
    ...    4. A "Upload audio..." pop-up is displayed.
    ...    5. The audio file that was just uploaded successfully is displayed in the audio list.
    ...    6. Confirm that the uploaded file size matches the size of the original file
    [Tags]    MOAU-AUDIO-MGMT-09   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-10: Warning modal displays if upload is in progress
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that a warning modal appears when the user attempts to upload another file while an upload is in progress.
    ...
    ...    Precondition:
    ...    - The user is on the Audio Manager screen and an upload is in progress.
    ...
    ...    Steps:
    ...    1. Tap on the "Add Audio From Phone" button.
    ...    2. Tap on the "Record New Audio" button.
    ...
    ...    Expected Results:
    ...    1. A warning pop-up is displayed notifying the user that another upload is in progress.
    ...    2. A warning pop-up is displayed notifying the user that another upload is in progress.
    [Tags]    MOAU-AUDIO-MGMT-10   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-11: User can initiate the audio recording process
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the user can tap the "Record New Audio" button to start recording.
    ...    Precondition:
    ...    - The user is on the "Audio Manager" screen.
    ...
    ...    Steps:
    ...    1. Tap on the "Record New Audio" button.
    ...
    ...    Expected Results:
    ...    1. The application starts recording audio from the mobile's microphone.
    ...    2. The screen displays the time length during the recording process.
    [Tags]    MOAU-AUDIO-MGMT-11   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-12: User can stop and resume recording
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the user can pause and resume the recording process.
    ...
    ...    Precondition:
    ...    - The user has started recording audio.
    ...
    ...    Steps:
    ...    1. Tap on the “Pause” button.
    ...    2. Tap on the “Resume” button.
    ...
    ...    Expected Results:
    ...    1. The recording pauses when the “Pause” button is tapped.
    ...    2. The recording resumes when the “Resume” button is tapped.
    [Tags]    MOAU-AUDIO-MGMT-12   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-13: User cannot record for more than 5 minutes
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the app stops recording automatically when the maximum duration of 5 minutes is exceeded.
    ...
    ...    Precondition:
    ...    - The user has started recording audio.
    ...
    ...    Steps:
    ...    1. Record audio for more than 5 minutes.
    ...
    ...    Expected Results:
    ...    1. The app stops recording automatically once the 5-minute limit is exceeded.
    [Tags]    MOAU-AUDIO-MGMT-13   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-14: User can play the recently recorded audio
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the user can listen to the recently recorded audio before uploading it.
    ...
    ...    Precondition:
    ...    - The user has recorded audio.
    ...
    ...    Steps:
    ...    1. Tap on the “Play” button to listen to the recording.
    ...
    ...    Expected Results:
    ...    1. The audio plays without issue, allowing the user to listen to the recording.
    [Tags]    MOAU-AUDIO-MGMT-14   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-15: User can modify the recording file name
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the user can change the name of the recording file before uploading.
    ...
    ...    Precondition:
    ...    - The user is recording audio.
    ...
    ...    Steps:
    ...    3. Tap the “Stop” button.
    ...    1. Tap on the file name field to edit the name.
    ...    2. Change the file name.
    ...    3. Tap the “Upload to Device” button.
    ...
    ...    Expected Results:
    ...    3. The file name is successfully modified and saved when the “Upload to Device” button is tapped.
    [Tags]    MOAU-AUDIO-MGMT-15   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-16: User can discard and record audio again
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the user can discard the current recording and start recording again.
    ...
    ...    Precondition:
    ...    - The user has started recording audio.
    ...
    ...    Steps:
    ...    1. Tap the “Discard & Record again” button.
    ...
    ...    Expected Results:
    ...    1. The current recording is discarded, and the user can start a new recording.
    [Tags]    MOAU-AUDIO-MGMT-16   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-17: User can view the list of audio files on the device
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the user can view the list of audio files recorded or uploaded to the device.
    ...
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to the Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...
    ...    Steps:
    ...    1. Navigate to the "Audio Manager" screen.
    ...
    ...    Expected Results:
    ...    1. A section is displayed showing a list of all audio files recorded or uploaded to the device.
    [Tags]    MOAU-AUDIO-MGMT-17   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-18: Audio files list is sorted by date from newest to oldest
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the audio files are sorted by date, with the newest files appearing first in the list.
    ...
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to the Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...
    ...    Steps:
    ...    1. Navigate to the "Audio Manager" screen.
    ...
    ...    Expected Results:
    ...    1. The audio files list is sorted by date in descending order, from newest to oldest.
    [Tags]    MOAU-AUDIO-MGMT-18   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-19: User can play an audio file from the list
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the user can play an audio file on the device by tapping the play icon in the audio list.
    ...
    ...    Precondition:
    ...    - The user is on the "Audio Manager" screen with a list of audio files displayed.
    ...
    ...    Steps:
    ...    1. Tap on the "Play" icon.
    ...
    ...    Expected Results:
    ...    1. The selected audio file begins to play on the device.
    [Tags]    MOAU-AUDIO-MGMT-19   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-20: User can stop an audio file from playing
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the user can stop an audio file from playing by tapping the stop icon in the audio list.
    ...
    ...    Precondition:
    ...    - An audio file is currently playing from the audio list on the "Audio Manager" screen.
    ...
    ...    Steps:
    ...    1. Tap on the "Stop" icon.
    ...
    ...    Expected Results:
    ...    1. The audio file stops playing on the device.
    [Tags]    MOAU-AUDIO-MGMT-20   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-21: User can navigate to the "Manage Audio Files" screen
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the user can access the "Manage Audio Files" screen by clicking the "Manage" button.
    ...
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the "Audio Manager" screen.
    ...    - There is at least one recorded or uploaded audio file in the app.
    ...
    ...    Steps:
    ...    1. Tap on the "Manage" button.
    ...
    ...    Expected Results:
    ...    1. The user is navigated to the "Manage Audio Files" screen, displaying a list of audio files and their file sizes.
    [Tags]    MOAU-AUDIO-MGMT-21   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-22: User can view the list of audio files and their sizes on "Manage Audio Files" screen
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the "Manage Audio Files" screen displays a list of audio files along with their file sizes.
    ...
    ...    Precondition:
    ...    - The user is on the "Audio Manager" screen.
    ...
    ...    Steps:
    ...    1. Tap on the "Manage" button.
    ...
    ...    Expected Results:
    ...    1. The list of audio files and their file sizes is displayed correctly on the screen.
    [Tags]    MOAU-AUDIO-MGMT-22   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-23: User can delete one or multiple selected audio files
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the user can delete one or multiple selected audio files from the device's storage.
    ...
    ...    Precondition:
    ...    - The user is on the "Manage Audio Files" screen with a list of audio files.
    ...
    ...    Steps:
    ...    1. Select one or multiple audio files by tapping their checkboxes.
    ...    2. Tap on the "Delete selected files" button.
    ...
    ...    Expected Results:
    ...    1. The selected audio files are permanently deleted from the device's storage.
    [Tags]    MOAU-AUDIO-MGMT-23   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-24: User can delete all audio files at once
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the user can delete all audio files by selecting all files at once and pressing "Delete selected files".
    ...
    ...    Precondition:
    ...    - The user is on the "Manage Audio Files" screen with a list of audio files.
    ...
    ...    Steps:
    ...    1. Select all audio files by tapping the "Select All" checkbox.
    ...    2. Tap on the "Delete selected files" button.
    ...
    ...    Expected Results:
    ...    1. All selected audio files are permanently deleted from the device's storage.
    [Tags]    MOAU-AUDIO-MGMT-24   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-25: User can view the "Storage Information" section on the Audio Manager screen
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the "Storage Information" section is visible on the Audio Manager screen.
    ...
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The user is on the "Audio Manager" screen.
    ...
    ...    Steps:
    ...    1. Locate the "Storage Information" section.
    ...
    ...    Expected Results:
    ...    1. The "Storage Information" section is visible on the "Audio Manager" screen.
    [Tags]    MOAU-AUDIO-MGMT-25   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-26: User can view total storage and used storage storage
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the system displays total storage and used storage information.
    ...
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The user is on the "Audio Manager" screen.
    ...
    ...    Steps:
    ...    1. Locate the "Storage Information" section.
    ...
    ...    Expected Results:
    ...    1. The "Storage Information" section displays information for total storage and used storage accurately.
    [Tags]    MOAU-AUDIO-MGMT-26   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-27: System automatically updates storage information
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the storage information updates automatically when changes occur.
    ...
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The user is on the Audio Manager screen.
    ...
    ...    Steps:
    ...    1. Record or upload an audio file to the device.
    ...    2. Return to the "Audio Manager" screen.
    ...
    ...    Expected Results:
    ...    1. The "Storage Information" section updates to reflect the current used and total storage after uploading the file.
    [Tags]    MOAU-AUDIO-MGMT-27   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-28: Display "Playback Mode" section on Audio Manager screen
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the "Playback Mode" section is visible on the Audio Manager screen.
    ...
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The user is on the "Device Detail" screen.
    ...
    ...    Steps:
    ...    1. Tap on the "Audio Manager" button to open the "Audio Manager" screen.
    ...
    ...    Expected Results:
    ...    1. The "Playback Mode" section is visible on the "Audio Manager" screen.
    [Tags]    MOAU-AUDIO-MGMT-28   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-29: User can select "Single Mode" playback
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the user can select "Single Mode" and select only one audio file for playback.
    ...
    ...    Precondition:
    ...    - The user is on the "Playback Mode" section on the "Audio Manager" screen.
    ...
    ...    Steps:
    ...    1. Select "Single Mode" in the Playback Mode section.
    ...    2. Select one audio file from the list.
    ...
    ...    Expected Results:
    ...    1. The app allows selection of only one audio file in Single Mode.
    [Tags]    MOAU-AUDIO-MGMT-29   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-30: User can select "Random Mode" playback
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the user can select "Random Mode" and multiple audio files for playback.
    ...
    ...    Precondition:
    ...    - The user is on the "Playback Mode" section on the "Audio Manager" screen.
    ...
    ...    Steps:
    ...    1. Select "Random Mode" in the Playback Mode section.
    ...    2. Select multiple audio files from the list.
    ...
    ...    Expected Results:
    ...    1. The app allows selection of multiple audio files in Random Mode.
    [Tags]    MOAU-AUDIO-MGMT-30   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-31: User can select "Sequence Mode" playback and set order
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the user can select "Sequence Mode," choose multiple audio files, and set their playback order.
    ...
    ...    Precondition:
    ...    - The user is on the "Playback Mode" section on the "Audio Manager" screen.
    ...
    ...    Steps:
    ...    1. Select "Sequence Mode" in the Playback Mode section.
    ...    2. Select multiple audio files from the list.
    ...    3. Set the playback order for the selected audio files.
    ...
    ...    Expected Results:
    ...    1. The app allows selection and ordering of multiple audio files in Sequence Mode.
    [Tags]    MOAU-AUDIO-MGMT-31   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-32: Apply and save playback mode configuration
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the user can apply and save the selected playback mode configuration.
    ...
    ...    Precondition:
    ...    - The user has selected a playback mode and corresponding audio files.
    ...
    ...    Steps:
    ...    1. Selected a playback mode.
    ...    2. Selected an audio file in the mode.
    ...    3. Tap the "Save changes" button.
    ...
    ...    Expected Results:
    ...    1. The system saves the selected playback mode configuration and sends it to the device.
    [Tags]    MOAU-AUDIO-MGMT-32    manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-34: Pre-selection of last saved mode and audio files
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the app pre-selects the last saved mode and audio files when revisiting the playback settings.
    ...
    ...    Precondition:
    ...    - The user has previously saved a playback mode with selected audio files.
    ...
    ...    Steps:
    ...    1. Open the "Playback Mode" section on the Audio Manager screen.
    ...
    ...    Expected Results:
    ...    1. The app pre-selects the last saved playback mode and corresponding audio files.
    [Tags]    MOAU-AUDIO-MGMT-34   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-35: Single Mode Playback
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that when Single Mode is selected, only one audio file can be selected for playback.
    ...
    ...    Precondition:
    ...    - The user is on the playback settings screen.
    ...    - The user has a list of audio files available to select from.
    ...
    ...    Steps:
    ...    1. Select "Single Mode" from the playback mode options.
    ...    2. Try selecting more than one audio file.
    ...    3. Tap on the "Save Changes" button.
    ...    4. Trigger motion detection on the device.
    ...
    ...    Expected Results:
    ...    2. Only one audio file can be selected for playback.
    ...    4. The selected audio files will play
    [Tags]    MOAU-AUDIO-MGMT-35   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-36: Random Mode Playback
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that when Random Mode is selected, multiple audio files can be selected and played randomly.
    ...
    ...    Precondition:
    ...    - The user is on the playback settings screen.
    ...    - The user has a list of audio files available to select from.
    ...
    ...    Steps:
    ...    1. Select "Random Mode" from the playback mode options.
    ...    2. Select multiple audio files from the list.
    ...    3. Tap on the "Save Changes" button.
    ...    4. Trigger motion detection on the device.
    ...
    ...    Expected Results:
    ...    2. Multiple audio files can be selected for playback.
    ...    4. The selected audio files will play randomly
    [Tags]    MOAU-AUDIO-MGMT-36   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-37: Sequence Mode Playback
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that when Sequence Mode is selected, multiple audio files can be selected and ordered for sequential playback.
    ...
    ...    Precondition:
    ...    - The user is on the playback settings screen.
    ...    - The user has a list of audio files available to select from.
    ...
    ...    Steps:
    ...    1. Select "Sequence Mode" from the playback mode options.
    ...    2. Select multiple audio files from the list.
    ...    3. Tap on the "Save Changes" button.
    ...    4. Trigger motion detection on the device.
    ...
    ...    Expected Results:
    ...    2.1 Multiple audio files can be selected for playback.
    ...    2.2 The order of audio files can be customized for sequential playback.
    ...    4. The selected audio files will play in the specified order when motion is detected.
    [Tags]    MOAU-AUDIO-MGMT-37   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-38: Warning message when no audio file selected
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that a warning message appears if the user tries to save playback mode without selecting an audio file.
    ...
    ...    Precondition:
    ...    - The user is on the "Playback Mode" section and has not selected any audio file.
    ...
    ...    Steps:
    ...    1. Select a playback mode.
    ...    2. Tap the "Save changes" button without selecting any audio file.
    ...    3. Tap on the "Save without selecting audio" button.
    ...    4. Trigger motion detection on the device.
    ...
    ...    Expected Results:
    ...    2. A warning pop-up is displayed: "No audio file selected for playback on your device!".
    ...    3. The app prevents saving until at least one audio file is selected.
    ...    4. The device will not play audio but will only flash the green LED for 10 seconds.
    [Tags]    MOAU-AUDIO-MGMT-38   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-39: Display "Playback Delay" text box with default value
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the "Playback Delay" text box is displayed on the Audio Manager screen with a default value of "0".
    ...
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Audio Manager screen.
    ...
    ...    Steps:
    ...    1. Locate the "Playback Delay" text box on the Audio Manager screen.
    ...
    ...    Expected Results:
    ...    1. The "Playback Delay" text box is visible and displays the default value of "0".
    [Tags]    MOAU-AUDIO-MGMT-39   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-40: User can set playback delay within valid range
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the user can enter a delay value from 0 to 120 seconds in the "Playback Delay" text box.
    ...
    ...    Precondition:
    ...    - The user is on the Audio Manager screen.
    ...
    ...    Steps:
    ...    1. Enter a value between 0 and 120 in the "Playback Delay" text box.
    ...
    ...    Expected Results:
    ...    1. The text box accepts the entered value, and it remains displayed as entered.
    [Tags]    MOAU-AUDIO-MGMT-40   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-41: User cannot enter invalid playback delay value
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the "Playback Delay" text box does not accept values outside the range of 0 to 120 seconds.
    ...
    ...    Precondition:
    ...    - The user is on the Audio Manager screen.
    ...
    ...    Steps:
    ...    1. Try entering a negative value or a value greater than 120 in the "Playback Delay" text box.
    ...
    ...    Expected Results:
    ...    1. The system displays an inline error, restricting the input to the range 0-120.
    [Tags]    MOAU-AUDIO-MGMT-41   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-43: Save playback delay configuration
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the user can save the edited playback delay and that the system adjusts playback delay accordingly.
    ...
    ...    Precondition:
    ...    - The user has entered a valid delay value in the "Playback Delay" text box.
    ...
    ...    Steps:
    ...    1. Tap the "Save changes" button on the Audio Manager screen.
    ...
    ...    Expected Results:
    ...    1. The system saves the delay setting and sends the configuration to the device.
    ...    2. The device adjusts the playback delay according to the saved value.
    [Tags]    MOAU-AUDIO-MGMT-43   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-44: Device behavior with saved playback delay
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the device adheres to the playback delay setting after motion is detected, based on the saved value.
    ...
    ...    Precondition:
    ...    - The user has saved a playback delay value.
    ...
    ...    Steps:
    ...    1. Trigger motion detection on the device.
    ...
    ...    Expected Results:
    ...    1. The device waits for the specified playback delay duration before starting audio playback.
    [Tags]    MOAU-AUDIO-MGMT-44   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-45: Display "Delay between successive playbacks" text box with default value
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the "Delay between successive playbacks" text box is displayed on the Audio Manager screen with a default value of "0".
    ...
    ...    Precondition:
    ...    - The Motion Audio device is opened and connected to Wi-Fi.
    ...    - The Motion Audio device is added to the app.
    ...    - The user is on the Audio Manager screen.
    ...
    ...    Steps:
    ...    1. Locate the "Delay between successive playbacks" text box on the Audio Manager screen.
    ...
    ...    Expected Results:
    ...    1. The "Delay between successive playbacks" text box is visible and displays the default value of "0".
    [Tags]    MOAU-AUDIO-MGMT-45   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-46: User can set delay between successive playbacks within valid range
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the user can enter a delay value from 0 to 120 seconds in the "Delay between successive playbacks" text box.
    ...
    ...    Precondition:
    ...    - The user is on the Audio Manager screen.
    ...
    ...    Steps:
    ...    1. Enter a value between 0 and 120 in the "Delay between successive playbacks" text box.
    ...
    ...    Expected Results:
    ...    1. The text box accepts the entered value and it remains displayed as entered.
    [Tags]    MOAU-AUDIO-MGMT-46   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-47: User cannot enter invalid delay value
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the "Delay between successive playbacks" text box does not accept values outside the range of 0 to 120 seconds.
    ...
    ...    Precondition:
    ...    - The user is on the Audio Manager screen.
    ...
    ...    Steps:
    ...    1. Try entering a negative value or a value greater than 120 in the "Delay between successive playbacks" text box.
    ...
    ...    Expected Results:
    ...    1. The system displays an inline error, restricting the input to the range 0-120.
    [Tags]    MOAU-AUDIO-MGMT-47   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-48: Save delay between successive playbacks configuration
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the user can save the edited delay and that the system adjusts the device's behavior accordingly.
    ...
    ...    Precondition:
    ...    - The user has entered a valid delay value in the "Delay between successive playbacks" text box.
    ...
    ...    Steps:
    ...    1. Tap the "Save changes" button on the Audio Manager screen.
    ...
    ...    Expected Results:
    ...    1. The system saves the delay setting and sends the configuration to the device.
    ...    2. The device adjusts the playback behavior to wait for the configured delay before responding to the next motion trigger.
    [Tags]    MOAU-AUDIO-MGMT-48    manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

MOAU-AUDIO-MGMT-49: Device behavior with saved successive playback delay
    [Documentation]    Author: Nang Phung
    ...
    ...    Description: Verify that the device adheres to the delay between successive playbacks setting after motion is detected.
    ...
    ...    Precondition:
    ...    - The user has saved a delay of 30 seconds between successive playbacks
    ...    - The device has detected motion and is playing audio.
    ...
    ...    Steps:
    ...    1. Wait for the device to stop playing audio and trigger motion detection on the device.
    ...    2. Wait for 30 secodns. Then trigger motion detection on the device again
    ...
    ...    Expected Results:
    ...    1. The device ignores subsequent motion triggers during the configured delay time.
    ...    2. The device plays audio only after the delay period has passed and motion is detected again.
    [Tags]    MOAU-AUDIO-MGMT-49   manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}
*** Keywords ***
SUITE SETUP
    ${MOAUP_NODE}     Get Device Node
    Import Library    project_motion_audio/lib/mMOAUp/Common.py     ${MOAUP_NODE}     ${ENV}
    Start Motion Audio
    ${USER}     Get Config Param    USER
    Sign In Motion Audio    email=${USER}[username]      password=${USER}[password]
    ${RELEASE_VERSION}     Get Release Version
    Set Suite Metadata     version     ${RELEASE_VERSION}

SUITE TEARDOWN
    Quit All
