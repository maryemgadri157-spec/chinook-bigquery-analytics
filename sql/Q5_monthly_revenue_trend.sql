-- Q5: Monthly revenue trend
SELECT 
  FORMAT_DATE('%Y-%m', DATE(InvoiceDate)) AS Month,
  ROUND(SUM(Total), 2) AS Revenue,
  COUNT(InvoiceId) AS NumInvoices
FROM `chinook.Invoice`
GROUP BY Month
ORDER BY Month;