
--1)Create a database named CompanyDB.
create database CompanyDB

--2)Use the CompanyDB database and create the Employee table with all the columns mentioned above.
use CompanyDB
create table Employee(EmpID int, FirstName varchar(30),LastName varchar(30),Department varchar(30),Designation varchar(30),Salary money,City varchar(30),Gender char(1),DOJ date,Age int)

--3)Add a new column Email to the Employee table.
alter table Employee add Email varchar(50)

--4)Modify the Email column to increase its size.
alter table Employee alter column Email varchar(100)

--5)Rename the column City to Location.
exec sp_rename 'Employee.City','Location'

--6)Rename the table Employee to EmployeeDetails and then rename it back to Employee.
exec sp_rename 'Employee', 'EmployeeDetails'

exec sp_rename 'EmployeeDetails', 'Employee'

--7)Drop the Email column from the Employee table.
alter table employee drop column Email

--8).Write a query to check the structure (columns and data types) of the Employee table.
exec sp_help Employee

--9).Make EmplD column the Primary Key Of the Employee table.
alter table employee alter column EmpID int NOT NULL

alter table employee add constraint PK_emp primary key (EmpID)

--IO). Add a NOT NULL constraint on the FirstName column.
alter table employee alter column FirstName varchar(30) NOT NULL

--11). Add a UNIQUE constraint on the column to ensure no two employees have the same email (create a new column Email and apply the constraint).
alter table employee add Email varchar(50)

alter table employee add constraint Unik unique (Email)

--12). Add a DEFAULT constraint on the Department column so that if no value is provided, it should be set as 'General'.
alter table employee add constraint def Default 'General' for Department

--13). Add a CHECK constraint on the Salary column so that salary cannot be less than 10,000.
alter table employee add constraint check_salary check(Salary >= 10000)

--14). Add a CHECK constraint on the Age column so that age must be between 18 and 60.
alter table employee add constraint check_age check(Age between 18 and 60)

--15). Remove the CHECK constraint applied on the Salary column.
alter table employee drop constraint check_salary

--16). Add a FOREIGN KEY unrelated simple self-constraint task: add a Manager_EmpID column and apply a CHECK constraint so it cannot be equal to EmpID itself. 
alter table employee add Manager_EmpID int 

alter table employee add constraint ID_check check(Manager_EmpID != EmpID)

--17). Insert 15 records into the Employee table with different departments, cities, and salaries.
INSERT INTO Employee (EmpID, FirstName, LastName, Department, Designation, Salary, Location, Gender, DOJ, Age) VALUES
(1,  'Amit',    'Sharma',   'IT',      'Manager',   45000, 'Delhi',    'M', '2019-05-10', 32),
(2,  'Priya',   'Verma',    'HR',      'Executive', 22000, 'Mumbai',   'F', '2020-03-15', 27),
(3,  'Rahul',   'Gupta',    'Sales',   'Analyst',   18000, 'Pune',     'M', '2021-07-01', 25),
(4,  'Sneha',   'Iyer',     'Finance', 'Manager',   50000, 'Bangalore','F', '2018-11-20', 35),
(5,  'Arjun',   'Nair',     'IT',      'Executive', 28000, 'Chennai',  'M', '2020-01-05', 29),
(6,  'Anita',   'Desai',    'HR',      'Manager',   47000, 'Delhi',    'F', '2017-09-12', 38),
(7,  'Vikram',  'Singh',    'Sales',   'Manager',   46000, 'Mumbai',   'M', '2019-02-25', 34),
(8,  'Anjali',  'Rao',      'Finance', 'Analyst',   19000, 'Pune',     'F', '2021-04-18', 24),
(9,  'Karan',   'Mehta',    'IT',      'Analyst',   21000, 'Bangalore','M', '2020-08-09', 26),
(10, 'Aisha',   'Khan',     'HR',      'Executive', 23000, 'Delhi',    'F', '2019-12-01', 28),
(11, 'Rohan',   'Kapoor',   'Sales',   'Executive', 24000, 'Chennai',  'M', '2020-06-14', 30),
(12, 'Alia',    'Bhatt',    'Finance', 'Executive', 26000, 'Mumbai',   'F', '2021-01-22', 27),
(13, 'Suresh',  'Reddy',    'IT',      'Manager',   52000, 'Pune',     'M', '2016-10-03', 40),
(14, 'Anu',     'Menon',    'Sales',   'Analyst',   17000, 'Bangalore','F', '2021-09-11', 23),
(15, 'Aditya',  'Joshi',    'HR',      'Analyst',   20000, 'Delhi',    'M', '2020-05-30', 26)

