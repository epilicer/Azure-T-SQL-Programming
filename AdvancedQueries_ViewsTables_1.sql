
SELECT ProductID, Name, ListPrice
FROM SalesLT.Product
WHERE ProductCategoryID = 6;

-- if you wanted to use a view for this data to ensure applications 
-- don't need to access the underlying table to fetch it
CREATE VIEW SalesLT.vProductsRoadBikes AS
SELECT ProductID, Name, ListPrice
FROM SalesLT.Product
WHERE ProductCategoryID = 6;

SELECT ProductID, Name, ListPrice
FROM SalesLT.vProductsRoadBikes
WHERE ListPrice < 1000;

SELECT ProductID, Name, ListPrice,
       CASE WHEN ListPrice > 1000 THEN N'High' ELSE N'Normal' END AS PriceType
FROM SalesLT.Product;

SELECT DerivedTable.ProductID, DerivedTable.Name, DerivedTable.ListPrice
FROM
    (
        SELECT
        ProductID, Name, ListPrice,
        CASE WHEN ListPrice > 1000 THEN N'High' ELSE N'Normal' END AS PriceType
        FROM SalesLT.Product
    ) AS DerivedTable
WHERE DerivedTable.PriceType = N'High';
