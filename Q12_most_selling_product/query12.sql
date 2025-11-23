-- Which is the most selling product?
SELECT TOP 1
        sod.ProductID
	    ,p.Name
      ,SUM(sod.[LineTotal]) AS Total_Sales
	  
  FROM [AdventureWorks2019].[Sales].[SalesOrderDetail] AS sod
  LEFT JOIN Production.Product AS p ON p.ProductID = sod.ProductID
  GROUP BY p.Name, sod.ProductID
  ORDER BY Total_Sales DESC;
