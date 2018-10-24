-- Demo: GROUP BY Clause

-- GROUP BY: single column (notice, it isn't ordered)
SELECT [sod].[ProductID],
		SUM([sod].[OrderQty]) AS [OrderQuantityByProductID]
FROM [Sales].[SalesOrderDetail] AS [sod]
GROUP BY [sod].[ProductID];

-- GROUP BY: single column, with order
SELECT [sod].[ProductID],
		SUM([sod].[OrderQty]) AS [OrderQuantityByProductID]
FROM [Sales].[SalesOrderDetail] AS [sod]
GROUP BY [sod].[ProductID]
ORDER BY [sod].[ProductID];


-- GROUP BY: multi-column, with ordering
SELECT [sod].[ProductID],
	   [sod].[SpecialOfferID],
	   SUM([sod].[OrderQty]) AS [OrderQuantityByProductID]
FROM [Sales].[SalesOrderDetail] AS [sod]
GROUP BY [sod].[ProductID],
		 [sod].[SpecialOfferID]
ORDER BY [sod].[ProductID],
		 [sod].[SpecialOfferID];

-- GROUPING SETS
SELECT [sod].[ProductID],
	   [sod].[SpecialOfferID],
	   SUM([sod].[OrderQty]) AS [OrderQtyTotal]
FROM [Sales].[SalesOrderDetail] AS [sod]
GROUP BY GROUPING SETS
		(([sod].[ProductID], [sod].[SpecialOfferID]),
		([sod].[SpecialOfferID]))
ORDER BY [sod].[ProductID],
		 [sod].[SpecialOfferID];