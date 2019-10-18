--Name: tsqlfuns-lab08
--Author: Greg Stephens
--Date: 30 July, 2019

select top(1000)
[orderid] 
,[custid] 
,[empid] 
,[orderdate] 
,[requireddate] 
,[shippeddate] 
,[shipperid] 
,[freight] 
,[shipname] 
,[shipaddress] 
,[shipcity] 
,[shipregion] 
,[shippostalcode] 
,[shipcountry] 
from [tsqlv4].[sales].[orders];