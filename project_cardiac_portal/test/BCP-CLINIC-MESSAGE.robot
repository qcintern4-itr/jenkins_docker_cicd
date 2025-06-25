*** Settings ***
Documentation   Cardiac Message chat test suite
Metadata    sid     BCP-CLINIC-MESSAGE
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library      project_cardiac_portal/lib/web/Common.py
#Library      project_cardiac_portal/lib/web/Support.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-CLINIC-MESSAGE       web
Test Timeout    1h

*** Test Cases ***
BCP-CLINIC-MESSAGE-01: The chat is available for Caregiver
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The patient account is linked to the program
    ...  Test steps:
    ...  Expected result:
    ...  The caregivers shall be able access to the chat of the patient's program.
    [Tags]    BCP-CLINIC-MESSAGE-01        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-02: The chat is available for invited participant(s)
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The patient account is linked to the program
    ...  The patient account is linked to the program
    ...  The clinic user is added to the conversation

    ...  Test steps:
    ...  Expected result:
    ...  The caregivers shall be able to access to the chat of the patient's program.
    [Tags]    BCP-CLINIC-MESSAGE-02        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-03: The Caregiver(s) of the program is changed
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The patient account is linked to the program
    ...  Test steps:
    ...  Expected result:
    ...  The added Caregiver shall be able to access the conversation
    ...  The removed Caregiver shall not be able to access the conversation anymore.
    [Tags]    BCP-CLINIC-MESSAGE-03        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-04: The chat is available for Active program
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The patient account is linked to the program
    ...  Test steps:
    ...  Expected result:
    ...  The chat can be accessed when the program is Active.
    [Tags]    BCP-CLINIC-MESSAGE-04        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-05: The chat is not available for New or Inactive program
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The patient account is linked to the program
    ...  Test steps:
    ...  Expected result:
    ...  The chat can not be accessed when the program is New or Inactive.
    [Tags]    BCP-CLINIC-MESSAGE-05        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-06: The invited participant(s) of the program is updated
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The patient account is linked to the program
    ...  Test steps:
    ...  Expected result:
    ...  The added participant shall be able to access the conversation
    ...  The removed participant shall not be able to access the conversation anymore.
    [Tags]    BCP-CLINIC-MESSAGE-06        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-07: The enabled/disabled input text area
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The input text area shall be enabled when the program is Active
    ...  The input text area shall be disabled when the program is Inactive.
    [Tags]    BCP-CLINIC-MESSAGE-07        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-08: The conversation history
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The patient account is linked to the program
    ...  Test steps:
    ...  Expected result:
    ...  The conversation history shall be kept the same after the program is stopped and reactivated
    ...  The participants can view the entire conversation history even when the chat is disabled.
    [Tags]    BCP-CLINIC-MESSAGE-08        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-09: The conversation real-time updated
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The conversation shall be in real-time delivery.
    [Tags]    BCP-CLINIC-MESSAGE-09        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-10: Message page - New chat on the list
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The badge shall be counted and the conversation shall be highlighted on the list.
    [Tags]    BCP-CLINIC-MESSAGE-10        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-11: Patient details - New chat on the list
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The badge shall be counted as the number of new chat on the Chat icon.
    [Tags]    BCP-CLINIC-MESSAGE-11        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-12: Accessing the patient reminder settings
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The participant shall be able to access the patient reminder settings from the chat on both patient details and message page.
    [Tags]    BCP-CLINIC-MESSAGE-12        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-13: Message page - User focuses on the conversation
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The focused conversation shall be highlighted
    ...  The enable/disable chat button and the flag button shall be displayed.
    [Tags]    BCP-CLINIC-MESSAGE-13        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-14: Flag/unflag the conversation
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The conversation shall be flagged/unflagged from both patient details and message page
    ...  The flag status shall be displayed only on the participant side who takes the action.
    [Tags]    BCP-CLINIC-MESSAGE-14        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-15: Conversation status is Read
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The number of new chat shall be cleared out and the chat shall not be highlighted anymore.
    [Tags]    BCP-CLINIC-MESSAGE-15        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-16: User receives new message while they are on the conversation
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The patient account is linked to the program
    ...  Test steps:
    ...  Expected result:
    ...  The badge shall not be counted and the conversation shall not be highlighted.
    [Tags]    BCP-CLINIC-MESSAGE-16        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-17: The message is removed from the chat
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The patient account is linked to the program
    ...  Test steps:
    ...  Expected result:
    ...  The message shall not be displayed on the chat anymore
    ...  There is a status displayed to notify that the message is removed instead.
    [Tags]    BCP-CLINIC-MESSAGE-17        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-18: Caregiver enables/disables the chat
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The patient account is linked to the program
    ...  Test steps:
    ...  Expected result:
    ...  Only caregiver of the program can enable/disable the chat.
    [Tags]    BCP-CLINIC-MESSAGE-18        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-19: Invited participant can not enable/disable the chat
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The patient account is linked to the program
    ...  Test steps:
    ...  Expected result:
    ...  The enable/disable button shall not available for the invited participant on the chat.
    [Tags]    BCP-CLINIC-MESSAGE-19        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-20: The chat is available for the Active program
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The patient account is linked to the program
    ...  Test steps:
    ...  Expected result:
    ...  The conversation shall be displayed only for Active program.
    [Tags]    BCP-CLINIC-MESSAGE-20        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-21: Message page - Enable/disable chat on the Messages list
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: Hovering on the conversation on the Message page
    ...  Test steps:
    ...  Expected result:
    ...  The enable/disable chat button on a specific chat row shall be worked properly.
    [Tags]    BCP-CLINIC-MESSAGE-21        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-22: Messge page - Enable/disable chat on the conversation
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: Click the 'more' icon on the conversation details screen
    ...  Test steps:
    ...  Expected result:
    ...  The enable/disable chat button shall be worked properly.
    [Tags]    BCP-CLINIC-MESSAGE-22        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-23: Patient details - Enable/disable chat
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: Click the 'more' icon on the conversation details
    ...  Test steps:
    ...  Expected result:
    ...  The enable/disable chat button shall be worked properly.
    [Tags]    BCP-CLINIC-MESSAGE-23        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-24: Change log of the enable/disable chat
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  After the chat is enabled/disabled successfully, the actions shall be logged to the Change log of the program.
    [Tags]    BCP-CLINIC-MESSAGE-24        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-25: View chat status
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The enable/disable chat status shall be available for all participants on the chat.
    [Tags]    BCP-CLINIC-MESSAGE-25        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-26: Send message on chat
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  All participants shall be able to send the new message when the chat is enabled only.
    [Tags]    BCP-CLINIC-MESSAGE-26        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-27: User starts the chat from the Patient quick access side bar
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The program is active and linked to patient account
    ...  The clinic user is the caregiver of the program
    ...  Test steps:
    ...  Expected result:
    ...  The Chat icon on the side bar shall be displayed and clinic user can access to the chat through this icon.
    [Tags]    BCP-CLINIC-MESSAGE-27        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-28: Filter the Message list by 'All facilities'
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  All program's conversations of all facilities shall be displayed on the page.
    [Tags]    BCP-CLINIC-MESSAGE-28        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-29: Filter the Message list by a specific facility
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  All program's conversations of the selected facility shall be displayed on the page.
    [Tags]    BCP-CLINIC-MESSAGE-29        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-30: Search the conversation by Patient name
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The program belongs to the selected facility
    ...  Test steps:
    ...  Expected result:
    ...  The conversation shall be displayed on the result list.
    [Tags]    BCP-CLINIC-MESSAGE-30        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-31: Search the conversation by Program ID
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The program belongs to the selected facility
    ...  Test steps:
    ...  Expected result:
    ...  The conversation shall be displayed on the result list.
    [Tags]    BCP-CLINIC-MESSAGE-31        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-32: Search the conversation which user is the caregiver
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The program belongs to the selected facility
    ...  Test steps:
    ...  Expected result:
    ...  The conversation shall be displayed on the result list.
    [Tags]    BCP-CLINIC-MESSAGE-32        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-33: Search the conversation which user is the invited participant
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The program belongs to the selected facility
    ...  Test steps:
    ...  Expected result:
    ...  The conversation shall be displayed on the result list.
    [Tags]    BCP-CLINIC-MESSAGE-33        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-34: Maximum characters of the typing area
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The user is on the conversation
    ...  Test steps:
    ...  Expected result:
    ...  The maximum characters is 500
    [Tags]    BCP-CLINIC-MESSAGE-34        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-35: Copy the text on chat
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The user is on the conversation
    ...  Test steps:
    ...  Expected result:
    ...  All the participants shall be able to copy all messages on the chat.
    [Tags]    BCP-CLINIC-MESSAGE-35        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-36: Delete message on chat
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The user is on the conversation
    ...  Test steps:
    ...  Expected result:
    ...  User shall be able to delete their message only.
    [Tags]    BCP-CLINIC-MESSAGE-36        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-37: View all information on chat
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The user is on the conversation
    ...  Test steps:
    ...  Expected result:
    ...  All the chat info such as (participants/message date & time) shall be visibled for all participants on chat.
    [Tags]    BCP-CLINIC-MESSAGE-37        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-38: The new messages received
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The user is outside the chat box
    ...  Test steps:
    ...  Expected result:
    ...  The badge shall be displayed on the chat to counted and notified about new messages received.
    ...  It works the same on patient details and Message page also.
    [Tags]    BCP-CLINIC-MESSAGE-38       manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-39: Internet interupted
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The user is on the conversation
    ...  Test steps:
    ...  Expected result:
    ...  An error message shall be displayed to notify that the internet connection is not going well.
    [Tags]    BCP-CLINIC-MESSAGE-39        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-40: Caregiver invites participant to the chat
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The user is on the conversation
    ...  The added participant must belong to the registered facility of the program
    ...  Test steps:
    ...  Expected result:
    ...  Only caregiver be able to add participant to the chat.
    [Tags]    BCP-CLINIC-MESSAGE-40        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-41: The maximum added participants
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The maximum added participants is 2.
    [Tags]    BCP-CLINIC-MESSAGE-41        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-42: Search for participants on chat
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The user is on the conversation
    ...  Test steps:
    ...  Expected result:
    ...  The clinic user shall be displayed along with their role
    ...  The added participants on chat can not be searched out.
    [Tags]    BCP-CLINIC-MESSAGE-42        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-43: Leave the conversation
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The user is the invited participant of the chat
    ...  Test steps:
    ...  Expected result:
    ...  The caregiver can not leave the conversation
    ...  The actions of leaving the chat shall be visibled for all participants on chat
    ...  The conversation shall be removed from the leaving person side.
    [Tags]    BCP-CLINIC-MESSAGE-43        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-44: Remove participants from the chat
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The user is the caregiver
    ...  Test steps:
    ...  Expected result:
    ...  Only caregiver be able to remove everyone from the chat
    ...  The removed status shall be visibled for all participants on chat
    ...  The removed participant shall be notified via the Notification center.
    [Tags]    BCP-CLINIC-MESSAGE-44        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-45: Re-assign caregivers
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The user is the caregiver
    ...  Test steps:
    ...  Expected result:
    ...  The removed caregiver shall be removed from the chat and can not view the conversation
    ...  The assigned caregiver shall be added to the chat and be able to view the entire conversation history.
    [Tags]    BCP-CLINIC-MESSAGE-45        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-46: Sign consent for CCM/RPM plan type
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The consent is not yet signed
    ...  Test steps:
    ...  Expected result:
    ...  The enabled chat function shall not be worked until the CCM/RPM consent is signed.
    [Tags]    BCP-CLINIC-MESSAGE-46        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-47: Sign consent for CCM & RPM plan type
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The consent is not yet signed
    ...  Test steps:
    ...  Expected result:
    ...  The enabled chat function shall not be worked until both the CCM&RPM consents are signed.
    [Tags]    BCP-CLINIC-MESSAGE-47        manual      [BCP-2.18.1]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-48: Check notification messages when only enabling Portal notifications
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...  Test steps:
    ...  1. At the Settings menu > Tab new messages
    ...  2. In the Notification method field > Enable toggle Portal notification button, disable Email button
    ...  3. Login App > Go to the patients assigned to the clinic user above > Enter the message
    ...  4. Login Portal into clinic user above

    ...  Expected result:
    ...  4. A new message from their conversation, a notification banner and a push notification shall be triggered for the selected recipients.
    [Tags]    BCP-CLINIC-MESSAGE-48        manual      BCCA-2.28.0    R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-MESSAGE-49: Check validate message facility information when changed
    [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...  Test steps:
    ...  1. Login clinic User A belongs to facility A and B
    ...  2. Change notification setting to Portal notification - Daily > Save successfully
    ...  3. Login app patients A belonging to facility A and B > Send message
    ...  4. Login clinic User C > Check notification

    ...  Expected result:
    ...  3. At clinic user A displays notifications with format: • Title: <Patient’s full name> Content: <The new message from the conversation>
    ...  4. Notification settings are individual for each clinic user and do not affect other users within the same facility.
    [Tags]    BCP-CLINIC-MESSAGE-49        manual      BCCA-2.28.0    R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
*** Keywords ***
#Suite Setup
    ${BROWSER_NODE}      Start Browser
    Import Library       project_cardiac_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${NURSES}            Get Config Param    USER > nurse
    ${TOKEN}             Sign In Cardiac     username=${NURSES}[0][username]     password=${NURSES}[0][password]
    ${VERSION}           Get Release Version
    Set Suite Metadata   version    ${VERSION}
    Set Suite Metadata   browser    ${BROWSER.capitalize()}

#Suite Teardown
    Quit Browser

