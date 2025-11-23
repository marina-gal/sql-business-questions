-- Getting the total revenue and number of orders per region

SELECT 
       st.Name AS Territory_Name
	   ,COUNT(soh.[SalesOrderID]) AS Number_Orders    
      ,SUM(soh.[TotalDue]) AS Total_revenue
 
FROM [AdventureWorks2019].[Sales].[SalesOrderHeader] AS soh
   INNER JOIN Sales.SalesTerritory AS st ON st.TerritoryID = soh.TerritoryID
GROUP BY st.Name
ORDER BY Total_revenue DESC;
