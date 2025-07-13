-- 1. List of all customers
SELECT * FROM Customers;

-- 2. List of all customers where company name ending in 'N'
SELECT * FROM Customers WHERE CompanyName LIKE '%N';

-- 3. List of all customers who live in Berlin or London
SELECT * FROM Customers WHERE City IN ('Berlin', 'London');

-- 4. List of all customers who live in UK or USA
SELECT * FROM Customers WHERE Country IN ('UK', 'USA');

-- 5. List of all products sorted by product name
SELECT * FROM Products ORDER BY ProductName;

-- 6. List of all products where product name starts with an A
SELECT * FROM Products WHERE ProductName LIKE 'A%';

-- 7. List of customers who ever placed an order
SELECT DISTINCT Customers.* FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- 8. List of Customers who live in London and have bought Chai
SELECT DISTINCT c.* FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE c.City = 'London' AND p.ProductName = 'Chai';

-- 9. List of customers who never placed an order
SELECT * FROM Customers
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Orders);

-- 10. List of customers who ordered Tofu
SELECT DISTINCT c.* FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Tofu';

-- 11. Details of first order of the system
SELECT TOP 1 * FROM Orders ORDER BY OrderDate;

-- 12. Details of most expensive order date
SELECT TOP 1 o.OrderID, o.OrderDate, SUM(od.UnitPrice * od.Quantity) AS TotalAmount
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.OrderID, o.OrderDate
ORDER BY TotalAmount DESC;

-- 13. For each order get the OrderID and average quantity of items in that order
SELECT OrderID, AVG(Quantity) AS AverageQuantity
FROM [Order Details]
GROUP BY OrderID;

-- 14. For each order get the OrderID, minimum quantity and maximum quantity for that order
SELECT OrderID, MIN(Quantity) AS MinQty, MAX(Quantity) AS MaxQty
FROM [Order Details]
GROUP BY OrderID;

-- 15. Get a list of all managers and total number of employees who report to them
SELECT e2.FirstName + ' ' + e2.LastName AS ManagerName, COUNT(*) AS TotalReports
FROM Employees e1
JOIN Employees e2 ON e1.ReportsTo = e2.EmployeeID
GROUP BY e2.FirstName, e2.LastName;

-- 16. OrderID and total quantity for each order that has a total quantity of greater than 300
SELECT OrderID, SUM(Quantity) AS TotalQty
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(Quantity) > 300;

-- 17. List of all orders placed on or after 1996/12/31
SELECT * FROM Orders WHERE OrderDate >= '1996-12-31';

-- 18. List of all orders shipped to Canada
SELECT * FROM Orders WHERE ShipCountry = 'Canada';

-- 19. List of all orders with order total > 200
SELECT o.OrderID, SUM(od.Quantity * od.UnitPrice) AS Total
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.OrderID
HAVING SUM(od.Quantity * od.UnitPrice) > 200;

-- 20. List of countries and sales made in each country
SELECT ShipCountry, SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY ShipCountry;

-- 21. List of Customer ContactName and number of orders they placed
SELECT c.ContactName, COUNT(o.OrderID) AS OrderCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.ContactName;

-- 22. List of customer contact names who have placed more than 3 orders
SELECT c.ContactName, COUNT(o.OrderID) AS OrderCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.ContactName
HAVING COUNT(o.OrderID) > 3;

-- 23. Discontinued products ordered between 1/1/1997 and 1/1/1998
SELECT DISTINCT p.ProductName
FROM Products p
JOIN [Order Details] od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
WHERE p.Discontinued = 1 AND o.OrderDate BETWEEN '1997-01-01' AND '1998-01-01';

-- 24. List of employee firstname, lastname, supervisor firstname, lastname
SELECT e1.FirstName, e1.LastName, e2.FirstName AS ManagerFirst, e2.LastName AS ManagerLast
FROM Employees e1
LEFT JOIN Employees e2 ON e1.ReportsTo = e2.EmployeeID;

-- 25. List of Employee ID and total sale conducted by employee
SELECT o.EmployeeID, SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.EmployeeID;

-- 26. Employees whose FirstName contains character 'a'
SELECT * FROM Employees WHERE FirstName LIKE '%a%';

-- 27. Managers who have more than four people reporting to them
SELECT ReportsTo, COUNT(*) AS ReportCount
FROM Employees
GROUP BY ReportsTo
HAVING COUNT(*) > 4;

-- 28. List of Orders and ProductNames
SELECT o.OrderID, p.ProductName
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID;

-- 29. List of orders placed by the best customer
SELECT TOP 1 o.CustomerID, COUNT(*) AS OrderCount
FROM Orders o
GROUP BY o.CustomerID
ORDER BY COUNT(*) DESC;

-- 30. List of orders placed by customers who do not have a Fax number
SELECT o.*
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.Fax IS NULL;

-- 31. Postal codes where the product Tofu was shipped
SELECT DISTINCT o.ShipPostalCode
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Tofu';

-- 32. Product names that were shipped to France
SELECT DISTINCT p.ProductName
FROM Products p
JOIN [Order Details] od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.ShipCountry = 'France';

-- 33. Product names and categories for the supplier 'Specialty Biscuits, Ltd.'
SELECT p.ProductName, c.CategoryName
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE s.CompanyName = 'Specialty Biscuits, Ltd.';

-- 34. Products that were never ordered
SELECT * FROM Products
WHERE ProductID NOT IN (SELECT DISTINCT ProductID FROM [Order Details]);

-- 35. Products where units in stock < 10 and units on order = 0
SELECT * FROM Products
WHERE UnitsInStock < 10 AND UnitsOnOrder = 0;

-- 36. Top 10 countries by sales
SELECT TOP 10 o.ShipCountry, SUM(od.UnitPrice * od.Quantity) AS Sales
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.ShipCountry
ORDER BY Sales DESC;

-- 37. Number of orders each employee has taken for customers with IDs between A and AO
SELECT EmployeeID, COUNT(*) AS OrderCount
FROM Orders
WHERE CustomerID BETWEEN 'A' AND 'AO'
GROUP BY EmployeeID;

-- 38. Order date of most expensive order
SELECT TOP 1 o.OrderDate, SUM(od.Quantity * od.UnitPrice) AS TotalAmount
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.OrderID, o.OrderDate
ORDER BY TotalAmount DESC;

-- 39. Product name and total revenue from that product
SELECT p.ProductName, SUM(od.Quantity * od.UnitPrice) AS Revenue
FROM Products p
JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductName;

-- 40. SupplierID and number of products offered
SELECT SupplierID, COUNT(*) AS ProductCount
FROM Products
GROUP BY SupplierID;

-- 41. Top 10 customers based on their business
SELECT TOP 10 o.CustomerID, SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.CustomerID
ORDER BY TotalSales DESC;

-- 42. Total revenue of the company
SELECT SUM(Quantity * UnitPrice) AS TotalRevenue FROM [Order Details];
