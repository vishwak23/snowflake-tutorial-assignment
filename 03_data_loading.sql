-- Part 3: Data Loading Using SnowSQL
-- Create employees_data.csv locally first, e.g.:
-- emp_id,emp_name,department,salary
-- 6,Arjun Singh,Sales,45000
-- 7,Pooja Sharma,IT,58000
-- 8,Manoj Kumar,Finance,47000

-- Run from SnowSQL terminal (adjust path to your file):
-- PUT file://C:\Users\<you>\employees_data.csv @my_stage;

LIST @my_stage;

COPY INTO employees
FROM @my_stage/employees_data.csv
FILE_FORMAT = (TYPE = CSV SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"')
ON_ERROR = 'CONTINUE';

-- Verify load
SELECT * FROM employees ORDER BY emp_id;
