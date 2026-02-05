-- SQL FUNCTIONS ASSIGNMENT
create database XX;
use XX
create table Student_Performance (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    course VARCHAR(50),
    score INT,
    attendance INT,
    mentor VARCHAR(50),
    join_date DATE,
    city VARCHAR(50)
);

INSERT INTO Student_Performance (student_id, name, course, score, attendance, mentor, join_date, city)
VALUES
(101, 'Aarav Mehta', 'Data Science', 88, 92, 'Dr. Sharma', '2023-06-12', 'Mumbai'),
(102, 'Riya Singh', 'Data Science', 76, 85, 'Dr. Sharma', '2023-07-01', 'Delhi'),
(103, 'Kabir Khanna', 'Python', 91, 96, 'Ms. Nair', '2023-06-20', 'Mumbai'),
(104, 'Tanvi Patel', 'SQL', 84, 89, 'Mr. Iyer', '2023-05-30', 'Bengaluru'),
(105, 'Ayesha Khan', 'Python', 67, 81, 'Ms. Nair', '2023-07-10', 'Hyderabad'),
(106, 'Dev Sharma', 'SQL', 73, 78, 'Mr. Iyer', '2023-05-28', 'Pune'),
(107, 'Arjun Verma', 'Tableau', 95, 98, 'Ms. Kapoor', '2023-06-18', 'Delhi'),
(108, 'Meera Pillai', 'Tableau', 82, 87, 'Ms. Kapoor', '2023-06-18', 'Kochi'),
(109, 'Nikhil Rao', 'Data Science', 79, 82, 'Dr. Sharma', '2023-07-05', 'Chennai'),
(110, 'Priya Desai', 'SQL', 92, 94, 'Mr. Iyer', '2023-05-27', 'Bengaluru'),
(111, 'Siddharth Jain', 'Python', 90, 95, 'Ms. Nair', '2023-07-02', 'Mumbai'),
(112, 'Sneha Kulkarni', 'Tableau', 74, 83, 'Ms. Kapoor', '2023-06-18', 'Pune'),
(113, 'Rohan Gupta', 'SQL', 89, 91, 'Mr. Iyer', '2023-05-25', 'Delhi'),
(114, 'Ishita Joshi', 'Data Science', 93, 97, 'Dr. Sharma', '2023-06-25', 'Bengaluru'),
(115, 'Yuvraj Rao', 'Python', 71, 84, 'Ms. Nair', '2023-07-12', 'Hyderabad');

select * from student_performance;

-- question 1 create a ranking of student based on score(highest score first)
-- solution
select*,rank()over(order by score desc)as  rankk
from student_performance;

-- question 2 show each students score and the previous students score(based on score order)
-- solution
select name,score,lag(score)over (order by score desc)as prev_score
from student_performance;

-- question 3 convert all student name to uppercase and extract the month name from join_date
-- solution
select upper(name) as student_name,
datename(month,join_date) as join_date
from student_performance;

-- question 4 show each students name and the next student's attendence(order by attendence)
-- solution

select name,attendance,
lead(attendance)over(order by attendance)as next_stuatten
from student_performance;

-- question 5 assign students into 4 performance groups using NTILE()
-- SOLUTION


-- question 6 for each course,assign a row number based on attendence(highest first)
-- solution
select*,row_number()over (partition by course order by attendance desc)as row_numb
from student_performance;

-- question 7 calculate the number of days each student has been enrolled (from join_date to '2025-01-01')
-- solution
select name,
datediff(day,join_date,'2025-01-01')as days_enrolled
from student_performance;

-- question 8 formate join_date as month year(eg june 2023)
-- solution 
select name,
format(join_date,'MMMM yyyy')as formatted_date
from student_performance;

-- question 9 replace the city 'Mumbai' with'MUM' for display purposes
-- solution
select name, replace(city,'Mumbai','MUM') AS update_ciname
FROM student_performance;

-- question 10 for each course find the highest score using frist_value()
-- solution
select distinct course,
first_value(score)over(partition by course)as highest_score
from student_performance;
