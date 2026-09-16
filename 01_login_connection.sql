-- Part 1: SnowSQL Login and Connection
-- Connect first from terminal:
--   snowsql -a <account_identifier> -u <your_username>

SELECT
    CURRENT_USER()      AS user_name,
    CURRENT_ROLE()       AS role_name,
    CURRENT_WAREHOUSE()  AS warehouse_name,
    CURRENT_DATABASE()   AS database_name,
    CURRENT_SCHEMA()     AS schema_name;
