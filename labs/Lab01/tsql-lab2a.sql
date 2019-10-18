.echo on
.headers on

--Name: tsql-lab2a.sql
--Author: Greg Stephens
--Date: July 2, 2019


--1. what are the regions?

select * from region;

--2. what are the cities in the southern region?

select territorydescription from territories;

--3. what are the cities in the southern region?
select  * from territories where regionid = 4;

--4. How do you run this query with the fully qualified column name?

select territories.territoryid, territories.territorydescription from territories where regionid=4;

--5. How do you run this query with a table alias?

select T.territoryid, T.territorydescription from territories T where regionid=4;

--6. What is the contact name, telephone number, and city for each customer?

select contactname, companyname, city, phone from customers;

--7. What are the products currently out of stock?

select productid, productname, unitsinstock, unitsonorder from products where unitsinstock = 0;

--8. What are the products currently in stock witht he least amount of quantity on hand?

select productid, productname, unitsinstock, unitsonorder from products where unitsinstock > 0 order by unitsinstock limit 10;

--9. What are the five most expensive products in stock?

select productid, productname, unitsinstock, unitsonorder from products where unitsinstock > 0 order by unitprice desc limit 5;

--10. How many products does Northwind have? How many customers? How many suppliers?

select count(*) as number_of_products from products;
select count(*) as number_of_customers from customers;
select count(*) as number_of_suppliers from suppliers;

