#!/usr/bin/env python3

try:
    from project_bioflux_clinic_portal.lib.ApiModel import BfApiModel

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class CallCenter(BfApiModel):

    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, env):
        super().__init__(env=env)

    # ------------- #
    # - MUTATIONS - #
    # ------------- #

    def api_append_study_log(self):
        pass

    def api_assign_tasks(self):
        pass

    def api_calculate_hr(self):
        pass

    def api_cancel_study(self):
        pass

    def api_close_event(self):
        pass

    def api_close_events(self):
        pass

    def api_create_instant_report(self):
        pass

    def api_create_notification_report(self):
        pass

    def api_delete_instance_report(self):
        pass

    def api_delete_pending_command(self):
        pass

    def api_dismiss_reports(self):
        pass

    def api_fax_report(self):
        pass

    def api_generate_event_report(self):
        pass

    def api_generate_instant_report(self):
        pass

    def api_generate_summary_report(self):
        pass

    def api_get_evaluation_event(self):
        pass

    def api_mark_event_as_be_processed_later(self):
        pass

    def api_mark_report_as_artifact_report(self):
        pass

    def api_mark_reports_as_call_completed(self):
        pass

    def api_move_event_to_viable(self):
        pass

    def api_prepare_full_event_data(self):
        pass

    def api_recall_inbox(self):
        pass

    def api_register_bucket(self):
        pass

    def api_send_inbox(self):
        pass

    def api_send_report_email(self):
        pass

    def api_update_event(self):
        pass

    def api_update_facility_clinician_contacts(self):
        pass

    def api_update_facility_note(self):
        pass

    def api_update_report_status(self):
        pass

    def api_update_study(self):
        pass

    def api_update_study_setting(self):
        pass

    def api_update_summary_report(self):
        pass

    def api_upload_pdf_report(self):
        pass

    # ----------- #
    # - QUERIES - #
    # ----------- #

    def api_all_event_counts(self):
        pass

    def api_call_center_studies(self):
        pass

    def api_custom_event_counts(self):
        pass

    def api_event(self):
        pass

    def api_event_audit(self):
        pass

    def api_event_counts(self):
        pass

    def api_events(self):
        pass

    def api_has_ready_event_reports(self):
        pass

    def api_more_studies_for_current_session(self):
        pass

    def api_qa_team(self):
        pass

    def api_report_count(self):
        pass

    def api_report_event_summary(self):
        pass

    def api_report_reminder(self):
        pass

    def api_report_reminders(self):
        pass

    def api_report_test_summary(self):
        pass

    def api_studies_of_current_session(self):
        pass

    def api_summary_report_data(self):
        pass

    def api_summary_report_events(self):
        pass

    def api_task_overview(self):
        pass

    # -------- #
    # - gRPC - #
    # -------- #

    def api_regenerate_report(self):
        pass
