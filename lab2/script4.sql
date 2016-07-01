--query 1
--this query will give us all the customers that belong in both cb and dv

select cb_customers.first_name, cb_customers.last_name
from cb_customers
 WHERE EXISTS(SELECT first_name, last_name
                    FROM dv_customer d
                   WHERE d.first_name = cb_customers.first_name
                         and d.last_name = cb_customers.last_name);

--query 2
--this query will find all customers who belong in both cb and dv, and the correct phone number for those 
--customers

select dv_address.phone
from dv_customer, dv_address
 WHERE EXISTS(SELECT first_name, last_name
                    FROM cb_customers c
                   WHERE c.first_name = dv_customer.first_name
                         and c.last_name = dv_customer.last_name)
           and dv_customer.address_id = dv_address.address_id;


--query 3
--this query will find all customers first and last names with the district with most people


SELECT c.first_name, c.last_name
from dv_customer c, dv_address a
where c.address_id = a.address_id
       and
     district in(
        select district
	from dv_address 
	group by dv_address.district
	order by count(district)desc limit 1
      );


-- query 4
--this query will order by ascending rating counts and limit it to 1
select f.rating, count(f.rating) 
from dv_film f
group by f.rating
order by count(f.rating) asc
limit 1;


-- query5
--this will find all authors and order them by count of books
-- where limit is 10
SELECT DISTINCT count( b.author_id ) cnt, a.first_name, a.last_name
FROM cb_books b, cb_authors a
where b.author_id = a.author_id
GROUP BY a.first_name, a.last_name
ORDER BY cnt DESC
LIMIT 10;

--similiar?
select DISTINct a.first_name, a.last_name
from cb_authors a, cb_books b
where a.author_id = b.author_id
	and 
      a.author_id in (select author_id
		      from cb_books
			group by author_id
			order by count(*) desc limit 10);
