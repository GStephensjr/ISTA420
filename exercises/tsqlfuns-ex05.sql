use TSQLV4
go

drop table if exists presidents

create table dbo.presidents(
ID int not null,
LastName nchar(20) null,
FirstName nchar(20) null,
MiddleName nchar(20) null,
OrderofPresidency int null,
DateofBirth varchar(30) null,
DateofDeath varchar(30) null,
LocationofBirth varchar(30) null,
StateofBirth varchar(30) null,
HomeState varchar(30) null,
PartyAffiliation varchar(50) null,
DatetookOffice varchar(30) null,
DateLeftOffice varchar(30) null,
AssassinationAttempt varchar(30) null,
Assassinated varchar(30) null,
ReligiousAffiliation varchar(30) null,
ImagePath varchar(50) null
)
select * from presidents

bulk insert presidents
from 'C:\Users\Grego\OneDrive\Desktop\MSSA\ISTA420\exercises\presidents.csv'
with
(
firstrow = 2,
fieldterminator = ',',
rowterminator = '\n'
)

alter table presidents
drop column ImagePath

alter table presidents
add primary key(ID)

update presidents
set DateLeftOffice = '1/20/2017'
where lastname = 'Obama'

insert into presidents
output inserted.*
values ('45','Trump','Donald','John','45','6/14/1946',Null,'New York City','New York','New York','Republican','1/20/2017',null,'false','false','christian')

select homestate, count(*) as TotalRepublicans
from dbo.presidents
where PartyAffiliation = 'Republican'
group by homestate

select homestate, count(*) as TotalDemocrats
from dbo.presidents
where PartyAffiliation = 'Democratic'
group by homestate

select homestate, count(*) as TotalIndependents
from dbo.presidents
where PartyAffiliation = 'Independent'
group by homestate
