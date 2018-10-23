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



-- Demo: OUTER JOIN
/*
- LEFT: return all rows from the left table that match the right table
		and also rows from the left table that do NOT match
		(unmatched are returned as NULL)

- RIGHT: return all rows from the right table that match the left table
		 and also rows from the right table that do NOT match
		 (unmatched are returned as NULL)

- FULL:	return all rows from the right and the left table that match 
		and also any unmatched rows from either table
		(unmatched are returned as NULL)
*/

-- Contrast with LEFT OUTER JOIN
SELECT p.Name, od.ProductID,
	   od.SalesOrderDetailID, od.OrderQty
FROM [Production].[Product] AS p
LEFT OUTER JOIN [Sales].[SalesOrderDetail] AS od
ON p.ProductID = od.ProductID
ORDER BY p.Name, od.SalesOrderDetailID;
-- Adjustable Race (Product --> left table) doesn't have any match in the right table

-- What's the difference
SELECT p.Name, od.ProductID,
	   od.SalesOrderDetailID, od.OrderQty
FROM [Production].[Product] AS p
LEFT OUTER JOIN [Sales].[SalesOrderDetail] AS od
ON p.ProductID = od.ProductID
WHERE od.ProductID IS NULL
ORDER BY p.Name, od.SalesOrderDetailID;
-- 238 products exist only on the Product table and don't have any match on the SalesOrderDetail

-- Predicate placement in ON
-- (additional condition that OrderQty > 2)
SELECT p.Name, od.ProductID,
	   od.SalesOrderDetailID, od.OrderQty
FROM [Production].[Product] AS p
LEFT OUTER JOIN [Sales].[SalesOrderDetail] AS od
ON p.ProductID = od.ProductID AND
   od.OrderQty > 2
ORDER BY p.Name, od.SalesOrderDetailID;

-- Predicate placement in WHERE
SELECT p.Name, od.ProductID,
	   od.SalesOrderDetailID, od.OrderQty
FROM [Production].[Product] AS p
LEFT OUTER JOIN [Sales].[SalesOrderDetail] AS od
ON p.ProductID = od.ProductID
WHERE od.ProductID > 2 -- this is evaluated after the join condition (returns not null values)
ORDER BY p.Name, od.SalesOrderDetailID;




-- Demo: Cross Joins
/*
- Cartesian Product
- Each row from a data source is matched with ALL rows in the other data source
- DataSource1 multiplied by DataSource2
- There is no ON clause
*/

-- How many counts?
SELECT COUNT(*)
FROM [HumanResources].[Employee]; -- 290 rows

SELECT COUNT(*)
FROM [HumanResources].[EmployeeDepartmentHistory]; --296 rows

SELECT e.BusinessEntityID, edh.DepartmentID
FROM [HumanResources].[Employee] AS e
CROSS JOIN [HumanResources].[EmployeeDepartmentHistory] AS edh; -- 290 * 296



-- Practical usage - numbers result set (create a list of 100000 numbers)
SELECT TOP 100000
	ROW_NUMBER() OVER (ORDER BY sv1.number) AS num
FROM [master].[dbo].[spt_values] sv1
CROSS JOIN [master].[dbo].[spt_values] sv2;
