drop table if exists creditcarddefault;

CREATE TABLE creditcarddefault (ID INT, LIMIT_BAL INT, SEX INT, EDUCATION INT, MARRIAGE INT, AGE INT, 
PAY_0 INT, PA_2 INT, PAY_3 INT, PAY_4 INT, PAY_5 INT, PAY_6 INT,
BILL_AMT1 INT, BILL_AMT2 INT, BILL_AMT3 INT, BILL_AMT4 INT, BILL_AMT5 INT, BILL_AMT6 INT,
PAY_AMT1 INT, PAY_AMT2 INT , PAY_AMT3 INT, PAY_AMT4 INT, PAY_AMT5 INT, PAY_AMT6 INT, PAYMENT INT);

BULK INSERT
creditcarddefault
FROM 'C:\Users\Grego\OneDrive\Desktop\MSSA\ISTA420\exercises\Bulk Insert Statements\defaultcreditclients.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

select * from creditcarddefault;
