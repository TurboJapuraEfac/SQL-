-- Intermediate SQL (JOINS)

Insert into test.dbo.employeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly','Flax', NULL, 'Male'),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

Insert into test.dbo.employeeSalary VALUES
(1010, NULL, 47000),
(NULL, 'Salesman', 43000)


SELECT * 
FROM test.dbo.employeeSalary;

SELECT * 
FROM test.dbo.employeeDemographics;

SELECT * 
FROM test.dbo.employeeDemographics
Inner Join test.dbo.employeeSalary
ON employeeDemographics.EmployeeID = employeeSalary.EmployeeID;

SELECT * 
FROM test.dbo.employeeDemographics
Full outer join test.dbo.employeeSalary
ON employeeDemographics.EmployeeID = employeeSalary.EmployeeID;

SELECT * 
FROM test.dbo.employeeDemographics
Left outer join test.dbo.employeeSalary
ON employeeDemographics.EmployeeID = employeeSalary.EmployeeID;

SELECT * 
FROM test.dbo.employeeDemographics
Right outer join test.dbo.employeeSalary
ON employeeDemographics.EmployeeID = employeeSalary.EmployeeID;

SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle,Salary
FROM test.dbo.employeeDemographics
Inner join test.dbo.employeeSalary
ON employeeDemographics.EmployeeID = employeeSalary.EmployeeID;

SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle,Salary
FROM test.dbo.employeeDemographics
Right outer join test.dbo.employeeSalary
ON employeeDemographics.EmployeeID = employeeSalary.EmployeeID;

SELECT employeeSalary.EmployeeID, FirstName, LastName, JobTitle,Salary
FROM test.dbo.employeeDemographics
Right outer join test.dbo.employeeSalary
ON employeeDemographics.EmployeeID = employeeSalary.EmployeeID;


/*  Get highest paid employee except Michael */

SELECT employeeDemographics.EmployeeID, FirstName, LastName,Salary
from test.dbo.employeeDemographics
INNER JOIN test.dbo.employeeSalary
ON employeeDemographics.EmployeeID = employeeSalary.EmployeeID
Where FirstName <> 'Michael'
ORDER By Salary DESC;


/* Kevin who is an accountant thinks he mmade a mistake when looking at the average salary  for sales person. So find it */

SELECT JobTitle, AVG(Salary)
from test.dbo.employeeDemographics
INNER JOIN test.dbo.employeeSalary
ON employeeDemographics.EmployeeID = employeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
Group By JobTitle;


