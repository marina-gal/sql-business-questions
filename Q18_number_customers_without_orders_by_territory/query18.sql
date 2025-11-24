-- How many customers have no orders? Group the result by territory.
SELECT st.Name AS Territory_Name,
	    COUNT(c.CustomerID) AS NumCustomersWithoutOrders
   
FROM [AdventureWorks2019].[Sales].[Customer] AS c
	LEFT JOIN Sales.SalesTerritory AS st ON
		st.TerritoryID = c.TerritoryID --Getting only the territories where the condition suceeds
	LEFT JOIN Sales.SalesOrderHeader AS soh ON
		c.CustomerID = soh.CustomerID
	AND soh.TerritoryID = c.TerritoryID
WHERE soh.SalesOrderID IS NULL
GROUP BY st.Name
ORDER BY NumCustomersWithoutOrders DESC;
