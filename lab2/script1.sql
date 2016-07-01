drop table dv_customer,dv_address,dv_film,
cb_customers,cb_books,cb_authors,mg_customers;

CREATE TABLE dv_customer (
 customer_id integer,
 first_name varchar(50),
 last_name varchar(50),
 email varchar(50),
 address_id integer,
 active boolean
 );

CREATE TABLE dv_address (
 address_id integer,
 address varchar(50),
 address2 varchar(50),
 district varchar(50),
 city_id integer,
 postal_code varchar(50),
 phone varchar(50)
 );
create type mpaa_rating as enum (
 'G',
 'PG',
 'PG-13',
 'R',
 'NC-17'
 );
CREATE TABLE dv_film(
 film_id integer,
 title varchar(50),
 description text,
 length smallint,
 rating mpaa_rating
 );
--end of listing one

--start of listing two	

CREATE TABLE cb_customers (
 last_name varchar(50),
 first_name varchar(50)
 );
CREATE TABLE cb_books (
 title varchar(50),
 author_id integer
 );
CREATE TABLE cb_authors (
 author_id integer,
 first_name varchar(50),
 last_name varchar(50)
 );

--end of listing2

--start of listing3
CREATE TABLE mg_customers (
 customer_id integer,
 first_name varchar(50),
 last_name varchar(50),
 email varchar(50),
 address_id integer,
 active boolean
 );

