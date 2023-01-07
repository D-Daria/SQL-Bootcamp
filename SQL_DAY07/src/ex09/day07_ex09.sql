SELECT
    address,
    ROUND(MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric)), 2) AS formula,
    ROUND(AVG(age::numeric), 2) AS average,
    (SELECT
         CASE
             WHEN (MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric))) > AVG(age::numeric)
                 THEN
                     true
                 ELSE
                    false
             END) AS comparison
FROM person
GROUP BY address
ORDER BY address;