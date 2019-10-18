# Name: tsqlfuns-hw08
### Author: Greg Stephens
### Date: 29 July, 2019

##### 1. When using INSERT, is the list of columns necessary? Why or why not?
its not. Sql server will automatically insert your values into the colums in order of appearance
however you can specify which columns get what value if you are entering information out of order.

##### 2. When using INSERT SELECT, do you use a subquery (derived table)? Under what circumstances do you not use a subquery?
you only use a subquery to insert a derived table when youre inserting multiple rows into the target table

##### 3. What is the operand for the INSERT EXEC statement?
INSERT EXEC,
its just like INSERT SELECT except you replace select with exec,
pg252

the operand is the stored procedure you would use with the exec command

##### 4. How would you use the INSERT INTO statement?
the insert into statement adds entries to a table. its optional to specify column names as long
as you're filling every column

##### 5. What are the parameters to the BULK INSERT statement?
txt file address
DATAFILETYPE
FIELDTERMINATOR
ROWTERMINATOR

##### 6. Does IDENTITY guarantee uniqueness? If not, how do you guarantee uniqueness?
no.
define a primary key yourself or a unique constraint

##### 7. How do you create a SEQUENCE object?
use the CREATE SEQUENCE command

##### 8. How do you use a SEQUENCE object?
Like identity, the sequence object allows you to specify the starting value (START WITH <val>)
and the increment (INCREMENT BY <val>).

##### 9. How do you alter a SEQUENCE object?
You can change the sequence with the ALTER SEQUENCE command

##### 10. What is the difference between DELETE and TRUNCATE?
- The DELETE statement is a standard statement used to delete data from a table based on an optional
filter predicate.
- Unlike the DELETE statement, TRUNCATE has no filter.

##### 11. What is the difference between DELETE and DROP TABLE?
- delete permissions are required on the target table. If you need to use a WHERE clause in a DELETE, select permissions are required as well
- DROP table query removes one or more table definitions and all data, indexes, triggers, constraints, and permission specifications for those tables.
DROP command requires ALTER permission on the schema to which the table belongs, CONTROL permission on the table, or membership in the db_ddladmin fixed database role.
