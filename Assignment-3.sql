--1)Write a query to display each Department and the total number of employees working in that department from the Employee table.
select Department, count(*) from employee as TotalEmp group by Department

--2)Write a query to find the Department, the highest salary (MAX), and the average salary (AVG)  for each department. 
select Department, Max(Salary) as Highest, Avg(Salary) as AvgSal from employee group by Department 

--3)Write a query to count how many employees are in each Department.
select Department, count(*) from employee as TotalEmp group by Department

--4)Write a query to find the minimum salary in each Department.
select Department, Min(Salary) as MinSalary from employee group by Department

--5)Write a query to show departments that have more than 2 employees 
select Department, count(*) from employee as Emp group by Department having count(*) > 2

--6)Write a query to show departments where the total salary payout is greater than 100,000 
select Department, Sum(Salary) as TotalSalary from employee group by Department having Sum(Salary) > 100000

--7)Write a query to find departments where the average salary is above 60,000 
select Department, Avg(Salary) as AvgSal from employee group by Department having Avg(Salary) > 60000

--8)Write a query to show departments that have exactly 1 employee  
select Department, count(*) as Emp from employee group by Department having Count(*) = 1

--9)Write a query to list all employees sorted by Salary from highest to lowest 
select * from employee order by Salary desc

--10)Write a query to list all employees sorted by Ename in alphabetical order 
select * from employee order by Name asc

--11)Write a query to list all employees sorted by Department alphabetically, and then by Ename alphabetically.
select * from employee order by Department asc, Name asc

select * from employee