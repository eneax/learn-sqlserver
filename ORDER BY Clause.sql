-- Demo: ORDER BY Clause
-- Sorts the data for the SELECT statement
-- ASC (ascending) is the default 

-- ORDER BY descending and ascending
SELECT [sod].[ProductID],
	   [sod].[SpecialOfferID]
FROM [Sales].[SalesOrderDetail] AS [sod]
ORDER BY [sod].[ProductID] DESC,
		 [sod].[SpecialOfferID] ASC;

-- Not Recommended
SELECT [sod].[ProductID],
	   [sod].[SpecialOfferID]
FROM [Sales].[SalesOrderDetail] AS [sod]
ORDER BY 1, 2;

SELECT [sod].[SpecialOfferID],
	   [sod].[ProductID]
FROM [Sales].[SalesOrderDetail] AS [sod]
ORDER BY 1, 2;