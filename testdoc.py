#!/usr/bin/env python3

try:
    import os
    import argparse
    import re
    from utils import Inspector
    from robot.testdoc import testdoc

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


DEFAULT_DIR = 'tmp'


def generate_td(*arguments, **options):
    testdoc(*arguments, **options)
    html_file = arguments[-1]
    with open(html_file, 'r', encoding='utf-8') as f:
        content = f.read()
    with open(html_file, 'w', encoding='utf-8') as f:
        content = re.sub(r''',"source":".*?"''', '', content)
        f.write(content)


if __name__ == '__main__':
    if os.path.basename(os.getcwd()) != 'btcy-qa-tool-auto_fwk':
        raise Exception('Script is executed at `btcy-qa-tool-auto_fwk` directory ONLY.')
    parser = argparse.ArgumentParser(description='Generate testdoc.\n')
    parser.add_argument('-p', '--project', help='project paths, default: all projects',
                        nargs='+', metavar='PATH')
    parser.add_argument('-s', '--suite', help='suite paths, default: all suites',
                        nargs='+', metavar='PATH')
    parser.add_argument('--split', help=f'each testdoc for each suite, stored in {DEFAULT_DIR}',
                        action='store_true')
    parser.add_argument('--split-in-place', help='each testdoc for each suite, stored in the same suite`s directory',
                        action='store_true')

    args = parser.parse_args()
    if args.split and args.split_in_place:
        parser.error('--split and --split-in-place cannot go together')

    inspector = Inspector.TestInspector()
    if args.project:
        on_projects = lambda _dir: os.path.realpath(_dir) in (os.path.realpath(p) for p in args.project)
    else:
        on_projects = lambda _dir: True
    if args.suite:
        on_suites = lambda _dir: os.path.realpath(_dir) in (os.path.realpath(p) for p in args.suite)
    else:
        on_suites = lambda _dir: True
    suites = inspector.find_suites(on_projects=on_projects, on_suites=on_suites)

    if args.split:
        [generate_td(suite, f'tmp/{os.path.basename(suite).replace(".robot", ".html")}') for suite in suites]
    elif args.split_in_place:
        [generate_td(suite, suite.replace('.robot', '.html')) for suite in suites]
    else:
        generate_td(*suites, f'tmp/testdoc.html')
