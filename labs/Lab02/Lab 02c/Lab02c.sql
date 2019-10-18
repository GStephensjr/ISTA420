.echo on
.headers on

--Name: tsqlfuns-lab02c.sql
--Author: Greg Stephens
--Date: 9 July, 2019

--1. LIST THE EMPLOYEE IDS WITH THE NUMBER OF SALES BY EACH EMPLOYEE FROM MOST SALES TO LEAST. I WANT TO RECOGNIZE
--THE EMPLOYEES WITH THE MOST SALES.
select employeeid, count(orderid) as number_of_orders from orders group by employeeid order by number_of_orders desc;

--2. I WANT TO LOOK AT THE AVERAGE DISCOUNTS TAKEN BY ALL CUSTOMERS FOR PRODUCTS THAT COST MORE THAN $50.00.
--SPECIFICALLY, I WANT TO KNOW THE AVERAGE DISCOUNT OF ALL ORDERS FOR EACH PROCUCT FROM THE HIGHEST
--PRICE TO THE LOWEST PRICE
select productid, unitprice, avg(discount) from order_details where unitprice > 50 and discount > 0 group by productid, unitprice order by unitprice desc;

--3. I AM DOING AN ANALYSIS OF WHICH SHIPPERS SHIP TO EACH COUNTRY, AND I NEED A REPORT SHOWING THE NUMBER OF ORDERS
--EACH SHIPPER DELIVERED TO EACH COUNTRY AND THE NUMBER OF ORDERS. I DON'T NEED THE DATA WHERE THE NUMBER
--OF ORDERS IS TEN OR LESS, BUT I NEED THE REPORT LISTED BY COUNTRY AND THE NUMBER OF ORDERS SHIPPED TO THAT COUNTRY.
select shipperid, shipcountry, count(orderid) as ordercount from orders group by shipperid having count(orderid) > 10 order by shipcountry;

--5. CONTINUING WITH THE PREVIOUS QUERY, I NEED THE AVERAGE TIME LAG FOR EACH SHIPPER.
select shipperid, avg(julianday(shippeddate) - julianday(orderdate)) as average_lag from orders where julianday(shippeddate) > 0 group by shipperid;

--6. I AM DOING AN INVENTORY, AND I NEED TO KNOW THE TOTAL PRICE OF EACH PRODUCT ON HAND, THAT IS, THE PRICE OF
--OF EACH PRODUCT LINE, SORTED ALPHABETICALLY BY PRODUCT NAME.
select productid, productname, unitprice * unitsinstock as Total from products group by productname;

--7. WHAT IS THE DOLLAR TOTAL WE HAVE TIED UP IN INVENTORY?
select sum(unitsinstock * unitprice) from products;

--8. WE HAVE DISCOVERED THAT SOME CUSTOMERS FAVOR CERTAIN EMPLOYEES. I NEED TO KNOW THIS INFORMATION. I NEED A REPORT
--OF THE MOST COMMON EMPLOYEE/CUSTOMER PAIRS, THE NUMBER OF TIMES THE EMPLOYEE TOOK ORDERS FROM THE CUSTOMER,
--AND THE NUMBER OF ORDERS. ALPHABETIZE THIS BY CUSTOMER ID. OMIT CUSTOMER/EMPLOYEE PAIRS WHERE THE NUMBER OF ORDERS IS LESS
--THAN FIVE.
select customerid, employeeid, count(orderid) from orders group by customerid, employeeid having count(orderid) >= 5 order by customerid asc;

--9. HOW MANY DAYS WERE YOU IN THE SERVICE (IF YOU ARE A VETERAN), OR HOW MANY DAYS WILL YOU SERVE (ASSUMING YOU KNOW YOUR
--ETS DATE)?

--10. ANSWER THESE QUESTIONS USING THE BUILT IN TIME AND DATE FUNCTION.
---WHAT IS TODAY'S DATE?
SELECT date('now');

---WHAT WAS THE FIRST DAY OF THE MONTH?
SELECT date('now','start of month');

---WHAT WILL BE THE FIRST DAY OF NEXT MONTH?
SELECT date('now','start of month','+1 month');

---WHAT IS THE LAST DAY OF THIS MONTH?
 SELECT date('now','start of month','+1 month','-1 day');
