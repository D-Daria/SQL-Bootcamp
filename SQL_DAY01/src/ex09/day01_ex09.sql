SELECT name FROM pizzeria
WHERE NOT 
    (SELECT pizzeria_id FROM person_visits WHERE pizzeria_id=pizzeria.id)

SELECT name FROM pizzeria
WHERE id NOT IN
    (SELECT pizzeria_id FROM person_visits)