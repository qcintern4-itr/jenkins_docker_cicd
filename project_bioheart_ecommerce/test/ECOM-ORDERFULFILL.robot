*** Settings ***
Documentation   Bioheart e-commerce order fullfil test suite
Metadata        sid     ECOM-ORDERFULFILL
Metadata        owner   Tan Pham
Library         corelib/AssertionExtension.py
Library         corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
#Library         project_bioheart_ecommerce/lib/web/Common.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      ECOM-ORDERFULFILL       web
Test Timeout    1h

*** Test Cases ***
ECOM-ORDERFULFILL-CREATEORDERID-01: Create a Sale Order ID
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - Sigined the Bioheart e-commerce
    ...
    ...     Test Steps:
    ...    - 1. Navigate to Bioheart e-commerce
    ...    - 2. Add product to cart
    ...    - 3. Click on checkout button
    ...    - 4. Click on the Pay now button
    ...
    ...     Expected Output:
    ...    - 4. - The system will automatically generate one Sale Order ID
    ...         - The Sale Order ID format is [XXXXXX], shall be generated in ascending order and begin with 000001
    [Tags]  ECOM-ORDERFULFILL-CREATEORDERID-01     ECOM-SRS-03-FRS-01-1    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-ORDERFULFILL-ORDERIDSTATUS-01: Send Order Requested
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - The customer has successfully made the payment on the Bioheart shop
    ...
    ...     Test Steps:
    ...    - 1. Check mail from the service team's email address
    ...    - 2. Click on "link" to check order
    ...
    ...     Expected Output:
    ...    - 1. The system shall send the requested order to the Service team’s email address: orders@bioheart.com
    ...         The email format shall be as followed:
    ...             + Recipient
    ...             + Subject
    ...             + Content
    ...             + ORDER SUMMARY
    ...                 . Sale Order ID
    ...                 . Order placed
    ...                 . Device model
    ...                 . Quantity
    ...                 . Pricing
    ...                 . Please kindly check the order list and proceed accordingly via this link: <LINK>
    ...    - 2. Navigate to Support Portal
    [Tags]  ECOM-ORDERFULFILL-ORDERIDSTATUS-01     ECOM-SRS-03-FRS-02-1    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-ORDERFULFILL-ORDERIDSTATUS-02: Send Order Received
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - The customer has successfully made the payment on the Bioheart shop
    ...
    ...     Test Steps:
    ...    - 1. Check mail from the customer's email address
    ...
    ...     Expected Output:
    ...    - 1. The system shall send the requested order to the Service team’s email address: orders@bioheart.com
    ...         The email format shall be as followed:
    ...             + Recipient: [customer's email addess]
    ...             + Subject: Order Received
    ...             + Content
    ...             + ORDER SUMMARY
    ...                 . Sale Order ID
    ...                 . Order placed
    ...                 . Device model
    ...                 . Quantity
    ...                 . Pricing
    ...             + Once your package ships, we will send you an email with a tracking number
    ...               and link so you can see the movement of your package
    ...             + If you have any questions, contact us here or call us at
    [Tags]  ECOM-ORDERFULFILL-ORDERIDSTATUS-02     ECOM-SRS-03-FRS-02-2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-ORDERFULFILL-ORDERIDSTATUS-03: Create shipment
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - The customer has successfully made the payment on the Bioheart shop
    ...
    ...     Test Steps:
    ...    - 1. Transfer ticket shall be marked as “In Delivery” status on the Support Portal
    ...
    ...     Expected Output:
    ...    - 1. The system shall send an email to the customer with the shipment label attached
    ...         The email format shall be as followed:
    ...             + Recipient: [customer's email address]
    ...             + Subject: Your order [sales order ID] is on the way!
    ...             + Content
    ...             + Your order [sales order ID] is on the way!
    ...             + You can follow it by visting the link here: [Order Tracking Details]
    ...             + Your order is delivered to: [User's addess]
    [Tags]  ECOM-ORDERFULFILL-ORDERIDSTATUS-03     ECOM-SRS-03-FRS-02-3    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-ORDERFULFILL-ORDERIDSTATUS-04: Successfully delivery for customer
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - The customer has successfully made the payment on the Bioheart shop
    ...
    ...     Test Steps:
    ...    - 1. Transfer ticket shall be marked as “Delivered” status on the Support Portal
    ...
    ...     Expected Output:
    ...    - 1. The system sends an email to the customer to notify that the delivery was successful
    ...         The email format shall be as followed:
    ...             + Recipient: [customer’s email address]
    ...             + Subject: Thank you!
    ...             + Content
    [Tags]  ECOM-ORDERFULFILL-ORDERIDSTATUS-04     ECOM-SRS-03-FRS-02-4    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-ORDERFULFILL-ORDERIDSTATUS-04-01: Successfully delivery for services team
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - The customer has successfully made the payment on the Bioheart shop
    ...
    ...     Test Steps:
    ...    - 1. Transfer ticket shall be marked as “Delivered” status on the Support Portal
    ...
    ...     Expected Output:
    ...    - 1. The system sends an email to the Services team to notify that the delivery was successful
    ...         The email format shall be as followed:
    ...             + Recipient: orders@bioheart.com
    ...             + Subject: Order [Sale order ID] delivered successfully!
    ...             + Content:
    ...                 "Hi,
    ...                 The order [Sale order ID] has been delivered successfully!
    ...                 Please kindly check the transfer ticket and manually change ticket status to Completed via this link: <link>
    ...                 Best regards,
    ...                 Biotricity team."
    [Tags]  ECOM-ORDERFULFILL-ORDERIDSTATUS-04-01     ECOM-SRS-03-FRS-02-4    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-ORDERFULFILL-ORDERIDSTATUS-05: Customer receive email cancel order
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - The customer has successfully made the payment on the Bioheart shop
    ...
    ...     Test Steps:
    ...    - 1. Click on "Track my order"
    ...    - 2. Click on "Cancel order" button
    ...
    ...     Expected Output:
    ...    - 1. When the user confirms cancel an order, there shall be an email sent to the user to inform them about this action
    ...         Email content template:
    ...             + Recipient
    ...             + Subject: [Biotricity] Order canceled!
    ...             + Content:
    ...                 "Dear our beloved customer,
    ...                  Your order [order id] is canceled. You will receive an a refund for your purchase within a few weeks.
    ...                  You can still visit our shop to purchase a new order.
    ...                  If you have any questions, contact us here:
    ...                  ecomsupport@biotricity.com
    ...                  or call us at:
    ...                  +1-585-414-7407
    ...                  Best regards,
    ...                  Biotricity team."

    [Tags]  ECOM-ORDERFULFILL-ORDERIDSTATUS-05     ECOM-SRS-03-FRS-02-5    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-ORDERFULFILL-ORDERIDSTATUS-06: Email cancel for biotricity
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - The customer has successfully made the payment on the Bioheart shop.
    ...
    ...     Test Steps:
    ...    - 1. Click on "Track my order"
    ...    - 2. Click on "Cancel order" button
    ...
    ...     Expected Output:
    ...    - 1. When the user confirms cancel an order, there shall be an email sent to the service's team to inform them about this action.
    ...         Email content template:
    ...         + Recipient: orders@bioheart.com
    ...         + Subject: [Biotricity] Order canceled notification
    ...         + Content:
    ...             "Hi,
    ...              This email is to notify that you have an order canceled from [user's email address], [Frist Name + Last Name]."
    ...         + ORDER SUMMARY
    ...             . Sale Order ID: XXXXXX
    ...             . Order Canceled: [The date the order is canceled]
    ...             . Device model
    ...             . Quantity
    ...             . Pricing
    ...             . Reason for cancelation: (for each reason, there shall be 1 row in the email)
    ...             . Best regard,
    ...             . Biotricity team.
    [Tags]  ECOM-ORDERFULFILL-ORDERIDSTATUS-06     ECOM-SRS-03-FRS-02-6    manual
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
