WITH
    cte_orders AS
    (
        SELECT name, COUNT(*) AS count, 'order' AS action_type
        FROM person_order
        INNER JOIN menu ON menu.id = person_order.menu_id
        INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
        GROUP BY name
        ORDER BY count DESC
),
    cte_visits AS
    (
        SELECT name, COUNT(*) AS count, 'visit' AS action_type
        FROM person_visits
        INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
        GROUP BY name
        ORDER BY count DESC
)
SELECT
        pizzeria.name,
        COALESCE(cte_visits.count, 0) + COALESCE(cte_orders.count, 0) AS total_count
FROM pizzeria
FULL JOIN cte_orders ON cte_orders.name = pizzeria.name
FULL JOIN cte_visits ON cte_visits.name = pizzeria.name
ORDER BY total_count DESC, name;
