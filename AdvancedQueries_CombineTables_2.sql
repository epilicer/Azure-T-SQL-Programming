-- return ALL company names, including duplicates
SELECT CompanyName 
FROM SalesLt.Customer  
WHERE CustomerID BETWEEN 1 and 20000   
UNION ALL
    SELECT CompanyName 
    FROM SalesLt.Customer  
    WHERE CustomerID BETWEEN 20000 and 40000;


-- return names from t1 that do not appear in t2
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
    EXCEPT
SELECT [Name]
FROM @t2
    ORDER BY [Name];
