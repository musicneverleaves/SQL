USE AP;
SELECT SUM(LargestInvoice) AS SumOfMaximums
FROM (SELECT VendorID, MAX(InvoiceTotal) AS LargestInvoice
FROM Invoices
WHERE InvoiceTotal - CreditTotal - PaymentTotal > 0
GROUP BY VendorID)
