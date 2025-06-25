#!/usr/bin/env python3

try:
    import os
    from robot.api.parsing import get_model, ModelVisitor

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


TS_SOURCE = 'source'
TS_ID = 'sid'
TS_OWNER = 'owner'
TS_DESCRIPTION = 'description'
TS_FORCE_TAGS = 'force_tags'
TS_DEFAULT_TEST_TIMEOUT = 'default_test_timeout'
TS_CASES = 'cases'

TC_DESCRIPTION = 'description'
TC_AUTHOR = 'author'
TC_DOCUMENTATION = 'documentation'
TC_TAGS = 'tags'
TC_TIMEOUT = 'timeout'
TC_AUTOMATED = 'automated'


class TestInspector:

    def find_projects(self, on_projects=lambda p_path: True):
        return [dir for dir in os.listdir() if os.path.isdir(dir) and dir.startswith('project_') and on_projects(dir)]

    def find_suites(self, on_projects=lambda p_path: True, on_suites=lambda s_path: True):
        suites = []
        project_paths = self.find_projects(on_projects=on_projects)
        for project_path in project_paths:
            for root, _, files in os.walk(project_path):
                # convert backward slash (\) to forward slash (/)
                [suites.append(os.path.join(root, f).replace('\\', '/')) for f in files
                 if f.endswith('.robot') and on_suites(os.path.join(root, f))]
        return suites

    def get_suites_data(self, *suite_paths):
        data = {}
        for suite_path in suite_paths:
            visitor = SuiteVisitor()
            model = get_model(suite_path)
            visitor.visit(model)
            data[os.path.basename(suite_path).split('.')[0]] = visitor.data
            del visitor
        return data


class SuiteVisitor(ModelVisitor):

    def __init__(self):
        self.data = {}
        self.CURRENT_CASE_ID = None

    def visit_File(self, node):
        # Call `generic_visit` to visit also child nodes.
        self.data = {}
        self.CURRENT_CASE_ID = None
        self.data[TS_SOURCE] = node.source
        self.generic_visit(node)

    def visit_Documentation(self, node):
        # only get author in Documentation of test case, not test suite or keywords
        if not self.CURRENT_CASE_ID:  # test suite docs
            self.data[TS_DESCRIPTION] = node.value
        else:  # within test case
            if TC_AUTHOR not in self.data[TS_CASES][self.CURRENT_CASE_ID]:
                self.data[TS_CASES][self.CURRENT_CASE_ID][TC_DOCUMENTATION] = node.value
                # author = [data_token.value for data_token in node.data_tokens
                #           if 'author:' in data_token.value.replace(' ', '').lower()]
                author = [line for line in node.value.split('\n') if 'author:' in line.lower()]
                if author:
                    self.data[TS_CASES][self.CURRENT_CASE_ID][TC_AUTHOR] = author[0].split(':')[1].strip()

    def visit_Metadata(self, node):
        self.data[node.name] = node.value

    def visit_ForceTags(self, node):
        self.data[TS_FORCE_TAGS] = list(node.values)

    def visit_TestTimeout(self, node):
        self.data[TS_DEFAULT_TEST_TIMEOUT] = node.value

    def visit_TestCaseName(self, node):
        if TS_CASES not in self.data:
            self.data[TS_CASES] = {}
        case_id = node.name.split(':')[0].strip()
        title = ':'.join(node.name.split(':')[1:]).strip()
        while case_id in self.data[TS_CASES]:
            case_id = 'duplicate-of-' + case_id
        self.CURRENT_CASE_ID = case_id
        self.data[TS_CASES][self.CURRENT_CASE_ID] = {}
        self.data[TS_CASES][self.CURRENT_CASE_ID][TC_DESCRIPTION] = title
        self.data[TS_CASES][self.CURRENT_CASE_ID][TC_AUTOMATED] = True  # default automated = True

    def visit_KeywordCall(self, node):
        if self.CURRENT_CASE_ID:  # within test case
            if self.data[TS_CASES][self.CURRENT_CASE_ID][TC_AUTOMATED] is True:
                if any('manualshouldbepassed' == data_token.value.lower().replace(' ', '').replace('_', '')
                       for data_token in node.data_tokens):
                    self.data[TS_CASES][self.CURRENT_CASE_ID][TC_AUTOMATED] = False

    def visit_Tags(self, node):
        self.data[TS_CASES][self.CURRENT_CASE_ID][TC_TAGS] = list(node.values)

    def visit_Timeout(self, node):
        self.data[TS_CASES][self.CURRENT_CASE_ID][TC_TIMEOUT] = node.value
