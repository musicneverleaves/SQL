USE MyGuitarShop
CREATE ROLE OrderEntry
GRANT UPDATE
ON Orders
TO OrderEntry
GRANT INSERT,UPDATE
ON OrderItems
TO OrderEntry