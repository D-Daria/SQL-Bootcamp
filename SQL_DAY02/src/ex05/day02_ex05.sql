SELECT female.name
FROM
    (SELECT * FROM person WHERE age > 25 AND gender='female') AS female
ORDER BY name