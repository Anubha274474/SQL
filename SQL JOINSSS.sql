--Note - Create the folllowing dummy table in MySql Workbench using create funtion--
create database Company_dbb
use Company_dbb
-TABLE 1- Customers
create table Customers(
CustomersID int primary key,
CustomerName varchar(50),
City varchar(50)
);
insert into Customers (CustomersID,CustomerName,City)
values
(1,'John Smith','New York'),
(2,'Mary Johnson','Chicago'),
(3,'Peter Adams','Los Angeles'),
(4,'Nancy Miller','Houston'),
(5,'Robert White','Miami');

--TABLE 2-Orders-

create table Orders(
OrderId int primary key,
CustomersID int,
OrderDATE DATE,
Amount decimal(10,2)
);

insert into Orders(OrderId,CustomersID,OrderDate,Amount)
values
(101,1,'2024-10-01',250),
(102,2,'2024-10-05',300),
(103,1,'2024-10-07',150),
(104,3,'2024-10-12',450),
(105,6,'2024-10-12',400);

--TABLE 3-Payments

create table Payments(
PaymentID varchar (10)primary key,
CustomerID int,
PaymentDate date,
Amount decimal (10,2)
);
INSERT INTO Payments(PaymentID,CustomerId,PaymentDate,Amount)
values
('POO1',1,'2024-10-02',250),
('POO2',2,'2024-10-11',300),
('POO3',3,'2024-10-11',450),
('POO4',4,'2024-10-15',200);


--table 4- Employeeees

create table Employeeees(
EmployeeID int primary key,
EmployeeName varchar(50),
ManagerID int
);

insert into Employeeees(EmployeeID,EmployeeName,ManagerID)
VALUES
(1,'Alex Green',Null),
(2,'Brian Lee',1),
(3,'Carol Ray',1),
(4,'David Kim',2),
(5,'Eva Smith',2);

--Qustion 1--Retreive all customers who have placed at least one order.

Answer-
select c.CustomerName,o.OrderID,o.Amount
from Customers c
inner join Orders o
on c.CustomersID = o.CustomersID;


--Question 2-Retrieve all customers and their orders,including customers who have not placed any orders.
--ANSWER--
Select  c.CustomerName, o.OrderID, o.Amount
from customers c
left join Orders o
on c.CustomersID= o.CustomersID;

--QUESTION 3-- Retrieve all orders and their corresponding customers,including orders placed by unknown customers.

--Answer--

select c.CustomerName, o.OrderID,o.Amount
from Customers c
right join Orders o
on c.CustomersID = o.CustomersID;

--Question 4-- Display all customers and orders ,whether matched or not.

--Answer--

select c.CustomerName, o.OrderID
from Customers c
left join Orders o
On c.CustomersID = o.CustomersID
union
select c.CustomerName, o.OrderID
from Customers c
right join Orders o
on c.CustomersID = o.CustomersID;


--QUESTION 5- Find customers who have  not placed any orders.
--Answer--

select c.CustomerName
from Customers c
left join Orders o
on c.CustomersID=o.CustomersID
where o.orderID is null;


--Question 6-- Retrieve customers who made payments but did not place any orders.
--Answer--

select distinct c.CustomersID, c.CustomerName
from Customers c
inner join Payments p
on c.CustomersID = c.CustomersID
 left join Orders o
on c.CustomersID = c.CustomersID
where o.OrderID is null;


--QUESTION 7-- Generate a list of all possible combinations between customers and Orders.(Hint : Use Cross Join)

--Answer--
select c.CustomerName,o.OrderID
from Customers c
cross join Orders o;


--Question 8--Show all customers along with order and payment amounts in one table.

--Answer--

select c.CustomerName , o.Amount as OrderAmount, p.Amount as PaymentAmount
from Customers c
left join Orders o ON c.CustomersID= o.CustomersID
left join Payments p on c.CustomersID= c.CustomersID;

--Question 9--Retrieve all customers who have both placed and made payments.
--Answer--

select distinct c.CustomerName
from Customers c
inner join Orders o on c.CustomersID = o.CustomersID
inner join Payments p on c.CustomersID = c.CustomersID;






