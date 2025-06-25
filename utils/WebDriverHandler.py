#!/usr/bin/env python3

try:
    import os
    import subprocess
    import re
    import zipfile
    import tarfile
    import shutil
    from corelib import Utils, ApiHandler

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise

MACHINE_INFO = Utils.get_machine_info()
MACHINE_OS = MACHINE_INFO['system']

CHROME = 'chrome'
FIREFOX = 'firefox'
EDGE = 'edge'

DEFAULT_DIR = 'tmp'
api = ApiHandler.ApiHandler()


def get_browser_version(browser_type):
    func_map = {
        CHROME: ChromeDriverHandler.get_browser_version,
        FIREFOX: GeckoDriverHandler.get_browser_version,
        EDGE: EdgeDriverHandler.get_browser_version
    }
    return func_map[browser_type]()


def get_driver_url(browser_type, version):
    func_map = {
        CHROME: ChromeDriverHandler.get_driver_url,
        FIREFOX: GeckoDriverHandler.get_driver_url,
        EDGE: EdgeDriverHandler.get_driver_url
    }
    return func_map[browser_type](version=version)


def install_driver(browser_type, version, saved_dir, filename=None):
    func_map = {
        CHROME: ChromeDriverHandler.install_driver,
        FIREFOX: GeckoDriverHandler.install_driver,
        EDGE: EdgeDriverHandler.install_driver
    }
    return func_map[browser_type](saved_dir=saved_dir, version=version, filename=filename)


