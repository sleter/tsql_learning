/*zad1*/
SELECT * FROM dbo.Products
WHERE ProductName like 'T%'
/*zad2*/
SELECT OrderID,UnitPrice*Quantity-(1-Discount),ProductID AS total FROM [Order Details]
ORDER BY OrderID ASC
/*zad3*/
SELECT OrderID,SUM(UnitPrice*Quantity-(1-Discount)) AS TotalPrice FROM [Order Details]
GROUP BY OrderID
/*zad4?*/
SELECT OrderID,COUNT(DISTINCT ProductID) AS [Count],SUM(UnitPrice*Quantity-(1-Discount)) AS TotalPrice FROM [Order Details]
GROUP BY OrderID
ORDER BY OrderID ASC
/*zad5*/
SELECT OrderID,COUNT(DISTINCT ProductID) AS [Count],ROUND(SUM(UnitPrice*Quantity-(1-Discount)), 3) AS TotalPrice FROM [Order Details]
GROUP BY OrderID
ORDER BY OrderID ASC
/*zad6*/
SELECT SUM(UnitsInStock*UnitPrice) AS Value, SUM(UnitsInStock) AS ProductNumber FROM Products
/*zad7*/
SELECT ProductName FROM Products
WHERE UnitsInStock = 0 AND Discontinued = 0
/*zad8*/
SELECT CompanyName,ProductName,AVG(UnitPrice) AS AvreagePrice FROM Suppliers,Products
WHERE Suppliers.SupplierID = Products.SupplierID
GROUP BY CompanyName,ProductName
ORDER BY AvreagePrice ASC
/*zad9*/
SELECT CategoryID,AVG(UnitPrice) AS AvgPrice, COUNT(*)  FROM Products
GROUP BY CategoryID
HAVING COUNT(*)<10
/*zad10*/
SELECT SupplierID,ROUND(AVG(UnitPrice), 2) AS [Avg],ROUND(MIN(UnitPrice), 2) AS [Min],ROUND(MAX(UnitPrice), 2) AS [Max], COUNT(*) AS Ilosc FROM Products
GROUP BY SupplierID
/*zad11*/
SELECT 'POL'+CompanyName FROM Customers
WHERE Country = 'Poland'
UNION 
SELECT CompanyName FROM Customers
WHERE Country != 'Poland'
/*zad12*/
SELECT * FROM Products
WHERE UnitPrice is (
SELECT MIN(UnitPrice) AS
)
