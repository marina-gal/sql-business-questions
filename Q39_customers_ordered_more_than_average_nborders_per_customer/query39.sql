-- Customers who ordered more than the average number of orders per customer
  with count_orders_per_customer as ( --first, n° of orders per customer
  select soh.CustomerID,
         count(*) as Nb_Orders       
  from [Sales].[SalesOrderHeader] as soh
  group by soh.CustomerID)


  SELECT copc.CustomerID,
         CONCAT(pp.FirstName, ' ', pp.LastName) as Full_Customer_Name,
         copc.Nb_Orders

  FROM count_orders_per_customer as copc
	inner join Sales.Customer as sc ON sc.CustomerID = copc.CustomerID
	inner join Person.Person as pp ON pp.BusinessEntityID = sc.PersonID

  WHERE copc.Nb_Orders > (select AVG(Nb_Orders) -- second, taking only those who are higher than the average of the first cte
                          from count_orders_per_customer)						  
 ORDER BY copc.Nb_Orders DESC;
