#!/usr/bin/env python3

try:
    from corelib import Logger
    from model_btcy.ConfigHandlerModel import ConfigHandlerModel

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class ConfigHandler(ConfigHandlerModel):

    def __init__(self, env):
        super().__init__(project_name='twitter_portal', env=env)