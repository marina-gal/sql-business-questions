--Number of Orders in the year 2013
--Using the DATENAME to label in text the months

SELECT DATENAME(MONTH,OrderDate)AS OrderMonth,
	   COUNT(DISTINCT SalesOrderID) AS Nb_Orders
FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]
WHERE YEAR(OrderDate) =2013
GROUP BY DATENAME(MONTH,OrderDate),MONTH(OrderDate) --This MONTH helps to order correctly the months from Jan-Decem
ORDER BY MONTH(OrderDate);
