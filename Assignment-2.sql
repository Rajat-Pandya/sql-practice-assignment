create table employee(EmployeeID int,Name varchar(255),Department varchar(30),Salary money,Bonus money,Experiance int,City varchar(30))

INSERT INTO employee VALUES
(1, 'Aarav Sharma',   'IT',    55000, 5000, 6, 'Mumbai'),
(2, 'Priya Verma',    'HR',    42000, 2000, 3, 'Delhi'),
(3, 'Amit Singh',     'IT',    62000, 6000, 8, 'Bangalore'),
(4, 'Sneha Rao',      'Finance', 48000, 3000, 4, 'Delhi'),
(5, 'Ananya Iyer',    'IT',    51000, 4500, 2, 'Mumbai'),
(6, 'Rohit Mehta',    'Sales', 39000, 1500, 1, 'Pune'),
(7, 'Arjun Kapoor',   'IT',    72000, 7000, 9, 'Bangalore'),
(8, 'Kavya Nair',     'HR',    45000, 2500, 5, 'Chennai'),
(9, 'Aditya Joshi',   'Finance', 58000, 3500, 7, 'Mumbai'),
(10,'Meera Pillai',   'Sales', 41000, 1800, 2, 'Delhi')

select * from employee

--1)Write a query to display all employees whose salary is greater than 50,000.
select * from employee where Salary > 50000

--2)Retrieve employees who work in the IT department and have more than 5 years of experience.
select * from employee where Department = 'IT' and Experiance > 5

--3)Write a query to display employees whose salary is between 45,000 and 60,000. 
select * from employee where Salary Between 45000 and 60000

--4)Display employees whose city is either Mumbai or Delhi. 
select * from employee where City in ('Mumbai', 'Delhi')

--5)Write a query to display employee name along with their annual income 
select Name,(Salary + Bonus) * 12 as AnnualIncome from employee

--6)Find employees whose name starts with the letter 'A'.
select * from employee where Name like 'A%'

--7)Find the highest salary among all employees.
select Max(Salary) as HighestSalary from employee

--8)Find the total bonus paid to employees in the IT department. 
select Sum(Bonus) as TotalBonus from employee where Department = 'IT'

--9)Display the minimum and maximum experience of employees.
select Min(Experiance) as MinExp, Max(Experiance) as MaxExp from employee

--10)Count the number of employees in each department. 
select Department, Count(*) as EmpCount from employee group by Department

--11) Find the total bonus paid to employees in the IT department.
select Sum(Bonus) as TotalBonus from employee where Department = 'IT'

--12)Write an SQL statement to add a new column named Email of type VARCHAR(100) to the Employees table. 
alter table employee add Email varchar(100)

--13)Write an SQL statement to modify the Salary column so that it becomes DECIMAL(10,2).
alter table employee alter column Salary decimal(10,2)

--14) Write an SQL statement to drop the Bonus column from the Employees table. 
alter table employee drop column Bonus


sp_help employee