--18). Insert a new employee record without specifying the Department Ito check the DEFAULT constraint).
INSERT INTO Employee (EmpID, FirstName, LastName, Designation, Salary, Location, Gender, DOJ, Age, Email, Manager_EmpID)
VALUES (16, 'Meera', 'Pillai', 'Analyst', 21000, 'Pune', 'F', '2022-02-14', 25, 'meera.pillai@company.com', 1);

--19). Update the salary of all employees working in the IT department by increasing it by 10%.
update employee set salary = salary*1.10 where Department = 'IT'

--20). Update the Designation of an employee whose EmplD is 5 to 'Senior Executive'.
update employee set Designation = 'Senior Executive' where EmpID = 5

--21). Delete the record of an employee whose EmplD is 10.
delete from employee where EmpID = 10

--22). Delete all employees whose Salary is less than 15.000.
delete from employee where Salary < 15000

--23). Update the City of all employees from 'Mumbai' to 'Pune'
update employee set Location = 'Pune' where Location = 'Mumbai'

--24). Insert a record and intentionally leave FirstName blank to check if the NOT NULl constraint blocks it.
INSERT INTO Employee (EmpID, LastName, Designation, Salary, Location, Gender, DOJ, Age, Email, Manager_EmpID)
VALUES (16, 'Pillai', 'Analyst', 21000, 'Pune', 'F', '2022-02-14', 25, 'meera.pillai@company.com', 1);

--25). Write a query to display all the records from the Employee table.
select * from employee

--26). Write a query to display FirstName, LastName, and Salary of all employees.
select FirstName, LastName, Salary from employee

--27). Write a query to display the details of employees working in the 'HR' department.
select * from employee where Department = 'HR'

--28). Write a query to display all distinct Department names from the table.
Select Department from employee group by Department

--29). Write a query to display the total number of employees in the table.
select count(*) as TotalEmployees from Employee

--30). Write a query to display FirstName and Salary and rename the Salary column as MonthlySalary using an alias.
select FirstName, Salary as MonthlySalary from Employee

--31). Write a query to display all employee details whose Gender is 'F'.
select * from Employee where Gender = 'F'

--32). Write a query to display the top 5 highest paid employees.
select top 5 * from employee order by Salary desc

--33). Display all employees whose Salary is greater than 30,000 (comparison operator).
select * from employee where salary > 30000

--34). Display all employees whose Department is 'IT' AND Salary is greater than 25,000 (logical operator).
select * from employee where Department = 'IT' and Salary > 25000

--35). Display all employees whose Department is 'HR' OR 'Finance'.
select * from employee where Department = 'HR' or Department =  'Finance'

--36). Display all employees whose Salary is BETWEEN 20,000 and 40,000.
select * from employee where Salary between 20000 and 40000

--37). Display all employees whose City IN ('Delhi', 'Mumbai', 'Pune').
select * from employee where Location in ('Delhi', 'Mumbai', 'Pune')

--38). Display all employees whose FirstName LIKE starts with 'A'.
select * from employee where FirstName like 'A%'

--39). Display all employees whose FirstName LIKE ends with 'a'.
select * from employee where FirstName like '%a'

--40). Display all employees whose Department is NOT 'Sales' (NOT operator).
select * from employee where Department != 'Sales'

--41). Display the total number of employees in each department.
select Department, count(*) as Total from employee group by Department

--42). Display the average salary of employees department-wise.
select Department, Avg(Salary) as AverageSalary from employee group by Department

--43). Display the maximum salary in each department.
select Department, Max(Salary) as MaximumSalary from employee group by Department

--44). Display the minimum salary city-wise.
Select Location, Min(Salary) as Maximumsalary from employee group by Location

--45). Display the total salary paid, grouped by Designation.
select Designation, Sum(Salary) as TotalPaid from employee group by Designation

--46). Display departments having more than 3 employees.
select Department, count(*) as EmpCount from employee group by Department having Count(*) > 3

--47). Display departments whose average salary is greater than 30,000.
select Department, Avg(Salary) as AvgSalary from employee group by Department having Avg(Salary) > 30000

--48). Display cities having a total employee count greater than 2.
select location, count(*) as TotalEmp from Employee group by location having count(*) > 2

--49). Display all employee records sorted by Salary in descending order.
select * from Employee order by Salary desc

--50). Display all employee records sorted by Department (ascending) and then by Salary (descending).
select * from Employee order by Department, Salary desc

