.echo on
.headers on

--Name: Family.sql
--Author: Greg Stephens
--Date: Juy 1, 2019

drop table if exists family;

create table family(
id integer,
name text,
sex integer,
role text,
birth location text
);

insert into family values (1, "Greg", 1, "parent", "Kansas");
insert into family values (2, "Madeline", 0, "parent", "Missouri");
insert into family values (3, "Phantom", 1, "child", "Georgia");
insert into family values (4, "Denise", 0, "child", "Georgia");

select * from family;
select * from family where sex = 1;
select * from family where role like "parent";

.exit