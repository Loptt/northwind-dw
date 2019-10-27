
    SELECT DISTINCT Country
    from Lab0_NorthwindDB.dbo.Suppliers
UNION
    SELECT Country
    from Lab0_NorthwindDB.dbo.Employees
UNION
    SELECT DISTINCT ShipCountry
    from Lab0_NorthwindDB.dbo.Orders

SELECT c.CustomerID
FROM Lab0_NorthwindDB.dbo.Customers c

select p.productId, p.productName, p.categoryName
from DWNorthwind.dbo.DimProduct p

SELECT c.City, c.Country, c.CustomerID, c.CustomerName, c.Region
from DWNorthwind.dbo.DimCustomer c
