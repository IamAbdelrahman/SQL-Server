/* 1) Create Employee table with FirstName, LastName, SSN PK, BirthDate, City, Salary, 
	  superSSN FK, DepartmentNumber (Dno) FK.

   2) Create Department table with DepartmentName, DepartmentNumber PK, ManagerSSN FK, MGRStartDate.

   3) Create Projects table with ProjectName, ProjectNumber PK
*/

-- Create the Department table
CREATE TABLE Department
(
	D_Name varchar(10) NOT NULL,
	DNO INT PRIMARY KEY,
	MGRSSN INT
	FOREIGN KEY (MGRSSN) REFERENCES Employee (SSN) ON DELETE SET NULL ON UPDATE CASCADE,
	MGRStartDate varchar(10)
);

-- Create the Employee table
CREATE TABLE Employee
(
	Fname varchar(10),
	Lname varchar(10), 
	SSN INT PRIMARY KEY, 
	Bdate varchar(10),
	City varchar(10), 
	Salary float, 
	SuperSSN INT, 
	E_DNO INT 
	FOREIGN KEY (E_DNO) REFERENCES Department (DNO) ON DELETE SET NULL ON UPDATE CASCADE
);


-- Create the Projects table
CREATE TABLE Projects 
(
	PNO INT PRIMARY KEY, 
	P_Name varchar(50) NOT NULL
);


-- Create the WorkOn table as Many Employees may work on many projects.
CREATE TABLE WorkOn
(
	W_SSN INT
	FOREIGN KEY (W_SSN) REFERENCES Employee (SSN) ON DELETE CASCADE ON UPDATE CASCADE,
	W_PNO INT
	FOREIGN KEY (W_PNO) REFERENCES Projects (PNO) ON DELETE CASCADE ON UPDATE CASCADE
)