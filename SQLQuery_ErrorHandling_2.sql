--DECLARE @num varchar(20) = '0';
-- Error Message: Divide by zero error encountered.

--DECLARE @num varchar(20) = 'A';
-- Error Message: Error converting data type varchar to numeric.

DECLARE @num varchar(20) = ' 1000000000';
-- Error Message: Arithmetic overflow error converting varchar to data type numeric.

BEGIN TRY
    PRINT 5. / CAST(@num AS numeric(10,4));
END TRY
BEGIN CATCH
    PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS varchar(10));
    PRINT 'Error Message: ' + ERROR_MESSAGE();
END CATCH;
