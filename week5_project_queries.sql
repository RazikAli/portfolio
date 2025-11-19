SELECT * FROM inventory
WHERE Make = 'Ford';
SELECT * FROM employees
ORDER BY LastName;
SELECT * FROM employees
ORDER BY FirstName DESC;

SELECT DISTINCT Make FROM inventory; 
SELECT DISTINCT Position FROM employees; 

SELECT employees.FirstName, sales.SalesID, sales.CarID, sales.CustomerID 
FROM sales
INNER JOIN employees ON sales.EmployeeID = employees.EmployeeID;

INSERT INTO DealershipLocation (LocationID, LocationName, Adress, PhoneNumber)
VALUES
(3, 'Tyne Motors', '3 Waterloo St, Newcastle Upon Tyne', '01912689204'),
(4, 'North Auto', 'Heriot House, 12 Summerhill Terrace, Newcastle upon Tyne', '01911581753');

DELETE FROM Sales WHERE SalesID = 4;
INSERT INTO Sales (SalesID, CarID, CustomerID, EmployeeID, SaleDate, FinalPrice)
VALUES (4, 8, 5, 1, "2025-08-23", "£150000");

SELECT * FROM Inventory
ORDER BY Year DESC limit 7;

SELECT employees.FirstName, sales.SalesID, sales.CarID, sales.CustomerID 
FROM sales
INNER JOIN employees ON sales.EmployeeID = employees.EmployeeID;

SELECT Inventory.CarID as Inventory_CarIDs, Sales.CarID as Sold_CarIDs,
CASE WHEN Sales.CarID IS NULL THEN Inventory.CarID ELSE NULL END as Unsold_CarIDs
FROM Inventory LEFT JOIN Sales ON Inventory.CarID = Sales.CarID
ORDER BY Inventory.CarID;

