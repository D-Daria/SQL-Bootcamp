WITH cte_visits AS (
    SELECT name, COUNT(*) AS count_of_visits
    FROM person_visits
    INNER JOIN person ON person.id = person_visits.person_id
    GROUP BY name
    ORDER BY count_of_visits DESC, name
)
SELECT *
FROM
    (SELECT * FROM cte_visits LIMIT 4) AS output;
