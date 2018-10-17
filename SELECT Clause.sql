-- Demo SELECT Clause

-- Switch to AdventureWorks2012 database (DB)
USE AdventureWorks2012;

-- No data source access
-- It constructs a row, without accessing any DB
SELECT '1' AS [col01],
		'A' AS [col02];

-- Check available data source columns 
-- (if you are unsure what the table contains)
EXEC sp_help 'Production.TransactionHistory';

-- On data source
SELECT [TransactionID],
	   [ProductID],
	   [Quantity],
	   [ActualCost],
	   'Batch 1' AS [BatchID],
	   ([Quantity] * [ActualCost]) AS [TotalCost]
FROM [Production].[TransactionHistory];



-- Demo: Column Aliases
SELECT [Name] AS [DepartmentName], -- recommended approach
	   [Name] [DepartmentName],    -- not recommended
	   [GroupName] AS [GN]
FROM [HumanResources].[Department];



-- Demo: Regular vs Delimited Identifiers

-- Regular vs Delimited (in this case, both are allowed)
SELECT Name,
	   [Name]
FROM [HumanResources].[Department];

-- Create a temporary table
CREATE TABLE #Department
	([Department ID] INT NOT NULL);
GO

SELECT [Department ID]
FROM [#Department];