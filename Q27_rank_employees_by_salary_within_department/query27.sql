-- Rank employees by salary within the department
with LatestPay AS(
select
		eph.BusinessEntityID,
		eph.Rate,
		ROW_NUMBER()OVER(
						PARTITION BY eph.BusinessEntityID
						ORDER BY eph.RateChangeDate DESC) AS Rank_LastSalary
from HumanResources.EmployeePayHistory AS eph )-- This subquery ranks from the latest salary to the oldest by employee

SELECT
		CONCAT(p.FirstName, ' ', p.LastName) AS Employee_Name,
		d.Name AS Department_Name,
		lp.Rate AS Hourly_Rate,
		lp.Rate*40*52 AS EstimatedAnnualSalary,
		
		RANK() OVER (
					PARTITION BY d.DepartmentID -- defines groups where to apply ranking
					ORDER BY lp.Rate*40*52 DESC) AS Salary_Rank_In_Department

FROM LatestPay AS lp
	JOIN HumanResources.EmployeeDepartmentHistory AS edh ON edh.BusinessEntityID = lp.BusinessEntityID
	JOIN HumanResources.Department AS d ON d.DepartmentID = edh.DepartmentID
	JOIN Person.Person AS p ON p.BusinessEntityID = lp.BusinessEntityID
WHERE lp.Rank_LastSalary = 1 AND edh.EndDate IS NULL -- the current department 
ORDER BY d.Name, Salary_Rank_In_Department; -- First, orders by department all, then inside each department orders by ranking
