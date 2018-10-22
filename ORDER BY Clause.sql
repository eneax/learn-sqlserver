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




-- Demo: Query Paging

-- Returning the first 25 rows
SELECT [e].[FirstName],
		[e].[LastName],
		[e].[AddressLine1]
FROM [HumanResources].[vEmployee] AS [e]
ORDER BY [e].[LastName], [e].[FirstName]
	OFFSET 0 ROWS
	FETCH NEXT 25 ROWS ONLY;
	-- just like using TOP 25

-- Paging through the next 25 rows
SELECT [e].[FirstName],
		[e].[LastName],
		[e].[AddressLine1]
FROM [HumanResources].[vEmployee] AS [e]
ORDER BY [e].[LastName], [e].[FirstName]
	OFFSET 25 ROWS
	FETCH NEXT 25 ROWS ONLY;
	-- we skip the first 25 rows