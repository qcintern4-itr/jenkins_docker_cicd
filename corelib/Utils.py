#!/usr/bin/env python3

try:
    import time
    import hmac
    import hashlib
    import yaml
    import platform
    import json
    import xmltodict

    from corelib import Logger

    from yaml.scanner import ScannerError
    from json.decoder import JSONDecodeError

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


logger = Logger.Logger(__name__.split('.')[-1], log_level='INFO')


def parse_key_value(key_value, separator=':'):
    """
    Parse key value string-alike
    :param key_value: (str) key-value string
    :param separator: (str) separator/delimiter
    :return: (tuple) key and value if to_dict is False, (dict) if to_dict is True
    """
    kv = key_value.split(separator)
    return kv[0].strip(), separator.join(kv[1:]).strip()


def custom_sleep(timeout, interval=None,
                 passed=0):
    """
    Customize sleep function
    :param timeout: (int) time to sleep (in seconds)
    :param interval: (int) interval time to debug print (in seconds)
    :arg passed: accumulator for printing only, PLEASE DO NOT INPUT THIS WHEN USING THIS FUNCTION
    :return: None
    """
    if timeout == 0:
        return
    _interval = timeout if not interval else interval
    if passed == 0:
        logger.info('Going to sleep for %s seconds' % timeout)

    sleep_time = min(timeout, _interval)
    time.sleep(sleep_time)
    logger.info('%s seconds passed !!! %s seconds remaining ...' % (passed + sleep_time, timeout - sleep_time))
    custom_sleep(timeout - sleep_time, _interval, passed + sleep_time)


def wait_until_expect(func, args, expect, timeout=10, interval=1,
                      n=1):
    """
    Wait until output of a function reach an expected value
    :param func: function object
    :param args: (list/tuple) arguments of the function
    :param expect: expected value
    :param timeout: (int) timeout (in seconds)
    :param interval: (int) interval to check
    :arg n: accumulator for printing only, PLEASE DO NOT INPUT THIS WHEN USING THIS FUNCTION
    :return: (bool) is the expectation met within timeout
    """
    logger.info('Check #%s :' % n)
    actual = func(*args)
    logger.info('-- Expect: %s | Actual: %s' % (expect, actual))
    if actual == expect:
        return True
    if timeout <= 0:
        return False
    sleep_time = min(timeout, interval)
    time.sleep(sleep_time)
    return wait_until_expect(func, args, expect, timeout - sleep_time, interval, n + 1)


def wait_until_not_expect(func, args, not_expect, timeout=10, interval=1,
                          n=1):
    """
    Wait until output of a function not reach a value
    :param func: function object
    :param args: (list/tuple) arguments of the function
    :param not_expect: unexpected value
    :param timeout: (int) timeout (in seconds)
    :param interval: (int) interval to check
    :arg n: accumulator for printing only, PLEASE DO NOT INPUT THIS WHEN USING THIS FUNCTION
    :return: (bool) is the expectation met within timeout
    """
    logger.info('Check #%s :' % n)
    actual = func(*args)
    logger.info('-- Not Expect: %s | Actual: %s' % (not_expect, actual))
    if actual != not_expect:
        return True
    if timeout <= 0:
        return False
    sleep_time = min(timeout, interval)
    time.sleep(sleep_time)
    return wait_until_not_expect(func, args, not_expect, timeout - sleep_time, interval, n + 1)


def wait_until(func, args, on_condition, timeout=10, interval=1,
               n=1):
    """
    Wait until output of a function valid
    :param func: (func) executing function
    :param args: (list/tuple) arguments of the function
    :param on_condition: (func) conditional function on output of executing function
    :param timeout: (int) timeout (in seconds)
    :param interval: (int) interval to check
    :arg n: accumulator for printing only, PLEASE DO NOT INPUT THIS WHEN USING THIS FUNCTION
    :return: (bool) is the expectation met within timeout
    """
    value = func(*args)
    is_match = on_condition(value)
    logger.info(f'Check #{n} => Output: {value}, meet condition: {is_match}')
    if is_match:
        return True
    if timeout <= 0:
        return False
    sleep_time = min(timeout, interval)
    time.sleep(sleep_time)
    return wait_until(func, args, on_condition, timeout - sleep_time, interval, n + 1)


def generate_hmac_signature(algorithm, secret_key, content):
    """
    Generate an HMAC signature
    :param algorithm:
    :param secret_key:
    :param content: (str) the content to get encoded
    :return: (str) the encoded content
    """
    algorithm_map = {
        'sha256': hashlib.sha256
    }
    return hmac.new(bytes(secret_key, 'utf-8'), bytes(content, 'utf-8'), algorithm_map.get(algorithm)).hexdigest()


def read_config_file(file):
    """
    Read config file, supporting config files:
    - yaml
    - json
    :param file: (str) file path
    :return: python-format of the file content
    """
    with open(file, 'r') as f:
        try:
            return yaml.load(f, Loader=yaml.UnsafeLoader)
        except ScannerError:
            try:
                return json.load(f)
            except JSONDecodeError:
                raise Exception('The config file type is not supported or the config syntax got errors.')


