-- Part 4: Snowflake Time Travel

CREATE TABLE IF NOT EXISTS time_travel_demo (
    id      INT,
    name    STRING,
    value   NUMBER(10,2)
);

INSERT INTO time_travel_demo VALUES
    (1, 'Row A', 100),
    (2, 'Row B', 200),
    (3, 'Row C', 300);

-- Capture current time before making changes
SELECT CURRENT_TIMESTAMP();  -- note this value

-- Make changes
UPDATE time_travel_demo SET value = 999 WHERE id = 1;
DELETE FROM time_travel_demo WHERE id = 3;

-- Current state
SELECT * FROM time_travel_demo ORDER BY id;

-- Query historical state using AT with the timestamp you noted
SELECT * FROM time_travel_demo
AT (TIMESTAMP => 'YYYY-MM-DD HH:MI:SS'::TIMESTAMP)
ORDER BY id;

-- Or relative to now
SELECT * FROM time_travel_demo
AT (OFFSET => -60*5)   -- 5 minutes ago
ORDER BY id;
