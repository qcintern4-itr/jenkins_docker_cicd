#!/usr/bin/env python3

try:
    import os
    import datetime
    from robot.libraries.BuiltIn import BuiltIn
    from robot.result.model import StatusMixin as RobotStatus
    from jira import JIRA

    from corelib import Utils, ApiHandler
    from utils.dashboard.DashboardHandler import DashboardHandler
    from utils.dashboard.Executions import Executions
    from utils.dashboard.CaseExecutions import CaseExecutions
    from utils import Inspector
    from model_btcy import JiraProjectsModel

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


UNDETECTED = "BCCA-2.29.0"



class UpdateDashboard:

    ROBOT_LISTENER_API_VERSION = 3

    def __init__(self, *dialect):
        self.dialect = ':'.join(dialect)

        self.suite_id = None
        self.test_id = None
        self.execution_id = None
        self.case_execution_id = None

        self.dbh = DashboardHandler(self.dialect)

    def start_suite(self, _, __):
        new_execution = {
            Executions.LINK: '',
            Executions.STATUS: 'RUNNING',
            Executions.EXECUTOR: os.environ.get("USER", os.environ.get("USERNAME")),
            Executions.UPDATED_AT: '<NOW()>',
        }
        # print(new_execution)
        rows = self.dbh.insert_execution(**new_execution)
        if rows:
            self.execution_id = [row.id for row in rows][0]

    def start_test(self, data, _):
        sep = BuiltIn().get_variable_value('${/}')
        version = BuiltIn().get_variable_value('&{SUITE_METADATA}').get('version', UNDETECTED)
        source_string = str(data.source)
        split_parts = source_string.split(sep)
        new_case_execution = {
            CaseExecutions.EXECUTION_ID: self.execution_id,
            CaseExecutions.CASE_ID: data.name.split(':')[0].strip(),
            CaseExecutions.PROJECT: [fd for fd in split_parts
                                     if 'project_' in fd][0].replace('project_', ''),
            CaseExecutions.STATUS: 'RUNNING',
            CaseExecutions.RELEASE: '.'.join(version.split('.')[:3]),
            CaseExecutions.BUILD: '.'.join(version.split('.')[3:]),
            CaseExecutions.ENV: BuiltIn().get_variable_value('${ENV}', default=UNDETECTED),
            CaseExecutions.PLATFORM: Utils.get_machine_info()['system'].lower(),
            CaseExecutions.SUT: self._sut,
            CaseExecutions.EXECUTOR: os.environ.get("USER", os.environ.get("USERNAME")),
            CaseExecutions.MESSAGE: '',
            CaseExecutions.BUGS: None,
            CaseExecutions.TRIAGE_REASON: '',
            CaseExecutions.EXECUTION_TIME: '',
            CaseExecutions.UPDATED_AT: '<NOW()>'
        }
        rows = self.dbh.insert_case_execution(**new_case_execution)
        if rows:
            self.case_execution_id = [row.id for row in rows][0]

    def end_test(self, _, result):
        update_case_execution = {
            CaseExecutions.ID: self.case_execution_id,
            # CaseExecutions.CASE_ID: data.metadata.get(Inspector.TS_ID),
            CaseExecutions.STATUS: result.status,
            # CaseExecutions.RELEASE: '.'.join(version.split('.')[:3]),
            # CaseExecutions.BUILD: '.'.join(version.split('.')[3:]),
            # CaseExecutions.ENV: BuiltIn().get_variable_value('${ENV}', default=UNDETECTED),
            # CaseExecutions.PLATFORM: Utils.get_machine_info()['system'].lower(),
            CaseExecutions.SUT: self._sut,
            # CaseExecutions.EXECUTOR: os.environ.get("USER", os.environ.get("USERNAME")),
            CaseExecutions.MESSAGE: result.message.strip().replace("'", "''")[:333],
            CaseExecutions.BUGS: BuiltIn().get_variable_value('${BUGS}'),
            # CaseExecutions.TRIAGE_REASON: '',
            CaseExecutions.EXECUTION_TIME: str(datetime.timedelta(milliseconds=result.elapsedtime)).split('.')[0],
            CaseExecutions.UPDATED_AT: '<NOW()>'
        }
        # print(update_case_execution)
        self.dbh.update_case_execution(**update_case_execution)

    def end_suite(self, _, result):
        update_execution = {
            Executions.ID: self.execution_id,
            # Executions.LINK: '',
            Executions.STATUS: result.status,
            # Executions.EXECUTOR: os.environ.get("USER", os.environ.get("USERNAME")),
            Executions.UPDATED_AT: '<NOW()>',
        }
        # print(update_execution)
        self.dbh.update_execution(**update_execution)

    @property
    def _sut(self):
        sut_list = []
        try:
            # web browser
            browser = BuiltIn().get_variable_value('${BROWSER}')
            if browser:
                sut_list.append(browser)
            # mobile app
            desired_caps_file = BuiltIn().get_variable_value('${DESIRED_CAPS}', default='')
            if os.path.isfile(desired_caps_file):
                dc = Utils.read_config_file(desired_caps_file)
                sut_list.append(
                    f'{dc.get("deviceName", "")} {dc.get("platformName", "")} {dc.get("platformVersion", "")}'.strip()
                )
        finally:
            return ' - '.join(sut_list)


