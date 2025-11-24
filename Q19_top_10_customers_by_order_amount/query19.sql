--Top 10 customers by order amount
SELECT	TOP 10
		soh.SalesOrderID,
	    soh.TotalDue,
		
		CONCAT(pp.firstName, pp.LastName) AS Full_Name_Client

FROM [AdventureWorks2019].[Sales].[SalesOrderHeader] AS soh
	LEFT JOIN Sales.Customer AS c ON c.CustomerID = soh.CustomerID
	LEFT JOIN Person.Person AS pp ON pp.BusinessEntityID = c.PersonID
ORDER BY soh.TotalDue DESC;
