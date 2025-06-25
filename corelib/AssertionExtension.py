#!/usr/bin/env python3

try:
    from robot.utils import asserts as asrt
    from corelib import Logger
    from utils.ManualHandler import ResultDialog

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class AssertionExtension:

    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self):
        self.logger = Logger.Logger(__name__.split('.')[-1], log_level='INFO')

    def manual_should_be_passed(self, test_name, test_docs, msg=None):
        rsd = ResultDialog(None, test_name, test_docs)
        _msg = '' if not msg else msg
        status, comment = rsd()
        if comment:
            self.logger.info(comment)
            _msg += f'\nComment from executor: {comment}'
        _msg = None if not _msg.strip() else _msg.strip()
        asrt.assert_true(status == rsd.PASS, msg=_msg)
