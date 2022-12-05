/*
Create a view that the contains the information we want to pivot
*/
CREATE VIEW SalesLT.vCustGroups AS
SELECT AddressID, CHOOSE(AddressID % 3 + 1, N'A', N'B', N'C') AS custgroup, CountryRegion
FROM SalesLT.Address;

/*
Created view
SalesLT.CustGroups from the SalesLT.Address table that groups customers based on their address ID. 
View to retrieve results from it
*/
SELECT AddressID, custgroup, CountryRegion
FROM SalesLT.vCustGroups;

/*
pivot the data using the PIVOT operator
*/
SELECT CountryRegion, p.A, p.B, p.C
FROM SalesLT.vCustGroups PIVOT (
        COUNT(AddressID) FOR custgroup IN (A, B, C)
) AS p;


/*
Use subclauses like GROUPING SETS, ROLLUP, and CUBE to group data in different ways. 
Each subclause allows you to group data in a unique way. For instance, 
ROLLUP allows you to dictate a hierarchy and provides a grand total for your groupings. 
Alternatively, you can use CUBE to get all possible combinations for groupings

Create a view that captures sales information based on details from the SalesLT.Customer and SalesLT.SalesOrderHeader tables
*/
CREATE VIEW SalesLT.vCustomerSales AS 
SELECT Customer.CustomerID, Customer.CompanyName, Customer.SalesPerson, SalesOrderHeader.TotalDue 
FROM SalesLT.Customer 
INNER JOIN SalesLT.SalesOrderHeader 
    ON Customer.CustomerID = SalesOrderHeader.CustomerID;

SELECT * FROM SalesLT.vCustomerSales;


SELECT SalesPerson, CompanyName, SUM(TotalDue) AS TotalSales
FROM SalesLT.vCustomerSales
    GROUP BY ROLLUP (SalesPerson, CompanyName);
