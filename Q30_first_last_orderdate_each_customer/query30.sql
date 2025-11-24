-- Find the first and last order date for each customer
SELECT 	   
	    sc.[CustomerID]
	   ,CONCAT(pp.FirstName, ' ', pp.LastName) AS Customer_Name
	   ,MIN(soh.OrderDate) AS First_Order
	   ,MAX(soh.OrderDate) AS Last_Order	   
           
FROM [AdventureWorks2019].[Sales].[SalesOrderHeader] AS soh
	LEFT JOIN Sales.Customer AS sc ON sc.CustomerID = soh.CustomerID
	LEFT JOIN Person.Person AS pp ON pp.BusinessEntityID = sc.PersonID	
GROUP BY sc.CustomerID, pp.FirstName, pp.LastName
ORDER BY Last_Order DESC;
