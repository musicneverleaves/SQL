CREATE TRIGGER ShippingLabels_Insert
	ON ShippingLabels
	 AFTER INSERT, UPDATE 
	 AS
	 INSERT ShippingLabels
	 SELECT VendorName, VendorAddress1, VendorAddress2,
	 VendorCity, VendorState, VendorZipCode
	 FROM Vendors JOIN ShippingLabels
	 ON Vendors.VendorID = (SELECT VendorID FROM VENDOR)
	 WHERE Inserted.InvoiceTotal - Inserted.PaymentTotal- Inserted.CreditTotal = 0