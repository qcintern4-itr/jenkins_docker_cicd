#!/usr/bin/env python3

try:
    from utils.dashboard.BaseTable import BaseTable

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


# TODO: Implement ORM
class Suites(BaseTable):
    TABLE = 'suites'

    ID = 'id'
    SUITE_ID = 'suite_id'
    DESCRIPTION = 'description'
    SUITE_OWNER = 'suite_owner'
    SOURCE = 'source'
    PROJECT = 'project'
    TEST_DOMAINS = 'test_domains'
    FORCE_TAGS = 'force_tags'
    UPDATED_AT = 'updated_at'
    CREATED_AT = 'created_at'

    VALID_UPDATE_COLUMNS = [DESCRIPTION, SUITE_OWNER, SOURCE, PROJECT, TEST_DOMAINS, FORCE_TAGS, UPDATED_AT, CREATED_AT]
    VALID_INSERT_COLUMNS = [SUITE_ID, DESCRIPTION, SUITE_OWNER, SOURCE, PROJECT, TEST_DOMAINS,
                            FORCE_TAGS, UPDATED_AT, CREATED_AT]

    def __init__(self, dialect):
        super().__init__(dialect)

    def create_table(self, grant_user=None):
        query = f"""
            CREATE TABLE {self.TABLE} (
                {self.ID} SERIAL PRIMARY KEY,
                {self.SUITE_ID} VARCHAR(100) UNIQUE NOT NULL,
                {self.DESCRIPTION} VARCHAR(500),
                {self.SUITE_OWNER} VARCHAR(50) NOT NULL,
                {self.SOURCE} VARCHAR(200) NOT NULL,
                {self.PROJECT} VARCHAR(200) NOT NULL,
                {self.TEST_DOMAINS} VARCHAR(20),
                {self.FORCE_TAGS} VARCHAR[] NOT NULL,
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

    def get_all_suites(self):
        return self.run_query(f"SELECT * FROM {self.TABLE}")

    def update(self, **kwargs):
        # Validate and build query along the way
        prf_err = f'Unable to update {self.TABLE}'
        if self.SUITE_ID not in kwargs:
            raise Exception(f'{prf_err}: `{self.SUITE_ID}` must be designated')
        for key in kwargs:
            if key != self.SUITE_ID and key not in self.VALID_UPDATE_COLUMNS:
                raise Exception(f'{prf_err}: invalid column key `{key}`')
        query = f"\nUPDATE {self.TABLE}"
        query += "\nSET "
        query += ", ".join(f"{column} = {self._format_value(value)}"
                           for column, value in kwargs.items() if column != self.SUITE_ID)
        query += f" WHERE {self.SUITE_ID} = '{kwargs[self.SUITE_ID]}'"
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

    def delete(self, *suite_ids):
        in_text = '(' + ','.join(f"'{suite_id}'" for suite_id in suite_ids) + ')'
        query = f"DELETE FROM {self.TABLE} WHERE {self.SUITE_ID} IN {in_text}"
        return self.run_query(query, commit=True)
