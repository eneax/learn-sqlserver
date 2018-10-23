-- Demo: INNER JOIN
/*
- Given 2 data sources, it returns all matching pairs of rows, 
  while the unmatched one are discarded
- It must be used to filter rows in the ON clause
*/

USE AdventureWorks2012;

SELECT p.Name, od.ProductID,
	   od.SalesOrderDetailID, od.OrderQty
FROM [Production].[Product] AS p
INNER JOIN [Sales].[SalesOrderDetail] AS od
ON p.ProductID = od.ProductID -- this is the join condition
ORDER BY p.Name, od.SalesOrderDetailID;