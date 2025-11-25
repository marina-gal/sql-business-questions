-- Calculate the monthly sales revenue and order count
SELECT  
	   YEAR(OrderDate) AS Year
	  ,MONTH(OrderDate) AS MonthNumber
	  ,DATENAME(MONTH, OrderDate) AS Month_Name
	  ,COUNT([SalesOrderID]) AS Nb_orders
      ,SUM([TotalDue]) AS Total_revenue
      
FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]
GROUP BY YEAR(OrderDate), MONTH(OrderDate), DATENAME(MONTH, OrderDate)
ORDER BY Year, MonthNumber
