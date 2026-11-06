-- Q2: Revenue by country
SELECT 
  BillingCountry AS Country,
  ROUND(SUM(Total), 2) AS Revenue,
  COUNT(DISTINCT CustomerId) AS NumCustomers,
  ROUND(SUM(Total) / COUNT(DISTINCT CustomerId), 2) AS AvgRevenuePerCustomer
FROM `chinook.Invoice`
GROUP BY BillingCountry
ORDER BY Revenue DESC
LIMIT 10;