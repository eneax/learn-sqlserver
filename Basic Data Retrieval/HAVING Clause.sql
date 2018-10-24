-- Demo: HAVING Clause
-- It is used just with SELECT statements

--Applying a predicate to a group
SELECT [sod].[ProductID],
	   [sod].[SpecialOfferID],
	   SUM([sod].[OrderQty]) AS [OrderQtyByProductID]
FROM [Sales].[SalesOrderDetail] AS [sod]
GROUP BY [sod].[ProductID],
		 [sod].[SpecialOfferID]
HAVING SUM([sod].[OrderQty]) >= 100
ORDER BY [sod].[ProductID],
		 [sod].[SpecialOfferID];
/*
Once the result has been grouped together,
I want to remove any value lower than 100
*/

-- Performance
SELECT [sod].[ProductID],
	   [sod].[SpecialOfferID],
	   SUM([sod].[OrderQty]) AS [OrderQtyByProductID]
FROM [Sales].[SalesOrderDetail] AS [sod]
GROUP BY [sod].[ProductID],
		 [sod].[SpecialOfferID]
HAVING [sod].[SpecialOfferID] IN (1,2,3)
ORDER BY [sod].[ProductID],
		 [sod].[SpecialOfferID];