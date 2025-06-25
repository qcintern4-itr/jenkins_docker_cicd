**_btcy-qa-tool-auto_fwk  - Asset Classification: INTERNAL USE ONLY_**

# Introduction
****Quickstart for Biotricity Automation Framework, UI testing, API testing, Mobile testing, Web testing****

# Insomnia Profile API Collection (Backup & Restore)
****This section documents two exported Insomnia JSON files that help automate backup and restore of user profile data through GraphQL API****
### Files Included
**`insomnia_backup.json`**: This file contains the exported Insomnia collection for backing up user profile data.
* Sends a GraphQL backupProfileData mutation to back up profile data.
* Default profileId: 66583a3a9f41bda204b6c197
* Endpoint: https://admin-backend.staging.biotricity.com/
**`insomnia_restore.json`**: This file contains the exported Insomnia collection for restoring user profile data.
* Sends a GraphQL restoreProfileData mutation to restore profile data.
* Default profileId: 66583a3a9f41bda204b6c197
* Endpoint: https://admin-backend.staging.biotricity.com/
### Folder path: utils/api/insomnia_collections 

### How to Use
1. **Open Insomnia Desktop**
2. **Go to Application > Preferences > Data > Import Data.**
3. **Choose From File and select either file.**
4. **Modify the headers if needed (e.g., replace access-token with a valid token).**
5. **Send the request.**
    **Warning**: Ensure access-token and any other sensitive values are updated or sanitized before sharing or pushing to public repositories.

# Installation
#### In order to utilise this project you need to have the following installed locally:
* Pycharm IDE
* Android studio (control emulator in mobile testing - ANDROID)
* Xcode (control simulator in mobile testing - IOS)
* Appium server
* Virtualenv
* Python3
* Java 1.8
#### Using `python -m pip install {LIBRARY}` to install the following libraries:
* robotframework
* selenium
* requests
* appium-python-client
* pyyaml
* xmltodict
* jira
* sqlalchemy
* api4jenkins
* boto3
* psycopg2
* or using `python -m pip install -r requirements_raw` to read and install above libraries

# Usage
#### To check the test case syntax though test projects and test suites, you can run:
`python walk.py` for all projects and suite, for more details you can run `python walk.py --help`
```
Walk though test projects and test suites.

options:
  -h, --help            show this help message and exit
  -p PATH [PATH ...], --project PATH [PATH ...]
                        project paths, if not provide, walk through all
                        projects
  -s PATH [PATH ...], --suite PATH [PATH ...]
                        suite paths, if not provide, walk through all suites
  -o OUTPUT, --output OUTPUT
                        output file
  --no-validate         disable validation
```
* Sample: `python walk.py -p project_cardiac_portal`
#### To generate testdoc you can run:
`python testdoc.py` for all projects and suite, for more details you can run `python testdoc.py --help`
```
usage: testdoc.py [-h] [-p PATH [PATH ...]] [-s PATH [PATH ...]] [--split] [--split-in-place]

Generate testdoc.

options:
  -h, --help            show this help message and exit
  -p PATH [PATH ...], --project PATH [PATH ...]
                        project paths, default: all projects
  -s PATH [PATH ...], --suite PATH [PATH ...]
                        suite paths, default: all suites
  --split               each testdoc for each suite, stored in tmp
  --split-in-place      each testdoc for each suite, stored in the same suite`s directory
```
* Sample: `python testdoc.py -p project_cardiac_portal`

#### To execute test suites and test scripts you can perform following ways:
* Web: 
Navigate to project directory and run `python run.py -s {SUITE_PATH} --env {RUN_ENV} --browser {BROWSER_NAME}`.
  * Sample: `python run.py -s project_bioflux_clinic_portal/test/BF-AUTH.robot --env staging --browser chrome -e manual --install-driver --update-dashboard`
* Mobile App: 
Navigate to project directory and run `python run.py -s {SUITE_PATH} --env {RUN_ENV} --desired-caps {DESIRED_CAPS}`.
  * Sample: `python run.py -s project_biocare_app/test/BIOC-ADDMANUALLY.robot --desired-caps utils/mobile_devices/nokia72.yaml --env qa --e manual`
* for more details you can run: `python run.py --help`
```
usage: run.py [-h] -s path [path ...] --env env [-i tags [tags ...]] [-e tags [tags ...]] [-L level] [-v var:value [var:value ...]] [--listener CLASS [CLASS ...]]
              [--report-teams bioflux/cardiac [bioflux/cardiac ...]] [--update-dashboard] [--project-version project version] [--open-bug] [--browser chrome/firefox] [--headless]
              [--install-driver] [--desired-caps DESIRED_CAPS]

