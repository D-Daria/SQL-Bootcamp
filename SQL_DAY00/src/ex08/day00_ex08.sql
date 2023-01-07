SELECT *
FROM person_order
WHERE NOT id % 2 != 0
ORDER BY id