SELECT TOP 3
       pc.Name AS Category_Name
      ,SUM(sod.[LineTotal]) AS Total_Sales_per_category

FROM [AdventureWorks2019].[Sales].[SalesOrderDetail] AS sod
	INNER JOIN Production.Product AS p ON p.ProductID = sod.ProductID
	INNER JOIN Sales.SalesOrderHeader AS soh ON sod.SalesOrderID = soh.SalesOrderID
	INNER JOIN Production.ProductSubcategory AS psc ON psc.ProductSubcategoryID = p.ProductSubcategoryID
	INNER JOIN Production.ProductCategory AS pc ON pc.ProductCategoryID = psc.ProductCategoryID
WHERE YEAR(soh.OrderDate)=2013
GROUP BY pc.Name
ORDER BY Total_Sales_per_category DESC;
