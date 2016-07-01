--adding contraints 
--contraint 1
ALTER TABLE dv_film
ADD CONSTRAINT positive_length  CHECK (length > 0);

--contraint 2
--to fix all null values
UPDATE  mg_customers
SET address_id = 25
WHERE address_id is  NULL;
--after updating nulls

ALTER TABLE mg_customers
ADD CONSTRAINT empty_key CHECK (address_id is not null and address_id <>0);

--constraint 3
ALTER TABLE dv_address
ADD CONSTRAINT positive_length  CHECK (address is not  null and address not like '');
