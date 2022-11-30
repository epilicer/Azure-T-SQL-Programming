DECLARE @num int = 5;
SELECT @num AS mynumber;
/* output 5 */

DECLARE
@num1 int,
@num2 int;
SET @num1 = 4;
SET @num2 = 6;
SELECT @num1 + @num2 AS totalnum;
/* output 10 */
