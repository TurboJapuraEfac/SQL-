--Intermediate SQL (Unions, CASE, Having , Partition By )

use test;

-- Table 3 Query:
Create Table WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')

SELECT * 
FROM test.dbo.WareHouseEmployeeDemographics;

SELECT * 
FROM test.dbo.employeeDemographics
Full outer Join test.dbo.WareHouseEmployeeDemographics
ON employeeDemographics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID;

-- /* UNION*/
SELECT * 
FROM test.dbo.WareHouseEmployeeDemographics
Union
SELECT * 
FROM test.dbo.employeeDemographics;

/* UNION ALL*/
SELECT * 
FROM test.dbo.WareHouseEmployeeDemographics
Union all
SELECT * 
FROM test.dbo.employeeDemographics
order by EmployeeID;


/* UNION ALL*/
SELECT EmployeeID, FirstName, Age
FROM test.dbo.WareHouseEmployeeDemographics
Union
SELECT EmployeeID, JobTitle, Salary
FROM test.dbo.employeeSalary
order by EmployeeID;

/*CASE*/
SELECT EmployeeID, FirstName, Age,
CASE 
    WHEN Age  = 38 Then 'Stanley'
    WHEN Age > 30 THEN 'Old'
    WHEN Age between 27 and 30 THEN  'Young'
    ELSE 'Baby'
END AS AgeGroup
FROM test.dbo.employeeDemographics
WHERE Age is not NULL
order by Age;

/*CASE*/
SELECT FirstName, LastName, JobTitle, Salary,
CASE 
    WHEN jobTitle = 'Salesman'
    THEN Salary * 1.1
    WHEN jobTitle = 'Accountant'
    THEN Salary * 1.05
    WHEN jobTitle = 'HR'
    THEN Salary * 1.000001
    ELSE Salary * 1.03
END AS NewSalary
FROM test.dbo.employeeDemographics
JOIN test.dbo.employeeSalary
ON employeeDemographics.EmployeeID = employeeSalary.EmployeeID

/* Having Clause*/
SELECT JobTitle, COUNT(JobTitle) AS TotalEmployees
from test.dbo.employeeDemographics
Join test.dbo.employeeSalary 
On employeeDemographics.EmployeeID = employeeSalary.EmployeeID
Group by JobTitle


SELECT JobTitle, COUNT(JobTitle) AS TotalEmployees
from test.dbo.employeeDemographics
Join test.dbo.employeeSalary 
On employeeDemographics.EmployeeID = employeeSalary.EmployeeID
-- where COUNT(JobTitle) > 1 (This is wrong) 
-- /*Having Clause*/
Group by JobTitle
Having COUNT(JobTitle) > 1;


SELECT JobTitle, AVG(Salary) AS AverageSalary
from test.dbo.employeeDemographics
Join test.dbo.employeeSalary 
On employeeDemographics.EmployeeID = employeeSalary.EmployeeID
-- -- where COUNT(JobTitle) > 1 (This is wrong) 
-- /*Having Clause*/
Group by JobTitle
Having AVG(Salary) > 45000 
Order by AVG(Salary)


/* Update and Delete*/

SELECT * 
from test.dbo.employeeDemographics;

Update test.dbo.employeeDemographics
SET Age = 31, Gender = 'Female'
WHERE EmployeeID = 1013;

SELECT * 
from test.dbo.employeeDemographics;

DELETE FROM test.dbo.employeeDemographics
WHERE EmployeeID = 1005;

SELECT * 
from test.dbo.employeeDemographics


/* ALIASING*/

SELECT FirstName + ' ' + LastName AS FullName
from test.dbo.employeeDemographics;

SELECT AVG(age) as AverageAge
from test.dbo.employeeDemographics;

SELECT Demo.EmployeeID, Sal.Salary
FROM test.dbo.employeeDemographics AS demo
JOIN test.dbo.employeeSalary AS sal
ON demo.EmployeeID = sal.EmployeeID;

/*PARTITION BY*/

SELECT * 
FROM test.dbo.employeeDemographics

SELECT *
FROM test.dbo.employeeSalary

SELECT *
FROM test.dbo.EmployeeDemographics as demo 
JOIN test.dbo.employeeSalary as  sal
ON demo.EmployeeID = sal.EmployeeID;

SELECT FirstName, LastName, Gender, Salary, 
COUNT(Gender) OVER (PARTITION BY Gender) as Totalgender
FROM test.dbo.EmployeeDemographics demo 
JOIN test.dbo.employeeSalary sal
ON demo.EmployeeID = sal.EmployeeID;

SELECT FirstName, LastName, Gender, Salary,  COUNT(Gender) 
FROM test.dbo.EmployeeDemographics demo 
JOIN test.dbo.employeeSalary sal
ON demo.EmployeeID = sal.EmployeeID
Group by  FirstName, LastName, Gender, Salary;
/* Group by doesnot work */