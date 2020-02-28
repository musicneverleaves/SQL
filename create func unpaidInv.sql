CREATE FUNCTION fnUnpaidInvoiceID()
RETURNS INT
AS
BEGIN
RETURN (
SELECT TOP 1 InvoiceID
FROM Invoices
WHERE (InvoiceTotal - CreditTotal - PaymentTotal) > 0
ORDER BY InvoiceDate
)
END