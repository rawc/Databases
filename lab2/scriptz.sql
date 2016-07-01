select cb_customers.first_name, cb_customers.last_name
from cb_customers
 WHERE EXISTS(SELECT first_name, last_name
                    FROM dv_customer d
                   WHERE d.first_name = cb_customers.first_name
                         and d.last_name = cb_customers.last_name);



select d.first_name, d.last_name
from dv_customer d, cb_customers c
where d.first_name = c.first_name
         and
      d.last_name = c.last_name;

--equivilant queries

select f.rating, count(f.rating)
from dv_film f
group by f.rating
order by count(f.rating) asc
limit 1;


select count(f.rating)
from dv_film f
where f.rating in (select rating
		   from dv_film
		   group by rating
		   order by count(rating) asc limit 1);

 
