-- Rank employees by salary within the department
WITH LatestPay AS (
    SELECT 
        eph.BusinessEntityID,
        eph.Rate,
        ROW_NUMBER() OVER (
            PARTITION BY eph.BusinessEntityID
            ORDER BY eph.RateChangeDate DESC
        ) AS rn
    FROM HumanResources.EmployeePayHistory AS eph
)
SELECT 
    d.Name AS Department_Name,
    CONCAT(p.FirstName, ' ', p.LastName) AS Employee_Name,
    lp.Rate AS Hourly_Rate,
    lp.Rate * 40 * 52 AS EstimatedAnnualSalary,
    RANK() OVER (
        PARTITION BY d.DepartmentID
        ORDER BY lp.Rate * 40 * 52 DESC
    ) AS SalaryRank_In_Department
FROM LatestPay AS lp
JOIN HumanResources.EmployeeDepartmentHistory AS edh
    ON edh.BusinessEntityID = lp.BusinessEntityID
JOIN HumanResources.Department AS d
    ON d.DepartmentID = edh.DepartmentID
JOIN Person.Person AS p
    ON p.BusinessEntityID = lp.BusinessEntityID
WHERE lp.rn = 1              -- solo el salario más reciente de cada empleado
  AND edh.EndDate IS NULL     -- solo su departamento actual
ORDER BY d.Name, SalaryRank_In_Department;
