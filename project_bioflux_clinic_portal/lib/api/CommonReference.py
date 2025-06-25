#!/usr/bin/env python3

try:
    from project_bioflux_clinic_portal.lib.ApiModel import BfApiModel

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class CommonReference(BfApiModel):

    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, env):
        super().__init__(env=env)

    # ------------- #
    # - MUTATIONS - #
    # ------------- #

    def api_download_pdf_report(self):
        pass

    def api_get_signature(self):
        pass

    # ----------- #
    # - QUERIES - #
    # ----------- #

    def api_audit_logs(self):
        pass

    def api_device(self):
        pass

    def api_call_center_devices(self):
        pass

    def api_facility(self):
        pass

    def api_ongoing_study_count(self):
        pass

    def api_report(self):
        pass

    def api_request_file_upload(self):
        pass

    def api_studies(self):
        pass

    def api_study(self):
        pass

    def api_deleted_study(self):
        pass

    def api_user(self):
        pass
