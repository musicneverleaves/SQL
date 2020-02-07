USE AdventureWorks2012;
WITH Dates AS
(
		-- Anchor member
		SELECT CONVERT(DateTime, '2019-01-01') AS Date
		UNION ALL
		--Recursive member
		SELECT DATEADD(Day, 1, Date)
		FROM Dates
		WHERE Date < '2020-12-31'
)
SELECT Date
FROM Dates
WHERE Date between '2019-01-07' and '2019-04-26'
OPTION (MAXRECURSION 30000)
