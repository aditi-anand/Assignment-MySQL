
CREATE TABLE SalesPeople (
  Snum INTEGER PRIMARY KEY,
  Sname varchar(255),
  City TEXT,
  Comm DOUBLE,
  UNIQUE (Sname)
);

INSERT INTO SalesPeople VALUES (1001, 'Peel', 'London', 0.12);
INSERT INTO SalesPeople VALUES (1002, 'Serres', 'Sanjose', 0.13);
INSERT INTO SalesPeople VALUES (1004,  'Motika', 'London', 0.11);
INSERT INTO SalesPeople VALUES (1007, 'Rifkin', 'Barcelona',0.15);
INSERT INTO SalesPeople VALUES (1003, 'Axelrod', 'Newyork', 0.10);





CREATE TABLE Customers (
  Cnum INTEGER PRIMARY KEY,
  Cname varchar(255),
  City TEXT NOT NULL,
  Snum INTEGER,
 FOREIGN KEY(Snum) references SalesPeople(Snum)
);

INSERT INTO Customers VALUES (2001, 'Hoffman' , 'London', 1001);
INSERT INTO Customers VALUES (2002, 'Giovanni', 'Rome' , 1003);
INSERT INTO Customers VALUES (2003, 'Liu', 'Sanjose' , 1002);
INSERT INTO Customers VALUES (2004, 'Grass', 'Berlin' , 1002);
INSERT INTO Customers VALUES (2006, 'Clemens' , 'London' , 1001);
INSERT INTO Customers VALUES (2008, 'Cisneros' , 'Sanjose' , 1007);
INSERT INTO Customers VALUES (2007, 'Pereira', 'Rome', 1004);



CREATE TABLE Orders (
  Onum INTEGER PRIMARY KEY,
  Amt DOUBLE,
  Odate DATE,
  Cnum INTEGER,
  Snum INTEGER,
 FOREIGN KEY(Snum) references SalesPeople(Snum),
 FOREIGN KEY(Cnum) references Customers(Cnum)
);


INSERT INTO Orders VALUES (3001, 18.69, '1990-10-3', 2008, 1007);
INSERT INTO Orders VALUES (3003, 767.19, '1990-10-3', 2001, 1001);
INSERT INTO Orders VALUES (3002, 1900.10, '1990-10-3', 2007, 1004);
INSERT INTO Orders VALUES (3005,  5160.45, '1990-10-3', 2003, 1002);
INSERT INTO Orders VALUES (3006,  1098.16, '1990-10-3', 2008, 1007);
INSERT INTO Orders VALUES (3009, 1713.23, '1990-10-4', 2002, 1003);
INSERT INTO Orders VALUES (3007,  75.75, '1990-10-4', 2004, 1002);
INSERT INTO Orders VALUES (3008,  4273.00, '1990-10-5', 2006, 1001);
INSERT INTO Orders VALUES (3010,  1309.95, '1990-10-6', 2004, 1002);
INSERT INTO Orders VALUES (3011,  9891.88, '1990-10-6', 2006, 1001);


SELECT * FROM SalesPeople;
/*  Table SalesPeople
Snum Sname City Comm

1001 Peel. London .12

1002  Serres Sanjose .13

1004 Motika London .11

1007 Rifkin Barcelona .15

1003 Axelrod Newyork .10
*/
SELECT * FROM Customers;
/* Table Customers
Cnum Cname City Snum

2001  Hoffman London 1001

2002  Giovanni Rome 1003

2003  Liu Sanjose 1002

2004  Grass Berlin 1002

2006 Clemens London 1001

2008 Cisneros Sanjose 1007

2007 Pereira Rome 1004

*/
SELECT * FROM Orders;
/* Table Orders
Onum Amt Odate Cnum Snum

3001 18.69 3-10-1990 2008 1007

3003 767.19 3-10-1990 2001 1001

3002 1900.10 3-10-1990 2007 1004

3005  5160.45 3-10-1990 2003 1002

3006  1098.16 3-10-1990 2008 1007

3009 1713.23 4-10-1990 2002 1003

3007  75.75 4-10-1990 2004 1002

3008  4273.00 5-10-1990 2006 1001

3010  1309.95 6-10-1990 2004 1002

3011  9891.88 6-10-1990 2006 1001



*/

/*1) Count the number of Salesperson whose name begin with ‘a’/’A’.*/
Select count(*) FROM SalesPeople WHERE Sname LIKE 'A%' OR Sname LIKE 'a%';

/*2)Display all the Salesperson whose all orders worth is more than 
 Rs.2000*/
SELECT SalesPeople.Sname, Sum(Orders.Amt) AS TotalAmt FROM Orders 
LEFT JOIN SalesPeople ON Orders.Snum = SalesPeople.Snum
GROUP BY SalesPeople.Snum
HAVING TotalAmt>2000;
 
/*3)Count the number of Salesperson belonging to Newyork.*/

SELECT count(*) FROM SalesPeople WHERE City= 'Newyork';

/*4)Display the number of Salespeople belonging to London and belonging 
to Paris.*/

SELECT count(*) FROM SalesPeople WHERE City IN('London','Paris');

/*5)Display the number of orders taken by each Salesperson and their 
date of orders.*/

SELECT Orders.Snum, SalesPeople.Sname, Count(Orders.Snum) AS NumOfOrders, Orders.Odate 
FROM Orders , SalesPeople 
where Orders.Snum=SalesPeople.Snum 
GROUP BY SalesPeople.Snum, Orders.Odate;






