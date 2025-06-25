#!/usr/bin/env python3

try:
    import requests
    from json.decoder import JSONDecodeError
    from corelib import Logger, Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class ApiHandler:

    ROBOT_LIBRARY_SCOPE = 'SUITE'
    REQUEST_TIMEOUT_DEFAULT = 10

    def __init__(self):
        self.logger = Logger.Logger(__name__.split('.')[-1], log_level='INFO')

    def send_request(self, method, url, timeout=REQUEST_TIMEOUT_DEFAULT, is_logged=True, format_response=True,
                     **kwargs):
        """
        Send request
        :param method:
        :param url:
        :param timeout:
        :param is_logged:
        :param format_response:
        :param kwargs:
        :return: formatted response
        """
        requests_map = {
            'GET': requests.get,
            'PUT': requests.put,
            'POST': requests.post,
            'PATCH': requests.patch,
            'DELETE': requests.delete
        }
        r = requests_map.get(method.upper())(url, timeout=timeout, **kwargs)
        if format_response:
            return self._format_response(r, is_logged)
        return r

    def send_template_request(self, template, timeout=REQUEST_TIMEOUT_DEFAULT, is_logged=True, format_response=True,
                              **kwargs):
        """
        Get request from a template, update request (if any), then send request
        :param template: (str) template file
        :param timeout:
        :param is_logged:
        :param format_response:
        :param kwargs: (dict) attributes to get updated
        :return: formatted response
        """
        n_kwargs = Utils.read_config_file(template)
        if kwargs:
            n_kwargs.update(**kwargs)
        return self.send_request(**n_kwargs, timeout=timeout, is_logged=is_logged, format_response=format_response)

    def _format_response(self, response, is_logged=True):
        """
        :param response: response object
        :return: a dict format of response includes the following keys:
            request url
            response body
            response code
            response headers
            response time (in seconds)
        """
        try:
            body = response.json()
        except JSONDecodeError:
            body = response.text
        output = {
            'url': response.url,
            'body': body,
            'code': response.status_code,
            'headers': response.headers,
            'time': response.elapsed.total_seconds()
        }
        if is_logged:
            self.logger.info(response)
            self.logger.info(output)
        return output
