
--Create Database
Create Database Customer;

--Create Customer Table
create table Customer
(
	FirstName varchar(50),
	LastName varchar(50),
	Age int
);

--Insert Initial Data
insert into Customer (FirstName,LastName,[Age]) values ('Joey','Blue',40);
insert into Customer (FirstName,LastName,[Age]) values ('Barry','Bonds',50);
insert into Customer (FirstName,LastName,[Age]) values ('Mike','Schmidt',60);
insert into Customer (FirstName,LastName,[Age]) values ('Mike','Schmidt1',61);
insert into Customer (FirstName,LastName,[Age]) values ('Mike','Schmidt2',62);
insert into Customer (FirstName,LastName,[Age]) values ('Mike','Schmidt3',63);
insert into Customer (FirstName,LastName,[Age]) values ('Mike','Schmidt4',64);
insert into Customer (FirstName,LastName,[Age]) values ('Mike','Schmidt5',65);

--This deletes mike schmidt
/*
DELETE Customer
where FirstName='Mike'
and LastName Like 'Schmidt_';
*/

--Select Mike Schmidt
select *
from Customer
where FirstName='Mike'
and LastName Like 'Schmidt_';

--Update City on Barry Bonds
update Customer
Set City='Goddard'
where FirstName='Barry'
and LastName = 'Bonds' ;

--Add City to the Customer Table
alter table customer
add City varchar(50);

--Drop the Customer Table
drop table customer;

--Create Customer Table with Primary Key
create table Customer
(
	Id int Primary Key identity(1,1),
	FirstName varchar(50),
	LastName varchar(50),
	Age int,
	City varchar(50)
)

--Insert Customer Data
insert into Customer 
(FirstName,LastName,[Age],City) values ('Joey','Blue',40, 'Goddard');
insert into Customer 
(FirstName,LastName,[Age],City) values ('Barry','Bonds',50, 'San Francisco');
insert into Customer 
(FirstName,LastName,[Age],City) values ('Mike','Schmidt',60, 'KC');

--Create Products Table
create table Products
(
	id int primary key identity(1,1),
	ProductName varchar(50)
)

--Add Price to Products Table
alter table Products
add Price float;

--Select everything from Products table
select * from Products

--Insert Products
insert into Products (ProductName, Price) values ('Baseball', 5.95);
insert into Products (ProductName, Price) values ('Bat', 195.99);

--Create Orders Table
Create table Orders
(
	OrderId int primary key identity(1,1),
	OrderDate Datetime,
	CustomerID int,
	ProductID int
)

--Insert Orders
insert into Orders (OrderDate,CustomerID,ProductID) values (GetDate(),1,1);
insert into Orders (OrderDate,CustomerID,ProductID) values (GetDate(),1,1);
insert into Orders (OrderDate,CustomerID,ProductID) values (GetDate(),2,1);
insert into Orders (OrderDate,CustomerID,ProductID) values (GetDate(),2,1);
insert into Orders (OrderDate,CustomerID,ProductID) values (GetDate(),2,2);
insert into Orders (OrderDate,CustomerID,ProductID) values (GetDate(),2,2);
insert into Orders (OrderDate,CustomerID,ProductID) values (GetDate(),2,2);
insert into Orders (OrderDate,CustomerID,ProductID) values (GetDate(),2,2);
insert into Orders (OrderDate,CustomerID,ProductID) values (GetDate(),3,2);
insert into Orders (OrderDate,CustomerID,ProductID) values (GetDate(),3,2);
insert into Orders (OrderDate,CustomerID,ProductID) values (GetDate(),4,2); --Bad Record

--Select from Tables
select * from Orders;
select * from Products;
select * from Customer;

--Delete Bad Order  **Your OrderId may be different
delete Orders
where OrderId=21;

--Add Foreign Keys to the Orders table
alter table orders
add foreign key (CustomerId) references Customer(Id);

alter table orders
add foreign key (ProductId) references Products(Id);

--Inner join customers/orders/products table
select o.OrderDate, p.ProductName, p.Price, c.*
from Orders o 
inner join Products p on o.ProductID=p.id
inner join Customer c on o.CustomerID=c.Id

--Find the Total and Average Price per City
select c.City,sum(p.Price),AVG(p.price) Total
from Orders o 
inner join Products p on o.ProductID=p.id
inner join Customer c on o.CustomerID=c.Id
group by c.City



/* Check and drop tables if exits*/
IF OBJECT_ID('InventoryTable', 'U') IS NOT NULL 
    DROP TABLE InventoryTable;
IF OBJECT_ID('StoreTable', 'U') IS NOT NULL 
    DROP TABLE StoreTable;

/* Create a table named as InventoryTable */
CREATE TABLE InventoryTable (
    SaleDate DATE,
	StoreCode INT NOT NULL,
	ProductCode VARCHAR(50),
	SalesQuantity INT,
	SalesRevenue DECIMAL(8,4),
	ShipmentQuantity INT,
	StoreStock INT,
	IncomingStock INT
);

