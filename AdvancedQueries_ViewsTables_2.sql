/*
Write a Transact-SQL query to create a view for customer addresses in Canada.

Create a view based on the following columns in the SalesLT.Address table:
AddressLine1
City
StateProvince
CountryRegion
In your query, use the CountryRegion column to filter for addresses located in Canada only.
*/
CREATE VIEW SalesLT.vAddressCA AS
SELECT AddressLine1, City, StateProvince, CountryRegion
FROM SalesLT.Address
WHERE CountryRegion = 'Canada';

/*
Query your new view.

Fetch the rows in your newly created view to ensure it was created successfully. Notice that it only shows address in Canada.
*/
SELECT * FROM SalesLT.vAddressCA;


/*
Write a query that classifies products as heavy and normal based on their weight.

Use the Weight column to decide whether a product is heavy or normal.
*/
SELECT ProductID, Name, Weight, ListPrice,
       CASE WHEN Weight > 1000 THEN N'Heavy' ELSE N'Normal' END AS WeightType
FROM SalesLT.Product;

/*
Create a derived table based on your query

Use your derived table to find any heavy products with a list price over 2000.
Make sure to select the following columns: ProductID, Name, Weight, ListPrice.
*/
SELECT DerivedTable.ProductID, DerivedTable.Name, DerivedTable.Weight, DerivedTable.ListPrice
FROM
    (
        SELECT ProductID, Name, Weight, ListPrice,
               CASE WHEN Weight > 1000. THEN N'Heavy' ELSE N'Normal' END AS WeightType
        FROM SalesLT.Product
    ) AS DerivedTable
WHERE DerivedTable.WeightType = N'Heavy' AND DerivedTable.ListPrice > 2000;
