-- Q3: Best-selling genres by revenue
SELECT 
  g.Name AS Genre,
  COUNT(il.InvoiceLineId) AS TracksSold,
  ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS Revenue
FROM `chinook.Genre` g
JOIN `chinook.Track` t ON g.GenreId = t.GenreId
JOIN `chinook.InvoiceLine` il ON t.TrackId = il.TrackId
GROUP BY g.GenreId, g.Name
ORDER BY Revenue DESC
LIMIT 10;