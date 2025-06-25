#!/usr/bin/env python3

try:
    import os
    import subprocess
    from functools import reduce
    from sqlalchemy import create_engine, text
    from corelib import Utils
    from utils import Inspector
    import sys

    from utils.dashboard import Cases, Suites, Executions, CaseExecutions

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class DashboardHandler:

    def __init__(self, dialect):
        self.dialect = dialect
        self.suites = Suites.Suites(self.dialect)
        self.cases = Cases.Cases(self.dialect)
        self.executions = Executions.Executions(self.dialect)
        self.case_executions = CaseExecutions.CaseExecutions(self.dialect)

        self.DB_WALK_FILE = 'tmp/walk.yaml'

    def drop_tables(self, *tables):
        if 'cases' in tables or 'all' in tables:
            self.cases.drop_table()
        if 'suites' in tables or 'all' in tables:
            self.suites.drop_table()
        if 'case_executions' in tables or 'all' in tables:
            self.case_executions.drop_table()
        if 'executions' in tables or 'all' in tables:
            self.executions.drop_table()

    def create_tables(self, *tables, grant_user=None):
        if 'suites' in tables or 'all' in tables:
            self.suites.create_table(grant_user=grant_user)
        if 'cases' in tables or 'all' in tables:
            self.cases.create_table(grant_user=grant_user)
        if 'executions' in tables or 'all' in tables:
            self.executions.create_table(grant_user=grant_user)
        if 'case_executions' in tables or 'all' in tables:
            self.case_executions.create_table(grant_user=grant_user)

    def update_suites_cases(self, walk_data=None):
        if walk_data:
            data = Utils.read_config_file(walk_data) if isinstance(walk_data, str) else walk_data
        else:
            ec = self._run_walk()
            if ec != 0:
                print('Please resolve above issues before updating suites and cases.')
                return
            if not os.path.isfile(self.DB_WALK_FILE):
                print('Walk file is not generated. Please double check.')
            data = Utils.read_config_file(self.DB_WALK_FILE)
        # Update suites and cases
        current_suites = [(row.id, row.suite_id) for row in self.suites.get_all_suites()]
        current_cases = [row.case_id for row in self.cases.get_all_cases()]
        for suite_id, suite_data in data.items():
            print("data", str(suite_data[Inspector.TS_SOURCE]))
            suite_info = {
                self.suites.SUITE_ID: suite_id,
                self.suites.DESCRIPTION: suite_data[Inspector.TS_DESCRIPTION].replace("'", "''"),
                self.suites.SUITE_OWNER: suite_data[Inspector.TS_OWNER],
                self.suites.SOURCE: str(suite_data[Inspector.TS_SOURCE]),
                self.suites.PROJECT: str(suite_data[Inspector.TS_SOURCE]).replace('\\', '/').split('/')[0].replace('project_', ''),
                self.suites.TEST_DOMAINS:
                    {'web', 'mapp', 'device'}.intersection(set(suite_data[Inspector.TS_FORCE_TAGS])),
                self.suites.FORCE_TAGS: suite_data[Inspector.TS_FORCE_TAGS],
                self.suites.UPDATED_AT: '<NOW()>'
            }
            if any(suite_id == sid for _, sid in current_suites):
                result = self.suites.update(**suite_info)
            else:
                result = self.suites.insert(list(suite_info.keys()), list(suite_info.values()))
            _id = [row.id for row in result][0]

            for case_id, case_data in suite_data['cases'].items():
                case_info = {
                    self.cases.SUITE_ID: _id,
                    self.cases.CASE_ID: case_id,
                    self.cases.DESCRIPTION: case_data[Inspector.TC_DESCRIPTION].replace("'", "''"),
                    self.cases.CASE_OWNER: case_data[Inspector.TC_AUTHOR],
                    self.cases.TAGS: case_data[Inspector.TC_TAGS],
                    self.cases.STATE:
                        'inactive' if 'inactive' in [t.lower() for t in case_data[Inspector.TC_TAGS]] else 'active',
                    self.cases.AUTOMATED: case_data[Inspector.TC_AUTOMATED],
                    self.cases.UPDATED_AT: '<NOW()>'
                }
                if case_id in current_cases:
                    self.cases.update(**case_info)
                else:
                    self.cases.insert(list(case_info.keys()),  list(case_info.values()))

    def delete_suites_cases(self, confirm=True):
        if confirm:
            proceed = self._confirm('(!) The following actions are to delete suites and cases from databases.\n'
                                    '(!) Confirm Yes to proceed: ')
            if not proceed:
                print('Action stopped.')
                return
        ec = self._run_walk()
        if ec != 0:
            print('Please resolve above issues before proceeding.')
            return
        if not os.path.isfile(self.DB_WALK_FILE):
            print('Walk file is not generated. Please double check.')
        # Delete suites first
        data = Utils.read_config_file(self.DB_WALK_FILE)
        current_suites = (row.suite_id for row in self.suites.get_all_suites())
        delete_suites = set(current_suites) - set(data.keys())
        if delete_suites:
            self.suites.delete(*delete_suites)
        # Delete cases
        walk_cases = reduce(lambda accu, lc: list(accu) + list(lc),
                            (suite_data['cases'].keys() for suite_data in data.values()))
        current_cases = (row.case_id for row in self.cases.get_all_cases())
        delete_cases = set(current_cases) - set(walk_cases)
        if delete_cases:
            self.cases.delete(*delete_cases)

    def insert_execution(self, **execution_dict):
        return self.executions.insert(list(execution_dict.keys()), list(execution_dict.values()))

    def update_execution(self, **execution_dict):
        return self.executions.update(**execution_dict)

    def insert_case_execution(self, **case_execution_dict):
        return self.case_executions.insert(list(case_execution_dict.keys()), list(case_execution_dict.values()))

    def update_case_execution(self, **case_execution_dict):
        return self.case_executions.update(**case_execution_dict)

    def _run_walk(self):
        if os.path.isfile(self.DB_WALK_FILE):
            os.remove(self.DB_WALK_FILE)
        process = subprocess.Popen(f'"{sys.executable}" ./walk.py -o {self.DB_WALK_FILE}', shell=True)
        process.communicate()
        return process.returncode

    @staticmethod
    def _confirm(_text):
        answer = input(_text)
        if answer.lower() in ['y', 'yes']:
            return True
        return False
