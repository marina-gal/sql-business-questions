
-- Employees hired on weekends
with cte as (
select  e.JobTitle,
	    e.[BusinessEntityID],
        DATENAME(weekday, HireDate) as Week_Day,
		CONCAT(pp.FirstName, ' ', pp.LastName) as EmployeeName
		
from [AdventureWorks2019].[HumanResources].[Employee] as e
	left join AdventureWorks2019.Person.Person as pp on pp.BusinessEntityID = e.BusinessEntityID) 

SELECT JobTitle,
	   EmployeeName,
	   Week_Day
FROM cte
WHERE Week_Day IN ('Saturday','Sunday');