class ChromeDriverHandler:

    @staticmethod
    def get_browser_version():
        cmd_map = {
            'Darwin': r'/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --version',
            'Linux': r'/usr/bin/google-chrome --version',
            'Windows': [r'wmic datafile where name="C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"'
                        r' get Version /value',
                        r'wmic datafile where name="C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe"'
                        r' get Version /value']
        }
        if MACHINE_OS in ('Darwin', 'Linux'):
            result = subprocess.run(cmd_map[MACHINE_OS], capture_output=True, shell=True)
            return result.stdout.decode('utf-8').strip().split()[-1]
        if MACHINE_OS == 'Windows':
            for cmd in cmd_map[MACHINE_OS]:
                result = subprocess.run(cmd, capture_output=True, shell=True)
                if 'no instance' not in result.stdout.decode('utf-8').lower():
                    return result.stdout.decode('utf-8').strip().split('=')[1]

    @staticmethod
    def get_driver_url(version='auto'):
        base_url = 'https://googlechromelabs.github.io/chrome-for-testing/known-good-versions-with-downloads.json'

        response = api.send_request(
            method='GET',
            url=f"{base_url}",
            timeout=10, is_logged=False
        )

        if response['code'] != 200:
            raise Exception(f'Unable to get chromedriver version @ {base_url}')

        versions = response['body'].get('versions', [])

        if MACHINE_OS == 'Darwin':
            if MACHINE_INFO['processor'].startswith('arm'):
                platform_str = 'mac-arm64'
            else:
                platform_str = 'mac-x64'
        elif MACHINE_OS == 'Linux':
            platform_str = 'linux64'
        elif MACHINE_OS == 'Windows':
            platform_str = 'win64' if '64' in MACHINE_INFO['machine'] else 'win32'
        else:
            raise Exception(f'No chromedriver available for the following machine: {MACHINE_OS}.')

        for version_block in versions:
            if version_block.get('version').split('.')[0] == version.split('.')[0]:
                downloads = version_block.get('downloads', {})
                chrome_downloads = downloads.get('chromedriver', [])
                for download_entry in chrome_downloads:
                    if download_entry.get('platform') == platform_str:
                        return download_entry.get('url')
                raise ValueError(f"No matching platform URL found for {platform_str} in version {version}")

        raise ValueError(f"Requested version {version} not found in the available versions.")

    @staticmethod
    def get_installed_chromedriver_version(driver_path):
        """
        Returns the version string of an existing chromedriver binary.
        If the file does not exist or the version cannot be determined, returns None.
        """
        if not os.path.isfile(driver_path):
            return None

        try:
            # On Windows, you might need the .exe extension: "chromedriver.exe --version"
            # Ensure driver_path is the full path to the chromedriver binary.
            output = subprocess.check_output([driver_path, "--version"], stderr=subprocess.STDOUT)
            output_str = output.decode("utf-8").strip()

            # Typically, the version line looks like:
            # "ChromeDriver 113.0.5672.63 (e3b5f00bf80cda8a8f3b864f9057b823c9dde157-refs/branch-heads/5672@{#912})"
            # We'll extract the first portion after 'ChromeDriver '
            match = re.match(r"ChromeDriver\s+(\d+\.\d+\.\d+\.\d+)", output_str)
            if match:
                return match.group(1)  # e.g. "113.0.5672.63"
            else:
                return None
        except Exception:
            # If the command fails for any reason, we can't get the version
            return None

    @staticmethod
    def install_driver(saved_dir, version='auto', filename=None):
        # Determine what the binary name should be based on the OS
        if MACHINE_OS == 'Windows':
            binary_name = 'chromedriver.exe'
        else:
            binary_name = 'chromedriver'

        current_driver_ver = ChromeDriverHandler.get_installed_chromedriver_version(os.path.join(saved_dir, binary_name))
        current_chrome_ver = ChromeDriverHandler.get_browser_version()

        if current_driver_ver is not None and current_driver_ver.split('.')[0] == current_chrome_ver.split('.')[0]:
            return

        download_url = ChromeDriverHandler.get_driver_url(version=current_chrome_ver)

        # Download zip file
        response = api.send_request(method='GET', url=download_url, is_logged=False, format_response=False)
        if response.status_code != 200:
            raise Exception(f'Problem downloading zip file @ {download_url}.')

        zip_filepath = os.path.join(saved_dir, 'driver.zip')
        with open(zip_filepath, 'wb') as f:
            f.write(response.content)

        # Extract the zip
        with zipfile.ZipFile(zip_filepath, 'r') as zf:
            zf.extractall(saved_dir)

        # Function to find the binary inside saved_dir
        def find_chromedriver_binary(root_dir, bin_name):
            for root, dirs, files in os.walk(root_dir):
                if bin_name in files:
                    return os.path.join(root, bin_name)
            return None

        driver_binary_path = find_chromedriver_binary(saved_dir, binary_name)
        if not driver_binary_path:
            raise Exception(f'No {binary_name} binary found in extracted archive.')

        final_driver_path = os.path.join(saved_dir, filename or binary_name)

        # Move the binary to the saved_dir (top-level)
        if driver_binary_path != final_driver_path:
            # Ensure destination directory exists (it should, but just in case)
            if not os.path.exists(os.path.dirname(final_driver_path)):
                os.makedirs(os.path.dirname(final_driver_path))
            os.rename(driver_binary_path, final_driver_path)

        # Now remove the zip file
        os.remove(zip_filepath)

        # Remove the subdirectory that originally contained the binary (if any)
        # The directory containing the binary may have been something like saved_dir/chrome-mac-arm64
        extracted_subdir = os.path.dirname(driver_binary_path)
        if extracted_subdir != saved_dir and os.path.exists(extracted_subdir):
            shutil.rmtree(extracted_subdir, ignore_errors=True)

        # Verify the driver exists at the final location
        if not os.path.isfile(final_driver_path):
            raise Exception(f'No chromedriver found @ {final_driver_path}.')

        # Make the driver executable on UNIX-like systems
        if MACHINE_OS in ('Darwin', 'Linux'):
            os.chmod(final_driver_path, 0o755)

        return final_driver_path

class GeckoDriverHandler:

    @staticmethod
    def get_browser_version():
        raise Exception('Not available for firefox')

    @staticmethod
    def get_driver_url(version):
        # Get version text
        _version = version if version.startswith('v') or version == 'latest' else f'v{version}'
        resp = api.send_request(method='GET', url=f'https://github.com/mozilla/geckodriver/releases/{_version}',
                                is_logged=False)
        if resp['code'] != 200:
            raise Exception(f'Version {version} not found')
        _version = resp['url'].split('/')[-1]
        # Get filename
        filename = f'geckodriver-{_version}-'
        if MACHINE_OS == 'Darwin':
            filename += 'macos-aarch64.tar.gz' if MACHINE_INFO['processor'].startswith('arm') else 'macos.tar.gz'
        elif MACHINE_OS == 'Linux':
            filename += 'linux64.tar.gz' if '64 bit' in MACHINE_INFO['version'] else 'linux32.tar.gz'
        elif MACHINE_OS == 'Windows':
            filename += 'win64.zip' if '64' in MACHINE_INFO['machine'] else 'win32.zip'
        else:
            raise Exception(f'No geckodriver available for the following machine: {MACHINE_OS}.')
        # Return url
        return f'https://github.com/mozilla/geckodriver/releases/download/{_version}/{filename}'

    @staticmethod
    def install_driver(saved_dir, version='latest', filename=None):
        download_url = GeckoDriverHandler.get_driver_url(version=version)
        # Download compressed file
        response = api.send_request(method='GET', url=download_url, is_logged=False, format_response=False)
        if response.status_code != 200:
            raise Exception(f'Problem downloading file @ {download_url}.')
        compressed_file = f'{saved_dir}/driver.zip' if download_url.endswith('zip') else f'{saved_dir}/driver.tar.gz'
        with open(compressed_file, 'wb') as f:
            f.write(response.content)
        # Extract the compressed file and rename if required
        if compressed_file.endswith('zip'):
            with zipfile.ZipFile(compressed_file, 'r') as zf:
                zf.extractall(saved_dir)
        else:  # tar.gz
            with tarfile.open(compressed_file, 'r') as tf:
                tf.extractall(saved_dir)
        orig_driver_filename = [f for f in os.listdir(saved_dir) if f.startswith('geckodriver')][0]
        if filename:
            os.rename(f'{saved_dir}/{orig_driver_filename}', f'{saved_dir}/{filename}')
            driver_path = f'{saved_dir}/{filename}'
        else:
            driver_path = f'{saved_dir}/{orig_driver_filename}'
        # Check driver exist, remove the compressed file, change permission and return the driver file
        if not os.path.isfile(driver_path):
            raise Exception(f'No geckodriver found @ {driver_path}.')
        os.remove(compressed_file)
        if MACHINE_OS in ('Darwin', 'Linux'):
            os.chmod(driver_path, 0o755)
        return driver_path


