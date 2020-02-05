USE AdventureWorks2012;
WITH Dates AS
(

		SELECT CONVERT(DateTime, '2018-01-01') AS Date
		UNION ALL

		SELECT DATEADD(Day, 1, Date)
		FROM Dates
		WHERE Date < '2020-12-31'
)
SELECT Date
FROM Dates
WHERE Date between '2018-12-01' and '2019-01-01'
OPTION (MAXRECURSION 30000)

