#!/usr/bin/env python3

try:
    from corelib import ApiHandler, Logger, Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class ApiModel:

    def __init__(self, project_name, env):
        self.project_name = project_name
        self.env = env
        self.api = ApiHandler.ApiHandler()

        self.logger = Logger.Logger(__name__.split('.')[-1], log_level='INFO')
