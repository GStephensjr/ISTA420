.echo on
.headers on

--Name: family.sql
--Author: Greg Stephens
--Date: July 1, 2019

drop table if exists family;

create table family (
id integer,
name text,
sex integer,
role text
);

.print ''
insert into family values (1, "Greg", 1, "parent");
insert into family values (2, "Madeline", 0, "parent");
insert into family values (3, "Phantom", 1, "child");
insert into family values (4, "Dennis", 1, "child");

select * from family;
select * from family where sex = 0;
select * from family where role like "parent";

.exit