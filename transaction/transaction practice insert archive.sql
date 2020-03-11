BEGIN TRANSACTION
INSERT INTO InvoiceArchive
SELECT Invoices.* FROM Invoices left join InvoiceArchive
ON Invoices.InvoiceID = InvoiceArchive.InvoiceID
WHERE (Invoices.InvoiceTotal - Invoices.CreditTotal - Invoices.PaymentTotal) = 0
AND InvoiceArchive.InvoiceID IS NULL;
DELETE FROM Invoices where InvoiceID IN (SELECT InvoiceID from InvoiceArchive)
COMMIT TRANSACTION