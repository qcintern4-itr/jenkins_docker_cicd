#!/usr/bin/env python3

try:
    from project_bioflux_clinic_portal.lib.ApiModel import BfApiModel

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Sales(BfApiModel):

    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, env):
        super().__init__(env=env)

    # ------------- #
    # - MUTATIONS - #
    # ------------- #

    def api_create_accessory_pricing(self):
        pass

    def api_update_accessory_pricing(self):
        pass

    def api_create_device_pricing(self):
        pass

    def api_update_device_pricing(self):
        pass

    def api_create_study_pricing(self):
        pass

    def api_update_study_pricing(self):
        pass

    def api_create_device_utilization_goal(self):
        pass

    def api_update_device_utilization_goal(self):
        pass

    def api_create_sales_user(self):
        pass

    def api_update_sales_user(self):
        pass

    def api_create_bionomix(self):
        pass

    def api_update_bionomix(self):
        pass

    def api_send_email_bionomix_report(self):
        pass

    def api_update_bionomix_config(self):
        pass

    # ----------- #
    # - QUERIES - #
    # ----------- #

    def api_sales_facility(self):
        pass

    def api_sales_facilities(self):
        pass

    def api_low_performance_sales_facilities(self):
        pass

    def api_sales_user(self):
        pass

    def api_sales_users(self):
        pass

    def api_sales_statistic(self):
        pass

    def api_sales_summary(self):
        pass
