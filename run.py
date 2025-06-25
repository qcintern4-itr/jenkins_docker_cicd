#!/usr/bin/env python3
import time

try:
    import os
    import argparse
    import subprocess
    import shutil
    from datetime import datetime
    from utils import WebDriverHandler

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Run:

    def __init__(self, _arguments):
        self.arguments = _arguments
        self.DEFAULT_OUTPUT_DIR = f'results/log_{datetime.now().strftime("%Y-%m-%d_%H-%M-%S")}'
        self.DEFAULT_DEBUG_LOG = 'debug.log'
        self.DEFAULT_DRIVER_DIR = 'tmp'
        self.OUTPUT_FOLDER = f'results/output_file_{datetime.now().strftime("%Y-%m-%d_%H-%M-%S")}'
        self.OUTPUT_RERUN = f'results/output_rerun_{datetime.now().strftime("%Y-%m-%d_%H-%M-%S")}'
        self.OUTPUT_IMAGE = 'results/img_original'
        self.OUTPUT_IMAGE_COMPARE = 'results/img_compare'

        self.config = {'-d': [self.DEFAULT_OUTPUT_DIR], '-b': [self.DEFAULT_DEBUG_LOG], '-P': ['./']}  # default config
        self.cmd = 'python -m robot '  # default robot cmd

        self.dialect = 'postgresql://qc01:BosqU6gcMQkckZRVbah6Ln6PVwF9LJBAHxLj8EsU9TuwxcmbdT@qc-demo.cp32vwz1k8nq.ap-southeast-1.rds.amazonaws.com:5432/robot_result'

    def add_to_config(self, key, value):
        if key in self.config:
            if isinstance(value, str):
                self.config[key].append(value)
            else:
                self.config[key].extend(value)
        else:
            if isinstance(value, str):
                self.config[key] = [value]
            else:
                self.config[key] = value

    def add_to_cmd(self, option, values):
        for value in values:
            self.cmd += f'{option} {value} '

    def build_config(self):
        # Optional
        if self.arguments.include:
            self.add_to_config('-i', [t.lower() for t in self.arguments.include])  # lower case tags to avoid OR or AND
        if self.arguments.exclude:
            self.add_to_config('-e', [t.lower() for t in self.arguments.exclude])  # lower case tags to avoid OR or AND
        if self.arguments.loglevel:
            self.add_to_config('-L', self.arguments.loglevel)
        if self.arguments.variable:
            self.add_to_config('-v', self.arguments.variable)
        if self.arguments.listener:
            self.add_to_config('--listener', self.arguments.listener)
        if self.arguments.report_teams:
            self.add_to_config('--listener', f'model_btcy.Listener.ReportTeams:{":".join(self.arguments.report_teams)}')
        if self.arguments.update_dashboard:
            self.add_to_config('--listener', f'model_btcy.Listener.UpdateDashboard:{self.dialect}')
        if self.arguments.project_version:
            self.add_to_config('--metadata', f'version:{self.arguments.project_version}')
        if self.arguments.open_bug:
            self.add_to_config('--listener', 'model_btcy.Listener.OpenBug')
        # Optional but required for web app test
        if self.arguments.browser:
            self.add_to_config('-v', f'BROWSER:{self.arguments.browser}')
            self.add_to_config('-v', f'HEADLESS:{self.arguments.headless}')
        # Optional but required for mobile app test
        if self.arguments.desired_caps:
            self.add_to_config('-v', f'DESIRED_CAPS:{self.arguments.desired_caps}')
        # Must have
        if self.arguments.env:
            self.add_to_config('-v', f'ENV:{self.arguments.env}')
        if self.arguments.rerun_failed:
            self.add_to_config('--rerunfailed', self.arguments.rerun_failed)
        self.add_to_config('-M', f'executor:"{os.environ.get("USER", os.environ.get("USERNAME"))}"')
        self.add_to_config('', list(self.arguments.suite))  # the option of suite is empty string

    def print_output(self):
        print("-------------------===============-----====------====-----===============-------------------")
        print("-------------------===============-----====------====-----===============-------------------")
        print("------------------------=====----------====------====----------=====------------------------")
        print("------------------------=====----------==============----------=====------------------------")
        print("------------------------=====----------====------====----------=====------------------------")
        print("------------------------=====----------====------====----------=====------------------------")
        print("------------------------=====----------====------====----------=====------------------------")
        return self

    def build_cmd(self):
        # Parse all options except suites
        [self.add_to_cmd(option, values) for option, values in self.config.items() if option]
        # Parse suites at last, with key as empty string
        self.add_to_cmd('', self.config[''])

    def __call__(self, *args, **kwargs):
        self.build_config()
        self.build_cmd()
        # Create output dir
        if not os.path.exists(self.DEFAULT_OUTPUT_DIR):
            os.makedirs(self.DEFAULT_OUTPUT_DIR, exist_ok=True)
        if not os.path.exists(self.OUTPUT_FOLDER):
            os.makedirs(self.OUTPUT_FOLDER, exist_ok=True)
        if not os.path.exists(self.DEFAULT_DRIVER_DIR):
            os.makedirs(self.DEFAULT_DRIVER_DIR, exist_ok=True)
        if not os.path.exists(self.OUTPUT_RERUN):
            os.makedirs(self.OUTPUT_RERUN, exist_ok=True)
        if not os.path.exists(self.OUTPUT_IMAGE):
            os.makedirs(self.OUTPUT_IMAGE, exist_ok=True)
        if not os.path.exists(self.OUTPUT_IMAGE_COMPARE):
            os.makedirs(self.OUTPUT_IMAGE_COMPARE, exist_ok=True)
        # Install web driver
        if self.arguments.browser and self.arguments.install_driver:
            if self.arguments.browser in (WebDriverHandler.CHROME, WebDriverHandler.EDGE):
                version = 'auto'
            else:
                version = 'latest'
            WebDriverHandler.install_driver(browser_type=self.arguments.browser, version=version,
                                            saved_dir=self.DEFAULT_DRIVER_DIR)
        # Run tests
        process = subprocess.Popen(self.cmd, shell=True)
        process.communicate()
        # After the test run, copy the output.xml file to a specified location
        source_path = os.path.join(self.DEFAULT_OUTPUT_DIR, 'output.xml').replace('\\', '/')
        destination_path = self.OUTPUT_FOLDER.replace('\\', '/')
        output_rerun_path = self.OUTPUT_RERUN.replace('\\', '/')
        shutil.copy(source_path, destination_path)
        # Rerun failed tests
        if process.returncode != 0:
            rerun_input = ' '.join(self.arguments.suite)
            if self.arguments.include:
                rerun_include = ''.join(self.arguments.include).lower()
                rerun_cmd = f"python -m robot -d {output_rerun_path} -b {self.DEFAULT_DEBUG_LOG} -P ./ -i {rerun_include}" \
                            f" -v BROWSER:{self.arguments.browser} -v HEADLESS:{self.arguments.headless} -v ENV:{self.arguments.env} -M executor:{os.environ.get('USER', os.environ.get('USERNAME'))} --rerun-failed {destination_path}/output.xml {rerun_input}"
                if self.arguments.update_dashboard:
                    rerun_cmd = f"python -m robot -d {output_rerun_path} -b {self.DEFAULT_DEBUG_LOG} -P ./ -i {rerun_include} --listener model_btcy.Listener.UpdateDashboard:{self.dialect}" \
                                f" -v BROWSER:{self.arguments.browser} -v HEADLESS:{self.arguments.headless} -v ENV:{self.arguments.env} -M executor:{os.environ.get('USER', os.environ.get('USERNAME'))} --rerun-failed {destination_path}/output.xml {rerun_input}"
                print("rerun output", rerun_cmd)
                rerun_process = subprocess.Popen(rerun_cmd, shell=True)
                rerun_process.communicate()
                # Merge results
                merge_cmd = f"python -m robot.rebot --outputdir {self.DEFAULT_OUTPUT_DIR} " \
                            f"--output output.xml --report report.html --log log.html " \
                            f"--merge {destination_path}/output.xml {output_rerun_path}/output.xml"
                # print("merge_output", merge_cmd)
                self.print_output()
                merge_process = subprocess.Popen(merge_cmd, shell=True)
                merge_process.communicate()
                return merge_process.returncode
            if self.arguments.exclude:
                rerun_exclude = ' '.join(self.arguments.exclude).lower()
                rerun_cmd = f"python -m robot -d {output_rerun_path} -b {self.DEFAULT_DEBUG_LOG} -P ./ -e {rerun_exclude}" \
                            f" -v BROWSER:{self.arguments.browser} -v HEADLESS:{self.arguments.headless} -v ENV:{self.arguments.env} -M executor:{os.environ.get('USER', os.environ.get('USERNAME'))} --rerun-failed {destination_path}/output.xml {rerun_input}"
                if self.arguments.update_dashboard:
                    rerun_cmd = f"python -m robot -d {output_rerun_path} -b {self.DEFAULT_DEBUG_LOG} -P ./ -e {rerun_exclude} --listener model_btcy.Listener.UpdateDashboard:{self.dialect}" \
                                f" -v BROWSER:{self.arguments.browser} -v HEADLESS:{self.arguments.headless} -v ENV:{self.arguments.env} -M executor:{os.environ.get('USER', os.environ.get('USERNAME'))} --rerun-failed {destination_path}/output.xml {rerun_input}"
                # print("rerun output", rerun_cmd)
                rerun_process = subprocess.Popen(rerun_cmd, shell=True)
                rerun_process.communicate()
                # Merge results
                merge_cmd = f"python -m robot.rebot --outputdir {self.DEFAULT_OUTPUT_DIR} " \
                            f"--output output.xml --report report.html --log log.html " \
                            f"--merge {destination_path}/output.xml {output_rerun_path}/output.xml"
                # print("merge_output", merge_cmd)
                self.print_output()
                merge_process = subprocess.Popen(merge_cmd, shell=True)
                merge_process.communicate()
                return merge_process.returncode

        return process.returncode


