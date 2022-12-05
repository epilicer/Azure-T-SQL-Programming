/*
How many products are available across the different color types

For each product category, count how many products are available across all the color types.
Use the SalesLT.Product and SalesLT.ProductCategory tables to get a list of products, their colors, and product categories.
Pivot your data so that the color types become columns.
*/
SELECT * 
FROM 
(
    SELECT P.ProductID, PC.Name, ISNULL(P.Color, 'Uncolored') AS Color 
    FROM Saleslt.ProductCategory AS PC 
    JOIN SalesLT.Product AS P 
        ON PC.ProductCategoryID = P.ProductCategoryID
) AS PPC PIVOT(
    COUNT(ProductID) FOR Color IN(
        [Red], [Blue], [Black], [Silver], [Yellow], 
        [Grey], [Multi], [Uncolored]
    )
) AS pvt 
    ORDER BY Name;

-- Retrieve customer sales data, and group the data.
SELECT CompanyName, SalesPerson, SUM(TotalDue) AS TotalSales
FROM SalesLT.vCustomerSales
    GROUP BY CUBE (CompanyName, SalesPerson);
