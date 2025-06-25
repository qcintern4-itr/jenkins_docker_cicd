#!/usr/bin/env python3

try:
    from project_bioflux_clinic_portal.lib.ApiModel import BfApiModel

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Admin(BfApiModel):
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, env):
        super().__init__(env=env)
        self.service = 'admin'

    # ------------- #
    # - MUTATIONS - #
    # ------------- #

    def api_assign_devices(self):
        pass

    def api_check_device_id(self):
        pass

    def api_check_email(self):
        pass

    def api_check_username(self):
        pass

    def api_create_app_info(self):
        pass

    def api_create_call_center_group(self):
        pass

    def api_create_device(self):
        pass

    def api_create_devices(self):
        pass

    def api_create_facility(self):
        pass

    def api_create_facility_group(self):
        pass

    def api_create_faq(self):
        pass

    def api_create_user(self):
        pass

    def api_delete_facility(self):
        pass

    def api_delete_faq(self):
        pass

    def api_update_app_info(self):
        pass

    def api_update_call_center_group(self):
        pass

    def api_update_device(self):
        pass

    def api_update_devices(self):
        pass

    def api_update_facility(self, token, facility_detail):
        def _input_format(_data):
            _facility_detail = _data['body']['data']['facility']
            return {
                'facilityInfo': {
                    'facilityId': _facility_detail['id'],
                    'props': {
                        'name': _facility_detail['name'],
                        'shortName': _facility_detail['shortName'],
                        'serviceType': _facility_detail['serviceType'],
                        'contact': _facility_detail['contact'],
                        'status': _facility_detail['status'],
                        'arrears': _facility_detail['arrears'],
                        'clinicianContacts': _facility_detail['clinicianContacts'],
                        'accountPayable': _facility_detail['accountPayable'],
                        'studySetting': _facility_detail['studySetting'],
                        'faxReportAutomatically': _facility_detail['faxReportAutomatically'],
                        'faxReportManually': _facility_detail['faxReportManually'],
                        'faxPhysicianAutomatically': _facility_detail['faxPhysicianAutomatically'],
                        'facilityNote': _facility_detail['facilityNote'],
                        'notificationEmail': _facility_detail['notificationEmail'],
                        'canSendReportEmail': _facility_detail['canSendReportEmail'],
                        'canUseBiofluxDirect': _facility_detail['canUseBiofluxDirect'],
                        'canUseBiocareCardiac': _facility_detail['canUseBiocareCardiac'],
                        'canAutoChangeLead': _facility_detail['canAutoChangeLead'],
                        'canViewFlaggedStudies': _facility_detail['canViewFlaggedStudies'],
                        'shouldCreateInterimReports': _facility_detail['shouldCreateInterimReports'],
                        'group': _facility_detail['group']['id'] if _facility_detail['group'] is not None else None,
                        'assignedSalesRepresentative': _facility_detail['assignedSalesRepresentative'][
                            'id'] if _facility_detail['assignedSalesRepresentative'] is not None else None
                    }
                }
            }

        return self.send_bf_request_on_portal(selected_portal='Admin', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='updateFacility',
                                              bf_token=token, bf_variables=_input_format(facility_detail))

    def api_update_facility_group(self):
        pass

    def api_update_faq(self):
        pass

    def api_update_firmware_version(self):
        pass

    def api_update_support_guideline(self):
        pass

    def api_update_user(self):
        pass

    # ----------- #
    # - QUERIES - #
    # ----------- #

    def api_app_info(self):
        pass

    def api_app_infos(self):
        pass

    def api_billing_users(self):
        pass

    def api_call_center_group(self):
        pass

    def api_call_center_groups(self):
        pass

    def api_call_center_users(self):
        pass

    def api_clinic_users(self):
        pass

    def api_devices(self):
        pass

    def api_facility(self, token, **inputs):
        return self.send_bf_request_on_portal(selected_portal='Admin', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='facility',
                                              bf_token=token, bf_variables=inputs)

    def api_facilities(self, token, query_by, id_or_name=None):
        inputs_map = {
            'filter': {
                query_by: id_or_name,
            },
            'limit': 10
        }
        if query_by:
            inputs_map['filter'][query_by] = str(id_or_name) if query_by == 'name' else int(id_or_name)
            return self.send_bf_request_on_portal(selected_portal='Admin', method='POST', url=self.URL,
                                                  bf_service=self.service, bf_operation='facilities',
                                                  bf_token=token, bf_variables=inputs_map)

    def api_facility_group(self):
        pass

    def api_facility_groups(self):
        pass

    def api_firmware_versions(self):
        pass

    def api_latest_app_version(self):
        pass

    def api_support_guideline(self):
        pass

    def api_support_users(self):
        pass

    def api_users(self):
        pass

    # Custom

    def api_get_facility_friendly_id(self, inputs):
        facility = self.api_facilities(**inputs) if isinstance(inputs, dict) else self.api_facilities(*inputs)
        return facility['body']['data']['facilities'][0]['id']

    def api_update_facility_financial_hold(self, token, facility_name, date):
        friendly_id = self.api_get_facility_friendly_id(dict(token=token, query_by='name', id_or_name=facility_name))
        fc_info = self.api_facility(token=token, id=friendly_id)
        fc_info['body']['data']['facility']['arrears'] = int(date)
        return self.api_update_facility(token, facility_detail=fc_info)

    def api_assign_facility_group(self, token, facility_id, assigned_group):
        data = self.api_facility(token=token, id=facility_id)
        data['body']['data']['facility']['group'] = dict(
            assigned_group) if assigned_group is not None else assigned_group
        return self.api_update_facility(token, facility_detail=data)
