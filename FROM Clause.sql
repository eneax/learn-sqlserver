-- Demo: FROM Clause

-- FROM Clause (table)
SELECT [Name]
FROM [HumanResources].[Department];
/*
- HumanResources is the schema name
- department is the table name
*/



-- Check which views are in the DB
SELECT SCHEMA_NAME(schema_id) AS [Schema], 
	   [name]
FROM sys.views;

-- FROM Clause (table)
SELECT [BusinessEntityID],
	   [Name]
FROM [Sales].[vStoreWithAddresses];




-- Table variable
DECLARE @Orders TABLE
	(OrderID int NOT NULL PRIMARY KEY,
	 OrderDT datetime NOT NULL);

-- insert one row into the table variable
INSERT @Orders
VALUES (1, GETDATE());

SELECT [OrderID],
		[OrderDT]
FROM @Orders;




-- Demo: Table Aliases

-- Table Aliases
SELECT [dept].[Name]
FROM [HumanResources].[Department] AS [dept];

-- Compact table alias example
SELECT [d].[Name]
FROM [HumanResources].[Department] AS [d];