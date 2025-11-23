--Count how many customers placed more than 5 orders
SELECT COUNT(*) AS Number_Customer_more_5_orders
FROM (
SELECT 
       CustomerID
	  ,COUNT(SalesOrderID) AS Nb_Orders
FROM AdventureWorks2019.Sales.SalesOrderHeader
GROUP BY CustomerID
	HAVING COUNT(SalesOrderID) > 5) AS sub
