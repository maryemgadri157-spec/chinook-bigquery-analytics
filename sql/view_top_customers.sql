-- View: Top customers (joined with Customer table for names)
CREATE OR REPLACE VIEW `chinook.v_top_customers` AS
SELECT
  c.CustomerId,
  CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
  c.Country,
  c.City,
  ROUND(SUM(i.Total), 2) AS TotalSpend,
  COUNT(i.InvoiceId) AS NumInvoices
FROM `chinook.Customer` AS c
JOIN `chinook.Invoice` AS i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName, c.Country, c.City;