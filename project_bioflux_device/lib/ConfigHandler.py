#!/usr/bin/env python3

try:
    from corelib import Logger
    from model_btcy.ConfigHandlerModel import ConfigHandlerModel
    import os

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class ConfigHandler(ConfigHandlerModel):

    def __init__(self):
        super().__init__(project_name='bioflux_device', env='main')
