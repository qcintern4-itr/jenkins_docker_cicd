*** Settings ***
Documentation  Bioheart portal Overview test suite
Metadata    sid   BHP-OVERVIEW
Metadata  owner   Linh Tran
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioheart_portal/lib/ConfigHandler.py   ${ENV}
Library     corelib/AssertionExtension.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags  BHP-OVERVIEW        web
Test Timeout  1h

*** Test Cases ***
BHP-OVERVIEW-BANNER-01: Check banner UI
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...   There shall be a modal displayed as the design.
    ...     - Content: Hello, <username>! Have a nice day to check your health activities
    ...       Display the current date on the top of the Overview screen [month] [day], [year]
    [Tags]  BHP-OVERVIEW-BANNER-01      auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Profile
    ${profile}    Get Profile
    ${welcome_title}        Catenate     Hello,      ${profile}[username]!
    ${baner}        Get Welcome Banner
    ${date}         Get Current Date        result_format=%B %d, %Y
    Run Keyword And Continue On Failure     Should Be Equal     ${welcome_title}     ${baner}[title]
    Run Keyword And Continue On Failure     Should Be Equal     ${baner}[description]     Have a nice day to check your health activites.
    Run Keyword And Continue On Failure     Should Be Equal     ${date}     ${baner}[date]
    Open Profile    is_open=${False}        is_close=${True}
    Sign Out Bioheart Portal

BHP-OVERVIEW-BANNER-02: Close banner
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Close button
    ...     Expected Output:
    ...    - 1. The banner is closed and not show up until the next day (at 00:00).
    [Tags]  BHP-OVERVIEW-BANNER-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-OVERVIEW-HR-01: View heart rate value
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - On the heart rate card, there shall be the value of heart rate
    ...         + Value: latest heart rate value recorded.
    ...         + Data will be reloaded every time the user refreshes or navigates to the Overview screen.
    ...         + Data will be reloaded every 5 minutes automatically.
    [Tags]  BHP-OVERVIEW-HR-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-OVERVIEW-HR-02: View heart rate chart
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - There shall be a heart rate chart displaying the latest data on the Bioheart app.
    ...         + Timeframe: 24h
    ...         + Type of chart: line
    ...         + Time: latest time of recorded value:
    ...     - If the latest time is not the current date: [month] [date] (example Aug 22).
    ...     - If the latest time is the current day and more than 5 minutes from the current time: Today.
    ...     - If the latest time is lower than 5 minutes from the current time: 5 min. ago.
    ...         + Each point displays the value of the average heart rate in 30 minutes
    [Tags]  BHP-OVERVIEW-HR-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-OVERVIEW-HR-03: Navigate to the heart rate chart
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...     - 1. Click on the Heart rate card
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the heart rate chart in the Summary tab
    [Tags]  BHP-OVERVIEW-HR-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-OVERVIEW-HRV-01: View heart rate variability value
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - On the heart rate variability card, display:
    ...     - Value: latest value synced from the Bioheart app.
    ...     - Time: latest time of recorded value:
    ...         + If the latest time is not the current date: [month] [date] (example Aug 22).
    ...         + If the latest time is the current day and more than 5 minutes from the current time: Today.
    ...         + If the latest time is lower than 5 minutes from the current time: 5 min. ago.
    ...     - Data will be reloaded every time the user refreshes or navigates to the Overview screen.
    ...     - Data will be reloaded every 5 minutes automatically
    [Tags]  BHP-OVERVIEW-HRV-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-OVERVIEW-HRV-02: Navigate to the heart rate variability chart
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...     - 1. Click on the Heart rate variability card
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the heart rate chart variability in the Summary tab
    [Tags]  BHP-OVERVIEW-HRV-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-OVERVIEW-HRV-03: View threshold of heart rate variability from 20 to 30 ages
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...     - 1. Go to Profile tab and edit ages from 20 to 30
    ...     - 2. Check threshold of heart rate variability in HRV card
    ...
    ...     Expected Output:
    ...     - 1. The age is set
    ...     - 2. + The content of the text box: “Within 47-106 ms” with green color by default.
    ...          + If the user’s HRV is lower than 47 the text box changes to orange.
    ...          + If the user’s HRV is higher than 106 the text box stays unchanged
    [Tags]  BHP-OVERVIEW-HRV-03     auto
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Profile
    ${profile}    Get Profile

    ${baner}        Get Welcome Banner
    ${date}         Get Current Date        result_format=%B %d, %Y
    Open Profile    is_open=${False}        is_close=${True}
    Sign Out Bioheart Portal

