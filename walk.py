#!/usr/bin/env python3

try:
    import os
    import argparse
    from utils import Inspector
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class SuiteValidation:

    def __init__(self, suite_id, suite_data):
        self.suite_id = suite_id
        self.suite_data = suite_data

    def master_check(self):
        return [getattr(self, method)() for method in self.__dir__() if method.startswith('check_')]

    def check_source(self):
        return Inspector.TS_SOURCE in self.suite_data, 'missing source'

    def check_description(self):
        return Inspector.TS_DESCRIPTION in self.suite_data, 'missing description'

    def check_sid(self):
        if Inspector.TS_ID in self.suite_data:
            return self.suite_data[Inspector.TS_ID] == self.suite_id, 'sid mismatch'
        return False, 'missing sid'

    def check_suite_owner(self):
        return Inspector.TS_OWNER in self.suite_data, 'missing suite owner'

    def check_force_tags(self):
        if Inspector.TS_FORCE_TAGS in self.suite_data:
            return self.suite_id in self.suite_data[Inspector.TS_FORCE_TAGS], 'force tags must contain sid'
        return False, 'missing force tags'

    def check_test_domains(self):
        valid_domains = ['web', 'mapp', 'device']
        if Inspector.TS_FORCE_TAGS in self.suite_data:
            return any(domain in self.suite_data[Inspector.TS_FORCE_TAGS] for domain in valid_domains),\
                f'missing or incorrect test domain, valid test domains: {valid_domains}'
        return False, 'missing test domain'

    def check_default_test_timeout(self):
        return Inspector.TS_DEFAULT_TEST_TIMEOUT in self.suite_data, 'missing default test timeout'

    def check_test_cases(self):
        return Inspector.TS_CASES in self.suite_data, 'no test cases'


class CaseValidation:

    def __init__(self, suite_id, case_id, case_data):
        self.suite_id = suite_id
        self.case_id = case_id
        self.case_data = case_data

    def master_check(self):
        return [getattr(self, method)() for method in self.__dir__() if method.startswith('check_')]

    def check_suite(self):
        return self.case_id.startswith(self.suite_id + '-'), 'Case ID not prefixed by Suite ID'

    def check_case_id(self):
        max_len = 100
        return len(self.case_id) <= max_len, f'Number of characters of Case ID should not exceed {max_len}'

    def check_description(self):
        return bool(self.case_data[Inspector.TC_DESCRIPTION]), 'missing description'

    def check_documentation(self):
        return Inspector.TC_DOCUMENTATION in self.case_data, 'missing documentation'

    def check_author(self):
        return Inspector.TC_AUTHOR in self.case_data or not self.case_data.get(Inspector.TC_AUTHOR), 'missing author'

    def check_tags(self):
        if Inspector.TC_TAGS in self.case_data:
            tags = set(self.case_data[Inspector.TC_TAGS])

            # Must contain case ID in tags
            if self.case_id not in tags:
                return False, 'tags should contain Case ID'

            # Cannot contain both 'auto' and 'manual' at the same time
            if {'auto', 'manual'} <= tags:
                return False, 'tag should not contain both `auto` and `manual`'

            # Must contain at least one of: auto / manual / RP1-RP3
            run_phases = {'RP1', 'RP2', 'RP3'}
            has_run_tag = bool(tags & run_phases or 'auto' in tags or 'manual' in tags)
            if not has_run_tag:
                return False, 'tags must contain one of: `auto`, `manual`, or `RP1`/`RP2`/`RP3`'

            return True, 'no tags errors'

        return False, 'missing tags'


def validate(data):
    _errors = {}  # The final errors to be returned
    for suite_id, suite_data in data.items():
        _err_list = []
        # suite errors
        suite_errors = [err for status, err in SuiteValidation(suite_id, suite_data).master_check() if not status]
        if suite_errors:
            _err_list.extend(suite_errors)
        # cases' errors
        for case_id, case_data in suite_data.get(Inspector.TS_CASES, {}).items():
            case_errors = [f'{case_id}: {err}'
                           for status, err in CaseValidation(suite_id, case_id, case_data).master_check()
                           if not status]
            if case_errors:
                _err_list.extend(case_errors)
        # Save to final errors if any
        if _err_list:
            _errors[suite_data[Inspector.TS_SOURCE]] = _err_list
    return _errors


if __name__ == '__main__':
    if os.path.basename(os.getcwd()) != 'btcy-qa-tool-auto_fwk':
        raise Exception('Script is executed at `btcy-qa-tool-auto_fwk` directory ONLY.')
    parser = argparse.ArgumentParser(description='Walk though test projects and test suites.\n')
    parser.add_argument('-p', '--project', help='project paths, if not provide, walk through all projects',
                        nargs='+', metavar='PATH')
    parser.add_argument('-s', '--suite', help='suite paths, if not provide, walk through all suites',
                        nargs='+', metavar='PATH')
    parser.add_argument('-o', '--output', help='output file')
    parser.add_argument('--no-validate', help='disable validation', action='store_true')

    args = parser.parse_args()
    inspector = Inspector.TestInspector()

    FILE_PATH = args.output if args.output else 'tmp/walk.yaml'
    if args.project:
        on_projects = lambda p_path: os.path.realpath(p_path) in (os.path.realpath(p) for p in args.project)
    else:
        on_projects = lambda p_path: True
    if args.suite:
        on_suites = lambda s_path: os.path.realpath(s_path) in (os.path.realpath(s) for s in args.suite)
    else:
        on_suites = lambda s_path: True

    suites = inspector.find_suites(on_projects=on_projects, on_suites=on_suites)
    walk_data = inspector.get_suites_data(*suites)
    if not walk_data:
        print('No data after walking. Please double check.')
        exit(1)
    if not args.no_validate:
        errors = validate(walk_data)
        if errors:
            for s_source, s_errs in errors.items():
                print(f'+ {s_source}')
                [print(f'+--- {e}') for e in s_errs]
            exit(1)
    Utils.write_to_config_file(walk_data, 'yaml', FILE_PATH)
    if not os.path.exists(FILE_PATH):
        print(f'Unable to generate {FILE_PATH}')
        exit(1)
    print(FILE_PATH)
