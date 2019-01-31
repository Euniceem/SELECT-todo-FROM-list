DROP DATABASE IF EXISTS todo_app;
DROP USER IF EXISTS micheal;
CREATE USER micheal WITH ENCRYPTED PASSWORD 'stonebreaker';
CREATE DATABASE todo_app;
\c 'todo_app';

CREATE TABLE tasks (
  id SERIAL PRIMARY KEY NOT NULL,
  title VARCHAR (255) NOT NULL,
  description text NULL,
  created_at timestamp without time zone NOT NULL default now(),
  updated_at timestamp without time zone NULL,
  completed boolean NOT NULL default false
);

ALTER TABLE tasks DROP COLUMN completed,
ADD COLUMN completed_at timestamp without time zone NULL default NULL,
ALTER COLUMN updated_at set NOT NULL,
ALTER COLUMN updated_at set default now();

INSERT INTO tasks (title, description) 
VALUES ('Study SQL', 'complete this exercise'),
('Study PostgreSQL', 'Read all documentation');

SELECT title FROM tasks WHERE completed_at is NULL;

UPDATE tasks set completed_at = now() WHERE title = 'Study SQL';

SELECT title, description FROM tasks WHERE completed_at is NULL;
SELECT * FROM tasks ORDER BY created_at DESC;

INSERT INTO tasks (title, description) 
VALUES ('mistake 1', 'a test entry'),
('mistake 2', 'another test entry'),
('third mistake', 'another test entry');

SELECT title FROM tasks WHERE title = 'mistake';
DELETE FROM tasks WHERE title = 'mistake 1';

SELECT title, description FROM tasks WHERE title = 'mistake';
DELETE FROM tasks WHERE title = 'mistake';

SELECT * FROM tasks ORDER BY title ASC;




