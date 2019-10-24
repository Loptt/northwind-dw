

--poblar tablas de modelo multidimensional (NorthWindDW) a partir de base de datos operacional (Northwind)*/

--dimension producto
Insert into DimProduct
   select p.productId, p.productName, c.categoryName
   from Northwind.dbo.products p, Northwind.dbo.categories c
   where p.categoryID=c.categoryID;


Insert into DIMemployee
   select e.EmployeeID, e.FirstName + ' ' + e.LastName as Name, e.City, e.Country, e.Region,e.HireDate
   from Northwind.dbo.Employees e;
   
   
--ejemplo de limpieza de datos, en Region y Country hay anomalias como valores nulos 
update DIMemployee set Region='Europe' where Country = 'UK';

--falta poblar customer.
--DimTime ya la poblamos 


--  tablas de hechos
Insert into FactSales
select od.ProductID, o.EmployeeID, o.CustomerID, o.OrderDate , 
o.orderID, od.quantity, od.unitPrice, 
od.discount, 
od.unitPrice * od.quantity * od.discount , 
od.unitPrice * od.quantity - od.unitPrice * od.quantity * od.discount   
from Northwind.dbo.Orders o, Northwind.dbo.[Order Details] od 
where o.OrderID = od.OrderID;

