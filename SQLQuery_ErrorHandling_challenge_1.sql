-- Challenge 1: Catch errors and display only valid records

DECLARE @customerID AS INT = 30110;
DECLARE @fname AS NVARCHAR(20);
DECLARE @lname AS NVARCHAR(30);
DECLARE @maxReturns AS INT = 1; 

WHILE @maxReturns <= 10
BEGIN
    BEGIN TRY
        SELECT @fname = FirstName, @lname = LastName FROM SalesLT.Customer
            WHERE CustomerID = @CustomerID;
        --PRINT @fname + N' ' + @lname;
        -- Only display valid customers
        IF @@ROWCOUNT > 0 
        BEGIN
            PRINT CAST(@customerID as NVARCHAR(20)) + N' ' + @fname + N' ' + @lname;
        END        
    END TRY
    BEGIN CATCH
        PRINT 'Unable to run query'
    END CATCH
    SET @maxReturns += 1;
    SET @CustomerID += 1;
END;

