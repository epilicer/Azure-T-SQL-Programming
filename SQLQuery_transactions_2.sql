BEGIN TRY
BEGIN TRANSACTION;
    -- Get the highest order ID and add 1
  DECLARE @OrderID INT;
  SELECT @OrderID = MAX(SalesOrderID) + 1 FROM SalesLT.SalesOrderHeader;

  -- Insert the order header
  INSERT INTO SalesLT.SalesOrderHeader (SalesOrderID, OrderDate, DueDate, CustomerID, ShipMethod)
  VALUES (@OrderID, GETDATE(), DATEADD(month, 1, GETDATE()), 1, 'CARGO TRANSPORT');

  -- Insert one or more order details
  INSERT INTO SalesLT.SalesOrderDetail (SalesOrderID, OrderQty, ProductID, UnitPrice)
  VALUES (@OrderID, 1, 712, 8.99);

COMMIT TRANSACTION;
PRINT 'Transaction committed.';

END TRY
BEGIN CATCH
  PRINT 'An error occurred.'
  IF (XACT_STATE()) <> 0
  BEGIN
      PRINT 'Transaction in process.'
    ROLLBACK TRANSACTION;
    PRINT 'Transaction rolled back.'; 
  END;
END CATCH
