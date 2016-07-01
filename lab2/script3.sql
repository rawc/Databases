--create sequence for mg_customers
create sequence mg_customers_seq start 600;
Alter table mg_customers
alter column customer_id
set default nextval ('mg_customers_seq');

--insert dv_customers into mg_customers

insert into mg_customers(first_name,last_name,email,address_id,active)
select dv_customer.first_name, dv_customer.last_name, dv_customer.email, dv_customer.address_id, dv_customer.active
from dv_customer;

--insert cb_customers who are not in dv_customer

insert into mg_customers(first_name,last_name)
select cb_customers.first_name, cb_customers.last_name
from cb_customers
 WHERE NOT EXISTS(SELECT first_name, last_name
                    FROM dv_customer d
                   WHERE d.first_name = cb_customers.first_name
                         and d.last_name = cb_customers.last_name);
