#!/usr/bin/env python3

try:
    from project_bioflux_clinic_portal.lib.ApiModel import BfApiModel

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Support(BfApiModel):

    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, env):
        super().__init__(env=env)

    # ------------- #
    # - MUTATIONS - #
    # ------------- #

    def api_approve_rma_ticket(self):
        pass

    def api_complete_rma_ticket(self):
        pass

    def api_complete_support_request(self):
        pass

    def api_create_operation_form(self):
        pass

    def api_create_patient_ticket(self):
        pass

    def api_create_rma_ticket(self):
        pass

    def api_create_shipment_label(self):
        pass

    def api_create_shipment_order(self):
        pass

    def api_export_complaint_tickets(self):
        pass

    def api_reboot_device(self):
        pass

    def api_send_shipment_email(self):
        pass

    def api_submit_support_request(self):
        pass

    def api_update_complaint(self):
        pass

    def api_update_operation_form(self):
        pass

    def api_update_label_device_ids(self):
        pass

    def api_update_patient_ticket(self):
        pass

    def api_update_rma_device(self):
        pass

    def api_update_rma_ticket(self):
        pass

    def api_update_support_request(self):
        pass

    # ----------- #
    # - QUERIES - #
    # ----------- #

    def api_clinic_ticket(self):
        pass

    def api_clinic_tickets(self):
        pass

    def api_complaint(self):
        pass

    def api_complaints(self):
        pass

    def api_operation_form(self):
        pass

    def api_operation_forms(self):
        pass

    def api_patient_ticket(self):
        pass

    def api_patient_tickets(self):
        pass

    def api_rma_statistic(self):
        pass

    def api_rma_parcels(self):
        pass

    def api_rma_ticket(self):
        pass

    def api_rma_tickets(self):
        pass

    def api_draft_operation_form(self):
        pass
