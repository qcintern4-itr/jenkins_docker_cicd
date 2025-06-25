# Introduction
****Using Python Functions for Web Automation with Robot Framework****

# Project Structure
Currently, the project is structured as follows:
```
btcy-qa-tool-auto_fwk
└───corelib
│   │   WebHandler.py
│   │   ...
│
└───project_ai_report_portal
│   └───lib
│       └───web
│           │   Common.py
│           │   ...
│
└───project_callcenter_portal
│   └───lib
│       └───web
│           │   Common.py
│           │   ...
│
└───project_bioflux_clinic_portal
│   └───lib
│       └───web
│           │   Common.py
│           │   ...
│           
└───project_cardiac_portal
│   └───lib
│       └───web
│           │   Common.py
│           │   ...
│           
```

#### The WebHandler.py holds the core functions for web automation, and each project has its own Common.py file that holds the common functions for that project.
#### The Common.py simply imports the WebHandler.py file and uses its functions to perform web automation tasks.
#### Besides the Common.py file, the /web folder in each project also contains other Python files that hold the functions for that project. Ex: Reports.py, EcgEvent.py, etc.

## WebHandler.py
The **WebHandler** class is designed to encapsulate common Selenium WebDriver actions—such as opening and closing a browser, finding elements, clicking, sending keystrokes, dragging and dropping, waiting for elements, and executing complex UI interactions (e.g., hovering, context clicks, or JavaScript-based clicks). 

### Key Features

1. **Browser Control**  
   - Launches Chrome, Firefox, or Edge with optional headless mode.  
   - Manages window sizing and tab switching.

2. **Element Interaction**  
   - Provides methods to find single or multiple elements.  
   - Supports clicks (including JavaScript clicks), double-clicks, context-clicks, hovering, text inputs, file inputs, etc.

3. **Advanced Actions**  
   - Drag-and-drop, offset-based clicks, scrolling elements into view, toggling checkboxes, and more.  
   - Hovering over multiple elements with optional Ctrl-key clicks.

4. **Waits and Synchronization**  
   - Extensive coverage of Selenium’s explicit wait conditions (visibility, presence, clickability, etc.).  
   - Configurable timeouts and support for “inverted” waits (wait until condition not met).

5. **Logging**  
   - Built-in logging using a `Logger` class from the imported `corelib` package.

### Examples

1. **Browser Lifecycle**
    ```
        browser.start_browser()                         # Start browser
        browser.open_page("https://www.google.com")     # Open URL
        browser.quit_browser()                          # Open URL    
    ```
2. **Element Interaction**
    ```
        browser.get_text("id:myElementId")                                   # Get text of element
        browser.input_text("xpath=//input[@id='username']", "admin")         # Input text
        browser.click("id:loginButton")                                      # Regular click
        browser.js_click("id:specialElement")                                # JavaScript-based click
    ```
3. **Advanced Actions**
    ```
        browser.drag_and_drop("id:sourceElement", "id:targetElement")        # Drag and drop
        browser.context_click("xpath://button[@class='context-menu']")       # Context click (Right-click)
        browser.scroll_into_view("id:someElement")                           # Scroll element into view
        browser.switch_tab(1)                                                # Switch tab
        browser.close_tab(1, is_post_switch=True)                            # Closes tab and then switches back
    ```
4. **Waits and Synchronization**
    ```
        browser.wait_visibility_of_element_located()                         # Wait for element to be visible
        browser.wait_presence_of_element_located()                           # Wait for element to be present
    ```
5. **Logging**
    ```
        browser.logger.info(f'Navigate to {url}')                            # Start browser
        browser.logger.info('Quit browser and terminate driver')             # Open URL 
    ```
### Be careful to update code in WebHandler.py, it will affect all projects

## Common.py
#### The Common.py is just one in many files that hold the common functions for that project. It is designed to encapsulate common functions that are used across multiple test cases in the project.
#### The good practice is classifying specific functions into separate files. For example, the Reports.py file holds functions related to reports, the EcgEvent.py file holds functions related to ECG events, etc.

```
btcy-qa-tool-auto_fwk
└───corelib
│   │   WebHandler.py
│   │   ...
│
└───project_ai_report_portal
│   └───lib
│   │   └───web
│   │       │   Common.py
│   │       │   EcgEvent.py
│   │       │   Studies.py
│   │       │   ...
│   │   
│   └───config
│   │   └───web_locators
│   │       │   common.py
│   │       │   ecgevent.py
│   │       │   studies.py
│   │       │   ...
│   │   ...
```

#### When developing a function, such as navigate_to_callcenter_sign_in_page function, firstly, you have to find the necessary locators in the /config/web_locators folder.
#### The locators are stored in common.py:
    ```
    FOOTER = 'class:login-container__footer'
    ```
#### Then, you can use the locators in the Common.py file:
    ```
    def navigate_to_callcenter_sign_in_page(self):
        version = 'undetected'
        try:
            self.browser.open_page(self.URL)
            self.browser.wait_visibility_of_element_located('class:login-page-callcenter', timeout=15)
            version = self.browser.get_text(self.LCT.FOOTER).split()[-1][1:]
        finally:
            return version
    ```
#### Now use the function in Robot file, the keyword would be:
    ```
    Navigate To Callcenter Sign In Page
    ```

