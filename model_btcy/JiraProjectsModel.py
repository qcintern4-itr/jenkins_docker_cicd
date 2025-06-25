#!/usr/bin/env python3

try:
    pass

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class BaseProject:
    id = None
    master_board = None
    # Issue key fields
    IK_ISSUE_TYPE = None
    IK_PRIORITY = None
    IK_SUMMARY = None
    IK_DESCRIPTION = None
    IK_ENVIRONMENT = None
    IK_ASSIGNEE = None
    IK_LABELS = None
    IK_AFFECT_VERSIONS = None
    IK_SPRINT = None


class AdminPortal(BaseProject):
    pass


class BillingPortal(BaseProject):
    pass


class BiocareApp(BaseProject):
    id = 'BIOC'
    master_board = ''
    # Issue key fields
    IK_ISSUE_TYPE = 'issuetype'
    IK_PRIORITY = 'priority'
    IK_SUMMARY = 'summary'
    IK_DESCRIPTION = 'description'
    IK_ENVIRONMENT = 'environment'
    IK_ASSIGNEE = 'assignee'
    IK_LABELS = 'labels'
    IK_AFFECT_VERSIONS = 'versions'
    IK_SPRINT = 'customfield_10121'


class BiodirectPortal(BaseProject):
    pass


class BiofluxCallCenterPortal(BaseProject):
    pass


class BiofluxClinicApp(BaseProject):
    pass


class BiofluxClinicPortal(BaseProject):
    pass


class BiofluxDevice(BaseProject):
    pass


class BioheartApp(BaseProject):
    pass


class BioheartDevice(BaseProject):
    pass


class BioheartPortal(BaseProject):
    pass


class BiotresDevice(BaseProject):
    pass


class BiotresGateway(BaseProject):
    pass


class BiotresMct(BaseProject):
    pass


class CardiacPatientApp(BaseProject):
    pass


class CardiacPortal(BaseProject):
    pass


class SalesPortal(BaseProject):
    pass


class SupportPortal(BaseProject):
    pass


class TelemedApp(BaseProject):
    pass


class TelemedPortal(BaseProject):
    pass


class Test(BaseProject):
    id = 'LTMTEST'
    master_board = 543
    # Issue key fields
    IK_ISSUE_TYPE = 'issuetype'
    IK_PRIORITY = 'priority'
    IK_SUMMARY = 'summary'
    IK_DESCRIPTION = 'description'
    IK_ENVIRONMENT = 'environment'
    IK_ASSIGNEE = 'assignee'
    IK_LABELS = 'labels'
    IK_AFFECT_VERSIONS = 'versions'
    IK_SPRINT = 'customfield_10121'
