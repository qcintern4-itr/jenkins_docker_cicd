#!/usr/bin/env python3
import time

try:
    from corelib import Utils
    from project_bioflux_clinic_portal.lib.ApiModel import BfApiModel

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Clinic(BfApiModel):
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, env):
        super().__init__(env=env)
        self.service = 'clinic'

    def wait_until_study_active(self):
        pass

    def wait_until_study_completed(self, token, inputs, timeout=130):
        return Utils.wait_until(
            func=self.api_clinic_studies, args=(token, inputs),
            on_condition=lambda value: value['body']['data']['clinicStudies'][0]['status'].lower() == 'done',
            timeout=timeout
        )

    def wait_until_study_deleted(self, token, inputs):
        pass

    # ------------- #
    # - MUTATIONS - #
    # ------------- #

    def api_create_referring_physician(self, token, **inputs):
        """
        API createReferringPhysician
        https://admin-backend.delta.bioflux.io/
        @param token: (str)
        @param inputs: (dict) refer to inputs part in the DOCS with keyword createReferringPhysician
        @return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='Clinic', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='createReferringPhysician',
                                              bf_token=token, bf_variables=inputs)

    def api_create_study(self, token, inputs_file):
        """
        API createStudy
        https://bioflux.gitlab.io/documentation/backend-specification/web-server/graphql/mutations/createStudy/
        :param token: (str)
        :param inputs_file: (str) inputs file config, refer to inputs part in the documentation
        :return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='Clinic', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='createStudy',
                                              bf_token=token, bf_variables_config=inputs_file)

    def api_update_study(self, token, inputs_file):
        """
        API updateStudy
        https://admin-backend.delta.bioflux.io/
        @param token: (str)
        @param inputs_file: (str) inputs file config, refer to inputs part in the DOCS
        @return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='Clinic', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='updateStudy',
                                              bf_token=token, bf_variables_config=inputs_file)

    def get_evaluation_event(self, token, **inputs):
        """
        API getEvaluationEvent
        https://admin-backend.delta.bioflux.io/
        @param token: (str)
        @param inputs: (dict) refer to inputs part in the DOCS with keyword getEvaluationEvent
        @return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='Clinic', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='getEvaluationEvent',
                                              bf_token=token, bf_variables=inputs)

    def api_delete_studies(self, token, **inputs):
        """
        API deleteStudies
        https://admin-backend.delta.bioflux.io/
        @param token: (str)
        @param inputs: (dict) refer to inputs part in the DOCS with keyword deleteStudies
        @return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='Clinic', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='deleteStudies',
                                              bf_token=token, bf_variables=inputs)

    def api_stop_study(self, token, study_id):
        """
        API stopStudy
        https://bioflux.gitlab.io/documentation/backend-specification/web-server/graphql/mutations/stopStudy/
        :param token: (str)
        :param study_id: (int)
        :return: (dict) formatted response
        """
        _input = {
            'studyFid': int(study_id)
        }
        data = self.send_bf_request_on_portal(selected_portal='Clinic', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='stopStudy',
                                              bf_token=token, bf_variables=_input)
        if self.wait_until_study_completed(token, {'filter': _input}):
            return data
        raise Exception(data['body']['errors'][0]['message'])

    def api_edit_physician_interpretation(self, token, **inputs):
        """
        API editPhysicianInterpretation
        https://admin-backend.delta.bioflux.io/
        @param token: (str)
        @param inputs: (dict) refer to inputs part in the DOCS with keyword editPhysicianInterpretation
        @return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='Clinic', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='editPhysicianInterpretation',
                                              bf_token=token, bf_variables=inputs)

    def api_edit_physician_note(self):
        pass

    def api_edit_user_setting(self):
        pass

    def api_mark_inbox(self, token, **inputs):
        """
        API markInbox
        https://admin-backend.delta.bioflux.io/
        @param token: (str)
        @param inputs: (dict) refer to inputs part in the DOCS
        @return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='Clinic', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='markInbox',
                                              bf_token=token, bf_variables=inputs)

    def api_mark_report_as_acknowledged(self):
        pass

    def api_resolve_artifact_study(self):
        pass

    def api_restore_study(self, token, **inputs):
        """
        API restoreStudy
        https://admin-backend.delta.bioflux.io/
        @param token: (str)
        @param inputs: (dict) refer to inputs part in the DOCS
        @return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='Clinic', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='restoreStudy',
                                              bf_token=token, bf_variables=inputs)

    def api_save_signature(self):
        pass

    def api_send_feedback_email(self):
        pass

    def api_start_ecg_streaming(self):
        pass

    def api_update_facility_study_setting(self):
        pass

    def api_update_notifications(self):
        pass

    def api_upload_study(self):
        pass

    def api_view_tutorial_later(self):
        pass

    def api_create_instant_report(self, token, **inputs):
        """
        API createInstantReport
        https://admin-backend.delta.bioflux.io/
        @param token: (str)
        @param inputs: (dict) refer to inputs part in the DOCS
        @return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='Clinic', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='createInstantReport',
                                              bf_token=token, bf_variables=inputs)

    def api_delete_instant_report(self, token, **inputs):
        """
        API deleteInstantReport
        https://admin-backend.delta.bioflux.io/
        @param token: (str)
        @param inputs: (dict) refer to inputs part in the DOCS
        @return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='Clinic', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='deleteInstantReport',
                                              bf_token=token, bf_variables=inputs)

    def api_resolve_support_request(self, token, **inputs):
        """
        API updateSupportRequest
        https://admin-backend.delta.bioflux.io/
        @param token: (str)
        @param inputs: (dict) refer to inputs part in the DOCS
        @return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='CallCenter', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='updateSupportRequest',
                                              bf_token=token, bf_variables=inputs)

    def api_generate_summary_report(self, token, **inputs):
        """
        API generateSummaryReport
        https://admin-backend.delta.bioflux.io/
        @param token: (str)
        @param inputs: (dict) refer to inputs part in the DOCS
        @return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='CallCenter', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='generateSummaryReport',
                                              bf_token=token, bf_variables=inputs)

    def api_update_report_status(self, token, **inputs):
        """
        API updateReportStatus
        https://admin-backend.delta.bioflux.io/
        @param token: (str)
        @param inputs: (dict) refer to inputs part in the DOCS
        @return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='CallCenter', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='updateReportStatus',
                                              bf_token=token, bf_variables=inputs)

    def api_update_facility_note(self, token, **inputs):
        """
        API updateFacilityNote
        https://admin-backend.delta.bioflux.io/
        @param token: (str)
        @param inputs: (dict) refer to inputs part in the DOCS
        @return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='CallCenter', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='updateFacilityNote',
                                              bf_token=token, bf_variables=inputs)

    def api_assign_tasks(self, token, **inputs):
        """
        API assignTasks
        https://admin-backend.delta.bioflux.io/
        @param token: (str)
        @param inputs: (dict) refer to inputs part in the DOCS
        @return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='CallCenter', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='assignTasks',
                                              bf_token=token, bf_variables=inputs)

    def api_send_inbox(self, token, **inputs):
        """
        API sendInbox
        https://admin-backend.delta.bioflux.io/
        @param token: (str)
        @param inputs: (dict) refer to inputs part in the DOCS
        @return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='CallCenter', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='sendInbox',
                                              bf_token=token, bf_variables=inputs)

    # ----------- #
    # - QUERIES - #
    # ----------- #

    def api_check_device_status(self, selected_portal, token, **inputs):
        """
        API check the device status
        https://admin-backend.delta.bioflux.io/
        @param selected_portal: (str) selected portal
        @param token: (str)
        @param inputs: (dict) refer to inputs part in the DOCS with keyword callCenterDevices
        @return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal=selected_portal, method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='callCenterDevices',
                                              bf_token=token, bf_variables=inputs)

    def api_all_support_request(self, selected_portal, token, **inputs):
        """
        API clinicTickets get ticket sent from Clinic
        https://admin-backend.delta.bioflux.io/
        @param selected_portal: (str) selected portal
        @param token: (str)
        @param inputs: (dict) refer to inputs part in the DOCS with keyword clinicTickets
        @return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal=selected_portal, method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='clinicTickets',
                                              bf_token=token, bf_variables=inputs)

    def api_clinic_studies(self, token, inputs):
        """
        API clinicStudies
        https://bioflux.gitlab.io/documentation/backend-specification/web-server/graphql/queries/clinicStudies/
        :param token: (str)
        :param inputs: (dict) refer to inputs part in the documentation
        :return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='Clinic', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='clinicStudies',
                                              bf_token=token, bf_variables=inputs)

    def api_deleted_studies(self, token, **inputs):
        """
        API deletedStudies
        https://admin-backend.delta.bioflux.io/
        @param token: (str)
        @param inputs: (dict) refer to inputs part in the DOCS
        @return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='Clinic', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='deletedStudies',
                                              bf_token=token, bf_variables=inputs)

    def api_get_ecg_data_map(self, token, **inputs):
        """
        API getEcgDataMap
        https://admin-backend.delta.bioflux.io/
        @param token: (str)
        @param inputs: (dict) refer to inputs part in the DOCS
        @return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='Clinic', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='getEcgDataMap',
                                              bf_token=token, bf_variables=inputs)

    def api_get_inbox_statistics(self):
        pass

    def api_has_notification(self):
        pass

    def api_inboxes(self, token, **inputs):
        """
        API inboxes
        https://admin-backend.delta.bioflux.io/
        @param token: (str)
        @param inputs: (dict) refer to inputs part in the DOCS
        @return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='Clinic', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='inboxes',
                                              bf_token=token, bf_variables=inputs)

    def api_instant_report(self):
        pass

    def api_instant_report_count(self, token, **inputs):
        """
        API instantReportCount
        https://admin-backend.delta.bioflux.io/
        @param token: (str)
        @param inputs: (dict) refer to inputs part in the DOCS
        @return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='Clinic', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='instantReportCount',
                                              bf_token=token, bf_variables=inputs)

    def api_instant_reports(self, token, **inputs):
        """
        API instantReports
        https://admin-backend.delta.bioflux.io/
        @param token: (str)
        @param inputs: (dict) refer to inputs part in the DOCS
        @return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='Clinic', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='instantReports',
                                              bf_token=token, bf_variables=inputs)

    def api_notifications(self, token, **inputs):
        """
        API notifications
        https://admin-backend.delta.bioflux.io/
        @param token: (str)
        @param inputs: (dict) refer to inputs part in the DOCS
        @return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='Clinic', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='notifications',
                                              bf_token=token, bf_variables=inputs)

    def api_physicians(self):
        pass

    def api_physician_studies(self):
        pass

    def api_unread_inbox_counts(self):
        pass

    def api_callcenter_studies(self, token, **inputs):
        """
        API callCenterStudies
        https://admin-backend.delta.bioflux.io/
        :param token: (str)
        :param inputs: (dict) refer to inputs part in the DOCS
        :return: (dict) formatted response
        """
        return self.send_bf_request_on_portal(selected_portal='CallCenter', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='callCenterStudies',
                                              bf_token=token, bf_variables=inputs)

    # -------- #
    # - gRPC - #
    # -------- #

    def api_notify_clinic_user(self):
        pass

    #  ---------- #
    #  - Custom - #
    #  ---------- #

    def api_create_study_on(self, token, facility=None, device_id=None, study_type=None, device_type=None):
        """
        API createStudy with spec args
        :param token: (str)
        :param facility: (str) facility friendly id
        :param device_id: (str)
        :param study_type: (str)
        :param device_type: (str)
        :return: (dict) formatted response
        """
        _data = Utils.read_config_file('project_bioflux_clinic_portal/config/study_inputs/create_study_input.yaml')
        if facility:
            _data['input']['facility'] = facility
        if device_id:
            _data['input']['deviceId'] = device_id
        if study_type:
            _data['input']['studyType'] = study_type
        if device_type:
            _data['input']['deviceType'] = device_type
        return self.send_bf_request_on_portal(selected_portal='Clinic', method='POST', url=self.URL,
                                              bf_service=self.service, bf_operation='createStudy',
                                              bf_token=token, bf_variables=_data)
