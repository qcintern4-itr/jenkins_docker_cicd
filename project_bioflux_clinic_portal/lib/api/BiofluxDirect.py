#!/usr/bin/env python3

try:
    from project_bioflux_clinic_portal.lib.ApiModel import BfApiModel

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class BiofluxDirect(BfApiModel):
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, env):
        super().__init__(env=env)

    # ------------- #
    # - MUTATIONS - #
    # ------------- #

    def api_complete_bioflux_direct_follow_up(self):
        pass

    def api_confirm_bioflux_direct_return(self):
        pass

    def api_force_stop_bioflux_direct_study(self):
        pass

    def api_initiate_bioflux_direct_study(self):
        pass

    def api_rerun_bioflux_direct_study(self):
        pass

    def api_update_bioflux_direct_information(self):
        pass

    # ----------- #
    # - QUERIES - #
    # ----------- #

    def api_bioflux_direct(self):
        pass

    def api_bioflux_direct_devices(self):
        pass

    def api_bioflux_directs(self):
        pass

    # -------- #
    # - gRPC - #
    # -------- #

    def api_update_status(self):
        pass
