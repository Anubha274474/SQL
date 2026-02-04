-- SubQueries Assignment
-- Employee Database:
create database Employee
use Employee;

create table Employee_Dataset(
emp_id int primary key,
Namee varchar(50),
department_id varchar(50),
salary decimal(10,2)
);
insert into Employee_Dataset(emp_id,Namee,department_id,salary)
values
(101,'Abhishek','D01',62000),
(102,'Shubham','D01',58000),
(103,'Priya','D02',67000),
(104,'Rohit','D02',64000),
(105,'Neha','D03',72000),
(106,'Aman','D03',50000),
(107,'Ravi','D04',60000),
(108,'Sneha','D04',75000),
(109,'Kiran','D05',70000),
(110,'Tanuja','D05',65000);
select * from Employee_Dataset;

create table Department_Dataseet(
department_id varchar(50),
department_name varchar(50),
location varchar(255)
);
insert into Department_Dataseet(department_id,department_name,location)
values
('D01','Sales','Mumbai'),
('D02','Marketing','Delhi'),
('D03','Finance','Pune'),
('D04','HR','Bengluru'),
('D05','IT','Hyderabad');
select * from Department_Dataseet;


create table Sales_Dataset(
sale_id int primary key,
emp_id int,
sale_amount decimal(10,2),
sale_date date
);
insert into Sales_Dataset(sale_id,emp_id,sale_amount,sale_date)
values
(201,101,4500,'2025-01-05'),
(202,102,7800,'2025-01-10'),
(203,103,6700,'2025-01-14'),
(204,104,12000,'2025-02-20'),
(205,105,9800,'2025-02-02'),
(206,106,10500,'2025-02-05'),
(207,107,3200,'2025-02-09'),
(208,108,5100,'2025-02-15'),
(209,109,3900,'2025-02-20'),
(210,110,7200,'2025-03-01');
select * from Sales_Dataset;

-- 15 daily practice question( dpp)on subqueries
-- basic level

-- question 1 retrieve the name of employees who earn more than the average salary of all employees.

-- solution

select Namee
from Employee_Dataset
where salary>(select avg(salary)from Employee_Dataset);

-- question 2 Find the employees who belong to the department with the average salary of all employees.
-- solution
select Namee,department_id
from Employee_dataset E
where department_id=(select department_id from Employee_dataset
group by E.Department_id
order by avg(salary) desc
limit 1);


-- 3 list all employees who have made at least one sale
-- solution
select Namee
from Employee_dataset e
join Sales_Dataset  s
on e.emp_id=s.emp_id;

-- question 4 Find the employees with the highest sale amount
-- solution
select e.Namee, max(s.sale_amount)as max_sale
from Employee_Dataset e
join Sales_Dataset s
on e.emp_id=s.emp_id
where s.sale_amount=(select max(sale_amount)from Sales_Dataset)
group by e.Namee;

-- 5 retrieve the names of emplloyees whose salaries are higher than shubham's salary
-- solution
select Namee,salary
from Employee_Dataset
where salary>(select salary from Employee_Dataset where namee='Shubham');

-- INTERMEDIATE LEVEL

-- QUESTION 1 fIND THE EMPLOYEES WHO WORK IN THE SAME DEPARTMENT AS ABHISHEK
-- SOLUTION

SELECT Namee,department_id
from Employee_Dataset e
where department_id=(select department_id from employee_dataset where namee='Abhishek');

-- question 2 list departments that have at least one employee earning more than 60000

-- solution
select  distinct department_id,Namee,salary
from Employee_Dataset
where salary>60000;

-- question 3 find department name of the employee who made the highest sale
-- solution 
select e.department_id
from employee_dataset e
join sales_dataset s
on e.emp_id=s.emp_id
where s.sale_amount=(select  max(sale_amount) as max_amount from sales_dataset);

-- question 4 retrieve employee who have made sales greater than the average sale amount
select e.namee
from employee_dataset e
join sales_dataset s
on e.emp_id=s.emp_id
where s.sale_amount>(select avg(sale_amount) as grater_avg from sales_dataset);

-- question 5 find the total sales made by employee who earn more than the average salary
-- solution
select sum(s.sale_amount) as tot_sale
from sales_dataset s
join employee_dataset e
on e.emp_id=s.emp_id
where e.salary>(select avg(salary) as avg_salary from employee_dataset);

-- ADVANCE LEVEL
-- QUESTION 1 FIND EMPLOYEES WHO HAVE NOT MADE ANY SALES
SELECT e.namee
from employee_dataset e
left join sales_dataset s
on e.emp_id=s.emp_id
where s.sale_id is null;

-- question 2 list department where tha average salary is above 55000
select department_id
from employee_dataset
group by department_id
having avg(salary)>55000;

-- question 3 retrieve department names where the total sales exceeds 10000
select e.department_id
from employee_dataset e
join sales_dataset s
on e.emp_id=s.emp_id
group by e.department_id
having sum(s.sale_amount)>10000;

-- question 4 find the employee who has made the second_highest sale
-- solution 
SELECT e.NAMEE,s.SALE_AMOUNT
from employee_dataset e
join sales_dataset s
on e.emp_id=s.emp_id
order by s.sale_amount desc
limit 1 offset 1;
-- question 5 retrieve the names of employees whose salary greater than the highest sale sale amount recorder
-- solution 
select namee,salary
from employee_dataset
where salary>(select max(sale_amount) from sales_dataset);


