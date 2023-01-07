SELECT pizzas.pizza_name, pizzeria.name AS pizzeria_name, pizzas.price
FROM
    (SELECT * FROM menu
        WHERE pizza_name='mushroom pizza' OR pizza_name='pepperoni pizza') AS pizzas
FULL JOIN pizzeria ON pizzas.pizzeria_id = pizzeria.id WHERE pizzas.pizza_name IS NOT NULL
ORDER BY pizza_name, pizzeria_name