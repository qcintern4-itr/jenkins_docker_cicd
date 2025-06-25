#!/usr/bin/env python3

try:
    from functools import reduce
    from ftplib import FTP, error_temp, error_proto
    import os
    import shutil
    from corelib import Utils, Logger

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise

logger = Logger.Logger(__name__.split('.')[-1], log_level='INFO')


class CmdServerHandler:

    def __init__(self, host, user, password):
        self.host = host
        self.user = user
        self.password = password

        self.LOCAL_TMP_DIR = 'tmp'
        self.RM_BASE_DIR = '/DXH'
        self._session = None

        self.last_execution = None

    def __enter__(self):
        self.connect()
        return self

    def __exit__(self, *args):
        self.quit()

    def connect(self):
        if not self._session:
            self._session = FTP(host=self.host, user=self.user, passwd=self.password)

    def quit(self):
        if self._session:
            self._session.__exit__()

    def keep_alive(self):
        try:
            self._session.voidcmd('NOOP')
        except (error_temp, error_proto):
            logger.info('Session was dead, wake up a new session.')
            self._session = FTP(host=self.host, user=self.user, passwd=self.password)

    def is_device_dir_workable(self, device_id):
        dirs = self._session.nlst(self.RM_BASE_DIR)
        if f'{self.RM_BASE_DIR}/{device_id}' not in dirs:
            logger.info(f'[{self.host}] `{self.RM_BASE_DIR}/{device_id}` does not exist')
            return False
        dirs = self._session.nlst(f'{self.RM_BASE_DIR}/{device_id}')
        if f'{self.RM_BASE_DIR}/{device_id}/device' not in dirs or f'{self.RM_BASE_DIR}/{device_id}/user' not in dirs:
            logger.info(f'[{self.host}] `{self.RM_BASE_DIR}/{device_id}/device` '
                        f'and/or `{self.RM_BASE_DIR}/{device_id}/user` do not exist')
            return False
        return True

    def build_command_file(self, cmd_name, config_file=None, **kwargs):
        filepath = f'{self.LOCAL_TMP_DIR}/{cmd_name}.txt'
        params = kwargs if not config_file else Utils.read_config_file(config_file)
        content = '\n'.join(f'{key_value[0]}={key_value[1]}' for key_value in params.items())
        if os.path.isfile(filepath):
            os.remove(filepath)
        with open(filepath, 'w') as f:
            f.write(content)
        if not os.path.isfile(filepath):
            raise FileNotFoundError('Command file is not generated.')
        logger.info(f'Command file is generated: {filepath}')
        return filepath

    def upload_command_file(self, cmd_filepath, device_id):
        if not os.path.isfile(cmd_filepath):
            raise FileNotFoundError('Unable to upload, command file not found.')
        if not self.is_device_dir_workable(device_id):
            raise RuntimeError(f'[{self.host}] `{self.RM_BASE_DIR}/{device_id}` is not workable')
        rm_cmd_filepath = f'{self.RM_BASE_DIR}/{device_id}/user/{os.path.basename(cmd_filepath)}'
        with open(cmd_filepath, 'rb') as f:
            self._session.storbinary(f'STOR {rm_cmd_filepath}', f)
        logger.info(f'[{self.host}] Upload file done: {rm_cmd_filepath}')

    def get_command_files(self, device_id):
        return self._session.nlst(f'{self.RM_BASE_DIR}/{device_id}/user')

    def get_device_files(self, device_id):
        return self._session.nlst(f'{self.RM_BASE_DIR}/{device_id}/device')

    def get_device_logs(self, device_id, on_files=lambda filepath: True):
        files = self.get_device_files(device_id)
        output = {}
        for f in files:
            if on_files(f):
                content = []
                self._session.retrbinary(f'RETR {f}', content.append)
                output[f] = b''.join(content).decode('utf-8')
        return output

    def download_device_logs(self, device_id, on_files=lambda filepath: True,
                             parent_dir=None):
        dest_dir = f'{self.LOCAL_TMP_DIR}/{device_id}' if not parent_dir else f'{parent_dir}/{device_id}'
        if os.path.isdir(dest_dir):
            shutil.rmtree(dest_dir)
        os.makedirs(dest_dir)
        filepaths = self.get_device_files(device_id)
        for fp in filepaths:
            if on_files(fp):
                content = []
                self._session.retrbinary(f'RETR {fp}', content.append)
                local_filepath = f'{dest_dir}/{os.path.basename(fp)}'
                with open(local_filepath, 'wb') as f:
                    f.write(b''.join(content))
                logger.info(f'Download done: {local_filepath}')
