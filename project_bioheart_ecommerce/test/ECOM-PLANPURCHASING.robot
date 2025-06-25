*** Settings ***
Documentation   Bioheart e-commerce authentication test suite
Metadata        sid     ECOM-PLANPURCHASING
Metadata        owner   Tan Pham
Library         corelib/AssertionExtension.py
Library         corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
#Library         project_bioheart_ecommerce/lib/web/Common.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      ECOM-PLANPURCHASING       web
Test Timeout    1h

*** Test Cases ***
ECOM-PLANPURCHASING-VIEWFREEPLAN-01: View Plan (Free Plan)
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user has activated the free plan.
    ...
    ...     Test Steps:
    ...     - 1. Click on the Your Plan tab on the top navigation bar
    ...
    ...     Expected Output:
    ...     - 1.  The user shall be navigated to the Your Plan screen
    ...         * Title: Your Plan
    ...         * Message: Follow the design
    ...         * Upgrade now button, click to navigate to the Purchase Biosphere+ page
    [Tags]  ECOM-PLANPURCHASING-VIEWFREEPLAN-01    ECOM-SRS-06-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-PLANPURCHASING-VIEWMONTHPLAN-02: View Plan (Monthly Plan)
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user has activated the monthly plan.
    ...
    ...     Test Steps:
    ...     - 1. Click on the Your Plan tab on the top navigation bar
    ...
    ...     Expected Output:
    ...     - 1.  The user shall be navigated to the Your Plan screen
    ...         * Title: Your Plan
    ...         * Message: Follow the design
    ...         * Payment card with the following information
    ...             + Email
    ...             + Country
    ...             + Address
    ...             + Phone number
    ...             + Tax ID
    ...             + Payment method
    ...         * Cancel subscription button, click this button, the Cancel Subscription modal shall appear.
    ...         * There shall be an alert banner:
    ...             + Payment failed:
    ...                 ++ This banner shall appear if Stripe is unable to process payment for the user.
    ...                 ++ There shall be an Subscribe now button on this alert banner. Clicking this button shall navigate the user to the Purchase Biosphere+ screen.
    ...             + Expiration :
    ...                 ++ This banner shall appear after the user cancel his/her subscription.
    ...                 ++ Message: “Your subscription plan will expire on [expired date]”.
    ...                 ++ There shall be a Continue Biosphere+ button. Clicking this button shall navigate the user to the Purchase Biosphere+ screen.
    [Tags]  ECOM-PLANPURCHASING-VIEWMONTHPLAN-02    ECOM-SRS-06-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-PLANPURCHASING-VIEWMONTHPLAN-03: View Plan (Annual Plan)
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user has activated the annual plan.
    ...
    ...     Test Steps:
    ...     - 1. Click on the Your Plan tab on the top navigation bar
    ...
    ...    Expected Output:
    ...     - 1.  The user shall be navigated to the Your Plan screen
    ...         * Title: Your Plan
    ...         * Message: Follow the design
    ...         * Payment card with the following information
    ...             + Email
    ...             + Country
    ...             + Address
    ...             + Phone number
    ...             + Tax ID
    ...             + Payment method
    ...         * Cancel subscription button, click this button, the Cancel Subscription modal shall appear.
    ...         * There shall be an alert banner:
    ...             + Payment failed:
    ...                 ++ This banner shall appear if Stripe is unable to process payment for the user.
    ...                 ++ There shall be an Subscribe now button on this alert banner. Clicking this button shall navigate the user to the Purchase Biosphere+ screen.
    ...             + Expiration :
    ...                 ++ This banner shall appear after the user cancel his/her subscription.
    ...                 ++ Message: “Your subscription plan will expire on [expired date]”.
    ...                 ++ There shall be a Continue Biosphere+ button. Clicking this button shall navigate the user to the Purchase Biosphere+ screen.
    [Tags]  ECOM-PLANPURCHASING-VIEWMONTHPLAN-03    ECOM-SRS-06-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
