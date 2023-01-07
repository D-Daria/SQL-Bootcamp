CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS trigger AS $person_audit$
    BEGIN
        IF (TG_OP = 'DELETE') THEN
            INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
                    VALUES(
                         current_timestamp,
                         'D',
                         OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
        END IF;
        RETURN NULL;
    END;
$person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_delete_audit AFTER DELETE
    ON person
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;