#!/usr/bin/env python3

try:
    from model_btcy.ApiModel import ApiModel
    from project_bioflux_clinic_portal.lib import ConfigHandler

    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class BfApiModel(ApiModel):

    def __init__(self, env):
        super().__init__(project_name='bioflux_clinic_portal', env=env)
        self.cfg = ConfigHandler.ConfigHandler(env=self.env)
        self.URL = self.cfg.params.get('API_BASE_URL')

    def send_bf_request(self, method, url, bf_service, bf_operation, bf_token=None,
                        bf_variables=None, bf_variables_config=None):
        """
        Send Bioflux request
        :param method: (str)
        :param url: (str)
        :param bf_service: (str)
        :param bf_operation: (str)
        :param bf_token: (str)
        :param bf_variables: (dict)
        :param bf_variables_config: (str) config file of variables
        :return:
        """
        headers = {'access-token': bf_token} if bf_token else None
        _json = dict()
        _json['operationName'] = bf_operation
        if bf_variables:
            _json['variables'] = bf_variables
        elif bf_variables_config:
            _json['variables'] = Utils.read_config_file(bf_variables_config)
        _json['query'] = self.cfg.get_graphql_query(service=bf_service.lower(), operation=bf_operation)
        return self.api.send_request(method=method, url=url, headers=headers, json=_json)

    def send_bf_request_on_portal(self, selected_portal, method, url, bf_service, bf_operation, bf_token=None,
                                  bf_variables=None, bf_variables_config=None):
        """
        Send Bioflux request
        :param method: (str)
        :param url: (str)
        :param bf_service: (str)
        :param bf_operation: (str)
        :param bf_token: (str)
        :param selected_portal: (str)
        :param bf_variables: (dict)
        :param bf_variables_config: (str) config file of variables
        :return:
        """
        headers = {'access-token': bf_token, 'selected-portal': selected_portal} if bf_token else None
        _json = dict()
        _json['operationName'] = bf_operation
        if bf_variables:
            _json['variables'] = bf_variables
        elif bf_variables_config:
            _json['variables'] = Utils.read_config_file(bf_variables_config)
        _json['query'] = self.cfg.get_graphql_query(service=bf_service.lower(), operation=bf_operation)
        return self.api.send_request(method=method, url=url, headers=headers, json=_json)
