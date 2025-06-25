#!/usr/bin/env python3

try:
    from corelib import WebHandler, Logger

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class WebPageModel:

    def __init__(self, project_name, browser, env, locators):
        self.project_name = project_name
        self.browser = browser
        self.env = env
        self.LCT = locators

        self.logger = Logger.Logger(__name__.split('.')[-1], log_level='INFO')
