USE AdventureWorks2012;
With Sales AS
(
		SELECT SUM(TotalDue) AS CustomerTotal, AVG(TotalDue) AS AvgSale, MIN(TotalDue) AS MinSale, MAX(TotalDue) AS MaxSale, CustomerID
FROM Sales.SalesOrderHeader
		GROUP BY CustomerID
)
SELECT Orders.CustomerID, SalesOrderID, OrderDate, TotalDue, CustomerTotal, AvgSale, MinSale
FROM Sales.SalesOrderHeader AS Orders 
JOIN Sales ON Orders.CustomerID = Sales.CustomerID;