/* Insert values in the corresponding table */
INSERT INTO InventoryTable (
	SaleDate,StoreCode,ProductCode,SalesQuantity,SalesRevenue,
	ShipmentQuantity,StoreStock,IncomingStock
	)
VALUES ('2014-01-01',514,'001771582730/32',1,92.5833,0,0,0),
       ('2014-01-16',514,'001771582730/32',0,0.,0,1,0),
       ('2014-03-04',514,'001771582730/32',0,0.,0,0,0),
       ('2014-01-01',514,'002021478136/32',1,83.3240,0,2,0),
       ('2014-01-06',514,'002021478136/32',0,0.,2,4,0),
       ('2014-01-09',514,'002021478136/32',1,111.1018,0,3,0),
       ('2014-02-04',514,'002021478136/32',0,0.,3,6,0),
       ('2014-02-16',514,'002021478136/32',1,111.1018,0,5,0),
       ('2014-02-24',514,'002021478136/32',1,111.1018,0,4,0),
       ('2014-03-04',514,'002021478136/32',1,111.1018,0,3,0);

/* Create a table named as StoreTable */
CREATE TABLE StoreTable (
	StoreCode INT NOT NULL,
	StoreDescription VARCHAR(50), 
	IsBlocked INT,
	StoreDetailedCode VARCHAR(50),
	SalesChannelType VARCHAR(50),
	Location INT,
	BuildingType VARCHAR(50)
);

/* Insert values in the corresponding table */
INSERT INTO StoreTable (
	StoreCode,StoreDescription,IsBlocked,StoreDetailedCode,
	SalesChannelType,Location,BuildingType
	)
VALUES (510,'MASLAK',1,'NULL','Store',20,'SOKAK'),
       (511,'IST AVP METROSU',0,'NULL','Store',16,'AVM'),
       (512,'IST AVR YENIBOSNA',0, 'NULL','Store',3,'SOKAK'),
       (513,'SUADIYE',1,'NULL','Store',69,'SOKAK'),
       (514,'IST AVR BEYOGLU',0,'NULL','Store',8,'SOKAK'),
       (515,'BEYOGLU TUNELI',1, 'NULL','Store',8,'SOKAK'),
       (516,'IST AVR ISTINYE',0,'NULL','Store',18,'AVM'),
       (517,'IST AVR UMRANIYE',0,'NULL','Store',74,'AVM'),
       (518,'AIRPORT',1,'NULL','Store',3,'AVM'),
       (519,'IST AVR CAPITOL',0,'NULL','Store',4,'AVM');

/* Write tables */
SELECT * FROM InventoryTable;
SELECT * FROM StoreTable;

/*---------------------------------------------------------------------------------*/
/* a. Find the latest Store Stock and bring StoreDescription,Location,Product_code */
/*---------------------------------------------------------------------------------*/

SELECT tb2.StoreDescription, tb2.Location, tb1.ProductCode
FROM InventoryTable tb1
INNER JOIN StoreTable tb2 ON tb1.StoreCode=tb2.StoreCode
INNER JOIN (SELECT MAX(SaleDate) AS LatestDate FROM InventoryTable) tblast 
            ON tb1.SaleDate = tblast.LatestDate;

/*---------------------------------------------------------------------------------*/
/* b. Sum sales by BuildingType                                                    */
/*---------------------------------------------------------------------------------*/

SELECT tb2.BuildingType, SUM(tb1.SalesQuantity) AS SumSales
FROM InventoryTable tb1
INNER JOIN StoreTable tb2 ON tb1.StoreCode=tb2.StoreCode
GROUP BY BuildingType;

/*---------------------------------------------------------------------------------*/
/* c. List stores description which have sales revenue lower than 50TL in 2014 May */
/*---------------------------------------------------------------------------------*/

SELECT tb2.StoreDescription
FROM InventoryTable tb1
INNER JOIN StoreTable tb2 ON tb1.StoreCode=tb2.StoreCode
WHERE (SaleDate BETWEEN '2014-05-01' AND '2014-05-31') AND (tb1.SalesRevenue<=50);

/*---------------------------------------------------------------------------------*/
/* d. In February 2014, what is the difference between the highest-selling store   */
/*    and the leastselling store depending on sales revenue?                       */
/*---------------------------------------------------------------------------------*/

SELECT MAX(tb1.SalesRevenue)-MIN(tb1.SalesRevenue) AS DiffRevenue
FROM InventoryTable tb1
INNER JOIN StoreTable tb2 ON tb1.StoreCode=tb2.StoreCode
WHERE (SaleDate BETWEEN '2014-02-01' AND '2014-02-28')
GROUP BY tb2.StoreCode;
