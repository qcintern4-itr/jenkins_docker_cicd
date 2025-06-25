*** Settings ***
Documentation   Cardiac Heart Monitor Notification page test suite
Metadata    sid     BCP-NURSE-SUPPORT
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
Library      project_cardiac_portal/lib/web/Common.py
Library      project_cardiac_portal/lib/web/Support.py

Suite Setup     Suite Setup
Suite Teardown  Suite Teardown
Force Tags      BCP-NURSE-SUPPORT       web
Test Timeout    1h

*** Test Cases ***
BCP-NURSE-SUPPORT-01: Send support message due to Web portal issues
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to the Support page
    ...   - Click on Send support message button
    ...   - Select Support field as "Web portal issues"
    ...   - Fill out all the required fields displayed on the side tab bar
    ...   - Click Send button
    ...   Expected Result:
    ...   - A toast will be displayed: "We have received your request and will reach out to you to let you know when the issue has been resolved".
    [Tags]    BCP-NURSE-SUPPORT-01    manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    Navigate To Support
#    Send Support Message    facility=${FACILITIES}[0]     support=Web portal issues     email=alex@biotricity.com      message=Send support message test
#    ${message}    Get Success Message
#    Run Keyword And Continue On Failure     Should Be Equal    ${message}     We have received your request and will reach out to you to let you know when the issue has been resolved

BCP-NURSE-SUPPORT-02: Send support message due to Others issues
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to the Support page
    ...   - Click on Send support message button
    ...   - Select Support field as "Others"
    ...   - Fill out all the required fields displayed on the side tab bar
    ...   - Click Send button
    ...   Expected Result:
    ...   - A toast will be displayed: "We have received your request and will get back to you as soon as possible".
    [Tags]    BCP-NURSE-SUPPORT-02    auto
    Navigate To Support
    Send Support Message    facility=Facility_QA_01     support=Others    email=alex@biotricity.com      message=Send support message test
    ${message}    Get Success Message
    Run Keyword And Continue On Failure     Should Be Equal    ${message}     We have received your request and will get back to you as soon as possible

BCP-NURSE-SUPPORT-03: Check the Support request screen UI
    [Documentation]    Author: Bao Van
    ...
    ...   Test Steps:
    ...   1. Login Portal > Select Support menu
    ...   2. Check the Support request screen UI
    ...   3. Click the Filter button

    ...   Expected Result:
    ...   1. Default displays Support Request
    ...   2. Display UI according to design figma
    ...   3. Show options Status: "Open" & " Resolved", Category: "Web portal issues" & "Others"
    [Tags]    BCP-NURSE-SUPPORT-03    auto        BCCA-2.29.0
    Navigate To Support
    Navigate Filter Support
    Verify Options Filter Support

