-- Tell me which customers made consecutive purchases (2days)
with CustomersDays as( --First, we group per Customer and as per Day of purchase (even if the same same day had 3 purchase, it counts as 1 day)
select 
       soh.[CustomerID],
	   CAST(soh.OrderDate AS date) AS OrderDay 
from [AdventureWorks2019].[Sales].[SalesOrderHeader] as soh
group by soh.CustomerID, CAST(OrderDate AS date)),

Lagged as( -- Second, to each Day of purchase we bring the previous day, ordered by date
select 		
		CustomerID,
		OrderDay,
		LAG(OrderDay)OVER(
							PARTITION BY CustomerID ORDER BY OrderDay) as PrevOrderDay
from CustomersDays)

-- Main query we get the customers where the difference of days is 1 and we consider only those days who are not null(first day)
SELECT 
        distinct l.CustomerID,
		CONCAT(pp.FirstName, ' ', pp.LastName) as Customer_Name,
		PrevOrderDay,
		OrderDay

FROM Lagged as l
	left join Sales.Customer as c on c.CustomerID = l.CustomerID
	left join Person.Person as pp on pp.BusinessEntityID = c.PersonID
WHERE PrevOrderDay IS NOT NULL AND DATEDIFF(day, PrevOrderDay, OrderDay) = 1;

