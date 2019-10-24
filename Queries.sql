
SELECT TOP 1
    P.ProductName
FROM dbo.[Order Details] OD, dbo.Orders O, dbo.Products P
WHERE P.ProductID = OD.ProductID AND O.OrderID = OD.OrderID AND YEAR(O.OrderDate) = 1996
GROUP BY P.ProductName
ORDER BY SUM(OD.Quantity) DESC;

SELECT SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount))
FROM dbo.[Order Details] OD, dbo.Orders O
WHERE OD.OrderID = O.OrderID AND YEAR(O.OrderDate) = 1996

SELECT SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount))
FROM dbo.[Order Details] OD, dbo.Orders O
WHERE OD.OrderID = O.OrderID AND YEAR(O.OrderDate) = 1997

SELECT SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount))
FROM dbo.[Order Details] OD