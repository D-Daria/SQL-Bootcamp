-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
-- Session #1
SHOW TRANSACTION ISOLATION LEVEL;
-- Session #2
SHOW TRANSACTION ISOLATION LEVEL;
-- Session #1
UPDATE pizzeria SET rating = 1 WHERE id = 1;
-- Session #2
UPDATE pizzeria SET rating = 2 WHERE id = 2;
-- Session #1
UPDATE pizzeria SET rating = 1 WHERE id = 2;
-- Session #2
UPDATE pizzeria SET rating = 2 WHERE id = 1;
-- Session #1
COMMIT;
-- Session #2
COMMIT;
-- Session #1
SELECT * FROM pizzeria;
-- Session #2
SELECT * FROM pizzeria;