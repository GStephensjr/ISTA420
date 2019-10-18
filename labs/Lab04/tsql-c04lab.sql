.echo on
.headers on
--Name: tsql-lab04.sql
--Author: Gregory Stephens
--Date: 16 July, 2019

--1. Create a report that shows all orders taken by Janet.
select orderid from orders where employeeid like (select employeeid from employees where firstname like 'janet');

--2. Create a report that shows all products by name that are in the Seafood category.
select productname from products where categoryid = (select categoryid from categories where categoryname like 'seafood');

--3. Create a report that shows all orders taken by any employee whose last name begins with 'A.'
select orderid from orders where employeeid in (select employeeid from employees where lastname like 'A%');

--4. Create a report that shows the product name and supplier id for all products supplied by Exotic
--Liquids, Grandma Kelly's Homestead, and Tokyo Traders.
select productname, supplierid from products where supplierid in (select supplierid from suppliers where companyname in ("Tokyo Traders","Exotic Liquids","Grandma Kelly's Homestead"));
--5. Create a report that shows all products supplied from the Pacific Ocean region.
select productname from products where supplierid in (select supplierid from suppliers where country in ("singapore","australia","japan"));

--6. Create a report that shows all companies by name that sell products in CategoryID 8.
select companyname from suppliers where supplierid in (select supplierid from products where categoryid = 8);

--7. Create a report in two parts that shows the date of the last sale made by each employee, and the date
--of the first sale made by each employee.
select o1.employeeid, o1.orderdate from orders o1 where o1.orderdate = (
select max(o2.orderdate) from orders o2 where o2.employeeid = o1.employeeid);

select o1.employeeid, o1.orderdate from orders o1 where o1.orderdate = (
select min(o2.orderdate) from orders o2 where o2.employeeid = o1.employeeid);
--8. What is the product number of our most expensive product? Create a report that shows the employee
--id and order id of every order for that product.

--9. Create a report showing the date of the last sale for every product, ordered by product id.

--10. Create a report that shows all companies by name that sell products in the Seafood category.

--11. Create a report that lists the ten most expensive products.

--12. Create a report that shows the date of the last order by all employees.

--13. Create a line item report that contains a line for each product in the order with the following columns:
--the order id, the product id, the unit price, the quantity sold, the line item price, and the percent of
--that line item constitutes of the total amount of the order.


