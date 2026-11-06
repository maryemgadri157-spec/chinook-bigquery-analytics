-- Q4: Sales rep performance
SELECT 
  CONCAT(e.FirstName, ' ', e.LastName) AS SalesRep,
  e.Title,
  COUNT(DISTINCT c.CustomerId) AS CustomersManaged,
  ROUND(SUM(i.Total), 2) AS TotalRevenue
FROM `chinook.Employee` e
JOIN `chinook.Customer` c ON e.EmployeeId = c.SupportRepId
JOIN `chinook.Invoice` i ON c.CustomerId = i.CustomerId
GROUP BY e.EmployeeId, e.FirstName, e.LastName, e.Title
ORDER BY TotalRevenue DESC;