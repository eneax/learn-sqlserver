/*
CROSS APPLY Operator
- Executes a table value function (TVF) or sub-query for 
  each row returned by the outer (left) data source input
*/

-- Demo CROSS and Outer APPLY Operator
USE AdventureWorks2012;

/*
TVF that returns first name, last name, job title
and business entity type for the specified contact
*/
SELECT c.BusinessEntityType, c.FirstName, c.LastName, c.JobTitle, c.PersonID
FROM [dbo].[ufnGetContactInformation] (3) AS c;
-- allows me to access the person with PersonID = 3

-- Try to Inner Join with TVF (you will get an error)
SELECT c.BusinessEntityType, c.FirstName, c.LastName, c.JobTitle
FROM [Person].[Person] AS p
INNER JOIN [dbo].[ufnGetContactInformation] (p.BusinessEntityID) AS c
WHERE p.LastName LIKE 'Abo%';

-- Now try CROSS APPLY (doesn't return unmatched values)
SELECT c.BusinessEntityType, c.FirstName, c.LastName, c.JobTitle
FROM [Person].[Person] AS p
CROSS APPLY [dbo].[ufnGetContactInformation] (p.BusinessEntityID) AS c
WHERE p.LastName LIKE 'Ab%';	-- last name prefix

-- OUTER APPLY (returns unmatched values)
SELECT p.FirstName, p.LastName,
	   c.BusinessEntityType, c.FirstName, c.LastName, c.JobTitle
FROM [Person].[Person] AS p
OUTER APPLY [dbo].[ufnGetContactInformation] (p.BusinessEntityID) AS c
WHERE p.LastName LIKE 'Ab%';