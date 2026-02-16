-- advance SQL assigne=ment
-- question 1 - What  is a Common Table Expression (CTE),and how does it improve SQL query readability?
-- Answer- A Common Table Expression (CTE) is a temporary neamed result set defined within a WITH clause.It 
-- improves SQl queries into simpler,modular blocks that can be referenced like a table

-- Question 2- Why are some views updatable while others are read-only?Explain with an example

-- answer- Some views are updatable if they are simple (based on a single table,no aggregates,no distinct,etc) and meet DBMS-
-- specific criteria others are read only because they involve joins, aggregations,or calculations that cannot be 
--  mapped back to base tables.
-- EXAMPLE- A view vw_SimpleProducts on a single table is updatable,but a view that joins Products
-- and Sales with a SUM aggregation is read-only.

-- QUESTION 3- What is the purpose of triggers in a database? Mention one use case where a trigger is essential.
-- Answer- Stored procedures offer advantages over raw SQL
-- 1- REUSABILITY- encapsulate logic for repeated use
-- 2- PERFORMANCE- pre-complied execution plans
-- 3- SECURITY- control access via permission
-- 4- MODULARITY- simplify complex operations and reduce network traffic by sending a single call

-- QUESTION 4- What is the purpose of triggers in a databae?Mention one use case where a trigger is essential
-- ANSWER- A trigger is a database object that automatically executes sql code in response to INSERT,UPDATE OR DELETE
-- events on a table 
-- USE CASE- An AFTER INSERT trigger on an Orders table can automatocally update inventory quantities in a Stock table to maintain consistency

-- QUESTION 5- Explain the need for data modelling and normalization when designing a database
-- ANSWER- Data modelling defines the structures,relationships and constraints of a database to ensure data integrity
-- and efficient access
-- Normalization organizes tables to reduce  redundancy and anomalies,splitting data into
-- related tables with appropriate keys (1NF->BCNF)


-- DATASET (USE FOR Q6-Q9

CREATE DATABASE XYZZ;
USE XYZZ;
create table PRRODUCTS(
ProductID INT primary key,
ProductName varchar(100),
Category varchar(50),
Price decimal(10,2)
);
insert into PRRODUCTS values
(1,'keyboard','electronics',1200),
(2,'mouse','electronics',800),
(3,'chair','furniture',2500),
(4,'desk','furniture',5500);
select * from PRRODUCTS;


create table SALES(
salesID int primary key,
ProductID int,
Quantity int,
SaleDate date
);
insert into SALES VALUES
(1,1,4,'2024-01-05'),
(2,2,10,'2024-01-11'),
(4,4,1,'2024-01-11');
SELECT * FROM SALES;

-- QUESTION 6-Write a CTE to calculate the total revenue for each product
-- (revenues=price*quantity), and return only products where revenue>3000

-- ANSWER- 
 WITH PRODUCTREVENUE AS(
 SELECT P.ProductID,p.ProductName, sum(p.price*s.Quantity) as Revenue
 from PRRODUCTS p
 join Sales s ON p.ProductID,s.ProductID
 group by p.ProductID,p.ProductName
 )
 select * from ProductRevenue where Revenue >3000;
 
 -- Question 7-Cretae a view named vw_CategorySummary that shows:
 -- Category,TotalProducts,AveragePrice
 -- ANSWER- 
 
 CREATE VIEW vw_CategorySummary as
 select Category,
 Count(*) as totalProducts,
 avg(price) as averageprice
 from PRRODUCTS
 Group by Category;

-- question 8- Updatable view and price update
-- answer- create VIEW vw_ProductDetails AS
create VIEW vw_ProductDetails as
select ProductID,ProductName ,Price
from Products;

update vw_ProductDetails
set price=1300
where ProductID=1;


-- Question 9- CREATE A STORED PROCEDURE THAT ACCEPTS A CATEGORY NAME AND RETURNS ALL PRODUCTS BELONGING TO THAT CATEGORY
-- Answer- 
create Procedure getProductsbyCategory(@Category varchar(50))
as
begin
select * from products
where category = @Category;
end;

-- QUESTION 10- Create an after delete trigger on the products table that archives deleted product rows into a new table 
-- product ProductArchive. The archive should store ProductID,ProductName,Category,Price and deletedAT
-- timestamp
-- ANSWER

CREATE TABLE ProductArchieve(
ProductID int,
ProductName varchar(50),
Category varchar(50),
price decimal(10,2)
DeletedAt datetime
);









