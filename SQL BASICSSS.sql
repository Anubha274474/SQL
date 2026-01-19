-- Create  a new Database and Table for employees
--task create a new database named company_dband create a table named employees with the following columns

create DATABASE company_db;
use company_db;

create Table employees(
employee_id INT primary key,
first_name varchar(50),
last_name varchar(50),
department varchar(50),
salary int,
Hire_date date
);
select * from employees

--Question2 Insert Data into employees table
--Task  insert the following sample records into the employees table

insert into employees
(employee_id,first_name,last_name,department,salary,Hire_date)
values
(101,'Amit','Sharma','HR',50000,'2020-01-15'),
(102,'Riya','Kapoor','Sales',75000,'2019-03-15'),
(103,'Raj','Mehta','IT',90000,'2018-02-10'),
(104,'Neha','Verma','IT',85000,'2021-09-01'),
(105,'Arjun','Singh','Finance',60000,'2022-02-10');
select * from employees

--Q.3- Display all employee records sorted by salary(lowest to hightest)

select * from employees
order by salary 
asc;

--Q.4- Show Employees sorted by department(A-Z)and salary(High-Low).

select * from employees
order by department asc,
salary desc;

--Q.5- List All employees in the IT Department,orderd by Hire_date(newest first)


select * from employees
where Department = 'IT'
order by Hire_date desc;


--Q6-Create and populate a sales table
--Task- Create a table sales to track sales data.
create table saless(
sales_id int,
customer_name varchar(50),
amount int,
sales_date date);

insert into saless
(sales_id,customer_name,amount,sales_date)
values
(1,'Aditi',1500,'2024-01-23'),
(2,'Rohan',2200,'2024-02-06'),
(3,'Aditi',3500,'2025-03-10'),
(4,'Meena',2700,'2025-04-12'),
(5,'Rohan',4500,'2025-07-23');
select * from saless

--Q7-Display all sales records sorted by amount (Highest-Lowest).

select * from saless
order by amount desc;

--Q8-Show All Sales made by customer"Aditi"
--Hint-Use where customer_name='Aditi'


--Q9-What is the  difference between a primary key and foreign key?
-- Answer-  Primary Key (PK)
-- Uniquely identifies each record in a table-
-- Must contain unique values and cannot be NULL.
--A table can have only one primary key.

--Foreign Key (FK):

-- Links a table to another table’s primary key.
- Can have duplicates and can be NULL.
- A table can have multiple foreign keys.

--In short: PK identifies records in this table; FK links to PK in another table .

--Q10- What are constraints in sql and why are they used?
--Answer-  Constraints in SQL:
- Rules applied to columns or tables to enforce data integrity and accuracy.
- Ensure data consistency and reliability.

Common Constraints:
1. PRIMARY KEY: Uniquely identifies each record.
2. FOREIGN KEY: Links to another table’s primary key.
3. UNIQUE: Ensures all values are unique.
4. NOT NULL: Ensures a column can’t be empty.
5. CHECK: Ensures values meet a condition.
6. DEFAULT: Sets a default value if none is provided.

Why Use Constraints?:
- Prevent invalid data entry.
- Maintain data consistency.
- Improve data reliability.







