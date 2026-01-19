--Q1-Note: Create the following dummy table in MySQL Workbench using create function-
--Sample  table
create table employeees(
EmpID int primary key,
EmpName varchar(50)not null,
Department varchar(50),
City varchar(50),
salary  decimal(10,2),
Hire_date date
);



insert into employeees(EmpID,EmpName,Department,City,salary,Hire_date)
values
(101,'Rahul Mehta','Sales','Delhi',55000,'2020-04-12'),
(102,'Priya Sharma','HR','Mumbai',62000,'2019-04-12'),
(103,'Aman Singh','IT','Bengluru',72000,'2021-03-10'),
(104,'Neha Patel','Sales','Delhi',48000,'2022-01-14'),
(105,'Karan Joshi','Marketing','Mumbai',45000,'2018-07-22'),
(106,'Divya Nair','IT','Bengluru',81000,'2019-12-11'),
(107,'Raj Kumar','HR','Delhi',60000,'2020-05-28'),
(108,'Simran Kaur','Finanace','Mumbai',58000,'2021-08-03'),
(109,'Arjun Reddy','IT','Hyderabad',70000,'2022-02-18'),
(110,'Anjali Das','Sales','Kolkata',51000,'2023-01-15');

--Question 1: Show employees working in either the 'IT' or 'HR' departments.
--Answer
select * from employeees
where Department='IT' or department='HR'

--Question2- Retreive employees whose  department is in sales,IT or finance
--Answer
select * from employeees
where Department in('Sales','IT','HR');

--QUESTION3: Display employees whose salary is between 50000 INR and INR 70000

--ANSWER
select * from employees
where salary between 50000 and  70000

--QUESTION 4--List employees whose names start with the letter 'A'.

--ANSWER

SELECT * FROM employeees
where Empname like 'A%'
order by EmpName asc;


--QUESTION 5- Find the employees whose names contain the substring'an'.

--ANSWER

SELECT * from employeees
where EmpName like '%an%'

--QUESTION 6- Show employees who are from Delhi or Mumbai and earn more than INR 55000

--ANSWER--

SELECT * FROM employeees
where(City='Delhi'or City='Mumbai')
and salary>55000;

--Question 7-Display all employees except those from the 'HR' department.

--ANSWER

SELECT * FROM employeees
where  Department!='HR';

--Question 8-Get all employees hired between 2019 and 2022 ordered by HireDate(oldest first)

--ANSWER-

SELECT * FROM employeees
order by Hire_date asc;





