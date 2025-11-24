SELECT
    t.Name AS TerritoryName,
    AVG(soh.SubTotal) AS AvgSubTotal
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesTerritory AS t
    ON soh.TerritoryID = t.TerritoryID
GROUP BY t.Name
ORDER BY AvgSubTotal DESC;
