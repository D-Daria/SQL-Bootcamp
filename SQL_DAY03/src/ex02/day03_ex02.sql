WITH cte_ids AS (
    SELECT * FROM menu
    WHERE NOT EXISTS
        (SELECT menu_id FROM person_order WHERE menu_id = menu.id)
)
SELECT
    cte_ids.pizza_name,
    cte_ids.price,
    pizzeria.name AS pizzeria_name
FROM cte_ids
   INNER JOIN pizzeria ON cte_ids.pizzeria_id = pizzeria.id
ORDER BY pizza_name, price;