BHP-OVERVIEW-HRV-04: View threshold of heart rate variability from 31 to 40 ages
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...     - 1. Go to Profile tab and edit ages from 31 to 40
    ...     - 2. Check threshold of heart rate variability in HRV card
    ...
    ...     Expected Output:
    ...     - 1. The age is set
    ...     - 2. + The content of the text box: “Within 35-84 ms” with green color by default
    ...          + If the user’s HRV is lower than 35 the text box changes to orange.
    ...          + If the user’s HRV is higher than 84 the text box stays unchanged
    [Tags]  BHP-OVERVIEW-HRV-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-OVERVIEW-HRV-05: View threshold of heart rate variability from 41 to 50 ages
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...     - 1. Go to Profile tab and edit ages from 41 to 50
    ...     - 2. Check threshold of heart rate variability in HRV card
    ...
    ...     Expected Output:
    ...     - 1. The age is set
    ...     - 2. + The content of the text box: “Within 30-64 ms” with green color by default
    ...          + If the user’s HRV is lower than 30 the text box changes to orange.
    ...          + If the user’s HRV is higher than 64 the text box stays unchanged
    [Tags]  BHP-OVERVIEW-HRV-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-OVERVIEW-HRV-06: View threshold of heart rate variability from 51 to 60 ages
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...     - 1. Go to Profile tab and edit ages from 51 to 60
    ...     - 2. Check threshold of heart rate variability in HRV card
    ...
    ...     Expected Output:
    ...     - 1. The age is set
    ...     - 2. + The content of the text box: “Within 27-53 ms” with green color by default
    ...          + If the user’s HRV is lower than 27 the text box changes to orange.
    ...          + If the user’s HRV is higher than 53 the text box stays unchanged
    [Tags]  BHP-OVERVIEW-HRV-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-OVERVIEW-HRV-07: View threshold of heart rate variability from over 60 ages
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...     - 1. Go to Profile tab and edit ages over 60
    ...     - 2. Check threshold of heart rate variability in HRV card
    ...
    ...     Expected Output:
    ...     - 1. The age is set
    ...     - 2. + The content of the text box: “Within 28-50 ms” with green color by default
    ...          + If the user’s HRV is lower than 28 the text box changes to orange.
    ...          + If the user’s HRV is higher than 50 the text box stays unchanged
    [Tags]  BHP-OVERVIEW-HRV-07      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-OVERVIEW-HRV-08: There is no HRV recorded
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - The text box shall not be displayed
    [Tags]  BHP-OVERVIEW-HRV-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-OVERVIEW-RHR-01: View resting heart rate value
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - On the heart rate variability card, display:
    ...     - Value: latest value recorded from the bio heart app.
    ...     - Time: latest time of recorded value
    ...         + If the latest time is not the current date: [month] [date] (example Aug 22).
    ...         + f the latest time is the current day and more than 5 minutes from the current time: Today.
    ...         + If the latest time is lower than 5 minutes from the current time: 5 min. ago.
    ...     - Data will be reloaded every time the user refreshes or navigates to the Overview screen.
    ...     - Data will be reloaded every 5 minutes automatically
    [Tags]  BHP-OVERVIEW-RHR-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-OVERVIEW-RHR-02: Navigate to the resting heart rate chart
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...     - 1. Click on Resting heart rate card
    ...
    ...     Expected Output:
    ...     - 1. Navigate to the resting heart rate chart in the Summary tab
    [Tags]  BHP-OVERVIEW-RHR-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-OVERVIEW-RHR-03: View threshold of resting heart rate
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - There shall be a text box below the Resting HR index with content: “Within 60-100 bpm” and shall be green by default.
    ...     - If the resting heart rate is higher than 100 bpm, the text box shall change to orange
    [Tags]  BHP-OVERVIEW-RHR-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-OVERVIEW-RHR-04: There is no Resting HR recorded
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - The text box shall not be displayed
    [Tags]  BHP-OVERVIEW-RHR-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-OVERVIEW-AM-01: View Active minute value
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...   On the heart rate variability card, display:
    ...     - Total active minute of the latest date in the app.
    ...     - Average heart rate during activity.
    ...     - Time: latest time of recorded value:
    ...       + If the latest time is not the current date: [month] [date] (example Aug 22).
    ...       + If the latest time is the current day and more than 5 minutes from the current time: Today.
    ...       + If the latest time is lower than 5 minutes from the current time: 5 min. ago.
    ...     - Data will be reloaded every time the user refreshes or navigates to the Overview screen.
    ...     - Data will be reloaded every 5 minutes automatically
    [Tags]  BHP-OVERVIEW-AM-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-OVERVIEW-AM-02: View Active minute chart
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...   There shall be a heart rate chart displaying the latest data from the Bioheart app.
    ...       + Timeframe: 24h
    ...       + Type of chart: Column
    ...       + Each column display value of the total active minute in 30 minutes
    [Tags]  BHP-OVERVIEW-AM-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-OVERVIEW-AM-03: View Active minute chart
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Active minute card
    ...
    ...     Expected Output:
    ...    - 1. Navigate to the Active minute screen in the Summary tab
    [Tags]  BHP-OVERVIEW-AM-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-OVERVIEW-SIDEBAR-01: View right-sidebar
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...   On the right sidebar, there shall be these components:
    ...     - Profile button: this button displays the avatar of the user.
    ...     - Notifications button.
    ...     - Settings button.
    ...     - Sign out button.
    [Tags]  BHP-OVERVIEW-SIDEBAR-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-OVERVIEW-SIDEBAR-02: View left-sidebar
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...   On the right sidebar, there shall be these components:
    ...     - Overview button: click on this button will open the Overview tab.
    ...     - Summary button: click on this button will open the Summary tab.
    ...     - Rhythm diary button: click on this button will open the Rhythm diary tab.
    ...     - Health Report button: click on this button will open the Health Report tab.
    ...     - Support button: click on this button will open the Overview tab.
    [Tags]  BHP-OVERVIEW-SIDEBAR-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library    project_bioheart_portal/lib/web/Common.py    ${BROWSER_NODE}  ${ENV}
    Import Library    project_bioheart_portal/lib/web/Profile.py    ${BROWSER_NODE}  ${ENV}
    Import Library    project_bioheart_portal/lib/web/Overview.py    ${BROWSER_NODE}  ${ENV}
    Set Suite Variable  ${BROWSER_NODE}
    ${USER}    Get Config Param    USER
    Set Suite Variable      ${USER}
    ${VERSION}      Navigate To Bioheart Sign In Page
    Set Suite Metadata    version   ${VERSION}
    Set Suite Metadata    browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Sign In Bioheart Portal     email=${USER}[1][username]       password=${USER}[1][password]
    Open Profile       open_edit_prof=${True}
    Edit Profile       date=08/11/2001
    Quit Browser
