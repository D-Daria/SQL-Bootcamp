COMMENT ON TABLE person_discounts IS 'Information about personal discounts depending on number of orders';
COMMENT ON COLUMN person_discounts.id IS 'Unique id of each table entry';
COMMENT ON COLUMN person_discounts.person_id IS 'Unique identifier of a person from order list';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Unique identifier of a pizzeria where the person made an order';
COMMENT ON COLUMN person_discounts.discount IS 'Discount value calculated accordingly with number of orders';
