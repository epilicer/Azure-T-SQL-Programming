CREATE PROCEDURE SalesLT.TopProducts AS
SELECT TOP(10) name, listprice
            FROM SalesLT.Product
            GROUP BY name, listprice
            ORDER BY listprice DESC;

EXECUTE SalesLT.TopProducts;

-- change procedure
ALTER PROCEDURE SalesLT.TopProducts @ProductCategoryID int
AS
SELECT TOP(10) name, listprice
        FROM SalesLT.Product
        WHERE ProductCategoryID = @ProductCategoryID 
        GROUP BY name, listprice
        ORDER BY listprice DESC;

-- Pass a value with its name
EXECUTE SalesLT.TopProducts @ProductCategoryID = 18;

-- Pass a value to the stored procedure by position instead of by name
EXECUTE SalesLT.TopProducts 41;
