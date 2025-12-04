-- Calculate the monthly sales revenue and order count
select YEAR(OrderDate) as [Year],
	   MONTH(OrderDate) as Month_Number,
	   DATENAME(MONTH, OrderDate) as Month_Name,
	   SUM(TotalDue) as TotalRevenue,
	   COUNT(SalesOrderID) as Nb_orders
from AdventureWorks2019.Sales.SalesOrderHeader
group by YEAR(OrderDate), MONTH(OrderDate), DATENAME(MONTH, OrderDate)
order by [Year], Month_Number;