BCP-NURSE-SUPPORT-04.: Implement filter data request Status
    [Documentation]    Author: Bao Van
    ...
    ...   Test Steps:
    ...   1. Login Portal > Select Support menu
    ...   2. At the Support Request screen > Click on the "Filter" button
    ...   3. Click the Open button > Select Apply
    ...   4. Re-select Status = Resolved > Click Apply

    ...   Expected Result:
    ...   2. Display 2 checkboxes "Open" & "Resolved"
    ...   3. Display all requests with Open status, disable requests with Resolved status
    ...   4. Display all requests with Resolved status, disable requests with Open status
    [Tags]    BCP-NURSE-SUPPORT-04.    manual        BCCA-2.29.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-SUPPORT-05.: Implement filter data request Category
    [Documentation]    Author: Bao Van
    ...
    ...   Test Steps:
    ...   1. Login Portal > Select Support menu
    ...   2. At the Support Request screen > Click on the "Filter" button
    ...   3. Click to select the Web portal issues checkbox > Select Apply
    ...   4. Click the Other checkbox > Select Apply

    ...   Expected Result:
    ...   2. Display 2 checkboxes "Web portal issues" & "Others"
    ...   3. Select successfully, enable all requests with Category = Web portal issues
    ...   4. Select successfully, enable all requests with Category = Other, disable requests for Web portal issues
    [Tags]    BCP-NURSE-SUPPORT-05.    manual        BCCA-2.29.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-SUPPORT-06.: Check data UI Send support message
    [Documentation]    Author: Bao Van
    ...
    ...   Test Steps:
    ...   1. Login Portal > Select Support menu
    ...   2. At the Support Request screen > Click on the "Send support message" button
    ...   3. At filter "Your facility" > Perform filter drop downlist > Check data
    ...   4. At filter "Support > Perform drop downlist filter
    ...   5. Check data UI filed Notification email

    ...   Expected Result:
    ...   2. Displays the Send support message screen
    ...   3. Displays all clinic user facilities
    ...   4. Displays 2 options "Web portal issues" & "Others"
    ...   5. The default system displays the email of the cilic user currently logged in, allowing further input
    [Tags]    BCP-NURSE-SUPPORT-06.    manual        BCCA-2.29.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-SUPPORT-07.: Execute "Send support message"
    [Documentation]    Author: Bao Van
    ...
    ...   Test Steps:
    ...   1. Login Portal > Select Support menu
    ...   2. At the Support Request screen > Click on the "Send support message" button
    ...   3. In the Your facility filter, select facility A
    ...   4. At the Support filter, select the "Web portal issues" option
    ...   5. At Notification email, enter email A
    ...   6. At Your message > Enter message "Need help" > Click send

    ...   Expected Result:
    ...   6. Send successfully, the system displays a popup message "We have received your request and will reach out to you to let you know when the issue has been resolved"
    [Tags]    BCP-NURSE-SUPPORT-07.    auto        BCCA-2.29.0
    Navigate To Support
    Send Support Message    facility=Facility_QA_01     support=Web portal issues    email=alex@biotricity.com      message=Need help
    ${message}    Get Success Message
    Run Keyword And Continue On Failure     Should Be Equal    ${message}     We have received your request and will reach out to you to let you know when the issue has been resolved

BCP-NURSE-SUPPORT-08.: Check validate the "Send support message" screen
    [Documentation]    Author: Bao Van
    ...
    ...   Test Steps:
    ...   1. At the Send support message screen
    ...   2. Do not select the Your facility filter > Click Send
    ...   3. Do not select the Support filter > Click Send
    ...   4. In the Notification email field, do not enter any email > Click Send
    ...   5. Enter email in incorrect format > Click Send
    ...   6. In the Your message field > Leave blank, enter characters > 200 > Click Send

    ...   Expected Result:
    ...   3. Send button is disabled
    ...   4. Send button is disabled
    ...   5. Send button is disabled
    ...   6. The system displays the error message " The field contains email(s) with invalid format, please check again
    ...   7. Send button is disabled
    [Tags]    BCP-NURSE-SUPPORT-08.    manual        BCCA-2.29.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-SUPPORT-09.: Check data message on Clinic Portal page
    [Documentation]    Author: Bao Van
    ...
    ...   Test Steps:
    ...   1. After Send support request > Login to Clinic Portal page
    ...   2. Check notification icon
    ...   3. Click on New message > Check data details

    ...   Expected Result:
    ...   2. Display New message
    ...   3. Displays full input data information from the Biocare Disease Management page
    [Tags]    BCP-NURSE-SUPPORT-09.    manual        BCCA-2.29.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-SUPPORT-10.: Check UI when receiving response notification from Clinic Portal
    [Documentation]    Author: Bao Van
    ...
    ...   Test Steps:
    ...   1. Login Clinic Portal > Reply to Message request
    ...   2. Login Caridac Portal > Check data UI
    ...   3. Click view details

    ...   Expected Result:
    ...   1. Successful response
    ...   2. In the Support Request field, UI displays 1 new message, when there are more than 99 messages, it displays "99+"
    ...   3. Displays the full response data. Name of responder, response time
    [Tags]    BCP-NURSE-SUPPORT-10.    manual        BCCA-2.29.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-SUPPORT-11.: Implement Resolved markup
    [Documentation]    Author: Bao Van
    ...
    ...   Test Steps:
    ...   1. Login Clinic Portal > Select Resolved
    ...   2. Login Cardiac portal > Select Support request menu
    ...   3. Check data Request ID has just been resolved on the clinic portal page
    ...   4. Check UI details

    ...   Expected Result:
    ...   1. Resolved successfully
    ...   3. Status from Open to Resolved
    ...   4. Display message "The ticket has been resolved through email", date format: MM/DD/YYYY at HH/MM AM/PM
    [Tags]    BCP-NURSE-SUPPORT-11.    manual        BCCA-2.29.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-SUPPORT-12.: Check data UI when selecting "None" data in Pain log
    [Documentation]    Author: Bao Van
    ...
    ...   Test Steps:
    ...   1. Login Apps > Select "None" in Pain log
    ...   2. Choose success
    ...   3. Login Portal > Check data pain log has just been selected

    ...   Expected Result:
    ...   3. System displays "No data display"
    [Tags]    BCP-NURSE-SUPPORT-12.    manual        BCCA-2.29.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    Navigate To Support
