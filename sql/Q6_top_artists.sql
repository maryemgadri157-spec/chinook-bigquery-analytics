-- Q6: Top 10 artists by revenue
SELECT 
  ar.Name AS Artist,
  ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS Revenue
FROM `chinook.Artist` ar
JOIN `chinook.Album` al ON ar.ArtistId = al.ArtistId
JOIN `chinook.Track` t ON al.AlbumId = t.AlbumId
JOIN `chinook.InvoiceLine` il ON t.TrackId = il.TrackId
GROUP BY ar.ArtistId, ar.Name
ORDER BY Revenue DESC
LIMIT 10;