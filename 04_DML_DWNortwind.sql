--dimension Producto
Insert into DWNorthwind.dbo.DimProduct
SELECT p.productId, p.productName, c.categoryName
FROM Lab0_NorthwindDB.dbo.products p, Lab0_NorthwindDB.dbo.categories c
WHERE p.categoryID=c.categoryID;

--dimension Empleado
Insert into DWNorthwind.dbo.DimEmployee
SELECT e.EmployeeID, e.FirstName + ' ' + e.LastName as Name, e.City, e.Country, e.Region, e.HireDate
FROM Lab0_NorthwindDB.dbo.Employees e;

--Limpieza
UPDATE DWNorthwind.dbo.DimEmployee SET Region='Europe' WHERE Country IN ('UK', 'Finland','Italy','Germany','Switzerland','Sweden','Austria','Poland','Ireland','Norway','France','Belgium','Spain','Denmark','Portugal');
UPDATE DWNorthwind.dbo.DimEmployee SET Region='North America' WHERE Country IN ('USA','Canada');
UPDATE DWNorthwind.dbo.DimEmployee SET Region='South America' WHERE Country IN ('Mexico','Brazil','Argentina','Venezuela');
UPDATE DWNorthwind.dbo.DimEmployee SET Region='Unknown' WHERE Country IS NULL;

--dimension Tiempo
Insert into DWNorthwind.dbo.DimTime
SELECT o.OrderDate
FROM Lab0_NorthwindDB.dbo.Orders o;

--dimension Cliente
INSERT into DWNorthwind.dbo.DimCustomer
SELECT c.CustomerID, c.ContactName, c.City, c.Country , c.Region
FROM Lab0_NorthwindDB.dbo.Customers c;

--Limpieza
UPDATE DWNorthwind.dbo.DimCustomer SET Region='Europe' WHERE Country IN ('UK', 'Finland','Italy','Germany','Switzerland','Sweden','Austria','Poland','Ireland','Norway','France','Belgium','Spain','Denmark','Portugal');
UPDATE DWNorthwind.dbo.DimCustomer SET Region='North America' WHERE Country IN ('USA','Canada');
UPDATE DWNorthwind.dbo.DimCustomer SET Region='South America' WHERE Country IN ('Mexico','Brazil','Argentina','Venezuela');
UPDATE DWNorthwind.dbo.DimCustomer SET Region='Unknown' WHERE Country IS NULL;


-- Tabla de Hechos
Insert into DWNorthwind.dbo.FactSales
SELECT od.ProductID, o.EmployeeID, o.CustomerID, o.OrderDate ,
   o.orderID, od.quantity, od.unitPrice,
   od.discount,
   od.unitPrice * od.quantity * od.discount ,
   od.unitPrice * od.quantity - od.unitPrice * od.quantity * od.discount
FROM Lab0_NorthwindDB.dbo.Orders o, Lab0_NorthwindDB.dbo.[Order Details] od
WHERE o.OrderID = od.OrderID;

