-- Q1: Top 10 customers by total spend
SELECT 
  CONCAT(c.FirstName, ' ', c.LastName) AS Customer,
  c.Country,
  ROUND(SUM(i.Total), 2) AS TotalSpend,
  COUNT(i.InvoiceId) AS NumInvoices
FROM `chinook.Customer` c
JOIN `chinook.Invoice` i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName, c.Country
ORDER BY TotalSpend DESC
LIMIT 10;