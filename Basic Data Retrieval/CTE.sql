-- Intro to Common Table Expressions (CTEs)
USE AdventureWorks2012;

-- Simple CTE reference
WITH ProductQty AS
	(SELECT ProductID, LocationID, Shelf, Bin, Quantity
	 FROM [Production].[ProductInventory])
SELECT ProductID, SUM(Quantity) SumQuantity
FROM ProductQty
GROUP BY ProductID;

-- Optional target column list
WITH ProductQty (PID, LID, Shelf, Bin, Qty) AS
	(SELECT ProductID, LocationID, Shelf, Bin, Quantity
	 FROM [Production].[ProductInventory])
SELECT PID, LID, Shelf, Bin, Qty
FROM ProductQty;

-- Multiple reference to the same CTE
WITH ProductQty (PID, LID, Shelf, Bin, Qty) AS
	(SELECT ProductID, LocationID, Shelf, Bin, Quantity
	 FROM [Production].[ProductInventory])
SELECT p1.PID,
	   SUM(p1.Qty) AS ShelfQty_A,
	   SUM(p2.Qty) AS ShelfQty_B
FROM ProductQty AS p1
INNER JOIN ProductQty AS p2
	ON p1.PID = p2.PID
WHERE p1.Shelf = 'A' AND
	  p2.Shelf = 'B'
GROUP BY p1.PID;

-- Multiple CTEs per statement
WITH ProductQty AS
	(SELECT ProductID, LocationID, Shelf, Bin, Quantity
	 FROM [Production].[ProductInventory]),

	 ListPriceHistory AS
	 (SELECT ProductID, StartDate, EndDate, ListPrice
	  FROM [Production].[ProductListPriceHistory]
	  WHERE ListPrice > 10.00)

SELECT p.ProductID, SUM(Quantity) SumQuantity
FROM ProductQty AS p
INNER JOIN ListPriceHistory AS lp
	ON p.ProductID = lp.ProductID
GROUP BY p.ProductID;