use TSQLV4
go


drop table if exists Products;

create table [dbo].[Products](
Productcode varchar(20)  Not null,
Productname nvarchar(60) null,
productline nchar(20) null,
productscale nchar(10) null,
productvendor nchar(30) null,
productdesc nvarchar(max) null,
quantityinstock int null,
buyprice float null,
msrp float null

constraint PK_Products primary key clustered
(
Productcode asc
)
)
go

select * from products

BULK INSERT   
dbo.products
FROM 'C:\Users\Grego\OneDrive\Desktop\Cleaned up CSV files\Products.csv'   
WITH   
(
fieldterminator = ',',
rowterminator = '\n'
)
