use ex06
go
--products
drop table if exists products

create table dbo.Products(
ProductCode varchar(20) not null,
ProductName varchar(50) null,
ProductLine varchar(20) null,
ProductScale varchar(20) null,
ProductVendor varchar(50) null,
ProductDescription varchar(max) null,
quantityInStock int null,
buyPrice float null,
MSRP float null,
constraint PK_Products Primary key(ProductCode)
)
select * from dbo.Products

bulk insert dbo.Products
from 'C:\Users\Grego\OneDrive\Desktop\Cleaned up CSV files\Products.csv'
with
(
fieldterminator = ',',
rowterminator = '\n'
)
--orderdetails
drop table if exists orderdetails

create table dbo.orderdetails(
orderNumber int not null,
productCode varchar(20) null,
quantityOrdered int null,
priceEach float null,
orderLineNumber int null,
constraint FK_orderdetails Foreign key(orderNumber) references orders(orderNumber),
constraint FK_Products Foreign key(ProductCode) references Products(productCode)
)


select * from dbo.orderdetails

bulk insert dbo.orderdetails
from 'C:\Users\Grego\OneDrive\Desktop\Cleaned up CSV files\Order_details.csv'
with
(
fieldterminator = ',',
rowterminator = '\n'
)
--orders
drop table if exists orders

create table dbo.orders(
OrderNumber int not null,
orderDate varchar(30) null,
requiredDate varchar(30) null,
shippedDate varchar(30) null,
status varchar(30) null,
comments varchar(max) null,
customerNumber varchar(max) null
constraint PK_orders Primary key(orderNumber)
)
select * from dbo.orders

bulk insert dbo.orders
from 'C:\Users\Grego\OneDrive\Desktop\Cleaned up CSV files\Orders.csv'
with
(
fieldterminator = ',',
rowterminator = '\n'
)
--customers
drop table if exists customers

create table dbo.customers(
customerNumber int not null,
customerName varchar(max) null,
contactLastName varchar(30) null,
contactFirstName varchar(30) null,
phone  varchar(30) null,
addressLine1 varchar(max) null,
addressLine2 varchar(30) null,
city varchar(30) null,
state varchar(30) null,
postalCode  varchar(30) null,
country varchar(30) null,
salesReEmployeeNumber varchar(max) null,
creditLimit varchar(30) null
constraint PK_customers Primary key(customerNumber)
)
select * from dbo.customers

bulk insert dbo.customers
from 'C:\Users\Grego\OneDrive\Desktop\Cleaned up CSV files\Customers.csv'
with
(
fieldterminator = ',',
rowterminator = '\n'
)
--payments

drop table if exists payments

create table dbo.payments(
customerNumber int null,
checkNumber varchar(20) not null,
paymentDate varchar(30) null,
amount float null
constraint PK_payments Primary key(checkNumber),
constraint FK_payments Foreign key(customerNumber) references customers(customerNumber)
)
select * from payments

bulk insert dbo.payments
from 'C:\Users\Grego\OneDrive\Desktop\Cleaned up CSV files\Payments.csv'
with
(
fieldterminator = ',',
rowterminator = '\n'
)
--employees

drop table if exists employees

create table employees(
employeeNumber float not null,
lastName varchar(20) null,
firstName varchar(20) null,
extension varchar(20) null,
email varchar(50) null,
officeCode varchar(50) null,
reportsTo varchar(20) null,
jobTitle varchar(50) null
constraint PK_employees Primary key(employeeNumber),
)
select * from employees

bulk insert dbo.employees
from 'C:\Users\Grego\OneDrive\Desktop\Cleaned up CSV files\Employees.csv'
with
(
fieldterminator = ',',
rowterminator = '\n'
)
--offices
drop table if exists offices

create table dbo.offices(
officeCode varchar(100) not null,
city nchar(20) null,
phone varchar(20) null,
addressLine1 varchar(40) null,
addressLine2 varchar(40) null,
state varchar(15) null,
country nchar(20) null,
postalCode varchar(20) null,
terrtory nchar(20) null
constraint PK_offices Primary key(officeCode),
)
select * from dbo.offices

bulk insert dbo.offices
from 'C:\Users\Grego\OneDrive\Desktop\Cleaned up CSV files\Offices.csv'
with
(
fieldterminator = ',',
rowterminator = '\n'
)








