SELECT
      SalesOrderID
		 ,OrderDate
		 ,ShipDate
		 ,DATEDIFF(DAY,OrderDate,ShipDate) AS Duration_Days_Of_Orders

FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]
WHERE ShipDate IS NOT NULL
ORDER BY Duration_Days_Of_Orders
