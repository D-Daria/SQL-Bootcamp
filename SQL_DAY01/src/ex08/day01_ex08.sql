SELECT order_date,
        (SELECT
            CONCAT(temp_person.name, ' (age:', temp_person.age, ')')
        ) AS person_information
FROM person_order
NATURAL JOIN
    (SELECT id AS person_id, name, age FROM person) AS temp_person
ORDER BY order_date, name
