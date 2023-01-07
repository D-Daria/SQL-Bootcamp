CREATE VIEW v_symmetric_union AS (

     (SELECT person_id FROM person_visits
        WHERE visit_date = '2022-01-02'
    EXCEPT
    SELECT person_id FROM person_visits
        WHERE visit_date = '2022-01-06')

    UNION

    (SELECT person_id FROM person_visits
        WHERE visit_date = '2022-01-06'
    EXCEPT
    SELECT person_id FROM person_visits
        WHERE visit_date = '2022-01-02')
);