--violation script

--foreign key contraints:

--1

delete from dv_address
where address_id = 25;
--2

delete from cb_authors
where author_id = 15;

-------------------------
--general contraint violations

--1)
insert into dv_film values(
13346, 'hi','great',12,'G');

insert into dv_film values(
13356, 'hr','great',0,'G');

--2)

insert into mg_customers values(
21223, 'joe','chan','s@a.com',25,'yes');

insert into mg_customers values(
3212, 'joe','chan','s@a.com',0,'yes');

--3)
insert into dv_address values(
234567, '111 main st', 'san jose', 'bay area', '12', '92342', '23432423');

insert into dv_address values(
2345, '', 'san jose', 'bay area', '12', '92342', '23432423');



