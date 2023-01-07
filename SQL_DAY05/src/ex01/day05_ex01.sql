SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
    SELECT
        menu.pizza_name,
        pizzeria.name AS pizzeria_name
FROM menu
INNER JOIN pizzeria on menu.pizzeria_id = pizzeria.id;