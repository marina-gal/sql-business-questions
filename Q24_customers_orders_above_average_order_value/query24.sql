
-- Find the customers which orders are above average order value
select   soh.CustomerID,
		soh.TotalDue,
		concat(pp.FirstName, ' ', pp.LastName) as Customer_Name
from [AdventureWorks2019].[Sales].[SalesOrderHeader] as soh
	left join AdventureWorks2019.Sales.Customer as sc on sc.CustomerID = soh.CustomerID
	left join AdventureWorks2019.Person.Person as pp on pp.BusinessEntityID = sc.PersonID
	
where TotalDue > ( select
				         AVG(TotalDue)
				         from [AdventureWorks2019].[Sales].[SalesOrderHeader])
order by TotalDue DESC;
