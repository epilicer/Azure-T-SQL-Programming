DECLARE 
@empname nvarchar(30),
@empid int;

SET @empid = 5;

SET @empname = (SELECT FirstName + N' ' + LastName FROM SalesLT.Customer WHERE CustomerID = @empid)
/*GO*/
SELECT @empname AS employee;
/*GO*/

/*empid=5 Lucy Harrington*/
/*empid=2 Keith Harris*/

/*
Variables are local to the batch in which they're defined. 
If you try to refer to a variable that was defined in another batch, 
you get an error saying that the variable wasn't defined. 
Also, keep in mind that GO is a client command, not a server T-SQL command.
*/
