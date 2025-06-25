#!/usr/bin/env python3

try:
    from project_bioflux_clinic_portal.lib.ApiModel import BfApiModel
    import boto3

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Auth(BfApiModel):
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, env):
        super().__init__(env=env)
        self.service = 'auth'
        self.client = boto3.client('cognito-idp', 'us-east-2')

    def initiate_auth(self, username, password, client_id):
        return self.client.initiate_auth(
            AuthFlow='USER_PASSWORD_AUTH',
            AuthParameters={
                'USERNAME': username,
                'PASSWORD': password,
            },
            ClientId=client_id,
        )

    def api_change_password(self):
        pass

    def api_request_new_password(self):
        pass

    def api_check_password_token(self):
        pass

    def api_forgot_password(self):
        pass

    def api_login(self, **inputs):
        """
        API login
        https://bioflux.gitlab.io/documentation/backend-specification/web-server/graphql/mutations/login/
        :param inputs: (dict) refer to inputs part in the documentation
        :return: (dict) formatted response
        """
        return self.send_bf_request(method='POST', url=self.URL,
                                    bf_service=self.service, bf_operation='login', bf_variables=inputs)

    def api_logout(self):
        pass

    def api_relogin(self):
        pass

    def api_reset_password(self):
        pass

    def api_reset_password_by_admin(self):
        pass

    def api_send_verification_email(self):
        pass

    def api_set_new_password(self):
        pass

    def api_verify_email(self):
        pass
