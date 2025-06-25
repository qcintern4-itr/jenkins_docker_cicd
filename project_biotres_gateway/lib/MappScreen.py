#!/usr/bin/env python3

try:
    from model_btcy.MappScreenModel import MappScreenModel
    from project_biotres_gateway.lib import ConfigHandler

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class MappScreen(MappScreenModel):

    def __init__(self, app, env, screen):
        super().__init__(project_name='biotres_gateway', app=app, env=env, screen=screen)
        self.cfg = ConfigHandler.ConfigHandler(self.env)
