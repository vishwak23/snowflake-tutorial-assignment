-- Part 5: Data Recovery Using Time Travel

-- Simulate accidental deletion
DELETE FROM employees WHERE department = 'HR';

-- Confirm rows are gone
SELECT * FROM employees ORDER BY emp_id;

-- Identify the deleted rows using BEFORE the delete
SELECT * FROM employees
BEFORE (STATEMENT => '<query_id_of_the_delete_statement>');

-- Recover by inserting back from historical snapshot
INSERT INTO employees
SELECT * FROM employees
BEFORE (STATEMENT => '<query_id_of_the_delete_statement>')
WHERE department = 'HR';

-- Verify recovery
SELECT * FROM employees ORDER BY emp_id;

-- Tip: find the query_id of your DELETE via:
-- SELECT * FROM TABLE(INFORMATION_SCHEMA.QUERY_HISTORY())
-- ORDER BY start_time DESC LIMIT 10;
