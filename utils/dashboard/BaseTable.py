#!/usr/bin/env python3

try:
    from sqlalchemy import create_engine, text

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


# TODO: Implement ORM
class BaseTable:

    def __init__(self, dialect):
        self.engine = create_engine(dialect)

    def run_query(self, query, commit=False):
        with self.engine.connect() as conn:
            result = conn.execute(text(query))
            if commit:
                conn.commit()
        return result

    def _format_value(self, value):
        mapping = {
            list: lambda _value: f'ARRAY {str(_value)}' if _value else 'ARRAY[]::VARCHAR[]',
            tuple: lambda _value: f'ARRAY {str(list(_value))}' if _value else 'ARRAY[]::VARCHAR[]',
            set: lambda _value: f'ARRAY {str(list(_value))}' if _value else 'ARRAY[]::VARCHAR[]',
            int: lambda _value: str(value),
            bool: lambda _value: str(value).lower(),
            float: lambda _value: str(value),
            str: lambda _value: _value[1:-1] if _value.startswith('<') and _value.endswith('>') else f"'{_value}'",
        }
        return mapping.get(type(value), lambda _value: 'null')(value)

    def _format_row_value(self, values):
        return '(' + ', '.join(values) + ')'

    def _format_row_values(self, row_values):
        return ',\n  '.join(row_values)
