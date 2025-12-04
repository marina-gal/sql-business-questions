
-- Identify the top performing departments by average salary
with LastSalary as(
select
		eph.BusinessEntityID,
		eph.Rate,
		ROW_NUMBER()OVER(PARTITION BY eph.BusinessEntityID ORDER BY eph.RateChangeDate DESC) as Ranking_Salaries
from HumanResources.EmployeePayHistory as eph)
SELECT TOP 10
	   d.Name as Department_Name
      ,AVG(ls.Rate*40*4) as Avg_Monthly_salary
      
FROM LastSalary as ls
 left join HumanResources.EmployeeDepartmentHistory as edh on edh.BusinessEntityID = ls.BusinessEntityID
 left join HumanResources.Department as d on d.DepartmentID = edh.DepartmentID
WHERE ls.Ranking_Salaries = 1 AND edh.EndDate IS NULL
GROUP BY d.Name
ORDER BY Avg_Monthly_salary DESC;
