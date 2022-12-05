/*
Ranking function

Create a query that uses a window function to return a ranking value. 
The query uses a CTE (common table expression) called sales. 
Use the sales CTE to add the RANK window function.

The product categories now have a rank number according to the SalesValue for each category. 
Notice that the RANK function required the rows to be ordered by SalesValue, 
but the final result set was ordered by Category.
*/
WITH sales AS
(
    SELECT C.Name AS 'Category', CAST(SUM(D.LineTotal) AS numeric(12, 2)) AS 'SalesValue'
    FROM SalesLT.SalesOrderDetail AS D
    INNER JOIN SalesLT.Product AS P
        ON D.ProductID = P.ProductID
    INNER JOIN SalesLT.ProductCategory AS C
        ON P.ProductCategoryID = C.ProductCategoryID
    WHERE C.ParentProductCategoryID = 4
        GROUP BY C.Name
)
SELECT Category, SalesValue, RANK() OVER(ORDER BY SalesValue DESC) AS 'Rank'
FROM sales
    ORDER BY Category;


/*
Offset function

Create a new table called Budget populated with budget values for five years. 
Use the LAG window function to return each year's budget, together with the previous year's budget value.
*/
CREATE TABLE dbo.Budget
(
    [Year] int NOT NULL PRIMARY KEY,
    Budget int NOT NULL
);

INSERT INTO dbo.Budget ([Year], Budget)
    VALUES
        (2017, 14600),
        (2018, 16300),
        (2019, 18200),
        (2020, 21500),
        (2021, 22800);

SELECT [Year], Budget, LAG(Budget, 1, 0) OVER (ORDER BY [Year]) AS 'Previous'
    FROM dbo.Budget
    ORDER BY [Year]; 


/*
Aggregation function

Ceate a query that uses PARTITION BY to count the number of subcategories in each category.
*/
SELECT C.Name AS 'Category', SC.Name AS 'Subcategory', COUNT(SC.Name) OVER (PARTITION BY C.Name) AS 'SubcatCount'
FROM SalesLT.SalesOrderDetail AS D
INNER JOIN SalesLT.Product AS P
    ON D.ProductID = P.ProductID
INNER JOIN SalesLT.ProductCategory AS SC
    ON P.ProductCategoryID = SC.ProductCategoryID
INNER JOIN SalesLT.ProductCategory AS C
    ON SC.ParentProductCategoryID = C.ProductCategoryID
    GROUP BY C.Name, SC.Name
    ORDER BY C.Name, SC.Name;


