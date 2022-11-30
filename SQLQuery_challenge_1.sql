/* 
Challenge 1: Assignment of values to variables
*/

DECLARE 
@customerID int,
@salesOrderNumber nvarchar(30);

SET @customerID = 29847;
SET @salesOrderNumber = (SELECT SalesOrderNumber FROM SalesLT.SalesOrderHeader WHERE CustomerID = @customerID)
SELECT @salesOrderNumber AS OrderNumber;
