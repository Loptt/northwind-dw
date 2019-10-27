SELECT TOP 1
    P.ProductName
FROM dbo.[Order Details] OD, dbo.Orders O, dbo.Products P
WHERE P.ProductID = OD.ProductID AND O.OrderID = OD.OrderID AND YEAR(O.OrderDate) = 1996
GROUP BY P.ProductName
ORDER BY SUM(OD.Quantity) DESC;

SELECT SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS TotalSales1996
FROM dbo.[Order Details] OD, dbo.Orders O
WHERE OD.OrderID = O.OrderID AND YEAR(O.OrderDate) = 1996

SELECT SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS TotalSales1997
FROM dbo.[Order Details] OD, dbo.Orders O
WHERE OD.OrderID = O.OrderID AND YEAR(O.OrderDate) = 1997

SELECT SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS TotalSales
FROM dbo.[Order Details] OD

SELECT TOP 1
    E.Region, SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS TotalSales1997
FROM dbo.Orders O, dbo.[Order Details] OD, dbo.Employees E
WHERE O.OrderID = OD.OrderID AND O.EmployeeID = E.EmployeeID AND YEAR(O.OrderDate) = 1997 AND O.ShipRegion IS NOT NULL
GROUP BY E.Region
ORDER BY SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) DESC;

SELECT TOP 1
    e.Country
FROM dbo.Orders O, dbo.[Order Details] OD, dbo.Employees e
WHERE O.OrderID = OD.OrderID AND e.EmployeeID = O.EmployeeID AND e.Region = 
(SELECT TOP 1
        E.Region
    FROM dbo.Orders O, dbo.[Order Details] OD, dbo.Employees E
    WHERE O.OrderID = OD.OrderID AND O.EmployeeID = E.EmployeeID AND YEAR(O.OrderDate) = 1997 AND O.ShipRegion IS NOT NULL
    GROUP BY E.Region
    ORDER BY SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) DESC
)
GROUP BY e.Country
ORDER BY SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) DESC;