class ReportTeams:

    ROBOT_LISTENER_API_VERSION = 3

    def __init__(self, *projects):
        self.projects = projects
        self.MAP_WEBHOOK_URL = {
            'bioflux': '',
            'cardiac': '',
            'test': 'https://itrvn.webhook.office.com/webhookb2/'
                    '79a5e01f-7a28-4107-86c3-f6dc8b7cb156@62faf053-2c8c-4e7b-8878-f8f622ed2fa1/'
                    'IncomingWebhook/'
                    'dcddd65e70f646769f9e80603516ffdb/'
                    'd80372c9-f6b9-47f6-a3d0-bb8b5f5d18c5'
        }
        self.api = ApiHandler.ApiHandler()

        self.execution_result = {}
        self.suite_id = None

    def start_suite(self, data, _):
        self.suite_id = data.metadata.get('sid')
        if self.suite_id:
            self.execution_result[self.suite_id] = {
                'owner': data.metadata.get('owner'),
                'total': None,
                'pass': None,
                'fail': None,
                'skip': None,
                'pass_rate': None
            }

    def end_suite(self, _, result):
        if self.suite_id:
            self.execution_result[self.suite_id]['total'] = result.statistics.total
            self.execution_result[self.suite_id]['pass'] = result.statistics.passed
            self.execution_result[self.suite_id]['fail'] = result.statistics.failed
            self.execution_result[self.suite_id]['skip'] = result.statistics.skipped
            self.execution_result[self.suite_id]['pass_rate'] = \
                round((float(result.statistics.passed)/result.statistics.total)*100, 2)

    def close(self):
        sections = []
        for suite_id, stats in self.execution_result.items():
            sections.append(
                {
                    'text': f"- **{suite_id}** : "
                            f"&#x1F4CB;{stats['total']} &nbsp; "
                            f"&#x2705;{stats['pass']} &nbsp; "
                            f"&#x274C;{stats['fail']} &nbsp; "
                            f"&#x26a0;{stats['skip']}, "
                            f"pass rate **{stats['pass_rate']}%**, "
                            f"owned by **{stats['owner']}**"
                }
            )
        body = {
            '@type': 'MessageCard',
            'title': f'Test Result - executed by {os.environ.get("USER", os.environ.get("USERNAME"))}',
            'summary': '*',
            'sections': sections
        }
        [self.api.send_request(method='POST', url=self.MAP_WEBHOOK_URL[project], json=body)
         for project in self.projects]


