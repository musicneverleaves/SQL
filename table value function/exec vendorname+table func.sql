SELECT Vendors.VendorName,fnTable.*
from Vendors
join
Invoices
on Vendors.VendorID = Invoices.VendorID
join
fnDateRange(20111210,20111220) AS fnTable
on Invoices.InvoiceNumber = fnTable.InvoiceNumber;