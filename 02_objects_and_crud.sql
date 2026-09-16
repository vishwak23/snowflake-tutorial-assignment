-- Part 2: Creation of Snowflake Objects

CREATE DATABASE IF NOT EXISTS my_assignment_db;
CREATE SCHEMA IF NOT EXISTS my_assignment_db.my_schema;
CREATE WAREHOUSE IF NOT EXISTS my_assignment_wh
    WAREHOUSE_SIZE = 'XSMALL'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE;

USE WAREHOUSE my_assignment_wh;
USE DATABASE my_assignment_db;
USE SCHEMA my_schema;

CREATE TABLE IF NOT EXISTS employees (
    emp_id      INT,
    emp_name    STRING,
    department  STRING,
    salary      NUMBER(10,2)
);

CREATE STAGE IF NOT EXISTS my_stage;

-- Sample INSERTs
INSERT INTO employees (emp_id, emp_name, department, salary) VALUES
    (1, 'Anita Rao', 'IT', 55000),
    (2, 'Rahul Verma', 'Finance', 48000),
    (3, 'Sneha Iyer', 'HR', 42000),
    (4, 'Karan Mehta', 'IT', 61000),
    (5, 'Divya Nair', 'Marketing', 39000);

-- SELECT
SELECT * FROM employees ORDER BY emp_id;

-- UPDATE
UPDATE employees SET salary = salary + 3000 WHERE department = 'IT';

-- DELETE
DELETE FROM employees WHERE emp_id = 5;

-- Verify
SELECT * FROM employees ORDER BY emp_id;
