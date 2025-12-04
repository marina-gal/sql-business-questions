
-- Calculate the product sales distribution (percent of total revenue)
-- first we calculate subquery of the Totalrevenue
with TotalRevenue as (
select 
      SUM(sod.[LineTotal]) as Total_revenue
from [Sales].[SalesOrderDetail] as sod)


-- Then, we CROSS JOIN the subquery to the main query, each of the values
SELECT
		p.ProductID,
		p.Name as ProductName,
		SUM(sod.LineTotal) as ProductRevenue,
		SUM(sod.LineTotal)*100.0/tr.Total_revenue as RevenuePercent

FROM Sales.SalesOrderDetail as sod 
	left join Production.Product as p on p.ProductID = sod.ProductID
	CROSS JOIN TotalRevenue as tr
GROUP BY p.ProductID, p.Name, tr.Total_revenue
ORDER BY RevenuePercent DESC;
