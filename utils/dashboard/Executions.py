#!/usr/bin/env python3

try:
    from utils.dashboard.BaseTable import BaseTable

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


# TODO: Implement ORM
class Executions(BaseTable):
    TABLE = 'executions'

    ID = 'id'
    LINK = 'link'
    STATUS = 'status'
    EXECUTOR = 'executor'
    UPDATED_AT = 'updated_at'
    CREATED_AT = 'created_at'

    VALID_UPDATE_COLUMNS = [LINK, STATUS, EXECUTOR, UPDATED_AT, CREATED_AT]
    VALID_INSERT_COLUMNS = [LINK, STATUS, EXECUTOR, UPDATED_AT, CREATED_AT]

    def __init__(self, dialect):
        super().__init__(dialect)

    def create_table(self, grant_user=None):
        query = f"""
            CREATE TABLE {self.TABLE} (
                {self.ID} SERIAL PRIMARY KEY,
                {self.LINK} VARCHAR(200),
                {self.STATUS} VARCHAR(20),
                {self.EXECUTOR} VARCHAR(20),
                {self.UPDATED_AT} TIMESTAMP WITH TIME ZONE,
                {self.CREATED_AT} TIMESTAMP WITH TIME ZONE DEFAULT NOW()
            );
        """
        if grant_user:
            query += f'\nGRANT ALL PRIVILEGES ON TABLE {self.TABLE} TO {grant_user};'
        return self.run_query(query, commit=True)

    def drop_table(self):
        query = f"DROP TABLE IF EXISTS {self.TABLE};"
        return self.run_query(query, commit=True)

    def update(self, **kwargs):
        # Validate and build query along the way
        prf_err = f'Unable to update {self.TABLE}'
        if self.ID not in kwargs:
            raise Exception(f'{prf_err}: `{self.ID}` must be designated')
        for key in kwargs:
            if key != self.ID and key not in self.VALID_UPDATE_COLUMNS:
                raise Exception(f'{prf_err}: invalid column key `{key}`')
        query = f"\nUPDATE {self.TABLE}"
        query += "\nSET "
        query += ", ".join(f"{column} = {self._format_value(value)}"
                           for column, value in kwargs.items() if column != self.ID)
        query += f" WHERE {self.ID} = {kwargs[self.ID]}"
        query += f" RETURNING *;"
        # Execute update query
        return self.run_query(query, commit=True)

    def insert(self, columns, *row_values):
        prf_err = f'Unable to insert into {self.TABLE}'
        # Validate and build query along the way
        if not (set(columns) <= set(self.VALID_INSERT_COLUMNS)):
            raise Exception(f'{prf_err}: valid columns are {self.VALID_INSERT_COLUMNS}')
        query = f"\nINSERT INTO {self.TABLE}({', '.join(columns)})"
        query += f"\nVALUES"
        query += '\n  ' + \
                 self._format_row_values(
                     (self._format_row_value(
                         (self._format_value(value) for value in row_value)) for row_value in row_values)
                 )
        query += f'\nRETURNING *;'
        # Execute update query
        return self.run_query(query, commit=True)

    def delete(self):
        pass
