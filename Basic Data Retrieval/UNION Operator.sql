/*
UNION Operator
- Combines two or more SELECT statements into a single result set
- UNION eliminates duplicates
- UNION ALL retains each data set (including duplicates)
*/

-- Demo UNION Operator
USE AdventureWorks2012;

-- UNION example (no duplicates, more expensive for performance)
SELECT ProductID, UnitPrice
FROM [Sales].[SalesOrderDetail]
WHERE ProductID BETWEEN 1 AND 799
UNION
SELECT ProductID, UnitPrice
FROM [Sales].[SalesOrderDetail]
WHERE ProductID BETWEEN 800 AND 1000;

-- UNION ALL example (preserves duplicates)
SELECT ProductID, UnitPrice
FROM [Sales].[SalesOrderDetail]
WHERE ProductID BETWEEN 1 AND 799
UNION ALL
SELECT ProductID, UnitPrice
FROM [Sales].[SalesOrderDetail]
WHERE ProductID BETWEEN 800 AND 1000;