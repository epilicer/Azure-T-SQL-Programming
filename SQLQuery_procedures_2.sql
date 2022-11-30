CREATE FUNCTION SalesLT.GetFreightbyCustomer
(@orderyear AS INT) RETURNS TABLE
AS
RETURN
SELECT
customerid, SUM(freight) AS totalfreight
FROM SalesLT.SalesOrderHeader
WHERE YEAR(orderdate) = @orderyear
GROUP BY customerid; 

SELECT * FROM SalesLT.GetFreightbyCustomer(2008);
