-- Calculate the moving average of sales of the last 3 years
-- First CTA calculates the total sales per year
WITH SalesByYear AS (
SELECT 
       YEAR([OrderDate]) AS Sales_Year
      ,SUM([TotalDue]) AS Total_Revenue
FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]
GROUP BY YEAR(OrderDate)
)

SELECT
		Sales_Year
	   ,Total_Revenue
	   ,AVG(Total_Revenue) OVER (
	    ORDER BY Sales_Year ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS MovingAvg_3Years --window function with current row+2 before
FROM SalesByYear
ORDER BY Sales_Year
