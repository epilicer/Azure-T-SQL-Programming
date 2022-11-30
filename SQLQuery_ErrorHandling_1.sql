BEGIN TRY
    -- Conversion failed when converting the nvarchar value 'Some text' to data type int. 
    SELECT CAST(N'Some text' AS int);
END TRY
BEGIN CATCH
    PRINT 'Error';
END CATCH;
