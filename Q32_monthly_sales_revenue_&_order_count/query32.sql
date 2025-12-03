-- Calculate the monthly sales revenue and order count
select DATENAME(YEAR,OrderDate) as [Year],
	   DATENAME(MONTH,OrderDate) as Month_Name,
	   COUNT(SalesOrderID) as Nb_orders
from AdventureWorks2019.Sales.SalesOrderHeader
group by DATENAME(YEAR,OrderDate), DATENAME(MONTH,OrderDate)
order by DATENAME(YEAR,OrderDate), DATENAME(MONTH,OrderDate), Nb_orders DESC;
