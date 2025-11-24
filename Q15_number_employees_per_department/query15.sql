-- Number of employees per department
SELECT 
       hd.DepartmentID
	    ,hd.Name AS DepartmentName
	    ,COUNT(DISTINCT edh.BusinessEntityID) AS Nb_Employees -- Using DISTINCT to count only once each employee
     
FROM [AdventureWorks2019].[HumanResources].[EmployeeDepartmentHistory] AS edh
	INNER JOIN HumanResources.Department AS hd --We take only the ones who suceed the WHERE condition
		ON hd.DepartmentID = edh.DepartmentID
WHERE edh.EndDate IS NULL
GROUP BY hd.DepartmentID, hd.Name
ORDER BY Nb_Employees DESC;
