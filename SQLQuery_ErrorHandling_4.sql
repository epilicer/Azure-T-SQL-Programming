CREATE PROCEDURE dbo.GetErrorInfo AS
PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS varchar(10));
PRINT 'Error Message: ' + ERROR_MESSAGE();
PRINT 'Error Severity: ' + CAST(ERROR_SEVERITY() AS varchar(10));
PRINT 'Error State: ' + CAST(ERROR_STATE() AS varchar(10));
PRINT 'Error Line: ' + CAST(ERROR_LINE() AS varchar(10));
PRINT 'Error Proc: ' + COALESCE(ERROR_PROCEDURE(), 'Not within procedure');


DECLARE @num varchar(20) = '0';

BEGIN TRY
    PRINT 5. / CAST(@num AS numeric(10,4));
END TRY
BEGIN CATCH
    EXECUTE dbo.GetErrorInfo;
    -- throw the error message again (so a client application can catch and process it)
    THROW; 
END CATCH;

/*

w/o THROW
Started executing query at Line 11
Error Number: 8134
Error Message: Divide by zero error encountered.
Error Severity: 16
Error State: 1
Error Line: 4
Error Proc: Not within procedure
Total execution time: 00:00:00.009

w THROW
Started executing query at Line 10
Error Number: 8134
Error Message: Divide by zero error encountered.
Error Severity: 16
Error State: 1
Error Line: 5
Error Proc: Not within procedure
Msg 8134, Level 16, State 1, Line 5
Divide by zero error encountered.
Total execution time: 00:00:00.010

*/
