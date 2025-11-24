SELECT
        [SalesOrderID]
        ,[OrderDate]
        ,[ShipDate]
        ,[Status]
  
FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]
WHERE ShipDate IS NULL;

