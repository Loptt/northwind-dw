
/* Northwind Data Warehouse ya debe estar creada */
create database DWNorthwind

go

use DWNorthwind

/* Creacion de una dimension. Agregue los campos que hagan falta de acuerdo a lo que indicamos en clase.*/
create table DimProduct
(
    ProductID int,
    ProductName varchar (40),
    categoryName varchar (15),
    primary key (ProductID)
)

/*FALATAN LAS OTRAS Dimensiones: Clientes, Empleados  */
create table DimCustomer
(

    CustomerID char(5),
    CustomerName varchar (40),
    City varchar (15),
    Country varchar (15),
    Region varchar (15),
    primary key (CustomerID)
);

create table DimEmployee
(

    EmployeeID int,
    Name varchar (30),
    City varchar (15),
    Country varchar (15),
    Region varchar (15),
    hiredate datetime,
    primary key (EmployeeID)
);
Create table DimTime
(

    orderDate Datetime,
    primary key (orderDate)
);



--tabla de Hechos FACT SALES puede ser necesario agregar-quitar columnas
-- OrderId  es necesario solo para efectos de la carga de los datos
create table FactSales
(
    ProductID int ,
    EmployeeID int ,
    CustomerID char(5) ,
    orderDate datetime ,
    OrderID int,
    Quantity smallint,
    unitPrice money,
    discountPercent real,
    discountAmount money,
    total money,
    primary key (ProductID, EmployeeID, CustomerID, orderDate),
    foreign key (ProductID)  references dbo.DimProduct(ProductID),
    foreign key (EmployeeID) references dbo.DimEmployee(EmployeeID),
    foreign key (CustomerID) references dbo.DimCustomer(CustomerID),
    foreign key (orderDate)  references dbo.DimTime(orderDate)
)
