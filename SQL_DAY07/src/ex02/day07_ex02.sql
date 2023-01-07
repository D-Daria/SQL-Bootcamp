WITH
    cte_orders AS
    (
        SELECT name, COUNT(*) AS count, 'order' AS action_type
        FROM person_order
        INNER JOIN menu ON menu.id = person_order.menu_id
        INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
        GROUP BY name
        ORDER BY count DESC LIMIT 3
),
    cte_visits AS
    (
        SELECT name, COUNT(*) AS count, 'visit' AS action_type
        FROM person_visits
        INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
        GROUP BY name
        ORDER BY count DESC LIMIT 3
)
(SELECT * FROM cte_orders)
UNION
(SELECT * FROM cte_visits)
ORDER BY action_type, count DESC;
