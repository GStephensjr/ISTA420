.echo on
.headers on

--Name: tsqlfuns-lab03.sql
--Author: Greg Stephens
--Date: 15 July, 2019

--1. What is the order number and the date of each order sold by each employee?
 select E.employeeid, E.firstname, E.lastname, O.orderid, O.orderdate from employees as E join orders as O on e.employeeid = o.employeeid limit 10;

--2. List each territory by region.
select T.territorydescription, R.regiondescription from territories as T join region as r on R.regionid = T.regionid order by r.regiondescription;

--3. What is the supplier name for each product alphabetically by supplier?
select s.companyname, p.productname from suppliers s left join products p on s.supplierid = p.supplierid order by s.companyname;

--4. For every order on May 5, 1998, how many of each item was ordered, and what was the price of the
--item?
select o.orderid, o.orderdate, od.unitprice, p.productname, od.quantity from orders o join order_details od on o.orderid = od.orderid join products p on od.productid = p.productid where orderdate like "1998-05-05";

--5. For every order on May 5, 1998, how many of each item was ordered giving the name of the item, and
--what was the price of the item?
select o.orderid, o.orderdate, od.unitprice, p.productname, od.quantity from orders o join order_details od on o.orderid = od.orderid join products p on od.productid = p.productid where orderdate like "1998-05-05";

--6. For every order in May, 1998, what was the customer’s name and the shipper’s name?
select o.orderid, o.customerid, o.shipperid, c.companyname, s.companyname from orders o join customers c on o.customerid = c.customerid join shippers s on o.shipperid = s.shipperid where orderdate like "1998-05-%";

--7. What is the customer’s name and the employee’s name for every order shipped to France?
select o.orderid, o.shipcountry, o.customerid, o.employeeid, c.companyname, e.lastname, e.firstname from orders o join customers c on o.customerid = c.customerid join employees e on o.employeeid = e.employeeid where shipcountry like "france" limit 10;

--8. List the products by name that were shipped to Germany
select p.productname, o.shipcountry from order_details od join orders o on o.orderid = od.orderid join products p on od.productid = p.productid where shipcountry like "Germany";