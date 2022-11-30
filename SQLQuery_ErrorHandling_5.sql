CREATE PROCEDURE dbo.GetErrorInfo AS
PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS varchar(10));
PRINT 'Error Message: ' + ERROR_MESSAGE();
PRINT 'Error Severity: ' + CAST(ERROR_SEVERITY() AS varchar(10));
PRINT 'Error State: ' + CAST(ERROR_STATE() AS varchar(10));
PRINT 'Error Line: ' + CAST(ERROR_LINE() AS varchar(10));
PRINT 'Error Proc: ' + COALESCE(ERROR_PROCEDURE(), 'Not within procedure');

DECLARE @num varchar(20) = 'A';

BEGIN TRY
    PRINT 5. / CAST(@num AS numeric(10,4));
END TRY
BEGIN CATCH
    EXECUTE dbo.GetErrorInfo;

    IF ERROR_NUMBER() = 8134
    BEGIN
        PRINT 'Handling devision by zero...';
    END
    ELSE 
    BEGIN
        PRINT 'Throwing original error';
        THROW;
    END;

END CATCH;


/*
Started executing query at Line 10
Error Number: 8114
Error Message: Error converting data type varchar to numeric.
Error Severity: 16
Error State: 5
Error Line: 4
Error Proc: Not within procedure
Throwing original error
Msg 8114, Level 16, State 5, Line 4
Error converting data type varchar to numeric.
Total execution time: 00:00:00.002
*/