if __name__ == '__main__':
    if os.path.basename(os.getcwd()) != 'jenkins_docker_cicd':
        raise Exception('Script is executed at `jenkins_docker_cicd` directory ONLY.')

    parser = argparse.ArgumentParser(description='Biotricity Automation Framework execution.\n')

    # Required
    parser.add_argument('-s', '--suite', help='suite paths, wildcards acceptable',
                        nargs='+', metavar='path', required=True)
    parser.add_argument('--env', help='environment',
                        metavar='env', required=True)
    # Optional
    parser.add_argument('-i', '--include', help='include tags, wildcards acceptable',
                        nargs='+', metavar='tags')
    parser.add_argument('-e', '--exclude', help='exclude tags, wildcards acceptable',
                        nargs='+', metavar='tags')
    parser.add_argument('-L', '--loglevel', help='threshold level for logging',
                        metavar='level')
    parser.add_argument('-v', '--variable', help='test data variable, only support variables with string value',
                        nargs='+', metavar='var:value')
    parser.add_argument('--listener', help='listener interfaces',
                        nargs='+', metavar='CLASS')
    parser.add_argument('--report-teams', help='send test result to MS Teams',
                        nargs='+', metavar='bioflux/cardiac')
    parser.add_argument('--update-dashboard', help='update test result to dashboard', action='store_true')
    parser.add_argument('--project-version', help='preset project version',
                        metavar='project version')
    parser.add_argument('--open-bug', help='open bug in case of failures', action='store_true')

    # Optional but required for web app test
    parser.add_argument('--browser', help='browser type - web app test only', metavar='chrome/firefox')
    parser.add_argument('--headless', help='running with headless browser - web app test only', action='store_true')

    # Optional for web app test
    parser.add_argument('--install-driver', help='install webdriver - web app test only', action='store_true')

    # Optional but required for mobile app test
    parser.add_argument('--desired-caps', help='desired capabilities config file - mobile app test only')
    parser.add_argument('--rerun-failed', help='link path has file output.xml')

    arguments = parser.parse_args()
    Run(arguments)()
