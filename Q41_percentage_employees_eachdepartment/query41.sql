-- Percentage of employees of each department
select  
d.Name as Department_Name,
CONCAT(ROUND(COUNT(*)*100.0 /(
select count(*) 
from HumanResources.EmployeeDepartmentHistory
where EndDate IS NULL),2), + ' %')as Percentage_dept
	
from HumanResources.EmployeeDepartmentHistory as edh
inner join HumanResources.Department as d on d.DepartmentID = edh.DepartmentID
where edh.EndDate IS NULL
group by d.Name
order by Percentage_dept DESC
