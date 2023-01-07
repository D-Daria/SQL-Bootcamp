SELECT
        pizzeria.name,
        COUNT(pizzeria_id) AS count_of_orders,
        ROUND(AVG(price), 2) AS average_price,
        MAX(price) AS max_price,
        MIN(price) AS min_price
FROM person_order
INNER JOIN menu ON menu.id = person_order.menu_id
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY pizzeria.name
ORDER BY name;