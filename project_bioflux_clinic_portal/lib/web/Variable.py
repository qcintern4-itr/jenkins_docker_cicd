#!/usr/bin/env python3

try:
    from project_bioflux_clinic_portal.lib.WebPage import WebPage
    from project_bioflux_clinic_portal.config.web_locators import common as locators
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class AuthSingin(object):
    """
    Handle login page
    """
    Inbox = 'INBOX'
    Recent_reports = 'Recent reports'


class Model(object):
    All_models = 'All models'
    Bioflux = 'Bioflux'
    Biocore = 'Biocore/Biotres'
