#!/usr/bin/env python3

try:
    from corelib import MobileAppHandler, Logger
    from model_btcy.ConfigHandlerModel import ConfigHandlerModel

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class MappScreenModel:

    def __init__(self, project_name, app, env, screen):
        self.project_name = project_name
        self.app = app
        self.env = env
        self.LCT = ConfigHandlerModel(self.project_name, self.env).get_mapp_locators(screen, self.app.device_os)

        self.logger = Logger.Logger(__name__.split('.')[-1], log_level='INFO')

    def _map_value(self, android, ios):
        return {
            'android': android,
            'ios': ios
        }.get(self.app.device_os)
