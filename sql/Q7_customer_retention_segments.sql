-- Q7: Customer retention segmentation
WITH CustomerPurchaseCounts AS (
  SELECT 
    CustomerId,
    COUNT(InvoiceId) AS NumPurchases
  FROM `chinook.Invoice`
  GROUP BY CustomerId
)
SELECT 
  CASE 
    WHEN NumPurchases = 1 THEN '1 purchase (one-time)'
    WHEN NumPurchases BETWEEN 2 AND 4 THEN '2-4 purchases'
    WHEN NumPurchases BETWEEN 5 AND 7 THEN '5-7 purchases'
    ELSE '8+ purchases (loyal)'
  END AS CustomerSegment,
  COUNT(*) AS NumCustomers
FROM CustomerPurchaseCounts
GROUP BY CustomerSegment
ORDER BY NumCustomers DESC;