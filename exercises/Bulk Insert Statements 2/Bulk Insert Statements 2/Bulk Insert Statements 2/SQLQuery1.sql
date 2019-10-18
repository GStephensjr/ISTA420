drop table if exists wholesalecustomerdata;

create table wholesalecustomerdata (
channel int,
region int,
fresh int,
milk int,
grocery int,
frozen int,
detergents_paper int,
delicassen int
);

bulk insert
wholesalecustomerdata
from 'C:\Users\Grego\Downloads\wholesalecustomerdata.csv'
with
(
firstrow = 2,
fieldterminator = ',',
rowterminator = '\n'
);

select * from wholesalecustomerdata;
