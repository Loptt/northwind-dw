


USE DWNorthwind
GO

SELECT SUM(UnitPrice * Quantity * (1 - discountPercent)) AS [Total Sales 1996]
FROM dbo.FactSales
WHERE YEAR(OrderDate) = 1996


SELECT TOP 1
    E.Region, SUM(FS.UnitPrice * FS.Quantity * (1 - FS.discountPercent)) AS [Total Sales 1997]
FROM dbo.FactSales FS, dbo.DimEmployee E
WHERE YEAR(FS.OrderDate) = 1997 AND E.EmployeeID = FS.EmployeeID
GROUP BY E.Region
ORDER BY SUM(FS.UnitPrice * FS.Quantity * (1 - FS.discountPercent)) DESC;



SELECT SUM (Quantity) AS [Total Sales 1997]
FROM dbo.FactSales FS
GROUP BY FS.orderDate
HAVING YEAR (FS.orderDate) = 1997


SELECT SUM(FS.total) AS [Total Sales 1996]
FROM dbo.FactSales FS
WHERE YEAR(FS.OrderDate) = 1996


SELECT SUM(FS.Quantity) AS [Total Sales 1997]
FROM dbo.[FactSales] FS
WHERE YEAR(FS.OrderDate) = 1997;
