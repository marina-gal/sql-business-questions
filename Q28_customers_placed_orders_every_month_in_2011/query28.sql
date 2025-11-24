-- Which customers placed orders every month in 2011 ?
SELECT 
     [CustomerID]
     
FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]
WHERE YEAR(OrderDate) = 2011
GROUP BY CustomerID  -- a row per customer
	HAVING COUNT(
			DISTINCT MONTH(OrderDate))= 12 --for each customer we COUNT the different months have in 2011

