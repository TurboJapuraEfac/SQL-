-- SQL BASICS

create database test;

use test;

Create Table EmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)


CREATE Table employeeSalary
(
    EmployeeID INT,
    JobTitle VARCHAR(50),
    Salary INT
)

Insert into EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')


SELECT * from EmployeeDemographics;


Insert Into employeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

SELECT * 
FROM employeeDemographics;

SELECT FirstName
FROM employeeDemographics;

SELECT LastName
FROM employeeDemographics;

SELECT FirstName, Age 
FROM employeeDemographics;

SELECT TOP 5 * 
FROM employeeDemographics;

SELECT DISTINCT(Gender) from
employeeDemographics;

SELECT COUNT(Gender) FROM
employeeDemographics;

SELECT COUNT(Gender) as GenderCount
FROM 
employeeDemographics;

SELECT * 
FROM employeeSalary;

SELECT Max(Salary) as Max
from employeeSalary;

SELECT Min(Salary) as Min 
from employeeSalary;

SELECT AVG(Salary) as AVG
from employeeSalary;

SELECT * 
FROM test.dbo.employeeSalary;

SELECT * from 
employeeDemographics
WHERE FirstName = 'Jim';

SELECT * from 
employeeDemographics
WHERE FirstName <> 'Jim';

SELECT *
from employeeDemographics
WHERE Age > 30;

SELECT *
from employeeDemographics
WHERE Age >= 30;

SELECT *
from employeeDemographics
WHERE Age < 30;

SELECT * 
from employeeDemographics
WHERE Age <=32 AND Gender = 'Male';

SELECT * 
from employeeDemographics
WHERE Age <=32 OR Gender = 'Male';

SELECT * 
From employeeDemographics
Where LastName LIKE 's%';

SELECT * 
From employeeDemographics
Where LastName LIKE '%s%';

SELECT * 
From employeeDemographics
Where LastName LIKE 's%o%';

SELECT * 
FROM employeeDemographics
WHERE FirstName is NULL;

SELECT *
FROM employeeDemographics
WHERE FirstName is NOT NULL;

SELECT * 
FROM employeeDemographics
WHERE FirstName IN ('Jim', 'Pam');


SELECT distinct(Gender)
from EmployeeDemographics;


SELECT Gender,Count(Gender)
from EmployeeDemographics
group by Gender;

SELECT Gender, Age, Count(Gender)
from EmployeeDemographics
group by Gender, Age

SELECT Gender,COUNT(Gender) as CountGender
from EmployeeDemographics
where Age > 30
GROUP By Gender 
Order By CountGender ASC;

SELECT Gender,COUNT(Gender) as CountGender
from EmployeeDemographics
where Age > 30
GROUP By Gender 
Order By CountGender DESC;

SELECT * 
from EmployeeDemographics
Order by Age  ASC;

 SELECT * 
from EmployeeDemographics
Order by Age  DESC;

SELECT * 
from EmployeeDemographics
Order by Age, Gender ; 

SELECT *
from EmployeeDemographics
Order by Age Desc, Gender ASC;

Select *
from EmployeeDemographics
Order by 1,2,3,4,5 ;

Select *
from EmployeeDemographics
Order by 4 Desc, 5 Desc;






