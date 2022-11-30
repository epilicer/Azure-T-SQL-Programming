--DECLARE @num varchar(20) = 'A';
DECLARE @num varchar(20) = '0';

BEGIN TRY
    PRINT 5. / CAST(@num AS numeric(10,4));
END TRY
BEGIN CATCH
    IF ERROR_NUMBER() IN (245, 8114)
    BEGIN
        PRINT 'Handling conversion error...'
    END
    ELSE
    BEGIN 
        PRINT 'Handling non-conversion error...';
    END;

    PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS varchar(10));
    PRINT 'Error Message: ' + ERROR_MESSAGE();
END CATCH;

