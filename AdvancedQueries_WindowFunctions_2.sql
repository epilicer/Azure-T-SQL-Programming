-- returns a Rank value for products within each category
WITH sales AS
(
    SELECT C.Name AS 'Category', SC.Name AS 'Subcategory', CAST(SUM(D.LineTotal) AS numeric(12, 2)) AS 'SalesValue'
    FROM SalesLT.SalesOrderDetail AS D
    INNER JOIN SalesLT.Product AS P
        ON D.ProductID = P.ProductID
    INNER JOIN SalesLT.ProductCategory AS SC
        ON P.ProductCategoryID = SC.ProductCategoryID
    INNER JOIN SalesLT.ProductCategory AS C
        ON SC.ParentProductCategoryID = C.ProductCategoryID
        GROUP BY C.Name, SC.Name
)
SELECT Category, Subcategory, SalesValue, RANK() OVER(PARTITION BY Category ORDER BY SalesValue DESC) AS 'Rank'
FROM sales
    ORDER BY Category, SalesValue DESC;



-- return the following year’s budget value as "Next"
SELECT [Year], Budget, LEAD(Budget, 1, 0) OVER (ORDER BY [Year]) AS 'Next'
FROM dbo.Budget
    ORDER BY [Year];

-- return the first and last budget values for each year
SELECT [Year], Budget,
        FIRST_VALUE(Budget) OVER (ORDER BY [Year]) AS 'First_Value',
        LAST_VALUE(Budget) OVER (ORDER BY [Year] ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS 'Last_Value'
FROM dbo.Budget
    ORDER BY [Year];

-- return a count of products by category
SELECT C.Name AS 'Category', SC.Name AS 'Subcategory', COUNT(P.Name) OVER (PARTITION BY C.Name) AS 'ProductCount'
FROM SalesLT.SalesOrderDetail AS D
    INNER JOIN SalesLT.Product AS P
        ON D.ProductID = P.ProductID
    INNER JOIN SalesLT.ProductCategory AS SC
        ON P.ProductCategoryID = SC.ProductCategoryID
    INNER JOIN SalesLT.ProductCategory AS C
        ON SC.ParentProductCategoryID = C.ProductCategoryID
    GROUP BY C.Name, SC.Name, P.Name
    ORDER BY C.Name, SC.Name, P.Name;
