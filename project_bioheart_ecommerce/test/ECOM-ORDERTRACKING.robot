*** Settings ***
Documentation   Bioheart e-commerce order tracking test suite
Metadata        sid     ECOM-ORDERTRACKING
Metadata        owner   Tan Pham
Library         corelib/AssertionExtension.py
Library         corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
#Library         project_bioheart_ecommerce/lib/web/Common.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      ECOM-ORDERTRACKING       web
Test Timeout    1h

*** Test Cases ***
ECOM-ORDERTRACKING-ORDERCARD-01: View order card
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - Sigined the Bioheart e-commerce
    ...         - Checkout successfully
    ...
    ...     Test Steps:
    ...    - 1. Navigate to Bioheart e-commerce
    ...    - 2. Click on "Option" button
    ...    - 3. Click on "Track my orders" button
    ...    - 4. View card
    ...
    ...     Expected Output:
    ...    - 3. - Navigate to the All orders page
    ...    - 4. - Each order is displayed as a card that contains the following information:
    ...             + Order's items:
    ...                 * Display the first items in the order as the title
    ...                 * There shall be a text line: “and [number of remaining items in the order] more items”
    ...                 * If the [number of remaining items in the order] = 0, this line shall not display
    ...             + Order ID: format is [XXXXXX], shall be generated in ascending order and begin with 000001
    ...             + Order status:
    ...                 * Order received: This is the status when the order is created. There shall be an order received date under the status
    ...                 * Out for delivery: When the shipment label is created in the S&D portal the order shall change the status to Out for delivery.
    ...                 * Multi-transporters: If 2 or more shipment labels in one order
    ...                 * Delivered: When the status of all the Delivery details is Delivered
    ...                 * Order completed: When the transfer ticket of this order is marked completed on the S&D portal
    ...                 * Cancelled: When the user cancels the order
    ...             + Total price of the order (without shipping fee)
    ...             + Order received time: the time that the Sales Order ID is created
    [Tags]  ECOM-ORDERTRACKING-ORDERCARD-01     ECOM-SRS-04-FRS-01-1    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-ORDERTRACKING-ORDERDETAIL-01: View order detail information
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - Sigined the Bioheart e-commerce Checkout successfully
    ...
    ...     Test Steps:
    ...    - 1. Navigate to Bioheart e-commerce
    ...    - 2. Click on the menu icon
    ...    - 3. Click "Track my orders"
    ...    - 4. Click any order
    ...    - 5. Verify order detail information
    ...
    ...     Expected Output:
    ...    - 3. - Navigate to the All orders page
    ...    - 5. - There shall be a Delivery details section which contain:
    ...             + Order received. This is the status when the order is created. There shall be an order received date under the status.
    ...             + Order ID: format is [XXXXXX], shall be generated in ascending order and begin with 000001Out for delivery: When the shipment label is created in the S&D portal the order shall change the status to Out for delivery.
    ...                 * A View detail button shall display. The user can click this button to navigate to the delivery detail of that delivery page.
    ...                 * When the status is Out for delivery there shall be an Estimated delivery: [month] [day] section displayed.
    ...                 * There shall be a timeline showing up.
    ...                 * Each delivery detail shall map with a shipment label. The number of delivery detail shall match the number of shipment labels.
    ...                 * The items of each delivery detail shall map with the corresponding shipment label.
    ...                 * There shall be a Tracking number under the title Delivery details.
    ...             + Delivered: When the status of the corresponding shipment label is Delivered.
    ...         - The Shipping to section shall display the information of that order which contain:
    ...             + User name
    ...             + Phone number
    ...             + Email
    ...             + Address
    ...             + Secondary address
    ...        - There shall be a Pricing section that contain:
    ...             + Subtotal (number of items in the order): [value of all items].
    ...             + Total: Sum of subtotal and shipping.
    ...             + The shipping shall be Free.
    ...        - The user can click on the All orders button to navigate to the All orders page.
    ...        - When the order status is order completed and there is no shipment label created, the order detail screen will display the order completed screen.
    [Tags]  ECOM-ORDERTRACKING-ORDERDETAIL-01     ECOM-SRS-04-FRS-02-1    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-ORDERTRACKING-ORDERDETAIL-02: View delivery detail information
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...         - Sigined the Bioheart e-commerce
    ...         - Checkout successfully
    ...         - Orders are In delivery status
    ...
    ...     Test Steps:
    ...    - 1. Navigate to Bioheart e-commerce
    ...    - 2. Click on the menu icon
    ...    - 3. Click "Track my orders"
    ...    - 4. Click order are In delivery status
    ...    - 5. Verify order detail information
    ...
    ...     Expected Output:
    ...    - 5. - There shall be a Shipment information section that contains:
    ...             + Delivery method
    ...             + Carrier
    ...             + Tracking
    ...         - There shall be a Delivery timeline.
    ...             + Each item in the timeline will contain
    ...                 * Status
    ...                     i. Transit
    ...                     ii. Delivered
    ...                 * Time: mm-ddd-yyyy, hh:mm
    ...                 * Place
    ...                 * Description
    ...             + These information shall be updated from the S&D portal.
    [Tags]  ECOM-ORDERTRACKING-ORDERDETAIL-02    ECOM-SRS-04-FRS-02-2    manual
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
