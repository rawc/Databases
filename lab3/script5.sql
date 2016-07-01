--views 

--1 customers who are in both downtown video and city books

create view customer_city as
select p.first_name, p.last_name, a.city_id
from dv_customer d, cb_customers p, dv_address a
where d.first_name = p.first_name
		and
      d.last_name = p.last_name
	        and
      d.address_id = a.address_id;


--2

--this query will find all customers first and last names with the district with most people


--not sure if this one is correct, check the un commented version 

--create view district_stats as
--select a.district, count(c.address_id)
--from dv_address a, dv_customer c
--where a.address_id = c.address_id
--group by a.district
--order by count(district)asc;



 
create view district_stats as
select a.district, count(c.customer_id)
from dv_address a, dv_customer c
where a.address_id = c.address_id
group by a.district, c.customer_id
order by count(c.customer_id)asc;



--3 district with the least amount of customers (list 5)
select district
from district_stats
order by district asc limit 5;

--4

alter index district_stats rename to my_stats;
