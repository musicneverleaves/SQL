USE AP;
WITH LargestInvoice AS
(SELECT VendorID, MAX(InvoiceTotal) AS LargestInvoice
FROM invoices
WHERE InvoiceTotal - CreditTotal - PaymentTotal > 0
GROUP BY VendorID)
SELECT SUM(LargestInvoice) AS SumOfMaximums
FROM LargestInvoice

