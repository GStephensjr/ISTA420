.echo on
.headers on

--Name: tsqlfuns-lab06.sql
--Author: Greg Stephens
--Date: 24 July, 2019
--(the answers to 1 and 2 specify just union but union all would fit the question better. however both commands return the same answer.)
-- 1. Create a list of every country where we have either a customer or a supplier.
select country from customers 
union 
select country from suppliers;

-- 2. Create a list of every city and country where we have either a customer or a supplier.
select city, country from customers
union 
select city, country from suppliers;

-- 3. Create a list of every country where we have both a customer and a supplier.
select country from customers
intersect
select country from suppliers;

-- 4. Create a list of every city and country where we have both a customer and a supplier.
select city, country from customers
intersect
select city, country from suppliers;

-- 5. Create a list of every country where we have customers but not suppliers.
select country from customers
except
select country from suppliers;

-- 6. Create a list of every country where we have suppliers but not customers.
select country from suppliers
except
select country from customers;

-- 7. Create a list of every country where we have suppliers but not customers and where we have customers
-- but not suppliers. Do not include any country where we have both suppliers and customers.

select country from
(
select country from (select country from suppliers except select country from customers)
union
select country from (select country from customers except select country from suppliers)
)
except
select country from (select country from customers intersect select country from suppliers);







-- select c.country, c.customerid, s.supplierid from customers c left outer join suppliers s on c.country = s.country where s.supplierid is null group by c.country
-- union
-- select s.country, s.supplierid, c.customerid from suppliers s left outer join customers c on s.country = c.country where c.customerid is null group by s.country;

-- select row_number () over( order by country) rownum, country, customerid from customers
-- except
-- select row_number () over( order by country) rownum, country, supplierid from suppliers;



























