.echo on
.headers on

--Name: tsqlfuns-ex02.sql
--Author: Greg Stephens
--Date 14 July, 2019

--1. Mailing Labels
select ContactTitle || ' ' || ContactName || '
' || CompanyName || '
' || Address || '
' || City || ' ' || Region || ' ' || PostalCode || ' ' || Country || '

' from customers limit 15;

--2. Telephone Book
select substr(ContactName, instr (ContactName, ' ')+1) as LastName, substr(ContactName, 1, instr(ContactName, ' ')-1) as FirstName, CompanyName || '	' || Phone || '
' from customers limit 5;

--3. Shipping LOG
Select orderid, orderdate, shippeddate, julianday(julianday(shippeddate) - julianday(orderdate)) as shippinglag from orders limit 10;

--4. My Age
 select julianday(date('now') - date(1992-09-11));