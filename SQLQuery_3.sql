DECLARE 
@i int = 8,
@result nvarchar(20);

IF @i < 5
    SET @result = N'Less than 5'
ELSE IF @i <= 10
    SET @result = N'Between 5 and 10'
ELSE if @i > 10
    SET @result = N'More than 10'
ELSE
    SET @result = N'Unknown';

SELECT @result AS result;

/*Between 5 and 10*/
