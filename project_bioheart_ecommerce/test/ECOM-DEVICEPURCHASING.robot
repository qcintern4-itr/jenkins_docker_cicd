*** Settings ***
Documentation   Bioheart e-commerce deviece purchasing test suite
Metadata        sid     ECOM-DEVICEPURCHASING
Metadata        owner   Tan Pham
Library         corelib/AssertionExtension.py
Library         corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
#Library         project_bioheart_ecommerce/lib/web/Common.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      ECOM-DEVICEPURCHASING      web
Test Timeout    1h

*** Test Cases ***
ECOM-DEVICEPURCHASING-HOMESTORE-01: View the header
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - The user has not signed in
    ...
    ...     Test Steps:
    ...    - 1. Navigate to Bioheart e-commerce
    ...    - 2. Click on the Bioheart Logo
    ...    - 3. Click on the Sign in button
    ...
    ...     Expected Output:
    ...    - 1. The Bioheart e-commerce page contain:
    ...         + Bioheart Logo
    ...         + Cart button displaying the number of items in the cart
    ...         + Sigin in button
    ...    - 2. Navigate to the home screen page
    ...    - 3. Navigate to the Sign in screen.
    [Tags]  ECOM-DEVICEPURCHASING-HOMESTORE-01     ECOM-SRS-02-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-DEVICEPURCHASING-HOMESTORE-02: View the header
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - The customer is visiting the Bioheart e-commerce landing page
    ...
    ...     Test Steps:
    ...    - 1. Navigate to Bioheart e-commerce
    ...    - 2. Click on the Bioheart Logo
    ...    - 3. Click on the option button
    ...    - 4. Click on the My profile option
    ...    - 5. Click on the Track my order option
    ...    - 6. Click on the Sign out option
    ...
    ...     Expected Output:
    ...    - 1. The Bioheart e-commerce page contain:
    ...         + Bioheart Logo
    ...         + Cart button displaying the number of items in the cart
    ...         + Sigin in button
    ...  - 2. Navigate to the home screen page
    ...  - 3. The drop-down displyed three option
    ...         + My profile
    ...         + Track my order
    ...         + Sigin Out
    ...  - 4. Redirect to the "Account overview" page
    ...  - 5. Redirect to the "Track my orders" page
    ...  - 6. Pop up the "Sign out" and stay on the same page
    [Tags]  ECOM-DEVICEPURCHASING-HOMESTORE-02     ECOM-SRS-02-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-DEVICEPURCHASING-HOMESTORE-03: View the footer bar
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - The customer is visiting the Bioheart e-commerce landing page
    ...
    ...     Test Steps:
    ...    - 1. Navigate to Bioheart e-commerce
    ...
    ...     Expected Output:
    ...    - 1. The footer of the page includes:
    ...         + Home link
    ...         + FAQ link
    ...         + Privacy Policy link
    ...         + Company link
    ...         + Device link
    ...         + Support link
    ...         + Terms of Use link
    [Tags]  ECOM-DEVICEPURCHASING-HOMESTORE-03    ECOM-SRS-02-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-DEVICEPURCHASING-HOMESTORE-04: View Biosphere banner
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - The customer is visiting the Bioheart e-commerce landing page
    ...
    ...     Test Steps:
    ...    - 1. Navigate to Bioheart e-commerce
    ...
    ...     Expected Output:
    ...    - 1. - The Biosphere+ subscription is displayed as design
    [Tags]  ECOM-DEVICEPURCHASING-HOMESTORE-04    ECOM-SRS-02-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-DEVICEPURCHASING-PRODUCTDETAIL-05: View Product list
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - The customer is visiting the Bioheart e-commerce landing page
    ...
    ...     Test Steps:
    ...    - 1. Navigate to Bioheart e-commerce
    ...    - 2. Click on "Buy it now" button
    ...    - 3. Click on "Close" button
    ...    - 4. Click on "Add to cart" Button
    ...
    ...     Expected Output:
    ...    - 1. List of product is displayed:
    ...         + An image of the product.
    ...         + The name of the product
    ...         + The price of the product
    ...         + A description of the product
    ...         + The "Buy it now" button
    ...         + The "Add to cart" button
    ...    - 2. Modal "Check out" shall be opened
    ...    - 3. Modal "Check out" shall be closed
    ...    - 4. Modal "Add to cart" shall be opened

    [Tags]  ECOM-DEVICEPURCHASING-PRODUCTDETAIL-05    ECOM-SRS-02-FRS-01   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-DEVICEPURCHASING-PRODUCTDETAIL-06: Modal select detail of product
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - Navigate to Bioheart e-commerce
    ...         - Product: Bioheart Bundle
    ...
    ...     Test Steps:
    ...    - 1. Click on "Add to cart" button
    ...    - 2. Hover in "Annual" button
    ...    - 3. Click on "X" button'
    ...    - 4. Click on "Buy it now" button
    ...
    ...     Expected Output:
    ...    - 1. The badge of Seclect a plan is showed "save 2 months" in 3 seconds and
    ...         The modal is displayed with components:
    ...             + The name of product: Bioheart Bundle
    ...             + The price of the product: $298.00
    ...             + A message "You only add one Bioheart Bundle to each order"
    ...             + Select a plan:
    ...                 . Annual: Price $99.00/year (default)
    ...                 . Monthly. Price $9.99/month
    ...             + Choose strap size:
    ...                 . Small: 25.5" - 33.5" | 60cm - 80cm
    ...                 . Medium: 29.5" - 41.3" | 70cm - 100cm (default)
    ...                 . Large: 40.35" - 63.0" | 102.5cm - 160cm
    ...                 . Text "Measure yourchest to pick the right size"
    ...                 . Description size
    ...             + The "Add to cart" button
    ...             + The "X" button
    ...    - 2. The badge of Seclect a plan is showed with text "save 2 months"
    ...    - 3. The modal shall be closed
    ...    - 4. The modal is displayed with format:
    ...             + The price of the product
    ...             + A message "You only add one Bioheart Bundle to each order".
    ...             + Select a plan:
    ...                 . Annual: Price $99.00/year (default)
    ...                 . Monthly. Price $9.99/month
    ...             + Choose strap size:
    ...                 . Small
    ...                 . Medium (default)
    ...                 . Large
    ...                 . Text "Measure yourchest to pick the right size"
    ...                 . Description size
    ...             + The "Check out" button
    ...             + The "X" button
    [Tags]  ECOM-DEVICEPURCHASING-PRODUCTDETAIL-06    ECOM-SRS-02-FRS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-DEVICEPURCHASING-PRODUCTDETAIL-07: Modal select detail of product
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - Navigate to Bioheart e-commerce
    ...         - Product: Bioheart Bundle
    ...
    ...     Test Steps:
    ...    - 1. Click on "Add to cart" button
    ...    - 2. Hover in "Annual" button
    ...    - 3. Click on "X" button'
    ...    - 4. Click on "Buy it now" button
    ...
    ...     Expected Output:
    ...     - 1. The badge of Seclect a plan is showed "save 2 months" in 3 seconds
    ...          The modal is displayed with components:
    ...             + The name of product: Bioheart Bundle
    ...             + The price of the product: $298.00
    ...             + A message "You only add one Bioheart Bundle to each order"
    ...             + Select a plan:
    ...                 . Annual: Price $99.00/year (default)
    ...                 . Monthly. Price $9.99/month
    ...             + Choose strap size:
    ...                 . Small: 25.5" - 33.5" | 60cm - 80cm
    ...                 . Medium: 29.5" - 41.3" | 70cm - 100cm (default)
    ...                 . Large: 40.35" - 63.0" | 102.5cm - 160cm
    ...                 . Text "Measure yourchest to pick the right size"
    ...                 . Description size
    ...             + The "Add to cart" button
    ...             + The "X" button
    ...     - 2. The badge of Seclect a plan is showed with text "save 2 months"
    ...     - 3. The modal shall be closed
    ...     - 4. The modal is displayed with format:
    ...             + The price of the product
    ...             + A message "You only add one Bioheart Bundle to each order"
    ...             + Select a plan:
    ...                 . Annual: Price $99.00/year (default)
    ...                 . Monthly. Price $9.99/month
    ...             + Choose strap size:
    ...                 . Small
    ...                 . Medium (default)
    ...                 . Large
    ...                 . Text "Measure yourchest to pick the right size"
    ...                 . Description size
    ...             + The "Check out" button
    ...             + The "X" button
    [Tags]  ECOM-DEVICEPURCHASING-PRODUCTDETAIL-07    ECOM-SRS-02-FRS-02   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-DEVICEPURCHASING-PRODUCTDETAIL-08: Modal select detail of product
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - Navigate to Bioheart e-commerce
    ...         - Product: Bioheart Charger
    ...
    ...     Test Steps:
    ...    - 1. Click on "Add to cart" button
    ...    - 2. Click on "X" button
    ...    - 3. Click on "Buy it now" button
    ...
    ...     Expected Output:
    ...    - 1. The modal is displayed with components:
    ...         + The name of product: Bioheart Charger
    ...         + The price of the product: $19.99
    ...         + Select quantity: 1 (Default)
    ...             . The user can change the quantity of each item in the cart by using the "+" or "–" button
    ...             . The "+" will add 1 unit, and the "–" button shall remove 1 unit
    ...             . The quantity can not be below 1
    ...         + The "Add to cart" button
    ...         + The "X" button
    ...    - 2. The modal shall be closed
    ...    - 3. The modal is displayed with format:
    ...         + The price of the product
    ...         + Select quantity: 1 (Default)
    ...         + The "Check out" button
    ...         + The "X" button
    [Tags]  ECOM-DEVICEPURCHASING-PRODUCTDETAIL-08    ECOM-SRS-02-FRS-02   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-DEVICEPURCHASING-ADDTOCART-09: View Add to cart/Check out
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - The Modal pop up
    ...     Test Steps:
    ...    - 1. Click on "Add to cart" button
    ...    - 2. Click on "X" button
    ...    - 3. Click on "Check out" button
    ...
    ...     Expected Output:
    ...    - 1. The product shall be selected to the cart
    ...    - 2. The modal shall be closed
    ...    - 3. Navigate to check out process screen.
    [Tags]  ECOM-DEVICEPURCHASING-ADDTOCART-09    ECOM-SRS-02-FRS-03   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-DEVICEPURCHASING-ADDTOCART-10: Add an item to the cart
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...    - 1. Navigate to Bioheart e-commerce
    ...    - 2. Click on "Add to cart" button
    ...    - 3. Click on "Add to cart" button
    ...    - 4. Click reload page
    ...
    ...     Expected Output:
    ...    - 2. The modal shall be displayed
    ...    - 3. The items shall be added to the cart
    ...         The system updates the number of items in the shopping cart in the header of the website
    ...    - 4. The cart shall be remained
    [Tags]  ECOM-DEVICEPURCHASING-ADDTOCART-10    ECOM-SRS-02-FRS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-DEVICEPURCHASING-ADDTOCART-11: View cart - Bioheart Bundle
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...    - 1. Navigate to Bioheart e-commerce
    ...    - 2. Click on Cart button
    ...
    ...     Expected Output:
    ...    - 2. The right sidebar will be showed list of all items in the cart with components:
    ...         - Each item in the cart includes:
    ...             + Item name
    ...             + Item image
    ...             + Item price
    ...             + Plan: Annual / Monthly
    ...             + Strap size
    ...         - The "Remove" button
    ...         - The "X" button located in the top right corner of the sidebar
    ...         - Price subtotal (all items)
    ...         - Price shipping
    ...         - Price in total
    ...         - The "Checkout" button
    [Tags]  ECOM-DEVICEPURCHASING-ADDTOCART-11    ECOM-SRS-02-FRS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-DEVICEPURCHASING-ADDTOCART-12: View cart - Bioheart Strap
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...    - 1. Navigate to Bioheart e-commerce
    ...    - 2. Click on Cart button
    ...
    ...     Expected Output:
    ...    - 2. The right sidebar will be showed list of all items in the cart with components:
    ...         - Each item in the cart includes:
    ...             + Item name
    ...             + Item image
    ...             + Item price
    ...             + Strap size
    ...             + Quantity selection
    ...                 . The "+" will add 1 unit, and the "–" button shall remove 1 unit
    ...                 . The quantity can not be below 1
    ...         - The "Remove" button
    [Tags]  ECOM-DEVICEPURCHASING-ADDTOCART-12    ECOM-SRS-02-FRS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-DEVICEPURCHASING-ADDTOCART-13: View cart - Bioheart Charger
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...    - 1. Navigate to Bioheart e-commerce
    ...    - 2. Click on Cart button
    ...
    ...     Expected Output:
    ...    - 2. The right sidebar will be showed list of all items in the cart with components:
    ...         - Each item in the cart includes:
    ...             + Item name
    ...             + Item image
    ...             + Item price
    ...             + Quantity selection
    ...                 . The "+" will add 1 unit, and the "–" button shall remove 1 unit
    ...                 . The quantity can not be below 1
    ...         - The "Remove" button
    [Tags]  ECOM-DEVICEPURCHASING-ADDTOCART-13    ECOM-SRS-02-FRS-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-DEVICEPURCHASING-CHECKOUT-01: Move to check out with user has not signed
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...    - 1. Navigate to Bioheart e-commerce
    ...    - 2. Click on checkout button
    ...    - 3. Sigin the web
    ...
    ...     Expected Output:
    ...    - 2. - The web shall navigate to the Sign in page
    ...    - 3. - The web shall redirect to the Check out page
    [Tags]  ECOM-DEVICEPURCHASING-CHECKOUT-01    ECOM-SRS-02-FRS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-DEVICEPURCHASING-CHECKOUT-02: Move to check out with user has signed
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - The user has added items to their cart
    ...         - The user has clicked the checkout button
    ...         - The user has signed in
    ...
    ...     Test Steps:
    ...    - 1. Sigin the web
    ...    - 2. Click on checkout button
    ...    - 3. Navigate to Bioheart e-commerce
    ...
    ...     Expected Output:
    ...    - 3. - The web shall navigate to the Checkout page with the selected items.
    [Tags]  ECOM-DEVICEPURCHASING-CHECKOUT-02    ECOM-SRS-02-FRS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-DEVICEPURCHASING-CHECKOUT-03: Back to home screen
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - The user has added items to their cart
    ...         - The user has clicked the checkout button
    ...         - The user has signed in
    ...
    ...     Test Steps:
    ...    - 1. Click on "Check out" button
    ...    - 2. Click on "Back" button
    ...
    ...     Expected Output:
    ...    - 1. The web shall be navigated to the Checkout page with the selected items
    ...    - 2. The web shall redirect to the Home page.
    ...         During this period there shall be a “Redirecting” screen
    [Tags]  ECOM-DEVICEPURCHASING-CHECKOUT-03    ECOM-SRS-02-FRS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-DEVICEPURCHASING-CHECKOUT-04: Shipping information
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - The user has added items to their cart
    ...         - The user has clicked the checkout button
    ...         - The user has signed in
    ...
    ...     Test Steps:
    ...    - 1. Click on checkout button
    ...
    ...     Expected Output:
    ...    - 1. - The checkout page includes:
    ...             + Shipping address section
    ...             + Order detail section
    ...             + Pay now button
    [Tags]  ECOM-DEVICEPURCHASING-CHECKOUT-04    ECOM-SRS-02-FRS-04   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-DEVICEPURCHASING-CHECKOUT-05: Shipping address section
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - The user has added items to their cart
    ...         - The user has clicked the checkout button
    ...         - The user has signed in
    ...
    ...     Test Steps:
    ...    - 1. Click on checkout button
    ...
    ...     Expected Output:
    ...    - 1. - The required to fill in the following information:
    ...             + First name
    ...             + Last name
    ...             + Email
    ...             + Country
    ...             + Address
    ...             + Secondary address (optional)
    ...             + City
    ...             + State
    ...             + Zipcode
    ...             + Phone number
    [Tags]  ECOM-DEVICEPURCHASING-CHECKOUT-05    ECOM-SRS-02-FRS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-DEVICEPURCHASING-CHECKOUT-06: Shipping information
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - The user has added items to their cart
    ...         - The user has clicked the checkout button
    ...         - The user has signed in
    ...
    ...     Test Steps:
    ...    - 1. Click on checkout button
    ...    - 2. Don't input any field
    ...
    ...     Expected Output:
    ...    - 1. The checkout process is initiated
    ...    - 2. The "Pay Now" button shall be disable
    [Tags]  ECOM-DEVICEPURCHASING-CHECKOUT-06    ECOM-SRS-02-FRS-04   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-DEVICEPURCHASING-CHECKOUT-07: Order detail section and Pay now button
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - The user has added items to their cart
    ...         - The user has clicked the checkout button
    ...         - The user has signed in
    ...
    ...     Test Steps:
    ...    - 1. Click on checkout button
    ...    - 2. Click on "Pay now" button
    ...
    ...     Expected Output:
    ...    - 1. All items the user has added is displayed with components:
    ...             + The name of the product
    ...             + Quantity
    ...             + Price of all items
    ...             + Shipping
    ...         The user can review the items, quantity, and total price before proceeding to checkout
    ...          * If there is a Bioheart Bundle in the order, there shall be a message
    ...          "You will receive a year Biosphere+ membership linked to this account."
    ...    - 2.  Proceed with the payment process
    ...          The payment process is securely handled by a third-party payment gateway Stripe
    ...          During redirecting duration, the web shall display the redirecting screen. Message: Redirecting...
    [Tags]  ECOM-DEVICEPURCHASING-CHECKOUT-07    ECOM-SRS-02-FRS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-DEVICEPURCHASING-CHECKOUT-08: Payment process successfully
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - The user has added items to their cart
    ...         - The user has clicked the checkout button
    ...         - The user has signed in
    ...
    ...     Test Steps:
    ...    - 1. Click on "Pay now" button
    ...    - 2. Click on the View your order
    ...    - 3. Click on the Continue shopping button
    ...
    ...     Expected Output:
    ...    - 1. There shall be a Sales Order ID created in the S&D portal
    ...         The web shall redirect to the Order completed page
    ...    - 2. The web shall redirect to the detail of that order on the Track my order page
    ...    - 3. The web  shall redirect to the Home store page
    ...         The Order ID shall be the same as the Sales Order ID created
    ...         During redirecting duration, the web shall display the redirecting screen. Message: Redirecting...
    [Tags]  ECOM-DEVICEPURCHASING-CHECKOUT-08    ECOM-SRS-02-FRS-04   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-DEVICEPURCHASING-CHECKOUT-09: Payment process fail
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - The user has added items to their cart
    ...         - The user has clicked the checkout button
    ...         - The user has signed in
    ...
    ...     Test Steps:
    ...    - 1. Click on "Pay now" button
    ...    - 2. Click on "Back" button
    ...
    ...     Expected Output:
    ...    - 1. The user shall stay on the payment gateway
    ...    - 2. The user shall back to the Checkout page
    [Tags]  ECOM-DEVICEPURCHASING-CHECKOUT-09    ECOM-SRS-02-FRS-04   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-DEVICEPURCHASING-CHECKOUT-10: Payment process with accompanying services
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - The user has added items to their cart
    ...         - The user has clicked the checkout button
    ...         - The user has signed in
    ...
    ...     Test Steps:
    ...    - 1. Sigin the web
    ...    - 2. Navigate to Bioheart e-commerce
    ...    - 3. Click on checkout button
    ...    - 4. Click on the Pay now button
    ...
    ...     Expected Output:
    ...    - 4. - If there is a Bioheart Bundle in the order, the account that the user has used to place the order will receive 1-year Biosphere+ membership.
    ...             Initiate after the payment is successful.
    ...    - 5. - The payment information of the user will be saved on the Biosphere+ page.
    [Tags]  ECOM-DEVICEPURCHASING-CHECKOUT-10    ECOM-SRS-02-FRS-04-3    manual
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