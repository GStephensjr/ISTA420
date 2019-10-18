# Name: tsqlfuns-hw08b
## Author: Greg Stephens
## Date: 04 Aug, 2019

###### Read chapter 8, pages 266 – 287 in the T-SQL Fundamentals book.

##### 1. The sales tax rate for a state just changed. How would you update the state sales tax table to reflect the changes? Assume that this table has an ID column, an RATE column, and a STATE column.
T-SQL supports a standard UPDATE statement you can use to update rows in a table.

...

    UPDATE dbo.products
    SET rate = rate <>
    WHERE STATE = <>;

...


##### 2. The Revenue Division has requested that you provide a report on what the actual sales taxes would have been for all orders in the past year, assuming the retroactivity of the new sales tax rate. How would you calculate this?
...

    UPDATE OD
    SET rate <>
    FROM dbo.OrderDetails AS OD
    INNER JOIN dbo.Orders AS O
    ON OD.orderid = O.orderid
    WHERE orderdate > '2018-08-04';

...

##### 3. Explain how the proprietary assignment update command works.
T-SQL supports a proprietary UPDATE syntax that both updates data in a table and assigns values to variables at the same time

whenever you need to obtain a new sequence value, use the following code:
...

    DECLARE @nextval AS INT;
    UPDATE dbo.MySequences
    SET @nextval = val += 1
    WHERE id = 'SEQ1';
    SELECT @nextval;

...

The code declares a local variable called @nextval. Then it uses the special UPDATE syntax to
increment the column value by 1 and assigns the new value to a variable. The code then presents the
value in the variable. First val is set to val + 1, and then the result (val + 1) is set to the variable @nextval.
##### 4. What is one very important purpose of the MERGE SQL statement? What is ETL (not in book)?
- ETL stands for Extract, Transform and Load, which is a process used to collect data from various sources, transform the data depending on business rules/needs and load the data into a destination database. The need to use ETL arises from the fact that in modern computing business data resides in multiple locations and in many incompatible formats.
- the merge sql statements makes it much faster to load large amounts of data from many different places onto a single database.

##### 5. What are the semantics of MERGE?

...

    MERGE INTO dbo.Customers AS TGT
    USING dbo.CustomersStage AS SRC
    ON TGT.custid = SRC.custid
    WHEN MATCHED THEN
    UPDATE SET
    TGT.companyname = SRC.companyname,
    TGT.phone = SRC.phone,
    TGT.address = SRC.address
    WHEN NOT MATCHED THEN
    INSERT (custid, companyname, phone, address)
    VALUES (SRC.custid, SRC.companyname, SRC.phone, SRC.address);

...

##### 6. Write a typical INSERT OUTPUT statement.

...

    INSERT INTO dbo.T1(datacol)
    OUTPUT inserted.keycol, inserted.datacol
    INTO @NewRows(keycol, datacol)
    SELECT lastname
    FROM HR.Employees
    WHERE country = N'UK';
    SELECT * FROM @NewRows;

...

##### 7. write a typical UPDATE OUTPUT statement.

...

    UPDATE dbo.OrderDetails
    SET discount += 0.05
    OUTPUT
    inserted.orderid,
    inserted.productid,
    deleted.discount AS olddiscount,
    inserted.discount AS newdiscount
    WHERE productid = 51;

...

##### 8. Write a typical DELETE OUTPUT statement.

...

    DELETE FROM dbo.Orders
    OUTPUT
    deleted.orderid,
    deleted.orderdate,
    deleted.empid,
    deleted.custid
    WHERE orderdate < '20160101';

...

##### 9. Write a typical MERGE OUTPUT statement.

...

MERGE INTO dbo.Customers AS TGT
USING dbo.CustomersStage AS SRC
ON TGT.custid = SRC.custid
WHEN MATCHED THEN
UPDATE SET
TGT.companyname = SRC.companyname,
TGT.phone = SRC.phone,
TGT.address = SRC.address
WHEN NOT MATCHED THEN
INSERT (custid, companyname, phone, address)
VALUES (SRC.custid, SRC.companyname, SRC.phone, SRC.address)
OUTPUT $action AS theaction, inserted.custid,
deleted.companyname AS oldcompanyname,
inserted.companyname AS newcompanyname,
deleted.phone AS oldphone,
inserted.phone AS newphone,
deleted.address AS oldaddress,
inserted.address AS newaddress;

...

##### 10. What is nested DML?
T-SQL supports a feature called
nested DML you can use to directly insert into the final target table only the subset of rows you need from the full set of modified rows.
