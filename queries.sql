-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT p.ProductName, c.CategoryName
FROM Product AS p
JOIN Category AS c
ON p.CategoryId = c.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.Id AS OrderId, s.CompanyName AS ShipperName
FROM "Order" AS o
JOIN Shipper AS s
ON o.ShipVia = s.id
WHERE o.OrderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT p.ProductName, od.quantity
FROM Product AS p
JOIN OrderDetail as od
ON p.Id = od.ProductId
WHERE od.OrderId = 10251
ORDER By ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order.
-- All columns should be labeled clearly. Displays 16,789 records.
SELECT o.Id AS order_id, c.CompanyName as customer_company_name, e.LastName AS employee_last_name
FROM "Order" AS o
JOIN Customer AS c ON o.CustomerId = c.Id
JOIN Employee AS e ON o.EmployeeId = e.Id

-- Displays CategoryName and a new column called Count
-- that shows how many products are in each category. Shows 8 records.
SELECT c.CategoryName, COUNT(CategoryId) as Count
FROM Product AS p
JOIN Category AS c
ON p.CategoryId = c.Id
GROUP BY CategoryId

-- Display OrderID and a column called ItemCount
-- that shows the total number of products placed on the order. Shows 196 records.

-- I'm not sure if they're looking for the Total number of items in the order
SELECT OrderId, SUM(Quantity) as ItemQuantityInOrder
FROM OrderDetail
GROUP BY OrderId

-- or the number of distinct products in the order
SELECT OrderId, COUNT(Quantity) as DistinctProducts
FROM OrderDetail
GROUP BY OrderId