ECOM-PLANPURCHASING-PURCHASEBOPSPHERE-01: Purchase Biosphere+ Membership
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - User has not registered Biosphere+ Membership
    ...
    ...     Test Steps:
    ...     - 1. Click "Upgrade to Biosphere+" button
    ...     - 2. Select plan
    ...     - 3. Fill in all required fields
    ...     - 4. Click " Proceed to Pay" button
    ...
    ...     Expected Output:
    ...     - 1. "Purchase Biosphere +" screen display
    ...     - 2. The user can only select 1 of the 2 options: Annual or Monthly
    ...     - 3. Information fields:
    ...         + Email address (required): the email address to Biotricity to send the e-invoice of the payment.
    ...           This information shall be prefilled with the user’s email (if the email information is available in their account).
    ...         + Country: Click on this shall open a drop-down containing a list of all countries:
    ...             * Default: United State.
    ...             * The user shall be able to scroll on the drop-down list and click on 1 country to select.
    ...               After clicking, the drop-down list shall be closed.
    ...             * Each country shall have a phone code.
    ...             * The user can search for the country name on this screen.
    ...             * The user can select ONLY ONE country, he can change his selection
    ...             * If the user edits the country after inputting other fields, all the input data will be deleted,
    ...               and the user must input them again.
    ...         + Address (required):
    ...             * The user shall be able to enter a text in the input box.
    ...             * There shall be address suggestions from the system which the user can select
    ...               and the address shall populate to address city, state, and zip code fields.
    ...             * If the system cannot find the suitable city, state, or zip code with what the user input, that field will be empty.
    ...             * If there is no internet connection during this duration, there shall be a snack bar.
    ...         + City (required):
    ...             * City’s name is automatically input when the user enters their address.
    ...             * The user shall be able to enter a text in the input box.
    ...             * There shall be city suggestions from the system which the user can select,
    ...               and the city shall populate to city, state, and zip code fields.
    ...         + State (required):
    ...             * The state’s name is automatically inputted when the user enters their address or city.
    ...               Pressing it will navigate the user to the search state screen.
    ...             * The user shall be able to enter a text in the input box.
    ...             * There shall be state suggestions from the system which the user can select.
    ...         + Zip code (required):
    ...             * Zip code is automatically input when the user enters their address.
    ...             * The user shall be able to enter a valid digit number in the input box.
    ...         + Phone number (required):
    ...             * The user shall be able to enter a maximum of 15 numbers in the input box.
    ...             * The Phone code value shall be as same as the phone code of the selected country.
    ...               When the user changes the country, the phone code shall change also.
    ...             * Phone number format shall remain despite the change of phone code.
    ...         + Tax ID:
    ...             * Tax id shall automatically change depending on the country field.
    ...             * The user shall be able to enter numbers in the input box.
    ...             * If the country has no tax id this field will not display.
    ...             * If the country has more than 1 tax id, the user can select the tax id he wants.
    ...         + There shall be a Policy section with the content: “No commitment. Cancel anytime in Account overview >
    ...           Cancel Biophere+ at least a day before each renewal date. Plan automatically renews until canceled.”
    ...     - 4. Clicking on this button will navigate the user to the payment page where the user can make the payment:
    ...         + On the payment screen, there shall be the following information for the user to input:
    ...             * Email (auto-fill the user's email)
    ...             * Card information (Textbox)
    ...             * Name on card (Textbox)
    ...             * Country or region (Drop-down list of countries)
    ...             * Pay button
    ...             * Back button. Clicking this button shall navigate the user to the previous screen.
    ...         +  After filling in all the required information, the user clicks the Pay button to go to the next screen.
    ...     If the payment is successful, the user shall be navigated to the Purchase Successfully screen.
    ...         + There shall be the Back to Your Plan button. The user clicks this button to navigate to the Your Plan screen.
    ...     If the payment is failed, the user shall stay on the payment page.
    ...     This button is disabled until the user fills in all the required fields.
    ...     There shall be a Back button for the user to back to the Your Plan screen. Biosphere plan shall renew automatically.
    [Tags]  ECOM-PLANPURCHASING-PURCHASEBOPSPHERE-01    ECOM-SRS-06-FRS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-PLANPURCHASING-CANCELBOPSPHERE-01: Cancel Biosphere+ Membership
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - User has registered Biosphere+ Membership
    ...
    ...     Test Steps:
    ...     - 1. Click "Cancel subscription" button
    ...     - 2. Click "Cancel subscription" button
    ...
    ...     Expected Output:
    ...     - 1. The Cancel Biosphere+ modal shall display
    ...     - 2. The subscription shall be canceled and another modal shall appear:
    ...         + Back to Your Plan button. When the user clicks this button, the modal will close and the page will display the Your Plan screen.
    ...         + There shall be the Keep Plan button. Clicking this button, the modal will close without any change and the page will display the Your Plan screen.
    ...         + The user can see the X icon button, by clicking this the modal will close and the page will display the Your Plan screen.
    ...         + The user would still be able to experience Biosphere+ until the end of their billing period.
    ...         + The user shall receive a notification email after canceling.
    [Tags]  ECOM-PLANPURCHASING-CANCELBOPSPHERE-01    ECOM-SRS-06-FRS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-PLANPURCHASING-CONTINUEBOPSPHERE-01: Continue Biosphere+ Membership
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - Biosphere+ Plan has expired
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Continue Biosphere+ button on the Expiration alert banner
    ...
    ...    Expected Output:
    ...     - 1. Clicks the Continue Biosphere+ button on the Expiration alert banner
    [Tags]  ECOM-PLANPURCHASING-CONTINUEBOPSPHERE-01    ECOM-SRS-06-FRS-03-2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library    project_bioheart_ecommerce/lib/web/Common.py    ${BROWSER_NODE}  ${ENV}
    Set Suite Variable  ${BROWSER_NODE}
    ${VERSION}      Navigate To Bioheart Ecommerce Page
    Set Suite Metadata    version   ${VERSION}
    Set Suite Metadata    browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

