-- For each department, calculate the difference between the highest salary and lowest salary
WITH CurrentPay AS (
select
eph.BusinessEntityID,
eph.Rate,
ROW_NUMBER() OVER (
					PARTITION BY eph.BusinessEntityID
					ORDER BY eph.RateChangeDate DESC) as RN
from HumanResources.EmployeePayHistory as eph)

SELECT
	d.Name as Department_Name,
	MAX(cp.Rate*40*52) - MIN(cp.Rate*40*52) as Salary_Difference
	
FROM CurrentPay as cp
inner join HumanResources.EmployeeDepartmentHistory as edh ON edh.BusinessEntityID = cp.BusinessEntityID
inner join HumanResources.Department as d ON d.DepartmentID = edh.DepartmentID
WHERE edh.EndDate IS NULL AND cp.RN = 1
GROUP BY d.Name
ORDER BY Salary_Difference DESC
