*** Settings ***
Documentation   Bioheart e-commerce profile test suite
Metadata        sid     ECOM-PROFILE
Metadata        owner   Tan Pham
Library         corelib/AssertionExtension.py
Library         corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
#Library         project_bioheart_ecommerce/lib/web/Common.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      ECOM-PROFILE       web
Test Timeout    1h

*** Test Cases ***
ECOM-PROFILE-VIEWPROFILE-01: View Your Profile
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user has completed the profile.
    ...
    ...     Test Steps:
    ...     - 1. Click on the Your Profile tab
    ...
    ...     Expected Output:
    ...     - 1. The user shall be navigated to the Your Profile screen
    ...        - There shall be 3 main sections displayed on this screen:
    ...             + Profile section, there shall be the following information:
    ...                 ++. User’s avatar
    ...                 ++. User’s name
    ...                 ++. Basic info (containing gender, height, and weight)
    ...                 ++. Date of birth
    ...                 ++. Country
    ...                 ++. Address
    ...                 ++. Phone number
    ...                 ++. Tax ID
    ...             + Insurance section, there shall be the following information:
    ...                 ++. Payment type
    ...                 ++. Insurance name
    ...                 ++. Provincial billing
    ...                 ++. Expiration date
    ...             + Medical section, there shall be the following information:
    ...                 ++. Conditions
    ...                 ++. Allergies
    ...        - There shall be an edit button Icon at the top-right corner of each section, by clicking this button
    ...         the user shall be navigated to the Edit screen of that section.
    ...        - If any field in the section does not have any information, that field shall display “--“.
    ...        - If the user has not completed the profile in the Biotricity application, the page shall display.
    [Tags]  ECOM-PROFILE-VIEWPROFILE-01    ECOM-SRS-05-FRS-01-1    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-PROFILE-EDITPROFILE-01: Edit Avatar
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user has completed the profile.
    ...
    ...     Test Steps:
    ...     - 1. Click on Edit Avatar section on the Your profile screen
    ...     - 2. Click on Change picture button
    ...     - 3. Click on Remove picture button
    ...
    ...     Expected Output:
    ...     - 2. Clicking this button, the Change profile picture modal shall display. In the modal:
    ...         * There shall be an Upload image button. Choose a picture from the device by clicking this button.
    ...         * Image with maximum size 2 Mb, If the user chooses an image with size 2Mb, there shall be an alert message “Image format.
    ...           Maximum size 2Mb” displayed under the Upload image button.
    ...         * There shall be a Save Change button. This button is disabled until the user chooses a picture.
    ...         * Clicking the Save Change button, all the changes of the user shall be saved, and navigate the user to the Your profile screen.
    ...         * There shall be an X icon button. Clicking this button, the user shall be navigated to the Your Profile screen without saving.
    ...     - 3. Clicking this button, the avatar shall return the default avatar image.
    [Tags]  ECOM-PROFILE-EDITPROFILE-01    ECOM-SRS-05-FRS-02-1    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-PROFILE-EDITPROFILE-02: Edit Profile
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user has completed the profile.
    ...
    ...     Test Steps:
    ...     - 1. Click the Edit button on the Profile section
    ...
    ...     Expected Output:
    ...     - 1. There shall be a Basic info section, in this section the user shall be able to edit the following information:
    ...         +. First name
    ...         +. Last name
    ...         +. Date of birth
    ...             * Clicking this shall display a modal with a scrolling picker for the user to choose the date of birth.
    ...         +. Email: the user cannot edit this field.
    ...         +. Gender: there shall be a radio button for the user to choose the gender
    ...         +. Measurement unit: The user can only choose one, if the user chooses the other one the measurement unit will change.
    ...             Depending on which button is clicked the screen shall display different height and weight tabs (Default Imperial).
    ...         +. Scenario 1: Imperial (ft, lb)
    ...             * Height card: The user shall be able to enter a text in the input box.
    ...             * Weight bar: The user shall be able to enter a text in the input box.
    ...         +. Scenario 2: Metric (cm, kg):
    ...             * Height bar: The user shall be able to enter a text in the input box.
    ...             * Weight card: The user shall be able to enter a text in the input box.
    ...         +. This section is required if the user has not completed the profile.
    ...     - There shall be a Contact info section, in this section the user shall be able to edit the following information:
    ...         +. Country: Click on this shall open a drop-down containing the list of all countries:
    ...             * Default: United State
    ...             * The user shall be able to scroll on the drop-down list and click on 1 country to select. After clicking, the drop-down list shall be closed.
    ...             * Each country shall have a phone code.
    ...             * The user can search for the country name on this screen.
    ...             * The user can select ONLY ONE country, he can change his selection.
    ...             * If the user edits the country after inputting other fields, all the inputted data will be deleted, and the user must input them again.
    ...         +. Address:
    ...             * The user shall be able to enter a text in the input box.
    ...             * There shall be address suggestions from the system which the user can select and the address shall populate to address city, state, and zip code fields.
    ...             * If the system cannot find the suitable city, state, or zip code with what the user input, that field will be empty.
    ...             * If there is no internet connection during this duration, there shall be a snack bar.
    ...         +. City:
    ...             * City’s name is automatically input when the user enters their address or city.
    ...             * The user shall be able to enter a text in the input box.
    ...             * There shall be city suggestions from the system which the user can select, and the city shall populate to city, state, and zip code fields.
    ...         +. State:
    ...             * State’s name is automatically input when the user enters their address or city.
    ...             * The user shall be able to enter a text in the input box.
    ...             * There shall be state suggestions from the system which the user can select.
    ...         +. Zip code:
    ...             * Zip code is automatically input when the user enters their address.
    ...             * The user shall be able to enter a valid digit number in the input box.
    ...         +. Phone number:
    ...             * The user shall be able to enter a maximum of 15 numbers in the input box.
    ...             * The Phone code value shall be as same as the phone code of the selected country. When the user changes the country, the phone code shall change also.
    ...             * Phone number format shall remain despite the change of phone code.
    ...             * This field is required.
    ...         +. Tax ID:
    ...             * The user shall be able to enter 9 numbers in the input box.
    ...             * The Tax ID code value shall be as same as the Tax ID code of the selected country. When the user changes the country, the Tax ID code shall change also.
    ...             * If the country has no Tax ID, this field will not display.
    ...             * If the country has more than one Tax ID, the user can select the Tax ID he wants.
    ...             * Tax ID number format shall remain despite the change of Tax ID code.
    ...     - There shall be a Save button, by clicking this button all the changes of the user shall be saved and navigate the user to the Your profile screen.
    ...         +. If the user clicks this button without inputting one or many fields in the basic info section, there shall be a message to remind fields are required.
    ...         +. If the user empties the phone number section, there shall be a message: “Please complete all required fields”.
    ...         +. If the user inputs less than 3 numbers or more than 15 numbers in the phone field, there shall be a message to inform invalid. This message shall also appear if the user inputs the incorrect phone number.
    ...         +. If the user inputs less or more than 9 numbers in the Tax ID field, there shall be a message to inform invalid. This message shall also appear if the user inputs incorrect ID.
    ...     - There shall be an X button, by clicking this button shall navigate the user to the Your profile screen without saving.
    ...     - There shall be a Cancel button, by clicking this button, the user shall be navigated to the Your profile screen without saving.
    [Tags]  ECOM-PROFILE-EDITPROFILE-02    ECOM-SRS-05-FRS-02-1    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-PROFILE-ADDINSURANCE-01: Add Insurance
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user has completed the profile.
    ...
    ...     Test Steps:
    ...     - 1. Click on the Edit button on the Insurance section
    ...     - 2. Select a type: Insurance
    ...     - 3. Fill in the information
    ...     - 4. Click "Save" button
    ...
    ...     Expected Output:
    ...     - 1. The user shall be navigated to the Edit Insurance screen
    ...     - 2. The screen shall display more fields:
    ...         - Insurance name: Clicking on this field, the user can select insurance in the list. This field is required.
    ...         - Expiration date (The user can input the date in this field).
    ...             + If the patient’s nationality is not American, the app shall display the following information:
    ...                 ++ Insurance name (text input)
    ...                 ++ Provincial billing
    ...                 ++ Expiration date
    ...             + If the patient’s nationality is American, clinic users shall be able to edit the following information
    ...             (Insurance name - a drop-down ( required), It can be one of the following options):
    ...                 ++ Private
    ...                 ++ Medicare
    ...                 ++ Medicaid
    ...                 ++ United Health
    ...                 ++ Kaiser
    ...                 ++ Anthem
    ...                 ++ Humana
    ...                 ++ Blue Cross
    ...                 ++ Agtna
    ...                 ++ Cigna
    ...                 ++ CVS
    ...                 ++ Molina
    ...                 ++ Other insurance
    ...         - Expiration date: The user can not select the date in the past and can select a maximum of 100 years in the future.
    ...         - All fields are optional, except for the Insurance name.
    ...         - The Save button should always enable, if a required field is empty, an error message shall display.
    ...         - The user can uncheck the selection, and this will be considered as no insurance information.
    ...         - If the user makes any change, the Save button shall appear.
    ...         - If the user clicks the Save button, all the updates shall be saved.
    ...             + If the information is updated successfully, there shall be a snack bar to inform the user: "Insurance has been updated successfully".
    ...             + If the information is failed to update due to the lack of internet connection, there shall be a snack bar to inform the user: "No internet connection. Please try again".
    ...             + If the information is failed to update due to any other reason, there shall be a snack bar to inform the user: "Something went wrong. Please try again".
    ...         - There shall be an X button, by clicking this button will navigate the user to the Your profile screen without saving.
    ...         - There shall be a Cancel button, by clicking this button, the user shall be navigated to the Your profile screen without saving.
    ...     - 4. After clicking the Save button, all the information shall display on the insurance information screen:
    ...         - Insurance Title
    ...         - Edit button
    ...         - Payment type:
    ...             + Insurance
    ...             + Cash or Credit card
    ...         - Insurance name
    ...         - Expiration date: mm/dd/yyyy
    ...             + Display “--“, if the user did not input this field.
    ...         - If the payment type is Cash or Credit card, the Insurance name, and Expiration date shall not be displayed.
    [Tags]  ECOM-PROFILE-ADDINSURANCE-01    ECOM-SRS-05-FRS-03-1    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-PROFILE-EDITINSURANCE-01: Edit Insurance
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user has completed the profile.
    ...
    ...     Test Steps:
    ...     - 1. Click on the Edit button on the Insurance section
    ...
    ...     Expected Ouput:
    ...     - 1. The information screen refers to Add insurance.
    [Tags]  ECOM-PROFILE-EDITINSURANCE-01    ECOM-SRS-05-FRS-03-2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-PROFILE-ADDMEDICAL-01: Add medical conditions
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user has completed the profile.
    ...
    ...     Test Steps:
    ...     - 1. Click on the Edit button on the Medical Conditions section
    ...
    ...     Expected Output:
    ...     - 1. The user shall be navigated to the Add medical conditions screen, inclued:
    ...         + There shall be a search bar for medical conditions
    ...             ++ When the user inputs the name of the medical condition, there shall be a drop-down list of suggestions.
    ...             ++ On each suggestion, there shall be a button to add the medical condition.
    ...             ++ If there is no medication match what the user type in:
    ...                 * The app shall recommend the most similar medication.
    ...                 * Suggestion shall display: “Use “name of the medication” anyway”.
    ...             ++ By clicking on a result, the user can add a medical condition and close the drop-down list.
    ...         + The user can remove a condition by clicking on the x button.
    ...         + Allergies text input field.
    ...         + The Save button shall appear if there is any change.
    ...           By tapping on this button, all the medical conditions and allergies shall be saved, and the user navigate to the Medical Conditions screen.
    ...         + There shall be an X button, by clicking this button:
    ...             ++ If there is any change, the app shall display a modal.
    ...                 * The modal has a message as design.
    ...                 * Save changes button, clicking will navigate to Your profile screen and save.
    ...                 * Cancel button, clicking will navigate to Your profile screen without saving.
    ...             ++ If not, the user shall be navigated back to Your Profile screen.
    ...         + There shall be a Cancel button, by clicking this button:
    ...             ++ The user shall be navigated to the Your profile screen and nothing changes.
    ...         + All the results shall display on the medical conditions screen.
    [Tags]  ECOM-PROFILE-ADDMEDICAL-01    ECOM-SRS-05-FRS-04-1    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

ECOM-PROFILE-EDITMEDICAL-01: Edit Medical Conditions
    [Documentation]     Author: Tan Pham
    ...
    ...     Pre-condition:
    ...     - The user has completed the profile.
    ...
    ...     Test Steps:
    ...     - 1. Click on the Edit button on the Medical Conditions section
    ...
    ...     Expected Ouput:
    ...     - 1. The information screen refers to Add medical conditions.
    [Tags]  ECOM-PROFILE-EDITMEDICAL-01    ECOM-SRS-05-FRS-04-2    manual
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
