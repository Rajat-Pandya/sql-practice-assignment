-- creating a table and content
create database july2026

use july2026

create table students(S_ID int, S_NAME varchar(30), S_AGE int, S_STIPEND money)

insert into students values(101,'Ankit',22,7000),
							(102,'Hussain',21,8000),
							(103,'Meet',20,9000),
							(104,'Rajat',22,7000)

select * from students

--1)Execute a literal select statement that returns your name. 
select S_NAME from students where S_ID = 104

--2) Write the literal select statement that evaluates the product of 7 and 4.
select 7 * 4 as multiplication

--3)Write the literal select statement that takes the difference of 7 and 4 then multiplies that difference by 8. 
select 8 * (select 7 - 4 as substraction) as multiplication

--4) Write a literal select statement that returns the phrase “Brewster’s SQL Training Class”. (Hint: note the single apostrophe in the string).
select 'Brewster’s SQL Training Class' as text

--5) Execute a literal SELECT statement that returns the phrase “Day 1 of Training” in one column and the result of 5*3 in another column.     
select 'Day 1 of Training' as text ,5 * 3 as multiplication


---Insert/Update/Delete

create table employee(E_ID int, E_NAME varchar(30), E_DEPARTMENT varchar(30), E_SALARY money)

--1)Insert a new employee record with all details provided directly.
insert into employee values(101,'Ajay','cloud',55000)

--2)Add multiple new team members to the HR department at once. 
insert into employee values(102,'Aman','HR',40000),
							(103,'Sujal','HR',42000),
							(104,'Jay','HR',41000)

--3)Register an employee who hasn't been assigned a salary yet. 
insert into employee values(105,'Harsh','AI',NUll)

--4)Update the salary to 85,000 for everyone working in the 'Cloud' department. 
update employee set E_SALARY = 85000 where E_DEPARTMENT = 'cloud'

--5)Change both the department and salary for a specific employee by name.
update employee set E_SALARY = 60000 ,E_DEPARTMENT = 'AI' where E_NAME = 'Ajay'

--6)Give a flat 10% appraisal boost to employee working in AI department.
update employee set E_SALARY = E_SALARY * 1.10 where E_DEPARTMENT = 'AI'

--7)Assign an initial entry-level salary of 30,000 to anyone whose salary column is completely blank (NULL). 
update employee set E_SALARY = 30000 where E_SALARY is NULL

--8)Remove a specific employee from the system using their unique ID.
delete from employee where E_ID = 101

--9)Remove all records belonging to a department that has been completely shut down. 
delete from employee where E_DEPARTMENT = 'cloud'

--10)Drop records of any employee earning less than 20,000 in the Finance division. 
delete from employee where E_DEPARTMENT = 'Finance' and E_SALARY < 20000


select * from employee