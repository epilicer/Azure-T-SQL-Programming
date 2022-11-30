/* 
Challenge 2: Aggregate product sales
*/

DECLARE 
@customerID int = 1,
@fname nvarchar(20),
@lname nvarchar(30);

WHILE @customerID <= 10
BEGIN
    SELECT @fname = FirstName, @lname = LastName FROM SalesLT.Customer WHERE CustomerID = @customerID;
    PRINT @fname + N' ' + @lname
    SET @customerID += 1;
END;
