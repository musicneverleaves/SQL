USE AP CREATE ROLE PaymentEntry 
GRANT UPDATE ON Invoices TO PaymentEntry 
GRANT UPDATE,INSERT ON InvoiceLineItems TO PaymentEntry 
EXEC sp_AddRoleMember db_datareader, PaymentEntry
