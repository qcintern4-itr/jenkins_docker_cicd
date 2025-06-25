#!/usr/bin/env python3

try:
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class ConfigHandlerModel:

    def __init__(self, project_name, env):
        self.project_name = project_name.lower()
        self.env = env.lower()

        self.PROJECT_DIR = f'project_{self.project_name}'
        self.CONFIG_DIR = f'{self.PROJECT_DIR}/config'
        self.LIB_DIR = f'{self.PROJECT_DIR}/lib'
        self.TEST_DIR = f'{self.PROJECT_DIR}/test'
        self.UTILS_DIR = f'{self.PROJECT_DIR}/utils'

        self._params = Utils.read_config_file(f'{self.CONFIG_DIR}/{env}.yaml')

    @property
    def params(self):
        return dict(self._params)

    def get_config_param(self, key_path):
        return Utils.get_dict_value(self._params, key_path)

    def get_mapp_locators(self, screen, device_os):
        full_locators = Utils.read_config_file(f'{self.CONFIG_DIR}/mapp_locators/{screen.lower()}.yaml')
        locators = {
            locator_key: locator_value.get(device_os) if isinstance(locator_value, dict) else locator_value
            for locator_key, locator_value in full_locators.items()
        }
        return Utils.dict_to_class_object(locators)
