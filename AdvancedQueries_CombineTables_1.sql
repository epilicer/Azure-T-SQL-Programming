SELECT CompanyName 
FROM SalesLt.Customer  
WHERE CustomerID BETWEEN 1 and 20000   
UNION
    SELECT CompanyName 
    FROM SalesLt.Customer  
    WHERE CustomerID BETWEEN 20000 and 40000;
    

-- Prepare tables
DECLARE @t1 AS table
(Name nvarchar(30) NOT NULL);
DECLARE @t2 AS table
([Name] nvarchar(30) NOT NULL);
INSERT INTO @t1 ([Name])
    VALUES
        (N'Daffodil'),
        (N'Camembert'),
        (N'Neddy'),
        (N'Smudge'),
        (N'Molly');
INSERT INTO @t2 ([Name])
    VALUES
        (N'Daffodil'),
        (N'Neddy'),
        (N'Molly'),
        (N'Spooky');
SELECT [Name]
FROM @t1
INTERSECT
SELECT [Name]
FROM @t2
    ORDER BY [Name];

Write a table-valued function to return the product category and quantity ordered by specific customers. 
Pass the CustomerID fom the select statement to the table-valued function in a CROSS APPLY statement.
*/
CREATE OR ALTER FUNCTION dbo.ProductSales (@CustomerID int)
RETURNS TABLE
RETURN
    SELECT C.[Name] AS 'Category', SUM(D.OrderQty) AS 'Quantity'
        FROM SalesLT.SalesOrderHeader AS H
            INNER JOIN SalesLT.SalesOrderDetail AS D
                ON H.SalesOrderID = D.SalesOrderID
            INNER JOIN SalesLT.Product AS P
                ON D.ProductID = P.ProductID
            INNER JOIN SalesLT.ProductCategory AS C
                ON P.ProductCategoryID = C.ProductCategoryID
        WHERE H.CustomerID = @CustomerID
            GROUP BY C.[Name]


SELECT C.CustomerID, C.CompanyName, P.Category, P.Quantity
FROM SalesLT.Customer AS C
    CROSS APPLY dbo.ProductSales(C.CustomerID) AS P;



/*    