class OpenBug:

    ROBOT_LISTENER_API_VERSION = 3
    URL = 'https://itrvn.atlassian.net'
    PROJECT_MAP = {
        'admin_portal': JiraProjectsModel.AdminPortal,
        'billing_portal': JiraProjectsModel.BillingPortal,
        'biocare_app': JiraProjectsModel.BiocareApp,
        'biodirect_portal': JiraProjectsModel.BiodirectPortal,
        'bioflux_callcenter_portal': JiraProjectsModel.BiofluxCallCenterPortal,
        'bioflux_clinic_app': JiraProjectsModel.BiofluxClinicApp,
        'bioflux_clinic_portal': JiraProjectsModel.BiofluxClinicPortal,
        'bioflux_device': JiraProjectsModel.BiofluxDevice,
        'bioheart_app': JiraProjectsModel.BioheartApp,
        'bioheart_device': JiraProjectsModel.BioheartDevice,
        'bioheart_portal': JiraProjectsModel.BioheartPortal,
        'biotres_device': JiraProjectsModel.BiotresDevice,
        'biotres_gateway': JiraProjectsModel.BiotresGateway,
        'biotres_mct': JiraProjectsModel.BiotresMct,
        'cardiac_patient': JiraProjectsModel.CardiacPatientApp,
        'cardiac_portal': JiraProjectsModel.CardiacPortal,
        'sales_portal': JiraProjectsModel.SalesPortal,
        'support_portal': JiraProjectsModel.SupportPortal,
        'telemed_app': JiraProjectsModel.TelemedApp,
        'telemed_portal': JiraProjectsModel.TelemedPortal,

        'test': JiraProjectsModel.Test
    }
    DEFAULT_USER = 'minhlam@itrvn.com'

    def __init__(self, is_test=True, priority='Medium'):
        self.is_test = is_test
        self.priority = priority.capitalize()
        # TODO: find a common user
        self.auth = ('minhlam@itrvn.com',
                     'ATATT3xFfGF00Sld_glpyfqDqeD1xWtVvYa8S_cdEJRbQDsUWXa-Cf_EsqIXZiqdoFzYF2S3vBeeD2ypIbtqzi145sWRBPjF3'
                     'TX4qWim0X42BGcX617ksApyWvHDIR6s8zQ91V7EVMRlb0aNz8BCsdSz-SEVPAb5Cim0UXYSGwv3LsiE4a7PJTg=8DF13998')
        self.err_msg = {}
        self.project = None
        self.jira = None

    def start_suite(self, data, _):
        if not self.is_test:
            sep = BuiltIn().get_variable_value('${/}')
            fwk_project = [fd for fd in data.source.split(sep) if 'project_' in fd][0].replace('project_', '')
            self.project = self.PROJECT_MAP.get(fwk_project)
        else:
            self.project = self.PROJECT_MAP.get('test')

    def end_test(self, data, result):
        if result.status == RobotStatus.FAIL:
            case_id = data.name.split(':')[0]
            self.err_msg[case_id] = result.message.strip()

    def end_suite(self, data, result):
        if self.project.id and self.err_msg:
            browser = BuiltIn().get_variable_value("${SUITE METADATA}")['browser']
            version = BuiltIn().get_variable_value("${SUITE METADATA}")['version']
            env = BuiltIn().get_variable_value('${ENV}')
            executor = os.environ.get('USER', os.environ.get('USERNAME'))
            suite_owner = data.metadata.get(Inspector.TS_OWNER)
            description = f'Executed by {executor}\n'
            description += f'Owned by {suite_owner}\n'
            description += f'Browser: {browser}\n'
            description += f'Version: {version}\n'
            description += f'Failed cases: {result.statistics.failed}\n\n'
            description += '\n\n'.join(f'{case_id}:\n{msg}' for case_id, msg in self.err_msg.items())

            self.jira = JIRA(self.URL, basic_auth=self.auth)
            issue_dict = {
                'project': {'key': self.project.id},
                self.project.IK_ISSUE_TYPE: {'name': 'Bug'},
                self.project.IK_PRIORITY: {'name': self.priority},
                self.project.IK_SUMMARY: f'[Automation] {os.path.basename(data.source).replace(".robot", "")} failures',
                self.project.IK_DESCRIPTION: description,
                self.project.IK_ENVIRONMENT: env if env else None,
                self.project.IK_ASSIGNEE: {'id': self._find_assignee(executor, suite_owner).accountId},
                self.project.IK_LABELS: ['automation'],
                self.project.IK_AFFECT_VERSIONS: [{'name': self._find_version().name}],
                self.project.IK_SPRINT: int(self._find_sprint().id)  # Sprint
            }
            issue = self.jira.create_issue(fields=issue_dict)
            BuiltIn().set_suite_metadata('Jira bug', f'{self.URL}/browse/{issue.key}')

    def _find_assignee(self, executor=None, owner=None, default_user=DEFAULT_USER):
        # Trying to find assignee by referenced executor first
        # If unable to find out suitable assignee, trying to find by referenced suite owner
        # If still unable to find out suitable assignee, return the default user id
        if self.jira:
            if executor:
                users = self.jira.search_users(query=executor.lower())
                if users:
                    return users[0]
            if owner:
                users = self.jira.search_users(query=owner.lower())
                if users:
                    return users[0]
            if default_user:
                return self.jira.search_users(query=default_user)[0]
            return self.jira.search_users(query=OpenBug.DEFAULT_USER)[0]

    def _find_version(self):
        # Return the next upcoming version
        if self.jira:
            project_versions = (project_version for project_version in self.jira.project_versions(self.project.id)
                                if not project_version.released
                                and not project_version.archived)
            project_versions = sorted(project_versions, key=lambda v: int(v.id))
            if project_versions:
                return project_versions[0]

    def _find_sprint(self):
        # Return the last started active sprint
        if self.jira:
            sprints = sorted(self.jira.sprints(self.project.master_board, state='active'),
                             key=lambda sprint: sprint.startDate, reverse=True)
            if sprints:
                return sprints[0]
