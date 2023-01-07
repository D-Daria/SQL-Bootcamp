CREATE OR REPLACE FUNCTION fnc_fibonacci(IN pstop INTEGER DEFAULT 10)
RETURNS TABLE(num integer) AS $$
    WITH RECURSIVE cte_fib(num1, num2) AS (
        VALUES (0, 1)
        UNION ALL
            SELECT
            GREATEST(num1, num2), num1 + num2
        FROM cte_fib
            WHERE num2 < pstop
    )
    SELECT num1 FROM cte_fib;
$$ LANGUAGE sql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();