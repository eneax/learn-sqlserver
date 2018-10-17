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