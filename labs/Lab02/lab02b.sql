.echo on
.headers on

--Name:lab02b.sql
--Author: Greg Stephens
--Date: 8 July, 2019

--1. Who are the customers of north america?
select customerid, companyname, country from customers where country in ('usa','canada','mexico');

--2. What orders were placed in April, 1998?
 select orderid, orderdate from orders where orderdate like '1998-04%';
 
 --3. what sauces do we sell?
 select productid, productname from products where productname like '%sauce%';
 
 --4. You sell some kind of dried fruit that i liked very much. what is its name?
 select productid, productname from products where productname like '%dried%';
 
 --5. What employees ship products to Germany in December?
select employeeid, shipcountry from orders where shippeddate like '%-12-%' and shipcountry like 'germany' group by employeeid;
--6. We have an issue with product 19. I need to know the total amount and the net amount of all
--the orders for product 19 where the customer took a discount.
select unitprice, quantity, unitprice * quantity as totalprice from order_details where productid = 19;

select productid, unitprice, quantity, unitprice * quantity as totalprice, discount,
((unitprice* quantity) - (unitprice * quantity * discount)) as netprice
from order_details where productid = 19 and discount >0;

--7. I need a list of employees by title, first name, and last name, with the employee's position under their names,
--and a line separating each employee
select titleofcourtesy || ' ' || firstname || ' ' || lastname || '
 ' || title || '
 ' from employees order by lastname;

--8. I need a list of our customers and the first name only of the customer representative.
select substr(contactname,1,instr(contactname, ' ')-1), companyname from customers order by substr(contactname,' ')+1) limit 10;

--9. Give me a list of our customer contacts alphabetically by last name.
select contactname from customers order by substr(contactname, instr(contactname, ' ')+1);


--10. I need a report telling me the most common pairing of customers and employees witht he greadtest order volume
--(by the number of orders placed). Exclude pairings with minimal orders.

--11. I need a report listing the highest average selling product by the productid. the average
--is determined by the total sales of each product id divided by the quantity of the product sold. 
--Include only the highest 20 products

