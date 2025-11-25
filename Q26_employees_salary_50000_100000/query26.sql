-- Which employees have a current salary between 50000 and 100000
-- First subquery makes sure we take the last salary into account
with LatestPay AS(
	
   SELECT
		eph.BusinessEntityID
	   ,eph.Rate
	   ,ROW_NUMBER() OVER(
					     PARTITION BY eph.BusinessEntityID
						 ORDER BY eph.RateChangeDate DESC) AS rn
   FROM HumanResources.EmployeePayHistory AS eph) 


SELECT 
      CONCAT(pp.FirstName, ' ', pp.LastName) AS EmployeeName
	  ,e.JobTitle AS Role
      ,lp.[Rate] AS Hourly_Rate
	  ,lp.Rate*40*52 AS EstimatedAnnualSalary     
FROM LatestPay AS lp
	 INNER JOIN Person.Person AS pp ON pp.BusinessEntityID = lp.BusinessEntityID
	 INNER JOIN HumanResources.Employee AS e ON e.BusinessEntityID = lp.BusinessEntityID
WHERE lp.Rate*40*52 BETWEEN 50000 AND 100000 AND rn = 1
ORDER BY EstimatedAnnualSalary DESC;
 
