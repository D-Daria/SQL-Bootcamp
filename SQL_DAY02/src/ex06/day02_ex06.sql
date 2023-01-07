SELECT menu.pizza_name, pizzeria.name AS pizzeria_name
FROM person_order
INNER JOIN menu ON person_order.menu_id = menu.id
INNER JOIN pizzeria ON menu.pizzeria_id= pizzeria.id
INNER JOIN person ON person_order.person_id = person.id
WHERE person.name = 'Anna' OR person.name = 'Denis'
ORDER BY pizza_name, pizzeria_name;