Biotricity Automation Framework execution.

options:
  -h, --help            show this help message and exit
  -s path [path ...], --suite path [path ...]
                        suite paths, wildcards acceptable
  --env env             environment
  -i tags [tags ...], --include tags [tags ...]
                        include tags, wildcards acceptable
  -e tags [tags ...], --exclude tags [tags ...]
                        exclude tags, wildcards acceptable
  -L level, --loglevel level
                        threshold level for logging
  -v var:value [var:value ...], --variable var:value [var:value ...]
                        test data variable, only support variables with string value
  --listener CLASS [CLASS ...]
                        listener interfaces
  --report-teams bioflux/cardiac [bioflux/cardiac ...]
                        send test result to MS Teams
  --update-dashboard    update test result to dashboard
  --project-version project version
                        preset project version
  --open-bug            open bug in case of failures
  --browser chrome/firefox
                        browser type - web app test only
  --headless            running with headless browser - web app test only
  --install-driver      install webdriver - web app test only
  --desired-caps DESIRED_CAPS
                        desired capabilities config file - mobile app test only
```
#### To synchronize test cases with Dashboard testing `You can perform the following steps`:
Run Command: python3 scriptUpdateSuite.py
1. Import the library `utils/dashboard/DashboardHandler.py`
2. Authorize the postgresql database:
   * Sample: `db = DashboardHandler("postgresql://USERNAME:PASSWORD@DATA_SERVER:PORT/DATABASE_NAME")`
3. To update new case, you can invoke "update_suites_cases" method with "walk_data" path if not provide, walk through all
   * Sample: `db.update_suites_cases(walk_data='tmp/walk.yaml')`
4. Then to resolve deleted or edited test cases, you can invoke "delete_suites_cases" method
   * Sample: `db.delete_suites_cases()`

# Format when create test case
1. Tags when the create testcase is correct follow the format:

`[Tags]       {id_testcase}      {id_release}         {type_testcase}        {piority_testcase}`

  * id_release: version release(The last version update)
  * type_testcase: manual/auto/RP1 (run phase 1 - used for test cases that affect data ) / RP2 (run phase 2) / RP3 (run phase 3)
  * piority_testcase: R1 ( main case - used for regression test) / R2(case normal) / R3(case normal).
  

EX: `[Tags]      AP-DEVICES-CREATE-BIOHEART-20       AP-1.14.0       manual/auto/(RP1/RP2/RP3)      R1     `
2. Check if the test case is correct or wrong when it is created
  Navigate to project directory and run:
  * Run file: `python walk.py`
  * Update test case to db: `python scriptUpdateSuite.py`

# Run to get a report for the manual case
1. Update the new version on file: `model_btcy/Listener.py` -> find the text `UNDETECTED = "UNDETECTED"` -> update new version `UNDETECTED = "{new_version}"`(Sample: `UNDETECTED = "BIOC-2.1.0"` and Then the run report successfully, you need to fix it back to its original)
2. Navigate to project directory and run: `python run.py -s {SUITE_PATH} --env {RUN_ENV} --browser {BROWSER_NAME} chrome -i {tag_name} --update-dashboard`
  * Sample: `python run.py -s project_bioflux_clinic_portal/test/BF-AUTH.robot --env staging --browser chrome -i manual --update-dashboard`
  * Sample run for all suite: `python run.py -s project_bioflux_clinic_portal/test/ --env staging --browser chrome -i manual --update-dashboard`

# Create virtual environment folder
python -m venv .venv

# Activate virtual environment (bash)
.\.venv\Scripts\activate.bat    (for Window CMD)
source .venv/bin/activate (for Mac)


