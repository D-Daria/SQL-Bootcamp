WITH
    cte_p_pizza(pepperoni) AS (
    (SELECT person.name AS pepperoni
    FROM person_order
    INNER JOIN person ON person_order.person_id = person.id
    INNER JOIN menu ON menu.id = person_order.menu_id
    WHERE person.gender = 'female' AND pizza_name = 'pepperoni pizza')
),
    cte_ch_pizza(cheese) AS (
    (SELECT person.name AS cheese
    FROM person_order
    INNER JOIN person ON person_order.person_id = person.id
    INNER JOIN menu ON menu.id = person_order.menu_id
    WHERE person.gender = 'female' AND pizza_name = 'cheese pizza')
)
SELECT person.name FROM person
   INNER JOIN cte_p_pizza ON cte_p_pizza.pepperoni = person.name
   INNER JOIN cte_ch_pizza ON cte_ch_pizza.cheese = person.name