class EdgeDriverHandler:

    @staticmethod
    def get_browser_version():
        cmd_map = {
            'Darwin': r'',
            'Linux': r'',
            'Windows': r'wmic datafile where name="C:\\Program Files (x86)\\Microsoft\\Edge\\Application\\msedge.exe"'
                       r' get Version /value'
        }
        result = subprocess.run(cmd_map[MACHINE_OS], capture_output=True, shell=True)
        if MACHINE_OS in ('Darwin', 'Linux'):
            raise Exception(f'Yet to be implemented on {MACHINE_OS}')
        if MACHINE_OS == 'Windows':
            return result.stdout.decode('utf-8').strip().split('=')[1]

    @staticmethod
    def get_driver_url(version):
        base_url = 'https://msedgedriver.azureedge.net'
        # Get actual version first
        if version == 'latest':
            resp = api.send_request('GET', f'{base_url}/LATEST_STABLE', is_logged=False)
            _version = resp['body'].strip()
        elif version == 'auto':
            _version = EdgeDriverHandler.get_browser_version()
        else:
            _version = version
        # Get filename
        if MACHINE_OS == 'Darwin':
            filename = 'edgedriver_arm64.zip' if MACHINE_INFO['processor'].startswith('arm') else 'edgedriver_mac64.zip'
        elif MACHINE_OS == 'Linux':
            filename = 'edgedriver_linux64.zip'
        elif MACHINE_OS == 'Windows':
            filename = 'edgedriver_win64.zip' if '64' in MACHINE_INFO['machine'] else 'edgedriver_win32.zip'
        else:
            raise Exception(f'No edgedriver available for the following machine: {MACHINE_OS}.')
        # Return the driver url
        return f'{base_url}/{_version}/{filename}'

    @staticmethod
    def install_driver(saved_dir, version='auto', filename=None):
        download_url = EdgeDriverHandler.get_driver_url(version=version)
        # Download zip file
        response = api.send_request(method='GET', url=download_url, is_logged=False, format_response=False)
        if response.status_code != 200:
            raise Exception(f'Problem downloading zip file @ {download_url}.')
        zip_filepath = f'{saved_dir}/driver.zip'
        with open(zip_filepath, 'wb') as f:
            f.write(response.content)
        # Extract the zip and rename driver file (if required)
        with zipfile.ZipFile(zip_filepath, 'r') as zf:
            zf.extractall(saved_dir)
        orig_driver_filename = [f for f in os.listdir(saved_dir) if f.startswith('msedgedriver')][0]
        if filename:
            os.rename(f'{saved_dir}/{orig_driver_filename}', f'{saved_dir}/{filename}')
            driver_path = f'{saved_dir}/{filename}'
        else:
            driver_path = f'{saved_dir}/{orig_driver_filename}'
        # Check driver exist, remove the zip, change permission and return the driver file
        if not os.path.isfile(driver_path):
            raise Exception(f'No edgedriver found @ {driver_path}.')
        os.remove(zip_filepath)
        if MACHINE_OS in ('Darwin', 'Linux'):
            os.chmod(driver_path, 0o755)
        return driver_path
