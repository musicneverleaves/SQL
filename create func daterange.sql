CREATE FUNCTION fnDateRange ( 
@MinDate varchar(50) = NULL, 
@MaxDate varchar(50) = NULL
)
RETURNS TABLE
As
RETURN
(
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, InvoiceTotal - CreditTotal - PaymentTotal AS Balance
FROM Invoices 
WHERE InvoiceDate BETWEEN @MinDate AND @MaxDate
);