def write_to_config_file(data, file_type, file,
                         indent=4):
    """
    Write to config file, supported file types: yaml/yml, json
    :param data:
    :param file_type: (str) yaml/yml or json
    :param file: (str) output file path
    :param indent: (int) indentation
    :return: None
    """
    if file_type in ('yaml', 'yml'):
        with open(file, 'w') as f:
            return yaml.dump(data, f, indent=indent)
    elif file_type == 'json':
        with open(file, 'w') as f:
            return json.dump(data, f, indent=indent)
    else:
        raise Exception(f'Config file type {file_type} is not supported')


def soft_format(text, format_func):
    """
    Try to format an object, if successful, return new formatted object, if not, return the original
    :param text:
    :param format_func:
    :return:
    """
    try:
        return format_func(text)
    except (ValueError, TypeError):
        return text


def xml_to_dict(xml_object, obj_type='text', to_dict=False):
    """
    Convert xml to dict
    :param xml_object: (str) the object containing xml content
    :param obj_type: (str) determine type of the `xml_object`, valid types: `text`, `file`
    :param to_dict: (bool) True - to a dict format, False - to an ordered dict
    :return: (dict/OrderedDict)
    """
    if obj_type == 'text':
        content = xml_object
    elif obj_type == 'file':
        with open(xml_object, 'r') as f:
            content = f.read()
    else:
        raise Exception('`type` argument should be either an xml `text` or an xml `file`')
    output = xmltodict.parse(content)
    if to_dict:
        return orddict_to_dict(output)
    return output


def orddict_to_dict(ordered_dict):
    """
    Convert an ordered dict to dict
    :param ordered_dict: (OrderedDict)
    :return: (dict)
    """
    return json.loads(json.dumps(ordered_dict))


def dict_to_class_object(_dict):
    """
    Convert a dict to class object
    :param _dict: (dict)
    :return: (class object)
    """
    class ObjectView:
        def __init__(self, d):
            self.__dict__ = d
    return ObjectView(_dict)


def get_machine_info():
    """
    Get the running machine information
    :return: (dict) machine information
    """
    return {
        'system': platform.system(),
        'release': platform.release(),
        'version': platform.version(),
        'platform': platform.platform(),
        'machine': platform.machine(),
        'processor': platform.processor()
    }


def get_dict_value(dictionary, path_to_key, sep='>', default=None):
    """
    Normal access to a value in dict: ` d.get('k1').get('k2').get('k3') ` or `d['k1']['k2']['k3']`
    This method provides an alternative way to get a value in dict. Usage examples:
        - get_dict_value(d, 'k1 > k2 > k3')
        - get_dict_value(d, 'k1:k2:k3', sep=':', default='')
    :param dictionary: (dict)
    :param path_to_key: (str)
    :param sep: (str) separator/delimiter
    :param default: (Any) default value if the path key is not correct
    :return: the value, return `default value` if the path key is not correct
    """
    if not path_to_key:
        return dictionary
    if isinstance(path_to_key, str):
        return get_dict_value(dictionary, path_to_key.split(sep), sep, default)
    try:
        new_dict = dictionary.get(path_to_key[0].strip())
        return get_dict_value(new_dict, path_to_key[1:], sep, default)
    except AttributeError:
        logger.warning('No data with key path available')
        return default


def group_tabular_data(header, contents, row=None):
    """
    Group a tabular data
    :param header: (list/tuple)
    :param contents: (list/tuple)
    :param row:
    :return:
    """
    if not contents:
        return {} if row else []
    logger.info(f'Header keys length: {len(header)}')
    logger.info(f'Contents length: {len(contents)}')
    if len(contents) % len(header) != 0:
        raise Exception('Unable to parse data.')
    data_partition = [contents[i:i + len(header)] for i in range(0, len(contents), len(header))]
    if row is None:
        return [{field: line_data[i] for i, field in enumerate(header)} for line_data in data_partition]
    if row <= len(data_partition):
        return {field: data_partition[row - 1][i] for i, field in enumerate(header)}
    logger.warning(f'Total rows: {len(data_partition)}, no data at row #{row}')

def log_time(func):
    def wrapper(*args, **kwargs):
        start_time = time.time()
        result = func(*args, **kwargs)
        end_time = time.time()
        duration = end_time - start_time
        print(f"Function '{func.__name__}' took {duration:.4f} seconds to run.")
        return result

    return wrapper


class SingletonMeta(type):
    """
    The Singleton implementation, used with metaclass.
    """
    _instances = {}

    def __call__(cls, *args, **kwargs):
        """
        Possible changes to the value of the `__init__` argument do not affect
        the returned instance.
        """
        if cls not in cls._instances:
            instance = super().__call__(*args, **kwargs)
            cls._instances[cls] = instance
        return cls._instances[cls]
