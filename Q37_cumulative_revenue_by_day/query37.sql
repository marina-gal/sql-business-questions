-- Calculate the cumulative amount revenue by day
-- First, we calculate the daily revenue + group by OrderDate
with DailyRevenue as(
select 
      CAST (soh.OrderDate as date) as OrderDay,  
      SUM(sod.LineTotal) as DailyRevenue
     
from [AdventureWorks2019].[Sales].[SalesOrderHeader] as soh
inner join Sales.SalesOrderDetail as sod ON sod.SalesOrderID = soh.SalesOrderID
group by OrderDate)

--Then, the rows from the cummulative revenue + next daily revenue
SELECT
		OrderDay,
		DailyRevenue,
		SUM(DailyRevenue)OVER(ORDER BY OrderDay
							  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as Cumulative_revenue_per_day
FROM DailyRevenue
ORDER BY OrderDay;
