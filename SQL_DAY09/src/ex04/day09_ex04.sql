CREATE OR REPLACE FUNCTION fnc_persons_female()
RETURNS TABLE (
        id bigint,
        name varchar,
        age integer,
        gender varchar,
        address varchar
) AS $$
        (SELECT
                person.id, person.name, person.age, person.gender, person.address
        FROM person
            WHERE person.gender = 'female');
$$ LANGUAGE sql;

CREATE OR REPLACE FUNCTION fnc_persons_male()
RETURNS TABLE (
        id bigint,
        name varchar,
        age integer,
        gender varchar,
        address varchar
) AS $$
        (SELECT
                person.id, person.name, person.age, person.gender, person.address
        FROM person
            WHERE person.gender = 'male');
$$ LANGUAGE sql;

SELECT * FROM fnc_persons_female();
SELECT * FROM fnc_persons_male();