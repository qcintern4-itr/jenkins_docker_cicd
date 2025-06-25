#!/usr/bin/env python3

try:
    from model_btcy.ApiModel import ApiModel
    from project_cardiac_portal.lib import ConfigHandler
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class CdApiModel(ApiModel):

    def __init__(self, env):
        super().__init__(project_name='cardiac_portal', env=env)
        self.cfg = ConfigHandler.ConfigHandler(env=self.env)
        self.URL = self.cfg.params.get('API_BASE_URL')

    def send_cd_request(self, method, url, cd_service, cd_operation, cd_token=None, cd_variables=None,
                        cd_variables_config=None, is_logged=True):
        """
        Send Cardiac request
        :param method: (str)
        :param url: (str)
        :param cd_service: (str)
        :param cd_operation: (str)
        :param cd_token: (str)
        :param cd_variables: (dict)
        :param cd_variables_config: (str) config file of variables
        :param is_logged: (bool)
        :return:
        """
        headers = {'access-token': cd_token} if cd_token else None
        _json = dict()
        _json['operationName'] = cd_operation
        if cd_variables:
            _json['variables'] = cd_variables
        elif cd_variables_config:
            _json['variables'] = Utils.read_config_file(cd_variables_config)
        _json['query'] = self.cfg.get_graphql_query(service=cd_service.lower(), operation=cd_operation)
        return self.api.send_request(method=method, url=url, headers=headers, json=_json, is_logged=is_logged)
