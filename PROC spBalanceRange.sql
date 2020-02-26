CREATE PROC spBalanceRange
@VendorVar varchar(50) = '%',
@BalanceMin money = 0,
@BalanceMax money = 0
AS
IF @BalanceMin IS NULL
SELECT @BalanceMin = MIN(InvoiceTotal) FROM Invoices
IF @BalanceMax IS NULL OR @BalanceMax =0
SELECT @BalanceMax = MAX(InvoiceTotal) FROM Invoices
IF @VendorVar IS NULL
SET @VendorVar ='%'

Select VendorName, InvoiceNumber, (InvoiceTotal - CreditTotal - PaymentTotal) AS Balance
FROM Vendors JOIN Invoices 
ON Vendors.VendorID = Invoices.VendorID
Where (InvoiceTotal - CreditTotal - PaymentTotal) > @BalanceMin 
AND (InvoiceTotal - CreditTotal - PaymentTotal) < @BalanceMax
AND VendorName LIKE @VendorVar;


