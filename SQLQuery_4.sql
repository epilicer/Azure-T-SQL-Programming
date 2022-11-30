DECLARE 
@i int = 8,
@result nvarchar(20);

SET @result = 
CASE 
WHEN @i < 5 THEN
    N'Less than 5'
WHEN @i <= 10 THEN
    N'Between 5 and 10'
WHEN @i > 10 THEN
    N'More than 10'
ELSE
    N'Unknown'
END;

SELECT @result AS result;

/*Between 5 and 10*/