#    Send Support Message    facility=${FACILITIES}[1]     support=Others     email=alex@biotricity.com      message=Send support message test
#    ${message}    Get Success Message
#    Run Keyword And Continue On Failure     Should Be Equal    ${message}     We have received your request and will get back to you as soon as possible
#he Support request screen UI

    [Documentation]    Author: Bao Van
    ...
    ...   Test Steps:
    ...   1. Login Portal > Select Support menu
    ...   2. Check the Support request screen UI
    ...   3. Click the Filter button

    ...   Expected Result:
    ...   1. Default displays Support Request
    ...   2. Display UI according to design figma
    ...   3. Show options Status: "Open" & " Resolved", Category: "Web portal issues" & "Others"
    [Tags]    BCP-NURSE-SUPPORT-03    manual        BCCA-2.29.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-SUPPORT-04: Implement filter data request Status
    [Documentation]    Author: Bao Van
    ...
    ...   Test Steps:
    ...   1. Login Portal > Select Support menu
    ...   2. At the Support Request screen > Click on the "Filter" button
    ...   3. Click the Open button > Select Apply
    ...   4. Re-select Status = Resolved > Click Apply

    ...   Expected Result:
    ...   2. Display 2 checkboxes "Open" & "Resolved"
    ...   3. Display all requests with Open status, disable requests with Resolved status
    ...   4. Display all requests with Resolved status, disable requests with Open status
    [Tags]    BCP-NURSE-SUPPORT-04    manual        BCCA-2.29.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-SUPPORT-05: Implement filter data request Category
    [Documentation]    Author: Bao Van
    ...
    ...   Test Steps:
    ...   1. Login Portal > Select Support menu
    ...   2. At the Support Request screen > Click on the "Filter" button
    ...   3. Click to select the Web portal issues checkbox > Select Apply
    ...   4. Click the Other checkbox > Select Apply

    ...   Expected Result:
    ...   2. Display 2 checkboxes "Web portal issues" & "Others"
    ...   3. Select successfully, enable all requests with Category = Web portal issues
    ...   4. Select successfully, enable all requests with Category = Other, disable requests for Web portal issues
    [Tags]    BCP-NURSE-SUPPORT-05    manual        BCCA-2.29.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-SUPPORT-06: Check data UI Send support message
    [Documentation]    Author: Bao Van
    ...
    ...   Test Steps:
    ...   1. Login Portal > Select Support menu
    ...   2. At the Support Request screen > Click on the "Send support message" button
    ...   3. At filter "Your facility" > Perform filter drop downlist > Check data
    ...   4. At filter "Support > Perform drop downlist filter
    ...   5. Check data UI filed Notification email

    ...   Expected Result:
    ...   2. Displays the Send support message screen
    ...   3. Displays all clinic user facilities
    ...   4. Displays 2 options "Web portal issues" & "Others"
    ...   5. The default system displays the email of the cilic user currently logged in, allowing further input
    [Tags]    BCP-NURSE-SUPPORT-06    manual        BCCA-2.29.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-SUPPORT-07: Execute "Send support message"
    [Documentation]    Author: Bao Van
    ...
    ...   Test Steps:
    ...   1. Login Portal > Select Support menu
    ...   2. At the Support Request screen > Click on the "Send support message" button
    ...   3. In the Your facility filter, select facility A
    ...   4. At the Support filter, select the "Web portal issues" option
    ...   5. At Notification email, enter email A
    ...   6. At Your message > Enter message "Need help" > Click send

    ...   Expected Result:
    ...   6. Send successfully, the system displays a popup message "We have received your request and will reach out to you to let you know when the issue has been resolved"
    [Tags]    BCP-NURSE-SUPPORT-07    manual        BCCA-2.29.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-SUPPORT-08: Check validate the "Send support message" screen
    [Documentation]    Author: Bao Van
    ...
    ...   Test Steps:
    ...   1. At the Send support message screen
    ...   2. Do not select the Your facility filter > Click Send
    ...   3. Do not select the Support filter > Click Send
    ...   4. In the Notification email field, do not enter any email > Click Send
    ...   5. Enter email in incorrect format > Click Send
    ...   6. In the Your message field > Leave blank, enter characters > 200 > Click Send

    ...   Expected Result:
    ...   3. Send button is disabled
    ...   4. Send button is disabled
    ...   5. Send button is disabled
    ...   6. The system displays the error message " The field contains email(s) with invalid format, please check again
    ...   7. Send button is disabled
    [Tags]    BCP-NURSE-SUPPORT-08    manual        BCCA-2.29.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-SUPPORT-09: Check data message on Clinic Portal page
    [Documentation]    Author: Bao Van
    ...
    ...   Test Steps:
    ...   1. After Send support request > Login to Clinic Portal page
    ...   2. Check notification icon
    ...   3. Click on New message > Check data details

    ...   Expected Result:
    ...   2. Display New message
    ...   3. Displays full input data information from the Biocare Disease Management page
    [Tags]    BCP-NURSE-SUPPORT-09    manual        BCCA-2.29.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-SUPPORT-10: Check UI when receiving response notification from Clinic Portal
    [Documentation]    Author: Bao Van
    ...
    ...   Test Steps:
    ...   1. Login Clinic Portal > Reply to Message request
    ...   2. Login Caridac Portal > Check data UI
    ...   3. Click view details

    ...   Expected Result:
    ...   1. Successful response
    ...   2. In the Support Request field, UI displays 1 new message, when there are more than 99 messages, it displays "99+"
    ...   3. Displays the full response data. Name of responder, response time
    [Tags]    BCP-NURSE-SUPPORT-10    manual        BCCA-2.29.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-SUPPORT-11: Implement Resolved markup
    [Documentation]    Author: Bao Van
    ...
    ...   Test Steps:
    ...   1. Login Clinic Portal > Select Resolved
    ...   2. Login Cardiac portal > Select Support request menu
    ...   3. Check data Request ID has just been resolved on the clinic portal page
    ...   4. Check UI details

    ...   Expected Result:
    ...   1. Resolved successfully
    ...   3. Status from Open to Resolved
    ...   4. Display message "The ticket has been resolved through email", date format: MM/DD/YYYY at HH/MM AM/PM
    [Tags]    BCP-NURSE-SUPPORT-11    manual        BCCA-2.29.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-SUPPORT-12: Check data UI when selecting "None" data in Pain log
    [Documentation]    Author: Bao Van
    ...
    ...   Test Steps:
    ...   1. Login Apps > Select "None" in Pain log
    ...   2. Choose success
    ...   3. Login Portal > Check data pain log has just been selected

    ...   Expected Result:
    ...   3. System displays "No data display"
    [Tags]    BCP-NURSE-SUPPORT-12    manual        BCCA-2.29.0
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
*** Keywords ***
Suite Setup
    ${BROWSER_NODE}      Start Browser
    Import Library       project_cardiac_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    Import Library       project_cardiac_portal/lib/web/Support.py   ${BROWSER_NODE}  ${ENV}
    ${NURSES}            Get Config Param    USER > nurse
    ${TOKEN}             Sign In Cardiac     username=${NURSES}[3][username]     password=${NURSES}[3][password]
    ${VERSION}           Get Release Version
    Set Suite Metadata   version    ${VERSION}
    Set Suite Metadata   browser    ${BROWSER.capitalize()}

Suite Teardown
    Quit Browser
