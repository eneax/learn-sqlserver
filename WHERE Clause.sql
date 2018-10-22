-- Demo: WHERE Clause

-- One predicate
SELECT [sod].[SalesOrderID],
	   [sod].[SalesOrderDetailID]
FROM [Sales].[SalesOrderDetail] AS [sod]
WHERE [sod].[CarrierTrackingNumber] = '4911-403c-98';

-- Two predicates with AND
SELECT [sod].[SalesOrderID],
	   [sod].[SalesOrderDetailID],
	   [sod].[SpecialOfferID],
	   [sod].[CarrierTrackingNumber]
FROM [Sales].[SalesOrderDetail] AS [sod]
WHERE [sod].[CarrierTrackingNumber] = '4911-403c-98' AND
	  [sod].[SpecialOfferID] = 1;

-- Two predicates with OR
SELECT [sod].[SalesOrderID],
	   [sod].[SalesOrderDetailID],
	   [sod].[CarrierTrackingNumber],
	   [sod].[SpecialOfferID]
FROM [Sales].[SalesOrderDetail] AS [sod]
WHERE [sod].[CarrierTrackingNumber] = '4911-403c-98' OR
	  [sod].[SpecialOfferID] = 1;

-- Three predicates AND and OR
SELECT [sod].[SalesOrderID],
	   [sod].[SalesOrderDetailID],
	   [sod].[ProductID]
FROM [Sales].[SalesOrderDetail] AS [sod]
WHERE ([sod].[CarrierTrackingNumber] = '4911-403c-98' AND [sod].SpecialOfferID = 1) OR
	   [sod].[ProductID] = 711;

-- Negating a Boolean Expression
SELECT [sod].[SalesOrderID],
	   [sod].[SalesOrderDetailID],
	   [sod].[ProductID]
FROM [Sales].[SalesOrderDetail] AS [sod]
WHERE NOT [sod].[ProductID] = 711;



-- Demo: DISTINCT
-- If you add DISTINCT to a SELECT clause, it will remove duplicate rows from the final result set
-- Use DISTINCT only if you really need it
-- NULL is treated as a distinct value

-- No DISTINCT (we will have 12 rows, all duplicates with SalesOrderID = 43659)
SELECT [sod].[SalesOrderID]
FROM [Sales].[SalesOrderDetail] AS [sod]
WHERE [sod].[CarrierTrackingNumber] = '4911-403c-98';

-- With DISTINCT (we will have only one row with SalesOrderID = 43659)
SELECT DISTINCT [sod].[SalesOrderID]
FROM [Sales].[SalesOrderDetail] AS [sod]
WHERE [sod].[CarrierTrackingNumber] = '4911-403c-98';

-- NULL handling
SELECT DISTINCT [CarrierTrackingNumber]
FROM [Sales].[SalesOrderDetail] AS [sod]
ORDER BY [CarrierTrackingNumber];

-- Count rows with NULL
SELECT COUNT(*)
FROM [Sales].[SalesOrderDetail] AS [sod]
WHERE [CarrierTrackingNumber] IS NULL;